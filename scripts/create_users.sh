#!/bin/bash

echo "Criado Grupo GRP_ADM"
groupadd GRP_ADM

echo "Criando usuários do sistema e para o grupo GRP_ADM..."

useradd guest10 -c "Usuário convidado" -s /bin/bash -m -p $(openssl passwd 1234) -G GRP_ADM
passwd guest10 -e

useradd guest11 -c "Usuário convidado" -s /bin/bash -m -p $(openssl passwd 1234) -G GRP_ADM
passwd guest11 -e

useradd guest12 -c "Usuário convidado" -s /bin/bash -m -p $(openssl passwd 1234) -G GRP_ADM
passwd guest12 -e

useradd guest13 -c "Usuário convidado" -s /bin/bash -m -p $(openssl passwd 1234) -G GRP_ADM
passwd guest13 -e

echo "Finalizado!!"