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
%{private_key: {348247331, 40647289}, public_key: {348247331, 19609}}
```

3. Use as chaves para encriptar e decriptar um texto.

```elixir
iex(2)> encrypted = RSA.encrypt_message("HELLOWORLD", keys.public_key)
"206612112083155278155084"
iex(3)> decrypted = RSA.decrypt_message(encrypted, keys.private_key)
"HELLOWORLDXX"
```
4. Também é possível assinar e verificar assinaturas.

```elixir
iex(2)> signature = "MYSIGNATURE"
"MYSIGNATURE"
iex(3)> s = RSA.Signature.create(signature, keys.private_key)
"003239756140240865201800896"
iex(4)> RSA.Signature.verify(s, signature, keys.public_key)
:ok
iex(5)> RSA.Signature.verify("192819829128198219", signature, keys.public_key)
:error
```

<sup>*</sup> Através da shell interativa, é possível acessar todo o código da aplicação como exemplificado acima. Você pode usar `TAB` para receber ajuda do autocomplete. Para facilitar a exploração do código, recomendamos executar os comandos no terminal integrado da IDE.

## Autores
- Gabriel Pereira - 95848
- Fabiano Gomes - 93433