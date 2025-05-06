# Desafios e Projetos - Bootcamp Santander Linux

Este diretório contém os projetos práticos desenvolvidos durante o Bootcamp Santander Linux. Cada subdiretório representa um desafio específico com sua documentação em arquivos Markdown (`.md`).

## Estrutura do Diretório


### 1. [Gerenciamento](./desafios_projetos/gerenciamento/)
**Arquivo:** [readme.md](./desafios_projetos/gerenciamento/readme.md)

Script de automação para gerenciamento de usuários, diretórios e permissões no Linux:
- Criação de grupos de usuários (Administrativo, Vendas, Segurança)
- Estruturação de diretórios com permissões específicas
- Criação e atribuição de usuários a grupos apropriados
- Configuração de políticas de acesso baseadas em grupos

Este projeto demonstra boas práticas de administração de sistemas Linux através de automação com shell script.

### 2. [Webserver](./desafios_projetos/webserver/)
**Arquivo:** [readme.md](./desafios_projetos/webserver/readme.md)

Implementação de Infrastructure as Code (IaC) para configuração automatizada de servidor web:
- Instalação e configuração do Apache2
- Gerenciamento de usuários e permissões
- Implantação automatizada de conteúdo web
- Atualizações de sistema e pacotes

O projeto ilustra como utilizar scripts de automação para garantir implantações consistentes e reproduzíveis de infraestrutura de servidores web.

### 3. [Docker](./desafios_projetos/docker/)
**Arquivo:** [readme.md](./desafios_projetos/docker/readme.md)

Projeto prático de implementação de microserviços utilizando Docker, incluindo:
- Balanceamento de carga com Nginx
- Aplicação PHP conectada a banco de dados MySQL
- Configuração de múltiplos containers em rede
- Arquivos de configuração e scripts de inicialização

O projeto demonstra uma arquitetura completa com balanceador de carga distribuindo tráfego entre três servidores de aplicação PHP, todos conectados a um banco de dados MySQL.
## Como Utilizar

Cada projeto contém instruções detalhadas em seu respectivo arquivo README.md, incluindo:
- Pré-requisitos
- Instruções de instalação e configuração
- Comandos para execução
- Explicação da arquitetura e componentes

Para executar os scripts, geralmente é necessário:

```bash
# Conceder permissão de execução
chmod +x nome_do_script.sh

# Executar o script (muitos requerem privilégios de administrador)
sudo ./nome_do_script.sh
```

## Tecnologias Abordadas

- Linux (administração de sistemas)
- Shell Scripting (Bash)
- Docker e Containerização
- Nginx (balanceamento de carga)
- Apache (servidor web)
- MySQL (banco de dados)
- PHP (linguagem de programação web)
- Infrastructure as Code (IaC)
- Gerenciamento de usuários e permissões