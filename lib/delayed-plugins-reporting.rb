require 'delayed_job'
require 'delayed/plugin'

class Delayed::Plugins::Reporting < ::Delayed::Plugin
  require 'delayed-plugins-reporting/version'
  require 'delayed-plugins-reporting/context'

  callbacks do |lifecycle|
    with_context do |context|
      lifecycle.after(:failure) do |worker, job|
        context.after_failure(worker, job)
      end
    end
  end

  class << self
    def with_context
      yield Context.create(**options)
    end

    def options=(options)
      @options = options
    end

    def options
      @options ||= {}
    end
  end
end
