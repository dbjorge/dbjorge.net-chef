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

# AWS config
knife[:aws_credential_file] = ENV['AWS_CREDENTIAL_FILE']
knife[:flavor] = 't2.micro'
knife[:availability_zone] = nil # Allow Amazon to choose
knife[:aws_ssh_key_id] = 'chef-node-ssh-key'
knife[:identity_file] = "#{current_dir}/chef-node-ssh-key.pem"
knife[:region] = 'us-east-1'

# Ubuntu Server 14.04 LTS (HVM), SSD Volume Type, 64-bit
knife[:image] = 'ami-d05e75b8'
knife[:ssh_user] = 'ubuntu'

# Amazon Linux AMI 2015.03 (HVM), SSD Volume Type, 64-bit
# knife[:image] = 'ami-1ecae776'
# knife[:ssh_user] = 'ec2-user'
