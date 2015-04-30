#
# Cookbook Name:: dbjorge_net_mumble_server
# Recipe:: mumble_service
#
# Copyright 2015 Dan Bjorge
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

# Put this before everything else - without forcing the apt-get update,
# the mumble install sometimes fails
include_recipe 'apt'

server_creds = data_bag_item(
  node['mumble_service']['passwords']['data_bag'],
  node['mumble_service']['passwords']['server_item'])
server_password = server_creds['password']

superuser_creds = data_bag_item(
  node['mumble_service']['passwords']['data_bag'],
  node['mumble_service']['passwords']['superuser_item'])
superuser_password = superuser_creds['password']

node.default['mumble_server']['config']['server_password'] = server_password
include_recipe 'mumble_server'
mumble_server_supw superuser_password
