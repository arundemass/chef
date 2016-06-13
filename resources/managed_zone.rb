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

actions :create_managed_zone, :delete_managed_zone

# Google Compute Engine Credentials
attribute :fields, :kind_of => String, :default => nil
attribute :quota_user, :kind_of => String, :default => nil
attribute :user_ip, :kind_of => String, :default => nil
attribute :options, :kind_of => String, :default => nil
attribute :creation_time,  :kind_of => String, :default => nil
attribute :description,  :kind_of => String, :default => nil
attribute :dns_name,  :kind_of => String, :default => nil
attribute :id,  :kind_of => String, :default => nil
attribute :kind,  :kind_of => String, :default => nil
attribute :name,  :kind_of => String, :default => nil
attribute :name_server_set,  :kind_of => String, :default => nil
attribute :name_servers,  :kind_of => String, :default => nil

def initialize(*args)
  super
  @action = :create_managed_zone
end

