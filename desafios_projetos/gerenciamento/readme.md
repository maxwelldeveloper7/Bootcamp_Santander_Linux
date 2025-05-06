## Script de Gerenciamento de Usuários, Diretórios e Permissões no Linux  

### Visão Geral  
Este script shell demonstra a automação de tarefas administrativas no sistema Linux, com foco na gestão de usuários, criação de diretórios e configuração de permissões. Ele faz parte do desafio do Projeto Linux da DIO.  

### Funcionalidade do Script  

O script executa as seguintes operações:  

1. **Criação de Grupos de Usuários**  
   - Cria grupos de usuários para diferentes departamentos:  
     - **GRP_ADM** (Administrativo)  
     - **GRP_VEN** (Vendas)  
     - **GRP_SEC** (Segurança)  

2. **Estrutura de Diretórios**  
   - Cria os seguintes diretórios:  
     - **/publico** (Acesso público)  
     - **/adm** (Departamento Administrativo)  
     - **/ven** (Departamento de Vendas)  
     - **/sec** (Departamento de Segurança)  

3. **Criação de Usuários**  
   - Cria usuários e os atribui a grupos específicos:  
     - **Usuários Administrativos:** carlos, maria, joao  
     - **Usuários de Vendas:** debora, sebastiana, roberto  
     - **Usuários de Segurança:** josefina, amanda, rogerio  

4. **Configuração de Permissões**  
   - Define permissões específicas para cada diretório:  
     - **/publico:** Acesso de leitura e escrita para todos os usuários (777)  
     - **/adm:** Acesso restrito ao root e aos membros do **GRP_ADM**  
     - **/ven:** Acesso restrito ao root e aos membros do **GRP_VEN**  
     - **/sec:** Acesso restrito ao root e aos membros do **GRP_SEC**  

### Uso  

```bash
# Conceder permissão de execução ao script
chmod +x usuarios_diretorios_permissoes.sh  

# Executar o script como root ou com sudo
sudo ./usuarios_diretorios_permissoes.sh  
```
