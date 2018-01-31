Feature: Test against collection queries
  Test whether collection subsets work on query param

Scenario: Ingest remarc and test query "suffolk" against Remarc(Video) collection
	Given Index is empty
	Given some ingested test data sample.remarc.nq
	When I request everything
	Then a proxy exists for 'http://remarc.acropolis.org.uk/videos#id'
	Then I should have 16 slots
	Given I search for query 'suffolk'
	When I request proxy of http://remarc.acropolis.org.uk/videos#id
	Then I should have 1 slots
	Then The response contains an item with label 'A thaw after a cold spell brought floods to Lakenheath, Suffolk in 1959.'

Scenario: Ingest remarc and test query "suffolk" against master Remarc collection
	Given Index is empty
	Given some ingested test data sample.remarc.nq
	When I request everything
	Then a proxy exists for 'http://remarc.acropolis.org.uk/#id'
	Then I should have 16 slots
	Given I search for query 'suffolk'
	When I request proxy of http://remarc.acropolis.org.uk/#id
	Then I should have 1 slots
	Then The response contains an item with label 'A thaw after a cold spell brought floods to Lakenheath, Suffolk in 1959.'

Scenario: Ingest master BBC Archive void file(stating that Remarc Archive is a subset), then ingest Remarc and test query "suffolk" against BBC Archive
	Given Index is empty
	Given some ingested test data sample.bbcmaster.void.nq
	Given some ingested test data sample.remarc.nq
	When I request everything
	Then a proxy exists for 'http://bbcmaster.acropolis.org.uk/#id'
	Then I should have 19 slots
	Given I search for query 'suffolk'
	When I request proxy of http://bbcmaster.acropolis.org.uk/#id
	Then I should have 1 slots
	Then The response contains an item with label 'A thaw after a cold spell brought floods to Lakenheath, Suffolk in 1959.'

Scenario: Ingest remarc, then ingest master BBC Archive void file(stating that Remarc Archive is a subset) and then reingest Remarc void, test query "suffolk" against against BBC Archive
	Given Index is empty
	Given some ingested test data sample.remarc.nq
	Given some ingested test data sample.bbcmaster.void.nq
	Given some ingested test data sample.remarc.void.nq
	When I request everything
	Then a proxy exists for 'http://bbcmaster.acropolis.org.uk/#id'
	Then I should have 19 slots
	Given I search for query 'suffolk'
	When I request proxy of http://bbcmaster.acropolis.org.uk/#id
	Then I should have 1 slots
	Then The response contains an item with label 'A thaw after a cold spell brought floods to Lakenheath, Suffolk in 1959.'





