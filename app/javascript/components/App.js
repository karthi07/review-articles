import React, { Component } from "react";
import Articles from "./../components/articles";
import Album from "./../components/articles-ctn";

class App extends Component {
  state = {
    articles: [],
  };
  componentDidMount() {
    fetch("http://localhost:3000/articles_api")
      .then((res) => res.json())
      .then((data) => {
        this.setState({ articles: data });
        console.log(this.state.articles);
      })
      .catch(console.log);
  }

  render() {
    // articles = [{ title: "tech article 2", link: "tech_art1.html" }];

    // return <Articles articles={this.state.articles} />;
    return <Album />;
  }
}

export default App;
