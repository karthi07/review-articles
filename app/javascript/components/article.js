import React, { Component } from "react";
import Button from "@material-ui/core/Button";

class Article extends Component {
  render() {
    const { article } = this.props;
    return (
      <div className="article">
        <h3> {article.title} </h3>
        <Button variant="contained" color="primary">
          Review now
        </Button>
      </div>
    );
  }
}

export default Article;
