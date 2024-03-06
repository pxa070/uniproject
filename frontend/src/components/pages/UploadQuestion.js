import React, { useState } from 'react';
import axios from 'axios';
import '../pages/UploadQuestion.css';
import { WithContext as ReactTags } from 'react-tag-input';
import { useNavigate } from 'react-router-dom';

function QuestionForm() {
    const [questionText, setQuestionText] = useState('');
    const navigate = useNavigate();
    const [isLoading,setIsLoading] = useState(false)
    const [tags, setTags] = useState([
    ]);
    const handleDelete = i => {
        setTags(tags.filter((tag, index) => index !== i));
    };

    const handleAddition = tag => {
        setTags([...tags, tag]);
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            const { data } = await axios.post('/api/questions', { questionText });
            console.log('Question submitted:', data);
            // Reset form or redirect as needed
            navigate('/question/list');
        } catch (error) {
            console.error('Error submitting question:', error.message);
        }
        finally {
            setIsLoading(false)
        }
    };

    return (
        <div className='QuestionPage'>
            <form onSubmit={handleSubmit} className='QuestionForm'>
                <textarea className='textArea' placeholder='Ask Anything.....' value={questionText} onChange={e => setQuestionText(e.target.value)} />
                <ReactTags
                    tags={tags}
                    handleDelete={handleDelete}
                    handleAddition={handleAddition}
                    inputFieldPosition="top"
                    autocomplete
                />
                <div className='actions'>
                    <button className='reset' onClick={()=>{
                        setQuestionText('')
                        setTags([])
                    }}>Reset</button>
                    <button className='submit' type="submit" disabled={isLoading}>{isLoading ? "Submitting..." : "Submit Question"}</button>
                </div>
            </form>
        </div>
    );
}

export default QuestionForm;