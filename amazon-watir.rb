require 'watir-webdriver'

 browser = Watir::Browser.new :firefox
 browser.goto "http://www.amazon.co.uk"
 search = browser.text_field name: 'field-keywords'
 search.set "Eloquent Ruby\n"
 load_book = browser.a(text: 'Eloquent Ruby (Addison-Wesley Professional Ruby)').click
 puts browser.img(css: "#imgBlkFront").src
 browser.element(css: ".olp-from").click
 price = browser.element(css: ".a-color-price").text
 puts "Paperback " + price
 browser.close
 


