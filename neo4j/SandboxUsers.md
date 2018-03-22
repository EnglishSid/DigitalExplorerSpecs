# Create new user

~~~~
CALL dbms.security.createUser('username', 'de2018', true)
~~~~
if will return (no changes, no records), but the account has been created
note the true enforces user to reset password on first login

~~~~
CALL dbms.security.addRoleToUser('admin', 'username')
~~~~


## List current accounts

~~~~
CALL dbms.security.listUsers()
~~~~