# :bee: beeline - a better powerline

## Installation - TL;DR version

```bash
curl -fsSL https://raw.githubusercontent.com/Willamin/beeline/master/beeline-installer | bash
```

## Installation - for Crystal veterans

Create a new Crystal app.
Add this to your app's shard.yml:

```yaml
dependencies:
  beeline:
    github: willamin/beeline
```

## Usage

1. Use the `Beeline.config` method to define your beeline. (see [examples](examples/) for inspiration)
2. Compile your app using `shards build --release`.
3. Set your prompt accordingly.
  ```bash
  export PS1="\$(path/to/your/beeline-app)")
  ```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/Willamin/beeline/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- Willamin ( https://github.com/Willamin ) Will Lewis - creator, maintainer
