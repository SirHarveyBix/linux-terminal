# CLI linux

## SSH

Creer ton instance & essaie de te connecter a cette adresse :
<https://labs.play-with-docker.com/>

*par defaut `ssh` utilise le port (*`-p 22`*) 22*

---

il nous faut une clé pour se connecter :

ou peu creer une clé de cette maniere :

- `ssh-keygen`
  - tu peux utiliser ce chemin: `./id_rsa`

ou alors il faudra récupérer nos clés (publique et privé :  `id_rsa.pub` & `id_rsa` ) depuis notre sandbox:

- `cd ~/.ssh`, et recuperer: **`id_rsa`** & **`id_rsa.pub`**

>peu importe l'origine de la clé, il faudra qu'elles soient identique, sinon:
**`Permission denied (publickey).`**

les copiers dans le dossier *`/src`* *(`/app` de notre container linux)*, et lancer la commande :

```shell
ssh [USER]@direct.labs.play-with-docker.com -i id_rsa
# -i identity_file
```

> *il s'agit bien de la clé privé.*

---

## `chmod`: droits d'accès & permissions

`chmod` => **ch***ange* **mod** *bits* (changer droit d'accès)

- ajouter des droits: `+x`, `+w`, `+r`
- supprimer des droits: `-x`, `-w`, `-r`
- (**`x`**: *execute*,**`r`**: *read*, **`w`**: *write*)

`chown` => **ch***ange* **own***er*
`chgrp` => **ch***ange* **gr***ou***p**

### exemple d'ajout de droits

`chmod u+x nom_dossier` : donnera accès aux utilisateurs  a `nom_dossier`

- `u`=> users
- `g`=> group *(peu utilisé)*
- `o`=> others *(peu utilisé)*
- `a`=> all *(peu utilisé)*

`chmod u+rwx,g+rx-w,o+r-wx nom_dossier`

>- ajoute touts les droits a **u**sers (**r**ead, **w**rite & e**x**ecute)
>- ajoute les droits: **r**ead & e**x**ecute, supprime le droit **w**rite a **g**roup
>- ajoute **r**ead & supprime **w**rite & e**x**ecute a **o**thers
