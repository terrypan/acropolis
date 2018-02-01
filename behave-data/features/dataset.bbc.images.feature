@bbc
Feature: Test against BBC Images collection
  Test whether data ingested, query parameters responses

Scenario: Ingest data
  Given Index is empty
  Given some ingested test data sample.bbcimages.nq

Scenario Outline: Count proxies in BBC Images
  When I request <endpoint>
  Then I should have <count> slots

  Examples:
    | endpoint       | count |
    | works          | 2     |
    | collections    | 1     |
    | assets         | 4     |
    | everything     | 10    |

Scenario Outline: Query param test
  Given I search for query <query>
  When I request index
  Then The response contains an item with label <text>

  Examples:
    | query     | text                             |
    | andrew    | 'ANDREW PRINCE DUKE OF YORK 1'   |
    | gerry     | 'Adams Gerry'                    |

