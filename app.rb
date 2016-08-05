%w(sinatra json).each { |gem| require gem }

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

def create_violation_report(enforced:, violation:)
  # do it
end
