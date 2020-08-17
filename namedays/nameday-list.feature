Feature: |
   AS A api consumer
   I WANT TO get get a nameday for a specific day
   SO THAT i can build the full detail of an item on my application

@happy
Scenario: Retrieve successfully the information nameday related to a specific date
Given I have the api gateway
  And I have the path "/namedays"
  And I have the method "GET"
  And the query parameter contains "month" as "7"
  And the query parameter contains "day" as "15"
  And the header contains "accept" as "application/json"
When I run the API
Then I should receive a response with the status 200
 And the response body at "data.dates.day" should equal 15
 And the response body at "data.dates.month" should equal 7
 And the response body at "data.namedays.at" should equal "Bonaventura, Egon, Waldemar"
 And the response body at "data.namedays.bg" should equal "Vlada, Vladena, Vladimir"
 And the response body at "data.namedays.cz" should equal "Jindřich"
 And the response body at "data.namedays.de" should equal "Björn, Bonaventura, Egon"
 And the response body at "data.namedays.dk" should equal "Apostlenes deling"
 And the response body at "data.namedays.ee" should equal "Ragne, Raina, Raine, Raini"
 And the response body at "data.namedays.es" should equal "Carmelo, Carmela, Hilario, Hilaria, Fausto"
 And the response body at "data.namedays.fi" should equal "Rauna, Rauni"
 And the response body at "data.namedays.fr" should equal "Donald"
 And the response body at "data.namedays.gr" should equal "Ioulitta, Kerykos, Kirykos"
 And the response body at "data.namedays.hr" should equal "Bonaventura"
 And the response body at "data.namedays.hu" should equal "Henrik,Roland,Örkény"
 And the response body at "data.namedays.it" should equal "Bonaventura, Vescovo E Dottore Della Chiesa"
 And the response body at "data.namedays.lt" should equal "Gerimante, Mantas, Rozalija, Roze"
 And the response body at "data.namedays.lv" should equal "Egija, Egmonts, Egons, Ruta"
 And the response body at "data.namedays.pl" should equal "Daniel, Dawid, Henryk, Iga, Ignacy, Lubomysł, Niecisław, Włodzimierz, Żegota"
 And the response body at "data.namedays.ru" should equal "n/a"
 And the response body at "data.namedays.se" should equal "Ragnhild"
 And the response body at "data.namedays.sk" should equal "Henrich"
 And the response body at "data.namedays.us" should equal "Baldwin, Don, Donald, Donalda, Donna, Donnell, Donnie, Dunn, Dunne, Uriel"

@happy
Scenario: Retrieve successfully the information nameday related to a specific date and filter on the US country code
Given I have the api gateway
  And I have the path "/namedays"
  And I have the method "GET"
  And the query parameter contains "country" as "us"
  And the query parameter contains "month" as "7"
  And the query parameter contains "day" as "15"
  And the header contains "accept" as "application/json"
When I run the API
Then I should receive a response with the status 200
 And the response body at "data.dates.day" should equal 15
 And the response body at "data.dates.month" should equal 7
 And the response body at "data.namedays.us" should equal "Baldwin, Don, Donald, Donalda, Donna, Donnell, Donnie, Dunn, Dunne, Uriel"

@unhappy
Scenario: Retrieve fail due to required field (month) missing
Given I have the api gateway
  And I have the path "/namedays"
  And I have the method "GET"
  And the query parameter contains "country" as "us"
  And the query parameter contains "day" as "15"
  And the header contains "accept" as "application/json"
When I run the API
Then I should receive a response with the status 422
 And the response body at "message" should equal "The given data was invalid."
 And the response body at "errors.month.0" should equal "The month field is required."
 And the response body at "status_code" should equal 422

@unhappy
Scenario: Retrieve fail due to required field (day) missing
Given I have the api gateway
  And I have the path "/namedays"
  And I have the method "GET"
  And the query parameter contains "country" as "us"
  And the query parameter contains "month" as "2"
  And the header contains "accept" as "application/json"
When I run the API
Then I should receive a response with the status 422
 And the response body at "message" should equal "The given data was invalid."
 And the response body at "errors.day.0" should equal "The day field is required."
 And the response body at "status_code" should equal 422

@unhappy
Scenario: Retrieve fail due to required field (month and day) missing
Given I have the api gateway
  And I have the path "/namedays"
  And I have the method "GET"
  And the header contains "accept" as "application/json"
When I run the API
Then I should receive a response with the status 422
 And the response body at "message" should equal "The given data was invalid."
 And the response body at "errors.month.0" should equal "The month field is required."
 And the response body at "errors.day.0" should equal "The day field is required."
 And the response body at "status_code" should equal 422

@unhappy
Scenario: Retrieve fail due to required field (month and day) missing
Given I have the api gateway
  And I have the path "/namedays"
  And I have the method "GET"
  And the header contains "accept" as "application/json"
When I run the API
Then I should receive a response with the status 422
 And the response body at "message" should equal "The given data was invalid."
 And the response body at "errors.month.0" should equal "The month field is required."
 And the response body at "errors.day.0" should equal "The day field is required."
 And the response body at "status_code" should equal 422

@unhappy
Scenario: Retrieve fail due to incorrect country code
Given I have the api gateway
  And I have the path "/namedays"
  And I have the method "GET"
  And the query parameter contains "country" as "UU"
  And the query parameter contains "month" as "7"
  And the query parameter contains "day" as "15"
  And the header contains "accept" as "application/json"
When I run the API
Then I should receive a response with the status 400
 And the response body at "message" should equal "Wrong country code, check documentation"
 And the response body at "status_code" should equal 400

@unhappy
Scenario: Retrieve fail due to incorrect day (bigger than 31)
Given I have the api gateway
  And I have the path "/namedays"
  And I have the method "GET"
  And the query parameter contains "country" as "US"
  And the query parameter contains "month" as "12"
  And the query parameter contains "day" as "33"
  And the header contains "accept" as "application/json"
When I run the API
Then I should receive a response with the status 422
 And the response body at "message" should equal "The given data was invalid."
 And the response body at "errors.day.0" should equal "The day may not be greater than 31."
 And the response body at "status_code" should equal 422

@unhappy
Scenario: Retrieve fail due to incorrect day (not a number)
Given I have the api gateway
  And I have the path "/namedays"
  And I have the method "GET"
  And the query parameter contains "country" as "US"
  And the query parameter contains "month" as "12"
  And the query parameter contains "day" as "oups"
  And the header contains "accept" as "application/json"
When I run the API
Then I should receive a response with the status 422
 And the response body at "message" should equal "The given data was invalid."
 And the response body at "errors.day.0" should equal "The day must be a number."
 And the response body at "status_code" should equal 422

@unhappy
Scenario: Retrieve fail due to incorrect month (bigger than 12)
Given I have the api gateway
  And I have the path "/namedays"
  And I have the method "GET"
  And the query parameter contains "country" as "US"
  And the query parameter contains "month" as "15"
  And the query parameter contains "day" as "33"
  And the header contains "accept" as "application/json"
When I run the API
Then I should receive a response with the status 422
 And the response body at "message" should equal "The given data was invalid."
 And the response body at "errors.month.0" should equal "The month may not be greater than 12."
 And the response body at "status_code" should equal 422

@unhappy
Scenario: Retrieve fail due to incorrect month (not a number)
Given I have the api gateway
  And I have the path "/namedays"
  And I have the method "GET"
  And the query parameter contains "country" as "US"
  And the query parameter contains "month" as "oups"
  And the query parameter contains "day" as "13"
  And the header contains "accept" as "application/json"
When I run the API
Then I should receive a response with the status 422
 And the response body at "message" should equal "The given data was invalid."
 And the response body at "errors.month.0" should equal "The month must be a number."
 And the response body at "status_code" should equal 422
