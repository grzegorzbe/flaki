# Find Lovely Allocated Kinky Invaders

This application tries to find all hidden invaders that were detected with a radar.

Assumptions:

- [x] it should work for correct input
- [x] it should finish before nails get visibly longer
- [x] classes should be small
- [x] nested modules in use
- [x] library code separated from actual runner code
- [ ] fully tested (almost, no time for more at the moment)

Limitations (due to time constraint):

- no error handling, app is very optimistic
- no fancy loaders, inputs are taken from consts
- it's not very optimal and uses naive approach whenever needed

## Requirements

- Ruby 2.6+

## Running the app

To run the application do:

```bash
./flaki.rb
```

or invoke Ruby explicitly:

```bash
ruby flaki.rb
```

## Running tests

Specs can be run with simple:

```bash
bundle exec rspec
```
