#include "BOX.h"
#include <IGL/IGlib.h>
#include <assimp/scene.h>
#include <assimp/Importer.hpp>
#include <assimp/postprocess.h>

#define GLM_FORCE_RADIANS
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <iostream>
#include <vector>
#include <string>
#include <cmath>

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

// Escala del modelo cargado (ajústala según el tamaño del .obj)
const float ALIEN_SCALE = 1.0f;

//Idenficadores de los objetos de la escena
int objId = -1;                  // cubo
std::vector<int> modelObjIds;    // mallas del modelo cargado con ASSIMP

//Declaración de CB
void resizeFunc(int width, int height);
void idleFunc();
void keyboardFunc(unsigned char key, int x, int y);
void mouseFunc(int button, int state, int x, int y);
void mouseMoveFunc(int x, int y);
void mousePassMoveFunc(int x, int y);
void mouseWheelFunc(int wheel, int dir, int x, int y);

bool DoTheImportThing(const std::string& pFile);

// Proyección simétrica de 60º que conserva el aspect ratio
glm::mat4 buildProj(float aspect)
{
	float fov = (float)(M_PI / 3.0);          // 60º
	float f = 1.0f / tan(fov / 2.0f);
	float far_ = 10.0f;
	float near_ = 0.1f;

	glm::mat4 proj(0.0f);
	proj[0].x = f / aspect;
	proj[1].y = f;
	proj[2].z = (far_ + near_) / (near_ - far_);
	proj[2].w = -1.0f;
	proj[3].z = (2.0f * far_ * near_) / (near_ - far_);
	return proj;
}

int main(int argc, char** argv)
{
	std::locale::global(std::locale("spanish"));// acentos ;)

	// 1) Primero se inicializa la librería gráfica (crea el contexto OpenGL)
	if (!IGlib::init("../shaders_P1/shader.v8.vert", "../shaders_P1/shader.v8.frag"))
		return -1;

	// 2) Cámara en (0,0,6) mirando hacia -Z
	glm::mat4 view = glm::mat4(1.0);
	view[3].z = -6.0;

	IGlib::setProjMat(buildProj(1.0f));
	IGlib::setViewMat(view);

	// 3) Cubo
	objId = IGlib::createObj(cubeNTriangleIndex, cubeNVertex, cubeTriangleIndex,
		cubeVertexPos, cubeVertexColor, cubeVertexNormal, cubeVertexTexCoord, cubeVertexTangent);
	IGlib::setModelMat(objId, glm::mat4(1.0f));

	// 4) Modelo con ASSIMP (ya hay contexto, así que createObj funciona)
	if (!DoTheImportThing("3D_assets/AlienAnimal.obj"))
	{
		std::cout << "No se ha podido cargar el modelo" << std::endl;
		return -1;
	}

	// Colocamos el modelo a un lado del cubo
	glm::mat4 alienMat = glm::translate(glm::mat4(1.0f), glm::vec3(2.5f, 0.0f, 0.0f));
	alienMat = glm::scale(alienMat, glm::vec3(ALIEN_SCALE));
	for (int id : modelObjIds)
		IGlib::setModelMat(id, alienMat);

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
	//Ajusta el aspect ratio al tamaño de la ventana
	if (height == 0) height = 1;
	IGlib::setProjMat(buildProj((float)width / (float)height));
}

void idleFunc()
{
	static float angle = 0.0f;
	angle += 0.01f;
	if (angle > (float)(M_PI * 2.0)) angle = 0.0f;

	glm::mat4 modelMat = glm::mat4(1.0f);
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
}

void mousePassMoveFunc(int x, int y)
{
}

void mouseWheelFunc(int wheel, int dir, int x, int y)
{
	if (dir > 0)
		std::cout << "Se ha pulsado la rueda del ratón hacia arriba ";
	else
		std::cout << "Se ha pulsado la rueda del ratón hacia abajo ";

	std::cout << "en la posición " << x << " " << y << std::endl << std::endl;
}

bool DoTheImportThing(const std::string& pFile)
{
	Assimp::Importer importer;
	const aiScene* sc = importer.ReadFile(pFile,
		aiProcess_CalcTangentSpace |
		aiProcess_Triangulate |
		aiProcess_JoinIdenticalVertices |
		aiProcess_GenSmoothNormals |
		aiProcess_SortByPType);

	if (!sc) {
		std::cout << "Falló la carga: " << importer.GetErrorString() << std::endl;
		return false;
	}

	std::cout << "Se han cargado " << sc->mNumMeshes << " meshes" << std::endl;

	for (unsigned int n = 0; n < sc->mNumMeshes; ++n)
	{
		const aiMesh* mesh = sc->mMeshes[n];

		// Solo nos interesan las mallas de triángulos
		if (!(mesh->mPrimitiveTypes & aiPrimitiveType_TRIANGLE) || !mesh->HasFaces())
			continue;

		// Caras (índices)
		unsigned int* faceArray = (unsigned int*)malloc(sizeof(unsigned int) * mesh->mNumFaces * 3);
		unsigned int faceIndex = 0;
		for (unsigned int t = 0; t < mesh->mNumFaces; ++t) {
			const aiFace& face = mesh->mFaces[t];
			faceArray[faceIndex++] = face.mIndices[0];
			faceArray[faceIndex++] = face.mIndices[1];
			faceArray[faceIndex++] = face.mIndices[2];
		}

		// Posiciones
		float* vertexArray = nullptr;
		if (mesh->HasPositions()) {
			vertexArray = (float*)malloc(sizeof(float) * mesh->mNumVertices * 3);
			for (unsigned int k = 0; k < mesh->mNumVertices; ++k) {
				vertexArray[k * 3] = mesh->mVertices[k].x;
				vertexArray[k * 3 + 1] = mesh->mVertices[k].y;
				vertexArray[k * 3 + 2] = mesh->mVertices[k].z;
			}
		}

		// Normales
		float* normalArray = nullptr;
		if (mesh->HasNormals()) {
			normalArray = (float*)malloc(sizeof(float) * mesh->mNumVertices * 3);
			for (unsigned int k = 0; k < mesh->mNumVertices; ++k) {
				normalArray[k * 3] = mesh->mNormals[k].x;
				normalArray[k * 3 + 1] = mesh->mNormals[k].y;
				normalArray[k * 3 + 2] = mesh->mNormals[k].z;
			}
		}

		// Coordenadas de textura (canal 0)
		float* textCoordsArray = nullptr;
		if (mesh->HasTextureCoords(0)) {
			textCoordsArray = (float*)malloc(sizeof(float) * 2 * mesh->mNumVertices);
			for (unsigned int k = 0; k < mesh->mNumVertices; ++k) {
				textCoordsArray[k * 2] = mesh->mTextureCoords[0][k].x;
				textCoordsArray[k * 2 + 1] = mesh->mTextureCoords[0][k].y;
			}
		}

		int id = IGlib::createObj(mesh->mNumFaces, mesh->mNumVertices, faceArray,
			vertexArray, nullptr, normalArray, textCoordsArray, nullptr);
		modelObjIds.push_back(id);
	}

	return true;
}