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
import { ArkTSUtils } from '@kit.ArkTS';
import { lang } from '@kit.ArkTS';

// ============================================================
// 0. 类型定义 - 使用联合类型解决 null/undefined 问题
// ============================================================

// 定义联合类型别名
type SendableOrNull = lang.ISendable | null | undefined;

class TestValue {
  id: string = '';
  key: SendableOrNull = 0;  // 修改为联合类型
  value: SendableOrNull = 0;  // 修改为联合类型
  category: string = '';
  desc: string = '';

  constructor(id: string, key: SendableOrNull, value: SendableOrNull, category: string, desc: string) {
    this.id = id;
    this.key = key;
    this.value = value;
    this.category = category;
    this.desc = desc;
  }
}

// ===== 辅助函数：安全断言两个值相等 =====
function assertEqualSafe(actual: SendableOrNull | undefined, expected: SendableOrNull): void {
  // 处理 null 和 undefined 的特殊情况
  if (actual === null && expected === null) {
    return;
  }
  if (actual === undefined && expected === undefined) {
    return;
  }
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
// 1. 基础类型测试值定义 (12个)
// ============================================================

function getBasicValues(): TestValue[] {
  const result: TestValue[] = [];
  result.push(new TestValue('number_normal', 100, 100, 'Basic', 'normal integer'));
  result.push(new TestValue('number_special', 1.5e-10, 1.5e-10, 'Basic', 'scientific notation float'));
  result.push(new TestValue('number_boundary', Number.MAX_SAFE_INTEGER, Number.MAX_SAFE_INTEGER,
    'Basic', 'max safe integer'));
  result.push(new TestValue('number_nan', NaN, NaN, 'Basic', 'NaN value'));
  result.push(new TestValue('string_normal', 'test测试123', 'test测试123', 'Basic', 'normal string'));
  result.push(new TestValue('string_special', 'a\n\t\u200B\u0000', 'a\n\t\u200B\u0000', 'Basic', 'special chars'));
  result.push(new TestValue('string_emoji', '测试😀🎉🔥', '测试😀🎉🔥', 'Basic', 'string with emoji'));
  result.push(new TestValue('string_empty', '', '', 'Basic', 'empty string'));
  result.push(new TestValue('boolean_true', true, true, 'Basic', 'true value'));
  result.push(new TestValue('boolean_false', false, false, 'Basic', 'false value'));

  // ===== 新增 number 特殊值 =====
  result.push(new TestValue('number_negative_one', -1, -1, 'Basic', 'number -1'));
  result.push(new TestValue('number_negative_max', Number.MIN_SAFE_INTEGER, Number.MIN_SAFE_INTEGER,
    'Basic', 'min safe integer'));
  result.push(new TestValue('number_zero', 0, 0, 'Basic', 'number 0'));
  result.push(new TestValue('number_negative_zero', -0, -0, 'Basic', 'negative zero'));
  result.push(new TestValue('number_hex', 0x12, 0x12, 'Basic', 'hexadecimal 0x12'));
  result.push(new TestValue('number_octal', 0o77, 0o77, 'Basic', 'octal 0o77'));
  result.push(new TestValue('number_binary', 0b1010, 0b1010, 'Basic', 'binary 0b1010'));
  result.push(new TestValue('number_infinity', Infinity, Infinity, 'Basic', 'Infinity'));
  result.push(new TestValue('number_negative_infinity', -Infinity, -Infinity, 'Basic', 'negative Infinity'));
  result.push(new TestValue('number_float_pi', 3.141592653589793, 3.141592653589793, 'Basic', 'PI float'));
  result.push(new TestValue('number_float_negative', -0.001, -0.001, 'Basic', 'negative float'));
  result.push(new TestValue('number_negative_01', -0.01, -0.01, 'Basic', 'negative 0.01'));

  // ===== 新增 bigint 测试值 =====
  result.push(new TestValue('bigint_normal', BigInt(100), BigInt(100), 'Basic', 'normal bigint'));
  result.push(new TestValue('bigint_large', BigInt(Number.MAX_SAFE_INTEGER) + BigInt(1),
    BigInt(Number.MAX_SAFE_INTEGER) + BigInt(1), 'Basic', 'large bigint'));
  result.push(new TestValue('bigint_zero', BigInt(0), BigInt(0), 'Basic', 'bigint zero'));
  result.push(new TestValue('bigint_negative', BigInt(-1), BigInt(-1), 'Basic', 'negative bigint'));
  return result;
}

// ============================================================
// 2. 主测试套件
// ============================================================

export default function sendableLruCacheBasicTest() {
  describe('sendableLruCacheBasicTest', () => {

    /**
     * @tc.setup 在每个测试用例执行前等待20ms
     */
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    /**
     * @tc.name   testPutBasicAllValues0001
     * @tc.number SUB_COLLECTIONS_LRU_BASIC_0100
     * @tc.desc   Put operation with  basic type values,
     *            verifies put returns value and increments length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPutBasicAllValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testPutBasicAllValues0001';
      console.info(`${caseName}, test start`);
      const basicValues: TestValue[] = getBasicValues();
      for (let i = 0; i < basicValues.length; i++) {
        const tv: TestValue = basicValues[i];
        // 修改泛型参数为联合类型
        const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
        const result: SendableOrNull = cache.put(tv.key, tv.value);
        assertEqualSafe(result, tv.value);
        expect(cache.length).assertEqual(1);
        expect(cache.contains(tv.key)).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testGetBasicAllValues0002
     * @tc.number SUB_COLLECTIONS_LRU_BASIC_0200
     * @tc.desc   Get operation with  basic type values,
     *            verifies retrieved value matches and matchCount increments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetBasicAllValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetBasicAllValues0002';
      console.info(`${caseName}, test start`);
      const basicValues: TestValue[] = getBasicValues();
      for (let i = 0; i < basicValues.length; i++) {
        const tv: TestValue = basicValues[i];
        const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
        cache.put(tv.key, tv.value);
        const retrieved: SendableOrNull | undefined = cache.get(tv.key);
        assertEqualSafe(retrieved, tv.value);
        expect(cache.getMatchCount()).assertEqual(1);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testRemoveBasicAllValues0003
     * @tc.number SUB_COLLECTIONS_LRU_BASIC_0300
     * @tc.desc   Remove operation with  basic type values,
     *            verifies removed value matches and length decrements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveBasicAllValues0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testRemoveBasicAllValues0003';
      console.info(`${caseName}, test start`);
      const basicValues: TestValue[] = getBasicValues();
      for (let i = 0; i < basicValues.length; i++) {
        const tv: TestValue = basicValues[i];
        const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
        cache.put(tv.key, tv.value);
        const removed: SendableOrNull | undefined = cache.remove(tv.key);
        assertEqualSafe(removed, tv.value);
        expect(cache.length).assertEqual(0);
        expect(cache.contains(tv.key)).assertFalse();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testContainsBasicAllValues0004
     * @tc.number SUB_COLLECTIONS_LRU_BASIC_0400
     * @tc.desc   Contains operation with basic type values,
     *            verifies key existence before and after put
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testContainsBasicAllValues0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testContainsBasicAllValues0004';
      console.info(`${caseName}, test start`);
      const basicValues: TestValue[] = getBasicValues();
      for (let i = 0; i < basicValues.length; i++) {
        const tv: TestValue = basicValues[i];
        const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
        expect(cache.contains(tv.key)).assertFalse();
        cache.put(tv.key, tv.value);
        expect(cache.contains(tv.key)).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testClearBasicAllValues0005
     * @tc.number SUB_COLLECTIONS_LRU_BASIC_0500
     * @tc.desc   Clear operation with basic type values,
     *            verifies all entries removed and length resets to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearBasicAllValues0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testClearBasicAllValues0005';
      console.info(`${caseName}, test start`);
      const basicValues: TestValue[] = getBasicValues();
      for (let i = 0; i < basicValues.length; i++) {
        const tv: TestValue = basicValues[i];
        const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
        cache.put(tv.key, tv.value);
        cache.clear();
        expect(cache.length).assertEqual(0);
        expect(cache.isEmpty()).assertTrue();
        expect(cache.contains(tv.key)).assertFalse();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testEntriesBasicAllValues0006
     * @tc.number SUB_COLLECTIONS_LRU_BASIC_0600
     * @tc.desc   Entries operation with basic type values,
     *            verifies iterator returns correct key-value pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEntriesBasicAllValues0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testEntriesBasicAllValues0006';
      console.info(`${caseName}, test start`);
      const basicValues: TestValue[] = getBasicValues();
      for (let i = 0; i < basicValues.length; i++) {
        const tv: TestValue = basicValues[i];
        const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
        cache.put(tv.key, tv.value);
        const iterator: IterableIterator<[SendableOrNull, SendableOrNull]> = cache.entries();
        expect(iterator !== null).assertTrue();
        let count: number = 0;
        let next: IteratorResult<[SendableOrNull, SendableOrNull]> = iterator.next();
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
     * @tc.name   testKeysBasicAllValues0007
     * @tc.number SUB_COLLECTIONS_LRU_BASIC_0700
     * @tc.desc   Keys operation with  basic type values,
     *            verifies keys array contains the correct key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testKeysBasicAllValues0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testKeysBasicAllValues0007';
      console.info(`${caseName}, test start`);
      const basicValues: TestValue[] = getBasicValues();
      for (let i = 0; i < basicValues.length; i++) {
        const tv: TestValue = basicValues[i];
        const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
        cache.put(tv.key, tv.value);
        const keys: SendableOrNull[] = cache.keys();
        expect(Array.isArray(keys)).assertTrue();
        expect(keys.length).assertEqual(1);
        assertEqualSafe(keys[0], tv.key);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testValuesBasicAllValues0008
     * @tc.number SUB_COLLECTIONS_LRU_BASIC_0800
     * @tc.desc   Values operation with  basic type values,
     *            verifies values array contains the correct value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testValuesBasicAllValues0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testValuesBasicAllValues0008';
      console.info(`${caseName}, test start`);
      const basicValues: TestValue[] = getBasicValues();
      for (let i = 0; i < basicValues.length; i++) {
        const tv: TestValue = basicValues[i];
        const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
        cache.put(tv.key, tv.value);
        const values: SendableOrNull[] = cache.values();
        expect(Array.isArray(values)).assertTrue();
        expect(values.length).assertEqual(1);
        assertEqualSafe(values[0], tv.value);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testLengthBasicAllValues0009
     * @tc.number SUB_COLLECTIONS_LRU_BASIC_0900
     * @tc.desc   Length property with  basic type values,
     *            verifies length changes after put and remove
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLengthBasicAllValues0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testLengthBasicAllValues0009';
      console.info(`${caseName}, test start`);
      const basicValues: TestValue[] = getBasicValues();
      for (let i = 0; i < basicValues.length; i++) {
        const tv: TestValue = basicValues[i];
        const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
        expect(cache.length).assertEqual(0);
        cache.put(tv.key, tv.value);
        expect(cache.length).assertEqual(1);
        cache.remove(tv.key);
        expect(cache.length).assertEqual(0);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testGetCapacityBasicAllValues0010
     * @tc.number SUB_COLLECTIONS_LRU_BASIC_1000
     * @tc.desc   GetCapacity operation with  basic type values,
     *            verifies capacity remains constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCapacityBasicAllValues0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetCapacityBasicAllValues0010';
      console.info(`${caseName}, test start`);
      const basicValues: TestValue[] = getBasicValues();
      for (let i = 0; i < basicValues.length; i++) {
        const tv: TestValue = basicValues[i];
        const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
        expect(cache.getCapacity()).assertEqual(64);
        cache.put(tv.key, tv.value);
        expect(cache.getCapacity()).assertEqual(64);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testUpdateCapacityBasicAllValues0011
     * @tc.number SUB_COLLECTIONS_LRU_BASIC_1100
     * @tc.desc   UpdateCapacity operation with basic type values,
     *            verifies capacity updated and entries preserved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUpdateCapacityBasicAllValues0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testUpdateCapacityBasicAllValues0011';
      console.info(`${caseName}, test start`);
      const basicValues: TestValue[] = getBasicValues();
      for (let i = 0; i < basicValues.length; i++) {
        const tv: TestValue = basicValues[i];
        const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
        // ===== 场景1: 扩大容量 =====
        cache.put(tv.key, tv.value);
        cache.updateCapacity(100);
        expect(cache.getCapacity()).assertEqual(100);
        expect(cache.length).assertEqual(1);
        const retrieved1: SendableOrNull | undefined = cache.get(tv.key);
        assertEqualSafe(retrieved1, tv.value);
        // ===== 场景2: 缩小容量（不触发淘汰） =====
        cache.clear();
        cache.put(tv.key, tv.value);
        cache.updateCapacity(10);
        expect(cache.getCapacity()).assertEqual(10);
        expect(cache.length).assertEqual(1);
        const retrieved2: SendableOrNull | undefined = cache.get(tv.key);
        assertEqualSafe(retrieved2, tv.value);
        // ===== 场景3: 缩小容量（触发LRU淘汰） =====
        const smallCache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(5);
        smallCache.put(tv.key, tv.value);
        smallCache.put('__aux1__', '__aux1__');
        smallCache.put('__aux2__', '__aux2__');
        smallCache.put('__aux3__', '__aux3__');
        smallCache.put('__aux4__', '__aux4__');
        expect(smallCache.length).assertEqual(5);
        smallCache.get(tv.key);
        smallCache.updateCapacity(3);
        expect(smallCache.getCapacity()).assertEqual(3);
        expect(smallCache.length).assertEqual(3);
        expect(smallCache.contains(tv.key)).assertTrue();
        if (typeof tv.key === 'number' && Number.isNaN(tv.key)) {
          const retrievedNaN: SendableOrNull | undefined = smallCache.get(tv.key);
          assertEqualSafe(retrievedNaN, tv.value);
        }
        expect(smallCache.contains('__aux1__')).assertFalse();
        expect(smallCache.contains('__aux2__')).assertFalse();
        expect(smallCache.contains('__aux3__')).assertTrue();
        expect(smallCache.contains('__aux4__')).assertTrue();
        const retrieved3: SendableOrNull | undefined = smallCache.get(tv.key);
        assertEqualSafe(retrieved3, tv.value);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testIsEmptyBasicAllValues0012
     * @tc.number SUB_COLLECTIONS_LRU_BASIC_1200
     * @tc.desc   IsEmpty operation with  basic type values,
     *            verifies empty state transitions correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsEmptyBasicAllValues0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testIsEmptyBasicAllValues0012';
      console.info(`${caseName}, test start`);
      const basicValues: TestValue[] = getBasicValues();
      for (let i = 0; i < basicValues.length; i++) {
        const tv: TestValue = basicValues[i];
        const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
        expect(cache.isEmpty()).assertTrue();
        cache.put(tv.key, tv.value);
        expect(cache.isEmpty()).assertFalse();
        cache.remove(tv.key);
        expect(cache.isEmpty()).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testToStringBasicAllValues0013
     * @tc.number SUB_COLLECTIONS_LRU_BASIC_1300
     * @tc.desc   ToString operation with  basic type values,
     *            verifies string representation is valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testToStringBasicAllValues0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testToStringBasicAllValues0013';
      console.info(`${caseName}, test start`);
      const basicValues: TestValue[] = getBasicValues();
      for (let i = 0; i < basicValues.length; i++) {
        const tv: TestValue = basicValues[i];
        const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
        cache.put(tv.key, tv.value);
        const result: string = cache.toString();
        expect(result !== null).assertTrue();
        expect(typeof result === 'string').assertTrue();
        expect(result.length > 0).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testGetCreateCountBasicAllValues0014
     * @tc.number SUB_COLLECTIONS_LRU_BASIC_1400
     * @tc.desc   GetCreateCount operation with  basic type values,
     *            verifies count always returns 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCreateCountBasicAllValues0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetCreateCountBasicAllValues0014';
      console.info(`${caseName}, test start`);
      const basicValues: TestValue[] = getBasicValues();
      for (let i = 0; i < basicValues.length; i++) {
        const tv: TestValue = basicValues[i];
        const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
        expect(cache.getCreateCount()).assertEqual(0);
        cache.put(tv.key, tv.value);
        expect(cache.getCreateCount()).assertEqual(0);
        expect(cache.contains(tv.key)).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testGetMissCountBasicAllValues0015
     * @tc.number SUB_COLLECTIONS_LRU_BASIC_1500
     * @tc.desc   GetMissCount operation with  basic type values,
     *            verifies count increments on cache miss
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetMissCountBasicAllValues0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetMissCountBasicAllValues0015';
      console.info(`${caseName}, test start`);
      const basicValues: TestValue[] = getBasicValues();
      for (let i = 0; i < basicValues.length; i++) {
        const tv: TestValue = basicValues[i];
        const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
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
     * @tc.name   testGetMatchCountBasicAllValues0016
     * @tc.number SUB_COLLECTIONS_LRU_BASIC_1600
     * @tc.desc   GetMatchCount operation with  basic type values,
     *            verifies count increments on cache hit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetMatchCountBasicAllValues0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetMatchCountBasicAllValues0016';
      console.info(`${caseName}, test start`);
      const basicValues: TestValue[] = getBasicValues();
      for (let i = 0; i < basicValues.length; i++) {
        const tv: TestValue = basicValues[i];
        const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
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
     * @tc.name   testGetRemoveCountBasicAllValues0017
     * @tc.number SUB_COLLECTIONS_LRU_BASIC_1700
     * @tc.desc   GetRemoveCount operation with basic type values,
     *            verifies count increments on LRU eviction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetRemoveCountBasicAllValues0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetRemoveCountBasicAllValues0017';
      console.info(`${caseName}, test start`);
      const basicValues: TestValue[] = getBasicValues();
      for (let i = 0; i < basicValues.length; i++) {
        const tv: TestValue = basicValues[i];
        const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(2);
        expect(cache.getRemoveCount()).assertEqual(0);
        cache.put(tv.key, tv.value);
        const keyA: SendableOrNull = '__auxA__';
        cache.put(keyA, keyA);
        const keyB: SendableOrNull = '__auxB__';
        cache.put(keyB, keyB);
        expect(cache.getRemoveCount()).assertEqual(1);
        expect(cache.contains(tv.key)).assertFalse();
        expect(cache.contains(keyA)).assertTrue();
        expect(cache.contains(keyB)).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testGetPutCountBasicAllValues0018
     * @tc.number SUB_COLLECTIONS_LRU_BASIC_1800
     * @tc.desc   GetPutCount operation with  basic type values,
     *            verifies count increments on each put
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPutCountBasicAllValues0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetPutCountBasicAllValues0018';
      console.info(`${caseName}, test start`);
      const basicValues: TestValue[] = getBasicValues();
      for (let i = 0; i < basicValues.length; i++) {
        const tv: TestValue = basicValues[i];
        const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
        expect(cache.getPutCount()).assertEqual(0);
        cache.put(tv.key, tv.value);
        expect(cache.getPutCount()).assertEqual(1);
        cache.put(tv.key, tv.value);
        expect(cache.getPutCount()).assertEqual(2);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testConstructorBasicAllValues0019
     * @tc.number SUB_COLLECTIONS_LRU_BASIC_1900
     * @tc.desc   Constructor with  basic type values,
     *            verifies cache created with correct capacity and stores values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConstructorBasicAllValues0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testConstructorBasicAllValues0019';
      console.info(`${caseName}, test start`);
      const basicValues: TestValue[] = getBasicValues();
      for (let i = 0; i < basicValues.length; i++) {
        const tv: TestValue = basicValues[i];
        const cache = new ArkTSUtils.SendableLruCache<SendableOrNull, SendableOrNull>(64);
        expect(cache !== null).assertTrue();
        expect(cache.getCapacity()).assertEqual(64);
        cache.put(tv.key, tv.value);
        expect(cache.contains(tv.key)).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });
  });
}