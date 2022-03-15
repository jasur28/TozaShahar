from app import app
from flaskext.mysql import MySQL

mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = 'jasur'
app.config['MYSQL_DATABASE_PASSWORD'] = 'Jasur@295'
app.config['MYSQL_DATABASE_DB'] = 'general_data'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)
