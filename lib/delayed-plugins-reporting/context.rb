require 'delayed-plugins-reporting/job_listener'
require 'delayed-plugins-reporting/pretty_json_job_formatter'

class Delayed::Plugins::Reporting
  class Context
    attr_reader :listener

    def initialize(listener:)
      @listener = listener
    end

    def after_failure(worker, job)
      max_attempts = worker.max_attempts(job)

      if max_attempts > 1 && job.attempts == max_attempts
        listener.max_attempts_exceeded(job)
      end
    end

    class << self
      def create(reporter: {}, formatter: {}, listener: {})
        formatter_options = formatter.dup
        listener_options = listener.dup
        reporter_options = reporter.dup

        formatter_class = formatter_options.delete(:class) || PrettyJsonJobFormatter
        listener_class = listener_options.delete(:class) || JobListener
        reporter_class = reporter_options.delete(:class) || NullReporter

        new(
          listener: listener_class.new(
            reporter: reporter_class.new(
              formatter: formatter_class.new(
                **formatter_options
              ),
              **reporter_options
            ),
            **listener_options
          )
        )
      end
    end
  end
end
