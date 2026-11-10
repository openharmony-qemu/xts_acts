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
  TestType,
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

interface SimpleObj04501 {
  id: number;
}

// Consolidated SparseArrayPopPart01Test (35 scenarios -> 4 merged cases, each <=10)
export default function sparseArrayPopTestPart01(): void {
  describe('SparseArrayPopTestPart01', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_PART01_0100
     * @tc.name sparseArrayPopPart01Test001
     * @tc.desc pop returns last & shrinks length (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayPopPart01Test001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. pop reduces length from 6 to 5 on six-element SparseArray<string>
      const arr1 = new SparseArray<string>('a', 'b', 'c', 'd', 'e', 'f');
      arr1.pop();
      let actualInt1: int = arr1.length;
      let expectedInt1: int = 5;
      expect(actualInt1).assertEqual(expectedInt1);
      // 2. pop reduces length from 5 to 4 on five-element SparseArray<Date>
      const date2a = new Date(100);
      const date2b = new Date(200);
      const date2c = new Date(300);
      const date2d = new Date(400);
      const date2e = new Date(500);
      const arr2 = new SparseArray<Date>(date2a, date2b, date2c, date2d, date2e);
      arr2.pop();
      let actualInt2: int = arr2.length;
      let expectedInt2: int = 4;
      expect(actualInt2).assertEqual(expectedInt2);
      // 3. pop returns 42 stored at huge index 0x7ffffffe in SparseArray<int>
      const arr3 = new SparseArray<int>(1);
      arr3[0x7ffffffe as int] = 42;
      const result3 = arr3.pop();
      expect(result3).assertEqual(42);
      // 4. pop removes last element so forEach counts 2 remaining elements in SparseArray<int>
      const arr4 = new SparseArray<int>(1, 2, 3);
      arr4.pop();
      let count4: int = 0;
      arr4.forEach((_value: int, _index: int, _array: SparseArray<int>): void => {
        count4 = count4 + 1;
      });
      expect(count4).assertEqual(2);
      // 5. pop reduces length from 5 to 4 after removing the value at index 4
      const arr5 = new SparseArray<int>(5);
      arr5[4] = 77;
      arr5.pop();
      let actualInt5: int = arr5.length;
      let expectedInt5: int = 4;
      expect(actualInt5).assertEqual(expectedInt5);
      // 6. pop removes last element so index 3 becomes undefined in SparseArray<int>
      const arr6 = new SparseArray<int>(1, 2, 3, 0);
      arr6.pop();
      const result6 = arr6[3];
      expect(result6).assertUndefined();
      // 7. pop removes last element then flat(0) yields length 3 in SparseArray<int>
      const arr7 = new SparseArray<int>(1, 2, 3, 4);
      arr7.pop();
      const flat7 = arr7.flat(0);
      let actualInt7: int = flat7.length;
      let expectedInt7: int = 3;
      expect(actualInt7).assertEqual(expectedInt7);
      // 8. pop followed by push(9) on SparseArray<int>(1, 2, 3) restores length 3 with 9 back at index 2
      const arr8 = new SparseArray<int>(1, 2, 3);
      arr8.pop();
      arr8.push(9);
      let len8: int = arr8.length;
      expect(len8).assertEqual(3);
      expect(arr8[2]).assertEqual(9);
      // 9. pop removing the last element 3 of SparseArray<int>(1, 2, 3) makes lastIndexOf(3) return -1
      const arr9 = new SparseArray<int>(1, 2, 3);
      arr9.pop();
      let actualInt9: int = arr9.lastIndexOf(3);
      let expectedInt9: int = -1;
      expect(actualInt9).assertEqual(expectedInt9);
      // 10. pop on SparseArray<int>(1, 2, 3) shortened to length 2 by the length property returns 2 and leaves length 1
      const arr10 = new SparseArray<int>(1, 2, 3);
      arr10.length = 2;
      const result10 = arr10.pop();
      expect(result10).assertEqual(2);
      let len10: int = arr10.length;
      expect(len10).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_PART01_0200
     * @tc.name sparseArrayPopPart01Test002
     * @tc.desc typed elements - numeric & boolean (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayPopPart01Test002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. pop returns last boolean true from SparseArray<boolean> holding true, false, true
      const arr1 = new SparseArray<boolean>(true, false, true);
      const result1 = arr1.pop();
      expect(result1).assertTrue();
      // 2. pop returns +Infinity from SparseArray<double> holding Double.POSITIVE_INFINITY
      const arr2 = new SparseArray<double>(Double.POSITIVE_INFINITY);
      const result2 = arr2.pop();
      expect(result2).assertPosUnlimited();
      // 3. pop returns last double 3.0 from SparseArray<double> with 1.0, 2.0, 3.0
      const arr3 = new SparseArray<double>(1.0, 2.0, 3.0);
      const result3 = arr3.pop();
      expect(result3).assertEqual(3.0);
      // 4. pop returns 3.14 from a single-element SparseArray<double>
      const arr4 = new SparseArray<double>(3.14);
      const result4 = arr4.pop();
      expect(result4).assertEqual(3.14);
      // 5. pop returns float 3.1415927 within 0.0001 tolerance from SparseArray<float>
      const arr5 = new SparseArray<float>(1);
      arr5[0] = (3.1415927).toFloat();
      const result5 = arr5.pop();
      expect(result5 as float).assertClose(3.1415927, 0.0001);
      // 6. pop returns extreme value -1.7976931348623157e308 from single-element SparseArray<double>
      const arr6 = new SparseArray<double>(-1.7976931348623157e308);
      const result6 = arr6.pop();
      let actualDouble6: double = result6 as double;
      expect(actualDouble6).assertEqual(-1.7976931348623157e308);
      // 7. pop returns NaN from SparseArray<double> holding Double.NaN
      const arr7 = new SparseArray<double>(Double.NaN, Double.NaN);
      const result7 = arr7.pop();
      let actualBoolean7: boolean = isNaN(result7 as double);
      expect(actualBoolean7).assertTrue();
      // 8. pop on SparseArray<int>(1, -1) returns the last negative element -1 with its sign preserved
      const arr8 = new SparseArray<int>(1, -1);
      const result8 = arr8.pop();
      expect(result8).assertEqual(-1);
      // 9. pop on the single-element SparseArray<boolean>(false) returns false and leaves length 0
      const arr9 = new SparseArray<boolean>(false);
      const result9 = arr9.pop();
      expect(result9).assertFalse();
      let len9: int = arr9.length;
      expect(len9).assertEqual(0);
      // 10. pop on SparseArray<long>(10, 20) returns the last long value 20
      const arr10 = new SparseArray<long>(10 as long, 20 as long);
      const result10 = arr10.pop();
      let actualLong10: long = result10!;
      let expectedLong10: long = 20 as long;
      expect(actualLong10).assertEqual(expectedLong10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_PART01_0300
     * @tc.name sparseArrayPopPart01Test003
     * @tc.desc pop on empty/all-hole returns undefined & null/undefined element (8 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayPopPart01Test003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. pop on empty SparseArray<Date> returns undefined, not a Date instance, and length stays 0
      const arr1 = new SparseArray<Date>();
      arr1.push(new Date(0));
      arr1.pop();
      const result1 = arr1.pop();
      let isDate1: boolean = result1 instanceof Date;
      expect(isDate1).assertFalse();
      let len1: int = arr1.length;
      expect(len1).assertEqual(0);
      // 2. pop returns 50, then undefined, then 30 from sparse array with values at indices 0, 2, 4
      const arr2 = new SparseArray<int>(5);
      arr2[0] = 10;
      arr2[2] = 30;
      arr2[4] = 50;
      const r2a = arr2.pop();
      const r2b = arr2.pop();
      const r2c = arr2.pop();
      expect(r2a).assertEqual(50);
      expect(r2b).assertUndefined();
      expect(r2c).assertEqual(30);
      // 3. repeated pop on empty SparseArray<int> keeps length at 0
      const arr3 = new SparseArray<int>();
      for (let i = 0; i < 10; i++) {
        arr3.pop();
      }
      let actualInt3: int = arr3.length;
      let expectedInt3: int = 0;
      expect(actualInt3).assertEqual(expectedInt3);
      // 4. pop on empty SparseArray<string> returns undefined and repeated pop keeps returning undefined
      const arr4 = new SparseArray<string>();
      const result4 = arr4.pop();
      expect(result4).assertUndefined();
      const repeatPopResult4 = arr4.pop();
      expect(repeatPopResult4).assertUndefined();
      let len4: int = arr4.length;
      expect(len4).assertEqual(0);
      // 5. pop returns 3 from SparseArray<int | undefined> holding 1, undefined, 3
      const arr5 = new SparseArray<int | undefined>(1, undefined, 3);
      const result5 = arr5.pop();
      expect(result5).assertEqual(3);
      // 6. pop returns SimpleObj04501 with id 1 rather than null from two-element SparseArray
      const o6: SimpleObj04501 = { id: 1 };
      const arr6 = new SparseArray<SimpleObj04501 | null>(null, o6);
      const result6 = arr6.pop();
      let isNullResult6: boolean = result6 === null;
      expect(isNullResult6).assertFalse();
      let actualNumber6: number = (result6 as SimpleObj04501).id;
      let expectedNumber6: number = 1;
      expect(actualNumber6).assertEqual(expectedNumber6);
      // 7. pop on the single-element of(9) returns 9 and leaves length 0 with index 0 undefined
      const arr7 = SparseArray.of<int>(9);
      const result7 = arr7.pop();
      expect(result7).assertEqual(9);
      let len7: int = arr7.length;
      expect(len7).assertEqual(0);
      expect(arr7[0]).assertUndefined();
      // 8. pop on SparseArray<string>('a', '') returns the trailing empty string rather than undefined
      const arr8 = new SparseArray<string>('a', '');
      const result8 = arr8.pop();
      expect(result8).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_PART01_0400
     * @tc.name sparseArrayPopPart01Test004
     * @tc.desc typed elements - string/regex/date/bigint & multi-pop sequence (7 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayPopPart01Test004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. pop returns the tab character from a single-element SparseArray<string>
      const arr1 = new SparseArray<string>('\t');
      const result1 = arr1.pop();
      expect(result1).assertEqual('\t');
      // 2. pop returns RegExp whose source is ^abc$ and flags contain g from SparseArray<RegExp>
      const re2 = new RegExp('^abc$', 'gi');
      const arr2 = new SparseArray<RegExp>(re2);
      const result2 = arr2.pop();
      let actualString2: string = (result2 as RegExp).source;
      let expectedString2: string = '^abc$';
      expect(actualString2).assertEqual(expectedString2);
      let flags2: string = (result2 as RegExp).flags;
      expect(flags2.indexOf('g')).assertEqual(0);
      // 3. pop returns regex special-character string ^$.*+?()[]{}| from SparseArray<string>
      const arr3 = new SparseArray<string>('.', '^$.*+?()[]{}|');
      const result3 = arr3.pop();
      expect(result3).assertEqual('^$.*+?()[]{}|');
      // 4. pop on SparseArray<bigint>(100n, 200n) returns the last bigint 200n
      const arr4 = new SparseArray<bigint>(100n, 200n);
      const result4 = arr4.pop();
      expect(result4).assertEqual(200n);
      // 5. two consecutive pop calls on SparseArray<int>(1, 2, 3) return 3 then 2 and leave length 1
      const arr5 = new SparseArray<int>(1, 2, 3);
      const r5a = arr5.pop();
      const r5b = arr5.pop();
      expect(r5a).assertEqual(3);
      expect(r5b).assertEqual(2);
      let len5: int = arr5.length;
      expect(len5).assertEqual(1);
      // 6. pop on SparseArray<string>('1', '2', '3') returns the last string '3' without numeric conversion
      const arr6 = new SparseArray<string>('1', '2', '3');
      const result6 = arr6.pop();
      expect(result6).assertEqual('3');
      // 7. pop on SparseArray<Date>(d1, d2) returns the identical Date instance d2 stored at the last index
      const date7a = new Date(0);
      const date7b = new Date(1000);
      const arr7 = new SparseArray<Date>(date7a, date7b);
      const result7 = arr7.pop();
      let actualBoolean7: boolean = result7 === date7b;
      expect(actualBoolean7).assertTrue();
    });
  });
}
