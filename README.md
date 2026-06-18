# docker-php-setup

Base simples para subir projetos Laravel com PHP-FPM, Nginx e Postgres.

## O que este setup cobre

- PHP 8.4 FPM
- Composer dentro do container `app`
- Nginx apontando para `public/`
- Postgres 16

## Como usar com Laravel

1. Coloque os arquivos do seu projeto Laravel na raiz onde este setup sera usado.
2. Suba os containers:

```bash
docker compose up -d --build
```

3. Instale dependencias e inicialize a aplicacao:

```bash
./compose-run
```

4. Acesse:

```text
http://localhost:8090
```

## Observacoes

- O projeto e montado por volume em `/var/www`, entao o `vendor/` deve ser gerado no volume montado, nao durante o build da imagem.
- Se o projeto usar Vite, adicione um servico Node separado ou rode `npm install && npm run dev` fora deste setup.
