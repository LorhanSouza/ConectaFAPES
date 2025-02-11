# PROJETO CONECTAFAPES | LEDS

## Módulo de Cadastro de pesquisadores e gestão de editais

### Documentação

#### Módulo Cadastro de pesquisadores e gestão de editais

### Registro de Alterações

| Versão | Responsável | Data       | Alterações                        | Status          |
|--------|-------------|------------|-----------------------------------|-----------------|
| 1.0    | Felipe      | 10/09/2024 | Criação da primeira versão do documento | Desenvolvimento |

---

## 1. Introdução

O módulo de cadastro de pesquisadores e gestão de editais da FAPES/ES é necessário para agilizar o processo de registro de pesquisadores, estudantes e demais profissionais interessados em participar de editais e projetos promovidos pela fundação. O sistema deve ter uma interface intuitiva e permitir que os usuários criem seus perfis de forma autônoma, garantindo a inscrição em oportunidades de financiamento e desenvolvimento de pesquisa. Além disso, o módulo assegura a conformidade com as diretrizes de segurança e proteção de dados, oferecendo uma experiência eficiente e segura para os usuários cadastrados.

## 2. Propósito do Módulo

Permitir que pesquisadores realizem o cadastro no sistema para participar de editais e projetos.

---

## 4. Modelo de Casos de Uso

A tabela a seguir lista os eventos incluídos em cada caso de uso do módulo.

| ID   | Caso de Uso                | Evento                         | Descrição                                                    | Prioridade |
|------|----------------------------|--------------------------------|--------------------------------------------------------------|------------|
| UC01 | Cadastrar usuário           | UC01.0 Auto-cadastro de pesquisador <br> UC01.1 Confirmar e-mail cadastrado. <br> UC01.2 Remover pesquisador(LGPD) .<br> UC01.3 Alterar senha. | Ver sigfapes ou documento de introdução. Adicionar estado civil | 100        |
| UC02 | Cadastrar Documentos        | UC02.0 Inserir Documentos do Pesquisador <br>  UC02.1 Remover Documentos do pesquisador. | Ver sigfapes ou documento de introdução | 98         |
| UC03 | Listar bolsas               | UC03.0 Listar minhas bolsas <br>  UC03.1 Consultar minhas bolsas <br>  UC03.2 Listar bolsas que oriento | Ver sigfapes ou documento de introdução | 95         |
| UC04 | Gerenciar meus Editais/Projetos | UC04.0 Listar meus editais/Projetos <br>  UC04.1 Consultar situação de editais. <br>  UC04.2 Visualizar informações do projeto | Ver sigfapes ou documento de introdução | 97         |
| UC05 | Cadastrar bolsistas         | UC05.0 Inserir Bolsistas <br>  UC05.1 Remover Bolsistas | Ver sigfapes ou documento de introdução | 96         |

---

## 5.1 Descrição de Casos de Uso (UCs)

Para os casos de uso listados neste documento, deve-se olhar as telas originais no Sigfapes ou as anotações contidas no documento inicial de introdução ao Projeto Conecta FAPES. [Link de referência](https://docs.google.com/presentation/d/1f8zvt_cHtVxbH-UMuLPV4tOIqpOgPOED2mEbmmglBz8/edit#slide=id.g2fe1131452a_0_5).

---

## 6. Protótipos de Telas

### 1. Protótipo Envio Documentos

![Tela Principal Envio Documentos](./Documentos%20Auxiliares/Prototipo1.png)

**Descrição:** Tela onde o usuário realiza a ações principais como adicionar, editar, visualizar e deletar os arquivos e vê o status do aprovação do arquivo.

![Tela de Envio Documento](./Documentos%20Auxiliares/Prototipo2.png)

**Descrição:** Tela onde o usuário envia o arquivo e seleciona o tipo dele.

![Tela de visualização de documento](./Documentos%20Auxiliares/Prototipo3.png)

**Descrição:** Tela onde o usuário visualiza o arquivo.

![Tela de deleção do documento](./Documentos%20Auxiliares/Prototipo4.png)

**Descrição:** Tela onde o usuário deleta o arquivo.

### 2. Protótipo Editais

![Tela Principal Editais](./Documentos%20Auxiliares/Prototipo5.png)

**Descrição:** Tela onde o usuário visualiza os editais por situação como tabelas.

![Tela Editais](./Documentos%20Auxiliares/Prototipo6.png)

**Descrição:** Tela onde o usuário visualiza os editais por situação como tabelas dependendo da classificação.

![Tela Visualização Editais](./Documentos%20Auxiliares/Prototipo7.png)

**Descrição:** Tela onde o usuário visualiza as informações do Projeto.

![Tela Visualização das Informações do Projeto](./Documentos%20Auxiliares/Prototipo8.png)

**Descrição:** Tela onde o usuário visualiza os links útteis do projeto.

---

## 7. Modelo Estrutural

![Modelo ER](./Documentos%20Auxiliares/modelo_ER.png)

### MODELO DE BANCO DE DADOS/PROJETO

2. Modelo do Envio de documentos
+-------------------+
|    Documento      |
+-------------------+
| - ID: int         |
| - nome_documento: varchar(50) |
| - ultima_alteracao: datetime  |
| - situacao: varchar(20)       |
+-------------------+
| + getID(): int                |
| + getNomeDocumento(): String  |
| + getUltimaAlteracao(): datetime |
| + getSituacao(): String       |
| + setNomeDocumento(nome: String): void  |
| + setUltimaAlteracao(data: datetime): void |
| + setSituacao(situacao: String): void     |
+-------------------+

4. Modelo de editais/projetos de bolsas.
+-------------------+
|     Edital        |
+-------------------+
| - ID: int         |
| - nome_edital: varchar(100) |
| - data_publicacao: date     |
| - tipo_edital: varchar(50)  |
+-------------------+
| + getID(): int                |
| + getNomeEdital(): String     |
| + getDataPublicacao(): date   |
| + getTipoEdital(): String     |
| + setNomeEdital(nome: String): void  |
| + setDataPublicacao(data: date): void |
| + setTipoEdital(tipo: String): void   |
+-------------------+

### 7.1 Dicionário de Dados

#### Tabela: `documento`

**Descrição:** Tabela que armazena informações sobre os documentos, incluindo nome, data da última alteração e situação.

| Coluna               | Tipo            | Restrições                      | Descrição                                               |
|----------------------|-----------------|---------------------------------|---------------------------------------------------------|
| `ID`                 | `int`           | `NOT NULL`, `AUTO_INCREMENT`, `PRIMARY KEY` | Identificador único do documento                         |
| `nome_documento`     | `varchar(50)`   | `NULL`                          | Nome do documento                                       |
| `ultima_alteracao`   | `DATETIME`      | `DEFAULT CURRENT_TIMESTAMP`     | Data e hora da última alteração do documento            |
| `situacao`           | `varchar(20)`   | `NULL`                          | Situação do documento (ex: ativo, inativo, pendente)     |

#### Tabela: `editais`

**Descrição:** Tabela que armazena informações sobre os editais, incluindo nome, data de publicação e tipo.

| Coluna              | Tipo            | Restrições                      | Descrição                                               |
|---------------------|-----------------|---------------------------------|---------------------------------------------------------|
| `ID`                | `int`           | `NOT NULL`, `AUTO_INCREMENT`, `PRIMARY KEY` | Identificador único do edital                           |
| `nome_edital`       | `varchar(100)`  | `NULL`                          | Nome do edital                                          |
| `data_publicacao`   | `DATE`          | `NULL`                          | Data de publicação do edital                            |
| `tipo_edital`       | `varchar(50)`   | `NULL`                          | Tipo do edital (ex: concurso, licitação)                |


### 8. Telas desenvolvidas do sistema

https://app.appsmith.com/app/envio-e-verificacao-de-documentos/page1-670e49b906117a67db011567?branch=master

https://app.appsmith.com/app/listar-editais/page1-6720c5e266def46fa887a08b