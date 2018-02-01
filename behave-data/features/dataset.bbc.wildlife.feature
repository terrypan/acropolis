@bbc
Feature: Test against BBC Wildlife collection
  Test whether data ingested, query parameters responses

Scenario: Ingest data
  Given Index is empty
  Given some ingested test data sample.wildlife.nq

Scenario Outline: Count proxies in BBC Wildlife
  When I request <endpoint>
  Then I should have <count> slots

  Examples:
    | endpoint       | count |
    | works          | 0     |
    | collections    | 1     |
    | assets         | 7     |
    | everything     | 25    |

Scenario Outline: Query param test
  Given I search for query <query>
  When I request index
  Then The response contains an item with label <text>

  Examples:
    | query     | text                       |
    | plantae   | 'plantae'                  |
    | snake    | 'Snake's head fritillary'  |
