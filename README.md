# 📱 Norm-Nasa API
> Back end for the Norm Nasa app.

Introdution/Description of what the program does.

## ⚙️ Initial Setup

OS X & Linux:

```sh
bundle
rails s (to spin up the server)
```

## 🕹 How to Use

get "/api/v1/nasa"
Returns the top 5 latest NASA pic of the day tweets with image URLs.

post "/api/v1/nasa"
params = { search: }
Returns the top 5 NASA pic of the day tweets based on your search term.

post "/api/v1/users"
params = { email: password: }
Creates a site user when given a unique email and a password. Returns the users API key.

get "/api/v1/users"
params = { email: password: }
Returns the user's API key when given the correct email and a password.


post "/api/v1/favorites"
params = {api_key: text: url: }
Saves the user's favorite.

get "/api/v1/favorites"
params = {api_key: }
Returns the user's favorites.

## 🚧 Known Issues

Describe the app's known limitations/problems

Sometime NASA tweets don't include links so the Pic of the Day "About" page is returned instead.

## 📊 How to Run Tests

OS X & Linux:

```sh
bundle exec rspec (to run tests)
```

## 🏗 Tech Stack List

* Ruby v 2.5
* Rails 5
* RSPEC

## 📥 How To Contribute

1. Fork this repo
2. Create your feature branch (`git checkout -b feature/thingamajig`)
3. Commit your changes (`git commit -am 'Added a cool doodad!'`)
4. Push to the branch (`git push origin feature/thingamajig`)
5. Create a new Pull Request

## 🚀 Core Contributors

**Norm Schultz**
Twitter:[@normanrs](https://twitter.com/normanrs)
Github:[https://github.com/normanrs](https://github.com/normanrs/)
Web:[http://www.normanrschultz.com](http://www.normanrschultz.com)
