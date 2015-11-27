#Watir Script for Tumblr
$LOAD_PATH << '.'
require 'login_tumblr'
require 'watir'
include Login

browser = Watir::Browser.new :firefox  
browser.goto "http://www.tumblr.com/login"  
Login.login_credentials browser

#posting
browser.element(id: "new_post_label_text").click
message = browser.div(class:'editor-richtext')
message.send_keys("Watir automation")
submit_button = browser.button(class: 'create_post_button')
submit_button.click

browser.driver.manage.timeouts.implicit_wait = 10
browser.goto "http://www.deepesthologramtyphoon.tumblr.com"
browser.alert.ok

dashboard_check = browser.elements(class: "post")
dashboard_check.each_with_index do |message, post|
  if message.text.match /Watir automation/
    puts  "Post #{post+1}: The message exists !!!"
  else  
    puts "Post #{post+1}: The message doesn't exist :("
  end
end 

browser.goto "http://www.tumblr.com/blog/deepesthologramtyphoon"
spanner_icon = browser.div(class: "post_control").click
delete_option = browser.div(class: "post_control delete").click
confirm_ok = browser.button(class: "chrome blue").click  
puts "Closing the browser"

browser.close 

