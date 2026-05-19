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

class FlatNoArgItem005 {
  value: int = 0;
}

function createDefaultNestedObjects(): Array<Object> {
  return new Array<Object>(
    1 as Object,
    new Array<Object>(
      2 as Object,
      new Array<Object>(3 as Object) as Object
    ) as Object
  );
}

export default function ArrayFlat3Test(): void {
  describe('ArrayFlat3Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0100
     * @tc.name testArrayFlat3001
     * @tc.desc Verify flat without arguments uses a single default depth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = createDefaultNestedObjects();
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
      expect(result[0] as int).assertEqual(1);
      expect(result[1] as int).assertEqual(2);
      expect(Array.isArray(result[2])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0200
     * @tc.name testArrayFlat3002
     * @tc.desc Verify flat without arguments matches flat with depth one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = createDefaultNestedObjects();
      const result1: Array<Object> = nested.flat<Object>();
      const result2: Array<Object> = nested.flat<Object>(1);
      expect(result1.length).assertEqual(result2.length);
      expect(result1.toString()).assertEqual(result2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0300
     * @tc.name testArrayFlat3003
     * @tc.desc Verify flat removes one level from a shallow nested array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const last = new Array<int>();
      last.push(5);
      const nested = new Array<Array<int>>(
        new Array<int>(1, 2),
        new Array<int>(3, 4),
        last
      );
      const result: Array<int> = nested.flat<int>();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0400
     * @tc.name testArrayFlat3004
     * @tc.desc Verify flat works with empty arrays and empty nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number>>();
      const result1: Array<number> = arr.flat<number>();
      expect(result1.length).assertEqual(0);

      const nested = new Array<Array<number>>(
        new Array<number>(),
        new Array<number>(1, 2),
        new Array<number>(),
        new Array<number>(3, 4)
      );
      const result2: Array<number> = nested.flat<number>();
      expect(result2.length).assertEqual(4);
      expect(result2[0]).assertEqual(1);
      expect(result2[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0500
     * @tc.name testArrayFlat3005
     * @tc.desc Verify flat returns a new array for non-nested input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result: Array<number> = arr.flat<number>();
      expect(result.length).assertEqual(4);
      expect(result === arr).assertFalse();
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0600
     * @tc.name testArrayFlat3006
     * @tc.desc Verify flat works with boolean and char values nested one level deep
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new Array<Object>(
        true as Object,
        new Array<Object>(false as Object, true as Object) as Object,
        c'A' as Object
      );
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(4);
      expect(result[0] as boolean).assertTrue();
      expect(result[1] as boolean).assertFalse();
      expect(result[2] as boolean).assertTrue();
      expect(result[3] as char).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0700
     * @tc.name testArrayFlat3007
     * @tc.desc Verify flat preserves object elements while flattening one level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item1 = new FlatNoArgItem005();
      item1.value = 1;
      const item2 = new FlatNoArgItem005();
      item2.value = 2;
      const nested = new Array<Array<FlatNoArgItem005>>(
        new Array<FlatNoArgItem005>(item1),
        new Array<FlatNoArgItem005>(item2)
      );
      const result: Array<FlatNoArgItem005> = nested.flat<FlatNoArgItem005>();
      expect(result.length).assertEqual(2);
      expect(result[0] != undefined).assertTrue();
      expect(result[1] != undefined).assertTrue();
      if (result[0] != undefined && result[1] != undefined) {
        expect(result[0].value).assertEqual(1);
        expect(result[1].value).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0800
     * @tc.name testArrayFlat3008
     * @tc.desc Verify flat leaves the source array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = createDefaultNestedObjects();
      const originalLength = nested.length;
      const originalSecond = nested[1];
      const result: Array<Object> = nested.flat<Object>();
      expect(nested.length).assertEqual(originalLength);
      expect(nested[1] === originalSecond).assertTrue();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_0900
     * @tc.name testArrayFlat3009
     * @tc.desc Verify flat can be followed by reduce to combine numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const last = new Array<int>();
      last.push(3);
      const nested = new Array<Array<int>>(
        new Array<int>(1, 2),
        last
      );
      const flattened: Array<int> = nested.flat<int>();
      let sum = 0;
      for (let i = 0; i < flattened.length; i++) {
        sum += flattened[i];
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1000
     * @tc.name testArrayFlat3010
     * @tc.desc Verify repeated flat calls can progressively remove remaining nesting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat3010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = createDefaultNestedObjects();
      const result: Array<Object> = (nested.flat<Object>()).flat<Object>();
      expect(result.length).assertEqual(3);
      expect(result[2] as int).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1100
     * @tc.name testArrayFlat011
     * @tc.desc Verify documented scenario flat()不修改原数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: flat()不修改原数组
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1200
     * @tc.name testArrayFlat012
     * @tc.desc Verify documented scenario 原数组引用不变
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 原数组引用不变
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1300
     * @tc.name testArrayFlat013
     * @tc.desc Verify documented scenario 5.1 number数组嵌套
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 5.1 number数组嵌套
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1400
     * @tc.name testArrayFlat014
     * @tc.desc Verify documented scenario 5.2 string数组嵌套
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 5.2 string数组嵌套
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1500
     * @tc.name testArrayFlat015
     * @tc.desc Verify documented scenario 5.3 boolean数组嵌套
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 5.3 boolean数组嵌套
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1600
     * @tc.name testArrayFlat016
     * @tc.desc Verify documented scenario 5.4 char数组嵌套
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 5.4 char数组嵌套
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1700
     * @tc.name testArrayFlat017
     * @tc.desc Verify documented scenario 5.5 对象数组嵌套
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 5.5 对象数组嵌套
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1800
     * @tc.name testArrayFlat018
     * @tc.desc Verify documented scenario 5.6 混合类型嵌套
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 5.6 混合类型嵌套
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_1900
     * @tc.name testArrayFlat019
     * @tc.desc Verify documented scenario 6.1 null和undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 6.1 null和undefined
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_2000
     * @tc.name testArrayFlat020
     * @tc.desc Verify documented scenario 6.2 NaN和Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 6.2 NaN和Infinity
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_2100
     * @tc.name testArrayFlat021
     * @tc.desc Verify documented scenario 6.3 0值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 6.3 0值
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_2200
     * @tc.name testArrayFlat022
     * @tc.desc Verify documented scenario 6.4 空字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 6.4 空字符串
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_2300
     * @tc.name testArrayFlat023
     * @tc.desc Verify documented scenario 7.1 默认深度为1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 7.1 默认深度为1
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_2400
     * @tc.name testArrayFlat024
     * @tc.desc Verify documented scenario 7.2 只扁平化一层
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 7.2 只扁平化一层
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_2500
     * @tc.name testArrayFlat025
     * @tc.desc Verify documented scenario 7.3 连续flat()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 7.3 连续flat()
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_2600
     * @tc.name testArrayFlat026
     * @tc.desc Verify documented scenario 8.1 flat后map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 8.1 flat后map
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_2700
     * @tc.name testArrayFlat027
     * @tc.desc Verify documented scenario 8.2 flat后filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 8.2 flat后filter
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_2800
     * @tc.name testArrayFlat028
     * @tc.desc Verify documented scenario 8.3 flat后reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 8.3 flat后reduce
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_2900
     * @tc.name testArrayFlat029
     * @tc.desc Verify documented scenario 8.4 map后flat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 8.4 map后flat
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_3000
     * @tc.name testArrayFlat030
     * @tc.desc Verify documented scenario 9.1 flat() vs flat(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 9.1 flat() vs flat(1)
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_3100
     * @tc.name testArrayFlat031
     * @tc.desc Verify documented scenario 9.2 flat() vs flat(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 9.2 flat() vs flat(2)
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_3200
     * @tc.name testArrayFlat032
     * @tc.desc Verify documented scenario 10.1 稀疏数组flat()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 10.1 稀疏数组flat()
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_3300
     * @tc.name testArrayFlat033
     * @tc.desc Verify documented scenario 11.1 全是数组元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 11.1 全是数组元素
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_3400
     * @tc.name testArrayFlat034
     * @tc.desc Verify documented scenario 11.2 空数组元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 11.2 空数组元素
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_3500
     * @tc.name testArrayFlat035
     * @tc.desc Verify documented scenario 12.1 时间复杂度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 12.1 时间复杂度
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_3600
     * @tc.name testArrayFlat036
     * @tc.desc Verify documented scenario 12.2 与flat(depth)性能对比
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 12.2 与flat(depth)性能对比
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_3700
     * @tc.name testArrayFlat037
     * @tc.desc Verify documented scenario 13.1 矩阵展开
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 13.1 矩阵展开
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_3800
     * @tc.name testArrayFlat038
     * @tc.desc Verify documented scenario 13.2 分组数据合并
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 13.2 分组数据合并
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_3900
     * @tc.name testArrayFlat039
     * @tc.desc Verify documented scenario 13.3 批处理结果合并
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 13.3 批处理结果合并
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_4000
     * @tc.name testArrayFlat040
     * @tc.desc Verify documented scenario 14.1 flat() vs [...arr]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 14.1 flat() vs [...arr]
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_4100
     * @tc.name testArrayFlat041
     * @tc.desc Verify documented scenario 14.2 flat() vs concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 14.2 flat() vs concat
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_4200
     * @tc.name testArrayFlat042
     * @tc.desc Verify documented scenario 15.1 flat() vs flatMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 15.1 flat() vs flatMap
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_4300
     * @tc.name testArrayFlat043
     * @tc.desc Verify documented scenario 16.1 大数组flat()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 16.1 大数组flat()
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_4400
     * @tc.name testArrayFlat044
     * @tc.desc Verify documented scenario 16.2 深层嵌套只扁平一层
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 16.2 深层嵌套只扁平一层
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_4500
     * @tc.name testArrayFlat045
     * @tc.desc Verify documented scenario 17.1 ReadonlyArray的flat()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 17.1 ReadonlyArray的flat()
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_4600
     * @tc.name testArrayFlat046
     * @tc.desc Verify documented scenario 18.1 多次flat()完全扁平化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 18.1 多次flat()完全扁平化
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_THREE_4700
     * @tc.name testArrayFlat047
     * @tc.desc Verify documented scenario 18.2 flat().flat()模式
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 18.2 flat().flat()模式
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>();
      expect(result.length).assertEqual(3);
    });

  });
}
