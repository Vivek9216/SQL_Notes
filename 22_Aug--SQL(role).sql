-- role
create role if not exists 'hr_role';

-- no user in the role
select to_user as 'user', to_host as 'host'
from mysql.role_edges
where from_user = 'hr_role';

-- create user
create user aman99 identified by 'aman123';

-- assign permission to role
grant select on newdb.* to hr_role;

-- role assign to user
grant hr_role to aman99;

show grants for aman99;

set default role hr_role to aman99; -- assigning a default role to the user everytime