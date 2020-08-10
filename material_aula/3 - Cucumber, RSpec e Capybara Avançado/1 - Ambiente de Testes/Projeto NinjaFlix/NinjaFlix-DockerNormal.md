# Ninjanflix Setup com Docker Normal

Bem-vindo ao guia de preparação de Ambiente do Ninjanflix

## Crie uma Rede Docker

```bash
docker network create --driver bridge skynet
````

## Banco de Dados

### Download das Imagens
````bash
docker pull postgres
docker pull dpage/pgadmin4
```

### Servidor do Banco de Dados
````bash
docker run --name pgdb --network=skynet -e "POSTGRES_PASSWORD=qaninja" -p 5432:5432 -v var/lib/postgresql/data -d postgres
```

### Administrador do Banco de dados

```bash
docker run --name pgadmin --network=skynet -p 15432:80 -e "PGADMIN_DEFAULT_EMAIL=root@qaninja.io" -e "PGADMIN_DEFAULT_PASSWORD=qaninja" -d dpage/pgadmin4
```


### Criação da Base de Dados

* Logue no PGADMIN [http://127.0.0.1:15432]
user: root@qaninja.io
pass: qaninja
* Crie uma conexão com o servidor pgdb
* Crie uma base de dados com o nome ninjaflix


## Publicando o Backend

### Download das Imagens

```bash
docker pull qaninja/nflix-api
```

### Colocando a API no Ar

```bash
docker run --name nflix-api --network=skynet -e "DATABASE=pgdb" -p 3000:3000 -d qaninja/nflix-api
```

* Veja se a API está online [http://127.0.0.1:3000]


## Publicando o Frontend

### Download das Imagens

```bash
docker pull qaninja/nflix-web
```

### Colocando a WebApp no ar 

```bash
docker run --name nflix-web --network=skynet -p 8080:8080 -e "VUE_APP_API=http://127.0.0.1:3000" -d qaninja/nflix-web
```

* Veja se a WebApp está online [http://127.0.0.1:8080]

## Criando o usuário Admin

* Instale o Postman [https://www.postman.com/downloads/]
* Acesse a Documentação da API [http://127.0.0.1:3000/apidoc]
* Crie um novo usuário enviando um POST na rota /user  da API
* Acesse a WebApp [http://127.0.0.1:8080]
* Faça login

## Subindo os containers

```bash
docker start pgdb
docker start pgadmin
docker start nflix-api
docker start nflix-web
```

## Parando os containers

```bash
docker stop pgdb
docker stop pgadmin
docker stop nflix-api
docker stop nflix-web
```

## Comandos Docker

```bash
# removendo um container
docker rm nome_ou_id_do_container

# removendo na marra
docker rm nome_ou_id_do_container -f

# listando containers
docker ps

# listando container parados
docker ps -a

# listando imagens
docker images

# removendo uma imagem
docker rmi nome_ou_id_da_imagem

# removendo uma imagem com ignorância
docker rmi nome_ou_id_da_imagem -f
```

Enjoy