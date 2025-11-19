/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { check } from './utils';
import { createUint32Array, indexSetter } from './TaskPoolTestImport';

// TESTS IMPLEMENTATION //

export function testHappyPath() {
  let p = taskpool.execute(testHappyPathImpl)
  return check('testHappyPath', p);
}

export function testHappyPathCombined() {
  let p = taskpool.execute(testHappyPathImplCombined)
  return check('testHappyPathCombined', p);
}



async function testHappyPathImpl(): Promise<string> {
  let sab = createUint32Array(3);
  let task1 = new taskpool.Task(indexSetter, sab, Number(1));
  let task2 = new taskpool.Task(indexSetter, sab, Number(2));
  let group: taskpool.TaskGroup = new taskpool.TaskGroup();
  group.addTask(task1);
  group.addTask(task2);
  let task: Promise<Any> = taskpool.execute(group, taskpool.Priority.HIGH);

  await (task);
  let res1: number = sab[1];
  let res2: number = sab[2];
  if (1 == res1 && 2 == res2) {
    return 'Test passed';
  }
  throw new Error('Test failed Expected ' + '1 and 2' + ', but was ' + res1 + ' and ' + res2);
}


async function testHappyPathImplCombined(): Promise<string> {
  let sab = createUint32Array(3);

  let group: taskpool.TaskGroup = new taskpool.TaskGroup();
  group.addTask(new taskpool.Task(indexSetter, sab, Number(1)));
  group.addTask(indexSetter, sab, Number(2));
  let task: Promise<Any> = taskpool.execute(group, taskpool.Priority.HIGH);
  await (task);
  let res1: number = sab[1];
  let res2: number = sab[2];
  if (1 != res1 || 2 != res2) {
    throw new Error('Test failed Expected ' + '1 and 2' + ', but was ' + res1 + ' and ' + res2);
  }
  return 'Test passed';
}

export function testRepeats() {
  let p = taskpool.execute(testRepeatsImpl)
  return check('testRepeats', p);
}


async function testRepeatsImpl(): Promise<string> {
  let repeats: number = 10;
  let size: number = repeats + 3;
  let sab = createUint32Array(size);

  let group: taskpool.TaskGroup = new taskpool.TaskGroup();
  for (let idx: number = 0; idx < repeats; idx++) {
    let task = new taskpool.Task(indexSetter, sab, idx);
    group.addTask(task);
  }

  let p: Promise<Any> = taskpool.execute(group);

  await (p);

  for (let idx = 0; idx < repeats; idx++) {
    let res: number = sab[idx];
    if (idx != res) {
      throw new Error('Test failed Expected at index ' + idx + ' value ' + idx + ', but was ' + res);
    }
  }
  return 'Test passed';
}
