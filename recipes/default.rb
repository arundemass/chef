
chef_gem "fog" do
  version node['gce']['fog_version']
  action :install
end

chef_gem 'uuidtools'
chef_gem 'multi_json'

chef_gem 'google-api-client'

require 'fog'


gce_managed_zone "my-managedzone" do
 description "thisisadesc"
 dns_name "arunkumar.com."
 action :create_managed_zone
end
