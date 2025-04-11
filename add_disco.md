## **Passo 1: Listar os discos disponíveis**
Antes de criar a partição, verifique os discos conectados ao sistema:

```bash
lsblk
```
ou  
```bash
fdisk -l
```

---

## **Passo 2: Iniciar o `fdisk` no disco `/dev/sdb`**
Abra o `fdisk` para gerenciar as partições:

```bash
fdisk /dev/sdb
```

Dentro do menu interativo do `fdisk`, siga os passos abaixo:

1. **Criar uma nova partição:**
   - Pressione **`n`** (new partition).
   - Escolha **`p`** (primary partition).
   - Pressione **Enter** para aceitar o número da partição (normalmente `1`).
   - Pressione **Enter** para aceitar o primeiro setor padrão.
   - Pressione **Enter** novamente para usar todo o espaço disponível (ou defina um tamanho específico, como `+20G` para 20 GB).

2. **Verifique a partição criada** (opcional):
   - Pressione **`p`** para listar as partições e conferir a configuração.

3. **Salvar e sair**:
   - Pressione **`w`** para gravar as mudanças e sair.

---


## **Passo 3: Formatar a partição como `ext4`**
Para formatar a partição recém-criada, use:

```bash
mkfs.ext4 /dev/sdb1
```


## **Passo 4: Criar um diretório para a montagem**
Crie o ponto de montagem `/disco2`:

```bash
mkdir -p /disco2
```

---

## **Passo 5: Montar manualmente a partição**
Monte a partição para testá-la:

```bash
mount /dev/sdb1 /disco2
```

---

## **Passo 6: Configurar montagem automática no `/etc/fstab`**
Para garantir que o disco seja montado automaticamente na reinicialização, edite o `/etc/fstab`:

```bash
nano /etc/fstab
```

Adicione a seguinte linha no final do arquivo:

```
/dev/sdb /disco2 ext4 defaults 0 0
```

---

## **Passo 8: Testar a configuração**
Para testar sem reiniciar, execute:

```bash
mount -a
```

Se não houver erros, significa que tudo foi configurado corretamente.

Agora, seu disco `/dev/sdb1` será montado automaticamente em `/disco2` sempre que o sistema for inicializado. 🚀