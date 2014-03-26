Feature: squeeze the deputies
  
  @javascript
  Scenario: when I fill the form correctly
    Given I'm in "the homepage"
    And I fill in "the first name field" with "Nícolas"
    And I fill in "the last name field" with "Iensen"
    And I fill in "the email field" with "nicolas@meurio.org.br"
    When I press "the squeeze form submit button"
    Then I should be in "the homepage"
    And an email called "don't let them limit our access to the Internet" should be sent
    And an email called "you can't negotiate the neutrality of the Internet" should be sent
    And I should see the following squeeze in the database:
      | first_name  | Nícolas               |
      | last_name   | Iensen                |
      | email       | nicolas@meurio.org.br |

  @javascript
  Scenario: when I don't fill the form correctly
    Given I'm in "the homepage"
    When I press "the squeeze form submit button"
    Then I should see "the first name field with error"
    And I should see "the last name field with error"
    And I should see "the email field with error"
