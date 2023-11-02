## Vet clinic

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
  <!-- - [🚀 Live Demo](#live-demo) -->
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Vet clinic database: animals table <a name="about-project"></a>

**vet clinic database** project is a database management system designed for a veterinary clinic. It uses PostgreSQL to store and manage data related to animals, including their names, birth dates, weights, neutering status, and escape attempts. The project includes SQL scripts for creating the database schema, inserting data, and querying the data. It's designed to help the clinic keep track of their animal patients and manage their data efficiently.


## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>
<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
  <ul>
    <li><a href="https://www.postgresql.org/">SQL scripts</a></li>
  </ul>
</details>
<!-- LIVE DEMO -->
<!-- 
## 🚀 Live Demo <a name="live-demo"></a>


- [Project not yet deployed](<replace-with-your-deployment-URL>)

<p align="right">(<a href="#readme-top">back to top</a>)</p> -->

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

These instructions will guide you through the process of setting up and using the PostgreSQL database for the vet clinic database project.

### Prerequisites

Before you get started, make sure you have the following prerequisites installed:

- PostgreSQL: Ensure PostgreSQL is installed on your system. </br>
- pgAdmin: (Optional) A popular GUI tool for managing PostgreSQL, recommended for easier database administration.

### Setup

Clone this repository to your desired folder:

```sh
  git https://github.com/peter-mwovi/Vet-clinic-database.git
```

### Install

Install this project with:

- Create a new PostgreSQL database for your project. You can do this using the command-line tool or a GUI like pgAdmin.


```sh
 createdb vet-clinic
```

- Import the initial schema and data (if applicable) into your database. You might find SQL dump files (*.sql) or other instructions in the project's db/ directory.

```sh
psql -d vet-clinic -a -f db/schema.sql
```

- Update your database connection settings in the project's configuration file, if necessary.

### Usage

Here are some common database operations and how to perform them:

Connecting to the Database
To connect to your database using the command-line tool, use the following command:

```sh
 psql -U root -d vet-clinic
```

### Run tests

To run tests, run the following command:

```sh

  npx stylelint "**/*.{css,scss}" (--fix option)

  npx eslint "**/*.{js,jsx}" (--fix option)
```
<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Peter Mwovi**

- GitHub: [@githubhandle](https://github.com/peter-mwovi/)
- Twitter: [@twitterhandle](https://twitter.com/mwovi_peter)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in peter-mwovi-57141a179/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [Development of all front end components]
- [Development of back end logic]
- [Testing of front and back end components]
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project, please support me with a like or a star.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

Thank you to my learning partners and the staff at Microverse.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
