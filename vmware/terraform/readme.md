# Template - IBM Business Automation Workflow Enterprise V18.0 on a single virtual machine
Template Version - 1.0

## Description

This template deploys a Single Cluster instance of IBM Business Automation Workflow Enterprise V18.0 on a single virtual machine.<br>

## Features

### Clouds

 VMware<br>
<br>
### Operating Systems Supported

Ubuntu 16.04 LTS<br>
<br>
### CAM Supported

2.1.0.2 and later<br>
<br>
### Topology

One virtual machine:<br>
  IBM Business Automation Workflow Enterprise V18.0 - Single Cluster<br>
<br>
### Software Deployed

IBM WebSphere Application Server Network Deployment V8.5.5<br>
IBM Business Automation Workflow Enterprise V18.0<br>
IBM DB2 Enterprise Server Edition V11<br>
<br>
### Default Virtual Machine Settings

 vCPU 4, Memory (GB) 16, Disk (GB) 100<br>
<br>
### Usage and Special Notes

1. Follow Cloud Automation Manager guidance to create a template - https://www.ibm.com/support/knowledgecenter/en/SS2L37/cam_creating_template.html<br>
2. You are responsible for obtaining appropriate software licenses and downloads prior to template deployment.<br>
3. Detailed system requirements for IBM Business Automation Workflow Enterprise V18.0 - https://www.ibm.com/software/reports/compatibility/clarity/index.html<br>
4. IBM Knowledge Center for IBM Business Automation Workflow Enterprise V18.0 - https://www.ibm.com/support/knowledgecenter/en/SS8JB4_18.0.0/com.ibm.wbpm.workflow.main.doc/kc-homepage-workflow.html<br>
5. IBM Support Portal - https://www.ibm.com/support/home/<br>
6. The size of the root partition ("/") defined in the VMware template for IBM Business Automation Workflow Enterprise must be larger than 60GB.
7. To install interim fixes, choose one of the following methods:<br>
  - Install the product with the interim fixes.
    1. Enter the full name of the interim fix installation package in the Interim fix packages field, and fill out the other fields as appropriate.<br>
    2. Deploy the template to create a new instance.<br>
  - Install only the interim fixes.
    1. Open a deployed instance and click "Modify" at the top left of the window, next to "Overview".<br>
    2. Click "Next", enter the full name of the interim fix installation package in the Interim fix packages field under the "IBM Business Automation Workflow Installation" label.<br>
    3. Click "Plan Changes", then "Apply Changes".<br>
    4. Carefully read the warning message.<br>
    5. If you are sure that you want to proceed with the installation, type "apply" in the "Confirm Changes" box, and then click the "Apply" button.<br>
<br>


## Overview

### License and Maintainer

Copyright IBM Corp. 2018 

### Target Cloud Type

VMware vSphere

### Software Deployed

- IBM WebSphere Application Server
- IBM Business Automation Workflow Enterprise
- IBM DB2 Enterprise Server
### Major Versions

- IBM WebSphere Application Server 8.5.5
- IBM Business Automation Workflow Enterprise 18.0
- IBM DB2 Enterprise Server Edition 11

### Minor Versions

- IBM WebSphere Application Server 8.5.5.13
- IBM Business Automation Workflow Enterprise 18.0.0.1
- IBM DB2 Enterprise Server Edition 11.1


*Note: The version numbers above represent base versions only. Explicit fix packs may be added later.*

### Platforms Supported

The following operating system is supported for the software that is defined in this template.

- Ubuntu 16.x


### Nodes and Software Components

The following table describes the nodes and relevant software components that are deployed on each node.

<table>
  <tr>
    <th>Node Name</th>
    <th>Component</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>IBM Business Automation Workflow Node01</code></td>
    <td>workflow_create_SingleCluster_server</code></td>
    <td>Create the SingleCluster profile and start the server</code></td>
  </tr>
  <tr>
    <td>IBM Business Automation Workflow Node01</code></td>
    <td>workflow_install</code></td>
    <td>Install IBM Business Automation Workflow Enterprise V18.0 with WebSphere Application Server and DB2</code></td>
  </tr>
</table>


### Autoscaling Support

Nil

## Minimal Requirements

The following table summarizes the minimal requirements for the operating system to support a successful deployment.

### IBM WebSphere 
<table>
  <tr>
    <td>Internal Firewall</td>
    <td>Off</td>
  </tr>
  <tr>
    <td>Minimum Disk Size</td>
    <td>60GB</td>
  </tr>
  <tr>
    <td>Minimum CPU</td>
    <td>1</td>
  </tr>
  <tr>
    <td>Remote Root Access</td>
    <td>Yes</td>
  </tr>
  <tr>
    <td>Minimum Memory</td>
    <td>6144</td>
  </tr>
</table>



## Disk Requirements

The following table lists the minimal disk requirements for each product installed.

### IBM Business Automation Workflow Enterprise
<table>
  <tr>
    <td>/opt/IBM</td>
    <td>6144</td>
  </tr>
  <tr>
    <td>/home/DB2USER</td>
    <td>10240</td>
  </tr>
  <tr>
    <td>/home/USER/IBM/InstallationManager</td>
    <td>512</td>
  </tr>
  <tr>
    <td>/home/USER/IBM/IMShared</td>
    <td>5120</td>
  </tr>
  <tr>
    <td>/home/USER/IBM/Workflow</td>
    <td>10240</td>
  </tr>
  <tr>
    <td>/tmp/ibm_cloud</td>
    <td>10240</td>
  </tr>
  <tr>
    <td>/var</td>
    <td>3072</td>
  </tr>
</table>



## Software Repository Libraries

The following standard operating system libraries are required in the relevant library for each operating system.

### IBM WebSphere Application Server
<table>
  <tr>
    <td>debian</td>
    <td>x86_64</td>
    <td>libxtst6, libgtk2.0-bin, libxft2</td>
  </tr>
</table>

## Network Connectivity and Security Groups

Network connectivity is required from the deployed nodes to standard infrastructure. The following table describes the network ports that are required on each node, based on the software deployed on that node.

### IBM WebSphere Application Server
<table>
  <tr>
    <td>Process Portal Port</td>
    <td>9443</td>
  </tr>
  <tr>
    <td>Process Admin Console Secure Port</td>
    <td>9043</td>
  </tr>
  <tr>
    <td>Process Admin Console Port</td>
    <td>9060</td>
  </tr>
  <tr>
    <td>Workflow Center Port</td>
    <td>9080</td>
  </tr>
  <tr>
    <td>Minimum CPU</td>
    <td>1</td>
  </tr>
</table>



# Software Repository Requirements

For a successful installation of the product, the following files are necessary in the software repository. For the correct method to load and manage files in the software repository, refer to the document on managing software repositories.


## IBM Business Automation Workflow Enterprise 

### Installation
<table>
  <tr>
    <th>Product</th>
    <th>Version</th>
    <th>Arch</th>
    <th>Repository Root</th>
    <th>File</th>
  </tr>
  <tr>
   <td><br>Websphere Application Server</br><br>IBM Business Automation Workflow</br><br>DB2</br>
    <td><br>8.5.5</br><br>18.0</br><br>11</br></td>
    <td>X86_64</td>
    <td>/opt/ibm/docker/software-repo/var/swRepo/private/workflow</td>
    <td><br>workflowAll.dvd.18001.linux.x86.disk1.tar.gz</br><br>workflowEnterprise.dvd.18001.linux.x86.disk2.tar.gz</br><br>workflowAll.dvd.18001.linux.x86.disk3.tar.gz</br></td>
  </tr>
    <tr>
    <td>Interim fixes</td>
    <td> </td>
    <td>X86_64</td>
    <td>/opt/ibm/docker/software-repo/var/swRepo/private/workflow/ifixes</td>
    <td><br>The full names of interim fix installation packages</br>
        <br> - e.g 8.6.10018001-WS-BPMPCPD-TFPD12345.zip</br>
        <br>Required interim fixes:</br>
        <br>8.6.10018001-WS-BPM-IFJR59735.zip</br>
        <br>8.6.10018001-WS-BPM-IFJR59750.zip</br>
        <br>8.6.10018001-WS-BPM-IFJR59780.zip</br>
        <br>8.6.10018001-WS-BPM-IFJR59785.zip</br>
        <br>8.6.10018001-WS-BPM-IFJR59799.zip</br>
        <br>8.6.10018001-WS-BPM-IFJR59800.zip</br>
        <br>8.6.10018001-WS-BPM-IFJR59883.zip</br>
        <br>8.6.10018001-WS-BPM-IFJR59915.zip</br>
        <br>8.6.10018001-WS-BPM-IFPJ45389.zip</br>
    </td>
  </tr>
</table>


# Cloud Specific Requirements

The following table lists the Cloud requirements for deploying templates on the target cloud. These details are either required by the deployer or injected by the platform at run time.

<table>
  <tr>
    <th>Terraform Provider Variable</th>
    <th>The description of the Terraform provider variable</th>
  </tr>
  <tr>
    <td>user</th>
    <td>The user name for vSphere API operations</th>
  </tr>
  <tr>
    <td>password</code></td>
    <td>The user password for vSphere API operations</td>
  </tr>
  <tr>
    <td>vsphere_server</code></td>
    <td>The vSphere server name for vSphere API operations</td>
  </tr>
  <tr>
    <td>allow_unverified_ssl</code></td>
    <td>If this variable is set to <code>true</code>, the VMware vSphere client allow unverifiable SSL certificates.</td>
  </tr>
</table>

Typically, these variables are defined when a connection to the Cloud is created.

