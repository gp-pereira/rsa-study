# RSA
Esse projeto implementa uma versão simplificada do algoritmo de encriptação RSA.

## Como executar

1. Use o [docker](https://www.docker.com/products/docker-desktop/) para gerar uma imagem da aplicação e em seguida execute a shell interativa do elixir<sup>*</sup>.

```bash
docker build -t rsa .
docker run -it --rm rsa iex -S mix
```

2. Gere um novo par de chaves.

```elixir
iex(1)> keys = RSA.Keys.generate()
%{private_key: {939047, 763397}, public_key: {939047, 293}}
```

3. Use as chaves para encriptar e decriptar um texto.

```elixir
iex(2)> encrypted = RSA.encrypt_message("HELLOWORLD", keys.public_key)
"206612112083155278155084"
iex(3)> decrypted = RSA.decrypt_message(encrypted, keys.private_key)
"HELLOWORLD"
```

<sup>*</sup> Através da shell interativa, é possível acessar todo o código da aplicação como exemplificado acima. Você pode usar `TAB` para receber ajuda do autocomplete. Para facilitar a exploração do código, recomendamos executar os comandos no terminal integrado da IDE.

## Autores
- Gabriel Pereira - 95848
- Fabiano Gomes - 93433