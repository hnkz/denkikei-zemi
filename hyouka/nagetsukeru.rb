require "selenium-webdriver"
require 'rubygems'
t = Time.now
argv = ARGV[0].gsub!(/\/opt\/lampp\/htdocs/,"")
path = "http://localhost"+argv

#chromeの場合
agent = :chrome
driver = Selenium::WebDriver.for agent

driver.get path + code
#driver.get "http://js.do/code/104344"
sleep 1
sleep 3 if agent == :edge
begin
  alert = nil
  alert = driver.switch_to.alert
  puts "alert says: " + alert.text
  alert.accept
rescue Selenium::WebDriver::Error::NoSuchAlertError => e
  puts "no alert exist..."
rescue => e
  p e
end

p driver.execute_script("return document.cookie;")

driver.quit
#firefoxの場合
agent = :firefox
driver = Selenium::WebDriver.for agent

puts Time.now - t
