# Projet Data Engineering on Cloud

## EFREI PARIS <br> Mastère Data Engineering & AI 

### Bloc de Compétences 3

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

1. Dossier ***Data*** :  
   - ***Raw data*** : fichiers CSV téléchargé sur Kaggle, à l'adresse suivante https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce,
   - ***Cleaned data*** : fichiers parquets résultants du preprocessing, à l'aide d'un notebook python,
   - ***Linear regression*** : prédiction des prix des catégories avec une régression linéaire,  à l'aide d'un notebook python.

<br>

2. Dossier ***NoteBooks python*** :
   - ***preprocessing.ipynb*** : code python réalisant le preprocessing des données brutes,
   - ***linear_regression*** : code python réalisant la régression linéaire des données nettoyées.
  
<br>

3. Dossier ***Power BI*** :
   - ***Database_ECommerce.pbids***: données du datawarehouse (base de données SQL) regroupant les données nettoyées et les prédictions de prix permettant de réaliser le tableau de bord Power BI,
   - ***Rapport PowerBI*** : rapport PowerBI permettant de répondre à la problématique.
  
<br>

4. Dossier ***SQL Code*** :
   - ***Create ECommerce DB.sql*** : code SQL créant la base de données ECommerce,
   - ***external_tables_creation*** : code SQL créant les tables externes sur les fichiers parquets des données nettoyées.
  
<br>

5. Le ***Rapport projet Azure*** : regroupe toutes les étapes du projet, ainsi que le modèle conceptuel de données et le schéma d’architecture.
   
