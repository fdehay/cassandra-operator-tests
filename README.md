# Cassandra Operators Tests

## Contenu

### Dossier Casskop-Rick

Ce dossier contient l'ensemble des tests Kuttl à faire tourner sur Rickaastley.  
IL y a pour l'instant le test de Scale Up/Down et celui du Backup / Restore.  

### Rickaastley-Specific-Config

Ce dossier contient l'ensembles des ressources (YAML) nécessaires pour faire tourner correctement l'opérateur sur Rick via un namespace vierge.  
Il contient les Network Policies (Casskop & Icarus), la config d'injection du CaCert (Pod Preset + ConfigMap "secret") et enfin le secret.  
Le secret doit être utilisé, comme dans le flux Kuttl du Backup & Restore, en spécifiant au préalable les variables `$S3_ID` et `S3_KEY` (récupérés depuis le panel admin du [bucket S3](https://zone2.s3.orangeportails.net/_/s3browser/) pour l'utilisateur `Kuttl` [ici](https://zone2.s3dfy.si.francetelecom.fr/_/console/users)). Une fois cela fait, on peut l'apply via un : `./rickaastley-specific-config/secret-s3.yaml.sh | kubectl apply -f -` (pensez à `chmod +x` le script avant).  

### Kuttl

L'exécutable Kuttl présent dans le répertoire `casskop-rick` est forké depuis le Kuttl officielle mais avec une modification du comportement de récupération du Service Account (de base sur le namespace `default` même si le namespace est spécifié). Il est utilise dans le Makefile pour le lancement des tests sur Rick.   


### Makefile

Lance le test passé en paramètre sur Rick en utilisant l'exec kuttl du dossier de casskop-rick.

### Gitlab

Il setup le pipeline et lance les tests de manières séquentielles (pour Rick) afin de ne pas avoir de collisions sur le namespace utilisé (`casskop-cassandra-e2e`).

## TODOS

- Voir si le passage du namespace dans la commande de cassandra stress via `namespaced: true` est faisable dans le fichier `01-backup.yaml` (déjà try sans succès)
- Mettre en place un assert du nombre de rows avant/après le restore pour vérifier s'il a bien restoré correctement
- Utiliser l'image proxyfié de Icarus au lieu de la "custom" sur le répo Docker du projet
- Voir pour proxyfier également le répertoir des charts Helm Orange
- Voir le problème de cassandra stress sur 2 noeuds avec 2 réplications qui échoue si 512Mi de RAM
- Faire la config GKE

Bisou :)