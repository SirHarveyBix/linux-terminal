# First of all: Launch linux

si tu n'a pas accès a linux, pas besoin de l'installer.
il te faut docker et lancer la commande :

1. `docker build -t linux .`,
2. `docker run -it --name=linux -v ./src/:/app --rm linux`

pour quitter linux ouvre un nouveau terminal / onglet et lance la commande :

3. `docker stop linux`

pour relancer, il te faut refaire la commane 2:

4. `docker run -it --name=linux -v ./src/:/app --rm linux`

 <details close><summary><i>+ sur docker</i></summary>

pour afficher les container en cours:

1. `docker container ls -a`

pour tuer tout les containers :

2. `docker container prune -a`

ou uniquement _linux_ :

3. `docker container rm linux`

meme chose pour l'image :

- `docker images`
- `docker image rm [IMAGE ID]`
ou :
- `docker image prune -a` _`-a` pour supprimer toutes les images_

ton system sera plus clean
  </details>
