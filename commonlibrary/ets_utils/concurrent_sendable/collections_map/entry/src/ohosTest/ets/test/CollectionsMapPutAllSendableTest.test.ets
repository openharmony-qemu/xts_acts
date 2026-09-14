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

import { collections, worker, MessageEvents } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';


function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

class MapPutAllMessage {
  map?: Object;
  source?: Object;
}

function executeMapPutAllWorker(map: collections.Map<number, string>,
  source: collections.Map<number, string>): Promise<number> {
  return new Promise<number>((resolve: (value: number) => void,
    reject: (reason: Error) => void): void => {
    const workerInstance: worker.ThreadWorker =
      new worker.ThreadWorker("./workers/MapPutAllWorker");
    let settled: boolean = false;
    const msg: MapPutAllMessage = new MapPutAllMessage();
    msg.map = map;
    msg.source = source;
    workerInstance.onmessage = (event: MessageEvents): void => {
      settled = true;
      resolve(event.data as number);
      workerInstance.terminate();
    };
    workerInstance.onerror = (): void => {
      if (!settled) {
        settled = true;
        reject(new Error("MapPutAllWorker error"));
      }
      workerInstance.terminate();
    };
    workerInstance.postMessage(msg);
  });
}

@Sendable
class CollectionsMapSubclass extends collections.Map<number, string> {
  constructor(entries?: readonly (readonly [number, string])[] | null) {
    super(entries);
  }
}

export default function CollectionsMapPutAllSendableTest(): void {
  describe('CollectionsMapPutAllSendableTest', (): void => {
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
     * @tc.name   collectionsMapPutAllTest0900
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_0900
     * @tc.desc   Verify putAll batch write 1000 entries from collections.Map source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapPutAllTest0900';
        console.info(`${caseName}, test start`);
        const map: collections.Map<number, string> = new collections.Map<number, string>();
        map.put(1, 'a');
        const source: collections.Map<number, string> = new collections.Map<number, string>();
        for (let i: number = 0; i < 1000; i++) {
          source.put(i, 'v' + i);
        }
        map.putAll(source);
        expect(map.size).assertEqual(1000);
        expect(map.get(500)).assertEqual('v500');
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsMapPutAllTest1000
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_1000
     * @tc.desc   Verify putAll with receiver.entries() triggers concurrent modification error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapPutAllTest1000';
        console.info(`${caseName}, test start`);
        const map: collections.Map<number, string> = new collections.Map<number, string>();
        map.put(1, 'a');
        map.put(2, 'b');
        try {
          map.putAll(new collections.Map<number, string>(map.entries()));
        } catch (error) {
          expect(true).assertFail();
        }
        expect(map.size).assertEqual(2);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsMapPutAllTest1100
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_1100
     * @tc.desc   Verify Worker receives Map and calls putAll correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsMapPutAllTest1100';
        console.info(`${caseName}, test start`);
        try {
          const map: collections.Map<number, string> = new collections.Map<number, string>();
          map.put(1, 'a');
          const source: collections.Map<number, string> = new collections.Map<number, string>();
          source.put(2, 'b');
          source.put(3, 'c');
          const size: number = await executeMapPutAllWorker(map, source);
          expect(size).assertEqual(3);
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsMapPutAllTest1200
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_1200
     * @tc.desc   Verify putAll at 1023/1024/1025 entry boundaries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapPutAllTest1200';
        console.info(`${caseName}, test start`);
        for (let n: number = 1023; n <= 1025; n++) {
          const map: collections.Map<number, string> = new collections.Map<number, string>();
          const source: collections.Map<number, string> = new collections.Map<number, string>();
          for (let i: number = 0; i < n; i++) {
            source.put(i, 'v' + i);
          }
          map.putAll(source);
          expect(map.size).assertEqual(n);
          expect(map.get(0)).assertEqual('v0');
          const mid: number = Math.floor(n / 2);
          expect(map.get(mid)).assertEqual('v' + mid);
          expect(map.get(n - 1)).assertEqual('v' + (n - 1));
          map.put(n, 'extra');
          expect(map.size).assertEqual(n + 1);
        }
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsMapPutAllTest3000
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_3000
     * @tc.desc   Verify putAll accepts collections.Map source and overwrites existing keys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapPutAllTest3000';
        console.info(`${caseName}, test start`);
        const receiver: collections.Map<number, string> =
          new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
        const source: collections.Map<number, string> =
          new collections.Map<number, string>([[3, 'three'], [1, 'ONE'], [4, 'four']]);
        expect(typeof receiver.putAll(source)).assertEqual('undefined');
        expect(receiver.size).assertEqual(4);
        expect(receiver.has(1)).assertEqual(true);
        expect(receiver.get(1)).assertEqual('ONE');
        expect(receiver.has(2)).assertEqual(true);
        expect(receiver.get(2)).assertEqual('two');
        expect(receiver.has(3)).assertEqual(true);
        expect(receiver.get(3)).assertEqual('three');
        expect(receiver.has(4)).assertEqual(true);
        expect(receiver.get(4)).assertEqual('four');
        expect(source.size).assertEqual(3);
        expect(source.has(3)).assertEqual(true);
        expect(source.get(3)).assertEqual('three');
        expect(source.has(1)).assertEqual(true);
        expect(source.get(1)).assertEqual('ONE');
        expect(source.has(4)).assertEqual(true);
        expect(source.get(4)).assertEqual('four');
        expect(receiver.size).assertEqual(4);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsMapPutAllTest3200
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_3200
     * @tc.desc   Verify putAll with empty collections.Map source is a no-op.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapPutAllTest3200';
        console.info(`${caseName}, test start`);
        const receiver: collections.Map<number, string> =
          new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
        expect(typeof receiver.putAll(new collections.Map<number, string>())).assertEqual('undefined');
        expect(receiver.size).assertEqual(2);
        expect(receiver.has(1)).assertEqual(true);
        expect(receiver.get(1)).assertEqual('one');
        expect(receiver.has(2)).assertEqual(true);
        expect(receiver.get(2)).assertEqual('two');
        expect(receiver.size).assertEqual(2);
        const emptyReceiver: collections.Map<number, string> = new collections.Map<number, string>();
        expect(typeof emptyReceiver.putAll(new collections.Map<number, string>())).assertEqual('undefined');
        expect(emptyReceiver.size).assertEqual(0);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsMapPutAllTest3400
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_3400
     * @tc.desc   Verify putAll with self as source is a no-op.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapPutAllTest3400';
        console.info(`${caseName}, test start`);
        const receiver: collections.Map<number, string> =
          new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
        expect(typeof receiver.putAll(receiver)).assertEqual('undefined');
        expect(receiver.size).assertEqual(2);
        expect(receiver.has(1)).assertEqual(true);
        expect(receiver.get(1)).assertEqual('one');
        expect(receiver.has(2)).assertEqual(true);
        expect(receiver.get(2)).assertEqual('two');
        expect(receiver.size).assertEqual(2);
        const emptyReceiver: collections.Map<number, string> = new collections.Map<number, string>();
        expect(typeof emptyReceiver.putAll(emptyReceiver)).assertEqual('undefined');
        expect(emptyReceiver.size).assertEqual(0);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsMapPutAllTest3500
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_3500
     * @tc.desc   Verify putAll with collections.Map source containing consecutive duplicate keys keeps last value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapPutAllTest3500';
        console.info(`${caseName}, test start`);
        const source: collections.Map<number, string> =
          new collections.Map<number, string>([[1, 'a'], [1, 'b'], [2, 'c']]);
        expect(source.size).assertEqual(2);
        expect(source.get(1)).assertEqual('b');
        const receiver: collections.Map<number, string> =
          new collections.Map<number, string>([[1, 'old'], [3, 'three']]);
        receiver.putAll(source);
        expect(receiver.size).assertEqual(3);
        expect(receiver.get(1)).assertEqual('b');
        expect(receiver.get(2)).assertEqual('c');
        expect(receiver.get(3)).assertEqual('three');
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsMapPutAllTest3700
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_3700
     * @tc.desc   Verify putAll with collections.Map source of 10250 entries to empty receiver.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapPutAllTest3700';
        console.info(`${caseName}, test start`);
        const source: collections.Map<number, string> = new collections.Map<number, string>();
        for (let i: number = 0; i < 10250; i++) {
          source.put(i, 'v' + i);
        }
        expect(source.size).assertEqual(10250);
        const receiver: collections.Map<number, string> = new collections.Map<number, string>();
        receiver.putAll(source);
        expect(receiver.size).assertEqual(10250);
        expect(receiver.get(0)).assertEqual('v0');
        expect(receiver.get(5125)).assertEqual('v5125');
        expect(receiver.get(10249)).assertEqual('v10249');
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsMapPutAllTest3800
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_3800
     * @tc.desc   Verify putAll accepts a collections.Map subclass as source and overwrites existing keys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapPutAllTest3800';
        console.info(`${caseName}, test start`);
        const receiver: collections.Map<number, string> =
          new collections.Map<number, string>([[1, 'old'], [2, 'two']]);
        const source: CollectionsMapSubclass =
          new CollectionsMapSubclass([[1, 'new'], [3, 'three']]);
        expect(typeof receiver.putAll(source)).assertEqual('undefined');
        expect(receiver.size).assertEqual(3);
        expect(receiver.get(1)).assertEqual('new');
        expect(receiver.get(2)).assertEqual('two');
        expect(receiver.get(3)).assertEqual('three');
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsMapPutAllTest3900
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_3900
     * @tc.desc   Verify putAll called on a detached method throws 10200011 bind error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapPutAllTest3900';
        console.info(`${caseName}, test start`);
        const map: collections.Map<number, string> = new collections.Map<number, string>();
        map.put(1, 'a');
        const source: collections.Map<number, string> = new collections.Map<number, string>();
        source.put(2, 'b');
        const detached: (source: collections.Map<number, string>) => void = map.putAll;
        try {
          detached(source);
          expect(true).assertFail();
        } catch (error) {
          expect(error.code).assertEqual(10200011);
        }
        console.info(`${caseName}, test end`);
      });


    /**
     * @tc.name   collectionsMapPutAllTest4100
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_4100
     * @tc.desc   Verify putAll called inside forEach callback triggers 10200201 concurrent modification error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapPutAllTest4100';
        console.info(`${caseName}, test start`);
        const map: collections.Map<number, string> = new collections.Map<number, string>();
        map.put(1, 'a');
        map.put(2, 'b');
        map.put(3, 'c');
        try {
          map.forEach((v: string, k: number): void => {
            map.putAll(map);
          });
          expect(true).assertFail();
        } catch (error) {
          expect(error.code).assertEqual(10200201);
        }
        console.info(`${caseName}, test end`);
      });
  });
}
