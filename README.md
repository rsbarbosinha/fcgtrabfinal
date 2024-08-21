# Trabalho Final de Fundamentos de Computação Gráfica

Foi implementado um jogo onde o objetivo é arremessar uma bolinha, acertando os alvos no menor tempo possível. São 6 alvos (3 patos e 3 balões).

O tempo utilizado é mostrado ao acertar todos os alvos.

# Contribuições para o trabalho:
O trabalho foi todo desenvolvido de forma colaborativa e ambos os autores participaram em todas as etapas. Portanto a divisão das contribuições não representa uma divisão rígida de tarefas, mas somente uma referência de quem ficou majoritariamente responsável por cada assunto.

## Rodolfo Barbosa
- Código para desenhar os modelos
- Animações
- Texturas
- Iluminação

## Jean Ribeiro
- Documentação
- Organização do repositório Git
- Correção de bugs
- Otimização do código
- Correções na câmera livre

# Ferramentas externas
Não foram utilizados o ChatGPT ou outras ferramentas para realização deste trabalho.

# Descrição do Processo de Desenvolvimento e Uso dos Conceitos de Computação Gráfica.
O objetivo deste trabalho foi desenvolver uma aplicação gráfica que consolidasse os conhecimentos adquiridos ao longo do curso de Fundamentos de Computação Gráfica. A aplicação desenvolvida, intitulada “Shoot the Duck”, simula um stand de um jogo de carnival onde o jogador atira bolas em alvos, tentando obter o menor tempo possível. A aplicação foi desenvolvida em C++ utilizando a biblioteca OpenGL, permitindo a reutilização de código das aulas práticas e garantindo alta performance e interação em tempo real.

A aplicação “Shoot the Duck” oferece uma experiência interativa e dinâmica, onde o jogador deve acertar alvos móveis em um ambiente tridimensional. A lógica de controle envolve a movimentação dos alvos e a detecção de colisões entre as bolas lançadas e os alvos.

O desenvolvimento se deu a partir da concatenação de diferentes entregas de laboratórios ao longo do semestre. Por exemplo, o personagem foi criado modificando a estrutura de um corpo humano já implementada na disciplina, aplicando diversas texturas inspiradas no jogo Minecraft. Já a bola utilizada como projétil, foi uma adaptação de um modela da esfera terrestre utilizando o mesmo mapeamento de textura para uma textura de bola de baseball.

Para garantir a interação em tempo real, implementamos controles via teclado e mouse. O usuário pode mover a câmera, mirar e lançar bolas nos alvos, aplicando transformações geométricas como translação, rotação e escala.

A aplicação inclui diversos modelos geométricos complexos, carregados no formato OBJ utilizando a biblioteca tinyobjloader. Um dos modelos utilizados que era bastante complexo foi o “baloon.obj”, que serviu como base para a criação de múltiplas instâncias de alvos através da aplicação de diferentes Model matrices. A complexidade do formato deste balão com pequenas dobras nas bordas, permitiu um efeito bastante satisfatório combinado com o efeito de iluminação difusa (Lambert) e Blinn-Phong. As texturas foram cuidadosamente mapeadas para evitar distorções não naturais.

Implementamos três tipos de testes de intersecção: esfera-box, esfera-plano e esfera-esfera. Esses testes foram utilizados para detectar colisões entre as bolas lançadas e os alvos patos e balões e com o chão, garantindo que a lógica de controle da aplicação fosse robusta e funcional. Os testes de colisão foram implementados em um arquivo separado, “collisions.cpp”.

Os alvos móveis do tipo “patos” possuem movimentação definida através de curvas de Bézier cúbicas, permitindo um movimento suave e curvo no espaço. Já a bola percorre uma parábola baseada em um movimento afetado pela gravidade para maior realismo. A animação de movimento foi baseada no tempo, garantindo transições fluidas e naturais.

# Controles
- W, A, S, D - Movimentação do personagem
- Clicar com o esquerdo - Arremessar a bolinha
- N - Novo Jogo
- C - Alternar entre câmera livre e normal (Look-at)
- ESC - Encerrar o jogo e fechar aplicação.

# Compilação e Execução da aplicação
O projeto foi criado com o CodeBlocks utilizando os projetos dos Laboratórios de aula como base, não sendo necessárias configurações ou bibliotecas adicionais. A compilação é executada diretamente pelo Codeblocks, de preferência no modo Release.

# Jogo em execução
![Screenshot 1 - Estado inicial](docs/screenshot1.png)

![Screenshot 2 - Bolinha arremessada](docs/screenshot2.png)

![Screenshot 3 - Pontuação final](docs/screenshot3.png)
