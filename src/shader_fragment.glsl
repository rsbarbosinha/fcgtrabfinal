#version 330 core

// Atributos de fragmentos recebidos como entrada ("in") pelo Fragment Shader.
// Neste exemplo, este atributo foi gerado pelo rasterizador como a
// interpolação da posição global e a normal de cada vértice, definidas em
// "shader_vertex.glsl" e "main.cpp".
in vec4 position_world;
in vec4 normal;

// Posição do vértice atual no sistema de coordenadas local do modelo.
in vec4 position_model;

// Coordenadas de textura obtidas do arquivo OBJ (se existirem!)
in vec2 texcoords;

// Matrizes computadas no código C++ e enviadas para a GPU
uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

// Identificador que define qual objeto está sendo desenhado no momento
#define SPHERE  0
#define BUNNY   1
#define PLANE   2
#define CUBE    3
#define FENCE   4
#define DUCK    5
#define HEAD    6
#define BODY    7
#define LEG     8
#define UARM    9
#define FARM    10
#define WAVE    11
#define STAND   12
#define BALLOON 13
#define NUMB    14
#define CLOUDS  15
uniform int object_id;

// Parâmetros da axis-aligned bounding box (AABB) do modelo
uniform vec4 bbox_min;
uniform vec4 bbox_max;

// Variáveis para acesso das imagens de textura
uniform sampler2D TextureImage0;
uniform sampler2D TextureImage1;
uniform sampler2D TextureImage2;
uniform sampler2D TextureImage3;
uniform sampler2D TextureImage4;
uniform sampler2D TextureImage5;
uniform sampler2D TextureImage6;
uniform sampler2D TextureImage7;
uniform sampler2D TextureImage8;
uniform sampler2D TextureImage9;
uniform sampler2D TextureImage10;
uniform sampler2D TextureImage11;
uniform sampler2D TextureImage12;

// O valor de saída ("out") de um Fragment Shader é a cor final do fragmento.
out vec4 color;

// Constantes
#define M_PI   3.14159265358979323846
#define M_PI_2 1.57079632679489661923

void main()
{
    // Obtemos a posição da câmera utilizando a inversa da matriz que define o
    // sistema de coordenadas da câmera.
    vec4 origin = vec4(0.0, 0.0, 0.0, 1.0);
    vec4 camera_position = inverse(view) * origin;

    // O fragmento atual é coberto por um ponto que percente à superfície de um
    // dos objetos virtuais da cena. Este ponto, p, possui uma posição no
    // sistema de coordenadas global (World coordinates). Esta posição é obtida
    // através da interpolação, feita pelo rasterizador, da posição de cada
    // vértice.
    vec4 p = position_world;

    // Normal do fragmento atual, interpolada pelo rasterizador a partir das
    // normais de cada vértice.
    vec4 n = normalize(normal);

    // Vetor que define o sentido da fonte de luz em relação ao ponto atual.
    vec4 l = normalize(vec4(1.0,1.0,-1.0,0.0));

    // Vetor que define o sentido da câmera em relação ao ponto atual.
    vec4 v = normalize(camera_position - p);

    // Vetor que define o sentido da reflexão especular ideal.
    vec4 r = normalize(vec4(-l.x+2*n.x*dot(n,l),
                            -l.y+2*n.y*dot(n,l),
                            -l.z+2*n.z*dot(n,l),
                            0.0));//(-l+(2*n*dot(n,l)));
    //PREENCHA AQUI o vetor de reflexão especular ideal r = -l +2n (n.l) (dotproduct(n,l))

    // Parâmetros que definem as propriedades espectrais da superfície
    vec3 Kd; // Refletância difusa
    vec3 Ks; // Refletância especular
    vec3 Ka; // Refletância ambiente
    float q; // Expoente especular para o modelo de iluminação de Phong


    // Coordenadas de textura U e V
    float U = 0.0;
    float V = 0.0;

    if ( object_id == SPHERE)
    {
        // PREENCHA AQUI as coordenadas de textura da esfera, computadas com
        // projeção esférica EM COORDENADAS DO MODELO. Utilize como referência
        // o slides 134-150 do documento Aula_20_Mapeamento_de_Texturas.pdf.
        // A esfera que define a projeção deve estar centrada na posição
        // "bbox_center" definida abaixo.

        // Você deve utilizar:
        //   função 'length( )' : comprimento Euclidiano de um vetor
        //   função 'atan( , )' : arcotangente. Veja https://en.wikipedia.org/wiki/Atan2.
        //   função 'asin( )'   : seno inverso.
        //   constante M_PI
        //   variável position_model

        vec4 bbox_center = (bbox_min + bbox_max) / 2.0;

        vec4 psphere = (position_model - bbox_center) / (length(position_model - bbox_center));

        U = (atan(psphere.x,psphere.z) + M_PI) / (2 * M_PI);
        V = (asin(psphere.y) + M_PI_2) / M_PI;
    }
    else if ( object_id == BUNNY || object_id == FENCE || object_id == CUBE
    || object_id == DUCK || object_id == WAVE || object_id == STAND || object_id == CLOUDS )
    {
        // PREENCHA AQUI as coordenadas de textura do coelho, computadas com
        // projeção planar XY em COORDENADAS DO MODELO. Utilize como referência
        // o slides 99-104 do documento Aula_20_Mapeamento_de_Texturas.pdf,
        // e também use as variáveis min*/max* definidas abaixo para normalizar
        // as coordenadas de textura U e V dentro do intervalo [0,1]. Para
        // tanto, veja por exemplo o mapeamento da variável 'p_v' utilizando
        // 'h' no slides 158-160 do documento Aula_20_Mapeamento_de_Texturas.pdf.
        // Veja também a Questão 4 do Questionário 4 no Moodle.

        float minx = bbox_min.x;
        float maxx = bbox_max.x;

        float miny = bbox_min.y;
        float maxy = bbox_max.y;

        float minz = bbox_min.z;
        float maxz = bbox_max.z;

        U = (position_model.x - minx)/(maxx - minx);
        V = (position_model.y - miny)/(maxy - miny);
    }
    else if ( object_id == PLANE )
    {
        // Coordenadas de textura do plano, obtidas do arquivo OBJ.
        U = texcoords.x;
        V = texcoords.y;
    }
    else if ( object_id == HEAD)
    {
        float minx = bbox_min.x;
        float maxx = bbox_max.x;

        float miny = bbox_min.y;
        float maxy = bbox_max.y;

        float minz = bbox_min.z;
        float maxz = bbox_max.z;

        if(position_model.z + 0.001f >= maxz){
            U = (position_model.x - maxx)/-4*(maxx - minx) + 0.25;
            V = (position_model.y - maxy)/-2*(maxy - miny);
        }
        else if(position_model.z - 0.001f <= minz){
            U = (position_model.x - maxx)/-4*(maxx - minx) + 0.75;
            V = (position_model.y - maxy)/-2*(maxy - miny);
        }
        else if(position_model.x - 0.001f <= minx){
            U = (position_model.z - maxz)/-4*(maxz - minz) + 0.5;
            V = (position_model.y - maxy)/-2*(maxy - miny);
        }
        else if(position_model.x + 0.001f >= maxx){
            U = (position_model.z - minz)/4*(maxz - minz) + 0.0;
            V = (position_model.y - maxy)/-2*(maxy - miny);
        }
        else if(position_model.y - 0.001f <= miny){
            U = (position_model.z - minz)/4*(maxz - minz) + 0.25;
            V = (position_model.x - maxx)/-2*(maxx - minx) + 0.5;
        }
        else if(position_model.y + 0.001f >= maxy) {
            U = (position_model.z - maxz)/-4*(maxz - minz) + 0.5;
            V = (position_model.x - maxx)/-2*(maxx - minx) + 0.5;
        }
    }
    else if ( object_id == BODY)
    {
        float minx = bbox_min.x;
        float maxx = bbox_max.x;

        float miny = bbox_min.y;
        float maxy = bbox_max.y;

        float minz = bbox_min.z;
        float maxz = bbox_max.z;

        if(position_model.z + 0.001f >= maxz){
            U = 2*(position_model.x - minx)/6*(maxx - minx) + 1.0/6;
            V = 3*(position_model.y - miny)/4*(maxy - miny);
        }
        else if(position_model.z - 0.001f <= minz){
            U = -2*(position_model.x - minx)/6*(maxx - minx) + 6.0/6;
            V = 3*(position_model.y - miny)/4*(maxy - miny);
        }
        else if(position_model.x - 0.001f <= minx){
            U = 1*(position_model.z - minz)/6*(maxz - minz) + 0.0/6;
            V = 3*(position_model.y - miny)/4*(maxy - miny);
        }
        else if(position_model.x + 0.001f >= maxx){
            U = -1*(position_model.z - minz)/6*(maxz - minz) + 4.0/6;
            V = 3*(position_model.y - miny)/4*(maxy - miny);
        }
        else if(position_model.y <= maxy +0.0001f && position_model.y >= maxy -0.0001f){
            U = 2*(position_model.x - minx)/6*(maxx - minx) + 1.0/6;
            V = 1*(position_model.z - minz)/4*(maxz - minz) + 3.0/4;
        }
        else if(position_model.y - 0.001f <= miny){
            U = 2*(position_model.x - minx)/6*(maxx - minx) + 3.0/6;
            V = 1*(position_model.z - minz)/4*(maxz - minz) + 3.0/4;
        }
    }
    else if ( object_id == LEG)
    {
        float minx = bbox_min.x;
        float maxx = bbox_max.x;

        float miny = bbox_min.y;
        float maxy = bbox_max.y;

        float minz = bbox_min.z;
        float maxz = bbox_max.z;

        if(position_model.z + 0.001f >= maxz){
            U = 1*(position_model.x - minx)/4*(maxx - minx) + 1.0/4;
            V = 3*(position_model.y - miny)/4*(maxy - miny);
        }
        else if(position_model.z - 0.001f <= minz){
            U = 1*(position_model.x - minx)/4*(maxx - minx) + 3.0/4;
            V = 3*(position_model.y - miny)/4*(maxy - miny);
        }
        else if(position_model.x - 0.001f <= minx){
            U = 1*(position_model.z - minz)/4*(maxz - minz) + 0.0/4;
            V = 3*(position_model.y - miny)/4*(maxy - miny);
        }
        else if(position_model.x + 0.001f >= maxx){
            U = 1*(position_model.z - minz)/4*(maxz - minz) + 2.0/4;
            V = 3*(position_model.y - miny)/4*(maxy - miny);
        }
        else if(position_model.y <= maxy +0.0001f && position_model.y >= maxy -0.0001f){
            U = 1*(position_model.x - minx)/4*(maxx - minx) + 1.0/4;
            V = 1*(position_model.z - minz)/4*(maxz - minz) + 3.0/4;
        }
        else if(position_model.y - 0.001f <= miny){
            U = 1*(position_model.x - minx)/4*(maxx - minx) + 2.0/4;
            V = 1*(position_model.z - minz)/4*(maxz - minz) + 3.0/4;
        }
    }
    else if ( object_id == UARM)
    {
        float minx = bbox_min.x;
        float maxx = bbox_max.x;

        float miny = bbox_min.y;
        float maxy = bbox_max.y;

        float minz = bbox_min.z;
        float maxz = bbox_max.z;

        if(position_model.z + 0.001f >= maxz){
            U = 1*(position_model.x - minx)/4*(maxx - minx) + 1.0/4;
            V = 1.5*(position_model.y - miny)/4*(maxy - miny) + 1.5/4;
        }
        else if(position_model.z - 0.001f <= minz){
            U = 1*(position_model.x - minx)/4*(maxx - minx) + 3.0/4;
            V = 1.5*(position_model.y - miny)/4*(maxy - miny) + 1.5/4;
        }
        else if(position_model.x - 0.001f <= minx){
            U = 1*(position_model.z - minz)/4*(maxz - minz) + 0.0/4;
            V = 1.5*(position_model.y - miny)/4*(maxy - miny) + 1.5/4;
        }
        else if(position_model.x + 0.001f >= maxx){
            U = 1*(position_model.z - minz)/4*(maxz - minz) + 2.0/4;
            V = 1.5*(position_model.y - miny)/4*(maxy - miny) + 1.5/4;
        }
        else if(position_model.y <= maxy +0.0001f && position_model.y >= maxy -0.0001f){
            U = 1*(position_model.x - minx)/4*(maxx - minx) + 1.0/4;
            V = 1*(position_model.z - minz)/4*(maxz - minz) + 3.0/4;
        }
        else if(position_model.y - 0.001f <= miny){
            U = 1*(position_model.x - minx)/4*(maxx - minx) + 2.0/4;
            V = 1*(position_model.z - minz)/4*(maxz - minz) + 3.0/4;
        }
    }
    else if ( object_id == FARM)
    {
        float minx = bbox_min.x;
        float maxx = bbox_max.x;

        float miny = bbox_min.y;
        float maxy = bbox_max.y;

        float minz = bbox_min.z;
        float maxz = bbox_max.z;

        if(position_model.z + 0.001f >= maxz){
            U = 1*(position_model.x - minx)/4*(maxx - minx) + 1.0/4;
            V = 1.5*(position_model.y - miny)/4*(maxy - miny);
        }
        else if(position_model.z - 0.001f <= minz){
            U = 1*(position_model.x - minx)/4*(maxx - minx) + 3.0/4;
            V = 1.5*(position_model.y - miny)/4*(maxy - miny);
        }
        else if(position_model.x - 0.001f <= minx){
            U = 1*(position_model.z - minz)/4*(maxz - minz) + 0.0/4;
            V = 1.5*(position_model.y - miny)/4*(maxy - miny);
        }
        else if(position_model.x + 0.001f >= maxx){
            U = 1*(position_model.z - minz)/4*(maxz - minz) + 2.0/4;
            V = 1.5*(position_model.y - miny)/4*(maxy - miny);
        }
        else if(position_model.y + 0.001f >= maxy){
            U = 1*(position_model.x - minx)/4*(maxx - minx) + 1.0/4;
            V = 1*(position_model.z - minz)/4*(maxz - minz) + 3.0/4;
        }
        else if(position_model.y - 0.001f <= miny){
            U = 1*(position_model.x - minx)/4*(maxx - minx) + 2.0/4;
            V = 1*(position_model.z - minz)/4*(maxz - minz) + 3.0/4;
        }
    }
    else if ( object_id == BALLOON || object_id == NUMB )
    {
        float minx = bbox_min.x;
        float maxx = bbox_max.x;

        float miny = bbox_min.y;
        float maxy = bbox_max.y;

        float minz = bbox_min.z;
        float maxz = bbox_max.z;

        U = (position_model.x - minx)/(maxx - minx);
        V = (position_model.z - minz)/(maxz - minz);
    }

    // Obtemos a refletância difusa a partir da leitura da imagem TextureImage

    if ( object_id == SPHERE ){
        Kd = texture(TextureImage0, vec2(U,V)).rgb;
        Ks = vec3(0.3, 0.3, 0.3);
        Ka = Kd/2;
        q = 20.0;
    }
    else if ( object_id == CUBE ){
        Kd = texture(TextureImage3, vec2(U,V)).rgb;
        Ks = vec3(0.3, 0.3, 0.3);
        Ka = Kd/2;
        q = 20.0;
    }
    else if ( object_id == FENCE ){
        Kd = texture(TextureImage3, vec2(U,V)).rgb;
        Ks = vec3(0.3, 0.3, 0.3);
        Ka = Kd/2;
        q = 20.0;
    }
    else if ( object_id == PLANE ){
        Kd = texture(TextureImage1, vec2(U,V)).rgb;
        Ks = vec3(0.3, 0.3, 0.3);
        Ka = Kd/2;
        q = 20.0;
    }
    else if ( object_id == DUCK ){
        Kd = texture(TextureImage2, vec2(U,V)).rgb;
        Ks = vec3(0.3, 0.3, 0.3);
        Ka = Kd/2;
        q = 20.0;
    }
    else if ( object_id == HEAD ){
        Kd = texture(TextureImage4, vec2(U,V)).rgb;
        Ks = vec3(0.3, 0.3, 0.3);
        Ka = Kd/2;
        q = 20.0;
    }
    else if ( object_id == BODY ){
        Kd = texture(TextureImage5, vec2(U,V)).rgb;
        Ks = vec3(0.3, 0.3, 0.3);
        Ka = Kd/2;
        q = 20.0;
    }
    else if ( object_id == LEG ){
        Kd = texture(TextureImage6, vec2(U,V)).rgb;
        Ks = vec3(0.3, 0.3, 0.3);
        Ka = Kd/2;
        q = 20.0;
    }
    else if ( object_id == UARM || object_id == FARM ){
        Kd = texture(TextureImage7, vec2(U,V)).rgb;
        Ks = vec3(0.3, 0.3, 0.3);
        Ka = Kd/2;
        q = 20.0;
    }
    else if ( object_id == WAVE ){
        Kd = texture(TextureImage8, vec2(U,V)).rgb;
        Ks = vec3(0.3, 0.3, 0.3);
        Ka = Kd/2;
        q = 20.0;
    }
    else if ( object_id == STAND ){
        Kd = texture(TextureImage9, vec2(U,V)).rgb;
        Ks = vec3(0.3, 0.3, 0.3);
        Ka = Kd/2;
        q = 20.0;
    }
    else if ( object_id == BALLOON ){
        Kd = texture(TextureImage10, vec2(U,V)).rgb;
        Ks = vec3(0.3, 0.3, 0.3);
        Ka = Kd/2;
        q = 20.0;
    }
    else if ( object_id == NUMB ){
        Kd = texture(TextureImage11, vec2(U,V)).rgb;
        Ks = vec3(0.3, 0.3, 0.3);
        Ka = Kd/2;
        q = 20.0;
    }
    else if ( object_id == CLOUDS ){
        Kd = texture(TextureImage12, vec2(U,V)).rgb;
        Ks = vec3(0.3, 0.3, 0.3);
        Ka = Kd/2;
        q = 20.0;
    }

    // Espectro da fonte de iluminação
    vec3 I = vec3(1.0,1.0,1.0); // PREENCH AQUI o espectro da fonte de luz

    // Espectro da luz ambiente
    vec3 Ia = vec3(0.2,0.2,0.2); // PREENCHA AQUI o espectro da luz ambiente

    // Termo difuso utilizando a lei dos cossenos de Lambert
    vec3 lambert_diffuse_term = vec3(Kd.x*I.x*(max(0,dot(n,l))),
                                     Kd.y*I.y*(max(0,dot(n,l))),
                                     Kd.z*I.z*(max(0,dot(n,l)))); // PREENCHA AQUI o termo difuso de Lambert

    // Termo ambiente
    vec3 ambient_term = vec3(Ka.x*Ia.x,Ka.y*Ia.y,Ka.z*Ia.z); // PREENCHA AQUI o termo ambiente

    // Termo especular utilizando o modelo de iluminação de Phong
    vec3 phong_specular_term  = vec3(Ks.x*I.x*(pow((max(0,dot(r,v))),q)),
                                     Ks.y*I.y*(pow((max(0,dot(r,v))),q)),
                                     Ks.z*I.z*(pow((max(0,dot(r,v))),q))); // PREENCH AQUI o termo especular de Phong

    // NOTE: Se você quiser fazer o rendering de objetos transparentes, é
    // necessário:
    // 1) Habilitar a operação de "blending" de OpenGL logo antes de realizar o
    //    desenho dos objetos transparentes, com os comandos abaixo no código C++:
    //      glEnable(GL_BLEND);
    //      glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    // 2) Realizar o desenho de todos objetos transparentes *após* ter desenhado
    //    todos os objetos opacos; e
    // 3) Realizar o desenho de objetos transparentes ordenados de acordo com
    //    suas distâncias para a câmera (desenhando primeiro objetos
    //    transparentes que estão mais longe da câmera).
    // Alpha default = 1 = 100% opaco = 0% transparente
    color.a = 1;

    // Cor final do fragmento calculada com uma combinação dos termos difuso,
    // especular, e ambiente. Veja slide 129 do documento Aula_17_e_18_Modelos_de_Iluminacao.pdf.
    color.rgb = lambert_diffuse_term + ambient_term + phong_specular_term;

    // Cor final com correção gamma, considerando monitor sRGB.
    // Veja https://en.wikipedia.org/w/index.php?title=Gamma_correction&oldid=751281772#Windows.2C_Mac.2C_sRGB_and_TV.2Fvideo_standard_gammas
    color.rgb = pow(color.rgb, vec3(1.0,1.0,1.0)/2.2);
}

