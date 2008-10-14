require 'color_generator'

User.seed(:login) do |s|
  s.login = "anon"
  s.email = "anon@nwprops.com"
  s.password = "82453495873498573495saldfjkl543p"
  s.password_confirmation = "82453495873498573495saldfjkl543p"
  s.status = 1
  s.firstname = "Anonymous"
  s.lastname = "User"
  s.color = random_color
  s.admin = 0
end

User.seed(:login) do |s|
  s.login = "carl"
  s.email = "carl@nwprops.com"
  s.password = "carl"
  s.password_confirmation = "carl"
  s.status = 1
  s.firstname = "Carl"
  s.lastname = "Johnson"
  s.color = random_color
  s.admin = 0
end

User.seed(:login) do |s|
  s.login = "andy"
  s.email = "andy@nwprops.com"
  s.password = "andy"
  s.password_confirmation = "andy"
  s.status = 1
  s.firstname = "Andy"
  s.lastname = "Johnson"
  s.color = random_color
  s.admin = 0
end

User.seed(:login) do |s|
  s.login = "eric"
  s.email = "eric@nwprops.com"
  s.password = "eric"
  s.password_confirmation = "eric"
  s.status = 1
  s.firstname = "Eric"
  s.lastname = "Johnson"
  s.color = random_color
  s.admin = 0
end

User.seed(:login) do |s|
  s.login = "marcus"
  s.email = "marcus@vorwaller.net"
  s.password = "marcusmarcus"
  s.password_confirmation = "marcusmarcus"
  s.status = 1
  s.firstname = "Marcus"
  s.lastname = "Vorwaller"
  s.color = random_color
  s.admin = 1
end

User.seed(:login) do |s|
  s.login = "manager1"
  s.email = "manager1@nwprops.com"
  s.password = "manager1"
  s.password_confirmation = "manager1"
  s.status = 1
  s.firstname = "Manager"
  s.lastname = "One"
  s.color = random_color
  s.admin = 0
end