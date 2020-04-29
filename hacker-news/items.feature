Feature: |
   AS A API consumer
   I WANT to know more a specific item (story, comment, ask, etc...)
   SO THAT i can build show the full detail of an item on my application

Scenario: Trying to retrieve the detail of a story that doesn't exist
Given I have the api gateway
  And I have the path "/v0/item/99999999.json"
  And I have the method "GET"
When I run the API
Then I should receive a response with the status 200
  # And the response body at "$" should equal empty # Since the reponse body is not valid it a real challenge to test this API (content type is json but the response body is just null...)

Scenario: Retrieve the detail of an exiting story (dynamic test)
Given I have the api gateway
  And I have the path "/v0/topstories.json"
  And I have the method "GET"
When I run the API
Then I should receive a response with the status 200
  And the response body at "$[10]" should match "\d{8}"
  And add the value "$[10]" from the response body to the dataset as "storyId"
Given I have the api gateway
  And I have the path "/v0/item/{{storyId}}.json"
  And I have the method "GET"
When I run the API
Then I should receive a response with the status 200
  And the response body at "$.id" should equal {{storyId}}
  And the response body at "$.type" should equal "story"

Scenario: Retrieve the detail of an exiting story (static value test)
Given I have the api gateway
  And I have the path "/v0/item/23007860.json"
  And I have the method "GET"
When I run the API
Then I should receive a response with the status 200
  And the response body at "$.id" should equal "23007860"
  And the response body at "$.type" should equal "story"
  And the response body at "$.by" should equal "SudoAlex"
  And the response body at "$.time" should equal "1588087398"
  #And the response body at "$.kids.length" should equal "story"
  And the response body at "$.url" should equal "https://blog.digitalocean.com/vpc-trust-platform/"
  #And the response body at "$.score" should equal 325
  And the response body at "$.title" should equal "DigitalOcean VPC"
  And the response body at "$.descendants" should equal "132"
