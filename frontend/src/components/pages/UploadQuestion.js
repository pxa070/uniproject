import React, { useState } from 'react';
import axios from 'axios';
import '../pages/UploadQuestion.css';
import { WithContext as ReactTags } from 'react-tag-input';
import { useNavigate } from 'react-router-dom';

function QuestionForm() {
    const [questionText, setQuestionText] = useState('');
    const navigate = useNavigate();
    const [isLoading,setIsLoading] = useState(false)
    const [error,setError] = useState('')
    const [tags, setTags] = useState([
    ]);

    const sampleQuestions = [
        { id: 1, text: "What is the difference between React and Angular?" },
        { id: 2, text: "How do I implement pagination in a JavaScript application?" },
        { id: 3, text: "Explain the concept of promises in JavaScript." },
        { id: 4, text: "How can I improve my active listening skills?" },
        { id: 5, text: "Discuss the advantages and disadvantages of using NoSQL databases compared to relational databases." },
        { id: 6, text: "What are the primary causes of climate change, and what can be done to address them?" },

        // ... Add more sample questions here
    ];

    const displaySampleQuestions = () => {
        return sampleQuestions.map((question) => (
            <button
                key={question.id}
                type="button" // Add this line to ensure they don't submit the form
                onClick={() => setQuestionText(question.text)}
                style={{margin: "5px"}}
            >
                {question.text}
            </button>
        ));
    };
    const handleDelete = i => {
        setTags(tags.filter((tag, index) => index !== i));
    };

    const handleAddition = tag => {
        setTags([...tags, tag]);
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        if(questionText){
        try {
            setError('')

            const { data } = await axios.post('/api/questions', { questionText }, {
                headers: {
                    'Authorization': `Bearer ${localStorage.getItem('token')}` // Assuming the token is stored in localStorage
                }
            });
            console.log('Question submitted:', data);
            // Reset form or redirect as needed
            navigate('/question/list');
        } catch (error) {
            console.error('Error submitting question:', error.message);
        }
        finally {
            setIsLoading(false)
        }
        }
        else {
            setError("Question Field should not be empty")
        }
    };

    return (
        <div className='QuestionPage'>
            <form onSubmit={handleSubmit} className='QuestionForm'>
                <textarea className='textArea' placeholder='Ask Anything...' value={questionText} onChange={e => setQuestionText(e.target.value)} />
                <div className="sample-questions-container">
                    {displaySampleQuestions()}
                </div>

                <ReactTags
                    tags={tags}
                    handleDelete={handleDelete}
                    handleAddition={handleAddition}
                    inputFieldPosition="top"
                    autocomplete
                />
                {error && <p style={{color : "red"}}>{error}</p>}
                <div className='actions'>
                    <button className='reset' type='button' onClick={(e)=>{
                        setQuestionText('')
                        setTags([])
                    }}>Reset</button>
                    <button className='submit'  type="submit" disabled={isLoading}>{isLoading ? "Submitting..." : "Submit Question"}</button>
                </div>
            </form>
        </div>
    );
}

export default QuestionForm;