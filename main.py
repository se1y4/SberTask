import mysql.connector
import matplotlib.pyplot as plt

db_config = {
    'user': 'seiya',
    'password': 'seiya',
    'host': 'localhost',
    'database': 'mydatabase'
}

conn = mysql.connector.connect(**db_config)
cursor = conn.cursor()

query = """
SELECT c.company_name, y.month_num, y.credit_limit, y.actual_credit
FROM year_data y
JOIN company c ON y.company_id = c.id
ORDER BY c.company_name, y.month_num;
"""

cursor.execute(query)
data = cursor.fetchall()

cursor.close()
conn.close()

companies = {}
for company_name, month_num, credit_limit, actual_credit in data:
    if company_name not in companies:
        companies[company_name] = {'months': [], 'credit_limit': [], 'actual_credit': []}
    companies[company_name]['months'].append(month_num)
    companies[company_name]['credit_limit'].append(credit_limit)
    companies[company_name]['actual_credit'].append(actual_credit)

for company_name, metrics in companies.items():
    plt.figure(figsize=(10, 6))
    plt.plot(metrics['months'], metrics['credit_limit'], label='Кредитный лимит', marker='o')
    plt.plot(metrics['months'], metrics['actual_credit'], label='Фактический кредит', marker='o')
    plt.title(f'Кредитные данные для {company_name}')
    plt.xlabel('Месяц')
    plt.ylabel('Сумма')
    plt.legend()
    plt.grid(True)
    plt.xticks(range(1, 13))
    plt.show()