import json
import re
import xml.etree.ElementTree as ET
from openpyxl import Workbook, load_workbook


def parse_xml_to_json(file_path, output_file='output.json'):
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    start = content.index('<testsuites')
    root = ET.fromstring(content[start:])
    results = []
    for ts in root.findall('testsuite'):
        testcases = [{'name': tc.get('name'), 'time': float(tc.get('time'))} for tc in ts.findall('testcase')]
        results.append({'modulename': ts.get('modulename'), 'time': float(ts.get('time')), 'testcases': testcases})
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(results, f, ensure_ascii=False, indent=2)
    print(f"Done, {len(results)} testsuites -> {output_file}")


def clean_json(input_file, output_file):
    with open(input_file, 'r', encoding='utf-8') as f:
        data = json.load(f)
    json_str = json.dumps(data)
    json_str = re.sub(r'_static_', '_', json_str, flags=re.IGNORECASE)
    json_str = re.sub(r'static', '', json_str, flags=re.IGNORECASE)
    json_str = re.sub(r'(_static)', '', json_str, flags=re.IGNORECASE)
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(json.loads(json_str), f, indent=4, ensure_ascii=False)
    print(f"Cleaned JSON -> {output_file}")


def compare_test_cases(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        json_data = json.load(f)

    dyn_arr = []
    sta_dicts = {}

    for suite in json_data:
        modulename = suite['modulename']
        if 'static' in modulename.lower():
            for tc in suite['testcases']:
                if tc['time'] > 0.0:
                    clean_name = re.sub(r'static', '', modulename, flags=re.IGNORECASE)
                    key = f"{clean_name}.{tc['name']}:{tc['time']}"
                    sta_dicts[key] = f"{modulename}.{tc['name']}"
        else:
            for tc in suite['testcases']:
                if tc['time'] > 0.0:
                    dyn_arr.append(f"{modulename}.{tc['name']}:{tc['time']}")

    dyn_sta_arr = []
    all_cha_time = 0.0
    for sta_key in sta_dicts:
        first_part, second_part = sta_key.split(':', 1)
        for dyn_item in dyn_arr:
            if first_part in dyn_item:
                dyn_first, dyn_second = dyn_item.split(':', 1)
                diff = float(second_part) - float(dyn_second)
                if diff > 1.0:
                    all_cha_time += diff
                    dyn_sta_arr.append({
                        "静态用例名": sta_dicts[sta_key],
                        "静态用例执行时间": float(second_part),
                        "动态用例名": dyn_first,
                        "动态用例执行时间": float(dyn_second),
                        "执行时间差": diff
                    })
                break

    print(f"Found {len(dyn_sta_arr)} cases (diff > 1s), total diff: {all_cha_time}")
    return dyn_sta_arr, all_cha_time


def write_excel(dict_array, filename):
    if not dict_array:
        print("No data to write")
        return
    wb = Workbook()
    ws = wb.active
    headers = list(dict_array[0].keys())
    ws.append(headers)
    for item in dict_array:
        ws.append([item.get(h, "") for h in headers])
    wb.save(filename)
    print(f"Data written to {filename}")


def find_file_path(json_path, text_name):
    with open(json_path, 'r', encoding='utf-8') as f:
        file_paths = json.load(f)
    for file_path in file_paths:
        try:
            with open(file_path, 'r', encoding='utf-8') as f2:
                if text_name in f2.read():
                    return file_path
        except Exception:
            pass
    return ""


def enrich_excel(input_file, output_file, lookup_json='gn_files.json'):
    wb = load_workbook(filename=input_file)
    sheet = wb.active
    print(f"Processing: {input_file}")
    tmp_dict = {}
    for row in sheet.iter_rows(min_row=2, values_only=False):
        parts0 = row[1].value.split('.')[0]
        if parts0 in tmp_dict:
            row[0].value = f"{row[0].value}{tmp_dict[parts0]}" if row[0].value else tmp_dict[parts0]
        else:
            result = find_file_path(lookup_json, parts0)
            if result:
                parts = result.split('/')
                if len(parts) > 2:
                    res2 = parts[2]
                    tmp_dict[parts0] = res2
                    row[0].value = f"{row[0].value}{res2}" if row[0].value else res2
    wb.save(output_file)
    wb.close()
    print(f"Enriched Excel -> {output_file}")


if __name__ == "__main__":
    # 1. Parse XML test report to JSON
    parse_xml_to_json(r'./all_report.xml', 'output.json')
    # 2. Clean static naming from JSON
    clean_json('output.json', 'output_clean.json')
    # 3. Compare static vs dynamic test cases
    dyn_sta_arr, all_cha_time = compare_test_cases('output_clean.json')
    # 4. Write comparison results to Excel
    write_excel(dyn_sta_arr, "sample_output.xlsx")
    # 5. Enrich Excel with file path info
    enrich_excel('sample_output.xlsx', 'all_output.xlsx')
