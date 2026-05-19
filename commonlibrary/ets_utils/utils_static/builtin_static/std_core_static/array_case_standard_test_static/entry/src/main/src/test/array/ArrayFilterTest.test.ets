'use static'
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

import {
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level,
  Size, TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

class FilterPerson008 {
  name: string = '';
  age: int = 0;
}

export default function ArrayFilterTest(): void {
  describe('ArrayFilterTest', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0100
     * @tc.name testArrayFilter001
     * @tc.desc Verify filter keeps matching numeric elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0200
     * @tc.name testArrayFilter002
     * @tc.desc Verify filter predicate receives value index and source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.filter((value: number, index: int, array: Array<number>): boolean => {
        expect(typeof value).assertEqual('number');
        expect(array.length).assertEqual(5);
        return index >= 2;
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0300
     * @tc.name testArrayFilter003
     * @tc.desc Verify filter can keep values by index rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const result = arr.filter((v: number, i: int): boolean => i % 2 == 0);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(30);
      expect(result[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0400
     * @tc.name testArrayFilter004
     * @tc.desc Verify filter can remove falsy zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, 1, 0, 2, 0, 3);
      const result = arr.filter((v: number): boolean => v != 0);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0500
     * @tc.name testArrayFilter005
     * @tc.desc Verify empty arrays return empty filter results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.filter((v: number): boolean => v > 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0600
     * @tc.name testArrayFilter006
     * @tc.desc Verify filter does not modify the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const original = arr.toString();
      const result = arr.filter((v: number): boolean => v > 2);
      expect(arr.toString()).assertEqual(original);
      expect(result.toString()).assertEqual('3,4,5');
      expect(result === arr).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0700
     * @tc.name testArrayFilter007
     * @tc.desc Verify filter works with string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('apple', 'banana', 'cherry', 'date');
      const result = arr.filter((s: string): boolean => s.length > 5);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('banana');
      expect(result[1]).assertEqual('cherry');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0800
     * @tc.name testArrayFilter008
     * @tc.desc Verify filter works with object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1 = new FilterPerson008();
      p1.name = 'Alice';
      p1.age = 25;
      const p2 = new FilterPerson008();
      p2.name = 'Bob';
      p2.age = 17;
      const arr = new Array<FilterPerson008>(p1, p2);
      const adults = arr.filter((p: FilterPerson008): boolean => p.age >= 18);
      expect(adults.length).assertEqual(1);
      expect(adults[0].name).assertEqual('Alice');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0900
     * @tc.name testArrayFilter009
     * @tc.desc Verify filter can remove null values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, null, 3, null, 5);
      const result = arr.filter((v: number | null): boolean => v != null);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1000
     * @tc.name testArrayFilter010
     * @tc.desc Verify filter can remove undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, undefined, 3, undefined, 5);
      const result = arr.filter((v: number | undefined): boolean => v != undefined);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1100
     * @tc.name testArrayFilter011
     * @tc.desc Verify filter can be chained with map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6);
      const result = arr.filter((v: number): boolean => v % 2 == 0)
        .map((v: number): number => v * 2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(8);
      expect(result[2]).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1200
     * @tc.name testArrayFilter012
     * @tc.desc Verify filter differs from find by returning all matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const filtered = arr.filter((v: number): boolean => v > 2);
      const found = arr.find((v: number): boolean => v > 2);
      expect(filtered.length).assertEqual(3);
      expect(found).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1300
     * @tc.name testArrayFilter013
     * @tc.desc Verify filter evaluates every element without short circuiting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.filter((v: number): boolean => {
        count++;
        return v > 3;
      });
      expect(count).assertEqual(5);
      expect(result.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1400
     * @tc.name testArrayFilter014
     * @tc.desc Verify documented scenario 保持原顺序
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 保持原顺序
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1500
     * @tc.name testArrayFilter015
     * @tc.desc Verify documented scenario 保持索引关系
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 保持索引关系
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1600
     * @tc.name testArrayFilter016
     * @tc.desc Verify documented scenario 空数组filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 空数组filter
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1700
     * @tc.name testArrayFilter017
     * @tc.desc Verify documented scenario 3.2 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 3.2 单元素数组
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1800
     * @tc.name testArrayFilter018
     * @tc.desc Verify documented scenario 3.3 大数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 3.3 大数组
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1900
     * @tc.name testArrayFilter019
     * @tc.desc Verify documented scenario filter不修改原数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: filter不修改原数组
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2000
     * @tc.name testArrayFilter020
     * @tc.desc Verify documented scenario 原数组引用不变
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 原数组引用不变
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2100
     * @tc.name testArrayFilter021
     * @tc.desc Verify documented scenario predicate中修改原数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: predicate中修改原数组
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2200
     * @tc.name testArrayFilter022
     * @tc.desc Verify documented scenario 5.1 number类型
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 5.1 number类型
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2300
     * @tc.name testArrayFilter023
     * @tc.desc Verify documented scenario 5.2 string类型
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 5.2 string类型
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2400
     * @tc.name testArrayFilter024
     * @tc.desc Verify documented scenario 5.3 boolean类型
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 5.3 boolean类型
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2500
     * @tc.name testArrayFilter025
     * @tc.desc Verify documented scenario 5.4 char类型
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 5.4 char类型
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2600
     * @tc.name testArrayFilter026
     * @tc.desc Verify documented scenario 5.5 对象类型
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 5.5 对象类型
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2700
     * @tc.name testArrayFilter027
     * @tc.desc Verify documented scenario 5.6 联合类型
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 5.6 联合类型
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2800
     * @tc.name testArrayFilter028
     * @tc.desc Verify documented scenario 6.1 null值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 6.1 null值
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2900
     * @tc.name testArrayFilter029
     * @tc.desc Verify documented scenario 6.2 undefined值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 6.2 undefined值
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3000
     * @tc.name testArrayFilter030
     * @tc.desc Verify documented scenario 6.3 NaN值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 6.3 NaN值
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3100
     * @tc.name testArrayFilter031
     * @tc.desc Verify documented scenario 6.4 0值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 6.4 0值
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3200
     * @tc.name testArrayFilter032
     * @tc.desc Verify documented scenario 6.5 空字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 6.5 空字符串
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3300
     * @tc.name testArrayFilter033
     * @tc.desc Verify documented scenario 7.1 使用索引过滤
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 7.1 使用索引过滤
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3400
     * @tc.name testArrayFilter034
     * @tc.desc Verify documented scenario 7.2 使用索引范围
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 7.2 使用索引范围
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3500
     * @tc.name testArrayFilter035
     * @tc.desc Verify documented scenario 7.3 使用数组长度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 7.3 使用数组长度
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3600
     * @tc.name testArrayFilter036
     * @tc.desc Verify documented scenario 8.1 filter与map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 8.1 filter与map
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3700
     * @tc.name testArrayFilter037
     * @tc.desc Verify documented scenario 8.2 map后filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 8.2 map后filter
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3800
     * @tc.name testArrayFilter038
     * @tc.desc Verify documented scenario 8.3 多个filter链式调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 8.3 多个filter链式调用
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3900
     * @tc.name testArrayFilter039
     * @tc.desc Verify documented scenario 9.1 filter vs find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 9.1 filter vs find
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4000
     * @tc.name testArrayFilter040
     * @tc.desc Verify documented scenario 9.2 filter vs some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 9.2 filter vs some
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4100
     * @tc.name testArrayFilter041
     * @tc.desc Verify documented scenario 9.3 filter vs every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 9.3 filter vs every
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4200
     * @tc.name testArrayFilter042
     * @tc.desc Verify documented scenario 10.1 时间复杂度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 10.1 时间复杂度
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4300
     * @tc.name testArrayFilter043
     * @tc.desc Verify documented scenario 10.2 短路优化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 10.2 短路优化
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4400
     * @tc.name testArrayFilter044
     * @tc.desc Verify documented scenario 11.1 数据过滤
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 11.1 数据过滤
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4500
     * @tc.name testArrayFilter045
     * @tc.desc Verify documented scenario 11.2 搜索结果
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 11.2 搜索结果
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4600
     * @tc.name testArrayFilter046
     * @tc.desc Verify documented scenario 11.3 去除无效值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 11.3 去除无效值
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4700
     * @tc.name testArrayFilter047
     * @tc.desc Verify documented scenario 12.1 简洁箭头函数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 12.1 简洁箭头函数
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4800
     * @tc.name testArrayFilter048
     * @tc.desc Verify documented scenario 12.2 块状箭头函数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 12.2 块状箭头函数
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4900
     * @tc.name testArrayFilter049
     * @tc.desc Verify documented scenario 12.3 传统函数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 12.3 传统函数
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_5000
     * @tc.name testArrayFilter050
     * @tc.desc Verify documented scenario 13.1 类型守卫
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 13.1 类型守卫
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_5100
     * @tc.name testArrayFilter051
     * @tc.desc Verify documented scenario 13.2 谓词类型
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 13.2 谓词类型
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_5200
     * @tc.name testArrayFilter052
     * @tc.desc Verify documented scenario 14.1 number边界值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 14.1 number边界值
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_5300
     * @tc.name testArrayFilter053
     * @tc.desc Verify documented scenario 14.2 string边界值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 14.2 string边界值
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_5400
     * @tc.name testArrayFilter054
     * @tc.desc Verify documented scenario 15.1 ReadonlyArray的filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 15.1 ReadonlyArray的filter
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_5500
     * @tc.name testArrayFilter055
     * @tc.desc Verify documented scenario 16.1 稀疏数组filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 16.1 稀疏数组filter
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_5600
     * @tc.name testArrayFilter056
     * @tc.desc Verify documented scenario 17.1 predicate中的console
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 17.1 predicate中的console
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_5700
     * @tc.name testArrayFilter057
     * @tc.desc Verify documented scenario 17.2 predicate中的计数器
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 17.2 predicate中的计数器
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_5800
     * @tc.name testArrayFilter058
     * @tc.desc Verify documented scenario 18.1 多条件组合
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 18.1 多条件组合
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_5900
     * @tc.name testArrayFilter059
     * @tc.desc Verify documented scenario 18.2 三元运算符
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 18.2 三元运算符
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_6000
     * @tc.name testArrayFilter060
     * @tc.desc Verify documented scenario 19.1 filter vs for循环
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 19.1 filter vs for循环
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_6100
     * @tc.name testArrayFilter061
     * @tc.desc Verify documented scenario 20.1 提前终止不可行
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 20.1 提前终止不可行
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_6200
     * @tc.name testArrayFilter062
     * @tc.desc Verify documented scenario 20.2 大数据集处理
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 20.2 大数据集处理
      const result = new Array<number>(1, 2, 3, 4).filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
    });

  });
}
