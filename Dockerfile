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
  gnupg \
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

# Créez un répertoire pour Visual Studio Code et extrayez l'archive
RUN mkdir -p /app/vscode && curl -L -o /app/vscode/vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-arm64" && dpkg -i /app/vscode/vscode.deb && rm /app/vscode/vscode.deb

# Copiez le fichier .zshrc avec des configurations par défaut
COPY /src/.zshrc /home/vscodeuser/.zshrc

# Créez un répertoire pour Visual Studio Code
RUN mkdir -p /app/vscode

# Créez un nouvel utilisateur non privilégié
RUN useradd -ms /bin/zsh vscodeuser

# Changer à l'utilisateur non privilégié
USER vscodeuser

# Définissez le répertoire de travail par défaut
WORKDIR /app

# Exécutez Zsh au démarrage du conteneur
CMD ["zsh"]