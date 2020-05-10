Feature: super

Scenario: This is my scenario
Given I open the page "login"
  And I am on the section "login"
When I type "hello" in the element "username"
  And I type "hello" in the element "password"
  And I click on "signIn"
Then the text of the element "errorLabel" should be "Incorrect username or password."

