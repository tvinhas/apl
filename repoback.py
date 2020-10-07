import os.path

repoURL = "https://dl.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/"
repoDirectory = "/repo/epel"
rsync = ("wget -r -np -nc -nH --cut-dirs=6  %s -P %s" %(repoURL,repoDirectory))
os.system(rsync)
