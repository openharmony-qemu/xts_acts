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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { collections, ArkTSUtils } from '@kit.ArkTS';
import { lang } from '@kit.ArkTS';

// ============================================================
// Sendable特殊类型: 11个测试值 × 19个方法 = 209个测试场景
// ============================================================

// ============================================================
// 0. 类型定义
// ============================================================

class TestValue {
  id: string = '';
  key: lang.ISendable = 0;
  value: lang.ISendable = 0;
  category: string = '';
  desc: string = '';

  constructor(id: string, key: lang.ISendable, value: lang.ISendable, category: string, desc: string) {
    this.id = id;
    this.key = key;
    this.value = value;
    this.category = category;
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

// ===== Sendable特殊类型 =====
@Sendable
class SendableClassBasic implements lang.ISendable {
  id: number = 1;
  name: string = 'basic';
}

@Sendable
class SendableClassComplex implements lang.ISendable {
  id: number = 100;
  name: string = 'complex';
  data: collections.Map<string, number> | undefined = undefined;
  constructor() {
    this.id = 100;
    this.name = 'complex';
  }
  initData(): void {
    if (!this.data) {
      try {
      this.data = new collections.Map<string, number>();
      this.data.set('key1', 1);
      this.data.set('key2', 2);
    } catch (error) {
        console.error('Failed to initialize data:', error);
      }
    }
  }
}

@Sendable
class SendableClassExtended extends SendableClassBasic implements lang.ISendable {
  extra: string = 'extended';
}

@Sendable
function sendableFunction(): string {
  return 'sendable';
}

enum SendableEnum {
  Success = 0,
  Failure = 1
}

// ============================================================
// 1. Sendable特殊类型测试值定义 (11个)
// ============================================================

function getSendableValues(): TestValue[] {
  const result: TestValue[] = [];

  result.push(new TestValue('sendable_class_basic', new SendableClassBasic(),
    new SendableClassBasic(), 'Sendable', 'basic Sendable class'));
  const complex1: SendableClassComplex = new SendableClassComplex();
  const complex2: SendableClassComplex = new SendableClassComplex();
  result.push(new TestValue('sendable_class_complex', complex1, complex2, 'Sendable', 'complex Sendable class'));

  result.push(new TestValue('sendable_class_extended', new SendableClassExtended(),
    new SendableClassExtended(), 'Sendable', 'extended Sendable class'));
  result.push(new TestValue('sendable_function', sendableFunction, sendableFunction, 'Sendable','Sendable function'));
  result.push(new TestValue('sendable_enum', SendableEnum.Success, SendableEnum.Success, 'Sendable', 'enum value'));
  result.push(new TestValue('async_lock', new ArkTSUtils.locks.AsyncLock(),
    new ArkTSUtils.locks.AsyncLock(), 'Sendable', 'AsyncLock'));
  result.push(new TestValue('condition_variable', new ArkTSUtils.locks.ConditionVariable(),
    new ArkTSUtils.locks.ConditionVariable(), 'Sendable', 'ConditionVariable'));
  result.push(new TestValue('sendable_lru_cache', new ArkTSUtils.SendableLruCache<number, string>(10),
    new ArkTSUtils.SendableLruCache<number, string>(10), 'Sendable', 'SendableLruCache'));
  result.push(new TestValue('nested_map', new collections.Map<number, string>(),
    new collections.Map<number, string>(), 'Sendable', 'nested Map'));
  result.push(new TestValue('nested_set', new collections.Set<number>(),
    new collections.Set<number>(), 'Sendable', 'nested Set'));
  result.push(new TestValue('nested_array', new collections.Array<number>(),
    new collections.Array<number>(), 'Sendable', 'nested Array'));

  return result;
}

// ============================================================
// 2. 主测试套件
// ============================================================

export default function sendableLruCacheSendableTest() {
  describe('SendableLruCache_Sendable_Test', () => {

    /**
     * @tc.name   testPutSendableAllValues0001
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_0100
     * @tc.desc   Put operation with 11 Sendable type values,
     *            verifies put returns value and increments length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPutSendableAllValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testPutSendableAllValues0001';
      console.info(`${caseName}, test start`);
      const sendableValues: TestValue[] = getSendableValues();
      for (let i = 0; i < sendableValues.length; i++) {
        const tv: TestValue = sendableValues[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        const result: lang.ISendable = cache.put(tv.key, tv.value);
        assertEqualSafe(result, tv.value);
        expect(cache.length).assertEqual(1);
        expect(cache.contains(tv.key)).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testGetSendableAllValues0002
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_0200
     * @tc.desc   Get operation with 11 Sendable type values,
     *            verifies retrieved value matches and matchCount increments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetSendableAllValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetSendableAllValues0002';
      console.info(`${caseName}, test start`);
      const sendableValues: TestValue[] = getSendableValues();
      for (let i = 0; i < sendableValues.length; i++) {
        const tv: TestValue = sendableValues[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        cache.put(tv.key, tv.value);
        const retrieved: lang.ISendable | undefined = cache.get(tv.key);
        assertEqualSafe(retrieved, tv.value);
        expect(cache.getMatchCount()).assertEqual(1);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testRemoveSendableAllValues0003
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_0300
     * @tc.desc   Remove operation with 11 Sendable type values,
     *            verifies removed value matches and length decrements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveSendableAllValues0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testRemoveSendableAllValues0003';
      console.info(`${caseName}, test start`);
      const sendableValues: TestValue[] = getSendableValues();
      for (let i = 0; i < sendableValues.length; i++) {
        const tv: TestValue = sendableValues[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        cache.put(tv.key, tv.value);
        const removed: lang.ISendable | undefined = cache.remove(tv.key);
        assertEqualSafe(removed, tv.value);
        expect(cache.length).assertEqual(0);
        expect(cache.contains(tv.key)).assertFalse();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testContainsSendableAllValues0004
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_0400
     * @tc.desc   Contains operation with 11 Sendable type values,
     *            verifies key existence before and after put
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testContainsSendableAllValues0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testContainsSendableAllValues0004';
      console.info(`${caseName}, test start`);
      const sendableValues: TestValue[] = getSendableValues();
      for (let i = 0; i < sendableValues.length; i++) {
        const tv: TestValue = sendableValues[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        expect(cache.contains(tv.key)).assertFalse();
        cache.put(tv.key, tv.value);
        expect(cache.contains(tv.key)).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testClearSendableAllValues0005
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_0500
     * @tc.desc   Clear operation with 11 Sendable type values,
     *            verifies all entries removed and length resets to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearSendableAllValues0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testClearSendableAllValues0005';
      console.info(`${caseName}, test start`);
      const sendableValues: TestValue[] = getSendableValues();
      for (let i = 0; i < sendableValues.length; i++) {
        const tv: TestValue = sendableValues[i];
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
     * @tc.name   testEntriesSendableAllValues0006
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_0600
     * @tc.desc   Entries operation with 11 Sendable type values,
     *            verifies iterator returns correct key-value pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEntriesSendableAllValues0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testEntriesSendableAllValues0006';
      console.info(`${caseName}, test start`);
      const sendableValues: TestValue[] = getSendableValues();
      for (let i = 0; i < sendableValues.length; i++) {
        const tv: TestValue = sendableValues[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        cache.put(tv.key, tv.value);
        const iterator: IterableIterator<[lang.ISendable, lang.ISendable]> = cache.entries();
        expect(iterator !== null).assertTrue();
        let count: number = 0;
        let next: IteratorResult<[lang.ISendable, lang.ISendable]> = iterator.next();
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
     * @tc.name   testKeysSendableAllValues0007
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_0700
     * @tc.desc   Keys operation with 11 Sendable type values,
     *            verifies keys array contains the correct key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testKeysSendableAllValues0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testKeysSendableAllValues0007';
      console.info(`${caseName}, test start`);
      const sendableValues: TestValue[] = getSendableValues();
      for (let i = 0; i < sendableValues.length; i++) {
        const tv: TestValue = sendableValues[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        cache.put(tv.key, tv.value);
        const keys: lang.ISendable[] = cache.keys();
        expect(Array.isArray(keys)).assertTrue();
        expect(keys.length).assertEqual(1);
        assertEqualSafe(keys[0], tv.key);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testValuesSendableAllValues0008
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_0800
     * @tc.desc   Values operation with 11 Sendable type values,
     *            verifies values array contains the correct value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testValuesSendableAllValues0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testValuesSendableAllValues0008';
      console.info(`${caseName}, test start`);
      const sendableValues: TestValue[] = getSendableValues();
      for (let i = 0; i < sendableValues.length; i++) {
        const tv: TestValue = sendableValues[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        cache.put(tv.key, tv.value);
        const values: lang.ISendable[] = cache.values();
        expect(Array.isArray(values)).assertTrue();
        expect(values.length).assertEqual(1);
        assertEqualSafe(values[0], tv.value);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testLengthSendableAllValues0009
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_0900
     * @tc.desc   Length property with 11 Sendable type values,
     *            verifies length changes after put and remove
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLengthSendableAllValues0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testLengthSendableAllValues0009';
      console.info(`${caseName}, test start`);
      const sendableValues: TestValue[] = getSendableValues();
      for (let i = 0; i < sendableValues.length; i++) {
        const tv: TestValue = sendableValues[i];
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
     * @tc.name   testGetCapacitySendableAllValues0010
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_1000
     * @tc.desc   GetCapacity operation with 11 Sendable type values,
     *            verifies capacity remains constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCapacitySendableAllValues0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetCapacitySendableAllValues0010';
      console.info(`${caseName}, test start`);
      const sendableValues: TestValue[] = getSendableValues();
      for (let i = 0; i < sendableValues.length; i++) {
        const tv: TestValue = sendableValues[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        expect(cache.getCapacity()).assertEqual(64);
        cache.put(tv.key, tv.value);
        expect(cache.getCapacity()).assertEqual(64);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testUpdateCapacitySendableAllValues0011
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_1100
     * @tc.desc   UpdateCapacity operation with 11 Sendable type values,
     *            verifies capacity updated and entries preserved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUpdateCapacitySendableAllValues0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testUpdateCapacitySendableAllValues0011';
      console.info(`${caseName}, test start`);
      const sendableValues: TestValue[] = getSendableValues();
      for (let i = 0; i < sendableValues.length; i++) {
        const tv: TestValue = sendableValues[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        cache.put(tv.key, tv.value);
        cache.updateCapacity(100);
        expect(cache.getCapacity()).assertEqual(100);
        expect(cache.length).assertEqual(1);
        const retrieved: lang.ISendable | undefined = cache.get(tv.key);
        assertEqualSafe(retrieved, tv.value);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testIsEmptySendableAllValues0012
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_1200
     * @tc.desc   IsEmpty operation with 11 Sendable type values,
     *            verifies empty state transitions correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsEmptySendableAllValues0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testIsEmptySendableAllValues0012';
      console.info(`${caseName}, test start`);
      const sendableValues: TestValue[] = getSendableValues();
      for (let i = 0; i < sendableValues.length; i++) {
        const tv: TestValue = sendableValues[i];
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
     * @tc.name   testToStringSendableAllValues0013
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_1300
     * @tc.desc   ToString operation with 11 Sendable type values,
     *            verifies string representation is valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testToStringSendableAllValues0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testToStringSendableAllValues0013';
      console.info(`${caseName}, test start`);
      const sendableValues: TestValue[] = getSendableValues();
      for (let i = 0; i < sendableValues.length; i++) {
        const tv: TestValue = sendableValues[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        cache.put(tv.key, tv.value);
        const result: string = cache.toString();
        expect(result !== null).assertTrue();
        expect(typeof result === 'string').assertTrue();
        expect(result.length > 0).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testGetCreateCountSendableAllValues0014
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_1400
     * @tc.desc   GetCreateCount operation with 11 Sendable type values,
     *            verifies count always returns 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCreateCountSendableAllValues0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetCreateCountSendableAllValues0014';
      console.info(`${caseName}, test start`);
      const sendableValues: TestValue[] = getSendableValues();
      for (let i = 0; i < sendableValues.length; i++) {
        const tv: TestValue = sendableValues[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        expect(cache.getCreateCount()).assertEqual(0);
        cache.put(tv.key, tv.value);
        expect(cache.getCreateCount()).assertEqual(0);
        expect(cache.contains(tv.key)).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testGetMissCountSendableAllValues0015
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_1500
     * @tc.desc   GetMissCount operation with 11 Sendable type values,
     *            verifies count increments on cache miss
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetMissCountSendableAllValues0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetMissCountSendableAllValues0015';
      console.info(`${caseName}, test start`);
      const sendableValues: TestValue[] = getSendableValues();
      for (let i = 0; i < sendableValues.length; i++) {
        const tv: TestValue = sendableValues[i];
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
     * @tc.name   testGetMatchCountSendableAllValues0016
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_1600
     * @tc.desc   GetMatchCount operation with 11 Sendable type values,
     *            verifies count increments on cache hit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetMatchCountSendableAllValues0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetMatchCountSendableAllValues0016';
      console.info(`${caseName}, test start`);
      const sendableValues: TestValue[] = getSendableValues();
      for (let i = 0; i < sendableValues.length; i++) {
        const tv: TestValue = sendableValues[i];
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
     * @tc.name   testGetRemoveCountSendableAllValues0017
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_1700
     * @tc.desc   GetRemoveCount operation with 11 Sendable type values,
     *            verifies count increments on LRU eviction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetRemoveCountSendableAllValues0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetRemoveCountSendableAllValues0017';
      console.info(`${caseName}, test start`);
      const sendableValues: TestValue[] = getSendableValues();
      for (let i = 0; i < sendableValues.length; i++) {
        const tv: TestValue = sendableValues[i];
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
     * @tc.name   testGetPutCountSendableAllValues0018
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_1800
     * @tc.desc   GetPutCount operation with 11 Sendable type values,
     *            verifies count increments on each put
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPutCountSendableAllValues0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetPutCountSendableAllValues0018';
      console.info(`${caseName}, test start`);
      const sendableValues: TestValue[] = getSendableValues();
      for (let i = 0; i < sendableValues.length; i++) {
        const tv: TestValue = sendableValues[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        expect(cache.getPutCount()).assertEqual(0);
        cache.put(tv.key, tv.value);
        expect(cache.getPutCount()).assertEqual(1);
        cache.put(tv.key, tv.value);
        expect(cache.getPutCount()).assertEqual(2);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testConstructorSendableAllValues0019
     * @tc.number SUB_COLLECTIONS_LRU_SENDABLE_1900
     * @tc.desc   Constructor with 11 Sendable type values,
     *            verifies cache created with correct capacity and stores values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConstructorSendableAllValues0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testConstructorSendableAllValues0019';
      console.info(`${caseName}, test start`);
      const sendableValues: TestValue[] = getSendableValues();
      for (let i = 0; i < sendableValues.length; i++) {
        const tv: TestValue = sendableValues[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        expect(cache !== null).assertTrue();
        expect(cache.getCapacity()).assertEqual(64);
        cache.put(tv.key, tv.value);
        expect(cache.contains(tv.key)).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });
  });
}