# ImageUrl

Smart generation of image urls in usual views and action mailer views.
ImageUrl takes care of the protocol (http/https), whether or not you've
set up an asset host and your mailer's default url options.

In usual views:

<pre>
  image_url("http://www.example.com/images/image.png")
  => "http://www.example.com/images/image.png"

  image_url("images/image.png")
  # Generates a url by taking the asset host into account, if you set up one, e.g.
  => "http://assets.host.com/images/image.png"

  image_url("/images/image.png")
  # Generates a url by taking the current request's protocol, host and port into account, e.g.
  => "http://www.host.com/images/image.png"
</pre>

In action mailer views:

<pre>
  image_url("/images/image.png")
  # Generates a url by taking the asset host into account, if you set up one, e.g.
  => "http://assets.host.com/images/image.png"

  image_url("/images/image.png")
  # Generates a url by taking your default_url_options into account, e.g.
  => "http://mail.host.com/images/images.png"
</pre>

## Installation

Add this line to your application's Gemfile:

    gem "image_url"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install image_url

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

