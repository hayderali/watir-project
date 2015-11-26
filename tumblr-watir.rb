#Watir Script for Tumblr

require 'YAML'
file = YAML::load_file("user_credential.yml")

require 'watir'

browser = Watir::Browser.new :firefox
browser.goto "http://www.tumblr.com/login"
# browser.text_field(id: "signup_email").set("hayder.ali92@gmail.com")
# browser.text_field(id: "signup_password").set("banana11\n")


file["credential"].each do |credential|
  enter_email = browser.text_field(id:"signup_email") 
  enter_email.send_keys credential["username"]
  enter_pass = browser.text_field(id:"signup_password") 
  enter_pass.send_keys credential["password"]
  browser.button(id: "signup_forms_submit").click
end

browser.element(id: "new_post_label_text").click
message = browser.div(class:'editor-richtext')
message.send_keys("Watir automation")

submit_button = browser.button(class: 'create_post_button')
submit_button.click

browser.driver.manage.timemouts.implicit_wait = 10
browser.goto "http://www.deepesthologramtyphoon.tumblr.com/"

# Watir::Wait.until do
	# browser.text.include? "Watir automation"
	# puts "test was sucessful !!!"
# end

browser.goto "http://www.tumblr.com"


#browser.close
