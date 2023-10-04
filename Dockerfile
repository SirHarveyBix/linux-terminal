FROM ubuntu:latest

# Mettre à jour le système et installer les outils nécessaires
RUN apt-get update -y && \
  apt-get install -y \
  vim \
  && apt-get clean

# Définir le répertoire de travail par défaut
WORKDIR /app

# Commande par défaut pour le conteneur
CMD ["bash"]
