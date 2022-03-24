import pymysql
import json
import os
import re
from urllib.request import urlopen
# import MySQLdb
import requests
import pandas
from collections import OrderedDict

import pymysql
import re



# 建立conn連線到本地端資訊
conn = pymysql.connect(host="mysql",
                     user="root",
                     passwd="123456",
                     database="example",
                     charset="utf8")
# 使用 cursor() 方法建立一個遊標物件 cursor
cursor = conn.cursor()


def distinct_xy(find_goods):
    try:
        # find_goods = input("輸入商品名字:")
        #find_goods = "泡麵"
        # find_goods = [find_goods]

        # mysql 執行查詢語句
        cursor.execute("select  aisle, x, y  from C_11 where goods=%s", find_goods)
        # 獲取所有記錄列表
        result = cursor.fetchall()

        # 去除重複
        unique = list(OrderedDict.fromkeys(result))
        return(unique)

    except TypeError:
        return('null')

    #finally:
    # 關閉Cursor物件
    #cursor.close()

    # 關閉Connection物件
    #conn.close()

 
    
    
    

def find_carrefour_goods(find_goods):
    try:
        # find_goods = input("輸入商品名字:")
        #find_goods = "泡麵"
        find_goods = [find_goods]

        # mysql 執行查詢語句
        cursor.execute("select area, aisle, cabinet, x, y    from C_10 where goods=%s", find_goods)
        # 獲取所有記錄列表
        result = cursor.fetchall()

        # 去除重複
        unique = list(OrderedDict.fromkeys(result))
        return unique

    except TypeError:
        return 'null'

    #finally:
    # 關閉Cursor物件
    #cursor.close()

    # 關閉Connection物件
    #conn.close()


def find_online_category(find_category):
    try:
        # find_category = input("輸入線上類別名稱:")
        find_category = [find_category]

        # mysql 執行查詢語句
        cursor.execute("select area, aisle, cabinet_begining, cabinet_end from online_carrefour where online_category=%s",find_category)

        # 獲取所有記錄列表
        result = cursor.fetchall()
        # 去除''
        # result = re.sub(r"\(|\)|\'|\'|\,", '',str(result))

        # 去除重複
        unique = list(OrderedDict.fromkeys(result))
        return unique
        # print(result)

    except TypeError:
        return 'null'

    #finally:
    # 關閉Cursor物件
    #cursor.close()

    # 關閉Connection物件
    #conn.close()



def find_disease(find_food_ingredients_and_additives):
    try:
        # find_name = input("泡麵：")
        # find_food_ingredients_and_additives = "砂糖"
        # find_food_ingredients_and_additives = [find_food_ingredients_and_additives]

        # mysql 執行查詢語句
        cursor.execute(
            "select d.disease from fia_disease5 fiad  left join disease2 d on fiad.disease_id = d.disease_id left join food_ingredients_and_additives4 fia on fiad.fia_id = fia.fia_id where food_ingredients_and_additives=%s",
            find_food_ingredients_and_additives)
        # 獲取所有記錄列表
        result = cursor.fetchall()
        result = str(result).replace(",", "").replace(" ", ",")
        result = re.sub(r"\(|\)|\'|\'", '', str(result))
        list_1 = []
        list_1.append(result)
        # list_1.append('b')
        # print(list_1)
        # print(type(list_1))

    except TypeError:
        list_1=('null')

    # finally:
    # 關閉Cursor物件
    # cursor.close()

    # 關閉Connection物件
    # conn.close()
    return list_1


if __name__ == '__main__':

    a=find_carrefour_goods('巧克力')
    b=find_online_category('汽水')
    c=find_disease('砂糖')
    d=distinct_xy('巧克力')
    print('--------')
    #print(a,' ',b,' ',c,' ',d)
    print(a)
    print(b)
    print(c)
    print(d)
    