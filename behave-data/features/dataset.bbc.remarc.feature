@bbc
Feature: Test against Remarc collection
  Test whether data ingested, query parameters responses

Scenario: Ingest data
  Given Index is empty
  Given some ingested test data sample.remarc.nq

Scenario Outline: Count proxies in Remarc
  When I request <endpoint>
  Then I should have <count> slots

  Examples:
    | endpoint       | count |
    | works          | 3     |
    | collections    | 4     |
    | assets         | 6     |
    | everything     | 16    |

Scenario Outline: Query param test
  Given I search for query <query>
  When I request index
  Then The response contains an item with label <text>

  Examples:
    | query     | text                                                                        |
    | suffolk   | 'A thaw after a cold spell brought floods to Lakenheath, Suffolk in 1959.'  |
    | odetta    | 'folk singer Odetta with J.J. Eden.'                                        |
    | chickens  | 'Chickens'                                                                  |
