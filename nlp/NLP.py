import speech_recognition as sr
import jieba
import os
# from pydub import AudioSegment


# 音檔轉文字
def speech_to_text(audio_path):
    r = sr.Recognizer()
    WAV = sr.AudioFile(audio_path)
    with WAV as source:
        audio = r.record(source)
    sentence = r.recognize_google(audio, language="zh-TW")
    return (sentence)


# # 關鍵字
# def search_keyword(sentence):
#     keyword_where = ["哪", "位置", "找"]
#     keyword_cheap = ["便宜", "價格低", "價格最低"]
#     keyword_expensive = ["貴", "價格最高", "價格高", "高價"]
#     keyword_popular = ["推薦", "熱門", "最好的", "熱銷", "不錯的"]
#     what_Q = 0

#     for i in keyword_where:
#         if i in sentence:
#             what_Q = 1

#     for i in keyword_cheap:
#         if i in sentence:
#             what_Q = 2

#     for i in keyword_expensive:
#         if i in sentence:
#             what_Q = 3

#     for i in keyword_popular:
#         if i in sentence:
#             what_Q = 4

#     return what_Q


def cut_word(sentence):
    # 自定義辭典
    jieba.load_userdict('nlp/all_word.txt')
    seg = jieba.cut(sentence)
    seg_list = list(seg)  # 因是generator格式 需轉list

    # 停用詞設定
    no_word = ["你", "我", "他", "嗎", "在", "的", "是", "知道",
               "曉得", "找", "想要", "哪", "位置", "不錯的", "阿",
               "啊", "有", "沒", "有沒有", "有沒", "沒有", "想", "知不知道"]

    for i in seg_list:
        if i in no_word:
            seg_list.remove(i)

    return set(seg_list)


def get_category(seg_list):
    # 商品名稱集
    path = 'nlp/mamual_pruduct_list.txt'
    f = open(path, 'r', encoding='utf-8')
    items = f.read().split("\n")  # #商品名稱集
    f.close()

    product = []

    # 完整比對分詞
    for i in set(seg_list):
        if i in items:
            product.append(i)
    # print("第一次",product)
    join_items = "".join(items)

    # 模糊比對分詞(如果分詞包含在某個完整類別名詞裡)
    if product == []:
        for i in seg_list:
            for item in items:
                if i in item and len(i) >= 2:  # 2個字以上的單詞才會判斷
                    product.append(item)
                    # print(i,item)

    # print("第二次",list(set(product))) #去掉重複

    return list(set(product))  # 如果找不到 回傳空字串


# 如果商品清單完全找不到的狀況
def get_category2(seg_list):
    path = 'nlp/other_word.txt'
    f = open(path, 'r', encoding='utf-8')
    items = f.read().split("\n")  # 線上類別集
    f.close()

    product = []

    # 模糊比對
    for i in seg_list:
        for item in items:
            if i in item and len(i) >= 2:  # 2個字以上的單詞才會判斷
                product.append(item)

    return list(set(product))


# m4a轉wav，檔名example.wav，重複會覆蓋
def m4a_to_wav(audio_path):
    mp4_song = AudioSegment.from_file(audio_path)
    mp4_song.export("speak.wav", format="wav")


if __name__ == '__main__':
    path = r"audio/_67936273.m4a"
    m4a_to_wav(path)  # 轉檔

    audio_path = 'speak.wav'
    sentence = speech_to_text(audio_path)

    print(sentence)
    seg_list = cut_word(sentence)  # return list word
    print("seg:", seg_list)
    get_category(seg_list)  # 找出商品名稱
    print(get_category2(seg_list))