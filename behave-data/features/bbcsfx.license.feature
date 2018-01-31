Feature: Test against v1 and v2 of bbcsfx
  Testing dataset update


Scenario: Ingest v1
	Given Index is empty
	Given some ingested test data sample.bbcsfx.nq
	When I request everything
	Then A proxy exists for "http://bbcsfx.acropolis.org.uk/terms#id"
	And I should have 10 slots
	And the response contains an item with label "Accessible by all users under the Open Government Licence."

Scenario: Ingest v1 works
	# Given Index is empty
	Given some ingested test data sample.bbcsfx.nq
	When I request works
	Then A proxy exists for "http://bbcsfx.acropolis.org.uk/00008000#id"
	And I should have 2 slots



Scenario: Ingest v2
	# Given Index is empty
	# Given some ingested test data sample.bbcsfx.nq
	Given some ingested test data sample.bbcsfx.remarc_license.nq
	When I request everything
	Then A proxy exists for "http://bbcsfx.acropolis.org.uk/terms#id"
	And I should have 10 slots
	And the response contains an item with label "Accessible by all users under the Remarc Licence."

Scenario: Ingest v2 works
	# Given Index is empty
	# Given some ingested test data sample.bbcsfx.nq
	Given some ingested test data sample.bbcsfx.remarc_license.nq
	When I request works
	Then A proxy exists for "http://bbcsfx.acropolis.org.uk/00008000#id"
	And I should have 2 slots

