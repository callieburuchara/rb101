# A = NO (doesn't capitalize last name)
# B = NO (has to be less than 60 days, not equal to or less than)
# C = 
# D = 

mailing_campaign_leads = [
  {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
  {name: 'mike richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
  {name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
  {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
]

counter = 0
names = []

loop do
  break if counter == mailing_campaign_leads.size #the above hash
  full_name = mailing_campaign_leads[counter][:name] #gives full_name the name from the hash
  names = full_name.split # returns an array of individual first & last names

  names_counter = 0
  loop do
    break if names_counter == names.size # wouldn't that be 2?
    name = names[names_counter]
    names[names_counter] = name.capitalize # so this capitalizes both names, first & last

    names_counter += 1
  end

  capitalized_full_name = names.join(' ') # no more array, first and last are put back together as a string
  mailing_campaign_leads[counter][:name] = capitalized_full_name 
  # so this fixes the capitalization of the name in the hash. THAT'S IT!

  counter += 1
end



#SECTION break

usable_leads = []
counter = 0

loop do
  break if counter == mailing_campaign_leads.size
  last_login = mailing_campaign_leads[counter][:days_since_login]
  subscribed_to_list = mailing_campaign_leads[counter][:mailing_list]

  if last_login < 60 && subscribed_to_list
    usable_leads << mailing_campaign_leads[counter]
  end

  counter += 1
end

# usable_leads = (a) they subscribed and (b) they logged in during the past 59 days

p usable_leads
p names

