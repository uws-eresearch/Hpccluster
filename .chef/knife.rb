current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "ifeanyi"
client_key               "#{current_dir}/ifeanyi.pem"
validation_client_name   "uws-validator"
validation_key           "#{current_dir}/uws-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/uws"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
security_group =["ssh"]
private_key = "/home/abolap/adelta"

knife[:openstack_username] = "i.egwutuoha@uws.edu.au"
knife[:openstack_password] = "NTdlMGIxYjljNTY1MDkz"
### Note: If you are not proxying HTTPS to the OpenStack auth port, the scheme should be HTTP
knife[:openstack_auth_url] = "https://keystone.rc.nectar.org.au:5000/v2.0/tokens"
knife[:openstack_tenant] = "pt-2739"
