import React, { useEffect } from 'react'
import { useParams } from 'react-router-dom'
import axios from 'axios'

const QuestionView = () => {
    const {id} = useParams()
    const fetchQuestion = async () => {
        try {
            const {data} = await axios.get(`/api/questions/${id}`)
            console.log(data,"data here")
        }
        catch(err) {
            console.log(err)
        }
    }
    useEffect(()=>{
        fetchQuestion()
    },[])
    return (
        <div>QuestionView</div>
    )
}

export default QuestionView;