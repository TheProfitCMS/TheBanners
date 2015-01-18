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

This project rocks and uses MIT-LICENSE.
