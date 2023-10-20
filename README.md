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
    # docker run -it --name=linux -v ./src/:/app -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --rm linux
     ```

pour quitter linux ouvre un nouveau terminal / onglet et lance la commande :

3.
      ```shell
      docker stop linux
      ```

pour relancer, il te faut refaire la commane 2:

4.
      ```shell
     docker run -it --name=linux -v ./src/:/app --rm linux
     ```

 <details close><summary><i>+ sur docker</i></summary>

 ou plus simplement :

 ```shell
 docker run -it ubuntu
 ```
 > il faudra stoper le container en recuperant son nom (`docker container ls`), et aucun volume ne sera alouable.

pour afficher les container en cours:

1.
      ```shell
      docker container ls -a
      ```

pour tuer tout les containers :

2.
      ```shell
      docker container prune -a
      ```

ou uniquement _linux_ :

3.
      ```shell
      docker container rm linux
      ```

meme chose pour l'image :

- 
    ```shell
    docker images
    ```

-
    ```shell
    docker image rm [IMAGE ID]
    ```

ou :

-
    ```shell
    docker image prune -a
    ```

    _`-a` pour supprimer toutes les images_

ton system sera plus clean.
  </details>
