FROM ubuntu:latest

# Mise à jour du système et installation des outils nécessaires
RUN apt-get update -y && apt-get install -y \
  wget \
  vim \
  sudo \
  git \
  man \
  tree \
  htop \
  zsh

# Restaure contenu & packages présents dans la version complète d'Ubuntu
RUN sh -c yes | unminimize

# Créez un nouvel utilisateur
RUN useradd -m -s /bin/zsh utilisateur

# Définissez un mot de passe pour le nouvel utilisateur (remplacez "votre_mot_de_passe" par le mot de passe souhaité)
RUN echo "utilisateur:admin" | chpasswd

# Ajoutez le nouvel utilisateur au groupe "sudo" s'il doit avoir des privilèges sudo
RUN usermod -aG sudo utilisateur

# Créez un fichier pour autoriser les règles sudo
RUN echo "utilisateur ALL=(ALL) ALL" >> /etc/sudoers.d/utilisateur

# Ajouter les fichiers du script shell
ADD src/ohmyzsh-setup.sh /app/ohmyzsh-setup.sh

# Rendre le script exécutable
RUN chmod +x /app/ohmyzsh-setup.sh

# Exécuter le script
RUN /app/ohmyzsh-setup.sh

# Nettoyer après l'exécution du script
RUN rm /app/ohmyzsh-setup.sh

# Copiez un fichier .zshrc par défaut
COPY src/.zshrc /home/utilisateur/.zshrc

# Nettoyage du cache APT
RUN apt-get clean && apt-get autoremove

# Définissez le répertoire de travail par défaut
WORKDIR /app

# Exécutez Zsh au démarrage du conteneur avec le nouvel utilisateur
CMD ["sudo", "-u", "utilisateur", "zsh"]
