# apl task

**Using Pulp as repository management**

I haven't used Artifactory before and I didn't want to spend a lot of time learning it now to do the assignment as it wouldn't show any coding abilities. 
The `repoback.rb` script will download all the packages from the repo in the URL specified in the `repoURL` variable to a local directory, then it will:
* Create a local yum repo
* Use `Pulp` to create a repository in the Pulp Server feeding it from the local repo created on the earlier step
* Sync the local repo with the newly created repo
* Replace the yum repo file with the new `baseurl` that points to the date the script runs _(yyyy-mm-dd format)_

_Information regarding Pulp and its installation can be found [here](https://docs.pulpproject.org/pulpcore/installation/index.html)_

**repoback.py**

Still uses `wget` to fetch the files, but using the `--no-clobber` that skips existing files.

**Note** I have 2 blog posts from the time when I worked at [Chef Software](https://www.chef.io) that has details on repository administration and some monitoring:
[Creating a local Chef repository with Pulp](https://blog.chef.io/creating-a-local-chef-repository-with-pulp/)
[Self-monitoring Chef using Sensu](https://blog.chef.io/self-monitoring-chef-using-sensu/)

I also have a [blog](https://www.vinhas.net) that's severely outdated but has a post about Cassandra Cluster on AWS.
My [GitHub](https://github.com/tvinhas) has several small personal projects that I worked on. One project in particular can show some of my shell coding skills. It's called [AdSkip](https://github.com/tvinhas/adskip), a small script I wrote to strip commercials from TV shows that I recorded.
