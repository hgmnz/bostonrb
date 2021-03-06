Feature: Event Schedule
  As a member of the group
  I want to see the upcoming events schedule
  So that I can attend if I am available

  Scenario: A signed in user creates a recurring event
    Given I am signed up and confirmed as "email@person.com/password"
    When I sign in as "email@person.com/password"
    And I go to the homepage
    And I follow "New Event"
    And I select a date 10 days in the future for "Date"
    And I fill in "Title" with "Hackfest"
    And I fill in "Location" with "41 Winter Street, Boston, MA, 02018"
    And I check "Recurring"
    And I fill in "Description" with "Hack away"
    And I press "Create"
    Then I should see "Events"
    And I should see "Hackfest"
    And I should see "Hack away"

  Scenario: Recurring events on the homepage
    Given a future special event exists with a title of "Barcamp Boston"
    Given a future recurring event exists with a title of "Hackfest"
    And a future recurring event exists with a title of "Meeting"
    And a future recurring event exists with a title of "Pub Night"
    And a future recurring event exists with a title of "Theatre"
    When I go to the homepage
    Then I should see "Events"
    And I should see "Hackfest" under events
    And I should see "Meeting" under events
    And I should see "Pub Night" under events
    And I should see "Theatre" under events
    And I should not see "Barcamp Boston" under events

 Scenario: Special events on the homepage
   Given a future special event exists with a title of "Barcamp Boston"
   When I go to the homepage
   And I should see "Barcamp Boston" under other events

 Scenario: Viewing details about an event
   Given a future recurring event exists with a title of "Hackfest"
   And the "Hackfest" event's location is "41 Winter Street, Boston, MA, 02108"
   When I go to the homepage
   And I follow "Hackfest"
   Then I should see "Hackfest"
   And I should see "41 Winter Street, Boston, MA, 02108"
   And I should see a map

  Scenario: Viewing number of events
    Given a future special event exists with a title of "Barcamp Boston"
    Given a future recurring event exists with a title of "Hackfest"
    And a future recurring event exists with a title of "Meeting"
    And a future recurring event exists with a title of "Pub Night"
    And a future recurring event exists with a title of "Theatre"
    When I go to the homepage
    Then I should see that there are 5 future events
