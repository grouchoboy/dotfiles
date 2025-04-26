## Create database with a user

```
CREATE USER your_username WITH PASSWORD 'your_password';
CREATE DATABASE your_database_name OWNER your_username; -- Optional: makes the new user the owner
GRANT ALL PRIVILEGES ON DATABASE your_database_name TO your_username;
```

