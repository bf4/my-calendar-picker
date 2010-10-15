require 'rubygems'
require 'gcal4ruby'

service = GCal4Ruby::Service.new

service.authenticate(ARGV[0], ARGV[1])

calendars = service.calendars


embed = "https://www.google.com/calendar/embed?height=600&amp;"
weekstart = "wkst=1&amp;"
bgcolor = "bgcolor=%23FFFFFF&amp;"
src = "src=FEEDID&amp;"
color = "color=%23853104&amp;"
timezone = "ctz=America%2FChicago"

File.open("mycalendars.html","w") do |c|
  c.write("<html><head><title>My Calendars</title></head><body>")
  calendars.each do |i|
    c.write("\n#{i.title}:  #{src.gsub(/FEEDID/,i.id)}<br /><br />\n")
  end
  c.write("</body></html>")
end

