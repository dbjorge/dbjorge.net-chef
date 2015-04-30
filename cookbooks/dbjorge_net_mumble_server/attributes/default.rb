default['mumble_server']['config']['welcometext'] = '<br />Welcome to mumble.dbjorge.net<br />'

# The passwords bag should be non-encrypted - if you don't trust hosted Chef or its attackers
# with your mumble passwords, improve this to use an encrypted data bag/chef-vault/etc.
#
# Both password items should be of the form {"password": "hunter2"}
default['mumble_service']['passwords']['data_bag'] = 'passwords'
default['mumble_service']['passwords']['server_item'] = 'mumble_server'
default['mumble_service']['passwords']['superuser_item'] = 'mumble_superuser'
