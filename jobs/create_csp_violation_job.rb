require 'json'

class CreateCspViolationJob
  @queue = :create_csp_violations

  KNOWN_UNACTIONABLE_REPORT_URIS = %w(
    resource://
    chromenull://
    chrome-extension://
    safari-extension://
    mxjscall://
    webviewprogressproxy://
    res://
    mx://
    safari-resource://
    chromenull://
    chromeinvoke://
    chromeinvokeimmediate://
    mbinit://
    opera://
    localhost
    127.0.0.1
    none://
    chromenull://
    resource://
    about:blank
  )

  attr_accessor :violation_report

  def self.perform(enforced, violation)
    puts "Got #{enforced} and #{violation}"
  end
end
