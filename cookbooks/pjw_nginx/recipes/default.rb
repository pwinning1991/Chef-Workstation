package "nginx"

service "nginx" do
  action [:enable, :start]
end

file "/usr/share/nginx/html/index.html" do
  content "<h1> Hello, world! </h1>"
  action :create
  not_if { ::File.exists?("/usr/share/nginx/html/index.html") }
end

file_contents = "<ul>\n"

search('environment', 'name:*', filter_result: { 'output' => ['name'] }).each do |env|
	  puts("******* ENVIRONMENT IS: #{env}*******")
	    file_contents += "<li>#{env['output']}</li>\n"
end

file_contents += "</ul>"

file "/usr/share/nginx/html/environments.html" do
	  content file_contents
end

