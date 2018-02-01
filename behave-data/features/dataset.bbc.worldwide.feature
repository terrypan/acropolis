@bbc
Feature: Test against BBC Worldwide collection
  Test whether data ingested, query parameters responses

Scenario: Ingest data
  Given Index is empty
  Given some ingested test data sample.worldwide.nq

Scenario Outline: Count proxies in Worldwide
  When I request <endpoint>
  Then I should have <count> slots

  Examples:
    | endpoint       | count |
    | works          | 2     |
    | collections    | 1     |
    | assets         | 2     |
    | everything     | 10    |

Scenario Outline: Query param test
  Given I search for query <query>
  When I request index
  Then The response contains an item with label <text>

  Examples:
    | query     | text                                      |
    | rare      | 'Rare Snow Leopard Cubs Born'             |
    | moffat    | 'Fan Q&A With Sue Vertue & Louis Moffat'  |
