# frozen_string_literal: true
# rbs_inline: enabled

module SpreenPr
  # Derives a pull request title and labels from a topic branch name shaped
  # `{user}/{issue}/{category}/{summary}`, with the hotfix special case
  # `{user}/{issue}/hotfix/{category}/{summary}`.
  class Application
    EXPECTED_SHAPE = '{user}/{issue}/{category}/{summary}' #: String

    # @rbs branch_name: String
    # @rbs return: String
    def self.run(branch_name:)
      new(branch_name:).title
    end

    # @rbs branch_name: String
    # @rbs return: void
    def initialize(branch_name:)
      @branch_name = branch_name
      @segments    = branch_name.split('/')
      validate!
    end

    # @rbs return: String
    def title
      "#{labels.map { |label| "[#{label}]" }.join} #{topic}"
    end

    # @rbs return: Array[String]
    def labels
      hotfix? ? [segments[-3].capitalize, segments[-2]] : [segments[-2]]
    end

    # @rbs return: String
    def topic
      segments.last.split(/[-_]/).map(&:capitalize).join("\s")
    end

    # @rbs return: Hash[Symbol, String | Array[String]]
    def to_h
      { title:, labels: }
    end

    private

    attr_reader :branch_name #: String
    attr_reader :segments #: Array[String]

    # @rbs return: bool
    def hotfix?
      segments[-3] == 'hotfix'
    end

    # @rbs return: void
    def validate!
      return if segments.size >= 3 && segments.none?(&:empty?)

      raise ArgumentError,
            "Branch name `#{branch_name}` does not match the expected `#{EXPECTED_SHAPE}` shape"
    end
  end
end
