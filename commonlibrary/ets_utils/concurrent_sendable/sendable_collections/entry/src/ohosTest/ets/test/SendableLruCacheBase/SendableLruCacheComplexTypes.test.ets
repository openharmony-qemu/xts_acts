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
// 复合类型: 9个测试值 × 19个方法 = 171个测试场景
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

// ===== 普通对象类型 (Sendable) =====
@Sendable
class NormalObject implements lang.ISendable {
  name: string = 'test';
  age: number = 20;
}


// ===== 空对象=====
@Sendable
class EmptyObject implements lang.ISendable {
}

// ===== 用于表示稀疏数组空位的 Sendable 类 =====
@Sendable
class SparsePlaceholder implements lang.ISendable {
  isEmpty: boolean = true;
}

// ===== Sendable 函数 =====
@Sendable
function normalFn(): string {
  return 'normal';
}

@Sendable
function arrowFn(): string {
  return 'arrow';
}

@Sendable
async function asyncFn(): Promise<string> {
  return 'async';
}

// ============================================================
// 1. 复合类型测试值定义 (9个)
// ============================================================

function getCompositeValues(): TestValue[] {
  const result: TestValue[] = [];
  try {
    const normalObj: NormalObject = new NormalObject();
    const emptyObj: EmptyObject = new EmptyObject();
    // 改用 collections.Map 模拟索引签名对象 { [key: string]: number }
    const complexMap: collections.Map<string, number> = new collections.Map<string, number>();
    complexMap.set('prop1', 1);
    complexMap.set('prop2', 2);
    complexMap.set('prop3', 3);

    const normalArr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
    normalArr.push(1);
    normalArr.push(2);
    normalArr.push(3);

    const emptyArr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
    const sparseArr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
    sparseArr.push(1);
    sparseArr.push(new SparsePlaceholder());
    sparseArr.push(2);

    result.push(new TestValue('object_normal', normalObj, normalObj, 'Composite', 'normal object'));
    result.push(new TestValue('object_empty', emptyObj, emptyObj, 'Composite', 'empty object'));
    result.push(new TestValue('object_complex', complexMap, complexMap, 'Composite', 'index signature object (Map)'));
    result.push(new TestValue('array_normal', normalArr, normalArr, 'Composite', 'normal array'));
    result.push(new TestValue('array_empty', emptyArr, emptyArr, 'Composite', 'empty array'));
    result.push(new TestValue('array_sparse', sparseArr, sparseArr, 'Composite', 'sparse array'));
    result.push(new TestValue('function_normal', normalFn, normalFn, 'Composite', 'normal function'));
    result.push(new TestValue('function_arrow', arrowFn, arrowFn, 'Composite', 'arrow function'));
    result.push(new TestValue('function_async', asyncFn, asyncFn, 'Composite', 'async function'));

  } catch (error) {
    console.error('Failed to create composite test values:', error);
    throw new Error(`Composite value creation failed: ${error}`);
  }
  return result;
}

// ============================================================
// 2. 主测试套件
// ============================================================

export default function sendableLruCacheCompositeTest() {
  describe('SendableLruCache_Composite_Test', () => {

    /**
     * @tc.name   testPutCompositeAllValues0001
     * @tc.number SUB_COLLECTIONS_LRU_COMPLEX_0100
     * @tc.desc   Put operation with 9 composite type values,
     *            verifies put returns value and increments length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPutCompositeAllValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testPutCompositeAllValues0001';
      console.info(`${caseName}, test start`);
      const compositeValues: TestValue[] = getCompositeValues();
      for (let i = 0; i < compositeValues.length; i++) {
        const tv: TestValue = compositeValues[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        const result: lang.ISendable = cache.put(tv.key, tv.value);
        assertEqualSafe(result, tv.value);
        expect(cache.length).assertEqual(1);
        expect(cache.contains(tv.key)).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testGetCompositeAllValues0002
     * @tc.number SUB_COLLECTIONS_LRU_COMPLEX_0200
     * @tc.desc   Get operation with 9 composite type values,
     *            verifies retrieved value matches and matchCount increments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCompositeAllValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetCompositeAllValues0002';
      console.info(`${caseName}, test start`);
      const compositeValues: TestValue[] = getCompositeValues();
      for (let i = 0; i < compositeValues.length; i++) {
        const tv: TestValue = compositeValues[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        cache.put(tv.key, tv.value);
        const retrieved: lang.ISendable | undefined = cache.get(tv.key);
        assertEqualSafe(retrieved, tv.value);
        expect(cache.getMatchCount()).assertEqual(1);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testRemoveCompositeAllValues0003
     * @tc.number SUB_COLLECTIONS_LRU_COMPLEX_0300
     * @tc.desc   Remove operation with 9 composite type values,
     *            verifies removed value matches and length decrements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveCompositeAllValues0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testRemoveCompositeAllValues0003';
      console.info(`${caseName}, test start`);
      const compositeValues: TestValue[] = getCompositeValues();
      for (let i = 0; i < compositeValues.length; i++) {
        const tv: TestValue = compositeValues[i];
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
     * @tc.name   testContainsCompositeAllValues0004
     * @tc.number SUB_COLLECTIONS_LRU_COMPLEX_0400
     * @tc.desc   Contains operation with 9 composite type values,
     *            verifies key existence before and after put
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testContainsCompositeAllValues0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testContainsCompositeAllValues0004';
      console.info(`${caseName}, test start`);
      const compositeValues: TestValue[] = getCompositeValues();
      for (let i = 0; i < compositeValues.length; i++) {
        const tv: TestValue = compositeValues[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        expect(cache.contains(tv.key)).assertFalse();
        cache.put(tv.key, tv.value);
        expect(cache.contains(tv.key)).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testClearCompositeAllValues0005
     * @tc.number SUB_COLLECTIONS_LRU_COMPLEX_0500
     * @tc.desc   Clear operation with 9 composite type values,
     *            verifies all entries removed and length resets to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearCompositeAllValues0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testClearCompositeAllValues0005';
      console.info(`${caseName}, test start`);
      const compositeValues: TestValue[] = getCompositeValues();
      for (let i = 0; i < compositeValues.length; i++) {
        const tv: TestValue = compositeValues[i];
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
     * @tc.name   testEntriesCompositeAllValues0006
     * @tc.number SUB_COLLECTIONS_LRU_COMPLEX_0600
     * @tc.desc   Entries operation with 9 composite type values,
     *            verifies iterator returns correct key-value pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEntriesCompositeAllValues0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testEntriesCompositeAllValues0006';
      console.info(`${caseName}, test start`);
      const compositeValues: TestValue[] = getCompositeValues();
      for (let i = 0; i < compositeValues.length; i++) {
        const tv: TestValue = compositeValues[i];
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
     * @tc.name   testKeysCompositeAllValues0007
     * @tc.number SUB_COLLECTIONS_LRU_COMPLEX_0700
     * @tc.desc   Keys operation with 9 composite type values,
     *            verifies keys array contains the correct key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testKeysCompositeAllValues0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testKeysCompositeAllValues0007';
      console.info(`${caseName}, test start`);
      const compositeValues: TestValue[] = getCompositeValues();
      for (let i = 0; i < compositeValues.length; i++) {
        const tv: TestValue = compositeValues[i];
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
     * @tc.name   testValuesCompositeAllValues0008
     * @tc.number SUB_COLLECTIONS_LRU_COMPLEX_0800
     * @tc.desc   Values operation with 9 composite type values,
     *            verifies values array contains the correct value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testValuesCompositeAllValues0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testValuesCompositeAllValues0008';
      console.info(`${caseName}, test start`);
      const compositeValues: TestValue[] = getCompositeValues();
      for (let i = 0; i < compositeValues.length; i++) {
        const tv: TestValue = compositeValues[i];
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
     * @tc.name   testLengthCompositeAllValues0009
     * @tc.number SUB_COLLECTIONS_LRU_COMPLEX_0900
     * @tc.desc   Length property with 9 composite type values,
     *            verifies length changes after put and remove
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLengthCompositeAllValues0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testLengthCompositeAllValues0009';
      console.info(`${caseName}, test start`);
      const compositeValues: TestValue[] = getCompositeValues();
      for (let i = 0; i < compositeValues.length; i++) {
        const tv: TestValue = compositeValues[i];
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
     * @tc.name   testGetCapacityCompositeAllValues0010
     * @tc.number SUB_COLLECTIONS_LRU_COMPLEX_1000
     * @tc.desc   GetCapacity operation with 9 composite type values,
     *            verifies capacity remains constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCapacityCompositeAllValues0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetCapacityCompositeAllValues0010';
      console.info(`${caseName}, test start`);
      const compositeValues: TestValue[] = getCompositeValues();
      for (let i = 0; i < compositeValues.length; i++) {
        const tv: TestValue = compositeValues[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        expect(cache.getCapacity()).assertEqual(64);
        cache.put(tv.key, tv.value);
        expect(cache.getCapacity()).assertEqual(64);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testUpdateCapacityCompositeAllValues0011
     * @tc.number SUB_COLLECTIONS_LRU_COMPLEX_1100
     * @tc.desc   UpdateCapacity operation with 9 composite type values,
     *            verifies capacity updated and entries preserved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUpdateCapacityCompositeAllValues0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testUpdateCapacityCompositeAllValues0011';
      console.info(`${caseName}, test start`);
      const compositeValues: TestValue[] = getCompositeValues();
      for (let i = 0; i < compositeValues.length; i++) {
        const tv: TestValue = compositeValues[i];
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
     * @tc.name   testIsEmptyCompositeAllValues0012
     * @tc.number SUB_COLLECTIONS_LRU_COMPLEX_1200
     * @tc.desc   IsEmpty operation with 9 composite type values,
     *            verifies empty state transitions correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsEmptyCompositeAllValues0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testIsEmptyCompositeAllValues0012';
      console.info(`${caseName}, test start`);
      const compositeValues: TestValue[] = getCompositeValues();
      for (let i = 0; i < compositeValues.length; i++) {
        const tv: TestValue = compositeValues[i];
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
     * @tc.name   testToStringCompositeAllValues0013
     * @tc.number SUB_COLLECTIONS_LRU_COMPLEX_1300
     * @tc.desc   ToString operation with 9 composite type values,
     *            verifies string representation is valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testToStringCompositeAllValues0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testToStringCompositeAllValues0013';
      console.info(`${caseName}, test start`);
      const compositeValues: TestValue[] = getCompositeValues();
      for (let i = 0; i < compositeValues.length; i++) {
        const tv: TestValue = compositeValues[i];
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
     * @tc.name   testGetCreateCountCompositeAllValues0014
     * @tc.number SUB_COLLECTIONS_LRU_COMPLEX_1400
     * @tc.desc   GetCreateCount operation with 9 composite type values,
     *            verifies count always returns 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCreateCountCompositeAllValues0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetCreateCountCompositeAllValues0014';
      console.info(`${caseName}, test start`);
      const compositeValues: TestValue[] = getCompositeValues();
      for (let i = 0; i < compositeValues.length; i++) {
        const tv: TestValue = compositeValues[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        expect(cache.getCreateCount()).assertEqual(0);
        cache.put(tv.key, tv.value);
        expect(cache.getCreateCount()).assertEqual(0);
        expect(cache.contains(tv.key)).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testGetMissCountCompositeAllValues0015
     * @tc.number SUB_COLLECTIONS_LRU_COMPLEX_1500
     * @tc.desc   GetMissCount operation with 9 composite type values,
     *            verifies count increments on cache miss
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetMissCountCompositeAllValues0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetMissCountCompositeAllValues0015';
      console.info(`${caseName}, test start`);
      const compositeValues: TestValue[] = getCompositeValues();
      for (let i = 0; i < compositeValues.length; i++) {
        const tv: TestValue = compositeValues[i];
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
     * @tc.name   testGetMatchCountCompositeAllValues0016
     * @tc.number SUB_COLLECTIONS_LRU_COMPLEX_1600
     * @tc.desc   GetMatchCount operation with 9 composite type values,
     *            verifies count increments on cache hit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetMatchCountCompositeAllValues0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetMatchCountCompositeAllValues0016';
      console.info(`${caseName}, test start`);
      const compositeValues: TestValue[] = getCompositeValues();
      for (let i = 0; i < compositeValues.length; i++) {
        const tv: TestValue = compositeValues[i];
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
     * @tc.name   testGetRemoveCountCompositeAllValues0017
     * @tc.number SUB_COLLECTIONS_LRU_COMPLEX_1700
     * @tc.desc   GetRemoveCount operation with 9 composite type values,
     *            verifies count increments on LRU eviction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetRemoveCountCompositeAllValues0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetRemoveCountCompositeAllValues0017';
      console.info(`${caseName}, test start`);
      const compositeValues: TestValue[] = getCompositeValues();
      for (let i = 0; i < compositeValues.length; i++) {
        const tv: TestValue = compositeValues[i];
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
     * @tc.name   testGetPutCountCompositeAllValues0018
     * @tc.number SUB_COLLECTIONS_LRU_COMPLEX_1800
     * @tc.desc   GetPutCount operation with 9 composite type values,
     *            verifies count increments on each put
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPutCountCompositeAllValues0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetPutCountCompositeAllValues0018';
      console.info(`${caseName}, test start`);
      const compositeValues: TestValue[] = getCompositeValues();
      for (let i = 0; i < compositeValues.length; i++) {
        const tv: TestValue = compositeValues[i];
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
     * @tc.name   testConstructorCompositeAllValues0019
     * @tc.number SUB_COLLECTIONS_LRU_COMPLEX_1900
     * @tc.desc   Constructor with 9 composite type values,
     *            verifies cache created with correct capacity and stores values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConstructorCompositeAllValues0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testConstructorCompositeAllValues0019';
      console.info(`${caseName}, test start`);
      const compositeValues: TestValue[] = getCompositeValues();
      for (let i = 0; i < compositeValues.length; i++) {
        const tv: TestValue = compositeValues[i];
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