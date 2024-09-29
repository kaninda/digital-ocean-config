# digital-ocean-config

## Configuration Droplet avec user: kani

### Prerequis
- Creer une Droplet dans Digital Ocean
- Creer un user root
- Generer une clé publique ssh (ex: machine-aka.pub)
- Renseigner l'adresse IP du Droplet dans le host

### Vault
- Definir un mot pass pour vault dans un fichier vault_password
```shell
echo "XXXXXXX" > vault_password.txt
```
- Encrypter le mot de pass du user dans le fichier vault.yml
```shell
ansible-vault create vault.yml --encrypt-vault-id default --vault-password-file vault_password.txt
```
### Test Connection
- Faire un test de connection avec le nouveau user cree
```shell
ssh kani@XXXXXXXXX
```

