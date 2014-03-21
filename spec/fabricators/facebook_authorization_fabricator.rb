Fabricator(:authorization) do
  uid "123456"
  first_name "Nícolas"
  last_name "Iensen"
  email "nicolas@meurio.org.br"
  token "123"
  provider "facebook"
  expires_at Time.now + 1.month
end
