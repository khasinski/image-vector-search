# README

# Requirements
- ruby 3.3.6
- [git-lfs](https://git-lfs.com/)

# Installation

Install [git-lfs](https://git-lfs.com/), clone with recurse submodules to get the test data

```bash
  git clone --recurse-submodules git@github.com:khasinski/image-vector-search.git
```

If you have already cloned the repository, you can run the following command to get the test data

```bash
  git submodule update --init --recursive
```

Install the gems, setup the database and start the server

```bash
  bundle install
  rails db:setup # This schedules a lot of background jobs
  rails s        # which will run when you start the server
```
