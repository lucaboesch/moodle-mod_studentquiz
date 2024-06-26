@mod @mod_studentquiz
Feature: Restore of studentquizzes in moodle exports contain old approved column
  In order to reuse my studentquizzes
  As a admin
  I need to be able to restore the moodles backups from old studentquizzes, and the state and visibility feature work normally

  Background:
    Given I make sure the current Moodle branch is greater or equal "35"
    And the following "courses" exist:
      | fullname | shortname | category |
      | Course 1 | C1        | 0        |
    And the following config values are set as admin:
      | enableasyncbackup | 0 |

  @javascript @_file_upload
  Scenario: Restore moodle backups containing old StudentQuiz activity with old approved column
    When I am on the "Course 1" "restore" page logged in as "admin"
    # Main branch has change the text to "Manage course backups" so we should use xpath.
    And I click on "(//*[@class='singlebutton']//button)[1]" "xpath_element"
    And I upload "mod/studentquiz/tests/fixtures/backup-moodle2-aggregated-before.mbz" file to "Files" filemanager
    And I press "Save changes"
    And I restore "backup-moodle2-aggregated-before.mbz" backup into a new course using this options:
    And I am on the "SQbefore" "mod_studentquiz > View" page
    Then I should see "first"
    And I should see "second"
