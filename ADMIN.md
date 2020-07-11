### Change password

ALTER USER 'root'@'localhost' IDENTIFIED BY 'password'

### Login

```sql
sudo mysql -u root -p
```

### Checking if service running

```sql
mysqladmin -u root -p status
SHOW GLOBAL VARIABLES LIKE 'PORT'; -- 3306
```

### Fixing errors

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Hungab453';
flush privileges;
