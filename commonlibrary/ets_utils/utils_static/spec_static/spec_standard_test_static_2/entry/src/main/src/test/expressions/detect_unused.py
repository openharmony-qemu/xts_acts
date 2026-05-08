import os
import re
from collections import defaultdict

def find_ets_files(root):
    result = []
    for dirpath, dirnames, filenames in os.walk(root):
        for f in filenames:
            if f.endswith('.ets'):
                result.append(os.path.join(dirpath, f))
    return sorted(result)

def find_matching_brace(text, start):
    count = 0
    i = start
    while i < len(text):
        if text[i] == '{':
            count += 1
        elif text[i] == '}':
            count -= 1
            if count == 0:
                return i
        i += 1
    return -1

def extract_definitions_and_test(lines):
    test_start = None
    for i, line in enumerate(lines):
        if re.match(r'\s*export\s+default\s+function\s', line):
            test_start = i
            break
    
    if test_start is None:
        return [], [], None, None
    
    def_text = '\n'.join(lines[:test_start])
    test_text = '\n'.join(lines[test_start:])
    
    return def_text, test_text, test_start, len(lines)

def find_definitions(def_text):
    defs = {}
    lines = def_text.split('\n')
    pos = 0
    
    while pos < len(lines):
        line = lines[pos]
        stripped = line.strip()
        
        if not stripped or stripped.startswith('//') or stripped.startswith('import'):
            pos += 1
            continue
        
        # interface
        m = re.match(r'^(\s*)(interface\s+(\w+))', line)
        if m:
            name = m.group(3)
            full_def_line = line
            if '{' in line and not line.rstrip().endswith('{}'):
                brace_start = line.index('{')
                brace_pos = find_matching_brace('\n'.join(lines[pos:]), brace_start)
                if brace_pos >= 0:
                    end_line = pos
                    char_count = 0
                    for ci in range(pos, len(lines)):
                        if ci == pos:
                            char_count += len(lines[ci]) + 1
                        else:
                            char_count += len(lines[ci]) + 1
                        if char_count > brace_pos + pos:
                            end_line = ci
                            break
                    block = '\n'.join(lines[pos:end_line+1])
                    defs[name] = {'type': 'interface', 'line': pos, 'end_line': end_line, 'text': block}
                    pos = end_line + 1
                    continue
            elif '{}' in line:
                defs[name] = {'type': 'interface', 'line': pos, 'end_line': pos, 'text': line}
                pos += 1
                continue
            else:
                # interface without body on this line, look ahead
                j = pos + 1
                while j < len(lines) and '{' not in lines[j]:
                    j += 1
                if j < len(lines):
                    brace_start_in_block = sum(len(lines[k]) + 1 for k in range(pos, j)) + lines[j].index('{')
                    brace_pos = find_matching_brace('\n'.join(lines[pos:]), brace_start_in_block)
                    if brace_pos >= 0:
                        end_line_offset = 0
                        char_count = 0
                        for ci in range(0, len(lines) - pos):
                            char_count += len(lines[pos + ci]) + 1
                            if char_count > brace_pos:
                                end_line_offset = ci
                                break
                        end_line = pos + end_line_offset
                        block = '\n'.join(lines[pos:end_line+1])
                        defs[name] = {'type': 'interface', 'line': pos, 'end_line': end_line, 'text': block}
                        pos = end_line + 1
                        continue
                defs[name] = {'type': 'interface', 'line': pos, 'end_line': pos, 'text': line}
                pos += 1
                continue
        
        # class
        m = re.match(r'^(\s*)(class\s+(\w+))', line)
        if m:
            name = m.group(3)
            if '{' in line:
                brace_start = line.index('{')
                brace_pos = find_matching_brace('\n'.join(lines[pos:]), brace_start)
                if brace_pos >= 0:
                    end_line_offset = 0
                    char_count = 0
                    for ci in range(0, len(lines) - pos):
                        char_count += len(lines[pos + ci]) + 1
                        if char_count > brace_pos:
                            end_line_offset = ci
                            break
                    end_line = pos + end_line_offset
                    block = '\n'.join(lines[pos:end_line+1])
                    defs[name] = {'type': 'class', 'line': pos, 'end_line': end_line, 'text': block}
                    pos = end_line + 1
                    continue
            pos += 1
            continue
        
        # enum
        m = re.match(r'^(\s*)(enum\s+(\w+))', line)
        if m:
            name = m.group(3)
            if '{' in line:
                brace_start = line.index('{')
                brace_pos = find_matching_brace('\n'.join(lines[pos:]), brace_start)
                if brace_pos >= 0:
                    end_line_offset = 0
                    char_count = 0
                    for ci in range(0, len(lines) - pos):
                        char_count += len(lines[pos + ci]) + 1
                        if char_count > brace_pos:
                            end_line_offset = ci
                            break
                    end_line = pos + end_line_offset
                    block = '\n'.join(lines[pos:end_line+1])
                    defs[name] = {'type': 'enum', 'line': pos, 'end_line': end_line, 'text': block}
                    pos = end_line + 1
                    continue
            pos += 1
            continue
        
        # type alias: type X = ...
        m = re.match(r'^(\s*)(type\s+(\w+)\s*=)', line)
        if m:
            name = m.group(3)
            defs[name] = {'type': 'type', 'line': pos, 'end_line': pos, 'text': line}
            pos += 1
            continue
        
        # function declaration: function name(
        m = re.match(r'^(\s*)(function\s+(\w+)\s*\()', line)
        if m:
            name = m.group(3)
            if '{' in line:
                brace_start = line.index('{')
                brace_pos = find_matching_brace('\n'.join(lines[pos:]), brace_start)
                if brace_pos >= 0:
                    end_line_offset = 0
                    char_count = 0
                    for ci in range(0, len(lines) - pos):
                        char_count += len(lines[pos + ci]) + 1
                        if char_count > brace_pos:
                            end_line_offset = ci
                            break
                    end_line = pos + end_line_offset
                    block = '\n'.join(lines[pos:end_line+1])
                    defs[name] = {'type': 'function', 'line': pos, 'end_line': end_line, 'text': block}
                    pos = end_line + 1
                    continue
            defs[name] = {'type': 'function', 'line': pos, 'end_line': pos, 'text': line}
            pos += 1
            continue
        
        # let/const/var variable declaration
        m = re.match(r'^(\s*)(let|const|var)\s+(\w+)', line)
        if m:
            name = m.group(3)
            defs[name] = {'type': 'variable', 'line': pos, 'end_line': pos, 'text': line}
            pos += 1
            continue
        
        # Assignment to variable (second assignment): varname = ...
        m = re.match(r'^(\s*)(\w+)\s*=\s*', line)
        if m:
            name = m.group(2)
            if name in defs:
                defs[name + '__assign_' + str(pos)] = {'type': 'assign', 'line': pos, 'end_line': pos, 'text': line, 'target': name}
            pos += 1
            continue
        
        pos += 1
    
    return defs

def find_used_names(text, defined_names):
    used = set()
    for name in defined_names:
        base_name = name.split('__assign_')[0]
        pattern = r'\b' + re.escape(base_name) + r'\b'
        matches = list(re.finditer(pattern, text))
        # Count occurrences - if more than just the definition, it's used
        # But we're searching in test_text only, so any match means used
        if re.search(pattern, text):
            used.add(base_name)
    return used

def transitive_unused(defs, test_text):
    defined_names = list(defs.keys())
    base_names = set()
    for n in defined_names:
        base_names.add(n.split('__assign_')[0])
    
    used_in_test = find_used_names(test_text, list(base_names))
    
    unused = set()
    changed = True
    while changed:
        changed = False
        for name in defined_names:
            if name in unused:
                continue
            base = name.split('__assign_')[0]
            
            # Check if used in test
            if base in used_in_test:
                continue
            
            # Check if used in any non-unused definition
            is_used_by_other = False
            for other_name in defined_names:
                if other_name == name or other_name in unused:
                    continue
                other_def = defs[other_name]
                other_text = other_def['text']
                pattern = r'\b' + re.escape(base) + r'\b'
                if re.search(pattern, other_text):
                    # Check how many times - if base is just defined there, it doesn't count
                    # Actually for simplicity, if base appears in the text of another def, it's used
                    is_used_by_other = True
                    break
            
            if not is_used_by_other:
                unused.add(name)
                changed = True
    
    return unused

def main():
    root = r'E:\xts_demo_2\entry\src\main\src\test\expressions'
    files = find_ets_files(root)
    
    total_unused = 0
    
    for filepath in files:
        with open(filepath, 'r', encoding='utf-8') as f:
            lines = f.read().split('\n')
        
        def_text, test_text, test_start, total_lines = extract_definitions_and_test(lines)
        
        if test_start is None:
            continue
        
        defs = find_definitions(def_text)
        if not defs:
            continue
        
        unused = transitive_unused(defs, test_text)
        
        if unused:
            relpath = os.path.relpath(filepath, root)
            # Group assignments with their targets
            for name in sorted(unused, key=lambda n: defs[n]['line']):
                d = defs[name]
                line_num = d['line'] + 1  # 1-indexed
                extra = ''
                if d['type'] == 'assign':
                    extra = f" (assignment to {d['target']})"
                print(f"{relpath}:{line_num}: unused {d['type']} '{name.split('__assign_')[0]}'{extra}")
            total_unused += len(unused)
    
    print(f"\nTotal unused definitions: {total_unused}")

if __name__ == '__main__':
    main()
