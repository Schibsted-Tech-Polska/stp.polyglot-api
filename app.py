#!flask/bin/python
from flask import Flask, jsonify, request, abort
from polyglot.text import Text
from cors import crossdomain

app = Flask(__name__)

@app.route('/ner', methods=['POST', 'OPTIONS'])
@crossdomain(origin='*', headers=['Content-type'])
def ner():
    if not request.json or not 'text' in request.json:
        abort(400)

    text = Text(request.json['text'])
    entities = text.entities
    result = {}
    for entity in entities:
        if entity.tag not in result:
            result[entity.tag] = set()

        result[entity.tag].add(' '.join(entity))

    for tagType in result:
        result[tagType] = list(result[tagType])

    return jsonify(result), 200

@app.route('/')
def index():
    return jsonify({'error': 'Use /ner endpoint'}), 400

if __name__ == '__main__':
    app.run(debug=True)
