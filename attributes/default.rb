
# if node['delivery']
#   if node['delivery']['change']
#     case node['delivery']['change']['stage']
#       when 'acceptance' # This is generally the DEV stage
#       default['chef_env']['AIRGROUP_DEPLOY_TYPE'] = 'DEV'
#       default['chef_env']['stg'] = 'dev'
#       default['chef_env']['ddrive'] = 10
#       default['chef_env']['size'] = 'small' #Accepts 'extra_small' (2CPU/2GB RAM), 'small' (2CPU/4GB RAM), 'medium' (4CPU/8GB RAM), 'large' (6CPU/12GB RAM)
#       default['chef_env']['run_list'] = ''
#       default['chef_env']['location'] = [{'name' => 'sea', 'network' => '10.80.100.0', 'subnet_mask' => '22', 'gateway' => '10.80.100.1', 'vlan_label' => 'VLAN201', 'domain' => 'alaskaair.com', 'ou' => 'OU=Dev Servers,OU=Servers,OU=Domain Resources,DC=airgroup,DC=alaskaair,DC=com', 'count' => 1, 'action' => 'nothing'}]
#       when 'rehearsal' # This is generally the QA stage
#       when 'delivered' # This is generally the PRODUCTION stage
#     end
#   end
# end

default['resolver']['nameservers'] = ['10.13.3.240']

case node['domain']
when 'alaskaair.com', 'airgroup.alaskaair.com'
  default['resolver']['search'] = 'alaskaair.com airgroup.alaskaair.com'
  default['resolver']['domain'] = 'alaskaair.com'
when 'aagqa.net'
  default['resolver']['search'] = 'aagqa.net'
  default['resolver']['domain'] = 'aagqa.net'
when 'aagq3.net'
  default['resolver']['search'] = 'aagq3.net'
  default['resolver']['domain'] = 'aagq3.net'
when 'seavvw3.local'
  default['resolver']['search'] = 'seavvw3.local'
  default['resolver']['domain'] = 'seavvw3.local'
else # If this is run in an unexpected domain, set contentstring to nothing.
  default['resolver']['search'] = 'unknown.domain'
  default['resolver']['domain'] = 'unknown.domain'
end
