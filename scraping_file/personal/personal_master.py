# -*- coding: utf-8 -*-
# import MySQLdb
import requests
import re
from bs4 import BeautifulSoup

# チームのリンクとマスタの関係
team_link = {1:'g', 2:'t', 3:'d', 4:'db', 5:'c', 6:'s',
             7:'l', 8:'bs', 9:'h', 10:'f', 11:'m', 12:'e'}

position_list = {unicode('投手','utf-8'):1, unicode('捕手','utf-8'):2, unicode('内野手','utf-8'):3, unicode('外野手','utf-8'):4}
dominant_arm_list = {unicode('右','utf-8'):1, unicode('左','utf-8'):2, unicode('左右','utf-8'):3}
person_list = []
list_count = -1

for team_master_id, link in team_link.items():
    current_position = 0
    req = requests.get('http://bis.npb.or.jp/teams/rst_' + str(link) + '.html')
    soup = BeautifulSoup(req.text.encode(req.encoding))

    div_elements = soup.find_all('div', class_="rosterdivlisttbl")

    # 支配下選手とそれ以外の選手を分ける
    for div_element in div_elements:
        tr_tags = div_element.find_all('tr')
        for tr_tag in tr_tags:
            #[u'rosterPlayer']とかになる時は、[0]を指定してやれば値を取得できる
            if(tr_tag['class'][0] == 'rosterMainHead'):
                # utf-8に文字コードを変換しないとエラーになる
                if(tr_tag.find('th',class_="rosterPos").string != unicode('監督','utf-8')):
                    current_position = position_list[tr_tag.find('th',class_="rosterPos").string]
            else:
                if(current_position > 0):
                    td_tags = tr_tag.find_all('td')
                    list_count += 1
                    person_list.append(list_count)
                    person_list[list_count] = []
                    for_count = 0
                    for td_tag in td_tags:
                        for_count += 1
                        # 背番号
                        if for_count % 10 == 1:
                            person_list[list_count].append(td_tag.string)
                        # 名前(ここで詳細な情報も一緒に取ってしまう)
                        if for_count % 10 == 2:
                            person_list[list_count].append(td_tag.find('a').string)
                            person_req = requests.get('http://bis.npb.or.jp/' + td_tag.find('a')['href'])
                            person_soup = BeautifulSoup(person_req.text.encode(person_req.encoding))
                            # 出身高校とドラフト順位について
                            register_detail = person_soup.find_all('td',class_="registerDetail")
                            # 高校は2つめのキーであり、語尾に「大」とついていなければ高校と見なしてよさそう
                            # （ついているのは外国人くらい）
                            from_team = register_detail[2].string.split(' - ')
                            if(from_team[0][-1:] == unicode('大','utf-8')):
                                print(from_team[0])
                            # print(register_detail[3])
                        # 生年月日
                        if for_count % 10 == 3:
                            person_list[list_count].append(td_tag.string.replace('.','-'))
                        # 身長
                        if for_count % 10 == 4:
                            person_list[list_count].append(td_tag.string)
                        # 体重
                        if for_count % 10 == 5:
                            person_list[list_count].append(td_tag.string)
                        # 利き腕（投）
                        if for_count % 10 == 6:
                            dominant_arm = dominant_arm_list[td_tag.string]
                            person_list[list_count].append(dominant_arm)
                        # 利き腕（打）
                        if for_count % 10 == 7:
                            dominant_arm = dominant_arm_list[td_tag.string]
                            person_list[list_count].append(dominant_arm)
                            print(person_list[list_count][1])
    if(team_master_id == 1):
        break
        # if td_tag.find('a'):
        #     list_count += 1
        #     team_id = team_dict[td_tag.find('a')['href']]
        #     team_list[list_count][0] = team_id
        # else:
        #     # 守備率
        #     if for_count % 10 == 2:
        #         team_list[list_count][1] = str(td_tag.string)
        #     # 守備機会
        #     if for_count % 10 == 4:
        #         team_list[list_count][2] = str(td_tag.string)
        #     # 刺殺
        #     if for_count % 10 == 5:
        #         team_list[list_count][3] = str(td_tag.string)
        #     # 捕殺
        #     if for_count % 10 == 6:
        #         team_list[list_count][4] = str(td_tag.string)
        #     # 失策
        #     if for_count % 10 == 7:
        #         team_list[list_count][5] = str(td_tag.string)
        #     # 併殺参加人数
        #     if for_count % 10 == 8:
        #         team_list[list_count][6] = str(td_tag.string)
        #     # 併殺を取った数
        #     if for_count % 10 == 9:
        #         team_list[list_count][7] = str(td_tag.string)
        #     # 捕逸
        #     if for_count % 10 == 0:
        #         team_list[list_count][8] = str(td_tag.string)
# connector = MySQLdb.connect(host="127.0.0.1", db="baseball", user="root", passwd="", charset="utf8")
# cursor = connector.cursor()
# for team_record in team_list:
#     cursor.execute("insert into team_defences(" +
#                    "team_id,defence_rate,opportunity,throw_out,assisting_out,error,double_play_persons,double_play_count,passed_ball)" +
#                    "values(" + str(team_record[0]) + "," + str(team_record[1]) + "," + str(team_record[2]) + "," + str(team_record[3]) +
#                     "," + str(team_record[4]) + "," + str(team_record[5]) + "," + str(team_record[6]) + "," + str(team_record[7]) +
#                     "," + str(team_record[8]) + ");")
# connector.commit()
# cursor.close()
# connector.close()
