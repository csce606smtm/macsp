# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    
    case page_name

    when /^the login page$/
      log_in_path
      
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
    when /^the main page$/
      
      root_path
      
    when /^the new auctioneer page$/
      
      new_admin_setup_auctioneer_path
      
    when /^the new judge page$/
      
      new_admin_setup_judge_path
      
    else
    
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        final_path = path_components.push('path').join('_').to_s
        
        # case final_path
        # when "admin_path"
        #   users_path
        # else
        #   self.send(final_path)
        # end
        
        final_path
        
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)