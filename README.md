[![Travis](https://img.shields.io/travis/nexcess/puppet-sim.svg)](https://travis-ci.org/nexcess/puppet-sim)

Usage
---
```
# in hiera.yaml
sim::config:
  EVLIMIT:
    value: 25
  DISK_WARN:
    value: 85
  SERV_FTP:
    value: false

# in your manifest.pp
class {'::sim':}
```

License
---
Copyright 2016 [Nexcess](https://www.nexcess.net/)

```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
