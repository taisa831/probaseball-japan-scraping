# -*- coding: utf-8 -*-
import MySQLdb
import requests
from bs4 import BeautifulSoup

# チームのオブジェクト。DBのteam_idとキーを繋ぐ
team_dict = {'idf1_g.html':1, 'idf1_t.html':2, 'idf1_d.html':3, 'idf1_db.html':4, 'idf1_c.html':5, 'idf1_s.html':6,
             'idf1_l.html':7, 'idf1_bs.html':8, 'idf1_h.html':9, 'idf1_f.html':10, 'idf1_m.html':11, 'idf1_e.html':12}

league_list = ['c','p']
team_list = [[0 for i in range(9)] for j in range(12)]
list_count = -1
for_count = 0

for league in league_list:
    req = requests.get('http://bis.npb.or.jp/2014/stats/tmf_' + str(league) + '.html')
    soup = BeautifulSoup(req.text.encode(req.encoding))

    td_tags = soup.select('tr[class="ststats"] td')

    for td_tag in td_tags:
        for_count += 1
        if td_tag.find('a'):
            list_count += 1
            team_id = team_dict[td_tag.find('a')['href']]
            team_list[list_count][0] = team_id
        else:
            # 守備率
            if for_count % 10 == 2:
                team_list[list_count][1] = str(td_tag.string)
            # 守備機会
            if for_count % 10 == 4:
                team_list[list_count][2] = str(td_tag.string)
            # 刺殺
            if for_count % 10 == 5:
                team_list[list_count][3] = str(td_tag.string)
            # 捕殺
            if for_count % 10 == 6:
                team_list[list_count][4] = str(td_tag.string)
            # 失策
            if for_count % 10 == 7:
                team_list[list_count][5] = str(td_tag.string)
            # 併殺参加人数
            if for_count % 10 == 8:
                team_list[list_count][6] = str(td_tag.string)
            # 併殺を取った数
            if for_count % 10 == 9:
                team_list[list_count][7] = str(td_tag.string)
            # 捕逸
            if for_count % 10 == 0:
                team_list[list_count][8] = str(td_tag.string)
connector = MySQLdb.connect(host="127.0.0.1", db="baseball", user="root", passwd="", charset="utf8")
cursor = connector.cursor()
for team_record in team_list:
    cursor.execute("insert into team_defences(" +
                   "team_id,defence_rate,opportunity,throw_out,assisting_out,error,double_play_persons,double_play_count,passed_ball)" +
                   "values(" + str(team_record[0]) + "," + str(team_record[1]) + "," + str(team_record[2]) + "," + str(team_record[3]) +
                    "," + str(team_record[4]) + "," + str(team_record[5]) + "," + str(team_record[6]) + "," + str(team_record[7]) +
                    "," + str(team_record[8]) + ");")
connector.commit()
cursor.close()
connector.close()
