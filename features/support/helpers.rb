def to_url string
  return root_path if string == "the homepage"
  return root_path(anchor: "compartilhaco") if string == "the register page"
  raise "I don't know '#{string}'"
end

def to_field string
  return "squeeze_first_name" if string == "the first name field"
  return "squeeze_last_name" if string == "the last name field"
  return "squeeze_email" if string == "the email field"
  raise "I don't know '#{string}'"
end

def to_button string
  return "squeeze-submit-button" if string == "the squeeze form submit button"
  raise "I don't know '#{string}'"
end

def to_element string
  return ".share" if string == "the share buttons"
  return "form.new_squeeze" if string == "the squeeze form"
  return ".first_name_field.error" if string == "the first name field with error"
  return ".last_name_field.error" if string == "the last name field with error"
  return ".email_field.error" if string == "the email field with error"
  return "#compartilhaco" if string == "the compartilhaço reveal"
  return "#twitter-share-button" if string == "the Twitter share button"
  return "#facebook-share-button" if string == "the Facebook share button"
  raise "I don't know '#{string}'"
end

def to_subject string
  return "Não deixe o deputado Eduardo Cunha limitar nosso acesso à internet" if string == "don't let them limit our access to the Internet"
  return "Deputado, a neutralidade da rede é inegociável" if string == "you can't negotiate the neutrality of the Internet"
  raise "I don't know '#{string}'"
end

def to_link string
  return "twitter-account-registration-button" if string == "the Twitter account registration button"
  return "facebook-account-registration-button" if string == "the Facebook account registration button"
  raise "I don't know '#{string}'"
end
