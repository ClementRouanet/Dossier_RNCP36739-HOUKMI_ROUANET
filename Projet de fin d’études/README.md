# Projet de Fin d'Étude

## EFREI PARIS <br> Mastère Data Engineering & AI 

### Bloc de Compétences 1 & 2 & 3 & 4 & 5

HOUKMI Salaheddine  
ROUANET Clément  

<br>

## Sujet

### Le Projet :
Notre initiative vise à implémenter et optimiser des solutions de stockage et de traitement de données sur le cloud, axées sur un objectif principal : **Trouver le "produit gagnant" et les emplacements stratégiques pour les publicités à partir du dataset de la plateforme de e-commerce brésilienne Olist**.  
Pour démarrer un business en ligne, surtout dans le e-commerce, on commence par chercher une niche rentable en essayant de vendre plusieurs produits et en observant les résultats de chacun. Une fois le produit gagnant identifié, on lance nos publicités dans une région bien déterminée, en procédant également par essais. Toutes ces démarches nécessitent un grand budget.

### L'Objectif :
Notre objectif dans ce projet est de créer une solution de machine learning capable de prédire le produit gagnant en se basant sur plusieurs indicateurs tels que les ventes par catégories, les moyens de paiement, les avis et retours clients, etc., ainsi que de déterminer la région cible pour nos publicités, le tout sans nécessiter un grand budget. De plus, pour la création de notre boutique e-commerce, nous devons spécifier les moyens de paiement, ce qui représente un grand défi pour les professionnels du domaine. C’est pourquoi nous avons également décidé d’identifier les moyens de paiement les plus utilisés par région.

<br>

## Contenu du GIT

1. Dossier ***Donnees - S3*** :  
   - ***input_data*** : fichiers CSV & JSON téléchargé sur Kaggle, à l'adresse suivante https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce,
   - ***input_data*** : fichiers CSV résultants de l'exécution de la Step Functions.

<br>

2. Dossier ***Jobs - Glue*** : dossier contenant tous les Jobs Glue, au format JSON, créés pour charger les données brutes dans les bases de données RDS et DynamoDB.
  
<br>

3. Dossier ***Preprocessing - Glue*** : dossier contenant le NoteBook PySpark qui a permis de réaliser le pretraitement des données brutes.
  
<br>

4. Dossier ***Regression & docker - ECR & ECS*** :
   - ***DockerFile*** : fichier Docker permettant de créer une image Docker,
   - ***linear_regression*** : fichiers PySpark permettant de réaliser la prédiction des ventes,
   - ***pfe-grp6-task.json*** : fichier JSON de la tâche créé pour le cluster ECS,
   - ***requirements.txt*** : fichier texte contenant les dépendances Python à installer lors de la création du conteneur Docker.
  
<br>

5. Dossier ***SQL - RDS*** : dossier contenant les scripts SQL qui permettent de créer les tables dans la base de données Amazon RDS.
  
<br>

6. Dossier ***Step Functions*** : dossier contenant l'implémentation de la Step Functions, au format JSON.
  
<br>

7. Dossier ***Tableau*** : dossier contenant le DasBoard Tableau permettant de répondre à la problématique.
  
<br>

8. Le ***Rapport PFE*** : regroupe toutes les étapes du projet, ainsi que le modèle conceptuel de données et le schéma d’architecture.
   

