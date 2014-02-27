def to_url string
  return root_path if string == "the homepage"
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
  raise "I don't know '#{string}'"
end
