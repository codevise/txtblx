# Textblocks

[![Gem Version](https://badge.fury.io/rb/txtblx.svg)](http://badge.fury.io/rb/txtblx)
[![Build Status](https://travis-ci.org/codevise/txtblx.svg?branch=master)](https://travis-ci.org/codevise/txtblx)
[![Code Climate](https://codeclimate.com/github/codevise/txtblx/badges/gpa.svg)](https://codeclimate.com/github/codevise/txtblx)
[![Test Coverage](https://codeclimate.com/github/codevise/txtblx/badges/coverage.svg)](https://codeclimate.com/github/codevise/txtblx)


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

There are two sets of abilities:

   * Full
   * Editor can only change text and may not create or delete textblocks.

Use the AbilityMixin to grant them to your user model inside your Ability-class.

    # app/models/ability.rb
    class Ability
      include CanCan::Ability
      include Txtblx::AbilityMixin

      def initialize(user)
        txtblx_editor_abilities(user)

        if user.admin?
          txtblx_full_abilities(user)
        end
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
