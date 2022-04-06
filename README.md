![](https://img.shields.io/badge/Microverse-blueviolet)
# BLOG_APP

> BLOG_APP is a web application that allows you to create, edit delete and show blogs built with ruby on rails

Additional description about the project and its features.

## Built With

- RUBY
- RUBY ON RAILS

## Gems Used

- Rubocop
- RAILS (v7)

## How to Setup

> You can simply clone or download [this repository](https://github.com/Lucas-Masaba/blog_app.git), and use your preferred browser or code editor to run this program.
- To open this project using vs code (for this example) or your code editor, you can follow the guide below:
  > In your command line navigate to where this project is located, then;
```bash
cd blog_app
```

> thereafter run
```bash
code .
```

## How to Run the App through terminal

- To run the application through terminal, make sure ruby and rails is installed in your computer then follow the guide below:
  > in your command line navigate to where this project is located, then;
```
cd blog_app
```

## Authorize New User Through Mail

- Create a new file called `local_env.yml` in the folder `config/` and paste the following code in it:
  > `PG_USERNAME: "YourPostgresUsername"`
  > `PG_PASSWORD: "YourPostgresPassword"`
  > `GMAIL_USERNAME: "YourGmailSenderUsername"`
  > `GMAIL_PASS: "YourGmailSenderPassword"`
Note: You can use your own gmail account to send emails but first you have to configure 2-Step Authorization and after that you have to configure
an APP Password for this specific application. If you want more information about this, GOOGLE IT.
- Execute `rails db:create` to create the database.
- Run `rails s` to run the application.

## Install Gems


```bash
bundle install
```

> thereafter run the below command to start the server on localhost
```bash
rails s 
```

- Visit http://localhost:3000/ on your browser to view the output.

## Tests
- To run tests, simply enter the command below in your command line
  
```bash
  rspec
```
## Author

👤 **Khusiima Luke Masaba**

- GitHub: [@Lucas-Masaba](https://github.com/Lucas-Masaba)
- Twitter: [@MasabaLuke](https://twitter.com/MasabaLuke)
- LinkedIn: [Khusiima Luke Masaba](https://linkedin.com/in/khusiima-luke-masaba)

👤 **Luis Abarca**

- GitHub: [@TheLuisAbarca](https://github.com/theLuisAbarca/)
- Twitter: [@TheLuisAbarca](https://twitter.com/TheLuisAbarca)
- LinkedIn: [Luís Anghelo Abarca Villacís](https://www.linkedin.com/in/techadvisor-luis-abarca/)
## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Thank you Microverse Team for facilitating the project requirements and resources