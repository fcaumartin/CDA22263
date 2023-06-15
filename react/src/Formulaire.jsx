import { useState } from "react";

function Formulaire (props) {

    const [texte, setTexte] = useState("");

    const handleChange = (evt) => {
        setTexte(evt.target.value)
    };
    

    const handleClick = (evt) => {
        props.onClick(texte)
    };
    

    return (
        <div>
            <h2>Formulaire</h2>
            <input type="text" value={texte} onChange={handleChange}/>
            <button onClick={handleClick}>
                Ajouter
            </button>
        </div>
    )

}



export {Formulaire}