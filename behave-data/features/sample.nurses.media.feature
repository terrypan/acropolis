@nurses
Feature: Test against label existence dependency on media query

Only result affected is the full text search (?q=)

Scenario: /everything response
	Given Index is empty
	Given some ingested test data nurses.nq
	When I request everything
	Then I should have 6 slots

Scenario: ?q=nurse
	Given some ingested test data nurses.nq
	Given I search for query nurse
	When I request index
	Then I should have 5 slots

Scenario: ?q=hospital
	Given some ingested test data nurses.nq
	Given I search for query hospital
	When I request index
	Then I should have 2 slots

Scenario: ?q=nurse&media=image
	Given some ingested test data nurses.nq
	Given I search for query nurse
	Given I search for media image
	When I request index
	Then I should have 2 slots

Scenario: ?q=hospital&media=image
	Given some ingested test data nurses.nq
	Given I search for query hospital
	Given I search for media image
	When I request index
	Then I should have 1 slots

Scenario: ?q=nurse&media=video
	Given some ingested test data nurses.nq
	Given I search for query nurse
	Given I search for media video
	When I request index
	Then I should have 1 slots

Scenario: /everything response
	Given Index is empty
	Given some ingested test data nurses.nolabel_cw.nq
	When I request everything
	Then I should have 6 slots

Scenario: ?q=nurse
	Given some ingested test data nurses.nolabel_cw.nq
	Given I search for query nurse
	When I request index
	Then I should have 3 slots

Scenario: ?q=hospital
	Given some ingested test data nurses.nolabel_cw.nq
	Given I search for query hospital
	When I request index
	Then I should have 2 slots

Scenario: ?q=nurse&media=image
	Given some ingested test data nurses.nolabel_cw.nq
	Given I search for query nurse
	Given I search for media image
	When I request index
	Then I should have 2 slots

Scenario: ?q=hospital&media=image
	Given some ingested test data nurses.nolabel_cw.nq
	Given I search for query hospital
	Given I search for media image
	When I request index
	Then I should have 1 slots

Scenario: ?q=nurse&media=video
	Given some ingested test data nurses.nolabel_cw.nq
	Given I search for query nurse
	Given I search for media video
	When I request index
	Then I should have 1 slots
