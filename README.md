# Textblocks

## Editable, revisioned front-end texts for rails apps.

Txtblx provides a simple way to allow Active Admin users to edit interface copy.

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
Use the AbilityMixin to grant them to your user model inside your Ability-class.

    # app/models/ability.rb
    class Ability
      include CanCan::Ability
      include Txtblx::AbilityMixin

      def initialize(user)
        txtblx_abilities(user)
      end
    end

# Configuration

Txtblx uses [`auto_html`](https://github.com/dejan/auto_html) to convert text to HTML.
To change the `auto_html` config create an initializer in your app:

    # config/initializers/txtblx.rb
    Txtblx.configure do |config|
      config.auto_html_block = Proc.new do
        # you config here, for example:
        html_escape
        image
        link(:target => "_blank", :rel => "nofollow")
        simple_format
      end
    end
