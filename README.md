#Setup

- Clone the project
  ```shell
  git clone https://github.com/chairunnas/eFishery.git
  cd Efishery
  ```
- Install bundler
  ```shell
  gem install bundler
  ```
- Run bundle install
  ```shell
  bundle install
  ```
- Copy .env file
  ```shell
  cp env.sample .env
  ``` 
  
# Running tests
``` shell
cd Efishery
cucumber # run all feature files
cucumber features/ # run all feature files in the given folder
```
