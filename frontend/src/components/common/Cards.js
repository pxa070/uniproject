// In your Cards.js component
import React from 'react';
import './Cards.css';
import { Link } from 'react-router-dom';
import Slider from 'react-slick';
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";

function Cards() {
    const cards = [
        {
            title: "Chemistry: The Central Science",
            imageUrl: "/molecules.jpeg",
            author: "Bruce Edward Bursten, Catherine J. Murphy, H. Eugene LeMay",
            edition: "14th Edition",
            isbn: "9780134414232",
            solutions: "7745 solutions"
        },
        {
            title: "Organic Chemistry",
            imageUrl: "/orgchem.jpg",
            author: "Brent L. Iverson, Christopher S. Foote, Eric Anslyn, William H. Brown",
            edition: "8th Edition",
            isbn: "9781305580350",
            solutions: "1600 solutions"
        },
        // ... more card objects
    ];

    // Slider settings
    const settings = {
        dots: true,
        infinite: true,
        speed: 500,
        slidesToShow: 3,
        slidesToScroll: 3,
        nextArrow: <CustomNextArrow/>,
        prevArrow: <CustomPrevArrow />
    };

    function CustomNextArrow(props) {
        const { className, style, onClick } = props;
        return (
            <div
                className={className}
                style={{ ...style, display: "flex", background: "black"}}
                onClick={onClick}
            />
        );
    }

    function CustomPrevArrow(props) {
        const { className, style, onClick } = props;
        return (
            <div
                className={className}
                style={{ ...style, display: "flex", background: "blue" }}
                onClick={onClick}
            />
        );
    }





    return (
        <div className="card-slider">
            <Slider {...settings}>
                {cards.map((card, index) => (
                    <Link to={card.link} key={index} className="card">
                        <img src={card.imageUrl} alt={card.title} />
                        <div className="card-info">
                            <h3>{card.title}</h3>
                            {/* Other card info */}
                        </div>
                    </Link>
                ))}
            </Slider>
        </div>
    );
}

export default Cards;
