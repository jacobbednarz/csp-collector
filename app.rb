require 'sinatra'
require 'redis'
require 'resque'
require './jobs/create_csp_violation_job'

configure do
  set :server, :puma
end

def redis_url
  # Yeah, not everyone uses Boxen but this is fine for now.
  ENV['BOXEN_REDIS_URL']
end

Resque.redis = Redis.new(:url => redis_url)

def create_violation_report(enforced:, violation:)
  Resque.enqueue(CreateCspViolationJob, enforced, violation)
end

post '/report_only' do
  create_violation_report(
    enforced: false,
    violation: request.body.read
  )
end

post '/enforce' do
  create_violation_report(
    enforced: true,
    violation: request.body.read
  )
end
