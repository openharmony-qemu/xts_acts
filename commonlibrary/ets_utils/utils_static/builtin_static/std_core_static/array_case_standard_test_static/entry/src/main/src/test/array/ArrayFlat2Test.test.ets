'use static';
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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

class FlatTwoItem020 {
  value: int = 0;
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
      const nested: Array<int | Array<int>> = [1, [2, 3]];
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
      const nested: Array<int | Array<int>> = [1, [2, 3]];
      const depth: int = 0;
      const result: Array<int | Array<int>> = nested.flat<int | Array<int>>(depth);
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
      const nested: Array<int | Array<int | Array<int>>> = [1, [2, [3]]];
      const depth: int = 1;
      const result: Array<int | Array<int>> = nested.flat<int | Array<int>>(depth);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
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
      const nested: Array<int | Array<int | Array<int>>> = [1, [2, [3]]];
      const depth: int = 2;
      const result: Array<int> = nested.flat<int>(depth);
      expect(result.length).assertEqual(3);
      expect(result[2]).assertEqual(3);
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
      const nested: Array<int | Array<int>> = [1, [2, 3]];
      const depth: int = -1;
      const result: Array<int | Array<int>> = nested.flat<int | Array<int>>(depth);
      expect(result.length).assertEqual(2);
      expect(Array.isArray(result[1])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_0600
     * @tc.name testArrayFlat2006
     * @tc.desc Verify default flat behavior matches int depth one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<int>> = [[1, 2], [3]];
      const result1: Array<int> = nested.flat<int>(1);
      const result2: Array<int> = nested.flat<int>();
      expect(result1.length).assertEqual(result2.length);
      expect(result1.toString()).assertEqual(result2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_0700
     * @tc.name testArrayFlat2007
     * @tc.desc Verify flat with int depth keeps the source array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<int | Array<int | Array<int>>> = [1, [2, [3]]];
      const original = nested[1];
      const result: Array<int | Array<int>> = nested.flat<int | Array<int>>(1);
      expect(result === nested).assertFalse();
      expect(nested[1] === original).assertTrue();
      expect(Array.isArray(nested[1])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_0800
     * @tc.name testArrayFlat2008
     * @tc.desc Verify repeated flat with int depth can progressively flatten arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<int | Array<int | Array<int>>> = [1, [2, [3]]];
      const step1: Array<int | Array<int>> = nested.flat<int | Array<int>>(1);
      const step2: Array<int> = step1.flat<int>(1);
      expect(step2.length).assertEqual(3);
      expect(step2[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_0900
     * @tc.name testArrayFlat2009
     * @tc.desc Verify depth 0 keeps nested arrays intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<Array<int>>> = [[[1, 2]], [[3, 4]]];
      const result: Array<Array<Array<int>>> = nested.flat<Array<Array<int>>>(0);
      expect(result.length).assertEqual(2);
      expect(result[0][0][0]).assertEqual(1);
      expect(result[1][0][1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1000
     * @tc.name testArrayFlat2010
     * @tc.desc Verify depth 2 flattens two levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<Array<int>>> = [[[1], [2]], [[3]]];
      const result: Array<int> = nested.flat<int>(2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1100
     * @tc.name testArrayFlat2011
     * @tc.desc Verify negative depth behaves like zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<Array<int>>> = [[[1, 2]], [[3, 4]]];
      const result: Array<Array<Array<int>>> = nested.flat<Array<Array<int>>>(-1);
      expect(result.length).assertEqual(2);
      expect(result[0][0][0]).assertEqual(1);
      expect(result[1][0][1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1200
     * @tc.name testArrayFlat2012
     * @tc.desc Verify flat leaves the source array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<int>> = [[1, 2], [3, 4]];
      const originalSecond = nested[1];
      const result: Array<int> = nested.flat<int>(1);
      expect(result === nested).assertFalse();
      expect(nested[1] === originalSecond).assertTrue();
      expect(nested[1][0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1300
     * @tc.name testArrayFlat2013
     * @tc.desc Verify flat returns an empty array for empty input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int> = [];
      const result: Array<int> = arr.flat<int>(1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1400
     * @tc.name testArrayFlat2014
     * @tc.desc Verify string arrays flatten correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<string>> = [['a', 'b'], ['c']];
      const result: Array<string> = nested.flat<string>(1);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('a');
      expect(result[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1500
     * @tc.name testArrayFlat2015
     * @tc.desc Verify object arrays flatten correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item1 = new FlatTwoItem020();
      item1.value = 1;
      const item2 = new FlatTwoItem020();
      item2.value = 2;
      const nested: Array<Array<FlatTwoItem020>> = [[item1], [item2]];
      const result: Array<FlatTwoItem020> = nested.flat<FlatTwoItem020>(1);
      expect(result.length).assertEqual(2);
      expect(result[0].value).assertEqual(1);
      expect(result[1].value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1600
     * @tc.name testArrayFlat2016
     * @tc.desc Verify NaN and Infinity values are preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<number>> = [[1, NaN], [Infinity, 2]];
      const result: Array<number> = nested.flat<number>(1);
      expect(result.length).assertEqual(4);
      expect(Number.isNaN(result[1])).assertTrue();
      expect(result[2]).assertEqual(Infinity);
    });
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_TWO_1700
     * @tc.name testArrayFlat2017
     * @tc.desc Verify all array elements flatten into a single list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<int>> = [[1, 2], [3, 4], [5, 6]];
      const result: Array<int> = nested.flat<int>(1);
      expect(result.length).assertEqual(6);
      expect(result[5]).assertEqual(6);
    });

  });
}
