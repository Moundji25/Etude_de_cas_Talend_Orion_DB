# Groupe 6 :

Team : 
- Hajar EL HAFA 
- Meryem OUJA 
- Moundji BELHANNACHI 
- Nada BEN BRAHIM 
- Reda KAMEL 
- Wilfried KAMAHA MONKAM

# Description du contenu
- Dossier "Job_in_CLI_scheduled" : Solution 1 : qui regroupe des dossier contenant les dépendances et executables (fichier .jar , .sh, .ps1, .bat ...) nécessaire à l'execution des Jobs sur la ligne de commande.

remarque 1 : le fichier "schedule_talend_job.ps1" permet de planifier l'execution des Jobs (chaque jours à 23h06).
remarque 2 : cette solution se base sur le faite qu'une base de données MYSQL est déja disponible.

- Dossier "Job_in_Container" : Solution 2 : qui regroupe des dossier et fichiers nécessaires (docker_compose.yml, DockerFile , Main_Job_0.1.zip, schema.sql) au deploiment et éxecution des Jobs via des conteneurs Docker.

- Dossier ETUDE_DE_CAS_TALEND : ce dossier regroupe le projet en entier est permet de l'importer via 'Talend data integration studio'  

# Comment éxecuter
- importer le projet dans le local avec 'git clone' 
- Si le Job ne s'execute pas sur les deux versions (incompatibilité, ... ) alors est il possible d'importer le projet ETUDE_DE_CAS_TALEND avec 'Talend data integration studio' et modifier le contexte ou autres données de configuration.
- Afin d'avoir une execution sans erreurs (fichiers non reconnues) les fichiers de données (fichiers présent dans le dossier 'Job_in_CLI_scheduled/Data' .txt et .csv, .xlsx) doit impérativement etre présents dans ce dossier 'C:\ETUDE_DE_CAS_TALEND\Data"
- Dans la premiére solution via la ligne de commande pour lancer les Job il suffit de se positionner dans le dossier "Job_in_CLI_and_scheduled/Main_Job" puis d'executer un des fichiers ./Main_Job_run.ps1 ou ./Main_Job_run.sh ou ./Main_Job_run.bat selon votre préférence
- Dans la deuxiéme solution dans le dossier "Job_in_Container" la création de la base de données + le lancement des jobs Talend ce fait via ses commandes :
          ```
          docker build -t talend-job:latest .
          ```
          ```
          docker compose up -d --build
          ```
- remarque si un des ficheirs ne s'execute pas veuillez lui donnez les droits avec cette commande "chmod +x Main_Job_run.*" 
- Afin de répondre à des besoins BI en se basant sur la BD MYSQL proposé il est possible de la connecter sur l'outil POWER BI pour des visualisations avancées. 
