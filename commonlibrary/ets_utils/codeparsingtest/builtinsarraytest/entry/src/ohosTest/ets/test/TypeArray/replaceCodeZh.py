import re
import argparse
from translate import Translator

def contains_chinese(text):
    """检查文本是否包含中文字符"""
    for char in text:
        if '\u4e00' <= char <= '\u9fff':
            return True
    return False

def translate_text(text, src='zh', dest='en'):
    """将文本从源语言翻译为目标语言"""
    if not text.strip():
        return text

    translator = Translator(from_lang=src, to_lang=dest)
    try:
        return translator.translate(text)
    except Exception as e:
        print(f"翻译错误: {e}, 文本: {text}")
        return text  # 翻译失败时返回原文本

def process_python_file(file_path, output_path=None):
    """处理Python文件，提取中文注释并翻译"""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    # 存储所有中文注释及其翻译
    comment_translations = []

    # 处理单行注释
    def translate_single_line_comment(match):
        comment_symbol = match.group(1)
        space = match.group(2)
        comment_text = match.group(3)
        if contains_chinese(comment_text):
            print(f"中文注释: {comment_text}")
            # 保存中文注释和翻译
            translated = translate_text(comment_text)
            comment_translations.append({
                'original': comment_text,
                'translated': translated,
                'type': 'single-line'
            })
            return f"{comment_symbol}{space}{translated}"
        return match.group(0)

    pattern_single = re.compile(r'(#)(\s*)(.*?)$', re.MULTILINE)
    content = pattern_single.sub(translate_single_line_comment, content)

    # 处理多行注释
    def translate_multi_line_comment(match):
        quote = match.group(1)
        comment_text = match.group(2)
        closing_quote = match.group(3)

        if contains_chinese(comment_text):
            lines = comment_text.split('\n')
            translated_lines = []
            for line in lines:
                if contains_chinese(line):
                    translated = translate_text(line)
                    comment_translations.append({
                        'original': line,
                        'translated': translated,
                        'type': 'multi-line'
                    })
                    translated_lines.append(translated)
                else:
                    translated_lines.append(line)
            translated_text = '\n'.join(translated_lines)
            return f"{quote}{translated_text}{closing_quote}"
        return match.group(0)

    pattern_multi = re.compile(r'("""|\'\'\')(.*?)\1', re.DOTALL)
    content = pattern_multi.sub(translate_multi_line_comment, content)

    # 输出中文注释及其翻译
    print("="*50)
    print("找到的中文注释及翻译:")
    print("="*50)
    for i, item in enumerate(comment_translations, 1):
        print(f"注释 {i} ({item['type']}):")
        print(f"中文: {item['original']}")
        print(f"英文: {item['translated']}")
        print("-"*50)

    # 保存处理后的文件
    if output_path:
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"\n处理完成，结果已保存到 {output_path}")
    else:
        return content

def main():
    parser = argparse.ArgumentParser(description='提取Python文件中的中文注释并翻译为英文')
    parser.add_argument('input_file', help='输入的Python文件路径')
    parser.add_argument('-o', '--output', help='输出文件路径，不指定则覆盖原文件')
    args = parser.parse_args()

    output_path = args.output if args.output else args.input_file
    process_python_file(args.input_file, output_path)

if __name__ == "__main__":
    main()
