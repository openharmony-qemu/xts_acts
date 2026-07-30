#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os
import sys
import shutil
import zipfile
import argparse
import logging
import time
import fnmatch
import re
import stat
import platform
from pathlib import Path
from datetime import datetime
from typing import List, Optional, Tuple, Generator

# 尝试导入 tqdm 用于进度条，如果失败则使用内置实现
try:
    from tqdm import tqdm
    HAS_TQDM = True
except ImportError:
    HAS_TQDM = False


# 日志配置
LOG_FORMAT = "%(asctime)s - %(levelname)s - %(message)s"
LOG_FILE = "file_manager.log"

# 颜色代码 (用于终端输出美化)
class Colors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


def setup_logger(log_level=logging.INFO):
    """
    设置日志记录器
    """
    logger = logging.getLogger("FileManager")
    logger.setLevel(log_level)
    
    # 清除已有的 handler
    if logger.handlers:
        logger.handlers.clear()

    # 控制台 Handler
    console_handler = logging.StreamHandler(sys.stdout)
    console_handler.setLevel(log_level)
    console_formatter = logging.Formatter("%(levelname)s: %(message)s")
    console_handler.setFormatter(console_formatter)
    logger.addHandler(console_handler)

    # 文件 Handler
    file_handler = logging.FileHandler(LOG_FILE, encoding='utf-8')
    file_handler.setLevel(logging.DEBUG)
    file_formatter = logging.Formatter(LOG_FORMAT)
    file_handler.setFormatter(file_formatter)
    logger.addHandler(file_handler)

    return logger

def print_success(msg: str):
    """打印成功信息"""
    print(f"{Colors.OKGREEN}[SUCCESS]{Colors.ENDC} {msg}")

def print_error(msg: str):
    """打印错误信息"""
    print(f"{Colors.FAIL}[ERROR]{Colors.ENDC} {msg}")

def print_warning(msg: str):
    """打印警告信息"""
    print(f"{Colors.WARNING}[WARNING]{Colors.ENDC} {msg}")

def print_info(msg: str):
    """打印普通信息"""
    print(f"{Colors.OKBLUE}[INFO]{Colors.ENDC} {msg}")

def get_file_size(file_path: str) -> int:
    """获取文件大小（字节）"""
    try:
        return os.path.getsize(file_path)
    except OSError:
        return 0

def format_size(size_bytes: int) -> str:
    """格式化文件大小"""
    if size_bytes == 0:
        return "0 B"
    units = ['B', 'KB', 'MB', 'GB', 'TB']
    i = 0
    while size_bytes >= 1024 and i < len(units) - 1:
        size_bytes /= 1024.0
        i += 1
    return f"{size_bytes:.2f} {units[i]}"

def confirm_action(prompt: str) -> bool:
    """
    用户确认操作
    """
    try:
        response = input(f"{prompt} (y/n): ").strip().lower()
        return response in ['y', 'yes']
    except KeyboardInterrupt:
        print("\n操作已取消。")
        sys.exit(0)

def is_safe_path(base_path: str, target_path: str) -> bool:
    """
    检查目标路径是否在基础路径内，防止路径遍历攻击
    """
    try:
        base = os.path.realpath(base_path)
        target = os.path.realpath(target_path)
        return target.startswith(base)
    except Exception:
        return False

# ================= 核心类：FileManager =================

class FileManager:
    """
    文件管理器核心类
    """
    
    def __init__(self, logger: logging.Logger):
        self.logger = logger
        self.base_dir = os.getcwd()

    def _resolve_path(self, path: str) -> str:
        """
        解析路径，支持相对路径和绝对路径
        """
        if os.path.isabs(path):
            return path
        return os.path.join(self.base_dir, path)

    def _check_exists(self, path: str, is_dir: bool = False) -> bool:
        """
        检查路径是否存在
        """
        resolved = self._resolve_path(path)
        if is_dir:
            return os.path.isdir(resolved)
        return os.path.exists(resolved)


    def create_directory(self, path: str, parents: bool = True, exist_ok: bool = True) -> bool:
        """
        创建文件夹
        
        Args:
            path: 文件夹路径
            parents: 如果为True，则创建所有必要的父目录
            exist_ok: 如果目录已存在，是否报错
            
        Returns:
            bool: 是否成功
        """
        try:
            resolved_path = self._resolve_path(path)
            self.logger.info(f"尝试创建目录: {resolved_path}")
            
            if os.path.exists(resolved_path):
                if os.path.isfile(resolved_path):
                    raise FileExistsError(f"路径已存在且是一个文件: {resolved_path}")
                if not exist_ok:
                    raise FileExistsError(f"目录已存在: {resolved_path}")
                print_warning(f"目录已存在: {resolved_path}")
                return True

            os.makedirs(resolved_path, exist_ok=exist_ok)
            print_success(f"目录创建成功: {resolved_path}")
            self.logger.info(f"目录创建成功: {resolved_path}")
            return True

        except Exception as e:
            print_error(f"创建目录失败: {e}")
            self.logger.error(f"创建目录失败: {e}", exc_info=True)
            return False
    def copy_item(self, src: str, dst: str, overwrite: bool = False) -> bool:
        """
        复制文件或文件夹
        
        Args:
            src: 源路径
            dst: 目标路径
            overwrite: 是否覆盖已存在的文件
            
        Returns:
            bool: 是否成功
        """
        try:
            src_resolved = self._resolve_path(src)
            dst_resolved = self._resolve_path(dst)

            if not os.path.exists(src_resolved):
                raise FileNotFoundError(f"源路径不存在: {src_resolved}")

            if os.path.exists(dst_resolved):
                if not overwrite:
                    if not confirm_action(f"目标已存在: {dst_resolved}。是否覆盖?"):
                        print_info("操作已取消。")
                        return False
                # 如果目标是目录且源是文件，则复制到目录内
                if os.path.isdir(dst_resolved):
                    dst_resolved = os.path.join(dst_resolved, os.path.basename(src_resolved))

            self.logger.info(f"开始复制: {src_resolved} -> {dst_resolved}")
            
            # 使用 shutil.copy2 保留元数据
            if os.path.isdir(src_resolved):
                # 复制目录
                if os.path.exists(dst_resolved):
                    shutil.rmtree(dst_resolved)
                shutil.copytree(src_resolved, dst_resolved)
            else:
                # 复制文件
                shutil.copy2(src_resolved, dst_resolved)

            print_success(f"复制成功: {dst_resolved}")
            self.logger.info(f"复制成功: {dst_resolved}")
            return True

        except Exception as e:
            print_error(f"复制失败: {e}")
            self.logger.error(f"复制失败: {e}", exc_info=True)
            return False

    def move_item(self, src: str, dst: str, overwrite: bool = False) -> bool:
        """
        移动文件或文件夹
        
        Args:
            src: 源路径
            dst: 目标路径
            overwrite: 是否覆盖
            
        Returns:
            bool: 是否成功
        """
        try:
            src_resolved = self._resolve_path(src)
            dst_resolved = self._resolve_path(dst)

            if not os.path.exists(src_resolved):
                raise FileNotFoundError(f"源路径不存在: {src_resolved}")

            if os.path.exists(dst_resolved):
                if not overwrite:
                    if not confirm_action(f"目标已存在: {dst_resolved}。是否覆盖?"):
                        print_info("操作已取消。")
                        return False
                if os.path.isdir(dst_resolved):
                    dst_resolved = os.path.join(dst_resolved, os.path.basename(src_resolved))

            self.logger.info(f"开始移动: {src_resolved} -> {dst_resolved}")
            
            # 如果目标存在且是目录，先删除
            if os.path.exists(dst_resolved):
                if os.path.isdir(dst_resolved):
                    shutil.rmtree(dst_resolved)
                else:
                    os.remove(dst_resolved)

            shutil.move(src_resolved, dst_resolved)
            
            print_success(f"移动成功: {dst_resolved}")
            self.logger.info(f"移动成功: {dst_resolved}")
            return True

        except Exception as e:
            print_error(f"移动失败: {e}")
            self.logger.error(f"移动失败: {e}", exc_info=True)
            return False

    def delete_item(self, path: str, force: bool = False) -> bool:
        """
        删除文件或文件夹
        
        Args:
            path: 要删除的路径
            force: 是否强制删除（跳过确认）
            
        Returns:
            bool: 是否成功
        """
        try:
            resolved_path = self._resolve_path(path)

            if not os.path.exists(resolved_path):
                raise FileNotFoundError(f"路径不存在: {resolved_path}")

            if not force:
                if not confirm_action(f"确定要删除: {resolved_path} 吗? (此操作不可恢复)"):
                    print_info("操作已取消。")
                    return False

            self.logger.info(f"开始删除: {resolved_path}")

            if os.path.isdir(resolved_path):
                shutil.rmtree(resolved_path)
            else:
                os.remove(resolved_path)

            print_success(f"删除成功: {resolved_path}")
            self.logger.info(f"删除成功: {resolved_path}")
            return True

        except Exception as e:
            print_error(f"删除失败: {e}")
            self.logger.error(f"删除失败: {e}", exc_info=True)
            return False

    def list_directory(self, path: str, recursive: bool = False, pattern: str = None) -> List[str]:
        """
        列出目录内容
        
        Args:
            path: 目录路径
            recursive: 是否递归
            pattern: 文件名匹配模式 (glob style, e.g., "*.txt")
            
        Returns:
            List[str]: 文件路径列表
        """
        try:
            resolved_path = self._resolve_path(path)
            if not os.path.isdir(resolved_path):
                raise NotADirectoryError(f"路径不是目录: {resolved_path}")

            files = []
            self.logger.info(f"列出目录: {resolved_path}, 递归: {recursive}, 模式: {pattern}")

            if recursive:
                for root, dirs, filenames in os.walk(resolved_path):
                    for filename in filenames:
                        if pattern and not fnmatch.fnmatch(filename, pattern):
                            continue
                        files.append(os.path.join(root, filename))
            else:
                for item in os.listdir(resolved_path):
                    full_path = os.path.join(resolved_path, item)
                    if os.path.isfile(full_path):
                        if pattern and not fnmatch.fnmatch(item, pattern):
                            continue
                        files.append(full_path)
                    elif os.path.isdir(full_path) and not pattern:
                        # 如果不指定模式，通常只列文件，但如果需要列目录可在此修改
                        pass

            # 排序
            files.sort()
            
            print_info(f"找到 {len(files)} 个文件。")
            for f in files:
                print(f"  - {f}")
            
            return files

        except Exception as e:
            print_error(f"列出目录失败: {e}")
            self.logger.error(f"列出目录失败: {e}", exc_info=True)
            return []

    def search_files(self, path: str, pattern: str, recursive: bool = True) -> List[str]:
        """
        搜索文件
        
        Args:
            path: 搜索起始路径
            pattern: 搜索模式 (支持正则或 glob)
            recursive: 是否递归搜索
            
        Returns:
            List[str]: 匹配的文件路径列表
        """
        try:
            resolved_path = self._resolve_path(path)
            if not os.path.exists(resolved_path):
                raise FileNotFoundError(f"路径不存在: {resolved_path}")

            matches = []
            self.logger.info(f"搜索文件: 路径={resolved_path}, 模式={pattern}")

            # 使用正则表达式进行更强大的搜索
            try:
                regex = re.compile(pattern)
                use_regex = True
            except re.error:
                use_regex = False

            if recursive:
                for root, dirs, files in os.walk(resolved_path):
                    for filename in files:
                        if use_regex:
                            if regex.search(filename):
                                matches.append(os.path.join(root, filename))
                        else:
                            if fnmatch.fnmatch(filename, pattern):
                                matches.append(os.path.join(root, filename))
            else:
                for item in os.listdir(resolved_path):
                    full_path = os.path.join(resolved_path, item)
                    if os.path.isfile(full_path):
                        if use_regex:
                            if regex.search(item):
                                matches.append(full_path)
                        else:
                            if fnmatch.fnmatch(item, pattern):
                                matches.append(full_path)

            matches.sort()
            print_info(f"搜索完成，找到 {len(matches)} 个匹配项。")
            for m in matches:
                print(f"  - {m}")
            
            return matches

        except Exception as e:
            print_error(f"搜索失败: {e}")
            self.logger.error(f"搜索失败: {e}", exc_info=True)
            return []


    def compress_to_zip(self, source_dir: str, output_zip: str, exclude_patterns: List[str] = None) -> bool:
        """
        将文件夹压缩为 ZIP
        
        Args:
            source_dir: 源文件夹路径
            output_zip: 输出的 ZIP 文件路径
            exclude_patterns: 排除的文件模式列表 (e.g., ["*.log", "__pycache__"])
            
        Returns:
            bool: 是否成功
        """
        try:
            source_resolved = self._resolve_path(source_dir)
            output_resolved = self._resolve_path(output_zip)

            if not os.path.isdir(source_resolved):
                raise NotADirectoryError(f"源路径不是目录: {source_resolved}")

            if not output_resolved.endswith('.zip'):
                output_resolved += '.zip'

            self.logger.info(f"开始压缩: {source_resolved} -> {output_resolved}")
            
            # 计算总文件大小用于进度条
            total_size = 0
            file_count = 0
            all_files = []
            
            for root, dirs, files in os.walk(source_resolved):
                for file in files:
                    file_path = os.path.join(root, file)
                    # 检查排除模式
                    if exclude_patterns:
                        skip = False
                        for pat in exclude_patterns:
                            if fnmatch.fnmatch(file, pat) or fnmatch.fnmatch(os.path.basename(root), pat):
                                skip = True
                                break
                        if skip:
                            continue
                    
                    all_files.append(file_path)
                    total_size += get_file_size(file_path)
                    file_count += 1

            if file_count == 0:
                print_warning("没有文件需要压缩。")
                return True

            print_info(f"共 {file_count} 个文件，总大小 {format_size(total_size)}")

            with zipfile.ZipFile(output_resolved, 'w', zipfile.ZIP_DEFLATED) as zipf:
                if HAS_TQDM:
                    progress_bar = tqdm(total=total_size, unit='B', unit_scale=True, desc="Compressing")
                
                for file_path in all_files:
                    # 计算相对路径
                    arcname = os.path.relpath(file_path, source_resolved)
                    zipf.write(file_path, arcname)
                    
                    if HAS_TQDM:
                        progress_bar.update(get_file_size(file_path))

                if HAS_TQDM:
                    progress_bar.close()

            print_success(f"压缩成功: {output_resolved}")
            self.logger.info(f"压缩成功: {output_resolved}")
            return True

        except Exception as e:
            print_error(f"压缩失败: {e}")
            self.logger.error(f"压缩失败: {e}", exc_info=True)
            return False


    def extract_zip(self, zip_file: str, output_dir: str = None) -> bool:
        """
        解压 ZIP 文件
        
        Args:
            zip_file: ZIP 文件路径
            output_dir: 输出目录，如果为 None 则解压到当前目录
            
        Returns:
            bool: 是否成功
        """
        try:
            zip_resolved