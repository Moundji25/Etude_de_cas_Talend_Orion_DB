# Utilise une image de base avec Java 1.8
FROM openjdk:8-jdk

# Définir le répertoire de travail
WORKDIR /ETUDE_DE_CAS_TALEND

# Copier le job Talend exporté dans le conteneur
COPY Main_Job_0.1.zip /ETUDE_DE_CAS_TALEND/Main_Job_0.1.zip

# Copier tout le dossier Data dans le conteneur
COPY Data /ETUDE_DE_CAS_TALEND/Data

# Installer unzip pour décompresser le job
RUN apt-get update && apt-get install -y unzip

# Décompresser le job Talend
RUN unzip Main_Job_0.1.zip -d /ETUDE_DE_CAS_TALEND/job

# Assurez-vous que le script exécutable est exécutable
RUN chmod +x /ETUDE_DE_CAS_TALEND/job/Main_Job/Main_Job_run.sh

# Définir la commande d'exécution du job Talend
CMD ["/ETUDE_DE_CAS_TALEND/job/Main_Job/Main_Job_run.sh"]


