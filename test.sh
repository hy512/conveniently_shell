#!/bin/bash
source "./init.sh"

a=10;
b=20

# pkgtryinstall "failure" "openssl-devel" "libevent-devel" "libevent" "mysql-devel" "mariadb-devel"
# echo "安装失败: ${failure[*]}"
# error "安装失败: ${failure[*]}"
# unset -v pkg_try_install_*
vars=(`set -o posix ; set`);

echo ${#vars[*]};
for v in ${vars[@]}
do
    echo "$v"
done

str='a_b_c f';
char=' ';
echo `expr index "$str" "$char"`

:<<EOF
	$ sudo yum install openssl-devel
	$ sudo yum install sqlite
	$ sudo yum install sqlite-devel
	$ sudo yum install libevent
	$ sudo yum install libevent-devel
	$ sudo yum install postgresql-devel
	$ sudo yum install postgresql-server
	$ sudo yum install mysql-devel
	$ sudo yum install mysql-server
	$ sudo yum install hiredis
	$ sudo yum install hiredis-devel
EOF