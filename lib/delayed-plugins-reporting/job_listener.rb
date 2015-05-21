class Delayed::Plugins::Reporting
  class JobListener
    def initialize(reporter:)
      @reporter = reporter
    end

    def max_attempts_exceeded(job)
      report.error :max_attempts_exceeded, job: job, message: <<-EOS.gsub!(/^\s+/, '')
        The job failed `max_attempts` times and was given up retrying.
      EOS
    end

    private

    def report
      @reporter
    end
  end
end
