from airflow import DAG
from datetime import datetime, timedelta

# Operators; we need this to operate!
from airflow.operators.bash import BashOperator

default_args = {
    'owner': 'kevin', 
    'depends_on_past': False,
    'start_date': datetime(2020, 2, 24), 
    'email': ['airflow@example.com'], 
    'email_on_failure': False, 
    'retries': 1, 
    'retry_delay': timedelta(minutes=1),
}

with DAG(
    dag_id='my_dag',
    description='my dag',
    default_args=default_args,
    schedule_interval='*/1 * * * *'
) as dag:

    t1 = BashOperator(
        task_id='print_date',
        bash_command='date',
    )

    t2 = BashOperator(
        task_id='sleep',
        depends_on_past=False,
        bash_command='sleep 5',
        retries=3,
    )
