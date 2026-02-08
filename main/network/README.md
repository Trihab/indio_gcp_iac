## Network Deployment

In this section, I deploy the base VPC for our infrastructure. 

Then Terraform will deploy the VPN services that will link my on-premise network to the newly created VPC.

### Cloud VPN

There is two main components to setup for Cloud VPN to work : a VPN Gateway and a VPN tunnel. Since I don't need a HA VPN, I will also need to reserve a fixed external IP address. 