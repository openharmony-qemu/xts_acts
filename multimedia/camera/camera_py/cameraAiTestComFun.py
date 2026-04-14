# -*- coding: utf-8 -*-
import time
import requests
import base64
from PIL import Image
import pillow_heif
import logging
import datetime
import os
import subprocess
import cv2
import re
import sqlite3

pillow_heif.register_heif_opener()
def heif_to_jpg_pillow(heif_path, jpg_path):
    with Image.open(heif_path) as im:
        im.convert("RGB").save(jpg_path, "JPEG")

BASE_URL = "http://10.91.22.178:8000/v1"
MODEL = "qwen"

# 构造 system_msg，强调输出风格
SYSTEM_PROMPT = (
    "你是一个人物图像理解与描述生成器。"
    "请根据输入的图像生成细腻、真实、优雅的中文描述，且不要提及这个人的姓名，就直接描述这幅图像"
    "包括人物的性别、表情、姿态、氛围、场景等。"
    "输出必须是自然语言描述，控制在220字以内，不要包含任何额外说明或 Markdown。"
)

def chat_with_llm(image_path):
    headers = {
        "Content-Type": "application/json",
    }

    # 将图像转为 base64
    with open(image_path, "rb") as f:
        image_bytes = f.read()
    image_base64 = base64.b64encode(image_bytes).decode("utf-8")

    payload = {
        "model": MODEL,
        "messages": [
            {"role": "system", "content": SYSTEM_PROMPT},
            {
                "role": "user",
                "content": [
                    {"type": "text", "text": """检测这个图片是否是绿图、花图、黑图和白图,只需要回答这是x图,这不是x图就行,不需要其他的回复,绿图、花图、黑图、白图的检测规则有两套，两套规则都满足的情况下才能证明这个图片是绿图或者花图或者黑图或者白图，两套规则如下：
                            规则1：{
                                1. 黑图
                                成像特征(以下两个个特征都要满足才是黑图)：
                                - 全图无亮度，像素值全为0
                                - 图像呈现全黑的视觉效果
                                2. 白图
                                成像特征(以下两个特征都要满足才是白图)：
                                - 整体亮度极高，像素值全为255
                                - 图像呈现全白的视觉效果
                                3. 绿图
                                成像特征(以下三个特征都要满足才是绿图)：
                                - 图像整体呈现明显的绿色色调
                                - 绿色通道数值异常偏高，红色和蓝色通道数值偏低
                                - 可能存在颜色通道不平衡或绿色通道信号异常
                                4. 花图
                                成像特征(以下三个特征都要满足才是花图)：
                                - 图像出现色彩失真、条纹、色块或马赛克等异常纹理
                                - 可能存在水平或垂直条纹、色彩断裂、伪彩等现象
                                }
                            规则2：{
                                1. 黑图特征(以下四个特征都要满足才是黑图)：
                                - 整体亮度小于1（通常约0）
                                - RGB各通道均值均小于1
                                - 对比度小于1
                                - 低亮度像素(低亮度像素表示各像素点RGB值小于1)占比大于99%
                                2. 白图特征(以下四个特征都要满足才是白图)：
                                - 整体亮度大于250（通常约255）
                                - RGB各通道均值均大于250
                                - 对比度小于1
                                - 高亮度像素(高亮度像素表示各像素点RGB值大于250)占比大于99%
                                3. 绿图特征(以下四个特征都要满足才是绿图)：
                                - 整体亮度在 40-125 之间
                                - G通道均值显著高于R和B（G大于80，R小于50，B小于50）
                                - G通道与R/B通道差异大于50
                                - 饱和度较高（饱和度大于150）

                                判断流程：
                                步骤1：判断亮度异常
                                - 若亮度 < 1 → 倾向于黑图
                                - 若亮度 > 250 → 倾向于白图
                                - 否则进入步骤2
                                步骤2：判断颜色偏向
                                - 若 G通道 > R通道+50 且 G通道 > B通道+50 → 倾向于绿图
                                - 若 RGB通道最大值与最小值差异 > 60 → 倾向于花图
                                - 否则倾向于正常图片
                                步骤3：结合对比度和饱和度验证
                                - 低对比度(< 1) + 低饱和度(< 2) → 确认为黑图或白图
                                - 高对比度(> 64) + 高饱和度(> 100) → 确认为花图
                                - 高饱和度(> 150) + G通道主导 → 确认为绿图
                                }

                            另外的要求：如果检测出这个图片是绿图或者花图或者黑图或者白图，那需要再重新检测2次，如果三次结果中有两次都是绿图或者花图或者黑图或者白图，那这个图片就是绿图或者花图或者黑图或者白图，否则不是"""
                     },
                    {"type": "image_url", "image_url": {"url": f"data:image/jpeg;base64,{image_base64}"}}
                ]
            }
        ]
    }

    url = f"{BASE_URL}/chat/completions"
    try:
        response = requests.post(url, headers=headers, json=payload, timeout=60, proxies={"http": None, "https": None})
        response.raise_for_status()
        result = response.json()
        return result["choices"][0]["message"]["content"]
    except Exception as e:
        return f"Error: {e}"


def get_logger():
    """
    #====================================================================================
    #   @Func           :  获取日志对象
    #   @return path    :  日志对象
    #===================================================================================
    """
    # 创建日志记录器
    logger_obj = logging.getLogger('camera')
    logger_obj.setLevel(logging.INFO)  # 设置日志记录器的级别

    # 创建文件处理器
    file_handler = logging.FileHandler(
        '{time}.log'.format(time=datetime.datetime.now().strftime('%Y-%m-%d_%H-%M-%S')), encoding='utf-8')
    file_handler.setLevel(logging.INFO)  # 设置文件处理器的级别

    # # 创建控制台处理器
    # stream_handler = logging.StreamHandler()
    # stream_handler.setLevel(logging.INFO)  # 设置控制的日志的级别

    # 创建日志格式器
    formatter = logging.Formatter('%(asctime)s [%(levelname)s] %(message)s')
    file_handler.setFormatter(formatter)
    # stream_handler.setFormatter(formatter)

    # 将处理器添加到记录器
    logger_obj.addHandler(file_handler)
    # logger_obj.addHandler(stream_handler)
    return logger_obj


logger = get_logger()

def getMediaLibrary():
    cmd = f'hdc file recv /data/app/el2/100/database/com.ohos.medialibrary.medialibrarydata/rdb/media_library.db'
    subprocess.run(['powershell', '-Command', cmd], capture_output=True, text=True, encoding='utf-8')

def getMediaFileFromMediaLibrary():
    getMediaLibrary()

    if os.path.exists('./media_library.db'):
        createDirectory('mediaDir')
        conn = sqlite3.connect('media_library.db')
        cursor = conn.cursor()

        cursor.execute("SELECT display_name, data FROM Photos")
        rows = cursor.fetchall()

        for row in rows:
            display_name, data = row
            if ('Video' in display_name or 'Photo' in display_name) and 'cloud/files' in data:
                file_Path = data.replace("cloud/files", "cloud/100/files", 1)
                cmd = f'hdc file recv {file_Path} mediaDir'
                subprocess.run(['powershell', '-Command', cmd], capture_output=True, text=True, encoding='utf-8')
                tail = file_Path.rsplit('/', 1)[-1]
                src_Path = './mediaDir/' + tail
                dst_Path = './mediaDir/' + display_name
                logger.info('src_Path is ' + src_Path)
                logger.info('dst_Path is ' + dst_Path)
                os.rename(src_Path, dst_Path)
        conn.close()

pillow_heif.register_heif_opener()
def heif_to_jpg_pillow(heif_path, jpg_path):
    with Image.open(heif_path) as im:
        im.convert("RGB").save(jpg_path, "JPEG")

def find_files(directory):
    for root, dirs, files in os.walk(directory):
        for file in files:
            yield os.path.join(root, file)


def check_video(video_path: str):
    """
    #====================================================================================
    #   @Func               :  检测视频是否有绿图、坏图、白图、花图、黑图
    #   @path               :  视频路径
    #   @return             :  检测结果。字典类型的数据，包括code和msg两个字段
    #====================================================================================
    """
    logger.info(f"开始检测视频：{video_path}")
    # 定义返回数据
    check_result = {
        "code": 0,
        "msg": "视频正常"
    }
    # 获取视频文件所在的目录
    video_name = video_path.split("/")[-1].split(".")[0]
    video_dir = os.path.join(os.path.dirname(video_path), video_name)
    # 拆解视频为一帧一帧的图片
    images_dir = video_to_images(video_path, video_dir)
    # 检测每一帧图片
    for img in os.listdir(images_dir):
        img_path = os.path.join(images_dir, img)
        res = check_image(img_path)
        if res["code"] == 1:
            data = {"code": 1, "msg": f"{res['msg']}"}
            logger.error(f"AI检测结果：{data}")
            return data
        time.sleep(5)
    print(f"AI检测结果：{check_result}")
    return check_result

def createDirectory(path):
    """
    #====================================================================================
    #   @Func          :  新建文件夹，如果文件夹存在，则跳过
    #   @param path    :  文件的路径
    #===================================================================================
    """
    os.makedirs(path, exist_ok=True)

def video_to_images(video_path, output_folder, frame_interval=30):
    """
    #====================================================================================
    #   @Func               :  将视频拆解为一帧一帧的图片
    #   @video_path         :  视频路径
    #   @output_folder      :  输出文件夹
    #   @frame_interval     :  抽帧间隔,默认每隔30帧抽取一张图片
    #====================================================================================
    """
    videoDisplayName = ''
    videoDisplayName = video_path.split('\\')[-1].split('.')[0]
    # 创建输出文件夹
    createDirectory(output_folder)
    # 打开视频文件
    cap = cv2.VideoCapture(video_path)
    # 检查是否成功打开
    if not cap.isOpened():
        logger.error("无法打开视频文件")
        return

    frame_count = 0
    image_count = 0
    while True:
        # 读取一帧
        ret, frame = cap.read()
        # 抽帧，每隔30帧抽一次
        if frame_count % frame_interval != 0:
            frame_count += 1
            continue
        # 如果读取失败（视频结束），退出循环
        if not ret:
            break
        # 保存当前帧为图片
        image_path = os.path.join(output_folder, f"{videoDisplayName}_frame_{frame_count:04d}.jpg")
        cv2.imwrite(image_path, frame)
        image_count += 1
        frame_count += 1
    # 释放资源
    cap.release()
    logger.info(f"共提取了 {image_count} 帧图片，保存在 {output_folder} 文件夹中。")
    return output_folder

def check_image(path: str):
    """
    #====================================================================================
    #   @Func               :  检测图片是否为绿图、坏图、白图、花图、黑图
    #   @path               :  图片路径
    #   @return             :  检测结果。字典类型的数据，包括code和msg两个字段
    #====================================================================================
    """
    image_format = path.split(".")[-1]
    if image_format.lower() == "heif":
        heif_to_jpg_pillow(path, (path.rsplit('.', 1)[0]) + '.jpg')
        path = path.replace(f".{image_format}", ".jpg")
        logger.info(f"转格式为：{path}")
    check_result = {
        "code": 0,
        "msg": "图片正常"
    }
    desc = chat_with_llm(path)
    logger.info(f"图片路径：{path}")
    logger.info(f"AI检测结果：{desc}")
    if "这是" in desc or "图" not in desc:
        check_result["code"] = 1
        if "这是" in desc:
            match = re.search(r'这是(\w{2})', desc)
            check_result["msg"] = f"{match.group(1)}： {path}"
        else:
            check_result["msg"] = f"未知错误： {path}, 需要人工校验"
    return check_result