import {Link, Route, BrowserRouter as Router} from "react-router-dom";
import Repository from "../components/Repository";

function Home(){
    const API_URL = "https://github.com/Dongheon97";

    return(
        <Router>
            <div>
                <h1>Introduce</h1>
                <li>{API_URL}</li>
                <ul>
                    <li>
                        <Link to = "/repository">Repositories (click to open)</Link>
                    </li>
                </ul>
                <switch>
                    <Route path="/repository">
                        <Repository />
                    </Route>
                </switch>

            </div>

        </Router>

    );
}
export default Home;