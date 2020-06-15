import React, { Component } from "react";
import Articles from "./../components/articles";

// const articles = [{ title: "tech article 1", link: "tech_art1.html" }];

// async function getMoviesFromApi() {
//   try {
//     let response = await fetch("http://localhost:3000/articles_api");
//     let responseJson = await response.json();
//     console.log(responseJson);
//     return responseJson;
//   } catch (error) {
//     console.error(error);
//   }
// }

// const articles = [{ title: "tech article 1", link: "tech_art1.html" }];
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

    return <Articles articles={this.state.articles} />;
  }
}

export default App;
