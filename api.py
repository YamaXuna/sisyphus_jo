from fastapi import FastAPI
import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="",
  password="",
  database="bddjo"
)

app = FastAPI()


@app.get("/athlete")
async def root():
    mycursor = mydb.cursor()

    sql = "SELECT at_nom, at_prenom, at_naiss, pay_nom, at_image FROM athlete join pays using(pay_id)"

    mycursor.execute(sql)

    myresult = mycursor.fetchall()

    dic = []

    for res in myresult:
        print(res)
        a = {"nom":res[0], "prenom":res[1], "naiss":res[2], "pays":res[3], "img":res[4]}
        dic.append(a)
    
    return dic


@app.get("/pays")
async def paysDoss():
    mycursor = mydb.cursor()

    sql = "SELECT * FROM pays"

    mycursor.execute(sql)

    myresult = mycursor.fetchall()

    dic = []

    for res in myresult:
        a = {"nom":res[1]}
        dic.append(a)
    
    return dic

@app.get("/edition")
async def paysDoss():
    mycursor = mydb.cursor()

    sql = "SELECT * FROM edition"

    mycursor.execute(sql)

    myresult = mycursor.fetchall()

    dic = []

    for res in myresult:
        a = {"annee":res[2],"nom":res[3]}
        dic.append(a)
    
    return dic

@app.get("/sport")
async def paysDoss():
    mycursor = mydb.cursor()

    sql = "SELECT * FROM sport"

    mycursor.execute(sql)

    myresult = mycursor.fetchall()

    dic = []

    for res in myresult:
        a = {"nom":res[1]}
        dic.append(a)
    
    return dic

@app.get("/epreuve")
async def paysDoss():
    mycursor = mydb.cursor()

    sql = "SELECT * FROM epreuve"

    mycursor.execute(sql)

    myresult = mycursor.fetchall()

    dic = []

    for res in myresult:
        a = {"nom":res[2],"categorie":res[3]}
        dic.append(a)
    
    return dic

@app.get("/participer")
async def paysDoss():
    mycursor = mydb.cursor()

    sql = "SELECT * FROM participer"

    mycursor.execute(sql)

    myresult = mycursor.fetchall()

    dic = []

    for res in myresult:
        a = {"AT_ID":res[0],"EP_ID":res[1],"ED_ID":res[2],"resultat":res[3]}
        dic.append(a)
    
    return dic


