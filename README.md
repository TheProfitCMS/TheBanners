# TheBanners

```ruby
git clone git@github.com:dk-iziteq/TheBanners.git
```

**Gemfile**
```ruby
gem 'the_banners', path: '../TheBanners'
```

```
bundle
```

**config/routes.rb**
```ruby
TheBanners::Routes.mixin(self)
```

```ruby
rails g the_banners install
```

```ruby
rake the_banners_engine:install:migrations
```

```ruby
rake db:migrate
```

### Insert banner on page

```ruby
= Banner.for_location('top-800-150').published.first.try(:insert)
```

### Manage banners

```ruby
= link_to t('.banners'), banners_path, class: 'list-group-item'
```

**layout.html.erb**

```ruby
= yield :the_banners_main
```

```ruby
# Banner.for_location('left-top-198-240').published.first.try(:insert, banners_proxy_url)

class Banner < ActiveRecord::Base
  include ::TheBanners::Model

  def self.locations
    %w(left-top-198-240)
  end
end
```

```ruby
TheBanners.configure do |config|
  config.images_path = ':rails_root/public/uploads/:class/:attachment/:style/:filename'
  config.images_url  = '/uploads/:class/:attachment/:style/:filename'
end
```

```ruby
class BannersController < ApplicationController
  layout 'bootstrap_default'
  include TheBanners::Controller
end
```

```ruby
- content_for :left_sidebar do
  = raw Banner.for_location('left-top-198-240').published.sample.try(:insert)
```

```ruby
TheBanners::Routes.mixin(self)
```

This project rocks and uses MIT-LICENSE.
