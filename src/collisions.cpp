// Arquivos "headers" padr�es de C podem ser inclu�dos em um
// programa C++, sendo necess�rio somente adicionar o caractere
// "c" antes de seu nome, e remover o sufixo ".h". Exemplo:
//    #include <stdio.h> // Em C
//  vira
//    #include <cstdio> // Em C++
//
#include <cmath>
#include <cstdio>
#include <cstdlib>

// Headers abaixo s�o espec�ficos de C++
#include <map>
#include <stack>
#include <string>
#include <vector>
#include <limits>
#include <fstream>
#include <sstream>
#include <stdexcept>
#include <algorithm>

// Constantes
#define M_PI   3.14159265358979323846
#define M_PI_2 1.57079632679489661923

// Function to check if a sphere and a box are colliding
bool isCollidingSB(float g_ProjetilPositionX, float g_ProjetilPositionY, float g_ProjetilPositionZ,
                   float projRadius,
                   float alvoPositionX, float alvoPositionY, float alvoPositionZ,
                   float alvoHalfX, float alvoHalfY, float alvoHalfZ) {
    // Calculate the closest point on the box to the sphere center
    float closestPointX = std::max(alvoPositionX - alvoHalfX,
                                   std::min(g_ProjetilPositionX,
                                            alvoPositionX + alvoHalfX));
    float closestPointY = std::max(alvoPositionY - alvoHalfY,
                                   std::min(g_ProjetilPositionY,
                                            alvoPositionY + alvoHalfY));
    float closestPointZ = std::max(alvoPositionZ - alvoHalfZ,
                                   std::min(g_ProjetilPositionZ,
                                            alvoPositionZ + alvoHalfZ));

    // Calculate the distance between the sphere center and the closest point
    float distanceSquared = ((closestPointX - g_ProjetilPositionX) * (closestPointX - g_ProjetilPositionX)) +
                            ((closestPointY - g_ProjetilPositionY) * (closestPointY - g_ProjetilPositionY)) +
                            ((closestPointZ - g_ProjetilPositionZ) * (closestPointZ - g_ProjetilPositionZ));

    // Check if the distance is less than or equal to the sphere's radius
    return distanceSquared <= (projRadius * projRadius);
}

// Function to check if a sphere and another sphere are colliding
bool isCollidingSS(float g_ProjetilPositionX, float g_ProjetilPositionY, float g_ProjetilPositionZ,
                   float projRadius,
                   float alvoBPositionX, float alvoBPositionY, float alvoBPositionZ,
                   float alvoBRadius) {

    // Calculate the distance between the sphere center and the closest point
    float distanceSquared = ((alvoBPositionX - g_ProjetilPositionX) * (alvoBPositionX - g_ProjetilPositionX)) +
                            ((alvoBPositionY - g_ProjetilPositionY) * (alvoBPositionY - g_ProjetilPositionY)) +
                            ((alvoBPositionZ - g_ProjetilPositionZ) * (alvoBPositionZ - g_ProjetilPositionZ));

    // Check if the distance is less than or equal to the sphere's radius
    return distanceSquared <= ((projRadius + alvoBRadius) * (projRadius + alvoBRadius));
}

// Function to check if a sphere and a plane are colliding
bool isCollidingSP(float g_ProjetilPositionX, float g_ProjetilPositionY, float g_ProjetilPositionZ,
                   float projRadius,
                   float planeNormalX, float planeNormalY, float planeNormalZ,
                   float planePointX, float planePointY, float planePointZ) {
    return ((g_ProjetilPositionX - (planePointX + projRadius* planeNormalX)) * planeNormalX
    + (g_ProjetilPositionY - (planePointY + projRadius* planeNormalY)) * planeNormalY
    + (g_ProjetilPositionZ - (planePointZ + projRadius* planeNormalZ)) * planeNormalZ) <= 0;
}
