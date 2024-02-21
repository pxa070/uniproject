import React, { useState } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';
import '../pages/UploadQuestion.css';

function QuestionForm() {
    const [questionText, setQuestionText] = useState('');
    const [resources, setResources] = useState('');
    const [modelAnswer, setModelAnswer] = useState('');
    const [tags, setTags] = useState('');

    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            const { data } = await axios.post('/api/questions', { questionText, resources, modelAnswer, tags });
            console.log('Question submitted:', data);
            // Reset form or redirect as needed
            setQuestionText('');
            setResources('');
            setModelAnswer('');
            setTags('');
        } catch (error) {
            console.error('Error submitting question:', error);
        }
    };

    return (
        <form onSubmit={handleSubmit}>
            <div>
                <label>Question:</label>
                <textarea value={questionText} onChange={e => setQuestionText(e.target.value)} />
            </div>
            <div>
                <label>Resources:</label>
                <input type="text" value={resources} onChange={e => setResources(e.target.value)} />
            </div>
            <div>
                <label>Model Answer:</label>
                <textarea value={modelAnswer} onChange={e => setModelAnswer(e.target.value)} />
            </div>
            <div>
                <label>Tags:</label>
                <input type="text" value={tags} onChange={e => setTags(e.target.value)} />
            </div>
            <button type="submit">Submit Question</button>
        </form>
    );
}

export default QuestionForm;
