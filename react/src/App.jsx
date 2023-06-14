import Form from "./Composants/Form"
import List from "./Composants/List"

function App() {

  let is_visible = false;

  return (
    <span>
    Application
    <Form nom="toto" visible={is_visible}/>
    <List />
    </span>
  )
}

export default App
