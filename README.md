🚨 **NOTE:** We've archived the original repo but are leaving it here for posterity. We're still actively building Synth but focusing less on the OSS side of the app and more on the "community" parts of the data.

---

# Synth: Modern fintech tools for modern businesses

Synth aims to build a modern fintech stack and data platform for modern businesses.

We're aiming to be hyper-transparent, fully open-source and community-driven.

This codebase is currently in a very early stage of development.

In addition, much of the data that is used in the app is not open-source (due to licensing restrictions). We're working on making as much of the data open-source as possible, but the reality is that some of the data will need to be licensed from third parties in order to be useful.

Where possible we'll at least provide sample data so that you can get the app working locally.

## Codebase

The codebase is vanilla [Rails](https://rubyonrails.org/) and [Postgres](https://www.postgresql.org/). Quite a simple setup.

## Setup

You'll need:

- ruby >3 (specific version is in `Gemfile`)
- postgresql (if using stock `config/database.yml`)

```shell
cd maybe
bundle install
rails db:setup
```

You can then run the rails web server:

```shell
bin/dev
```

And visit [http://localhost:3000](http://localhost:3000)

## External Services

- Currently the app relies either Google or GitHub for authentication. The easiest of which to set up is GitHub.
- In order to successfully run `rails db:setup` you will also need to create a [GeoNames](https://www.geonames.org/) account to be used by the [Timezone](https://github.com/panthomakos/timezone) gem.

You can find the necessary API keys in `.env.example`, which you can copy to `.env` and fill in the values.

## Contributing

It's still very early days for this so your mileage will vary here and lots of things will break.

But almost any contribution will be beneficial at this point. Check the [current Issues](https://github.com/maybe-finance/synth/issues) to see where you can jump in!

If you've got an improvement, just send in a pull request!

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

If you've got feature ideas, simply [open a new issues](https://github.com/maybe-finance/synth/issues/new)!

## Community

- Join the conversation in our [Discord](https://discord.gg/rDZFvtGcxx)
- Follow us on [Twitter](https://twitter.com/synth_finance)
