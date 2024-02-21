const natural = require('natural');
const extractKeywords = require('./keywordExtraction');

// Initialize the classifier
const classifier = new natural.BayesClassifier();

// Assuming you have some training data available
// This could be an array of objects with 'text' and 'label' properties
const trainingData = [
    { text: "What is photosynthesis?", label: "Biology" },
    { text: "How do we solve this algebraic expression?", label: "Mathematics" },
    // Add more training data here
];

// Train the classifier with your training data
trainingData.forEach(item => {
    const keywords = extractKeywords(item.text);
    classifier.addDocument(keywords.join(' '), item.label);
});

classifier.train();

function analyzeQuestion(questionText) {
    const keywords = extractKeywords(questionText);
    // Use the classifier to determine the topic
    const topic = classifier.classify(keywords.join(' '));

    return {
        keywords: keywords,
        topic: topic
    };
}

module.exports = analyzeQuestion;
