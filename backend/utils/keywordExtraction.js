// keywordExtraction.js
const natural = require('natural');
const stopWords = require('./stopWords'); // Assume this is an array of stop words

const tokenizer = new natural.WordTokenizer();
const stemmer = natural.PorterStemmer;

function extractKeywords(text) {
    const tokens = tokenizer.tokenize(text.toLowerCase());
    const filteredTokens = tokens.filter(token => !stopWords.includes(token));
    const stemmedTokens = filteredTokens.map(token => stemmer.stem(token));
    return stemmedTokens;
}

module.exports = extractKeywords;
