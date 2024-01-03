# Create test app with TinyMCE

## Create app

```console
rails new tinyEditor -T -d postgresql
rails db:setup
```

### Add rspec

```console
bundle install
rails generate rspec:install

```

## Generate app

```console
rails g scaffold Article title:string body:text
bin/rails db:migrate RAILS_ENV=development

```