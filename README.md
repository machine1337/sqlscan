# sqlscan
    A small and an efficent tool to detect sql injection vulnerabilities in a websites. Its a pretty simple tool just add urls and payloads file to the script 
    and it will scan for sql injection from your desire payloads.
    
![sql](https://user-images.githubusercontent.com/82051128/121683035-4424b300-cad6-11eb-83ca-754944fbbff0.png)
![sql2](https://user-images.githubusercontent.com/82051128/121683527-f3618a00-cad6-11eb-929f-15631702a40d.png)

# Pro Tip:
     echo "target.com" | waybackurls | gf sqli | tee sqls.txt
     Now pass sqls.txt to my tool.
# Pre-requisite:
    1. only curl is required.
    2. Your SQL Injection Payloads List.
    
# Installation:
    1. git clone https://github.com/machine1337/sqlscan
    2. cd sqlscan && chmod +x scan.sh
    
# Usage:
    1. ./scan.sh
   
# Note:
    Q: What should my urls.txt file looks like?
    A: http://testphp.vulnweb.com/artists.php?artist=2
    or
    A: http://testphp.vulnweb.com without / at the end
    
# Credit:
    If u like my tool kindly give us a star and follow. Thanks!

# Video:
   https://www.youtube.com/watch?v=rv4N3xCTwqo&t=55s
    
# Author:
    [Facebook] (https://facebook.com/unknownclay)
    [Twitter]  (https://twitter.com/whoami4041)
 
