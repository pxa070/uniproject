import React from 'react'
import "./DisplayCard.css";
import { useNavigate } from 'react-router-dom';
const DisplayCard = ({index,question,id}) => {
    const navigate = useNavigate();
    return (
        <div class="card" onClick={()=>navigate(`/question/${id}`)}>
            <div class="face face1">
                <div class="content">
                    <span class="stars"></span>
                    <h2 class="java">Question.</h2>
                    <p class="java">{question}</p>
                </div>
            </div>
            <div class="face face2">
                <h2>{index}</h2>
            </div>
        </div>
    )
}

export default DisplayCard