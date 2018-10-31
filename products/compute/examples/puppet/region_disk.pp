<%# The license inside this block applies to this file
# Copyright 2018 Google Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
-%>
<% unless name == "README.md" -%>
<%= compile 'templates/license.erb' -%>

<%= lines(autogen_notice :puppet) -%>

<%= compile 'templates/puppet/examples~credential.pp.erb' -%>

gcompute_zone { 'us-central1-a':
  project    => $project, # e.g. 'my-test-project'
  credential => 'mycred',
}

<% end # name == README.md -%>
gcompute_region_disk { <%= example_resource_name('data-disk-1') -%>:
  ensure              => present,
  size_gb             => 50,
  disk_encryption_key => {
    raw_key => 'SGVsbG8gZnJvbSBHb29nbGUgQ2xvdWQgUGxhdGZvcm0=',
  },
  region              => 'us-central1',
  replica_zones       => ['us-central1-a', 'us-central1-f'],
  project             => $project, # e.g. 'my-test-project'
  credential          => 'mycred',
}