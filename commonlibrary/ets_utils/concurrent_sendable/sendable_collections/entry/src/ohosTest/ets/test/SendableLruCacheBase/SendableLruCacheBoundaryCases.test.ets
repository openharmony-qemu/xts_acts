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
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.18
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { collections, ArkTSUtils } from '@kit.ArkTS';
import { lang } from '@kit.ArkTS';

// ============================================================
// 边界类型: 4个测试值 × 19个方法 = 76个测试场景
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

// ===== 用于深层嵌套和循环引用的 Sendable 类 =====
@Sendable
class NestedNode implements lang.ISendable {
  level: number = 0;
  child: NestedNode | null = null;
  constructor(level: number) {
    this.level = level;
  }
  setChild(child: NestedNode): void {
    this.child = child;
  }
}

@Sendable
class CircularNode implements lang.ISendable {
  name: string = '';
  self: CircularNode | null = null;
  constructor(name: string) {
    this.name = name;
  }
  setSelf(): void {
    this.self = this;
  }
}

// ============================================================
// 1. 边界类型测试值定义 (4个)
// ============================================================

function getBoundaryValues(): TestValue[] {
  const result: TestValue[] = [];
  // large_object: 1000+属性对象
  try {
    const largeMap: collections.Map<string, number> = new collections.Map<string, number>();
    for (let i = 0; i < 1000; i++) {
      largeMap.set('key' + i, i);
    }
    // large_array: 10000+元素数组
    const largeArr: collections.Array<lang.ISendable> = new collections.Array<lang.ISendable>();
    for (let i = 0; i < 10000; i++) {
      largeArr.push(i);
    }
    // deep_nested: 10+层嵌套对象
    const rootNode: NestedNode = new NestedNode(10);
    let currentNode: NestedNode = rootNode;
    for (let i = 9; i >= 1; i--) {
      const childNode: NestedNode = new NestedNode(i);
      currentNode.setChild(childNode);
      currentNode = childNode;
    }
    // circular_ref: 自引用对象
    const circularNode: CircularNode = new CircularNode('circular');
    circularNode.setSelf();

    result.push(new TestValue('large_object', largeMap, largeMap, 'Boundary', 'large object 1000+'));
    result.push(new TestValue('large_array', largeArr, largeArr, 'Boundary', 'large array 10000+'));
    result.push(new TestValue('deep_nested', rootNode, rootNode, 'Boundary', 'deep nested 10+'));
    result.push(new TestValue('circular_ref', circularNode, circularNode, 'Boundary', 'circular reference'));
  } catch (error) {
    console.error('Failed to create boundary test values:', error);
    throw new Error(`Boundary value creation failed: ${error}`);
  }
  return result;
}

// ============================================================
// 2. 主测试套件
// ============================================================

export default function sendableLruCacheBoundaryTest() {
  describe('SendableLruCache_Boundary_Test', () => {

    /**
     * @tc.name   testPutBoundaryAllValues0001
     * @tc.number SUB_COLLECTIONS_LRU_BOUNDARY_0100
     * @tc.desc   Put operation with 4 boundary type values,
     *            verifies put returns value and increments length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPutBoundaryAllValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testPutBoundaryAllValues0001';
      console.info(`${caseName}, test start`);
      const boundaryValues: TestValue[] = getBoundaryValues();
      for (let i = 0; i < boundaryValues.length; i++) {
        const tv: TestValue = boundaryValues[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        const result: lang.ISendable = cache.put(tv.key, tv.value);
        assertEqualSafe(result, tv.value);
        expect(cache.length).assertEqual(1);
        expect(cache.contains(tv.key)).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testGetBoundaryAllValues0002
     * @tc.number SUB_COLLECTIONS_LRU_BOUNDARY_0200
     * @tc.desc   Get operation with 4 boundary type values,
     *            verifies retrieved value matches and matchCount increments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetBoundaryAllValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetBoundaryAllValues0002';
      console.info(`${caseName}, test start`);
      const boundaryValues: TestValue[] = getBoundaryValues();
      for (let i = 0; i < boundaryValues.length; i++) {
        const tv: TestValue = boundaryValues[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        cache.put(tv.key, tv.value);
        const retrieved: lang.ISendable | undefined = cache.get(tv.key);
        assertEqualSafe(retrieved, tv.value);
        expect(cache.getMatchCount()).assertEqual(1);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testRemoveBoundaryAllValues0003
     * @tc.number SUB_COLLECTIONS_LRU_BOUNDARY_0300
     * @tc.desc   Remove operation with 4 boundary type values,
     *            verifies removed value matches and length decrements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveBoundaryAllValues0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testRemoveBoundaryAllValues0003';
      console.info(`${caseName}, test start`);
      const boundaryValues: TestValue[] = getBoundaryValues();
      for (let i = 0; i < boundaryValues.length; i++) {
        const tv: TestValue = boundaryValues[i];
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
     * @tc.name   testContainsBoundaryAllValues0004
     * @tc.number SUB_COLLECTIONS_LRU_BOUNDARY_0400
     * @tc.desc   Contains operation with 4 boundary type values,
     *            verifies key existence before and after put
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testContainsBoundaryAllValues0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testContainsBoundaryAllValues0004';
      console.info(`${caseName}, test start`);
      const boundaryValues: TestValue[] = getBoundaryValues();
      for (let i = 0; i < boundaryValues.length; i++) {
        const tv: TestValue = boundaryValues[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        expect(cache.contains(tv.key)).assertFalse();
        cache.put(tv.key, tv.value);
        expect(cache.contains(tv.key)).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testClearBoundaryAllValues0005
     * @tc.number SUB_COLLECTIONS_LRU_BOUNDARY_0500
     * @tc.desc   Clear operation with 4 boundary type values,
     *            verifies all entries removed and length resets to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearBoundaryAllValues0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testClearBoundaryAllValues0005';
      console.info(`${caseName}, test start`);
      const boundaryValues: TestValue[] = getBoundaryValues();
      for (let i = 0; i < boundaryValues.length; i++) {
        const tv: TestValue = boundaryValues[i];
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
     * @tc.name   testEntriesBoundaryAllValues0006
     * @tc.number SUB_COLLECTIONS_LRU_BOUNDARY_0600
     * @tc.desc   Entries operation with 4 boundary type values,
     *            verifies iterator returns correct key-value pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEntriesBoundaryAllValues0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testEntriesBoundaryAllValues0006';
      console.info(`${caseName}, test start`);
      const boundaryValues: TestValue[] = getBoundaryValues();
      for (let i = 0; i < boundaryValues.length; i++) {
        const tv: TestValue = boundaryValues[i];
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
     * @tc.name   testKeysBoundaryAllValues0007
     * @tc.number SUB_COLLECTIONS_LRU_BOUNDARY_0700
     * @tc.desc   Keys operation with 4 boundary type values,
     *            verifies keys array contains the correct key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testKeysBoundaryAllValues0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testKeysBoundaryAllValues0007';
      console.info(`${caseName}, test start`);
      const boundaryValues: TestValue[] = getBoundaryValues();
      for (let i = 0; i < boundaryValues.length; i++) {
        const tv: TestValue = boundaryValues[i];
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
     * @tc.name   testValuesBoundaryAllValues0008
     * @tc.number SUB_COLLECTIONS_LRU_BOUNDARY_0800
     * @tc.desc   Values operation with 4 boundary type values,
     *            verifies values array contains the correct value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testValuesBoundaryAllValues0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testValuesBoundaryAllValues0008';
      console.info(`${caseName}, test start`);
      const boundaryValues: TestValue[] = getBoundaryValues();
      for (let i = 0; i < boundaryValues.length; i++) {
        const tv: TestValue = boundaryValues[i];
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
     * @tc.name   testLengthBoundaryAllValues0009
     * @tc.number SUB_COLLECTIONS_LRU_BOUNDARY_0900
     * @tc.desc   Length property with 4 boundary type values,
     *            verifies length changes after put and remove
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLengthBoundaryAllValues0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testLengthBoundaryAllValues0009';
      console.info(`${caseName}, test start`);
      const boundaryValues: TestValue[] = getBoundaryValues();
      for (let i = 0; i < boundaryValues.length; i++) {
        const tv: TestValue = boundaryValues[i];
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
     * @tc.name   testGetCapacityBoundaryAllValues0010
     * @tc.number SUB_COLLECTIONS_LRU_BOUNDARY_1000
     * @tc.desc   GetCapacity operation with 4 boundary type values,
     *            verifies capacity remains constant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCapacityBoundaryAllValues0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetCapacityBoundaryAllValues0010';
      console.info(`${caseName}, test start`);
      const boundaryValues: TestValue[] = getBoundaryValues();
      for (let i = 0; i < boundaryValues.length; i++) {
        const tv: TestValue = boundaryValues[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        expect(cache.getCapacity()).assertEqual(64);
        cache.put(tv.key, tv.value);
        expect(cache.getCapacity()).assertEqual(64);
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testUpdateCapacityBoundaryAllValues0011
     * @tc.number SUB_COLLECTIONS_LRU_BOUNDARY_1100
     * @tc.desc   UpdateCapacity operation with 4 boundary type values,
     *            verifies capacity updated and entries preserved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUpdateCapacityBoundaryAllValues0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testUpdateCapacityBoundaryAllValues0011';
      console.info(`${caseName}, test start`);
      const boundaryValues: TestValue[] = getBoundaryValues();
      for (let i = 0; i < boundaryValues.length; i++) {
        const tv: TestValue = boundaryValues[i];
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
     * @tc.name   testIsEmptyBoundaryAllValues0012
     * @tc.number SUB_COLLECTIONS_LRU_BOUNDARY_1200
     * @tc.desc   IsEmpty operation with 4 boundary type values,
     *            verifies empty state transitions correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsEmptyBoundaryAllValues0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testIsEmptyBoundaryAllValues0012';
      console.info(`${caseName}, test start`);
      const boundaryValues: TestValue[] = getBoundaryValues();
      for (let i = 0; i < boundaryValues.length; i++) {
        const tv: TestValue = boundaryValues[i];
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
     * @tc.name   testToStringBoundaryAllValues0013
     * @tc.number SUB_COLLECTIONS_LRU_BOUNDARY_1300
     * @tc.desc   ToString operation with 4 boundary type values,
     *            verifies string representation is valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testToStringBoundaryAllValues0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testToStringBoundaryAllValues0013';
      console.info(`${caseName}, test start`);
      const boundaryValues: TestValue[] = getBoundaryValues();
      for (let i = 0; i < boundaryValues.length; i++) {
        const tv: TestValue = boundaryValues[i];
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
     * @tc.name   testGetCreateCountBoundaryAllValues0014
     * @tc.number SUB_COLLECTIONS_LRU_BOUNDARY_1400
     * @tc.desc   GetCreateCount operation with 4 boundary type values,
     *            verifies count always returns 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCreateCountBoundaryAllValues0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetCreateCountBoundaryAllValues0014';
      console.info(`${caseName}, test start`);
      const boundaryValues: TestValue[] = getBoundaryValues();
      for (let i = 0; i < boundaryValues.length; i++) {
        const tv: TestValue = boundaryValues[i];
        const cache = new ArkTSUtils.SendableLruCache<lang.ISendable, lang.ISendable>(64);
        expect(cache.getCreateCount()).assertEqual(0);
        cache.put(tv.key, tv.value);
        expect(cache.getCreateCount()).assertEqual(0);
        expect(cache.contains(tv.key)).assertTrue();
      }
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   testGetMissCountBoundaryAllValues0015
     * @tc.number SUB_COLLECTIONS_LRU_BOUNDARY_1500
     * @tc.desc   GetMissCount operation with 4 boundary type values,
     *            verifies count increments on cache miss
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetMissCountBoundaryAllValues0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetMissCountBoundaryAllValues0015';
      console.info(`${caseName}, test start`);
      const boundaryValues: TestValue[] = getBoundaryValues();
      for (let i = 0; i < boundaryValues.length; i++) {
        const tv: TestValue = boundaryValues[i];
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
     * @tc.name   testGetMatchCountBoundaryAllValues0016
     * @tc.number SUB_COLLECTIONS_LRU_BOUNDARY_1600
     * @tc.desc   GetMatchCount operation with 4 boundary type values,
     *            verifies count increments on cache hit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetMatchCountBoundaryAllValues0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetMatchCountBoundaryAllValues0016';
      console.info(`${caseName}, test start`);
      const boundaryValues: TestValue[] = getBoundaryValues();
      for (let i = 0; i < boundaryValues.length; i++) {
        const tv: TestValue = boundaryValues[i];
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
     * @tc.name   testGetRemoveCountBoundaryAllValues0017
     * @tc.number SUB_COLLECTIONS_LRU_BOUNDARY_1700
     * @tc.desc   GetRemoveCount operation with 4 boundary type values,
     *            verifies count increments on LRU eviction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetRemoveCountBoundaryAllValues0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetRemoveCountBoundaryAllValues0017';
      console.info(`${caseName}, test start`);
      const boundaryValues: TestValue[] = getBoundaryValues();
      for (let i = 0; i < boundaryValues.length; i++) {
        const tv: TestValue = boundaryValues[i];
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
     * @tc.name   testGetPutCountBoundaryAllValues0018
     * @tc.number SUB_COLLECTIONS_LRU_BOUNDARY_1800
     * @tc.desc   GetPutCount operation with 4 boundary type values,
     *            verifies count increments on each put
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPutCountBoundaryAllValues0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testGetPutCountBoundaryAllValues0018';
      console.info(`${caseName}, test start`);
      const boundaryValues: TestValue[] = getBoundaryValues();
      for (let i = 0; i < boundaryValues.length; i++) {
        const tv: TestValue = boundaryValues[i];
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
     * @tc.name   testConstructorBoundaryAllValues0019
     * @tc.number SUB_COLLECTIONS_LRU_BOUNDARY_1900
     * @tc.desc   Constructor with 4 boundary type values,
     *            verifies cache created with correct capacity and stores values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConstructorBoundaryAllValues0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const caseName: string = 'testConstructorBoundaryAllValues0019';
      console.info(`${caseName}, test start`);
      const boundaryValues: TestValue[] = getBoundaryValues();
      for (let i = 0; i < boundaryValues.length; i++) {
        const tv: TestValue = boundaryValues[i];
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