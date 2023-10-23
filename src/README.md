# CLI linux

## SSH

Creer ton instance & essaie de te connecter a cette adresse :
<https://labs.play-with-docker.com/>

par defaut `ssh` utilise le port (_`-p 22`_) 22

---

il nous faut une clé pour se connecter :

ou peu creer une clé de cette maniere :

- `ssh-keygen`
  - tu peux utiliser ce chemin: `./id_rsa`

ou alors il faudra récupérer nos clés (publique et privé :  `id_rsa.pub` & `id_rsa` ) depuis notre sandbox:

- `cd ~/.ssh`, et recuperer: __`id_rsa`__ & __`id_rsa.pub`__

>peu importe l'origine de la clé, il faudra qu'elles soient identique, sinon : __`Permission denied (publickey).`__

les copiers dans le dossier src _(`/app` de notre container linux)_, et lancer la commande :

```shell
ssh [USER]@direct.labs.play-with-docker.com -i id_rsa
# -i identity_file
```

> _il s'agit bien de la clé privé._
