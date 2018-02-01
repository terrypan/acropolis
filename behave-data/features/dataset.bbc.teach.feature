@bbc
# Add episode name for cw to show up correctly
Feature: Test against BBC Teach collection
  Test whether data ingested, query parameters responses

Scenario: Ingest data
  Given Index is empty
  Given some ingested test data sample.bbcteach.v1.nq

Scenario Outline: Count proxies in Teach
  When I request <endpoint>
  Then I should have <count> slots

  Examples:
    | endpoint       | count |
    | works          | 4     |
    | collections    | 1     |
    | assets         | 2     |
    | everything     | 9     |

Scenario Outline: Query param test
  Given I search for query <query>
  When I request index
  Then The response contains an item with label <text>

  Examples:
    | query      | text                                                   |
    | murder     | 'Act 3 Scene 1 - The murder scene'                     |
    | macbeth    | 'Macbeth Act 1 Scene 7 – Macbeth’s dilemma (workshop)' |
