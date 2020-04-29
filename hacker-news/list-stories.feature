@skip
Feature: |
   AS A API consumer
   I WANT to know more about the hacker storis
   SO THAT i can build a nice application relying on the best stop stories

## Top stories

Scenario: List the tops stories without filter
Given I have the api gateway
  And I have the path "/v0/topstories.json"
  And I have the method "GET"
When I run the API
Then I should receive a response with the status 200
  And the response list should contain 500 item
  And the response body at "$[5]" should match "\d{8}"

Scenario: List the tops stories with the pretty query parameter
Given I have the api gateway
  And I have the path "/v0/topstories.json"
  And I have the method "GET"
  And the query parameter contains "print" as "pretty"
When I run the API
Then I should receive a response with the status 200
  And the response list should contain 500 item
  And the response body at "$[499]" should match "\d{8}"

## Best stories

Scenario: List the best stories without filter
Given I have the api gateway
  And I have the path "/v0/beststories.json"
  And I have the method "GET"
When I run the API
Then I should receive a response with the status 200
  And the response list should contain 200 item
  And the response body at "$[5]" should match "\d{8}"

Scenario: List the best stories with the pretty query parameter
Given I have the api gateway
  And I have the path "/v0/beststories.json"
  And I have the method "GET"
  And the query parameter contains "print" as "pretty"
When I run the API
Then I should receive a response with the status 200
  And the response list should contain 200 item
  And the response body at "$[199]" should match "\d{8}"

## new stories

Scenario: List the new stories without filter
Given I have the api gateway
  And I have the path "/v0/newstories.json"
  And I have the method "GET"
When I run the API
Then I should receive a response with the status 200
  And the response list should contain 500 item
  And the response body at "$[5]" should match "\d{8}"

Scenario: List the new stories with the pretty query parameter
Given I have the api gateway
  And I have the path "/v0/newstories.json"
  And I have the method "GET"
  And the query parameter contains "print" as "pretty"
When I run the API
Then I should receive a response with the status 200
  And the response list should contain 500 item
  And the response body at "$[499]" should match "\d{8}"

Scenario: List the new stories with the a random parameter
Given I have the api gateway
  And I have the path "/v0/newstories.json"
  And I have the method "GET"
  And the query parameter contains "foo" as "bar"
When I run the API
Then I should receive a response with the status 200
  And the response list should contain 500 item
  And the response body at "$[499]" should match "\d{8}"

Scenario: List the new stories with the a random print value parameter
Given I have the api gateway
  And I have the path "/v0/newstories.json"
  And I have the method "GET"
  And the query parameter contains "print" as "pr"
When I run the API
Then I should receive a response with the status 200
  And the response list should contain 500 item
  And the response body at "$[499]" should match "\d{8}"

## Ask stories

@wip
Scenario: List the ask stories without filter
Given I have the api gateway
  And I have the path "/v0/askstories.json"
  And I have the method "GET"
When I run the API
Then I should receive a response with the status 200
  And the response list should contain 200 item
  And the response body at "$[5]" should match "\d{8}"

@wip
Scenario: List the ask stories with the pretty query parameter
Given I have the api gateway
  And I have the path "/v0/askstories.json"
  And I have the method "GET"
  And the query parameter contains "print" as "pretty"
When I run the API
Then I should receive a response with the status 200
  And the response list should contain 200 item
  And the response body at "$[199]" should match "\d{8}"

## Job stories

@wip
Scenario: List the job stories without filter
Given I have the api gateway
  And I have the path "/v0/jobstories.json"
  And I have the method "GET"
When I run the API
Then I should receive a response with the status 200
  And the response list should contain 200 item
  And the response body at "$[5]" should match "\d{8}"

@wip
Scenario: List the job stories with the pretty query parameter
Given I have the api gateway
  And I have the path "/v0/jobstories.json"
  And I have the method "GET"
  And the query parameter contains "print" as "pretty"
When I run the API
Then I should receive a response with the status 200
  And the response list should contain 200 item
  And the response body at "$[199]" should match "\d{8}"

## show stories

@wip
Scenario: List the show stories without filter
Given I have the api gateway
  And I have the path "/v0/showstories.json"
  And I have the method "GET"
When I run the API
Then I should receive a response with the status 200
  And the response list should contain 200 item
  And the response body at "$[5]" should match "\d{8}"

@wip
Scenario: List the show stories with the pretty query parameter
Given I have the api gateway
  And I have the path "/v0/showstories.json"
  And I have the method "GET"
  And the query parameter contains "print" as "pretty"
When I run the API
Then I should receive a response with the status 200
  And the response list should contain 200 item
  And the response body at "$[199]" should match "\d{8}"
