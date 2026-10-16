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

// Batch2.ets
import { describe, it, expect, TestType, Size, Level, beforeEach } from '@ohos/hypium';
import { collections, ArkTSUtils } from '@kit.ArkTS';
import { lang } from '@kit.ArkTS';

// ============================================================
// 0. 完整的类型定义
// ============================================================

class TestValue {
  id: string = '';
  key: lang.ISendable = 0;
  value: lang.ISendable = 0;
  desc: string = '';

  constructor(id: string, key: lang.ISendable, value: lang.ISendable, desc: string) {
    this.id = id;
    this.key = key;
    this.value = value;
    this.desc = desc;
  }
}

// ===== 辅助函数：安全断言两个值相等 =====
function assertEqualSafe(actual: lang.ISendable | undefined, expected: lang.ISendable): void {
  if (actual === undefined) {
    expect(actual).assertEqual(expected);
    return;
  }
  if (typeof actual === 'number' && typeof expected === 'number'
    && Number.isNaN(actual) && Number.isNaN(expected)) {
    return;
  }
  expect(actual).assertEqual(expected);
}

// ============================================================
// 1. 核心逻辑：测试套件
// ============================================================

export default function sendableLruCacheBatch2Test() {
  describe('sendableLruCacheBatch2Test', () => {

    /**
     * @tc.setup 在每个测试用例执行前等待20ms
     */
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    // ==================================================
    //  Batch2 的 测试值
    // ==================================================
    const valuesBatch: TestValue[] = [
      new TestValue('condition_variable', new ArkTSUtils.locks.ConditionVariable(),
        new ArkTSUtils.locks.ConditionVariable(), 'ConditionVariable'),
      new TestValue('nested_map', new collections.Map<number, string>(),
        new collections.Map<number, string>(), 'nested Map'),
      new TestValue('nested_set', new collections.Set<number>(),
        new collections.Set<number>(), 'nested Set'),
      new TestValue('nested_array', new collections.Array<number>(),
        new collections.Array<number>(), 'nested Array'),
      new TestValue('number_negative_one', -1, -1, 'number -1'),
      new TestValue('number_negative_max', Number.MIN_SAFE_INTEGER, Number.MIN_SAFE_INTEGER, 'min safe integer'),
    ];

    // ==================================================
    // 19 个测试方法 (每个都循环上面 6 个值)
    // ==================================================

    /**
     * @tc.name   testConstructorSendableAllValues0001
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_BATCH2_0100
     * @tc.desc   Constructor operation with Batch2 values,
     *            verifies cache creation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConstructorSendableAllValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testConstructorSendableAllValues0001';
      console.info(`${caseName}, test start`);
      for (let i = 0; i < valuesBatch.length; i++) {
        const tv = valuesBatch[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        expect(cache !== null).assertTrue();
        expect(cache.getCapacity()).assertEqual(64);
        cache.put(tv.key, tv.value);
        expect(cache.contains(tv.key)).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testPutSendableAllValues0002
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_BATCH2_0200
     * @tc.desc   Put operation with Batch2 values,
     *            verifies put returns value and increments length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPutSendableAllValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testPutSendableAllValues0002';
      console.info(`${caseName}, test start`);
      for (let i = 0; i < valuesBatch.length; i++) {
        const tv = valuesBatch[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        const result = cache.put(tv.key, tv.value);
        assertEqualSafe(result, tv.value);
        expect(cache.length).assertEqual(1);
        expect(cache.contains(tv.key)).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testGetSendableAllValues0003
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_BATCH2_0300
     * @tc.desc   Get operation with Batch2 values,
     *            verifies retrieved value matches and matchCount increments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetSendableAllValues0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetSendableAllValues0003';
      console.info(`${caseName}, test start`);
      for (let i = 0; i < valuesBatch.length; i++) {
        const tv = valuesBatch[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        cache.put(tv.key, tv.value);
        const retrieved = cache.get(tv.key);
        assertEqualSafe(retrieved, tv.value);
        expect(cache.getMatchCount()).assertEqual(1);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testRemoveSendableAllValues0004
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_BATCH2_0400
     * @tc.desc   Remove operation with Batch2 values,
     *            verifies removed value matches and length decrements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveSendableAllValues0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testRemoveSendableAllValues0004';
      console.info(`${caseName}, test start`);
      for (let i = 0; i < valuesBatch.length; i++) {
        const tv = valuesBatch[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        cache.put(tv.key, tv.value);
        const removed = cache.remove(tv.key);
        assertEqualSafe(removed, tv.value);
        expect(cache.length).assertEqual(0);
        expect(cache.contains(tv.key)).assertFalse();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testContainsSendableAllValues0005
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_BATCH2_0500
     * @tc.desc   Contains operation with Batch2 values,
     *            verifies key existence before and after put
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testContainsSendableAllValues0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testContainsSendableAllValues0005';
      console.info(`${caseName}, test start`);
      for (let i = 0; i < valuesBatch.length; i++) {
        const tv = valuesBatch[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        expect(cache.contains(tv.key)).assertFalse();
        cache.put(tv.key, tv.value);
        expect(cache.contains(tv.key)).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testClearSendableAllValues0006
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_BATCH2_0600
     * @tc.desc   Clear operation with Batch2 values,
     *            verifies all entries removed and length resets to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearSendableAllValues0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testClearSendableAllValues0006';
      console.info(`${caseName}, test start`);
      for (let i = 0; i < valuesBatch.length; i++) {
        const tv = valuesBatch[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        cache.put(tv.key, tv.value);
        cache.clear();
        expect(cache.length).assertEqual(0);
        expect(cache.isEmpty()).assertTrue();
        expect(cache.contains(tv.key)).assertFalse();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testEntriesSendableAllValues0007
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_BATCH2_0700
     * @tc.desc   Entries operation with Batch2 values,
     *            verifies iterator returns correct key-value pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEntriesSendableAllValues0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testEntriesSendableAllValues0007';
      console.info(`${caseName}, test start`);
      for (let i = 0; i < valuesBatch.length; i++) {
        const tv = valuesBatch[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        cache.put(tv.key, tv.value);
        const iterator = cache.entries();
        expect(iterator !== null).assertTrue();
        let count = 0;
        let next = iterator.next();
        while (!next.done) {
          count++;
          assertEqualSafe(next.value[0], tv.key);
          assertEqualSafe(next.value[1], tv.value);
          next = iterator.next();
        }
        expect(count).assertEqual(1);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testKeysSendableAllValues0008
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_BATCH2_0800
     * @tc.desc   Keys operation with Batch2 values,
     *            verifies keys array contains the correct key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testKeysSendableAllValues0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testKeysSendableAllValues0008';
      console.info(`${caseName}, test start`);
      for (let i = 0; i < valuesBatch.length; i++) {
        const tv = valuesBatch[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        cache.put(tv.key, tv.value);
        const keys = cache.keys();
        expect(Array.isArray(keys)).assertTrue();
        expect(keys.length).assertEqual(1);
        assertEqualSafe(keys[0], tv.key);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testValuesSendableAllValues0009
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_BATCH2_0900
     * @tc.desc   Values operation with Batch2 values,
     *            verifies values array contains the correct value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testValuesSendableAllValues0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testValuesSendableAllValues0009';
      console.info(`${caseName}, test start`);
      for (let i = 0; i < valuesBatch.length; i++) {
        const tv = valuesBatch[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        cache.put(tv.key, tv.value);
        const values = cache.values();
        expect(Array.isArray(values)).assertTrue();
        expect(values.length).assertEqual(1);
        assertEqualSafe(values[0], tv.value);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testLengthSendableAllValues0010
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_BATCH2_1000
     * @tc.desc   Length property with Batch2 values,
     *            verifies length changes after put and remove
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLengthSendableAllValues0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testLengthSendableAllValues0010';
      console.info(`${caseName}, test start`);
      for (let i = 0; i < valuesBatch.length; i++) {
        const tv = valuesBatch[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        expect(cache.length).assertEqual(0);
        cache.put(tv.key, tv.value);
        expect(cache.length).assertEqual(1);
        cache.remove(tv.key);
        expect(cache.length).assertEqual(0);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testGetCapacitySendableAllValues0011
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_BATCH2_1100
     * @tc.desc   GetCapacity operation with Batch2 values,
     *            verifies capacity remains constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCapacitySendableAllValues0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetCapacitySendableAllValues0011';
      console.info(`${caseName}, test start`);
      for (let i = 0; i < valuesBatch.length; i++) {
        const tv = valuesBatch[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        expect(cache.getCapacity()).assertEqual(64);
        cache.put(tv.key, tv.value);
        expect(cache.getCapacity()).assertEqual(64);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testUpdateCapacitySendableAllValues0012
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_BATCH2_1200
     * @tc.desc   UpdateCapacity operation with Batch2 values,
     *            verifies capacity updated and entries preserved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUpdateCapacitySendableAllValues0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testUpdateCapacitySendableAllValues0012';
      console.info(`${caseName}, test start`);
      for (let i = 0; i < valuesBatch.length; i++) {
        const tv = valuesBatch[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        cache.put(tv.key, tv.value);
        cache.updateCapacity(100);
        expect(cache.getCapacity()).assertEqual(100);
        expect(cache.length).assertEqual(1);
        const retrieved = cache.get(tv.key);
        assertEqualSafe(retrieved, tv.value);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testIsEmptySendableAllValues0013
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_BATCH2_1300
     * @tc.desc   IsEmpty operation with Batch2 values,
     *            verifies empty state transitions correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsEmptySendableAllValues0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testIsEmptySendableAllValues0013';
      console.info(`${caseName}, test start`);
      for (let i = 0; i < valuesBatch.length; i++) {
        const tv = valuesBatch[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        expect(cache.isEmpty()).assertTrue();
        cache.put(tv.key, tv.value);
        expect(cache.isEmpty()).assertFalse();
        cache.remove(tv.key);
        expect(cache.isEmpty()).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testToStringSendableAllValues0014
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_BATCH2_1400
     * @tc.desc   ToString operation with Batch2 values,
     *            verifies string representation is valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testToStringSendableAllValues0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testToStringSendableAllValues0014';
      console.info(`${caseName}, test start`);
      for (let i = 0; i < valuesBatch.length; i++) {
        const tv = valuesBatch[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        cache.put(tv.key, tv.value);
        const result = cache.toString();
        expect(result !== null).assertTrue();
        expect(typeof result === 'string').assertTrue();
        expect(result.length > 0).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testGetCreateCountSendableAllValues0015
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_BATCH2_1500
     * @tc.desc   GetCreateCount operation with Batch2 values,
     *            verifies count always returns 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCreateCountSendableAllValues0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetCreateCountSendableAllValues0015';
      console.info(`${caseName}, test start`);
      for (let i = 0; i < valuesBatch.length; i++) {
        const tv = valuesBatch[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        expect(cache.getCreateCount()).assertEqual(0);
        cache.put(tv.key, tv.value);
        expect(cache.getCreateCount()).assertEqual(0);
        expect(cache.contains(tv.key)).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testGetMissCountSendableAllValues0016
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_BATCH2_1600
     * @tc.desc   GetMissCount operation with Batch2 values,
     *            verifies count increments on cache miss
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetMissCountSendableAllValues0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetMissCountSendableAllValues0016';
      console.info(`${caseName}, test start`);
      for (let i = 0; i < valuesBatch.length; i++) {
        const tv = valuesBatch[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        expect(cache.getMissCount()).assertEqual(0);
        cache.get(tv.key);
        expect(cache.getMissCount()).assertEqual(1);
        cache.put(tv.key, tv.value);
        cache.get(tv.key);
        expect(cache.getMissCount()).assertEqual(1);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testGetMatchCountSendableAllValues0017
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_BATCH2_1700
     * @tc.desc   GetMatchCount operation with Batch2 values,
     *            verifies count increments on cache hit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetMatchCountSendableAllValues0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetMatchCountSendableAllValues0017';
      console.info(`${caseName}, test start`);
      for (let i = 0; i < valuesBatch.length; i++) {
        const tv = valuesBatch[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        expect(cache.getMatchCount()).assertEqual(0);
        cache.put(tv.key, tv.value);
        cache.get(tv.key);
        expect(cache.getMatchCount()).assertEqual(1);
        cache.get(tv.key);
        expect(cache.getMatchCount()).assertEqual(2);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testGetRemoveCountSendableAllValues0018
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_BATCH2_1800
     * @tc.desc   GetRemoveCount operation with Batch2 values,
     *            verifies count increments on LRU eviction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetRemoveCountSendableAllValues0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetRemoveCountSendableAllValues0018';
      console.info(`${caseName}, test start`);
      for (let i = 0; i < valuesBatch.length; i++) {
        const tv = valuesBatch[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(2);
        expect(cache.getRemoveCount()).assertEqual(0);
        cache.put(tv.key, tv.value);
        const keyA: lang.ISendable = 999;
        cache.put(keyA, keyA);
        const keyB: lang.ISendable = 888;
        cache.put(keyB, keyB);
        expect(cache.getRemoveCount()).assertEqual(1);
        expect(cache.contains(tv.key)).assertFalse();
        expect(cache.contains(keyA)).assertTrue();
        expect(cache.contains(keyB)).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testGetPutCountSendableAllValues0019
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_BATCH2_1900
     * @tc.desc   GetPutCount operation with Batch2 values,
     *            verifies count increments on each put
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPutCountSendableAllValues0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetPutCountSendableAllValues0019';
      console.info(`${caseName}, test start`);
      for (let i = 0; i < valuesBatch.length; i++) {
        const tv = valuesBatch[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        const initialCount = cache.getPutCount();
        cache.put(tv.key, tv.value);
        expect(cache.getPutCount()).assertEqual(initialCount + 1);
        cache.put(tv.key, tv.value);
        expect(cache.getPutCount()).assertEqual(initialCount + 2);
      }
      console.info(`${caseName}, test end`);
    });
  });
}