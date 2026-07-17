# frozen_string_literal: true
# rbs_inline: enabled

require 'json'
require 'minitest/autorun'
require_relative '../lib/spreen_pr'

class CLITest < Minitest::Test
  def test_text_format
    status = nil
    out, _err = capture_io do
      status = SpreenPr::CLI.start(['hayat01sh1da/issue-xxxxx/service/this_is_a_test_branch'])
    end

    assert_equal(0, status)
    assert_equal("[service] This Is A Test Branch\n", out)
  end

  def test_json_format
    status = nil
    argv = ['hayat01sh1da/issue-xxxxx/hotfix/service/this_is_a_test_branch', '--format', 'json']
    out, _err = capture_io { status = SpreenPr::CLI.start(argv) }

    assert_equal(0, status)
    assert_equal(
      { 'title' => '[Hotfix][service] This Is A Test Branch', 'labels' => %w[Hotfix service] },
      JSON.parse(out)
    )
  end

  def test_invalid_branch_name
    status = nil
    _out, err = capture_io { status = SpreenPr::CLI.start(['main']) }

    assert_equal(1, status)
    assert_match(/does not match the expected/, err)
  end

  def test_invalid_format
    status = nil
    _out, err = capture_io do
      status = SpreenPr::CLI.start(['hayat01sh1da/issue-xxxxx/service/topic', '--format', 'yaml'])
    end

    assert_equal(1, status)
    assert_match(/invalid argument/, err)
  end

  def test_version
    status = nil
    out, _err = capture_io { status = SpreenPr::CLI.start(['--version']) }

    assert_equal(0, status)
    assert_equal("#{SpreenPr::VERSION}\n", out)
  end

  def test_help
    status = nil
    out, _err = capture_io { status = SpreenPr::CLI.start(['--help']) }

    assert_equal(0, status)
    assert_match(/Usage: pr-title \[BRANCH_NAME\] \[options\]/, out)
  end
end
