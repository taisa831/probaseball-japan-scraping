# -*- coding: utf-8 -*-
import requests
from bs4 import BeautifulSoup

# チームのオブジェクト。DBのteam_idとキーを繋ぐ
team_dict = {'G':1, 'T':2, 'D':3, 'Y':4, 'W':4, 'C':5, 'S':6,
             'L':7, 'B':8, 'H':9, 'F':10, 'M':11, 'O':11, 'E':12, 'K':13}

# 年数。とりあえず、1964年からしかない
year = 1964

# ここにループを入れる
while year < 2015:

    ranking_req = requests.get('http://2689.web.fc2.com/' + str(year) + '.html')
    ranking_soup = BeautifulSoup(ranking_req.text.encode(ranking_req.encoding))

    a_tags = ranking_soup.select('table[class="pos1"] td[class="result"] a')

    for a_tag in a_tags:
        match_link = a_tag.get('href')

        match_card = match_link.split('/')[2]
        home_team = match_card.split_str(1,1)
        home_team_id = team_dict[home_team]
        visitor_team = match_card.split_str(2,1)
        visitor_team_id = team_dict[visitor_team]

        # urlのデータを取得。ここはループさせてURL切り替えができる
        match_req = requests.get('http://2689.web.fc2.com/' + match_link)
        match_soup = BeautifulSoup(match_req.text.encode(match_req.encoding))




    year += 1