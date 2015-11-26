--- Watir Cheat Sheet ---

http://www.rubydoc.info/gems/watir-webdriver/frames
  
WATIR WILL BE USED IN FINAL PROJECT

--- What is Watir ---

Browser API for Selenium
Nice DSL
PageObject available (PageObject is a Gem)
Built for Ruby
Industry Standard

#Start Watir

require 'watir'
browser = Watir::Browser.new :firefox
browser.goto "http://google.com"

#Methods For browser
  .text  <- prints all the text from the page
  .title
  .refresh
  .html <- gives html of the page
  .status <- print out status
  .text <- print out all the text from the page
  .text.include? 'Hello'
    include? -> checks a string with an array of strings 
	.driver.find_elements (selenium methods can be applied in watir)
  .p shows object file
  .p.text <- obtains text from that p tag

#Adding "s" makes tags into a collection 
  .x's will get all of them (and makes them all into collections)
  .ps <- paragraph "collecton" of all p tag
  .ps[0]
    .ps[0].text
  .input/.textfield
    .text_field name: 'name'
    .lis id: /^foo.*/ .* 1 character of anything.
    .lis class: /^qa-.*/
 
#Text Field Methods 
tf = browser.text_field name: 'name'
  tf.flash (blinks)
  tf.set "hello" (sets to hello)
  tf.value (prints out the value)"
  .id = prints out the id 
  .exists? (it check the html file not the actual page diplay)
  tf.visibile? (visibility false)
  .readonly? (checks to see if a xxx is only readable)

#Button Methods
b = browser.button text: "A Button"
  use id and elements but if cannot be find use "name:"
  
  .type
  .click
  .id
  .flash
  .when_present.click (x.when_present.x will work) 

#Check Box Methods  
cb = browser.checkbox id 'checkbox'
  cb.set tick  
  cb.clear untick

#Dropdown 
dropdown = browser.select_list :name, "select-choice"
-clicking on a link
  browser.select_list(:name => 'name').clear
  puts browser.select_list(:name => 'name').options
  browser.select_list(:name => 'name').select 'Option 1'

browser.a(text: "About").click

#On lacedreamon contact forms
table = browser.table
table[0] <- row 
table[0][0] <- row and column
  .text can be called on all of them

#CSS Selectors
Using Element to do css
browser.element css: ".foo"
browser.element (css: ".page-header").html
browser.element(css: "form")

#Placing buttons in an array
button = browser.buttons
button.size

#Implicit Waiting
browser.driver.manage.timouts.imp

--setting it

browser.driver.manage.timemouts.implicit_wait = 3


#Explicit Wait
--on google web form page
browser.text_field(id: 'entry_1000').wait_until_present
  "" .wait_until_present.set "foo" 

#Wait until block returns true
Watir::Wait.until do
  browser.text.include? 'Thank You'
end