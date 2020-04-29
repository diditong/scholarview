import pprint # data pretty printer
from flask import Flask, redirect, url_for, request, render_template # Flask web framework
from pymongo import MongoClient # Python-MongoDB packages

app = Flask(__name__)

'''
Connect to MongoDB Database
'''
client = MongoClient('mongodb://localhost:27017/')
db = client['google-scholar-10k']
collection = db['articles']

'''
Home Page of Google Scholar Visulization
'''
@app.route("/")
@app.route("/home", methods = ["GET", "POST"])
def home():
  if request.method == "POST":
    if request.form['btn'] == 'search_from_home':
      user_id = request.form['user_id']
      return redirect(url_for("scholar", scholar_name=user_id))
  else:
    print("hello")
    return render_template("home.html")

'''
Scholar's Individual Page
'''
@app.route("/search", methods = ["GET", "POST"])
def search():
  if request.method == "POST":
    if request.form['btn'] == 'search_from_user':
      user_id = request.form['user_id']
      return redirect(url_for("scholar", scholar_name=user_id))

@app.route("/<scholar_name>")
def scholar(scholar_name):
  ### Create data pipelines (MongoDB queries in JSON form)
  # Create data pipeline to collect key words
  pipeline1 = [
  {"$match": {"name": scholar_name}}, 
  {"$addFields": {"words": {"$split": ["$pub_title"," "]} }}, 
  {"$unwind": "$words"}, 
  {"$group": {"_id": {"$toLower": "$words"}, "count": {"$sum": 1}}}, 
  {"$match": {"_id": {"$nin": ["for", "the", "a", "at", "and", "on", "from", "in", "with", "to", "of"]}}}, 
  {"$project": {"_id": 0, "word": "$_id", "count": "$count"}}, 
  {"$sort": {"count": -1}}, 
  {"$limit": 75}
  ]
  # Create data pipeline to collect top journals
  pipeline2 = [
    {"$match": {"name": scholar_name, "journal": {"$ne": ""}}}, 
    {"$group": {"_id": {"$toLower": "$journal"}, "numPapers": {"$sum": 1}}}, 
    {"$project": {"_id":0, "journalName":"$_id", "numPapers":"$numPapers"}}, 
    {"$sort": {"numPapers": -1}},
    #{"$limit": 10}
  ]
  # Create data pipeline to collect top authors
  pipeline3 = [
    {"$match": {"name": scholar_name}},
    {"$addFields": {"coauthors": {"$split": ["$pub_author"," and "]}}}, 
    {"$unwind": "$coauthors"}, {"$match": {"coauthors": {"$nin": [scholar_name]}}}, 
    {"$group": {"_id": "$coauthors", "citations": {"$sum": {"$toInt": "$citations"}}}}, 
    {"$project": {"_id":0, "author":"$_id", "numCitations": "$citations"}}, 
    {"$sort": {"numCitations": -1}},
    {"$limit": 10}
  ]

  # Save query results from MongoDB into variable data
  keywords = list(db.articles.aggregate(pipeline1)) # key words data
  journals = list(db.articles.aggregate(pipeline2)) # top journals data
  coauthors = [{"author": scholar_name,
      "coauthors": list(db.articles.aggregate(pipeline3)),
      "initials": "".join([name[0] for name in scholar_name.split(" ")])}]
  
  # Add other category to journals data
  other = {'journalName': 'others' , \
  'numPapers': sum([record['numPapers'] for record in journals[5:]])}
  journals = journals[:5] + [other]

  # Add Initials to coauthors data
  for item in coauthors[0]["coauthors"]:
    nameList = item["author"].split(" ")
    initials = "".join([name[0] for name in nameList])
    item["initials"] = initials

  return render_template('demo.html', data1=keywords, data2=journals, data3=coauthors)
  
if __name__ == '__main__':
  app.run(debug=True)