/**
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { taskpool } from '@kit.ArkTS';
import { asyncSleep } from '../test/exportFunclist';
import { level3Task } from './TimeoutFuncList';

@Concurrent
export function timeoutDemo2 (time: number) {
  let start = Date.now();
  while (Date.now() - start < time) {
    continue;
  }
  return time;
}

@Concurrent
export async function demoSenddata(time: number) {
  let start = Date.now();
  let count = 1;
  while (Date.now() - start < time) {
    taskpool.Task.sendData(count);
    count++;
    await asyncSleep(100);
  }
}

@Concurrent
export function taskFunc(task: taskpool.Task) {
  return task;
}
@Concurrent
export function taskError2(time: number) {
  let start = Date.now();
  while (Date.now() - start < time) {
    continue;
  }
  throw new Error('task error');
}

@Concurrent
export async function level2Task(): Promise<number> {
  return await taskpool.execute(new taskpool.Task(level3Task), {timeout: 2000}) as number;
}

