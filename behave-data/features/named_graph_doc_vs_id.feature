@sample
Feature: Test against id (NIR) vs doc (IR) as named graph

Scenario Outline: Count proxies in BBCImages
  Given Index is empty
  Given some ingested test data sample.bbcimages.named_graph_doc.nq
  When I request <endpoint>
  Then I should have <count> slots

  Examples:
    | endpoint       | count |
    | works          | 2     |
    | collections    | 1     |
    | assets         | 4     |

Scenario Outline: Count proxies in BBCImages
  Given Index is empty
  Given some ingested test data sample.bbcimages.named_graph_id.nq
  When I request <endpoint>
  Then I should have <count> slots

  Examples:
    | endpoint       | count |
    | works          | 2     |
    | collections    | 1     |
    | assets         | 4     |
