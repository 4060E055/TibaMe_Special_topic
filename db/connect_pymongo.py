from pymongo import MongoClient
import pymongo
import dnspython

def connect_mongodb():

    #連線
    clust = pymongo.MongoClient("mongodb+srv://a09323468:1234@cluster0.s8y9l.mongodb.net/group5?retryWrites=true&w=majority")
    #db、colletion名稱
    db = clust["group5"]
    colletion = db["group5"]

    #要放的資料有哪些
    #post = {"_id":0, "name":"andy", "search":"oreo"}
    #桶子裡放資料
    #connect_mongodb.colletion.insert_one(post)

if __name__ == '__main__':
    connect_mongodb()
