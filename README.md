<!-- [![Contributors][contributors-shield]][contributors-url] -->

[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <!-- <a href="https://github.com/jaspreet-singh-sahota/Slack-bot">
    <img src="https://course_report_production.s3.amazonaws.com/rich/rich_files/rich_files/5726/s300/icon-white-on-murple-copy.png" alt="Logo" width="80" height="80">
  </a> -->

  <h1 align="center"> Read Review Articles</h1>
  <p align="center">
  <img width="61" alt="rails" src="https://user-images.githubusercontent.com/5237154/85113533-0da2b800-b235-11ea-95ac-31b896096efe.png"> &emsp;
  <img width="61" alt="react" src="https://user-images.githubusercontent.com/5237154/85112643-8f91e180-b233-11ea-95b3-3c60f976d1bf.png"> &emsp;
  <img width="61" alt="redis" src="https://user-images.githubusercontent.com/5237154/85112638-8c96f100-b233-11ea-9c59-9746efb2f48f.png"> &emsp;
  <img width="61" alt="sidekiq" src="https://user-images.githubusercontent.com/5237154/85112642-8ef94b00-b233-11ea-8942-a5c8327974fd.png">

  </p>

  <p align="center">
    Read Review Articles - Place to read your favourite and top treding, yet usefull technical articles under a single hood. the best part is, you can review the article and share with your friends, Aka you can get the favorite aticles and their reivews of the person you follow.
    <br />
    <a href="git@github.com:karthi07/review-articles.git"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/karthi07/review-articles/issues">Report Bug</a>
    ·
    <a href="https://github.com/karthi07/review-articles/issues">Request Feature</a>
  </p>
</p>

<!-- TABLE OF CONTENTS -->

## Table of Contents

- [About the Project](#about-the-project)
  - [Built With](#built-with)
- [Contact](#Authors)
- [Acknowledgements](#acknowledgements)
- [How it works](#How-it-works)

<!-- ABOUT THE PROJECT -->

## About The Project

Place to read your favourite and top treading, yet useful technical articles under a single hood. the best part is, you can review the article and share with your friends, Aka you can get the favourite articles and their reviews of the person you follow.
<br />

## Technical Components

The Project is Backed by Rails and Sidekiq handles the background job to Retrieving and store the articles at redis. React is plugged into rails, which handles reading from redis and displaying the articles fetched.

### Sidekiq - handles the background job to retrieving articles from web

### Redis - Store article temp at Server Memory [ wont be stored in Database ] - This is required by project design

### React - Load articles at real-time. Instead of refreshing the whole page, particular components will be altered.

### Alexa Integration - Yet to be implemented in prod ( work in progress )

## Live Version

- [Heroku Link](https://read-review-articles.herokuapp.com/)

![Event_management](https://user-images.githubusercontent.com/5237154/85111136-8b64c480-b231-11ea-929c-34d0ae9e04b8.png)

<!-- BUILD WITH -->

## Built With

This project was built using these technologies.

- Ruby on rails
- React JS
- Sidekiq Job Scheduler
- Redis
- Alexa [ read out the articles list on demand] ( yet to be implemented in prod)
- Firebase (yet to be used in prod)
- Rspec

### Install

To clone the repository, navigate to it's containing directory, and run:

#### Clone the repository and follow the steps to run the bot.

## Rails Setup

- \$ `git clone https://github.com/karthi07/review-articles`
- \$ `bundle install`
- \$ `rails db:migrate`
- \$ `rails db:seed`

## Redis and Sidekiq

- Install redis [ change the redis server details, if you arent using default config ]
- Start the Sidekiq using this command
  - \$ `bundle exec sidekiq`
  - Sidekiq is currently configured to run on every one hour (configurable)

* \$ `rails s`

This should install all rails gems, and start a local server where vai rails s.

Then you can you the command `rails s` in your terminial to active live application.

<!-- HOW IT WORKS -->

## How It Works

![review_articles_home](https://user-images.githubusercontent.com/5237154/85111136-8b64c480-b231-11ea-929c-34d0ae9e04b8.png)

![review_home](https://user-images.githubusercontent.com/5237154/85111402-e991a780-b231-11ea-9ef0-bcf16b92f664.png)

![user_profile_page](https://user-images.githubusercontent.com/5237154/85111591-2cec1600-b232-11ea-9f56-f108ebab7e77.png)

## Built by

👤 **Karthick Venkatesan**

- [LinkedIn](https://www.linkedin.com/in/karthickvenkadesan/)
- [GitHub](https://github.com/karthi07)
- [E-mail](itkarthi02@gmail.com)

<!-- ACKNOWLEDGEMENTS -->

## Acknowledgements

- [Microverse](https://www.microverse.org/)
- [Ruby Documentation](https://www.ruby-lang.org/en/documentation/)
- [Design idea (for twitter clone) by Gregoire Vella on Behance](https://www.behance.net/gallery/14286087/Twitter-Redesign-of-UI-details)

## Show your support

Give a ⭐️ if you like this project!

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributors-shield]: https://img.shields.io/github.com/karthi07/review-articles/issues.svg?style=flat-square
[contributors-url]: https://github.com/karthi07/review-articles/issues/
[forks-shield]: https://img.shields.io/github/forks/karthi07/review-articles.svg?style=flat-square
[forks-url]: https://github.com/karthi07/review-articles/issues/network/members
[stars-shield]: https://img.shields.io/github/stars/karthi07/review-articles.svg?style=flat-square
[stars-url]: https://github.com/karthi07/review-articles/issues/stargazers
[issues-shield]: https://img.shields.io/github/issues/karthi07/review-articles.svg?style=flat-square
[issues-url]: https://github.com/karthi07/review-articles/issues

## 📝 License

This project is [MIT](https://opensource.org/licenses/MIT) licensed.
