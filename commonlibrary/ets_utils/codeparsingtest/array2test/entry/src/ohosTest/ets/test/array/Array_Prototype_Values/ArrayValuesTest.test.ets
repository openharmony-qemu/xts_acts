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

import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from '../../Util.test';
import {
  ArrayValuesJs_1_1_1,
  ArrayValuesJs_1_1_2,
  ArrayValuesJs_2_3_3,
  ArrayValuesJs_5_1_1,
  ArrayValuesJs_5_1_2,
  ArrayValuesJs_5_1_3,
  ArrayValuesJs_5_2_2,
  ArrayValuesJs_5_2_3,
  ArrayValuesJs_6_1_4,
  ArrayValuesJs_6_2_3,
  ArrayValuesJs_6_3_1,
  ArrayValuesJs_6_4_4,
  ArrayValuesJs_7_1_1,
  ArrayValuesJs_7_1_2,
  ArrayValuesJs_7_2_1,
  ArrayValuesJs_7_2_2,
  ArrayValuesJs_7_3_1,
  ArrayValuesJs_7_3_2,
  ArrayValuesJs_7_3_3,
  ArrayValuesJs_8_3_2,
  ArrayValuesJs_9_3_1,
  ArrayValuesJs_9_3_3,
  ArrayValuesJs_10_1_1,
  ArrayValuesJs_10_1_2,
  ArrayValuesJs_10_1_3,
  ArrayValuesJs_10_2_1,
  ArrayValuesJs_10_3_1,
  ArrayValuesJs_10_3_2,
  ArrayValuesJs_10_4_1,
  ArrayValuesJs_10_4_2,
  ArrayValuesJs_10_4_3,
  ArrayValuesJs_10_4_4,
  ArrayValuesJs_10_4_5,
  ArrayValuesJs_10_4_6,
  ArrayValuesJs_10_4_7,
  ArrayValuesJs_12_3_3,
  ArrayValuesJs_12_3_4,
  ArrayValuesJs_12_3_5
} from './array_values_test';

export default function ArrayValuesTest() {
  describe('ArrayValuesTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    // ==================== 第 1 节：基本功能验证 ====================

    /**
     * @tc.name testArrayValuesTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_0100
     * @tc.desc 1.1.1 验证 values() 返回的是迭代器对象（typeof 检查）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_1_1_1()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_0200
     * @tc.desc 1.1.2 验证 values() 返回对象的 Symbol.toStringTag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_1_1_2()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_0300
     * @tc.desc 1.1.3 验证每次调用 values() 返回新的迭代器对象
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const iter1: IterableIterator<number> = arr.values();
      const iter2: IterableIterator<number> = arr.values();
      expect(iter1 !== iter2).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_0400
     * @tc.desc 1.2.1 验证基本数组的迭代输出顺序和值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const result: string[] = [];
      for (const v of arr.values()) {
        result.push(v);
      }
      expect(result).assertDeepEquals(['a', 'b', 'c']);
    })

    /**
     * @tc.name testArrayValuesTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_0500
     * @tc.desc 1.2.2 验证迭代输出的是值而非索引
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 20, 30];
      const iter: IterableIterator<number> = arr.values();
      expect(iter.next().value).assertEqual(10);
      expect(iter.next().value).assertEqual(20);
      expect(iter.next().value).assertEqual(30);
    })

    /**
     * @tc.name testArrayValuesTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_0600
     * @tc.desc 1.3.1 验证 values() 不接受参数，调用 next() 正常返回
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const iter: IterableIterator<number> = arr.values();
      const r1: IteratorResult<number> = iter.next();
      expect(r1.value).assertEqual(1);
      expect(r1.done).assertEqual(false);
    })

    // ==================== 第 2 节：迭代器协议 ====================

    /**
     * @tc.name testArrayValuesTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_0700
     * @tc.desc 2.1.2 验证逐次调用 next() 依次返回每个元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const iter: IterableIterator<string> = arr.values();
      expect(iter.next().value).assertEqual('a');
      expect(iter.next().value).assertEqual('b');
      expect(iter.next().value).assertEqual('c');
      expect(iter.next().done).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_0800
     * @tc.desc 2.2.1 验证迭代未完成时 done 为 false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1];
      const iter: IterableIterator<number> = arr.values();
      const r: IteratorResult<number> = iter.next();
      expect(r.done).assertEqual(false);
      expect(r.value).assertEqual(1);
    })

    /**
     * @tc.name testArrayValuesTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_0900
     * @tc.desc 2.2.2 验证迭代完成后 done 为 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1];
      const iter: IterableIterator<number> = arr.values();
      iter.next();
      const r: IteratorResult<number> = iter.next();
      expect(r.done).assertEqual(true);
      expect(r.value).assertUndefined();
    })

    /**
     * @tc.name testArrayValuesTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_1000
     * @tc.desc 2.2.3 验证空数组第一次调用 next() 即返回 done 为 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      const iter: IterableIterator<number> = arr.values();
      const r: IteratorResult<number> = iter.next();
      expect(r.done).assertEqual(true);
      expect(r.value).assertUndefined();
    })

    /**
     * @tc.name testArrayValuesTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_1100
     * @tc.desc 2.2.4 验证迭代完成后继续调用 next() 始终返回 done 为 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1];
      const iter: IterableIterator<number> = arr.values();
      iter.next();
      iter.next();
      const r: IteratorResult<number> = iter.next();
      expect(r.done).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_1200
     * @tc.desc 2.3.1 验证迭代器返回的 value 与数组元素值一致
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [42, 100, 0];
      const iter: IterableIterator<number> = arr.values();
      expect(iter.next().value).assertEqual(42);
      expect(iter.next().value).assertEqual(100);
      expect(iter.next().value).assertEqual(0);
    })

    /**
     * @tc.name testArrayValuesTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_1300
     * @tc.desc 2.3.2 验证迭代完成后 value 为 undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1];
      const iter: IterableIterator<number> = arr.values();
      iter.next();
      expect(iter.next().value).assertUndefined();
    })

    /**
     * @tc.name testArrayValuesTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_1400
     * @tc.desc 2.3.3 验证迭代器对象具有 Symbol.iterator 且返回自身（JS 实现）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_2_3_3()).assertEqual(true);
    })

    // ==================== 第 3 节：for...of 迭代 ====================

    /**
     * @tc.name testArrayValuesTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_1500
     * @tc.desc 3.1.1 验证 for...of 正确遍历所有元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 20, 30];
      const result: number[] = [];
      for (const v of arr.values()) {
        result.push(v);
      }
      expect(result).assertDeepEquals([10, 20, 30]);
    })

    /**
     * @tc.name testArrayValuesTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_1600
     * @tc.desc 3.1.2 验证 for...of 遍历不改变原数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      for (const v of arr.values()) {
        void v;
      }
      expect(arr).assertDeepEquals([1, 2, 3]);
    })

    /**
     * @tc.name testArrayValuesTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_1700
     * @tc.desc 3.2.1 验证 break 终止后迭代器保留当前位置
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c', 'd', 'e'];
      const iter: IterableIterator<string> = arr.values();
      const first: string[] = [];
      for (const v of iter) {
        first.push(v);
        if (v === 'b') {
          break;
        }
      }
      const second: string[] = [];
      for (const v of iter) {
        second.push(v);
      }
      expect(first).assertDeepEquals(['a', 'b']);
      expect(second).assertDeepEquals(['c', 'd', 'e']);
    })

    /**
     * @tc.name testArrayValuesTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_1800
     * @tc.desc 3.2.2 验证 break 在第一个元素处终止后迭代器可继续
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const iter: IterableIterator<number> = arr.values();
      for (const v of iter) {
        void v;
        break;
      }
      const result: number[] = [];
      for (const v of iter) {
        result.push(v);
      }
      expect(result).assertDeepEquals([2, 3]);
    })

    /**
     * @tc.name testArrayValuesTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_1900
     * @tc.desc 3.3.1 验证 continue 跳过当前元素但迭代继续
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = [];
      for (const v of arr.values()) {
        if (v % 2 === 0) {
          continue;
        }
        result.push(v);
      }
      expect(result).assertDeepEquals([1, 3, 5]);
    })

    /**
     * @tc.name testArrayValuesTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_2000
     * @tc.desc 3.3.2 验证 throw 异常中断迭代后迭代器状态可继续
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const iter: IterableIterator<number> = arr.values();
      const collected: number[] = [];
      try {
        for (const v of iter) {
          collected.push(v);
          if (v === 2) {
            throw new Error('test');
          }
        }
      } catch (e) {
        // 捕获异常，迭代器保持状态
      }
      const remaining: number[] = [];
      for (const v of iter) {
        remaining.push(v);
      }
      expect(collected).assertDeepEquals([1, 2]);
      expect(remaining).assertDeepEquals([3]);
    })

    // ==================== 第 4 节：迭代器一次性使用 ====================

    /**
     * @tc.name testArrayValuesTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_2100
     * @tc.desc 4.1.1 验证迭代器耗尽后 for...of 不再产出任何值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const iter: IterableIterator<number> = arr.values();
      for (const v of iter) {
        void v;
      }
      const result: number[] = [];
      for (const v of iter) {
        result.push(v);
      }
      expect(result.length).assertEqual(0);
    })

    /**
     * @tc.name testArrayValuesTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_2200
     * @tc.desc 4.1.2 验证迭代器耗尽后用 next() 调用也返回 done 为 true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1];
      const iter: IterableIterator<number> = arr.values();
      iter.next();
      iter.next();
      expect(iter.next().done).assertEqual(true);
      expect(iter.next().done).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_2300
     * @tc.desc 4.2.1 验证耗尽后 next() 始终返回 {value: undefined, done: true}
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['x'];
      const iter: IterableIterator<string> = arr.values();
      iter.next();
      iter.next();
      const r1: IteratorResult<string> = iter.next();
      const r2: IteratorResult<string> = iter.next();
      expect(r1.value).assertUndefined();
      expect(r1.done).assertEqual(true);
      expect(r2.value).assertUndefined();
      expect(r2.done).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_2400
     * @tc.desc 4.3.1 验证同一迭代器只能有效遍历一次
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const iter: IterableIterator<string> = arr.values();
      const first: string[] = [];
      for (const v of iter) {
        first.push(v);
      }
      const second: string[] = [];
      for (const v of iter) {
        second.push(v);
      }
      expect(first).assertDeepEquals(['a', 'b', 'c']);
      expect(second.length).assertEqual(0);
    })

    /**
     * @tc.name testArrayValuesTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_2500
     * @tc.desc 4.3.2 验证部分消耗后的迭代器可继续遍历剩余元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const iter: IterableIterator<number> = arr.values();
      iter.next();
      iter.next();
      const result: number[] = [];
      for (const v of iter) {
        result.push(v);
      }
      expect(result).assertDeepEquals([3, 4, 5]);
    })

    // ==================== 第 5 节：与 Symbol.iterator 关系 ====================

    /**
     * @tc.name testArrayValuesTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_2600
     * @tc.desc 5.1.1 验证 Array.prototype.values === Array.prototype[Symbol.iterator]（JS 实现）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_5_1_1()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_2700
     * @tc.desc 5.1.2 验证 values() 和 Symbol.iterator() 返回相同类型的迭代器（JS 实现）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_5_1_2()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_2800
     * @tc.desc 5.1.3 验证两个迭代器独立遍历产生相同结果（JS 实现）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_5_1_3()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_2900
     * @tc.desc 5.2.1 验证 for...of 直接遍历数组等价于 arr.values()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const fromDirect: number[] = [];
      for (const v of arr) {
        fromDirect.push(v);
      }
      const fromValues: number[] = [];
      for (const v of arr.values()) {
        fromValues.push(v);
      }
      expect(fromDirect).assertDeepEquals(fromValues);
    })

    /**
     * @tc.name testArrayValuesTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_3000
     * @tc.desc 5.2.2 验证修改 Symbol.iterator 后已获取的 values 迭代器不受影响（JS 实现）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_5_2_2()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_3100
     * @tc.desc 5.2.3 验证修改数组的 Symbol.iterator 后 for...of 行为改变（JS 实现）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_5_2_3()).assertEqual(true);
    })

    // ==================== 第 6 节：数组元素类型 ====================

    /**
     * @tc.name testArrayValuesTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_3200
     * @tc.desc 6.1.1 验证数字类型数组迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2.5, -3, 0];
      const result: number[] = [];
      for (const v of arr.values()) {
        result.push(v);
      }
      expect(result).assertDeepEquals([1, 2.5, -3, 0]);
    })

    /**
     * @tc.name testArrayValuesTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_3300
     * @tc.desc 6.1.2 验证字符串类型数组迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['hello', 'world', ''];
      const result: string[] = [];
      for (const v of arr.values()) {
        result.push(v);
      }
      expect(result).assertDeepEquals(['hello', 'world', '']);
    })

    /**
     * @tc.name testArrayValuesTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_3400
     * @tc.desc 6.1.3 验证布尔类型数组迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: boolean[] = [true, false];
      const result: boolean[] = [];
      for (const v of arr.values()) {
        result.push(v);
      }
      expect(result).assertDeepEquals([true, false]);
    })

    /**
     * @tc.name testArrayValuesTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_3500
     * @tc.desc 6.1.4 验证 BigInt 类型数组迭代（JS 实现）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_6_1_4()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_3600
     * @tc.desc 6.2.1 验证对象元素迭代返回引用
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface Obj { key: string }
      const obj: Obj = { key: 'value' };
      const arr: Obj[] = [obj];
      const iter: IterableIterator<Obj> = arr.values();
      const r: IteratorResult<Obj> = iter.next();
      expect(r.value === obj).assertEqual(true);
      expect(r.value.key).assertEqual('value');
    })

    /**
     * @tc.name testArrayValuesTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_3700
     * @tc.desc 6.2.2 验证数组作为元素嵌套迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      const result: number[][] = [];
      for (const v of arr.values()) {
        result.push(v);
      }
      expect(result).assertDeepEquals([[1, 2], [3, 4]]);
      expect(result[0] !== result[1]).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_3800
     * @tc.desc 6.2.3 验证函数作为元素迭代（JS 实现）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_6_2_3()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_3900
     * @tc.desc 6.3.1 验证不同类型混合数组迭代（JS 实现）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_6_3_1()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_4000
     * @tc.desc 6.4.1 验证 undefined 作为元素迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [undefined, undefined];
      const result: (number | undefined)[] = [];
      for (const v of arr.values()) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertUndefined();
      expect(result[1]).assertUndefined();
    })

    /**
     * @tc.name testArrayValuesTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_4100
     * @tc.desc 6.4.2 验证 null 作为元素迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (string | null)[] = [null, null];
      const result: (string | null)[] = [];
      for (const v of arr.values()) {
        result.push(v);
      }
      expect(result.length).assertEqual(2);
      expect(result[0]).assertNull();
      expect(result[1]).assertNull();
    })

    /**
     * @tc.name testArrayValuesTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_4200
     * @tc.desc 6.4.3 验证 NaN 作为元素迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [NaN];
      const iter: IterableIterator<number> = arr.values();
      const r: IteratorResult<number> = iter.next();
      expect(Number.isNaN(r.value)).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_4300
     * @tc.desc 6.4.4 验证 Symbol 作为元素迭代（JS 实现）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_6_4_4()).assertEqual(true);
    })

    // ==================== 第 7 节：稀疏数组（JS 实现）====================

    /**
     * @tc.name testArrayValuesTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_4400
     * @tc.desc 7.1.1 验证稀疏数组空槽作为 undefined 迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_7_1_1()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_4500
     * @tc.desc 7.1.2 验证中间有空槽的数组迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_7_1_2()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_4600
     * @tc.desc 7.2.1 验证全空槽数组迭代输出全为 undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_7_2_1()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_4700
     * @tc.desc 7.2.2 验证通过 Array 构造函数创建的空数组迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_7_2_2()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_4800
     * @tc.desc 7.3.1 验证数组开头有空槽的迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_7_3_1()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_4900
     * @tc.desc 7.3.2 验证数组末尾有空槽的迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_7_3_2()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_5000
     * @tc.desc 7.3.3 验证空槽与显式 undefined 元素的迭代行为一致
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_7_3_3()).assertEqual(true);
    })

    // ==================== 第 8 节：边界值与空数组 ====================

    /**
     * @tc.name testArrayValuesTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_5100
     * @tc.desc 8.1.1 验证空数组 values() 返回的迭代器立即 done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      const iter: IterableIterator<number> = arr.values();
      const r: IteratorResult<number> = iter.next();
      expect(r.done).assertEqual(true);
      expect(r.value).assertUndefined();
    })

    /**
     * @tc.name testArrayValuesTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_5200
     * @tc.desc 8.1.2 验证 for...of 遍历空数组不执行循环体
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      let count: number = 0;
      for (const v of arr.values()) {
        void v;
        count++;
      }
      expect(count).assertEqual(0);
    })

    /**
     * @tc.name testArrayValuesTest0152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_5300
     * @tc.desc 8.2.1 验证单元素数组正确迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [42];
      const iter: IterableIterator<number> = arr.values();
      const r1: IteratorResult<number> = iter.next();
      expect(r1.value).assertEqual(42);
      expect(r1.done).assertEqual(false);
      const r2: IteratorResult<number> = iter.next();
      expect(r2.value).assertUndefined();
      expect(r2.done).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_5400
     * @tc.desc 8.2.2 验证单元素为 undefined 的数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (number | undefined)[] = [undefined];
      const iter: IterableIterator<number | undefined> = arr.values();
      const r: IteratorResult<number | undefined> = iter.next();
      expect(r.value).assertUndefined();
      expect(r.done).assertEqual(false);
      expect(iter.next().done).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_5500
     * @tc.desc 8.3.1 验证大数组迭代完整性
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const size: number = 1000;
      const arr: number[] = Array.from({ length: size }, (_: Object, i: number): number => i);
      let count: number = 0;
      for (const v of arr.values()) {
        expect(v).assertEqual(count);
        count++;
      }
      expect(count).assertEqual(size);
    })

    /**
     * @tc.name testArrayValuesTest0155
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_5600
     * @tc.desc 8.3.2 验证含大量空槽的大数组迭代（JS 实现）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_8_3_2()).assertEqual(true);
    })

    // ==================== 第 9 节：迭代期间修改数组 ====================

    /**
     * @tc.name testArrayValuesTest0156
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_5700
     * @tc.desc 9.1.1 验证迭代过程中修改未访问元素的值会影响迭代结果
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const iter: IterableIterator<string> = arr.values();
      expect(iter.next().value).assertEqual('a');
      arr[1] = 'B';
      expect(iter.next().value).assertEqual('B');
      expect(iter.next().value).assertEqual('c');
    })

    /**
     * @tc.name testArrayValuesTest0157
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_5800
     * @tc.desc 9.1.2 验证迭代过程中修改已访问元素的值不影响后续迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const iter: IterableIterator<number> = arr.values();
      expect(iter.next().value).assertEqual(1);
      arr[0] = 100;
      expect(iter.next().value).assertEqual(2);
      expect(iter.next().value).assertEqual(3);
    })

    /**
     * @tc.name testArrayValuesTest0158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_5900
     * @tc.desc 9.1.3 验证迭代过程中修改当前正在被访问的元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const iter: IterableIterator<string> = arr.values();
      iter.next();
      arr[1] = 'modified';
      const r: IteratorResult<string> = iter.next();
      expect(r.value).assertEqual('modified');
    })

    /**
     * @tc.name testArrayValuesTest0159
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_6000
     * @tc.desc 9.2.1 验证迭代期间通过 push 添加元素会被迭代到
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const result: number[] = [];
      let pushDone: boolean = false;
      for (const v of arr.values()) {
        result.push(v);
        if (!pushDone) {
          arr.push(4);
          pushDone = true;
        }
      }
      expect(result.includes(4)).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0160
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_6100
     * @tc.desc 9.2.2 验证迭代期间通过索引添加元素
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b'];
      const result: string[] = [];
      for (const v of arr.values()) {
        result.push(v);
        if (v === 'a') {
          arr[2] = 'c';
        }
      }
      expect(result).assertDeepEquals(['a', 'b', 'c']);
    })

    /**
     * @tc.name testArrayValuesTest0161
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_6200
     * @tc.desc 9.3.1 验证迭代期间用 delete 删除元素，空槽变为 undefined（JS 实现）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_9_3_1()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0162
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_6300
     * @tc.desc 9.3.2 验证迭代期间用 pop 删除末尾元素影响迭代
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const iter: IterableIterator<string> = arr.values();
      iter.next();
      arr.pop();
      const r: IteratorResult<string> = iter.next();
      expect(r.value).assertEqual('b');
      const r2: IteratorResult<string> = iter.next();
      expect(r2.done).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0163
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_6400
     * @tc.desc 9.3.3 验证迭代期间用 shift 删除头部元素的影响（JS 实现）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_9_3_3()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0164
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_6500
     * @tc.desc 9.4.1 验证迭代期间缩短 length 导致迭代提前结束
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const result: string[] = [];
      for (const v of arr.values()) {
        result.push(v);
        if (v === 'b') {
          arr.length = 2;
        }
      }
      expect(result).assertDeepEquals(['a', 'b']);
    })

    /**
     * @tc.name testArrayValuesTest0165
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_6600
     * @tc.desc 9.4.2 验证迭代期间增大 length 后迭代器按当前 length 继续产出新增空洞为 undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const result: (number | undefined)[] = [];
      for (const v of arr.values()) {
        result.push(v);
        if (v === 1) {
          arr.length = 10;
        }
      }
      expect(result.length).assertEqual(10);
      expect(result).assertDeepEquals([1, 2, 3, undefined, undefined, undefined, undefined, undefined, undefined, undefined]);
    })

    /**
     * @tc.name testArrayValuesTest0166
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_6700
     * @tc.desc 9.4.3 验证迭代期间将 length 设为 0 导致迭代立即结束
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const result: string[] = [];
      for (const v of arr.values()) {
        result.push(v);
        if (v === 'a') {
          arr.length = 0;
        }
      }
      expect(result).assertDeepEquals(['a']);
    })

    // ==================== 第 10 节：泛型调用（JS 实现）====================

    /**
     * @tc.name testArrayValuesTest0167
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_6800
     * @tc.desc 10.1.1 验证对类数组对象调用 values()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_10_1_1()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0168
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_6900
     * @tc.desc 10.1.2 验证类数组对象中超出 length 的属性被忽略
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_10_1_2()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0169
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_7000
     * @tc.desc 10.1.3 验证 arguments 对象调用 values()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_10_1_3()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0170
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_7100
     * @tc.desc 10.2.1 验证对字符串调用 Array.prototype.values.call
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_10_2_1()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0171
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_7200
     * @tc.desc 10.3.1 验证仅有 length 属性的对象迭代输出全为 undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_10_3_1()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0172
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_7300
     * @tc.desc 10.3.2 验证 length 为 0 的对象迭代立即结束
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_10_3_2()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0173
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_7400
     * @tc.desc 10.4.1 验证对 null 调用 values() 抛出 TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_10_4_1()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0174
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_7500
     * @tc.desc 10.4.2 验证对 undefined 调用 values() 抛出 TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_10_4_2()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0175
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_7600
     * @tc.desc 10.4.3 验证对数字调用 values() 立即 done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_10_4_3()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0176
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_7700
     * @tc.desc 10.4.4 验证对布尔值调用 values() 立即 done
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_10_4_4()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0177
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_7800
     * @tc.desc 10.4.5 验证负数 length 的对象迭代立即结束
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_10_4_5()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0178
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_7900
     * @tc.desc 10.4.6 验证 NaN 作为 length 的对象迭代立即结束
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_10_4_6()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0179
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_8000
     * @tc.desc 10.4.7 验证 length 为非整数时向下取整
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_10_4_7()).assertEqual(true);
    })

    // ==================== 第 11 节：与其他迭代方法对比 ====================

    /**
     * @tc.name testArrayValuesTest0180
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_8100
     * @tc.desc 11.1.1 验证 values() 返回值，entries() 返回键值对
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b'];
      const vIter: IterableIterator<string> = arr.values();
      const eIter: IterableIterator<[number, string]> = arr.entries();
      expect(vIter.next().value).assertEqual('a');
      const eFirst: IteratorResult<[number, string]> = eIter.next();
      expect(eFirst.value[0]).assertEqual(0);
      expect(eFirst.value[1]).assertEqual('a');
    })

    /**
     * @tc.name testArrayValuesTest0181
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_8200
     * @tc.desc 11.1.2 验证 values 和 entries 迭代器互不影响
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const vIter: IterableIterator<number> = arr.values();
      const eIter: IterableIterator<[number, number]> = arr.entries();
      vIter.next();
      vIter.next();
      const eFirst: IteratorResult<[number, number]> = eIter.next();
      expect(eFirst.value[0]).assertEqual(0);
      expect(eFirst.value[1]).assertEqual(1);
    })

    /**
     * @tc.name testArrayValuesTest0182
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_8300
     * @tc.desc 11.2.1 验证 values() 返回值，keys() 返回索引
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const vIter: IterableIterator<string> = arr.values();
      const kIter: IterableIterator<number> = arr.keys();
      expect(vIter.next().value).assertEqual('a');
      expect(kIter.next().value).assertEqual(0);
    })

    /**
     * @tc.name testArrayValuesTest0183
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_8400
     * @tc.desc 11.2.2 验证 values、keys、entries 三者遍历相同的元素数量
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10, 20, 30];
      let vCount: number = 0;
      let kCount: number = 0;
      let eCount: number = 0;
      for (const v of arr.values()) { void v; vCount++; }
      for (const k of arr.keys()) { void k; kCount++; }
      for (const e of arr.entries()) { void e; eCount++; }
      expect(vCount).assertEqual(3);
      expect(kCount).assertEqual(3);
      expect(eCount).assertEqual(3);
    })

    /**
     * @tc.name testArrayValuesTest0184
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_8500
     * @tc.desc 11.3.1 验证同一数组创建多个 values 迭代器独立工作
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const iter1: IterableIterator<number> = arr.values();
      const iter2: IterableIterator<number> = arr.values();
      expect(iter1.next().value).assertEqual(1);
      expect(iter2.next().value).assertEqual(1);
      expect(iter1.next().value).assertEqual(2);
      expect(iter2.next().value).assertEqual(2);
    })

    /**
     * @tc.name testArrayValuesTest0185
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_8600
     * @tc.desc 11.3.2 验证 values 迭代器与 for...of 直接遍历数组互不影响
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const iter: IterableIterator<number> = arr.values();
      iter.next();
      const directResult: number[] = [];
      for (const v of arr) {
        directResult.push(v);
      }
      expect(directResult).assertDeepEquals([1, 2, 3]);
      expect(iter.next().value).assertEqual(2);
    })

    /**
     * @tc.name testArrayValuesTest0186
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_8700
     * @tc.desc 11.3.3 验证 values、keys、entries 同时使用
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['x', 'y'];
      const vIter: IterableIterator<string> = arr.values();
      const kIter: IterableIterator<number> = arr.keys();
      const eIter: IterableIterator<[number, string]> = arr.entries();
      expect(vIter.next().value).assertEqual('x');
      expect(kIter.next().value).assertEqual(0);
      const e1: IteratorResult<[number, string]> = eIter.next();
      expect(e1.value[0]).assertEqual(0);
      expect(e1.value[1]).assertEqual('x');
      expect(vIter.next().value).assertEqual('y');
      expect(kIter.next().value).assertEqual(1);
      const e2: IteratorResult<[number, string]> = eIter.next();
      expect(e2.value[0]).assertEqual(1);
      expect(e2.value[1]).assertEqual('y');
    })

    // ==================== 第 12 节：解构与展开操作 ====================

    /**
     * @tc.name testArrayValuesTest0187
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_8800
     * @tc.desc 12.1.1 验证展开运算符配合 values() 使用
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      // ArkTS 禁止对迭代器使用展开运算符，使用 Array.from 等价收集 values() 产出
      const spread: number[] = Array.from(arr.values());
      expect(spread).assertDeepEquals([1, 2, 3]);
      expect(spread !== arr).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0188
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_8900
     * @tc.desc 12.1.2 验证部分消耗后的迭代器使用展开运算符
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const iter: IterableIterator<number> = arr.values();
      iter.next();
      iter.next();
      const rest: number[] = Array.from(iter);
      expect(rest).assertDeepEquals([3, 4, 5]);
    })

    /**
     * @tc.name testArrayValuesTest0189
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_9000
     * @tc.desc 12.1.3 验证展开运算符结合 values() 合并数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: number[] = [1, 2];
      const arr2: number[] = [3, 4];
      const merged: number[] = Array.from(arr1.values()).concat(Array.from(arr2.values()));
      expect(merged).assertDeepEquals([1, 2, 3, 4]);
    })

    /**
     * @tc.name testArrayValuesTest0190
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_9100
     * @tc.desc 12.3.1 验证 Array.from 转换 values() 迭代器为数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const newArr: number[] = Array.from(arr.values());
      expect(newArr).assertDeepEquals([1, 2, 3]);
      expect(newArr !== arr).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0191
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_9200
     * @tc.desc 12.3.2 验证 Array.from 配合映射函数
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const doubled: number[] = Array.from(arr.values(), (x: number): number => x * 2);
      expect(doubled).assertDeepEquals([2, 4, 6]);
    })

    /**
     * @tc.name testArrayValuesTest0192
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_9300
     * @tc.desc 12.3.3 验证使用 Set 构造函数从 values() 创建集合（JS 实现）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_12_3_3()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0193
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_9400
     * @tc.desc 12.3.4 验证展开 values() 迭代器与直接展开数组结果一致
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_12_3_4()).assertEqual(true);
    })

    /**
     * @tc.name testArrayValuesTest0194
     * @tc.number SUB_COMMONLIBRARY_ARRAY_VALUES_TEST_9500
     * @tc.desc 12.3.5 验证 Object.fromEntries 与 values() 的结合使用（JS 实现）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayValuesTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayValuesJs_12_3_5()).assertEqual(true);
    })

  })
}
