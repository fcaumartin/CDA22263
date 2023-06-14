import { useState } from "react"

function Form(props) {

  const [nom, setNom] = useState("xxx");

  function change(evt) {
    setNom(evt.target.value)
  }

  return (
    <div>
    Formulaire ajout
    <hr />
    {nom}
    <hr />

    <input type="text" value={nom} onChange={change}/>
    </div>
  )
}

export default Form
