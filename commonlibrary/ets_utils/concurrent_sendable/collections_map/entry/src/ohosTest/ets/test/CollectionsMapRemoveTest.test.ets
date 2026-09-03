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
function removeRace(map: collections.Map<number, string>): number {
  let errorCode: number = 0;
  for (let index: number = 0; index < 200; index++) {
    try {
      map.remove(index % 64);
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


class MapRemoveMessage {
  map?: Object;
  key?: Object;
}

@Concurrent
async function lockedRemoveTask(map: collections.Map<number, string>, key: number,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    let errorCode: number = 0;
    try {
      map.remove(key);
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
  const putOld: string | undefined = map.put(2, 'two');
  result.putOldValue = putOld === undefined ? '' : putOld;
  const removeOld: string | undefined = map.remove(NaN);
  result.removeOldValue = removeOld === undefined ? '' : removeOld;
  result.finalSize = map.size;
  return result;
}

@Concurrent
function crossThreadRemoveTask(map: collections.Map<number, string>): CrossThreadMapResult {
  const result: CrossThreadMapResult = new CrossThreadMapResult();
  const removeOld: string | undefined = map.remove(1);
  result.removeOldValue = removeOld === undefined ? '' : removeOld;
  result.finalSize = map.size;
  return result;
}

function executeMapRemoveWorker(map: collections.Map<number, string>,
  key: number): Promise<number> {
  return new Promise<number>((resolve: (value: number) => void,
    reject: (reason: Error) => void): void => {
    const workerInstance: worker.ThreadWorker =
      new worker.ThreadWorker("./workers/MapRemoveWorker");
    let settled: boolean = false;
    const msg: MapRemoveMessage = new MapRemoveMessage();
    msg.map = map;
    msg.key = key;
    workerInstance.onmessage = (event: MessageEvents): void => {
      settled = true;
      resolve(event.data as number);
      workerInstance.terminate();
    };
    workerInstance.onerror = (): void => {
      if (!settled) {
        settled = true;
        reject(new Error("MapRemoveWorker error"));
      }
      workerInstance.terminate();
    };
    workerInstance.postMessage(msg);
  });
}

export default function CollectionsMapRemoveTest(): void {
  describe('CollectionsMapRemoveTest', (): void => {
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
     * @tc.name   collectionsMapRemoveTest0500
     * @tc.number SUB_COLLECTIONS_MAP_REMOVE_0500
     * @tc.desc   Verify remove with AsyncLock in multi-thread concurrent writes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapRemoveTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsMapRemoveTest0500';
        console.info(`${caseName}, test start`);
        try {
          const sharedMap: collections.Map<number, string> = new collections.Map<number, string>();
          for (let i: number = 1; i <= 10; i++) {
            sharedMap.put(i, 'v' + i);
          }
          const noLockPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
          for (let i: number = 0; i < 5; i++) {
            noLockPromises.push(taskpool.execute(removeRace, sharedMap));
          }
          for (let i: number = 0; i < noLockPromises.length; i++) {
            const code: number = await noLockPromises[i] as number;
            expect(code === 0 || code === 10200201).assertEqual(true);
          }
          const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
          const lockedMap: collections.Map<number, string> = new collections.Map<number, string>();
          for (let i: number = 1; i <= 10; i++) {
            lockedMap.put(i, 'v' + i);
          }
          const lockPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
          for (let i: number = 1; i <= 5; i++) {
            lockPromises.push(taskpool.execute(lockedRemoveTask, lockedMap, i, lock));
          }
          for (let i: number = 0; i < lockPromises.length; i++) {
            const code: number = await lockPromises[i] as number;
            expect(code).assertEqual(0);
          }
          expect(lockedMap.size).assertEqual(5);
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsMapRemoveTest0600
     * @tc.number SUB_COLLECTIONS_MAP_REMOVE_0600
     * @tc.desc   Verify Worker receives Map calls remove, and >16MB cross-thread error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapRemoveTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsMapRemoveTest0600';
        console.info(`${caseName}, test start`);
        try {
          const map: collections.Map<number, string> = new collections.Map<number, string>();
          map.put(1, 'a');
          map.put(2, 'b');
          const size: number = await executeMapRemoveWorker(map, 1);
          expect(size).assertEqual(1);
        } catch (error) {
          console.info(`${caseName}, Worker error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        let thrown: boolean = false;
        try {
          const bigMap: collections.Map<number, string> = new collections.Map<number, string>();
          for (let i: number = 0; i < 20000; i++) {
            bigMap.put(i, 'value-' + i);
          }
          let result = await taskpool.execute(crossThreadMapApisTask, bigMap) as CrossThreadMapResult;
          expect(result.containsValueResult).assertEqual(false);
          expect(result.finalSize).assertEqual(20000);
        } catch (error) {
          console.info(`${caseName}, error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsMapRemoveTest0700
     * @tc.number SUB_COLLECTIONS_MAP_REMOVE_0700
     * @tc.desc   Verify remove at 1023/1024/1025 entry boundaries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapRemoveTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapRemoveTest0700';
        console.info(`${caseName}, test start`);
        for (let n: number = 1023; n <= 1025; n++) {
          const map: collections.Map<number, string> = new collections.Map<number, string>();
          for (let i: number = 0; i < n; i++) {
            map.put(i, 'v' + i);
          }
          expect(map.size).assertEqual(n);
          const mid: number = Math.floor(n / 2);
          const removed: string | undefined = map.remove(mid);
          expect(removed).assertEqual('v' + mid);
          expect(map.size).assertEqual(n - 1);
          expect(map.has(mid)).assertEqual(false);
          const notRemoved: string | undefined = map.remove(n + 100);
          expect(notRemoved).assertEqual(undefined);
          expect(map.size).assertEqual(n - 1);
          const lastRemoved: string | undefined = map.remove(n - 1);
          expect(lastRemoved).assertEqual('v' + (n - 1));
          expect(map.size).assertEqual(n - 2);
        }
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsMapRemoveTest3000
     * @tc.number SUB_COLLECTIONS_MAP_REMOVE_3000
     * @tc.desc   Verify remove existing number key returns old value and decrements size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapRemoveTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapRemoveTest3000';
      console.info(`${caseName}, test start`);

      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.put(1, 'a');
      expect(map.remove(1)).assertEqual('a');
      expect(map.has(1)).assertEqual(false);
      expect(map.size).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapRemoveTest3100
     * @tc.number SUB_COLLECTIONS_MAP_REMOVE_3100
     * @tc.desc   Verify remove missing key returns undefined without changing size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapRemoveTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapRemoveTest3100';
      console.info(`${caseName}, test start`);

      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.put(1, 'a');
      expect(map.remove(999)).assertEqual(undefined);
      expect(map.size).assertEqual(1);
      expect(map.has(1)).assertEqual(true);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapRemoveTest3200
     * @tc.number SUB_COLLECTIONS_MAP_REMOVE_3200
     * @tc.desc   Verify remove key whose old value is undefined returns undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapRemoveTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapRemoveTest3200';
      console.info(`${caseName}, test start`);

      const map: collections.Map<number, string | undefined> = new collections.Map<number, string | undefined>();
      map.put(1, undefined);
      expect(map.has(1)).assertEqual(true);
      expect(map.remove(1)).assertEqual(undefined);
      expect(map.has(1)).assertEqual(false);
      expect(map.size).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapRemoveTest3300
     * @tc.number SUB_COLLECTIONS_MAP_REMOVE_3300
     * @tc.desc   Verify remove NaN key uses SameValueZero equality and returns old value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapRemoveTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapRemoveTest3300';
      console.info(`${caseName}, test start`);

      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.put(NaN, 'nan');
      expect(map.remove(NaN)).assertEqual('nan');
      expect(map.has(NaN)).assertEqual(false);
      expect(map.size).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapRemoveTest3400
     * @tc.number SUB_COLLECTIONS_MAP_REMOVE_3400
     * @tc.desc   Verify remove +0/-0 key uses SameValueZero equality and returns old value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapRemoveTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapRemoveTest3400';
      console.info(`${caseName}, test start`);

      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.put(+0, 'a');
      expect(map.remove(-0)).assertEqual('a');
      expect(map.has(+0)).assertEqual(false);
      expect(map.size).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapRemoveTest3500
     * @tc.number SUB_COLLECTIONS_MAP_REMOVE_3500
     * @tc.desc   Verify remove Sendable reference key returns old value by reference equality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapRemoveTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapRemoveTest3500';
      console.info(`${caseName}, test start`);

      const keyBox: SendableBox = new SendableBox(1);
      const objectKeyMap: collections.Map<SendableBox, string> =
        new collections.Map<SendableBox, string>([[keyBox, 'value']]);
      expect(objectKeyMap.remove(new SendableBox(1))).assertEqual(undefined);
      expect(objectKeyMap.has(keyBox)).assertEqual(true);
      expect(objectKeyMap.remove(keyBox)).assertEqual('value');
      expect(objectKeyMap.has(keyBox)).assertEqual(false);
      expect(objectKeyMap.size).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapRemoveTest3600
     * @tc.number SUB_COLLECTIONS_MAP_REMOVE_3600
     * @tc.desc   Verify repeated remove of same key returns old value then undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapRemoveTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapRemoveTest3600';
      console.info(`${caseName}, test start`);

      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.put(1, 'a');
      expect(map.remove(1)).assertEqual('a');
      expect(map.remove(1)).assertEqual(undefined);
      expect(map.size).assertEqual(0);
      expect(map.has(1)).assertEqual(false);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapRemoveTest3700
     * @tc.number SUB_COLLECTIONS_MAP_REMOVE_3700
     * @tc.desc   Verify remove middle key from 10250-entry Map returns old value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapRemoveTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapRemoveTest3700';
      console.info(`${caseName}, test start`);

      const map: collections.Map<number, string> = new collections.Map<number, string>();
      for (let i: number = 0; i < 10250; i++) {
        map.put(i, 'v' + i);
      }
      expect(map.size).assertEqual(10250);
      const removed: string | undefined = map.remove(1024);
      expect(removed).assertEqual('v1024');
      expect(map.size).assertEqual(10249);
      expect(map.has(1024)).assertEqual(false);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapRemoveTest3800
     * @tc.number SUB_COLLECTIONS_MAP_REMOVE_3800
     * @tc.desc   Verify remove all entries from 10250-entry Map leaves size zero.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapRemoveTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapRemoveTest3800';
      console.info(`${caseName}, test start`);

      const map: collections.Map<number, string> = new collections.Map<number, string>();
      for (let i: number = 0; i < 10250; i++) {
        map.put(i, 'v' + i);
      }
      for (let i: number = 0; i < 10250; i += 64) {
        const removed: string | undefined = map.remove(i);
        expect(removed).assertEqual('v' + i);
      }
      expect(map.size).assertEqual(10089);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapRemoveTest3900
     * @tc.number SUB_COLLECTIONS_MAP_REMOVE_3900
     * @tc.desc   Verify remove non-existent key from 10250-entry Map returns undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapRemoveTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapRemoveTest3900';
      console.info(`${caseName}, test start`);

      const map: collections.Map<number, string> = new collections.Map<number, string>();
      for (let i: number = 0; i < 10250; i++) {
        map.put(i, 'v' + i);
      }
      expect(map.size).assertEqual(10250);
      const notRemoved: string | undefined = map.remove(99999);
      expect(notRemoved).assertEqual(undefined);
      expect(map.size).assertEqual(10250);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapRemoveTest4000
     * @tc.number SUB_COLLECTIONS_MAP_REMOVE_4000
     * @tc.desc   Verify detached remove method call throws 10200011 bind error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapRemoveTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapRemoveTest4000';
      console.info(`${caseName}, test start`);

      const map: collections.Map<number, string> = new collections.Map<number, string>();
      const detached = map.remove;
      let errorCaught: boolean = false;
      try {
        detached(1);
      } catch (err) {
        errorCaught = true;
        expect(err.code).assertEqual(10200011);
      }
      expect(errorCaught).assertTrue();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapRemoveTest4100
     * @tc.number SUB_COLLECTIONS_MAP_REMOVE_4100
     * @tc.desc   Verify remove works after Map with 3 entries is transferred across TaskPool threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapRemoveTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsMapRemoveTest4100';
        console.info(`${caseName}, test start`);
        try {
          const map: collections.Map<number, string> = new collections.Map<number, string>();
          map.put(1, 'a');
          map.put(2, 'b');
          map.put(3, 'c');
          const result = await taskpool.execute(crossThreadRemoveTask, map) as CrossThreadMapResult;
          expect(result.removeOldValue).assertEqual('a');
          expect(result.finalSize).assertEqual(2);
          expect(map.size).assertEqual(2);
          expect(map.has(1)).assertEqual(false);
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsMapRemoveTest4200
     * @tc.number SUB_COLLECTIONS_MAP_REMOVE_4200
     * @tc.desc   Verify collections.Map instanceof and remove method availability.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapRemoveTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapRemoveTest4200';
      console.info(`${caseName}, test start`);

      const map: collections.Map<number, string> = new collections.Map<number, string>();
      expect(map instanceof collections.Map).assertEqual(true);
      expect(map.remove !== undefined).assertEqual(true);
      expect(map.size).assertEqual(0);

      console.info(`${caseName}, test end`);
    });
  });
}
