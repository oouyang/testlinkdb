   # clone git@github.com:oouyang/testlinkdb.git
cd $(dirname $0)
pg_dump testlink > testlink.sql
git add testlink.sql 
git commit -m "`date`"
#   66  git config --global user.name oo
#   67  git config --global user.email oo@oo.oo
git push origin master
