### CONFIG ###

# Path to a RHEL image on local machine, downloaded from Red Hat Customer Portal
RHEL_IMAGE_PATH="${HOME}/Downloads/rhel-guest-image-7.3-35.x86_64.qcow2"

# Choose to delete or retain the clean image
DELETE_IMAGE='false'

# Choose to delete or retain the gold image
DELETE_GOLD_IMAGE='true'

# Username and password for Red Hat Customer Portal
RH_USERNAME='xxx'
RH_PASSWORD='xxx'
# Pool ID which shall be used to register the pre-registered image
RH_POOL_ID='8a85f981544efea201544fba3da243dd'

# Project ID and zone settings for Google Cloud
GCLOUD_PROJECT='openshift-gcp-163321'
GCLOUD_ZONE='asia-east1-c'

# DNS domain which will be configured in Google Cloud DNS
DNS_DOMAIN='openshift.megatron.world'
# Name of the DNS zone in the Google Cloud DNS. If empty, it will be created
DNS_DOMAIN_NAME='openshift-megatron-world'
# DNS name for the Master service
MASTER_DNS_NAME="master.${DNS_DOMAIN}"
# Internal DNS name for the Master service
INTERNAL_MASTER_DNS_NAME="internal-master.${DNS_DOMAIN}"
# Domain name for the OpenShift applications
OCP_APPS_DNS_NAME="apps.${DNS_DOMAIN}"
# Paths on the local system for the certificate files. If empty, self-signed
# certificate will be generated
#MASTER_HTTPS_CERT_FILE="${HOME}/master.${DNS_DOMAIN}.pem"
#MASTER_HTTPS_KEY_FILE="${HOME}/master.${DNS_DOMAIN}.key"

# Prefix for every resource name deployed
OCP_PREFIX='ocp'

# OpenShift Identity providers. This is Google oauth example (hosted_domain is optional and restricts login to users only from the specified domain)
OCP_IDENTITY_PROVIDERS='[ {"name": "google", "kind": "GoogleIdentityProvider", "login": "true", "challenge": "false", "mapping_method": "claim", "client_id": "436770764973-brim6vit4mtocai651uq8bsd7tvv07rr.apps.googleusercontent.com", "client_secret": "xxx", "hosted_domain": "master.openshift.megatron.world"} ]'

# OpenShift SDN selection (options are 'openshift-ovs-subnet', 'openshift-ovs-multitenant')
OPENSHIFT_SDN='openshift-ovs-subnet'

## DEFAULT VALUES ##

OCP_VERSION='3.4'

MASTER_INSTANCE_TEMPLATE='master-template'
NODE_INSTANCE_TEMPLATE='node-template'
INFRA_NODE_INSTANCE_TEMPLATE='infra-node-template'

BASTION_INSTANCE='bastion'

# How many instances should be created for each group
MASTER_INSTANCE_GROUP='ocp-master'
MASTER_INSTANCE_GROUP_SIZE='3'
MASTER_NAMED_PORT_NAME='web-console'
INFRA_NODE_INSTANCE_GROUP='ocp-infra'
INFRA_NODE_INSTANCE_GROUP_SIZE='3'
NODE_INSTANCE_GROUP='ocp-node'
NODE_INSTANCE_GROUP_SIZE='2'

BASTION_MACHINE_TYPE='n1-standard-1'
MASTER_MACHINE_TYPE='n1-standard-2'
NODE_MACHINE_TYPE='n1-standard-2'

BASTION_DISK_SIZE='20'
MASTER_BOOT_DISK_SIZE='35'
NODE_BOOT_DISK_SIZE='25'
NODE_DOCKER_DISK_SIZE='25'
NODE_OPENSHIFT_DISK_SIZE='50'

NODE_DOCKER_DISK_SIZE='25'
NODE_DOCKER_DISK_POSTFIX='-docker'
NODE_OPENSHIFT_DISK_SIZE='50'
NODE_OPENSHIFT_DISK_POSTFIX='-openshift'

NETWORK_DEPLOYMENT='deployment-net'
CORE_DEPLOYMENT='deployment-core'

OCP_NETWORK='network'

MASTER_SSL_LB_CERT='master-ssl-lb-cert'

BASTION_SSH_FW_RULE='bastion-ssh-to-external-ip'

IMAGE_BUCKET="${GCLOUD_PROJECT}-${OCP_PREFIX}-rhel-guest-raw-image"
REGISTRY_BUCKET="${GCLOUD_PROJECT}-${OCP_PREFIX}-registry-bucket"

TEMP_INSTANCE='rhel-temp'

GOOGLE_CLOUD_SDK_VERSION='146.0.0'

# Only 443 is supported
CONSOLE_PORT='443'

SSH_CONFIG_FILE="${HOME}/.ssh/config"
