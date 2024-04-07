import React, { useEffect, useState } from 'react'
import "./QuestionList.css";
import axios from 'axios';
import DisplayCard from '../common/DisplayCard';
const QuestionList = () => {
    const [questions,setQuestions] = useState([])
    const [isFetching,setIsFetching] = useState(true);
    const fetchQuestions = async () => {
        try {
            const {data} = await axios.get('/api/questions')
            setQuestions(data)
        }
        catch(err) {
            console.log(err)
        }
        finally {
            setIsFetching(false)
        }
    }
    useEffect(()=>{
        fetchQuestions()
    },[])
    return (
        <div className='QuestionListPage'>
            <h1> My Questions</h1>

            {
                isFetching ? <p>Loading....</p> :
                    questions.length
                        ? <div className='questionsContainer'>
                            {
                                questions.map((item,index)=>(
                                    <DisplayCard key={index} index={index + 1} question={item.question_text} id={item.question_id}/>
                                ))
                            }
                        </div>
                        :
                        <p>There are no questions submitted</p>
            }
        </div>
    )
}

export default QuestionList