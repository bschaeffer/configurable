# Configurable

**Configurable** is a personal configuration module for my
ActiveSupport::Concern dependent rails model concerns. Bam!

## Installation

This can be installed from git only. In your Gemfile:

    gem 'configurable', git: "git://github.com/bschaeffer/configurable.git"


## Usage

```ruby
module Locatable
  extend ActiveSupport::Concern
  include Configurable

  included do
    default_configuration :locatable do
      geolocate true
    end
  end

  def can_geolocate?
    locatable.geolocate
  end
end

class User
  include Locatable

  locatable.configure do
    geolocate false
  end
end

User.new.can_geolocate?
#=> false
```

