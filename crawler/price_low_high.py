from fake_useragent import UserAgent
import requests
from bs4 import BeautifulSoup
from urllib.request import urlopen
from lxml import etree
from requests_html import AsyncHTMLSession
import asyncio
import urllib
import requests_html as req

import os

price_low_high_api = 'https://online.carrefour.com.tw/on/demandware.store/Sites-Carrefour-Site/default/Search-UpdateGrid?q={}&srule=price-low-high'


def low_to_high(keywords):
    user_agent = UserAgent()
    url = price_low_high_api.format(urllib.parse.quote(keywords.encode('utf8')))
    response = requests.get(url, headers={'user-agent': user_agent.random})
    soup = BeautifulSoup(response.text, "lxml")  # Parser選用lxml，較為快速

    extract = soup.find_all('a', class_='gtm-product-alink', limit=5)
    ele1 = [s.get('data-name') for s in extract]
    ele2 = [s.get('data-baseprice') for s in extract]
    extract2 = soup.find_all('img', class_='m_lazyload')
    ele3 = [s.get('src') for s in extract2]
    
    
    
    if len(ele1) > 0:
        print('價格由低到高排序後結果:')
        search_list=[]
        for (name, price, pic) in zip(ele1, ele2, ele3):
            search_dic={}
            search_dic.update({'name':name})
            search_dic.update({'price':price})       
            search_dic.update({'pic':pic})  
            search_list.append(search_dic)
        five_product_low={'five_product_low':search_list}
        return five_product_low

    else:
        five_product_low={'five_product_low':[{'null':'商品不存在!'}]}
        return (five_product_low)


if __name__=="__main__":
    low_to_high('巧克力')



