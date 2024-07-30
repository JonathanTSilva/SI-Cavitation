# Contribuindo

Primeiramente, obrigado por dedicar um tempo para contribuir! As contribuições são o que torna a comunidade de código aberto um lugar incrível para aprender, inspirar e criar. Quaisquer contribuições que você fizer são **muito apreciadas** e beneficiarão a todos.

> Observe que temos um [código de conduta](../CODE_OF_CONDUCT.md). Siga-o em todas as suas interações com o projeto.

## Registrar um problema

Para contribuir com este projeto, é necessário a priori discutir com os proprietários deste repositório a alteração que deseja fazer por meio de um *issue*, e-mail ou qualquer outro método, antes que seja feita uma alteração.

Por favor, tente criar relatórios de bugs que sejam:

- **Reprodutível:** inclua etapas para reproduzir o problema;
- **Específico:** inclua o máximo de detalhes possível: qual versão, qual ambiente, etc;
- **Único:** não duplique problemas abertos existentes;
- **Escopo para um único bug:** um bug por relatório.

> Você pode usar [markdownlint-cli](https://github.com/igorshubovych/markdownlint-cli) para verificar a inconsistência de estilo de markdown comum.

## Guia de estilo

Para qualquer contribuição, utilize as seguintes configurações do **editorconfig**:

```config
root = true

[*]
indent_style = space
indent_size = 4
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true
curly_bracket_next_line = false
spaces_around_operators = true

[*.bat]
end_of_line = crlf

[*.cs]
curly_bracket_next_line = true

[*.{js,ts}]
quote_type = single

[*.md]
trim_trailing_whitespace = false

[*.tsv]
indent_style = tab
```

### Para códigos:

1. Escreva seus códigos em UTF-8;
2. Caso não tenha acesso ao **editorconfig**, sempre utilize 4 espaços de endentação (não utilize tabs);
3. Arquitetura modular do usuário para agrupar funções, classes, etc;
4. Tente limitar o comprimento da linha a 80 caracteres;
5. Os nomes das classes devem ser sempre em maiúsculas (utilizar **PascalCase**);
6. Os nomes das funções, variáveis, parâmetros, pacotes, atributos e métodos devem sempre estar em minúsculas (utilizar **camelCase**);
7. Olhe para o estilo existente e siga o padrão.

### Para documentação:

Nós temos dois estilos de documentação em Markdown: a de **respositórios** e a de **artigos**. Para melhor entender os estilos e estrutura de cada uma, observe as imagens abaixo:

<p float="left">
  <img src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/main.png" width="450" />
  <img src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/second.png" width="450" /> 
</p>

1. Sempre agrupe os links das páginas no final do seu código `.md` (seguindo padrão abaixo), facilitando a manutenção de links defeituosos:

> **Nota:** utilize sequência de números para sites e letras para imagens.

```md
Aqui tem um [link][1]

Aqui tem uma imagem ![image][A]

<!-- MARKDOWN LINKS -->
<!-- SITES -->
[1]: https://www.link1.org/

<!-- IMAGES -->
[A]: ../../Images/imagemA.png
```

2. Para documentação de repositório, os emojis para cada capítulo devem seguir o seguinte padrão:

|Capítulo|Emoji|▫|Capítulo|Emoji|▫|Capítulo|Emoji|
|:----|:----:|:----:|:----|:----:|:----:|:----|:----:|
|Agradecimentos|🙏|▫|Artigos|📖|▫|Características principais|💡|
|Começando|🔥|▫|Como funciona|🛠️|▫|Como rodar localmente|💿|
|Configuração|⚙️|▫|Contato|📧|▫|Contribuindo|🤝|
|Construído com|🧱|▫|Deploy|🌐|▫|Doações|❤️|
|Ferramentas|🧰|▫|Guia rápido|✨|▫|Índice|🔎|
|Inspiração|💭|▫|Instalação|🚀|▫|Integrações de terceiros|✔️|
|Licença|📝|▫|Links|🔗|▫|Pré-requisitos|⚠️|
|Sobre o projeto|📃|▫|Testando|🧪|▫|Todo|📜|
|Roadmap|🛣️|▫|Bibliografia|📚|▫|||

1. Os quadros de anotações, dicas, avisos, entre outros devem ser realizadas com o seguinte padrão:

```plaintext
> **Notas:** escreva aqui a descrição da sua nota.
```

## Fork do repositório

Certifique-se de adicionar os testes relevantes antes de fazer o _pull request_. Os documentos serão atualizado automaticamente quando mesclamos para a branch `main`, mas é necessário também construir os documentos você mesmo e certificar-se de que eles sejam legíveis.

## Realizar o _pull request_

Depois de fazer todas as alterações, testar e atualizar a documentação, faça um *pull request* para mover tudo de volta para o branch principal do `repositório`. Certifique-se de fazer referência ao problema original na solicitação de pull. Para manter as conformidades com as regras do projeto, nessa etapa serão trocadas alterações e possíveis melhorias relacionadas ao estilo.

## Dúvidas frequentes (FAQ)

### Como fazer um _pull request_ corretamente

- Criar um _fork_ pessoal do projeto no GitHub;
- Clonar o _fork_ em sua máquina local. Seu repositório remoto do GitHub é conhecido por `origin`;
- Adicionar o repositório original como um remoto chamado `upstream`;
- Se você criou o _fork_ há algum tempo, certifique-se de realizar pull das alterações no seu repositório local;
- Criar um nova _branch_ para trabalhar nela! Ramifique da `develop`, se existir; caso contrário, crie da `main`;
- Implementar/corrigir sua _feature_, não esquecendo de comentar o seu código;
- Siga o estilo de código do projeto em questão, inclusive a indentação;
- Se o projeto apresentar testes, execute-os;
- Escreva ou adapte os testes, conforme necessário;
- Adicionar ou alterar a documentação, conforme necessário;
- Junte seus _commits_ em um único _commit_ com o [rebase interativo][1] do Git. Criar uma nova _branch_, caso seja necessário;
- _Push_ sua _branch_ para seu _fork_ do GitHub, o remoto `origin`;
- Do seu _fork_, abra uma _pull request_ na _branch_ correta. Aponte a _branch_ `develop` do projeto se existir; caso contrário, vá para `main`;
- Uma vez que o _pull request_ for aprovado e mesclado, é possível extrair as alterações do `upstream` para seu repositório local e excluir suas _branchs_ extras;
- Pronto! Muito obrigado pela contribuição.

### Como fazer um _commit_ corretamente

Nós padronizamos os nossos _commits_ com o [Conventional Commits][2]. Confira mais na documentação oficial em seu site. Abaixo estão as vantagens de utilizá-lo como padrão:

- Gerar CHANGELOGs automaticamente;
- Determinar automaticamente um aumento de versão semântica (com base nos tipos de commits recebidos);
- Comunicar a natureza das mudanças aos colegas de equipe, ao público e a outras partes interessadas;
- Acionar processos de compilação e publicação;
- Tornar mais fácil para as pessoas contribuírem com seus projetos, permitindo que elas explorem um histórico de commits mais estruturado.

Para utilizá-lo, é preciso instalar a ferramenta [commitizen][3] em seu repositório, com os seguintes passos:

1. Instalar com o comando: `npm install -g commitizen`;
2. Em seguida, inicialize seu projeto para usar o adaptador cz-conventional-changelog digitando: `commitizen init cz-conventional-changelog --save-dev --save-exact`;
3. Utilizar o comando `git cz` (ou apenas `cz`) ao invés do `git commit`. Uma lista será aberta no terminal para preenchimento de acordo com os padrões estabelecidos pelos mantenedores do projeto.
4. Como alternativo para repositórios que não são _commitizen-friendly_, é possível utilizar a ferramenta sem instalação com o auxílio do npx: `npx cz`.

> Sempre escreva suas mensagens de commit no tempo presente. Sua mensagem de commit deve descrever o que o commit, quando aplicado, faz com o código – não o que você fez com o código.

<!-- MARKDOWN LINKS>
<!-- SITES -->
[1]: https://www.atlassian.com/br/git/tutorials/rewriting-history/git-rebase
[2]: https://www.conventionalcommits.org/en/v1.0.0/
[3]: https://github.com/commitizen/cz-cli
