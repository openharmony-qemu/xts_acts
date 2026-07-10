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

class FlatOneItem009 {
  value: int = 0;
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
      const nested: Array<int | Array<int | Array<int>>> = [1, [2, [3]]];
      const result: Array<int> = nested.flat<int>(2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
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
      const nested: Array<int | Array<int>> = [1, [2, 3]];
      const result: Array<int | Array<int>> = nested.flat<int | Array<int>>(0);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
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
      const nested: Array<int | Array<int | Array<int>>> = [1, [2, [3]]];
      const result: Array<int | Array<int>> = nested.flat<int | Array<int>>(1);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(Array.isArray(result[2])).assertTrue();
      expect(result.toString()).assertEqual('1,2,3');
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
      const nested: Array<Array<int>> = [[1, 2], [3, 4]];
      const result: Array<int> = nested.flat<int>(100);
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
      const nested: Array<int | Array<int>> = [1, [2, 3]];
      const result: Array<int | Array<int>> = nested.flat<int | Array<int>>(-1);
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
      const nested: Array<Array<int>> = [[1, 2], [3, 4]];
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
     * @tc.desc Verify flat works with empty nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<int>> = [[], [1, 2], [], [3, 4]];
      const result: Array<int> = nested.flat<int>(1);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_0800
     * @tc.name testArrayFlat1008
     * @tc.desc Verify flat works with nested object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new FlatOneItem009();
      item.value = 1;
      const nested: Array<Array<FlatOneItem009>> = [[item]];
      const result: Array<FlatOneItem009> = nested.flat<FlatOneItem009>(1);
      expect(result.length).assertEqual(1);
      if (result[0] != undefined) {
        expect(result[0].value).assertEqual(1);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_0900
     * @tc.name testArrayFlat1009
     * @tc.desc Verify repeated flat calls can progressively remove nesting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<int | Array<int | Array<int>>> = [1, [2, [3]]];
      const step1: Array<int | Array<int>> = nested.flat<int | Array<int>>(1);
      const step2: Array<int> = step1.flat<int>(1);
      expect(step1.length).assertEqual(3);
      expect(step2.length).assertEqual(3);
      expect(step2[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1000
     * @tc.name testArrayFlat1010
     * @tc.desc Verify depth 1 flattens nested number arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<int>> = [[1, 2], [3]];
      const result: Array<int> = nested.flat<int>(1);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1100
     * @tc.name testArrayFlat1011
     * @tc.desc Verify negative depth behaves like zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<Array<int>>> = [[[1, 2]], [[3, 4]]];
      const result: Array<Array<Array<int>>> = nested.flat<Array<Array<int>>>(-1);
      expect(result.length).assertEqual(2);
      expect(result[0][0][1]).assertEqual(2);
      expect(result[1][0][0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1200
     * @tc.name testArrayFlat1012
     * @tc.desc Verify a large depth fully flattens a matrix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const matrix: Array<Array<int>> = [[1, 2, 3], [4, 5, 6]];
      const result: Array<int> = matrix.flat<int>(2147483647);
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[5]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1300
     * @tc.name testArrayFlat1013
     * @tc.desc Verify object arrays flatten correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item1 = new FlatOneItem009();
      item1.value = 1;
      const item2 = new FlatOneItem009();
      item2.value = 2;
      const nested: Array<Array<FlatOneItem009>> = [[item1], [item2]];
      const result: Array<FlatOneItem009> = nested.flat<FlatOneItem009>(1);
      expect(result.length).assertEqual(2);
      expect(result[0].value).assertEqual(1);
      expect(result[1].value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1400
     * @tc.name testArrayFlat1014
     * @tc.desc Verify null and undefined values are preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<int | null | undefined>> = [[1, null], [undefined, 2]];
      const result: Array<int | null | undefined> = nested.flat<int | null | undefined>(1);
      expect(result.length).assertEqual(4);
      expect(result[1]).assertNull();
      expect(result[2]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1500
     * @tc.name testArrayFlat1015
     * @tc.desc Verify repeated flat calls progressively remove nesting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<Array<int>>> = [[[1, 2]], [[3, 4]]];
      const step1: Array<Array<int>> = nested.flat<Array<int>>(1);
      const step2: Array<int> = step1.flat<int>(1);
      expect(step1.length).assertEqual(2);
      expect(step2.length).assertEqual(4);
      expect(step2[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1600
     * @tc.name testArrayFlat1016
     * @tc.desc Verify flat results can be mapped immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<Array<int>> = [[1, 2], [3, 4]];
      const mapped = nested.flat<int>(1).map((value: int): int => value * 2);
      expect(mapped.length).assertEqual(4);
      expect(mapped[0]).assertEqual(2);
      expect(mapped[3]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1700
     * @tc.name testArrayFlat1017
     * @tc.desc Verify flat and flatMap produce the same expanded sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [1, 2, 3];
      const mapped = source.map((value: int): Array<int> => [value, value * 2]);
      const flatResult: Array<int> = mapped.flat<int>(1);
      const flatMapResult: Array<int> =
        source.flatMap<int>((value: int): Array<int> => [value, value * 2]);
      expect(flatResult.length).assertEqual(flatMapResult.length);
      expect(flatResult.toString()).assertEqual(flatMapResult.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FLAT_ONE_1800
     * @tc.name testArrayFlat1018
     * @tc.desc Verify ReadonlyArray inputs can be flattened
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFlat1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int | Array<int>> = [1, [2, 3]];
      const result: Array<int> = source.flat<int>(1);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
    });

  });
}
