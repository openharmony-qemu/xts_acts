'use static';
/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { additionDelay, printArgs } from './taskPoolCommon';

async function executeTask(taskName: string): Promise<string> {
  let task: taskpool.Task = new taskpool.Task(taskName + ' task', printArgs, taskName);
  return await taskpool.execute(task) as string;
}

async function executeTaskGroup(taskName: string): Promise<string> {
  let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
  let task: taskpool.Task = new taskpool.Task(taskName + ' taskGroup', printArgs, taskName);
  taskGroup.addTask(task);
  await taskpool.execute(taskGroup);
  return taskName;
}

async function executeDelayed(taskName: string): Promise<string> {
  let task: taskpool.Task = new taskpool.Task(taskName + ' executeDelayed', printArgs, taskName);
  return await taskpool.executeDelayed(100, task) as string;
}

async function executePeriodically(taskName: string): Promise<string> {
  let task: taskpool.Task = new taskpool.Task(taskName + ' executePeriodically', printArgs, taskName);
  try {
    taskpool.executePeriodically(-1, task);
  } catch (error) {
    if (error.code === 10200096) {
      return taskName;
    }
    return '';
  }
  taskpool.cancel(task);
  return '';
}

async function executeSequenceRunner(taskName: string): Promise<string> {
  let task1: taskpool.Task = new taskpool.Task(taskName + ' runner1', printArgs, taskName + ' task1');
  let task2: taskpool.Task = new taskpool.Task(taskName + ' runner2', printArgs, taskName + ' task2');
  let task3: taskpool.Task = new taskpool.Task(taskName + ' runner3', printArgs, taskName + ' task3');
  let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
  await runner.execute(task1);
  await runner.execute(task2);
  await runner.execute(task3);
  return taskName;
}

async function executeLongTask(taskName: string): Promise<string> {
  let task: taskpool.LongTask = new taskpool.LongTask(taskName + ' longTask', additionDelay, 100.0);
  await taskpool.execute(task);
  taskpool.terminateTask(task);
  return taskName;
}

export {
  executeTask,
  executeTaskGroup,
  executeDelayed,
  executePeriodically,
  executeSequenceRunner,
  executeLongTask
}
