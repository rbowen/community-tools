#!/usr/bin/python

# How many followers do you have?
import urllib2
import re

feeds = ['redhatopen',
        'gluster',
        'ovirt',
        'rdocommunity',
        'ceph',
        'projectatomic',
        'fedora',
        'manageiq',
        'centos',
        'centosevents',
        'openshift'];
for feed in feeds:
    response = urllib2.urlopen('https://twitter.com/' + feed)
    html = response.read()
    print feed + ': ' + re.search('.*?([\d,]+ Followers).*', html).group(1)

