#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import re
import json
import csv
import time
import logging
import argparse
import hashlib
import sqlite3
import threading
from datetime import datetime, timedelta
from collections import defaultdict, Counter
from typing import Dict, List, Tuple, Set, Any
import xml.etree.ElementTree as ET
import pandas as pd
import numpy as np
from pathlib import Path
import matplotlib.pyplot as plt
import seaborn as sns
from dataclasses import dataclass, field
from typing import Optional, Union

# 配置日志
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('test_analysis.log', encoding='utf-8'),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger(__name__)

@dataclass
class TestCase:
    """测试用例数据结构"""
    name: str
    id: str
    category: str
    status: str
    execution_time: float
    start_time: str
    end_time: str
    device: str
    result: str
    log_path: str
    tags: List[str] = field(default_factory=list)
    dependencies: List[str] = field(default_factory=list)
    dynamic: bool = False
    static: bool = False
    type: str = "normal"
    description: str = ""
    priority: str = "medium"
    
    def __post_init__(self):
        if self.execution_time is None:
            self.execution_time = 0.0
    
    def to_dict(self) -> Dict[str, Any]:
        """转换为字典格式"""
        return {
            'name': self.name,
            'id': self.id,
            'category': self.category,
            'status': self.status,
            'execution_time': self.execution_time,
            'start_time': self.start_time,
            'end_time': self.end_time,
            'device': self.device,
            'result': self.result,
            'log_path': self.log_path,
            'tags': self.tags,
            'dependencies': self.dependencies,
            'dynamic': self.dynamic,
            'static': self.static,
            'type': self.type,
            'description': self.description,
            'priority': self.priority
        }

@dataclass
class TestAnalysisResult:
    """测试分析结果数据结构"""
    total_cases: int = 0
    duplicate_cases: int = 0
    dynamic_static_mismatch: int = 0
    time_anomalies: int = 0
    log_issues: int = 0
    performance_issues: int = 0
    summary_report: str = ""
    duplicate_cases_list: List[str] = field(default_factory=list)
    dynamic_static_issues: List[Dict[str, Any]] = field(default_factory=list)
    time_anomalies_list: List[Dict[str, Any]] = field(default_factory=list)
    log_issues_list: List[Dict[str, Any]] = field(default_factory=list)
    performance_issues_list: List[Dict[str, Any]] = field(default_factory=list)
    execution_times: List[float] = field(default_factory=list)

class TestCaseAnalyzer:
    """测试用例分析器"""
    
    def __init__(self, project_name: str = "TestProject"):
        self.project_name = project_name
        self.test_cases: List[TestCase] = []
        self.analysis_results = TestAnalysisResult()
        self.duplicate_names = set()
        self.dynamic_static_mismatch_cases = []
        self.time_anomalies = []
        self.log_issues = []
        self.performance_issues = []
        self.execution_times = []
        
        # 创建结果目录
        self.output_dir = Path(f"analysis_results_{project_name}")
        self.output_dir.mkdir(exist_ok=True)
        
        # 初始化数据库
        self.db_path = self.output_dir / "test_analysis.db"
        self.init_database()
        
    def init_database(self):
        """初始化数据库"""
        try:
            conn = sqlite3.connect(self.db_path)
            cursor = conn.cursor()
            
            # 创建测试用例表
            cursor.execute('''
                CREATE TABLE IF NOT EXISTS test_cases (
                    id TEXT PRIMARY KEY,
                    name TEXT,
                    category TEXT,
                    status TEXT,
                    execution_time REAL,
                    start_time TEXT,
                    end_time TEXT,
                    device TEXT,
                    result TEXT,
                    log_path TEXT,
                    tags TEXT,
                    dependencies TEXT,
                    dynamic BOOLEAN,
                    static BOOLEAN,
                    type TEXT,
                    description TEXT,
                    priority TEXT,
                    created_at TEXT
                )
            ''')
            
            # 创建分析结果表
            cursor.execute('''
                CREATE TABLE IF NOT EXISTS analysis_results (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    timestamp TEXT,
                    total_cases INTEGER,
                    duplicate_cases INTEGER,
                    dynamic_static_mismatch INTEGER,
                    time_anomalies INTEGER,
                    log_issues INTEGER,
                    performance_issues INTEGER,
                    summary_report TEXT
                )
            ''')
            
            conn.commit()
            conn.close()
            logger.info("数据库初始化完成")
        except Exception as e:
            logger.error(f"数据库初始化失败: {e}")
    
    def add_test_case(self, case: TestCase):
        """添加测试用例"""
        self.test_cases.append(case)
        self.execution_times.append(case.execution_time)
        
        # 保存到数据库
        try:
            conn = sqlite3.connect(self.db_path)
            cursor = conn.cursor()
            
            cursor.execute('''
                INSERT OR REPLACE INTO test_cases 
                (id, name, category, status, execution_time, start_time, end_time, device, result, 
                 log_path, tags, dependencies, dynamic, static, type, description, priority, created_at)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            ''', (
                case.id, case.name, case.category, case.status, case.execution_time,
                case.start_time, case.end_time, case.device, case.result, case.log_path,
                ','.join(case.tags), ','.join(case.dependencies), case.dynamic, case.static,
                case.type, case.description, case.priority, datetime.now().isoformat()
            ))
            
            conn.commit()
            conn.close()
        except Exception as e:
            logger.error(f"保存测试用例到数据库失败: {e}")
    
    def load_test_cases_from_json(self, json_file: str) -> bool:
        """从JSON文件加载测试用例"""
        try:
            with open(json_file, 'r', encoding='utf-8') as f:
                data = json.load(f)
            
            for case_data in data:
                case = TestCase(**case_data)
                self.add_test_case(case)
            
            logger.info(f"成功从 {json_file} 加载 {len(self.test_cases)} 个测试用例")
            return True
        except Exception as e:
            logger.error(f"加载JSON文件失败: {e}")
            return False
    
    def load_test_cases_from_csv(self, csv_file: str) -> bool:
        """从CSV文件加载测试用例"""
        try:
            with open(csv_file, 'r', encoding='utf-8') as f:
                reader = csv.DictReader(f)
                for row in reader:
                    case = TestCase(
                        name=row.get('name', ''),
                        id=row.get('id', ''),
                        category=row.get('category', ''),
                        status=row.get('status', ''),
                        execution_time=float(row.get('execution_time', 0)),
                        start_time=row.get('start_time', ''),
                        end_time=row.get('end_time', ''),
                        device=row.get('device', ''),
                        result=row.get('result', ''),
                        log_path=row.get('log_path', ''),
                        tags=row.get('tags', '').split(',') if row.get('tags') else [],
                        dependencies=row.get('dependencies', '').split(',') if row.get('dependencies') else [],
                        dynamic=row.get('dynamic', 'False').lower() == 'true',
                        static=row.get('static', 'False').lower() == 'true',
                        type=row.get('type', 'normal'),
                        description=row.get('description', ''),
                        priority=row.get('priority', 'medium')
                    )
                    self.add_test_case(case)
            
            logger.info(f"成功从 {csv_file} 加载 {len(self.test_cases)} 个测试用例")
            return True
        except Exception as e:
            logger.error(f"加载CSV文件失败: {e}")
            return False
    
    def find_duplicate_cases(self) -> List[str]:
        """查找重复的测试用例名称"""
        name_count = Counter(case.name for case in self.test_cases)
        duplicates = [name for name, count in name_count.items() if count > 1]
        self.duplicate_names = set(duplicates)
        
        # 记录重复用例详情
        duplicate_details = []
        for name in duplicates:
            case_list = [case for case in self.test_cases if case.name == name]
            duplicate_details.append({
                'name': name,
                'count': len(case_list),
                'cases': [case.id for case in case_list]
            })
        
        self.analysis_results.duplicate_cases_list = duplicate_details
        self.analysis_results.duplicate_cases = len(duplicates)
        
        logger.info(f"发现 {len(duplicates)} 个重复用例名称")
        return duplicates
    
    def find_dynamic_static_mismatch(self) -> List[Dict[str, Any]]:
        """查找动态和静态配置不一致的用例"""
        mismatch_cases = []
        
        for case in self.test_cases:
            # 检查动态和静态配置是否一致
            if case.dynamic and not case.static:
                # 动态配置但静态标记为False
                mismatch_cases.append({
                    'name': case.name,
                    'id': case.id,
                    'dynamic': case.dynamic,
                    'static': case.static,
                    'reason': '动态配置但静态标记为False'
                })
            elif not case.dynamic and case.static:
                # 静态配置但动态标记为False
                mismatch_cases.append({
                    'name': case.name,
                    'id': case.id,
                    'dynamic': case.dynamic,
                    'static': case.static,
                    'reason': '静态配置但动态标记为False'
                })
        
        self.dynamic_static_mismatch_cases = mismatch_cases
        self.analysis_results.dynamic_static_issues = mismatch_cases
        self.analysis_results.dynamic_static_mismatch = len(mismatch_cases)
        
        logger.info(f"发现 {len(mismatch_cases)} 个动态/静态配置不一致的用例")
        return mismatch_cases
    
    def find_time_anomalies(self, threshold: float = 3.0) -> List[Dict[str, Any]]:
        """查找执行时间异常的用例"""
        if not self.execution_times:
            return []
        
        # 计算平均执行时间和标准差
        mean_time = np.mean(self.execution_times)
        std_time = np.std(self.execution_times)
        
        # 找出时间异常的用例（超过平均值threshold倍标准差）
        anomalies = []
        for case in self.test_cases:
            if case.execution_time > 0:
                z_score = abs(case.execution_time - mean_time) / std_time if std_time > 0 else 0
                
                if z_score > threshold:
                    anomalies.append({
                        'name': case.name,
                        'id': case.id,
                        'execution_time': case.execution_time,
                        'mean_time': mean_time,
                        'std_time': std_time,
                        'z_score': z_score
                    })
        
        self.time_anomalies = anomalies
        self.analysis_results.time_anomalies_list = anomalies
        self.analysis_results.time_anomalies = len(anomalies)
        
        logger.info(f"发现 {len(anomalies)} 个执行时间异常的用例")
        return anomalies
    
    def find_log_issues(self) -> List[Dict[str, Any]]:
        """查找日志相关问题"""
        issues = []
        
        for case in self.test_cases:
            # 检查日志文件是否存在
            if case.log_path and not os.path.exists(case.log_path):
                issues.append({
                    'name': case.name,
                    'id': case.id,
                    'log_path': case.log_path,
                    'issue': '日志文件不存在'
                })
            
            # 检查日志文件是否为空
            elif case.log_path and os.path.exists(case.log_path):
                try:
                    file_size = os.path.getsize(case.log_path)
                    if file_size == 0:
                        issues.append({
                            'name': case.name,
                            'id': case.id,
                            'log_path': case.log_path,
                            'issue': '日志文件为空'
                        })
                except Exception as e:
                    issues.append({
                        'name': case.name,
                        'id': case.id,
                        'log_path': case.log_path,
                        'issue': f'检查日志文件时出错: {e}'
                    })
        
        self.log_issues = issues
        self.analysis_results.log_issues_list = issues
        self.analysis_results.log_issues = len(issues)
        
        logger.info(f"发现 {len(issues)} 个日志相关问题")
        return issues
    
    def find_performance_issues(self, threshold_time: float = 10.0) -> List[Dict[str, Any]]:
        """查找性能问题"""
        issues = []
        
        for case in self.test_cases:
            # 检查执行时间是否超过阈值
            if case.execution_time > threshold_time:
                issues.append({
                    'name': case.name,
                    'id': case.id,
                    'execution_time': case.execution_time,
                    'threshold': threshold_time,
                    'issue': '执行时间超过阈值'
                })
            
            # 检查结果是否为失败且执行时间很短（可能有异常）
            if case.result.lower() in ['fail', 'error'] and case.execution_time < 1.0:
                issues.append({
                    'name': case.name,
                    'id': case.id,
                    'execution_time': case.execution_time,
                    'result': case.result,
                    'issue': '失败用例执行时间过短'
                })
        
        self.performance_issues = issues
        self.analysis_results.performance_issues_list = issues
        self.analysis_results.performance_issues = len(issues)
        
        logger.info(f"发现 {len(issues)} 个性能问题")
        return issues
    
    def analyze_all(self) -> TestAnalysisResult:
        """执行所有分析"""
        logger.info("开始执行所有分析...")
        
        # 执行各种分析
        self.find_duplicate_cases()
        self.find_dynamic_static_mismatch()
        self.find_time_anomalies()
        self.find_log_issues()
        self.find_performance_issues()
        
        # 生成汇总报告
        self.generate_summary_report()
        
        # 更新分析结果
        self.analysis_results.total_cases = len(self.test_cases)
        
        # 保存到数据库
        self.save_analysis_results()
        
        logger.info("所有分析完成")
        return self.analysis_results
    
    def generate_summary_report(self):
        """生成汇总报告"""
        report_lines = []
        report_lines.append("=" * 60)
        report_lines.append(f"测试用例分析报告 - {self.project_name}")
        report_lines.append("=" * 60)
        report_lines.append(f"分析时间: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        report_lines.append("")
        
        report_lines.append("1. 概述")
        report_lines.append("-" * 30)
        report_lines.append(f"总用例数: {self.analysis_results.total_cases}")
        report_lines.append(f"重复用例数: {self.analysis_results.duplicate_cases}")
        report_lines.append(f"动态/静态配置不一致: {self.analysis_results.dynamic_static_mismatch}")
        report_lines.append(f"执行时间异常: {self.analysis_results.time_anomalies}")
        report_lines.append(f"日志问题: {self.analysis_results.log_issues}")
        report_lines.append(f"性能问题: {self.analysis_results.performance_issues}")
        report_lines.append("")
        
        # 重复用例详情
        if self.analysis_results.duplicate_cases_list:
            report_lines.append("2. 重复用例详情")
            report_lines.append("-" * 30)
            for dup in self.analysis_results.duplicate_cases_list:
                report_lines.append(f"用例名称: {dup['name']}")
                report_lines.append(f"重复次数: {dup['count']}")
                report_lines.append(f"用例ID列表: {', '.join(dup['cases'])}")
                report_lines.append("")
        
        # 动态/静态配置不一致详情
        if self.analysis_results.dynamic_static_issues:
            report_lines.append("3. 动态/静态配置不一致详情")
            report_lines.append("-" * 30)
            for issue in self.analysis_results.dynamic_static_issues:
                report_lines.append(f"用例名称: {issue['name']}")
                report_lines.append(f"用例ID: {issue['id']}")
                report_lines.append(f"动态配置: {issue['dynamic']}")
                report_lines.append(f"静态配置: {issue['static']}")
                report_lines.append(f"原因: {issue['reason']}")
                report_lines.append("")
        
        # 执行时间异常详情
        if self.analysis_results.time_anomalies_list:
            report_lines.append("4. 执行时间异常详情")
            report_lines.append("-" * 30)
            for anomaly in self.analysis_results.time_anomalies_list:
                report_lines.append(f"用例名称: {anomaly['name']}")
                report_lines.append(f"用例ID: {anomaly['id']}")
                report_lines.append(f"执行时间: {anomaly['execution_time']:.2f}秒")
                report_lines.append(f"平均时间: {anomaly['mean_time']:.2f}秒")
                report_lines.append(f"标准差: {anomaly['std_time']:.2f}秒")
                report_lines.append(f"Z分数: {anomaly['z_score']:.2f}")
                report_lines.append("")
        
        # 日志问题详情
        if self.analysis_results.log_issues_list:
            report_lines.append("5. 日志问题详情")
            report_lines.append("-" * 30)
            for issue in self.analysis_results.log_issues_list:
                report_lines.append(f"用例名称: {issue['name']}")
                report_lines.append(f"用例ID: {issue['id']}")
                report_lines.append(f"日志路径: {issue['log_path']}")
                report_lines.append(f"问题: {issue['issue']}")
                report_lines.append("")
        
        # 性能问题详情
        if self.analysis_results.performance_issues_list:
            report_lines.append("6. 性能问题详情")
            report_lines.append("-" * 30)
            for issue in self.analysis_results.performance_issues_list:
                report_lines.append(f"用例名称: {issue['name']}")
                report_lines.append(f"用例ID: {issue['id']}")
                report_lines.append(f"执行时间: {issue['execution_time']:.2f}秒")
                report_lines.append(f"问题: {issue['issue']}")
                report_lines.append("")
        
        # 统计信息
        if self.execution_times:
            report_lines.append("7. 执行时间统计")
            report_lines.append("-" * 30)
            report_lines.append(f"平均执行时间: {np.mean(self.execution_times):.2f}秒")
            report_lines.append(f"最大执行时间: {np.max(self.execution_times):.2f}秒")
            report_lines.append(f"最小执行时间: {np.min(self.execution_times):.2f}秒")
            report_lines.append(f"标准差: {np.std(self.execution_times):.2f}秒")
            report_lines.append("")
        
        self.analysis_results.summary_report = "\n".join(report_lines)
        
        # 保存报告文件
        report_file = self.output_dir / "analysis_report.txt"
        with open(report_file, 'w', encoding='utf-8') as f:
            f.write(self.analysis_results.summary_report)
        
        logger.info(f"分析报告已保存到: {report_file}")
    
    def save_analysis_results(self):
        """保存分析结果到数据库"""
        try:
            conn = sqlite3.connect(self.db_path)
            cursor = conn.cursor()
            
            cursor.execute('''
                INSERT INTO analysis_results 
                (timestamp, total_cases, duplicate_cases, dynamic_static_mismatch, 
                 time_anomalies, log_issues, performance_issues, summary_report)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)
            ''', (
                datetime.now().isoformat(),
                self.analysis_results.total_cases,
                self.analysis_results.duplicate_cases,
                self.analysis_results.dynamic_static_mismatch,
                self.analysis_results.time_anomalies,
                self.analysis_results.log_issues,
                self.analysis_results.performance_issues,
                self.analysis_results.summary_report
            ))
            
            conn.commit()
            conn.close()
            logger.info("分析结果已保存到数据库")
        except Exception as e:
            logger.error(f"保存分析结果到数据库失败: {e}")
    
    def export_to_csv(self, output_file: str = "test_analysis_results.csv"):
        """导出分析结果到CSV"""
        try:
            # 创建导出数据
            export_data = []
            
            # 用例基本信息
            for case in self.test_cases:
                export_data.append({
                    'test_case_name': case.name,
                    'test_case_id': case.id,
                    'category': case.category,
                    'status': case.status,
                    'execution_time': case.execution_time,
                    'start_time': case.start_time,
                    'end_time': case.end_time,
                    'device': case.device,
                    'result': case.result,
                    'log_path': case.log_path,
                    'dynamic': case.dynamic,
                    'static': case.static,
                    'type': case.type,
                    'description': case.description,
                    'priority': case.priority
                })
            
            # 保存CSV文件
            df = pd.DataFrame(export_data)
            df.to_csv(output_file, index=False, encoding='utf-8')
            
            logger.info(f"导出数据到CSV文件: {output_file}")
        except Exception as e:
            logger.error(f"导出CSV文件失败: {e}")
    
    def export_to_json(self, output_file: str = "test_analysis_results.json"):
        """导出分析结果到JSON"""
        try:
            # 创建导出数据
            export_data = {
                'project_name': self.project_name,
                'analysis_timestamp': datetime.now().isoformat(),
                'test_cases': [case.to_dict() for case in self.test_cases],
                'analysis_results': {
                    'total_cases': self.analysis_results.total_cases,
                    'duplicate_cases': self.analysis_results.duplicate_cases,
                    'dynamic_static_mismatch': self.analysis_results.dynamic_static_mismatch,
                    'time_anomalies': self.analysis_results.time_anomalies,
                    'log_issues': self.analysis_results.log_issues,
                    'performance_issues': self.analysis_results.performance_issues,
                    'summary_report': self.analysis_results.summary_report
                }
            }
            
            # 保存JSON文件
            with open(output_file, 'w', encoding='utf-8') as f:
                json.dump(export_data, f, ensure_ascii=False, indent=2)
            
            logger.info(f"导出数据到JSON文件: {output_file}")
        except Exception as e:
            logger.error(f"导出JSON文件失败: {e}")
    
    def generate_statistics_report(self):
        """生成统计报告"""
        try:
            # 创建统计图表
            if not self.execution_times:
                logger.warning("没有执行时间数据，跳过统计图表生成")
                return
            
            # 创建图表目录
            charts_dir = self.output_dir / "charts"
            charts_dir.mkdir(exist_ok=True)
            
            # 执行时间分布图
            plt.figure(figsize=(12, 8))
            
            # 直方图
            plt.subplot(2, 2, 1)
            plt.hist(self.execution_times, bins=30, alpha=0.7, color='blue')
            plt.xlabel('执行时间(秒)')
            plt.ylabel('频次')
            plt.title('执行时间分布')
            plt.axvline(np.mean(self.execution_times), color='red', linestyle='--', 
                      label=f'平均值: {np.mean(self.execution_times):.2f}')
            plt.legend()
            
            # 箱线图
            plt.subplot(2, 2, 2)
            plt.boxplot(self.execution_times)
            plt.ylabel('执行时间(秒)')
            plt.title('执行时间箱线图')
            
            # 累积分布
            plt.subplot(2, 2, 3)
            sorted_times = np.sort(self.execution_times)
            cumulative = np.arange(1, len(sorted_times) + 1) / len(sorted_times)
            plt.plot(sorted_times, cumulative, marker='o', markersize=2)
            plt.xlabel('执行时间(秒)')
            plt.ylabel('累积概率')
            plt.title('执行时间累积分布')
            
            # 散点图
            plt.subplot(2, 2, 4)
            plt.scatter(range(len(self.execution_times)), sorted(self.execution_times), alpha=0.6)
            plt.xlabel('用例序号')
            plt.ylabel('执行时间(秒)')
            plt.title('执行时间排序分布')
            
            plt.tight_layout()
            chart_file = charts_dir / "execution_statistics.png"
            plt.savefig(chart_file, dpi=300, bbox_inches='tight')
            plt.close()
            
            logger.info(f"统计图表已保存到: {chart_file}")
            
        except Exception as e:
            logger.error(f"生成统计报告失败: {e}")
    
    def find_test_case_by_name(self, name: str) -> List[TestCase]:
        """根据名称查找测试用例"""
        return [case for case in self.test_cases if case.name == name]
    
    def find_test_case_by_id(self, case_id: str) -> TestCase:
        """根据ID查找测试用例"""
        for case in self.test_cases:
            if case.id == case_id:
                return case
        return None
    
    def get_case_statistics(self) -> Dict[str, Any]:
        """获取测试用例统计信息"""
        if not self.test_cases:
            return {}
        
        stats = {
            'total_cases': len(self.test_cases),
            'by_category': Counter(case.category for case in self.test_cases),
            'by_status': Counter(case.status for case in self.test_cases),
            'by_result': Counter(case.result for case in self.test_cases),
            'by_priority': Counter(case.priority for case in self.test_cases),
            'execution_time_stats': {
                'mean': np.mean(self.execution_times) if self.execution_times else 0,
                'max': np.max(self.execution_times) if self.execution_times else 0,
                'min': np.min(self.execution_times) if self.execution_times else 0,
                'std': np.std(self.execution_times) if self.execution_times else 0
            }
        }
        
        return stats
    
    def get_duplicate_case_report(self) -> str:
        """获取重复用例报告"""
        if not self.duplicate_names:
            return "没有发现重复用例"
        
        report = "重复用例报告:\n"
        report += "=" * 40 + "\n"
        
        for name in self.duplicate_names:
            cases = [case for case in self.test_cases if case.name == name]
            report += f"\n用例名称: {name}\n"
            report += f"重复次数: {len(cases)}\n"
            report += "详细信息:\n"
            for case in cases:
                report += f"  ID: {case.id}, 状态: {case.status}, 执行时间: {case.execution_time}s\n"
        
        return report
    