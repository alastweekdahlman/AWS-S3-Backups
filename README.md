# AWS-S3-Backups
Scripts to help your Linux-AWS instance back up to your S3 buckets, with help from some cron jobs.
I had to create a solution to help keep monthly backups of our website.  This was created to help admins in their 3-2-1 solution.
I took a lot from [this gist by oodavid](https://gist.github.com/oodavid/2206527) and his s3mysql backup solution.
<h2> Install S3cmd</h2>
For <b>Debian and Ubuntu</b> 
<p>
<a href="s3tools.org">s3tools.org </a>is a great resource for all of this, with the majority of the guide being built on alot of their info.

</p>

```
Import S3tools signing key: wget -O- -q http://s3tools.org/repo/deb-all/stable/s3tools.key | sudo apt-key add -
Add the repo to sources.list: sudo wget -O/etc/apt/sources.list.d/s3tools.list http://s3tools.org/repo/deb-all/stable/s3tools.list
Refresh package cache and install the newest s3cmd: sudo apt-get update && sudo apt-get install s3cmd
```
