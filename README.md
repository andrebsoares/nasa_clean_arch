# nasa_clean_arch

Projeto de estudo de Clean Architecture e TDD utilizando a API da Nasa

## Sobre o Projeto

Clean Architecture

- Com base na série [Leticia Baleiro](https://www.youtube.com/playlist?list=PLnFA4SZ9y0T5FA2dFdNh6NLD6Rm6GB6x7)
- Foram visitados conceitos do Clean Architecture passando por cada camada tudo com TDD

Clean Architecture e suas camadas ([Flutterando](https://github.com/Flutterando/Clean-Dart)):
- 1º Camada:
  - Regra de negócio corporativa
    - As entidades (entity)
      - São classes que contém propriedades que não dependem da API,
      - Esqueleto de um objeto
      - Contratos para os modelos (models)

- 2º Camada:
  - Regra de negócio da aplicação
    - Os casos de uso (use cases)
      - Regra de negócio do projeto
      - Tudo que gera valor para o projeto/cliente

Essas 2 primeiras camadas formam o que chamamos de DOMÍNIO, ele não deve depender de nada externo e nem precisa saber
o que tem lá fora. Qualquer coisa que cumpra os contratos feitos por interfaces a qual foi decidido dentro do dominio
pode se comunicar com as regras (use cases)

- 3º Camada:
  - Adaptadores de Interface
    - Resposável por dar suporte para as camadas mais altas (regras de negócio), convertendo os dados externos em um
    formato que cumpram os contratos de interface definido pelas regras de negócio

- 4º Camada:
  - Frameworks & Drivers
    - UI, Bancos e etc.

Todas as abestrações feitas pelas camadas mais altas (regras de negócio) foram para aumentar a facilidade do Plug & Play
dos artefatos externos como um banco de dados ou uma interface gráfica.

Facilitando assim mudanças, e trabalhar com testes pois vamos passar a depender apenas de abstrações e não mais de
implementações, facilitando mocks e etc
