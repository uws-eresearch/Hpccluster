current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "xxx" #Node name
client_key               "#{current_dir}/xxx" #Chef key
validation_client_name   "uws-validator"
validation_key           "#{current_dir}/uws-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/uws"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
#security_group =["default"]
security_group = ["ssh"]
private_key = "xxx" #The directory where your key that you use to login to Nectar cloud

knife[:openstack_username] = "xxx" #Your openstack user name
knife[:openstack_password] = " xxx" #Your openstack generated password
### Note: If you are not proxying HTTPS to the OpenStack auth port, the scheme should be HTTP
knife[:openstack_auth_url] = "https://keystone.rc.nectar.org.au:5000/v2.0/tokens"
knife[:openstack_tenant] = "xxx" #your project name
knife[:availability_zone] = "melbourne-np"
knife[:openstack_ssh_key_id] = "xxx" #Your openstack ssh key
knife[:openstack_ssh_port] = "22"
