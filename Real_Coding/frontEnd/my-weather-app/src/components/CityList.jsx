function CityList(props){
    const {cities} = props.cities;
    return(
        <div>
            <h1>CityList</h1>

            <ul>
                {cities.map((item, index) => {
                    return <li key={index}>{item}</li>;
                })}
            </ul>
        </div>
    )
}