/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
// ArrayConcurrent.test.ets 5.3 注解测试中 @Concurrent装饰验证 的需求


import { describe, it, beforeEach, expect, TestType, Size, Level } from '@ohos/hypium';
import { collections, taskpool, ArkTSUtils } from '@kit.ArkTS';
import { NumberWrapper } from './test_data/TestDataFactory';

@Concurrent
async function processArraySum(arr: collections.Array<number>, lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    let sum: number = 0;
    let length: number = arr.length;
    for (let i: number = 0; i < length; i++) {
      let val: number = arr[i];
      sum = sum + val;
    }
    return sum;
  });
}

@Concurrent
async function processArrayCount(arr: collections.Array<NumberWrapper>, lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    let count: number = 0;
    let length: number = arr.length;
    for (let i: number = 0; i < length; i++) {
      count = count + 1;
    }
    return count;
  });
}

@Concurrent
async function processArrayMap(arr: collections.Array<number>, lock: ArkTSUtils.locks.AsyncLock): Promise<collections.Array<number>> {
  return await lock.lockAsync(async (): Promise<collections.Array<number>> => {
    let result: collections.Array<number> = new collections.Array<number>();
    let length: number = arr.length;
    for (let i: number = 0; i < length; i++) {
      let val: number = arr[i];
      result.push(val * 2);
    }
    return result;
  });
}

@Concurrent
async function processArrayFilter(arr: collections.Array<number>, lock: ArkTSUtils.locks.AsyncLock): Promise<collections.Array<number>> {
  return await lock.lockAsync(async (): Promise<collections.Array<number>> => {
    let result: collections.Array<number> = new collections.Array<number>();
    let length: number = arr.length;
    for (let i: number = 0; i < length; i++) {
      let val: number = arr[i];
      if (val > 3) {
        result.push(val);
      }
    }
    return result;
  });
}

export default function suite() {
  describe('ArrayConcurrentTests', () => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONCURRENT_0100
     * @tc.name testArrayConcurrent0001
     * @tc.desc Verify that Array can be transferred across threads via TaskPool and sum is correct.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConcurrent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const caseName: string = 'testArrayConcurrent0001';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let result: number = await taskpool.execute(processArraySum, arr, lock) as number;
      expect(result).assertEqual(15);

      console.info(`${caseName}, test end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONCURRENT_0200
     * @tc.name testArrayConcurrent0002
     * @tc.desc Verify that Array can be processed with map operation in TaskPool.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConcurrent0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const caseName: string = 'testArrayConcurrent0002';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let result: collections.Array<number> = await taskpool.execute(processArrayMap, arr, lock) as collections.Array<number>;
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);

      console.info(`${caseName}, test end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONCURRENT_0300
     * @tc.name testArrayConcurrent0003
     * @tc.desc Verify that Array can be processed with filter operation in TaskPool.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConcurrent0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const caseName: string = 'testArrayConcurrent0003';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let result: collections.Array<number> = await taskpool.execute(processArrayFilter, arr, lock) as collections.Array<number>;
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(5);

      console.info(`${caseName}, test end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_ARRAY_CONCURRENT_0400
     * @tc.name testArrayConcurrent0004
     * @tc.desc Verify that Array containing Sendable objects can be processed in TaskPool.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConcurrent0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const caseName: string = 'testArrayConcurrent0004';
      console.info(`${caseName}, test start`);

      let arr: collections.Array<NumberWrapper> = new collections.Array<NumberWrapper>();
      arr.push(new NumberWrapper(1));
      arr.push(new NumberWrapper(2));
      arr.push(new NumberWrapper(3));
      arr.push(new NumberWrapper(4));
      arr.push(new NumberWrapper(5));
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      let result: number = await taskpool.execute(processArrayCount, arr, lock) as number;
      expect(result).assertEqual(5);

      console.info(`${caseName}, test end`);
      done();
    });
  });
}
