import React, { Component } from "react";
import Article from "./../components/article";
import RecipeReviewCard from "./articles-card";

class Articles extends Component {
  render() {
    const { articles } = this.props;
    return (
      <div className="articles">
        <h2> Today's Articles </h2>
        <RecipeReviewCard />
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
