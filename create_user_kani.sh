#!/bin/bash

# Chemins vers les fichiers de votre projet Ansible
INVENTORY_FILE="hosts_root"
PLAYBOOK_FILE="create_user_kani.yml"
VARS_FILE="vars.yml"
VAULT_PWD_FILE="vault_password.txt"

# Vérifiez que les fichiers nécessaires existent
if [[ ! -f "$INVENTORY_FILE" ]]; then
  echo "Le fichier d'inventaire $INVENTORY_FILE est introuvable."
  exit 1
fi

if [[ ! -f "$PLAYBOOK_FILE" ]]; then
  echo "Le fichier playbook $PLAYBOOK_FILE est introuvable."
  exit 1
fi

if [[ ! -f "$VARS_FILE" ]]; then
  echo "Le fichier des variables $VARS_FILE est introuvable."
  exit 1
fi

# Exécution du playbook Ansible
echo "Exécution du playbook Ansible..."
ansible-playbook -i "$INVENTORY_FILE" "$PLAYBOOK_FILE" --vault-password-file "$VAULT_PWD_FILE"

# Afficher un message de succès
if [[ $? -eq 0 ]]; then
  echo "Le playbook a été exécuté avec succès."
else
  echo "Une erreur est survenue lors de l'exécution du playbook."
fi
