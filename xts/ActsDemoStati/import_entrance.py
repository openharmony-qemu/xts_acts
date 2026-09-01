#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from __future__ import annotations

import argparse
import json
import os
import re
import sys
import time
from dataclasses import dataclass, field, asdict
from datetime import datetime, timedelta
from enum import Enum, auto
from pathlib import Path
from typing import (
    Any, Callable, Dict, Iterable, List, Optional, Sequence, Set, Tuple,
    Union,
)

__version__ = "1.0.0"
__author__ = "opencode"

class ExitCode:
    SUCCESS = 0
    GENERIC_ERROR = 1
    ARGUMENT_ERROR = 2
    FILE_NOT_FOUND = 3
    PARSE_ERROR = 4
    NO_ERRORS_FOUND = 5

RE_TIMESTAMP = re.compile(
    r"\[(\d{4}/\d{2}/\d{2}\s+\d{2}:\d{2}:\d{2}\.\d+)\s+GMT([+-]\d{2}:\d{2})?\]"
)

# 时间戳格式：2026/08/24 19:51:56.513
TS_FORMAT = "%Y/%m/%d %H:%M:%S.%f"

RE_STAGE_START = re.compile(
    r"\[INFO\]\s*\[([^\]]+)\]\s*:\s*该步骤开始执行"
)
RE_STAGE_END = re.compile(
    r"\[INFO\]\s*\[([^\]]+)\]\s*:\s*该步骤执行完成"
)

RE_OHOS_ERROR = re.compile(r"\[OHOS ERROR\]")

RE_NINJA_FAILED = re.compile(r"FAILED:\s*(\S+)")


RE_NINJA_CMD_FAILED = re.compile(
    r"command failed:\s*\"([^\"]+)\"\s*,\s*ret_code:\s*(\d+)"
)

# ninja 进度 [8/12] / [2/2]
RE_NINJA_PROGRESS = re.compile(r"\[(\d+)/(\d+)\]")

# ninja 编译命令行
RE_NINJA_CMD = re.compile(
    r"ninja\s+.*?-C\s+\S+\s+(.*)"
)



RE_HVIGOR_BUILD_FAILED = re.compile(
    r"hvigor\s+ERROR:\s*BUILD FAILED\s+in\s+([\d\s]+m?s[\d\s]*m?s?)"
)
RE_HVIGOR_TASK_FAILED = re.compile(
    r"hvigor\s+ERROR:\s*Failed\s+:(.+)"
)

RE_HVIGOR_ARKTS_ERROR = re.compile(
    r"hvigor\s+ERROR:\s*(\d+)\s+ArkTS\s+Compiler\s+Error"
)

RE_PAGE_NOT_EXIST = re.compile(
    r"Error Message:\s*Page\s+'([^']+)'\s+does not exist"
)

RE_HVIGOR_ERROR_CODE = re.compile(r"hvigor\s+ERROR:\s*(\d+)\s*(.*)")

# hvigor Finished :entry:default@XXX... after N ms
RE_HVIGOR_FINISHED = re.compile(
    r"hvigor\s+(?:info|warning):\s*>\s*hvigor\s+Finished\s+:(.+?)\s+after\s+(\d+)\s*ms"
)

# hvigor cmd 行
RE_HVIGOR_CMD = re.compile(
    r"hvigor cmd:\s*bash\s+(\S+)\s+(.*)"
)

# Hvigor clean start / Hvigor build start
RE_HVIGOR_PHASE = re.compile(r"Hvigor\s+(clean|build)\s+(start)")


# ------------------------------------------------------------------
# Python Traceback 正则
# ------------------------------------------------------------------
RE_TRACEBACK_START = re.compile(r"Traceback\s+\(most recent call last\):")

#   File "xxx.py", line 47, in wrapper
RE_TRACEBACK_FILE = re.compile(
    r'File\s+"([^"]+)",\s+line\s+(\d+),\s+in\s+(\S+)'
)

# exceptions.ohos_exception.OHOSException: COMPILE Failed! ...
RE_OHOS_EXCEPTION = re.compile(
    r"exceptions\.\w+\.\w+Exception:\s*(.*)"
)

# raise OHOSException(
RE_RAISE = re.compile(r"raise\s+(\w+Exception)\(")

RE_CODE = re.compile(r"^Code:\s*(.+)$")
RE_REASON = re.compile(r"^Reason:\s*(.+)$")
RE_ERROR_TYPE = re.compile(r"^Error Type:\s*(.+)$")
RE_DESCRIPTION = re.compile(r"^Description:\s*(.+)$")
RE_SOLUTION = re.compile(r"^Solution:\s*(.+)$")

RE_BUILD_ERROR_MARKER = re.compile(r"={5}build\s+error={5}")

# build result:failed
RE_BUILD_RESULT = re.compile(r"build result:\s*(\w+)")

# label_name: 编译失败
RE_LABEL_NAME = re.compile(r"label_name:\s*(.+)")

# buildFailType: 'E04', buildFailReason: 'compile failed'
RE_BUILD_FAIL_TYPE = re.compile(r"buildFailType:\s*'([^']+)'")
RE_BUILD_FAIL_REASON = re.compile(r"buildFailReason:\s*'([^']+)'")

RE_PIPELINE_MSG = re.compile(r"'topic':\s*'pipeline'")

RE_PIPELINE_COMPONENT = re.compile(r"'component':\s*'([^']+)'")
RE_PIPELINE_RESULT = re.compile(r"'buildResult':\s*'([^']+)'")
RE_PIPELINE_FAIL_TYPE = re.compile(r"'buildFailType':\s*'([^']+)'")
RE_PIPELINE_FAIL_REASON = re.compile(r"'buildFailReason':\s*'([^']+)'")

RE_STAGE_STATUS = re.compile(
    r"'(\w+)':\s*\{'status':\s*'(\w+)'\s*,"
)


RE_PR_URL = re.compile(
    r"(https?://\S+/merge_requests/\d+)"
)
RE_PR_LABEL = re.compile(r"pr:(https?://\S+/pulls/\d+)")

# git fetch / checkout
RE_GIT_FETCH = re.compile(r"git\s+fetch\s+(?:--\S+\s+)*(\S+)")
RE_GIT_CHECKOUT = re.compile(r"git\s+checkout\s+(?:-f\s+)?(\S+)")

RE_BUILD_TARGET = re.compile(r"_build_target\s*=\s*\[([^\]]+)\]")

# Compile command: ./build.sh --build-target ...
RE_COMPILE_CMD = re.compile(r"Compile command:\s*(.+)")

# build-target 参数
RE_BUILD_TARGET_ARG = re.compile(r"--build-target\s+(\S+)")


RE_TOTAL_MEMORY = re.compile(r"Total Memory:\s*([\d.]+)(\w+)")
RE_FREE_MEMORY = re.compile(r"Free Memory:\s*([\d.]+)(\w+)")
RE_CPU_USER = re.compile(r"User Cpu%:\s*([\d.]+)%")
RE_CPU_SYSTEM = re.compile(r"System Cpu%:\s*([\d.]+)%")

RE_ERROR_LOG_PATH = re.compile(r"error\.log")
RE_BUILD_LOG_PATH = re.compile(r"build\.log")
RE_LOG_URL = re.compile(r"'buildLog':\s*'([^']+)'")
RE_ARTIFACTS_URL = re.compile(r"'Artifacts':\s*'([^']+)'")


class ErrorType(Enum):
    """编译错误类型分类。"""
    NINJA_FAILED = "ninja_failed"
    NINJA_CMD_FAILED = "ninja_cmd_failed"
    HVIGOR_BUILD_FAILED = "hvigor_build_failed"
    HVIGOR_TASK_FAILED = "hvigor_task_failed"
    HVIGOR_ARKTS_ERROR = "hvigor_arkts_error"
    PAGE_NOT_EXIST = "page_not_exist"
    OHOS_EXCEPTION = "ohos_exception"
    PYTHON_TRACEBACK = "python_traceback"
    BUILD_ERROR = "build_error"
    BUILD_RESULT_FAILED = "build_result_failed"
    PIPELINE_FAILED = "pipeline_failed"
    GENERIC_ERROR = "generic_error"
    UNKNOWN = "unknown"

    @property
    def label(self) -> str:
        labels = {
            ErrorType.NINJA_FAILED: "Ninja 目标编译失败",
            ErrorType.NINJA_CMD_FAILED: "Ninja 命令执行失败",
            ErrorType.HVIGOR_BUILD_FAILED: "Hvigor 构建失败",
            ErrorType.HVIGOR_TASK_FAILED: "Hvigor 任务失败",
            ErrorType.HVIGOR_ARKTS_ERROR: "ArkTS 编译器错误",
            ErrorType.PAGE_NOT_EXIST: "页面文件不存在",
            ErrorType.OHOS_EXCEPTION: "OHOS 异常",
            ErrorType.PYTHON_TRACEBACK: "Python 异常堆栈",
            ErrorType.BUILD_ERROR: "构建错误标记",
            ErrorType.BUILD_RESULT_FAILED: "构建结果失败",
            ErrorType.PIPELINE_FAILED: "流水线失败",
            ErrorType.GENERIC_ERROR: "通用错误",
            ErrorType.UNKNOWN: "未知错误",
        }
        return labels.get(self, "未知错误")


class StageStatus(Enum):
    """构建阶段状态。"""
    SUCCESS = "success"
    FAILED = "failed"
    SKIPPED = "skipped"
    RUNNING = "running"
    UNKNOWN = "unknown"


class Severity(Enum):
    """错误严重级别。"""
    INFO = auto()
    WARN = auto()
    ERROR = auto()
    FATAL = auto()

    @property
    def label(self) -> str:
        return {
            Severity.INFO: "INFO", Severity.WARN: "WARN",
            Severity.ERROR: "ERROR", Severity.FATAL: "FATAL",
        }[self]


# ==============================================================================
# 三、自定义异常
# ==============================================================================

class LogAnalyzerError(Exception):
    """分析器基类异常。"""

    def __init__(self, message: str, code: int = ExitCode.GENERIC_ERROR):
        super().__init__(message)
        self.code = code
        self.message = message

    def __str__(self) -> str:
        return self.message


class FileReadError(LogAnalyzerError):
    """文件读取错误。"""

    def __init__(self, message: str):
        super().__init__(message, ExitCode.FILE_NOT_FOUND)


class ParseError(LogAnalyzerError):
    """解析错误。"""

    def __init__(self, message: str):
        super().__init__(message, ExitCode.PARSE_ERROR)


class PatternError(LogAnalyzerError):
    """模式匹配错误。"""

    def __init__(self, message: str):
        super().__init__(message, ExitCode.GENERIC_ERROR)


@dataclass
class LogLine:
    """一条日志行（已剥离时间戳前缀）。"""
    raw: str                 # 原始完整行
    content: str            # 剥离时间戳后的内容
    line_no: int = 0         # 行号（1-based）
    timestamp: str = ""      # 时间戳字符串
    datetime_obj: Optional[datetime] = None


@dataclass
class ErrorItem:
    """一个编译错误项。"""
    error_type: ErrorType = ErrorType.UNKNOWN
    severity: Severity = Severity.ERROR
    line_no: int = 0
    timestamp: str = ""
    message: str = ""           # 错误主消息
    detail: str = ""            # 详细信息
    target: str = ""            # 失败目标（如 obj/.../xxx.json）
    context: List[str] = field(default_factory=list)  # 上下文行
    traceback_frames: List[Dict[str, str]] = field(default_factory=list)
    error_code: str = ""        # 错误码（如 10906403, 4000）
    solution: str = ""          # 解决建议
    root_cause: bool = False    # 是否为根本原因

    @property
    def label(self) -> str:
        return self.error_type.label

    def to_dict(self) -> Dict[str, Any]:
        return {
            "error_type": self.error_type.value,
            "error_type_label": self.error_type.label,
            "severity": self.severity.label,
            "line_no": self.line_no,
            "timestamp": self.timestamp,
            "message": self.message,
            "detail": self.detail,
            "target": self.target,
            "context": self.context,
            "traceback_frames": self.traceback_frames,
            "error_code": self.error_code,
            "solution": self.solution,
            "root_cause": self.root_cause,
        }


@dataclass
class StageInfo:
    """一个构建阶段的信息。"""
    name: str = ""             # 阶段名（如 PRE_ENV:slave_create）
    status: StageStatus = StageStatus.UNKNOWN
    start_time: str = ""
    end_time: str = ""
    start_dt: Optional[datetime] = None
    end_dt: Optional[datetime] = None
    duration_seconds: float = 0.0
    line_start: int = 0
    line_end: int = 0

    @property
    def duration_str(self) -> str:
        if self.duration_seconds <= 0:
            return "N/A"
        mins = int(self.duration_seconds // 60)
        secs = self.duration_seconds % 60
        if mins > 0:
            return f"{mins}m {secs:.1f}s"
        return f"{secs:.1f}s"

    def to_dict(self) -> Dict[str, Any]:
        return {
            "name": self.name, "status": self.status.value,
            "start_time": self.start_time, "end_time": self.end_time,
            "duration_seconds": round(self.duration_seconds, 2),
            "duration_str": self.duration_str,
            "line_start": self.line_start, "line_end": self.line_end,
        }


@dataclass
class BuildResult:
    """构建结果汇总。"""
    overall_status: str = "unknown"      # success / failed / unknown
    build_result_str: str = ""           # 原始 build result 字符串
    fail_type: str = ""                 # 如 E04
    fail_reason: str = ""               # 如 compile failed
    component: str = ""                 # 如 dayu200_xts
    build_duration: int = 0             # 构建时长（秒）
    build_id: str = ""
    pipeline_id: str = ""
    pr_url: str = ""
    label_name: str = ""
    build_log_url: str = ""
    artifacts_url: str = ""

    @property
    def is_failed(self) -> bool:
        return self.overall_status == "failed"

    @property
    def is_success(self) -> bool:
        return self.overall_status == "success"

    def to_dict(self) -> Dict[str, Any]:
        return {
            "overall_status": self.overall_status,
            "build_result_str": self.build_result_str,
            "fail_type": self.fail_type,
            "fail_reason": self.fail_reason,
            "component": self.component,
            "build_duration": self.build_duration,
            "build_id": self.build_id,
            "pipeline_id": self.pipeline_id,
            "pr_url": self.pr_url,
            "label_name": self.label_name,
            "build_log_url": self.build_log_url,
            "artifacts_url": self.artifacts_url,
        }


@dataclass
class SystemMetrics:
    """系统资源指标。"""
    total_memory: str = ""
    free_memory: str = ""
    user_cpu: str = ""
    system_cpu: str = ""
    idle_cpu: str = ""

    def to_dict(self) -> Dict[str, Any]:
        return {
            "total_memory": self.total_memory,
            "free_memory": self.free_memory,
            "user_cpu": self.user_cpu,
            "system_cpu": self.system_cpu,
        }


@dataclass
class HvigorTaskInfo:
    """一个 hvigor 任务的信息。"""
    task_name: str = ""        # 如 :entry:default@CompileArkTS
    duration_ms: int = 0       # 耗时（毫秒）
    status: str = "finished"  # finished / failed
    line_no: int = 0
    timestamp: str = ""

    def to_dict(self) -> Dict[str, Any]:
        return {
            "task_name": self.task_name,
            "duration_ms": self.duration_ms,
            "status": self.status,
            "line_no": self.line_no,
            "timestamp": self.timestamp,
        }


@dataclass
class CompileTarget:
    """编译目标信息。"""
    target: str = ""           # 如 test/xts/acts/validator/acts_validator:acts_validator_test
    compile_cmd: str = ""      # 编译命令
    line_no: int = 0

    def to_dict(self) -> Dict[str, Any]:
        return {
            "target": self.target,
            "compile_cmd": self.compile_cmd,
            "line_no": self.line_no,
        }


@dataclass
class AnalysisReport:
    """完整的日志分析报告。"""
    source_file: str = ""
    file_size: int = 0
    total_lines: int = 0
    analyzed_at: str = ""
    build_result: BuildResult = field(default_factory=BuildResult)
    stages: List[StageInfo] = field(default_factory=list)
    errors: List[ErrorItem] = field(default_factory=list)
    root_cause: Optional[ErrorItem] = None
    hvigor_tasks: List[HvigorTaskInfo] = field(default_factory=list)
    compile_targets: List[CompileTarget] = field(default_factory=list)
    system_metrics: SystemMetrics = field(default_factory=SystemMetrics)
    warnings: List[str] = field(default_factory=list)
    summary: str = ""

    @property
    def error_count(self) -> int:
        return len(self.errors)

    @property
    def root_cause_error(self) -> Optional[ErrorItem]:
        for err in self.errors:
            if err.root_cause:
                return err
        return self.errors[0] if self.errors else None

    def to_dict(self) -> Dict[str, Any]:
        return {
            "source_file": self.source_file,
            "file_size": self.file_size,
            "total_lines": self.total_lines,
            "analyzed_at": self.analyzed_at,
            "build_result": self.build_result.to_dict(),
            "stages": [s.to_dict() for s in self.stages],
            "errors": [e.to_dict() for e in self.errors],
            "root_cause": self.root_cause.to_dict() if self.root_cause else None,
            "hvigor_tasks": [t.to_dict() for t in self.hvigor_tasks],
            "compile_targets": [t.to_dict() for t in self.compile_targets],
            "system_metrics": self.system_metrics.to_dict(),
            "warnings": self.warnings,
            "summary": self.summary,
            "error_count": self.error_count,
        }
class LogLevel(Enum):
    DEBUG = auto()
    INFO = auto()
    WARN = auto()
    ERROR = auto()


class Logger:
    """轻量日志器。"""

    _COLORS = {
        LogLevel.DEBUG: "\033[36m",
        LogLevel.INFO: "\033[32m",
        LogLevel.WARN: "\033[33m",
        LogLevel.ERROR: "\033[31m",
    }
    _LABELS = {
        LogLevel.DEBUG: "DEBUG",
        LogLevel.INFO: "INFO ",
        LogLevel.WARN: "WARN ",
        LogLevel.ERROR: "ERROR",
    }
    _RESET = "\033[0m"

    def __init__(self, level: LogLevel = LogLevel.INFO,
                 use_color: bool = True):
        self.level = level
        self.use_color = use_color and sys.stdout.isatty()

    def _emit(self, level: LogLevel, msg: str) -> None:
        if level.value < self.level.value:
            return
        ts = time.strftime("%H:%M:%S")
        label = self._LABELS[level]
        line = f"[{ts}] [{label}] {msg}"
        if self.use_color:
            print(f"{self._COLORS[level]}{line}{self._RESET}")
        else:
            print(line)

    def debug(self, msg: str) -> None:
        self._emit(LogLevel.DEBUG, msg)

    def info(self, msg: str) -> None:
        self._emit(LogLevel.INFO, msg)

    def warn(self, msg: str) -> None:
        self._emit(LogLevel.WARN, msg)

    def error(self, msg: str) -> None:
        self._emit(LogLevel.ERROR, msg)

    def section(self, title: str) -> None:
        bar = "=" * 60
        self._emit(LogLevel.INFO, f"\n{bar}\n {title}\n{bar}")

    @staticmethod
    def from_string(name: str) -> "Logger":
        mapping = {
            "debug": LogLevel.DEBUG, "info": LogLevel.INFO,
            "warn": LogLevel.WARN, "error": LogLevel.ERROR,
        }
        return Logger(mapping.get(name.lower(), LogLevel.INFO))


class LogLineParser:
    """解析单行日志，剥离时间戳前缀。"""

    def __init__(self, logger: Optional[Logger] = None):
        self.logger = logger or Logger()

    def parse_line(self, raw: str, line_no: int) -> LogLine:
        """解析一行日志，返回 LogLine 对象。"""
        raw_stripped = raw.rstrip("\n\r")
        match = RE_TIMESTAMP.search(raw_stripped)
        if match:
            ts_str = match.group(1)
            # 时间戳之后的内容
            content = raw_stripped[match.end():].lstrip()
            dt = self._parse_timestamp(ts_str)
        else:
            ts_str = ""
            content = raw_stripped
            dt = None
        # 清理 ANSI 颜色码
        content = self._strip_ansi(content)
        return LogLine(
            raw=raw_stripped, content=content,
            line_no=line_no, timestamp=ts_str, datetime_obj=dt,
        )

    @staticmethod
    def _parse_timestamp(ts_str: str) -> Optional[datetime]:
        """解析时间戳字符串为 datetime 对象。"""
        try:
            return datetime.strptime(ts_str, TS_FORMAT)
        except ValueError:
            return None

    @staticmethod
    def _strip_ansi(text: str) -> str:
        """移除 ANSI 转义序列（颜色码等）。"""
        ansi_re = re.compile(r"\x1b\[[0-9;]*m")
        return ansi_re.sub("", text)

    def parse_lines(self, lines: Iterable[str]) -> List[LogLine]:
        """批量解析日志行。"""
        result: List[LogLine] = []
        for idx, line in enumerate(lines, start=1):
            result.append(self.parse_line(line, idx))
        return result

class LogReader:
    """读取日志文件，支持流式处理大文件。"""

    def __init__(self, file_path: str, encoding: str = "utf-8",
                 logger: Optional[Logger] = None):
        self.file_path = Path(file_path)
        self.encoding = encoding
        self.logger = logger or Logger()

    def exists(self) -> bool:
        return self.file_path.is_file()

    def file_size(self) -> int:
        try:
            return self.file_path.stat().st_size
        except OSError:
            return 0

    def read_all(self) -> List[str]:
        """读取全部行。"""
        if not self.exists():
            raise FileReadError(f"日志文件不存在: {self.file_path}")
        self.logger.info(f"读取日志文件: {self.file_path} "
                         f"({self.file_size() / 1024:.0f} KB)")
        encodings = [self.encoding, "utf-8-sig", "gbk", "latin-1"]
        for enc in encodings:
            try:
                with open(self.file_path, "r", encoding=enc,
                          errors="replace") as fh:
                    lines = fh.readlines()
                self.logger.info(f"读取完成：{len(lines)} 行 (编码: {enc})")
                return lines
            except (UnicodeDecodeError, OSError):
                continue
        raise FileReadError(f"无法读取文件: {self.file_path}")

    def iter_lines(self) -> Iterable[str]:
        """逐行迭代读取（流式，适合大文件）。"""
        if not self.exists():
            raise FileReadError(f"日志文件不存在: {self.file_path}")
        encodings = [self.encoding, "utf-8-sig", "gbk", "latin-1"]
        for enc in encodings:
            try:
                with open(self.file_path, "r", encoding=enc,
                          errors="replace") as fh:
                    for line in fh:
                        yield line
                return
            except OSError:
                continue
        raise FileReadError(f"无法读取文件: {self.file_path}")

    def read_lines_range(self, start: int, end: int) -> List[str]:
        """读取指定行号范围的行（1-based）。"""
        lines = self.read_all()
        start = max(1, start)
        end = min(len(lines), end)
        return lines[start - 1: end]

class ErrorMatcher:
    """单个错误模式的匹配器。"""

    def __init__(self, error_type: ErrorType, pattern: re.Pattern,
                 severity: Severity = Severity.ERROR,
                 extractor: Optional[Callable] = None,
                 description: str = ""):
        self.error_type = error_type
        self.pattern = pattern
        self.severity = severity
        self.extractor = extractor
        self.description = description

    def match(self, content: str) -> Optional[re.Match]:
        """检查内容是否匹配此模式。"""
        return self.pattern.search(content)

    def extract(self, match: re.Match, log_line: LogLine,
                context_lines: List[str]) -> ErrorItem:
        """从匹配结果提取错误信息。"""
        item = ErrorItem(
            error_type=self.error_type,
            severity=self.severity,
            line_no=log_line.line_no,
            timestamp=log_line.timestamp,
            context=context_lines,
        )
        if self.extractor:
            self.extractor(item, match, log_line)
        else:
            item.message = match.group(0)
        return item


# ------------------------------------------------------------------
# 各错误类型的提取函数
# ------------------------------------------------------------------

def _extract_ninja_failed(item: ErrorItem, match: re.Match,
                          log_line: LogLine) -> None:
    """提取 ninja FAILED 目标。"""
    item.target = match.group(1)
    item.message = f"ninja 编译目标失败: {item.target}"
    item.detail = log_line.content


def _extract_ninja_cmd_failed(item: ErrorItem, match: re.Match,
                              log_line: LogLine) -> None:
    """提取 ninja command failed。"""
    cmd = match.group(1)
    ret_code = match.group(2)
    item.message = f"ninja 命令执行失败 (ret_code={ret_code})"
    item.detail = cmd
    item.target = "ninja"
    item.error_code = ret_code


def _extract_hvigor_build_failed(item: ErrorItem, match: re.Match,
                                 log_line: LogLine) -> None:
    """提取 hvigor BUILD FAILED。"""
    duration = match.group(1).strip()
    item.message = f"hvigor 构建失败 (耗时 {duration})"
    item.detail = log_line.content


def _extract_hvigor_task_failed(item: ErrorItem, match: re.Match,
                                log_line: LogLine) -> None:
    """提取 hvigor 任务失败。"""
    task = match.group(1)
    item.target = task
    item.message = f"hvigor 任务失败: {task}"
    item.detail = log_line.content


def _extract_hvigor_arkts_error(item: ErrorItem, match: re.Match,
                                log_line: LogLine) -> None:
    """提取 ArkTS 编译器错误。"""
    code = match.group(1)
    item.error_code = code
    item.message = f"ArkTS 编译器错误 (错误码 {code})"
    item.detail = log_line.content


def _extract_page_not_exist(item: ErrorItem, match: re.Match,
                            log_line: LogLine) -> None:
    """提取页面不存在错误。"""
    page_path = match.group(1)
    item.target = page_path
    page_name = os.path.basename(page_path)
    item.message = f"页面文件不存在: {page_name}"
    item.detail = f"路径: {page_path}"
    item.solution = (
        "检查 main_pages.json 是否注册了已删除的页面，"
        "移除对应路由注册项或恢复页面文件"
    )


def _extract_build_error_marker(item: ErrorItem, match: re.Match,
                                log_line: LogLine) -> None:
    """提取 build error 标记。"""
    item.message = "构建错误标记"
    item.detail = log_line.content


def _extract_build_result_failed(item: ErrorItem, match: re.Match,
                                 log_line: LogLine) -> None:
    """提取 build result:failed。"""
    result = match.group(1)
    item.message = f"构建结果: {result}"
    item.detail = log_line.content


def _extract_pipeline_failed(item: ErrorItem, match: re.Match,
                             log_line: LogLine) -> None:
    """提取流水线失败消息。"""
    parts: List[str] = []
    comp_match = RE_PIPELINE_COMPONENT.search(log_line.content)
    if comp_match:
        parts.append(f"组件: {comp_match.group(1)}")
    result_match = RE_PIPELINE_RESULT.search(log_line.content)
    if result_match:
        parts.append(f"结果: {result_match.group(1)}")
    ft_match = RE_PIPELINE_FAIL_TYPE.search(log_line.content)
    if ft_match:
        parts.append(f"失败类型: {ft_match.group(1)}")
    fr_match = RE_PIPELINE_FAIL_REASON.search(log_line.content)
    if fr_match:
        parts.append(f"失败原因: {fr_match.group(1)}")
    item.message = "流水线失败: " + ", ".join(parts)
    item.detail = log_line.content[:500]

class PatternRegistry:
    """错误模式注册表，管理所有 ErrorMatcher。"""

    def __init__(self):
        self._matchers: List[ErrorMatcher] = []
        self._register_defaults()

    def _register_defaults(self) -> None:
        """注册默认的错误匹配模式。"""
        self.register(ErrorMatcher(
            ErrorType.PAGE_NOT_EXIST, RE_PAGE_NOT_EXIST,
            Severity.FATAL, _extract_page_not_exist,
            "页面文件不存在（hvigor 10906403 根因）",
        ))
        self.register(ErrorMatcher(
            ErrorType.HVIGOR_ARKTS_ERROR, RE_HVIGOR_ARKTS_ERROR,
            Severity.FATAL, _extract_hvigor_arkts_error,
            "ArkTS 编译器错误",
        ))
        self.register(ErrorMatcher(
            ErrorType.HVIGOR_BUILD_FAILED, RE_HVIGOR_BUILD_FAILED,
            Severity.FATAL, _extract_hvigor_build_failed,
            "hvigor 构建失败",
        ))
        self.register(ErrorMatcher(
            ErrorType.HVIGOR_TASK_FAILED, RE_HVIGOR_TASK_FAILED,
            Severity.ERROR, _extract_hvigor_task_failed,
            "hvigor 任务失败",
        ))
        self.register(ErrorMatcher(
            ErrorType.NINJA_FAILED, RE_NINJA_FAILED,
            Severity.ERROR, _extract_ninja_failed,
            "ninja 目标编译失败",
        ))
        self.register(ErrorMatcher(
            ErrorType.NINJA_CMD_FAILED, RE_NINJA_CMD_FAILED,
            Severity.ERROR, _extract_ninja_cmd_failed,
            "ninja 命令执行失败",
        ))
        self.register(ErrorMatcher(
            ErrorType.BUILD_ERROR, RE_BUILD_ERROR_MARKER,
            Severity.FATAL, _extract_build_error_marker,
            "构建错误标记",
        ))
        self.register(ErrorMatcher(
            ErrorType.BUILD_RESULT_FAILED, RE_BUILD_RESULT,
            Severity.ERROR, _extract_build_result_failed,
            "构建结果",
        ))
        self.register(ErrorMatcher(
            ErrorType.PIPELINE_FAILED, RE_PIPELINE_MSG,
            Severity.ERROR, _extract_pipeline_failed,
            "流水线消息",
        ))

    def register(self, matcher: ErrorMatcher) -> None:
        """注册一个匹配器（后注册的优先级高，插到列表前部）。"""
        self._matchers.insert(0, matcher)

    def match_line(self, content: str) -> Optional[ErrorMatcher]:
        """对一行内容尝试匹配，返回第一个匹配的 matcher。"""
        for matcher in self._matchers:
            if matcher.match(content):
                return matcher
        return None

    def get_all_matchers(self) -> List[ErrorMatcher]:
        return list(self._matchers)

    def filter_by_type(self, error_type: ErrorType) -> List[ErrorMatcher]:
        return [m for m in self._matchers if m.error_type == error_type]

class TracebackAnalyzer:
    """分析 Python Traceback 堆栈。"""

    def __init__(self, logger: Optional[Logger] = None):
        self.logger = logger or Logger()

    def find_tracebacks(self, log_lines: List[LogLine]) -> List[ErrorItem]:
        """查找所有 Python Traceback 并提取堆栈帧。"""
        results: List[ErrorItem] = []
        i = 0
        n = len(log_lines)
        while i < n:
            if RE_TRACEBACK_START.search(log_lines[i].content):
                item = self._extract_traceback(log_lines, i)
                results.append(item)
                i = item.line_no + len(item.traceback_frames) + 5
            else:
                i += 1
        self.logger.debug(f"找到 {len(results)} 个 Python Traceback")
        return results

    def _extract_traceback(self, lines: List[LogLine],
                           start_idx: int) -> ErrorItem:
        """从 start_idx 开始提取一个完整的 Traceback。"""
        start_line = lines[start_idx]
        frames: List[Dict[str, str]] = []
        exception_msg = ""
        context: List[str] = []
        i = start_idx
        n = len(lines)
        max_lines = 50  # 防止无限扫描
        while i < n and i < start_idx + max_lines:
            line = lines[i]
            context.append(line.content)
            file_match = RE_TRACEBACK_FILE.search(line.content)
            if file_match:
                frames.append({
                    "file": file_match.group(1),
                    "line": file_match.group(2),
                    "function": file_match.group(3),
                })
            ohos_exc_match = RE_OHOS_EXCEPTION.search(line.content)
            if ohos_exc_match:
                exception_msg = ohos_exc_match.group(1)
                # 继续读 OHOSException 的结构化字段
                i += 1
                exc_fields = self._extract_exception_fields(lines, i)
                break
            raise_match = RE_RAISE.search(line.content)
            if raise_match and not exception_msg:
                exception_msg = f"raised {raise_match.group(1)}"
            i += 1
        item = ErrorItem(
            error_type=ErrorType.PYTHON_TRACEBACK,
            severity=Severity.FATAL,
            line_no=start_line.line_no,
            timestamp=start_line.timestamp,
            message=exception_msg or "Python 异常",
            detail="\n".join(context),
            traceback_frames=frames,
            context=context,
        )
        if not exception_msg and frames:
            last_frame = frames[-1]
            item.message = f"异常于 {last_frame['file']}:{last_frame['line']}"
        return item

    @staticmethod
    def _extract_exception_fields(lines: List[LogLine],
                                  start_idx: int) -> Dict[str, str]:
        """提取 OHOSException 的结构化字段（Code/Reason/...）。"""
        fields: Dict[str, str] = {}
        n = len(lines)
        i = start_idx
        max_scan = 15
        while i < n and i < start_idx + max_scan:
            content = lines[i].content.strip()
            if not content:
                i += 1
                continue
            for name, regex in [
                ("code", RE_CODE), ("reason", RE_REASON),
                ("error_type", RE_ERROR_TYPE),
                ("description", RE_DESCRIPTION),
                ("solution", RE_SOLUTION),
            ]:
                m = regex.match(content)
                if m:
                    fields[name] = m.group(1).strip()
            # 遇到非字段行且已收集到字段，停止
            if content and not any(
                r.match(content) for r in
                [RE_CODE, RE_REASON, RE_ERROR_TYPE,
                 RE_DESCRIPTION, RE_SOLUTION]
            ) and fields:
                break
            i += 1
        return fields

class StageTracker:
    """追踪构建阶段的开始/结束与耗时。"""

    def __init__(self, logger: Optional[Logger] = None):
        self.logger = logger or Logger()
        self.stages: List[StageInfo] = []
        self._pending: Dict[str, StageInfo] = {}

    def process_line(self, log_line: LogLine) -> None:
        """处理一行日志，更新阶段状态。"""
        content = log_line.content
        start_match = RE_STAGE_START.search(content)
        if start_match:
            stage_name = start_match.group(1)
            stage = StageInfo(
                name=stage_name, status=StageStatus.RUNNING,
                start_time=log_line.timestamp,
                start_dt=log_line.datetime_obj,
                line_start=log_line.line_no,
            )
            self._pending[stage_name] = stage
            self.logger.debug(f"阶段开始: {stage_name} (行 {log_line.line_no})")
            return
        end_match = RE_STAGE_END.search(content)
        if end_match:
            stage_name = end_match.group(1)
            stage = self._pending.pop(stage_name, None)
            if stage:
                stage.status = StageStatus.SUCCESS
                stage.end_time = log_line.timestamp
                stage.end_dt = log_line.datetime_obj
                stage.line_end = log_line.line_no
                stage.duration_seconds = self._calc_duration(stage)
                self.stages.append(stage)
                self.logger.debug(
                    f"阶段完成: {stage_name} ({stage.duration_str})"
                )
            else:
                # 未找到对应的开始，直接创建
                stage = StageInfo(
                    name=stage_name, status=StageStatus.SUCCESS,
                    end_time=log_line.timestamp,
                    end_dt=log_line.datetime_obj,
                    line_end=log_line.line_no,
                )
                self.stages.append(stage)

    @staticmethod
    def _calc_duration(stage: StageInfo) -> float:
        """计算阶段耗时（秒）。"""
        if stage.start_dt and stage.end_dt:
            delta = stage.end_dt - stage.start_dt
            return delta.total_seconds()
        return 0.0

    def get_stages(self) -> List[StageInfo]:
        return list(self.stages)

    def get_failed_stages(self) -> List[StageInfo]:
        return [s for s in self.stages if s.status == StageStatus.FAILED]

    def get_total_duration(self) -> float:
        return sum(s.duration_seconds for s in self.stages)


class HvigorTaskTracker:
    """追踪 hvigor 任务的执行情况。"""

    def __init__(self, logger: Optional[Logger] = None):
        self.logger = logger or Logger()
        self.tasks: List[HvigorTaskInfo] = []

    def process_line(self, log_line: LogLine) -> None:
        """处理一行日志，提取 hvigor 任务信息。"""
        finished_match = RE_HVIGOR_FINISHED.search(log_line.content)
        if finished_match:
            task_name = finished_match.group(1).strip()
            duration_ms = int(finished_match.group(2))
            status = "finished"
            # 检查是否为失败任务
            if "Failed" in task_name or "ERROR" in log_line.content:
                status = "failed"
            task = HvigorTaskInfo(
                task_name=task_name, duration_ms=duration_ms,
                status=status, line_no=log_line.line_no,
                timestamp=log_line.timestamp,
            )
            self.tasks.append(task)

    def get_tasks(self) -> List[HvigorTaskInfo]:
        return list(self.tasks)

    def get_failed_tasks(self) -> List[HvigorTaskInfo]:
        return [t for t in self.tasks if t.status == "failed"]

    def get_total_duration_ms(self) -> int:
        return sum(t.duration_ms for t in self.tasks)

class CompileTargetExtractor:
    """从日志中提取编译目标信息。"""

    def __init__(self, logger: Optional[Logger] = None):
        self.logger = logger or Logger()
        self.targets: List[CompileTarget] = []

    def process_line(self, log_line: LogLine) -> None:
        """处理一行日志，提取编译目标。"""
        content = log_line.content
        target_match = RE_BUILD_TARGET.search(content)
        if target_match:
            raw = target_match.group(1)
            for t in raw.split(","):
                t = t.strip().strip("'\"")
                if t:
                    self.targets.append(CompileTarget(
                        target=t, line_no=log_line.line_no,
                    ))
            return
        cmd_match = RE_COMPILE_CMD.search(content)
        if cmd_match:
            cmd = cmd_match.group(1).strip()
            target_arg_match = RE_BUILD_TARGET_ARG.search(cmd)
            if target_arg_match:
                self.targets.append(CompileTarget(
                    target=target_arg_match.group(1),
                    compile_cmd=cmd, line_no=log_line.line_no,
                ))

    def get_targets(self) -> List[CompileTarget]:
        return list(self.targets)

class MetricsExtractor:
    """从日志中提取系统资源指标。"""

    def __init__(self, logger: Optional[Logger] = None):
        self.logger = logger or Logger()
        self.metrics = SystemMetrics()

    def process_line(self, log_line: LogLine) -> None:
        """处理一行日志，提取系统指标。"""
        content = log_line.content
        m = RE_TOTAL_MEMORY.search(content)
        if m:
            self.metrics.total_memory = f"{m.group(1)}{m.group(2)}"
        m = RE_FREE_MEMORY.search(content)
        if m:
            self.metrics.free_memory = f"{m.group(1)}{m.group(2)}"
        m = RE_CPU_USER.search(content)
        if m:
            self.metrics.user_cpu = f"{m.group(1)}%"
        m = RE_CPU_SYSTEM.search(content)
        if m:
            self.metrics.system_cpu = f"{m.group(1)}%"

    def get_metrics(self) -> SystemMetrics:
        return self.metrics


class BuildResultExtractor:
    """从日志中提取构建结果信息。"""

    def __init__(self, logger: Optional[Logger] = None):
        self.logger = logger or Logger()
        self.result = BuildResult()

    def process_line(self, log_line: LogLine) -> None:
        """处理一行日志，提取构建结果。"""
        content = log_line.content

        # build result:failed
        m = RE_BUILD_RESULT.search(content)
        if m:
            self.result.build_result_str = m.group(1)
            if m.group(1) == "failed":
                self.result.overall_status = "failed"
            elif m.group(1) == "success":
                self.result.overall_status = "success"

        # label_name: 编译失败
        m = RE_LABEL_NAME.search(content)
        if m:
            self.result.label_name = m.group(1).strip()

        # buildFailType / buildFailReason
        m = RE_BUILD_FAIL_TYPE.search(content)
        if m:
            self.result.fail_type = m.group(1)
        m = RE_BUILD_FAIL_REASON.search(content)
        if m:
            self.result.fail_reason = m.group(1)

        # 流水线消息中的信息
        if RE_PIPELINE_MSG.search(content):
            m = RE_PIPELINE_COMPONENT.search(content)
            if m:
                self.result.component = m.group(1)
            m = RE_PIPELINE_RESULT.search(content)
            if m:
                result_val = m.group(1)
                if result_val == "failed":
                    self.result.overall_status = "failed"
                elif result_val == "success":
                    self.result.overall_status = "success"
            m = RE_PIPELINE_FAIL_TYPE.search(content)
            if m:
                self.result.fail_type = m.group(1)
            m = RE_PIPELINE_FAIL_REASON.search(content)
            if m:
                self.result.fail_reason = m.group(1)
            m = RE_LOG_URL.search(content)
            if m:
                self.result.build_log_url = m.group(1)
            m = RE_ARTIFACTS_URL.search(content)
            if m:
                self.result.artifacts_url = m.group(1)

        # PR URL
        m = RE_PR_URL.search(content)
        if m and not self.result.pr_url:
            self.result.pr_url = m.group(1)
        m = RE_PR_LABEL.search(content)
        if m and not self.result.pr_url:
            self.result.pr_url = m.group(1)

        # build duration
        m = re.search(r"'buildDuration':\s*(\d+)", content)
        if m:
            self.result.build_duration = int(m.group(1))

        # buildId / pipelineId
        m = re.search(r"'buildId':\s*'([^']+)'", content)
        if m:
            self.result.build_id = m.group(1)
        m = re.search(r"'pipelineId':\s*'([^']+)'", content)
        if m:
            self.result.pipeline_id = m.group(1)

    def get_result(self) -> BuildResult:
        return self.result


class ContextExtractor:
    """提取错误行的上下文（前后若干行）。"""

    def __init__(self, context_before: int = 2,
                 context_after: int = 5,
                 logger: Optional[Logger] = None):
        self.context_before = context_before
        self.context_after = context_after
        self.logger = logger or Logger()

    def extract(self, log_lines: List[LogLine],
                error_line_no: int) -> List[str]:
        """提取指定行号的上下文。"""
        start = max(0, error_line_no - 1 - self.context_before)
        end = min(len(log_lines), error_line_no + self.context_after)
        result: List[str] = []
        for i in range(start, end):
            marker = " >>> " if (i + 1) == error_line_no else "     "
            result.append(f"{marker}{log_lines[i].content}")
        return result

class ErrorExtractor:
    """从日志中提取所有错误项。"""

    def __init__(self, registry: PatternRegistry,
                 context_extractor: ContextExtractor,
                 traceback_analyzer: TracebackAnalyzer,
                 logger: Optional[Logger] = None):
        self.registry = registry
        self.context_extractor = context_extractor
        self.traceback_analyzer = traceback_analyzer
        self.logger = logger or Logger()
        self.errors: List[ErrorItem] = []

    def extract(self, log_lines: List[LogLine]) -> List[ErrorItem]:
        """从日志行中提取所有错误。"""
        self.errors = []
        seen_lines: Set[int] = set()

        # 1. 逐行匹配已知模式
        for log_line in log_lines:
            if log_line.line_no in seen_lines:
                continue
            matcher = self.registry.match_line(log_line.content)
            if matcher:
                match = matcher.pattern.search(log_line.content)
                if match:
                    context = self.context_extractor.extract(
                        log_lines, log_line.line_no
                    )
                    item = matcher.extract(match, log_line, context)
                    self.errors.append(item)
                    seen_lines.add(log_line.line_no)

        # 2. 提取 Python Traceback（多行模式）
        tracebacks = self.traceback_analyzer.find_tracebacks(log_lines)
        for tb in tracebacks:
            if tb.line_no not in seen_lines:
                self.errors.append(tb)
                seen_lines.add(tb.line_no)

        # 按行号排序
        self.errors.sort(key=lambda e: e.line_no)
        self.logger.info(f"共提取 {len(self.errors)} 个错误项")
        return list(self.errors)

    def filter_by_type(self, error_type: ErrorType) -> List[ErrorItem]:
        """按错误类型过滤。"""
        return [e for e in self.errors if e.error_type == error_type]

    def filter_by_severity(self, severity: Severity) -> List[ErrorItem]:
        """按严重级别过滤。"""
        return [e for e in self.errors
                if e.severity.value >= severity.value]

    def get_fatal_errors(self) -> List[ErrorItem]:
        """获取致命错误。"""
        return [e for e in self.errors if e.severity == Severity.FATAL]

class RootCauseAnalyzer:
    """分析根本错误原因。"""

    def __init__(self, logger: Optional[Logger] = None):
        self.logger = logger or Logger()

    def analyze(self, errors: List[ErrorItem]) -> Optional[ErrorItem]:


        if not errors:
            return None

        # 按优先级排序的类型列表
        priority_order = [
            ErrorType.PAGE_NOT_EXIST,
            ErrorType.HVIGOR_ARKTS_ERROR,
            ErrorType.HVIGOR_BUILD_FAILED,
            ErrorType.HVIGOR_TASK_FAILED,
            ErrorType.NINJA_FAILED,
            ErrorType.NINJA_CMD_FAILED,
            ErrorType.PYTHON_TRACEBACK,
            ErrorType.OHOS_EXCEPTION,
            ErrorType.BUILD_ERROR,
            ErrorType.BUILD_RESULT_FAILED,
            ErrorType.PIPELINE_FAILED,
        ]
        for error_type in priority_order:
            for err in errors:
                if err.error_type == error_type:
                    err.root_cause = True
                    self.logger.info(
                        f"根因: [{err.error_type.label}] 行 {err.line_no}: "
                        f"{err.message}"
                    )
                    return err

        # 取第一个 FATAL
        for err in errors:
            if err.severity == Severity.FATAL:
                err.root_cause = True
                return err

        # 取第一个
        errors[0].root_cause = True
        return errors[0]

    def generate_summary(self, report: AnalysisReport) -> str:
        """生成分析摘要。"""
        lines: List[str] = []
        r = report.build_result
        lines.append(f"文件: {report.source_file}")
        lines.append(f"行数: {report.total_lines}")
        lines.append(f"构建状态: {r.overall_status}")
        if r.component:
            lines.append(f"组件: {r.component}")
        if r.fail_type:
            lines.append(f"失败类型: {r.fail_type}")
        if r.fail_reason:
            lines.append(f"失败原因: {r.fail_reason}")
        lines.append(f"错误数: {report.error_count}")
        rc = report.root_cause_error
        if rc:
            lines.append(f"根本原因: [{rc.error_type.label}] {rc.message}")
            if rc.target:
                lines.append(f"失败目标: {rc.target}")
            if rc.solution:
                lines.append(f"建议修复: {rc.solution}")
        if r.build_log_url:
            lines.append(f"构建日志: {r.build_log_url}")
        if r.pr_url:
            lines.append(f"PR: {r.pr_url}")
        return "\n".join(lines)

class ReportGenerator:
    """生成 text / markdown / json 格式的分析报告。"""

    def __init__(self, report: AnalysisReport,
                 logger: Optional[Logger] = None):
        self.report = report
        self.logger = logger or Logger()

    def generate(self, fmt: str = "text") -> str:
        if fmt == "json":
            return self._generate_json()
        if fmt == "markdown":
            return self._generate_markdown()
        return self._generate_text()

    # ------------------------------------------------------------------
    # Text 格式
    # ------------------------------------------------------------------
    def _generate_text(self) -> str:
        r = self.report
        br = r.build_result
        lines: List[str] = []
        lines.append("=" * 70)
        lines.append(" OHOS 编译日志分析报告")
        lines.append("=" * 70)
        lines.append(f"源文件:     {r.source_file}")
        lines.append(f"文件大小:   {r.file_size / 1024:.1f} KB")
        lines.append(f"总行数:     {r.total_lines}")
        lines.append(f"分析时间:   {r.analyzed_at}")
        lines.append("")
        lines.append("-" * 70)
        lines.append(" 构建结果")
        lines.append("-" * 70)
        lines.append(f"  整体状态:   {br.overall_status}")
        if br.component:
            lines.append(f"  组件:       {br.component}")
        if br.fail_type:
            lines.append(f"  失败类型:   {br.fail_type}")
        if br.fail_reason:
            lines.append(f"  失败原因:   {br.fail_reason}")
        if br.build_duration:
            mins = br.build_duration // 60
            secs = br.build_duration % 60
            lines.append(f"  构建时长:   {mins}m {secs}s")
        if br.pr_url:
            lines.append(f"  PR:         {br.pr_url}")
        if br.label_name:
            lines.append(f"  标签:       {br.label_name}")
        if br.build_log_url:
            lines.append(f"  构建日志:   {br.build_log_url}")
        if br.artifacts_url:
            lines.append(f"  产物:       {br.artifacts_url}")
        lines.append("")

        # 根本原因
        rc = r.root_cause_error
        if rc:
            lines.append("-" * 70)
            lines.append(" 根本原因")
            lines.append("-" * 70)
            lines.append(f"  类型:       {rc.error_type.label}")
            lines.append(f"  行号:       {rc.line_no}")
            if rc.timestamp:
                lines.append(f"  时间戳:     {rc.timestamp}")
            if rc.error_code:
                lines.append(f"  错误码:     {rc.error_code}")
            lines.append(f"  消息:       {rc.message}")
            if rc.target:
                lines.append(f"  目标:       {rc.target}")
            if rc.detail:
                detail_short = rc.detail[:200]
                if len(rc.detail) > 200:
                    detail_short += "..."
                lines.append(f"  详情:       {detail_short}")
            if rc.solution:
                lines.append(f"  修复建议:   {rc.solution}")
            if rc.traceback_frames:
                lines.append(f"  堆栈帧:")
                for frame in rc.traceback_frames:
                    lines.append(f"    {frame['file']}:{frame['line']} "
                                 f"in {frame['function']}")
            if rc.context:
                lines.append(f"  上下文:")
                for ctx_line in rc.context[:10]:
                    lines.append(f"    {ctx_line}")
            lines.append("")

        # 错误列表
        if r.errors:
            lines.append("-" * 70)
            lines.append(f" 全部错误 ({r.error_count})")
            lines.append("-" * 70)
            for idx, err in enumerate(r.errors, start=1):
                tag = " [根因]" if err.root_cause else ""
                lines.append(f"  {idx}. [{err.severity.label}] "
                             f"[{err.error_type.label}]{tag}")
                lines.append(f"     行 {err.line_no}: {err.message}")
                if err.target:
                    lines.append(f"     目标: {err.target}")
            lines.append("")

        # 阶段时间线
        if r.stages:
            lines.append("-" * 70)
            lines.append(f" 构建阶段时间线 ({len(r.stages)})")
            lines.append("-" * 70)
            for stage in r.stages:
                status_tag = stage.status.value.upper()
                lines.append(f"  [{status_tag:8s}] {stage.name:40s} "
                             f"{stage.duration_str}")
            total = sum(s.duration_seconds for s in r.stages)
            lines.append(f"  {'总计':51s} {total:.1f}s")
            lines.append("")

        # hvigor 任务
        if r.hvigor_tasks:
            lines.append("-" * 70)
            lines.append(f" Hvigor 任务 ({len(r.hvigor_tasks)})")
            lines.append("-" * 70)
            failed_tasks = [t for t in r.hvigor_tasks if t.status == "failed"]
            if failed_tasks:
                lines.append(f"  失败任务:")
                for t in failed_tasks:
                    lines.append(f"    {t.task_name} (行 {t.line_no})")
            lines.append(f"  任务总数: {len(r.hvigor_tasks)}")
            total_ms = sum(t.duration_ms for t in r.hvigor_tasks)
            lines.append(f"  总耗时:   {total_ms} ms")
            # 最慢的 5 个任务
            sorted_tasks = sorted(r.hvigor_tasks,
                                  key=lambda t: t.duration_ms,
                                  reverse=True)
            lines.append(f"  最慢的 5 个任务:")
            for t in sorted_tasks[:5]:
                lines.append(f"    {t.duration_ms:6d} ms  {t.task_name}")
            lines.append("")

        # 编译目标
        if r.compile_targets:
            lines.append("-" * 70)
            lines.append(f" 编译目标 ({len(r.compile_targets)})")
            lines.append("-" * 70)
            for t in r.compile_targets:
                lines.append(f"  {t.target} (行 {t.line_no})")
            lines.append("")

        # 系统指标
        m = r.system_metrics
        if m.total_memory or m.user_cpu:
            lines.append("-" * 70)
            lines.append(" 系统资源")
            lines.append("-" * 70)
            if m.total_memory:
                lines.append(f"  总内存:   {m.total_memory}")
            if m.free_memory:
                lines.append(f"  空闲内存: {m.free_memory}")
            if m.user_cpu:
                lines.append(f"  用户CPU:  {m.user_cpu}")
            if m.system_cpu:
                lines.append(f"  系统CPU:  {m.system_cpu}")
            lines.append("")

        # 警告
        if r.warnings:
            lines.append("-" * 70)
            lines.append(f" 警告 ({len(r.warnings)})")
            lines.append("-" * 70)
            for w in r.warnings:
                lines.append(f"  - {w}")
            lines.append("")

        # 摘要
        if r.summary:
            lines.append("-" * 70)
            lines.append(" 摘要")
            lines.append("-" * 70)
            for sline in r.summary.splitlines():
                lines.append(f"  {sline}")
            lines.append("")

        lines.append("=" * 70)
        return "\n".join(lines)

    def _generate_markdown(self) -> str:
        r = self.report
        br = r.build_result
        lines: List[str] = []
        return "\n".join(lines)

    def _generate_json(self) -> str:
        return json.dumps(self.report.to_dict(), indent=2,
                          ensure_ascii=False)

    def save(self, path: str, fmt: str = "text") -> None:
        """保存报告到文件。"""
        content = self.generate(fmt)
        with open(path, "w", encoding="utf-8") as fh:
            fh.write(content)
        self.logger.info(f"报告已保存: {path} ({fmt})")

class LogAnalyzer:
    """编译日志分析器主类，编排所有组件。"""

    def __init__(self, file_path: str, encoding: str = "utf-8",
                 context_before: int = 2, context_after: int = 5,
                 logger: Optional[Logger] = None):
        self.file_path = file_path

    def analyze(self) -> AnalysisReport:
        """执行完整分析流程。"""
        self.logger.section("开始分析编译日志")
        # 1. 读取文件
        raw_lines = self.reader.read_all()
        total_lines = len(raw_lines)
        file_size = self.reader.file_size()
        # 2. 解析日志行
        log_lines = self.line_parser.parse_lines(raw_lines)
        self.logger.info(f"解析 {total_lines} 行日志")
        # 3. 逐行处理（阶段/任务/目标/指标/结果）
        for log_line in log_lines:
            self.stage_tracker.process_line(log_line)
            self.hvigor_tracker.process_line(log_line)
            self.target_extractor.process_line(log_line)
            self.metrics_extractor.process_line(log_line)
            self.result_extractor.process_line(log_line)
        # 4. 提取错误
        errors = self.error_extractor.extract(log_lines)
        # 5. 根因分析
        root_cause = self.root_cause_analyzer.analyze(errors)
        # 6. 组装报告
        self.report = AnalysisReport(
            source_file=self.file_path,
            file_size=file_size,
            total_lines=total_lines,
            analyzed_at=time.strftime("%Y-%m-%d %H:%M:%S"),
            build_result=self.result_extractor.get_result(),
            stages=self.stage_tracker.get_stages(),
            errors=errors,
            root_cause=root_cause,
            hvigor_tasks=self.hvigor_tracker.get_tasks(),
            compile_targets=self.target_extractor.get_targets(),
            system_metrics=self.metrics_extractor.get_metrics(),
        )
        # 7. 生成摘要
        self.report.summary = self.root_cause_analyzer.generate_summary(
            self.report
        )
        # 8. 额外警告
        self._collect_warnings()
        self.logger.section("分析完成")
        self.logger.info(f"构建状态: {self.report.build_result.overall_status}")
        self.logger.info(f"错误数: {self.report.error_count}")
        if root_cause:
            self.logger.info(f"根因: {root_cause.message}")
        return self.report

    def _collect_warnings(self) -> None:
        """收集额外警告。"""
        warnings: List[str] = []
        # 检查 hvigor 任务中是否有 Failed
        failed_tasks = self.hvigor_tracker.get_failed_tasks()
        for t in failed_tasks:
            warnings.append(f"hvigor 任务失败: {t.task_name} (行 {t.line_no})")
        # 检查阶段是否有异常长耗时
        for stage in self.report.stages:
            if stage.duration_seconds > 300:
                warnings.append(
                    f"阶段耗时较长: {stage.name} ({stage.duration_str})"
                )
        # 检查内存不足
        m = self.report.system_metrics
        if m.free_memory and "GB" in m.free_memory:
            try:
                val = float(re.search(r"[\d.]+", m.free_memory).group())
                if val < 5:
                    warnings.append(f"空闲内存较低: {m.free_memory}")
            except (AttributeError, ValueError):
                pass
        self.report.warnings = warnings

class LogRead:
    """日志文件读取器（别名，兼容 LogReader 命名）。"""

    def __init__(self, file_path: str, encoding: str = "utf-8",
                 logger: Optional[Logger] = None):
        self.file_path = Path(file_path)
        self.encoding = encoding
        self.logger = logger or Logger()

    def exists(self) -> bool:
        return self.file_path.is_file()

    def file_size(self) -> int:
        try:
            return self.file_path.stat().st_size
        except OSError:
            return 0

    def read_all(self) -> List[str]:
        if not self.exists():
            raise FileReadError(f"日志文件不存在: {self.file_path}")
        self.logger.info(f"读取日志文件: {self.file_path} "
                         f"({self.file_size() / 1024:.0f} KB)")
        encodings = [self.encoding, "utf-8-sig", "gbk", "latin-1"]
        for enc in encodings:
            try:
                with open(self.file_path, "r", encoding=enc,
                          errors="replace") as fh:
                    lines = fh.readlines()
                self.logger.info(f"读取完成：{len(lines)} 行 (编码: {enc})")
                return lines
            except (UnicodeDecodeError, OSError):
                continue
        raise FileReadError(f"无法读取文件: {self.file_path}")

    def iter_lines(self) -> Iterable[str]:
        if not self.exists():
            raise FileReadError(f"日志文件不存在: {self.file_path}")
        for enc in [self.encoding, "utf-8-sig", "gbk", "latin-1"]:
            try:
                with open(self.file_path, "r", encoding=enc,
                          errors="replace") as fh:
                    for line in fh:
                        yield line
                return
            except OSError:
                continue
        raise FileReadError(f"无法读取文件: {self.file_path}")

class MultiFileAnalyzer:
    """分析多个日志文件并汇总结果。"""

    def __init__(self, file_paths: Sequence[str], encoding: str = "utf-8",
                 logger: Optional[Logger] = None):
        self.file_paths = list(file_paths)
        self.encoding = encoding
        self.logger = logger or Logger()
        self.reports: List[AnalysisReport] = []

    def analyze_all(self) -> List[AnalysisReport]:
        """分析所有日志文件。"""
        self.reports = []
        for fpath in self.file_paths:
            self.logger.info(f"分析文件: {fpath}")
            analyzer = LogAnalyzer(fpath, self.encoding, logger=self.logger)
            report = analyzer.analyze()
            self.reports.append(report)
        return list(self.reports)

    def get_summary(self) -> Dict[str, Any]:
        """获取多文件汇总。"""
        total = len(self.reports)
        failed = sum(1 for r in self.reports if r.build_result.is_failed)
        success = sum(1 for r in self.reports if r.build_result.is_success)
        total_errors = sum(r.error_count for r in self.reports)
        return {
            "total_files": total,
            "failed": failed,
            "success": success,
            "unknown": total - failed - success,
            "total_errors": total_errors,
            "files": [
                {
                    "file": r.source_file,
                    "status": r.build_result.overall_status,
                    "component": r.build_result.component,
                    "errors": r.error_count,
                    "root_cause": (
                        r.root_cause_error.message if r.root_cause_error else ""
                    ),
                }
                for r in self.reports
            ],
        }

    def save_summary(self, path: str) -> None:
        """保存汇总到 JSON 文件。"""
        with open(path, "w", encoding="utf-8") as fh:
            json.dump(self.get_summary(), fh, indent=2, ensure_ascii=False)
        self.logger.info(f"汇总已保存: {path}")

class ErrorFilter:
    """按条件过滤错误列表。"""

    @staticmethod
    def by_type(errors: List[ErrorItem],
                error_type: ErrorType) -> List[ErrorItem]:
        return [e for e in errors if e.error_type == error_type]

    @staticmethod
    def by_severity(errors: List[ErrorItem],
                    severity: Severity) -> List[ErrorItem]:
        return [e for e in errors if e.severity == severity]

    @staticmethod
    def by_line_range(errors: List[ErrorItem],
                      start: int, end: int) -> List[ErrorItem]:
        return [e for e in errors if start <= e.line_no <= end]

    @staticmethod
    def by_keyword(errors: List[ErrorItem],
                   keyword: str) -> List[ErrorItem]:
        kw = keyword.lower()
        return [e for e in errors
                if kw in e.message.lower() or kw in e.detail.lower()
                or kw in e.target.lower()]

    @staticmethod
    def fatal_only(errors: List[ErrorItem]) -> List[ErrorItem]:
        return [e for e in errors if e.severity == Severity.FATAL]

    @staticmethod
    def root_causes_only(errors: List[ErrorItem]) -> List[ErrorItem]:
        return [e for e in errors if e.root_cause]

class TimelineGenerator:
    """生成构建时间线。"""

    def __init__(self, report: AnalysisReport,
                 logger: Optional[Logger] = None):
        self.report = report
        self.logger = logger or Logger()

    def generate(self) -> str:
        """生成文本格式的时间线。"""
        lines: List[str] = []
        return "\n".join(lines)


class ErrorStatistics:
    """错误统计信息。"""

    def __init__(self, errors: List[ErrorItem]):
        self.errors = errors

    def count_by_type(self) -> Dict[str, int]:
        """按错误类型统计数量。"""
        result: Dict[str, int] = {}
        for err in self.errors:
            key = err.error_type.label
            result[key] = result.get(key, 0) + 1
        return result

    def count_by_severity(self) -> Dict[str, int]:
        """按严重级别统计数量。"""
        result: Dict[str, int] = {}
        for err in self.errors:
            key = err.severity.label
            result[key] = result.get(key, 0) + 1
        return result

    def get_summary(self) -> Dict[str, Any]:
        """获取统计摘要。"""
        return {
            "total_errors": len(self.errors),
            "by_type": self.count_by_type(),
            "by_severity": self.count_by_severity(),
            "fatal_count": len(
                [e for e in self.errors if e.severity == Severity.FATAL]
            ),
            "root_cause_count": len(
                [e for e in self.errors if e.root_cause]
            ),
        }

    def generate_text(self) -> str:
        """生成统计文本报告。"""
        lines: List[str] = []
        return "\n".join(lines)

def build_arg_parser() -> argparse.ArgumentParser:
    """构建命令行参数解析器。"""
    # 公共参数：主 parser 与子命令通过 parents 继承，
    # 使得 --no-color 等既可放在子命令前，也可放在子命令后。
    common = argparse.ArgumentParser(add_help=False, allow_abbrev=False)
    parser = argparse.ArgumentParser(
        prog="tt.py",
        description="OHOS 编译日志分析器：自动定位编译失败原因",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        allow_abbrev=False,
        parents=[common],
        epilog="""
""",
    )
    return parser


def create_logger(args: argparse.Namespace) -> Logger:
    """根据参数创建日志器。"""
    level_map = {
        "debug": LogLevel.DEBUG, "info": LogLevel.INFO,
        "warn": LogLevel.WARN, "error": LogLevel.ERROR,
    }
    level = level_map.get(args.log_level, LogLevel.INFO)
    use_color = not args.no_color
    return Logger(level=level, use_color=use_color)


def cmd_analyze(args: argparse.Namespace, logger: Logger) -> int:
    """执行 analyze 子命令。"""
    files = args.files
    fmt = args.format
    output = args.output
    keyword = args.filter

    if len(files) == 1:
        # 单文件分析
        analyzer = LogAnalyzer(
            files[0], args.encoding,
            args.context_before, args.context_after, logger,
        )
        report = analyzer.analyze()
        # 过滤
        if keyword:
            filtered_errors = ErrorFilter.by_keyword(report.errors, keyword)
            report.errors = filtered_errors
            logger.info(f"过滤后错误数: {len(filtered_errors)}")
        # 输出
        gen = ReportGenerator(report, logger)
        content = gen.generate(fmt)
        if output:
            gen.save(output, fmt)
        else:
            print(content)
        return (ExitCode.SUCCESS if not report.build_result.is_failed
                else ExitCode.SUCCESS)
    else:
        # 多文件分析
        multi = MultiFileAnalyzer(files, args.encoding, logger)
        reports = multi.analyze_all()
        if fmt == "json":
            summary = multi.get_summary()
            content = json.dumps(summary, indent=2, ensure_ascii=False)
        else:
            lines: List[str] = []
            for report in reports:
                gen = ReportGenerator(report, logger)
                lines.append(gen.generate(fmt))
                lines.append("\n")
            content = "\n".join(lines)
        if output:
            with open(output, "w", encoding="utf-8") as fh:
                fh.write(content)
            logger.info(f"报告已保存: {output}")
        else:
            print(content)
        return ExitCode.SUCCESS


def cmd_errors(args: argparse.Namespace, logger: Logger) -> int:
    """执行 errors 子命令。"""
    analyzer = LogAnalyzer(
        args.file, args.encoding,
        args.context_before, args.context_after, logger,
    )
    report = analyzer.analyze()
    errors = report.errors
    return ExitCode.SUCCESS


def cmd_timeline(args: argparse.Namespace, logger: Logger) -> int:
    """执行 timeline 子命令。"""
    analyzer = LogAnalyzer(args.file, args.encoding, logger=logger)
    report = analyzer.analyze()
    gen = TimelineGenerator(report, logger)
    print(gen.generate())
    return ExitCode.SUCCESS


def cmd_stats(args: argparse.Namespace, logger: Logger) -> int:
    """执行 stats 子命令。"""
    analyzer = LogAnalyzer(args.file, args.encoding, logger=logger)
    report = analyzer.analyze()
    stats = ErrorStatistics(report.errors)
    print(stats.generate_text())
    return ExitCode.SUCCESS
