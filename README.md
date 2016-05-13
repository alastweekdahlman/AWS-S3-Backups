# AWS-S3-Backups
Scripts to help your Linux-AWS instance back up to your S3 buckets, with help from some cron jobs.
I had to create a solution to help keep monthly backups of our website and help create a new 3-2-1 backup practice.  Hopefully this comes in handy to everyone!
I took a lot from [this gist by oodavid](https://gist.github.com/oodavid/2206527) and his s3mysql backup solution.
<h2> Install S3cmd</h2>
For <b>Debian and Ubuntu</b> 
<p>
<a href="s3tools.org">s3tools.org </a>is a great resource for all of this, with the majority of the guide being built on alot of their info.
</p>

```
#Import S3tools signing key:
wget -O- -q http://s3tools.org/repo/deb-all/stable/s3tools.key | sudo apt-key add -

#Add repo to sources.list: 
sudo wget -O/etc/apt/sources.list.d/s3tools.list http://s3tools.org/repo/deb-all/stable/s3tools.list

#Refresh package cache and install the newest s3cmd:
sudo apt-get update && sudo apt-get install s3cmd

# Setup s3cmd
s3cmd --configure
    # You’ll need to enter your AWS access key and secret key here, everything is optional and can be ignored :-)
 ```

For <b>CentOS</b>
```
# Install s3cmd
cd /etc/yum.repos.d/
wget http://s3tools.org/repo/CentOS_5/s3tools.repo
yum install s3cmd
# Setup s3cmd
s3cmd --configure
# You’ll need to enter your AWS access key and secret key here, everything is optional and can be ignored :-)
 ```  
    
<h2> Scripts </h2>
<p>These two scripts do all the work for a monthly mysql and full htdocs backup. This works great if you have a wordpress site or small site that doesn't hold volitile information and doesn't require a constant backup.</p>
Don't forget the permissions to these to run.

[s3backup.sh](https://github.com/alastweekdahlman/AWS-S3-Backups/blob/master/s3backup.sh)

[s3mysqlbackup.sh](https://github.com/alastweekdahlman/AWS-S3-Backups/blob/master/s3mysqlbackup.sh)

```
chmod +x s3mysqlbackup.sh
chmod +x s3backups.sh
# Run the scripts
./s3mysqlbackup.sh
./s3backups.sh
```



<h2>Cron</h2>
<p> Runs at midnight first of the month.</p>
```crontab
0 0 1 * * bash /location/s3mysqlbackup.sh >/dev/null 2>&1
0 0 1 * * bash /location/s3backup.sh >/dev/null 2>&1
```
<h2>Safety</h2>
```### Deny public access to shell files
<Files *.sh>
    Order allow,deny
    Deny from all
</Files>```

If this needs anymore clarification please let me know!
