# =================================================================
# Copyright 2018 IBM Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# =================================================================

# This is a terraform generated template generated from ibm_workflow_v18_singlenode

##############################################################
# Keys - CAMC (public/private) & optional User Key (public)
##############################################################
variable "user_public_ssh_key" {
  type = "string"
  description = "User defined public SSH key used to connect to the virtual machine. The format must be in openSSH."
  default = "None"
}

variable "ibm_stack_id" {
  description = "A unique stack id."
}

variable "ibm_pm_public_ssh_key" {
  description = "Public CAMC SSH key value which is used to connect to a guest, used on VMware only."
}

variable "ibm_pm_private_ssh_key" {
  description = "Private CAMC SSH key (base64 encoded) used to connect to the virtual guest."
}

variable "allow_unverified_ssl" {
  description = "Communication with vsphere server with self signed certificate"
  default = "true"
}

##############################################################
# Define the vsphere provider
##############################################################
provider "vsphere" {
  allow_unverified_ssl = "${var.allow_unverified_ssl}"
  version = "~> 1.3"
}

provider "camc" {
  version = "~> 0.2"
}

##############################################################
# Define pattern variables
##############################################################
##### unique stack name #####
variable "ibm_stack_name" {
  description = "A unique stack name."
}

##############################################################
# Vsphere data for provider
##############################################################
data "vsphere_datacenter" "Workflow01_datacenter" {
  name = "${var.Workflow01_datacenter}"
}
data "vsphere_datastore" "Workflow01_datastore" {
  name = "${var.Workflow01_root_disk_datastore}"
  datacenter_id = "${data.vsphere_datacenter.Workflow01_datacenter.id}"
}
data "vsphere_resource_pool" "Workflow01_resource_pool" {
  name = "${var.Workflow01_resource_pool}"
  datacenter_id = "${data.vsphere_datacenter.Workflow01_datacenter.id}"
}
data "vsphere_network" "Workflow01_network" {
  name = "${var.Workflow01_network_interface_label}"
  datacenter_id = "${data.vsphere_datacenter.Workflow01_datacenter.id}"
}

data "vsphere_virtual_machine" "Workflow01_template" {
  name = "${var.Workflow01-image}"
  datacenter_id = "${data.vsphere_datacenter.Workflow01_datacenter.id}"
}

##### Environment variables #####
#Variable : ibm_im_repo
variable "ibm_im_repo" {
  type = "string"
  description = "IBM Software  Installation Manager Repository URL (https://<hostname/IP>:<port>/IMRepo) "
}

#Variable : ibm_im_repo_password
variable "ibm_im_repo_password" {
  type = "string"
  description = "IBM Software  Installation Manager Repository Password"
}

#Variable : ibm_im_repo_user
variable "ibm_im_repo_user" {
  type = "string"
  description = "IBM Software  Installation Manager Repository username"
  default = "repouser"
}

#Variable : ibm_pm_access_token
variable "ibm_pm_access_token" {
  type = "string"
  description = "IBM Pattern Manager Access Token"
}

#Variable : ibm_pm_service
variable "ibm_pm_service" {
  type = "string"
  description = "IBM Pattern Manager Service"
}

#Variable : ibm_sw_repo
variable "ibm_sw_repo" {
  type = "string"
  description = "IBM Software Repo Root (https://<hostname>:<port>)"
}

#Variable : ibm_sw_repo_password
variable "ibm_sw_repo_password" {
  type = "string"
  description = "IBM Software Repo Password"
}

#Variable : ibm_sw_repo_user
variable "ibm_sw_repo_user" {
  type = "string"
  description = "IBM Software Repo Username"
  default = "repouser"
}


##### virtualmachine variables #####

##### Workflow01 variables #####
#Variable : Workflow01-image
variable "Workflow01-image" {
  type = "string"
  description = "Identifier of the operating system image or template that you use to create the virtual image"
}

#Variable : Workflow01-name
variable "Workflow01-name" {
  type = "string"
  description = "Short hostname of virtual machine"
}

#Variable : Workflow01-os_admin_user
variable "Workflow01-os_admin_user" {
  type = "string"
  description = "Name of the administrator account in the virtual machine that will be accessed via SSH"
}

locals {
  Workflow01_install_dir = "/home/${var.Workflow01_baw_os_user_name}/IBM/Workflow"
}

#Variable : Workflow01_baw_os_user_comment
variable "Workflow01_baw_os_user_comment" {
  type = "string"
  description = "Comments that you can add when you create the user identifier"
  default = "WAS administrative user"
}

#Variable : Workflow01_baw_os_user_gid
variable "Workflow01_baw_os_user_gid" {
  type = "string"
  description = "The operating system group name that will be assigned to the product installation"
  default = "workflowgroup"
}

locals {
  Workflow01_baw_os_user_home = "/home/${var.Workflow01_baw_os_user_name}"
}

#Variable : Workflow01_baw_os_user_ldap_user
variable "Workflow01_baw_os_user_ldap_user" {
  type = "string"
  description = "A flag that indicates whether to create the WebSphere user locally or to use an LDAP-based user"
  default = "false"
}

#Variable : Workflow01_baw_os_user_name
variable "Workflow01_baw_os_user_name" {
  type = "string"
  description = "The user identifier to the operating system which will be used to install the product. The identifier is created if it does not exist."
  default = "workflowuser01"
}

#Variable : Workflow01_product_version
variable "Workflow01_product_version" {
  type = "string"
  description = "The product version of IBM Business Automation Workflow"
  default = "18.0.0.1"
}
#Variable : Workflow01_product_edition
variable "Workflow01_product_edition" {
  type = "string"
  description = "The product edition of IBM Business Automation Workflow: Server, ESB, or Express"
  default = "Server"
}
#Variable : Workflow01_features
variable "Workflow01_features" {
  type = "string"
  description = "IBM Business Automation Workflow Enterprise license: IBM Business Automation Workflow Enterprise Production or IBM Business Automation Workflow Enterprise Non-production."
  default = "WorkflowEnterprise.Production"
}
#Variable : Workflow01_was_offering_id
variable "Workflow01_was_offering_id" {
  type = "string"
  description = "The offering ID of WebSphere Application Server"
  default = "com.ibm.websphere.ND.v85"
}
#Variable : Workflow01_was_profile_id
variable "Workflow01_was_profile_id" {
  type = "string"
  description = "The profile identifier of WebSphere Application Server"
  default = "IBM WebSphere Application Server Network Deployment V8.5"
}
#Variable : Workflow01_baw_offering_id
variable "Workflow01_baw_offering_id" {
  type = "string"
  description = "The offering ID of IBM Business Automation Workflow"
  default = "com.ibm.bpm.ADV.v85"
}
#Variable : Workflow01_db2_offering_id
variable "Workflow01_db2_offering_id" {
  type = "string"
  description = "The offering ID of the DB2 database system"
  default = "com.ibm.ws.DB2EXP.linuxia64"
}
#Variable : Workflow01_install_mode
variable "Workflow01_install_mode" {
  type = "string"
  description = "The installation mode for IBM Business Automation Workflow"
  default = "nonAdmin"
}
#Variable : Workflow01_baw_os_user_shell
variable "Workflow01_baw_os_user_shell" {
  type = "string"
  description = "Shell that the operating system user uses for product installation"
  default = "/bin/bash"
}
variable "Workflow01_cell_admin_username" {
  type = "string"
  description = "The cell administrator's name"
  default = "celladmin"
}
variable "Workflow01_cell_admin_userpassword" {
  type = "string"
  description = "The cell administrator's password"
}
variable "Workflow01_de_admin_username" {
  type = "string"
  description = "The user name of the development environment administrator"
  default = "deadmin"
}
variable "Workflow01_de_admin_userpassword" {
  type = "string"
  description = "The password for the development environment administrator"
}
variable "Workflow01_config_product_type" {
  type = "string"
  description = "The product type for configuration: Advanced or AdvancedOnly"
}
variable "Workflow01_config_deployment_type" {
  type = "string"
  description = "The deployment type for configuration: Workflow Center or Workflow Server"
}
variable "Workflow01_config_cluster_type" {
  type = "string"
  description = "The cluster type for the configuration: SingleCluster"
}

##### Database variables #####
#Variable : Database_type
variable "Database_type" {
  type = "string"
  description = "The database type for configuration, Db2 or Oracle"
}
#Variable : Oracle_jdbc_driver
variable "Oracle_jdbc_driver" {
  type = "string"
  description = "The name of the Oracle JDBC driver"
}

############## DB2 ###########
variable "Workflow01_db2_install" {
  type = "string"
  description = "Installs the DB2 database system"
}
variable "Workflow01_db2_hostname" {
  type = "string"
  description = "The hostname of the DB2 instance"
}
variable "Workflow01_db2_port" {
  type = "string"
  description = "The port number of the DB2 instance"
}
variable "Workflow01_db2_instance_username" {
  type = "string"
  description = "The user name of the Db2 instance."
  default = "db2inst1"
}
variable "Workflow01_db2_instance_userpassword" {
  type = "string"
  description = "The password for the Db2 instance."
}
variable "Workflow01_db2_instance_username_config" {
  type = "string"
  description = "The user name of the Db2 instance."
  default = "db2inst1"
}
variable "Workflow01_db2_instance_userpassword_config" {
  type = "string"
  description = "The password for the DB2 instance"
}
variable "Workflow01_db2_fenced_newuser" {
  type = "string"
  description = "Creates a Db2 fenced user."
}
variable "Workflow01_db2_fenced_username" {
  type = "string"
  description = "The fenced user name of the DB2 instance"
  default = "fenceuser"
}
variable "Workflow01_db2_fenced_userpassword" {
  type = "string"
  description = "The fenced user password for the DB2 instance"
}
variable "Workflow01_db2_das_newuser" {
  type = "string"
  description = "Creates a user of the administration server"
}
variable "Workflow01_db2_das_username" {
  type = "string"
  description = "The user name to access the administration server of the DB2 instance"
  default = "dasuser"
}
variable "Workflow01_db2_das_userpassword" {
  type = "string"
  description = "The password to the administration server of the DB2"
}
variable "Workflow01_db2_common_database" {
  type = "string"
  description = "Specifies the name of the Common database"
  default = "CMNDB"
}
variable "Workflow01_db2_process_database" {
  type = "string"
  description = "Specifies the name of the Process database"
  default = "BPMDB"
}
variable "Workflow01_db2_perf_database" {
  type = "string"
  description = "Specifies the name of the Performance Data Warehouse database"
  default = "PDWDB"
}
variable "Workflow01_db2_cpe_database" {
  type = "string"
  description = "Specifies the name of the Content database"
  default = "CPEDB"
}
variable "Database_cpe_icndb_schema" {
  type = "string"
  description = "The schema for IBM Content Navigator (ICNDb)."
  default = "ICNSA"
}
variable "Database_cpe_icndb_tablespace" {
  type = "string"
  description = "The table space for IBM Content Navigator (ICNDb)."
  default = "WFICNTS"
}
variable "Database_cpe_dosdb_schema" {
  type = "string"
  description = "The schema for the design object store (DosDb)."
  default = "DOSSA"
}
variable "Database_cpe_dosdb_tsdosdata" {
  type = "string"
  description = "The data table space for the design object store (DosDb)."
  default = "DOSSA_DATA_TS"
}
variable "Database_cpe_dosdb_tsdoslob" {
  type = "string"
  description = "The large object table space for the design object store (DosDb)."
  default = "DOSSA_LOB_TS"
}
variable "Database_cpe_dosdb_tsdosidx" {
  type = "string"
  description = "The index table space for the design object store (DosDb)."
  default = "DOSSA_IDX_TS"
}
variable "Database_cpe_tosdb_schema" {
  type = "string"
  description = "The schema for the target object store (TosDb)."
  default = "TOSSA"
}
variable "Database_cpe_tosdb_tstosdata" {
  type = "string"
  description = "The data table space for the target object store (TosDb)."
  default = "TOSSA_DATA_TS"
}
variable "Database_cpe_tosdb_tstoslob" {
  type = "string"
  description = "The large object table space for the target object store (TosDb)."
  default = "TOSSA_LOB_TS"
}
variable "Database_cpe_tosdb_tstosidx" {
  type = "string"
  description = "The index table space for the target object store (TosDb)."
  default = "TOSSA_IDX_TS"
}

############ Oracle ############
#Variable : Database_oracle_hostname
variable "Database_oracle_hostname" {
  type = "string"
  description = "The hostname of the Oracle database."
}
#Variable : Database_oracle_port
variable "Database_oracle_port" {
  type = "string"
  description = "The port number of the Oracle database."
  default = "1521"
}
#Variable : Database_oracle_database_name
variable "Database_oracle_database_name" {
  type = "string"
  description = "The name of the Oracle database."
  default = "orcl"
}
#Variable : Database_oracle_shareddb_username
variable "Database_oracle_shareddb_username" {
  type = "string"
  description = "The user name of the SharedDb schema."
}
#Variable : Database_oracle_shareddb_userpassword
variable "Database_oracle_shareddb_userpassword" {
  type = "string"
  description = "The user password for the SharedDb schema."
}
#Variable : Database_oracle_cellonlydb_username
variable "Database_oracle_cellonlydb_username" {
  type = "string"
  description = "The user name of the CellOnlyDb schema."
}
#Variable : Database_oracle_cellonlydb_userpassword
variable "Database_oracle_cellonlydb_userpassword" {
  type = "string"
  description = "The user password for the CellOnlyDb schema."
} 
#Variable : Database_oracle_psdb_username
variable "Database_oracle_psdb_username" {
  type = "string"
  description = "The user name of the ProcessServerDb schema."
}
#Variable : Database_oracle_psdb_userpassword
variable "Database_oracle_psdb_userpassword" {
  type = "string"
  description = "The user password for the ProcessServerDb schema."
}
#Variable : Database_oracle_icndb_username
variable "Database_oracle_icndb_username" {
  type = "string"
  description = "The user name of the IBM Content Navigator (ICNDb) schema."
}
#Variable : Database_oracle_icndb_userpassword
variable "Database_oracle_icndb_userpassword" {
  type = "string"
  description = "The user password for the IBM Content Navigator (ICNDb) schema."
}
#Variable : Database_oracle_icndb_tablespace
variable "Database_oracle_icndb_tablespace" {
  type = "string"
  description = "The table space for the IBM Content Navigator (ICNDb) schema."
  default = "WFICNTS"
}
#Variable : Database_oracle_dosdb_username
variable "Database_oracle_dosdb_username" {
  type = "string"
  description = "The user name of the design object store (DosDb) schema."
}
#Variable : Database_oracle_dosdb_userpassword
variable "Database_oracle_dosdb_userpassword" {
  type = "string"
  description = "The user password for the design object store (DosDb) schema."
}
#Variable : Database_oracle_dosdb_tsdosdata
variable "Database_oracle_dosdb_tsdosdata" {
  type = "string"
  description = "The data table space for the design object store (DosDb) schema."
  default = "DOSSA_DATA_TS"
}  
#Variable : Database_oracle_tosdb_username
variable "Database_oracle_tosdb_username" {
  type = "string"
  description = "The user name of the target object store (TosDb) schema."
}
#Variable : Database_oracle_tosdb_userpassword
variable "Database_oracle_tosdb_userpassword" {
  type = "string"
  description = "The user password for the target object store (TosDb) schema."
}
#Variable : Database_oracle_tosdb_tstosdata
variable "Database_oracle_tosdb_tstosdata" {
  type = "string"
  description = "The data table space for the target object store (TosDb) schema."
  default = "TOSSA_DATA_TS"
}       
#Variable : Database_oracle_pdwdb_username
variable "Database_oracle_pdwdb_username" {
  type = "string"
  description = "The user name of the PerformanceDb schema."
}      
#Variable : Database_oracle_pdwdb_userpassword
variable "Database_oracle_pdwdb_userpassword" {
  type = "string"
  description = "The user password for the PerformanceDb schema."
}

variable "Workflow01_root_disk_type" {
  type = "string"
  description = "Type of template disk volume"
  default = "eager_zeroed"
}
variable "Workflow01_ps_environment_purpose" {
  type = "string"
  description = "Specifies the Workflow Server environment: Development, Test, Staging, or Production"
  default = "Production"
}
variable "Workflow01_ps_offline" {
  type = "string"
  description = "Specifies whether Workflow Server is offline or online"
  default = "false"
}
variable "Workflow01_ps_pc_transport_protocol" {
  type = "string"
  description = "Specifies the transport protocol through which Workflow Server connects to Workflow Center"
  default = "https"
}
variable "Workflow01_ps_pc_hostname" {
  type = "string"
  description = "Specifies the Workflow Center hostname which Workflow Server connects to"
}
variable "Workflow01_ps_pc_port" {
  type = "string"
  description = "Specifies the Workflow Center port which Workflow Server connects to"
  default = "9080"
}
variable "Workflow01_ps_pc_contextroot_prefix" {
  type = "string"
  description = "Specifies the Workflow Center context root prefix which Workflow Server connects to"
}
variable "Workflow01_ps_pc_alias_user" {
  type = "string"
  description = "Specifies the Workflow Center alias user which Workflow Server connects to"
  default = "admin"
}
variable "Workflow01_ps_pc_alias_password" {
  type = "string"
  description = "Specifies the alias user password of Workflow Center that Workflow Server connects to"
  default = "admin"
}
variable "Workflow01_fixpack_names" {
  type = "list"
  description = "The full name of the Business Automation Workflow, the WebSphere Application Server fix pack installation package, or both package names. Attention: Specify all parts of a product fix pack in the input field separated by a semi-colon(;). Specify each product fix packs in different input fields. For example, the Business Automation Workflow 18002 fix pack package has only one part. To install this package, specify the following information in the input field, and press Enter: workflow.18002.delta.repository.zip. The WebSphere Application Server 85514 fix pack package has three parts. To install this package too, specify the following information in a new input field, and press Enter:  8.5.5-WS-WAS-FP014-part1.zip; 8.5.5-WS-WAS-FP014-part2.zip; 8.5.5-WS-WAS-FP014-part3.zip"
}
variable "Workflow01_ifix_names" {
  type = "list"
  description = "The full names of interim fix installation packages; for example, 8.6.10018002-WS-BPM-IFJRXXXXX.zip. The default packages are required."
}
variable "metering_url" {
  type = "string"
  description = "The URL of IBM Cloud Private Metering Service."
}
variable "metering_apikey" {
  type = "string"
  description = "The API key for the IBM Cloud Private Metering Service."
}

#########################################################
##### Resource : VaultItem
#########################################################

resource "camc_vaultitem" "VaultItem" {
  camc_endpoint = "${var.ibm_pm_service}/v1/vault_item/chef"
  access_token = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace = true
  data = <<EOT
{
  "vault_content": {
    "item": "secrets",
    "values": {},
    "vault": "${var.ibm_stack_id}"
  }
}
EOT
}


#########################################################
##### Resource : Workflow01
#########################################################

variable "Workflow01-os_password" {
  type = "string"
  description = "Operating System Password for the Operating System User to access virtual machine"
}

variable "Workflow01_folder" {
  description = "Target vSphere folder for virtual machine"
}

variable "Workflow01_datacenter" {
  description = "Target vSphere datacenter for virtual machine creation"
}

variable "Workflow01_domain" {
  description = "Domain Name of virtual machine"
}

variable "Workflow01_number_of_vcpu" {
  description = "Number of virtual CPU for the virtual machine, which is required to be a positive Integer"
  default = "4"
}

variable "Workflow01_memory" {
  description = "Memory assigned to the virtual machine in megabytes."
  default = "8192"
}

variable "Workflow01_cluster" {
  description = "Target vSphere cluster to host the virtual machine"
}

variable "Workflow01_resource_pool" {
  description = "Target vSphere Resource Pool to host the virtual machine"
}

variable "Workflow01_dns_suffixes" {
  type = "list"
  description = "Name resolution suffixes for the virtual network adapter"
}

variable "Workflow01_dns_servers" {
  type = "list"
  description = "DNS servers for the virtual network adapter"
}

variable "Workflow01_network_interface_label" {
  description = "vSphere port group or network label for virtual machine's vNIC"
}

variable "Workflow01_ipv4_gateway" {
  description = "IPv4 gateway for vNIC configuration"
}

variable "Workflow01_ipv4_address" {
  description = "IPv4 address for vNIC configuration"
}

variable "Workflow01_ipv4_prefix_length" {
  description = "IPv4 prefix length for vNIC configuration. The value must be a number between 8 and 32"
}

variable "Workflow01_adapter_type" {
  description = "Network adapter type for vNIC Configuration"
  default = "vmxnet3"
}

variable "Workflow01_root_disk_datastore" {
  description = "Data store or storage cluster name for target virtual machine's disks"
}

variable "Workflow01_root_disk_keep_on_remove" {
  type = "string"
  description = "Delete template disk volume when the virtual machine is deleted"
  default = "false"
}

variable "Workflow01_root_disk_size" {
  description = "Size of template disk volume. Should be equal to template's disk size"
  default = "100"
}

variable "Workflow01_root_disk_thin_provisioned" {
  description = "The template disk volume is thin_provisioned."
  default = "true"
}

# vsphere vm
resource "vsphere_virtual_machine" "Workflow01" {
  name = "${var.Workflow01-name}"
  folder = "${var.Workflow01_folder}"
  num_cpus = "${var.Workflow01_number_of_vcpu}"
  memory = "${var.Workflow01_memory}"
  resource_pool_id = "${data.vsphere_resource_pool.Workflow01_resource_pool.id}"
  datastore_id = "${data.vsphere_datastore.Workflow01_datastore.id}"
  guest_id = "${data.vsphere_virtual_machine.Workflow01_template.guest_id}"
  clone {
    template_uuid = "${data.vsphere_virtual_machine.Workflow01_template.id}"
    customize {
      linux_options {
        domain = "${var.Workflow01_domain}"
        host_name = "${var.Workflow01-name}"
      }
    network_interface {
      ipv4_address = "${var.Workflow01_ipv4_address}"
      ipv4_netmask = "${var.Workflow01_ipv4_prefix_length}"
    }
    ipv4_gateway = "${var.Workflow01_ipv4_gateway}"
    dns_suffix_list = "${var.Workflow01_dns_suffixes}"
    dns_server_list = "${var.Workflow01_dns_servers}"
    }
  }

  network_interface {
    network_id = "${data.vsphere_network.Workflow01_network.id}"
    adapter_type = "${var.Workflow01_adapter_type}"
  }

  disk {
    label = "${var.Workflow01-name}.disk0"
    size = "${var.Workflow01_root_disk_size}"
    keep_on_remove = "${var.Workflow01_root_disk_keep_on_remove}"
    thin_provisioned = "${var.Workflow01_root_disk_thin_provisioned}"
  }

  # Specify the connection
  connection {
    type = "ssh"
    user = "${var.Workflow01-os_admin_user}"
    password = "${var.Workflow01-os_password}"
  }

  provisioner "file" {
    destination = "Workflow01_add_ssh_key.sh"
    content     = <<EOF
# =================================================================
# Copyright 2018 IBM Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# =================================================================
#!/bin/bash

if (( $# != 3 )); then
echo "usage: arg 1 is user, arg 2 is public key, arg3 is CAMC Public Key"
exit -1
fi

userid="$1"
ssh_key="$2"
camc_ssh_key="$3"

user_home=$(eval echo "~$userid")
user_auth_key_file=$user_home/.ssh/authorized_keys
echo "$user_auth_key_file"
if ! [ -f $user_auth_key_file ]; then
echo "$user_auth_key_file does not exist on this system, creating."
mkdir $user_home/.ssh
chmod 700 $user_home/.ssh
touch $user_home/.ssh/authorized_keys
chmod 600 $user_home/.ssh/authorized_keys
else
echo "user_home : $user_home"
fi

echo "" >> "$user_auth_key_file"
if [[ $ssh_key = 'None' ]]; then
echo "skipping user key add, 'None' specified"
else
echo "$user_auth_key_file"
echo "$ssh_key" >> "$user_auth_key_file"
if [ $? -ne 0 ]; then
echo "failed to add to $user_auth_key_file"
exit -1
else
echo "updated $user_auth_key_file"
fi
fi

echo "$camc_ssh_key" >> "$user_auth_key_file"
if [ $? -ne 0 ]; then
echo "failed to add to $user_auth_key_file"
exit -1
else
echo "updated $user_auth_key_file"
fi

EOF
  }

  # Execute the script remotely
  provisioner "remote-exec" {
    inline = [
      "bash -c 'chmod +x Workflow01_add_ssh_key.sh'",
      "bash -c './Workflow01_add_ssh_key.sh  \"${var.Workflow01-os_admin_user}\" \"${var.user_public_ssh_key}\" \"${var.ibm_pm_public_ssh_key}\">> Workflow01_add_ssh_key.log 2>&1'"
    ]
  }

}

#########################################################
##### Resource : Workflow01_chef_bootstrap_comp
#########################################################

resource "camc_bootstrap" "Workflow01_chef_bootstrap_comp" {
  depends_on = ["camc_vaultitem.VaultItem","vsphere_virtual_machine.Workflow01"]
  name = "Workflow01_chef_bootstrap_comp"
  camc_endpoint = "${var.ibm_pm_service}/v1/bootstrap/chef"
  access_token = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace = true
  data = <<EOT
{
  "os_admin_user": "${var.Workflow01-os_admin_user}",
  "stack_id": "${var.ibm_stack_id}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.Workflow01.clone.0.customize.0.network_interface.0.ipv4_address}",
  "node_name": "${var.Workflow01-name}",
  "node_attributes": {
    "ibm_internal": {
      "stack_id": "${var.ibm_stack_id}",
      "stack_name": "${var.ibm_stack_name}",
      "vault": {
        "item": "secrets",
        "name": "${var.ibm_stack_id}"
      }
    }
  }
}
EOT
}


#########################################################
##### Resource : Workflow01_workflow_v18_install
#########################################################

resource "camc_softwaredeploy" "Workflow01_workflow_v18_install" {
  depends_on = ["camc_bootstrap.Workflow01_chef_bootstrap_comp"]
  name = "Workflow01_workflow_v18_install"
  camc_endpoint = "${var.ibm_pm_service}/v1/software_deployment/chef"
  access_token = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace = true
  data = <<EOT
{
  "os_admin_user": "${var.Workflow01-os_admin_user}",
  "stack_id": "${var.ibm_stack_id}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.Workflow01.clone.0.customize.0.network_interface.0.ipv4_address}",
  "node_name": "${var.Workflow01-name}",
  "runlist": "role[workflow_v18_0_201806_install]",
  "node_attributes": {
    "os_admin": {
      "user": "${var.Workflow01-os_admin_user}"
    },
    "ibm": {
      "im_repo": "${var.ibm_im_repo}",
      "im_repo_user": "${var.ibm_im_repo_user}",
      "sw_repo": "${var.ibm_sw_repo}/workflow",
      "sw_repo_user": "${var.ibm_sw_repo_user}",
      "log_dir": "${local.Workflow01_baw_os_user_home}/var/log/ibm_cloud",
      "ifix_repo": "${var.ibm_sw_repo}/workflow/ifixes"
    },
    "ibm_internal": {
      "roles": "[workflow_v18_0_201806_install]"
    },
    "was": {
      "offering_id": "${var.Workflow01_was_offering_id}"
    },
    "workflow":{
      "install_mode": "${var.Workflow01_install_mode}",
      "os_users": {
        "workflow": {
          "comment": "${var.Workflow01_baw_os_user_comment}",
          "gid": "${var.Workflow01_baw_os_user_gid}",
          "home": "${local.Workflow01_baw_os_user_home}",
          "ldap_user": "${var.Workflow01_baw_os_user_ldap_user}",
          "name": "${var.Workflow01_baw_os_user_name}",
          "shell": "${var.Workflow01_baw_os_user_shell}"
          }
      },
      "im_version": "1.8.9",
      "version": "${var.Workflow01_product_version}",
      "features": "${var.Workflow01_features}",
      "offering_id": "${var.Workflow01_baw_offering_id}",
      "install_dir": "${local.Workflow01_install_dir}",
      "profile_id": "${var.Workflow01_was_profile_id}",
      "config": {
        "celladmin_alias_user": "${var.Workflow01_cell_admin_username}"
      }
    },
    "db2": {
      "install": "${var.Workflow01_db2_install}",
      "offering_version": "11.1.0",
      "offering_id": "${var.Workflow01_db2_offering_id}",
      "port": "${var.Workflow01_db2_port}",
      "username": "${var.Workflow01_db2_instance_username}",
      "fenced_newuser": "${var.Workflow01_db2_fenced_newuser}",
      "fenced_username": "${var.Workflow01_db2_fenced_username}",
      "das_newuser": "${var.Workflow01_db2_das_newuser}",
      "das_username": "${var.Workflow01_db2_das_username}"
    }
  },
  "vault_content": {
    "item": "secrets",
    "values": {
      "ibm": {
        "im_repo_password": "${var.ibm_im_repo_password}",
        "sw_repo_password": "${var.ibm_sw_repo_password}"
      },
      "workflow": {
        "config": {
          "celladmin_alias_password": "${var.Workflow01_cell_admin_userpassword}"
        }
      },
      "db2": {
        "password": "${var.Workflow01_db2_instance_userpassword}",
        "fenced_password": "${var.Workflow01_db2_fenced_userpassword}",
        "das_password": "${var.Workflow01_db2_das_userpassword}"
      }
    },
    "vault": "${var.ibm_stack_id}"
  }
}
EOT
}

#########################################################
##### Resource : Workflow01_workflow_v18_upgrade
#########################################################

resource "camc_softwaredeploy" "Workflow01_workflow_v18_upgrade" {
  depends_on = ["camc_softwaredeploy.Workflow01_workflow_v18_install"]
  name = "Workflow01_workflow_v18_upgrade"
  camc_endpoint = "${var.ibm_pm_service}/v1/software_deployment/chef"
  access_token = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace = true
  data = <<EOT
{
  "os_admin_user": "${var.Workflow01-os_admin_user}",
  "stack_id": "${var.ibm_stack_id}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.Workflow01.clone.0.customize.0.network_interface.0.ipv4_address}",
  "node_name": "${var.Workflow01-name}",
  "runlist": "role[workflow_upgrade]",
  "node_attributes": {
    "ibm": {
      "fixpack_repo": "${var.ibm_sw_repo}/workflow/fixpacks"
    },
    "ibm_internal": {
      "roles": "[workflow_upgrade]"
    },
    "workflow":{
      "install_mode": "${var.Workflow01_install_mode}",
      "os_users": {
        "workflow": {
          "comment": "${var.Workflow01_baw_os_user_comment}",
          "gid": "${var.Workflow01_baw_os_user_gid}",
          "home": "${local.Workflow01_baw_os_user_home}",
          "ldap_user": "${var.Workflow01_baw_os_user_ldap_user}",
          "name": "${var.Workflow01_baw_os_user_name}",
          "shell": "${var.Workflow01_baw_os_user_shell}"
          }
      },
      "install_dir": "${local.Workflow01_install_dir}",
      "fixpack_names": ["${join("\",\"", var.Workflow01_fixpack_names)}"],
      "config": {
       "node_hostnames": "${var.Workflow01-name}.${var.Workflow01_domain}",
       "celladmin_alias_user": "${var.Workflow01_cell_admin_username}"
      }
    }
  },
  "vault_content": {
    "item": "secrets",
    "values": {
      "ibm": {
        "im_repo_password": "${var.ibm_im_repo_password}",
        "sw_repo_password": "${var.ibm_sw_repo_password}"
      },
      "workflow": {
        "config": {
          "celladmin_alias_password": "${var.Workflow01_cell_admin_userpassword}"
        }
      }
    },
    "vault": "${var.ibm_stack_id}"
  }
}
EOT
}

#########################################################
##### Resource : Workflow01_workflow_v18_applyifix
#########################################################

resource "camc_softwaredeploy" "Workflow01_workflow_v18_applyifix" {
  depends_on = ["camc_softwaredeploy.Workflow01_workflow_v18_upgrade"]
  name = "Workflow01_workflow_v18_applyifix"
  camc_endpoint = "${var.ibm_pm_service}/v1/software_deployment/chef"
  access_token = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace = true
  data = <<EOT
{
  "os_admin_user": "${var.Workflow01-os_admin_user}",
  "stack_id": "${var.ibm_stack_id}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.Workflow01.clone.0.customize.0.network_interface.0.ipv4_address}",
  "node_name": "${var.Workflow01-name}",
  "runlist": "role[workflow_applyifix]",
  "node_attributes": {
    "ibm": {
      "im_repo": "${var.ibm_im_repo}",
      "im_repo_user": "${var.ibm_im_repo_user}",
      "sw_repo": "${var.ibm_sw_repo}/workflow",
      "sw_repo_user": "${var.ibm_sw_repo_user}",
      "log_dir": "${local.Workflow01_baw_os_user_home}/var/log/ibm_cloud",
      "ifix_repo": "${var.ibm_sw_repo}/workflow/ifixes"
    },
    "ibm_internal": {
      "roles": "[workflow_applyifix]"
    },
    "workflow":{
      "install_mode": "${var.Workflow01_install_mode}",
      "os_users": {
        "workflow": {
          "comment": "${var.Workflow01_baw_os_user_comment}",
          "gid": "${var.Workflow01_baw_os_user_gid}",
          "home": "${local.Workflow01_baw_os_user_home}",
          "ldap_user": "${var.Workflow01_baw_os_user_ldap_user}",
          "name": "${var.Workflow01_baw_os_user_name}",
          "shell": "${var.Workflow01_baw_os_user_shell}"
          }
      },
      "install_dir": "${local.Workflow01_install_dir}",
      "ifix_names": "${join(",",var.Workflow01_ifix_names)}",
      "config": {
       "node_hostnames": "${var.Workflow01-name}.${var.Workflow01_domain}",
       "celladmin_alias_user": "${var.Workflow01_cell_admin_username}"
      }
    }
  },
  "vault_content": {
    "item": "secrets",
    "values": {
      "ibm": {
        "im_repo_password": "${var.ibm_im_repo_password}",
        "sw_repo_password": "${var.ibm_sw_repo_password}"
      },
      "workflow": {
        "config": {
          "celladmin_alias_password": "${var.Workflow01_cell_admin_userpassword}"
        }
      }
    },
    "vault": "${var.ibm_stack_id}"
  }
}
EOT
}

#########################################################
##### Resource : Workflow01_workflow_v18_config
#########################################################
#"db_alias_password": "${var.Workflow01_db2_instance_userpassword}",
resource "camc_softwaredeploy" "Workflow01_workflow_v18_config" {
  depends_on = ["camc_softwaredeploy.Workflow01_workflow_v18_applyifix"]
  name = "Workflow01_workflow_v18_config"
  camc_endpoint = "${var.ibm_pm_service}/v1/software_deployment/chef"
  access_token = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace = true
  data = <<EOT
{
  "os_admin_user": "${var.Workflow01-os_admin_user}",
  "stack_id": "${var.ibm_stack_id}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.Workflow01.clone.0.customize.0.network_interface.0.ipv4_address}",
  "node_name": "${var.Workflow01-name}",
  "runlist": "role[workflow_v18_0_201806_create_singlecluster]",
  "node_attributes": {
    "ibm_internal": {
      "roles": "[workflow_v18_0_201806_create_singlecluster]"
    },
    "ibm": {
      "sw_repo": "${var.ibm_sw_repo}/workflow"
    },
    "workflow":{
      "os_users": {
        "workflow": {
          "gid": "${var.Workflow01_baw_os_user_gid}",
          "name": "${var.Workflow01_baw_os_user_name}"
          }
      },
      "install_dir": "${local.Workflow01_install_dir}",
      "config": {
        "product_type": "${var.Workflow01_config_product_type}",
        "deployment_type": "${var.Workflow01_config_deployment_type}",
        "cluster_type": "${var.Workflow01_config_cluster_type}",
        "celladmin_alias_user": "${var.Workflow01_cell_admin_username}",
        "deadmin_alias_user": "${var.Workflow01_de_admin_username}",
        "dmgr_hostname": "${var.Workflow01-name}.${var.Workflow01_domain}",
        "node_hostname": "${var.Workflow01-name}.${var.Workflow01_domain}",
        "database_type": "${var.Database_type}",
        "db2_install": "${var.Workflow01_db2_install}",
        "db2_hostname": "${var.Workflow01_db2_hostname}",
        "db2_port": "${var.Workflow01_db2_port}",
        "db_alias_user": "${var.Workflow01_db2_instance_username_config}",
        "db2_cmndb_name": "${var.Workflow01_db2_common_database}",
        "db2_bpmdb_name": "${var.Workflow01_db2_process_database}",
        "db2_pdwdb_name": "${var.Workflow01_db2_perf_database}",
        "db2_cpedb_name": "${var.Workflow01_db2_cpe_database}",
        "cpedb": {
          "icndb": {
            "schema": "${var.Database_cpe_icndb_schema}",
            "tsicn": "${var.Database_cpe_icndb_tablespace}"
          },
          "dosdb": {
            "schema": "${var.Database_cpe_dosdb_schema}",
            "tsdosdata": "${var.Database_cpe_dosdb_tsdosdata}",
            "tsdoslob": "${var.Database_cpe_dosdb_tsdoslob}",
            "tsdosidx": "${var.Database_cpe_dosdb_tsdosidx}"
          },
          "tosdb": {
            "schema": "${var.Database_cpe_tosdb_schema}",
            "tstosdata": "${var.Database_cpe_tosdb_tstosdata}",
            "tstoslob": "${var.Database_cpe_tosdb_tstoslob}",
            "tstosidx": "${var.Database_cpe_tosdb_tstosidx}"
          }
        },
        "oracle": {
          "hostname": "${var.Database_oracle_hostname}",
          "port": "${var.Database_oracle_port}",
          "database_name": "${var.Database_oracle_database_name}",
          "jdbc_driver": "${var.Oracle_jdbc_driver}",
          "shareddb": {
            "username": "${var.Database_oracle_shareddb_username}"
          },
          "cellonlydb": {
            "username": "${var.Database_oracle_cellonlydb_username}"
          },
          "psdb": {
            "username": "${var.Database_oracle_psdb_username}"
          },
          "icndb": {
            "username": "${var.Database_oracle_icndb_username}",
            "tsicn": "${var.Database_oracle_icndb_tablespace}"
          },
          "dosdb": {
            "username": "${var.Database_oracle_dosdb_username}",
            "tsdosdata": "${var.Database_oracle_dosdb_tsdosdata}"
          },
          "tosdb": {
            "username": "${var.Database_oracle_tosdb_username}",
            "tstosdata": "${var.Database_oracle_tosdb_tstosdata}"
          },
          "pdwdb": {
            "username": "${var.Database_oracle_pdwdb_username}"
          }
        },
        "ps_environment_purpose": "${var.Workflow01_ps_environment_purpose}",
        "ps_offline": "${var.Workflow01_ps_offline}",
        "ps_pc_transport_protocol": "${var.Workflow01_ps_pc_transport_protocol}",
        "ps_pc_hostname": "${var.Workflow01_ps_pc_hostname}",
        "ps_pc_port": "${var.Workflow01_ps_pc_port}",
        "ps_pc_contextroot_prefix": "${var.Workflow01_ps_pc_contextroot_prefix}",
        "ps_pc_alias_user": "${var.Workflow01_ps_pc_alias_user}",
        "metering": {
          "identifier_name": "${var.ibm_stack_name}",
          "url": "${var.metering_url}"
        }
      }
    }
  },
  "vault_content": {
    "item": "secrets",
    "values": {
      "ibm": {
        "im_repo_password": "${var.ibm_im_repo_password}",
        "sw_repo_password": "${var.ibm_sw_repo_password}"
      },
      "workflow": {
        "config": {
          "oracle": {
            "shareddb": {
              "password": "${var.Database_oracle_shareddb_userpassword}"
            },
            "cellonlydb": {
              "password": "${var.Database_oracle_cellonlydb_userpassword}"
            },
            "psdb": {
              "password": "${var.Database_oracle_psdb_userpassword}"
            },
            "icndb": {
              "password": "${var.Database_oracle_icndb_userpassword}"
            },
            "dosdb": {
              "password": "${var.Database_oracle_dosdb_userpassword}"
            },
            "tosdb": {
              "password": "${var.Database_oracle_tosdb_userpassword}"
            },
            "pdwdb": {
              "password": "${var.Database_oracle_pdwdb_userpassword}"
            }
          },
          "celladmin_alias_password": "${var.Workflow01_cell_admin_userpassword}",
          "deadmin_alias_password": "${var.Workflow01_de_admin_userpassword}",
          "db_alias_password": "${var.Workflow01_db2_instance_userpassword_config}",
          "ps_pc_alias_password": "${var.Workflow01_ps_pc_alias_password}",
          "metering": {
            "apikey": "${var.metering_apikey}"
            }
        }
      }
    },
    "vault": "${var.ibm_stack_id}"
  }
}
EOT
}

#########################################################
##### Resource : Workflow01_workflow_post_deployment
#########################################################

resource "camc_softwaredeploy" "Workflow01_workflow_post_deployment" {
  depends_on = ["camc_softwaredeploy.Workflow01_workflow_v18_upgrade","camc_softwaredeploy.Workflow01_workflow_v18_config"]
  name = "Workflow01_workflow_post_deployment"
  camc_endpoint = "${var.ibm_pm_service}/v1/software_deployment/chef"
  access_token = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace = true
  data = <<EOT
{
  "os_admin_user": "${var.Workflow01-os_admin_user}",
  "stack_id": "${var.ibm_stack_id}",
  "environment_name": "_default",
  "host_ip": "${vsphere_virtual_machine.Workflow01.clone.0.customize.0.network_interface.0.ipv4_address}",
  "node_name": "${var.Workflow01-name}",
  "runlist": "role[workflow_post_deployment]",
  "node_attributes": {
    "ibm_internal": {
      "roles": "[workflow_post_deployment]"
    },
    "workflow":{
      "os_users": {
        "workflow": {
          "name": "${var.Workflow01_baw_os_user_name}",
          "gid": "${var.Workflow01_baw_os_user_gid}"
          }
      },
      "config": {
        "node_hostnames": "${var.Workflow01-name}.${var.Workflow01_domain}"
      },
      "install_mode": "${var.Workflow01_install_mode}",
      "install_dir": "${local.Workflow01_install_dir}"
    }
  }
}
EOT
}

output "Workflow01_ip" {
  value = "${vsphere_virtual_machine.Workflow01.clone.0.customize.0.network_interface.0.ipv4_address}"
}

output "Workflow01_name" {
  value = "${var.Workflow01-name}"
}

output "Workflow01_installpath" {
  value = "${local.Workflow01_install_dir}"
}

output "Workflow01_admin_console_dns" {
  value = "https://${var.Workflow01-name}.${var.Workflow01_domain}:9043/ibm/console"
}

output "Workflow01_admin_console_ip" {
  value = "https://${vsphere_virtual_machine.Workflow01.clone.0.customize.0.network_interface.0.ipv4_address}:9043/ibm/console"
}

output "Workflow01_pac_dns" {
  value = "https://${var.Workflow01-name}.${var.Workflow01_domain}:9443/ProcessAdmin"
}

output "Workflow01_pac_ip" {
  value = "https://${vsphere_virtual_machine.Workflow01.clone.0.customize.0.network_interface.0.ipv4_address}:9443/ProcessAdmin"
}

output "Workflow01_pc_dns" {
  value = "https://${var.Workflow01-name}.${var.Workflow01_domain}:9443/ProcessCenter"
}

output "Workflow01_pc_ip" {
  value = "https://${vsphere_virtual_machine.Workflow01.clone.0.customize.0.network_interface.0.ipv4_address}:9443/ProcessCenter"
}

output "Workflow01_bpc_dns" {
  value = "https://${var.Workflow01-name}.${var.Workflow01_domain}:9443/bpc"
}

output "Workflow01_bpc_ip" {
  value = "https://${vsphere_virtual_machine.Workflow01.clone.0.customize.0.network_interface.0.ipv4_address}:9443/bpc"
}

output "Workflow01_pp_dns" {
  value = "https://${var.Workflow01-name}.${var.Workflow01_domain}:9443/ProcessPortal"
}

output "Workflow01_pp_ip" {
  value = "https://${vsphere_virtual_machine.Workflow01.clone.0.customize.0.network_interface.0.ipv4_address}:9443/ProcessPortal"
}

output "stack_id" {
  value = "${var.ibm_stack_id}"
}
