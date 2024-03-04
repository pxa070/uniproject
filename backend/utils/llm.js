const OpenAI = require("openai");

const openai = new OpenAI({
    apiKey: process.env.OPENAI_API_KEY,
});

async function answer_assistant(query) {
    const chatCompletion = await openai.chat.completions.create({
        messages: [
            {
                role: "system",
                content:
                    "You are helpful assistant and answer queries to the point without any salutations.",
            },
            { role: "user", content: query },
        ],
        model: "gpt-3.5-turbo",
    });

    return chatCompletion.choices[0].message.content;
}

async function compare_correctness(question, model_answer, user_answer) {
    const chatCompletion = await openai.chat.completions.create({
        messages: [
            {
                role: "system",
                content:
                    "Evaluate the correctness of the user's answer in comparison to the correct answer, taking into account the semantics and relevance to the question. Provide a semantic similarity score between the Correct Answer and the User Answer on a scale from 0 to 1, where 1 indicates complete semantic similarity and 0 indicates no similarity.",
            },
            {
                role: "user",
                content: `
        Question: ${question}
        Correct Answer: ${model_answer}
        User Answer: ${user_answer}
        `,
            },
        ],
        model: "gpt-3.5-turbo",
    });

    return chatCompletion.choices[0].message.content;
}

module.exports = { answer_assistant, compare_correctness };

