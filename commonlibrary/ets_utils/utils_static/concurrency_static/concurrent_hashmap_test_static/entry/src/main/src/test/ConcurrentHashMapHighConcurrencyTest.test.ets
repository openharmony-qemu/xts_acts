'use static';
/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-static/src/main/indexStatic';

function setDistinctRangeTask(map: containers.ConcurrentHashMap<number, number>, start: number, count: number): number {
  for (let i: int = 0; i < count; i++) {
    map.set(start + i, start + i);
  }
  return count;
}

function setSameKeyTask(map: containers.ConcurrentHashMap<number, number>, key: number, value: number): number {
  map.set(key, value);
  return value;
}

function readRangeTask(map: containers.ConcurrentHashMap<number, number>, start: number, count: number): number {
  let reads: number = 0;
  for (let i: int = 0; i < count; i++) {
    let key: number = start + i;
    if (map.get(key) === key) {
      reads++;
    }
  }
  return reads;
}

function readExpectedValueTask(map: containers.ConcurrentHashMap<number, number>, key: number,
  expectedValue: number): number {
  return map.get(key) === expectedValue ? 1 : 0;
}

function setRangeOnlyHelper(map: containers.ConcurrentHashMap<number, number>, start: number, count: number): number {
  for (let i: int = 0; i < count; i++) {
    map.set(start + i, start + i);
  }
  return count;
}

function deleteOddRangeOnlyHelper(map: containers.ConcurrentHashMap<number, number>, start: number, count: number): number {
  let deleted: number = 0;
  for (let i: int = 0; i < count; i++) {
    let key: number = start + i;
    if (key % 2 === 1) {
      if (map.delete(key)) {
        deleted++;
      }
    }
  }
  return deleted;
}

function mixedReadTask(map: containers.ConcurrentHashMap<number, number>, count: number): number {
  let hits: number = 0;
  for (let i: int = 0; i < count; i++) {
    if (map.get(i) !== undefined && map.has(i)) {
      hits++;
    }
  }
  return hits;
}

function mixedWriteTask(map: containers.ConcurrentHashMap<number, number>, count: number): number {
  for (let i: int = 0; i < count; i++) {
    map.set(i, i + 1000);
  }
  return count;
}

function replaceSameKeyTask(map: containers.ConcurrentHashMap<number, number>, key: number, value: number): number {
  return map.replace(key, value) ? 1 : 0;
}

function cacheReadTask(map: containers.ConcurrentHashMap<number, number>, count: number): number {
  let hits: number = 0;
  for (let i: int = 0; i < count; i++) {
    if (map.get(i % 100) !== undefined) {
      hits++;
    }
  }
  return hits;
}

function cacheWriteTask(map: containers.ConcurrentHashMap<number, number>, count: number): number {
  for (let i: int = 0; i < count; i++) {
    let key: number = i % 10;
    map.set(key, 1000 + key);
  }
  return count;
}

function configReadTask(map: containers.ConcurrentHashMap<string, string>): number {
  if (map.get('timeout') !== undefined && map.get('retries') !== undefined && map.get('logLevel') !== undefined) {
    return 1;
  }
  return 0;
}

function configUpdateTask(map: containers.ConcurrentHashMap<string, string>): number {
  map.set('timeout', '10000');
  map.set('retries', '5');
  return 1;
}

function sessionLoginTask(map: containers.ConcurrentHashMap<number, number>, userId: number, sessionId: number): number {
  map.set(userId, sessionId);
  return 1;
}

function sessionLogoutTask(map: containers.ConcurrentHashMap<number, number>, userId: number): number {
  return map.delete(userId) ? 1 : 0;
}

function weakMutationTask(map: containers.ConcurrentHashMap<number, number>, mode: number, start: AtomicInt,
  finish: AtomicInt): number {
  taskpool.Task.sendData(1.0);
  while (start.load() === 0) {
  }
  if (mode === 1) {
    for (let i: int = 100; i < 200; i++) {
      map.set(i, i);
    }
    finish.store(100);
    return 100;
  }
  if (mode === 2) {
    let deleted: number = 0;
    for (let i: int = 0; i < 50; i++) {
      if (map.delete(i)) {
        deleted++;
      }
    }
    finish.store(1);
    return deleted;
  }
  if (mode === 3) {
    map.clear();
    finish.store(1);
    return 1;
  }
  let replaced: number = 0;
  for (let i: int = 0; i < 100; i++) {
    if (map.replace(i, i + 1000)) {
      replaced++;
    }
  }
  finish.store(1);
  return replaced;
}

function nestedSignalTask(level: number): void {
  taskpool.Task.sendData(level);
}

async function runNestedTaskLevel(map: containers.ConcurrentHashMap<number, number>, level: number,
  depth: number): Promise<void> {
  let task: taskpool.Task = new taskpool.Task(nestedSignalTask, level);
  let callbackDone: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
    task.onReceiveData(async (receivedLevel: number): Promise<void> => {
      map.set(receivedLevel, receivedLevel * 10);
      if (receivedLevel < depth) {
        await runNestedTaskLevel(map, receivedLevel + 1, depth);
      }
      resolve(undefined);
    });
  });
  await taskpool.execute(task);
  await callbackDone;
}

function fullInterfaceIsolatedTask(map: containers.ConcurrentHashMap<number, number>): number {
  let passed: boolean = true;
  map.set(1, 10);
  if (map.size !== 1 || !map.has(1) || map.get(1) !== 10) {
    passed = false;
  }
  if (!map.replace(1, 20) || map.get(1) !== 20) {
    passed = false;
  }
  let removed: number | undefined = map.remove(1);
  if (removed !== 20 || !map.isEmpty()) {
    passed = false;
  }
  map.set(2, 2);
  if (!map.delete(2)) {
    passed = false;
  }
  map.set(3, 3);
  map.set(4, 4);
  let keyCount: number = 0;
  let keys: IterableIterator<number> = map.keys();
  let keyResult: IteratorResult<number> = keys.next();
  while (!keyResult.done) {
    keyCount++;
    keyResult = keys.next();
  }
  let valueCount: number = 0;
  let values: IterableIterator<number> = map.values();
  let valueResult: IteratorResult<number> = values.next();
  while (!valueResult.done) {
    valueCount++;
    valueResult = values.next();
  }
  let entryCount: number = 0;
  let entries: IterableIterator<[number, number]> = map.entries();
  let entryResult: IteratorResult<[number, number]> = entries.next();
  while (!entryResult.done) {
    entryCount++;
    entryResult = entries.next();
  }
  let visited: number = 0;
  map.forEach((value: number, key: number): void => {
    if ((key === 3 && value === 3) || (key === 4 && value === 4)) {
      visited++;
    }
  });
  if (keyCount !== 2 || valueCount !== 2 || entryCount !== 2 || visited !== 2 || map.toString().length === 0) {
    passed = false;
  }
  map.clear();
  if (!map.isEmpty() || map.size !== 0) {
    passed = false;
  }
  return passed ? 1 : 0;
}

function fullConcurrentOps(map: containers.ConcurrentHashMap<number, number>, worker: number): number {
  let base: number = worker * 3;
  let stableKey: number = base + 2;
  map.set(base, base);
  if (!map.has(base) || map.get(base) !== base) {
    return -1;
  }
  if (!map.replace(base, base + 10) || map.get(base) !== base + 10) {
    return -2;
  }
  if (map.remove(base) !== base + 10 || map.has(base)) {
    return -3;
  }
  map.set(base + 1, base + 1);
  if (!map.delete(base + 1) || map.has(base + 1)) {
    return -4;
  }
  map.set(stableKey, stableKey);
  if (map.get(stableKey) !== stableKey) {
    return -5;
  }
  let keys: IterableIterator<number> = map.keys();
  let keyResult: IteratorResult<number> = keys.next();
  while (!keyResult.done) {
    keyResult = keys.next();
  }
  let values: IterableIterator<number> = map.values();
  let valueResult: IteratorResult<number> = values.next();
  while (!valueResult.done) {
    valueResult = values.next();
  }
  let entries: IterableIterator<[number, number]> = map.entries();
  let entryResult: IteratorResult<[number, number]> = entries.next();
  while (!entryResult.done) {
    entryResult = entries.next();
  }
  map.forEach((_value: number, _key: number): void => {
  });
  map.isEmpty();
  map.size;
  map.toString();
  return 1;
}

function prepareFullInterfaceMap(map: containers.ConcurrentHashMap<number, number>, workers: number): void {
  for (let worker: int = 0; worker <= workers; worker++) {
    let base: number = worker * 3;
    map.set(base, base);
    map.set(base + 1, base + 1);
    map.set(base + 2, base + 2);
  }
}

function fullConcurrentTask(map: containers.ConcurrentHashMap<number, number>, worker: number, start: AtomicInt,
  signalReady: boolean): number {
  if (signalReady) {
    taskpool.Task.sendData(1.0);
  }
  while (start.load() === 0) {
  }
  return fullConcurrentOps(map, worker);
}

function iterateModifyOps(map: containers.ConcurrentHashMap<number, number>, worker: number): number {
  let base: number = worker * 100;
  let keyHits: number = 0;
  let keyIter: IterableIterator<number> = map.keys();
  let keyResult: IteratorResult<number> = keyIter.next();
  while (!keyResult.done) {
    let keyValue: number | undefined = keyResult.value;
    if (keyValue !== undefined) {
      if (keyValue >= base && keyValue < base + 10) {
        keyHits++;
      }
    }
    keyResult = keyIter.next();
  }
  let entryHits: number = 0;
  let entryIter: IterableIterator<[number, number]> = map.entries();
  let entryResult: IteratorResult<[number, number]> = entryIter.next();
  while (!entryResult.done) {
    let entryValue: [number, number] | undefined = entryResult.value;
    if (entryValue !== undefined) {
      if (entryValue[0] >= base && entryValue[0] < base + 10) {
        entryHits++;
      }
    }
    entryResult = entryIter.next();
  }
  let forEachHits: number = 0;
  map.forEach((value: number, key: number): void => {
    if (key >= base && key < base + 10 && value === key) {
      forEachHits++;
    }
  });
  let changed: number = 0;
  for (let i: int = 0; i < 5; i++) {
    if (map.replace(base + i, base + i + 1000)) {
      changed++;
    }
  }
  for (let i: int = 5; i < 10; i++) {
    if (map.delete(base + i)) {
      changed++;
    }
  }
  return keyHits === 10 && entryHits === 10 && forEachHits === 10 && changed === 10 ? 1 : 0;
}

function iterateModifyTask(map: containers.ConcurrentHashMap<number, number>, worker: number, start: AtomicInt,
  signalReady: boolean): number {
  if (signalReady) {
    taskpool.Task.sendData(1.0);
  }
  while (start.load() === 0) {
  }
  return iterateModifyOps(map, worker);
}

async function runDistinctCase(workers: number, perWorker: number): Promise<number> {
  let map: containers.ConcurrentHashMap<number, number> = new containers.ConcurrentHashMap<number, number>();
  let tasks: Promise<Any>[] = [];
  for (let i: int = 0; i < workers; i++) {
    tasks.push(taskpool.execute(setDistinctRangeTask, map, i * perWorker, perWorker));
  }
  await Promise.all(tasks);
  expect(map.size).assertEqual(workers * perWorker);
  expect(map.has(0)).assertTrue();
  expect(map.has(workers * perWorker - 1)).assertTrue();
  return map.size;
}

async function runSameKeyCase(workers: number): Promise<number> {
  let map: containers.ConcurrentHashMap<number, number> = new containers.ConcurrentHashMap<number, number>();
  let tasks: Promise<Any>[] = [];
  for (let i: int = 0; i < workers; i++) {
    tasks.push(taskpool.execute(setSameKeyTask, map, 7.0, i * 1.0));
  }
  await Promise.all(tasks);
  expect(map.size).assertEqual(1);
  expect(map.has(7)).assertTrue();
  let value: number | undefined = map.get(7);
  expect(value !== undefined).assertTrue();
  if (value !== undefined) {
    expect(value >= 0 && value < workers).assertTrue();
  }
  return map.size;
}

async function runScaleCase(total: number): Promise<number> {
  let map: containers.ConcurrentHashMap<number, number> = new containers.ConcurrentHashMap<number, number>();
  let workers: number = total >= 100 ? 10.0 : (total >= 10 ? 2.0 : 1.0);
  let perWorker: number = total / workers;
  let tasks: Promise<Any>[] = [];
  for (let i: int = 0; i < workers; i++) {
    tasks.push(taskpool.execute(setDistinctRangeTask, map, i * perWorker, perWorker));
  }
  await Promise.all(tasks);
  expect(map.size).assertEqual(total);
  expect(map.get(total - 1)).assertEqual(total - 1);
  return map.size;
}

async function runConcurrentFullInterfaceCase(workers: number): Promise<number> {
  let map: containers.ConcurrentHashMap<number, number> = new containers.ConcurrentHashMap<number, number>();
  prepareFullInterfaceMap(map, workers);
  let start: AtomicInt = new AtomicInt(0);
  let tasks: Promise<Any>[] = [];
  let firstReady: Promise<void> | undefined = undefined;
  for (let i: int = 0; i < workers; i++) {
    let signalReady: boolean = i === 0;
    let task: taskpool.Task = new taskpool.Task(fullConcurrentTask, map, i * 1.0, start, signalReady);
    if (signalReady) {
      firstReady = new Promise<void>((resolve: (value: void) => void): void => {
        task.onReceiveData((signal: number): void => {
          if (signal === 1) {
            resolve(undefined);
          }
        });
      });
    }
    tasks.push(taskpool.execute(task));
  }
  if (firstReady !== undefined) {
    await firstReady;
  }
  start.store(1);
  let mainResult: number = fullConcurrentOps(map, workers);
  let results: Any[] = await Promise.all(tasks);
  expect(mainResult).assertEqual(1);
  for (let i: int = 0; i < results.length; i++) {
    expect(results[i] as number).assertEqual(1);
  }
  let stableCount: number = 0;
  for (let i: int = 0; i <= workers; i++) {
    let base: number = i * 3;
    let stableKey: number = base + 2;
    expect(map.get(stableKey)).assertEqual(stableKey);
    expect(map.has(base)).assertFalse();
    expect(map.has(base + 1)).assertFalse();
    stableCount++;
  }
  expect(stableCount).assertEqual(workers + 1);
  expect(map.size).assertEqual(workers + 1);
  map.clear();
  expect(map.isEmpty()).assertTrue();
  expect(map.size).assertEqual(0);
  return stableCount;
}

async function runMultiMapFullInterfaceCase(workers: number): Promise<number> {
  let maps: containers.ConcurrentHashMap<number, number>[] = [
    new containers.ConcurrentHashMap<number, number>(),
    new containers.ConcurrentHashMap<number, number>(),
    new containers.ConcurrentHashMap<number, number>()
  ];
  for (let mapIndex: int = 0; mapIndex < maps.length; mapIndex++) {
    prepareFullInterfaceMap(maps[mapIndex], workers);
  }
  let start: AtomicInt = new AtomicInt(0);
  let tasks: Promise<Any>[] = [];
  let firstReady: Promise<void> | undefined = undefined;
  for (let mapIndex: int = 0; mapIndex < maps.length; mapIndex++) {
    for (let worker: int = 0; worker < workers; worker++) {
      let signalReady: boolean = mapIndex === 0 && worker === 0;
      let task: taskpool.Task = new taskpool.Task(fullConcurrentTask, maps[mapIndex], worker * 1.0, start, signalReady);
      if (signalReady) {
        firstReady = new Promise<void>((resolve: (value: void) => void): void => {
          task.onReceiveData((signal: number): void => {
            if (signal === 1) {
              resolve(undefined);
            }
          });
        });
      }
      tasks.push(taskpool.execute(task));
    }
  }
  if (firstReady !== undefined) {
    await firstReady;
  }
  start.store(1);
  let mainResults: number[] = [];
  for (let mapIndex: int = 0; mapIndex < maps.length; mapIndex++) {
    mainResults.push(fullConcurrentOps(maps[mapIndex], workers));
  }
  let results: Any[] = await Promise.all(tasks);
  for (let i: int = 0; i < mainResults.length; i++) {
    expect(mainResults[i]).assertEqual(1);
    let stableCount: number = 0;
    for (let worker: int = 0; worker <= workers; worker++) {
      let base: number = worker * 3;
      let stableKey: number = base + 2;
      expect(maps[i].get(stableKey)).assertEqual(stableKey);
      expect(maps[i].has(base)).assertFalse();
      expect(maps[i].has(base + 1)).assertFalse();
      stableCount++;
    }
    expect(stableCount).assertEqual(workers + 1);
    expect(maps[i].size).assertEqual(workers + 1);
  }
  for (let i: int = 0; i < results.length; i++) {
    expect(results[i] as number).assertEqual(1);
  }
  return maps.length;
}

async function runIterateModifyCase(workers: number): Promise<number> {
  let map: containers.ConcurrentHashMap<number, number> = new containers.ConcurrentHashMap<number, number>();
  for (let worker: int = 0; worker <= workers; worker++) {
    let base: number = worker * 100;
    for (let i: int = 0; i < 10; i++) {
      map.set(base + i, base + i);
    }
  }
  let start: AtomicInt = new AtomicInt(0);
  let tasks: Promise<Any>[] = [];
  let firstReady: Promise<void> | undefined = undefined;
  for (let i: int = 0; i < workers; i++) {
    let signalReady: boolean = i === 0;
    let task: taskpool.Task = new taskpool.Task(iterateModifyTask, map, i * 1.0, start, signalReady);
    if (signalReady) {
      firstReady = new Promise<void>((resolve: (value: void) => void): void => {
        task.onReceiveData((signal: number): void => {
          if (signal === 1) {
            resolve(undefined);
          }
        });
      });
    }
    tasks.push(taskpool.execute(task));
  }
  if (firstReady !== undefined) {
    await firstReady;
  }
  start.store(1);
  let mainResult: number = iterateModifyOps(map, workers);
  let results: Any[] = await Promise.all(tasks);
  expect(mainResult).assertEqual(1);
  for (let i: int = 0; i < results.length; i++) {
    expect(results[i] as number).assertEqual(1);
  }
  expect(map.size).assertEqual((workers + 1) * 5);
  for (let worker: int = 0; worker <= workers; worker++) {
    let base: number = worker * 100;
    for (let i: int = 0; i < 5; i++) {
      expect(map.get(base + i)).assertEqual(base + i + 1000);
    }
    for (let i: int = 5; i < 10; i++) {
      expect(map.has(base + i)).assertFalse();
    }
  }
  return map.size;
}

export default function ConcurrentHashMapHighConcurrencyTest(): void {
  describe('ConcurrentHashMapHighConcurrencyTest', (): void => {
    beforeAll((): void => {});
    beforeEach((): void => {});
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_0100
     * @tc.desc   Verify 1 TaskPool workers concurrently write distinct keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let size: number = await runDistinctCase(1, 1);
          expect(size).assertEqual(1);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_0200
     * @tc.desc   Verify 3 TaskPool workers concurrently write distinct keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let size: number = await runDistinctCase(3, 1);
          expect(size).assertEqual(3);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_0300
     * @tc.desc   Verify 5 TaskPool workers concurrently write distinct keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let size: number = await runDistinctCase(5, 1);
          expect(size).assertEqual(5);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_0400
     * @tc.desc   Verify 10 TaskPool workers concurrently write distinct keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let size: number = await runDistinctCase(10, 1);
          expect(size).assertEqual(10);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_0500
     * @tc.desc   Verify 50 TaskPool workers concurrently write distinct keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let size: number = await runDistinctCase(50, 1);
          expect(size).assertEqual(50);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_0600
     * @tc.desc   Verify 100 TaskPool workers concurrently write distinct keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let size: number = await runDistinctCase(100, 1);
          expect(size).assertEqual(100);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_0700
     * @tc.desc   Verify 100 TaskPool workers concurrently update the same key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let size: number = await runSameKeyCase(100);
          expect(size).assertEqual(1);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_0800
     * @tc.desc   Verify 3 TaskPool workers concurrently update the same key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let size: number = await runSameKeyCase(3);
          expect(size).assertEqual(1);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_0900
     * @tc.desc   Verify 5 TaskPool workers concurrently update the same key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let size: number = await runSameKeyCase(5);
          expect(size).assertEqual(1);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_1000
     * @tc.desc   Verify 10 TaskPool workers concurrently update the same key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let size: number = await runSameKeyCase(10);
          expect(size).assertEqual(1);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_1100
     * @tc.desc   Verify 50 TaskPool workers concurrently update the same key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let size: number = await runSameKeyCase(50);
          expect(size).assertEqual(1);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_1200
     * @tc.desc   Verify concurrent pure reads return every preloaded value unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let map: containers.ConcurrentHashMap<number, number> = new containers.ConcurrentHashMap<number, number>();
          for (let i: int = 0; i < 100; i++) {
            map.set(i, i);
          }
          let tasks: Promise<Any>[] = [];
          for (let i: int = 0; i < 10; i++) {
            tasks.push(taskpool.execute(readRangeTask, map, 0.0, 100.0));
          }
          let results: Any[] = await Promise.all(tasks);
          let reads: number = 0;
          for (let i: int = 0; i < results.length; i++) {
            reads += results[i] as number;
          }
          expect(reads).assertEqual(1000);
          expect(map.size).assertEqual(100);
          expect(map.get(99)).assertEqual(99.0);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_1300
     * @tc.desc   Verify concurrent set/delete writers preserve the exact retained key set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let map: containers.ConcurrentHashMap<number, number> = new containers.ConcurrentHashMap<number, number>();
          // Phase 1: all 10 set tasks run concurrently
          let setPromises: Promise<Any>[] = [];
          for (let i: int = 0; i < 10; i++) {
            setPromises.push(taskpool.execute(new taskpool.Task(setRangeOnlyHelper, map, i * 10.0, 10.0)));
          }
          let setResults: Any[] = await Promise.all(setPromises);
          let setCount: number = 0;
          for (let i: int = 0; i < setResults.length; i++) {
            setCount += setResults[i] as number;
          }
          expect(setCount).assertEqual(100);
          expect(map.size).assertEqual(100);
          // Phase 2: all 10 delete tasks run concurrently against the fully populated map
          let deletePromises: Promise<Any>[] = [];
          for (let i: int = 0; i < 10; i++) {
            deletePromises.push(taskpool.execute(new taskpool.Task(deleteOddRangeOnlyHelper, map, i * 10.0, 10.0)));
          }
          let deleteResults: Any[] = await Promise.all(deletePromises);
          let deleted: number = 0;
          for (let i: int = 0; i < deleteResults.length; i++) {
            deleted += deleteResults[i] as number;
          }
          expect(deleted).assertEqual(50);
          expect(map.size).assertEqual(50);
          expect(map.has(0)).assertTrue();
          expect(map.has(1)).assertFalse();
          expect(map.has(98)).assertTrue();
          expect(map.has(99)).assertFalse();
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_1400
     * @tc.desc   Verify reader and writer TaskPool tasks concurrently access the same key range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let map: containers.ConcurrentHashMap<number, number> = new containers.ConcurrentHashMap<number, number>();
          for (let i: int = 0; i < 100; i++) {
            map.set(i, i);
          }
          let tasks: Promise<Any>[] = [];
          for (let i: int = 0; i < 10; i++) {
            tasks.push(taskpool.execute(mixedReadTask, map, 100.0));
          }
          for (let i: int = 0; i < 10; i++) {
            tasks.push(taskpool.execute(mixedWriteTask, map, 100.0));
          }
          let results: Any[] = await Promise.all(tasks);
          let operationCount: number = 0;
          for (let i: int = 0; i < results.length; i++) {
            operationCount += results[i] as number;
          }
          expect(operationCount).assertEqual(2000);
          expect(map.size).assertEqual(100);
          expect(map.get(0)).assertEqual(1000.0);
          expect(map.get(99)).assertEqual(1099.0);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_1500
     * @tc.desc   Verify concurrent writers racing on one key keep one legal final value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let size: number = await runSameKeyCase(20);
          expect(size).assertEqual(1);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_1600
     * @tc.desc   Verify concurrent readers of one key all observe the same preloaded value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let map: containers.ConcurrentHashMap<number, number> = new containers.ConcurrentHashMap<number, number>();
          map.set(77, 707);
          let tasks: Promise<Any>[] = [];
          for (let i: int = 0; i < 50; i++) {
            tasks.push(taskpool.execute(readExpectedValueTask, map, 77.0, 707.0));
          }
          let results: Any[] = await Promise.all(tasks);
          let reads: number = 0;
          for (let i: int = 0; i < results.length; i++) {
            reads += results[i] as number;
          }
          expect(reads).assertEqual(50);
          expect(map.get(77)).assertEqual(707.0);
          expect(map.size).assertEqual(1);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_1700
     * @tc.desc   Verify concurrent replace operations on one key are atomic and retain one legal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let map: containers.ConcurrentHashMap<number, number> = new containers.ConcurrentHashMap<number, number>();
          map.set(88, 0);
          let tasks: Promise<Any>[] = [];
          for (let i: int = 0; i < 10; i++) {
            tasks.push(taskpool.execute(replaceSameKeyTask, map, 88.0, (i + 1) * 1.0));
          }
          let results: Any[] = await Promise.all(tasks);
          let replaced: number = 0;
          for (let i: int = 0; i < results.length; i++) {
            replaced += results[i] as number;
          }
          let value: number | undefined = map.get(88);
          expect(replaced).assertEqual(10);
          expect(map.size).assertEqual(1);
          expect(value !== undefined).assertTrue();
          if (value !== undefined) {
            expect(value >= 1 && value <= 10).assertTrue();
          }
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_1800
     * @tc.desc   Verify one TaskPool nesting level writes the shared map and completes without polling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let map: containers.ConcurrentHashMap<number, number> = new containers.ConcurrentHashMap<number, number>();
          await runNestedTaskLevel(map, 1, 1);
          expect(map.size).assertEqual(1);
          expect(map.get(1)).assertEqual(10.0);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_1900
     * @tc.desc   Verify two TaskPool nesting levels complete through Promise-backed receive callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let map: containers.ConcurrentHashMap<number, number> = new containers.ConcurrentHashMap<number, number>();
          await runNestedTaskLevel(map, 1, 2);
          expect(map.size).assertEqual(2);
          expect(map.get(1)).assertEqual(10.0);
          expect(map.get(2)).assertEqual(20.0);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_2000
     * @tc.desc   Verify three TaskPool nesting levels complete through explicit Promise completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let map: containers.ConcurrentHashMap<number, number> = new containers.ConcurrentHashMap<number, number>();
          await runNestedTaskLevel(map, 1, 3);
          expect(map.size).assertEqual(3);
          expect(map.get(3)).assertEqual(30.0);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_2100
     * @tc.desc   Verify five TaskPool nesting levels reach the deepest task without timer polling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let map: containers.ConcurrentHashMap<number, number> = new containers.ConcurrentHashMap<number, number>();
          await runNestedTaskLevel(map, 1, 5);
          expect(map.size).assertEqual(5);
          for (let i: int = 1; i <= 5; i++) {
            expect(map.get(i)).assertEqual(i * 10.0);
          }
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_2200
     * @tc.desc   Verify ConcurrentHashMap data scale 1 with TaskPool writers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let size: number = await runScaleCase(1);
          expect(size).assertEqual(1);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_2300
     * @tc.desc   Verify ConcurrentHashMap data scale 10 with TaskPool writers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let size: number = await runScaleCase(10);
          expect(size).assertEqual(10);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_2400
     * @tc.desc   Verify ConcurrentHashMap data scale 100 with TaskPool writers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let size: number = await runScaleCase(100);
          expect(size).assertEqual(100);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_2500
     * @tc.desc   Verify ConcurrentHashMap data scale 1000 with TaskPool writers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let size: number = await runScaleCase(1000);
          expect(size).assertEqual(1000);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_2600
     * @tc.desc   Verify ConcurrentHashMap data scale 10000 with TaskPool writers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let size: number = await runScaleCase(10000);
          expect(size).assertEqual(10000);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_2800
     * @tc.desc   Verify cache workload completes exactly 90 reads and 10 writes while preserving 100 entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let cache: containers.ConcurrentHashMap<number, number> = new containers.ConcurrentHashMap<number, number>();
          for (let i: int = 0; i < 100; i++) {
            cache.set(i, i);
          }
          let tasks: Promise<Any>[] = [];
          for (let i: int = 0; i < 9; i++) {
            tasks.push(taskpool.execute(cacheReadTask, cache, 10.0));
          }
          tasks.push(taskpool.execute(cacheWriteTask, cache, 10.0));
          let results: Any[] = await Promise.all(tasks);
          let reads: number = 0;
          for (let i: int = 0; i < 9; i++) {
            reads += results[i] as number;
          }
          expect(reads).assertEqual(90);
          expect(results[9] as number).assertEqual(10);
          expect(cache.size).assertEqual(100);
          expect(cache.get(0)).assertEqual(1000.0);
          expect(cache.get(9)).assertEqual(1009.0);
          expect(cache.get(99)).assertEqual(99.0);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_2900
     * @tc.desc   Verify cache workload completes exactly 50 reads and 50 writes while preserving 100 entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let cache: containers.ConcurrentHashMap<number, number> = new containers.ConcurrentHashMap<number, number>();
          for (let i: int = 0; i < 100; i++) {
            cache.set(i, i);
          }
          let tasks: Promise<Any>[] = [];
          for (let i: int = 0; i < 5; i++) {
            tasks.push(taskpool.execute(cacheReadTask, cache, 10.0));
          }
          for (let i: int = 0; i < 5; i++) {
            tasks.push(taskpool.execute(cacheWriteTask, cache, 10.0));
          }
          let results: Any[] = await Promise.all(tasks);
          let reads: number = 0;
          let writes: number = 0;
          for (let i: int = 0; i < 5; i++) {
            reads += results[i] as number;
          }
          for (let i: int = 5; i < 10; i++) {
            writes += results[i] as number;
          }
          expect(reads).assertEqual(50);
          expect(writes).assertEqual(50);
          expect(cache.size).assertEqual(100);
          expect(cache.get(0)).assertEqual(1000.0);
          expect(cache.get(9)).assertEqual(1009.0);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_3000
     * @tc.desc   Verify 50 configuration readers and 5 updaters preserve three keys and exact final values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let config: containers.ConcurrentHashMap<string, string> = new containers.ConcurrentHashMap<string, string>();
          config.set('timeout', '5000');
          config.set('retries', '3');
          config.set('logLevel', 'INFO');
          let tasks: Promise<Any>[] = [];
          for (let i: int = 0; i < 50; i++) {
            tasks.push(taskpool.execute(configReadTask, config));
          }
          for (let i: int = 0; i < 5; i++) {
            tasks.push(taskpool.execute(configUpdateTask, config));
          }
          let results: Any[] = await Promise.all(tasks);
          let reads: number = 0;
          let updates: number = 0;
          for (let i: int = 0; i < 50; i++) {
            reads += results[i] as number;
          }
          for (let i: int = 50; i < 55; i++) {
            updates += results[i] as number;
          }
          expect(reads).assertEqual(50);
          expect(updates).assertEqual(5);
          expect(config.size).assertEqual(3);
          expect(config.get('timeout')).assertEqual('10000');
          expect(config.get('retries')).assertEqual('5');
          expect(config.get('logLevel')).assertEqual('INFO');
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_3100
     * @tc.desc   Verify 50 concurrent logout tasks delete the intended half of 100 sessions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let sessions: containers.ConcurrentHashMap<number, number> = new containers.ConcurrentHashMap<number, number>();
          for (let i: int = 0; i < 100; i++) {
            sessions.set(2000 + i, 10000 + i);
          }
          let tasks: Promise<Any>[] = [];
          for (let i: int = 0; i < 50; i++) {
            tasks.push(taskpool.execute(sessionLogoutTask, sessions, 2000.0 + i));
          }
          let results: Any[] = await Promise.all(tasks);
          let deleted: number = 0;
          for (let i: int = 0; i < results.length; i++) {
            deleted += results[i] as number;
          }
          expect(deleted).assertEqual(50);
          expect(sessions.size).assertEqual(50);
          expect(sessions.has(2000)).assertFalse();
          expect(sessions.has(2049)).assertFalse();
          expect(sessions.get(2050)).assertEqual(10050.0);
          expect(sessions.get(2099)).assertEqual(10099.0);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_3200
     * @tc.desc   Verify 100 concurrent login tasks preserve every user session
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let sessions: containers.ConcurrentHashMap<number, number> = new containers.ConcurrentHashMap<number, number>();
          let tasks: Promise<Any>[] = [];
          for (let i: int = 0; i < 100; i++) {
            tasks.push(taskpool.execute(sessionLoginTask, sessions, 3000.0 + i, 20000.0 + i));
          }
          let results: Any[] = await Promise.all(tasks);
          let loggedIn: number = 0;
          for (let i: int = 0; i < results.length; i++) {
            loggedIn += results[i] as number;
          }
          expect(loggedIn).assertEqual(100);
          expect(sessions.size).assertEqual(100);
          expect(sessions.get(3000)).assertEqual(20000.0);
          expect(sessions.get(3099)).assertEqual(20099.0);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_3300
     * @tc.desc   Verify an existing keys iterator observes child-appended keys after insertion completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let map: containers.ConcurrentHashMap<number, number> = new containers.ConcurrentHashMap<number, number>();
          for (let i: int = 0; i < 100; i++) {
            map.set(i, i);
          }
          let start: AtomicInt = new AtomicInt(0);
          let finish: AtomicInt = new AtomicInt(0);
          let task: taskpool.Task = new taskpool.Task(weakMutationTask, map, 1.0, start, finish);
          let ready: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
            task.onReceiveData((signal: number): void => {
              if (signal === 1) {
                resolve(undefined);
              }
            });
          });
          let mutation: Promise<Any> = taskpool.execute(task);
          await ready;
          let iter: IterableIterator<number> = map.keys();
          let first: IteratorResult<number> = iter.next();
          let seen: number = first.done ? 0 : 1;
          let originalKeys: number = 0;
          let appendedKeys: number = 0;
          if (!first.done) {
            let firstValue: number | undefined = first.value;
            if (firstValue !== undefined) {
              if (firstValue < 100) {
                originalKeys++;
              } else if (firstValue < 200) {
                appendedKeys++;
              }
            }
          }
          start.store(1);
          expect(await mutation as number).assertEqual(100);
          let result: IteratorResult<number> = iter.next();
          while (!result.done) {
            seen++;
            let value: number | undefined = result.value;
            if (value !== undefined) {
              if (value < 100) {
                originalKeys++;
              } else if (value < 200) {
                appendedKeys++;
              }
            }
            result = iter.next();
          }
          expect(originalKeys).assertEqual(100);
          expect(appendedKeys).assertEqual(100);
          expect(seen).assertEqual(200);
          expect(map.size).assertEqual(200);
          expect(map.get(199)).assertEqual(199.0);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_3400
     * @tc.desc   Verify an existing values iterator retains all 100 original values after child deletion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let map: containers.ConcurrentHashMap<number, number> = new containers.ConcurrentHashMap<number, number>();
          for (let i: int = 0; i < 100; i++) {
            map.set(i, i);
          }
          let start: AtomicInt = new AtomicInt(0);
          let finish: AtomicInt = new AtomicInt(0);
          let task: taskpool.Task = new taskpool.Task(weakMutationTask, map, 2.0, start, finish);
          let ready: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
            task.onReceiveData((signal: number): void => {
              if (signal === 1) {
                resolve(undefined);
              }
            });
          });
          let mutation: Promise<Any> = taskpool.execute(task);
          await ready;
          let iter: IterableIterator<number> = map.values();
          let first: IteratorResult<number> = iter.next();
          let seen: number = first.done ? 0 : 1;
          let invalid: number = 0;
          if (!first.done) {
            let firstValue: number | undefined = first.value;
            if (firstValue !== undefined) {
              if (firstValue < 0 || firstValue >= 100) {
                invalid++;
              }
            }
          }
          start.store(1);
          expect(await mutation as number).assertEqual(50);
          let result: IteratorResult<number> = iter.next();
          while (!result.done) {
            seen++;
            let value: number | undefined = result.value;
            if (value !== undefined) {
              if (value < 0 || value >= 100) {
                invalid++;
              }
            }
            result = iter.next();
          }
          expect(invalid).assertEqual(0);
          expect(seen).assertEqual(100);
          expect(map.size).assertEqual(50);
          expect(map.has(0)).assertFalse();
          expect(map.get(99)).assertEqual(99.0);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_3500
     * @tc.desc   Verify an existing entries iterator retains all 100 original entries after child clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let map: containers.ConcurrentHashMap<number, number> = new containers.ConcurrentHashMap<number, number>();
          for (let i: int = 0; i < 100; i++) {
            map.set(i, i);
          }
          let start: AtomicInt = new AtomicInt(0);
          let finish: AtomicInt = new AtomicInt(0);
          let task: taskpool.Task = new taskpool.Task(weakMutationTask, map, 3.0, start, finish);
          let ready: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
            task.onReceiveData((signal: number): void => {
              if (signal === 1) {
                resolve(undefined);
              }
            });
          });
          let mutation: Promise<Any> = taskpool.execute(task);
          await ready;
          let iter: IterableIterator<[number, number]> = map.entries();
          let first: IteratorResult<[number, number]> = iter.next();
          let seen: number = first.done ? 0 : 1;
          start.store(1);
          let invalid: number = 0;
          if (!first.done) {
            let firstValue: [number, number] | undefined = first.value;
            if (firstValue !== undefined) {
              if (firstValue[0] < 0 || firstValue[0] >= 100 || firstValue[1] !== firstValue[0]) {
                invalid++;
              }
            }
          }
          expect(await mutation as number).assertEqual(1);
          let result: IteratorResult<[number, number]> = iter.next();
          while (!result.done) {
            seen++;
            let value: [number, number] | undefined = result.value;
            if (value !== undefined) {
              if (value[0] < 0 || value[0] >= 100 || value[1] !== value[0]) {
                invalid++;
              }
            }
            result = iter.next();
          }
          expect(invalid).assertEqual(0);
          expect(seen).assertEqual(100);
          expect(map.isEmpty()).assertTrue();
          expect(map.size).assertEqual(0);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_3600
     * @tc.desc   Verify forEach reads the first old value then replaced values after child replacement completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let map: containers.ConcurrentHashMap<number, number> = new containers.ConcurrentHashMap<number, number>();
          for (let i: int = 0; i < 100; i++) {
            map.set(i, i);
          }
          let start: AtomicInt = new AtomicInt(0);
          let finish: AtomicInt = new AtomicInt(0);
          let task: taskpool.Task = new taskpool.Task(weakMutationTask, map, 4.0, start, finish);
          let ready: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
            task.onReceiveData((signal: number): void => {
              if (signal === 1) {
                resolve(undefined);
              }
            });
          });
          let mutation: Promise<Any> = taskpool.execute(task);
          await ready;
          let seen: number = 0;
          let invalid: number = 0;
          let originalValues: number = 0;
          let replacedValues: number = 0;
          map.forEach((value: number, key: number): void => {
            if (seen === 0) {
              start.store(1);
              while (finish.load() === 0) {
              }
            }
            seen++;
            if (value === key) {
              originalValues++;
            } else if (value === key + 1000) {
              replacedValues++;
            } else {
              invalid++;
            }
          });
          expect(await mutation as number).assertEqual(100);
          expect(invalid).assertEqual(0);
          expect(seen).assertEqual(100);
          expect(originalValues).assertEqual(1);
          expect(replacedValues).assertEqual(99);
          expect(map.size).assertEqual(100);
          expect(map.get(0)).assertEqual(1000.0);
          expect(map.get(99)).assertEqual(1099.0);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_3700
     * @tc.desc   Verify one TaskPool task exercises the full ConcurrentHashMap API with exact observable results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let map: containers.ConcurrentHashMap<number, number> = new containers.ConcurrentHashMap<number, number>();
          let result: Any = await taskpool.execute(fullInterfaceIsolatedTask, map);
          expect(result as number).assertEqual(1);
          expect(map.isEmpty()).assertTrue();
          expect(map.size).assertEqual(0);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_3800
     * @tc.desc   Verify main thread overlaps 20 child full-API tasks after one child confirms entry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let stableCount: number = await runConcurrentFullInterfaceCase(20);
          expect(stableCount).assertEqual(21);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_3900
     * @tc.desc   Verify main thread overlaps 50 child full-API tasks after one child confirms entry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let stableCount: number = await runConcurrentFullInterfaceCase(50);
          expect(stableCount).assertEqual(51);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_4000
     * @tc.desc   Verify three maps run 20 child tasks each while the main thread operates all three maps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let completedMaps: number = await runMultiMapFullInterfaceCase(20);
          expect(completedMaps).assertEqual(3);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentHashMapHighConcurrencyTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_HASH_MAP_HIGH_CONCURRENCY_4100
     * @tc.desc   Verify 20 child tasks and the main thread iterate while modifying disjoint ranges of one shared map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentHashMapHighConcurrencyTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let size: number = await runIterateModifyCase(20);
          expect(size).assertEqual(105);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

  });
}
