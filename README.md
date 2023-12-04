<br />
<a name="readme-top"></a>
<br />
<div align="center">
  <a href="https://github.com/jlbrunet/portfolio">
    <img src="app/assets/images/favicon.png" alt="Logo" width="80" height="80">
  </a>
  <h3 align="center">Paris Impro</h3>
  <p align="center">
     This application allows the students of Paris Impro to declare absences and cath them another day.
    <br />
    <br />
  </p>
</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#installation">Available scripts</a></li>
      </ul>
    </li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
  <br />
</details>


## About The Project

<br />
<div align="center"><img src="app/assets/images/parisImproImage.png" alt="presentation of portfolio" width="600" height="350"></div>
<br />

<div>This project has two interfaces :
  <ul>
    <li><b>A student interface:</b> the student can choose a date on a calendar to declare an absence on its slot times and then see the available catch-ups on another calendar to take a class another day.</li>
    <li><b>An administrator interface:</b> the director of the theater company can see all the absences and catch-ups by class and level.</li>
  </ul>
</div>


### Built With

* [![Ruby.com][Ruby.com]][Ruby-url]
* [![RoR.com][RoR.com]][RoR-url]
* [![PostgreSql.com][PostgreSql.com]][PostgreSql-url]
* [![Bootstrap.com][Bootstrap.com]][Bootstrap-url]
<br />

## Getting Started

### Prerequisites

Make sure you have the following installed on your system:

* [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
* [Rails](https://guides.rubyonrails.org/getting_started.html#installing-rails)
* [Node.js](https://nodejs.org/)
* [npm](https://www.npmjs.com/)
* [PostgreSQL](https://www.postgresql.org/download/)

### Installation

1. Clone the repo
   ```sh
   git clone git@github.com:jlbrunet/Paris_Impro_Application.git
   ```
2. Install dependencies
   ```sh
   npm install
   ```
   ```sh
   bundle install
   ```
3. Set up the database
   ```sh
   rails db:create
   ```
   ```sh
   rails db:migrate
   ```

  
### Available Scripts

Runs the app in the development mode :
```sh
dev
```

<br />

## Roadmap

- [x] Implement student interface
    - [x] Implement a dashboard for the student to see the informations of the class (level and teachers) and all the absences and catch-ups declared
    - [x] Implement a flatpickr calendar that allows the student to declare an absence on the days they usually has class
    - [x] Implement a flatpickr calendar that allows the student to declare catch-ups for all the absences they declared, on the slots available
- [x] Impletement administrator interface
    - [x] Implement a dashboard to see all the classes by day and level
    - [x] Implement a page with all the absences and catch-ups for each class with the possibility to delete one and to add more available slots to catch-up a class
    - [x] Implement a page with all the students for each class with the possibility to delete a student or change their class
<br />

## Contact

juliebrunet.pro@outlook.fr

[https://github.com/jlbrunet/portfolio](https://github.com/jlbrunet/portfolio)

<!-- MARKDOWN LINKS & IMAGES -->
[Ruby.com]: https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[Ruby-url]: https://www.ruby-lang.org/fr/
[RoR.com]: https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[RoR-url]: https://rubyonrails.org/
[PostgreSql.com]: https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white
[PostgreSql-url]: https://www.postgresql.org/
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com

