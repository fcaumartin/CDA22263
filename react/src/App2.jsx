import { useState } from "react";
import Form from "./Composants/Form"
import List from "./Composants/List"

function App2() {

  const [texte, setTexte] = useState("");
  const [tableau, setTableau] = useState(["aaa", "bbb", "ccc", "ddd"]);

  function handleClick (evt)  {
    setTableau([ ...tableau, texte])
  };

  const handleChange = (evt) => {
    setTexte(evt.target.value)
  };
  
  

  return (
    <div>
      <input type="text" value={texte} onChange={handleChange}/>
      <button onClick={handleClick}>
        Ajouter
      </button>
      <div>
        {
          tableau.map( (element, index) => 
              <div key={index}>
                {element}
              </div>
          )
        }

      </div>
    </div>
  )
}

export default App2
