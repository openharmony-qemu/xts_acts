import os
import json
import re
import subprocess
import shlex
# Task 1: Replace patterns and record modified files

def replace_path_with_sed(file_path):
    """
    使用 sed 命令替换文件中的路径
    :param file_path: 目标文件路径
    """
    if not os.path.exists(file_path):
        print(f"文件不存在: {file_path}")
        return
    
    if not os.access(file_path, os.R_OK) or not os.access(file_path, os.W_OK):
        print(f"文件权限不足: {file_path}")
        return
    
    patterns = [
        '../../../../../../../../hypium/index.ets',
        '../../../../../../../hypium/index.ets',
        '../../../../../../hypium/index.ets',
        '../../../../../hypium/index.ets',
        '../../../../hypium/index.ets',
        '../../../hypium/index.ets',
        '../../../../../../../../hypium/index',
        '../../../../../../../hypium/index',
        '../../../../../../hypium/index',
        '../../../../../hypium/index',
        '../../../../hypium/index',
        '../../../hypium/index',
        '../../../../../../../hypium/hypium',
        '../../../../../../hypium/hypium',
        '../../../../../hypium/hypium',
        '../../../../hypium/hypium',
        '../../../hypium/hypium',
        '../../../../../../../hypium',
        '../../../../../../hypium',
        '../../../../../hypium',
        '../../../../hypium',
        '../../../hypium',
    ]

    try:
        file_path_escaped = shlex.quote(file_path)
        print(file_path_escaped)

        for p in patterns:
            sed_script = f"s|{p}|@ohos/hypium/src/main/indexStatic|g"
            sed_command = ["sed", "-i", sed_script, file_path_escaped]
            subprocess.run(sed_command, check=True)
            print(f"已处理模式: {p}")
            print(f"处理后的文件: {file_path}")
    except subprocess.CalledProcessError as e:
        print(f"路径替换失败: {e}")

def task_01(dir_path):
    # patterns = [
    #     '../../../../../../../../hypium/index',
    #     '../../../../../../../hypium/index',
    #     '../../../../../../hypium/index',
    #     '../../../../../hypium/index',
    #     '../../../../hypium/index',
    #     '../../../hypium/index',
    #     '../../../../../../hypium/hypium',
    #     '../../../../../hypium/hypium',
    #     '../../../../hypium/hypium',
    #     '../../../hypium/hypium',
    #     '../../../../../hypium',
    #     '../../../../hypium',
    #     '../../../hypium',
    # ]
    # replacement = '@ohos/hypium/src/main/indexStatic'
    task1_result = []
    for root_dir, dirs, files in os.walk(dir_path):
        for file in files:
            file_path = os.path.join(root_dir, file)
            replace_path_with_sed(file_path)
            task1_result.append(file_path)
            # try:
            #     with open(file_path, "r", encoding="utf-8", errors="ignore") as f:
            #         content = f.read()
            #     original = content
            #     for p in patterns:
            #         content = content.replace(p, replacement)
            #     if content != original:
            #         with open(file_path, "w", encoding="utf-8", errors="ignore") as f:
            #             f.write(content)
            #             print(f"Task 1: Modified {file_path} ")
            #         task1_result.append(file_path)
            # except Exception:
            #     continue
    return task1_result


# Task 2: Find oh-package.json5 files with 'tatic\oh-package.json5' in path
# and add @ohos/hypium-binary dependency
def task_021(dir_path):
    new_config_part = {
        "dependencies": {
            "@ohos/hypium-binary": "1.0.28-rc1"
        }
    }
    file_path = os.path.join(dir_path, "oh-package.json5")
    try:
        with open(file_path, 'r', encoding='utf-8', newline='') as f:
            content = f.read()
        config = None
        # 尝试使用 json5 解析，如果失败则尝试标准 json
        try:
            import json5
            config = json5.loads(content)
        except ImportError:
            # 如果没装 json5，尝试标准 json，但要注意 JSON5 注释会导致报错
            try:
                config = json.loads(content)
            except json.JSONDecodeError:
                print(f"警告: 文件 {file_path} 包含 JSON5 注释，请安装 json5 库: pip install json5")
                return False
        if config is None:
            return False
        # 合并配置
        # 注意：这里是将新的 buildOption 合并到现有配置中。
        # 如果原文件已有 buildOption，下面的逻辑会保留原文件中的其他字段，并更新 runtimeOnly.packages。
        if "dependencies" not in config:
            config["dependencies"] = {}
        # 设置 packages 列表
        # 如果需要追加而不是替换，可以使用: 
        # existing_pkgs = config["buildOption"]["arkOptions"]["runtimeOnly"].get("packages", [])
        # if "@ohos/hypium-binary" not in existing_pkgs:
        #     existing_pkgs.append("@ohos/hypium-binary")
        #     config["buildOption"]["arkOptions"]["runtimeOnly"]["packages"] = existing_pkgs
        # 这里采用直接赋值的方式，确保只包含 hypium，或者你可以按需修改为追加逻辑
        config["dependencies"]["@ohos/hypium-binary"] = new_config_part["dependencies"]["@ohos/hypium-binary"]
        # config["devDependencies"] = {}

        new_content = extract_header_before_first_brace(content) + json.dumps(config, ensure_ascii=False, indent=2)
        
        # 写回文件
        with open(file_path, 'w', encoding='utf-8', newline='') as f:
            f.write(new_content)
        print(f"Update Task 02 {file_path} ")  

        return True
        
    except Exception as e:
        print(f"Error Task 02 {file_path} --------: {e}")
        return False

# # 建议安装 json5 库以支持带注释的 JSON5 文件: pip install json5
# # 如果环境中没有 json5，代码会自动降级使用标准 json 模块，但可能会忽略注释或报错

def task_03(dir_path):
    new_config_part = {
        "buildOption": {
            "arkOptions": {
                "runtimeOnly": {
                    "packages": [
                        "@ohos/hypium-binary"
                    ]
                }
            }
        }
    }
    file_path = os.path.join(dir_path, 'entry/build-profile.json5')
    try:
        with open(file_path, 'r', encoding='utf-8', newline='') as f:
            content = f.read()
        config = None
        # 尝试使用 json5 解析，如果失败则尝试标准 json
        try:
            import json5
            config = json5.loads(content)
        except ImportError:
            # 如果没装 json5，尝试标准 json，但要注意 JSON5 注释会导致报错
            try:
                config = json.loads(content)
            except json.JSONDecodeError:
                print(f"警告: 文件 {file_path} 包含 JSON5 注释，请安装 json5 库: pip install json5")
                return False
        if config is None:
            return False
        # 合并配置
        # 注意：这里是将新的 buildOption 合并到现有配置中。
        # 如果原文件已有 buildOption，下面的逻辑会保留原文件中的其他字段，并更新 runtimeOnly.packages。
        if "buildOption" not in config:
            config["buildOption"] = {}
        # 确保 arkOptions 存在
        if "arkOptions" not in config["buildOption"]:
            config["buildOption"]["arkOptions"] = {}
        # 确保 runtimeOnly 存在
        if "runtimeOnly" not in config["buildOption"]["arkOptions"]:
            config["buildOption"]["arkOptions"]["runtimeOnly"] = {}
        # if "resOptions" not in config["buildOption"]:
        #     config["buildOption"]["resOptions"] = {}
        # if "copyCodeResource" not in config["buildOption"]["resOptions"]:
        #     config["buildOption"]["resOptions"]["copyCodeResource"] = {}
        # 如果需要追加而不是替换，可以使用: 
        # existing_pkgs = config["buildOption"]["arkOptions"]["runtimeOnly"].get("packages", [])
        # if "@ohos/hypium-binary" not in existing_pkgs:
        #     existing_pkgs.append("@ohos/hypium-binary")
        #     config["buildOption"]["arkOptions"]["runtimeOnly"]["packages"] = existing_pkgs
        # 这里采用直接赋值的方式，确保只包含 hypium，或者你可以按需修改为追加逻辑
        config["buildOption"]["arkOptions"]["runtimeOnly"]["packages"] = new_config_part["buildOption"]["arkOptions"]["runtimeOnly"]["packages"]
        # config["buildOption"]["resOptions"]["copyCodeResource"]["enable"] = False

        new_content = extract_header_before_first_brace(content) + json.dumps(config, ensure_ascii=False, indent=2)
        
        # 写回文件
        with open(file_path, 'w', encoding='utf-8', newline='') as f:
            f.write(new_content)
        print(f"Update Task 03 {file_path} ")  

        return True
        
    except Exception as e:
        print(f"Error Task 03 {file_path} --------: {e}")
        return False

# 注意：如果环境中没有安装 json5 库，请运行 pip install json5
# 为了保持最大的兼容性和对原始文件格式（包括注释）的最小干扰，
# 这里推荐使用正则表达式进行精准的文本替换，而不是完全解析再序列化。
# 因为 json5.dumps 可能会改变原有的缩进风格或移除某些非标准但合法的 JSON5 特性。

def task_04(dir_path):
    """
    读取文件，查找 compatibleSdkVersion，如果值 <= 22，则将其改为 "22"（字符串）。
    如果值 > 22，则保持不变。
    """
    file_path = os.path.join(dir_path, 'build-profile.json5')
    try:
        with open(file_path, 'r', encoding='utf-8', newline='') as f:
            content = f.read()
    except Exception as e:
        print(f"Error Task 04  {file_path}: {e}")
        return False
    # 定义正则表达式来匹配 compatibleSdkVersion 及其值
    # 兼容情况：
    # "compatibleSdkVersion": 21
    # "compatibleSdkVersion": "21"
    # "compatibleSdkVersion" : 21  (有空格)
    # 兼容注释的情况，例如 "compatibleSdkVersion": 21 // comment
    # 这个正则表达式匹配:
    # 1. "compatibleSdkVersion" (键名)
    # 2. 可选的空白字符和冒号
    # 3. 捕获组：值部分（数字或字符串）
    
    pattern = r'("compatibleSdkVersion"\s*:\s*)(["\']?)(\d+)(["\']?)'
    def replace_value(match):
        prefix = match.group(1)  # "compatibleSdkVersion": 
        quote_before = match.group(2) # 值前面的引号
        value_str = match.group(3)   # 数字部分，如 "21"
        quote_after = match.group(4) # 值后面的引号
        
        try:
            value_int = int(value_str)
        except ValueError:
            return match.group(0) # 如果不是数字，原样返回
        if value_int > 22:
            # 大于22，不变动
            return match.group(0)
        else:
            # 小于等于22，改为 "22" (字符串)
            # 注意：题目要求改成 "compatibleSdkVersion": "22"，即带引号的字符串
            return f'{prefix}"22"'
    new_content = re.sub(pattern, replace_value, content)
    if new_content != content:
        try:
            with open(file_path, 'w', encoding='utf-8', newline='') as f:
                f.write(new_content)
            print(f"Update Task 04: {file_path}")
            return True
        except Exception as e:
            print(f"Error Task 04 {file_path}: {e}")
            return False
    else:
        return False


def extract_header_before_first_brace(content):
    lines = content.splitlines()
    result = []
    found_brace = False

    for line in lines:
        # 检查是否是第一个 { 所在的行，并且不是注释
        if not found_brace and line.strip().startswith("{") and not line.strip().startswith("//"):
            found_brace = True
            break
        # 如果不是 { 所在的行，或者 { 所在的行是注释，则添加到结果中
        result.append(line)

    return "\n".join(result) + "\n"

def find_dirs_with_static_suite(root_dir):
    """
    在 root_dir 下查找所有包含 'static_suite' 的 BUILD.gn 文件，
    并返回这些文件所在的唯一目录列表。
    """
    if not os.path.isdir(root_dir):
        print(f"错误: 目录 '{root_dir}' 不存在或不是目录。")
        return []
    matching_dirs = set()
    # 使用 os.walk 遍历目录
    for dirpath, dirnames, filenames in os.walk(root_dir):
        if 'BUILD.gn' in filenames:
            if contains_any_substring(dirpath):
                # print(dirpath)
                pass
            else:
                # print(dirpath)
                file_path = os.path.join(dirpath, 'BUILD.gn')
                try:
                    with open(file_path, 'r', encoding='utf-8', newline='', errors='ignore') as f:
                        content = f.read()
                        if 'static_suite' in content:
                            task_01(dirpath)
                            task_021(dirpath)
                            task_03(dirpath)
                            task_04(dirpath)
                            matching_dirs.add(dirpath)
                except Exception as e:
                    print(f"警告: 无法读取文件 {file_path}: {e}")
           

    for item in matching_dirs:
      print(item)
    print(f"--------------- {len(matching_dirs)}")
    return sorted(list(matching_dirs))

def contains_any_substring(main_string):
    # substrings = [
    # '/web/','/arkui/','/updater/','/notification/','/multimedia/','/ability/','/arlcompiler/','/commonlibrary/',
    # 'bundlemanager/bundle_standard/bundlemanager/actsbmsorientationetsteststatic',
    # 'bundlemanager/bundle_standard/bundlemanager/actsbundlemanagerstageteststatic',
    # 'applications/intelligentScene_ets_static',
    # 'bundlemanager/bundle_standard/bundlemanager/actsbundlemanagermultiAppmodetype1teststatic',
    # 'bundlemanager/bundle_standard/bundlemanager/actsbundlemanagermultiAppmodetype2teststatic',
    # 'bundlemanager/bundle_standard/bundlemanager/actsbundlemanagertestcaseAdditionstatic',
    # 'bundlemanager/bundle_standard/bundlemanager/actsbundlemanagertestcaseGetWantSyncstatic',
    # 'hiviewdfx/hiRetrievalteststatic',
    # 'hiviewdfx/errormangerteststatic',
    # 'multimodalinput/multimodalinput_ets_hvigor/Pointer/PointerTest_static',
    # 'security/certificate_framework/js_api_test_oh61_static',
    # 'sensors/miscdevice_standardStatic',
    # 'sensors/ace_sensor_standard_static',
    # 'telephony/telephone/ActsTelephonyVCardManagerTestStatic',
    # 'useriam/user_auth_icon_static',]
    # for sub in substrings:
    #     if sub in main_string:
    #         return True
    return False


if __name__ == '__main__':
    find_dirs_with_static_suite('./acts')

