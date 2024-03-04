import React, { useState } from 'react';
import axios from 'axios';
import '../pages/UploadQuestion.css';

function QuestionForm() {
    const [questionText, setQuestionText] = useState('');

    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            const { data } = await axios.post('/api/questions', { questionText });
            console.log('Question submitted:', data);
            // Reset form or redirect as needed
            setQuestionText('');
        } catch (error) {
            console.error('Error submitting question:', error);
        }
    };

    return (
        <div className='QuestionPage'>
            <form onSubmit={handleSubmit} className='QuestionForm'>
                <textarea className='textArea' placeholder='Ask Anything.....' value={questionText} onChange={e => setQuestionText(e.target.value)} />

                <div className='actions'>
                    <button className='reset' onClick={()=>setQuestionText('')}>Reset</button>
                    <button className='submit' type="submit">Submit Question</button>
                </div>
            </form>
        </div>
    );
}

export default QuestionForm;