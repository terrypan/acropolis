@sample
Feature: Test against dbpedialite sample as is verus as RES optimised


Scenario Outline: Count proxies in dbpedialite entry
  Given Index is empty
  Given some ingested test data dbpedialite-17503.nq
  When I request <endpoint>
  Then I should have <count> slots

  Examples:
    | endpoint       | count |
    | works          | 0     |
    | collections    | 0     |
    | assets         | 1     |

Scenario Outline: Count proxies in dbpedialite entry
  # Given Index is empty
  Given some ingested test data dbpedialite-17503.doc_format.nq
  When I request <endpoint>
  Then I should have <count> slots

  Examples:
    | endpoint       | count |
    | works          | 0     |
    | collections    | 0     |
    | assets         | 2     |
