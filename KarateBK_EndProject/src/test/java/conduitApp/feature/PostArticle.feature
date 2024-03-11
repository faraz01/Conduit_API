
Feature: Posting an articles on a site

Background: Defined URL
Given url 'https://conduit.productionready.io/api/'

Given path 'users/login'
# And request { "user":{"email": "afaraaz@gmail.com","password": "test123"}}
And request { "user":{"email": "kar1@test.com","password": "Karate123"}}
When method Post
Then status 200
* def token = response.user.token 

Scenario: Validate Posting an Scenarios
 
    Given header Authorization  = 'Token ' + token
    Given path 'articles'
    And request {"article": {"tagList": ["Tags"], "title": "PeterEngland","description": "Test","body": " through-script "}}
    When method Post
    Then status 201
    And match response.article.title == 'PeterEngland'
    

