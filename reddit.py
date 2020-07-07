#!/usr/bin/python

# How many followers do you have?
import urllib.request
import re

subreds = [
        'CentOS','redhat','gluster','ovirt','ceph','Fedora','openshift','ansible'
         ];
for subred in subreds:
    req = urllib.request.Request( 'https://reddit.com/r/' + subred,
        data = None,
        headers={
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.47 Safari/537.36'
        }   )
    f = urllib.request.urlopen(req)
    html = f.read().decode('utf-8')
    # print (html)

#  Looks like ...
#           <div class="_3XFx6CfPlg-4Usgxm0gK8R">13.3k</div><p class="_29_mu5qI8E1fq6Uq5koje8" id="IdCard--Subscribers--undefined--t5_2s6fk">Members</p>
# or ...
# "subscribersCount":13252,

    print ( subred + ': ' + re.search('.*?"subscribersCount":([\d]+?),', html).group(1) )

