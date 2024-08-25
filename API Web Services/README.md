# Projet API et web Services

## EFREI PARIS <br> Mastère Data Engineering & AI 

### Blocs de Compétences 1 & 2

HOUKMI Salaheddine  
ROUANET Clément  
 
<br>

## Sujet
Le projet consiste à développer une API RESTful en utilisant Django (framework Python) pour gérer un Pokédex personnalisé pour les utilisateurs. Un Pokédex est une base de données des Pokémon, contenant des informations détaillées sur chaque Pokémon, leurs types, caractéristiques, et autres attributs. L'API doit permettre aux utilisateurs de gérer leur Pokédex personnel en effectuant des opérations CRUD (Créer, Lire, Mettre à jour, Supprimer) sur les Pokémon.

L'API devra également intégrer un système d'authentification basé sur JWT (JSON Web Token) pour sécuriser l'accès aux fonctionnalités liées à la gestion du Pokédex. Les utilisateurs doivent s'authentifier pour obtenir un token JWT qui leur permettra d'accéder à leur Pokédex personnel.

<br>

## Création de la DataBase
Exécuter les deux scripts SQL : **pokedex.sql** et **Create User and Bag Tables.sql**  

<br>

## Lancement du programme
Se placer dans le chemin : **/pokemon_api/pokedex/**  
Exécuter la commande suivante : **python3 manage.py runserver**

<br>

## Voici la liste des routes disponibles avec les requêtes à faire

- ```http://127.0.0.1:8000/api/moves/<int:move_id>/```  
    - Récupère le nom du mouvement en fonction de l'id entré dans l'url  
    - Requête **GET**  


- ```http://127.0.0.1:8000/api/pokemon/<int:pokemon_id>/```  
    - Récupère le nom du pokemon en fonction de l'id entré dans l'url  
    - Requête **GET**  


- ```http://127.0.0.1:8000/api/pokemon/<str:pokemon_name>/```  
    - Récupère le nom la hauteur, le poids et l'expérience de base en fonction du nom du pokemon entré dans l'url  
    - Requête **GET**  


- ```http://127.0.0.1:8000/api/pokemon/types/<str:pokemon_name>/```  
    - Récupère le le type en fonction du nom du pokemon entré dans l'url  
    - Requête **GET**  


- ```http://127.0.0.1:8000/api/items/<int:item_id>/```  
    - Récupère le nom de l'item en fonction de l'id entré dans l'url  
    - Requête **GET**  


- ```http://127.0.0.1:8000/api/connexion/```  
    - Permet à un utilisateur de se connecter et avoir un token pour un pseudo et mot de passe valide  
    - Requête **POST**  
###### Body JSON :  
```json  
{  
  "username" : "pseudo",  
  "password": "mdp"  
}  
```  

- ```http://127.0.0.1:8000/api/register/```  
    - Permet à un utilisateur de se créer un user avec un pokedex vide  
    - Requête **POST**  
###### Body JSON :  
```json  
{
  "username" : "pseudo",  
  "password": "mdp",  
  "role": "user"   // clé non obligatoire et à 'user' par défaut  
} 
```  

- ```http://127.0.0.1:8000/api/mesPokemons/```  
    - Permet à un utilisateur authentifié d'accéder à son pokedex (liste de pokemons)  
    - Requête **GET**  
    - Renseigner le Token dans Authentification/Bearer  


- ```http://127.0.0.1:8000/api/addPokemons/```  
    - Permet à un utilisateur authentifié d'ajouter un ou plusieurs pokemon(s) à son pokedex  
    - Requête **POST**  
    - Renseigner le Token dans Authentification/Bearer  
###### Body JSON :  
```json  
{
  "pokemons": ["pokemon_id", "pokemon_id", "..."]   // Les id sont des int  
} 
```  

- ```http://127.0.0.1:8000/api/remPokemons/```  
    - Permet à un utilisateur authentifié de supprimer un ou plusieurs pokemon(s) à son pokedex  
    - Requête **DELETE**  
    - Renseigner le Token dans Authentification/Bearer  
###### Body JSON :  
```json  
{
  "pokemons": ["pokemon_id", "pokemon_id", "..."]   // Les id sont des int  
} 
```  


- ```http://127.0.0.1:8000/api/role/```  
    - Permet à un admin authentifié de récupérer le rôle de tout le monde (users + admins)  
    - Requête **GET**  
    - Renseigner le Token dans Authentification/Bearer  (fonctionne uniquement avec les utilisateurs admin)


- ```http://127.0.0.1:8000/api/admin/users/```  
    - Permet à un admin authentifié de modifier le rôle à un user (admin -> user  ou  user -> admin)  
    - Requête **POST**  
    - Renseigner le Token dans Authentification/Bearer  (fonctionne uniquement avec les utilisateurs admin)
###### Body JSON :  
```json  
{
  "username" : "pseudo",
  "role": "nouveau_role"  
} 
```  