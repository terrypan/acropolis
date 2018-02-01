@sample
Feature: Test against dataset samples
  Testing dataset samples

## BBC Images

# Scenario: Verify proxies in BBCImages
# 	Given Index is empty
# 	Given some ingested test data sample.bbcimages.nq
# 	When I request everything
# 	When I count the amount of relevant entities that are ingested
# 	Then a proxy exists for 'http://bbcimages.acropolis.org.uk/#id'
# 	And The number of relevant entities [config.SCHEMA.Photograph] in the collection should be the same


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


