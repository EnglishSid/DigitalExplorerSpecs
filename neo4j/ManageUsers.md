# Managing users

list users
~~~~
CALL dbms.security.listUsers()
~~~~

create new user
~~~~
CALL dbms.security.createUser('name', 'password', true)
~~~~

assign roles
~~~~
CALL dbms.security.addRoleToUser('admin', 'johnsmith')
~~~~



delete users
~~~~
CALL dbms.security.deleteUser('name')
~~~~



