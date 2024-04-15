const natural = require('natural');
const extractKeywords = require('./keywordExtraction');

// Initialize the classifier
const classifier = new natural.BayesClassifier();

// Assuming you have some training data available
//An array of objects with 'text' and 'label' properties, to train the NLP model to identify topics more accurately
const trainingData = [
    { text: "What is photosynthesis?", label: "Biology" },
    { text: "How do we solve this algebraic expression?", label: "Mathematics" },
    { text: "What is photosynthesis?", label: "Biology" },
    { text: "How do we solve this algebraic expression?", label: "Mathematics" },
    { text: "Who wrote 'Pride and Prejudice'?", label: "Literature" },
    { text: "What is the significance of the Battle of Gettysburg?", label: "History" },
    { text: "Explain the principle of conservation of energy.", label: "Physics" },
    { text: "What is the Pythagorean Theorem?", label: "Mathematics" },
    { text: "Describe the water cycle.", label: "Earth Science" },
    { text: "What is the theory of evolution by natural selection?", label: "Biology" },
    { text: "How do supply and demand affect prices?", label: "Economics" },
    { text: "What is a constitutional monarchy?", label: "Political Science" },
    { text: "Define and give an example of a metaphor.", label: "Literature" },
    { text: "What is the chemical formula for water?", label: "Chemistry" },
    { text: "Explain the process of mitosis.", label: "Biology" },
    { text: "What was the Renaissance?", label: "History" },
    { text: "How does Newton's third law apply to everyday life?", label: "Physics" },
    { text: "What is Keynesian economics?", label: "Economics" },
    { text: "Define the term 'biodiversity'.", label: "Environmental Science" },
    { text: "What causes earthquakes?", label: "Earth Science" },
    { text: "Explain the significance of Shakespeare's 'Hamlet'.", label: "Literature" },
    { text: "What is quantum mechanics?", label: "Physics" },
    { text: "What is a binary search algorithm?", label: "Computer Science" },
    { text: "Define object-oriented programming.", label: "Computer Science" },
    { text: "Explain the concept of Big O Notation.", label: "Computer Science" },
    { text: "What is the difference between SQL and NoSQL databases?", label: "Computer Science" },
    { text: "How does encryption work?", label: "Computer Science" },
    { text: "What is machine learning?", label: "Computer Science" },
    { text: "Describe the TCP/IP model.", label: "Computer Science" },
    { text: "What are the principles of Agile software development?", label: "Computer Science" },
    { text: "Explain the difference between synchronous and asynchronous programming.", label: "Computer Science" },
    { text: "What is a blockchain?", label: "Computer Science" }


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
