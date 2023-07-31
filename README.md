## Task Management System


## Installation

[:arrow_up: Back to top](#index)

#### Installing dependencies

- PHP >= 8.1
- MySQL >= 5.6


#### Download and setup

- Clone the repo

  **For Windows run below commands before cloning the Repo.**

  ```
  git config --global core.eol lf
  git config --global core.autocrlf false
  ```

  ```
  $ https://github.com/RafidAlRidwan/task-management-vue-laravel.git
  ```

- change directory
  ```
  $ cd task-management-vue-laravel
  ```
- Copy sample `env` file and change configuration according to your need in ".env" file and create Database
  ```
  $ cp .env.example .env
  ```
- Install php libraries
  ```
  $ composer install
  ```
  ```
  $ php artisan migrate
  ```
  ```
  $ php artisan key:generate
  ``` 
  ```
  $ npm install
  ```
- Start development server
  ```
  $ npm run serve
  ```
  ```
  $ php artisan serve
  ```

#### Use the app

## Screenshot

[:arrow_up: Back to top](#index)
    
- ![LOGIN](../assets/screenshots/login.png?raw=true)
- ![REGISTRATION](../assets/screenshots/registration.png?raw=true)
- ![DASHBOARD](../assets/screenshots/dashboard.png?raw=true)
- ![CREATE](../assets/screenshots/create.png?raw=true)
- ![ASSIGN](../assets/screenshots/assign.png?raw=true)



