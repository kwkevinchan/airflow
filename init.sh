#! /bin/bash

mkdir -p /opt/airflow/logs /opt/airflow/dags /opt/airflow/plugins
chown -R "50000:0" /opt/airflow/{airflow,logs,dags,plugins}

airflow db init

#! /bin/python
from cryptography.fernet import Fernet
fernet_key= Fernet.generate_key()
print(fernet_key.decode()) # your fernet_key, keep it in secured place!

#! /bin/bash
airflow users create \
    --username "${_AIRFLOW_WWW_USER_USERNAME="admin"}" \
    --firstname "${_AIRFLOW_WWW_USER_FIRSTNAME="Airflow"}" \
    --lastname "${_AIRFLOW_WWW_USER_LASTNME="Admin"}" \
    --email "${_AIRFLOW_WWW_USER_EMAIL="airflowadmin@example.com"}" \
    --role "${_AIRFLOW_WWW_USER_ROLE="Admin"}" \
    --password "${_AIRFLOW_WWW_USER_PASSWORD}" || true

# airflow users create \
#     --username kevin \
#     --firstname kevin \
#     --lastname chan \
#     --email kevin.chan@kuobrothers.com \
#     --role Admin \
#     --password admin || true
