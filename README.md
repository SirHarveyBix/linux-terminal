# First of all: Launch linux

si tu n'a pas accès a linux, pas besoin de l'installer.
il te faut docker et lancer la commande :

1.
    ```shell
    docker build -t linux .
    ```

2.
     ```shell
     docker run -it --name=linux -v ./src/:/app --rm linux
     ```
    
    ouvre un nouveeu terminal, run :

     ```shell
     docker exec -it linux /bin/zsh
     ```
     pour trouver le mot de passe

pour quitter linux ouvre un nouveau terminal / onglet et lance la commande :

3.
      ```shell
      docker stop linux
      ```