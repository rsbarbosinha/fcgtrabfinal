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
#include <array>

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

// Function to calculate a point on a cubic Bézier curve
std::array<double, 3> cubicBezier(double t, const std::array<double, 3>& p0, 
                                  const std::array<double, 3>& p1, 
                                  const std::array<double, 3>& p2, 
                                  const std::array<double, 3>& p3) {
    double u = 1 - t;
    double tt = t * t;
    double uu = u * u;
    double uuu = uu * u;
    double ttt = tt * t;

    std::array<double, 3> point = {
        uuu * p0[0] + 3 * uu * t * p1[0] + 3 * u * tt * p2[0] + ttt * p3[0],
        uuu * p0[1] + 3 * uu * t * p1[1] + 3 * u * tt * p2[1] + ttt * p3[1],
        uuu * p0[2] + 3 * uu * t * p1[2] + 3 * u * tt * p2[2] + ttt * p3[2]
    };

    return point;
}

// Funcao para movimentação do projetil
void MovProjetil(unsigned long timeElapsed){
    if(projetilSpeed==0){
        g_ProjetilPositionX = g_TorsoPositionX - 0.45f;
        g_ProjetilPositionY = g_TorsoPositionY + 0.2f;
        g_ProjetilPositionZ = g_TorsoPositionZ + 0.8f;
    }
    else{
        unsigned long sElapsedInAir = timeElapsed - timeTrown;
        g_ProjetilPositionX = iniPos.x + (projetilSpeed * direction.x * sElapsedInAir * 0.001);
        g_ProjetilPositionY = iniPos.y + (projetilSpeed * direction.y * sElapsedInAir * 0.001) - (0.5 * 9.8 * sElapsedInAir * 0.001 * sElapsedInAir * 0.001);
        g_ProjetilPositionZ = iniPos.z + (projetilSpeed * direction.z * sElapsedInAir * 0.001);
        if (g_ProjetilPositionY < -3.0){
            projetilSpeed = 0;
        }
    }
}