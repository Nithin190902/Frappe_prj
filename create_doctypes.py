import os
import json

# Activate the virtual environment
activate_env = os.path.expanduser("~/frappe-bench/env/bin/activate_this.py")
with open(activate_env) as f:
    exec(f.read(), dict(__file__=activate_env))

import frappe

def create_doctype(doctype_dict):
    if not frappe.db.exists("DocType", doctype_dict['name']):
        doctype = frappe.get_doc(doctype_dict)
        doctype.insert()
        print(f"Created doctype: {doctype_dict['name']}")
    else:
        print(f"Doctype {doctype_dict['name']} already exists")

with open('single_doctype.json') as f:
    single_doctype = json.load(f)
create_doctype(single_doctype)

with open('normal_doctype.json') as f:
    normal_doctype = json.load(f)
create_doctype(normal_doctype)

with open('child_table_doctype.json') as f:
    child_table_doctype = json.load(f)
create_doctype(child_table_doctype)
