FROM ubuntu:latest

# Mise à jour du système et installation des outils nécessaires
RUN apt-get update -y && apt-get install -y \
  wget \
  vim \
  sudo \
  git \
  zsh

# Ajout de Oh-My-Zsh
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Nettoyage du cache APT
RUN apt-get clean

# Définissez le répertoire de travail par défaut
WORKDIR /app

# Exécutez Zsh au démarrage du conteneur
CMD ["zsh"]