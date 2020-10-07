#repoback.rb
#usage: sudo ruby repoback.rb
#Thiago Vinhas <thiago@vinhas.net>
#!/usr/bin/env ruby

time = Time.new

repoURL = "https://dl.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/"
version = "#{time.year}-#{time.month}-#{time.day}"
repoDirectory = "/repo/#{version}"
pulpUser = "admin"
pulpPass = "admin" # here I would definitely use Hashicorp Vault to store the password instead

system "wget -r -N -np -nH --cut-dirs=6 #{repoURL} -P #{repoDirectory}"
system "createrepo #{repoDirectory} ; pulp-admin login -u #{pulpUser} -p #{pulpPass}"
system "pulp-admin rpm repo create --repo-id=#{version} --serve-https=true --relative-url=#{version} --display-name '#{version} Repo' --feed file://#{repoDirectory}"
system "pulp-admin rpm repo sync run --repo-id=#{version} "

open('/etc/yum.repos.d/pulp.repo', 'w') { |f|
  f << "[epel]\n"
  f << "baseurl=http://internal.repo.local/repo/#{version}/\n"
  f << "enabled=1\n"
  f << "gpgcheck=0\n"
}
