# RestQA : Documentation by example

> Restqa documentation by example

## Welcome

RestQa is an open source project that provides test automation workflows for any project.
Each step in an RestQa is add by plugins.

RestQa is implemented as a command line tool base on Cucumber / Gherkin.

Many of the Restqa examples used in this walkthrough are available at in this directory.
If you like this project, please give us a star!

For a complete description of the RestQa spec, please refer to our [RestQa Documentation](http://github.com/restqa/restqa)

## Table Of Content

1. [RestQa CLI](#restqa-cli)
1. [Test API](#test-api)


## RestQa CLI

In case you want to follow along with this walkthrough, here's a quick overview of the most useful RestQa command line interface (CLI) commands.

```sh
restqa steps given  # List all the available gherkin steps (given)
restqa steps when   # List all the available gherkin steps (when)
restqa steps then   # List all the available gherkin steps (then)
restqa run .        # Run the test suite
```

## Test API

RestQa relies on the plugin [RestQapi](https://restqa.io/restqapi.html) to manage the steps related to APIs.
You can find example for :
* [Hacker News API Open API without credential](./hacker-news)


