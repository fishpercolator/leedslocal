# Leedslocal

This is the documentation for maintainers and developers of the Leedslocal web app.

This app follows the [Twelve-Factor](https://12factor.net/) specification, and this should be kept in mind when developing for it.

## Configuration

The app is configured using environment variables. On Heroku these can be configured using the `heroku:config` command, and on your development environment they can be either added to the `docker-compose.yml` or you can install the [dotenv](https://github.com/bkeepers/dotenv) gem to manage them locally.

Variables that can be used to configure the app are:

* **RAILS_MAX_THREADS**: Number of threads the puma server will use
* **DOMAIN_NAME**: The canonical domain name of the site.
* **DOMAIN_IN_EMAIL_LINKS**: Override the above for email links specifically (e.g. if you need to add a port number or email links have a short domain name). Leave unset to use DOMAIN_NAME.
* **EMAIL_FROM**: The name and email address that will be used for 'From' in emails sent by this platform. Make sure the DKIM & SPF settings are correct for this domain with respect to your email sending service (e.g. SendGrid; see below).

## Getting a development environment

### Installation

Getting a development environment is easy on a Linux or Mac computer. You'll need the [Docker](https://www.docker.com/get-started) and [Docker Compose](https://docs.docker.com/compose/) tools installed to proceed.

Assuming you have the `docker` and `docker-compose` tools in your path, all you need to do to create a development environment is:

```sh
cd ~/path/to/leedslocal
./bin/bootstrap
```

What this does:

1. Creates a docker image for your development environment, based on the provided `Dockerfile`
2. Installs the gems in `Gemfile` to your local repo in `vendor/bundle`.
3. Installs the yarn packages in `package.json` to your local repo in `node_modules`.
4. Creates a database and populates it with an initial admin user.

### Usage

Once you've created your development environment, you can bring it online with:

    docker-compose up

This starts the database, the web server, and a [webpack-dev-server](https://github.com/webpack/webpack-dev-server) with hot module replacement (so you can edit JS/CSS files without having to reload the page).

You can then access your development environment at <http://localhost:3000/>

If you need to get a shell, for example to run the Rails console, you can do:

    docker-compose run web bash

The bootstrap script create an admin user who should be able to access the admin interface at <http://localhost:3000/admin>. The email is **admin@example.com** and the password is **password**.

### Installing gems and yarn packages

After updating the `Gemfile` or `package.json`, you'll need to install the new gem or yarn package. To do this:

    docker-compose run web bundle
    # or
    docker-compose run web yarn

## Deploying to Heroku

The app already conforms to the Twelve-Factor specification and has a Procfile with all the information Heroku needs to get going.

You'll need the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) installed to run these commands:

To deploy it to Heroku, you can do:

```sh
cd ~/path/to/leedslocal
# Replace leedslocal with the name of the new heroku app
heroku apps:create --region eu leedslocal
git push heroku master
```

The app should install all its dependencies and create the database automatically.

To get a Rails console on Heroku (e.g. for assigning the admin role to a user):

```sh
heroku run rails c
````

To deploy a new version:

```sh
git push heroku master
```

Or you can set up automatic deploys through the Heroku dashboard. If you're using GitHub & Codeship you can integrate this with your Codeship CI, so the new version is only deployed if the tests pass.

## Codeship CI

The app is configured for continuous integration using [Codeship Pro](https://codeship.com/features/pro). If you use GitHub, you can set up your app for continuous integration by going to the Codeship dashboard and following these steps:

1. Click on 'Projects', then 'New Project'
2. Click on GitHub and authorize your organisation
3. Select your organisation and repository and click 'Connect'
4. Select 'Pro' as the type of Codeship you want to use
5. Make a change, e.g. to this README, and push it to GitHub
6. Go back to the dashboard and you should see your first build, hopefully running and passing.

The first time will take a while as everything builds, but future builds will use the cache.

## Features

### Rails

This is a [Rails](https://rubyonrails.org/) 5.x application, and comes with all the usual Rails stuff, plus the following additional important components.

### Bulma UI

The user interface is derived from [Bulma](https://bulma.io/documentation/), in its modular Sass mode. The CSS is compiled in Webpack from the `app/javascript/scss/application.scss` file and everything it includes. Remember to include Bulma features before you use them.

### Javascript

Frontend Javascript is based on the [Stimulus](https://stimulusjs.org/) framework. You can create a new JS controller by adding a file to `app/javascript/controllers` and then naming that controller in your HTML by adding a `data-controller` attribute to the parent element of the UI feature you want to control.

Because this is Webpack, Babel is enabled so you can use all the features of ES7 which will then be transpiled down to a browser-compatible form.

### Haml

Most web views are written in the concise [Haml](http://haml.info/) templating language. This is a concise version of HTML but should be instantly familiar to anyone who knows HTML.

### Devise

User management and authorization is provided by [Devise](https://github.com/plataformatec/devise) and is subject to all the documentation there.

### Active Admin

The administration interface is based on [Active Admin](https://activeadmin.info/) and is accessible on your site at the `/admin` URL.

You will need to be signed in as a user with role `:admin` to access the admin interface. If you need to assign this role to an existing user from the Rails console you can do it like this:

```ruby
User.find_by(email: 'admin@example.com').update(role: :admin)
```

### Pundit

All controller actions are authorized by [Pundit](https://github.com/varvet/pundit) policies. This allows us to ensure only the right users are allowed to do the right things at any given time.

Policies are located in `app/policies` and can be applied using the `policy_scope` method (for indexes) and the `authorize` method (for other controller actions). There are some guards to ensure these methods are called. If you write a new controller action that definitely doesn't need authorization, you can skip these: see the `HomeController` for an example.

### Simple form

Forms are normally managed by [Simple Form](https://github.com/plataformatec/simple_form), with a custom integration into the Bulma widget set. The customizations are in the `config/initializers/simple_form_bulma.rb` file.

### Meta tags

Meta tags are automatically provided by the [MetaTags](https://github.com/kpumuk/meta-tags) gem.

Titles for pages are normally set in the views using the `title` helper with an I18n string called `title` at an appropriate place on the page; for example:

    = title t('.title')

### Testing: RSpec & Spinach

Unit tests, API tests (if any) and policy tests are all done in regular rspec. All the config can be found in `spec/spec_helper.rb` and `spec/rails_helper.rb`.

To run these tests:

    ./bin/rspec

Integration tests are written in [Spinach](http://codegram.github.io/spinach/), using the acceptance criteria (in Gherkin format) in the `features/` directory. Spinach is extremely similar to Cucumber, but encourages the use of one-time steps which are scoped to a specific feature.

The development environment integrates a headless Chromium browser, which can be used to test JavaScript. If you want to use this, just add the `@javascript` tag to the feature and it will be automatically enabled in Capybara.

To run these tests:

    ./bin/spinach

### Bundler Audit

[Bundler Audit](https://github.com/rubysec/bundler-audit) is a tool that looks for security advisories against any of the gems in your Gemfile. It's recomended to run this regularly (such as in the Codeship CI) and update the gems when it reports issues.
