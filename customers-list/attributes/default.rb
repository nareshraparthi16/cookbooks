def random_password
  require 'securerandom'
  SecureRandom.base64
end


default['firewall']['allow_ssh'] = true
default['firewall']['firewalld']['permanent'] = true
default['customers-list']['open_ports'] = 80

default['customers-list']['user'] = 'web_admin'
default['customers-list']['group'] = 'web_admin'
default['customers-list']['document_root'] = '/var/www/customers/public_html'

normal_unless['customers-list']['database']['root_password'] = random_password
normal_unless['customers-list']['database']['admin_password'] = random_password
default['customers-list']['database']['dbname'] = 'my_company'
default['customers-list']['database']['host'] = '127.0.01'
default['customers-list']['database']['root_username'] = 'root'
default['customers-list']['database']['admin_username'] = 'db_admin'
