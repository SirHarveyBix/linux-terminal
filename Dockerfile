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

# Ajout de Oh-My-Zsh
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Restaure contenu & packages present dans la version complete de Ubuntu 
RUN sh -c yes | unminimize

# Nettoyage du cache APT
RUN apt-get clean && apt-get autoremove

# Définissez le répertoire de travail par défaut
WORKDIR /app

# Exécutez Zsh au démarrage du conteneur
CMD ["zsh"]