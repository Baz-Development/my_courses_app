# My Courses App

O My Courses App é um projeto desenvolvido em Flutter, criado com o objetivo principal de aprimorar o entendimento de Clean Architecture e Test-Driven Development (TDD). Este aplicativo permite que os usuários se matriculem em cursos e os acompanhem de maneira organizada e eficaz.

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)
[![Open Issues](https://img.shields.io/github/issues-raw/Baz-Development/my_courses_app?style=for-the-badge)](https://github.com/Baz-Development/my_courses_app/issues)
[![Closed Issues](https://img.shields.io/github/issues-closed-raw/Baz-Development/my_courses_app?style=for-the-badge)](https://github.com/Baz-Development/my_courses_app/issues?q=is%3Aissue+is%3Aclosed)
[![Open Pulls](https://img.shields.io/github/issues-pr-raw/Baz-Development/my_courses_app?style=for-the-badge)](https://github.com/Baz-Development/my_courses_app/pulls)
[![Closed Pulls](https://img.shields.io/github/issues-pr-closed-raw/Baz-Development/my_courses_app?style=for-the-badge)](https://github.com/Baz-Development/my_courses_app/pulls?q=is%3Apr+is%3Aclosed)
[![Contributors](https://img.shields.io/github/contributors/Baz-Development/my_courses_app?style=for-the-badge)](https://github.com/Baz-Development/my_courses_app/graphs/contributors)
[![Activity](https://img.shields.io/github/last-commit/Baz-Development/my_courses_app?style=for-the-badge&label=most%20recent%20activity)](https://github.com/Baz-Development/my_courses_app/pulse)
[![codecov](https://codecov.io/gh/Baz-Development/my_courses_app/graph/badge.svg?token=W00LDE5U9N)](https://codecov.io/gh/Baz-Development/my_courses_app)

## Visão Geral

O My Courses App foi desenvolvido como uma aplicação de exemplo para demonstrar as melhores práticas de desenvolvimento de software, incluindo a implementação da arquitetura Clean Architecture e a aplicação rigorosa do TDD. O foco principal do projeto é a qualidade do código e a manutenção, seguindo os princípios SOLID e a separação de preocupações.

## Funcionalidades Principais

- **Matrícula em Cursos:** Os usuários podem pesquisar e se matricular em cursos disponíveis.

- **Acompanhamento de Progresso:** Uma vez matriculados, os usuários podem acompanhar seu progresso em cada curso.

- **Conteúdo do Curso:** Os cursos podem incluir módulos, lições, quizzes e outros tipos de conteúdo.

- **Clean Architecture:** O projeto é estruturado seguindo os princípios da Clean Architecture, garantindo uma separação clara das camadas de negócios, apresentação e dados.

- **Test-Driven Development (TDD):** O desenvolvimento de recursos e funcionalidades é orientado por testes unitários, garantindo a robustez do código.

## Estrutura do Projeto

A estrutura do projeto segue a organização típica da Clean Architecture, com as seguintes camadas principais:

- **Presentation:** Esta camada contém a interface do usuário e a lógica de apresentação. Aqui, as telas e widgets são desenvolvidos.

- **Domain:** A camada de domínio contém a lógica de negócios, as entidades e os casos de uso da aplicação. Ela é independente da plataforma.

- **Data:** A camada de dados lida com a obtenção e persistência de dados. Isso inclui acesso a APIs externas, bancos de dados locais e armazenamento em cache.

## Instalação e Configuração

Para configurar e executar o My Courses App localmente, siga estas etapas:

1. Clone este repositório para o seu ambiente de desenvolvimento:

   ```bash
   git clone https://github.com/seu-usuario/my-courses-app.git
   ```

2. Navegue até o diretório do projeto:

   ```bash
   cd my-courses-app
   ```

3. Instale as dependências do Flutter:

   ```bash
   flutter pub get
   ```

4. Execute o aplicativo em um emulador ou dispositivo físico:

   ```bash
   flutter run
   ```

## Contribuição

A contribuição para o projeto My Courses App é bem-vinda! Sinta-se à vontade para abrir problemas (issues) ou enviar solicitações de pull (pull requests) para melhorias, correções de bugs ou novas funcionalidades.

## Licença

Este projeto está licenciado sob a [Licença MIT](LICENSE). Sinta-se à vontade para usá-lo e modificá-lo de acordo com suas necessidades.

---

Esperamos que o My Courses App seja uma ferramenta útil para aprimorar seu conhecimento em Clean Architecture e TDD, além de servir como um exemplo de boas práticas de desenvolvimento de aplicativos Flutter. Se você tiver alguma dúvida ou precisar de assistência, não hesite em entrar em contato com a equipe de desenvolvimento. Aproveite o aprendizado e aprimoramento das suas habilidades de desenvolvimento!