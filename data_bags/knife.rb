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
private_key = "/home/abolap/hpc.pem"

knife[:openstack_username] = "i.egwutuoha@uws.edu.au"
knife[:openstack_password] = "NTdlMGIxYjljNTY1MDkz"
### Note: If you are not proxying HTTPS to the OpenStack auth port, the scheme should be HTTP
knife[:openstack_auth_url] = "https://keystone.rc.nectar.org.au:5000/v2.0/tokens"
knife[:openstack_tenant] = "pt-2739"
knife[:availability_zone] = "melbourne-np"
knife[:openstack_ssh_key_id] = "hpc"
knife[:openstack_ssh_port] = "22"
#knife[:ec2_username] = "i.egwutuoha@uws.edu.au"
#knife[:ec2_password] = "NTdlMGIxYjljNTY1MDkz"
#knife[:ec2_ssh_key_id] = 'adelta'
#knife[:ec2_url] = "https://nova.rc.nectar.org.au:8773/services/Cloud"
#knife[:s3_url] = "https://swift.rc.nectar.org.au:8888/"
##knife[:ec2_user_id] = "42"

#knife[:openstack_access_key_id] = 'i.egwutuoha@uws.edu.au'
#knife[:openstack_secret_access_key] = 'NTdlMGIxYjljNTY1MDkz'
#knife[:openstack_api_endpoint] = 'https://nova.rc.nectar.org.au:8773/services/Cloud'

knife[:euca_access_key_id] = 'e93593f5ad2544c08854c5174df70846'
knife[:euca_secret_access_key] = 'a1a8a4a0ef194057924dfbb8f05979de'
knife[:euca_api_endpoint] = "https://nova.rc.nectar.org.au:8773/services/Cloud"
knife[:euca_ssh_key_id] = "adelta"
knife[:euca_ssh_port] = "22"
knife[:euca_tenant] = "pt-2739"

