import pprint # data pretty printer
from flask import Flask, redirect, url_for, request, render_template, session # Flask web framework
import mysql.connector
from pymongo import MongoClient # Python-MongoDB packages

app = Flask(__name__)

'''
Connect to MySQL Database
'''
config = {
  'user': 'root',
  'password': 'mysqlpass',
  'host': '127.0.0.1',
  'database': 'uiuc_scholars'
}
connection = mysql.connector.connect(**config)
print("Connected to MySQL successfully!")


'''
Home Page of Google Scholar Visulization
'''
@app.route("/")
@app.route("/home", methods = ["GET", "POST"])
def home():
  if request.method == "POST":
    if request.form['btn'] == 'search_from_home':
      sname = request.form['sname']
      print("from inside home function: ", g.user)
      return redirect(url_for("scholar", scholar_name=sname, user=g.user))
    elif request.form['btn'] == 'sign_up':
      usrname = request.form['usrname']
      psw = request.form['psw']
      cursor = connection.cursor()
      cursor.callproc('createUser', [usrname, psw])
      for response in cursor.stored_results():
        response = response.fetchall()[0][0]
      if response == 0:
        print("Signup failed.")
        return render_template("home.html", login_status="not yet", signup_status="failed")
      elif response == 1:
        print("Signup successful: ", usrname)
        connection.commit()
        return render_template("home.html", login_status="not yet", signup_status="successful")
    elif request.form['btn'] == 'sign_in':
      usrname = request.form['usrname']
      psw = request.form['psw']
      cursor = connection.cursor()
      cursor.callproc('checkinUser', [usrname, psw])
      for response in cursor.stored_results():
        response = response.fetchall()[0][0]
      if response == 0:
        return render_template("home.html", login_status="wrong_pass", signup_status="idle")
      elif response == 1:
        g.user = usrname
        print("After sign in: ", g.user)
        return render_template("home.html", login_status="successful", signup_status="idle", user=g.user)
      elif response == 2:
        return render_template("home.html", login_status="user_dne", signup_status="idle")
    elif request.form['btn'] == 'sign_out':
      g.user = None
      print("Signed out, current user: ", g.user)
      return render_template("home.html", login_status="not yet", signup_status="idle")
  else:
    return render_template("home.html", login_status="not yet", signup_status="idle")

'''
Scholar's Individual Page
'''
@app.route("/search", methods = ["GET", "POST"])
def search():
  if request.method == "POST":
    if request.form['btn'] == 'search_from_user':
      sname = request.form['sname']
      return redirect(url_for("scholar", scholar_name=sname))
    elif request.form['btn'] == 'submit_votes':
      sname = "Abdussalam Alawini"
      eval1 = request.form['stars1']
      eval2 = request.form['stars2']
      eval3 = request.form['stars3']
      eval4 = request.form['stars3']
      eval5 = request.form['stars3']
      print("LOOK AT HERE!!!!!!!!!!!!!!!!!!!!!!", eval1, eval2)
      return redirect(url_for("scholar", scholar_name=sname))

@app.route("/submit", methods=["GET", "POST"])
def submit():
  if request.method == "POST":
    if request.form['btn'] == 'submit _form':
      eval1 = request.form['stars1']
      eval2 = request.form['stars2']
      print("LOOK AT HERE!!!!!!!!!!!!!!!!!!!!!!1", eval1, eval2)
      return redirect(url_for("scholar", scholar_name="Abdussalam Alawini"))


@app.route("/<scholar_name>")
def scholar(scholar_name, user):

  scholar_name = str(scholar_name)
  ### Find timeline of a scholar from MongoDB

  ### Create data pipelines (SQL queries)
  # Create data pipeline to collect key words

  print("from inside scholar function: ", g.user)

  if request.method == "POST":
    if request.form['btn'] == 'submit_form':
      print(request.form['stars1'])

  cursor = connection.cursor()
  describe = "DESCRIBE scholars;"
  cursor.execute(describe)
  schema = []
  for tuple in cursor:
    schema.append(tuple[0])
  
  query0 = "SELECT * FROM scholars WHERE scName = '" + scholar_name + "';"
  cursor.execute(query0)
  info = []
  for tuple in cursor:
    for i in range(len(tuple)):
      info.append(tuple[i])
  
  basicInfoPacket = {}
  for i in range(len(schema)):
    basicInfoPacket[schema[i]] = info[i]

  query1 = ("SELECT title FROM scholars \
            NATURAL JOIN writes \
            NATURAL JOIN articles \
            WHERE scName = '" + scholar_name + "';")
  
  cursor.execute(query1)
  titles = []
  for tuple in cursor:
    titles.append(tuple[0])
  
  # Compute list of keywords
  trivialWords = set(["about","what","from","among","toward","with"]) # Add to the set when identifies one
  keywordsDict = {}
  for title in titles:
    title = title.lower()
    title = title.split(" ")
    for keyword in title:
      # Remove marks from the end of a keyword
      if keyword[-1] in set([":", ",", ".", "?", "!", ")"]):
        keyword = keyword[:-1]
      # Remove parenthesis from the begining of a keyword
      if keyword[0] in set(["("]):
        keyword = keyword[1:]
      # Ignore the keywords that have a length smaller than 3 or trivial keywords
      if (len(keyword) <= 3) or (keyword in trivialWords):
        continue
      # Count the qualified keyword
      if keyword in keywordsDict.keys():
        keywordsDict[keyword] += 1
      else:
        keywordsDict[keyword] = 1
  keywordsPacket = []
  for key, freq in keywordsDict.items():
    keywordsPacket.append({"word":key, "count":freq})
  keywordsPacket = list(sorted(keywordsPacket, key = lambda item: -item["count"]))[:50]

  query2 = ("SELECT publisher FROM scholars \
            NATURAL JOIN writes \
            NATURAL JOIN articles \
            WHERE scName = '" + scholar_name + "';")
  cursor.execute(query2)
  journalDict = {}
  for tuple in cursor:
    journal = tuple[0]
    if journal in journalDict.keys():
      journalDict[journal] += 1
    else:
      journalDict[journal] = 1

  # Compute list of top publishers
  journalPacket = []
  others = {"publisherName": "others", "numPapers": 0}
  for key, freq in journalDict.items():
    if key == None:
      others["numPapers"] += freq
    else:
      journalPacket.append({"publisherName": key, "numPapers": freq})

  journalPacket = list(sorted(journalPacket, key = lambda item: -item["numPapers"]))
  
  if len(journalPacket) >= 9:
    for i in range(9, len(journalPacket)):
      others["numPapers"] += journalPacket[i]["numPapers"]

  journalPacket = journalPacket[:9]
  journalPacket.append(others)

  # Compute list of top coauthors
  authorDict = {} 
  query3 = ("SELECT authors, cites FROM scholars \
          NATURAL JOIN writes \
          NATURAL JOIN articles \
          WHERE scName = '" + scholar_name + "';")
  cursor.execute(query3)
  for tuple in cursor:
    authors = tuple[0]
    citation = tuple[1]
    authors = authors.split(", ")
    if len(authors[-1]) >= 3 and authors[-1][-3:]=="ÔÇª":
      authors[-1] = authors[-1][:-3]
    for author in authors:
      if author in authorDict.keys():
        authorDict[author] += citation
      else:
        authorDict[author] = citation

  coauthorPacket = []
  for key, freq in authorDict.items():
    coauthorPacket.append({"author":key, "numCitations":freq})
  
  coauthorPacket = sorted(coauthorPacket, key=lambda item: -item["numCitations"])[1:6]

  for coauthor in coauthorPacket:
    coauthor["initials"] = "".join([name[0] for name in coauthor["author"].split(" ")])
  authorPacket = [{"author": scholar_name, "coauthors": coauthorPacket, \
                "initials": "".join([name[0] for name in scholar_name.split(" ")])}]
  
  # Compute number of citations for top 10% papers, top 30% papers, etc. 
  query45 = ("SELECT aId, cites, authorCount FROM scholars \
            NATURAL JOIN writes \
            NATURAL JOIN articles \
            WHERE scName = '" + scholar_name + "';")

  cursor.execute(query45)
  records = []
  for tuple in cursor:
    records.append(tuple)
  records = sorted(records, key=lambda record: -record[1])

  import math
  import numpy as np
  top10 = math.ceil(len(records)*0.1)
  top30 = math.ceil(len(records)*0.3)

  citations = [record[1] for record in records]
  numCitesTop10 = np.sum(citations[:top10])
  numCitesNext20 = np.sum(citations[top10:top30])
  numCitesNext70 = np.sum(citations[top30:])

  numCitesPacket = [{"name": "Top 10%", "value": str(numCitesTop10)},
                  {"name": "Top 10%-30%", "value": str(numCitesNext20)},
                  {"name": "Others", "value": str(numCitesNext70)}]


  numAuthorsPacket = {
                    "data":
                    [{"category": "One Author",
                      "top10": 0,
                      "next20": 0,
                      "next70": 0
                    },
                    {"category": "Two Authors",
                      "top10": 0,
                      "next20": 0,
                      "next70": 0
                    },
                    {"category": "Three Authors",
                      "top10": 0,
                      "next20": 0,
                      "next70": 0
                    },
                    {"category": "Four Authors",
                      "top10": 0,
                      "next20": 0,
                      "next70": 0
                    },
                    {"category": "Five or More",
                      "top10": 0,
                      "next20": 0,
                      "next70": 0
                    }],
                    "maxNum": 0
                  }
  for i in range(top10):
    record = records[i]
    numAuthors = min(record[2],5)
    numAuthorsPacket["data"][numAuthors-1]["top10"] += 1
  for i in range(top10,top30):
    record = records[i]
    numAuthors = min(record[2],5)
    numAuthorsPacket["data"][numAuthors-1]["next20"] += 1
  for i in range(top30,len(records)):
    record = records[i]
    numAuthors = min(record[2],5)
    numAuthorsPacket["data"][numAuthors-1]["next70"] += 1
  
  maxNum = 0
  for numAuthors in numAuthorsPacket["data"]:
    maxNum = max(maxNum, numAuthors["top10"]+numAuthors["next20"]+numAuthors["next70"])
  
  numAuthorsPacket["maxNum"] = int(maxNum * 1.1)

  return render_template('demo.html', user = g.user, scholar = scholar_name, \
                                      data1=keywordsPacket, data2=journalPacket, data3=authorPacket, \
                                      data4=numCitesPacket, data5=numAuthorsPacket, data6=[], info=basicInfoPacket)
  


if __name__ == '__main__':
  app.run(debug=True)

