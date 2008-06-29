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