#                                     _                                        _               _
#                                    | |                                      | |             | |
#          ___  _ __  __ _ __      __| |  ___  _ __     _ __   _ __  ___    __| | _   _   ___ | |_
#         / __|| '__|/ _` |\ \ /\ / /| | / _ \| '__|   | '_ \ | '__|/ _ \  / _` || | | | / __|| __|
#        | (__ | |  | (_| | \ V  V / | ||  __/| |      | |_) || |  | (_) || (_| || |_| || (__ | |_
#         \___||_|   \__,_|  \_/\_/  |_| \___||_|      | .__/ |_|   \___/  \__,_| \__,_| \___| \__|
#                                                      | |
#                                                      |_|
#
#
#                                                                                       目前版本 v1.7.0
#                                                                                       撰寫成員: 鄭舜澤


# crawler the product info (name、link、price、pop)
# crawler the product info (name、link、price、pop)

from fake_useragent import UserAgent
import requests
from bs4 import BeautifulSoup
from urllib.request import urlopen
from lxml import etree
from requests_html import AsyncHTMLSession
import asyncio
import urllib
import requests_html as req




# crawler the product info (name、link、price、pop)




# def goods_info(user_input):
#     content = ""
#     listx = []

#     url = 'https://online.carrefour.com.tw/zh/search?q=' + str(user_input) if not None else print("error!")
#     user_agent = UserAgent()
#     response = requests.get(url, headers={'user-agent': user_agent.random})
#     soup = BeautifulSoup(response.text, "lxml")
#     # extract the html tag <a> sections
#     extract = soup.find_all('a', class_='gtm-product-alink', limit=5)
#     ele = [s.get('href') for s in extract]
#     print(url)

    
    
    
#     if len(ele) > 0:
#         search_list=[]
#         for s in extract:
#             search = s.get('href')
#             link = shorten("https://online.carrefour.com.tw" + search, '')
#             name = s.get('data-name')
#             price = s.get('data-baseprice')
#             category = s.get('data-category')
#             listx.append(link)
#             content += f"\n{category}\n{name}\t{price}\n{link}\n"
            
#             search_dic={}
#             search_dic.update({'category':category})            
#             search_dic.update({'name':name})
#             search_dic.update({'price':price}) 
#             search_dic.update({'link':link})             
#             search_list.append(search_dic)
#         five_product={'five_product':search_list}
#         return five_product

#     else:
#         five_product={'five_product':[{'null':'商品不存在!'}]}
#         return (five_product)


# # 縮網址
# def shorten(long_url, alias):
#     URL = "http://tinyurl.com/create.php?source=indexpage&url=" + long_url + "&submit=Make+TinyURL%21&alias=" + alias
#     response = urlopen(URL)
#     soup = BeautifulSoup(response, 'lxml')
#     return soup.find_all('div', {'class': 'indent'})[1].b.string


# if __name__=="__main__":
#     goods_info('巧克力')
    

    
price_high_low_api = 'https://online.carrefour.com.tw/on/demandware.store/Sites-Carrefour-Site/default/Search' \
                     '-UpdateGrid?q={}'



def goods_info(keywords):
    user_agent = UserAgent()
    url = price_high_low_api.format(urllib.parse.quote(keywords.encode('utf8')))
    response = requests.get(url, headers={'user-agent': user_agent.random})
    soup = BeautifulSoup(response.text, "lxml")  # Parser選用lxml，較為快速
    # print('url:',url)
    # print('response:',response)
    # print('soup:',soup)
    

    extract = soup.find_all('a', class_='gtm-product-alink', limit=5)
    ele1 = [s.get('data-name') for s in extract]
    ele2 = [s.get('data-baseprice') for s in extract]
    extract2 = soup.find_all('img', class_='m_lazyload')
    ele3 = [s.get('src') for s in extract2]
    # print(extract2)
    # print(ele3)
    
    if len(ele1) > 0:
        # print('價格由高到低排序後結果:')
        search_list=[]
        for (name, price, pic) in zip(ele1, ele2, ele3):
            search_dic={}
            search_dic.update({'name':name})
            search_dic.update({'price':price})       
            search_dic.update({'pic':pic})  
            search_list.append(search_dic)
        five_product={'five_product':search_list}
        return five_product


    else:
        five_product={'five_product_high':[{'null':'商品不存在!'}]}
        return (five_product)

    

if __name__=="__main__":
    goods_info('巧克力')
