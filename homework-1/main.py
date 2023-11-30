"""Скрипт для заполнения данными таблиц в БД Postgres."""
import csv

import psycopg2


conn = psycopg2.connect(host='localhost', database='north', user='postgres', password='Msssvintsova006')

try:
    with conn.cursor() as cur:
        with open('/Users/miya/PycharmProjects/postgres_homeworks/homework-1/north_data/customers_data.csv', 'r', encoding='utf-8') as file:
            csv_reader = csv.reader(file)
            headers = next(csv_reader, None)
            for row in csv_reader:
                cur.execute("INSERT INTO customers  (customer_id, company_name, contact_name) VALUES  (%s, %s, %s)", (row[0], row[1], row[2]))

        cur.execute("SELECT * FROM customers")
        rows = cur.fetchall()
        for row in rows:
            print(row)

    with conn.cursor() as cur:
        with open('/Users/miya/PycharmProjects/postgres_homeworks/homework-1/north_data/employees_data.csv', 'r', encoding='utf-8') as file:
            csv_reader = csv.reader(file)
            headers = next(csv_reader, None)
            for row in csv_reader:
                cur.execute("INSERT INTO employees (employee_id, first_name, last_name, title, birth_date, notes) VALUES  (%s, %s, %s, %s, %s, %s)", (row[0], row[1], row[2], row[3], row[4], row[5]))

        cur.execute("SELECT * FROM employees")
        rows = cur.fetchall()
        for row in rows:
            print(row)

    with conn.cursor() as cur:
        with open('/Users/miya/PycharmProjects/postgres_homeworks/homework-1/north_data/orders_data.csv', 'r', encoding='utf-8') as file:
            csv_reader = csv.reader(file)
            headers = next(csv_reader, None)
            for row in csv_reader:
                cur.execute("INSERT INTO orders (order_id, customer_id, employee_id, order_date, ship_city) VALUES  (%s, %s, %s, %s, %s)", (row[0], row[1], row[2], row[3], row[4]))

        cur.execute("SELECT * FROM orders")
        rows = cur.fetchall()
        for row in rows:
            print(row)
finally:
    conn.commit()
    conn.close()
