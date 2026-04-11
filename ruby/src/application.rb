# rbs_inline: enabled

class Application
  # @rbs branch_name: String
  # @rbs return: String
  def self.run(branch_name:)
    self.new(branch_name).run
  end

  # @rbs branch_name: String
  # @rbs return: void
  def initialize(branch_name)
    @branch_name = branch_name
  end

  # @rbs return: String
  def run
    string_array            = branch_name.split(/\//)
    *prefixes, branch_topic = string_array[2] == 'hotfix' ? string_array[-3..] : string_array[-2..]
    "#{labels(prefixes)}#{pr_topic(branch_topic)}"
  end

  private

  attr_reader :branch_name

  # @rbs prefixes: Array[String]
  # @rbs return: String
  def labels(prefixes)
    if prefixes.include?('hotfix')
      prefixes.first.capitalize!
      "[#{prefixes.join('][')}] "
    else
      "[#{prefixes.last}] "
    end
  end

  # @rbs branch_topic: String
  # @rbs return: String
  def pr_topic(branch_topic)
    branch_topic.split(/[\-\_]/).map(&:capitalize).join("\s")
  end
end
