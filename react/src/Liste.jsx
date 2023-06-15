

export default function Liste (props) {

    return (
        <div>
            <h2> Liste </h2>
        {
          props.data.map( (element, index) => 
              <div key={index}>
                {element}
              </div>
          )
        }

      </div>
    )
}