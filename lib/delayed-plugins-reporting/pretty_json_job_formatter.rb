class Delayed::Plugins::Reporting
  class PrettyJsonJobFormatter
    INCLUDED_ATTRIBUTE_NAMES = %i| priority attempts run_at locked_at queue created_at updated_at |
    INCLUDED_METHOD_NAMES = %i| max_attempts |

    attr_reader :included_attribute_names
    attr_reader :included_method_names

    def initialize(attributes: INCLUDED_ATTRIBUTE_NAMES, methods: INCLUDED_METHOD_NAMES)
      @included_attribute_names = attributes
      @included_method_names = methods
    end

    def format(job)
      as_pretty_formatted_json(job)
    end

    private

    def as_json(job)
      job.as_json(
        only: included_attribute_names,
        methods: included_method_names
      )
    end

    def as_pretty_formatted_json(job)
      JSON.pretty_generate(as_json(job))
    end
  end
end
