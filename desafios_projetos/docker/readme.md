# Desafio de Projeto: Docker - Utilização Prática no Cenário de Microserviços
## Visão Geral

Este projeto demonstra uma aplicação web conteinerizada com balanceamento de carga utilizando Docker e Nginx. A configuração inclui uma aplicação PHP que se conecta a um banco de dados MySQL, com o Nginx configurado como balanceador de carga para distribuir o tráfego entre múltiplos servidores de aplicação.

## Componentes do Projeto

### 1. Balanceador de Carga Nginx (`nginx.conf`, `dockerflie`)

* Configurado para escutar na porta 4500
* Distribui o tráfego para três servidores backend (172.31.0.30, 172.31.0.53, 172.31.0.119)
* Estratégia simples de balanceamento em round-robin

### 2. Aplicação PHP (`index.php`)

* Exibe informações da versão do PHP
* Conecta-se a um banco de dados MySQL
* Gera dados aleatórios e os insere no banco
* Mostra o nome do host do servidor que atendeu a requisição

### 3. Esquema do Banco de Dados (`banco.sql`)

* Cria uma tabela chamada `dados` com a seguinte estrutura:

  * AlunoID (int)
  * Nome (varchar)
  * Sobrenome (varchar)
  * Endereço (varchar)
  * Cidade (varchar)
  * Host (varchar)

## Instruções de Configuração

### Pré-requisitos

* Docker e Docker Compose instalados
* Compreensão básica dos conceitos de conteinerização

### Construindo e Executando a Aplicação

1. **Construa o container do Nginx:**

   ```bash
   docker build -t nginx-load-balancer -f dockerflie .
   ```

2. **Configure o banco de dados MySQL:**

   ```bash
   # Execute um container MySQL
   docker run --name mysql-db -e MYSQL_ROOT_PASSWORD=Senha123 -d mysql:5.7

   # Crie o banco de dados e a tabela
   docker exec -i mysql-db mysql -uroot -pSenha123 -e "CREATE DATABASE meubanco;"
   docker exec -i mysql-db mysql -uroot -pSenha123 meubanco < banco.sql
   ```

3. **Execute os containers da aplicação PHP:**

   ```bash
   # Crie uma rede para os containers
   docker network create app-network

   # Execute múltiplos containers PHP
   docker run -d --name php-app1 --network app-network -v $(pwd)/index.php:/var/www/html/index.php php:7.4-apache
   docker run -d --name php-app2 --network app-network -v $(pwd)/index.php:/var/www/html/index.php php:7.4-apache
   docker run -d --name php-app3 --network app-network -v $(pwd)/index.php:/var/www/html/index.php php:7.4-apache
   ```

4. **Execute o balanceador de carga Nginx:**

   ```bash
   docker run -d --name load-balancer -p 4500:4500 --network app-network nginx-load-balancer
   ```

5. **Acesse a aplicação:**
   Abra seu navegador e acesse `http://localhost:4500`

## Arquitetura

```
                    ┌─────────────────┐
                    │                 │
                    │  Nginx (4500)   │
                    │ Balanceador de  │
                    │     Carga       │
                    │                 │
                    └────────┬────────┘
                             │
              ┌──────────────┼────────────────────────┐
              │              │                        │
    ┌─────────▼────────┐ ┌───▼────────────┐ ┌─────────▼────────┐
    │                  │ │                │ │                  │
    │ Servidor PHP 1   │ │ Servidor PHP 2 │ │ Servidor PHP 3   │
    │  172.31.0.30     │ │  172.31.0.53   │ │  172.31.0.119    │
    │                  │ │                │ │                  │
    └─────────┬────────┘ └───┬────────────┘ └─────────┬────────┘
              │              │                        │
              └──────────────┼────────────────────────┘
                             │
                    ┌────────▼─────────┐
                    │                  │
                    │ Banco de Dados   │
                    │     MySQL        │
                    │  54.234.157.77   │
                    │                  │
                    └──────────────────┘
```

