# Rails 7 turbo with tinymce-rails

This is working example Rails 7 with turbo and tinymce-rails

## Gems versions

* ruby 3.1.2
* rails (7.0.4)
* tinymce-rails (6.3.1)
* tinymce-rails-langs (6.20220429)
* turbo-rails (1.3.2)

## Install

```console
% git clone git@github.com:sergey-arkhipov/rails_tinyMCE.git
 
% copy config/database.yml.example config/database.yml

% bundle install

% rails db:create db:migrate db:seed
```

## How to run the test suite

```console
% bundle exec rspec -f d
```

## Description

Test case includes  two links

* with data: {turbo: false}
* without  data: {turbo: false}

Tests reveal that two repeated clicks on a link without data: {turbo: false} results in the tinyMCE not being displayed.

At the same time, clicking on the link with data: {turbo: false} turned off ensures the normal operation of the tinyMCE
