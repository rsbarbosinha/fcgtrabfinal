# trabfinalfcg
Trabalho Final de Fundamentos de Computação Gráfica O objetivo deste trabalho é consolidar seu conhecimento sobre a representação e visualização de objetos bidimensionais (2D) e tridimensionais (3D) através do desenvolvimento de uma Aplicação Gráfica (programa de computador). Você irá exercitar os conceitos básicos de Computação Gráfica, como visualização em ambientes tridimensionais, interação, detecção de colisão, e utilização de texturas, entre outros.

Especificação
Você deve desenvolver uma Aplicação Gráfica de sua escolha que preencha todos os requisitos descritos na lista abaixo. A nota final do trabalho será calculada com base nestes requisitos, portanto é importante que você se esforce para atingi-los.

Exemplos de ideias de Aplicação Gráficas:

Jogo de corrida estilo Mario Kart
Jogo estilo Bomberman
Jogo estilo Tower Defense
Visualizador 3D de sistema de arquivos
Sistema de Modelagem 3D, como Wings 3D ou SketchUp.
Exemplos de Aplicações Gráficas desenvolvidas por alunos em semestres anteriores:

Boomerang Blitz. Autores: Arthur Alves e Sofia Maciel
DreamGlider. Jogo Platformer. Autores: Beatriz Cesar Sartori e Victor Furusho Vally
Slenderman: The OpenGL Pages. Autores: Eduardo Aurelio Halmenschlager Duarte e Pietro Benati Carrara
Timberman. Marcus Vinicius Gonzales dos Santos e Thiago Haab dos Santos
Doctor Moo. Jogo Puzzle Platformer. Autores: Arthur Endres Balbão, Giovanna Lazzari Miotto, Lucas Romagnoli
Hellish Bricks. Jogo FPS. Autor: Bernardo Sulzbach
The Insane Game. Jogo FPS Platformer. Autores: Andy Ruiz Garramones, Guilherme Gomes Haetinger, Lucas Alegre
Requisitos
O trabalho deve ser desenvolvido em duplas.
Parte da entrega do trabalho final de FCG será através do Git (hosting no Github). Assim, o professor poderá colaborar através de revisão de código (dado um commit específico), pull requests, etc., caso a dupla precise de alguma ajuda durante o desenvolvimento do trabalho.
Até o dia 10 de maio de 2024, preencha o formulário do link abaixo informando os integrantes de sua dupla e uma breve descrição de qual será a aplicação gráfica desenvolvida, além de outras informações sobre a entrega do trabalho final. O formulário deve ser preenchido por somente um dos integrantes da dupla.
Link para o formulário que deve ser preenchido: https://forms.gle/5UKC35DtHHQtc2f38
Duplas que não seguirem à risca a instrução acima poderão sofrer desconto de nota.
Você pode utilizar a linguagem de programação de sua escolha.
Recomenda-se, entretanto, o uso da linguagem C++ com OpenGL. Isto possibilitará a reutilização de código desenvolvido em nossas aulas práticas (laboratórios). Também, facilitará na criação de uma aplicação de alta performance, com interação em tempo real.
Você poderá utilizar no máximo 15% de código pronto para este trabalho (sem considerar o código que desenvolvemos nas aulas práticas).
Todo código pronto utilizado deve estar devidamente identificado através de comentários no código fonte entregue, listando a FONTE de onde foi retirado cada trecho de código. O comentário do código deve obrigatoriamente conter a palavra "FONTE" em maiúsculo, para fácil localização pelo professor.
Qualquer utilização de código além desse limite será considerada plágio e o trabalho correspondente receberá nota zero.
Qualquer cópia de código de trabalhos de colegas deste ou de semestres anteriores será considerado plágio e o trabalho correspondente receberá nota zero.
A sua aplicação deve possibilitar interação em tempo real.
Por exemplo, se você desenvolver um jogo, ele não pode ser "lento" a ponto de impactar negativamente a jogabilidade.
A sua aplicação deve possuir algum objetivo e lógica de controle não-trivial.
Por exemplo, um jogo de computador possui uma lógica não-trivial. Mas, uma aplicação que simplesmente carrega um modelo geométrico 3D e permite sua visualização é trivial.
A sua aplicação deve utilizar as matrizes que vimos em aula para transformações geométricas (Model matrix), projeções (Projection matrix), e especificação do sistema de coordenadas da câmera (View matrix).
Você não pode utilizar bibliotecas existentes para o cálculo de câmera, transformações, etc. Por exemplo, as funções a seguir, comumente utilizadas em tutoriais disponíveis na Web, não podem ser utilizadas:
gluLookAt(), gluOrtho2D(), gluPerspective(), gluPickMatrix(), gluProject(), gluUnProject(), glm::lookAt(), glm::ortho(), glm::perspective(), glm::pickMatrix(), glm::rotate(), glm::scale(), glm::translate(), dentre outras.
Você pode reutilizar o código desenvolvido em nossas aulas práticas.
A sua aplicação deve possibilitar interação com o usuário através do mouse e do teclado.
A qualidade da apresentação do trabalho final, além da presença da dupla nos dias de apresentações de outros colegas, irá contar para a nota final do trabalho. Cada integrante da dupla irá receber pontuação independente de participação. Qualquer tipo de plágio acarretará nota zero.
A sua aplicação deve incluir implementação dos seguintes conceitos de Computação Gráfica:

Objetos virtuais representados através de malhas poligonais complexas (malhas de triângulos).
No mínimo sua aplicação deve incluir um modelo geométrico da complexidade igual ou maior que o modelo "cow.obj" disponível neste link.
Para carregar este (e outros) modelos geométricos no formato OBJ, você pode utilizar bibliotecas existentes (por exemplo: tinyobjloader (C++) e tinyobjloader (C)).
Quanto maior a variedade de modelos geométricos, melhor. Veja a seção "Modelos 3D e Texturas Disponíveis na Web" na página principal de nosso Moodle para uma lista de locais onde você pode obter modelos 3D.
Transformações geométricas de objetos virtuais.
Através da interação com o teclado e/ou mouse, o usuário deve poder controlar transformações geométricas aplicadas aos objetos virtuais (não somente controle da câmera).
Controle de câmeras virtuais.
No mínimo sua aplicação deve implementar uma câmera look-at e uma câmera livre, conforme praticamos no Laboratório 2.
No mínimo um objeto virtual deve ser copiado com duas ou mais instâncias, isto é, utilizando duas ou mais Model matrix aplicadas ao mesmo conjunto de vértices.
Como exemplo, veja o código do Laboratório 2 e Laboratório 3, onde o mesmo modelo geométrico (cubo) é utilizado para desenhar todas as partes do boneco, e somente as matrizes de modelagem (Model matrix) são alteradas para desenhar cada cópia do cubo.
Testes de intersecção entre objetos virtuais.
No mínimo sua aplicação deve utilizar três tipos de teste de intersecção (por exemplo, um teste cubo-cubo, um teste cubo-plano, e um teste ponto-esfera).
Estes testes devem ter algum propósito dentro da lógica de sua aplicação.
Por exemplo, em um jogo de corrida, o modelo virtual de um carro não pode atravessar a parede, e para tanto é necessário testar a intersecção entre estes dois objetos de modo a evitar esta intersecção.
Os testes de colisão devem ser implementados em um arquivo à parte, nomeado "collisions.cpp".
Modelos de iluminação de objetos geométricos.
No mínimo sua aplicação deve incluir objetos com os seguintes modelos de iluminação: difusa (Lambert) e Blinn-Phong.
No mínimo sua aplicação deve incluir objetos com os seguintes modelos de interpolação para iluminação:
No mínimo um objeto com modelo de Gouraud: o modelo de iluminação é avaliado para cada vértice usando suas normais, gerando uma cor, a qual é interpolada para cada pixel durante a rasterização.
No mínimo um objeto com modelo de Phong: as normais de cada vértice são interpoladas para cada pixel durante a rasterização, e o modelo de iluminação é avaliado para cada pixel, utilizando estas normais interpoladas.
Mapeamento de texturas.
TODOS objetos virtuais de sua aplicação devem ter suas cores definidas através de texturas representadas por imagens (no mínimo três imagens distintas).
Imagens de texturas "esticadas" de maneira não natural receberão desconto de pontuação.
Curvas de Bézier.
No mínimo um objeto virtual de sua aplicação deve ter sua movimentação definida através de uma curva de Bézier cúbica. O objeto deve se movimentar de forma suave ao longo do espaço em um caminho curvo (não reto).
Animação de Movimento baseada no tempo.
Todas as movimentações de objetos (incluindo da câmera) devem ser computadas baseado no tempo (isto é, movimentações devem ocorrer sempre na mesma velocidade independente da velocidade da CPU onde o programa está sendo executado).
Funcionalidades Extras
Opcionalmente você pode implementar alguma funcionalidade extra relacionada ao conteúdo da disciplina em sua aplicação. Por exemplo, seguem algumas sugestões de funcionalidades extras de Computação Gráfica e Interação:

Rasterização de curvas poligonais utilizando curvas de Bézier;
Rasterização de superfícies suaves utilizando patches de Bézier;
Efeitos sonoros
Biblioteca https://github.com/mackron/miniaudio;
Biblioteca http://www.ambiera.com/irrklang/;
Sistema de partículas;
Sombras;
Billboards / Sprites;
Interface Gráfica (botões, etc.);
Rasterização de texto com fontes diversas;
Seleção de objetos virtuais com o mouse (picking). Exemplo de implementação: Picking with custom Ray-OBB function;
<sua ideia aqui>...
Apresentação Parcial
No Laboratório 6 e 7, dias 10 e 12 de junho de 2024, o professor irá passar por cada dupla no laboratório para que a dupla apresente uma a versão em desenvolvimento do trabalho final, já compilando e executando, que já implemente alguns dos requisitos listados acima.

Apresentação Final
Cada dupla irá apresentar seu trabalho para a turma nas aulas dos dias 8 e 10 de julho de 2024. O tempo de apresentação é de no máximo 7 minutos por dupla. A ordem de apresentações se dará por sorteio nestes mesmos dias. A apresentação pode consistir em um conjunto de slides e também demonstração da aplicação funcionando. Para isso a dupla pode utilizar o computador principal do laboratório ou conectar seu notebook pessoal no projetor. Se sua dupla for utilizar o computador do laboratório, traga seu código fonte e binário compilado em um pen-drive, para facilitar a cópia dos dados antes da apresentação.

Entrega
Um dos integrantes da dupla deve fazer envio no Moodle de um arquivo ZIP com o seguinte conteúdo:

Código fonte completo documentado;
Você obrigatoriamente deve incluir no seu arquivo ZIP um arquivo texto chamado "hash-entrega.txt", contendo na primeira linha o hash do commit final de seu trabalho, e na segunda linha a URL do seu repositório Git no Github. Além do código no Github, você também pode incluir, opcionalmente, o código fonte diretamente dentro do ZIP.
Não se esqueça de realizar um git commit seguido de um git push ANTES de obter o hash do seu commit final. Caso contrário o professor não conseguirá acessar seu commit final.
Ambos os integrantes da dupla devem possuir commits listados no histórico do Git. Caso o trabalho seja desenvolvido com "pair programming," os integrantes da dupla devem se revezar em quem estará escrevendo o código e criando os commits.
Binário compilado para Windows ou para Linux, incluindo todas as bibliotecas necessárias para execução;
Relatório em formato de README.md colocado no Github, contendo uma descrição simples sobre o desenvolvimento do trabalho, o qual deve obrigatoriamente incluir:
Parágrafo listando as contribuição de cada membro da dupla para o trabalho;
Parágrafo curto indicando se a dupla fez uso do ChatGPT (ou alguma outra ferramenta similar, como Github Copilot, OpenAI Codex, etc.) para desenvolvimento do trabalho, descrevendo como a ferramenta foi utilizada e para quais partes do trabalho. O parágrafo deve também incluir uma análise crítica descrevendo quão útil a dupla achou a ferramenta, onde ela auxiliou e onde ela não auxiliou adequadamente;
Descrição do processo de desenvolvimento e do uso em sua aplicação dos conceitos de Computação Gráfica estudados e listados nos requisitos acima;
No mínimo duas imagens mostrando o funcionamento da aplicação;
Um manual descrevendo a utilização da aplicação (atalhos de teclado, etc.);
Explicação de todos os passos necessários para compilação e execução da aplicação;
Um vídeo de 3 a 5 minutos com uma apresentação do trabalho feito pela dupla, incluindo uma demonstração da aplicação gráfica. Para gravar seu vídeo, você pode usar o software OBS Studio. Preferencialmente, você deve incluir um link para o vídeo no Youtube dentro do seu ZIP (vídeo público ou "unlisted"). Se você não quiser usar o Youtube por algum motivo, pode incluir o vídeo no formato MP4 dentro do ZIP.
A entrega deve ser feita impreterivelmente até 23 horas e 55 minutos do dia 10 de julho de 2024 (quarta-feira), utilizando o botão "Adicionar tarefa" abaixo.

Caso necessário, separe seus arquivos ZIP em partes de 100 MB cada. O Moodle aceita upload de até 2 arquivos de 100 MB, por aluno.

Planilha de Avaliação
O professor irá utilizar uma planilha de avaliação similar ao que é mostrado abaixo:

|-----------------------------------------------------+-----------|
| Critérios Técnicos                                  | Pontuação |
|-----------------------------------------------------+-----------|
| Malhas poligonais complexas                         |           |
| Transformações geométricas controladas pelo usuário |           |
| Câmera livre e câmera look-at                       |           |
| Instâncias de objetos                               |           |
| Três tipos de testes de intersecção                 |           |
| Modelos de Iluminação Difusa e Blinn-Phong          |           |
| Modelos de Interpolação de Phong e Gouraud          |           |
| Mapeamento de texturas em todos os objetos          |           |
| Movimentação com curva Bézier cúbica                |           |
| Animações baseadas no tempo ($\Delta t$)            |           |
|-----------------------------------------------------+-----------|

|----------------------------------------------------------------------------+-----------|
| Critérios de Participação                                                  | Pontuação |
|----------------------------------------------------------------------------+-----------|
| Entrega de acordo com a especificação (Código, Binário, Relatório, Vídeo)  |           |
| Qualidade do Relatório                                                     |           |
| Qualidade da apresentação final                                            |           |
| Apresentação parcial no Lab 6 e 7 (nota individual)                        |           |
| Participação na apresentação final (nota individual)                       |           |
| Participação no desenvolvimento do código                                  |           |
|   de acordo com o histórico do github (nota individual)                    |           |
|----------------------------------------------------------------------------+-----------|
Versão: fcg-tf-1883-XXXXX
