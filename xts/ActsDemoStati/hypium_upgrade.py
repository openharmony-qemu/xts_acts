#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import json
import re
import argparse

def extract_test_cases_from_file(file_path):
    """从单个文件中提取测试用例名称"""
    test_cases = []
    
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            content = file.read()
            
        # 支持多种常见的测试用例命名模式
        # 匹配 @Test 或 @pytest.mark 或 @TestCase 等装饰器
        test_patterns = [
            r'@Test(?:\s*$\s*name\s*=\s*["\']([^"\']+)["\']\s*$)?',
            r'@pytest\.mark\.([a-zA-Z0-9_]+)',
            r'@TestCase\s*$\s*["\']([^"\']+)["\']\s*$',
            r'def\s+test_([a-zA-Z0-9_]+)\s*$',
            r'public\s+void\s+([a-zA-Z0-9_]+)\s*\(\s*$',
            r'function\s+([a-zA-Z0-9_]+)\s*$',
            r'it\s*\(\s*["\']([^"\']+)["\']\s*$',
            r'it\s*$\s*["\']([^"\']+)["\']\s*,',
            r'case\s+["\']([^"\']+)["\']',
            r'@Test\s+public\s+void\s+([a-zA-Z0-9_]+)\s*\(',
            r'@Test\s+public\s+void\s+([a-zA-Z0-9_]+)\s*\(\s*$',
        ]
        
        for pattern in test_patterns:
            matches = re.finditer(pattern, content, re.IGNORECASE)
            for match in matches:
                if len(match.groups()) > 0:
                    test_name = match.group(1)
                else:
                    test_name = match.group(0)
                test_cases.append({
                    'name': test_name,
                    'file': file_path,
                    'line': content[:match.start()].count('\n') + 1
                })
                
    except Exception as e:
        print(f"Error reading file {file_path}: {e}")
        
    return test_cases

def find_test_files(directory, extensions):
    """递归查找指定扩展名的文件"""
    test_files = []
    
    for root, dirs, files in os.walk(directory):
        for file in files:
            if any(file.endswith(ext) for ext in extensions):
                test_files.append(os.path.join(root, file))
                
    return test_files

def extract_all_test_cases(directory, extensions):
    """提取目录下所有文件中的测试用例"""
    all_test_cases = []
    test_files = find_test_files(directory, extensions)
    
    print(f"Found {len(test_files)} test files")
    
    for file_path in test_files:
        print(f"Processing: {file_path}")
        test_cases = extract_test_cases_from_file(file_path)
        all_test_cases.extend(test_cases)
        
    return all_test_cases

def save_to_json(test_cases, output_file):
    """将测试用例保存为JSON文件"""
    try:
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(test_cases, f, ensure_ascii=False, indent=2)
        print(f"Successfully saved {len(test_cases)} test cases to {output_file}")
    except Exception as e:
        print(f"Error saving to JSON file: {e}")

def main():
    parser = argparse.ArgumentParser(description='Extract test case names from files and save as JSON')
    parser.add_argument('-d', '--directory', default='.', help='Directory to search for test files (default: current directory)')
    parser.add_argument('-o', '--output', default='test_cases.json', help='Output JSON file name (default: test_cases.json)')
    parser.add_argument('-e', '--extensions', nargs='+', default=['.py', '.java', '.js', '.ts', '.cpp', '.c', '.cs'], 
                       help='File extensions to search for (default: .py .java .js .ts .cpp .c .cs)')
    
    args = parser.parse_args()
    
    print("Starting test case extraction...")
    print(f"Directory: {args.directory}")
    print(f"Extensions: {args.extensions}")
    
    # 提取所有测试用例
    test_cases = extract_all_test_cases(args.directory, args.extensions)
    
    # 保存到JSON文件
    save_to_json(test_cases, args.output)
    
    # 显示统计信息
    print(f"\nSummary:")
    print(f"Total test cases found: {len(test_cases)}")
    
    # 按文件分组显示
    file_groups = {}
    for case in test_cases:
        file_name = os.path.basename(case['file'])
        if file_name not in file_groups:
            file_groups[file_name] = []
        file_groups[file_name].append(case['name'])
    
    print(f"Files with test cases: {len(file_groups)}")
    for file_name, cases in file_groups.items():
        print(f"  {file_name}: {len(cases)} test cases")

if __name__ == '__main__':
    main()