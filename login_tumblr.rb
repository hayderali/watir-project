require 'YAML'

module Login
  def login_credentials browser 
  file = YAML::load_file("user_credential.yml")
   file["credential"].each do |credential|
      enter_email = browser.text_field(id:"signup_email") 
      enter_email.send_keys credential["username"]
      enter_pass = browser.text_field(id:"signup_password") 
      enter_pass.send_keys credential["password"]
      browser.button(id: "signup_forms_submit").click
    end
  end 
end