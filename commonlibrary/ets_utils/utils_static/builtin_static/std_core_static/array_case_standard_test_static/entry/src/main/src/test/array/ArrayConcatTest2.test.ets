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
  afterAll, afterEach, beforeAll, beforeEach, describe,
  expect, it, Level, Size, TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

class ObjWithX {
  x: int = 0;
}

class OptObj {
  x: int = 0;
}

function singleIntArray(value: int): Array<int> {
  const arr = new Array<int>();
  arr.pushOne(value);
  return arr;
}

export default function ArrayConcatTest2(): void {
  describe('ArrayConcatTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0010
     * @tc.name testArrayConcat001
     * @tc.desc Verify constructor unfilled then fill then concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(3);
      arr1.fill(5);
      const arr2 = new Array<int>(2, 3);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0020
     * @tc.name testArrayConcat002
     * @tc.desc Verify Array.create large array concat with constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<long>(100, 1);
      const arr2 = new Array<long>(2, 3);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(102);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0030
     * @tc.name testArrayConcat003
     * @tc.desc Verify empty constructor concat with Array.create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>();
      const arr2 = Array.create<int>(3, 7);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(7);
      expect(result[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0040
     * @tc.name testArrayConcat004
     * @tc.desc Verify nested Array.create concat with constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Array<int>(1, 2);
      const arr1 = Array.create<Array<int>>(2, inner);
      const a1 = new Array<int>(3);
      const arr2 = new Array<Array<int>>(a1);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(inner);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0050
     * @tc.name testArrayConcat005
     * @tc.desc Verify multi-create concat (string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<string>(2, 'a');
      const arr2 = Array.create<string>(2, 'b');
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual('a');
      expect(result[2]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0060
     * @tc.name testArrayConcat006
     * @tc.desc Verify byte and short mixed concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<short>(1, 2);
      const arr2 = new Array<short>(3, 4);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0070
     * @tc.name testArrayConcat007
     * @tc.desc Verify three-level nested array concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<Array<int>>(new Array<int>(1));
      const inner2 = new Array<Array<int>>(new Array<int>(2));
      const arr1 = new Array<Array<Array<int>>>(inner1);
      const arr2 = new Array<Array<Array<int>>>(inner2);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(2);
      const first = result[0];
      if (first != undefined) {
        expect(first[0][0]).assertEqual(1);
      }else {
        expect().assertFail();
      }
      const second = result[1];
      if (second != undefined) {
        expect(second[0][0]).assertEqual(2);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0080
     * @tc.name testArrayConcat008
     * @tc.desc Verify different depth nested array concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1 = new Array<int>(2, 3);
      const arr1: Array<Array<int> | int> = new Array<Array<int> | int>(1, b1);
      const b2 = new Array<int>(5);
      const arr2: Array<Array<int> | int> = new Array<Array<int> | int>(4, b2);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3] != undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0090
     * @tc.name testArrayConcat009
     * @tc.desc Verify nested concat multi-level at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Array<int>(1, 2);
      const a2 = new Array<int>(3, 4);
      const arr1 = new Array<Array<int>>(a1, a2);
      const a3 = new Array<int>(5, 6);
      const arr2 = new Array<Array<int>>(a3);
      const result = arr1.concat(arr2);
      const lastRow = result.at(-1);
      if (lastRow != undefined) {
        expect(lastRow.at(0)).assertEqual(5);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0100
     * @tc.name testArrayConcat010
     * @tc.desc Verify empty nested array concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<Array<int>>();
      const a1 = new Array<int>(1);
      const arr2 = new Array<Array<int>>(a1);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0110
     * @tc.name testArrayConcat011
     * @tc.desc Verify nested object array concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Array<ObjWithX>();
      const o1 = new ObjWithX();
      o1.x = 1;
      inner1.pushOne(o1);
      const o2 = new ObjWithX();
      o2.x = 2;
      inner1.pushOne(o2);
      const arr1 = new Array<Array<ObjWithX>>(inner1);
      const inner2 = new Array<ObjWithX>();
      const o3 = new ObjWithX();
      o3.x = 3;
      inner2.pushOne(o3);
      const arr2 = new Array<Array<ObjWithX>>(inner2);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(2);
      expect(result[0].length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0120
     * @tc.name testArrayConcat012
     * @tc.desc Verify nested concat with filter on inner arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Array<int>(1, 2);
      const a2 = new Array<int>(-1, -2);
      const arr1 = new Array<Array<int>>(a1, a2);
      const a3 = new Array<int>(3, 4);
      const arr2 = new Array<Array<int>>(a3);
      const filtered = arr1.concat(arr2).filter((a: Array<int>): boolean => a.at(0) > 0);
      expect(filtered.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0130
     * @tc.name testArrayConcat013
     * @tc.desc Verify int|boolean union concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: Array<int | boolean> = new Array<int | boolean>(1, true);
      const arr2: Array<int | boolean> = new Array<int | boolean>(0, false);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertTrue();
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0140
     * @tc.name testArrayConcat014
     * @tc.desc Verify int|null|undefined tri-state concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: Array<int | null | undefined> = new Array<int | null | undefined>(1, null);
      const arr2: Array<int | null | undefined> = new Array<int | null | undefined>(undefined, 2);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertNull();
      expect(result[2]).assertUndefined();
      expect(result[3]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0150
     * @tc.name testArrayConcat015
     * @tc.desc Verify object and int union concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1 = new ObjWithX();
      o1.x = 1;
      const o2 = new ObjWithX();
      o2.x = 3;
      const arr1: Array<ObjWithX | int> = new Array<ObjWithX | int>(o1, 2);
      const arr2: Array<ObjWithX | int> = new Array<ObjWithX | int>(o2, 4);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0] instanceof ObjWithX).assertTrue();
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0160
     * @tc.name testArrayConcat016
     * @tc.desc Verify string and char union concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: Array<string | char> = new Array<string | char>('hello', c'c');
      const arr2: Array<string | char> = new Array<string | char>('world', c'd');
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual('hello');
      expect(result[2]).assertEqual('world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0170
     * @tc.name testArrayConcat017
     * @tc.desc Verify bigint and float union concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: Array<bigint | float> = new Array<bigint | float>(1n, 2.5f);
      const arr2: Array<bigint | float> = new Array<bigint | float>(3n, 4.5f);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0180
     * @tc.name testArrayConcat018
     * @tc.desc Verify float scientific notation concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<float>(1.5e3f, 2.5e4f);
      const arr2 = new Array<float>(3.5e-2f);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1.5e3f);
      expect(result[2]).assertEqual(3.5e-2f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0190
     * @tc.name testArrayConcat019
     * @tc.desc Verify double high precision concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<double>(1.2345678901234567, 0.0000000001);
      const arr2 = new Array<double>(3.141592653589793);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0200
     * @tc.name testArrayConcat020
     * @tc.desc Verify long extreme values concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<long>(9223372036854775807, -9223372036854775808);
      const arr2 = new Array<long>(0, 1);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(9223372036854775807);
      expect(result[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0210
     * @tc.name testArrayConcat021
     * @tc.desc Verify int extreme values concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(2147483647, -2147483648);
      const arr2 = new Array<int>(0, 1);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(2147483647);
      expect(result[1]).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0220
     * @tc.name testArrayConcat022
     * @tc.desc Verify hex literal values concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(0xFF, 0x1A);
      const arr2 = new Array<int>(0x00, 0xAB);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(255);
      expect(result[1]).assertEqual(26);
      expect(result[3]).assertEqual(171);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0230
     * @tc.name testArrayConcat023
     * @tc.desc Verify octal literal values concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(0o77, 0o10);
      const arr2 = new Array<int>(0o0, 0o100);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(63);
      expect(result[1]).assertEqual(8);
      expect(result[3]).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0240
     * @tc.name testArrayConcat024
     * @tc.desc Verify binary literal values concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(0b1010, 0b1111);
      const arr2 = new Array<int>(0b0000, 0b0101);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(15);
      expect(result[3]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0250
     * @tc.name testArrayConcat025
     * @tc.desc Verify negative scientific notation float concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<float>(-1.5e3f, -2.5e-2f);
      const arr2 = new Array<float>(3.0e1f);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(-1.5e3f);
      expect(result[2]).assertEqual(3.0e1f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0260
     * @tc.name testArrayConcat026
     * @tc.desc Verify splice on concat result is independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(3, 4);
      const result = arr1.concat(arr2);
      result.splice(1, 2);
      expect(result.length).assertEqual(2);
      expect(arr1.length).assertEqual(2);
      expect(arr2.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0270
     * @tc.name testArrayConcat027
     * @tc.desc Verify reverse on concat result does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(3, 4);
      const result = arr1.concat(arr2);
      result.reverse();
      expect(arr1[0]).assertEqual(1);
      expect(result[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0280
     * @tc.name testArrayConcat028
     * @tc.desc Verify sort on concat result does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(3, 1);
      const arr2 = new Array<int>(4, 2);
      const result = arr1.concat(arr2);
      result.sort();
      expect(arr1[0]).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0290
     * @tc.name testArrayConcat029
     * @tc.desc Verify fill on concat result does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(3, 4);
      const result = arr1.concat(arr2);
      result.fill(0);
      expect(arr1[0]).assertEqual(1);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0300
     * @tc.name testArrayConcat030
     * @tc.desc Verify multi-round concat independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(3);
      const r1 = arr1.concat(arr2);
      const arr3 = new Array<int>(4, 5);
      const r2 = arr1.concat(arr3);
      expect(r1.length).assertEqual(3);
      expect(r2.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0310
     * @tc.name testArrayConcat031
     * @tc.desc Verify multi-round self-concat cumulative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1);
      let r = arr.concat(arr);
      r = r.concat(arr);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(1);
      expect(r[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0320
     * @tc.name testArrayConcat032
     * @tc.desc Verify concat result concat with itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(3, 4);
      const r = arr1.concat(arr2);
      const r2 = r.concat(r);
      expect(r2.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0330
     * @tc.name testArrayConcat033
     * @tc.desc Verify single element multi self-concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1);
      const result = arr.concat(arr).concat(arr).concat(arr);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0340
     * @tc.name testArrayConcat034
     * @tc.desc Verify 2000+1000 element concat length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<int>(2000, 1);
      const arr2 = Array.create<int>(1000, 2);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0350
     * @tc.name testArrayConcat035
     * @tc.desc Verify 3000 element concat first and last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<int>(2000, 1);
      const arr2 = Array.create<int>(1000, 2);
      const result = arr1.concat(arr2);
      const v1 = result[0];
      const v2 = result[2999];
      const sum = v1 + v2;
      expect(sum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0360
     * @tc.name testArrayConcat036
     * @tc.desc Verify large array concat with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<int>(5000, 1);
      const arr2 = new Array<int>();
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(5000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0370
     * @tc.name testArrayConcat037
     * @tc.desc Verify empty array concat with large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>();
      const arr2 = Array.create<int>(5000, 1);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(5000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0380
     * @tc.name testArrayConcat038
     * @tc.desc Verify multiple large arrays concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<int>(1000, 1);
      const arr2 = Array.create<int>(1000, 2);
      const arr3 = Array.create<int>(1000, 3);
      const result = arr1.concat(arr2, arr3);
      expect(result.length).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0390
     * @tc.name testArrayConcat039
     * @tc.desc Verify large array concat then at negative access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<int>(10000, 5);
      const arr2 = new Array<int>(99);
      const result = arr1.concat(arr2);
      expect(result.at(-1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0400
     * @tc.name testArrayConcat040
     * @tc.desc Verify large array concat then filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<int>(500, 1);
      const arr2 = Array.create<int>(500, 0);
      const filtered = arr1.concat(arr2).filter((v: int): boolean => v === 1);
      expect(filtered.length).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0410
     * @tc.name testArrayConcat041
     * @tc.desc Verify large array concat then reduce sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<int>(100, 2);
      const arr2 = Array.create<int>(100, 3);
      const sum = arr1.concat(arr2).reduce((a: int, b: int): int => {
        return a + b;
      });
      expect(sum).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0420
     * @tc.name testArrayConcat042
     * @tc.desc Verify large array concat then every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<int>(1000, 1);
      const arr2 = Array.create<int>(1000, 1);
      const result = arr1.concat(arr2).every((v: int): boolean => v === 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0430
     * @tc.name testArrayConcat043
     * @tc.desc Verify large array concat then some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<int>(1000, 1);
      const arr2 = Array.create<int>(1000, 2);
      const result = arr1.concat(arr2).some((v: int): boolean => v === 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0440
     * @tc.name testArrayConcat044
     * @tc.desc Verify concat result forEach index verification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(10, 20);
      const arr2 = new Array<int>(30, 40);
      let idxSum = 0;
      arr1.concat(arr2).forEach((v: int, i: int): void => {
        idxSum += i;
      });
      expect(idxSum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0450
     * @tc.name testArrayConcat045
     * @tc.desc Verify concat result lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2, 1);
      const arr2 = new Array<int>(2, 3);
      const result = arr1.concat(arr2).lastIndexOf(2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0460
     * @tc.name testArrayConcat046
     * @tc.desc Verify concat result join with separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('a', 'b');
      const arr2 = new Array<string>('c', 'd');
      const result = arr1.concat(arr2).join('|');
      expect(result).assertEqual('a|b|c|d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0470
     * @tc.name testArrayConcat047
     * @tc.desc Verify concat result positive index out-of-bounds throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1);
      const arr2 = new Array<int>(2);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(2);
      try {
        const v = result[5];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0480
     * @tc.name testArrayConcat048
     * @tc.desc Verify concat result negative index out-of-bounds throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1);
      const arr2 = new Array<int>(2);
      const result = arr1.concat(arr2);
      try {
        result.at(-10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0490
     * @tc.name testArrayConcat049
     * @tc.desc Verify concat result boundary negative -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(10, 20, 30);
      const arr2 = new Array<int>(40, 50);
      const result = arr1.concat(arr2).at(-1);
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0500
     * @tc.name testArrayConcat050
     * @tc.desc Verify concat result boundary negative -length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(10, 20);
      const arr2 = new Array<int>(30);
      const result = arr1.concat(arr2).at(-3);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0510
     * @tc.name testArrayConcat051
     * @tc.desc Verify concat result huge index throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2, 3);
      const arr2 = new Array<int>(4, 5, 6);
      const result = arr1.concat(arr2);
      try {
        result.at(Number.MAX_SAFE_INTEGER.toInt());
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0520
     * @tc.name testArrayConcat052
     * @tc.desc Verify concat result used as input to another concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(3, 4);
      const arr3 = new Array<int>(5, 6);
      const result = arr1.concat(arr2).concat(arr3);
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0530
     * @tc.name testArrayConcat053
     * @tc.desc Verify concat result length equals sum of source lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2, 3);
      const arr2 = new Array<int>(4, 5);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(arr1.length + arr2.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0540
     * @tc.name testArrayConcat054
     * @tc.desc Verify concat result iteration sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2, 3);
      const arr2 = new Array<int>(4, 5, 6);
      let s = 0;
      for (let v of arr1.concat(arr2)) {
        s += v;
      }
      expect(s).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0550
     * @tc.name testArrayConcat055
     * @tc.desc Verify Infinity values in concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(Double.POSITIVE_INFINITY, 1);
      const arr2 = new Array<number>(2, Double.NEGATIVE_INFINITY);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0560
     * @tc.name testArrayConcat056
     * @tc.desc Verify zero-width string concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('\u200B', 'a');
      const arr2 = new Array<string>('\u200B', 'b');
      const result = arr1.concat(arr2).join('');
      expect(result).assertEqual('\u200Ba\u200Bb');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0570
     * @tc.name testArrayConcat057
     * @tc.desc Verify fullwidth character concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('\uFF21', '\uFF22');
      const arr2 = new Array<string>('\uFF23');
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('\uFF21');
      expect(result[2]).assertEqual('\uFF23');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0580
     * @tc.name testArrayConcat058
     * @tc.desc Verify escape character concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('"', '\\');
      const arr2 = new Array<string>('\n', '\t');
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual('"');
      expect(result[1]).assertEqual('\\');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0590
     * @tc.name testArrayConcat059
     * @tc.desc Verify emoji string concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('\uD83D\uDE00', '\uD83C\uDF89');
      const arr2 = new Array<string>('\uD83D\uDE80', '\u2705');
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0600
     * @tc.name testArrayConcat060
     * @tc.desc Verify empty and whitespace string concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('', ' ', '\t');
      const arr2 = new Array<string>('\n', '\r', '');
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0610
     * @tc.name testArrayConcat061
     * @tc.desc Verify char array and string array concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('a', 'b');
      const arr2 = new Array<string>('cd', 'ef');
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0620
     * @tc.name testArrayConcat062
     * @tc.desc Verify optional property object concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1 = new OptObj();
      const o2 = new OptObj();
      o2.x = 1;
      const arr1 = new Array<OptObj>(o1, o2);
      const o3 = new OptObj();
      o3.x = 2;
      const o4 = new OptObj();
      const arr2 = new Array<OptObj>(o3, o4);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[1].x).assertEqual(1);
      expect(result[2].x).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0630
     * @tc.name testArrayConcat063
     * @tc.desc Verify boolean alternating concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<boolean>(true, false, true);
      const arr2 = new Array<boolean>(false, true, false);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(6);
      expect(result[0]).assertTrue();
      expect(result[1]).assertFalse();
      expect(result[3]).assertFalse();
      expect(result[4]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0640
     * @tc.name testArrayConcat064
     * @tc.desc Verify Array.from with constructor concat (cross-constructor)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(3, 4);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0650
     * @tc.name testArrayConcat065
     * @tc.desc Verify Array.of with Array.create concat (cross-constructor)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.of<number>(1, 2);
      const arr2 = Array.create<number>(3, 0);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0660
     * @tc.name testArrayConcat066
     * @tc.desc Verify basic literal constructor concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(3, 4);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0670
     * @tc.name testArrayConcat067
     * @tc.desc Verify Array.of chained concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.of<int>(1);
      const arr2 = Array.of<int>(2);
      const arr3 = Array.of<int>(3);
      const result = arr1.concat(arr2).concat(arr3);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0680
     * @tc.name testArrayConcat068
     * @tc.desc Verify byte and short mixed type concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<short>(1, 2);
      const arr2 = new Array<short>(3, 4);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0690
     * @tc.name testArrayConcat069
     * @tc.desc Verify nested concat then reduce flattening
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Array<int>(1, 2);
      const a2 = new Array<int>(3);
      const arr1 = new Array<Array<int>>(a1, a2);
      const a3 = new Array<int>(4, 5, 6);
      const arr2 = new Array<Array<int>>(a3);
      const concated = arr1.concat(arr2);
      const flattened = concated.reduce((acc: Array<int>, cur: Array<int>): Array<int> => acc.concat(cur), new Array<int>());
      expect(flattened.length).assertEqual(6);
      expect(flattened[0]).assertEqual(1);
      expect(flattened[5]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0700
     * @tc.name testArrayConcat070
     * @tc.desc Verify int|string union type concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: Array<int | string> = new Array<int | string>(1, 'a');
      const arr2: Array<int | string> = new Array<int | string>(2, 'b');
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual('a');
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0710
     * @tc.name testArrayConcat071
     * @tc.desc Verify int|null union type concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: Array<int | null> = new Array<int | null>(1, null);
      const arr2: Array<int | null> = new Array<int | null>(null, 2);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertNull();
      expect(result[2]).assertNull();
      expect(result[3]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0720
     * @tc.name testArrayConcat072
     * @tc.desc Verify int|undefined union type concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: Array<int | undefined> = new Array<int | undefined>(1, undefined);
      const arr2: Array<int | undefined> = new Array<int | undefined>(undefined, 2);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertUndefined();
      expect(result[3]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0730
     * @tc.name testArrayConcat073
     * @tc.desc Verify number and short union arithmetic after concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: Array<number | short> = new Array<number | short>(1, 2);
      const arr2: Array<number | short> = new Array<number | short>(3, 4);
      const result = arr1.concat(arr2);
      const sum = (result[0] as double) + (result[1] as double);
      expect(sum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0740
     * @tc.name testArrayConcat074
     * @tc.desc Verify typeof union type inference after concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: Array<string | int> = new Array<string | int>('a', 1);
      const arr2: Array<string | int> = new Array<string | int>('b', 2);
      const result = arr1.concat(arr2);
      const val = result.at(0);
      expect(val).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0750
     * @tc.name testArrayConcat075
     * @tc.desc Verify concat result used with flat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Array<int>(1);
      const a2 = new Array<int>(2);
      const arr1 = new Array<Array<int>>(a1, a2);
      const a3 = new Array<int>(3);
      const a4 = new Array<int>(4);
      const arr2 = new Array<Array<int>>(a3, a4);
      const result = arr1.concat(arr2).flat() as Array<int>;
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0760
     * @tc.name testArrayConcat076
     * @tc.desc Verify concat result used with flatMap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(3, 4);
      const temp = arr1.concat(arr2);
      const result = temp.map((v: int): Array<int> => new Array<int>(v, v * 2))
        .reduce((acc: Array<int>, curr: Array<int>): Array<int> => acc.concat(curr), new Array<int>());
      expect(result.length).assertEqual(8);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0770
     * @tc.name testArrayConcat077
     * @tc.desc Verify concat result keys iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('a', 'b');
      const arr2 = new Array<string>('c');
      let k = '';
      for (let i of arr1.concat(arr2).keys()) {
        k += i.toString();
      }
      expect(k).assertEqual('012');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0780
     * @tc.name testArrayConcat078
     * @tc.desc Verify concat result values iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('a', 'b');
      const arr2 = new Array<string>('c');
      let v = '';
      for (let val of arr1.concat(arr2).values()) {
        v += val;
      }
      expect(v).assertEqual('abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0790
     * @tc.name testArrayConcat079
     * @tc.desc Verify concat result entries iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('x', 'y');
      const arr2 = new Array<string>('z');
      let e = '';
      for (let entry of arr1.concat(arr2).entries()) {
        e += entry[0].toString() + entry[1];
      }
      expect(e).assertEqual('0x1y2z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0800
     * @tc.name testArrayConcat080
     * @tc.desc Verify concat result reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(3, 4);
      const result = arr1.concat(arr2).reduceRight((a: int, b: int): int => {
        return a - b;
      });
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0810
     * @tc.name testArrayConcat081
     * @tc.desc Verify concat result findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(3, 4, 5);
      const idx = arr1.concat(arr2).findIndex((v: int): boolean => v === 3);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0820
     * @tc.name testArrayConcat082
     * @tc.desc Verify concat result toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1000, 2000);
      const arr2 = new Array<int>(3000);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0830
     * @tc.name testArrayConcat083
     * @tc.desc Verify concat result is Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1);
      const arr2 = new Array<int>(2);
      const result = arr1.concat(arr2);
      expect(result instanceof Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0840
     * @tc.name testArrayConcat084
     * @tc.desc Verify char and string mixed type concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: Array<char | string> = new Array<char | string>(c'a','ef' );
      const arr2: Array<char | string> = new Array<char | string>('cd', c'b');
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(c'a');
      expect(result[2]).assertEqual('cd');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0850
     * @tc.name testArrayConcat085
     * @tc.desc Verify Array.from with constructor concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1, 2);
      const arr2 = new Array<number>(3, 4);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0860
     * @tc.name testArrayConcat086
     * @tc.desc Verify push on original after concat does not affect result length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(3, 4);
      const result = arr1.concat(arr2);
      arr1.push(99);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0870
     * @tc.name testArrayConcat087
     * @tc.desc Verify modifying original element after concat does not affect result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(3, 4);
      const result = arr1.concat(arr2);
      arr1[0] = 99;
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0880
     * @tc.name testArrayConcat088
     * @tc.desc Verify modifying original object property after concat propagates to result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new ObjWithX();
      obj.x = 1;
      const arr1 = new Array<ObjWithX>(obj, new ObjWithX());
      const arr2 = new Array<ObjWithX>(new ObjWithX(), new ObjWithX());
      const result = arr1.concat(arr2);
      obj.x = 99;
      expect(result[0].x).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0890
     * @tc.name testArrayConcat089
     * @tc.desc Verify two-element array self-concat twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2);
      const result = arr.concat(arr).concat(arr);
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(1);
      expect(result[3]).assertEqual(2);
      expect(result[4]).assertEqual(1);
      expect(result[5]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0900
     * @tc.name testArrayConcat090
     * @tc.desc Verify duplicate value arrays concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(5, 5);
      const arr2 = new Array<int>(5, 5);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertEqual(5);
      expect(result[2]).assertEqual(5);
      expect(result[3]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0910
     * @tc.name testArrayConcat091
     * @tc.desc Verify same content different reference concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(1, 2);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(1);
      expect(result[3]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0920
     * @tc.name testArrayConcat092
     * @tc.desc Verify empty array self-concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      const result = arr.concat(arr);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0930
     * @tc.name testArrayConcat093
     * @tc.desc Verify that concatenating arrays with -0 elements gets correct result length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(-0, 1);
      const arr2 = new Array<number>(2, -0);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0940
     * @tc.name testArrayConcat094
     * @tc.desc Verify concat can retain inner elements of 2D nested arrays correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<Array<int>>();
      a.push(new Array<int>(1, 2));
      const b = new Array<Array<int>>().concat(a)
      expect(b[0][1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0950
     * @tc.name testArrayConcat095
     * @tc.desc Verify byte array concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<byte>(1, 2);
      const arr2 = new Array<byte>(3, 4);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0960
     * @tc.name testArrayConcat096
     * @tc.desc Verify short array concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<short>(100, 200);
      const arr2 = new Array<short>(300);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(100);
      expect(result[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0970
     * @tc.name testArrayConcat097
     * @tc.desc Verify long array concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<long>(100, 200);
      const arr2 = new Array<long>(300);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(100);
      expect(result[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0980
     * @tc.name testArrayConcat098
     * @tc.desc Verify float array concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<float>(1.0f, 2.0f);
      const arr2 = new Array<float>(3.0f);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1.0);
      expect(result[2]).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0990
     * @tc.name testArrayConcat099
     * @tc.desc Verify double array concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<double>(1.0, 2.0);
      const arr2 = new Array<double>(3.0);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1.0);
      expect(result[2]).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1000
     * @tc.name testArrayConcat100
     * @tc.desc Verify char array concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('a', 'b');
      const arr2 = new Array<string>('c');
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('a');
      expect(result[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1010
     * @tc.name testArrayConcat101
     * @tc.desc Verify boolean array concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<boolean>(true);
      const arr2 = new Array<boolean>(false);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertTrue();
      expect(result[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1020
     * @tc.name testArrayConcat102
     * @tc.desc Verify string array concat with normal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('test', '测试');
      const arr2 = new Array<string>('123');
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('test');
      expect(result[1]).assertEqual('测试');
      expect(result[2]).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1030
     * @tc.name testArrayConcat103
     * @tc.desc Verify string array concat with Unicode and empty values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('\u0061', '\u6d4b\u8bd5');
      const arr2 = new Array<string>('', ' ');
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('测试');
      expect(result[2]).assertEqual('');
      expect(result[3]).assertEqual(' ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1040
     * @tc.name testArrayConcat104
     * @tc.desc Verify string array concat with special characters and XSS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('!@#$', '<script>alert(1)</script>');
      const arr2 = new Array<string>('0x123', '0b1010');
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual('!@#$');
      expect(result[1]).assertEqual('<script>alert(1)</script>');
      expect(result[2]).assertEqual('0x123');
      expect(result[3]).assertEqual('0b1010');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1050
     * @tc.name testArrayConcat105
     * @tc.desc Verify string array concat with business format and emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('13800138000', 'test@example.com');
      const arr2 = new Array<string>('\uD83D\uDE00测试', 'テスト', '테스트', 'АБВГД');
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual('13800138000');
      expect(result[3]).assertEqual('テスト');
      expect(result[4]).assertEqual('테스트');
      expect(result[5]).assertEqual('АБВГД');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1060
     * @tc.name testArrayConcat106
     * @tc.desc Verify int array concat with hex, octal, binary literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(0x1234, 0o123);
      const arr2 = new Array<int>(0b1010);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(4660);
      expect(result[1]).assertEqual(83);
      expect(result[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1070
     * @tc.name testArrayConcat107
     * @tc.desc Verify int array concat with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(-2147483648, 2147483647);
      const arr2 = new Array<int>(10000);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(-2147483648);
      expect(result[1]).assertEqual(2147483647);
      expect(result[2]).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1080
     * @tc.name testArrayConcat108
     * @tc.desc Verify string array concat with encoding anomaly values (\uFFFD, \udc04)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('\uFFFD');
      const arr2 = new Array<string>('\udc04');
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('\uFFFD');
      expect(result[1]).assertEqual('\udc04');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1090
     * @tc.name testArrayConcat109
     * @tc.desc Verify Date array concat with number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Date(2026, 0, 1);
      const arr1: Array<Object> = new Array<Object>(1);
      const arr2: Array<Object> = new Array<Object>(d);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1100
     * @tc.name testArrayConcat110
     * @tc.desc Verify Map element array concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m1 = new Map<string, int>(new Array<[string, int]>(['k', 1]));
      const m2 = new Map<string, int>(new Array<[string, int]>(['k', 2]));
      const arr1 = new Array<Map<string, int>>(m1);
      const arr2 = new Array<Map<string, int>>(m2);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(2);
      expect(result[0].get('k')).assertEqual(1);
      expect(result[1].get('k')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1110
     * @tc.name testArrayConcat111
     * @tc.desc Verify Set element array concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s1 = new Set<int>(new Array<int>(1, 2));
      const s2 = new Set<int>(new Array<int>(3, 4));
      const arr1 = new Array<Set<int>>(s1);
      const arr2 = new Array<Set<int>>(s2);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(2);
      expect(result[0].has(1)).assertTrue();
      expect(result[1].has(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1120
     * @tc.name testArrayConcat112
     * @tc.desc Verify bigint array concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<bigint>(100n, 200n);
      const arr2 = new Array<bigint>(300n);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(100n);
      expect(result[2]).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1130
     * @tc.name testArrayConcat113
     * @tc.desc Verify concat() with no arguments returns shallow copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result = arr.concat();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
      result[0] = 99;
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1140
     * @tc.name testArrayConcat114
     * @tc.desc Verify Date typed array concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayConcat114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1 = new Date(2026, 0, 1);
      const d2 = new Date(2026, 11, 25);
      const arr1 = new Array<Date>(d1);
      const arr2 = new Array<Date>(d2);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(2);
      expect(result[0].getFullYear()).assertEqual(2026);
      expect(result[1].getFullYear()).assertEqual(2026);
    });


  });
}

