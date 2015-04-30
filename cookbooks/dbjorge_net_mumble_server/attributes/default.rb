default['mumble_server']['config']['welcometext'] = '<br />Welcome to mumble.dbjorge.net<br />'

# The passwords bag should be encrypted using the default secret file from
# Chef::Config[:encrypted_data_bag_secret], typically /etc/chef/encrypted_data_bag_secret
#
# Both password values should contain a string value under the "password" key
default['mumble_service']['passwords_data_bag_name'] = 'passwords'
default['mumble_service']['server_password_key_name'] = 'mumble_server_password'
default['mumble_service']['superuser_password_key_name'] = 'mumble_superuser_password'
