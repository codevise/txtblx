# Txtblx

Revisioned, editable front-end texts.

## Installation

### Add `txtblx` to you Gemfile

   gem 'txtblx'

### Migrate your database:

   bundle exec rake db:migrate

### Load helpers in your application controller:

   helper(Txtblx::Engine.helpers)

### Use in Templates

  <h1>Welcome<h1>

  <%= txt('homepage.welcome') %>
