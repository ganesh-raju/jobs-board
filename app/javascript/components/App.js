import React from "react"
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import Nav from "./layouts/Nav";
import Home from "./pages/Home";
import About from "./pages/About";
import Index from "./app/jobs/Index";
import JobsView from "./app/jobs/JobsView";
import SignUp from "./app/auth/sign_up";

class App extends React.Component {
  render () {
    return (
      <Router>
        <Nav />
        <Switch>
          <Route exact path="/" component={Home} />
          <Route exact path="/about" component={About} />
          <Route exact path="/jobs" component={Index} />
          <Route exact path="/jobs/:title" component={JobsView} />
          <Route exact path="/sign_up" component={SignUp} />
        </Switch>
      </Router>
    );
  }
}

export default App;
