# Copyright 2014 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include Google::Gce
require 'google/apis/dns_v1'
require 'googleauth'


def make_object(type, name, params)
  klass = type.split('_').collect(&:capitalize).join
  p = params.symbolize_keys.fixnumify
  object = Object::const_get("Google::Apis::DnsV1::#{klass}").new(p)
  puts klass
  object
end

def client
  dns = Google::Apis::DnsV1
  client = dns::DnsService.new

  #Puppet.initialize_settings unless Puppet[:confdir]
  #file = File.join(Puppet[:confdir], 'google_client.conf')
  #Puppet.debug("Checking for config file at #{file}")
  #$config = YAML.load_file(file)

  # Get the environment configured authorization
  scopes =  ['https://www.googleapis.com/auth/ndev.clouddns.readwrite']
  authorization = Google::Auth.get_application_default(scopes)
  client.authorization = authorization
  client
end

def config
  #Puppet.initialize_settings unless Puppet[:confdir]
  file = '/home/arun_jothivel/google_client.conf'
  Chef::Log.debug("Checking for config file at #{file}")
  config = YAML.load_file(file)
  config
end

def make_object(type, params)
  klass = type.split('_').collect(&:capitalize).join
  p = params.symbolize_keys.fixnumify
  object = Object::const_get("Google::Apis::DnsV1::#{klass}").new(p)
  puts klass
  object
end
		
action :create_managed_zone do
  begin
    Chef::Log.debug("Attempting to create managed zone #{new_resource.name}")
	client
	config
	params = {
        creation_time: new_resource.creation_time,
        id: new_resource.id,
        kind: new_resource.kind,
        description: new_resource.description,
        dns_name: new_resource.dns_name,
        name: new_resource.name,
        name_server_set: new_resource.name_server_set,
        name_servers: new_resource.name_servers,
    }
    #params.delete_if { |key, value| value.nil? }
	client.send("create_managed_zone","brave-iterator-133423",make_object("managed_zone", params))
  end
end

action :delete_managed_zone do
  Chef::Log.debug("Attempting to delete firewall #{new_resource.name}")
  
end
