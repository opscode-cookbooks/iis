#
# Author:: Seth Chisamore (<schisamo@opscode.com>)
# Cookbook Name:: iis
# Attribute:: default
#
# Copyright:: Copyright (c) 2011 Opscode, Inc.
#
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
#

default['iis']['home']       = "#{ENV['WINDIR']}\\System32\\inetsrv"
default['iis']['conf_dir']   = "#{ENV['WINDIR']}\\System32\\inetsrv\\config"
default['iis']['pubroot']    = "#{ENV['SYSTEMDRIVE']}\\inetpub"
default['iis']['docroot']    = "#{ENV['SYSTEMDRIVE']}\\inetpub\\wwwroot"
default['iis']['log_dir']    = "#{ENV['SYSTEMDRIVE']}\\inetpub\\logs\\LogFiles"
default['iis']['cache_dir']  = "#{ENV['SYSTEMDRIVE']}\\inetpub\\temp"

if Opscode::IIS::Helper.older_than_windows2008r2?
  default['iis']['components'] = %w{Web-Server}
else
  default['iis']['components'] = %w{IIS-WebServerRole}
end

default['iis']['feature_dependencies'] = false
