#!/bin/bash

sudo service mysql start
sudo service redis-server start

# Navigate to the frappe-bench directory
cd frappe-bench

# Create a virtual environment
python3 -m venv env
source env/bin/activate

# Install Frappe Bench and its dependencies
pip install -e ./bench

# Initialize the Frappe Bench
bench init frappe-bench --frappe-branch version-13

# Navigate to the new frappe-bench directory
cd frappe-bench

# Create a new Frappe site
bench new-site site1.local --admin-password admin --mariadb-root-password root

# Get the ERPNext app
bench get-app erpnext --branch version-13

# Install the ERPNext app on the new site
bench --site site1.local install-app erpnext

# Activate the virtual environment for future use
echo "source $(pwd)/env/bin/activate" >> ~/.bashrc
source ~/.bashrc


