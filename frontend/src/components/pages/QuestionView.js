import React, { useEffect, useState } from 'react'
import { useParams } from 'react-router-dom'
import "./QuestionView.css";
import axios from 'axios';
import 'react-modern-drawer/dist/index.css'
import Drawer from 'react-modern-drawer'
import GaugeChart from 'react-gauge-chart'

const QuestionView = () => {
    const { id } = useParams()
    const [question, setQuestion] = useState(undefined)
    const [isFetching, setIsFetching] = useState(true);
    const [isDrawerOpen, setIsDrawerOpen] = useState(false);
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [answer, setAnswer] = useState("")
    const [error,setError] = useState('')
    const [similartyIndex, setSimilartyIndex] = useState({
        value: 0,
        show: false
    })
    const fetchQuestion = async () => {
        try {
            const { data } = await axios.get(`/api/questions/${id}`)
            setQuestion(data)
        }
        catch (err) {
            console.log(err)
        }
        finally {
            setIsFetching(false)
        }
    }

    const postAnswer = async () => {
        if(answer) {
            try {
                setError('')

                setIsSubmitting(true)
                const {data} = await axios.post(`api/question/${id}/answer`, {answer})
                setSimilartyIndex({
                    show: true,
                    value: Number(data.similarity_index)
                })
            } catch (err) {
                console.log(err)
            } finally {
                setIsSubmitting(false)
            }
        }
        else {
                setError("Enter A Valid Answer")
            }
    }
    useEffect(() => {
        fetchQuestion()
    }, [])

    return (
        <div className='QuestionView'>
            <p style={{
                marginBottom: "10px",
                fontSize: "24px",
                fontWeight: "bold",
                color: "#333",
                textAlign: "center",
                padding: "15px",
                borderRadius: "8px",
                boxShadow: "0 2px 4px rgba(0,0,0,0.1)"
            }}>Question View</p>
            {
                isFetching ? <p>Loading...</p> :
                    <>
                        {question && <>
                            <Drawer
                                open={isDrawerOpen}
                                onClose={() => setIsDrawerOpen(false)}
                                direction='left'
                                className='modernDrawer'
                                enableOverlay={true}
                            >
                                <>
                                    <p style={{
                                        marginBottom: "10px",
                                        fontSize: "24px",
                                        fontWeight: "bold",
                                        color: "#333",
                                        textAlign: "center",
                                        padding: "15px",
                                        borderRadius: "8px",
                                        boxShadow: "0 2px 4px rgba(0,0,0,0.1)"
                                    }}>Resources</p>
                                    {
                                        question?.resources?.map((item, index) => (
                                            <a onClick={() => {
                                                window.open(item.link)
                                            }} key={index} style={{ marginBottom: "10px", color: "blue" }}>{item.description}</a>
                                        ))
                                    }
                                </>
                            </Drawer>
                            {error && <p style={{color : "red"}}>{error}</p>}
                            <div className='pageContainer'>
                                <div className='ViewContainer'>
                                    <p className='questionText'>{question.question_text}</p>
                                    <div className="input-group">
                                        <textarea value={answer} onChange={(e) => setAnswer(e.target.value)} placeholder='Enter Answer Here' name="" id="txt" cols="30" rows="10"></textarea>
                                        <button onClick={postAnswer} className="login-button textbutton" disabled={isSubmitting}>{isSubmitting ? "Submitting..." : "Submit"}</button>
                                    </div>
                                    <button onClick={() => setIsDrawerOpen(true)} className="login-button">Check Resources</button>
                                </div>
                                {similartyIndex.show &&
                                    <div style={{ display: 'flex', flexDirection: 'column', width: '35%' }}>
                                        <p>{question.model_answer_explanation}</p>
                                        <div style={{width: '100%'}}>
                                            <GaugeChart id="gauge-chart2"
                                                        nrOfLevels={20}
                                                        colors={["#FF5F6D", "#00FF00"]}
                                                        percent={similartyIndex.value}
                                                        textColor={"#4a54d1"}
                                                        style={{ width: "100%" }}
                                            />
                                        </div>
                                    </div>
                                }

                            </div>
                        </>

                        }
                    </>
            }

        </div>
    )
}

export default QuestionView