import os
import json
import re
from collections import OrderedDict


all_ets_paths = []

def task_deduplication(ets_path):
    
    is_boooo = False
    out_dir = r"./"

    f123 = os.path.join(out_dir, "123.txt")
    f124 = os.path.join(out_dir, "124.json")
    f125 = os.path.join(out_dir, "125.json")
    f126 = os.path.join(out_dir, "126.txt")

    # ---------- 1. extract import ... from ... ----------
    with open(ets_path, "r", encoding="utf-8") as f:
        content = f.read()

    content = re.sub(r"/\*.*?\*/", "", content, flags=re.DOTALL)
    content = re.sub(r"//.*", "", content)

    imports = re.findall(
        r"import\s+(.*?)\s+from\s+['\"]([^'\"]+)['\"]",
        content,
        flags=re.DOTALL,
    )

    lines = []
    for value, key in imports:
        value = " ".join(value.split())
        value = value.strip().strip(",").strip()
        lines.append(f"import {value} from '{key}';")

    with open(f123, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")
    # print(f"[1] {len(lines)} imports -> 123.txt")

    # ---------- 2. parse into [{value, key}] -> 124.json ----------
    records = []
    for line in lines:
        m = re.match(r"^import\s+(.*?)\s+from\s+['\"]([^'\"]+)['\"];?\s*$", line.strip())
        if m:
            value = m.group(1).strip()
            key = m.group(2).strip()
            records.append({"value": value, "key": key})

    with open(f124, "w", encoding="utf-8") as f:
        json.dump(records, f, ensure_ascii=False, indent=2)
    # print(f"[2] {len(records)} records -> 124.json")

    # ---------- 3. deduplicate ----------
    seen = set()
    deduped = []
    needed_changes_bool = False
    for r in records:
        sig = (r["key"], r["value"])
        if sig not in seen:
            seen.add(sig)
            deduped.append(r)
        else:
            # print(f"Repeat data   == {sig}")
            needed_changes_bool = True

    with open(f124, "w", encoding="utf-8") as f:
        json.dump(deduped, f, ensure_ascii=False, indent=2)
    # print(f"[3] dedup {len(records)} -> {len(deduped)} -> 124.json")

    # ---------- 4. merge same key ----------
    by_key = OrderedDict()
    for r in deduped:
        res = by_key.setdefault(r["key"], []).append(r["value"])
    
    # print(f'-----------------------------01 {by_key} ')

    def parse_value(v):
        tmp_needed_changes_bool = False
        v = v.strip()
        v = re.sub(r"\s*,\s*", ",", v)
        v = re.sub(r"\s+", " ", v)
        v = v.replace("\uff0c", ",")
        v = v.replace("'", "")
        parts = [p.strip() for p in v.split(",")]
        parts = [p for p in parts if p]
        v = ", ".join(parts)

        default_part = None
        brace_part = ""
        brace_m = re.search(r"(\{.*?\})", v)
        if brace_m:
            before = v[:brace_m.start()].strip().strip(",").strip()
            after = v[brace_m.end():].strip().strip(",").strip()
            brace_content = brace_m.group(1)
            if before:
                default_part = before
            if after:
                if default_part:
                    default_part = default_part + ", " + after
                else:
                    default_part = after
            brace_part = brace_content
        else:
            default_part = v

        named_set = set()
        named_ordered = []
        if brace_part:
            inner = brace_part.strip("{}").strip()
            if inner:
                items = [x.strip() for x in inner.split(",")]
                items = [x for x in items if x]
                for item in items:
                    if item not in named_set:
                        named_set.add(item)
                        named_ordered.append(item)
                    else:
                        tmp_needed_changes_bool = True

        return default_part, named_ordered, tmp_needed_changes_bool

    merged_result = []
    for key, values in by_key.items():
        default_parts = []
        all_named = OrderedDict()

        for v in values:
            # print('--------------------------------------01')
            # print(len(v))
            default_part, named_items, tmp_needed_changes_bool = parse_value(v)
            # print(default_part)
            # print(named_items)
            needed_changes_bool = tmp_needed_changes_bool or needed_changes_bool
            # print(f'------------------------{needed_changes_bool}')
            if default_part:
                for part in default_part.split(","):
                    part = part.strip()
                    if part and part not in default_parts:
                        default_parts.append(part)
                    else:
                        needed_changes_bool = True
            for item in named_items:
                if item not in all_named:
                    all_named[item] = None
                else:
                    needed_changes_bool = True

        merged = ""
        if default_parts:
            merged = ", ".join(default_parts)
            # if len(default_parts) > 1 or "type" in default_parts:
            if len(default_parts) > 1 or "type" in merged or  "as" in merged:
                # print(default_parts)
                is_boooo = True
        if all_named:
            # print(all_named)
            brace_str = ", ".join(all_named.keys())
            if merged:
                # print(f'---------------------------111------- {merged}')
                if 'type' in merged:
                    merged += f" {{ {brace_str} }}"
                else:
                    merged += f", {{ {brace_str} }}"
            else:
                merged = f"{{ {brace_str} }}"

        merged_result.append({"value": merged, "key": key})

    with open(f125, "w", encoding="utf-8") as f:
        json.dump(merged_result, f, ensure_ascii=False, indent=2, sort_keys=False)
    print(f"[4] merged {len(merged_result)} records -> 125.json")

    for r in merged_result:
        print(f"     key={r['key']}  value={r['value']}")
    
    if  needed_changes_bool:
        
        # ---------- 5. convert 125.json -> import statements -> 126.txt ----------
        import_lines = []
        for item in merged_result:
            value = item["value"]
            key = item["key"]
            import_lines.append(f"import {value} from '{key}';")

        with open(f126, "w", encoding="utf-8") as f:
            f.write("\n".join(import_lines) + "\n")
        # print(f"[5] {len(import_lines)} import statements -> 126.txt")

        # ---------- 6. replace imports in original .ets file ----------
        with open(ets_path, "r", encoding="utf-8") as f:
            original = f.read()

        import_blocks = list(re.finditer(
            r"import\s+.*?from\s+['\"][^'\"]+['\"]\s*;?\s*",
            original,
            flags=re.DOTALL,
        ))
        
        if import_blocks:
            start = import_blocks[0].start()
            end = import_blocks[-1].end()
            before = original[:start]
            after = original[end:]
            new_imports = "\n".join(import_lines) + "\n"
            result_content = before + new_imports + after.lstrip("\n")
            
            if is_boooo:
                pass
                #  with open(ets_path, "w", encoding="utf-8") as f:
                #     print(new_imports)
                #     f.write(result_content)
                all_ets_paths.append(ets_path)
                print('11111111111111111111111111111111111')
            else:
                print('2222222222222222222222222222222222222222')
                with open(ets_path, "w", encoding="utf-8") as f:
                    print(new_imports)
                    f.write(result_content)
                    print(f"[6] Replaced path {ets_path}")
                    
    with open(f124, 'r', encoding='utf-8') as file1, \
             open(f125, 'r', encoding='utf-8') as file2:
            
            data1 = json.load(file1)
            data2 = json.load(file2)
            # if data1 == data2 and needed_changes_bool == False:
            #if compare_dict_arrays(data1,data2) and needed_changes_bool == False:   

    is_boooo = False     
   
    return needed_changes_bool


def remove_spaces_in_dict(d):
    """递归去除字典中所有字符串值的空格"""
    for key, value in d.items():
        if isinstance(value, str):
            d[key] = remove_comma_if_second_last(value.replace(" ", ""))  # 去除字符串中的空格
        elif isinstance(value, dict):
            remove_spaces_in_dict(value)  # 递归处理嵌套字典
        elif isinstance(value, list):
            for i in range(len(value)):
                if isinstance(value[i], str):
                    value[i] = value[i].replace(" ", "")  # 去除列表中字符串的空格
                elif isinstance(value[i], dict):
                    remove_spaces_in_dict(value[i])  # 递归处理列表中的字典

def remove_comma_if_second_last(s):
    if len(s) >= 2 and s[-2] == ',':
        result = s[:len(s)-2] + s[-1]
        return result
    else:
        return s 

def compare_dict_arrays(arr1, arr2):
    """对比两个字典数组是否相等（去除空格后）"""
    # 深拷贝字典数组，避免修改原数据
    from copy import deepcopy
    arr1_cleaned = deepcopy(arr1)
    arr2_cleaned = deepcopy(arr2)

    # 去除所有字典中的空格
    for d in arr1_cleaned:
        remove_spaces_in_dict(d)
    for d in arr2_cleaned:
        remove_spaces_in_dict(d)

    # 对比清理后的数组
    return arr1_cleaned== arr2_cleaned

def task_01(dir_path):
    """
    遍历文件夹，打印所有.ets和.ts文件的路径
    :param root_dir: 要遍历的根目录
    """
    needed_changes = set()
    for root, dirs, files in os.walk(dir_path):
        for file in files:
            if file.endswith(('.ets', '.ts')):  # 检查.ets或.ts文件
                file_path = os.path.join(root, file)
                print(file_path)
                if task_deduplication(file_path):
                  needed_changes.add(file_path)
            
    return needed_changes

def find_dirs_with_static_suite(root_dir):
    """
    在 root_dir 下查找所有包含 'static_suite' 的 BUILD.gn 文件，
    并返回这些文件所在的唯一目录列表。
    """
    if not os.path.isdir(root_dir):
        # print(f"错误: 目录 '{root_dir}' 不存在或不是目录。")
        return []
    matching_dirs = {}
    # 使用 os.walk 遍历目录
    for dirpath, dirnames, filenames in os.walk(root_dir):
        if 'BUILD.gn' in filenames:
            file_path = os.path.join(dirpath, 'BUILD.gn')
            try:
                with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                    content = f.read()
                    if 'static_suite' in content:
                        res = task_01(dirpath)
                        if res:
                            matching_dirs[dirpath] = list(res)
            
            except Exception as e:
                # print(f"警告: 无法读取文件 {file_path}: {e}")
                pass

    return matching_dirs

def delete_specific_files():
    """
    删除当前文件夹下的指定文件
    """
    files_to_delete = ['./123.txt', './124.json', './125.json', './126.txt']
    deleted_count = 0
    
    for filename in files_to_delete:
        # try:
            os.remove(filename)
            # print(f"已删除: {filename}")
            deleted_count += 1
        # except FileNotFoundError:
            # print(f"文件不存在: {filename}")
        # except Exception as e:
            # print(f"删除失败 {filename}: {e}")
    
    # print(f"总共删除了 {deleted_count} 个文件")

if __name__ == '__main__':
    res = find_dirs_with_static_suite('../titi/xts_acts')
    # delete_specific_files()
    with open('data.json', 'w', encoding='utf-8') as f:
        json.dump(res, f, ensure_ascii=False, indent=4)

    with open('default_data.json', 'w', encoding='utf-8') as f:
        json.dump(all_ets_paths, f, ensure_ascii=False, indent=4)
    wb = Workbook()
    ws = wb.active

    # 写入数据
    row = 1
    for key, values in res.items():
        # 写入 Key 到第一列
        ws.cell(row=row, column=1, value=key)
        
        # 合并 Key 的行
        if len(values) > 1:
            ws.merge_cells(start_row=row, end_row=row + len(values) - 1, start_column=1, end_column=1)
        
        # 写入 Value 到第二列
        for i, value in enumerate(values):
            ws.cell(row=row + i, column=2, value=value)
        
        # 调整行数
        row += len(values)

    # 设置单元格对齐方式
    for cell in ws['A']:
        cell.alignment = Alignment(horizontal='center', vertical='center')
    for cell in ws['B']:
        cell.alignment = Alignment(horizontal='center', vertical='center')

    # 自动调整列宽
    ws.column_dimensions[get_column_letter(1)].width = 15
    ws.column_dimensions[get_column_letter(2)].width = 15

    # 保存 Excel 文件
    wb.save("./output.xlsx")


