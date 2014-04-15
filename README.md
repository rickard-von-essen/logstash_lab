# Puppet Configuration - Logstash Lab setup

This repos is used to configure setup a lab server for Logstash/Elasticsearch/Kibana

## Required Tools

* [ruby](http://www.ruby-lang.org)
* [puppet](http://docs.puppetlabs.com/guides/installation.html) - ```gem install puppet```
* [r10k](https://github.com/adrienthebo/r10k) - ```gem install r10k```
* [Virtualbox](http://www.virtualbox.org) etc...
* [Vagrant](http://www.vagrantup.com)

## Usage

Develop your module changes etc.

Run ```r10k puppetfile install``` to get all external Puppet modules.

Start it with ```vagrant up``` . Wait for the start up and check the info message where to point you browser.


