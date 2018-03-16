#
# Cookbook:: aag_linux_resolv_conf
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

if node['platform_family'] == 'rhel'
  bash 'make_writable' do
    code <<-EOH
        chattr -i /etc/resolv.conf
      EOH
    guard_interpreter :bash
    only_if 'lsattr /etc/resolv.conf | cut -c5 | grep "i"'
  end
end

include_recipe 'resolver::default'
