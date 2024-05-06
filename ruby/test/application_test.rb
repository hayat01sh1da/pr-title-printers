require 'minitest/autorun'
require_relative '../src/application'

class ApplicationTest < Minitest::Test
  def test_run
    branch_name = 'hayat01sh1da/issue-xxxxx/service/this_is_a_test_branch'
    assert_equal(Application.run(branch_name:), '[service] This Is A Test Branch')
  end

  def test_run_in_the_case_of_hotfix
    branch_name = 'hayat01sh1da/issue-xxxxx/hotfix/service/this_is_a_test_branch'
    assert_equal(Application.run(branch_name:), '[Hotfix][service] This Is A Test Branch')
  end
end
