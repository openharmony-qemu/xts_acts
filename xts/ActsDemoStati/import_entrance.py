#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import re
import json
import time
import hashlib
import argparse
import pickle
import math
import statistics
from collections import defaultdict, Counter, OrderedDict
from datetime import datetime
from typing import List, Dict, Set, Tuple, Optional, Any, Iterator
from dataclasses import dataclass, field
from functools import lru_cache, wraps
import threading
import queue
import traceback

try:
    from multiprocessing import Pool, cpu_count
    HAS_MULTIPROCESSING = True
except ImportError:
    HAS_MULTIPROCESSING = False

try:
    import difflib
    HAS_DIFFLIB = True
except ImportError:
    HAS_DIFFLIB = False


# ============================================================
# Section 1: Constants and Configuration
# ============================================================

VERSION = "2.0.0"
APP_NAME = "XTS Case Analyzer"
DEFAULT_ROOT = r"D:\gdata\xts_acts_7538"
DEFAULT_OUTPUT = r"D:\gdata\ai\analysis_result.json"
DEFAULT_REPORT = r"D:\gdata\ai\analysis_report.txt"
CACHE_FILE = r"D:\gdata\ai\.analyzer_cache.pkl"
CONFIG_FILE = r"D:\gdata\ai\analyzer_config.json"

SKIP_WORDS = frozenset({
    'if', 'for', 'while', 'switch', 'catch', 'function', 'return', 'new',
    'async', 'await', 'let', 'const', 'var', 'of', 'in', 'do', 'try',
    'throw', 'typeof', 'instanceof', 'void', 'this', 'delete', 'then',
    'finally', 'toString', 'valueOf', 'setTimeout', 'setInterval',
    'console', 'require', 'import', 'export', 'from', 'class', 'extends',
    'super', 'yield', 'continue', 'break', 'case', 'default', 'else',
    'get', 'set', 'static', 'public', 'private', 'protected', 'readonly',
    'enum', 'interface', 'type', 'namespace', 'declare', 'as', 'is',
    'with', 'debugger', 'Number', 'String', 'Boolean', 'Array', 'Object',
    'Math', 'Date', 'RegExp', 'Error', 'Promise', 'Map', 'Set',
    'Symbol', 'Proxy', 'Reflect', 'log', 'JSON', 'print', 'resolve',
    'reject', 'all', 'race', 'apply', 'call', 'bind', 'keys', 'values',
    'entries', 'assign', 'freeze', 'seal', 'create', 'defineProperty',
    'getPrototypeOf', 'setPrototypeOf', 'is', 'from', 'isArray', 'of',
    'push', 'pop', 'shift', 'unshift', 'splice', 'slice', 'concat',
    'join', 'reverse', 'sort', 'indexOf', 'lastIndexOf', 'includes',
    'find', 'findIndex', 'filter', 'map', 'reduce', 'forEach', 'some',
    'every', 'fill', 'copyWithin', 'flat', 'flatMap', 'at', 'entries',
    'charAt', 'charCodeAt', 'codePointAt', 'startsWith', 'endsWith',
    'includes', 'repeat', 'padStart', 'padEnd', 'trim', 'trimStart',
    'trimEnd', 'split', 'substring', 'substr', 'toLowerCase',
    'toUpperCase', 'localeCompare', 'normalize', 'match', 'matchAll',
    'search', 'replace', 'replaceAll', 'split', 'raw'
})

ASSERTION_METHODS = frozenset({
    'assertEqual', 'assertTrue', 'assertFalse', 'assertNull',
    'assertNotNull', 'assertUndefined', 'assertNotUndefined',
    'assertContain', 'assertNotContain', 'assertLarger',
    'assertLess', 'assertLessOrEqual', 'assertLargerOrEqual',
    'assertInstanceOf', 'assertDeepEquals', 'assertPromiseIsResolved',
    'assertThrowError', 'assertNotThrowError', 'expect'
})

TC_TAGS = ['@tc.name', '@tc.number', '@tc.desc', '@tc.type', '@tc.size', '@tc.level']

TEST_TYPES = {
    'FUNCTION': '功能测试',
    'PERFORMANCE': '性能测试',
    'RELIABILITY': '可靠性测试',
    'SECURITY': '安全测试',
    'POWER': '功耗测试',
    'ROBUSTNESS': '鲁棒性测试',
    'GLOBAL': '全球化测试',
    'COMPATIBILITY': '兼容性测试',
    'USER': '用户体验测试',
    'STABILITY': '稳定性测试',
    'STRESS': '压力测试',
    'FAULT': '故障注入测试',
    'SECURITY_ICC': '安全IPC测试',
}

TEST_SIZES = {
    'SMALLTEST': '小规模测试',
    'MEDIUMTEST': '中规模测试',
    'LARGETEST': '大规模测试',
}

TEST_LEVELS = {
    'LEVEL0': '级别0',
    'LEVEL1': '级别1',
    'LEVEL2': '级别2',
    'LEVEL3': '级别3',
    'LEVEL4': '级别4',
}

DEFAULT_CONFIG = {
    "root_dir": DEFAULT_ROOT,
    "output_file": DEFAULT_OUTPUT,
    "report_file": DEFAULT_REPORT,
    "cache_enabled": True,
    "parallel_workers": 4,
    "min_group_size": 2,
    "max_sample_cases": 50,
    "max_interfaces_per_group": 100,
    "similarity_threshold": 0.7,
    "enable_similarity": True,
    "enable_dependency": True,
    "enable_quality": True,
    "file_extensions": [".test.ets"],
    "skip_dirs": [".git", "node_modules", "build", ".idea", ".vscode"],
}


# ============================================================
# Section 2: Data Classes
# ============================================================

@dataclass
class TestCase:
    case_name: str
    file_path: str
    methods: List[str]
    params: str
    tc_tags: Dict[str, str]
    line_number: int
    body_length: int
    assertion_count: int
    complexity_score: float

    def to_dict(self) -> Dict[str, Any]:
        return {
            "case_name": self.case_name,
            "file_path": self.file_path,
            "methods": self.methods,
            "params": self.params,
            "tc_tags": self.tc_tags,
            "line_number": self.line_number,
            "body_length": self.body_length,
            "assertion_count": self.assertion_count,
            "complexity_score": self.complexity_score,
        }


@dataclass
class InterfaceInfo:
    name: str
    call_count: int
    case_names: List[str]
    file_paths: Set[str]

    def to_dict(self) -> Dict[str, Any]:
        return {
            "name": self.name,
            "call_count": self.call_count,
            "case_count": len(self.case_names),
            "sample_cases": self.case_names[:20],
            "file_count": len(self.file_paths),
        }


@dataclass
class CaseGroup:
    group_key: str
    group_type: str
    case_count: int
    cases: List[Dict[str, Any]]
    common_interfaces: List[str]
    all_interfaces: Set[str]

    def to_dict(self) -> Dict[str, Any]:
        return {
            "group_key": self.group_key,
            "group_type": self.group_type,
            "case_count": self.case_count,
            "cases": self.cases,
            "common_interfaces": self.common_interfaces,
            "all_interfaces": sorted(self.all_interfaces),
        }


@dataclass
class AnalysisResult:
    total_files: int
    total_cases: int
    total_interfaces: int
    cases: List[Dict[str, Any]]
    interfaces: List[Dict[str, Any]]
    prefix_groups: List[Dict[str, Any]]
    token_groups: List[Dict[str, Any]]
    interface_groups: List[Dict[str, Any]]
    similarity_clusters: List[Dict[str, Any]]
    quality_metrics: Dict[str, Any]
    dependency_graph: Dict[str, Any]
    statistics: Dict[str, Any]
    timestamp: str

    def to_dict(self) -> Dict[str, Any]:
        return {
            "total_files": self.total_files,
            "total_cases": self.total_cases,
            "total_interfaces": self.total_interfaces,
            "cases": self.cases,
            "interfaces": self.interfaces,
            "prefix_groups": self.prefix_groups,
            "token_groups": self.token_groups,
            "interface_groups": self.interface_groups,
            "similarity_clusters": self.similarity_clusters,
            "quality_metrics": self.quality_metrics,
            "dependency_graph": self.dependency_graph,
            "statistics": self.statistics,
            "timestamp": self.timestamp,
        }


# ============================================================
# Section 3: Utility Functions
# ============================================================

def timer(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        start = time.time()
        result = func(*args, **kwargs)
        elapsed = time.time() - start
        print(f"[TIMER] {func.__name__} took {elapsed:.2f}s")
        return result
    return wrapper


def ensure_dir(path: str) -> None:
    dir_path = os.path.dirname(path)
    if dir_path and not os.path.exists(dir_path):
        os.makedirs(dir_path, exist_ok=True)


def file_md5(path: str) -> str:
    hash_md5 = hashlib.md5()
    try:
        with open(path, 'rb') as f:
            for chunk in iter(lambda: f.read(8192), b''):
                hash_md5.update(chunk)
        return hash_md5.hexdigest()
    except Exception:
        return ""


def safe_read_file(path: str) -> str:
    for encoding in ('utf-8', 'utf-8-sig', 'gbk', 'latin-1'):
        try:
            with open(path, 'r', encoding=encoding) as f:
                return f.read()
        except (UnicodeDecodeError, OSError):
            continue
    return ""


def count_lines(text: str) -> int:
    return text.count('\n') + 1


def normalize_name(name: str) -> str:
    name = name.strip().strip("'").strip('"')
    name = re.sub(r'\s+', '_', name)
    return name


def split_case_name(name: str) -> List[str]:
    parts = re.split(r'[_\d]+', name)
    return [p for p in parts if p]


def get_prefix(name: str, depth: int = 4) -> str:
    parts = name.split('_')
    if len(parts) >= depth:
        return '_'.join(parts[:depth])
    return name


def get_core_token(name: str) -> str:
    parts = split_case_name(name)
    if len(parts) >= 5:
        return '_'.join(parts[:5])
    return '_'.join(parts) if parts else name


def get_subsystem(filepath: str) -> str:
    parts = filepath.replace('\\', '/').split('/')
    for i, p in enumerate(parts):
        if p == 'xts_acts_7538' and i + 1 < len(parts):
            return parts[i + 1]
    return "unknown"


def get_suite_name(filepath: str) -> str:
    parts = filepath.replace('\\', '/').split('/')
    for p in parts:
        if p.endswith('Test') or p.endswith('test'):
            return p
    return os.path.basename(os.path.dirname(filepath))


def levenshtein_distance(s1: str, s2: str) -> int:
    if len(s1) < len(s2):
        return levenshtein_distance(s2, s1)
    if len(s2) == 0:
        return len(s1)
    prev_row = range(len(s2) + 1)
    for i, c1 in enumerate(s1):
        curr_row = [i + 1]
        for j, c2 in enumerate(s2):
            insertions = prev_row[j + 1] + 1
            deletions = curr_row[j] + 1
            substitutions = prev_row[j] + (c1 != c2)
            curr_row.append(min(insertions, deletions, substitutions))
        prev_row = curr_row
    return prev_row[-1]


def similarity_score(s1: str, s2: str) -> float:
    max_len = max(len(s1), len(s2))
    if max_len == 0:
        return 1.0
    dist = levenshtein_distance(s1, s2)
    return 1.0 - (dist / max_len)


def jaccard_similarity(set1: Set[str], set2: Set[str]) -> float:
    if not set1 and not set2:
        return 1.0
    union = set1 | set2
    if not union:
        return 0.0
    intersection = set1 & set2
    return len(intersection) / len(union)


def sequence_similarity(s1: str, s2: str) -> float:
    if HAS_DIFFLIB:
        return difflib.SequenceMatcher(None, s1, s2).ratio()
    return similarity_score(s1, s2)


def format_size(size_bytes: int) -> str:
    if size_bytes < 1024:
        return f"{size_bytes} B"
    elif size_bytes < 1024 * 1024:
        return f"{size_bytes / 1024:.2f} KB"
    elif size_bytes < 1024 * 1024 * 1024:
        return f"{size_bytes / (1024 * 1024):.2f} MB"
    else:
        return f"{size_bytes / (1024 * 1024 * 1024):.2f} GB"


def format_time(seconds: float) -> str:
    if seconds < 60:
        return f"{seconds:.2f}s"
    elif seconds < 3600:
        return f"{int(seconds // 60)}m {seconds % 60:.2f}s"
    else:
        return f"{int(seconds // 3600)}h {int((seconds % 3600) // 60)}m"


def progress_bar(current: int, total: int, width: int = 40) -> str:
    if total == 0:
        return "[" + "=" * width + "] 100%"
    percent = current / total
    filled = int(width * percent)
    bar = "=" * filled + " " * (width - filled)
    return f"[{bar}] {percent * 100:.1f}% ({current}/{total})"


# ============================================================
# Section 4: Source Code Parser
# ============================================================

class SourceParser:
    """Parses .test.ets source files to extract test cases."""

    IT_PATTERN = re.compile(r'\bit\s*\(')
    DESCRIBE_PATTERN = re.compile(r'\bdescribe\s*\(\s*["\']')
    COMMENT_TAG_PATTERN = re.compile(r'@tc\.(\w+)\s+(.+)')
    METHOD_CALL_PATTERN = re.compile(r'(\.?)(\w+)\s*\(')
    STRING_PATTERN = re.compile(r'["\'`]')

    def __init__(self):
        self.reset()

    def reset(self):
        self.line_offset_cache = {}

    def _build_line_offset(self, text: str):
        offsets = [0]
        for i, ch in enumerate(text):
            if ch == '\n':
                offsets.append(i + 1)
        return offsets

    def _get_line_number(self, text: str, pos: int, offsets: List[int]) -> int:
        import bisect
        return bisect.bisect_right(offsets, pos)

    @staticmethod
    def find_matching_brace(text: str, start: int) -> int:
        depth = 0
        i = start
        length = len(text)
        while i < length:
            ch = text[i]
            if ch == '{':
                depth += 1
            elif ch == '}':
                depth -= 1
                if depth == 0:
                    return i
            elif ch == "'" or ch == '`':
                quote = ch
                i += 1
                while i < length:
                    if text[i] == '\\':
                        i += 2
                        continue
                    if text[i] == quote:
                        break
                    i += 1
            elif ch == '"':
                i += 1
                while i < length:
                    if text[i] == '\\':
                        i += 2
                        continue
                    if text[i] == '"':
                        break
                    i += 1
            elif ch == '/' and i + 1 < length and text[i + 1] == '/':
                while i < length and text[i] != '\n':
                    i += 1
            elif ch == '/' and i + 1 < length and text[i + 1] == '*':
                i += 2
                while i + 1 < length:
                    if text[i] == '*' and text[i + 1] == '/':
                        i += 1
                        break
                    i += 1
            i += 1
        return -1

    @staticmethod
    def find_first_brace(text: str, start: int, max_scan: int = 300) -> int:
        i = start
        length = len(text)
        count = 0
        while i < length and count < max_scan:
            ch = text[i]
            if ch == '{':
                return i
            elif ch == "'" or ch == '`':
                quote = ch
                i += 1
                while i < length:
                    if text[i] == '\\':
                        i += 2
                        continue
                    if text[i] == quote:
                        break
                    i += 1
            elif ch == '"':
                i += 1
                while i < length:
                    if text[i] == '\\':
                        i += 2
                        continue
                    if text[i] == '"':
                        break
                    i += 1
            elif ch == '/' and i + 1 < length and text[i + 1] == '/':
                while i < length and text[i] != '\n':
                    i += 1
            elif ch == '/' and i + 1 < length and text[i + 1] == '*':
                i += 2
                while i + 1 < length:
                    if text[i] == '*' and text[i + 1] == '/':
                        i += 1
                        break
                    i += 1
            i += 1
            count += 1
        return -1

    @staticmethod
    def extract_methods(body: str) -> List[str]:
        methods = set()
        for m in re.finditer(r'\.(\w+)\s*\(', body):
            name = m.group(1)
            if name not in SKIP_WORDS:
                methods.add(name)
        for m in re.finditer(r'(?<![\.\w])(\w+)\s*\(', body):
            name = m.group(1)
            if name not in SKIP_WORDS:
                methods.add(name)
        return sorted(methods)

    @staticmethod
    def extract_assertions(body: str) -> int:
        count = 0
        for method in ASSERTION_METHODS:
            count += len(re.findall(r'\.' + method + r'\s*\(', body))
        return count

    @staticmethod
    def extract_tc_tags(text_before_it: str) -> Dict[str, str]:
        tags = {}
        for m in re.finditer(r'@tc\.(\w+)\s+(.+?)(?:\n|\*|$)', text_before_it):
            tag_name = m.group(1).lower()
            tag_value = m.group(2).strip().rstrip('*').strip()
            tags[f"@tc.{tag_name}"] = tag_value
        return tags

    @staticmethod
    def extract_case_name(param_str: str) -> str:
        m = re.match(r"['\"](.+?)['\"]", param_str.strip())
        if m:
            return m.group(1)
        return param_str.strip()

    @staticmethod
    def compute_complexity(methods: List[str], body_length: int,
                           assertion_count: int) -> float:
        method_score = min(len(methods) / 20.0, 1.0) * 30
        length_score = min(body_length / 2000.0, 1.0) * 30
        assert_score = min(assertion_count / 10.0, 1.0) * 40
        return round(method_score + length_score + assert_score, 2)

    def parse_file(self, filepath: str) -> List[TestCase]:
        content = safe_read_file(filepath)
        if not content:
            return []

        offsets = self._build_line_offset(content)
        results = []
        search_from = 0

        while True:
            m = self.IT_PATTERN.search(content, search_from)
            if not m:
                break

            it_start = m.start()
            line_no = self._get_line_number(content, it_start, offsets)

            text_before = content[max(0, it_start - 500):it_start]
            tc_tags = self.extract_tc_tags(text_before)

            brace_idx = self.find_first_brace(content, m.end())
            if brace_idx == -1:
                search_from = m.end()
                continue

            body_end = self.find_matching_brace(content, brace_idx)
            if body_end == -1:
                search_from = brace_idx + 1
                continue

            param_str = content[m.end():brace_idx].strip()
            param_str = re.sub(r'=>\s*$', '', param_str).strip()

            body = content[brace_idx + 1:body_end]
            methods = self.extract_methods(body)
            assertion_count = self.extract_assertions(body)
            case_name = self.extract_case_name(param_str)
            complexity = self.compute_complexity(methods, len(body), assertion_count)

            results.append(TestCase(
                case_name=case_name,
                file_path=filepath,
                methods=methods,
                params=param_str,
                tc_tags=tc_tags,
                line_number=line_no,
                body_length=len(body),
                assertion_count=assertion_count,
                complexity_score=complexity,
            ))

            search_from = body_end + 1

        return results


# ============================================================
# Section 5: File Scanner
# ============================================================

class FileScanner:
    """Scans directories for test files."""

    def __init__(self, config: Dict[str, Any]):
        self.root = config.get("root_dir", DEFAULT_ROOT)
        self.extensions = config.get("file_extensions", [".test.ets"])
        self.skip_dirs = set(config.get("skip_dirs", []))
        self.files: List[str] = []

    def scan(self) -> List[str]:
        self.files = []
        for dirpath, dirnames, filenames in os.walk(self.root):
            dirnames[:] = [d for d in dirnames if d not in self.skip_dirs]
            for fn in filenames:
                if any(fn.endswith(ext) for ext in self.extensions):
                    self.files.append(os.path.join(dirpath, fn))
        return self.files

    def scan_incremental(self, cache: Dict[str, str]) -> Tuple[List[str], List[str]]:
        all_files = self.scan()
        new_files = []
        changed_files = []
        for f in all_files:
            md5 = file_md5(f)
            if f not in cache:
                new_files.append(f)
            elif cache[f] != md5:
                changed_files.append(f)
            cache[f] = md5
        return new_files, changed_files

    def get_file_stats(self) -> Dict[str, Any]:
        total_size = 0
        by_extension = Counter()
        for f in self.files:
            try:
                total_size += os.path.getsize(f)
            except OSError:
                pass
            ext = os.path.splitext(f)[1]
            by_extension[ext] += 1
        return {
            "total_files": len(self.files),
            "total_size": total_size,
            "total_size_formatted": format_size(total_size),
            "by_extension": dict(by_extension),
        }


# ============================================================
# Section 6: Case Collector
# ============================================================

class CaseCollector:
    """Collects and stores test cases from files."""

    def __init__(self, config: Dict[str, Any]):
        self.config = config
        self.parser = SourceParser()
        self.cases: List[TestCase] = []
        self.file_case_map: Dict[str, List[TestCase]] = defaultdict(list)

    def collect(self, files: List[str], verbose: bool = True) -> List[TestCase]:
        self.cases = []
        total = len(files)
        for i, filepath in enumerate(files):
            if verbose and (i + 1) % 2000 == 0:
                print(f"  进度: {progress_bar(i + 1, total)}")
            cases = self.parser.parse_file(filepath)
            for case in cases:
                self.cases.append(case)
                self.file_case_map[filepath].append(case)
        if verbose:
            print(f"  总用例数: {len(self.cases)}")
        return self.cases

    def collect_parallel(self, files: List[str], workers: int = 4) -> List[TestCase]:
        if not HAS_MULTIPROCESSING:
            return self.collect(files)

        parser = SourceParser()
        chunks = [files[i::workers] for i in range(workers)]

        def parse_chunk(chunk):
            results = []
            for filepath in chunk:
                results.extend(parser.parse_file(filepath))
            return results

        with Pool(workers) as pool:
            all_results = pool.map(parse_chunk, chunks)

        self.cases = []
        for chunk_results in all_results:
            for case in chunk_results:
                self.cases.append(case)
                self.file_case_map[case.file_path].append(case)
        return self.cases

    def get_statistics(self) -> Dict[str, Any]:
        if not self.cases:
            return {}
        methods_per_case = [len(c.methods) for c in self.cases]
        body_lengths = [c.body_length for c in self.cases]
        assertions = [c.assertion_count for c in self.cases]
        complexities = [c.complexity_score for c in self.cases]
        return {
            "total_cases": len(self.cases),
            "total_files": len(self.file_case_map),
            "avg_methods_per_case": round(statistics.mean(methods_per_case), 2) if methods_per_case else 0,
            "median_methods_per_case": statistics.median(methods_per_case) if methods_per_case else 0,
            "avg_body_length": round(statistics.mean(body_lengths), 2) if body_lengths else 0,
            "avg_assertions": round(statistics.mean(assertions), 2) if assertions else 0,
            "avg_complexity": round(statistics.mean(complexities), 2) if complexities else 0,
            "max_complexity": max(complexities) if complexities else 0,
            "min_complexity": min(complexities) if complexities else 0,
        }


# ============================================================
# Section 7: Interface Analyzer
# ============================================================

class InterfaceAnalyzer:
    """Analyzes interfaces (methods) called by test cases."""

    def __init__(self, cases: List[TestCase]):
        self.cases = cases
        self.interface_map: Dict[str, InterfaceInfo] = {}
        self.case_interface_map: Dict[str, Set[str]] = {}

    def analyze(self) -> Dict[str, InterfaceInfo]:
        self.interface_map = {}
        self.case_interface_map = {}

        for case in self.cases:
            iface_set = set()
            for method in case.methods:
                if method not in self.interface_map:
                    self.interface_map[method] = InterfaceInfo(
                        name=method,
                        call_count=0,
                        case_names=[],
                        file_paths=set()
                    )
                info = self.interface_map[method]
                info.call_count += 1
                if case.case_name not in info.case_names:
                    info.case_names.append(case.case_name)
                info.file_paths.add(case.file_path)
                iface_set.add(method)
            self.case_interface_map[case.case_name] = iface_set

        return self.interface_map

    def get_top_interfaces(self, n: int = 50) -> List[InterfaceInfo]:
        return sorted(self.interface_map.values(),
                      key=lambda x: x.call_count, reverse=True)[:n]

    def get_interface_groups(self, min_cases: int = 2) -> List[Dict[str, Any]]:
        groups = []
        for name, info in sorted(self.interface_map.items(),
                                  key=lambda x: x[1].call_count, reverse=True):
            if len(info.case_names) < min_cases:
                continue
            groups.append(info.to_dict())
        return groups

    def find_related_cases(self, case_name: str, min_shared: int = 2) -> List[str]:
        target_ifaces = self.case_interface_map.get(case_name, set())
        if not target_ifaces:
            return []
        related = []
        for other_name, other_ifaces in self.case_interface_map.items():
            if other_name == case_name:
                continue
            shared = target_ifaces & other_ifaces
            if len(shared) >= min_shared:
                related.append((other_name, len(shared)))
        related.sort(key=lambda x: x[1], reverse=True)
        return [name for name, _ in related]

    def get_coverage_stats(self) -> Dict[str, Any]:
        if not self.interface_map:
            return {}
        call_counts = [info.call_count for info in self.interface_map.values()]
        case_counts = [len(info.case_names) for info in self.interface_map.values()]
        return {
            "total_interfaces": len(self.interface_map),
            "avg_calls_per_interface": round(statistics.mean(call_counts), 2),
            "median_calls": statistics.median(call_counts),
            "max_calls": max(call_counts),
            "min_calls": min(call_counts),
            "avg_cases_per_interface": round(statistics.mean(case_counts), 2),
            "interfaces_used_once": sum(1 for c in call_counts if c == 1),
            "interfaces_used_many": sum(1 for c in call_counts if c >= 100),
        }


# ============================================================
# Section 8: Case Grouper
# ============================================================

class CaseGrouper:
    """Groups test cases by various criteria."""

    def __init__(self, cases: List[TestCase], config: Dict[str, Any]):
        self.cases = cases
        self.config = config
        self.min_group_size = config.get("min_group_size", 2)
        self.max_sample = config.get("max_sample_cases", 50)

    def group_by_prefix(self, depth: int = 4) -> List[Dict[str, Any]]:
        groups = defaultdict(list)
        for case in self.cases:
            prefix = get_prefix(case.case_name, depth)
            groups[prefix].append(case)

        result = []
        for prefix, case_list in sorted(groups.items(),
                                         key=lambda x: len(x[1]), reverse=True):
            if len(case_list) < self.min_group_size:
                continue
            all_ifaces = set()
            for c in case_list:
                all_ifaces.update(c.methods)
            result.append({
                "group_key": prefix,
                "group_type": "name_prefix",
                "case_count": len(case_list),
                "cases": [c.to_dict() for c in case_list[:self.max_sample]],
                "common_interfaces": sorted(all_ifaces)[:self.config.get("max_interfaces_per_group", 100)],
                "all_interfaces": sorted(all_ifaces),
            })
        return result

    def group_by_token(self) -> List[Dict[str, Any]]:
        groups = defaultdict(list)
        for case in self.cases:
            token = get_core_token(case.case_name)
            groups[token].append(case)

        result = []
        for token, case_list in sorted(groups.items(),
                                         key=lambda x: len(x[1]), reverse=True):
            if len(case_list) < self.min_group_size:
                continue
            all_ifaces = set()
            for c in case_list:
                all_ifaces.update(c.methods)
            result.append({
                "group_key": token,
                "group_type": "core_token",
                "case_count": len(case_list),
                "sample_cases": [c.case_name for c in case_list[:self.max_sample]],
                "common_interfaces": sorted(all_ifaces)[:50],
            })
        return result

    def group_by_interface(self, interface_analyzer: InterfaceAnalyzer) -> List[Dict[str, Any]]:
        groups = []
        for name, info in sorted(interface_analyzer.interface_map.items(),
                                  key=lambda x: x[1].call_count, reverse=True):
            if len(info.case_names) < self.min_group_size:
                continue
            groups.append({
                "group_key": name,
                "group_type": "interface",
                "case_count": len(info.case_names),
                "sample_cases": info.case_names[:self.max_sample],
                "call_count": info.call_count,
                "file_count": len(info.file_paths),
            })
        return groups

    def group_by_subsystem(self) -> List[Dict[str, Any]]:
        groups = defaultdict(list)
        for case in self.cases:
            subsystem = get_subsystem(case.file_path)
            groups[subsystem].append(case)

        result = []
        for subsystem, case_list in sorted(groups.items(),
                                            key=lambda x: len(x[1]), reverse=True):
            all_ifaces = set()
            for c in case_list:
                all_ifaces.update(c.methods)
            result.append({
                "group_key": subsystem,
                "group_type": "subsystem",
                "case_count": len(case_list),
                "file_count": len(set(c.file_path for c in case_list)),
                "common_interfaces": sorted(all_ifaces)[:50],
                "sample_cases": [c.case_name for c in case_list[:self.max_sample]],
            })
        return result

    def group_by_suite(self) -> List[Dict[str, Any]]:
        groups = defaultdict(list)
        for case in self.cases:
            suite = get_suite_name(case.file_path)
            groups[suite].append(case)

        result = []
        for suite, case_list in sorted(groups.items(),
                                         key=lambda x: len(x[1]), reverse=True):
            if len(case_list) < self.min_group_size:
                continue
            all_ifaces = set()
            for c in case_list:
                all_ifaces.update(c.methods)
            result.append({
                "group_key": suite,
                "group_type": "test_suite",
                "case_count": len(case_list),
                "common_interfaces": sorted(all_ifaces)[:50],
                "sample_cases": [c.case_name for c in case_list[:self.max_sample]],
            })
        return result

    def group_by_complexity(self) -> List[Dict[str, Any]]:
        levels = [
            ("Low (0-30)", 0, 30),
            ("Medium (30-60)", 30, 60),
            ("High (60-80)", 60, 80),
            ("Very High (80-100)", 80, 101),
        ]
        result = []
        for label, lo, hi in levels:
            filtered = [c for c in self.cases if lo <= c.complexity_score < hi]
            if not filtered:
                continue
            result.append({
                "group_key": label,
                "group_type": "complexity",
                "case_count": len(filtered),
                "avg_methods": round(statistics.mean([len(c.methods) for c in filtered]), 2),
                "avg_assertions": round(statistics.mean([c.assertion_count for c in filtered]), 2),
                "sample_cases": [c.case_name for c in filtered[:self.max_sample]],
            })
        return result

    def group_by_assertion_count(self) -> List[Dict[str, Any]]:
        ranges = [
            ("0 assertions", 0, 1),
            ("1-3 assertions", 1, 4),
            ("4-10 assertions", 4, 11),
            ("11+ assertions", 11, 999999),
        ]
        result = []
        for label, lo, hi in ranges:
            filtered = [c for c in self.cases if lo <= c.assertion_count < hi]
            if not filtered:
                continue
            result.append({
                "group_key": label,
                "group_type": "assertion_count",
                "case_count": len(filtered),
                "sample_cases": [c.case_name for c in filtered[:self.max_sample]],
            })
        return result


# ============================================================
# Section 9: Similarity Analyzer
# ============================================================

class SimilarityAnalyzer:
    """Analyzes similarity between test case names."""

    def __init__(self, cases: List[TestCase], threshold: float = 0.7):
        self.cases = cases
        self.threshold = threshold
        self.clusters: List[List[str]] = []

    def analyze(self, max_cases: int = 5000) -> List[Dict[str, Any]]:
        case_names = [c.case_name for c in self.cases[:max_cases]]
        n = len(case_names)
        if n == 0:
            return []

        visited = [False] * n
        clusters = []

        for i in range(n):
            if visited[i]:
                continue
            cluster = [case_names[i]]
            visited[i] = True
            for j in range(i + 1, n):
                if visited[j]:
                    continue
                score = sequence_similarity(case_names[i], case_names[j])
                if score >= self.threshold:
                    cluster.append(case_names[j])
                    visited[j] = True
            if len(cluster) >= 2:
                clusters.append(cluster)

        clusters.sort(key=len, reverse=True)

        result = []
        for idx, cluster in enumerate(clusters):
            result.append({
                "cluster_id": idx,
                "case_count": len(cluster),
                "cases": cluster[:50],
                "similarity_threshold": self.threshold,
            })
        self.clusters = clusters
        return result

    def find_duplicates(self, threshold: float = 0.95) -> List[Dict[str, Any]]:
        duplicates = []
        case_names = [c.case_name for c in self.cases]
        n = len(case_names)
        for i in range(n):
            for j in range(i + 1, min(i + 1000, n)):
                score = sequence_similarity(case_names[i], case_names[j])
                if score >= threshold:
                    duplicates.append({
                        "case1": case_names[i],
                        "case2": case_names[j],
                        "similarity": round(score, 4),
                    })
        return duplicates


# ============================================================
# Section 10: Dependency Analyzer
# ============================================================

class DependencyAnalyzer:
    """Analyzes dependencies between test cases via shared interfaces."""

    def __init__(self, cases: List[TestCase]):
        self.cases = cases
        self.graph: Dict[str, Set[str]] = defaultdict(set)
        self.reverse_graph: Dict[str, Set[str]] = defaultdict(set)

    def analyze(self, min_shared: int = 3) -> Dict[str, Any]:
        case_ifaces = {}
        for case in self.cases:
            case_ifaces[case.case_name] = set(case.methods)

        case_names = list(case_ifaces.keys())
        n = len(case_names)
        edges = 0

        for i in range(n):
            for j in range(i + 1, n):
                shared = case_ifaces[case_names[i]] & case_ifaces[case_names[j]]
                if len(shared) >= min_shared:
                    self.graph[case_names[i]].add(case_names[j])
                    self.graph[case_names[j]].add(case_names[i])
                    edges += 1

        top_connected = sorted(self.graph.items(),
                                key=lambda x: len(x[1]), reverse=True)[:100]

        return {
            "total_nodes": n,
            "total_edges": edges,
            "avg_connections": round(edges * 2 / n, 2) if n > 0 else 0,
            "top_connected": [
                {"case_name": name, "connection_count": len(conns),
                 "connected_to": list(conns)[:20]}
                for name, conns in top_connected
            ],
        }

    def find_clusters(self) -> List[List[str]]:
        visited = set()
        clusters = []

        def dfs(node, cluster):
            visited.add(node)
            cluster.append(node)
            for neighbor in self.graph.get(node, []):
                if neighbor not in visited:
                    dfs(neighbor, cluster)

        for case_name in self.graph:
            if case_name not in visited:
                cluster = []
                dfs(case_name, cluster)
                if len(cluster) >= 2:
                    clusters.append(cluster)

        clusters.sort(key=len, reverse=True)
        return clusters


# ============================================================
# Section 11: Quality Assessor
# ============================================================

class QualityAssessor:
    """Assesses test quality metrics."""

    def __init__(self, cases: List[TestCase]):
        self.cases = cases

    def assess(self) -> Dict[str, Any]:
        total = len(self.cases)
        if total == 0:
            return {}

        no_assertions = sum(1 for c in self.cases if c.assertion_count == 0)
        no_methods = sum(1 for c in self.cases if len(c.methods) == 0)
        high_complexity = sum(1 for c in self.cases if c.complexity_score >= 70)
        low_complexity = sum(1 for c in self.cases if c.complexity_score < 30)

        avg_methods = statistics.mean([len(c.methods) for c in self.cases])
        avg_assertions = statistics.mean([c.assertion_count for c in self.cases])
        avg_complexity = statistics.mean([c.complexity_score for c in self.cases])

        tag_coverage = {}
        for tag in TC_TAGS:
            count = sum(1 for c in self.cases if tag in c.tc_tags)
            tag_coverage[tag] = {
                "count": count,
                "coverage": f"{count / total * 100:.1f}%"
            }

        type_dist = Counter()
        for c in self.cases:
            tc_type = c.tc_tags.get("@tc.type", "UNKNOWN")
            type_dist[tc_type] += 1

        level_dist = Counter()
        for c in self.cases:
            tc_level = c.tc_tags.get("@tc.level", "UNKNOWN")
            level_dist[tc_level] += 1

        size_dist = Counter()
        for c in self.cases:
            tc_size = c.tc_tags.get("@tc.size", "UNKNOWN")
            size_dist[tc_size] += 1

        return {
            "total_cases": total,
            "cases_without_assertions": no_assertions,
            "cases_without_methods": no_methods,
            "high_complexity_cases": high_complexity,
            "low_complexity_cases": low_complexity,
            "avg_methods_per_case": round(avg_methods, 2),
            "avg_assertions_per_case": round(avg_assertions, 2),
            "avg_complexity_score": round(avg_complexity, 2),
            "assertion_coverage": f"{(total - no_assertions) / total * 100:.1f}%",
            "tag_coverage": tag_coverage,
            "type_distribution": dict(type_dist.most_common(20)),
            "level_distribution": dict(level_dist.most_common(10)),
            "size_distribution": dict(size_dist.most_common(10)),
        }


# ============================================================
# Section 12: Cache Manager
# ============================================================

class CacheManager:
    """Manages cache for incremental analysis."""

    def __init__(self, cache_file: str):
        self.cache_file = cache_file
        self.cache: Dict[str, Any] = {}

    def load(self) -> Dict[str, Any]:
        if os.path.exists(self.cache_file):
            try:
                with open(self.cache_file, 'rb') as f:
                    return pickle.load(f)
            except Exception:
                return {}
        return {}

    def save(self, cache: Dict[str, Any]) -> None:
        try:
            ensure_dir(self.cache_file)
            with open(self.cache_file, 'wb') as f:
                pickle.dump(cache, f)
        except Exception as e:
            print(f"[CACHE] Failed to save: {e}")

    def get_file_hash(self, filepath: str) -> str:
        return file_md5(filepath)


# ============================================================
# Section 13: Report Generator
# ============================================================

class ReportGenerator:
    """Generates text reports from analysis results."""

    def __init__(self, result: AnalysisResult):
        self.result = result

    def generate(self) -> str:
        lines = []
        lines.append("=" * 60)
        lines.append(f"  {APP_NAME} v{VERSION} - Analysis Report")
        lines.append(f"  Generated: {self.result.timestamp}")
        lines.append("=" * 60)
        lines.append("")

        lines.append("1. OVERVIEW")
        lines.append("-" * 40)
        lines.append(f"  Total files scanned:  {self.result.total_files}")
        lines.append(f"  Total test cases:     {self.result.total_cases}")
        lines.append(f"  Total interfaces:     {self.result.total_interfaces}")
        lines.append("")

        stats = self.result.statistics
        lines.append("2. STATISTICS")
        lines.append("-" * 40)
        for key, value in stats.items():
            if isinstance(value, float):
                lines.append(f"  {key}: {value:.2f}")
            else:
                lines.append(f"  {key}: {value}")
        lines.append("")

        lines.append("3. TOP INTERFACES (Top 20)")
        lines.append("-" * 40)
        for iface in self.result.interfaces[:20]:
            lines.append(f"  {iface['name']:40s} calls={iface['call_count']:6d}  cases={iface['case_count']:6d}")
        lines.append("")

        lines.append("4. PREFIX GROUPS (Top 20)")
        lines.append("-" * 40)
        for group in self.result.prefix_groups[:20]:
            lines.append(f"  {group['group_key']:50s} count={group['case_count']:6d}")
        lines.append("")

        lines.append("5. TOKEN GROUPS (Top 20)")
        lines.append("-" * 40)
        for group in self.result.token_groups[:20]:
            lines.append(f"  {group['group_key']:50s} count={group['case_count']:6d}")
        lines.append("")

        lines.append("6. INTERFACE CORRELATIONS (Top 20)")
        lines.append("-" * 40)
        for group in self.result.interface_groups[:20]:
            lines.append(f"  {group['group_key']:40s} cases={group['case_count']:6d}  calls={group.get('call_count', 0):6d}")
        lines.append("")

        if self.result.similarity_clusters:
            lines.append("7. SIMILARITY CLUSTERS (Top 20)")
            lines.append("-" * 40)
            for cluster in self.result.similarity_clusters[:20]:
                lines.append(f"  Cluster #{cluster['cluster_id']}: {cluster['case_count']} cases")
                for cn in cluster['cases'][:5]:
                    lines.append(f"    - {cn}")
            lines.append("")

        if self.result.quality_metrics:
            lines.append("8. QUALITY METRICS")
            lines.append("-" * 40)
            for key, value in self.result.quality_metrics.items():
                if isinstance(value, dict):
                    lines.append(f"  {key}:")
                    for k2, v2 in value.items():
                        if isinstance(v2, dict):
                            lines.append(f"    {k2}: {v2}")
                        else:
                            lines.append(f"    {k2}: {v2}")
                elif isinstance(value, float):
                    lines.append(f"  {key}: {value:.2f}")
                else:
                    lines.append(f"  {key}: {value}")
            lines.append("")

        if self.result.dependency_graph:
            lines.append("9. DEPENDENCY GRAPH")
            lines.append("-" * 40)
            dg = self.result.dependency_graph
            lines.append(f"  Total nodes: {dg.get('total_nodes', 0)}")
            lines.append(f"  Total edges: {dg.get('total_edges', 0)}")
            lines.append(f"  Avg connections: {dg.get('avg_connections', 0)}")
            lines.append("")

        lines.append("=" * 60)
        lines.append("  End of Report")
        lines.append("=" * 60)

        return '\n'.join(lines)


# ============================================================
# Section 14: Configuration Manager
# ============================================================

class ConfigManager:
    """Manages configuration."""

    def __init__(self, config_file: str = CONFIG_FILE):
        self.config_file = config_file
        self.config: Dict[str, Any] = dict(DEFAULT_CONFIG)

    def load(self) -> Dict[str, Any]:
        if os.path.exists(self.config_file):
            try:
                with open(self.config_file, 'r', encoding='utf-8') as f:
                    user_config = json.load(f)
                self.config.update(user_config)
            except Exception as e:
                print(f"[CONFIG] Failed to load: {e}")
        return self.config

    def save(self) -> None:
        try:
            ensure_dir(self.config_file)
            with open(self.config_file, 'w', encoding='utf-8') as f:
                json.dump(self.config, f, ensure_ascii=False, indent=2)
        except Exception as e:
            print(f"[CONFIG] Failed to save: {e}")

    def get(self, key: str, default: Any = None) -> Any:
        return self.config.get(key, default)

    def set(self, key: str, value: Any) -> None:
        self.config[key] = value


# ============================================================
# Section 15: Main Analyzer
# ============================================================

class Analyzer:
    """Main analyzer orchestrating all components."""

    def __init__(self, config: Dict[str, Any]):
        self.config = config
        self.scanner = FileScanner(config)
        self.collector = CaseCollector(config)
        self.interface_analyzer: Optional[InterfaceAnalyzer] = None
        self.grouper: Optional[CaseGrouper] = None
        self.similarity_analyzer: Optional[SimilarityAnalyzer] = None
        self.dependency_analyzer: Optional[DependencyAnalyzer] = None
        self.quality_assessor: Optional[QualityAssessor] = None
        self.result: Optional[AnalysisResult] = None

    @timer
    def run(self, verbose: bool = True) -> AnalysisResult:
        if verbose:
            print(f"\n{'=' * 60}")
            print(f"  {APP_NAME} v{VERSION}")
            print(f"  Root: {self.config['root_dir']}")
            print(f"{'=' * 60}\n")

        if verbose:
            print("[1/8] Scanning files...")
        files = self.scanner.scan()
        if verbose:
            print(f"  Found {len(files)} test files")

        if verbose:
            print("[2/8] Parsing test cases...")
        self.collector.collect(files, verbose=verbose)

        if verbose:
            print("[3/8] Analyzing interfaces...")
        self.interface_analyzer = InterfaceAnalyzer(self.collector.cases)
        self.interface_analyzer.analyze()

        if verbose:
            print("[4/8] Grouping cases...")
        self.grouper = CaseGrouper(self.collector.cases, self.config)
        prefix_groups = self.grouper.group_by_prefix()
        token_groups = self.grouper.group_by_token()
        interface_groups = self.grouper.group_by_interface(self.interface_analyzer)

        if verbose:
            print("[5/8] Analyzing similarity...")
        threshold = self.config.get("similarity_threshold", 0.7)
        self.similarity_analyzer = SimilarityAnalyzer(self.collector.cases, threshold)
        similarity_clusters = self.similarity_analyzer.analyze()

        if verbose:
            print("[6/8] Analyzing dependencies...")
        self.dependency_analyzer = DependencyAnalyzer(self.collector.cases)
        dep_graph = self.dependency_analyzer.analyze()

        if verbose:
            print("[7/8] Assessing quality...")
        self.quality_assessor = QualityAssessor(self.collector.cases)
        quality_metrics = self.quality_assessor.assess()

        if verbose:
            print("[8/8] Building result...")
        stats = self.collector.get_statistics()
        stats.update(self.interface_analyzer.get_coverage_stats())

        top_interfaces = self.interface_analyzer.get_top_interfaces(100)

        self.result = AnalysisResult(
            total_files=len(files),
            total_cases=len(self.collector.cases),
            total_interfaces=len(self.interface_analyzer.interface_map),
            cases=[c.to_dict() for c in self.collector.cases[:5000]],
            interfaces=[i.to_dict() for i in top_interfaces],
            prefix_groups=prefix_groups[:500],
            token_groups=token_groups[:500],
            interface_groups=interface_groups[:500],
            similarity_clusters=similarity_clusters[:200],
            quality_metrics=quality_metrics,
            dependency_graph=dep_graph,
            statistics=stats,
            timestamp=datetime.now().isoformat()
        )

        if verbose:
            print(f"\n  Total cases: {self.result.total_cases}")
            print(f"  Total interfaces: {self.result.total_interfaces}")
            print(f"  Prefix groups: {len(prefix_groups)}")
            print(f"  Token groups: {len(token_groups)}")
            print(f"  Similarity clusters: {len(similarity_clusters)}")

        return self.result

    def save_json(self, output_file: str) -> None:
        if not self.result:
            return
        ensure_dir(output_file)
        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(self.result.to_dict(), f, ensure_ascii=False, indent=2)
        size = os.path.getsize(output_file)
        print(f"[OUTPUT] JSON saved: {output_file} ({format_size(size)})")

    def save_report(self, report_file: str) -> None:
        if not self.result:
            return
        ensure_dir(report_file)
        report_gen = ReportGenerator(self.result)
        report_text = report_gen.generate()
        with open(report_file, 'w', encoding='utf-8') as f:
            f.write(report_text)
        print(f"[OUTPUT] Report saved: {report_file}")

def build_arg_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description=f"{APP_NAME} v{VERSION} - XTS Test Case Analysis Tool"
    )
    parser.add_argument('-r', '--root', default=DEFAULT_ROOT,
                        help='Root directory to scan')
    parser.add_argument('-o', '--output', default=DEFAULT_OUTPUT,
                        help='Output JSON file path')
    parser.add_argument('--report', default=DEFAULT_REPORT,
                        help='Output report file path')
    parser.add_argument('-p', '--parallel', type=int, default=4,
                        help='Number of parallel workers')
    parser.add_argument('-t', '--threshold', type=float, default=0.7,
                        help='Similarity threshold (0-1)')
    parser.add_argument('--no-similarity', action='store_true',
                        help='Disable similarity analysis')
    parser.add_argument('--no-dependency', action='store_true',
                        help='Disable dependency analysis')
    parser.add_argument('--no-quality', action='store_true',
                        help='Disable quality assessment')
    parser.add_argument('--no-cache', action='store_true',
                        help='Disable cache')
    parser.add_argument('--verbose', '-v', action='store_true',
                        help='Verbose output')
    parser.add_argument('--config', default=CONFIG_FILE,
                        help='Config file path')
    parser.add_argument('--version', action='version',
                        version=f'{APP_NAME} v{VERSION}')
    return parser


def run_from_args(args: argparse.Namespace) -> None:
    config = dict(DEFAULT_CONFIG)
    config['root_dir'] = args.root
    config['output_file'] = args.output
    config['report_file'] = args.report
    config['parallel_workers'] = args.parallel
    config['similarity_threshold'] = args.threshold
    config['enable_similarity'] = not args.no_similarity
    config['enable_dependency'] = not args.no_dependency
    config['enable_quality'] = not args.no_quality
    config['cache_enabled'] = not args.no_cache

    analyzer = Analyzer(config)
    result = analyzer.run(verbose=args.verbose)

    analyzer.save_json(config['output_file'])
    analyzer.save_report(config['report_file'])

    print(f"\nDone! Total cases: {result.total_cases}, "
          f"Interfaces: {result.total_interfaces}")

def get_subsystem_distribution(cases: List[TestCase]) -> Dict[str, Any]:
    dist = Counter()
    for case in cases:
        subsystem = get_subsystem(case.file_path)
        dist[subsystem] += 1
    return {
        "total_subsystems": len(dist),
        "distribution": dict(dist.most_common()),
    }


def get_suite_distribution(cases: List[TestCase]) -> Dict[str, Any]:
    dist = Counter()
    for case in cases:
        suite = get_suite_name(case.file_path)
        dist[suite] += 1
    return {
        "total_suites": len(dist),
        "top_suites": dict(dist.most_common(50)),
    }


def get_file_distribution(cases: List[TestCase]) -> Dict[str, Any]:
    file_counts = Counter()
    for case in cases:
        file_counts[case.file_path] += 1
    return {
        "total_files": len(file_counts),
        "avg_cases_per_file": round(statistics.mean(file_counts.values()), 2),
        "max_cases_in_file": max(file_counts.values()),
        "top_files": dict(file_counts.most_common(20)),
    }


# ============================================================
# Section 18: Helper - Method Analysis
# ============================================================

def get_method_frequency(cases: List[TestCase]) -> Dict[str, int]:
    freq = Counter()
    for case in cases:
        for method in case.methods:
            freq[method] += 1
    return dict(freq.most_common())


def get_assertion_frequency(cases: List[TestCase]) -> Dict[str, int]:
    freq = Counter()
    for case in cases:
        for method in case.methods:
            if method in ASSERTION_METHODS:
                freq[method] += 1
    return dict(freq.most_common())


def get_non_assertion_methods(cases: List[TestCase]) -> Dict[str, int]:
    freq = Counter()
    for case in cases:
        for method in case.methods:
            if method not in ASSERTION_METHODS:
                freq[method] += 1
    return dict(freq.most_common())


def get_method_co_occurrence(cases: List[TestCase], top_n: int = 50) -> Dict[str, Any]:
    method_set = set()
    for case in cases:
        method_set.update(case.methods)
    top_methods = sorted(method_set)[:top_n]

    co_occurrence = defaultdict(lambda: defaultdict(int))
    for case in cases:
        case_methods = set(case.methods)
        for m1 in top_methods:
            if m1 not in case_methods:
                continue
            for m2 in top_methods:
                if m2 not in case_methods:
                    continue
                if m1 < m2:
                    co_occurrence[m1][m2] += 1

    result = {}
    for m1, partners in co_occurrence.items():
        top_partners = sorted(partners.items(), key=lambda x: x[1], reverse=True)[:10]
        result[m1] = [{"method": m, "count": c} for m, c in top_partners]
    return result

def extract_all_tags(cases: List[TestCase]) -> Dict[str, Any]:
    tag_values = defaultdict(Counter)
    for case in cases:
        for tag, value in case.tc_tags.items():
            tag_values[tag][value] += 1

    result = {}
    for tag, counter in tag_values.items():
        result[tag] = {
            "unique_values": len(counter),
            "top_values": dict(counter.most_common(50)),
        }
    return result


def get_tag_coverage(cases: List[TestCase]) -> Dict[str, float]:
    total = len(cases)
    if total == 0:
        return {}
    coverage = {}
    for tag in TC_TAGS:
        count = sum(1 for c in cases if tag in c.tc_tags)
        coverage[tag] = round(count / total * 100, 2)
    return coverage


def get_cases_without_tags(cases: List[TestCase]) -> List[str]:
    return [c.case_name for c in cases if not c.tc_tags]


# ============================================================
# Section 20: Pattern Detection
# ============================================================

class PatternDetector:
    """Detects common patterns in test cases."""

    def __init__(self, cases: List[TestCase]):
        self.cases = cases

    def detect_naming_patterns(self) -> Dict[str, Any]:
        prefix_counter = Counter()
        suffix_counter = Counter()
        number_ranges = defaultdict(int)

        for case in self.cases:
            name = case.case_name
            parts = name.split('_')
            if len(parts) >= 2:
                prefix_counter['_'.join(parts[:2])] += 1
            if len(parts) >= 1:
                suffix_counter[parts[-1]] += 1
            num_match = re.search(r'(\d{4})$', name)
            if num_match:
                num = int(num_match.group(1))
                bucket = (num // 100) * 100
                number_ranges[f"{bucket:04d}-{bucket+99:04d}"] += 1

        return {
            "top_prefixes": dict(prefix_counter.most_common(30)),
            "top_suffixes": dict(suffix_counter.most_common(20)),
            "number_distribution": dict(sorted(number_ranges.items())),
        }

    def detect_common_chains(self) -> Dict[str, Any]:
        chains = Counter()
        for case in self.cases:
            if len(case.methods) >= 2:
                for i in range(len(case.methods) - 1):
                    chain = f"{case.methods[i]} -> {case.methods[i+1]}"
                    chains[chain] += 1
        return {
            "total_chains": len(chains),
            "top_chains": dict(chains.most_common(50)),
        }

    def detect_outliers(self) -> Dict[str, Any]:
        if not self.cases:
            return {}
        complexities = [c.complexity_score for c in self.cases]
        avg_c = statistics.mean(complexities)
        std_c = statistics.stdev(complexities) if len(complexities) > 1 else 0
        threshold_high = avg_c + 2 * std_c
        threshold_low = avg_c - 2 * std_c

        outliers_high = [c for c in self.cases if c.complexity_score > threshold_high]
        outliers_low = [c for c in self.cases if c.complexity_score < threshold_low]

        return {
            "avg_complexity": round(avg_c, 2),
            "std_complexity": round(std_c, 2),
            "high_threshold": round(threshold_high, 2),
            "low_threshold": round(threshold_low, 2),
            "high_outlier_count": len(outliers_high),
            "low_outlier_count": len(outliers_low),
            "high_outlier_samples": [c.case_name for c in outliers_high[:20]],
            "low_outlier_samples": [c.case_name for c in outliers_low[:20]],
        }

    def detect_redundant_cases(self) -> Dict[str, Any]:
        method_groups = defaultdict(list)
        for case in self.cases:
            key = tuple(sorted(case.methods))
            method_groups[key].append(case.case_name)

        redundant = {}
        for key, names in method_groups.items():
            if len(names) >= 3:
                redundant[f"({len(key)} methods, {len(names)} cases)"] = names[:10]

        return {
            "total_redundant_groups": len(redundant),
            "sample_groups": dict(list(redundant.items())[:30]),
        }


# ============================================================
# Section 21: Trend Analysis
# ============================================================

class TrendAnalyzer:
    """Analyzes trends in test case distribution."""

    def __init__(self, cases: List[TestCase]):
        self.cases = cases

    def analyze_by_subsystem(self) -> List[Dict[str, Any]]:
        groups = defaultdict(list)
        for case in self.cases:
            subsystem = get_subsystem(case.file_path)
            groups[subsystem].append(case)

        result = []
        for subsystem, case_list in sorted(groups.items(),
                                            key=lambda x: len(x[1]), reverse=True):
            avg_methods = statistics.mean([len(c.methods) for c in case_list])
            avg_assertions = statistics.mean([c.assertion_count for c in case_list])
            avg_complexity = statistics.mean([c.complexity_score for c in case_list])
            result.append({
                "subsystem": subsystem,
                "case_count": len(case_list),
                "file_count": len(set(c.file_path for c in case_list)),
                "avg_methods": round(avg_methods, 2),
                "avg_assertions": round(avg_assertions, 2),
                "avg_complexity": round(avg_complexity, 2),
            })
        return result

    def analyze_by_directory_depth(self) -> Dict[str, Any]:
        depth_counter = Counter()
        for case in self.cases:
            rel_path = case.file_path.replace('\\', '/')
            parts = rel_path.split('/')
            depth = len(parts)
            depth_counter[depth] += 1

        return {
            "depth_distribution": dict(sorted(depth_counter.items())),
            "avg_depth": round(statistics.mean(depth_counter.elements()), 2) if depth_counter else 0,
        }

    def analyze_interface_distribution(self) -> Dict[str, Any]:
        iface_to_subsystem = defaultdict(set)
        for case in self.cases:
            subsystem = get_subsystem(case.file_path)
            for method in case.methods:
                iface_to_subsystem[method].add(subsystem)

        cross_subsystem = {}
        single_subsystem = {}
        for iface, systems in iface_to_subsystem.items():
            if len(systems) > 1:
                cross_subsystem[iface] = sorted(systems)
            else:
                single_subsystem[iface] = sorted(systems)

        return {
            "total_interfaces": len(iface_to_subsystem),
            "cross_subsystem_interfaces": len(cross_subsystem),
            "single_subsystem_interfaces": len(single_subsystem),
            "sample_cross_subsystem": dict(list(cross_subsystem.items())[:30]),
        }


# ============================================================
# Section 22: Export Utilities
# ============================================================

class ExportUtils:
    """Utilities for exporting data in various formats."""

    @staticmethod
    def to_csv(cases: List[TestCase], output_path: str) -> None:
        ensure_dir(output_path)
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write("case_name,file_path,methods,assertion_count,complexity_score\n")
            for case in cases:
                methods_str = ';'.join(case.methods)
                f.write(f'"{case.case_name}","{case.file_path}",'
                        f'"{methods_str}",{case.assertion_count},'
                        f'{case.complexity_score}\n')
        print(f"[EXPORT] CSV saved: {output_path}")

    @staticmethod
    def to_markdown(result: AnalysisResult, output_path: str) -> None:
        ensure_dir(output_path)
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(f"# {APP_NAME} v{VERSION} Report\n\n")
            f.write(f"Generated: {result.timestamp}\n\n")
            f.write("## Overview\n\n")
            f.write(f"| Metric | Value |\n|--------|-------|\n")
            f.write(f"| Total Files | {result.total_files} |\n")
            f.write(f"| Total Cases | {result.total_cases} |\n")
            f.write(f"| Total Interfaces | {result.total_interfaces} |\n\n")

            f.write("## Top 20 Interfaces\n\n")
            f.write("| Interface | Calls | Cases |\n|-----------|-------|-------|\n")
            for iface in result.interfaces[:20]:
                f.write(f"| {iface['name']} | {iface['call_count']} | {iface['case_count']} |\n")
            f.write("\n")

            f.write("## Top 20 Prefix Groups\n\n")
            f.write("| Prefix | Count |\n|--------|-------|\n")
            for group in result.prefix_groups[:20]:
                f.write(f"| {group['group_key']} | {group['case_count']} |\n")
            f.write("\n")

            f.write("## Statistics\n\n")
            for key, value in result.statistics.items():
                f.write(f"- **{key}**: {value}\n")
        print(f"[EXPORT] Markdown saved: {output_path}")

    @staticmethod
    def to_summary_text(result: AnalysisResult) -> str:
        lines = []
        lines.append(f"Total cases: {result.total_cases}")
        lines.append(f"Total interfaces: {result.total_interfaces}")
        lines.append(f"Total files: {result.total_files}")
        lines.append(f"Prefix groups: {len(result.prefix_groups)}")
        lines.append(f"Token groups: {len(result.token_groups)}")
        lines.append(f"Similarity clusters: {len(result.similarity_clusters)}")
        return '\n'.join(lines)

class Validator:
    """Validates test case data."""

    @staticmethod
    def validate_case_name(name: str) -> bool:
        if not name or len(name) < 3:
            return False
        if not re.match(r'^[A-Za-z0-9_]+$', name):
            return False
        if name.startswith('_') or name.endswith('_'):
            return False
        return True

    @staticmethod
    def validate_methods(methods: List[str]) -> bool:
        if not methods:
            return False
        for m in methods:
            if not re.match(r'^[A-Za-z_]\w*$', m):
                return False
        return True

    @staticmethod
    def validate_file_path(path: str) -> bool:
        if not path:
            return False
        if not os.path.exists(path):
            return False
        return True

    @staticmethod
    def validate_cases(cases: List[TestCase]) -> Dict[str, Any]:
        invalid_names = []
        invalid_methods = []
        invalid_paths = []

        for case in cases:
            if not Validator.validate_case_name(case.case_name):
                invalid_names.append(case.case_name)
            if not Validator.validate_methods(case.methods):
                invalid_methods.append(case.case_name)
            if not Validator.validate_file_path(case.file_path):
                invalid_paths.append(case.case_name)

        return {
            "total_cases": len(cases),
            "invalid_name_count": len(invalid_names),
            "invalid_method_count": len(invalid_methods),
            "invalid_path_count": len(invalid_paths),
            "invalid_name_samples": invalid_names[:20],
            "invalid_method_samples": invalid_methods[:20],
            "invalid_path_samples": invalid_paths[:20],
            "is_valid": len(invalid_names) == 0 and len(invalid_methods) == 0,
        }

class StatsCalculator:
    """Calculates detailed statistics for test cases."""

    @staticmethod
    def percentile(data: List[float], p: float) -> float:
        if not data:
            return 0.0
        sorted_data = sorted(data)
        n = len(sorted_data)
        k = (n - 1) * p / 100.0
        f = int(k)
        c = k - f
        if f + 1 < n:
            return sorted_data[f] + c * (sorted_data[f + 1] - sorted_data[f])
        return float(sorted_data[f])

    @staticmethod
    def compute_distribution_stats(data: List[float]) -> Dict[str, float]:
        if not data:
            return {"count": 0}
        return {
            "count": len(data),
            "mean": round(statistics.mean(data), 2),
            "median": round(statistics.median(data), 2),
            "stdev": round(statistics.stdev(data), 2) if len(data) > 1 else 0.0,
            "min": round(min(data), 2),
            "max": round(max(data), 2),
            "p25": round(StatsCalculator.percentile(data, 25), 2),
            "p50": round(StatsCalculator.percentile(data, 50), 2),
            "p75": round(StatsCalculator.percentile(data, 75), 2),
            "p90": round(StatsCalculator.percentile(data, 90), 2),
            "p95": round(StatsCalculator.percentile(data, 95), 2),
            "p99": round(StatsCalculator.percentile(data, 99), 2),
        }

    @staticmethod
    def compute_all_stats(cases: List[TestCase]) -> Dict[str, Any]:
        return {
            "methods_per_case": StatsCalculator.compute_distribution_stats(
                [len(c.methods) for c in cases]
            ),
            "body_length": StatsCalculator.compute_distribution_stats(
                [c.body_length for c in cases]
            ),
            "assertion_count": StatsCalculator.compute_distribution_stats(
                [c.assertion_count for c in cases]
            ),
            "complexity_score": StatsCalculator.compute_distribution_stats(
                [c.complexity_score for c in cases]
            ),
        }

def main():
    parser = build_arg_parser()
    args = parser.parse_args()
    run_from_args(args)
