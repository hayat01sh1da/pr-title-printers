# frozen_string_literal: true
# rbs_inline: enabled

require 'json'
require 'optparse'
require_relative 'version'
require_relative 'application'

module SpreenPr
  # Command line interface behind the `pr-title` executable:
  # `pr-title [BRANCH_NAME] [--format text|json]`.
  class CLI
    FORMATS = %w[text json].freeze #: Array[String]

    # @rbs argv: Array[String]
    # @rbs return: Integer
    def self.start(argv = ARGV)
      new(argv).run
    end

    # @rbs argv: Array[String]
    # @rbs return: void
    def initialize(argv)
      @argv   = argv.dup
      @format = 'text'
      @action = :print_title
    end

    # @rbs return: Integer
    def run
      parser.parse!(argv)
      __send__(action)
    rescue ArgumentError, OptionParser::ParseError => e
      warn e.message
      1
    end

    private

    attr_reader :argv #: Array[String]
    attr_reader :format #: String
    attr_reader :action #: Symbol

    # @rbs return: Integer
    def print_title
      application = Application.new(branch_name:)
      puts(format == 'json' ? JSON.generate(application.to_h) : application.title)
      0
    end

    # @rbs return: Integer
    def print_version
      puts VERSION
      0
    end

    # @rbs return: Integer
    def print_help
      puts parser
      0
    end

    # @rbs return: String
    def branch_name
      branch = argv.shift || current_git_branch
      return branch unless branch.nil? || branch.empty?

      raise ArgumentError,
            'No branch name given and the current git branch could not be detected'
    end

    # @rbs return: String?
    def current_git_branch
      IO.popen(%w[git branch --show-current], err: File::NULL, &:read).strip
    rescue SystemCallError
      nil
    end

    # @rbs return: OptionParser
    def parser
      @parser ||= OptionParser.new('Usage: pr-title [BRANCH_NAME] [options]') do |opt|
        opt.on('--format FORMAT', FORMATS,
               "Output format (#{FORMATS.join(' or ')}, default: text)") { |value| @format = value }
        opt.on('--version', 'Print the version') { @action = :print_version }
        opt.on('-h', '--help', 'Print this help') { @action = :print_help }
      end
    end
  end
end
