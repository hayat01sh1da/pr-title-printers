class Application
  def self.run(branch_name:)
    self.new(branch_name).run
  end

  def initialize(branch_name)
    @branch_name = branch_name
  end

  def run
    string_array            = branch_name.split(/\//)
    *prefixes, branch_topic = string_array[2] == 'hotfix' ? string_array[-3..] : string_array[-2..]
    "#{labels(prefixes)}#{pr_topic(branch_topic)}"
  end

  private

  attr_reader :branch_name

  def labels(prefixes)
    if prefixes.include?('hotfix')
      prefixes.first.capitalize!
      "[#{prefixes.join('][')}] "
    else
      "[#{prefixes.last}] "
    end
  end

  def pr_topic(branch_topic)
    branch_topic.split(/[\-\_]/).map(&:capitalize).join("\s")
  end
end
