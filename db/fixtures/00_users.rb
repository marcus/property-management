User.seed(:login) do |s|
  s.login = "anon"
  s.email = "anon@nwprops.com"
  s.password = "82453495873498573495saldfjkl543p"
  s.password_confirmation = "82453495873498573495saldfjkl543p"
  s.status = 1
  s.firstname = "Anonymous"
  s.lastname = "User"
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
  s.admin = 1
end