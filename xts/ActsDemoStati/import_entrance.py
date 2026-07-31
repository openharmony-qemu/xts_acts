#!/usr/bin/env python3
"""
Smart File Organizer
====================
A Python script to automatically organize files in a directory based on their extensions.

Features:
- Configurable file categories via JSON config.
- Dry-run mode to preview changes.
- Detailed logging.
- Command-line interface.
- Error handling for common issues (permissions, locked files).

Usage:
    python file_organizer.py --source ./Downloads --config config.json --dry-run
    python file_organizer.py --source ./Downloads
"""

import os
import sys
import json
import shutil
import logging
import argparse
import datetime
from pathlib import Path
from typing import Dict, List, Optional, Tuple

# ================= Configuration Constants =================

DEFAULT_CONFIG = {
    "images": ["jpg", "jpeg", "png", "gif", "bmp", "svg", "webp"],
    "documents": ["pdf", "doc", "docx", "txt", "rtf", "odt", "xls", "xlsx", "ppt", "pptx"],
    "videos": ["mp4", "avi", "mkv", "mov", "wmv", "flv"],
    "audio": ["mp3", "wav", "aac", "flac", "ogg", "wma"],
    "archives": ["zip", "rar", "7z", "tar", "gz", "bz2"],
    "code": ["py", "js", "html", "css", "java", "cpp", "c", "h", "json", "xml", "yaml", "yml"],
    "executables": ["exe", "msi", "dmg", "apk", "deb"],
    "others": []  # Files not matching any category go here
}

DEFAULT_LOG_FORMAT = "%(asctime)s - %(levelname)s - %(message)s"
LOG_FILE_NAME = "organizer.log"

# ================= Logger Setup =================

def setup_logger(log_file: str = LOG_FILE_NAME, verbose: bool = False) -> logging.Logger:
    """
    Set up the logger to write to both file and console.
    
    Args:
        log_file: Path to the log file.
        verbose: If True, log DEBUG level; otherwise INFO.
        
    Returns:
        Configured logger instance.
    """
    logger = logging.getLogger("FileOrganizer")
    logger.setLevel(logging.DEBUG)
    
    # Prevent adding multiple handlers if called multiple times
    if logger.handlers:
        return logger

    # File Handler
    file_handler = logging.FileHandler(log_file, encoding='utf-8')
    file_handler.setLevel(logging.DEBUG)
    file_handler.setFormatter(logging.Formatter(DEFAULT_LOG_FORMAT))
    logger.addHandler(file_handler)

    # Console Handler
    console_handler = logging.StreamHandler(sys.stdout)
    console_handler.setLevel(logging.DEBUG if verbose else logging.INFO)
    console_handler.setFormatter(logging.Formatter(DEFAULT_LOG_FORMAT))
    logger.addHandler(console_handler)

    return logger

# ================= Configuration Manager =================

class ConfigManager:
    """Handles loading and validating configuration."""
    
    def __init__(self, config_path: Optional[str] = None):
        self.config_path = config_path
        self.categories: Dict[str, List[str]] = {}
        self.load_config()

    def load_config(self):
        """Load configuration from JSON file or use defaults."""
        if self.config_path and os.path.exists(self.config_path):
            try:
                with open(self.config_path, 'r', encoding='utf-8') as f:
                    self.categories = json.load(f)
                logging.info(f"Configuration loaded from {self.config_path}")
            except json.JSONDecodeError as e:
                logging.error(f"Invalid JSON in config file: {e}")
                self.categories = DEFAULT_CONFIG
            except Exception as e:
                logging.error(f"Error reading config file: {e}")
                self.categories = DEFAULT_CONFIG
        else:
            logging.info("Using default configuration.")
            self.categories = DEFAULT_CONFIG

    def get_category_for_extension(self, ext: str) -> str:
        """
        Determine the category for a given file extension.
        
        Args:
            ext: File extension without the dot (e.g., 'jpg').
            
        Returns:
            Category name (e.g., 'images') or 'others'.
        """
        ext_lower = ext.lower()
        for category, extensions in self.categories.items():
            if ext_lower in extensions:
                return category
        return "others"

# ================= File Organizer Core =================

class FileOrganizer:
    """Core logic for organizing files."""
    
    def __init__(self, source_dir: str, config_manager: ConfigManager, dry_run: bool = False):
        self.source_dir = Path(source_dir).resolve()
        self.config_manager = config_manager
        self.dry_run = dry_run
        self.logger = logging.getLogger("FileOrganizer")
        self.stats = {
            "processed": 0,
            "moved": 0,
            "skipped": 0,
            "errors": 0
        }

    def validate_source(self) -> bool:
        """Check if the source directory exists and is readable."""
        if not self.source_dir.exists():
            self.logger.error(f"Source directory does not exist: {self.source_dir}")
            return False
        if not self.source_dir.is_dir():
            self.logger.error(f"Source path is not a directory: {self.source_dir}")
            return False
        if not os.access(self.source_dir, os.R_OK):
            self.logger.error(f"No read permission for: {self.source_dir}")
            return False
        return True

    def get_files_to_process(self) -> List[Path]:
        """
        Get a list of files in the source directory (non-recursive).
        Excludes hidden files and directories.
        """
        files = []
        try:
            for item in self.source_dir.iterdir():
                if item.is_file() and not item.name.startswith('.'):
                    files.append(item)
        except PermissionError:
            self.logger.error(f"Permission denied accessing: {self.source_dir}")
        return files

    def move_file(self, file_path: Path, target_dir: Path) -> bool:
        """
        Move a file to the target directory.
        
        Args:
            file_path: Path to the source file.
            target_dir: Path to the destination directory.
            
        Returns:
            True if successful, False otherwise.
        """
        target_path = target_dir / file_path.name
        
        # Handle duplicate filenames
        if target_path.exists():
            stem = file_path.stem
            suffix = file_path.suffix
            counter = 1
            while target_path.exists():
                new_name = f"{stem}_{counter}{suffix}"
                target_path = target_dir / new_name
                counter += 1
            self.logger.warning(f"Duplicate file renamed: {file_path.name} -> {target_path.name}")

        try:
            if self.dry_run:
                self.logger.info(f"[DRY RUN] Would move: {file_path.name} -> {target_dir.name}/")
                self.stats["moved"] += 1
                return True
            else:
                shutil.move(str(file_path), str(target_path))
                self.logger.info(f"Moved: {file_path.name} -> {target_dir.name}/")
                self.stats["moved"] += 1
                return True
        except shutil.Error as e:
            self.logger.error(f"Shutil error moving {file_path.name}: {e}")
            self.stats["errors"] += 1
            return False
        except PermissionError:
            self.logger.error(f"Permission denied moving {file_path.name}")
            self.stats["errors"] += 1
            return False
        except Exception as e:
            self.logger.error(f"Unexpected error moving {file_path.name}: {e}")
            self.stats["errors"] += 1
            return False

    def organize(self):
        """Main method to execute the organization process."""
        if not self.validate_source():
            return

        self.logger.info(f"Starting organization for: {self.source_dir}")
        if self.dry_run:
            self.logger.warning("=== DRY RUN MODE: No files will be moved ===")

        files = self.get_files_to_process()
        self.logger.info(f"Found {len(files)} files to process.")

        for file_path in files:
            self.stats["processed"] += 1
            ext = file_path.suffix.lstrip('.')
            
            if not ext:
                self.logger.debug(f"Skipping file with no extension: {file_path.name}")
                self.stats["skipped"] += 1
                continue

            category = self.config_manager.get_category_for_extension(ext)
            target_dir = self.source_dir / category

            # Create target directory if it doesn't exist
            if not self.dry_run:
                target_dir.mkdir(parents=True, exist_ok=True)
            else:
                # In dry run, we just log that the dir would be created
                if not target_dir.exists():
                    self.logger.debug(f"[DRY RUN] Would create directory: {target_dir.name}")

            self.move_file(file_path, target_dir)

        self.print_summary()

    def print_summary(self):
        """Print a summary of the operation."""
        self.logger.info("="*30)
        self.logger.info("Operation Summary:")
        self.logger.info(f"  Processed: {self.stats['processed']}")
        self.logger.info(f"  Moved:     {self.stats['moved']}")
        self.logger.info(f"  Skipped:   {self.stats['skipped']}")
        self.logger.info(f"  Errors:    {self.stats['errors']}")
        self.logger.info("="*30)

# ================= CLI Interface =================

def parse_arguments() -> argparse.Namespace:
    """Parse command line arguments."""
    parser = argparse.ArgumentParser(
        description="Smart File Organizer - Automatically organize files by extension.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s --source ./Downloads
  %(prog)s --source ./Downloads --config my_config.json --dry-run
  %(prog)s --source ./Downloads --verbose
        """
    )
    
    parser.add_argument(
        "--source", "-s",
        type=str,
        required=True,
        help="Path to the directory to organize."
    )
    
    parser.add_argument(
        "--config", "-c",
        type=str,
        default=None,
        help="Path to a JSON configuration file. Uses defaults if not provided."
    )
    
    parser.add_argument(
        "--dry-run", "-d",
        action="store_true",
        help="Preview changes without moving any files."
    )
    
    parser.add_argument(
        "--verbose", "-v",
        action="store_true",
        help="Enable verbose logging (DEBUG level)."
    )

    return parser.parse_args()

# ================= Main Entry Point =================

def main():
    """Main entry point for the script."""
    args = parse_arguments()
    
    # Setup Logger
    logger = setup_logger(verbose=args.verbose)
    
    # Load Configuration
    config_manager = ConfigManager(config_path=args.config)
    
    # Initialize Organizer
    organizer = FileOrganizer(
        source_dir=args.source,
        config_manager=config_manager,
        dry_run=args.dry_run
    )
    
    # Execute
    try:
        organizer.organize()
    except KeyboardInterrupt:
        logger.info("Operation cancelled by user.")
        sys.exit(0)
    except Exception as e:
        logger.critical(f"Fatal error: {e}", exc_info=True)
        sys.exit(1)

if __name__ == "__main__":
    main()