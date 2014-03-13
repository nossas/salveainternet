Fabricator(:squeeze) do
  first_name { 'Nícolas' }
  last_name { 'Iensen' }
  email { sequence(:email) { |i| "user#{i}@meurio.org.br" } }
  city { 'Rio de Janeiro' }
end
