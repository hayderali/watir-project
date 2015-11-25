--------- Selenium Cheat Sheet ---------

driver = Selenium::Webdriver.for
:: -> from the class/module
. call the method

# Loading Selenium

irb 
require 'selenium-webdriver'

# Navigating a page
browser = Selenium:: WebDriver.for :firefox
browser.get "http://www.google.com"
					#or
browser.navigate.to "http://www.google.com"
browser.title
browser.page_source
browser.page_source.match /Hello/
browser.execute_script "alert('Hello');"


# How to find methods on methods

browser.methods - Object.new.methods


# Assigning variable for sections of the page

a = browser.find_element id: "x"
a = find_elements tag_name: "input"


# Finding elements

a = browser.find_element name: "something"
a = browser.find_element id: "someid"
a = browser.find_element css: "h1 .foo" # This is awesome
a = browser.find_element class: "foo"
a = browser.find_element xpath: "//h2[@class='someclass']"
a = browser.find_element tag_name: "tagname"
?
a = browser.find_elements tag_name: "tagname" # Returns an Array of Objects


#  Finding elements via css 
# <div id="food">
#   <span class="dairy">milk</span>
#   <span class="dairy aged">cheese</span>
# </div>
element = driver.find_element(:css, #food span.dairy)
	
# Listed on elements methods

a.location <- x,y pos
a.location_once_scrolled_into_view <- after scrolling gives you x,y pos
a.size
a.displayed?
a.text
a.attribute "class"
a.click
a.send_keys "Hello"
a.selected? # For Checkboxes and Radio Buttons
a.submit # Called on any element in a form will submit the form.

	
# Wait methods 	

wait = Selenium::WebDriver::Wait.new(timeout:51)   <- miliseconds
a = wait.until {browser.find_element(tag_name: "h1")}

# Explain that the until method takes a block of code to execute and returns the last line's result.
# We can store that in a variable.
?
a = wait.until do
  browser.find_element(tag_name: "h1")
end
?

puts "Test Passed! Found H1" if wait.until do
  browser.find_element(tag_name: "h1").text.match /HTML/
end


# Deleting Cookies

# You can delete cookies in 2 ways
# By name
	driver.manage.delete_cookie("CookieName")
# Or all of them
	driver.manage.delete_all_cookies

# Closing browser

browser.quit
	
## exercise - load option 3 ##

options = a.find_elements(tag_name: "option")
options.each {|o| o.click if o.text == "Choice 3" }

