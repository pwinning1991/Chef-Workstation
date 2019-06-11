file "/etc/motd" do
  content "IP Address: #{node['ipaddress']}
Catch Phrase: #{node['catch_phrase']}
  "
end
