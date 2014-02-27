Then(/^an email should be sent to "(.*?)"$/) do |arg1|
  expect(ActionMailer::Base.deliveries.select{|d| d.to == arg1}.size).to be_eql 1
end
