import React, { Component } from "react";
import Article from "./../components/article";

class Articles extends Component {
  render() {
    const { articles } = this.props;
    // var data = this.getMoviesFromApi;
    return (
      <div className="articles">
        <h2> Today's Articles </h2>

        <div>
          {articles.map((article) => (
            <Article article={article} key={article.title} />
          ))}
        </div>
      </div>
    );
  }
}

export default Articles;
