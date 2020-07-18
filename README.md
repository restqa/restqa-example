# RestQA : Documentation by example

> Let's simplify the documentation by sharing functional example 🥳

## Welcome

RestQa is an open source project that provides test automation workflows for any project.
Each step in an RestQa is add by plugins.

RestQa is implemented as a command line tool base on Cucumber / Gherkin.

Many of the Restqa examples used in this walkthrough are available at in this directory.
If you like this project, please give us a star!

For a complete description of the RestQa spec, please refer to our [RestQa Documentation](http://github.com/restqa/restqa)

## Table Of Content

1. [RestQa CLI](#restqa-cli)
1. [API Testing](#api-testing)
	2. 	Hacker News
1. [Continuous Integration](#continuous-integration)
	2. Github Action
	3. Gitlab CI


## RestQa CLI

In case you want to follow along with this walkthrough, here's a quick overview of the most useful RestQa command line interface (CLI) commands.

```sh
restqa steps given  # List all the available gherkin steps (given)
restqa steps when   # List all the available gherkin steps (when)
restqa steps then   # List all the available gherkin steps (then)
restqa run .        # Run the test suite
```

## API Testing

RestQa relies on the plugin [RestQapi](https://restqa.io/restqapi.html) to manage the steps related to APIs.
You can find example for :
* [Hacker News API Open API without credential](./hacker-news)


## Continuous Integration

### Using Github Action

If you want to use the script on github action:

1. Create a new file in your repository : `.github/workflows/e2e.yml`
2. Copy paste the informations in your `.github/workflows/e2e.yml`:

Access the information about the [RestQa Github action](https://github.com/restqa/restqa-action)

Example: 

```
name: E2E

on: [push]

jobs:
  RestQa:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - uses: restqa/restqa-action@0.0.1
      with:
        path: 'test/'
```

### Using Gitlab CI


If you want to use the script on gitlabCI:

1. Create a new file in your repository : `.gitlab-ci.yml`
2. Copy paste the informations in your `.gitlab-ci.yml`:

```
stages:
  - e2e-test

RestQa:
  stage: e2e-test
  image:
    name: 'restqa/restqa'
  script:
    - 'restqa run .'
#   - 'restqa run -c .restqa.yml .' # if you want to add arguments
```

### Using Bitbucket Pipeline


If you want to use the script on Bitbucket pipeline:

1. Create a new file in your repository : `bitbucket-pipelines.yml`
2. Copy paste the informations in your `bitbucket-pipelines.yml`:

```

pipelines:
  default:
    - step:
      image: restqa/restqa
      script:
        - restqa run .
    #   - 'restqa run -c .restqa.yml .' # if you want to add arguments
```


