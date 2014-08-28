#!/bin/sh
#
# Add Solarized colors to cacti
CACTILIBPATH="/usr/share/cacti/site/lib"
echo "Saving previous DB..."
mysqldump -u root -p cacti colors > .save-origin.sql
echo "Patching DB"
mysql -u root -p cacti < cacticolors-install.sql
echo "Patching Files"
patch $CACTILIBPATH/html_form.php < phppatch.diff

exit 0
