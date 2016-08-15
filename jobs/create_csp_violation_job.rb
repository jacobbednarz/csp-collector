require 'json'

class CreateCspViolationJob
  @queue = :create_csp_violations

  def self.perform(enforced, violation)
    puts "Got #{enforced} and #{violation}"
  end
end
