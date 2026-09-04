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

class MapPutMessage {
  map?: Object;
  key?: Object;
  value?: Object;
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
function crossThreadPutTask(map: collections.Map<number, string>): CrossThreadMapResult {
  const result: CrossThreadMapResult = new CrossThreadMapResult();
  const putOld: string | undefined = map.put(1, 'a');
  result.putOldValue = putOld === undefined ? '' : putOld;
  result.finalSize = map.size;
  return result;
}

function executeMapPutWorker(map: collections.Map<number, string>,
  key: number, value: string): Promise<number> {
  return new Promise<number>((resolve: (value: number) => void,
    reject: (reason: Error) => void): void => {
    const workerInstance: worker.ThreadWorker =
      new worker.ThreadWorker("./workers/MapPutWorker");
    let settled: boolean = false;
    const msg: MapPutMessage = new MapPutMessage();
    msg.map = map;
    msg.key = key;
    msg.value = value;
    workerInstance.onmessage = (event: MessageEvents): void => {
      settled = true;
      resolve(event.data as number);
      workerInstance.terminate();
    };
    workerInstance.onerror = (): void => {
      if (!settled) {
        settled = true;
        reject(new Error("MapPutWorker error"));
      }
      workerInstance.terminate();
    };
    workerInstance.postMessage(msg);
  });
}

export default function CollectionsMapPutTest(): void {
  describe('CollectionsMapPutTest', (): void => {
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
     * @tc.name   collectionsMapPutTest0600
     * @tc.number SUB_COLLECTIONS_MAP_PUT_0600
     * @tc.desc   Verify put with AsyncLock in multi-thread concurrent writes on different keys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsMapPutTest0600';
        console.info(`${caseName}, test start`);
        try {
          const sharedMap: collections.Map<number, string> = new collections.Map<number, string>();
          const noLockPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
          for (let i: number = 0; i < 5; i++) {
            noLockPromises.push(taskpool.execute(putRace, sharedMap));
          }
          for (let i: number = 0; i < noLockPromises.length; i++) {
            const code: number = await noLockPromises[i] as number;
            expect(code === 0 || code === 10200201).assertEqual(true);
          }
          const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
          const lockedMap: collections.Map<number, string> = new collections.Map<number, string>();
          const lockPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
          for (let i: number = 0; i < 5; i++) {
            lockPromises.push(taskpool.execute(lockedPutTask, lockedMap, i + 1, 'v' + i, lock));
          }
          for (let i: number = 0; i < lockPromises.length; i++) {
            const code: number = await lockPromises[i] as number;
            expect(code).assertEqual(0);
          }
          expect(lockedMap.size).assertEqual(5);
          for (let i: number = 1; i <= 5; i++) {
            expect(lockedMap.has(i)).assertEqual(true);
          }
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsMapPutTest0700
     * @tc.number SUB_COLLECTIONS_MAP_PUT_0700
     * @tc.desc   Verify Worker receives Map and calls put correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsMapPutTest0700';
        console.info(`${caseName}, test start`);
        try {
          const map: collections.Map<number, string> = new collections.Map<number, string>();
          map.put(1, 'a');
          const size1: number = await executeMapPutWorker(map, 2, 'b');
          expect(size1).assertEqual(2);
          const size2: number = await executeMapPutWorker(map, 1, 'new');
          expect(size2).assertEqual(1);
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsMapPutTest0800
     * @tc.number SUB_COLLECTIONS_MAP_PUT_0800
     * @tc.desc   Verify put at 1023/1024/1025 entry boundaries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapPutTest0800';
        console.info(`${caseName}, test start`);
        for (let n: number = 1023; n <= 1025; n++) {
          const map: collections.Map<number, string> = new collections.Map<number, string>();
          for (let i: number = 0; i < n; i++) {
            map.put(i, 'v' + i);
          }
          expect(map.size).assertEqual(n);
          const oldVal: string|undefined = map.put(n, 'new');
          expect(oldVal).assertEqual(undefined);
          expect(map.size).assertEqual(n + 1);
          expect(map.get(n)).assertEqual('new');
          const mid: number = Math.floor(n / 2);
          const updateVal: string|undefined = map.put(mid, 'updated');
          expect(updateVal).assertEqual('v' + mid);
          expect(map.size).assertEqual(n + 1);
          expect(map.get(mid)).assertEqual('updated');
        }
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsMapPutTest0900
     * @tc.number SUB_COLLECTIONS_MAP_PUT_0900
     * @tc.desc   Verify empty Map putAll no-op and clear behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapPutTest0900';
        console.info(`${caseName}, test start`);
        const emptyMap: collections.Map<number, string> = new collections.Map<number, string>();
        const emptySource: collections.Map<number, string> = new collections.Map<number, string>();
        emptyMap.putAll(emptySource);
        expect(emptyMap.size).assertEqual(0);
        const nonEmptySource: collections.Map<number, string> = new collections.Map<number, string>();
        nonEmptySource.put(1, 'a');
        nonEmptySource.put(2, 'b');
        nonEmptySource.put(3, 'c');
        emptyMap.putAll(nonEmptySource);
        expect(emptyMap.size).assertEqual(3);
        expect(emptyMap.containsValue('a')).assertEqual(true);
        expect(emptyMap.containsValue('b')).assertEqual(true);
        expect(emptyMap.containsValue('c')).assertEqual(true);
        const selfMap: collections.Map<number, string> = new collections.Map<number, string>();
        selfMap.put(1, 'a');
        selfMap.put(2, 'b');
        selfMap.putAll(selfMap);
        expect(selfMap.size).assertEqual(2);
        const clearedMap: collections.Map<number, string> = new collections.Map<number, string>();
        for (let i: number = 0; i < 5; i++) {
          clearedMap.put(i, 'v' + i);
        }
        clearedMap.clear();
        expect(clearedMap.size).assertEqual(0);
        clearedMap.put(1, 'after-clear');
        expect(clearedMap.size).assertEqual(1);
        expect(clearedMap.get(1)).assertEqual('after-clear');
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsMapPutTest3000
     * @tc.number SUB_COLLECTIONS_MAP_PUT_3000
     * @tc.desc   Verify put returns undefined when adding a new number key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapPutTest3000';
      console.info(`${caseName}, test start`);

      const map: collections.Map<number, string> = new collections.Map<number, string>();
      expect(map.size).assertEqual(0);
      expect(map.put(1, 'a')).assertEqual(undefined);
      expect(map.size).assertEqual(1);
      expect(map.get(1)).assertEqual('a');
      expect(map.size).assertEqual(1);
      expect(map.has(1)).assertEqual(true);
      expect(map.get(1)).assertEqual('a');

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapPutTest3100
     * @tc.number SUB_COLLECTIONS_MAP_PUT_3100
     * @tc.desc   Verify put returns the old value when overwriting an existing number key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapPutTest3100';
      console.info(`${caseName}, test start`);

      const map: collections.Map<number, string> = new collections.Map<number, string>();
      map.put(1, 'a');
      expect(map.put(1, 'b')).assertEqual('a');
      expect(map.get(1)).assertEqual('b');
      expect(map.size).assertEqual(1);
      expect(map.size).assertEqual(1);
      expect(map.has(1)).assertEqual(true);
      expect(map.get(1)).assertEqual('b');

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapPutTest3200
     * @tc.number SUB_COLLECTIONS_MAP_PUT_3200
     * @tc.desc   Verify put overwrites a NaN key following SameValueZero and returns the old value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapPutTest3200';
      console.info(`${caseName}, test start`);

      const map: collections.Map<number, string> = new collections.Map<number, string>();
      expect(map.put(NaN, 'nan')).assertEqual(undefined);
      expect(map.put(NaN, 'NAN')).assertEqual('nan');
      expect(map.get(NaN)).assertEqual('NAN');
      expect(map.size).assertEqual(1);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapPutTest3300
     * @tc.number SUB_COLLECTIONS_MAP_PUT_3300
     * @tc.desc   Verify put treats +0 and -0 as the same key (SameValueZero) and returns the old value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapPutTest3300';
      console.info(`${caseName}, test start`);

      const map: collections.Map<number, string> = new collections.Map<number, string>();
      expect(map.put(+0, 'a')).assertEqual(undefined);
      expect(map.put(-0, 'b')).assertEqual('a');
      expect(map.get(0)).assertEqual('b');
      expect(map.size).assertEqual(1);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapPutTest3400
     * @tc.number SUB_COLLECTIONS_MAP_PUT_3400
     * @tc.desc   Verify put returns undefined when adding a new string key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapPutTest3400';
      console.info(`${caseName}, test start`);

      const map: collections.Map<number | string, string> = new collections.Map<number | string, string>();
      expect(map.put('key', 'value')).assertEqual(undefined);
      expect(map.size).assertEqual(1);
      expect(map.get('key')).assertEqual('value');

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapPutTest3500
     * @tc.number SUB_COLLECTIONS_MAP_PUT_3500
     * @tc.desc   Verify repeated puts on the same key return successive old values and keep the latest.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapPutTest3500';
      console.info(`${caseName}, test start`);

      const map: collections.Map<number, string> = new collections.Map<number, string>();
      expect(map.put(1, 'a')).assertEqual(undefined);
      expect(map.put(1, 'b')).assertEqual('a');
      expect(map.put(1, 'c')).assertEqual('b');
      expect(map.get(1)).assertEqual('c');
      expect(map.size).assertEqual(1);
      expect(map.size).assertEqual(1);
      expect(map.has(1)).assertEqual(true);
      expect(map.get(1)).assertEqual('c');

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapPutTest3600
     * @tc.number SUB_COLLECTIONS_MAP_PUT_3600
     * @tc.desc   Verify put adds 10250 new entries and reads back a mid key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapPutTest3600';
      console.info(`${caseName}, test start`);

      const map: collections.Map<number, string> = new collections.Map<number, string>();
      for (let i: number = 0; i < 10250; i++) {
        map.put(i, 'v' + i);
      }
      expect(map.size).assertEqual(10250);
      expect(map.get(5125)).assertEqual('v5125');

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapPutTest3700
     * @tc.number SUB_COLLECTIONS_MAP_PUT_3700
     * @tc.desc   Verify put overwrites an existing key in a 10250-entry map without growing size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapPutTest3700';
      console.info(`${caseName}, test start`);

      const map: collections.Map<number, string> = new collections.Map<number, string>();
      for (let i: number = 0; i < 10250; i++) {
        map.put(i, 'v' + i);
      }
      const sizeBefore: number = map.size;
      expect(map.put(5125, 'updated')).assertEqual('v5125');
      expect(map.size).assertEqual(sizeBefore);
      expect(map.get(5125)).assertEqual('updated');

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapPutTest3800
     * @tc.number SUB_COLLECTIONS_MAP_PUT_3800
     * @tc.desc   Verify put with Sendable reference key overwrites and returns old value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapPutTest3800';
      console.info(`${caseName}, test start`);

      const box: SendableBox = new SendableBox(1);
      const map: collections.Map<SendableBox, string> = new collections.Map<SendableBox, string>();
      expect(map.put(box, 'a')).assertEqual(undefined);
      expect(map.put(box, 'b')).assertEqual('a');
      expect(map.get(box)).assertEqual('b');
      expect(map.size).assertEqual(1);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapPutTest3900
     * @tc.number SUB_COLLECTIONS_MAP_PUT_3900
     * @tc.desc   Verify detached put method call throws 10200011 bind error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapPutTest3900';
      console.info(`${caseName}, test start`);

      const map: collections.Map<number, string> = new collections.Map<number, string>();
      const detached = map.put;
      let errorCaught: boolean = false;
      try {
        detached(1, 'a');
      } catch (err) {
        errorCaught = true;
        expect(err.code).assertEqual(10200011);
      }
      expect(errorCaught).assertTrue();

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   collectionsMapPutTest4000
     * @tc.number SUB_COLLECTIONS_MAP_PUT_4000
     * @tc.desc   Verify put works after Map is transferred across TaskPool threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsMapPutTest4000';
        console.info(`${caseName}, test start`);
        try {
          const map: collections.Map<number, string> = new collections.Map<number, string>();
          const result = await taskpool.execute(crossThreadPutTask, map) as CrossThreadMapResult;
          expect(result.putOldValue).assertEqual('');
          expect(result.finalSize).assertEqual(1);
          expect(map.size).assertEqual(1);
          expect(map.get(1)).assertEqual('a');
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsMapPutTest4100
     * @tc.number SUB_COLLECTIONS_MAP_PUT_4100
     * @tc.desc   Verify collections.Map instanceof and put method availability.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName: string = 'collectionsMapPutTest4100';
      console.info(`${caseName}, test start`);

      const map: collections.Map<number, string> = new collections.Map<number, string>();
      expect(map instanceof collections.Map).assertEqual(true);
      expect(map.put !== undefined).assertEqual(true);
      expect(map.size).assertEqual(0);

      console.info(`${caseName}, test end`);
    });
  });
}
