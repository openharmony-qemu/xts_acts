#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os, re, json, time, math, hashlib, argparse, sqlite3, logging, bisect, sys, traceback
from collections import defaultdict, Counter
from datetime import datetime
from typing import List, Dict, Set, Tuple, Optional, Any, Callable
from dataclasses import dataclass, field
from functools import wraps
from enum import Enum

try:
    import statistics
    HAS_STATISTICS = True
except ImportError:
    HAS_STATISTICS = False

try:
    from multiprocessing import Pool
    HAS_MULTIPROCESSING = True
except ImportError:
    HAS_MULTIPROCESSING = False

VERSION = "3.1.0"
APP_NAME = "XTS Test Quality Manager"
DEFAULT_ROOT = r"D:\gdata\xts_acts_7538"
DEFAULT_DB_PATH = r"D:\gdata\ai\quality_manager.db"
DEFAULT_OUTPUT_DIR = r"D:\gdata\ai\quality_reports"
DEFAULT_CONFIG_PATH = r"D:\gdata\ai\quality_config.json"

BATCH_SIZE = 500

QUALITY_LEVELS = {
    "A": {"min_score": 90, "label": "优秀", "color": "#28a745"},
    "B": {"min_score": 75, "label": "良好", "color": "#17a2b8"},
    "C": {"min_score": 60, "label": "合格", "color": "#ffc107"},
    "D": {"min_score": 40, "label": "不合格", "color": "#fd7e14"},
    "E": {"min_score": 0, "label": "风险", "color": "#dc3545"},
}

CATEGORY_WEIGHTS = {
    "coverage": 0.20, "complexity": 0.15, "stability": 0.20,
    "performance": 0.15, "maintainability": 0.15, "reliability": 0.15,
}

RISK_FACTORS = {
    "no_assertions": {"weight": 3, "severity": "HIGH"},
    "high_complexity": {"weight": 2, "severity": "MEDIUM"},
    "low_coverage": {"weight": 3, "severity": "HIGH"},
    "frequent_failure": {"weight": 5, "severity": "CRITICAL"},
    "long_execution": {"weight": 2, "severity": "MEDIUM"},
    "missing_tags": {"weight": 1, "severity": "LOW"},
    "no_description": {"weight": 1, "severity": "LOW"},
}

TC_TAG_NAMES = ["@tc.name", "@tc.number", "@tc.desc", "@tc.type", "@tc.size", "@tc.level"]

ASSERTION_KEYWORDS = frozenset({
    "assertEqual", "assertTrue", "assertFalse", "assertNull",
    "assertNotNull", "assertUndefined", "assertNotUndefined",
    "assertContain", "assertNotContain", "assertLarger",
    "assertLess", "assertLessOrEqual", "assertLargerOrEqual",
    "assertInstanceOf", "assertDeepEquals", "assertPromiseIsResolved",
    "assertThrowError", "assertNotThrowError", "expect",
})

SKIP_KEYWORDS = frozenset({
    "if", "for", "while", "switch", "catch", "function", "return",
    "async", "await", "let", "const", "var", "of", "in", "do",
    "try", "throw", "typeof", "instanceof", "void", "this",
    "delete", "then", "finally", "class", "extends", "super",
    "yield", "continue", "break", "case", "default", "else",
    "new", "import", "export", "from", "static", "console", "log",
    "print", "resolve", "reject", "all", "race", "apply", "call",
    "bind", "keys", "values", "entries", "assign", "freeze",
    "create", "defineProperty", "getPrototypeOf",
    "isArray", "of", "from", "push", "pop", "shift",
    "unshift", "splice", "slice", "concat", "join",
    "reverse", "sort", "indexOf", "includes", "find",
})

FILE_EXTENSIONS = [".test.ets"]
SKIP_DIRS = {".git", "node_modules", "build", ".idea", ".vscode", "test_common"}

class ReportFormat(Enum):
    JSON = "json"
    HTML = "html"
    MARKDOWN = "markdown"
    CSV = "csv"
    TEXT = "text"

DEFAULT_CONFIG = {
    "root_dir": DEFAULT_ROOT, "db_path": DEFAULT_DB_PATH,
    "output_dir": DEFAULT_OUTPUT_DIR, "config_path": DEFAULT_CONFIG_PATH,
    "max_workers": 4, "enable_coverage": True, "enable_complexity": True,
    "enable_stability": True, "enable_performance": True, "enable_risk": True,
    "coverage_threshold": 0.7, "complexity_threshold": 70.0,
    "performance_threshold": 10.0, "stability_threshold": 0.8,
    "similarity_threshold": 0.75, "max_cases_per_report": 5000,
    "batch_size": BATCH_SIZE, "cache_enabled": True,
}

@dataclass
class CaseMetrics:
    case_name: str
    file_path: str
    line_number: int
    assertion_count: int
    method_count: int
    body_length: int
    complexity_score: float
    has_description: bool
    has_tc_tags: bool
    tc_type: str
    tc_level: str
    tc_size: str
    execution_time: float = 0.0
    pass_count: int = 0
    fail_count: int = 0
    error_count: int = 0
    skip_count: int = 0
    last_result: str = "unknown"
    last_run_time: str = ""
    dependencies: List[str] = field(default_factory=list)
    tags: List[str] = field(default_factory=list)
    methods: List[str] = field(default_factory=list)

    @property
    def total_runs(self) -> int:
        return self.pass_count + self.fail_count + self.error_count + self.skip_count

    @property
    def pass_rate(self) -> float:
        total = self.total_runs
        return self.pass_count / total if total > 0 else 0.0

    @property
    def fail_rate(self) -> float:
        total = self.total_runs
        return (self.fail_count + self.error_count) / total if total > 0 else 0.0

    def to_dict(self) -> Dict[str, Any]:
        return {
            "case_name": self.case_name, "file_path": self.file_path,
            "line_number": self.line_number, "assertion_count": self.assertion_count,
            "method_count": self.method_count, "body_length": self.body_length,
            "complexity_score": self.complexity_score,
            "has_description": self.has_description, "has_tc_tags": self.has_tc_tags,
            "tc_type": self.tc_type, "tc_level": self.tc_level, "tc_size": self.tc_size,
            "execution_time": self.execution_time, "pass_count": self.pass_count,
            "fail_count": self.fail_count, "error_count": self.error_count,
            "skip_count": self.skip_count, "last_result": self.last_result,
            "last_run_time": self.last_run_time, "total_runs": self.total_runs,
            "pass_rate": round(self.pass_rate, 4), "fail_rate": round(self.fail_rate, 4),
            "dependencies": self.dependencies, "tags": self.tags, "methods": self.methods,
        }

@dataclass
class QualityIssue:
    case_name: str
    file_path: str
    category: str
    severity: str
    description: str
    suggestion: str
    metric_value: Any
    threshold: Any

    def to_dict(self) -> Dict[str, Any]:
        return {
            "case_name": self.case_name, "file_path": self.file_path,
            "category": self.category, "severity": self.severity,
            "description": self.description, "suggestion": self.suggestion,
            "metric_value": self.metric_value, "threshold": self.threshold,
        }

@dataclass
class QualityScore:
    case_name: str
    overall_score: float
    grade: str
    coverage_score: float
    complexity_score: float
    stability_score: float
    performance_score: float
    maintainability_score: float
    reliability_score: float
    issues: List[QualityIssue] = field(default_factory=list)

    def to_dict(self) -> Dict[str, Any]:
        return {
            "case_name": self.case_name, "overall_score": round(self.overall_score, 2),
            "grade": self.grade, "coverage_score": round(self.coverage_score, 2),
            "complexity_score": round(self.complexity_score, 2),
            "stability_score": round(self.stability_score, 2),
            "performance_score": round(self.performance_score, 2),
            "maintainability_score": round(self.maintainability_score, 2),
            "reliability_score": round(self.reliability_score, 2),
            "issue_count": len(self.issues),
            "issues": [i.to_dict() for i in self.issues],
        }

@dataclass
class AnalysisContext:
    timestamp: str
    root_dir: str
    total_files: int
    total_cases: int
    duration_seconds: float
    status: str
    config: Dict[str, Any] = field(default_factory=dict)
    errors: List[str] = field(default_factory=list)
    warnings: List[str] = field(default_factory=list)

    def to_dict(self) -> Dict[str, Any]:
        return {
            "timestamp": self.timestamp, "root_dir": self.root_dir,
            "total_files": self.total_files, "total_cases": self.total_cases,
            "duration_seconds": round(self.duration_seconds, 2),
            "status": self.status,
            "config": {k: v for k, v in self.config.items()
                       if isinstance(v, (str, int, float, bool))},
            "errors": self.errors, "warnings": self.warnings,
        }

@dataclass
class QualityReport:
    context: AnalysisContext
    scores: List[QualityScore]
    summary: Dict[str, Any]
    grade_distribution: Dict[str, int]
    top_issues: List[Dict[str, Any]]
    subsystem_stats: List[Dict[str, Any]]
    recommendations: List[str]

    def to_dict(self) -> Dict[str, Any]:
        return {
            "context": self.context.to_dict(),
            "scores": [s.to_dict() for s in self.scores],
            "summary": self.summary, "grade_distribution": self.grade_distribution,
            "top_issues": self.top_issues, "subsystem_stats": self.subsystem_stats,
            "recommendations": self.recommendations,
        }

def timer(func: Callable) -> Callable:
    @wraps(func)
    def wrapper(*args, **kwargs):
        start = time.time()
        result = func(*args, **kwargs)
        elapsed = time.time() - start
        logging.info(f"[TIMER] {func.__name__} completed in {elapsed:.2f}s")
        return result
    return wrapper

def ensure_dir(path: str) -> None:
    dir_path = os.path.dirname(path)
    if dir_path and not os.path.exists(dir_path):
        os.makedirs(dir_path, exist_ok=True)

def safe_read_file(path: str) -> str:
    for encoding in ('utf-8', 'utf-8-sig', 'gbk', 'latin-1'):
        try:
            with open(path, 'r', encoding=encoding) as f:
                return f.read()
        except (UnicodeDecodeError, OSError):
            continue
    return ""

def file_md5(path: str) -> str:
    hash_md5 = hashlib.md5()
    try:
        with open(path, 'rb') as f:
            for chunk in iter(lambda: f.read(8192), b''):
                hash_md5.update(chunk)
        return hash_md5.hexdigest()
    except Exception:
        return ""

def format_size(size_bytes: int) -> str:
    if size_bytes < 1024:
        return f"{size_bytes} B"
    elif size_bytes < 1048576:
        return f"{size_bytes / 1024:.2f} KB"
    elif size_bytes < 1073741824:
        return f"{size_bytes / 1048576:.2f} MB"
    return f"{size_bytes / 1073741824:.2f} GB"

def format_time(seconds: float) -> str:
    if seconds < 60:
        return f"{seconds:.2f}s"
    elif seconds < 3600:
        return f"{int(seconds // 60)}m {seconds % 60:.2f}s"
    return f"{int(seconds // 3600)}h {int((seconds % 3600) // 60)}m"

def normalize_path(path: str) -> str:
    return path.replace('\\', '/')

def get_subsystem(filepath: str) -> str:
    parts = normalize_path(filepath).split('/')
    for i, p in enumerate(parts):
        if p.startswith('xts_acts') and i + 1 < len(parts):
            return parts[i + 1]
    return "unknown"

def calculate_grade(score: float) -> str:
    for grade, info in QUALITY_LEVELS.items():
        if score >= info["min_score"]:
            return grade
    return "E"

def calculate_weighted_score(scores: Dict[str, float]) -> float:
    total = 0.0
    for category, weight in CATEGORY_WEIGHTS.items():
        total += scores.get(category, 0.0) * weight
    return round(total, 2)

def levenshtein_distance(s1: str, s2: str) -> int:
    if len(s1) < len(s2):
        return levenshtein_distance(s2, s1)
    if len(s2) == 0:
        return len(s1)
    prev_row = list(range(len(s2) + 1))
    for i, c1 in enumerate(s1):
        curr_row = [i + 1]
        for j, c2 in enumerate(s2):
            curr_row.append(min(prev_row[j + 1] + 1, curr_row[j] + 1,
                                prev_row[j] + (c1 != c2)))
        prev_row = curr_row
    return prev_row[-1]

def string_similarity(s1: str, s2: str) -> float:
    max_len = max(len(s1), len(s2))
    if max_len == 0:
        return 1.0
    return 1.0 - (levenshtein_distance(s1, s2) / max_len)

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

def safe_mean(data: List[float]) -> float:
    if not data:
        return 0.0
    return statistics.mean(data) if HAS_STATISTICS else sum(data) / len(data)

def safe_stdev(data: List[float]) -> float:
    if len(data) < 2:
        return 0.0
    if HAS_STATISTICS:
        return statistics.stdev(data)
    m = safe_mean(data)
    return math.sqrt(sum((x - m) ** 2 for x in data) / (len(data) - 1))

def safe_median(data: List[float]) -> float:
    if not data:
        return 0.0
    return statistics.median(data) if HAS_STATISTICS else (
        sorted(data)[len(data) // 2] if len(data) % 2 else
        (sorted(data)[len(data) // 2 - 1] + sorted(data)[len(data) // 2]) / 2
    )

def progress_bar(current: int, total: int, width: int = 40) -> str:
    if total == 0:
        return "[" + "=" * width + "] 100%"
    percent = current / total
    filled = int(width * percent)
    bar = "=" * filled + " " * (width - filled)
    return f"[{bar}] {percent * 100:.1f}% ({current}/{total})"

class SourceParser:
    """Parses .test.ets source files to extract test case metrics."""

    IT_PATTERN = re.compile(r'\bit\s*\(')
    TAG_PATTERN = re.compile(r'@tc\.(\w+)\s+(.+?)(?:\n|\*|$)')

    def __init__(self):
        self._line_offsets: List[int] = []

    def _build_line_offsets(self, text: str) -> None:
        self._line_offsets = [0]
        for i, ch in enumerate(text):
            if ch == '\n':
                self._line_offsets.append(i + 1)

    def _get_line_number(self, pos: int) -> int:
        return bisect.bisect_right(self._line_offsets, pos)

    @staticmethod
    def _skip_string(text: str, i: int, length: int, quote: str) -> int:
        i += 1
        while i < length:
            if text[i] == '\\':
                i += 2
                continue
            if text[i] == quote:
                return i
            i += 1
        return i

    @staticmethod
    def _skip_comment(text: str, i: int, length: int) -> int:
        if text[i + 1] == '/':
            while i < length and text[i] != '\n':
                i += 1
        elif text[i + 1] == '*':
            i += 2
            while i + 1 < length:
                if text[i] == '*' and text[i + 1] == '/':
                    return i + 1
                i += 1
        return i

    @classmethod
    def _find_matching_brace(cls, text: str, start: int) -> int:
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
            elif ch in ("'", '`', '"'):
                i = cls._skip_string(text, i, length, ch)
            elif ch == '/' and i + 1 < length and text[i + 1] in '/*':
                i = cls._skip_comment(text, i, length)
            i += 1
        return -1

    @classmethod
    def _find_first_brace(cls, text: str, start: int, max_scan: int = 300) -> int:
        i = start
        length = len(text)
        count = 0
        while i < length and count < max_scan:
            ch = text[i]
            if ch == '{':
                return i
            elif ch in ("'", '`', '"'):
                i = cls._skip_string(text, i, length, ch)
            elif ch == '/' and i + 1 < length and text[i + 1] in '/*':
                i = cls._skip_comment(text, i, length)
            i += 1
            count += 1
        return -1

    @staticmethod
    def _extract_methods(body: str) -> List[str]:
        methods = set()
        for m in re.finditer(r'\.?(\w+)\s*\(', body):
            name = m.group(1)
            if name not in SKIP_KEYWORDS:
                methods.add(name)
        return sorted(methods)

    @staticmethod
    def _extract_assertion_count(body: str) -> int:
        return sum(len(re.findall(r'\.' + m + r'\s*\(', body))
                   for m in ASSERTION_KEYWORDS)

    @staticmethod
    def _extract_tc_tags(text: str) -> Dict[str, str]:
        tags = {}
        for m in re.finditer(r'@tc\.(\w+)\s+(.+?)(?:\n|\*|$)', text):
            tags[f"@tc.{m.group(1).lower()}"] = m.group(2).strip().rstrip('*').strip()
        return tags

    @staticmethod
    def _extract_case_name(param_str: str) -> str:
        m = re.match(r"['\"](.+?)['\"]", param_str.strip())
        return m.group(1) if m else param_str.strip()

    @staticmethod
    def _compute_complexity(methods: List[str], body_length: int,
                            assertion_count: int) -> float:
        method_score = min(len(methods) / 20.0, 1.0) * 30
        length_score = min(body_length / 2000.0, 1.0) * 30
        assert_score = min(assertion_count / 10.0, 1.0) * 40
        return round(method_score + length_score + assert_score, 2)

    @staticmethod
    def _has_description(text: str) -> bool:
        return bool(re.search(r'(@tc\.desc|//.*desc|/\*.*desc)', text, re.IGNORECASE))

    def parse_file(self, filepath: str) -> List[CaseMetrics]:
        content = safe_read_file(filepath)
        if not content:
            return []

        self._build_line_offsets(content)
        results: List[CaseMetrics] = []
        search_from = 0

        while True:
            m = self.IT_PATTERN.search(content, search_from)
            if not m:
                break

            it_start = m.start()
            line_no = self._get_line_number(it_start)
            text_before = content[max(0, it_start - 500):it_start]
            tc_tags = self._extract_tc_tags(text_before)

            brace_idx = self._find_first_brace(content, m.end())
            if brace_idx == -1:
                search_from = m.end()
                continue

            body_end = self._find_matching_brace(content, brace_idx)
            if body_end == -1:
                search_from = brace_idx + 1
                continue

            param_str = re.sub(r'=>\s*$', '', content[m.end():brace_idx].strip()).strip()
            body = content[brace_idx + 1:body_end]
            methods = self._extract_methods(body)
            assertion_count = self._extract_assertion_count(body)
            case_name = self._extract_case_name(param_str)
            complexity = self._compute_complexity(methods, len(body), assertion_count)

            results.append(CaseMetrics(
                case_name=case_name, file_path=filepath, line_number=line_no,
                assertion_count=assertion_count, method_count=len(methods),
                body_length=len(body), complexity_score=complexity,
                has_description=self._has_description(text_before + body),
                has_tc_tags=len(tc_tags) > 0,
                tc_type=tc_tags.get("@tc.type", "UNKNOWN"),
                tc_level=tc_tags.get("@tc.level", "UNKNOWN"),
                tc_size=tc_tags.get("@tc.size", "UNKNOWN"),
                methods=methods,
            ))
            search_from = body_end + 1

        return results

class FileScanner:
    """Scans directories for test files."""

    def __init__(self, root: str, extensions: Optional[List[str]] = None,
                 skip_dirs: Optional[Set[str]] = None):
        self.root = root
        self.extensions = extensions or FILE_EXTENSIONS
        self.skip_dirs = skip_dirs or SKIP_DIRS
        self.files: List[str] = []

    def scan(self) -> List[str]:
        self.files = []
        if not os.path.exists(self.root):
            logging.warning(f"Root directory does not exist: {self.root}")
            return []
        for dirpath, dirnames, filenames in os.walk(self.root):
            dirnames[:] = [d for d in dirnames if d not in self.skip_dirs]
            for fn in filenames:
                if any(fn.endswith(ext) for ext in self.extensions):
                    self.files.append(os.path.join(dirpath, fn))
        logging.info(f"Scanned {len(self.files)} files from {self.root}")
        return self.files

    def scan_incremental(self, cache: Dict[str, str]) -> Tuple[List[str], List[str]]:
        all_files = self.scan()
        new_files, changed_files = [], []
        for f in all_files:
            md5 = file_md5(f)
            if f not in cache:
                new_files.append(f)
            elif cache[f] != md5:
                changed_files.append(f)
            cache[f] = md5
        return new_files, changed_files

class MetricsCollector:
    """Collects test case metrics from source files."""

    def __init__(self, config: Dict[str, Any]):
        self.config = config
        self.parser = SourceParser()
        self.metrics: List[CaseMetrics] = []
        self.file_metrics_map: Dict[str, List[CaseMetrics]] = defaultdict(list)

    def collect(self, files: List[str], verbose: bool = True) -> List[CaseMetrics]:
        self.metrics = []
        total = len(files)
        for i, filepath in enumerate(files):
            if verbose and (i + 1) % 500 == 0:
                print(f"  Parsing: {progress_bar(i + 1, total)}")
            cases = self.parser.parse_file(filepath)
            for case in cases:
                self.metrics.append(case)
                self.file_metrics_map[filepath].append(case)
        if verbose:
            print(f"  Total cases collected: {len(self.metrics)}")
        return self.metrics

    def collect_parallel(self, files: List[str], workers: int = 4) -> List[CaseMetrics]:
        if not HAS_MULTIPROCESSING or workers <= 1:
            return self.collect(files)
        parser = SourceParser()
        chunks = [files[i::workers] for i in range(workers)]

        def parse_chunk(chunk: List[str]) -> List[CaseMetrics]:
            results: List[CaseMetrics] = []
            for filepath in chunk:
                results.extend(parser.parse_file(filepath))
            return results

        with Pool(workers) as pool:
            all_results = pool.map(parse_chunk, chunks)

        self.metrics = []
        for chunk_results in all_results:
            for case in chunk_results:
                self.metrics.append(case)
                self.file_metrics_map[case.file_path].append(case)
        return self.metrics

class QualityScorer:
    """Calculates quality scores for test cases."""

    def __init__(self, metrics: List[CaseMetrics], config: Dict[str, Any]):
        self.metrics = metrics
        self.config = config
        self.scores: List[QualityScore] = []

    def score_all(self) -> List[QualityScore]:
        self.scores = [self.score_case(m) for m in self.metrics]
        return self.scores

    def score_case(self, m: CaseMetrics) -> QualityScore:
        issues: List[QualityIssue] = []
        coverage = self._calc_coverage(m, issues)
        complexity = self._calc_complexity(m, issues)
        stability = self._calc_stability(m, issues)
        performance = self._calc_performance(m, issues)
        maintainability = self._calc_maintainability(m, issues)
        reliability = self._calc_reliability(m, issues)

        sub_scores = {
            "coverage": coverage, "complexity": complexity,
            "stability": stability, "performance": performance,
            "maintainability": maintainability, "reliability": reliability,
        }
        overall = calculate_weighted_score(sub_scores)
        return QualityScore(
            case_name=m.case_name, overall_score=overall,
            grade=calculate_grade(overall),
            coverage_score=coverage, complexity_score=complexity,
            stability_score=stability, performance_score=performance,
            maintainability_score=maintainability, reliability_score=reliability,
            issues=issues,
        )

    def _add_issue(self, issues, m, cat, sev, desc, sug, val, thr):
        issues.append(QualityIssue(m.case_name, m.file_path, cat, sev,
                                   desc, sug, val, thr))

    def _calc_coverage(self, m: CaseMetrics, issues: List[QualityIssue]) -> float:
        score = 100.0
        if m.assertion_count == 0:
            score -= 40
            self._add_issue(issues, m, "coverage", "HIGH",
                            "No assertions found", "Add assertion statements", 0, ">=1")
        elif m.assertion_count < 3:
            score -= 15
            self._add_issue(issues, m, "coverage", "MEDIUM",
                            "Insufficient assertions", "Add more assertions",
                            m.assertion_count, ">=3")
        if not m.has_tc_tags:
            score -= 20
            self._add_issue(issues, m, "coverage", "MEDIUM",
                            "Missing @tc.* tags", "Add @tc.name, @tc.type, @tc.level", 0, ">=1")
        return max(score, 0.0)

    def _calc_complexity(self, m: CaseMetrics, issues: List[QualityIssue]) -> float:
        score = 100.0
        thr = self.config.get("complexity_threshold", 70.0)
        if m.complexity_score >= thr:
            score -= 30
            self._add_issue(issues, m, "complexity", "HIGH",
                            "High complexity score", "Refactor to reduce complexity",
                            m.complexity_score, thr)
        elif m.complexity_score >= thr * 0.7:
            score -= 15
            self._add_issue(issues, m, "complexity", "MEDIUM",
                            "Moderate complexity", "Consider simplifying",
                            m.complexity_score, thr * 0.7)
        if m.body_length > 5000:
            score -= 10
            self._add_issue(issues, m, "complexity", "LOW",
                            "Test body too long", "Split into smaller tests",
                            m.body_length, 5000)
        return max(score, 0.0)

    def _calc_stability(self, m: CaseMetrics, issues: List[QualityIssue]) -> float:
        score = 100.0
        if m.total_runs > 0:
            if m.fail_rate > 0.3:
                score -= 50
                self._add_issue(issues, m, "stability", "CRITICAL",
                                "High failure rate", "Investigate flaky test",
                                round(m.fail_rate, 4), 0.3)
            elif m.fail_rate > 0.1:
                score -= 25
                self._add_issue(issues, m, "stability", "HIGH",
                                "Elevated failure rate", "Monitor intermittent failures",
                                round(m.fail_rate, 4), 0.1)
            elif m.fail_rate > 0:
                score -= 10
                self._add_issue(issues, m, "stability", "MEDIUM",
                                "Occasional failures", "Check race conditions",
                                round(m.fail_rate, 4), 0.0)
        else:
            score -= 5
            self._add_issue(issues, m, "stability", "INFO",
                            "No execution history", "Run tests to gather data", 0, ">0")
        return max(score, 0.0)

    def _calc_performance(self, m: CaseMetrics, issues: List[QualityIssue]) -> float:
        score = 100.0
        thr = self.config.get("performance_threshold", 10.0)
        if m.execution_time > thr:
            score -= 30
            self._add_issue(issues, m, "performance", "HIGH",
                            "Execution time exceeds threshold", "Optimize performance",
                            round(m.execution_time, 2), thr)
        elif m.execution_time > thr * 0.5:
            score -= 15
            self._add_issue(issues, m, "performance", "MEDIUM",
                            "Execution time approaching threshold", "Consider optimizing",
                            round(m.execution_time, 2), thr * 0.5)
        return max(score, 0.0)

    def _calc_maintainability(self, m: CaseMetrics, issues: List[QualityIssue]) -> float:
        score = 100.0
        if not m.has_description:
            score -= 15
            self._add_issue(issues, m, "maintainability", "LOW",
                            "Missing description", "Add description", False, True)
        if m.method_count > 30:
            score -= 20
            self._add_issue(issues, m, "maintainability", "MEDIUM",
                            "Too many method calls", "Reduce for readability",
                            m.method_count, 30)
        if m.body_length > 3000:
            score -= 10
            self._add_issue(issues, m, "maintainability", "LOW",
                            "Body too long for maintenance", "Refactor into smaller tests",
                            m.body_length, 3000)
        return max(score, 0.0)

    def _calc_reliability(self, m: CaseMetrics, issues: List[QualityIssue]) -> float:
        score = 100.0
        if m.assertion_count == 0 and m.method_count == 0:
            score -= 60
            self._add_issue(issues, m, "reliability", "CRITICAL",
                            "Empty test case", "Add meaningful test logic", 0, ">0")
        if m.tc_type == "UNKNOWN":
            score -= 10
            self._add_issue(issues, m, "reliability", "LOW",
                            "Missing test type", "Add @tc.type tag", "UNKNOWN", "Defined")
        if m.tc_level == "UNKNOWN":
            score -= 5
            self._add_issue(issues, m, "reliability", "LOW",
                            "Missing test level", "Add @tc.level tag", "UNKNOWN", "Defined")
        return max(score, 0.0)

class RiskAssessor:
    """Assesses risk levels of test cases."""

    def __init__(self, metrics: List[CaseMetrics], scores: List[QualityScore]):
        self.metrics = metrics
        self.scores = scores
        self.risk_assessments: List[Dict[str, Any]] = []

    def assess_all(self) -> List[Dict[str, Any]]:
        self.risk_assessments = [
            self.assess_case(m, s) for m, s in zip(self.metrics, self.scores)
        ]
        return self.risk_assessments

    def assess_case(self, m: CaseMetrics, s: QualityScore) -> Dict[str, Any]:
        factors, total_risk = [], 0
        checks = [
            (m.assertion_count == 0, "no_assertions"),
            (s.complexity_score < 50, "high_complexity"),
            (m.fail_rate > 0.2, "frequent_failure"),
            (m.execution_time > 15.0, "long_execution"),
            (not m.has_tc_tags, "missing_tags"),
            (not m.has_description, "no_description"),
        ]
        for condition, factor_name in checks:
            if condition:
                factor = RISK_FACTORS[factor_name]
                factors.append({"factor": factor_name, "weight": factor["weight"],
                                "severity": factor["severity"]})
                total_risk += factor["weight"]
        return {
            "case_name": m.case_name, "file_path": m.file_path,
            "total_risk": total_risk,
            "risk_level": self._determine_risk_level(total_risk),
            "risk_factors": factors, "quality_grade": s.grade,
            "overall_score": s.overall_score,
        }

    @staticmethod
    def _determine_risk_level(total_risk: int) -> str:
        if total_risk >= 10:
            return "CRITICAL"
        elif total_risk >= 7:
            return "HIGH"
        elif total_risk >= 4:
            return "MEDIUM"
        elif total_risk >= 2:
            return "LOW"
        return "MINIMAL"

class DuplicateDetector:
    """Detects duplicate and similar test cases."""

    def __init__(self, metrics: List[CaseMetrics], threshold: float = 0.75):
        self.metrics = metrics
        self.threshold = threshold
        self.duplicates: List[Dict[str, Any]] = []
        self.similar_pairs: List[Dict[str, Any]] = []

    def detect_name_duplicates(self) -> List[Dict[str, Any]]:
        name_counter = Counter(m.case_name for m in self.metrics)
        self.duplicates = []
        for name, count in name_counter.items():
            if count > 1:
                cases = [m for m in self.metrics if m.case_name == name]
                self.duplicates.append({
                    "case_name": name, "count": count,
                    "file_paths": list(set(c.file_path for c in cases)),
                    "line_numbers": [c.line_number for c in cases],
                })
        return self.duplicates

    def detect_similar_cases(self, max_cases: int = 3000) -> List[Dict[str, Any]]:
        case_list = self.metrics[:max_cases]
        n = len(case_list)
        similar = []
        for i in range(n):
            for j in range(i + 1, min(i + 500, n)):
                score = string_similarity(case_list[i].case_name, case_list[j].case_name)
                if score >= self.threshold:
                    similar.append({
                        "case1": case_list[i].case_name,
                        "case2": case_list[j].case_name,
                        "similarity": round(score, 4),
                        "file1": case_list[i].file_path,
                        "file2": case_list[j].file_path,
                    })
        similar.sort(key=lambda x: x["similarity"], reverse=True)
        self.similar_pairs = similar
        return similar

class CoverageAnalyzer:
    """Analyzes test coverage metrics."""

    def __init__(self, metrics: List[CaseMetrics]):
        self.metrics = metrics

    def analyze_tag_coverage(self) -> Dict[str, Any]:
        total = len(self.metrics)
        if total == 0:
            return {}
        coverage = {}
        for tag in TC_TAG_NAMES:
            count = 0
            for m in self.metrics:
                if tag == "@tc.type" and m.tc_type != "UNKNOWN":
                    count += 1
                elif tag == "@tc.level" and m.tc_level != "UNKNOWN":
                    count += 1
                elif tag == "@tc.size" and m.tc_size != "UNKNOWN":
                    count += 1
                elif tag == "@tc.name" and m.case_name:
                    count += 1
            coverage[tag] = {"count": count, "coverage_rate": round(count / total * 100, 2)}
        return coverage

    def analyze_assertion_coverage(self) -> Dict[str, Any]:
        total = len(self.metrics)
        if total == 0:
            return {}
        no_assert = sum(1 for m in self.metrics if m.assertion_count == 0)
        low_assert = sum(1 for m in self.metrics if 0 < m.assertion_count < 3)
        mid_assert = sum(1 for m in self.metrics if 3 <= m.assertion_count < 10)
        high_assert = sum(1 for m in self.metrics if m.assertion_count >= 10)
        return {
            "total_cases": total, "cases_without_assertions": no_assert,
            "cases_with_low_assertions": low_assert,
            "cases_with_medium_assertions": mid_assert,
            "cases_with_high_assertions": high_assert,
            "assertion_coverage": round((total - no_assert) / total * 100, 2),
            "avg_assertions_per_case": round(
                safe_mean([m.assertion_count for m in self.metrics]), 2),
        }

    def analyze_subsystem_coverage(self) -> List[Dict[str, Any]]:
        groups: Dict[str, List[CaseMetrics]] = defaultdict(list)
        for m in self.metrics:
            groups[get_subsystem(m.file_path)].append(m)
        result = []
        for subsystem, case_list in sorted(groups.items(),
                                            key=lambda x: len(x[1]), reverse=True):
            no_assert = sum(1 for m in case_list if m.assertion_count == 0)
            no_tags = sum(1 for m in case_list if not m.has_tc_tags)
            result.append({
                "subsystem": subsystem, "case_count": len(case_list),
                "file_count": len(set(m.file_path for m in case_list)),
                "no_assertion_count": no_assert, "no_tag_count": no_tags,
                "avg_complexity": round(safe_mean(
                    [m.complexity_score for m in case_list]), 2),
                "coverage_rate": round(
                    (len(case_list) - no_assert) / len(case_list) * 100, 2),
            })
        return result

class ReportBuilder:
    """Builds quality reports in various formats."""

    def __init__(self, report: QualityReport):
        self.report = report

    def build_json(self) -> str:
        return json.dumps(self.report.to_dict(), ensure_ascii=False, indent=2)

    def build_text(self) -> str:
        lines: List[str] = []
        lines.append("=" * 70)
        lines.append(f"  {APP_NAME} v{VERSION} - Quality Report")
        lines.append(f"  Generated: {self.report.context.timestamp}")
        lines.append("=" * 70)
        lines.append("")
        ctx = self.report.context
        lines.extend([
            "1. ANALYSIS CONTEXT", "-" * 50,
            f"  Root Directory:    {ctx.root_dir}",
            f"  Total Files:       {ctx.total_files}",
            f"  Total Cases:       {ctx.total_cases}",
            f"  Duration:          {format_time(ctx.duration_seconds)}",
            f"  Status:            {ctx.status}", "",
            "2. GRADE DISTRIBUTION", "-" * 50,
        ])
        for grade in ["A", "B", "C", "D", "E"]:
            count = self.report.grade_distribution.get(grade, 0)
            lines.append(f"  Grade {grade} ({QUALITY_LEVELS[grade]['label']}): {count} cases")
        lines.extend(["", "3. SUMMARY STATISTICS", "-" * 50])
        for key, value in self.report.summary.items():
            val = f"{value:.2f}" if isinstance(value, float) else value
            lines.append(f"  {key}: {val}")
        lines.extend(["", "4. TOP QUALITY ISSUES", "-" * 50])
        for issue in self.report.top_issues[:20]:
            lines.append(f"  [{issue['severity']:8s}] {issue['category']:20s} count={issue['count']}")
        lines.extend(["", "5. SUBSYSTEM STATISTICS", "-" * 50])
        for stat in self.report.subsystem_stats[:20]:
            lines.append(f"  {stat['subsystem']:30s} cases={stat['case_count']:6d} "
                         f"avg_complexity={stat.get('avg_complexity', 0):.2f}")
        lines.extend(["", "6. RECOMMENDATIONS", "-" * 50])
        for i, rec in enumerate(self._recommendations(), 1):
            lines.append(f"  {i}. {rec}")
        lines.extend(["", "=" * 70, "  End of Report", "=" * 70])
        return '\n'.join(lines)

    def build_markdown(self) -> str:
        lines: List[str] = []
        lines.append(f"# {APP_NAME} v{VERSION} - Quality Report")
        lines.append(f"\n**Generated:** {self.report.context.timestamp}")
        lines.append(f"**Root:** {self.report.context.root_dir}")
        lines.append(f"**Total Files:** {self.report.context.total_files}")
        lines.append(f"**Total Cases:** {self.report.context.total_cases}\n")
        lines.append("## Grade Distribution\n")
        lines.append("| Grade | Label | Count |")
        lines.append("|-------|-------|-------|")
        for grade in ["A", "B", "C", "D", "E"]:
            count = self.report.grade_distribution.get(grade, 0)
            lines.append(f"| {grade} | {QUALITY_LEVELS[grade]['label']} | {count} |")
        lines.append("\n## Summary Statistics\n")
        lines.append("| Metric | Value |")
        lines.append("|--------|-------|")
        for key, value in self.report.summary.items():
            val = f"{value:.2f}" if isinstance(value, float) else value
            lines.append(f"| {key} | {val} |")
        lines.append("\n## Top Quality Issues\n")
        lines.append("| Severity | Category | Count |")
        lines.append("|----------|----------|-------|")
        for issue in self.report.top_issues[:20]:
            lines.append(f"| {issue['severity']} | {issue['category']} | {issue['count']} |")
        lines.append("\n## Subsystem Statistics\n")
        lines.append("| Subsystem | Cases | Files | Avg Complexity |")
        lines.append("|-----------|-------|-------|----------------|")
        for stat in self.report.subsystem_stats[:20]:
            lines.append(f"| {stat['subsystem']} | {stat['case_count']} | "
                         f"{stat.get('file_count', 0)} | {stat.get('avg_complexity', 0):.2f} |")
        lines.append("\n## Recommendations\n")
        for i, rec in enumerate(self._recommendations(), 1):
            lines.append(f"{i}. {rec}")
        return '\n'.join(lines)

    def build_html(self) -> str:
        rows_grade = "".join(
            f"<tr><td class='grade-{g}'>{g}</td><td>{QUALITY_LEVELS[g]['label']}</td>"
            f"<td>{self.report.grade_distribution.get(g, 0)}</td></tr>"
            for g in ["A", "B", "C", "D", "E"]
        )
        rows_summary = "".join(
            f"<tr><td>{k}</td><td>{v:.2f}</td></tr>" if isinstance(v, float)
            else f"<tr><td>{k}</td><td>{v}</td></tr>"
            for k, v in self.report.summary.items()
        )
        rows_issues = "".join(
            f"<tr><td>{i['severity']}</td><td>{i['category']}</td><td>{i['count']}</td></tr>"
            for i in self.report.top_issues[:20]
        )
        recs = "".join(f"<li>{r}</li>" for r in self._recommendations())
        ctx = self.report.context
        return f"""<!DOCTYPE html>
<html lang="zh-CN">
<head><meta charset="UTF-8"><title>{APP_NAME} - Quality Report</title>
<style>
body {{ font-family: Arial, sans-serif; margin: 20px; }}
table {{ border-collapse: collapse; width: 100%; }}
th, td {{ border: 1px solid #ddd; padding: 8px; }}
th {{ background-color: #4CAF50; color: white; }}
.grade-A {{ color: #28a745; }} .grade-B {{ color: #17a2b8; }}
.grade-C {{ color: #ffc107; }} .grade-D {{ color: #fd7e14; }}
.grade-E {{ color: #dc3545; }}
</style></head>
<body>
<h1>{APP_NAME} v{VERSION}</h1>
<p><strong>Generated:</strong> {ctx.timestamp}</p>
<p><strong>Root:</strong> {ctx.root_dir}</p>
<p><strong>Total Files:</strong> {ctx.total_files}</p>
<p><strong>Total Cases:</strong> {ctx.total_cases}</p>
<h2>Grade Distribution</h2>
<table><tr><th>Grade</th><th>Label</th><th>Count</th></tr>{rows_grade}</table>
<h2>Summary Statistics</h2>
<table><tr><th>Metric</th><th>Value</th></tr>{rows_summary}</table>
<h2>Top Quality Issues</h2>
<table><tr><th>Severity</th><th>Category</th><th>Count</th></tr>{rows_issues}</table>
<h2>Recommendations</h2><ol>{recs}</ol>
</body></html>"""

    def _recommendations(self) -> List[str]:
        return self.report.recommendations or ["No specific recommendations at this time."]

    def _build_csv(self) -> str:
        lines = ["case_name,overall_score,grade,coverage,complexity,stability,"
                 "performance,maintainability,reliability,issue_count"]
        for s in self.report.scores:
            lines.append(
                f"{s.case_name},{s.overall_score:.2f},{s.grade},"
                f"{s.coverage_score:.2f},{s.complexity_score:.2f},"
                f"{s.stability_score:.2f},{s.performance_score:.2f},"
                f"{s.maintainability_score:.2f},{s.reliability_score:.2f},{len(s.issues)}"
            )
        return '\n'.join(lines)

    def save(self, output_path: str, fmt: ReportFormat = ReportFormat.JSON) -> None:
        ensure_dir(output_path)
        builders = {
            ReportFormat.JSON: self.build_json,
            ReportFormat.TEXT: self.build_text,
            ReportFormat.MARKDOWN: self.build_markdown,
            ReportFormat.HTML: self.build_html,
            ReportFormat.CSV: self._build_csv,
        }
        content = builders.get(fmt, self.build_json)()
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"[REPORT] Saved: {output_path} ({format_size(os.path.getsize(output_path))})")

class DatabaseManager:
    """Manages SQLite database for quality data."""

    def __init__(self, db_path: str):
        self.db_path = db_path
        self.init_database()

    def init_database(self) -> None:
        ensure_dir(self.db_path)
        try:
            conn = sqlite3.connect(self.db_path)
            cursor = conn.cursor()
            cursor.execute('''CREATE TABLE IF NOT EXISTS case_metrics (
                id INTEGER PRIMARY KEY AUTOINCREMENT, case_name TEXT NOT NULL,
                file_path TEXT, line_number INTEGER, assertion_count INTEGER,
                method_count INTEGER, body_length INTEGER, complexity_score REAL,
                has_description BOOLEAN, has_tc_tags BOOLEAN, tc_type TEXT,
                tc_level TEXT, tc_size TEXT, execution_time REAL DEFAULT 0,
                pass_count INTEGER DEFAULT 0, fail_count INTEGER DEFAULT 0,
                error_count INTEGER DEFAULT 0, skip_count INTEGER DEFAULT 0,
                last_result TEXT DEFAULT 'unknown', last_run_time TEXT,
                created_at TEXT, UNIQUE(case_name, file_path))''')
            cursor.execute('''CREATE TABLE IF NOT EXISTS quality_scores (
                id INTEGER PRIMARY KEY AUTOINCREMENT, case_name TEXT NOT NULL,
                overall_score REAL, grade TEXT, coverage_score REAL,
                complexity_score REAL, stability_score REAL,
                performance_score REAL, maintainability_score REAL,
                reliability_score REAL, issue_count INTEGER,
                analysis_timestamp TEXT, UNIQUE(case_name, analysis_timestamp))''')
            cursor.execute('''CREATE TABLE IF NOT EXISTS quality_issues (
                id INTEGER PRIMARY KEY AUTOINCREMENT, case_name TEXT NOT NULL,
                file_path TEXT, category TEXT, severity TEXT, description TEXT,
                suggestion TEXT, metric_value TEXT, threshold TEXT,
                analysis_timestamp TEXT)''')
            cursor.execute('''CREATE TABLE IF NOT EXISTS analysis_history (
                id INTEGER PRIMARY KEY AUTOINCREMENT, timestamp TEXT NOT NULL,
                root_dir TEXT, total_files INTEGER, total_cases INTEGER,
                duration_seconds REAL, status TEXT, config_json TEXT)''')
            cursor.execute('CREATE INDEX IF NOT EXISTS idx_case_name ON case_metrics(case_name)')
            cursor.execute('CREATE INDEX IF NOT EXISTS idx_quality_grade ON quality_scores(grade)')
            cursor.execute('CREATE INDEX IF NOT EXISTS idx_issues_sev ON quality_issues(severity)')
            conn.commit()
            conn.close()
            logging.info("Database initialized successfully")
        except Exception as e:
            logging.error(f"Database initialization failed: {e}")

    def save_metrics(self, metrics: List[CaseMetrics]) -> None:
        try:
            conn = sqlite3.connect(self.db_path)
            cursor = conn.cursor()
            now = datetime.now().isoformat()
            for m in metrics:
                cursor.execute('''INSERT OR REPLACE INTO case_metrics
                    (case_name, file_path, line_number, assertion_count, method_count,
                     body_length, complexity_score, has_description, has_tc_tags,
                     tc_type, tc_level, tc_size, execution_time, pass_count, fail_count,
                     error_count, skip_count, last_result, last_run_time, created_at)
                    VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)''', (
                    m.case_name, m.file_path, m.line_number, m.assertion_count,
                    m.method_count, m.body_length, m.complexity_score,
                    m.has_description, m.has_tc_tags, m.tc_type, m.tc_level,
                    m.tc_size, m.execution_time, m.pass_count, m.fail_count,
                    m.error_count, m.skip_count, m.last_result, m.last_run_time, now,
                ))
            conn.commit()
            conn.close()
        except Exception as e:
            logging.error(f"Failed to save metrics: {e}")

    def save_scores(self, scores: List[QualityScore]) -> None:
        try:
            conn = sqlite3.connect(self.db_path)
            cursor = conn.cursor()
            now = datetime.now().isoformat()
            for s in scores:
                cursor.execute('''INSERT OR REPLACE INTO quality_scores
                    (case_name, overall_score, grade, coverage_score, complexity_score,
                     stability_score, performance_score, maintainability_score,
                     reliability_score, issue_count, analysis_timestamp)
                    VALUES (?,?,?,?,?,?,?,?,?,?,?)''', (
                    s.case_name, s.overall_score, s.grade, s.coverage_score,
                    s.complexity_score, s.stability_score, s.performance_score,
                    s.maintainability_score, s.reliability_score, len(s.issues), now,
                ))
                for issue in s.issues:
                    cursor.execute('''INSERT INTO quality_issues
                        (case_name, file_path, category, severity, description,
                         suggestion, metric_value, threshold, analysis_timestamp)
                        VALUES (?,?,?,?,?,?,?,?,?)''', (
                        issue.case_name, issue.file_path, issue.category,
                        issue.severity, issue.description, issue.suggestion,
                        str(issue.metric_value), str(issue.threshold), now,
                    ))
            conn.commit()
            conn.close()
        except Exception as e:
            logging.error(f"Failed to save scores: {e}")

    def save_history(self, context: AnalysisContext) -> None:
        try:
            conn = sqlite3.connect(self.db_path)
            cursor = conn.cursor()
            cursor.execute('''INSERT INTO analysis_history
                (timestamp, root_dir, total_files, total_cases, duration_seconds,
                 status, config_json) VALUES (?,?,?,?,?,?,?)''', (
                context.timestamp, context.root_dir, context.total_files,
                context.total_cases, context.duration_seconds, context.status,
                json.dumps(context.config, ensure_ascii=False),
            ))
            conn.commit()
            conn.close()
        except Exception as e:
            logging.error(f"Failed to save history: {e}")

class RecommendationEngine:
    """Generates actionable recommendations based on analysis."""

    def __init__(self, scores: List[QualityScore], metrics: List[CaseMetrics],
                 risk_assessments: List[Dict[str, Any]]):
        self.scores = scores
        self.metrics = metrics
        self.risk_assessments = risk_assessments

    def generate(self) -> List[str]:
        recs: List[str] = []
        recs.extend(self._coverage_recommendations())
        recs.extend(self._complexity_recommendations())
        recs.extend(self._stability_recommendations())
        recs.extend(self._risk_recommendations())
        recs.extend(self._tag_recommendations())
        return recs if recs else [
            "All quality metrics are within acceptable ranges. Continue monitoring."
        ]

    def _coverage_recommendations(self) -> List[str]:
        recs: List[str] = []
        total = len(self.metrics)
        if total == 0:
            return recs
        no_assert = sum(1 for m in self.metrics if m.assertion_count == 0)
        rate = no_assert / total * 100
        if rate > 20:
            recs.append(f"{rate:.1f}% of test cases have no assertions. "
                        f"Add assertion statements to {no_assert} cases.")
        elif rate > 5:
            recs.append(f"{rate:.1f}% of test cases lack assertions. Review {no_assert} cases.")
        return recs

    def _complexity_recommendations(self) -> List[str]:
        recs: List[str] = []
        total = len(self.scores)
        if total == 0:
            return recs
        high = sum(1 for s in self.scores if s.complexity_score < 50)
        rate = high / total * 100
        if rate > 15:
            recs.append(f"{rate:.1f}% of test cases have high complexity. Refactor {high} cases.")
        return recs

    def _stability_recommendations(self) -> List[str]:
        recs: List[str] = []
        critical = sum(1 for a in self.risk_assessments if a["risk_level"] == "CRITICAL")
        if critical > 0:
            recs.append(f"{critical} cases are at CRITICAL risk level. Address immediately.")
        high_risk = sum(1 for a in self.risk_assessments if a["risk_level"] == "HIGH")
        if high_risk > 10:
            recs.append(f"{high_risk} cases are at HIGH risk level. Prioritize for review.")
        return recs

    def _risk_recommendations(self) -> List[str]:
        recs: List[str] = []
        factor_counter = Counter()
        for assessment in self.risk_assessments:
            for factor in assessment["risk_factors"]:
                factor_counter[factor["factor"]] += 1
        for factor, count in factor_counter.most_common(5):
            if count > 5:
                recs.append(f"Risk factor '{factor}' affects {count} cases.")
        return recs

    def _tag_recommendations(self) -> List[str]:
        recs: List[str] = []
        total = len(self.metrics)
        if total == 0:
            return recs
        no_tags = sum(1 for m in self.metrics if not m.has_tc_tags)
        rate = no_tags / total * 100
        if rate > 10:
            recs.append(f"{rate:.1f}% of cases are missing @tc.* tags. Add tags to {no_tags} cases.")
        return recs

class SummaryBuilder:
    """Builds summary statistics from analysis results."""

    def __init__(self, scores: List[QualityScore], metrics: List[CaseMetrics]):
        self.scores = scores
        self.metrics = metrics

    def build(self) -> Dict[str, Any]:
        return {
            "total_cases": len(self.metrics),
            "total_scored": len(self.scores),
            "avg_overall_score": self._avg_score(),
            "grade_distribution": self._grade_dist(),
            "issue_summary": self._issue_summary(),
            "metric_summary": self._metric_summary(),
        }

    def _avg_score(self) -> float:
        if not self.scores:
            return 0.0
        return round(safe_mean([s.overall_score for s in self.scores]), 2)

    def _grade_dist(self) -> Dict[str, int]:
        counter = Counter(s.grade for s in self.scores)
        return {grade: counter.get(grade, 0) for grade in ["A", "B", "C", "D", "E"]}

    def _issue_summary(self) -> Dict[str, Any]:
        all_issues: List[QualityIssue] = []
        for s in self.scores:
            all_issues.extend(s.issues)
        severity_counter = Counter(i.severity for i in all_issues)
        category_counter = Counter(i.category for i in all_issues)
        top_issues = []
        for cat, count in category_counter.most_common(10):
            severities = [i.severity for i in all_issues if i.category == cat]
            top_severity = Counter(severities).most_common(1)[0][0] if severities else "INFO"
            top_issues.append({"category": cat, "count": count, "severity": top_severity})
        return {
            "total_issues": len(all_issues),
            "by_severity": dict(severity_counter),
            "by_category": dict(category_counter),
            "top_issues": top_issues,
        }

    def _metric_summary(self) -> Dict[str, Any]:
        if not self.metrics:
            return {}
        return {
            "avg_assertions": round(safe_mean([m.assertion_count for m in self.metrics]), 2),
            "avg_complexity": round(safe_mean([m.complexity_score for m in self.metrics]), 2),
            "avg_methods": round(safe_mean([m.method_count for m in self.metrics]), 2),
            "avg_body_length": round(safe_mean([m.body_length for m in self.metrics]), 2),
            "cases_without_assertions": sum(1 for m in self.metrics if m.assertion_count == 0),
            "cases_without_tags": sum(1 for m in self.metrics if not m.has_tc_tags),
            "cases_without_description": sum(1 for m in self.metrics if not m.has_description),
        }

class QualityManager:
    """Main orchestrator for test quality management."""

    def __init__(self, config: Dict[str, Any]):
        self.config = config
        self.root_dir = config.get("root_dir", DEFAULT_ROOT)
        self.db_path = config.get("db_path", DEFAULT_DB_PATH)
        self.output_dir = config.get("output_dir", DEFAULT_OUTPUT_DIR)
        self.scanner = FileScanner(self.root_dir)
        self.collector = MetricsCollector(config)
        self.scorer: Optional[QualityScorer] = None
        self.risk_assessor: Optional[RiskAssessor] = None
        self.duplicate_detector: Optional[DuplicateDetector] = None
        self.coverage_analyzer: Optional[CoverageAnalyzer] = None
        self.db_manager = DatabaseManager(self.db_path)
        self.report: Optional[QualityReport] = None

    @timer
    def run(self, verbose: bool = True) -> QualityReport:
        start_time = time.time()
        errors: List[str] = []
        warnings: List[str] = []

        vp = print if verbose else lambda *a, **k: None
        vp(f"\n{'=' * 70}\n  {APP_NAME} v{VERSION}\n  Root: {self.root_dir}\n{'=' * 70}\n")
        vp("[1/7] Scanning files...")
        files = self.scanner.scan()
        if not files:
            warnings.append("No test files found in the specified directory")
        vp(f"[2/7] Collecting metrics from {len(files)} files...")
        workers = self.config.get("max_workers", 4)
        if HAS_MULTIPROCESSING and workers > 1:
            self.collector.collect_parallel(files, workers)
        else:
            self.collector.collect(files, verbose=verbose)
        vp(f"[3/7] Scoring quality for {len(self.collector.metrics)} cases...")
        self.scorer = QualityScorer(self.collector.metrics, self.config)
        scores = self.scorer.score_all()
        vp("[4/7] Assessing risk levels...")
        self.risk_assessor = RiskAssessor(self.collector.metrics, scores)
        risk_assessments = self.risk_assessor.assess_all()
        vp("[5/7] Detecting duplicates...")
        threshold = self.config.get("similarity_threshold", 0.75)
        self.duplicate_detector = DuplicateDetector(self.collector.metrics, threshold)
        self.duplicate_detector.detect_name_duplicates()
        self.duplicate_detector.detect_similar_cases()
        vp("[6/7] Analyzing coverage...")
        self.coverage_analyzer = CoverageAnalyzer(self.collector.metrics)
        subsystem_stats = self.coverage_analyzer.analyze_subsystem_coverage()
        vp("[7/7] Building report...")
        summary = SummaryBuilder(scores, self.collector.metrics).build()
        rec_engine = RecommendationEngine(scores, self.collector.metrics, risk_assessments)
        self.report = QualityReport(
            context=AnalysisContext(
                timestamp=datetime.now().isoformat(), root_dir=self.root_dir,
                total_files=len(files), total_cases=len(self.collector.metrics),
                duration_seconds=time.time() - start_time, status="completed",
                config={k: v for k, v in self.config.items() if isinstance(v, (str, int, float, bool))},
                errors=errors, warnings=warnings,
            ),
            scores=scores, summary=summary,
            grade_distribution=summary["grade_distribution"],
            top_issues=summary["issue_summary"]["top_issues"],
            subsystem_stats=subsystem_stats,
            recommendations=rec_engine.generate(),
        )
        if verbose:
            self._print_summary()
        return self.report

    def _print_summary(self) -> None:
        if not self.report:
            return
        r = self.report
        print(f"\n{'=' * 70}\n  ANALYSIS COMPLETE\n{'=' * 70}")
        print(f"  Total Cases: {r.context.total_cases}  Duration: {format_time(r.context.duration_seconds)}")
        print(f"  Avg Score: {r.summary.get('avg_overall_score', 0):.2f}  Recommendations: {len(r.recommendations)}")
        for grade in ["A", "B", "C", "D", "E"]:
            print(f"    {grade} ({QUALITY_LEVELS[grade]['label']}): {r.grade_distribution.get(grade, 0)}")
        print(f"{'=' * 70}\n")

    def save_report(self, fmt: ReportFormat = ReportFormat.JSON) -> str:
        if not self.report:
            logging.error("No report to save")
            return ""
        ext_map = {
            ReportFormat.JSON: ".json", ReportFormat.HTML: ".html",
            ReportFormat.MARKDOWN: ".md", ReportFormat.CSV: ".csv",
            ReportFormat.TEXT: ".txt",
        }
        ext = ext_map.get(fmt, ".json")
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        filename = f"quality_report_{timestamp}{ext}"
        output_path = os.path.join(self.output_dir, filename)
        ReportBuilder(self.report).save(output_path, fmt)
        return output_path

    def save_to_database(self) -> None:
        if not self.report:
            return
        self.db_manager.save_metrics(self.collector.metrics)
        self.db_manager.save_scores(self.report.scores)
        self.db_manager.save_history(self.report.context)

    def save_all_formats(self) -> List[str]:
        return [self.save_report(fmt) for fmt in ReportFormat]

def build_arg_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description=f"{APP_NAME} v{VERSION} - XTS Test Quality Management Tool"
    )
    parser.add_argument('-r', '--root', default=DEFAULT_ROOT, help='Root directory to scan')
    parser.add_argument('-d', '--db', default=DEFAULT_DB_PATH, help='SQLite database path')
    parser.add_argument('-o', '--output', default=DEFAULT_OUTPUT_DIR, help='Output directory')
    parser.add_argument('-w', '--workers', type=int, default=4, help='Parallel workers')
    parser.add_argument('-t', '--threshold', type=float, default=0.75, help='Similarity threshold')
    parser.add_argument('-c', '--complexity', type=float, default=70.0, help='Complexity threshold')
    parser.add_argument('-p', '--performance', type=float, default=10.0, help='Performance threshold')
    parser.add_argument('--format', choices=['json', 'html', 'markdown', 'csv', 'text', 'all'],
                        default='json', help='Report format')
    parser.add_argument('--save-db', action='store_true', help='Save results to database')
    parser.add_argument('--verbose', '-v', action='store_true', help='Verbose output')
    parser.add_argument('--config', default=DEFAULT_CONFIG_PATH, help='Config file path')
    parser.add_argument('--version', action='version', version=f'{APP_NAME} v{VERSION}')
    return parser

def run_from_args(args: argparse.Namespace) -> None:
    config = {**DEFAULT_CONFIG,
              'root_dir': args.root, 'db_path': args.db, 'output_dir': args.output,
              'max_workers': args.workers, 'similarity_threshold': args.threshold,
              'complexity_threshold': args.complexity, 'performance_threshold': args.performance}
    manager = QualityManager(config)
    report = manager.run(verbose=args.verbose)
    if args.format == 'all':
        paths = manager.save_all_formats()
        print(f"\nSaved {len(paths)} report files to {args.output}")
    else:
        fmt_map = {'json': ReportFormat.JSON, 'html': ReportFormat.HTML,
                   'markdown': ReportFormat.MARKDOWN, 'csv': ReportFormat.CSV, 'text': ReportFormat.TEXT}
        path = manager.save_report(fmt_map.get(args.format, ReportFormat.JSON))
        print(f"\nReport saved: {path}")
    if args.save_db:
        manager.save_to_database()
        print("Results saved to database")
    print(f"\nDone! Total cases: {report.context.total_cases}, "
          f"Avg score: {report.summary.get('avg_overall_score', 0):.2f}")

def main():
    """Entry point for the XTS Test Quality Manager."""
    logging.basicConfig(
        level=logging.INFO,
        format='%(asctime)s - %(levelname)s - %(message)s',
        handlers=[logging.StreamHandler()]
    )
    parser = build_arg_parser()
    args = parser.parse_args()
    try:
        run_from_args(args)
    except KeyboardInterrupt:
        print("\nOperation cancelled by user.")
        sys.exit(1)
    except Exception as e:
        logging.error(f"Fatal error: {e}")
        traceback.print_exc()

if __name__ == "__main__":
    main()
