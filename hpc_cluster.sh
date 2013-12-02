#!/bin/bash
# (old version)


while test $# -gt 0
do
    case $1 in
        node-8)
            pages=$2
            shift
         echo "You have requested to create 8 node "
            ;;
        node-4)
        
        # For head node
        knife openstack server create --node-name head \
        --image m1.small \
        --flavor 0 \
        -I 31c04df6-bd2e-4c26-94e6-25ed8d5ea4bc \
#       --ssh-user ubuntu

# for n number of nodes 
        knife openstack server create --node-name hpccluster-n1 \
        --image m1.small \
        --flavor 0 \
        -I da25540c-8b74-4ca0-ba39-4c61c87a0d99 \
#        --ssh-user ubuntu

# for n number of nodes 
        knife openstack server create --node-name hpccluster-n2 \
        --image m1.small \
        --flavor 0 \
        -I da25540c-8b74-4ca0-ba39-4c61c87a0d99 \
#        --ssh-user ubuntu

# for n number of nodes 
        knife openstack server create --node-name hpccluster-n3 \
        --image m1.small \
        --flavor 0 \
        -I da25540c-8b74-4ca0-ba39-4c61c87a0d99 \
#        --ssh-user ubuntu

# Write the ip addresses and names of all the nodes for bootstrap
        knife openstack server list > serverlist.txt
# Wait 1  sec
sleep 1
#  Get and use ip address to login 
ipaddress2=$(awk 'FNR == 2 {print $3}' serverlist.txt)
ipaddress3=$(awk 'FNR == 3 {print $3}' serverlist.txt)
ipaddress4=$(awk 'FNR == 4 {print $3}' serverlist.txt)
ipaddress5=$(awk 'FNR == 5 {print $3}' serverlist.txt)

echo "$ipaddress2"
echo "$ipaddress3"
echo "$ipaddress4"
echo "$ipaddress5"



#  Configure the  hosts file for all the host
allnodes=$(cat serverlist.txt | grep 115*. | cut -d: -f2 | awk '{print $3 " " $2}')
echo "$allnodes" 
echo "$allnodes" > all-nodes-ip-name.txt

# Allow /etc/hosts files to be remotely written
ssh -t -i ~/.ssh/hpc.pem ubuntu@$ipaddress2 'sudo -i' "chmod 777 /etc/hosts"
ssh -t -i ~/.ssh/hpc.pem ubuntu@$ipaddress3 'sudo -i' "chmod 777 /etc/hosts"
ssh -t -i ~/.ssh/hpc.pem ubuntu@$ipaddress4 'sudo -i' "chmod 777 /etc/hosts"
ssh -t -i ~/.ssh/hpc.pem ubuntu@$ipaddress5 'sudo -i' "chmod 777 /etc/hosts"


# Add the nodes to the hosts file
cat all-nodes-ip-name.txt | ssh -t -i ~/.ssh/hpc.pem ubuntu@$ipaddress2 'sudo -i' "cat >> /etc/hosts"
cat all-nodes-ip-name.txt | ssh -t -i ~/.ssh/hpc.pem ubuntu@$ipaddress3 'sudo -i' "cat >> /etc/hosts"
cat all-nodes-ip-name.txt | ssh -t -i ~/.ssh/hpc.pem ubuntu@$ipaddress4 'sudo -i' "cat >> /etc/hosts"
cat all-nodes-ip-name.txt | ssh -t -i ~/.ssh/hpc.pem ubuntu@$ipaddress5 'sudo -i' "cat >> /etc/hosts"


# Remove access to files 
ssh -t -i ~/.ssh/hpc.pem ubuntu@$ipaddress2 'sudo -i' "chmod 775 /etc/hosts"
ssh -t -i ~/.ssh/hpc.pem ubuntu@$ipaddress3 'sudo -i' "chmod 775 /etc/hosts"
ssh -t -i ~/.ssh/hpc.pem ubuntu@$ipaddress4 'sudo -i' "chmod 775 /etc/hosts"
ssh -t -i ~/.ssh/hpc.pem ubuntu@$ipaddress5 'sudo -i' "chmod 775 /etc/hosts"

# Delay 2 sec
sleep 2
# reboot the nodes
ssh -t -i ~/.ssh/hpc.pem ubuntu@$ipaddress2 'sudo -i' "reboot"
ssh -t -i ~/.ssh/hpc.pem ubuntu@$ipaddress3 'sudo -i' "reboot"
ssh -t -i ~/.ssh/hpc.pem ubuntu@$ipaddress4 'sudo -i' "reboot"
ssh -t -i ~/.ssh/hpc.pem ubuntu@$ipaddress5 'sudo -i' "reboot"




            shift
         echo "Log in to head node "
            ;;
        node-2)
            knife openstack server create --node-name head \
            --image m1.small \
            --flavor 0 \
            -I 31c04df6-bd2e-4c26-94e6-25ed8d5ea4bc \
#       --ssh-user ubuntu

# for n number of nodes 
            knife openstack server create --node-name hpccluster-n1 \
            --image m1.small \
            --flavor 0 \
            -I da25540c-8b74-4ca0-ba39-4c61c87a0d99 \
#            --ssh-key ~/.ssh/hpc.pem \ 

# Write the ip addresses and names of all the nodes for bootstrap
        knife openstack server list > serverlist.txt
# Wait 1  sec
sleep 1
#  Get and use ip address to login 
ipaddress2=$(awk 'FNR == 2 {print $3}' serverlist.txt)
ipaddress3=$(awk 'FNR == 3 {print $3}' serverlist.txt)
echo "$ipaddress2"
echo "$ipaddress3"

#  Configure the  hosts file for all the host
allnodes=$(cat serverlist.txt | grep 115*. | cut -d: -f2 | awk '{print $3 " " $2}')
echo "$allnodes" 
echo "$allnodes" > all-nodes-ip-name.txt

# Allow /etc/hosts files to be remotely written
ssh -t -i ~/.ssh/hpc.pem ubuntu@$ipaddress2 'sudo -i' "chmod 777 /etc/hosts"
ssh -t -i ~/.ssh/hpc.pem ubuntu@$ipaddress3 'sudo -i' "chmod 777 /etc/hosts"

# Add the nodes to the hosts file
cat all-nodes-ip-name.txt | ssh -t -i ~/.ssh/hpc.pem ubuntu@$ipaddress2 'sudo -i' "cat >> /etc/hosts"
cat all-nodes-ip-name.txt | ssh -t -i ~/.ssh/hpc.pem ubuntu@$ipaddress3 'sudo -i' "cat >> /etc/hosts"

# Remove access to files 
ssh -t -i ~/.ssh/hpc.pem ubuntu@$ipaddress2 'sudo -i' "chmod 775 /etc/hosts"
ssh -t -i ~/.ssh/hpc.pem ubuntu@$ipaddress3 'sudo -i' "chmod 775 /etc/hosts"

# Delay 2 sec
sleep 2
# reboot the nodes
ssh -t -i ~/.ssh/hpc.pem ubuntu@$ipaddress2 'sudo -i' "reboot"
ssh -t -i ~/.ssh/hpc.pem ubuntu@$ipaddress3 'sudo -i' "reboot"


#        -u ubuntu -d BOOTSTRAP -r 'role[webserver]'
#        --ssh-user ubuntu

            shift
         echo "Log in to head node."
            ;;
        *)
            echo >&2 "You can only create 2, 4, or 8 node."
            echo >&2 "Please choose node-2, node-4 or node-8"
            ;;
    esac
    shift
done

