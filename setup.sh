#!/bin/bash

sudo service mysql start
sudo service redis-server start

git clone https://github.com/frappe/frappe-bench
cd frappe-bench
pip3 install -e ./bench
bench init frappe-bench --frappe-branch version-13
cd frappe-bench
bench new-site site1.local
bench get-app erpnext --branch version-13
bench --site site1.local install-app erpnext
