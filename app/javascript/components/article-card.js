import React from "react";
import { withStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import TextField from "@material-ui/core/TextField";
import Grid from "@material-ui/core/Grid";
import Card from "@material-ui/core/Card";
import CardHeader from "@material-ui/core/CardHeader";
import CardMedia from "@material-ui/core/CardMedia";
import CardContent from "@material-ui/core/CardContent";
import CardActions from "@material-ui/core/CardActions";
import Collapse from "@material-ui/core/Collapse";
import Avatar from "@material-ui/core/Avatar";
import IconButton from "@material-ui/core/IconButton";
import Typography from "@material-ui/core/Typography";
import { red } from "@material-ui/core/colors";
import FavoriteIcon from "@material-ui/icons/Favorite";
import ShareIcon from "@material-ui/icons/Share";
import ExpandMoreIcon from "@material-ui/icons/ExpandMore";
import MoreVertIcon from "@material-ui/icons/MoreVert";
import Icon from "@material-ui/core/Icon";
import Button from "@material-ui/core/Button";

const useStyles = (theme) => ({
  root: {
    maxWidth: 345,
  },
  media: {
    height: 0,
    paddingTop: "56.25%", // 16:9
  },
  title: {
    fontSize: "1.3rem",
  },
  reviewbtn: {
    margin: theme.spacing(1),
  },
  expand: {
    transform: "rotate(0deg)",
    marginLeft: "auto",
    transition: theme.transitions.create("transform", {
      duration: theme.transitions.duration.shortest,
    }),
  },
  expandOpen: {
    transform: "rotate(180deg)",
  },
  avatar: {
    backgroundColor: "#1b2a3d",
  },
});

class AricleCard extends React.Component {
  constructor(props) {
    super(props);
    this.state = { expanded: false, review: "" };

    // This binding is necessary to make `this` work in the callback
    this.handleExpandClick = this.handleExpandClick.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }
  handleChange(event) {
    this.setState({ review: event.target.value });
  }

  handleSubmit(event) {
    console.log("An essay was submitted: " + this.state.review);
    event.preventDefault();
  }

  handleExpandClick() {
    // setExpanded(!expanded);
    this.setState((state) => ({
      expanded: !state.expanded,
    }));
  }

  render() {
    const classes = this.props.classes;

    // const [expanded, setExpanded] = React.useState(false);

    const article = this.props.article;
    return (
      <Grid item key={article.title} xs={12} sm={6} md={4}>
        <Card className={classes.root}>
          <CardHeader
            avatar={
              <Avatar aria-label="recipe" className={classes.avatar}>
                M
              </Avatar>
            }
            action={
              <IconButton aria-label="settings">
                <MoreVertIcon />
              </IconButton>
            }
            title="Medium / Python "
            subheader="September 14, 2016"
          />
          <CardMedia
            className={classes.media}
            image="https://source.unsplash.com/random"
            title="Paella dish"
          />
          <CardContent>
            <Typography
              gutterBottom
              variant="h5"
              component="h2"
              className={classes.title}
            >
              {article.title}
            </Typography>
          </CardContent>
          <CardActions disableSpacing>
            <IconButton aria-label="add to favorites">
              <FavoriteIcon />
            </IconButton>
            <IconButton aria-label="share">
              <ShareIcon />
            </IconButton>
            <IconButton
              className={clsx(classes.expand, {
                [classes.expandOpen]: this.state.expanded,
              })}
              onClick={this.handleExpandClick}
              aria-expanded={this.state.expanded}
              aria-label="show more"
            >
              <ExpandMoreIcon />
            </IconButton>
          </CardActions>
          <Collapse in={this.state.expanded} timeout="auto" unmountOnExit>
            <CardContent>
              <form onSubmit={this.handleSubmit}>
                <TextField
                  id="outlined-textarea"
                  label="Wrtie your Review"
                  placeholder="Wrtie your Review"
                  value={this.state.review}
                  onChange={this.handleChange}
                  multiline
                  variant="outlined"
                />
                <Button
                  variant="outlined"
                  type="submit"
                  className={classes.reviewbtn}
                  color="primary"
                >
                  Post review
                </Button>
              </form>
            </CardContent>
          </Collapse>
        </Card>
      </Grid>
    );
  }
}

export default withStyles(useStyles, { withTheme: true })(AricleCard);
