require 'json'
require 'time'

class CreateCspViolationJob
  @queue = :create_csp_violations

  def self.perform(enforced, violation)
    @violation_report = JSON.parse(violation)['csp-report']

    return unless actionable_blocked_uri?

    @output = []
    @output << "[#{Time.now.iso8601}]"

    @violation_report.each do |directive_name, directive_value|
      @output << %Q(#{directive_name}="#{directive_value}")
    end

    generate_logging_output!
  end

  def self.generate_logging_output!
    puts @output.join(' ')
  end

  # Private: Determine if we have an actionable report based on 'blocked-uri'.
  #
  # There are some blocked URIs that we just cannot do anything with. These
  # are generated by things like browser extensions, internal browser pages,
  # MITM proxies and are outside of our control.
  def self.actionable_blocked_uri?
    !@violation_report['blocked-uri'].start_with?(
      'resource://',
      'chromenull://',
      'chrome-extension://',
      'safari-extension://',
      'mxjscall://',
      'webviewprogressproxy://',
      'res://',
      'mx://',
      'safari-resource://',
      'chromenull://',
      'chromeinvoke://',
      'chromeinvokeimmediate://',
      'mbinit://',
      'opera://',
      'localhost',
      '127.0.0.1',
      'none://',
      'chromenull://',
      'resource://',
      'about:blank'
    )
  end
end
