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

server_creds = Chef::EncryptedDataBagItem.load(
  node['mumble_service']['passwords_data_bag_name'],
  node['mumble_service']['server_password_key_name'])

node.default['mumble_server']['server_password'] = server_creds['password']

include_recipe 'mumble_server'

supw_creds = Chef::EncryptedDataBagItem.load(
  node['mumble_service']['passwords_data_bag_name'],
  node['mumble_service']['superuser_password_key_name'])

mumble_server_supw node['mumble_service']['supw_password']
