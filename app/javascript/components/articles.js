import React, { Component } from "react";
import Article from "./../components/article";

class Articles extends Component {
  render() {
    const { articles } = this.props;

    return (
      <div className="articles">
        <h2> Today's Articles </h2>
        {articles.map((article) => (
          <Article article={article} key={article.title} />
        ))}
      </div>
    );
  }
}

export default Articles;
