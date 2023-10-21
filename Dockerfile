# Utilisez une image de base compatible ARM64
FROM arm64v8/ubuntu:latest

# Mise à jour du système et installation des outils nécessaires
RUN apt-get update -y && \
  apt-get install -y \
  wget \
  vim \
  sudo \
  curl \
  libxss1 \
  libgconf-2-4 \
  libnss3 \
  libasound2 \
  git -y \
  zsh -y \
  libatk-bridge2.0-0 \
  libatk1.0-0 \
  libatspi2.0-0 \
  libcairo2 \
  libdrm2 \
  libgbm1 \
  libgtk-3-0 \
  libpango-1.0-0 \
  libxcomposite1 \
  libxdamage1 \
  libxfixes3 \
  libxkbcommon0 \
  libxkbfile1 \
  libxrandr2 \
  xdg-utils

# Ajout de Oh-My-Zsh
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Installez code-server en tant qu'utilisateur root
USER root
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Créez un nouvel utilisateur non privilégié (par exemple, "appuser")
RUN useradd -ms /bin/zsh appuser

# Ajoutez "appuser" au groupe sudo pour lui donner des privilèges sudo
RUN usermod -aG sudo appuser

# Changez à l'utilisateur non privilégié
USER appuser

# Créez un répertoire .config avec les bonnes permissions
RUN mkdir -p /home/appuser/.config

# Créez un répertoire .local avec les bonnes permissions
RUN mkdir -p /home/appuser/.local

# Téléchargez et installez Visual Studio Code dans le répertoire de l'utilisateur
RUN wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-arm64" -O /home/appuser/vscode.deb
RUN dpkg -i /home/appuser/vscode.deb
RUN rm /home/appuser/vscode.deb

# Copiez le fichier .zshrc avec des configurations par défaut
COPY /src/.zshrc /home/appuser/.zshrc

# Définissez le répertoire de travail par défaut
WORKDIR /home/appuser

# Exécutez Zsh au démarrage du conteneur
CMD ["zsh"]


# Utilisez une image Docker contenant déjà Visual Studio Code
FROM codercom/code-server:latest

# Définissez un utilisateur non privilégié (vous pouvez modifier l'utilisateur selon vos besoins)
USER coder

# Laissez le conteneur en cours d'exécution
CMD ["--auth", "none"]
