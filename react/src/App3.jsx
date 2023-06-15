import { useState } from "react";
import { Formulaire } from "./Formulaire";
import Liste from "./Liste";

import "@picocss/pico"

function App3() {

  const [tableau, setTableau] = useState(["aaa", "bbb", "ccc", "ddd"]);

  const handle = (texte) => {
    setTableau([...tableau, texte])
  };
  

  return (
    <div className="container">
      <Formulaire onClick={handle} />
      <Liste data={tableau}/>
    </div>
  )
}

export default App3
