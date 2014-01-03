## opsource-gem

Inspired and based on https://github.com/juozasg/opsource-gem but with different semantics and further additions for a fuller API wrpper.

Designed for easy extensibility. See `lib/opsource/api` folder for examples.



### Install

either install as a gem via Bundler

__or__

clone into your project, install gems from `opsource.gemspec` and do:

```
$: << 'opsource/lib'
require 'opsource.rb'
```

### Usage

```
api_base      = "https://cloudapi.nttamerica.com/oec/0.9"
dev_org_id    = 'my-super-secret-org-numbersandletters'
dev_user      = 'me'
dev_password  = 'very secret'

c = OpsourceClient::Client.new(api_base, dev_org_id, dev_user, dev_password)

server = c.server.list(name: 'myfavoritevm')
pp c.server.show_with_disks(server.network_id, server.id)
```

### Add your own API calls

See `api/directory.rb`, `api/image.rb`, `api/network.rb` and `api/server.rb` for supported methods.
See `doc` folder for adding you own. `api/core.rb` is the plumbing.


### TODO

Write some tests. Make pull requests.
