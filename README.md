# Txtblx

Revisioned, editable front-end texts.

## Installation

### Add `txtblx` to you Gemfile

    gem 'txtblx'

### Migrate your database:

    bundle exec rake txtblx:install:migrations
    bundle exec rake db:migrate

### Load helpers in your application controller:

    helper(Txtblx::Engine.helpers)

### Use in Templates

    <h1>Welcome<h1>

    <%= txt('homepage.welcome') %>


## Active Admin Integration

Txtblx comes with an ActiveAdmin page to manage Textblocks


### CanCan Integration

Txtblx provides default CanCan Abilities for its model.
Use the AbilityMixin to grant them to your user model.

    class Ability
      include CanCan::Ability
      include Txtblx::AbilityMixin

      def initialize(user)
        txtblx_abilities(user)
      end
    end
