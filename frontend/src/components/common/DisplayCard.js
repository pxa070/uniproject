import React from 'react'
import "./DisplayCard.css";
import { useNavigate } from 'react-router-dom';
const DisplayCard = ({index,question,id}) => {
    const navigate = useNavigate();
    return (
        <div className="card" onClick={()=>navigate(`/question/${id}`)}>
            <div className="face face1">
                <div className="content">
                    <span className="stars"></span>
                    <p className="java">{question}</p>
                </div>
            </div>
            <div className="face face2">
                <h2>{index}</h2>
            </div>
        </div>
    )
}

export default DisplayCard