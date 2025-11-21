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
import { createUint32Array, indexSetter, indexSetterWithTimeout } from './TaskPoolTestImport';
import { taskpoolExecuteChained } from './TaskPoolTestImport2';

// TESTS IMPLEMENTATION //

export function testHappyPath() {
  let p = taskpool.execute(testHappyPathImpl)
  return check('testHappyPath', p);
}


async function testHappyPathImpl(): Promise<string> {
  let sab = createUint32Array(3);
  let task1 = new taskpool.Task(indexSetter, sab, Number(1));
  let task: Promise<Any> = taskpool.execute(task1, taskpool.Priority.HIGH);

  let res: Any = await (task);
  if (1 == (res as Uint32Array)[1]) {
    return 'Test passed';
  }
  throw new Error('Test failed Expected ' + 1 + ', but was ' + (res as Uint32Array)[1]);
}

export function testTwoTasks() {
  let p = taskpool.execute(testTwoTasksImpl)
  return check('testTwoTasks', p);
}

async function testTwoTasksImpl(): Promise<string> {
  let sab = createUint32Array(3);
  let task1 = new taskpool.Task(indexSetter, sab, Number(1));
  let task2 = new taskpool.Task(indexSetter, sab, Number(2));
  let task: Promise<Any> = taskpool.execute(task1);
  let taskNext: Promise<Any> = taskpool.execute(task2);

  await (task);
  let res: Any = await (taskNext);
  if (1 == ((res as Uint32Array)[1] as number) && 2 == ((res as Uint32Array)[2] as number)) {
    return 'Test passed';
  }
  throw new Error('Test failed Expected ' + '1, 2' + ', but was ' + (res as Uint32Array)[1] + ', ' + (res as Uint32Array)[2]);
}

export function testManyTasks() {
  let p = taskpool.execute(testManyTasksImpl)
  return check('testManyTasks', p);
}

async function testManyTasksImpl(): Promise<string> {
  let stressCount: number = 10;
  let size: number = stressCount + 3;
  let sab = createUint32Array(size);
  let res: Any;
  for (let idx: number = 0; idx < stressCount; idx++) {
    let taskCurr: Any = new taskpool.Task(indexSetter, sab, idx);
    let promiseCurr: Promise<Any> = taskpool.execute(taskCurr);
    res = await (promiseCurr);
  }
  for (let idx = 0; idx < stressCount; idx++) {
    if (idx != (((res as Uint32Array)[idx]) as number)) {
      throw new Error('Test failed Expected at index ' + idx + ' value ' + idx + ', but was ' + (res as Uint32Array)[idx]);
    }
  }
  return 'Test passed';
}

export function testTwoTasksChained() {
  let p = testTwoTasksChainedImpl();
  return check('testTwoTasksChained', p);
}

async function testTwoTasksChainedImpl(): Promise<string> {
  let sab = createUint32Array(3);
  let taskCurr: Any = new taskpool.Task(taskpoolExecuteChained, sab, Number(0), Number(2));
  let promiseCurr: Promise<Any> = taskpool.execute(taskCurr);
  await (promiseCurr);
  for (let idx = 0; idx < 2; idx++) {
    let res:number = sab[idx]
    if (idx != res) {
      throw new Error('Test failed Expected at index ' + idx + ' value ' + idx + ', but was ' + res);
    }
  }
  return 'Test passed';
}

export function testManyTasksChained() {
  let p = testManyTasksChainedImpl()
  return check('testManyTasksChained', p);
}

async function testManyTasksChainedImpl(): Promise<string> {
  let stressCount: number = 10;
  let size: number = stressCount + 3;
  let sab = createUint32Array(size);
  let taskCurr = new taskpool.Task(taskpoolExecuteChained, sab, Number(0), stressCount);
  let promiseCurr: Promise<Any> = taskpool.execute(taskCurr);
  await (promiseCurr);
  for (let idx = 0; idx < stressCount; idx++) {
    let res:number = sab[idx]
    if (idx != res) {
      throw new Error('Test failed Expected at index ' + idx + ' value ' + idx + ', but was ' + res);
    }
  }
  return 'Test passed';
}

export function testUnder3Minutes() {
  let p = taskpool.execute(testUnder3MinutesImpl)
  return check('testUnder3Minutes', p);
}


async function testUnder3MinutesImpl(): Promise<string> {
  let sab = createUint32Array(3);
  let timeout: number = 1000 * 60 * 2 + 1000 * 50;
  let task1 = new taskpool.Task(indexSetterWithTimeout, sab, 1, timeout);
  let task: Promise<Any> = taskpool.execute(task1);

  let res: Any = await (task);
  if (1 == (((res as Uint32Array)[1]) as number)) {
    return 'Test passed';
  }
  throw new Error('Test failed Expected ' + 1 + ', but was ' + ((res as Uint32Array)[1]));
}

export function testOver3Minutes() {
  let p = taskpool.execute(testOver3MinutesImpl)
  return check('testOver3Minutes', p);
}


async function testOver3MinutesImpl(): Promise<string> {
  let sab = createUint32Array(3);
  let timeout: number = 1000 * 60 * 4;
  let task1 = new taskpool.Task(indexSetterWithTimeout, sab, 1, timeout);
  let task: Promise<Any> = taskpool.execute(task1);

  let res: Any = await (task);
  if (1 == (((res as Uint32Array)[1]) as number)) {
    return 'Test passed';
  }
  throw new Error('Test failed Expected ' + 1 + ', but was ' + (res as Uint32Array)[1]);
}

export function testRepeats() {
  let p = taskpool.execute(testRepeatsImpl)
  return check('testRepeats', p);
}


async function testRepeatsImpl(): Promise<string> {
  let repeats: number = 10;
  let size: number = repeats + 3;
  let sab = createUint32Array(size);
  let res: Uint32Array = sab;

  let promises: Promise<Any>[] = [];
  for (let idx: number = 0; idx < repeats; idx++) {
    let task = new taskpool.Task(indexSetter, sab, idx);
    let promise: Promise<Any> = taskpool.execute(task);
    promises.push(promise);
  }

  await Promise.all(promises);

  for (let idx = 0; idx < repeats; idx++) {
    if (idx != ((res[idx]) as number)) {
      throw new Error('Test failed Expected at index ' + idx + ' value ' + idx + ', but was ' + res[idx]);
    }
  }
  return 'Test passed';
}
