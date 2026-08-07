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

import { describe, it, expect, TestType, Size, Level, beforeEach } from '@ohos/hypium';
import { ArkTSUtils, collections } from '@kit.ArkTS';
import { lang } from '@kit.ArkTS';
import { taskpool } from '@kit.ArkTS';

@Concurrent
function concurrentTest(): boolean {
  const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
  cache.put('test', 'value');
  return cache.get('test') === 'value';
}

@Concurrent
function concurrentTestWithCache(cache: ArkTSUtils.SendableLruCache<string, string>): string | undefined {
  return cache.get('key');
}

@Concurrent
function concurrentCacheTask(): boolean {
  try {
    const cache = new ArkTSUtils.SendableLruCache<string, number>(10);
    cache.put('key1', 100);
    cache.put('key2', 200);
    cache.put('key3', 300);
    const value1: number | undefined = cache.get('key1');
    const value2: number | undefined = cache.get('key2');
    const value3: number | undefined = cache.get('key3');
    cache.remove('key2');
    const deletedValue: number | undefined = cache.get('key2');
    for (let i: number = 0; i < 15; i++) {
      cache.put(`key_${i}`, i);
    }
    const size: number = cache.length;
    if (size > 10) {
      throw new Error(`Cache size exceeds limit: ${size}`);
    }
    if (value1 !== 100 || value2 !== 200 || value3 !== 300) {
      throw new Error('Cache data integrity check failed');
    }
    if (deletedValue !== undefined) {
      throw new Error('Deleted value should be undefined');
    }
    return true;
  } catch (error) {
    console.error('Concurrent task failed:', (error as Error).message);
    return false;
  }
}

@Sendable
class DefaultStringCache extends ArkTSUtils.SendableLruCache<string, string> {
  public createCallCount: number = 0;
  protected createDefault(_: string): string {
    this.createCallCount++;
    return 'created';
  }
}

// ============================================================
// 0. 包装类定义 - 用于测试空值场景
// ============================================================

export default function sendableLruCacheSpecialTest() {
  describe('sendableLruCacheSpecialTest', () => {

    /**
     * @tc.setup 在每个测试用例执行前等待20ms
     */
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    // ============================================================
    // 1. LRU淘汰机制 (4个)
    // ============================================================

    /**
     * @tc.name   testLRUEvictionCapacityFull0001
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_0100
     * @tc.desc   LRU evicts oldest entry when capacity is full
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testLRUEvictionCapacityFull0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testLRUEvictionCapacityFull0001';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(2);
      cache.put('key1', 'value1');
      cache.put('key2', 'value2');
      cache.put('key3', 'value3');
      expect(cache.length).assertEqual(2);
      expect(cache.get('key1')).assertUndefined();
      expect(cache.get('key2')).assertEqual('value2');
      expect(cache.get('key3')).assertEqual('value3');
      expect(cache.getRemoveCount()).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testLRUAccessUpdateOrder0002
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_0200
     * @tc.desc   LRU access updates order, evicts least recently accessed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testLRUAccessUpdateOrder0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testLRUAccessUpdateOrder0002';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(2);
      cache.put('key1', 'value1');
      cache.put('key2', 'value2');
      cache.get('key1');
      cache.put('key3', 'value3');
      expect(cache.length).assertEqual(2);
      expect(cache.get('key1')).assertEqual('value1');
      expect(cache.get('key2')).assertUndefined();
      expect(cache.get('key3')).assertEqual('value3');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testLRUCapacityShrinkEviction0003
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_0300
     * @tc.desc   Capacity shrink evicts entries exceeding new capacity, keeps most recent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testLRUCapacityShrinkEviction0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testLRUCapacityShrinkEviction0003';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(64);
      for (let i = 1; i <= 10; i++) {
        cache.put('key' + i, 'value' + i);
      }
      cache.updateCapacity(2);
      expect(cache.length).assertEqual(2);
      expect(cache.get('key1')).assertUndefined();
      expect(cache.get('key8')).assertUndefined();
      expect(cache.get('key9')).assertEqual('value9');
      expect(cache.get('key10')).assertEqual('value10');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testLRUPutUpdateNoEviction0004
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_0400
     * @tc.desc   Repeated put updates value but does not
     *            increase length or trigger eviction
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testLRUPutUpdateNoEviction0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testLRUPutUpdateNoEviction0004';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(2);
      cache.put('key1', 'value1');
      cache.put('key1', 'value1_new');
      cache.put('key2', 'value2');
      expect(cache.length).assertEqual(2);
      expect(cache.contains('key1')).assertTrue();
      expect(cache.contains('key2')).assertTrue();
      expect(cache.get('key1')).assertEqual('value1_new');
      console.info(`${caseName}, test end`);
    });

    // ============================================================
    // 2. 容量管理 (7个)
    // ============================================================

    /**
     * @tc.name   testCapacityDefault0005
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_0500
     * @tc.desc   Default capacity is 64 when no parameter provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCapacityDefault0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testCapacityDefault0005';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>();
      expect(cache.getCapacity()).assertEqual(64);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testCapacityCustom0006
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_0600
     * @tc.desc   Custom capacity is set correctly via constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCapacityCustom0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testCapacityCustom0006';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      expect(cache.getCapacity()).assertEqual(10);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testCapacityOne0007
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_0700
     * @tc.desc   Capacity of 1 only keeps the most recent entry
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCapacityOne0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testCapacityOne0007';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(1);
      cache.put('key1', 'value1');
      cache.put('key2', 'value2');
      expect(cache.length).assertEqual(1);
      expect(cache.get('key1')).assertUndefined();
      expect(cache.get('key2')).assertEqual('value2');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testCapacityLarge0008
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_0800
     * @tc.desc   Large capacity (1000) works correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCapacityLarge0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testCapacityLarge0008';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, string>(1000);
      expect(cache.getCapacity()).assertEqual(1000);
      for (let i = 0; i < 500; i++) {
        cache.put(i, 'value' + i);
      }
      expect(cache.length).assertEqual(500);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testUpdateCapacity0009
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_0900
     * @tc.desc   Update capacity at runtime, getCapacity
     *            returns new capacity, excess entries evicted
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testUpdateCapacity0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testUpdateCapacity0009';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(20);
      for (let i = 1; i <= 20; i++) {
        cache.put('key' + i, 'value' + i);
      }
      cache.updateCapacity(10);
      expect(cache.getCapacity()).assertEqual(10);
      expect(cache.length).assertEqual(10);
      for (let i = 1; i <= 10; i++) {
        expect(cache.get('key' + i)).assertUndefined();
      }
      for (let i = 11; i <= 20; i++) {
        expect(cache.get('key' + i)).assertEqual('value' + i);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testCapacityErrorZero0010
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_1000
     * @tc.desc   Constructor with capacity 0 throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCapacityErrorZero0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testCapacityErrorZero0010';
      console.info(`${caseName}, test start`);
      try {
        new ArkTSUtils.SendableLruCache<string, string>(0);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code).assertEqual(401);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testCapacityErrorNegative0011
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_1100
     * @tc.desc   Constructor with negative capacity throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCapacityErrorNegative0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testCapacityErrorNegative0011';
      console.info(`${caseName}, test start`);
      try {
        new ArkTSUtils.SendableLruCache<string, string>(-1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code).assertEqual(401);
      }
      console.info(`${caseName}, test end`);
    });

    // ============================================================
    // 3. 统计方法 (6个)
    // ============================================================

    /**
     * @tc.name   testStatisticsPutCount0012
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_1200
     * @tc.desc   Put count increments correctly for all put operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testStatisticsPutCount0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testStatisticsPutCount0012';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      cache.put('key1', 'value1');
      cache.put('key2', 'value2');
      cache.put('key3', 'value3');
      expect(cache.getPutCount()).assertEqual(3);
      cache.put('key1', 'value1_new');
      expect(cache.getPutCount()).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testStatisticsMatchCount0013
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_1300
     * @tc.desc   Match count increments for successful cache hits
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testStatisticsMatchCount0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testStatisticsMatchCount0013';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      cache.put('key1', 'value1');
      cache.get('key1');
      cache.get('key1');
      cache.get('key1');
      expect(cache.getMatchCount()).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testStatisticsMissCount0014
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_1400
     * @tc.desc   Miss count increments for cache misses
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testStatisticsMissCount0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testStatisticsMissCount0014';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      cache.put('key1', 'value1');  //  先put一个存在的键
      cache.get('key2');  // 第1次miss
      cache.get('key3');  // 第2次miss
      expect(cache.getMissCount()).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testStatisticsRemoveCount0015
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_1500
     * @tc.desc   Remove count tracks evicted entries correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testStatisticsRemoveCount0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testStatisticsRemoveCount0015';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(2);
      cache.put('key1', 'value1');
      cache.put('key2', 'value2');
      cache.put('key3', 'value3');
      expect(cache.getRemoveCount()).assertEqual(1);
      cache.put('key4', 'value4');
      expect(cache.getRemoveCount()).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testStatisticsCreateCount0016
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_1600
     * @tc.desc   Test getCreateCount statistics for
     *            createDefault calls on missing keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testStatisticsCreateCount0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testStatisticsCreateCount0016';
      console.info(`${caseName}, test start`);
      const cache = new DefaultStringCache(10);
      // 场景1：初始状态，未触发任何createDefault
      expect(cache.createCallCount).assertEqual(0);
      expect(cache.getCreateCount()).assertEqual(0);
      cache.put('key1', 'value1');
      // 场景2：获取已存在key，不会调用createDefault
      cache.get('key1');
      expect(cache.createCallCount).assertEqual(0);
      expect(cache.getCreateCount()).assertEqual(0);
      // 场景3：获取两个不同不存在key，触发两次创建
      cache.get('key2');
      cache.get('key3');
      expect(cache.createCallCount).assertEqual(2);
      expect(cache.getCreateCount()).assertEqual(cache.createCallCount);
      // 场景4：重复获取同一个缺失key，不再重复创建
      cache.get('key2');
      cache.get('key2');
      expect(cache.createCallCount).assertEqual(2);
      expect(cache.getCreateCount()).assertEqual(cache.createCallCount);
      console.info(`${caseName}, test end`);
    });

    // 验证 clear() 后统计计数器不清零（SDK 设计行为：统计为累计值，clear 不重置）。
    // /**
    //  * @tc.name   testStatisticsClearReset0017
    //  * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_1700
    //  * @tc.desc   clear() removes all entries but statistics counters persist
    //  * @tc.type   FUNCTION
    //  * @tc.size   SMALLTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testStatisticsClearReset0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testStatisticsClearReset0017';
    //   console.info(`${caseName}, test start`);
    //   const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
    //   cache.put('key1', 'value1');
    //   cache.put('key2', 'value2');
    //   cache.get('key1');
    //   cache.get('key2');
    //   cache.get('key3');
    //   cache.put('key3', 'value3');
    //
    //   expect(cache.getPutCount()).assertEqual(3);
    //   expect(cache.getMatchCount()).assertEqual(2);
    //   expect(cache.getMissCount()).assertEqual(1);
    //   expect(cache.getRemoveCount()).assertEqual(0);
    //   cache.clear();
    //   expect(cache.length).assertEqual(0);
    //   expect(cache.isEmpty()).assertTrue();
    //   console.info(`${caseName}, test end`);

    //   /* 以下为设计要求的验证点（当前 SDK 不支持）：
    //   * expect(cache.getPutCount()).assertEqual(0);
    //   * expect(cache.getMatchCount()).assertEqual(0);
    //   * expect(cache.getMissCount()).assertEqual(0);
    //   * expect(cache.getRemoveCount()).assertEqual(0);
    //   * 原因：SendableLruCache 统计为生命周期累计值，
    //   * clear() 不对其清零，且无 resetStatistics 类接口。*/
    // });

    // ============================================================
    // 4.1 entries方法详细测试 (7个)
    // ============================================================

    /**
     * @tc.name   testEntriesNumberNormal0018
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_1800
     * @tc.desc   entries() returns an iterable iterator yielding number key-value pairs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testEntriesNumberNormal0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testEntriesNumberNormal0018';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, number>(10);
      cache.put(100, 100);
      const entries: IterableIterator<[number, number]> = cache.entries();
      let count: number = 0;
      let next: IteratorResult<[number, number]> = entries.next();
      while (!next.done) {
        expect(next.value[0]).assertEqual(100);
        expect(next.value[1]).assertEqual(100);
        count++;
        next = entries.next();
      }
      expect(count).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testEntriesForOfIteration0019
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_1900
     * @tc.desc   entries() supports for...of iteration and
     *            yields entries in LRU access order
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testEntriesForOfIteration0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testEntriesForOfIteration0019';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      cache.put('key1', 'value1');
      cache.put('key2', 'value2');
      const entries: IterableIterator<[string, string]> = cache.entries();
      let forOfCount: number = 0;
      let firstKey: string = '';
      let lastKey: string = '';
      for (const entry of entries) {
        if (forOfCount === 0) {
          firstKey = entry[0];
        }
        lastKey = entry[0];
        forOfCount++;
        expect(typeof entry[0] === 'string').assertTrue();
        expect(typeof entry[1] === 'string').assertTrue();
      }
      expect(forOfCount).assertEqual(2);
      expect(firstKey).assertEqual('key1');
      expect(lastKey).assertEqual('key2');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testEntriesStringNormal0020
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_2000
     * @tc.desc   entries() yields key-value pairs with UTF-8 and Chinese string content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testEntriesStringNormal0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testEntriesStringNormal0020';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      cache.put('test测试123', 'test测试123');
      const entries: IterableIterator<[string, string]> = cache.entries();
      let count: number = 0;
      let next: IteratorResult<[string, string]> = entries.next();
      while (!next.done) {
        expect(next.value[0]).assertEqual('test测试123');
        expect(next.value[1]).assertEqual('test测试123');
        count++;
        next = entries.next();
      }
      expect(count).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testEntriesSendableClass0021
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_2100
     * @tc.desc   entries() yields entries where both
     *            key and value reference the same Sendable instance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testEntriesSendableClass0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testEntriesSendableClass0021';
      console.info(`${caseName}, test start`);
      @Sendable
      class TestObj implements lang.ISendable {
        id: number = 1;
        name: string = 'test';
      }
      const cache = new ArkTSUtils.SendableLruCache<TestObj, TestObj>(10);
      const obj: TestObj = new TestObj();
      cache.put(obj, obj);
      const entries: IterableIterator<[TestObj, TestObj]> = cache.entries();
      let count: number = 0;
      let next: IteratorResult<[TestObj, TestObj]> = entries.next();
      while (!next.done) {
        expect(next.value[0]).assertEqual(obj);
        expect(next.value[1]).assertEqual(obj);
        count++;
        next = entries.next();
      }
      expect(count).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testEntriesNestedMap0022
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_2200
     * @tc.desc   entries() yields entries with SendableLruCache instances as values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testEntriesNestedMap0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testEntriesNestedMap0022';
      console.info(`${caseName}, test start`);
      const innerMap: ArkTSUtils.SendableLruCache<string, string> =
        new ArkTSUtils.SendableLruCache<string, string>(5);
      innerMap.put('inner', 'value');
      const cache = new ArkTSUtils.SendableLruCache<string, ArkTSUtils.SendableLruCache<string, string>>(10);
      cache.put('mapKey', innerMap);
      const entries: IterableIterator<[string, ArkTSUtils.SendableLruCache<string, string>]> = cache.entries();
      let count: number = 0;
      let next: IteratorResult<[string, ArkTSUtils.SendableLruCache<string, string>]> = entries.next();
      while (!next.done) {
        expect(next.value[0]).assertEqual('mapKey');
        expect(next.value[1]).assertEqual(innerMap);
        count++;
        next = entries.next();
      }
      expect(count).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testEntriesMultipleCalls0023
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_2300
     * @tc.desc   Repeated calls to entries() produce independent iterable iterators
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testEntriesMultipleCalls0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testEntriesMultipleCalls0023';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      cache.put('key1', 'value1');
      cache.put('key2', 'value2');
      const entries1: IterableIterator<[string, string]> = cache.entries();
      const entries2: IterableIterator<[string, string]> = cache.entries();
      expect(entries1 !== entries2).assertTrue();
      let count1: number = 0;
      let next1: IteratorResult<[string, string]> = entries1.next();
      while (!next1.done) {
        count1++;
        next1 = entries1.next();
      }
      expect(count1).assertEqual(2);
      let count2: number = 0;
      let next2: IteratorResult<[string, string]> = entries2.next();
      while (!next2.done) {
        count2++;
        next2 = entries2.next();
      }
      expect(count2).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testEntriesEmptyCache0024
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_2400
     * @tc.desc   entries() on an empty cache returns an iterator that is immediately done
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testEntriesEmptyCache0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testEntriesEmptyCache0024';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      const entries: IterableIterator<[string, string]> = cache.entries();
      expect(entries.next().done).assertTrue();
      console.info(`${caseName}, test end`);
    });

    // ============================================================
    // 4.2 keys方法详细测试 (8个) 实际：6个，有两个因为SendableLruCache 的限制而注释
    // ============================================================

    /**
     * @tc.name   testKeysNumberNormal0025
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_2500
     * @tc.desc   keys() returns an array containing the stored number key
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testKeysNumberNormal0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testKeysNumberNormal0025';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, string>(10);
      cache.put(100, 'value');
      const keys: number[] = cache.keys();
      expect(Array.isArray(keys)).assertTrue();
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual(100);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testKeysStringNormal0026
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_2600
     * @tc.desc   keys() returns an array containing UTF-8 and Chinese string keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testKeysStringNormal0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testKeysStringNormal0026';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      cache.put('test测试123', 'value');
      const keys: string[] = cache.keys();
      expect(Array.isArray(keys)).assertTrue();
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual('test测试123');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testKeysBooleanTrue0027
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_2700
     * @tc.desc   keys() returns an array containing boolean keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testKeysBooleanTrue0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testKeysBooleanTrue0027';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<boolean, string>(10);
      cache.put(true, 'value');
      const keys: boolean[] = cache.keys();
      expect(Array.isArray(keys)).assertTrue();
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertTrue();
      console.info(`${caseName}, test end`);
    });

    // //SendableLruCache 的限制:
    // // Key 和 Value 必须是 Object 类型
    // // 不支持原始类型（null、undefined、number、string、boolean 等）直接作为键
    // //如果用Wrapper包装类：则验证点就不是键，而是属性
    // /**
    //  * @tc.name   testKeysNullValue0028
    //  * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_2800
    //  * @tc.desc   SendableLruCache disallows null as key type per ArkTS Sendable constraints
    //  * @tc.type   FUNCTION
    //  * @tc.size   SMALLTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testKeysNullValue0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testKeysNullValue0028';
    //   console.info(`${caseName}, test start`);
    //   const cache = new ArkTSUtils.SendableLruCache<null, string>(10);
    //   cache.put(null, 'value');
    //   const keys: null[] = cache.keys();
    //   expect(Array.isArray(keys)).assertTrue();
    //   expect(keys.length).assertEqual(1);
    //   expect(keys[0]).assertNull();
    //   console.info(`${caseName}, test end`);
    // });
    //
    // //SendableLruCache 的限制:
    // // Key 和 Value 必须是 Object 类型
    // // 不支持原始类型（null、undefined、number、string、boolean 等）直接作为键
    // //如果用Wrapper包装类：则验证点就不是键，而是属性
    // /**
    //  * @tc.name   testKeysUndefinedValue0029
    //  * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_2900
    //  * @tc.desc   SendableLruCache disallows undefined as key type per ArkTS Sendable constraints
    //  * @tc.type   FUNCTION
    //  * @tc.size   SMALLTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testKeysUndefinedValue0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testKeysUndefinedValue0029';
    //   console.info(`${caseName}, test start`);
    //   const cache = new ArkTSUtils.SendableLruCache<undefined, string>(10);
    //   cache.put(undefined, 'value');
    //   const keys: undefined[] = cache.keys();
    //   expect(Array.isArray(keys)).assertTrue();
    //   expect(keys.length).assertEqual(1);
    //   expect(keys[0]).assertUndefined();
    //   console.info(`${caseName}, test end`);
    // });

    /**
     * @tc.name   testKeysAccessOrder0030
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_3000
     * @tc.desc   keys() reflects LRU access order consistent with values() and entries()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testKeysAccessOrder0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testKeysAccessOrder0030';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      cache.put('key1', 'value1');
      cache.put('key2', 'value2');
      cache.put('key3', 'value3');
      cache.get('key1');
      const keys: string[] = cache.keys();
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual('key2');
      expect(keys[1]).assertEqual('key3');
      expect(keys[2]).assertEqual('key1');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testKeysUnique0031
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_3100
     * @tc.desc   keys() returns unique keys without duplicates
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testKeysUnique0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testKeysUnique0031';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      cache.put('key1', 'value1');
      cache.put('key1', 'value1_new');
      const keys: string[] = cache.keys();
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual('key1');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testKeysEmptyCache0032
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_3200
     * @tc.desc   keys() on empty cache returns empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testKeysEmptyCache0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testKeysEmptyCache0032';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      const keys: string[] = cache.keys();
      expect(Array.isArray(keys)).assertTrue();
      expect(keys.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    // ============================================================
    // 4.3 values方法详细测试 (7个)
    // ============================================================

    /**
     * @tc.name   testValuesNumberNormal0033
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_3300
     * @tc.desc   values() returns an array containing the stored number value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testValuesNumberNormal0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testValuesNumberNormal0033';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, number>(10);
      cache.put('key', 100);
      const values: number[] = cache.values();
      expect(Array.isArray(values)).assertTrue();
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual(100);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testValuesStringNormal0034
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_3400
     * @tc.desc   values() returns an array containing UTF-8 and Chinese string values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testValuesStringNormal0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testValuesStringNormal0034';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      cache.put('key', 'test测试123');
      const values: string[] = cache.values();
      expect(Array.isArray(values)).assertTrue();
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('test测试123');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testValuesObjectNormal0035
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_3500
     * @tc.desc   values() returns an array holding references to plain Sendable objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testValuesObjectNormal0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testValuesObjectNormal0035';
      console.info(`${caseName}, test start`);
      @Sendable
      class TestObj implements lang.ISendable {
        name: string = 'test';
        age: number = 20;
      }
      const cache = new ArkTSUtils.SendableLruCache<string, TestObj>(10);
      const obj: TestObj = new TestObj();
      cache.put('key', obj);
      const values: TestObj[] = cache.values();
      expect(Array.isArray(values)).assertTrue();
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual(obj);
      expect(values[0].name).assertEqual('test');
      expect(values[0].age).assertEqual(20);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testValuesArrayNormal0036
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_3600
     * @tc.desc   values() returns an array holding references
     *            to collections.Array instances
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testValuesArrayNormal0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testValuesArrayNormal0036';
      console.info(`${caseName}, test start`);
      const arr: collections.Array<number> = new collections.Array<number>();
      arr.push(1);
      arr.push(2);
      arr.push(3);
      const cache = new ArkTSUtils.SendableLruCache<string, collections.Array<number>>(10);
      cache.put('key', arr);
      const values: collections.Array<number>[] = cache.values();
      expect(Array.isArray(values)).assertTrue();
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual(arr);
      expect(values[0][0]).assertEqual(1);
      expect(values[0][1]).assertEqual(2);
      expect(values[0][2]).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testValuesSendableClass0037
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_3700
     * @tc.desc   values() returns an array holding references
     *            to typical @Sendable class instances
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testValuesSendableClass0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testValuesSendableClass0037';
      console.info(`${caseName}, test start`);
      @Sendable
      class SendableObj implements lang.ISendable {
        id: number = 1;
        value: string = 'sendable_value';
      }
      const cache = new ArkTSUtils.SendableLruCache<string, SendableObj>(10);
      const obj: SendableObj = new SendableObj();
      cache.put('key', obj);
      const values: SendableObj[] = cache.values();
      expect(Array.isArray(values)).assertTrue();
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual(obj);
      expect(values[0].id).assertEqual(1);
      expect(values[0].value).assertEqual('sendable_value');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testValuesAccessOrder0038
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_3800
     * @tc.desc   values() returns an array ordered from
     *            least recently used to most recently used
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testValuesAccessOrder0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testValuesAccessOrder0038';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      cache.put('key1', 'value1');
      cache.put('key2', 'value2');
      cache.put('key3', 'value3');
      cache.get('key1');
      const values: string[] = cache.values();
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual('value2');
      expect(values[1]).assertEqual('value3');
      expect(values[2]).assertEqual('value1');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testValuesEmptyCache0039
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_3900
     * @tc.desc   values() returns an empty array when the cache is empty
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testValuesEmptyCache0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testValuesEmptyCache0039';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      const values: string[] = cache.values();
      expect(Array.isArray(values)).assertTrue();
      expect(values.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    // ============================================================
    // 5. 方法返回值验证 (合并所有22个场景)
    // ============================================================

    /**
     * @tc.name   testReturnValues0040
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_4000
     * @tc.desc   All methods return correct values and types
     *            (constructor + 17 methods, 22 scenarios)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testReturnValues0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testReturnValues0040';
      console.info(`${caseName}, test start`);
      // ============================================================
      // 1. constructor 返回值测试 (5个场景)
      // ============================================================
      const defaultCache = new ArkTSUtils.SendableLruCache<string, string>();
      expect(defaultCache instanceof ArkTSUtils.SendableLruCache).assertTrue();
      expect(defaultCache.getCapacity()).assertEqual(64);

      const customCache = new ArkTSUtils.SendableLruCache<string, string>(10);
      expect(customCache.getCapacity()).assertEqual(10);

      const capacityOneCache = new ArkTSUtils.SendableLruCache<string, string>(1);
      expect(capacityOneCache.getCapacity()).assertEqual(1);

      const largeCache = new ArkTSUtils.SendableLruCache<string, string>(1000);
      expect(largeCache.getCapacity()).assertEqual(1000);

      try {
        new ArkTSUtils.SendableLruCache<string, string>(0);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code).assertEqual(401);
      }

      // ============================================================
      // 2. 方法返回值测试 (17个方法)
      // ============================================================

      const cache = new ArkTSUtils.SendableLruCache<string, string>(64);

      expect(cache.isEmpty()).assertTrue();

      expect(cache.getCapacity()).assertEqual(64);

      expect(cache.length).assertEqual(0);

      const putResult1: string = cache.put('key1', 'value1');
      expect(putResult1).assertEqual('value1');

      const putResult2: string = cache.put('key1', 'value1_new');
      expect(putResult2).assertEqual('value1_new');
      expect(cache.get('key1')).assertEqual('value1_new');

      expect(cache.length).assertEqual(1);

      expect(cache.isEmpty()).assertFalse();

      const getResult: string | undefined = cache.get('key1');
      expect(getResult).assertEqual('value1_new');

      expect(cache.get('notExist')).assertUndefined();

      expect(cache.contains('key1')).assertTrue();

      expect(cache.contains('key2')).assertFalse();

      const keys: string[] = cache.keys();
      expect(Array.isArray(keys)).assertTrue();
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual('key1');

      const values: string[] = cache.values();
      expect(Array.isArray(values)).assertTrue();
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('value1_new');

      const entries = cache.entries();
      expect(entries !== null).assertTrue();
      expect(typeof entries.next === 'function').assertTrue();
      let entryCount: number = 0;
      let next = entries.next();
      while (!next.done) {
        entryCount++;
        next = entries.next();
      }
      expect(entryCount).assertEqual(1);
      const str: string = cache.toString();
      expect(typeof str === 'string').assertTrue();
      expect(str.length > 0).assertTrue();

      const removeResult1: string | undefined = cache.remove('key1');
      expect(removeResult1).assertEqual('value1_new');
      expect(cache.length).assertEqual(0);

      expect(cache.remove('key1')).assertUndefined();

      cache.put('key1', 'value1');
      const clearRet = cache.clear();
      expect(clearRet === undefined).assertTrue();

      const updateRet = cache.updateCapacity(100);
      expect(updateRet === undefined).assertTrue();
      console.info(`${caseName}, test end`);
    });

    // ============================================================
    // 6. 注解测试 (5个)
    // ============================================================

    /**
     * @tc.name   testSendableDecorator0041
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_4100
     * @tc.desc   @Sendable decoration enables SendableLruCache
     *            to be passed across threads via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSendableDecorator0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,async (): Promise<void> => {
      const caseName: string = 'testSendableDecorator0041';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      cache.put('key', 'value');
      // 将 cache 传入 TaskPool 子线程，验证 @Sendable 装饰使其可跨线程传递
      const task: taskpool.Task = new taskpool.Task(concurrentTestWithCache, cache);
      const result: string | undefined = await taskpool.execute(task) as string | undefined;
      expect(result).assertEqual('value');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testConcurrentDecoratorTaskPool0042
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_4200
     * @tc.desc   TaskPool task functions require @Concurrent decorator,
     *            SendableLruCache can be used in concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testConcurrentDecoratorTaskPool0042',TestType.FUNCTION|Size.SMALLTEST|Level.LEVEL0,async():Promise<void> =>{
      const caseName: string = 'testConcurrentDecoratorTaskPool0042';
      console.info(`${caseName}, test start`);
      try {
        const mainResult: boolean = await taskpool.execute(concurrentTest) as boolean;
        expect(mainResult).assertTrue();
        const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
        cache.put('key', 'value');
        const task: taskpool.Task = new taskpool.Task(concurrentTestWithCache, cache);
        const result: string | undefined = await taskpool.execute(task) as string | undefined;
        expect(result).assertEqual('value');
        const tasks: Promise<boolean>[] = [];
        for (let i: number = 0; i < 3; i++) {
          tasks.push(taskpool.execute(concurrentCacheTask) as Promise<boolean>);
        }
        const results: boolean[] = await Promise.all(tasks) as boolean[];
        const allSuccess: boolean = results.every((r: boolean): boolean => r === true);
        expect(allSuccess).assertTrue();
      } catch (error) {
        console.error('Concurrent decorator test failed:',(error as Error).message);
        expect(false).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testImportDeclaration0043
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_4300
     * @tc.desc   Import declaration for ArkTSUtils resolves successfully
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testImportDeclaration0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testImportDeclaration0043';
      console.info(`${caseName}, test start`);
      expect(ArkTSUtils.SendableLruCache !== undefined).assertTrue();
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testTypeConstraintSendable0044
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_4400
     * @tc.desc   Type constraint enforces Sendable types for keys and values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testTypeConstraintSendable0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testTypeConstraintSendable0044';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<number, string>(10);
      cache.put(1, 'one');
      expect(cache.get(1)).assertEqual('one');
      console.info(`${caseName}, test end`);
    });

    //场景：非Sendable类型测试 | 使用Object、普通Function作为泛型参数 | 编译错误或运行时错误 |
    //原因: ArkTS 编译器在编译期拦截非 Sendable 泛型参数，不存在运行时场景。
    // /**
    //  * @tc.name   testNonSendableType0045
    //  * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_4500
    //  * @tc.desc   Non-Sendable types cause compilation errors (compile-time check)
    //  * @tc.type   FUNCTION
    //  * @tc.size   SMALLTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testNonSendableType0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
    //   const caseName: string = 'testNonSendableType0045';
    //   console.info(`${caseName}, test start`);
    //   @Sendable
    //   class SendableClass implements lang.ISendable {
    //     name: string = 'sendable';
    //   }
    //   const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(10);
    //   const key: lang.ISendable = new SendableClass();
    //   const result: lang.ISendable = cache.put(key, key);
    //   expect(result).assertEqual(key);
    //   expect(cache.contains(key)).assertTrue();
    //   console.info(`${caseName}, test end`);
    // });

    // ============================================================
    // 7. 继承测试 (7个)
    // ============================================================

    /**
     * @tc.name   testExtendCache0046
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_4600
     * @tc.desc   Subclass of SendableLruCache can define and invoke custom methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testExtendCache0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testExtendCache0046';
      console.info(`${caseName}, test start`);
      @Sendable
      class MyLruCache<K, V> extends ArkTSUtils.SendableLruCache<K, V> {
        getCustom(): string {
          return 'custom';
        }
      }
      const cache: MyLruCache<string, string> = new MyLruCache<string, string>(10);
      expect(cache.getCustom()).assertEqual('custom');
      expect(cache instanceof ArkTSUtils.SendableLruCache).assertTrue();
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testOverrideCreateDefault0047
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_4700
     * @tc.desc   Subclass can override get() and
     *            provide a custom default creation logic
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testOverrideCreateDefault0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testOverrideCreateDefault0047';
      console.info(`${caseName}, test start`);
      @Sendable
      class MyLruCache<K, V> extends ArkTSUtils.SendableLruCache<K, V> {
        // 重写 get 方法，使用 createDefault
        get(key: K): V | undefined {
          if (this.contains(key)) {
            return super.get(key);
          }
          return this.createDefault(key);
        }
        createDefault(_: K): V {
          return 'defaultValue' as V;
        }
      }
      const cache: MyLruCache<string, string> = new MyLruCache<string, string>(10);
      const result: string | undefined = cache.get('notExist');
      expect(result).assertEqual('defaultValue');
      cache.put('existKey', 'realValue');
      const existResult: string | undefined = cache.get('existKey');
      expect(existResult).assertEqual('realValue');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testAddCustomMethod0048
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_4800
     * @tc.desc   Subclass can expose wrapped parent
     *            APIs through custom methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testAddCustomMethod0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testAddCustomMethod0048';
      console.info(`${caseName}, test start`);
      @Sendable
      class MyLruCache<K, V> extends ArkTSUtils.SendableLruCache<K, V> {
        getKeys(): K[] {
          return this.keys();
        }
      }
      const cache: MyLruCache<number, string> = new MyLruCache<number, string>(10);
      cache.put(1, 'one');
      cache.put(2, 'two');
      const keys: number[] = cache.getKeys();
      expect(keys.length).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testInstanceOfCheck0049
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_4900
     * @tc.desc   Instances of subclass satisfy instanceof
     *            checks for both child and parent classes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testInstanceOfCheck0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testInstanceOfCheck0049';
      console.info(`${caseName}, test start`);
      @Sendable
      class MyLruCache<K, V> extends ArkTSUtils.SendableLruCache<K, V> {
      }
      const cache: MyLruCache<string, string> = new MyLruCache<string, string>(10);
      expect(cache instanceof ArkTSUtils.SendableLruCache).assertTrue();
      expect(cache instanceof MyLruCache).assertTrue();
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testPolymorphism0050
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_5000
     * @tc.desc   Subclass instance can be referenced by SendableLruCache
     *            base class with correct polymorphic behavior
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPolymorphism0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testPolymorphism0050';
      console.info(`${caseName}, test start`);
      @Sendable
      class MyLruCache<K, V> extends ArkTSUtils.SendableLruCache<K, V> {
      }
      const cache: ArkTSUtils.SendableLruCache<number, string> = new MyLruCache<number, string>(10);
      cache.put(1, 'one');
      expect(cache.get(1)).assertEqual('one');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testConstructorInheritance0051
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_5100
     * @tc.desc   Subclass constructor can invoke super
     *            constructor to initialize capacity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testConstructorInheritance0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testConstructorInheritance0051';
      console.info(`${caseName}, test start`);
      @Sendable
      class MyLruCache<K, V> extends ArkTSUtils.SendableLruCache<K, V> {
        constructor(capacity: number) {
          super(capacity);
        }
      }
      const cache: MyLruCache<string, string> = new MyLruCache<string, string>(20);
      expect(cache.getCapacity()).assertEqual(20);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testGenericInheritance0052
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_5200
     * @tc.desc   SendableLruCache subclass supports instantiation
     *            with various generic type parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testGenericInheritance0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGenericInheritance0052';
      console.info(`${caseName}, test start`);
      @Sendable
      class MyLruCache<K, V> extends ArkTSUtils.SendableLruCache<K, V> {
      }
      const stringCache: MyLruCache<string, string> = new MyLruCache<string, string>(10);
      stringCache.put('key', 'value');
      expect(stringCache.get('key')).assertEqual('value');
      const numberCache: MyLruCache<number, number> = new MyLruCache<number, number>(10);
      numberCache.put(1, 100);
      expect(numberCache.get(1)).assertEqual(100);
      console.info(`${caseName}, test end`);
    });

    // ============================================================
    // 8. 与Map差异测试 (7个)
    // ============================================================

    /**
     * @tc.name   testNoForEach0053
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_5300
     * @tc.desc   Map provides forEach method while
     *            SendableLruCache does not (compile-time check)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testNoForEach0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testNoForEach0053';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      const keys: string[] = Object.keys(cache);
      const hasForEach: boolean = keys.indexOf('forEach') !== -1;
      expect(hasForEach).assertFalse();
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testNoSymbolIterator0054
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_5400
     * @tc.desc   SendableLruCache does not implement Symbol.iterator
     *            and cannot be used in for...of loops (compile-time check)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testNoSymbolIterator0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testNoSymbolIterator0054';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      const keys: string[] = Object.keys(cache);
      let hasIterator: boolean = false;
      for (let i = 0; i < keys.length; i++) {
        if (keys[i].includes('iterator')) {
          hasIterator = true;
          break;
        }
      }
      expect(hasIterator).assertFalse();
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testKeysReturnsArray0055
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_5500
     * @tc.desc   Map.keys() returns IterableIterator<K>, while
     *            SendableLruCache.keys() returns K[] for cross-thread safety
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testKeysReturnsArray0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testKeysReturnsArray0055';
      console.info(`${caseName}, test start`);
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('key1', 'value1');
      map.set('key2', 'value2');
      const mapKeys: IterableIterator<string> = map.keys();
      expect(Array.isArray(mapKeys)).assertFalse();
      const cache: ArkTSUtils.SendableLruCache<string, string> =
        new ArkTSUtils.SendableLruCache<string, string>(10);
      cache.put('key1', 'value1');
      cache.put('key2', 'value2');
      const cacheKeys: string[] = cache.keys();
      expect(Array.isArray(cacheKeys)).assertTrue();
      expect(cacheKeys.length).assertEqual(2);
      expect(cacheKeys[0]).assertEqual('key1');
      expect(cacheKeys[1]).assertEqual('key2');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testValuesReturnsArray0056
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_5600
     * @tc.desc   Map.values() returns IterableIterator<V>, while SendableLruCache.values()
     *            returns V[] for cross-thread safety
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testValuesReturnsArray0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testValuesReturnsArray0056';
      console.info(`${caseName}, test start`);
      const map: collections.Map<string, string> = new collections.Map<string, string>();
      map.set('key1', 'value1');
      map.set('key2', 'value2');
      const mapValues: IterableIterator<string> = map.values();
      expect(Array.isArray(mapValues)).assertFalse();
      const cache: ArkTSUtils.SendableLruCache<string, string> =
        new ArkTSUtils.SendableLruCache<string, string>(10);
      cache.put('key1', 'value1');
      cache.put('key2', 'value2');
      const cacheValues: string[] = cache.values();
      expect(Array.isArray(cacheValues)).assertTrue();
      expect(cacheValues.length).assertEqual(2);
      expect(cacheValues[0]).assertEqual('value1');
      expect(cacheValues[1]).assertEqual('value2');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testEntriesReturnsIterator0057
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_5700
     * @tc.desc   Both Map.entries() and SendableLruCache.entries()
     *            return IterableIterator<[K, V]>
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testEntriesReturnsIterator0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testEntriesReturnsIterator0057';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(10);
      cache.put('key1', 'value1');
      cache.put('key2', 'value2');
      const entries: IterableIterator<[string, string]> = cache.entries();
      expect(entries !== null).assertTrue();
      let count: number = 0;
      let next: IteratorResult<[string, string]> = entries.next();
      while (!next.done) {
        count++;
        next = entries.next();
      }
      expect(count).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testCapacityLimit0058
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_5800
     * @tc.desc   Map grows unbounded while SendableLruCache
     *            enforces a fixed capacity and triggers eviction
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCapacityLimit0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testCapacityLimit0058';
      console.info(`${caseName}, test start`);
      const map = new collections.Map<string, string>();
      for (let i = 0; i < 100; i++) {
        map.set('key' + i, 'value' + i);
      }
      expect(map.size).assertEqual(100);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(2);
      cache.put('key1', 'value1');
      cache.put('key2', 'value2');
      cache.put('key3', 'value3');
      expect(cache.length).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testLRUEvictionMechanism0059
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_5900
     * @tc.desc   SendableLruCache evicts the least recently used entry
     *            when capacity is exceeded, unlike Map which never evicts
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testLRUEvictionMechanism0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testLRUEvictionMechanism0059';
      console.info(`${caseName}, test start`);
      const map = new collections.Map<string, string>();
      map.set('key1', 'value1');
      map.set('key2', 'value2');
      map.set('key3', 'value3');
      expect(map.size).assertEqual(3);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(2);
      cache.put('key1', 'value1');
      cache.put('key2', 'value2');
      cache.get('key1');
      cache.put('key3', 'value3');
      expect(cache.get('key1')).assertEqual('value1');
      expect(cache.get('key2')).assertUndefined();
      expect(cache.get('key3')).assertEqual('value3');
      console.info(`${caseName}, test end`);
    });

    // ============================================================
    // 9. 访问顺序测试 (4个)
    // ============================================================

    /**
     * @tc.name   testAccessOrderGet0060
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_6000
     * @tc.desc   Get operation promotes entry to most
     *            recently used, affecting subsequent eviction
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testAccessOrderGet0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testAccessOrderGet0060';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(2);
      cache.put('key1', 'value1');
      cache.put('key2', 'value2');
      cache.get('key1');
      cache.put('key3', 'value3');
      expect(cache.get('key1')).assertEqual('value1');
      expect(cache.get('key2')).assertUndefined();
      expect(cache.get('key3')).assertEqual('value3');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testAccessOrderPut0061
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_6100
     * @tc.desc   Put operation on an existing key promotes it to most recently used
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testAccessOrderPut0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testAccessOrderPut0061';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(2);
      cache.put('key1', 'value1');
      cache.put('key2', 'value2');
      cache.put('key1', 'value1_new');
      cache.put('key3', 'value3');
      expect(cache.get('key1')).assertEqual('value1_new');
      expect(cache.get('key2')).assertUndefined();
      expect(cache.get('key3')).assertEqual('value3');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testAccessOrderRemove0062
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_6200
     * @tc.desc   Remove operation removes the specified entry without
     *            altering the relative access order of remaining entries
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testAccessOrderRemove0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testAccessOrderRemove0062';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(4);
      cache.put('key1', 'value1');
      cache.put('key2', 'value2');
      cache.put('key3', 'value3');
      cache.remove('key2');
      cache.put('key4', 'value4');

      expect(cache.length).assertEqual(3);
      expect(cache.get('key1')).assertEqual('value1');
      expect(cache.get('key2')).assertUndefined();
      expect(cache.get('key3')).assertEqual('value3');
      expect(cache.get('key4')).assertEqual('value4');

      const keys: string[] = cache.keys();
      expect(keys[0]).assertEqual('key1');
      expect(keys[1]).assertEqual('key3');
      expect(keys[2]).assertEqual('key4');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testAccessOrderClear0063
     * @tc.number SUB_COLLECTIONS_LRU_SPECIAL_6300
     * @tc.desc   Clear operation resets access order and removes all entries
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testAccessOrderClear0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testAccessOrderClear0063';
      console.info(`${caseName}, test start`);
      const cache = new ArkTSUtils.SendableLruCache<string, string>(2);
      cache.put('key1', 'value1');
      cache.put('key2', 'value2');
      cache.clear();
      cache.put('key3', 'value3');
      expect(cache.length).assertEqual(1);
      expect(cache.get('key1')).assertUndefined();
      expect(cache.get('key2')).assertUndefined();
      expect(cache.get('key3')).assertEqual('value3');
      console.info(`${caseName}, test end`);
    });
  });
}
