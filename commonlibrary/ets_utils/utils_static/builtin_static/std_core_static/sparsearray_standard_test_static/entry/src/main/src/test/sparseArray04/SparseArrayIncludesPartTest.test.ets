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

interface SparseArrayIncludesPartObjectValue {
  id: int;
}

// Merged from SparseArrayIncludesPart01Test + SparseArrayIncludesPart03Test (50 scenarios -> 5 cases, each <=10)
export default function sparseArrayIncludesPartTest(): void {
  describe('SparseArrayIncludesPartTest', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_PART_0100
     * @tc.name sparseArrayIncludesPartTest001
     * @tc.desc includes() found returns true: int (dense & sparse), boolean & basic string (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayIncludesPartTest001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. includes(40) on sparse int {0:10,3:40} -> true
      const arr1 = new SparseArray<int>(5);
      arr1[0] = 10;
      arr1[3] = 40;
      expect(arr1.includes(40)).assertTrue();
      // 2. includes(42) on len=42 sparse {0:42} -> true
      const arr2 = new SparseArray<int>(42);
      arr2[0] = 42;
      expect(arr2.includes(42)).assertTrue();
      // 3. includes(77) on len=6 sparse {5:77} -> true
      const arr3 = new SparseArray<int>(6);
      arr3[5] = 77;
      expect(arr3.includes(77)).assertTrue();
      // 4. includes(true) on (false,true,false) -> true
      const arr4 = new SparseArray<boolean>(false, true, false);
      expect(arr4.includes(true)).assertTrue();
      // 5. includes(false) on (true,false,true) -> true
      const arr5 = new SparseArray<boolean>(true, false, true);
      expect(arr5.includes(false)).assertTrue();
      // 6. includes('') on ('a','','b') -> true
      const arr6 = new SparseArray<string>('a', '', 'b');
      expect(arr6.includes('')).assertTrue();
      // 7. includes(' ') on ('x',' ','y') -> true
      const arr7 = new SparseArray<string>('x', ' ', 'y');
      expect(arr7.includes(' ')).assertTrue();
      // 8. includes('\t') on ('a','\t','b') -> true
      const arr8 = new SparseArray<string>('a', '\t', 'b');
      expect(arr8.includes('\t')).assertTrue();
      // 9. includes('中文') on ('hello','中文','world') -> true
      const arr9 = new SparseArray<string>('hello', '中文', 'world');
      expect(arr9.includes('中文')).assertTrue();
      // 10. includes('😀') on ('a','😀','b') -> true
      const arr10 = new SparseArray<string>('a', '😀', 'b');
      expect(arr10.includes('😀')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_PART_0200
     * @tc.name sparseArrayIncludesPartTest002
     * @tc.desc includes() not-found returns false: int/undefined/string/boolean/double/bigint/object/RegExp (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayIncludesPartTest002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. includes(99) on (10,20,30) -> false
      const arr1 = new SparseArray<int>(10, 20, 30);
      expect(arr1.includes(99)).assertFalse();
      // 2. includes(undefined) on sparse int|undef {0:10,3:40} -> false
      const arr2 = new SparseArray<int | undefined>(5);
      arr2[0] = 10;
      arr2[3] = 40;
      expect(arr2.includes(undefined)).assertFalse();
      // 3. includes(0) on len=42 empty -> false
      const arr3 = new SparseArray<int>(42);
      expect(arr3.includes(0)).assertFalse();
      // 4. includes('') on ('a','b','c') -> false
      const arr4 = new SparseArray<string>('a', 'b', 'c');
      expect(arr4.includes('')).assertFalse();
      // 5. includes(true) on (false,false,false) -> false
      const arr5 = new SparseArray<boolean>(false, false, false);
      expect(arr5.includes(true)).assertFalse();
      // 6. includes(1.5) on (1.0,2.0,3.0) -> false
      const arr6 = new SparseArray<double>(1.0, 2.0, 3.0);
      expect(arr6.includes(1.5)).assertFalse();
      // 7. includes(BigInt(0)) on (1n,2n,3n) -> false
      const arr7 = new SparseArray<bigint>(BigInt(1), BigInt(2), BigInt(3));
      expect(arr7.includes(BigInt(0))).assertFalse();
      // 8. includes(obj2) on (obj1,obj3) ref-mismatch -> false
      const obj1: SparseArrayIncludesPartObjectValue = { id: 1 };
      const obj2: SparseArrayIncludesPartObjectValue = { id: 2 };
      const obj3: SparseArrayIncludesPartObjectValue = { id: 3 };
      const arr8 = new SparseArray<SparseArrayIncludesPartObjectValue>(obj1, obj3);
      expect(arr8.includes(obj2)).assertFalse();
      // 9. includes('apple',3=length) on ('apple','banana','cherry') -> false
      const arr9 = new SparseArray<string>('apple', 'banana', 'cherry');
      expect(arr9.includes('apple', 3)).assertFalse();
      // 10. includes(r3) on (r1,r2) ref-mismatch -> false
      const r1: RegExp = new RegExp('\\d+');
      const r2: RegExp = new RegExp('\\d+');
      const r3: RegExp = new RegExp('\\d+');
      const arr10 = new SparseArray<RegExp>(r1, r2);
      expect(arr10.includes(r3)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_PART_0300
     * @tc.name sparseArrayIncludesPartTest003
     * @tc.desc includes() fromIndex parameter: positive/negative/boundary, int & string (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayIncludesPartTest003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. includes(10,0) on (10,20,30) -> true
      const arr1 = new SparseArray<int>(10, 20, 30);
      expect(arr1.includes(10, 0)).assertTrue();
      // 2. includes(30,2) on (10,20,30,40) -> true
      const arr2 = new SparseArray<int>(10, 20, 30, 40);
      expect(arr2.includes(30, 2)).assertTrue();
      // 3. includes(10,1) on (10,20,30) skip first -> false
      const arr3 = new SparseArray<int>(10, 20, 30);
      expect(arr3.includes(10, 1)).assertFalse();
      // 4. includes(40,3) on sparse {0:10,2:30,3:40} -> true
      const arr4 = new SparseArray<int>(6);
      arr4[0] = 10;
      arr4[2] = 30;
      arr4[3] = 40;
      expect(arr4.includes(40, 3)).assertTrue();
      // 5. includes(40,1) on sparse {0:10,3:40} -> true
      const arr5 = new SparseArray<int>(5);
      arr5[0] = 10;
      arr5[3] = 40;
      expect(arr5.includes(40, 1)).assertTrue();
      // 6. includes(10,-1) on sparse {0:10} -> false
      const arr6 = new SparseArray<int>(5);
      arr6[0] = 10;
      expect(arr6.includes(10, -1)).assertFalse();
      // 7. includes(40,-2) on (10,20,30,40,50) -> true
      const arr7 = new SparseArray<int>(10, 20, 30, 40, 50);
      expect(arr7.includes(40, -2)).assertTrue();
      // 8. includes(42,4) on sparse {4:42} -> true
      const arr8 = new SparseArray<int>(5);
      arr8[4] = 42;
      expect(arr8.includes(42, 4)).assertTrue();
      // 9. includes(99,-1) on sparse {0:1,3:99} -> false
      const arr9 = new SparseArray<int>(5);
      arr9[0] = 1;
      arr9[3] = 99;
      expect(arr9.includes(99, -1)).assertFalse();
      // 10. includes('gamma',-1) on ('alpha','beta','gamma') -> true
      const arr10 = new SparseArray<string>('alpha', 'beta', 'gamma');
      expect(arr10.includes('gamma', -1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_PART_0400
     * @tc.name sparseArrayIncludesPartTest004
     * @tc.desc includes() NaN & special numeric values: double Infinity/NaN/MAX/EPSILON & bigint (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayIncludesPartTest004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. includes(0.0) on (0.0,1.5,2.5) -> true
      const arr1 = new SparseArray<double>(0.0, 1.5, 2.5);
      expect(arr1.includes(0.0)).assertTrue();
      // 2. includes(Double.NaN) SameValueZero on (1.0,NaN,2.0) -> true
      const arr2 = new SparseArray<double>(1.0, Double.NaN, 2.0);
      expect(arr2.includes(Double.NaN)).assertTrue();
      // 3. includes(Double.NaN) on (1.0,2.0,3.0) no NaN -> false
      const arr3 = new SparseArray<double>(1.0, 2.0, 3.0);
      expect(arr3.includes(Double.NaN)).assertFalse();
      // 4. includes(+Inf) on (0.0,+Inf,1.0) -> true
      const arr4 = new SparseArray<double>(0.0, Double.POSITIVE_INFINITY, 1.0);
      expect(arr4.includes(Double.POSITIVE_INFINITY)).assertTrue();
      // 5. includes(-Inf) on (0.0,-Inf,1.0) -> true
      const arr5 = new SparseArray<double>(0.0, Double.NEGATIVE_INFINITY, 1.0);
      expect(arr5.includes(Double.NEGATIVE_INFINITY)).assertTrue();
      // 6. includes(MAX_VALUE) on (1.0,MAX_VALUE,2.0) -> true
      const arr6 = new SparseArray<double>(1.0, Number.MAX_VALUE, 2.0);
      expect(arr6.includes(Number.MAX_VALUE)).assertTrue();
      // 7. includes(EPSILON) on (1.0,EPSILON,2.0) -> true
      const arr7 = new SparseArray<double>(1.0, Number.EPSILON, 2.0);
      expect(arr7.includes(Number.EPSILON)).assertTrue();
      // 8. includes(BigInt(0)) on (0n,1n,2n) -> true
      const arr8 = new SparseArray<bigint>(BigInt(0), BigInt(1), BigInt(2));
      expect(arr8.includes(BigInt(0))).assertTrue();
      // 9. includes(Number.NaN,2) skip NaN at idx1 -> false
      const arr9 = new SparseArray<double>(0.5, Number.NaN, 2.0, 4.0);
      expect(arr9.includes(Number.NaN, 2)).assertFalse();
      // 10. includes(+Inf) on (1.0,2.0,3.0) -> false
      const arr10 = new SparseArray<double>(1.0, 2.0, 3.0);
      expect(arr10.includes(Number.POSITIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_PART_0500
     * @tc.name sparseArrayIncludesPartTest005
     * @tc.desc includes() typed reference elements (object/Date/RegExp) & special string values (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayIncludesPartTest005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. includes(s='a\0b') on ('x',s,'y') -> true
      const s1: string = 'a\0b';
      const arr1 = new SparseArray<string>('x', s1, 'y');
      expect(arr1.includes(s1)).assertTrue();
      // 2. includes(1000-char str) on ('x',longStr,'y') -> true
      let longStr: string = '';
      for (let i = 0; i < 1000; i++) {
        longStr = longStr + 'A';
      }
      const arr2 = new SparseArray<string>('x', longStr, 'y');
      expect(arr2.includes(longStr)).assertTrue();
      // 3. includes('<script>...') on ('a','<script>...','b') -> true
      const arr3 = new SparseArray<string>('a', '<script>alert(1)</script>', 'b');
      expect(arr3.includes('<script>alert(1)</script>')).assertTrue();
      // 4. includes(null) on (null,obj1) -> true
      const obj1: SparseArrayIncludesPartObjectValue = { id: 1 };
      const arr4 = new SparseArray<SparseArrayIncludesPartObjectValue | null>(null, obj1);
      expect(arr4.includes(null)).assertTrue();
      // 5. includes(obj) on (obj) by ref -> true
      const obj2: SparseArrayIncludesPartObjectValue = { id: 42 };
      const arr5 = new SparseArray<SparseArrayIncludesPartObjectValue>(obj2);
      expect(arr5.includes(obj2)).assertTrue();
      // 6. includes(d) on (d) by ref -> true
      const dateA: Date = new Date(0);
      const arr6 = new SparseArray<Date>(dateA);
      expect(arr6.includes(dateA)).assertTrue();
      // 7. includes(epoch) on (epoch,later) -> true
      const epoch: Date = new Date(0);
      const later: Date = new Date(1000);
      const arr7 = new SparseArray<Date>(epoch, later);
      expect(arr7.includes(epoch)).assertTrue();
      // 8. includes(da2) on (da1,da3) ref-mismatch -> false
      const da1: Date = new Date(0);
      const da2: Date = new Date(1000);
      const da3: Date = new Date(2000);
      const arr8 = new SparseArray<Date>(da1, da3);
      expect(arr8.includes(da2)).assertFalse();
      // 9. includes(re) on (re) by ref -> true
      const re: RegExp = new RegExp('abc');
      const arr9 = new SparseArray<RegExp>(re);
      expect(arr9.includes(re)).assertTrue();
      // 10. includes(db2,-1) on (db1,db2) -> true
      const db1: Date = new Date(1000);
      const db2: Date = new Date(2000);
      const arr10 = new SparseArray<Date>(db1, db2);
      expect(arr10.includes(db2, -1)).assertTrue();
    });
  });
}
