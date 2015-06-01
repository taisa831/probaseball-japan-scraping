# -*- coding: utf-8 -*-
import MySQLdb
import requests
from bs4 import BeautifulSoup

# チームのオブジェクト。DBのteam_idとキーを繋ぐ
team_dict = {'idp1_g.html':1, 'idp1_t.html':2, 'idp1_d.html':3, 'idp1_db.html':4, 'idp1_c.html':5, 'idp1_s.html':6,
             'idp1_l.html':7, 'idp1_bs.html':8, 'idp1_h.html':9, 'idp1_f.html':10, 'idp1_m.html':11, 'idp1_e.html':12}

league_list = ['c','p']
team_list = [[0 for i in range(25)] for j in range(12)]
list_count = -1
for_count = 0

for league in league_list:
    req = requests.get('http://bis.npb.or.jp/2014/stats/tmp_' + str(league) + '.html')
    soup = BeautifulSoup(req.text.encode(req.encoding))

    td_tags = soup.select('tr[class="ststats"] td')

    for td_tag in td_tags:
        for_count += 1
        if td_tag.find('a'):
            list_count += 1
            team_id = team_dict[td_tag.find('a')['href']]
            team_list[list_count][0] = team_id
        else:
            # 防御率
            if for_count == 2:
                team_list[list_count][1] = str(td_tag.string)
            # 勝利
            if for_count == 4:
                team_list[list_count][3] = str(td_tag.string)
            # 敗北
            if for_count == 5:
                team_list[list_count][4] = str(td_tag.string)
            # セーブ
            if for_count == 6:
                team_list[list_count][5] = str(td_tag.string)
            # ホールド
            if for_count == 7:
                team_list[list_count][6] = str(td_tag.string)
            # HP
            if for_count == 8:
                team_list[list_count][7] = str(td_tag.string)
            # 完投
            if for_count == 9:
                team_list[list_count][8] = str(td_tag.string)
            # 完封勝
            if for_count == 10:
                team_list[list_count][9] = str(td_tag.string)
            # 無四球
            if for_count == 11:
                team_list[list_count][10] = str(td_tag.string)
            # 勝率
            if for_count == 12:
                team_list[list_count][11] = str(td_tag.string)
            # 打者
            if for_count == 13:
                team_list[list_count][12] = str(td_tag.string)
            # 投球回(整数)
            if for_count == 14:
                team_list[list_count][13] = str(td_tag.string)
            # 投球回(小数点)
            if for_count == 15:
                if(td_tag.string is not None):
                    team_list[list_count][13] += str(td_tag.string)
            # 安打
            if for_count == 16:
                team_list[list_count][14] = str(td_tag.string)
            # 本塁打
            if for_count == 17:
                team_list[list_count][15] = str(td_tag.string)
            # 四球
            if for_count == 18:
                team_list[list_count][16] = str(td_tag.string)
            # 故意四
            if for_count == 19:
                team_list[list_count][17] = str(td_tag.string)
            # 死球
            if for_count == 20:
                team_list[list_count][18] = str(td_tag.string)
            # 三振
            if for_count == 21:
                team_list[list_count][19] = str(td_tag.string)
            # 暴投
            if for_count == 22:
                team_list[list_count][20] = str(td_tag.string)
            # ボーク
            if for_count == 23:
                team_list[list_count][21] = str(td_tag.string)
            # 失点
            if for_count == 24:
                team_list[list_count][22] = str(td_tag.string)
            # 自責点
            if for_count == 25:
                team_list[list_count][23] = str(td_tag.string)
                for_count = 0

connector = MySQLdb.connect(host="127.0.0.1", db="baseball", user="root", passwd="", charset="utf8")
cursor = connector.cursor()
for team_record in team_list:
    cursor.execute("insert into team_pitches(" +
                   "team_id,earned_run_average,win,lose,save,hold,hp,complete_game,shut_outs,no_base_on_ball,winning_percentage,plate_appearances,innings_pitched," +
                   "hits_allowed,home_runs_allowed,bases_on_balls_allowed,intentional_bases_on_balls_allowed,hit_batsmen,strike_out,wild_pitches,balk,runs_allowed,earned_runs)" +
                   "values(" + str(team_record[0]) + "," + str(team_record[1]) + "," + str(team_record[3]) + "," + str(team_record[4]) +
                    "," + str(team_record[5]) + "," + str(team_record[6]) + "," + str(team_record[7]) + "," + str(team_record[8]) +
                    "," + str(team_record[9]) + "," + str(team_record[10]) + "," + str(team_record[11]) + "," + str(team_record[12]) +
                    "," + str(team_record[13]) + "," + str(team_record[14]) + "," + str(team_record[15]) + "," + str(team_record[16]) +
                    "," + str(team_record[17]) + "," + str(team_record[18]) + "," + str(team_record[19]) + "," + str(team_record[20]) +
                    "," + str(team_record[21]) + "," + str(team_record[22]) + "," + str(team_record[23]) + ");")
connector.commit()
cursor.close()
connector.close()
