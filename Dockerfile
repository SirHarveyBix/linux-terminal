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
RUN useradd -m -s /bin/zsh admin

# Définissez un mot de passe pour le nouvel utilisateur
RUN echo "admin:admin" | chpasswd

# Ajoutez le nouvel utilisateur au groupe "sudo" s'il doit avoir des privilèges sudo
RUN usermod -aG sudo admin

# Créez un fichier pour autoriser les règles sudo
RUN echo "admin ALL=(ALL) ALL" >> /etc/sudoers.d/admin

# Copiez un fichier .zshrc par défaut depuis le répertoire source monté via le volume
COPY src/.zshrc /home/admin/.zshrc

# Copiez le script d'installation d'Oh-My-Zsh
COPY src/ohmyzsh-setup.sh /app/ohmyzsh-setup.sh

# Rendre le script exécutable
RUN chmod +x /app/ohmyzsh-setup.sh

# Exécutez le script pour installer Oh-My-Zsh & Nettoyer après l'exécution
RUN /app/ohmyzsh-setup.sh && rm /app/ohmyzsh-setup.sh

# Nettoyage du cache APT
RUN apt-get clean && apt-get autoremove

# Définissez l'utilisateur par défaut
USER admin

# Définissez le répertoire de travail par défaut
WORKDIR /app

# Exécutez Zsh au démarrage du conteneur
CMD ["zsh"]
