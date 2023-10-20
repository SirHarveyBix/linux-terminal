FROM ubuntu:latest

# Mettre à jour le système et installer les outils nécessaires
RUN apt-get update -y && \
  apt-get install -y \
  wget \
  vim \
  sudo \
  git -y \
  zsh -y \
  && apt-get clean

# ajout de oh-my-zsh
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" 

# Définir le répertoire de travail par défaut
WORKDIR /app

# Commande par défaut pour le conteneur
CMD ["zsh"]
