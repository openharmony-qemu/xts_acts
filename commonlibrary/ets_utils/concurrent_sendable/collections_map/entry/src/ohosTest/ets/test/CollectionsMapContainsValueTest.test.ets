/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { collections, taskpool, worker, MessageEvents, ArkTSUtils } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { CrossThreadMapResult } from './common';


@Sendable
class SendableBox {
  public value: number;

  constructor(value: number) {
    this.value = value;
  }
}

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

@Concurrent
function containsValueRace(map: collections.Map<number, string>, value: string): number {
  let errorCode: number = 0;
  for (let index: number = 0; index < 200; index++) {
    try {
      map.containsValue(value);
    } catch (error) {
      if (error.code === 10200201) {
        errorCode = 10200201;
      } else {
        errorCode = -1;
      }
      break;
    }
  }
  return errorCode;
}

@Concurrent
function putRace(map: collections.Map<number, string>): number {
  let errorCode: number = 0;
  for (let index: number = 0; index < 200; index++) {
    try {
      map.put(index % 64, 'put-' + index);
    } catch (error) {
      if (error.code === 10200201) {
        errorCode = 10200201;
      } else {
        errorCode = -1;
      }
      break;
    }
  }
  return errorCode;
}

@Concurrent
function containsValueRaceMessage(map: collections.Map<number, string>, value: string): string {
  let message: string = '';
  for (let index: number = 0; index < 200; index++) {
    try {
      map.containsValue(value);
    } catch (error) {
      if (error.code === 10200201) {
        message = error.message;
      } else {
        message = 'other-error';
      }
      break;
    }
  }
  return message;
}


class MapContainsValueMessage {
  map?: Object;
  value?: Object;
}

@Concurrent
async function lockedContainsValueTask(map: collections.Map<number, string>, value: string,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    let errorCode: number = 0;
    try {
      map.containsValue(value);
    } catch (error) {
      errorCode = -1;
    }
    return errorCode;
  });
}

@Concurrent
async function lockedPutTask(map: collections.Map<number, string>, key: number, value: string,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    let errorCode: number = 0;
    try {
      map.put(key, value);
    } catch (error) {
      errorCode = -1;
    }
    return errorCode;
  });
}

@Concurrent
function crossThreadMapApisTask(map: collections.Map<number, string>): CrossThreadMapResult {
  const result: CrossThreadMapResult = new CrossThreadMapResult();
  result.containsValueResult = map.containsValue('nan');
  const putOld: string|undefined = map.put(2, 'two');
  result.putOldValue = putOld === undefined ? '' : putOld;
  const removeOld: string|undefined = map.remove(NaN);
  result.removeOldValue = removeOld === undefined ? '' : removeOld;
  result.finalSize = map.size;
  return result;
}

function executeMapContainsValueWorker(map: collections.Map<number, string>,
  value: string): Promise<boolean> {
  return new Promise<boolean>((resolve: (value: boolean) => void,
    reject: (reason: Error) => void): void => {
    const workerInstance: worker.ThreadWorker =
      new worker.ThreadWorker("./workers/MapContainsValueWorker");
    let settled: boolean = false;
    const msg: MapContainsValueMessage = new MapContainsValueMessage();
    msg.map = map;
    msg.value = value;
    workerInstance.onmessage = (event: MessageEvents): void => {
      settled = true;
      resolve(event.data as boolean);
      workerInstance.terminate();
    };
    workerInstance.onerror = (): void => {
      if (!settled) {
        settled = true;
        reject(new Error("MapContainsValueWorker error"));
      }
      workerInstance.terminate();
    };
    workerInstance.postMessage(msg);
  });
}

export default function CollectionsMapContainsValueTest(): void {
  describe('CollectionsMapContainsValueTest', (): void => {
    beforeAll((done: Function): void => {
      done();
    });
    beforeEach((done: Function): void => {
      done();
    });
    afterEach((done: Function): void => {
      done();
    });
    afterAll(async (done: Function): Promise<void> => {
      await sleep(20);
      done();
    });

    /**
     * @tc.name   collectionsMapContainsValueTest0700
     * @tc.number SUB_COLLECTIONS_MAP_CONTAINS_VALUE_0700
     * @tc.desc   Verify containsValue read and put write with AsyncLock in multi-thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapContainsValueTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsMapContainsValueTest0700';
        console.info(`${caseName}, test start`);
        try {
          const sharedMap: collections.Map<number, string> = new collections.Map<number, string>();
          sharedMap.put(1, 'a');
          sharedMap.put(2, 'b');
          sharedMap.put(3, 'c');
          const noLockPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
          for (let i: number = 0; i < 5; i++) {
            noLockPromises.push(taskpool.execute(containsValueRace, sharedMap, 'a'));
          }
          for (let i: number = 0; i < 5; i++) {
            noLockPromises.push(taskpool.execute(putRace, sharedMap));
          }
          for (let i: number = 0; i < noLockPromises.length; i++) {
            const code: number = await noLockPromises[i] as number;
            expect(code === 0 || code === 10200201).assertEqual(true);
          }
          const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
          const lockedMap: collections.Map<number, string> = new collections.Map<number, string>();
          lockedMap.put(1, 'a');
          lockedMap.put(2, 'b');
          lockedMap.put(3, 'c');
          const lockPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
          for (let i: number = 0; i < 5; i++) {
            lockPromises.push(taskpool.execute(lockedContainsValueTask, lockedMap, 'a', lock));
          }
          for (let i: number = 0; i < 5; i++) {
            lockPromises.push(taskpool.execute(lockedPutTask, lockedMap, i + 10, 'v' + i, lock));
          }
          for (let i: number = 0; i < lockPromises.length; i++) {
            const code: number = await lockPromises[i] as number;
            expect(code).assertEqual(0);
          }
          expect(lockedMap.size).assertEqual(8);
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsMapContainsValueTest0800
     * @tc.number SUB_COLLECTIONS_MAP_CONTAINS_VALUE_0800
     * @tc.desc   Verify @Sendable Map cross TaskPool transfer and call four new APIs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapContainsValueTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsMapContainsValueTest0800';
        console.info(`${caseName}, test start`);
        try {
          const map: collections.Map<number, string> = new collections.Map<number, string>();
          map.put(NaN, 'nan');
          map.put(+0, 'plus');
          map.put(-0, 'minus');
          map.put(1, 'one');
          const result: CrossThreadMapResult =
            await taskpool.execute(crossThreadMapApisTask, map) as CrossThreadMapResult;
          expect(result.containsValueResult).assertEqual(true);
          expect(result.putOldValue).assertEqual('');
          expect(result.removeOldValue).assertEqual('nan');
          expect(result.finalSize).assertEqual(3);
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsMapContainsValueTest0900
     * @tc.number SUB_COLLECTIONS_MAP_CONTAINS_VALUE_0900
     * @tc.desc   Verify Worker receives Map and calls containsValue correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapContainsValueTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsMapContainsValueTest0900';
        console.info(`${caseName}, test start`);
        try {
          const map: collections.Map<number, string> = new collections.Map<number, string>();
          map.put(1, 'a');
          map.put(2, 'b');
          map.put(3, 'c');
          const result1: boolean = await executeMapContainsValueWorker(map, 'a');
          expect(result1).assertEqual(true);
          const result2: boolean = await executeMapContainsValueWorker(map, 'd');
          expect(result2).assertEqual(false);
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsMapContainsValueTest1000
     * @tc.number SUB_COLLECTIONS_MAP_CONTAINS_VALUE_1000
     * @tc.desc   Verify collections.Map instanceof and method availability.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapContainsValueTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapContainsValueTest1000';
        console.info(`${caseName}, test start`);
        const map: collections.Map<number, string> = new collections.Map<number, string>();
        expect(map instanceof collections.Map).assertEqual(true);
        expect(map.containsValue !== undefined).assertEqual(true);
        expect(map.put !== undefined).assertEqual(true);
        expect(map.putAll !== undefined).assertEqual(true);
        expect(map.remove !== undefined).assertEqual(true);
        expect(map.size).assertEqual(0);
        map.put(1, 'a');
        expect(map.size).assertEqual(1);
        expect(map.containsValue('a')).assertEqual(true);
        map.remove(1);
        expect(map.size).assertEqual(0);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsMapContainsValueTest1100
     * @tc.number SUB_COLLECTIONS_MAP_CONTAINS_VALUE_1100
     * @tc.desc   Verify containsValue at 1023/1024/1025 entry boundaries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapContainsValueTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapContainsValueTest1100';
        console.info(`${caseName}, test start`);
        for (let n: number = 1023; n <= 1025; n++) {
          const map: collections.Map<number, string> = new collections.Map<number, string>();
          for (let i: number = 0; i < n; i++) {
            map.put(i, 'v' + i);
          }
          expect(map.size).assertEqual(n);
          expect(map.containsValue('v0')).assertEqual(true);
          const mid: number = Math.floor(n / 2);
          expect(map.containsValue('v' + mid)).assertEqual(true);
          expect(map.containsValue('v' + (n - 1))).assertEqual(true);
          expect(map.containsValue('not-exist')).assertEqual(false);
          expect(map.containsValue('v' + n)).assertEqual(false);
        }
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsMapContainsValueTest1200
     * @tc.number SUB_COLLECTIONS_MAP_CONTAINS_VALUE_1200
     * @tc.desc   Verify all new APIs on empty Map container.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapContainsValueTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapContainsValueTest1200';
        console.info(`${caseName}, test start`);
        const emptyMap: collections.Map<number, string> = new collections.Map<number, string>();
        expect(emptyMap.size).assertEqual(0);
        expect(emptyMap.containsValue('a')).assertEqual(false);
        expect(emptyMap.get(1)).assertEqual(undefined);
        expect(emptyMap.has(1)).assertEqual(false);
        const oldVal: string|undefined = emptyMap.put(1, 'a');
        expect(oldVal).assertEqual(undefined);
        expect(emptyMap.size).assertEqual(1);
        expect(emptyMap.containsValue('a')).assertEqual(true);
        const removed: string|undefined = emptyMap.remove(1);
        expect(removed).assertEqual('a');
        expect(emptyMap.size).assertEqual(0);
        const source: collections.Map<number, string> = new collections.Map<number, string>();
        source.put(2, 'b');
        emptyMap.putAll(source);
        expect(emptyMap.size).assertEqual(1);
        expect(emptyMap.get(2)).assertEqual('b');
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsMapContainsValueTest3000
     * @tc.number SUB_COLLECTIONS_MAP_CONTAINS_VALUE_3000
     * @tc.desc   Verify containsValue returns true when a normal value exists in the map.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapContainsValueTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapContainsValueTest3000';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number, string> = new collections.Map<number, string>(
        [[1, 'one'], [2, 'two'], [3, 'three']]
      );
      expect(map.containsValue('one')).assertEqual(true);
      expect(map.containsValue('two')).assertEqual(true);
      expect(map.containsValue('three')).assertEqual(true);
      expect(map.size).assertEqual(3);
      expect(map.has(1)).assertEqual(true);
      expect(map.get(1)).assertEqual('one');
      expect(map.has(2)).assertEqual(true);
      expect(map.get(2)).assertEqual('two');
      expect(map.has(3)).assertEqual(true);
      expect(map.get(3)).assertEqual('three');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapContainsValueTest3100
     * @tc.number SUB_COLLECTIONS_MAP_CONTAINS_VALUE_3100
     * @tc.desc   Verify containsValue returns false when a normal value does not exist in the map.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapContainsValueTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapContainsValueTest3100';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number, string> = new collections.Map<number, string>(
        [[1, 'one'], [2, 'two'], [3, 'three']]
      );
      expect(map.containsValue('missing')).assertEqual(false);
      expect(map.containsValue('')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapContainsValueTest3200
     * @tc.number SUB_COLLECTIONS_MAP_CONTAINS_VALUE_3200
     * @tc.desc   Verify containsValue returns false on an empty map.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapContainsValueTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapContainsValueTest3200';
      console.info(`${caseName}, test start`);
      const emptyMap: collections.Map<number, string> = new collections.Map<number, string>();
      expect(emptyMap.size).assertEqual(0);
      expect(emptyMap.containsValue('one')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapContainsValueTest3300
     * @tc.number SUB_COLLECTIONS_MAP_CONTAINS_VALUE_3300
     * @tc.desc   Verify containsValue uses SameValueZero to match NaN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapContainsValueTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapContainsValueTest3300';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number, number> = new collections.Map<number, number>(
        [[1, NaN], [2, 200]]
      );
      expect(map.containsValue(NaN)).assertEqual(true);
      expect(map.containsValue(200)).assertEqual(true);
      expect(map.containsValue(100)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapContainsValueTest3400
     * @tc.number SUB_COLLECTIONS_MAP_CONTAINS_VALUE_3400
     * @tc.desc   Verify containsValue uses SameValueZero to match +0 and -0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapContainsValueTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapContainsValueTest3400';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number, number> = new collections.Map<number, number>(
        [[1, +0]]
      );
      expect(map.containsValue(+0)).assertEqual(true);
      expect(map.containsValue(-0)).assertEqual(true);
      expect(map.containsValue(0)).assertEqual(true);
      expect(map.containsValue(1)).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapContainsValueTest3500
     * @tc.number SUB_COLLECTIONS_MAP_CONTAINS_VALUE_3500
     * @tc.desc   Verify containsValue matches Sendable reference equality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapContainsValueTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapContainsValueTest3500';
      console.info(`${caseName}, test start`);
      const sharedValue: SendableBox = new SendableBox(7);
      const map: collections.Map<number, SendableBox> =
        new collections.Map<number, SendableBox>([[1, sharedValue]]);
      expect(map.containsValue(sharedValue)).assertEqual(true);
      expect(map.containsValue(new SendableBox(7))).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapContainsValueTest3600
     * @tc.number SUB_COLLECTIONS_MAP_CONTAINS_VALUE_3600
     * @tc.desc   Verify containsValue returns true when multiple keys share the same duplicate value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapContainsValueTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapContainsValueTest3600';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.put(1, 'a');
      map.put(2, 'a');
      map.put(3, 'a');
      expect(map.size).assertEqual(3);
      expect(map.containsValue('a')).assertEqual(true);
      expect(map.containsValue('b')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapContainsValueTest3700
     * @tc.number SUB_COLLECTIONS_MAP_CONTAINS_VALUE_3700
     * @tc.desc   Verify containsValue returns true on a 10250-entry map for an existing value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapContainsValueTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapContainsValueTest3700';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      for (let i: number = 0; i < 10250; i++) {
        map.put(i, 'v' + i);
      }
      expect(map.size).assertEqual(10250);
      expect(map.containsValue('v0')).assertEqual(true);
      expect(map.containsValue('v5125')).assertEqual(true);
      expect(map.containsValue('v10249')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapContainsValueTest3800
     * @tc.number SUB_COLLECTIONS_MAP_CONTAINS_VALUE_3800
     * @tc.desc   Verify containsValue returns false on a 10250-entry map for a non-existent value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapContainsValueTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapContainsValueTest3800';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      for (let i: number = 0; i < 10250; i++) {
        map.put(i, 'v' + i);
      }
      expect(map.size).assertEqual(10250);
      expect(map.containsValue('not-exist')).assertEqual(false);
      expect(map.containsValue('v10250')).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapContainsValueTest3900
     * @tc.number SUB_COLLECTIONS_MAP_CONTAINS_VALUE_3900
     * @tc.desc   Verify containsValue returns true on a 10250-entry map with consecutive duplicate values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapContainsValueTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapContainsValueTest3900';
      console.info(`${caseName}, test start`);
      const map: collections.Map<number, string> = new collections.Map<number, string>();
      for (let i: number = 0; i < 10250; i++) {
        if (i % 2 === 0) {
          map.put(i, 'dup');
        } else {
          map.put(i, 'v' + i);
        }
      }
      expect(map.size).assertEqual(10250);
      expect(map.containsValue('dup')).assertEqual(true);
      expect(map.containsValue('v1')).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapContainsValueTest4000
     * @tc.number SUB_COLLECTIONS_MAP_CONTAINS_VALUE_4000
     * @tc.desc   Verify containsValue called on a detached method throws 10200011 bind error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapContainsValueTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapContainsValueTest4000';
        console.info(`${caseName}, test start`);
        const map: collections.Map<number, string> = new collections.Map<number, string>();
        map.put(1, 'a');
        map.put(2, 'b');
        const detached: (value: string) => boolean = map.containsValue;
        try {
          detached('a');
          expect(true).assertFail();
        } catch (error) {
          expect(error.code).assertEqual(10200011);
        }
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsMapContainsValueTest4100
     * @tc.number SUB_COLLECTIONS_MAP_CONTAINS_VALUE_4100
     * @tc.desc   Verify 10200201 error message contains 'Concurrent modification exception' under race.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapContainsValueTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsMapContainsValueTest4100';
        console.info(`${caseName}, test start`);
        try {
          const sharedMap: collections.Map<number, string> = new collections.Map<number, string>();
          sharedMap.put(1, 'a');
          sharedMap.put(2, 'b');
          sharedMap.put(3, 'c');
          const promises: Array<Promise<Object>> = new Array<Promise<Object>>();
          for (let i: number = 0; i < 5; i++) {
            promises.push(taskpool.execute(containsValueRaceMessage, sharedMap, 'a'));
          }
          for (let i: number = 0; i < 5; i++) {
            promises.push(taskpool.execute(putRace, sharedMap));
          }
          for (let i: number = 0; i < 5; i++) {
            const msg: string = await promises[i] as string;
            if (msg !== '' && msg !== 'other-error') {
              expect(msg.includes('Concurrent modification exception')).assertEqual(true);
            } else if (msg === 'other-error') {
              expect(true).assertFail();
            }
          }
          for (let i: number = 5; i < promises.length; i++) {
            const code: number = await promises[i] as number;
            expect(code === 0 || code === 10200201).assertEqual(true);
          }
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });
  });
}
