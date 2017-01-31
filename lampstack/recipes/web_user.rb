
group 'web_admin' 
de['lampstack']['group']

user node['lampstack']['user'] do
  group node['lampstack']['group']
  system true
  shell '/bin/bash'
end
