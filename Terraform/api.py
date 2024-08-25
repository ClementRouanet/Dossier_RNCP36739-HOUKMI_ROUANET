# -*- coding: utf-8 -*-
from flask import Flask, jsonify, request

app = Flask(__name__)

# Exemple de données en mémoire (simulant une base de données)
articles = [
    {'id': 1, 'title': 'Premier article', 'content': 'Contenu de l\'article 1'},
    {'id': 2, 'title': 'Deuxième article', 'content': 'Contenu de l\'article 2'}
]
next_id = 3

# Route pour récupérer tous les articles
@app.route('/articles', methods=['GET'])
def get_articles():
    return jsonify({'articles': articles})

# Route pour récupérer un article par son ID
@app.route('/articles/<int:id>', methods=['GET'])
def get_article(id):
    article = next((article for article in articles if article['id'] == id), None)
    if article:
        return jsonify(article)
    else:
        return jsonify({'message': 'Article non trouvé'}), 404

# Route pour créer un nouvel article
@app.route('/articles', methods=['POST'])
def create_article():
    global next_id
    data = request.json
    new_article = {'id': next_id, 'title': data['title'], 'content': data['content']}
    articles.append(new_article)
    next_id += 1
    return jsonify(new_article), 201

# Route pour mettre à jour un article existant
@app.route('/articles/<int:id>', methods=['PUT'])
def update_article(id):
    data = request.json
    for article in articles:
        if article['id'] == id:
            article['title'] = data['title']
            article['content'] = data['content']
            return jsonify(article)
    return jsonify({'message': 'Article non trouvé'}), 404

# Route pour supprimer un article par son ID
@app.route('/articles/<int:id>', methods=['DELETE'])
def delete_article(id):
    global articles
    articles = [article for article in articles if article['id'] != id]
    return jsonify({'message': 'Article supprimé'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
