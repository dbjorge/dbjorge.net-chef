#
# Cookbook Name:: dbjorge_net_mumble_server
# Spec:: default
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

require 'spec_helper'

describe 'dbjorge_net_mumble_server::mumble_service' do

  context 'when all attributes are default, on an unspecified platform' do

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    before do
      # Don't process mumble_server includes: it's not this spec's job, and
      # it doesn't work on Windows.
      allow_any_instance_of(Chef::Recipe).to receive(:include_recipe).and_call_original
      allow_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('mumble_server')
    end

    context 'when the passwords bag is populated' do
      before do
        allow_any_instance_of(Chef::Recipe).to receive(:data_bag_item).and_return(Hash.new)
        allow_any_instance_of(Chef::Recipe).to receive(:data_bag_item).with("passwords", "server_item").and_return({"id" => "server_item", "password" => "hunter2"})
        allow_any_instance_of(Chef::Recipe).to receive(:data_bag_item).with("passwords", "superuser_item").and_return({"id" => "superuser_item", "password" => "hunter2!!!"})
      end

      it 'converges successfully' do
        chef_run # This should not raise an error
      end

      it 'includes the mumble_server recipe' do
        expect_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('mumble_server')
        chef_run
      end
    end

    context 'when the passwords bag exists but is empty' do
      before do
        allow_any_instance_of(Chef::Recipe).to receive(:data_bag_item).and_return(Hash.new)
      end

      it 'raises an error' do
        expect{chef_run}.to raise_error
      end
    end

    context 'when the passwords bag is not populated' do
      it 'raises an error' do
        expect{chef_run}.to raise_error
      end
    end
  end
end
