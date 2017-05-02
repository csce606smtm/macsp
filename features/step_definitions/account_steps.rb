Given /^the following users exist:$/ do |data_table|
	data_table.hashes.each do |user|
		User.create!(user)
	end
end

Given /^the following contests exist:$/ do |data_table|
	data_table.hashes.each do |contest|
		Contest.create!(contest)
	end
end

Given /^the following divisions exist:$/ do |data_table|
	data_table.hashes.each do |divisions|
		Division.create!(divisions)
	end
end

Given /^the following qsheets exist:$/ do |data_table|
	data_table.hashes.each do |qsheets|
		Qsheet.create!(qsheets)
	end
end

Given /^the following questions exist:$/ do |data_table|
	data_table.hashes.each do |questions|
		Question.create!(questions)
	end
end

Given /^the following judges exist:$/ do |data_table|
	data_table.hashes.each do |judges|
		Judge.create!(judges)
	end
end

Given /^the following auctioneers exist:$/ do |data_table|
	data_table.hashes.each do |auctioneers|
		Auctioneer.create!(auctioneers)
	end
end

Given /^the following scoresheets exist:$/ do |data_table|
	data_table.hashes.each do |scoresheets|
		Scoresheet.create!(scoresheets)
	end
end

Given /^(?:|I )am on (.+)$/ do |page_name|
	visit path_to(page_name)
end

When /^(?:|I )go to (.+)$/ do |page_name|
	visit path_to(page_name)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
	click_button(button)
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
	  click_link(link)
end

When /^(?:|I )follow first "([^"]*)"$/ do |link|
	  click_link(link, :match => :first)
end

When /^(?:|I )send "([^"]*)"$/ do |link|
		find_field('DONE').native.send_key(:enter)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
	fill_in(field, :with => value)
end

When /^(?:|I )fill in first with "([^"]*)"$/ do |value|
	fill_in(:match => :first, :with => value)
end

When /^(?:|I )fill in last with "([^"]*)"$/ do |value|
	fill_in(:match => :last, :with => value)
end

When /^(?:|I )fill in "([^"]*)" for "([^"]*)"$/ do |value, field|
	fill_in(field, :with => value)
end

When /^(?:|I )select "([^"]*)" from "([^"]*)"$/ do |value, field|
  select(value, :from => field)
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
	split_text = text.split("\s")
	
	if split_text.length > 1
		
	else
		if page.respond_to? :should
    		page.should have_content(text)
		else
    		assert page.has_content?(text)
		end
	end
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  
  puts path_to(page_name)
  puts current_path
  
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end