# Create new user

~~~~
CALL dbms.security.createUser('username', 'de2018', true)
~~~~
note the true enforces user to reset password on first login

~~~~
CALL dbms.security.addRoleToUser('admin', 'username')
~~~~