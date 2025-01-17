
<p align="center">
  <img src="https://i.ibb.co/zs1zcs3/Video-Frame.png" width="30%" />
</p>

---

Este repositório contém a implementação da **infraestrutura do Amazon S3** para o projeto **Video Frame Pro**, responsável pelo armazenamento de vídeos enviados pelos usuários e arquivos processados. O objetivo é criar um bucket S3 seguro e organizado, com separação de pastas por usuário e por tipo de arquivo (uploads e arquivos processados), utilizando o **Terraform** para provisionamento.

---

## Funcionalidades

Este repositório contém a infraestrutura para gerenciar o **bucket S3** do projeto, com as seguintes características:

1. **Estrutura de Diretórios**:
   - **`videos/{username}/{videoId}/uploads/`**: Armazena os vídeos enviados pelos usuários.
   - **`videos/{username}/{videoId}/processed/`**: Armazena os arquivos processados, como o ZIP contendo os frames do vídeo.

2. **Segurança e Boas Práticas**:
   - **Bloqueio de acesso público** para evitar exposições acidentais.
   - **Criptografia no lado do servidor (SSE)** habilitada para proteger os dados.
   - **Versionamento de objetos** ativado para manter o histórico de arquivos.

3. **Integração com Outros Serviços AWS**:
   - Este bucket será integrado às Lambdas de upload e processamento.

---

## Tecnologias

<p>
  <img src="https://img.shields.io/badge/AWS-232F3E?logo=amazonaws&logoColor=white" alt="AWS" />
  <img src="https://img.shields.io/badge/Terraform-7B42BC?logo=terraform&logoColor=white" alt="Terraform" />
  <img src="https://img.shields.io/badge/Amazon_S3-569A31?logo=amazons3&logoColor=white" alt="Amazon S3" />
  <img src="https://img.shields.io/badge/GitHub-ACTIONS-2088FF?logo=github-actions&logoColor=white" alt="GitHub Actions" />
</p>

---

## Estrutura do Repositório

```
infra/
├── main.tf            # Definição do bucket S3 com Terraform
├── outputs.tf         # Outputs, como ARN e nome do bucket
├── variables.tf       # Definições de variáveis Terraform
├── terraform.tfvars   # Variáveis específicas para o deploy
├── README.md          # Documentação do repositório
```

---

## Como Funciona

1. **Organização do Bucket S3**:
   - O bucket é configurado para organizar os arquivos de maneira lógica, separando uploads e arquivos processados por usuário e vídeo.

2. **Automação com Terraform**:
   - A infraestrutura do bucket é provisionada automaticamente pelo Terraform, garantindo segurança e consistência.

3. **Automação de Deploy**:
   - Este repositório utiliza o **GitHub Actions** para automatizar o deploy da infraestrutura.

---

## Passos para Configuração

### 1. Pré-Requisitos

Certifique-se de ter as credenciais da AWS configuradas corretamente e o **AWS CLI** instalado, além de ter o **Terraform** instalado para o deploy da infraestrutura.

### 2. Configuração do Bucket S3

1. No diretório **`infra-s3`**, configure o arquivo `terraform.tfvars` com os valores necessários, como o nome do bucket e a região:

```hcl
aws_region  = "us-east-1"
bucket_name = "video-frame-pro-s3"
environment = "prod"
```

2. Execute os comandos Terraform para provisionar o bucket S3:

```bash
cd infra-s3
terraform init
terraform apply -auto-approve
```

3. Verifique no Console AWS se o bucket foi criado corretamente, com as configurações de segurança e versionamento habilitadas.

---

## CI/CD com GitHub Actions

Este repositório utiliza o **GitHub Actions** para automação do deploy da infraestrutura com Terraform. O pipeline é acionado automaticamente ao realizar um push para o branch `main`.

O GitHub Actions irá:

- Executar o Terraform para provisionar o bucket S3.
- Validar as configurações Terraform antes de aplicar as mudanças.
- Garantir que o bucket está configurado corretamente em diferentes ambientes.


