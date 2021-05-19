import numpy as np
import pandas as pd
from PIL import image
from wordcloud import *
import matplotlib.pyplot as plt
from time import sleep

print("1. Cold Fire (feat. DEAN) -PREP\n")
print("2. Square (2017) - 백예린\n")
print("3. Maps - Maroon 5\n")
print("4. Birthday - Anne-Marie\n")
print("5. WAP (Feat. Magan Thee Stallion - Cardi B\n")
choose_song = int(input("단어구름을 만들 노래를 숫자로 입력해주세요: "))

sleep(0.5)
print("\n")
print("1. 구름 모양\n")
print("2. 하트 모양\n")
print("3. 별 모양\n")
choose_pic = int(input("단어구름을 만들 모양을 숫자로 입력해주세요: "))

if choose_pic == 1:
  music_mask = np.array(Image.open('../music.png'))
elif choose_pic == 2 :
  music_mask = np.array(Image.open('../music2.png'))
elif choose_pic == 3 :
  music_mask = np.array(Image.open('../music3.png'))

sleep(0.5)
print("\n")
print("1. 하얀색\n")
print("2. 검은색\n")
print("3. 회색\n")
print("4. 빨간색\n")
print("5. 분홍색\n")
choose_clr = int(input("단어구름의 배경색을 숫자로 입력해주세요: "))

if choose_clr == 1:
  bckgd = "#FFFFFF"
elif choose_clr == 2:
  bckgd = "#000000"
elif choose_clr == 3:
  bckgd = "#808080"
elif choose_clr == 4:
  bckgd = "#FF0000"
elif choose_clr == 5:
  bckgd = "#FFB6C1"

song_data = pd.read_csv('..data.csv', header = None)
new_data = song_data.iloc[choose_song,4]

my_font_path = 'usr/share/fonts/truetype/nanum/NanumBarunGothic.ttf'

wordcloud = WordCloud(max_font_size = 200, font_path = my_font_path, stopwords = STOPWORDS, background_color = bckgd, width = 1200, height = 900, mask = music_mask).generate(str(new_data))

plt.imshow(wordcloud)
plt.axis('off')