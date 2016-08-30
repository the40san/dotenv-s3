# Dotenv::S3

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dotenv-s3'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dotenv-s3

## Usage
### upload

1. Create your dotenv file

2. Create your bucket

3. Run commands

```
export AWS_ACCESS_KEY_ID=your_access_key
export AWS_SECRET_ACCESS_KEY=your_secret_access_key
export AWS_REGION=your_region

bundle exec dotenv-s3 upload -b your_bucket_name -f your_dotenv_file_name
```

### download

Insert this code in your application initialization

```
Dotenv::S3.load(bucket: "your_bucket_name", filename: "your_dotenv_file_name", base64_encoded: false, kms_key_id: nil)
```

## Feature

* Base64 encode support (-m option)
* AWS Key Management Service support (-a KMS_KEY_ID option)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/the40san/dotenv-s3. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

