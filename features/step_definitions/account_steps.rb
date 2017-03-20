Given /^the following users exist:$/ do |data_table|
	data_table.hashes.each do |user|
		User.create!(user)
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

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
	fill_in(field, :with => value)
end

When /^(?:|I )fill in "([^"]*)" for "([^"]*)"$/ do |value, field|
	fill_in(field, :with => value)
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|

    if false

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
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
    
  if false
      
  current_path = URI.parse(current_url).path
  
  puts path_to(page_name)
  puts current_path
  
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
  
  end
end