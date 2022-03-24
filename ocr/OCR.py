import os
from google.cloud import vision





def pic_to_text(YOUR_PIC):
    client = vision.ImageAnnotatorClient()  # vision class
    with open(YOUR_PIC, 'rb') as image_file:
        content = image_file.read()
    image = vision.Image(content=content)

    response = client.text_detection(image=image)
    texts = response.text_annotations
    all_texts = ""
    for text in texts:
        all_texts += text.description
    all_texts = all_texts.replace("\n", "")  # 清除換行
    all_texts = all_texts.replace(" ", "")  # 清除空白
    print(all_texts)

    return all_texts


def get_element(texts):
    is_hazardous_additives=[]
    path = 'ocr/hazardous_additives.txt'
    f = open(path, 'r', encoding='utf-8')
    hazardous_additives = f.read().split("\n")# 危險添加物集
    f.close()



    for additives in hazardous_additives:
        if additives in texts:
            is_hazardous_additives.append(additives)
            # print(additives)
    # print(is_hazardous_additives)
    return is_hazardous_additives


if __name__ == '__main__':
    # key
    os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = "cfi102-cheris-dccfe0d2bfd1.json"
    YOUR_PIC = './ocr/test_images/LINE_ALBUM_2022224_220225_15.jpg'  # pic
    texts = pic_to_text(YOUR_PIC)  # 圖片轉文字
    print(get_element(texts))  # 找出危險添加物
