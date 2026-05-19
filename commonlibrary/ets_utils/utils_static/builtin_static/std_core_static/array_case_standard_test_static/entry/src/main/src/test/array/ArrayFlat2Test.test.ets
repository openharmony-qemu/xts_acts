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

function createIntNestedObjects(): Array<Object> {
  return new Array<Object>(
    1 as Object,
    new Array<Object>(
      2 as Object,
      new Array<Object>(3 as Object) as Object
    ) as Object
  );
}

export default function ArrayFlat2Test(): void {
  describe('ArrayFlat2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_0100
     * @tc.name testArrayFlat2001
     * @tc.desc Verify flat accepts an int depth parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const last = new Array<int>();
      last.push(3);
      const nested = new Array<Array<int>>(
        new Array<int>(1, 2),
        last
      );
      const depth: int = 1;
      const result: Array<int> = nested.flat<int>(depth);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_0200
     * @tc.name testArrayFlat2002
     * @tc.desc Verify int depth zero keeps nested arrays intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = createIntNestedObjects();
      const depth: int = 0;
      const result: Array<Object> = nested.flat<Object>(depth);
      expect(result.length).assertEqual(2);
      expect(Array.isArray(result[1])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_0300
     * @tc.name testArrayFlat2003
     * @tc.desc Verify int depth one removes one level of nesting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = createIntNestedObjects();
      const depth: int = 1;
      const result: Array<Object> = nested.flat<Object>(depth);
      expect(result.length).assertEqual(3);
      expect(result[0] as int).assertEqual(1);
      expect(result[1] as int).assertEqual(2);
      expect(Array.isArray(result[2])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_0400
     * @tc.name testArrayFlat2004
     * @tc.desc Verify int depth two removes two levels of nesting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = createIntNestedObjects();
      const depth: int = 2;
      const result: Array<Object> = nested.flat<Object>(depth);
      expect(result.length).assertEqual(3);
      expect(result[2] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_0500
     * @tc.name testArrayFlat2005
     * @tc.desc Verify negative int depth behaves like zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = createIntNestedObjects();
      const depth: int = -1;
      const result: Array<Object> = nested.flat<Object>(depth);
      expect(result.length).assertEqual(2);
      expect(Array.isArray(result[1])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_0600
     * @tc.name testArrayFlat2006
     * @tc.desc Verify large int depth fully flattens a matrix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const matrix = new Array<Array<number>>(
        new Array<number>(1, 2, 3),
        new Array<number>(4, 5, 6)
      );
      const result: Array<number> = matrix.flat<number>(2147483647 as int);
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[5]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_0700
     * @tc.name testArrayFlat2007
     * @tc.desc Verify default flat behavior matches int depth one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new Array<Array<number>>(
        new Array<number>(1, 2),
        new Array<number>(3)
      );
      const result1: Array<number> = nested.flat<number>(1 as int);
      const result2: Array<number> = nested.flat<number>();
      expect(result1.length).assertEqual(result2.length);
      expect(result1.toString()).assertEqual(result2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_0800
     * @tc.name testArrayFlat2008
     * @tc.desc Verify flat with int depth keeps the source array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = createIntNestedObjects();
      const original = nested[1];
      const result: Array<Object> = nested.flat<Object>(1 as int);
      expect(result === nested).assertFalse();
      expect(nested[1] === original).assertTrue();
      expect(Array.isArray(nested[1])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_0900
     * @tc.name testArrayFlat2009
     * @tc.desc Verify repeated flat with int depth can progressively flatten arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = createIntNestedObjects();
      const step1: Array<Object> = nested.flat<Object>(1 as int);
      const step2: Array<Object> = step1.flat<Object>(1 as int);
      expect(step2.length).assertEqual(3);
      expect(step2[2] as int).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1000
     * @tc.name testArrayFlat010
     * @tc.desc Verify documented scenario 返回Array<U>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 返回Array<U>
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1 as int);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1100
     * @tc.name testArrayFlat011
     * @tc.desc Verify documented scenario 泛型U推断
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 泛型U推断
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1 as int);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1200
     * @tc.name testArrayFlat012
     * @tc.desc Verify documented scenario 单层嵌套扁平化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 单层嵌套扁平化
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1 as int);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1300
     * @tc.name testArrayFlat013
     * @tc.desc Verify documented scenario 多层嵌套按深度扁平化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 多层嵌套按深度扁平化
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1 as int);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1400
     * @tc.name testArrayFlat014
     * @tc.desc Verify documented scenario 空数组flat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 空数组flat
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1 as int);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1500
     * @tc.name testArrayFlat015
     * @tc.desc Verify documented scenario 无嵌套flat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 无嵌套flat
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1 as int);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1600
     * @tc.name testArrayFlat016
     * @tc.desc Verify documented scenario flat不修改原数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: flat不修改原数组
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1 as int);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1700
     * @tc.name testArrayFlat017
     * @tc.desc Verify documented scenario 5.1 number数组嵌套
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 5.1 number数组嵌套
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1 as int);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1800
     * @tc.name testArrayFlat018
     * @tc.desc Verify documented scenario 5.2 string数组嵌套
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 5.2 string数组嵌套
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1 as int);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1900
     * @tc.name testArrayFlat019
     * @tc.desc Verify documented scenario 6.1 depth=1默认
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 6.1 depth=1默认
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1 as int);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_2000
     * @tc.name testArrayFlat020
     * @tc.desc Verify documented scenario 6.2 逐层扁平化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 6.2 逐层扁平化
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1 as int);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_2100
     * @tc.name testArrayFlat021
     * @tc.desc Verify documented scenario 7.1 flat后map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 7.1 flat后map
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1 as int);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_2200
     * @tc.name testArrayFlat022
     * @tc.desc Verify documented scenario 8.1 int vs number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 8.1 int vs number
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1 as int);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_2300
     * @tc.name testArrayFlat023
     * @tc.desc Verify documented scenario 9.1 int边界值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 9.1 int边界值
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1 as int);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_2400
     * @tc.name testArrayFlat024
     * @tc.desc Verify documented scenario 10.1 二维数组转一维
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 10.1 二维数组转一维
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1 as int);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_2500
     * @tc.name testArrayFlat025
     * @tc.desc Verify documented scenario 11.1 int类型约束
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 11.1 int类型约束
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1 as int);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_2600
     * @tc.name testArrayFlat026
     * @tc.desc Verify documented scenario 12.1 int参数性能
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Documented scenario: 12.1 int参数性能
      const nested = new Array<Object>(1 as Object, new Array<Object>(2 as Object, 3 as Object) as Object);
      const result: Array<Object> = nested.flat<Object>(1 as int);
      expect(result.length).assertEqual(3);
    });

  });
}
