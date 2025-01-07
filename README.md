# infra-s3-video-frame-pro-storage

Este repositório é responsável pela configuração dos **Buckets do S3** para armazenar os vídeos enviados pelos usuários e os arquivos ZIP gerados após o processamento.

## Funções
- Criar e configurar os **Buckets S3** para armazenar vídeos e arquivos processados.
- Garantir que os buckets estejam corretamente configurados para os acessos do **Lambda** e **API Gateway**.

## Tecnologias
- AWS S3

## Como usar
1. Configure o ambiente para os buckets S3.
2. Execute os scripts para provisionar os buckets necessários.
3. Conceda as permissões necessárias para o **Lambda** e o **API Gateway** acessarem os buckets.
