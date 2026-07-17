# frozen_string_literal: true
# rbs_inline: enabled

require 'minitest/autorun'
require_relative '../lib/spreen_pr'

class ApplicationTest < Minitest::Test
  def test_run
    branch_name = 'hayat01sh1da/issue-xxxxx/service/this_is_a_test_branch'

    assert_equal('[service] This Is A Test Branch', SpreenPr::Application.run(branch_name:))
  end

  def test_run_in_the_case_of_hotfix
    branch_name = 'hayat01sh1da/issue-xxxxx/hotfix/service/this_is_a_test_branch'

    assert_equal('[Hotfix][service] This Is A Test Branch', SpreenPr::Application.run(branch_name:))
  end

  def test_run_in_the_case_of_kebab_case_summary
    branch_name = 'hayat01sh1da/issue-xxxxx/service/this-is-a-test-branch'

    assert_equal('[service] This Is A Test Branch', SpreenPr::Application.run(branch_name:))
  end

  def test_labels
    branch_name = 'hayat01sh1da/issue-xxxxx/service/this_is_a_test_branch'

    assert_equal(['service'], SpreenPr::Application.new(branch_name:).labels)
  end

  def test_labels_in_the_case_of_hotfix
    branch_name = 'hayat01sh1da/issue-xxxxx/hotfix/service/this_is_a_test_branch'

    assert_equal(%w[Hotfix service], SpreenPr::Application.new(branch_name:).labels)
  end

  def test_to_h
    branch_name = 'hayat01sh1da/issue-xxxxx/hotfix/service/this_is_a_test_branch'

    assert_equal(
      { title: '[Hotfix][service] This Is A Test Branch', labels: %w[Hotfix service] },
      SpreenPr::Application.new(branch_name:).to_h
    )
  end

  def test_run_raises_on_a_branch_name_with_too_few_segments
    error = assert_raises(ArgumentError) { SpreenPr::Application.run(branch_name: 'main') }

    assert_match(/does not match the expected/, error.message)
  end

  def test_run_raises_on_a_branch_name_with_empty_segments
    assert_raises(ArgumentError) do
      SpreenPr::Application.run(branch_name: 'hayat01sh1da//service/this_is_a_test_branch')
    end
  end

  def test_run_raises_on_an_empty_branch_name
    assert_raises(ArgumentError) { SpreenPr::Application.run(branch_name: '') }
  end
end
