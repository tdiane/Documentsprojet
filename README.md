# Documentsprojet

# Documents permettant d'automatiser le pipeline de déploiement

# Sur Ubuntu : créer un répertoire glassfish et y transférer les fichiers Dockerfile et docker-entrypoint.sh 
# Accorder les droits : chmod +x docker-entrypoint.sh
# Construire le docker : docker build -t glassfish .
# Exécuter le docker : docker run -name glassfish -d -p 4848:4848 -p 81:8080 -p 8181:8181 -v autodeploy:/glassfish5/glassfish/domains/domain1/autodeploy glassfish

# Installer Jenkins :  docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home --name jenkins jenkins/jenkins:lts

# Installer Ansible sur Jenkins :
# docker exec -it -u root jenkins bash
# apt update 
# apt install vim ansible sshpass

# Définir l'inventaire d'Ansible (appelé [production] avec l'adresse IP d'Ubuntu)

# Transférer le playbook Ansible glassfish.yml

# Configurer Jenkins avec le lien du GitHub et une action Build "Invoke Ansible Playbook" avec le lien glassfish.yml

# Lancer un build

# Se connecter au serveur GlassFish et faire "Launch" 




