# dbjorge_net_mumble_server

Installs and configures a mumble server with the "normal" dbjorge.net
configuration. ~~Some items~~ are still TODO.

## mumble_service

Uses the mumble_server cookbook to install a mumble server

* Uses the "passwords" encrypted data bag to configure:
  - The SuperUser password (from value mumble_supw)
  - The
* Configures the superuser account according to the passwords/mumble_supw
encrypted data bag value
* Configures the server password according to the passwords
* ~~Configures the server to accept Ice commands using a generated secret~~

## mumble_runtime_config

Uses the mumble_service Ice config to perform runtime-only server configuration

* ~~Configures a default set of channels/groups/ACLs~~
* ~~Configures a server index channel identifying known servers~~
* ~~Configures a welcome message identifying the current server~~
* ~~Registers known user public keys with appropriate group associations~~
