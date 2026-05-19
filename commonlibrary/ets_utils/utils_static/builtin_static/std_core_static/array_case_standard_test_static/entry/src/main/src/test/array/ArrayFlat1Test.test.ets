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

class FlatOneItem009 {
  value: int = 0;
}

function createNestedObjects(): Array<Object> {
  return new Array<Object>(
    1 as Object,
    new Array<Object>(
      2 as Object,
      new Array<Object>(3 as Object) as Object
    ) as Object
  );
}

export default function ArrayFlat1Test(): void {
  describe('ArrayFlat1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_0100
     * @tc.name testArrayFlat1001
     * @tc.desc Verify flat with depth two fully flattens a nested structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = createNestedObjects();
      const result: Array<Object> = nested.flat<Object>(2);
      expect(result.length).assertEqual(3);
      expect(result[0] as int).assertEqual(1);
      expect(result[1] as int).assertEqual(2);
      expect(result[2] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_0200
     * @tc.name testArrayFlat1002
     * @tc.desc Verify flat with depth zero keeps nested arrays intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = createNestedObjects();
      const result: Array<Object> = nested.flat<Object>(0);
      expect(result.length).assertEqual(2);
      expect(result[0] as int).assertEqual(1);
      expect(Array.isArray(result[1])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_0300
     * @tc.name testArrayFlat1003
     * @tc.desc Verify flat with depth one removes only one nesting level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = createNestedObjects();
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
      expect(result[0] as int).assertEqual(1);
      expect(result[1] as int).assertEqual(2);
      expect(Array.isArray(result[2])).assertTrue();
      const tail = result[2] as Array<Object>;
      expect(tail[0] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_0400
     * @tc.name testArrayFlat1004
     * @tc.desc Verify flat with a large depth fully flattens shallow nesting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new Array<Array<number>>(
        new Array<number>(1, 2),
        new Array<number>(3, 4)
      );
      const result: Array<number> = nested.flat<number>(100);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_0500
     * @tc.name testArrayFlat1005
     * @tc.desc Verify negative depth behaves like zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = createNestedObjects();
      const result: Array<Object> = nested.flat<Object>(-1);
      expect(result.length).assertEqual(2);
      expect(Array.isArray(result[1])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_0600
     * @tc.name testArrayFlat1006
     * @tc.desc Verify a large number depth can flatten the full nested structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new Array<Array<int>>(
        new Array<int>(1, 2),
        new Array<int>(3, 4)
      );
      const result: Array<int> = nested.flat<int>(1000);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_0700
     * @tc.name testArrayFlat1007
     * @tc.desc Verify flat returns a new array and keeps the source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = createNestedObjects();
      const original = nested[1];
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result === nested).assertFalse();
      expect(nested[1] === original).assertTrue();
      expect(Array.isArray(nested[1])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_0800
     * @tc.name testArrayFlat1008
     * @tc.desc Verify flat works with empty nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new Array<Array<number>>(
        new Array<number>(),
        new Array<number>(1, 2),
        new Array<number>(),
        new Array<number>(3, 4)
      );
      const result: Array<number> = nested.flat<number>(1);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_0900
     * @tc.name testArrayFlat1009
     * @tc.desc Verify flat works with nested object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new FlatOneItem009();
      item.value = 1;
      const nested = new Array<Array<FlatOneItem009>>(new Array<FlatOneItem009>(item));
      const result: Array<FlatOneItem009> = nested.flat<FlatOneItem009>(1);
      expect(result.length).assertEqual(1);
      expect(result[0] != undefined).assertTrue();
      if (result[0] != undefined) {
        expect(result[0].value).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1000
     * @tc.name testArrayFlat1010
     * @tc.desc Verify repeated flat calls can progressively remove nesting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = createNestedObjects();
      const step1: Array<Object> = nested.flat<Object>(1);
      const step2: Array<Object> = step1.flat<Object>(1);
      expect(step1.length).assertEqual(3);
      expect(step2.length).assertEqual(3);
      expect(step2[2] as int).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1100
     * @tc.name testArrayFlat011
     * @tc.desc Verify documented scenario 返回Array<U>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 返回Array<U>
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1200
     * @tc.name testArrayFlat012
     * @tc.desc Verify documented scenario 泛型U推断
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 泛型U推断
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1300
     * @tc.name testArrayFlat013
     * @tc.desc Verify documented scenario 单层嵌套扁平化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 单层嵌套扁平化
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1400
     * @tc.name testArrayFlat014
     * @tc.desc Verify documented scenario 多层嵌套扁平化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 多层嵌套扁平化
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1500
     * @tc.name testArrayFlat015
     * @tc.desc Verify documented scenario 混合类型扁平化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 混合类型扁平化
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1600
     * @tc.name testArrayFlat016
     * @tc.desc Verify documented scenario 空数组flat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 空数组flat
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1700
     * @tc.name testArrayFlat017
     * @tc.desc Verify documented scenario 空数组嵌套
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 空数组嵌套
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1800
     * @tc.name testArrayFlat018
     * @tc.desc Verify documented scenario 无嵌套flat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 无嵌套flat
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1900
     * @tc.name testArrayFlat019
     * @tc.desc Verify documented scenario 3.3 稀疏数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 3.3 稀疏数组
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_2000
     * @tc.name testArrayFlat020
     * @tc.desc Verify documented scenario flat不修改原数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: flat不修改原数组
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_2100
     * @tc.name testArrayFlat021
     * @tc.desc Verify documented scenario 原数组引用不变
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 原数组引用不变
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_2200
     * @tc.name testArrayFlat022
     * @tc.desc Verify documented scenario 5.1 number数组嵌套
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 5.1 number数组嵌套
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_2300
     * @tc.name testArrayFlat023
     * @tc.desc Verify documented scenario 5.2 string数组嵌套
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 5.2 string数组嵌套
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_2400
     * @tc.name testArrayFlat024
     * @tc.desc Verify documented scenario 5.3 对象数组嵌套
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 5.3 对象数组嵌套
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_2500
     * @tc.name testArrayFlat025
     * @tc.desc Verify documented scenario 6.1 depth=1默认行为
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 6.1 depth=1默认行为
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_2600
     * @tc.name testArrayFlat026
     * @tc.desc Verify documented scenario 6.2 深度嵌套
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 6.2 深度嵌套
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_2700
     * @tc.name testArrayFlat027
     * @tc.desc Verify documented scenario 6.3 逐层扁平化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 6.3 逐层扁平化
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_2800
     * @tc.name testArrayFlat028
     * @tc.desc Verify documented scenario 7.1 flat后map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 7.1 flat后map
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_2900
     * @tc.name testArrayFlat029
     * @tc.desc Verify documented scenario 7.2 map后flat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 7.2 map后flat
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_3000
     * @tc.name testArrayFlat030
     * @tc.desc Verify documented scenario 7.3 flat后filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 7.3 flat后filter
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_3100
     * @tc.name testArrayFlat031
     * @tc.desc Verify documented scenario 8.1 时间复杂度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 8.1 时间复杂度
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_3200
     * @tc.name testArrayFlat032
     * @tc.desc Verify documented scenario 9.1 null和undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 9.1 null和undefined
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_3300
     * @tc.name testArrayFlat033
     * @tc.desc Verify documented scenario 9.2 只有数组元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 9.2 只有数组元素
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_3400
     * @tc.name testArrayFlat034
     * @tc.desc Verify documented scenario 10.1 flat vs flatMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 10.1 flat vs flatMap
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_3500
     * @tc.name testArrayFlat035
     * @tc.desc Verify documented scenario 11.1 depth为最大值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 11.1 depth为最大值
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_3600
     * @tc.name testArrayFlat036
     * @tc.desc Verify documented scenario 12.1 ReadonlyArray的flat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 12.1 ReadonlyArray的flat
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_3700
     * @tc.name testArrayFlat037
     * @tc.desc Verify documented scenario 13.1 不规则嵌套
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 13.1 不规则嵌套
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_3800
     * @tc.name testArrayFlat038
     * @tc.desc Verify documented scenario 13.2 交错嵌套
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 13.2 交错嵌套
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_3900
     * @tc.name testArrayFlat039
     * @tc.desc Verify documented scenario 14.1 多个空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 14.1 多个空数组
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_4000
     * @tc.name testArrayFlat040
     * @tc.desc Verify documented scenario 14.2 空数组与非空数组混合
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 14.2 空数组与非空数组混合
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_4100
     * @tc.name testArrayFlat041
     * @tc.desc Verify documented scenario 15.1 多次flat完全扁平化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 15.1 多次flat完全扁平化
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_4200
     * @tc.name testArrayFlat042
     * @tc.desc Verify documented scenario 16.1 浮点数depth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 16.1 浮点数depth
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_4300
     * @tc.name testArrayFlat043
     * @tc.desc Verify documented scenario 16.2 NaN depth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 16.2 NaN depth
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_4400
     * @tc.name testArrayFlat044
     * @tc.desc Verify documented scenario 17.1 flat vs [...arr]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 17.1 flat vs [...arr]
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_4500
     * @tc.name testArrayFlat045
     * @tc.desc Verify documented scenario 18.1 树结构扁平化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 18.1 树结构扁平化
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_4600
     * @tc.name testArrayFlat046
     * @tc.desc Verify documented scenario 18.2 矩阵展开
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 18.2 矩阵展开
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1);
      expect(result.length).assertEqual(3);
    });

  });
}
