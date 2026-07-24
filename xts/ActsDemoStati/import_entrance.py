#!/usr/bin/env python3

import json
import os
import sys
import uuid
import logging
import argparse
import datetime
import re
import copy
from typing import List, Dict, Optional, Any, Tuple
from dataclasses import dataclass, field, asdict
from enum import Enum
from pathlib import Path
from collections import defaultdict


# ============================================================================
# Configuration
# ============================================================================

CONFIG = {
    "data_file": "tasks.json",
    "log_file": "task_manager.log",
    "default_priority": "medium",
    "default_category": "general",
    "max_tasks": 10000,
    "backup_enabled": True,
    "backup_dir": "backups",
    "auto_save": True,
    "date_format": "%Y-%m-%d",
    "datetime_format": "%Y-%m-%d %H:%M:%S",
    "time_format": "%H:%M:%S",
    "max_title_length": 200,
    "max_description_length": 5000,
    "max_tags": 10,
    "tag_length_limit": 30,
}


# ============================================================================
# Logging Setup
# ============================================================================

def setup_logging(log_file: str = None) -> logging.Logger:
    """Configure and return the application logger."""
    logger = logging.getLogger("TaskManager")
    logger.setLevel(logging.DEBUG)

    # Prevent duplicate handlers
    if logger.handlers:
        return logger

    log_file = log_file or CONFIG["log_file"]

    # File handler
    file_handler = logging.FileHandler(log_file)
    file_handler.setLevel(logging.DEBUG)
    file_format = logging.Formatter(
        "%(asctime)s - %(name)s - %(levelname)s - %(message)s",
        datefmt=CONFIG["datetime_format"]
    )
    file_handler.setFormatter(file_format)

    # Console handler
    console_handler = logging.StreamHandler(sys.stdout)
    console_handler.setLevel(logging.WARNING)
    console_format = logging.Formatter(
        "%(levelname)s: %(message)s"
    )
    console_handler.setFormatter(console_format)

    logger.addHandler(file_handler)
    logger.addHandler(console_handler)

    return logger


logger = setup_logging()


# ============================================================================
# Enums and Constants
# ============================================================================

class Priority(Enum):
    """Task priority levels."""
    LOW = "low"
    MEDIUM = "medium"
    HIGH = "high"
    URGENT = "urgent"

    @classmethod
    def from_string(cls, value: str) -> "Priority":
        """Create Priority from string, case-insensitive."""
        value = value.lower().strip()
        for p in cls:
            if p.value == value:
                return p
        raise ValueError(f"Invalid priority: {value}. Choose from: {[p.value for p in cls]}")

    @classmethod
    def get_order(cls) -> List[str]:
        """Return priorities in display order (highest to lowest)."""
        return [cls.URGENT, cls.HIGH, cls.MEDIUM, cls.LOW]

    @classmethod
    def get_numeric_value(cls, priority: "Priority") -> int:
        """Get numeric value for sorting (higher = more important)."""
        order = cls.get_order()
        return len(order) - order.index(priority)


class Status(Enum):
    """Task status values."""
    TODO = "todo"
    IN_PROGRESS = "in_progress"
    COMPLETED = "completed"
    CANCELLED = "cancelled"
    ON_HOLD = "on_hold"

    @classmethod
    def from_string(cls, value: str) -> "Status":
        """Create Status from string, case-insensitive."""
        value = value.lower().strip()
        for s in cls:
            if s.value == value:
                return s
        raise ValueError(f"Invalid status: {value}. Choose from: {[s.value for s in cls]}")

    @classmethod
    def get_display_name(cls, status: "Status") -> str:
        """Get human-readable display name."""
        names = {
            cls.TODO: "To Do",
            cls.IN_PROGRESS: "In Progress",
            cls.COMPLETED: "Completed",
            cls.CANCELLED: "Cancelled",
            cls.ON_HOLD: "On Hold",
        }
        return names.get(status, status.value)


class SortField(Enum):
    """Available sort fields for tasks."""
    TITLE = "title"
    PRIORITY = "priority"
    STATUS = "status"
    CREATED_AT = "created_at"
    UPDATED_AT = "updated_at"
    DUE_DATE = "due_date"
    CATEGORY = "category"

    @classmethod
    def from_string(cls, value: str) -> "SortField":
        """Create SortField from string."""
        value = value.lower().strip()
        for sf in cls:
            if sf.value == value or sf.name.lower() == value:
                return sf
        raise ValueError(f"Invalid sort field: {value}. Choose from: {[sf.value for sf in cls]}")


# ============================================================================
# Data Classes
# ============================================================================

@dataclass
class Task:
    """Represents a single task."""
    id: str
    title: str
    description: str = ""
    priority: Priority = Priority status: Status = Status.TODO
   .MEDIUM
    category: str = "general"
    tags: List[str] = field(default_factory=list)
    due_date: Optional[str] = None
    created_at: str = ""
    updated_at: str = ""
    completed_at: Optional[str] = None
    estimated_hours: Optional[float] = None
    actual_hours: Optional[float] = None
    subtasks: List[Dict[str, Any]] = field(default_factory=list)
    notes: str = ""
    attachments: List[str] = field(default_factory=list)

    def __post_init__(self):
        """Validate and set default timestamps."""
        if not self.created_at:
            self.created_at = datetime.datetime.now().strftime(CONFIG["datetime_format"])
        if not self.updated_at:
            self.updated_at = self.created_at
        if self.completed_at and self.status != Status.COMPLETED:
            self.completed_at = None

    def to_dict(self) -> Dict[str, Any]:
        """Convert task to dictionary for serialization."""
        data = asdict(self)
        data["priority"] = self.priority.value
        data["status"] = self.status.value
        return data

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "Task":
        """Create Task from dictionary."""
        data_copy = copy.deepcopy(data)
        if "priority" in data_copy and isinstance(data_copy["priority"], str):
            data_copy["priority"] = Priority.from_string(data_copy["priority"])
        if "status" in data_copy and isinstance(data_copy["status"], str):
            data_copy["status"] = Status.from_string(data_copy["status"])
        return cls(**data_copy)

    def is_overdue(self) -> bool:
        """Check if task is overdue."""
        if not self.due_date:
            return False
        if self.status in (Status.COMPLETED, Status.CANCELLED):
            return False
        try:
            due = datetime.datetime.strptime(self.due_date, CONFIG["date_format"])
            return datetime.datetime.now() > due
        except ValueError:
            return False

    def days_until_due(self) -> Optional[int]:
        """Get days until due date. Negative means overdue."""
        if not self.due_date:
            return None
        try:
            due = datetime.datetime.strptime(self.due_date, CONFIG["date_format"])
            delta = due - datetime.datetime.now()
            return delta.days
        except ValueError:
            return None

    def add_subtask(self, title: str, completed: bool = False) -> Dict[str, Any]:
        """Add a subtask to this task."""
        subtask = {
            "id": str(uuid.uuid4())[:8],
            "title": title,
            "completed": completed,
            "created_at": datetime.datetime.now().strftime(CONFIG["datetime_format"]),
        }
        self.subtasks.append(subtask)
        self._update_timestamp()
        return subtask

    def complete_subtask(self, subtask_id: str) -> bool:
        """Mark a subtask as completed."""
        for subtask in self.subtasks:
            if subtask["id"] == subtask_id:
                subtask["completed"] = True
                self._update_timestamp()
                return True
        return False

    def remove_subtask(self, subtask_id: str) -> bool:
        """Remove a subtask."""
        original_len = len(self.subtasks)
        self.subtasks = [s for s in self.subtasks if s["id"] != subtask_id]
        if len(self.subtasks) < original_len:
            self._update_timestamp()
            return True
        return False

    def add_tag(self, tag: str) -> bool:
        """Add a tag to the task."""
        tag = tag.strip().lower()
        if not tag:
            return False
        if len(tag) > CONFIG["tag_length_limit"]:
            raise ValueError(f"Tag too long (max {CONFIG['tag_length_limit']} chars)")
        if len(self.tags) >= CONFIG["max_tags"]:
            raise ValueError(f"Max {CONFIG['max_tags']} tags per task")
        if tag not in self.tags:
            self.tags.append(tag)
            self._update_timestamp()
            return True
        return False

    def remove_tag(self, tag: str) -> bool:
        """Remove a tag from the task."""
        tag = tag.strip().lower()
        if tag in self.tags:
            self.tags.remove(tag)
            self._update_timestamp()
            return True
        return False

    def mark_completed(self):
        """Mark task as completed."""
        self.status = Status.COMPLETED
        self.completed_at = datetime.datetime.now().strftime(CONFIG["datetime_format"])
        self._update_timestamp()

    def mark_in_progress(self):
        """Mark task as in progress."""
        self.status = Status.IN_PROGRESS
        self.completed_at = None
        self._update_timestamp()

    def mark_todo(self):
        """Mark task as to-do."""
        self.status = Status.TODO
        self.completed_at = None
        self._update_timestamp()

    def mark_on_hold(self):
        """Mark task as on hold."""
        self.status = Status.ON_HOLD
        self.completed_at = None
        self._update_timestamp()

    def mark_cancelled(self):
        """Mark task as cancelled."""
        self.status = Status.CANCELLED
        self.completed_at = None
        self._update_timestamp()

    def _update_timestamp(self):
        """Update the updated_at timestamp."""
        self.updated_at = datetime.datetime.now().strftime(CONFIG["datetime_format"])

    def __str__(self) -> str:
        """String representation of the task."""
        status_icon = {
            Status.TODO: "[ ]",
            Status.IN_PROGRESS: "[~]",
            Status.COMPLETED: "[x]",
            Status.CANCELLED: "[-]",
            Status.ON_HOLD: "[=]",
        }.get(self.status, "[?]")

        priority_icon = {
            Priority.URGENT: "🔴",
            Priority.HIGH: "🟠",
            Priority.MEDIUM: "🟡",
            Priority.LOW: "🟢",
        }.get(self.priority, "")

        overdue_marker = " ⚠️OVERDUE" if self.is_overdue() else ""
        due_str = f" (Due: {self.due_date})" if self.due_date else ""

        return (
            f"{status_icon} {priority_icon} [{self.id[:6]}] {self.title}"
            f"{due_str}{overdue_marker}"
            f" | {self.category} | {self.status.value}"
        )


@dataclass
class Category:
    """Represents a task category."""
    name: str
    description: str = ""
    color: str = "#000000"
    icon: str = ""
    created_at: str = ""

    def __post_init__(self):
        if not self.created_at:
            self.created_at = datetime.datetime.now().strftime(CONFIG["datetime_format"])

    def to_dict(self) -> Dict[str, Any]:
        return asdict(self)

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "Category":
        return cls(**data)


@dataclass
class Statistics:
    """Task statistics."""
    total_tasks: int = 0
    completed_tasks: int = 0
    in_progress_tasks: int = 0
    todo_tasks: int = 0
    cancelled_tasks: int = 0
    on_hold_tasks: int = 0
    overdue_tasks: int = 0
    tasks_by_priority: Dict[str, int] = field(default_factory=dict)
    tasks_by_category: Dict[str, int] = field(default_factory=dict)
    tasks_by_status: Dict[str, int] = field(default_factory=dict)
    tasks_by_month: Dict[str, int] = field(default_factory=dict)
    avg_completion_time_hours: float = 0.0
    total_estimated_hours: float = 0.0
    total_actual_hours: float = 0.0
    completion_rate: float = 0.0

    def to_dict(self) -> Dict[str, Any]:
        return asdict(self)

    def __str__(self) -> str:
        lines = [
            "=" * 50,
            "           TASK STATISTICS",
            "=" * 50,
            f"  Total Tasks:        {self.total_tasks}",
            f"  Completed:          {self.completed_tasks}",
            f"  In Progress:        {self.in_progress_tasks}",
            f"  To Do:              {self.todo_tasks}",
            f"  On Hold:            {self.on_hold_tasks}",
            f"  Cancelled:          {self.cancelled_tasks}",
            f"  Overdue:            {self.overdue_tasks}",
            f"  Completion Rate:    {self.completion_rate:.1%}" if self.total_tasks > 0 else "  Completion Rate:    N/A",
            "-" * 50,
            "  By Priority:",
        ]
        for prio in Priority.get_order():
            count = self.tasks_by_priority.get(prio.value, 0)
            lines.append(f"    {prio.value.upper():10s}: {count}")
        lines.append("-" * 50)
        lines.append("  By Category:")
        for cat, count in sorted(self.tasks_by_category.items()):
            lines.append(f"    {cat:15s}: {count}")
        lines.append("-" * 50)
        lines.append("  By Month (Created):")
        for month, count in sorted(self.tasks_by_month.items()):
            lines.append(f"    {month:10s}: {count}")
        lines.append("=" * 50)
        return "\n".join(lines)


# ============================================================================
# Data Storage
# ============================================================================

class StorageError(Exception):
    """Base exception for storage operations."""
    pass


class Storage:
    """Handles data persistence for tasks and categories."""

    def __init__(self, data_file: str = None, backup_dir: str = None):
        self.data_file = data_file or CONFIG["data_file"]
        self.backup_dir = backup_dir or CONFIG["backup_dir"]
        self._data: Dict[str, Any] = {
            "tasks": [],
            "categories": [],
            "metadata": {
                "version": "1.0.0",
                "last_modified": "",
                "total_operations": 0,
            }
        }
        self._load_data()

    def _load_data(self):
        """Load data from file."""
        try:
            if os.path.exists(self.data_file):
                with open(self.data_file, "r", encoding="utf-8") as f:
                    self._data = json.load(f)
                logger.info(f"Loaded data from {self.data_file}")
            else:
                logger.info(f"No existing data file, starting fresh")
        except json.JSONDecodeError as e:
            logger.error(f"Failed to parse JSON file: {e}")
            logger.warning("Resetting to empty data")
            self._data = {
                "tasks": [],
                "categories": [],
                "metadata": {
                    "version": "1.0.0",
                    "last_modified": "",
                    "total_operations": 0,
                }
            }
        except IOError as e:
            logger.error(f"Failed to read data file: {e}")
            raise StorageError(f"Cannot read data file: {e}")

    def _save_data(self):
        """Save data to file."""
        self._data["metadata"]["last_modified"] = datetime.datetime.now().strftime(CONFIG["datetime_format"])
        self._data["metadata"]["total_operations"] += 1

        try:
            # Create backup if enabled
            if CONFIG["backup_enabled"]:
                self._create_backup()

            # Write to file
            temp_file = self.data_file + ".tmp"
            with open(temp_file, "w", encoding="utf-8") as f:
                json.dump(self._data, f, indent=2, ensure_ascii=False)
            os.replace(temp_file, self.data_file)
            logger.debug("Data saved successfully")
        except IOError as e:
            logger.error(f"Failed to save data: {e}")
            raise StorageError(f"Cannot save data: {e}")

    def _create_backup(self):
        """Create a backup of the current data file."""
        if not os.path.exists(self.data_file):
            return

        os.makedirs(self.backup_dir, exist_ok=True)
        timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
        backup_name = f"tasks_backup_{timestamp}.json"
        backup_path = os.path.join(self.backup_dir, backup_name)

        try:
            with open(self.data_file, "r", encoding="utf-8") as src:
                with open(backup_path, "w", encoding="utf-8") as dst:
                    dst.write(src.read())
            logger.debug(f"Backup created: {backup_path}")

            # Keep only last 10 backups
            backups = sorted(
                [f for f in os.listdir(self.backup_dir) if f.startswith("tasks_backup_")],
                reverse=True
            )
            for old_backup in backups[10:]:
                os.remove(os.path.join(self.backup_dir, old_backup))
                logger.debug(f"Removed old backup: {old_backup}")

        except IOError as e:
            logger.warning(f"Failed to create backup: {e}")

    def get_all_tasks(self) -> List[Task]:
        """Get all tasks."""
        task_dicts = self._data.get("tasks", [])
        return [Task.from_dict(td) for td in task_dicts]

    def get_task_by_id(self, task_id: str) -> Optional[Task]:
        """Get a single task by ID."""
        for task_dict in self._data.get("tasks", []):
            if task_dict.get("id") == task_id:
                return Task.from_dict(task_dict)
        return None

    def add_task(self, task: Task) -> Task:
        """Add a new task."""
        if len(self._data["tasks"]) >= CONFIG["max_tasks"]:
            raise StorageError(f"Maximum number of tasks ({CONFIG['max_tasks']}) reached")

        # Check for duplicate title in same category (optional warning)
        task_dict = task.to_dict()
        self._data["tasks"].append(task_dict)
        self._save_data()
        logger.info(f"Task added: {task.id[:6]} - {task.title}")
        return task

    def update_task(self, task_id: str, updates: Dict[str, Any]) -> Optional[Task]:
        """Update a task by ID."""
        for i, task_dict in enumerate(self._data["tasks"]):
            if task_dict.get("id") == task_id:
                task = Task.from_dict(task_dict)
                for key, value in updates.items():
                    if hasattr(task, key):
                        setattr(task, key, value)
                task._update_timestamp()
                self._data["tasks"][i] = task.to_dict()
                self._save_data()
                logger.info(f"Task updated: {task_id[:6]}")
                return task
        return None

    def delete_task(self, task_id: str) -> bool:
        """Delete a task by ID."""
        original_len = len(self._data["tasks"])
        self._data["tasks"] = [
            t for t in self._data["tasks"] if t.get("id") != task_id
        ]
        if len(self._data["tasks"]) < original_len:
            self._save_data()
            logger.info(f"Task deleted: {task_id[:6]}")
            return True
        return False

    def get_all_categories(self) -> List[Category]:
        """Get all categories."""
        cat_dicts = self._data.get("categories", [])
        return [Category.from_dict(cd) for cd in cat_dicts]

    def add_category(self, category: Category) -> Category:
        """Add a new category."""
        # Check for duplicates
        for cat_dict in self._data["categories"]:
            if cat_dict.get("name", "").lower() == category.name.lower():
                raise StorageError(f"Category '{category.name}' already exists")

        cat_dict = category.to_dict()
        self._data["categories"].append(cat_dict)
        self._save_data()
        logger.info(f"Category added: {category.name}")
        return category

    def delete_category(self, name: str) -> bool:
        """Delete a category by name."""
        original_len = len(self._data["categories"])
        self._data["categories"] = [
            c for c in self._data["categories"]
            if c.get("name", "").lower() != name.lower()
        ]
        if len(self._data["categories"]) < original_len:
            self._save_data()
            logger.info(f"Category deleted: {name}")
            return True
        return False

    def get_metadata(self) -> Dict[str, Any]:
        """Get storage metadata."""
        return self._data.get("metadata", {})

    def import_tasks(self, tasks_data: List[Dict[str, Any]]) -> int:
        """Import tasks from external data."""
        count = 0
        for task_dict in tasks_data:
            try:
                task = Task.from_dict(task_dict)
                # Generate new ID to avoid conflicts
                task.id = str(uuid.uuid4())
                self.add_task(task)
                count += 1
            except Exception as e:
                logger.warning(f"Failed to import task: {e}")
        logger.info(f"Imported {count} tasks")
        return count

    def export_tasks(self) -> List[Dict[str, Any]]:
        """Export all tasks as dictionaries."""
        return self._data.get("tasks", [])


# ============================================================================
# Task Manager Core
# ============================================================================

class TaskManagerError(Exception):
    """Base exception for task manager operations."""
    pass


class TaskManager:
    """Core task management logic."""

    def __init__(self, storage: Storage = None):
        self.storage = storage or Storage()
        self._validate_initial_data()

    def _validate_initial_data(self):
        """Ensure default categories exist."""
        default_categories = [
            ("general", "General tasks", "#000000", "📋"),
            ("work", "Work-related tasks", "#1976D2", "💼"),
            ("personal", "Personal tasks", "#388E3C", "🏠"),
            ("health", "Health & fitness", "#F44336", "❤️"),
            ("learning", "Learning & development", "#9C27B0", "📚"),
        ]
        existing = {c.name.lower() for c in self.storage.get_all_categories()}
        for name, desc, color, icon in default_categories:
            if name.lower() not in existing:
                try:
                    cat = Category(name=name, description=desc, color=color, icon=icon)
                    self.storage.add_category(cat)
                except StorageError:
                    pass

    # -------------------------------------------------------------------------
    # Task CRUD Operations
    # -------------------------------------------------------------------------

    def create_task(
        self,
        title: str,
        description: str = "",
        priority: Priority = None,
        category: str = "general",
        due_date: str = None,
        tags: List[str] = None,
        estimated_hours: float = None,
    ) -> Task:
        """Create a new task."""
        # Validation
        if not title or not title.strip():
            raise TaskManagerError("Task title cannot be empty")
        title = title.strip()
        if len(title) > CONFIG["max_title_length"]:
            raise TaskManagerError(f"Title too long (max {CONFIG['max_title_length']} chars)")

        if description and len(description) > CONFIG["max_description_length"]:
            raise TaskManagerError(f"Description too long (max {CONFIG['max_description_length']} chars)")

        if priority is None:
            priority = Priority.from_string(CONFIG["default_priority"])

        if due_date:
            self._validate_date_format(due_date)

        if tags:
            for tag in tags:
                if len(tag.strip()) > CONFIG["tag_length_limit"]:
                    raise TaskManagerError(f"Tag '{tag}' too long (max {CONFIG['tag_length_limit']} chars)")

        # Check if category exists
        categories = self.storage.get_all_categories()
        cat_names = {c.name.lower() for c in categories}
        if category.lower() not in cat_names:
            raise TaskManagerError(
                f"Category '{category}' does not exist. "
                f"Available: {', '.join(cat_names)}"
            )

        # Create task
        task_id = str(uuid.uuid4())
        task = Task(
            id=task_id,
            title=title,
            description=description or "",
            priority=priority,
            category=category.lower(),
            tags=[t.strip().lower() for t in tags] if tags else [],
            due_date=due_date,
            estimated_hours=estimated_hours,
        )

        return self.storage.add_task(task)

    def get_task(self, task_id: str) -> Task:
        """Get a task by ID."""
        task = self.storage.get_task_by_id(task_id)
        if not task:
            raise TaskManagerError(f"Task not found: {task_id}")
        return task

    def list_tasks(
        self,
        status: Status = None,
        priority: Priority = None,
        category: str = None,
        tag: str = None,
        search: str = None,
        overdue_only: bool = False,
        limit: int = 100,
        sort_by: SortField = SortField.CREATED_AT,
        reverse: bool = True,
    ) -> List[Task]:
        """List tasks with optional filters."""
        tasks = self.storage.get_all_tasks()

        # Apply filters
        if status:
            tasks = [t for t in tasks if t.status == status]
        if priority:
            tasks = [t for t in tasks if t.priority == priority]
        if category:
            tasks = [t for t in tasks if t.category.lower() == category.lower()]
        if tag:
            tag = tag.strip().lower()
            tasks = [t for t in tasks if tag in t.tags]
        if search:
            search_lower = search.lower()
            tasks = [
                t for t in tasks
                if search_lower in t.title.lower()
                or search_lower in t.description.lower()
                or any(search_lower in tag for tag in t.tags)
            ]
        if overdue_only:
            tasks = [t for t in tasks if t.is_overdue()]

        # Sort
        def sort_key(task: Task):
            if sort_by == SortField.TITLE:
                return task.title.lower()
            elif sort_by == SortField.PRIORITY:
                return -Priority.get_numeric_value(task.priority)
            elif sort_by == SortField.STATUS:
                status_order = {s.value: i for i, s in enumerate(Status)}
                return status_order.get(task.status.value, 99)
            elif sort_by == SortField.CREATED_AT:
                return task.created_at
            elif sort_by == SortField.UPDATED_AT:
                return task.updated_at
            elif sort_by == SortField.DUE_DATE:
                if task.due_date:
                    return task.due_date
                return "9999-12-31"  # No due date goes to end
            elif sort_by == SortField.CATEGORY:
                return task.category.lower()
            return task.created_at

        tasks.sort(key=sort_key, reverse=reverse)

        # Limit
        return tasks[:limit]

    def update_task_title(self, task_id: str, new_title: str) -> Task:
        """Update task title."""
        if not new_title or not new_title.strip():
            raise TaskManagerError("Title cannot be empty")
        if len(new_title.strip()) > CONFIG["max_title_length"]:
            raise TaskManagerError(f"Title too long (max {CONFIG['max_title_length']} chars)")
        task = self.storage.update_task(task_id, {"title": new_title.strip()})
        if not task:
            raise TaskManagerError(f"Task not found: {task_id}")
        return task

    def update_task_description(self, task_id: str, description: str) -> Task:
        """Update task description."""
        if description and len(description) > CONFIG["max_description_length"]:
            raise TaskManagerError(f"Description too long (max {CONFIG['max_description_length']} chars)")
        task = self.storage.update_task(task_id, {"description": description or ""})
        if not task:
            raise TaskManagerError(f"Task not found: {task_id}")
        return task

    def update_task_priority(self, task_id: str, priority: Priority) -> Task:
        """Update task priority."""
        task = self.storage.update_task(task_id, {"priority": priority})
        if not task:
            raise TaskManagerError(f"Task not found: {task_id}")
        return task

    def update_task_status(self, task_id: str, status: Status) -> Task:
        """Update task status."""
        updates = {"status": status}
        if status == Status.COMPLETED:
            updates["completed_at"] = datetime.datetime.now().strftime(CONFIG["datetime_format"])
        elif status != Status.COMPLETED:
            updates["completed_at"] = None

        task = self.storage.update_task(task_id, updates)
        if not task:
            raise TaskManagerError(f"Task not found: {task_id}")
        return task

    def update_task_category(self, task_id: str, category: str) -> Task:
        """Update task category."""
        categories = self.storage.get_all_categories()
        cat_names = {c.name.lower() for c in categories}
        if category.lower() not in cat_names:
            raise TaskManagerError(
                f"Category '{category}' does not exist. "
                f"Available: {', '.join(cat_names)}"
            )
        task = self.storage.update_task(task_id, {"category": category.lower()})
        if not task:
            raise TaskManagerError(f"Task not found: {task_id}")
        return task

    def update_task_due_date(self, task_id: str, due_date: str = None) -> Task:
        """Update task due date. Pass None to clear."""
        if due_date:
            self._validate_date_format(due_date)
        task = self.storage.update_task(task_id, {"due_date": due_date})
        if not task:
            raise TaskManagerError(f"Task not found: {task_id}")
        return task

    def delete_task(self, task_id: str) -> bool:
        """Delete a task."""
        if not self.storage.delete_task(task_id):
            raise TaskManagerError(f"Task not found: {task_id}")
        return True

    # -------------------------------------------------------------------------
    # Subtask Operations
    # -------------------------------------------------------------------------

    def add_subtask(self, task_id: str, title: str, completed: bool = False) -> Task:
        """Add a subtask to a task."""
        task = self.get_task(task_id)
        subtask = task.add_subtask(title, completed)
        updated = self.storage.update_task(task_id, {"subtasks": task.subtasks})
        if not updated:
            raise TaskManagerError(f"Failed to update task: {task_id}")
        return updated

    def complete_subtask(self, task_id: str, subtask_id: str) -> Task:
        """Complete a subtask."""
        task = self.get_task(task_id)
        if not task.complete_subtask(subtask_id):
            raise TaskManagerError(f"Subtask not found: {subtask_id}")
        updated = self.storage.update_task(task_id, {"subtasks": task.subtasks})
        if not updated:
            raise TaskManagerError(f"Failed to update task: {task_id}")
        return updated

    def remove_subtask(self, task_id: str, subtask_id: str) -> Task:
        """Remove a subtask."""
        task = self.get_task(task_id)
        if not task.remove_subtask(subtask_id):
            raise TaskManagerError(f"Subtask not found: {subtask_id}")
        updated = self.storage.update_task(task_id, {"subtasks": task.subtasks})
        if not updated:
            raise TaskManagerError(f"Failed to update task: {task_id}")
        return updated

    # -------------------------------------------------------------------------
    # Tag Operations
    # -------------------------------------------------------------------------

    def add_tag(self, task_id: str, tag: str) -> Task:
        """Add a tag to a task."""
        task = self.get_task(task_id)
        task.add_tag(tag)
        updated = self.storage.update_task(task_id, {"tags": task.tags})
        if not updated:
            raise TaskManagerError(f"Failed to update task: {task_id}")
        return updated

    def remove_tag(self, task_id: str, tag: str) -> Task:
        """Remove a tag from a task."""
        task = self.get_task(task_id)
        if not task.remove_tag(tag):
            raise TaskManagerError(f"Tag not found: {tag}")
        updated = self.storage.update_task(task_id, {"tags": task.tags})
        if not updated:
            raise TaskManagerError(f"Failed to update task: {task_id}")
        return updated

    # -------------------------------------------------------------------------
    # Category Operations
    # -------------------------------------------------------------------------

    def list_categories(self) -> List[Category]:
        """List all categories."""
        return self.storage.get_all_categories()

    def create_category(
        self,
        name: str,
        description: str = "",
        color: str = "#000000",
        icon: str = "",
    ) -> Category:
        """Create a new category."""
        if not name or not name.strip():
            raise TaskManagerError("Category name cannot be empty")
        name = name.strip()
        category = Category(
            name=name,
            description=description,
            color=color,
            icon=icon,
        )
        return self.storage.add_category(category)

    def delete_category(self, name: str) -> bool:
        """Delete a category."""
        # Check if any tasks use this category
        tasks = self.storage.get_all_tasks()
        using_tasks = [t for t in tasks if t.category.lower() == name.lower()]
        if using_tasks:
            raise TaskManagerError(
                f"Cannot delete category '{name}': {len(using_tasks)} task(s) use it. "
                f"Reassign tasks first."
            )
        return self.storage.delete_category(name)

    # -------------------------------------------------------------------------
    # Statistics
    # -------------------------------------------------------------------------

    def get_statistics(self) -> Statistics:
        """Calculate and return task statistics."""
        tasks = self.storage.get_all_tasks()
        stats = Statistics()
        stats.total_tasks = len(tasks)

        # Count by status
        status_counts = defaultdict(int)
        priority_counts = defaultdict(int)
        category_counts = defaultdict(int)
        month_counts = defaultdict(int)
        total_estimated = 0.0
        total_actual = 0.0
        completion_times = []

        for task in tasks:
            status_counts[task.status.value] += 1
            priority_counts[task.priority.value] += 1
            category_counts[task.category] += 1

            # Month of creation
            try:
                created = datetime.datetime.strptime(task.created_at, CONFIG["datetime_format"])
                month_key = created.strftime("%Y-%m")
                month_counts[month_key] += 1
            except ValueError:
                pass

            # Hours
            if task.estimated_hours:
                total_estimated += task.estimated_hours
            if task.actual_hours:
                total_actual += task.actual_hours

            # Completion time
            if task.status == Status.COMPLETED and task.completed_at and task.created_at:
                try:
                    created = datetime.datetime.strptime(task.created_at, CONFIG["datetime_format"])
                    completed = datetime.datetime.strptime(task.completed_at, CONFIG["datetime_format"])
                    hours = (completed - created).total_seconds() / 3600
                    completion_times.append(hours)
                except ValueError:
                    pass

            # Overdue
            if task.is_overdue():
                stats.overdue_tasks += 1

        stats.completed_tasks = status_counts.get("completed", 0)
        stats.in_progress_tasks = status_counts.get("in_progress", 0)
        stats.todo_tasks = status_counts.get("todo", 0)
        stats.cancelled_tasks = status_counts.get("cancelled", 0)
        stats.on_hold_tasks = status_counts.get("on_hold", 0)
        stats.tasks_by_status = dict(status_counts)
        stats.tasks_by_priority = dict(priority_counts)
        stats.tasks_by_category = dict(category_counts)
        stats.tasks_by_month = dict(month_counts)
        stats.total_estimated_hours = total_estimated
        stats.total_actual_hours = total_actual

        if completion_times:
            stats.avg_completion_time_hours = sum(completion_times) / len(completion_times)
        if stats.total_tasks > 0:
            stats.completion_rate = stats.completed_tasks / stats.total_tasks

        return stats

    # -------------------------------------------------------------------------
    # Helper Methods
    # -------------------------------------------------------------------------

    @staticmethod
    def _validate_date_format(date_str: str):
        """Validate date string format."""
        try:
            datetime.datetime.strptime(date_str, CONFIG["date_format"])
        except ValueError:
            raise TaskManagerError(
                f"Invalid date format: '{date_str}'. Use {CONFIG['date_format']} (e.g., 2024-01-15)"
            )

    def get_overdue_tasks(self) -> List[Task]:
        """Get all overdue tasks."""
        return self.list_tasks(overdue_only=True)

    def get_upcoming_tasks(self, days: int = 7) -> List[Task]:
        """Get tasks due within the next N days."""
        tasks = self.storage.get_all_tasks()
        now = datetime.datetime.now()
        upcoming = []
        for task in tasks:
            if task.status in (Status.COMPLETED, Status.CANCELLED):
                continue
            if not task.due_date:
                continue
            try:
                due = datetime.datetime.strptime(task.due_date, CONFIG["date_format"])
                delta = (due - now).days
                if 0 <= delta <= days:
                    upcoming.append(task)
            except ValueError:
                continue
        return upcoming

    def search_tasks(self, query: str) -> List[Task]:
        """Search tasks by title, description, or tags."""
        return self.list_tasks(search=query)


# ============================================================================
# CLI Interface
# ============================================================================

class CLI:
    """Command-line interface for the task manager."""

    def __init__(self, manager: TaskManager = None):
        self.manager = manager or TaskManager()
        self.parser = self._build_parser()

    def _build_parser(self) -> argparse.ArgumentParser:
        """Build the argument parser."""
        parser = argparse.ArgumentParser(
            prog="taskmgr",
            description="Personal Task Management System",
            formatter_class=argparse.RawDescriptionHelpFormatter,
            epilog="""
Examples:
  %(prog)s add "Buy groceries" --category personal --priority high
  %(prog)s list --status todo --priority high
  %(prog)s complete <task_id>
  %(prog)s stats
  %(prog)s search "meeting"
            """
        )

        subparsers = parser.add_subparsers(dest="command", help="Available commands")

        # --- ADD COMMAND ---
        add_parser = subparsers.add_parser("add", help="Add a new task")
        add_parser.add_argument("title", help="Task title")
        add_parser.add_argument("-d", "--description", default="", help="Task description")
        add_parser.add_argument("-p", "--priority", default=None,
                                choices=["low", "medium", "high", "urgent"],
                                help="Task priority (default: medium)")
        add_parser.add_argument("-c", "--category", default="general",
                                help="Task category (default: general)")
        add_parser.add_argument("--due", default=None,
                                help=f"Due date ({CONFIG['date_format']})")
        add_parser.add_argument("-t", "--tags", nargs="*", default=[],
                                help="Tags (space-separated)")
        add_parser.add_argument("-e", "--estimated-hours", type=float, default=None,
                                help="Estimated hours")

        # --- LIST COMMAND ---
        list_parser = subparsers.add_parser("list", help="List tasks")
        list_parser.add_argument("-s", "--status", default=None,
                                 choices=["todo", "in_progress", "completed", "cancelled", "on_hold"],
                                 help="Filter by status")
        list_parser.add_argument("-p", "--priority", default=None,
                                 choices=["low", "medium", "high", "urgent"],
                                 help="Filter by priority")
        list_parser.add_argument("-c", "--category", default=None,
                                 help="Filter by category")
        list_parser.add_argument("-t", "--tag", default=None,
                                 help="Filter by tag")
        list_parser.add_argument("-q", "--search", default=None,
                                 help="Search query")
        list_parser.add_argument("--overdue", action="store_true",
                                 help="Show only overdue tasks")
        list_parser.add_argument("-n", "--limit", type=int, default=50,
                                 help="Max tasks to show (default: 50)")
        list_parser.add_argument("--sort", default="created_at",
                                 choices=["title", "priority", "status", "created_at", "updated_at", "due_date", "category"],
                                 help="Sort field (default: created_at)")
        list_parser.add_argument("--reverse", action="store_true", default=True,
                                 help="Reverse sort order")

        # --- SHOW COMMAND ---
        show_parser = subparsers.add_parser("show", help="Show task details")
        show_parser.add_argument("task_id", help="Task ID")

        # --- UPDATE COMMAND ---
        update_parser = subparsers.add_parser("update", help="Update a task")
        update_parser.add_argument("task_id", help="Task ID")
        update_parser.add_argument("--title", default=None, help="New title")
        update_parser.add_argument("--description", default=None, help="New description")
        update_parser.add_argument("--priority", default=None,
                                   choices=["low", "medium", "high", "urgent"])
        update_parser.add_argument("--status", default=None,
                                   choices=["todo", "in_progress", "completed", "cancelled", "on_hold"])
        update_parser.add_argument("--category", default=None, help="New category")
        update_parser.add_argument("--due", default=None, help="New due date")

        # --- COMPLETE COMMAND ---
        complete_parser = subparsers.add_parser("complete", help="Mark task as completed")
        complete_parser.add_argument("task_id", help="Task ID")

        # --- DELETE COMMAND ---
        delete_parser = subparsers.add_parser("delete", help="Delete a task")
        delete_parser.add_argument("task_id", help="Task ID")

        # --- STATS COMMAND ---
        subparsers.add_parser("stats", help="Show task statistics")

        # --- SEARCH COMMAND ---
        search_parser = subparsers.add_parser("search", help="Search tasks")
        search_parser.add_argument("query", help="Search query")

        # --- CATEGORIES COMMAND ---
        cat_parser = subparsers.add_parser("categories", help="Manage categories")
        cat_sub = cat_parser.add_subparsers(dest="cat_command")

        cat_list = cat_sub.add_parser("list", help="List categories")
        cat_add = cat_sub.add_parser("add", help="Add category")
        cat_add.add_argument("name", help="Category name")
        cat_add.add_argument("-d", "--description", default="", help="Description")
        cat_del = cat_sub.add_parser("delete", help="Delete category")
        cat_del.add_argument("name", help="Category name")

        # --- SUBTASK COMMANDS ---
        subtask_parser = subparsers.add_parser("subtask", help="Manage subtasks")
        subtask_sub = subtask_parser.add_subparsers(dest="sub_command")

        sub_add = subtask_sub.add_parser("add", help="Add subtask")
        sub_add.add_argument("task_id", help="Parent task ID")
        sub_add.add_argument("title", help="Subtask title")

        sub_complete = subtask_sub.add_parser("complete", help="Complete subtask")
        sub_complete.add_argument("task_id", help="Parent task ID")
        sub_complete.add_argument("subtask_id", help="Subtask ID")

        sub_remove = subtask_sub.add_parser("remove", help="Remove subtask")
        sub_remove.add_argument("task_id", help="Parent task ID")
        sub_remove.add_argument("subtask_id", help="Subtask ID")

        # --- TAG COMMANDS ---
        tag_parser = subparsers.add_parser("tag", help="Manage tags")
        tag_sub = tag_parser.add_subparsers(dest="tag_command")

        tag_add = tag_sub.add_parser("add", help="Add tag")
        tag_add.add_argument("task_id", help="Task ID")
        tag_add.add_argument("tag", help="Tag name")

        tag_remove = tag_sub.add_parser("remove", help="Remove tag")
        tag_remove.add_argument("task_id", help="Task ID")
        tag_remove.add_argument("tag", help="Tag name")

        # --- UPCOMING COMMAND ---
        upcoming_parser = subparsers.add_parser("upcoming", help="Show upcoming tasks")
        upcoming_parser.add_argument("-d", "--days", type=int, default=7,
                                     help="Days to look ahead (default: 7)")

        # --- IMPORT/EXPORT ---
        import_parser = subparsers.add_parser("import", help="Import tasks from JSON file")
        import_parser.add_argument("file", help="JSON file path")

        export_parser = subparsers.add_parser("export", help="Export tasks to JSON file")
        export_parser.add_argument("file", help="Output JSON file path")

        return parser

    def run(self, args: List[str] = None) -> int:
        """Run the CLI with given arguments."""
        parsed = self.parser.parse_args(args)

        if not parsed.command:
            self.parser.print_help()
            return 0

        try:
            if parsed.command == "add":
                return self._cmd_add(parsed)
            elif parsed.command == "list":
                return self._cmd_list(parsed)
            elif parsed.command == "show":
                return self._cmd_show(parsed)
            elif parsed.command == "update":
                return self._cmd_update(parsed)
            elif parsed.command == "complete":
                return self._cmd_complete(parsed)
            elif parsed.command == "delete":
                return self._cmd_delete(parsed)
            elif parsed.command == "stats":
                return self._cmd_stats(parsed)
            elif parsed.command == "search":
                return self._cmd_search(parsed)
            elif parsed.command == "categories":
                return self._cmd_categories(parsed)
            elif parsed.command == "subtask":
                return self._cmd_subtask(parsed)
            elif parsed.command == "tag":
                return self._cmd_tag(parsed)
            elif parsed.command == "upcoming":
                return self._cmd_upcoming(parsed)
            elif parsed.command == "import":
                return self._cmd_import(parsed)
            elif parsed.command == "export":
                return self._cmd_export(parsed)
            else:
                self.parser.print_help()
                return 0
        except TaskManagerError as e:
            print(f"Error: {e}", file=sys.stderr)
            return 1
        except StorageError as e:
            print(f"Storage Error: {e}", file=sys.stderr)
            return 2
        except Exception as e:
            logger.exception("Unexpected error")
            print(f"Unexpected Error: {e}", file=sys.stderr)
            return 3

    # -------------------------------------------------------------------------
    # Command Handlers
    # -------------------------------------------------------------------------

    def _cmd_add(self, args) -> int:
        """Handle 'add' command."""
        priority = Priority.from_string(args.priority) if args.priority else None
        try:
            task = self.manager.create_task(
                title=args.title,
                description=args.description,
                priority=priority,
                category=args.category,
                due_date=args.due,
                tags=args.tags,
                estimated_hours=args.estimated_hours,
            )
            print(f"✅ Task created: {task}")
            print(f"   ID: {task.id}")
            return 0
        except (TaskManagerError, StorageError, ValueError) as e:
            print(f"Error: {e}", file=sys.stderr)
            return 1

    def _cmd_list(self, args) -> int:
        """Handle 'list' command."""
        status = Status.from_string(args.status) if args.status else None
        priority = Priority.from_string(args.priority) if args.priority else None
        sort_by = SortField.from_string(args.sort)

        try:
            tasks = self.manager.list_tasks(
                status=status,
                priority=priority,
                category=args.category,
                tag=args.tag,
                search=args.search,
                overdue_only=args.overdue,
                limit=args.limit,
                sort_by=sort_by,
                reverse=args.reverse,
            )

            if not tasks:
                print("No tasks found.")
                return 0

            print(f"\n{'='*60}")
            print(f"  Tasks ({len(tasks)} found)")
            print(f"{'='*60}\n")

            for i, task in enumerate(tasks, 1):
                print(f"  {task}")
                if task.description:
                    # Truncate description for display
                    desc = task.description[:80] + "..." if len(task.description) > 80 else task.description
                    print(f"     📝 {desc}")
                if task.tags:
                    print(f"     🏷️  {', '.join(task.tags)}")
                if task.subtasks:
                    completed = sum(1 for s in task.subtasks if s.get("completed"))
                    total = len(task.subtasks)
                    print(f"     ✅ {completed}/{total} subtasks")
                print()

            return 0
        except Exception as e:
            print(f"Error: {e}", file=sys.stderr)
            return 1

    def _cmd_show(self, args) -> int:
        """Handle 'show' command."""
        try:
            task = self.manager.get_task(args.task_id)
            print(f"\n{'='*60}")
            print(f"  Task Details")
            print(f"{'='*60}")
            print(f"  ID:          {task.id}")
            print(f"  Title:       {task.title}")
            print(f"  Description: {task.description or '(none)'}")
            print(f"  Priority:    {task.priority.value}")
            print(f"  Status:      {Status.get_display_name(task.status)}")
            print(f"  Category:    {task.category}")
            print(f"  Tags:        {', '.join(task.tags) if task.tags else '(none)'}")
            print(f"  Due Date:    {task.due_date or '(none)'}")
            if task.due_date:
                days = task.days_until_due()
                if days is not None:
                    if days < 0:
                        print(f"              ⚠️  OVERDUE by {abs(days)} day(s)")
                    elif days == 0:
                        print(f"              ⏰ Due TODAY")
                    else:
                        print(f"              📅 {days} day(s) remaining")
            print(f"  Created:     {task.created_at}")
            print(f"  Updated:     {task.updated_at}")
            if task.completed_at:
                print(f"  Completed:   {task.completed_at}")
            if task.estimated_hours:
                print(f"  Est. Hours:  {task.estimated_hours}")
            if task.actual_hours:
                print(f"  Actual Hours:{task.actual_hours}")
            if task.notes:
                print(f"  Notes:       {task.notes}")
            if task.subtasks:
                print(f"\n  Subtasks:")
                for sub in task.subtasks:
                    marker = "✅" if sub.get("completed") else "⬜"
                    print(f"    {marker} [{sub['id']}] {sub['title']}")
            print(f"{'='*60}\n")
            return 0
        except TaskManagerError as e:
            print(f"Error: {e}", file=sys.stderr)
            return 1

    def _cmd_update(self, args) -> int:
        """Handle 'update' command."""
        updates = {}
        if args.title:
            updates["title"] = args.title
        if args.description is not None:
            updates["description"] = args.description
        if args.priority:
            updates["priority"] = Priority.from_string(args.priority)
        if args.status:
            updates["status"] = Status.from_string(args.status)
        if args.category:
            updates["category"] = args.category
        if args.due is not None:
            updates["due_date"] = args.due

        if not updates:
            print("Error: No updates specified.", file=sys.stderr)
            return 1

        try:
            task = self.manager.get_task(args.task_id)
            for key, value in updates.items():
                if key == "title":
                    self.manager.update_task_title(args.task_id, value)
                elif key == "description":
                    self.manager.update_task_description(args.task_id, value)
                elif key == "priority":
                    self.manager.update_task_priority(args.task_id, value)
                elif key == "status":
                    self.manager.update_task_status(args.task_id, value)
                elif key == "category":
                    self.manager.update_task_category(args.task_id, value)
                elif key == "due_date":
                    self.manager.update_task_due_date(args.task_id, value)

            task = self.manager.get_task(args.task_id)
            print(f"✅ Task updated: {task}")
            return 0
        except (TaskManagerError, StorageError, ValueError) as e:
            print(f"Error: {e}", file=sys.stderr)
            return 1

    def _cmd_complete(self, args) -> int:
        """Handle 'complete' command."""
        try:
            task = self.manager.update_task_status(args.task_id, Status.COMPLETED)
            print(f"✅ Task completed: {task}")
            return 0
        except (TaskManagerError, StorageError) as e:
            print(f"Error: {e}", file=sys.stderr)
            return 1

    def _cmd_delete(self, args) -> int:
        """Handle 'delete' command."""
        try:
            self.manager.delete_task(args.task_id)
            print(f"✅ Task deleted: {args.task_id[:6]}")
            return 0
        except (TaskManagerError, StorageError) as e:
            print(f"Error: {e}", file=sys.stderr)
            return 1

    def _cmd_stats(self, args) -> int:
        """Handle 'stats' command."""
        try:
            stats = self.manager.get_statistics()
            print(stats)
            return 0
        except Exception as e:
            print(f"Error: {e}", file=sys.stderr)
            return 1

    def _cmd_search(self, args) -> int:
        """Handle 'search' command."""
        try:
            tasks = self.manager.search_tasks(args.query)
            if not tasks:
                print(f"No tasks found matching '{args.query}'.")
                return 0

            print(f"\n{'='*60}")
            print(f"  Search Results for '{args.query}' ({len(tasks)} found)")
            print(f"{'='*60}\n")

            for task in tasks:
                print(f"  {task}")
            print()
            return 0
        except Exception as e:
            print(f"Error: {e}", file=sys.stderr)
            return 1

    def _cmd_categories(self, args) -> int:
        """Handle 'categories' command."""
        if not args.cat_command:
            # Default: list categories
            cats = self.manager.list_categories()
            if not cats:
                print("No categories found.")
                return 0
            print("\nCategories:")
            for cat in cats:
                print(f"  {cat.icon or ''} {cat.name:15s} - {cat.description or '(no description)'}")
            print()
            return 0

        if args.cat_command == "list":
            return self._cmd_categories(args)
        elif args.cat_command == "add":
            try:
                cat = self.manager.create_category(args.name, args.description)
                print(f"✅ Category created: {cat.name}")
                return 0
            except (TaskManagerError, StorageError) as e:
                print(f"Error: {e}", file=sys.stderr)
                return 1
        elif args.cat_command == "delete":
            try:
                self.manager.delete_category(args.name)
                print(f"✅ Category deleted: {args.name}")
                return 0
            except (TaskManagerError, StorageError) as e:
                print(f"Error: {e}", file=sys.stderr)
                return 1
        return 1

    def _cmd_subtask(self, args) -> int:
        """Handle 'subtask' command."""
        if not args.sub_command:
            print("Usage: taskmgr subtask <add|complete|remove> ...", file=sys.stderr)
            return 1

        if args.sub_command == "add":
            try:
                task = self.manager.add_subtask(args.task_id, args.title)
                print(f"✅ Subtask added to {args.task_id[:6]}")
                return 0
            except (TaskManagerError, StorageError) as e:
                print(f"Error: {e}", file=sys.stderr)
                return 1
        elif args.sub_command == "complete":
            try:
                task = self.manager.complete_subtask(args.task_id, args.subtask_id)
                print(f"✅ Subtask completed")
                return 0
            except (TaskManagerError, StorageError) as e:
                print(f"Error: {e}", file=sys.stderr)
                return 1
        elif args.sub_command == "remove":
            try:
                task = self.manager.remove_subtask(args.task_id, args.subtask_id)
                print(f"✅ Subtask removed")
                return 0
            except (TaskManagerError, StorageError) as e:
                print(f"Error: {e}", file=sys.stderr)
                return 1
        return 1

    def _cmd_tag(self, args) -> int:
        """Handle 'tag' command."""
        if not args.tag_command:
            print("Usage: taskmgr tag <add|remove> ...", file=sys.stderr)
            return 1

        if args.tag_command == "add":
            try:
                task = self.manager.add_tag(args.task_id, args.tag)
                print(f"✅ Tag '{args.tag}' added")
                return 0
            except (TaskManagerError, StorageError, ValueError) as e:
                print(f"Error: {e}", file=sys.stderr)
                return 1
        elif args.tag_command == "remove":
            try:
                task = self.manager.remove_tag(args.task_id, args.tag)
                print(f"✅ Tag '{args.tag}' removed")
                return 0
            except (TaskManagerError, StorageError) as e:
                print(f"Error: {e}", file=sys.stderr)
                return 1
        return 1

    def _cmd_upcoming(self, args) -> int:
        """Handle 'upcoming' command."""
        try:
            tasks = self.manager.get_upcoming_tasks(args.days)
            if not tasks:
                print(f"No tasks due in the next {args.days} days.")
                return 0

            print(f"\n{'='*60}")
            print(f"  Upcoming Tasks (next {args.days} days)")
            print(f"{'='*60}\n")

            for task in tasks:
                days = task.days_until_due()
                if days is not None:
                    print(f"  {task} ({days} day(s))")
                else:
                    print(f"  {task}")
            print()
            return 0
        except Exception as e:
            print(f"Error: {e}", file=sys.stderr)
            return 1

    def _cmd_import(self, args) -> int:
        """Handle 'import' command."""
        try:
            if not os.path.exists(args.file):
                print(f"Error: File not found: {args.file}", file=sys.stderr)
                return 1

            with open(args.file, "r", encoding="utf-8") as f:
                data = json.load(f)

            if isinstance(data, list):
                count = self.manager.storage.import_tasks(data)
            elif isinstance(data, dict) and "tasks" in data:
                count = self.manager.storage.import_tasks(data["tasks"])
            else:
                print("Error: Invalid JSON format. Expected list of tasks or object with 'tasks' key.", file=sys.stderr)
                return 1

            print(f"✅ Imported {count} tasks")
            return 0
        except json.JSONDecodeError as e:
            print(f"Error: Invalid JSON: {e}", file=sys.stderr)
            return 1
        except Exception as e:
            print(f"Error: {e}", file=sys.stderr)
            return 1

    def _cmd_export(self, args) -> int:
        """Handle 'export' command."""
        try:
            tasks = self.manager.storage.export_tasks()
            with open(args.file, "w", encoding="utf-8") as f:
                json.dump(tasks, f, indent=2, ensure_ascii=False)
            print(f"✅ Exported {len(tasks)} tasks to {args.file}")
            return 0
        except IOError as e:
            print(f"Error: {e}", file=sys.stderr)
            return 1


# ============================================================================
# Interactive Mode
# ============================================================================

class InteractiveMode:
    """Interactive command-line mode."""

    PROMPT = "taskmgr> "
    COMMANDS = [
        "add", "list", "show", "update", "complete", "delete",
        "stats", "search", "categories", "subtask", "tag",
        "upcoming", "import", "export", "help", "quit", "exit"
    ]

    def __init__(self, manager: TaskManager = None):
        self.manager = manager or TaskManager()

    def run(self):
        """Run the interactive mode."""
        print("=" * 50)
        print("  Personal Task Manager - Interactive Mode")
        print("=" * 50)
        print("Type 'help' for available commands.")
        print("Type 'quit' or 'exit' to leave.\n")

        while True:
            try:
                line = input(self.PROMPT).strip()
            except (EOFError, KeyboardInterrupt):
                print("\nGoodbye!")
                break

            if not line:
                continue

            parts = line.split(maxsplit=1)
            command = parts[0].lower()
            args_str = parts[1] if len(parts) > 1 else ""

            if command in ("quit", "exit", "q"):
                print("Goodbye!")
                break
            elif command == "help":
                self._show_help()
            elif command == "add":
                self._interactive_add(args_str)
            elif command == "list":
                self._interactive_list(args_str)
            elif command == "show":
                self._interactive_show(args_str)
            elif command == "complete":
                self._interactive_complete(args_str)
            elif command == "delete":
                self._interactive_delete(args_str)
            elif command == "stats":
                self._interactive_stats()
            elif command == "search":
                self._interactive_search(args_str)
            elif command == "categories":
                self._interactive_categories()
            else:
                print(f"Unknown command: {command}. Type 'help' for available commands.")

    def _show_help(self):
        """Show help information."""
        print("""
Available Commands:
  add <title> [options]     Add a new task
  list [options]            List tasks
  show <task_id>            Show task details
  complete <task_id>        Mark task as completed
  delete <task_id>          Delete a task
  stats                     Show statistics
  search <query>            Search tasks
  categories                List categories
  help                      Show this help
  quit/exit                 Exit the program

Examples:
  add Buy groceries --category personal --priority high
  list --status todo
  show abc123
  complete abc123
  delete abc123
  search meeting
        """)

    def _interactive_add(self, args_str: str):
        """Interactive add command."""
        if not args_str:
            print("Usage: add <title> [--priority high] [--category work] [--due 2024-01-15]")
            return

        # Simple parsing
        title = args_str.split("--")[0].strip()
        if not title:
            print("Error: Title required")
            return

        priority = None
        category = "general"
        due_date = None

        if "--priority" in args_str:
            try:
                priority = Priority.from_string(args_str.split("--priority")[1].split()[0])
            except (ValueError, IndexError):
                pass

        if "--category" in args_str:
            try:
                category = args_str.split("--category")[1].split()[0]
            except IndexError:
                pass

        if "--due" in args_str:
            try:
                due_date = args_str.split("--due")[1].split()[0]
            except IndexError:
                pass

        try:
            task = self.manager.create_task(
                title=title,
                priority=priority,
                category=category,
                due_date=due_date,
            )
            print(f"✅ Task created: {task}")
        except Exception as e:
            print(f"Error: {e}")

    def _interactive_list(self, args_str: str):
        """Interactive list command."""
        status = None
        priority = None
        overdue = False

        if "--status" in args_str:
            try:
                status = Status.from_string(args_str.split("--status")[1].split()[0])
            except (ValueError, IndexError):
                pass

        if "--priority" in args_str:
            try:
                priority = Priority.from_string(args_str.split("--priority")[1].split()[0])
            except (ValueError, IndexError):
                pass

        if "--overdue" in args_str:
            overdue = True

        try:
            tasks = self.manager.list_tasks(
                status=status,
                priority=priority,
                overdue_only=overdue,
                limit=20,
            )
            if not tasks:
                print("No tasks found.")
                return

            print(f"\nTasks ({len(tasks)}):\n")
            for task in tasks:
                print(f"  {task}")
            print()
        except Exception as e:
            print(f"Error: {e}")

    def _interactive_show(self, args_str: str):
        """Interactive show command."""
        task_id = args_str.strip()
        if not task_id:
            print("Usage: show <task_id>")
            return

        try:
            task = self.manager.get_task(task_id)
            print(f"\n{task}")
            if task.description:
                print(f"  Description: {task.description}")
            if task.tags:
                print(f"  Tags: {', '.join(task.tags)}")
            print()
        except TaskManagerError as e:
            print(f"Error: {e}")

    def _interactive_complete(self, args_str: str):
        """Interactive complete command."""
        task_id = args_str.strip()
        if not task_id:
            print("Usage: complete <task_id>")
            return

        try:
            task = self.manager.update_task_status(task_id, Status.COMPLETED)
            print(f"✅ Task completed: {task}")
        except Exception as e:
            print(f"Error: {e}")

    def _interactive_delete(self, args_str: str):
        """Interactive delete command."""
        task_id = args_str.strip()
        if not task_id:
            print("Usage: delete <task_id>")
            return

        try:
            self.manager.delete_task(task_id)
            print(f"✅ Task deleted: {task_id[:6]}")
        except Exception as e:
            print(f"Error: {e}")

    def _interactive_stats(self):
        """Interactive stats command."""
        try:
            stats = self.manager.get_statistics()
            print(stats)
        except Exception as e:
            print(f"Error: {e}")

    def _interactive_search(self, args_str: str):
        """Interactive search command."""
        query = args_str.strip()
        if not query:
            print("Usage: search <query>")
            return

        try:
            tasks = self.manager.search_tasks(query)
            if not tasks:
                print(f"No tasks found matching '{query}'.")
                return

            print(f"\nResults ({len(tasks)}):\n")
            for task in tasks:
                print(f"  {task}")
            print()
        except Exception as e:
            print(f"Error: {e}")

    def _interactive_categories(self):
        """Interactive categories command."""
        try:
            cats = self.manager.list_categories()
            if not cats:
                print("No categories found.")
                return
            print("\nCategories:")
            for cat in cats:
                print(f"  {cat.icon or ''} {cat.name:15s} - {cat.description or '(no description)'}")
            print()
        except Exception as e:
            print(f"Error: {e}")


# ============================================================================
# Main Entry Point
# ============================================================================

def main():
    """Main entry point."""
    # Check for interactive mode flag
    if "--interactive" in sys.argv or "-i" in sys.argv:
        interactive = InteractiveMode()
        interactive.run()
        return

    # Otherwise, use CLI mode
    cli = CLI()
    exit_code = cli.run()
    sys.exit(exit_code)


if __name__ == "__main__":
    main()