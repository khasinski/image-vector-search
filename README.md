# README

# Requirements
- ruby 3.3.6

# Installation

Install git lfs, clone with recurse submodules to get the test data

```bash
  git lfs install
  git clone --recurse-submodules git@github.com:khasinski/image-vector-search.git
```

Install the gems, setup the database and start the server

```bash
  bundle install
  rails db:setup
  rails s
```
