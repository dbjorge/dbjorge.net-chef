# See https://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "dbjorge"
client_key               "#{current_dir}/dbjorge.pem"
validation_client_name   "dbjorge-validator"
validation_key           "#{current_dir}/dbjorge-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/dbjorge"
cookbook_path            ["#{current_dir}/../cookbooks"]
