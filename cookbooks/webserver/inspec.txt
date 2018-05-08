To be checked using inspec
-	os version
-	port
-	package is installed
-	service is running
-	file exists
-	user exists

inspec matchers
be 	-	followed by numerical comparison operator
cmp	-	flexible comparison operator
eq	-	tests equality
include	-	tests if a value is included in the list
match	-	check if a string matches a regular expression

depends on the resources, matchers can vary

package has be_installed
file has be_writable

Expectations are handled by should and should_not

#for doing integration testing using inspec, use kitchen verify


#default.rb

package 'httpd' do
  action :install
end

file '/var/www/html/index.html' do
  action :create
  content 'Hello World!'
end

service 'httpd' do
  action [ :enable, :start ]
  # truthiness false
end

#default_spec.rb
describe package('httpd') do
  it { should be_installed }
end

describe service('httpd') do
  it { should be_enabled }
  it { should be_installed }
  it { should be_running }
end

# implement os dependent tests
web_user = 'apache'
web_user = 'apache' if os[:family] == 'centos'

describe user(web_user) do
  it { should exist }
  its('uid') { should eq 1234 }
  its('gid') { should eq 1234 }
  its('group') { should eq 'root' }
  its('groups') { should eq ['wheel','users'] }
  its('home') { should eq '/home/web_user' }
  its('shell') { should eq '/bin/bash' }
end
describe user('guest') do
  it { should_not exist }
end

describe file('/var/www/html/index.html') do
  it { should exist }
  it { should be_readable }
  its('content') {should match /hello world/ }
end
