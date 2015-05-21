require 'delayed-plugins-reporting'

class Delayed::Plugins::Reporting
  class NullReporter
    def initialize(formatter:)
    end

    def error(simple_error_name, message:, job:)
    end
  end
end
