import React, { Component } from "react";
import Articles from "./../components/articles";

const articles = [{ title: "tech article 1", link: "tech_art1.html" }];

class App extends Component {
  render() {
    return <Articles articles={articles} />;
  }
}

export default App;
