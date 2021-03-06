#!/usr/bin/env ruby

require 'rubygems'
require 'selenium-webdriver'

Selenium::WebDriver::Chrome.driver_path = "./chromedriver"
driver = Selenium::WebDriver.for :chrome
driver.get "https://accounts.google.com/signup/v2/webcreateaccount?continue=http%3A%2F%2Fsupport.google.com%2Faccounts%2Fanswer%2F183723%3Fco%3DGENIE.Platform%253DDesktop%26hl%3Dfr&hl=fr&flowName=GlifWebSignIn&flowEntry=SignUp"


first = driver.find_element(:name, "firstName")
last = driver.find_element(:name, "lastName")
user = driver.find_element(:name, "Username")
pass = driver.find_element(:name, "Passwd")
pass_confirm = driver.find_element(:name, "ConfirmPasswd")

file = File.open("id.txt", "r")
tab_name = file.readlines()

while (!((i = rand(tab_name.size)) % 2))      
end
firstname = tab_name[i]
firstname = firstname.chomp
first.send_keys  firstname

while (((i = rand(tab_name.size)) % 2) != 1)
end
lastname = tab_name[i]
lastname = lastname.chomp
last.send_keys  lastname

username = [firstname, lastname, rand(1000..100000).to_s].join
user.send_keys  username

pass.send_keys  ARGV[0]
pass_confirm.send_keys  ARGV[0]
driver.find_element(:css, "span.RveJvd").click

sleep(2)

numero = driver.find_element(:id, "phoneNumberId")
numero.send_keys ARGV[1]
driver.find_element(:css, "span.snByac").click

sleep(2)

print "entrez le code d'activation $>".chomp
code = STDIN.gets

sleep(2)

active_code = driver.find_element(:css, "input.whsOnd.zHQkBf")
active_code.send_keys code
driver.find_element(:css, "span.snByac").click

sleep(2)

day = driver.find_element(:id, "day")
day.send_keys "11"
month = Selenium::WebDriver::Support::Select.new(driver.find_element(:tag_name , "select" ))
month.select_by(:text , "Mars" )
year = driver.find_element(:id, "year")
year.send_keys "1990"

sexe = Selenium::WebDriver::Support::Select.new(driver.find_element(:tag_name , "select" ))
sexe.select_by(:text , "Homme" )

sleep(1)

driver.find_element(:css, "span.snByac").click

sleep(2)

driver.find_element(:css, "button.uBOgn").click

wait = Selenium::WebDriver::Wait.new( :timeout => 10 )
wait.until { driver.title.downcase.start_with? "cheese!" }

file_name = File.open("identifiant.txt", "a")
file_name.write("username => " + username + "@gmail.com" + "\n" + "password => " + ARGV[0] + "\n")

driver.quit
