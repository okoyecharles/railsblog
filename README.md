# Rails Blog

## Built With

- Ruby, Rails, PostgreSQL

## Getting Started

### Clone-Locally

- Enter this url: [https://github.com/OkoyeCharles/railsblog](https://github.com/OkoyeCharles/railsblog) in your web browser.
- Once opened navigate to the top left level of the project a green code download button will be visible on the righthand side.
- Select download Zip option from drop down menu.
- Once the download is complete you will be able to access my project locally.

### Prerequisites

- Node package manager (latest version)
  - Firstly install **node.js** then run the code below
  ```sh
  npm install npm@latest -g
  ```
  - Check if it has been installed by running
  ```sh
  npm -v
  ```
- Ruby & Rails
  - Firstly install a package manager depending on your device (eg. brew - MacOS, choco - Windows, apt - linux).
  - Install [ruby](http://rubyinstaller.org/) then install rails with RubyGem (`gem install rails`).
  - Check if it has been installed by running
  ```sh
  ruby -v
  rails -v
  ```
- Project dependencies
  - Install all dependencies for running the project
  ```sh
  bundle install
  npm install
  ```

### Running
In order to get this app running on your local machine make sure you have installed all previously mentioned [prerequisites](#prerequisites) section, then simply run the code below.

- Run on the browser
  - This should open a port locally at [http://127.0.0.1:3000](http://127.0.0.1:3000) and [http://[::1]:3000](http://[::1]:3000) (maybe another if needed)
  ```sh
  bin/rails s
  ```
- Open the Rails Console
  - This should open an interactive irb terminal session where you can inspect behaviours of models and so on.
  ```sh
  bin/rails c
  ```

### Testing

In order to run tests for this project make sure you have installed all previously mentioned [prerequisites](#prerequisites) section, then run the code below.

- Run all tests
  - This should run all tests using 'RSpec-Rails' and (in some cases) 'Capybara'
  ```sh
  bundle exec rspec
  ```

### API

For more information about this project's API visit [this link](https://app.swaggerhub.com/apis-docs/OkoyeCharles/railsblog-api-v_1/v1)

## Author

👤 **Okoye Charles**

- GitHub: [@okoyecharles](https://github.com/okoyecharles)
- Twitter: [@okoyecharles_](https://twitter.com/okoyecharles_)
- LinkedIn: [Charles Okoye](https://linkedin.com/in/charles-k-okoye/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Thanks to Microverse for this project!