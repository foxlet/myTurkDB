read -p "Enter the mySQL root password:" password

cat setup.sql | mysql -u root -p"$password"

cat tables.sql |  mysql -u mturk -p'mturk' mturk
