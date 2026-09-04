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

import { collections, BuiltinMap, taskpool, worker, MessageEvents } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';


function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

@Concurrent
function builtinPutAllTask(map: collections.Map<number, string>): number {
  const source: Map<number, string> = new Map<number, string>();
  source.set(1, 'a');
  source.set(2, 'b');
  source.set(3, 'c');
  map.putAll(source);
  return map.size;
}

class MapPutAllBuiltinMessage {
  map?: Object;
}

function executeMapPutAllBuiltinWorker(map: collections.Map<number, string>): Promise<number> {
  return new Promise<number>((resolve: (value: number) => void,
    reject: (reason: Error) => void): void => {
    const workerInstance: worker.ThreadWorker =
      new worker.ThreadWorker("./workers/MapPutAllBuiltinWorker");
    let settled: boolean = false;
    workerInstance.onmessage = (event: MessageEvents): void => {
      settled = true;
      resolve(event.data as number);
      workerInstance.terminate();
    };
    workerInstance.onerror = (): void => {
      if (!settled) {
        settled = true;
        reject(new Error("MapPutAllBuiltinWorker error"));
      }
      workerInstance.terminate();
    };
    workerInstance.postMessage(map);
  });
}

export default function CollectionsMapPutAllBuiltinTest(): void {
  describe('CollectionsMapPutAllBuiltinTest', (): void => {
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
     * @tc.name   collectionsMapPutAllTest3100
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_3100
     * @tc.desc   Verify putAll accepts builtin Map source and overwrites existing keys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapPutAllTest3100';
        console.info(`${caseName}, test start`);
        const receiver: collections.Map<number, string> =
          new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
        const source: Map<number, string> =
          new Map<number, string>([[2, 'TWO'], [4, 'four'], [1, 'one']]);
        expect(typeof receiver.putAll(source)).assertEqual('undefined');
        expect(receiver.size).assertEqual(3);
        expect(receiver.has(1)).assertEqual(true);
        expect(receiver.get(1)).assertEqual('one');
        expect(receiver.has(2)).assertEqual(true);
        expect(receiver.get(2)).assertEqual('TWO');
        expect(receiver.has(4)).assertEqual(true);
        expect(receiver.get(4)).assertEqual('four');
        expect(source.size).assertEqual(3);
        expect(source.get(2)).assertEqual('TWO');
        expect(receiver.size).assertEqual(3);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsMapPutAllTest3300
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_3300
     * @tc.desc   Verify putAll with empty builtin Map source is a no-op.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapPutAllTest3300';
        console.info(`${caseName}, test start`);
        const receiver: collections.Map<number, string> =
          new collections.Map<number, string>([[1, 'one'], [2, 'two']]);
        expect(typeof receiver.putAll(new Map<number, string>())).assertEqual('undefined');
        expect(receiver.size).assertEqual(2);
        expect(receiver.has(1)).assertEqual(true);
        expect(receiver.get(1)).assertEqual('one');
        expect(receiver.has(2)).assertEqual(true);
        expect(receiver.get(2)).assertEqual('two');
        expect(receiver.size).assertEqual(2);
        const emptyReceiver: collections.Map<number, string> = new collections.Map<number, string>();
        expect(typeof emptyReceiver.putAll(new Map<number, string>())).assertEqual('undefined');
        expect(emptyReceiver.size).assertEqual(0);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsMapPutAllTest3600
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_3600
     * @tc.desc   Verify putAll with builtin Map source containing consecutive duplicate keys keeps last value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapPutAllTest3600';
        console.info(`${caseName}, test start`);
        const source: Map<number, string> =
          new Map<number, string>([[1, 'a'], [1, 'b'], [2, 'c']]);
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
     * @tc.name   collectionsMapPutAllTest4300
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_4300
     * @tc.desc   Verify putAll with builtin Map source of 10250 entries to empty receiver.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapPutAllTest4300';
        console.info(`${caseName}, test start`);
        const source: Map<number, string> = new Map<number, string>();
        for (let i: number = 0; i < 10250; i++) {
          source.set(i, 'v' + i);
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
     * @tc.name   collectionsMapPutAllTest4400
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_4400
     * @tc.desc   Verify putAll batch write 1000 entries from builtin Map source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapPutAllTest4400';
        console.info(`${caseName}, test start`);
        const map: collections.Map<number, string> = new collections.Map<number, string>();
        map.put(1, 'a');
        const source: Map<number, string> = new Map<number, string>();
        for (let i: number = 0; i < 1000; i++) {
          source.set(i, 'v' + i);
        }
        map.putAll(source);
        expect(map.size).assertEqual(1000);
        expect(map.get(500)).assertEqual('v500');
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsMapPutAllTest4000
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_4000
     * @tc.desc   Verify putAll at 1023/1024/1025 entry boundaries with builtin Map source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapPutAllTest4000';
        console.info(`${caseName}, test start`);
        for (let n: number = 1023; n <= 1025; n++) {
          const map: collections.Map<number, string> = new collections.Map<number, string>();
          const source: Map<number, string> = new Map<number, string>();
          for (let i: number = 0; i < n; i++) {
            source.set(i, 'v' + i);
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
     * @tc.name   collectionsMapPutAllTest4500
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_4500
     * @tc.desc   Verify putAll with builtin Map source created in TaskPool child thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsMapPutAllTest4500';
        console.info(`${caseName}, test start`);
        try {
          const map: collections.Map<number, string> = new collections.Map<number, string>();
          const size: number = await taskpool.execute(builtinPutAllTask, map) as number;
          expect(size).assertEqual(3);
          expect(map.size).assertEqual(3);
          expect(map.has(1)).assertEqual(true);
          expect(map.get(1)).assertEqual('a');
          expect(map.has(2)).assertEqual(true);
          expect(map.get(2)).assertEqual('b');
          expect(map.has(3)).assertEqual(true);
          expect(map.get(3)).assertEqual('c');
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsMapPutAllTest4200
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_4200
     * @tc.desc   Verify putAll with builtin Map source created in Worker child thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsMapPutAllTest4200';
        console.info(`${caseName}, test start`);
        try {
          const map: collections.Map<number, string> = new collections.Map<number, string>();
          const size: number = await executeMapPutAllBuiltinWorker(map);
          expect(size).assertEqual(3);
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsMapPutAllTest4600
     * @tc.number SUB_COLLECTIONS_MAP_PUT_ALL_4600
     * @tc.desc   Verify putAll with explicitly declared BuiltinMap type source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsMapPutAllTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsMapPutAllTest4600';
        console.info(`${caseName}, test start`);
        const map: collections.Map<number, string> = new collections.Map<number, string>();
        const source: BuiltinMap<number, string> = new Map<number, string>();
        source.set(1, 'a');
        source.set(2, 'b');
        source.set(3, 'c');
        map.putAll(source);
        expect(map.size).assertEqual(3);
        expect(map.get(1)).assertEqual('a');
        expect(map.get(2)).assertEqual('b');
        expect(map.get(3)).assertEqual('c');
        console.info(`${caseName}, test end`);
      });
  });
}
