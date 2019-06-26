# Template - IBM Business Automation Workflow Enterprise V19.0 on a single virtual machine
Template Version - 1.0

## Description

This template deploys a Single Cluster instance of IBM Business Automation Workflow Enterprise V19.0 on a single virtual machine.<br>

## Features

### Clouds

 VMware<br>
<br>
### Operating Systems Supported

Ubuntu 16.04 LTS<br>
Ubuntu 18.04 LTS<br>
<br>
### CAM Supported

3.1 and later<br>
<br>
### Topology

One virtual machine:<br>
  IBM Business Automation Workflow Enterprise V19.0 - Single Cluster<br>
<br>
### Software Deployed

IBM WebSphere Application Server Network Deployment V8.5.5<br>
IBM Business Automation Workflow Enterprise V19.0<br>
IBM DB2 Enterprise Server Edition V11<br>
<br>
### Default Virtual Machine Settings

 vCPU 4, Memory (GB) 16, Disk (GB) 100<br>
<br>
### Usage and Special Notes

1. Follow Cloud Automation Manager guidance to create a template - https://www.ibm.com/support/knowledgecenter/en/SS2L37/cam_creating_template.html<br>
2. You are responsible for obtaining appropriate software licenses and downloads prior to template deployment.<br>
3. Detailed system requirements for IBM Business Automation Workflow Enterprise V19.0 - https://www.ibm.com/software/reports/compatibility/clarity/index.html<br>
4. IBM Knowledge Center for IBM Business Automation Workflow Enterprise V19.0 - https://www.ibm.com/support/knowledgecenter/en/SS8JB4/com.ibm.wbpm.workflow.main.doc/kc-homepage-workflow.html<br>
5. IBM Support Portal - https://www.ibm.com/support/home/<br>
6. The size of the root partition ("/") defined in the VMware template for IBM Business Automation Workflow Enterprise must be larger than 60GB.
7. For database, you can choose to install and config a local Db2 for IBM Business Automation Workflow at one virtual machine, otherwise you must prepare a Db2 or Oracle database before you install IBM Business Automation Workflow. Follow the instructions in creating Db2 databases (https://www.ibm.com/support/knowledgecenter/SS8JB4_18.0.0/com.ibm.wbpm.imuc.doc/topics/db_create_nd_win_db2_man.html#db_create_nd_databases_before) or Oracle databases (https://www.ibm.com/support/knowledgecenter/SS8JB4_18.0.0/com.ibm.wbpm.imuc.doc/topics/bpmcfg_db_run_win_orcl_man.html) before creating profiles or the deployment environment. The database names should be the same as input in the template. The default database names are:
### DB2 database
<table>
  <tr>
    <th>Database</th>
    <th>Database name</th>
  </tr>
  <tr>
    <td>Common database</td>
    <td>CMNDB</td>
  </tr>
  <tr>
    <td>Process database</td>
    <td>BPMDB</td>
  </tr>
  <tr>
    <td>Performance Data Warehouse database</td>
    <td>PDWDB</td>
  </tr>
  <tr>
    <td>Content database</td>
    <td>CPEDB</td>
  </tr>
</table>

<table>
  <tr>
    <th>Schema/Table space</th>
    <th>Schema/Table space name</th>
  </tr>
  <tr>
    <td>The schema for IBM Content Navigator (ICN)</td>
    <td>ICNSA</td>
  </tr>
  <tr>
    <td>The table space for IBM Content Navigator (ICN)</td>
    <td>WFICNTS</td>
  </tr>
  <tr>
    <td>The schema for the design object store (DOS)</td>
    <td>DOSSA</td>
  </tr>
  <tr>
    <td>The data table space for the design object store (DOS)</td>
    <td>DOSSA_DATA_TS</td>
  </tr>
  <tr>
    <td>The large object table space for the design object store (DOS)</td>
    <td>DOSSA_LOB_TS</td>
  </tr>
  <tr>
    <td>The index table space for the design object store (DOS)</td>
    <td>DOSSA_IDX_TS</td>
  </tr>
  <tr>
    <td>The schema for the target object store (TOS)</td>
    <td>TOSSA</td>
  </tr>
  <tr>
    <td>The data table space for the target object store (TOS)</td>
    <td>TOSSA_DATA_TS</td>
  </tr>
  <tr>
    <td>The large object table space for the target object store (TOS)</td>
    <td>TOSSA_LOB_TS</td>
  </tr>
  <tr>
    <td>The index table space for the target object store (TOS)</td>
    <td>TOSSA_IDX_TS</td>
  </tr>
</table>

### Oracle database
<table>
  <tr>
    <th>Database</th>
    <th>Schema/Database users</th>
  </tr>
  <tr>
    <td>Shared database</td>
    <td>cmnuser</td>
  </tr>
  <tr>
    <td>Cell database</td>
    <td>celluser</td>
  </tr>
  <tr>
    <td>Process Server database</td>
    <td>psuser</td>
  </tr>
  <tr>
    <td>Performance Data Warehouse database</td>
    <td>pdwuser</td>
  </tr>
  <tr>
    <td>IBM Content Navigator database</td>
    <td>icnuser</td>
  </tr>
  <tr>
    <td>Design Object Store database</td>
    <td>dosuser</td>
  </tr>
  <tr>
    <td>Target Object Stare database</td>
    <td>tosuser</td>
  </tr>
</table>

<table>
  <tr>
    <th>Table space</th>
    <th>Table space name</th>
  </tr>
  <tr>
    <td>The table space for IBM Content Navigator (ICN)</td>
    <td>WFICNTS</td>
  </tr>
  <tr>
    <td>The data table space for the design object store (DOS)</td>
    <td>DOSSA_DATA_TS</td>
  </tr>
  <tr>
    <td>The data table space for the target object store (TOS)</td>
    <td>TOSSA_DATA_TS</td>
  </tr>
</table>
8. To install fix packs, choose one of the following methods:<br>

<table>
  <tr>
    <th align="left">Attention</th>
  </tr>
  <tr>
    <td>Before you install the fix packs, follow the on-premise instructions to back up your existing environment(databases and profiles). </td>
  </tr>
</table>

  - Install the product with the fix packs.
    1. Enter the full name of the fix pack packages in the fix pack packages field, and fill out the other fields as appropriate.<br>
    2. Deploy the template to create a new instance.<br>
  - Install only the fix packs.
    1. Open a deployed instance and click "Modify" at the top left of the window, next to "Overview".<br>
    2. Click "Next", enter the full name of the fix pack installation packages in the fix pack packages field under the "IBM Business Automation Workflow Installation" label.<br>
    3. Click "Plan Changes", then "Apply Changes".<br>
    4. Carefully read the warning message.<br>
    5. If you are sure that you want to proceed with the installation, type "apply" in the "Confirm Changes" box, and then click the "Apply" button.<br>
9. To install interim fixes, choose one of the following methods:<br>
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

Copyright IBM Corp. 2018, 2019 

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

<br>

- IBM WebSphere Application Server 8.5.5.14
- IBM Business Automation Workflow Enterprise 18.0.0.2
- IBM DB2 Enterprise Server Edition 11.1

<br>

- IBM WebSphere Application Server 8.5.5.15
- IBM Business Automation Workflow Enterprise 19.0.0.1
- IBM DB2 Enterprise Server Edition 11.1

<br>

- IBM WebSphere Application Server 8.5.5.15
- IBM Business Automation Workflow Enterprise 19.0.0.2
- IBM DB2 Enterprise Server Edition 11.1

*Note: The version numbers above represent base versions only. Explicit fix packs may be added later.*

### Platforms Supported

The following operating system is supported for the software that is defined in this template.

- Ubuntu 16.x
- Ubuntu 18.x

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
    <td>Install IBM Business Automation Workflow Enterprise V19.0 with WebSphere Application Server and DB2</code></td>
  </tr>
    <tr>
    <td>IBM Business Automation Workflow Node01</code></td>
    <td>workflow_upgrade</code></td>
    <td>Install fix packs</code></td>
  </tr>
    <tr>
    <td>IBM Business Automation Workflow Node01</code></td>
    <td>workflow_applyifix</code></td>
    <td>Install interim fixes</code></td>
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
    <td><br>8.5.5</br><br>19.0</br><br>11</br></td>
    <td>X86_64</td>
    <td>/opt/ibm/docker/software-repo/var/swRepo/private/workflow</td>
    <td><br>BAW_18_0_0_1_Linux_x86_1_of_3.tar.gz</br><br>BAW_18_0_0_1_Linux_x86_2_of_3.tar.gz</br><br>BAW_18_0_0_1_Linux_x86_3_of_3.tar.gz</br></td>
  </tr>
  <tr>
    <td>Fix packs</td>
    <td> </td>
    <td>X86_64</td>
    <td>/opt/ibm/docker/software-repo/var/swRepo/private/workflow/fixpacks</td>
    <td><br>The full names of Workflow, and/or WAS fix pack installation packages</br>
         <br><b>Attention:</b></br>
         <br>All parts of the same product(Workflow or WAS) fix pack must be separated by semi-colon(;) and put into only one input box; Different product fix pack must be put in different input box.</br>
         <br>For example:</br>
          <br>Workflow 19002 fix pack package has only one part, it must be put in one input box, the format:</br>
          <br>workflow.19002.delta.repository.zip </br>
          <br>WAS 85515 fix pack package has three parts, all these three parts must be put in one input box, the format:</br> 
          <br>8.5.5-WS-WAS-FP015-part1.zip; 8.5.5-WS-WAS-FP015-part2.zip; 8.5.5-WS-WAS-FP015-part3.zip</br>
    </td>
  </tr>
    <tr>
    <td>Interim fixes</td>
    <td> </td>
    <td>X86_64</td>
    <td>/opt/ibm/docker/software-repo/var/swRepo/private/workflow/ifixes</td>
    <td><br>The full names of interim fix installation packages</br>
        <br> - e.g 8.6.10018002-WS-BPMPCPD-TFPDXXXXX.zip</br>
    </td>
  </tr>
</table>

### Configuration
<table>
  <tr>
    <th>Product</th>
    <th>Repository Root</th>
    <th>File</th>
  </tr>
  <tr>
   <td><br>Database Drivers</br></td>
    <td>/opt/ibm/docker/software-repo/var/swRepo/private/workflow/drivers</td>
    <td><br>The files of JDBC Drivers for connecting databases</br> <br>For example, the oracle jdbc driver: </br> ojdbc7.jar</td>
  </tr>
  <tr>
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

