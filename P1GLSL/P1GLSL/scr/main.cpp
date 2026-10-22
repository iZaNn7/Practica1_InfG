#include "BOX.h"
#include <IGL/IGlib.h>
#include <assimp/scene.h>
#include <assimp/Importer.hpp>      
#include <assimp/postprocess.h> 

#define GLM_FORCE_RADIANS
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <iostream>

#define M_PI 3.14159265

//Idenficadores de los objetos de la escena
int objId = -1;
int objId2 = -1;
int objId3 = -1;

//Declaración de CB
void resizeFunc(int width, int height);
void idleFunc();
void keyboardFunc(unsigned char key, int x, int y);
void mouseFunc(int button, int state, int x, int y);
void mouseMoveFunc(int x, int y);
void mousePassMoveFunc(int x, int y);
void mouseWheelFunc(int wheel, int dir, int x, int y);

const aiScene* sc;
bool DoTheImportThing(const std::string& pFile);

int main(int argc, char** argv)
{
	std::locale::global(std::locale("spanish"));// acentos ;)

	// Importar el modelo antes de inicializar la librería gráfica
	if (!DoTheImportThing("3D_assets/AlienAnimal.obj"))
	{
		return -1;
	}

	if (!IGlib::init("../shaders_P1/shader.v8.vert", "../shaders_P1/shader.v8.frag"))
		return -1;
	
	//Se ajusta la cámara			
	//Si no se da valor se cojen valores por defecto
	
	glm::mat4 view = glm::mat4(1.0);
	view[3].z = -6.0;

	glm::mat4 proj = glm::mat4(1.0);

	float f = 1.0 / tan(M_PI / 6.0);
	float far = 10.0;
	float near = 0.1;

	proj[0].x = f;
	proj[1].y = f;
	proj[2].z = (far + near) / (near - far);
	proj[2].w = -1.0;
	proj[3].z = (2.0 * far * near) / (near - far);
	proj[3].w = 0.0;

	IGlib::setProjMat(proj);
	IGlib::setViewMat(view);
	

	//Creamos el objeto que vamos a visualizar

	objId = IGlib::createObj(cubeNTriangleIndex, cubeNVertex, cubeTriangleIndex,
		cubeVertexPos, cubeVertexColor, cubeVertexNormal, cubeVertexTexCoord, cubeVertexTangent);

	glm::mat4 modelMat = glm::mat4(1.0f);
	IGlib::setModelMat(objId, modelMat);
	//Incluir texturas aquí.

	//CBs
	IGlib::setResizeCB(resizeFunc);
	IGlib::setIdleCB(idleFunc);
	IGlib::setKeyboardCB(keyboardFunc);
	IGlib::setMouseCB(mouseFunc);
	IGlib::setMouseMoveCB(mouseMoveFunc);
	IGlib::setMousePassiveMoveCB(mousePassMoveFunc);
	IGlib::setMouseWheelMoveCB(mouseWheelFunc);


	//Mainloop
	IGlib::mainLoop();
	IGlib::destroy();
	return 0;
}

void resizeFunc(int width, int height)
{
	//Ajusta el aspect ratio al tamaño de la venta
}

void idleFunc()
{
	static float angle = 0.0f;
	angle = (angle > M_PI * 2.0f) ? angle + 0.0001f : 0.0f;

	glm::mat4 modelMat = glm::translate(glm::mat4(1.0f), glm::vec3(0.0f, 0.0f, 0.0f));
	modelMat = glm::rotate(modelMat, angle, glm::vec3(1.0f, 0.0f, 0.0f));
	modelMat = glm::rotate(modelMat, angle, glm::vec3(0.0f, 1.0f, 0.0f));
	IGlib::setModelMat(objId, modelMat);
}

void keyboardFunc(unsigned char key, int x, int y)
{
	std::cout << "Se ha pulsado la tecla " << key << std::endl << std::endl;
}

void mouseFunc(int button, int state, int x, int y)
{

	if (state == 0)
		std::cout << "Se ha pulsado el botón ";
	else
		std::cout << "Se ha soltado el botón ";

	if (button == 0) std::cout << "de la izquierda del ratón " << std::endl;
	if (button == 1) std::cout << "central del ratón " << std::endl;
	if (button == 2) std::cout << "de la derecha del ratón " << std::endl;


	std::cout << "en la posición " << x << " " << y << std::endl << std::endl;
}


void mouseMoveFunc(int x, int y)
{

	//std::cout << "Movimiento con presión en la posición " << x << " " << y << std::endl << std::endl;
}

void mousePassMoveFunc(int x, int y)
{
	//std::cout << "Pasivo en la posición " << x << " " << y << std::endl << std::endl;
}
void mouseWheelFunc(int wheel, int dir, int x, int y)
{
	if (dir > 0)
		std::cout << "Se ha pulsado la rueda del ratón hacia arriba ";
	else
		std::cout << "Se ha pulsado la rueda del ratón hacia abajo ";

	std::cout << "en la posición " << x << " " << y << std::endl << std::endl;
}

bool DoTheImportThing(const std::string& pFile) {

	Assimp::Importer;importer;
	sc = importer.ReadFile(pFile,
		aiProcess_CalcTangentSpace |
		aiProcess_Triangulate |
		aiProcess_JoinIdenticalVertices |
		aiProcess_SortByPType);

	// Si falla import dime por qué
	if (!sc) {
		//std::cout << "Fallo la carga" << std::endl;
		return false;
	}

	std::cout << "Se ha cargado" << sc->mNumMeshes << " meshes" << std::endl;

	for (unsigned int n = 0; n < sc->mNumMeshes; ++n)
	{
		const aiMesh* mesh = sc->mMeshes[n];

		unsigned int* faceArray;
		faceArray = (unsigned int*)malloc(sizeof(unsigned int) * mesh->mNumFaces * 3);
		unsigned int faceIndex = 0;

		float* vertexArray;
		unsigned int vertexIndex = 0;
		float* normalArray;
		unsigned int normalIndex = 0;
		float* textCoordsArray;

		if (mesh->HasFaces()) {//por defecto siempre tiene, pero no está de más chequear
			for (unsigned int t = 0; t < mesh->mNumFaces; ++t) {
				const aiFace* face = &mesh->mFaces[t];
				memcpy(&faceArray[faceIndex], face->mIndices, 3 * sizeof(unsigned int));
				faceIndex += 3;
			}
		}

		if (mesh->HasPositions()) {
			vertexArray = (float*)malloc(sizeof(float) * mesh->mNumVertices * 3);

			for (unsigned int k = 0; k < mesh->mNumVertices; ++k) {
				const aiVector3D* vertex = &mesh->mVertices[k];
				memcpy(&vertexArray[vertexIndex], &float(vertex->x), sizeof(float));
				memcpy(&vertexArray[vertexIndex + 1], &float(vertex->y), sizeof(float));
				memcpy(&vertexArray[vertexIndex + 2], &float(vertex->z), sizeof(float));
				vertexIndex += 3;
			}
		}

		if (mesh->HasNormals()) {
			normalArray = (float*)malloc(sizeof(float) * mesh->mNumVertices * 3);
			for (unsigned int k = 0; k < mesh->mNumVertices; ++k) {
				const aiVector3D* a_normal = &mesh->mNormals[k];
				memcpy(&normalArray[normalIndex], &float(a_normal->x), sizeof(float));
				memcpy(&normalArray[normalIndex + 1], &float(a_normal->y), sizeof(float));
				memcpy(&normalArray[normalIndex + 2], &float(a_normal->z), sizeof(float));
				normalIndex += 3;
			}
		}

		if (mesh->mTextureCoords != NULL) {
			textCoordsArray = (float*)malloc(sizeof(float) * 2 * mesh->mNumVertices);
			for (unsigned int k = 0; k < mesh->mNumVertices; ++k) {
				const aiVector3D* a_texCoord = &mesh->mTextureCoords[0][k];
				memcpy(&textCoordsArray[k * 2], &float(a_texCoord->x), sizeof(float));
				memcpy(&textCoordsArray[k * 2 + 1], &float(a_texCoord->y), sizeof(float));
			}
		}

		objId3 = IGlib::createObj(mesh->mNumFaces, mesh->mNumVertices, faceArray, vertexArray, 0, normalArray, textCoordsArray, 0);
	}
}
