import React, { Component } from "react";

class Article extends Component {
  render() {
    const { article } = this.props;
    return (
      <div className="article">
        <h3> {article.title} </h3>
      </div>
    );
  }
}

export default Article;
