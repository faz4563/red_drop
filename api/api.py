# code to run api -------------->>>  python -Xfrozen_modules=off api.py

from flask import Flask
from flask import request
from pymongo import MongoClient
from bson.json_util import dumps
import json
from pymongo import MongoClient
from bson import json_util

app = Flask(__name__)
client = MongoClient("mongodb://localhost:27017/")
mydatabase = client["donors_data"]
donorDetails = mydatabase["donor_details"]
userDetails = mydatabase["red_drop_users"]


def rep(__self__):
    donorDetails.__format__


@app.route("/register_user", methods=['POST'])
def registerUser():
    try:
        data = json.loads(request.data)
        name = data['name']
        email = data['email']
        phone = data["phone"]
        password = data['password']
        # bloodGroup = data["bloodGroup"]
        dup_data = userDetails.distinct("phone")
        print(dup_data)
        if (phone not in dup_data):
            status = userDetails.insert_one({
                "name": name,
                "email": email,
                "phone": phone,
                "password": password,
            })
            print(status)
            return dumps({
                'Flag': 'T',
                'Status': 'User Created Successfully'})
        else:
            return dumps({'Flag': 'F','Status': 'User Already Exists'})
    except Exception as e:
        return dumps({'error': str(e)})


@app.route("/login", methods=['POST'])
def login():
    try:
        data = json.loads(request.data)
        username = data['username']
        password = data['password']
        x = userDetails.find_one({"username": username})
        
        if (x and x['password'] == password):
            return dumps({
                'Flag': 'T',
                'Status': 'Logged In Successfully'
                })
        else:
            return dumps({'Flag': 'F','Status': 'User Detail Not Found'})
    except Exception as e:
        return dumps({'error': str(e)})


@app.route("/get_blood_list", methods=['GET'])
def getBloodList():
    # data = json.loads(request.data)
    # bloodGroup = data["bloodGroup"]
    
    try:

        blood_groups = donorDetails.find({"bloodGroup": {"$exists": True}})
        return dumps(blood_groups)

        # blood_groups = [doc["_id"] for doc in mycollection.aggregate(pipeline)]
        # db_names = client.list_database_names()

        # for db_name in db_names:
        #     db = client[db_name]
        #     collection_names = db.list_collection_names()
        #     for collection_name in collection_names:
        #         collection = db[collection_name]
        #         blood_groups.update(collection.distinct(key="bloodgroup"))

    except Exception as e:
        return dumps({'error': str(e)})


# def login():
#     try:
#         data = json.loads(request.data)
#         name = data['name']
#         email = data['email']
#         password = data['password']
#         phone = data["phone"]

#         dup_data_username = mycollection.distinct("username")
#         dup_data_password = mycollection.distinct("username")
#         print(dup_data_username)
#         print(dup_data_password)
#         if (name & password not in dup_data_username & dup_data_password):
#             status = mycollection.insert_one({
#                 "name": name,
#                 "email": email,
#                 "password": password,
#                 "phone": phone
#             })
#             print(status)
#             return dumps({'Status': 'User Created Successfully'})
#         else:
#             return dumps({'Status': 'User Already Exists'})
#     except Exception as e:
#         return dumps({'error': str(e)})

# @app.route("/get_all_user", methods=['GET'])
# def get_all_user():
#     try:
#         user = mycollection.find()
#         return dumps(user)
#     except Exception as e:
#         return dumps({'error': str(e)})

# @app.route("/get_user_detail/<name>", methods=['GET'])
# def get_user_detail(name):
#     try:
#         x = mycollection.find_one({"name": name})
#         return dumps(x)
#     except Exception as e:
#         return dumps({'error': str(e)})

# @app.route("/update_user_detail/<name>", methods=['PUT'])
# def update_user_detail(name):
#     try:
#         data = json.loads(request.data)
#         x = mycollection.find_one({"name": name})
#         myquery = {"name": x['name']}
#         newvalues = {
#             "$set": {
#                 "name": data["name"],
#                 "email": data["email"],
#                 "password": data["password"],
#                 "phone": data["phone"]
#             }
#         }
#         status = mycollection.update_one(myquery, newvalues)
#         print(status)
#         return dumps({'message': 'SUCCESS'})
#     except Exception as e:
#         return dumps({'error': str(e)})

# @app.route("/delete_user_detail/<name>", methods=['DELETE'])
# def delete_user_detail(name):
#     try:
#         x = mycollection.find_one({"name": name})
#         status = mycollection.delete_one(x)
#         return dumps({'message': 'SUCCESS'})
#     except Exception as e:
#         return dumps({'error': str(e)})

# @app.route("/add_admin", methods=['POST'])
# def add_admin():
#     try:
#         data = json.loads(request.data)
#         name = data['name']
#         email = data['email']
#         password = data['password']
#         phone = data["phone"]
#         admin = data["admin"]
#         status = mycollection.insert_one({
#             "name": name,
#             "email": email,
#             "password": password,
#             "phone": phone,
#             "admin": admin,
#         })
#         print(status)
#         return dumps({
#             'Status': 'User Created Successfully',
#             'Status_code': 200
#         })

#     except Exception as e:
#         return dumps({'error': str(e)})

# @app.route("/add_super_admin", methods=['POST'])
# def add_super_admin():
#     try:
#         data = json.loads(request.data)
#         name = data['name']
#         email = data['email']
#         password = data['password']
#         phone = data["phone"]
#         super_admin = data["super_admin"]
#         status = mycollection.insert_one({
#             "name": name,
#             "email": email,
#             "password": password,
#             "phone": phone,
#             "admin": super_admin
#         })
#         print(status)
#         return dumps({
#             'Status': 'User Created Successfully',
#             'Status_code': 200
#         })
#     except Exception as e:
#         return dumps({
#             'error': str(e),
#         })

# @app.route("/get_all_admin", methods=['GET'])
# def get_all_admin():
#     try:
#         user = mycollection.find()
#         # print(contacts.name)
#         return dumps(user)
#     except Exception as e:
#         return dumps({'error': str(e)})

# @app.route("/get_admin_detail/<admin>", methods=['GET'])
# def get_admin_detail(admin):
#     try:
#         x = mycollection.find_one({"admin": admin})
#         return dumps({
#             "id": x['id'],
#             "name": x['name'],
#             "email": x['email'],
#             "password": x['password'],
#             "phone": x['phone']
#         })
#     except Exception as e:
#         return dumps({'error': str(e)})

# @app.route("/update_admin/<name>", methods=['PUT'])
# def update_admin_detail(name):
#     try:
#         data = json.loads(request.data)
#         x = mycollection.find_one({"name": name})
#         data = {"name": x['name'], "contact": x['contact']}
#         newvalues = {{"name": data["name"], "contact": data["contact"]}}
#         status = mycollection.update_one(data, newvalues)
#         print(status)
#         return dumps({'Status': 'Data Updated', 'Status_code': 200})
#     except Exception as e:
#         return dumps({'error': str(e)})

# @app.route("/delete_admin/<name>", methods=['DELETE'])
# def delete_admin_detail(name):
#     try:
#         x = mycollection.find_one({"name": name})
#         status = mycollection.delete_one(x)
#         return dumps({'Status': 'Deleted Successfully', 'Status_code': 200})
#     except Exception as e:
#         return dumps({'error': str(e)})


@app.route("/")
def home():
    return "Welcome!"


if (__name__ == "__main__"):
    app.run(debug=True, host='192.168.1.93', port=5500)
