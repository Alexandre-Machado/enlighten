Feature: Log out
  Background:
    Given I am logged in

  Scenario: User signs out
    Given I am on the home page
    When  I click on "Log out"
    Then  I should see "You need to sign in or sign up before continuing."
    And   I should be on the "/users/sign_in" page
