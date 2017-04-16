# Base Machine Configuration
Automation to install software and make configuration tweaks I used to manually. This has only been tested with Ubuntu 16.04. Once all configurations and installations have been added I will work to make this more portable.

## Installed Software
* pip
* Ansible (2.2.0)
* virtualenv
* awscli
* boto
* Atom
* Java 8
* Chrome
* Git
* Maven
* Eclipse (Neon 2)
* Ruby
* R
* R-Studio
* Docker
* Docker Compose
* Zoom
* Atom package `atom-beautify`

## Configuration Changes
* Custom vim configuration
* Create SSH keys for Bitbucket and Github
  * Push Github public key to account (not permitted with new Bitbucket APIs)
  * Add Bitbucket and Github entries to SSH config file


## Example Command
Run from inside `ansible-base-machine`.
```
./configure.sh {username} {password-file}
```

|Parameter Name|Required|Description|
|:------------|:-------|:----------|
|username|Yes|Name of the user that is running the command.|
|password-file|Yes|Path to the file containing the ansible vault password used to encrypt sensitive information, e.g. Github user information|
