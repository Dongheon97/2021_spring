import logo from './logo.svg';
import './App.css';
import Header from "./components/Header";
import {
    BrowserRouter as Router,
    Switch,
    Route,
    Link
} from "react-router-dom";
import About from "./pages/About"
import Home from "./pages/Home"
import Cities from "./pages/Cities"

function App() {
    const city = "Sejong";
    return (
        <Router>
            <div className="App">
                <Header region = "Korea" cityName = {city} />
                <ul className="navigation">
                    <li>
                        <Link to="/about">About</Link>
                    </li>
                    <li>
                        <Link to="/cities">Cities</Link>
                    </li>
                    <li>
                        <Link to="/">Home</Link>
                    </li>
                </ul>
                <Switch>
                    <Route path="/about">
                        <About />
                    </Route>
                    <Route path="/cities">
                        <Cities />
                    </Route>
                    <Route path="/">
                        <Home />
                    </Route>
                </Switch>
            </div>

        </Router>
    );
}

export default App;


