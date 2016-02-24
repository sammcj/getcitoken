#!/usr/bin/env ruby

# getcitoken - retrieves gitlab-ci token for configuration of runners
# Sam McLeod - https://github.com/sammcj/getcitoken

require 'mechanize'
require 'logger'
require 'yaml'

config = YAML.load_file('config.yml')
gitlab_ci_url = config['gitlab_ci_url']

agent = Mechanize.new
agent.log = Logger.new "getcitoken.log"

login_page = agent.get gitlab_ci_url+"/users/sign_in"
login_form = login_page.form

login_field = login_form.field_with(name: "user[login]")
password_field = login_form.field_with(name: "user[password]")

login_field.value = config['gitlab_username']
password_field.value = config['gitlab_password']

home_page = login_form.submit
runner_page = agent.get agent.get gitlab_ci_url+"/admin/runners"

# Return Token
runner_page.search('code').each do |results|
  puts runner_page.parser.xpath('//code/text()').to_html
end
