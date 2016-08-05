%w(sinatra json).each { |gem| require gem }

post '/report_only' do
  request.body.read
end

post '/enforce' do
  request.body.read
end
