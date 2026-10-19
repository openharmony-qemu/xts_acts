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
} from '../../../../hypium/index';
import Utils from '../Util.test';

// Merged from SparseArrayIndexGetPart01Test + SparseArrayIndexGetPart03Test (70 scenarios -> 7 cases, each <=10)
export default function sparseArrayIndexGetPartTest(): void {
  describe('SparseArrayIndexGetPartTest', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_GET_PART_0100
     * @tc.name sparseArrayIndexGetPartTest001
     * @tc.desc indexGet bracket positive read: int & double values (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayIndexGetPartTest001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. arr[0]=42 on len=10 sparse@{0} -> 42
      const arr1 = new SparseArray<int>(10);
      arr1[0] = 42;
      expect(arr1[0]!).assertEqual(42);
      // 2. arr[0]=INT_MAX(2147483647) on len=5 sparse@{0} -> 2147483647
      const INT_MAX2: int = 2147483647;
      const arr2 = new SparseArray<int>(5);
      arr2[0] = INT_MAX2;
      expect(arr2[0]!).assertEqual(INT_MAX2);
      // 3. arr[0]=INT_MIN(-2147483648) on len=5 sparse@{0} -> -2147483648
      const INT_MIN3: int = -2147483647 - 1;
      const arr3 = new SparseArray<int>(5);
      arr3[0] = INT_MIN3;
      expect(arr3[0]!).assertEqual(INT_MIN3);
      // 4. arr[0]=3.14 on len=3 sparse@{0} -> 3.14
      const arr4 = new SparseArray<double>(3);
      arr4[0] = 3.14;
      expect(arr4[0]!).assertEqual(3.14);
      // 5. arr[0]=-0.0 on len=3 sparse@{0} -> 1/v is -Infinity
      const arr5 = new SparseArray<double>(3);
      arr5[0] = -0.0;
      const v5 = arr5[0]!;
      let actual5: number = 1.0 / v5;
      let expected5: number = Double.NEGATIVE_INFINITY;
      expect(actual5).assertEqual(expected5);
      // 6. arr[0]=NaN on len=3 sparse@{0} -> isNaN true
      const arr6 = new SparseArray<double>(3);
      arr6[0] = Double.NaN;
      const v6 = arr6[0]!;
      let actual6: boolean = isNaN(v6);
      expect(actual6).assertTrue();
      // 7. arr[0]=Infinity on len=3 sparse@{0} -> Infinity
      const arr7 = new SparseArray<double>(3);
      arr7[0] = Double.POSITIVE_INFINITY;
      expect(arr7[0]!).assertEqual(Double.POSITIVE_INFINITY);
      // 8. arr[0]=-Infinity on len=3 sparse@{0} -> -Infinity
      const arr8 = new SparseArray<double>(3);
      arr8[0] = Double.NEGATIVE_INFINITY;
      expect(arr8[0]!).assertEqual(Double.NEGATIVE_INFINITY);
      // 9. arr[0]=Number.MAX_VALUE on len=3 sparse@{0} -> Number.MAX_VALUE
      const arr9 = new SparseArray<double>(3);
      arr9[0] = Number.MAX_VALUE;
      expect(arr9[0]!).assertEqual(Number.MAX_VALUE);
      // 10. arr[0]=0n on len=3 sparse@{0} -> 0n
      const arr10 = new SparseArray<bigint>(3);
      arr10[0] = 0n;
      expect(arr10[0]!).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_GET_PART_0200
     * @tc.name sparseArrayIndexGetPartTest002
     * @tc.desc indexGet bracket positive read: bigint/long/Date/string/boolean (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayIndexGetPartTest002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. arr[0]=bigint MAX on len=3 sparse@{0} -> bigint MAX
      const BIGINT_MAX1: bigint = 9223372036854775807n;
      const arr1 = new SparseArray<bigint>(3);
      arr1[0] = BIGINT_MAX1;
      expect(arr1[0]!).assertEqual(BIGINT_MAX1);
      // 2. arr[0]=0 as long on len=3 sparse@{0} -> 0 as long
      const arr2 = new SparseArray<long>(3);
      arr2[0] = 0 as long;
      expect(arr2[0]!).assertEqual(0 as long);
      // 3. arr[0]=long MAX on len=3 sparse@{0} -> long MAX
      const LARGE_LONG3: long = 9223372036854775807 as long;
      const arr3 = new SparseArray<long>(3);
      arr3[0] = LARGE_LONG3;
      expect(arr3[0]!).assertEqual(LARGE_LONG3);
      // 4. arr[0]=Date(0) on len=3 sparse@{0} -> getTime equal
      const dateA: Date = new Date(0);
      const arr4 = new SparseArray<Date>(3);
      arr4[0] = dateA;
      expect(arr4[0]!.getTime()).assertEqual(dateA.getTime());
      // 5. arr[0]=Date(5000) on SparseArray(d) -> equal d
      const dateB: Date = new Date(5000);
      const arr5 = new SparseArray<Date>(dateB);
      expect(arr5[0]!).assertEqual(dateB);
      // 6. arr[0]=true on len=3 sparse@{0} -> true
      const arr6 = new SparseArray<boolean>(3);
      arr6[0] = true;
      expect(arr6[0]!).assertTrue();
      // 7. arr[0]=false on len=3 sparse@{0} -> false
      const arr7 = new SparseArray<boolean>(3);
      arr7[0] = false;
      expect(arr7[0]!).assertFalse();
      // 8. arr[0]='hello' on len=3 sparse@{0} -> 'hello'
      const arr8 = new SparseArray<string>(3);
      arr8[0] = 'hello';
      expect(arr8[0]!).assertEqual('hello');
      // 9. arr[0]='😀' on len=3 sparse@{0} -> '😀'
      const arr9 = new SparseArray<string>(3);
      arr9[0] = '😀';
      expect(arr9[0]!).assertEqual('😀');
      // 10. arr[0]='中文' on len=3 sparse@{0} -> '中文'
      const arr10 = new SparseArray<string>(3);
      arr10[0] = '中文';
      expect(arr10[0]!).assertEqual('中文');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_GET_PART_0300
     * @tc.name sparseArrayIndexGetPartTest003
     * @tc.desc indexGet bracket string special chars & empty/sparse-hole undefined (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayIndexGetPartTest003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. arr[0]='\0' on len=3 sparse@{0} -> '\0'
      const nullChar1: string = '\0';
      const arr1 = new SparseArray<string>(3);
      arr1[0] = nullChar1;
      expect(arr1[0]!).assertEqual(nullChar1);
      // 2. arr[0]='\t\n' on len=3 sparse@{0} -> '\t\n'
      const arr2 = new SparseArray<string>(3);
      arr2[0] = '\t\n';
      expect(arr2[0]!).assertEqual('\t\n');
      // 3. arr[0] on new SparseArray<int>(3) -> undefined
      const arr3 = new SparseArray<int>(3);
      expect(arr3[0]).assertUndefined();
      // 4. arr[2] on len=5 sparse@{0,1} -> undefined
      const arr4 = new SparseArray<int>(5);
      arr4[0] = 10;
      arr4[1] = 20;
      expect(arr4[2]).assertUndefined();
      // 5. arr[4] after length=6 on len=3 sparse@{0} -> undefined
      const arr5 = new SparseArray<int>(3);
      arr5[0] = 1;
      arr5.length = 6;
      expect(arr5[4]).assertUndefined();
      // 6. arr[0] after length 0 then 5 on len=5 sparse@{0} -> undefined
      const arr6 = new SparseArray<int>(5);
      arr6[0] = 99;
      arr6.length = 0;
      arr6.length = 5;
      expect(arr6[0]).assertUndefined();
      // 7. arr[0] on new SparseArray<string>(2) -> undefined
      const arr7 = new SparseArray<string>(2);
      expect(arr7[0]).assertUndefined();
      // 8. arr[0] on new SparseArray<double>(1) -> undefined
      const arr8 = new SparseArray<double>(1);
      expect(arr8[0]).assertUndefined();
      // 9. arr[0] on new SparseArray<Date>(2) -> undefined
      const arr9 = new SparseArray<Date>(2);
      expect(arr9[0]).assertUndefined();
      // 10. arr[0] on new SparseArray<boolean>(2) -> undefined
      const arr10 = new SparseArray<boolean>(2);
      expect(arr10[0]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_GET_PART_0400
     * @tc.name sparseArrayIndexGetPartTest004
     * @tc.desc indexGet bracket out-of-bounds & int-extreme index -> undefined (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayIndexGetPartTest004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. arr[3] on len=3 sparse@{0,1,2} -> undefined
      const arr1 = new SparseArray<int>(3);
      arr1[0] = 10;
      arr1[1] = 20;
      arr1[2] = 30;
      expect(arr1[3]).assertUndefined();
      // 2. arr[4] on len=3 sparse@{0} -> undefined
      const arr2 = new SparseArray<int>(3);
      arr2[0] = 10;
      expect(arr2[4]).assertUndefined();
      // 3. arr[INT_MAX] on len=3 sparse@{0} -> undefined
      const INT_MAX3: int = 2147483647;
      const arr3 = new SparseArray<int>(3);
      arr3[0] = 10;
      expect(arr3[INT_MAX3]).assertUndefined();
      // 4. arr[3] after length=2 on len=5 sparse@{0..4} -> undefined
      const arr4 = new SparseArray<int>(5);
      arr4[0] = 10;
      arr4[1] = 20;
      arr4[2] = 30;
      arr4[3] = 40;
      arr4[4] = 50;
      arr4.length = 2;
      expect(arr4[3]).assertUndefined();
      // 5. arr[0] on empty -> undefined
      const arr5 = new SparseArray<int>();
      expect(arr5[0]).assertUndefined();
      // 6. arr[INT_MAX] on empty -> undefined
      const INT_MAX6: int = 2147483647;
      const arr6 = new SparseArray<int>();
      expect(arr6[INT_MAX6]).assertUndefined();
      // 7. arr[2] on len=2 string sparse@{0,1} -> undefined
      const arr7 = new SparseArray<string>(2);
      arr7[0] = 'a';
      arr7[1] = 'b';
      expect(arr7[2]).assertUndefined();
      // 8. arr[3] on len=2 string sparse@{0} -> undefined
      const arr8 = new SparseArray<string>(2);
      arr8[0] = 'x';
      expect(arr8[3]).assertUndefined();
      // 9. arr[2] on len=2 double sparse@{0,1} -> undefined
      const arr9 = new SparseArray<double>(2);
      arr9[0] = 1.5;
      arr9[1] = 2.5;
      expect(arr9[2]).assertUndefined();
      // 10. arr[INT_MIN] on len=3 sparse@{0} -> undefined
      const INT_MIN10: int = -2147483647 - 1;
      const arr10 = new SparseArray<int>(3);
      arr10[0] = 10;
      expect(arr10[INT_MIN10]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_GET_PART_0500
     * @tc.name sparseArrayIndexGetPartTest005
     * @tc.desc indexGet bracket & $_get negative index -> undefined (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayIndexGetPartTest005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. arr[-5] on len=5 sparse@{0} -> undefined
      const arr1 = new SparseArray<int>(5);
      arr1[0] = 42;
      const NEG_LEN1: int = -5;
      expect(arr1[NEG_LEN1]).assertUndefined();
      // 2. arr[-1] on len=2 double sparse@{0} -> undefined
      const arr2 = new SparseArray<double>(2);
      arr2[0] = 3.14;
      expect(arr2[-1]).assertUndefined();
      // 3. arr[-1] on len=2 boolean sparse@{0} -> undefined
      const arr3 = new SparseArray<boolean>(2);
      arr3[0] = true;
      expect(arr3[-1]).assertUndefined();
      // 4. arr[-1] on len=2 bigint sparse@{0} -> undefined
      const arr4 = new SparseArray<bigint>(2);
      arr4[0] = 100n;
      expect(arr4[-1]).assertUndefined();
      // 5. arr[-1] on len=2 Date sparse@{0} -> undefined
      const arr5 = new SparseArray<Date>(2);
      arr5[0] = new Date(0);
      expect(arr5[-1]).assertUndefined();
      // 6. $_get(-1) on SparseArray(42) -> undefined
      const arr6 = new SparseArray<int>(42);
      const result6 = arr6.$_get(-1);
      expect(result6).assertUndefined();
      // 7. $_get(-1) on len=5 sparse@{0,4} -> undefined
      const arr7 = new SparseArray<int>(5);
      arr7[0] = 10;
      arr7[4] = 20;
      const result7 = arr7.$_get(-1);
      expect(result7).assertUndefined();
      // 8. $_get(-2) on (10,20,30,40) -> undefined
      const arr8 = new SparseArray<int>(10, 20, 30, 40);
      const result8 = arr8.$_get(-2);
      expect(result8).assertUndefined();
      // 9. $_get(-length) on (1,2,3) -> undefined
      const arr9 = new SparseArray<int>(1, 2, 3);
      const negLen9 = -arr9.length;
      const result9 = arr9.$_get(negLen9);
      expect(result9).assertUndefined();
      // 10. $_get(-length-1) on (1,2,3) -> undefined
      const arr10 = new SparseArray<int>(1, 2, 3);
      const negLenMinusOne10 = -arr10.length - 1;
      const result10 = arr10.$_get(negLenMinusOne10);
      expect(result10).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_GET_PART_0600
     * @tc.name sparseArrayIndexGetPartTest006
     * @tc.desc $_get length/oob & sparse-hole & typeof undefined (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayIndexGetPartTest006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. $_get(-100) on (1,2,3) -> undefined
      const arr1 = new SparseArray<int>(1, 2, 3);
      const result1 = arr1.$_get(-100);
      expect(result1).assertUndefined();
      // 2. $_get(length=0) on empty -> undefined
      const arr2 = new SparseArray<int>();
      const len2 = arr2.length;
      const result2 = arr2.$_get(len2);
      expect(result2).assertUndefined();
      // 3. $_get(length) on SparseArray(42) -> undefined
      const arr3 = new SparseArray<int>(42);
      const len3 = arr3.length;
      const result3 = arr3.$_get(len3);
      expect(result3).assertUndefined();
      // 4. $_get(length+1) on empty -> undefined
      const arr4 = new SparseArray<int>();
      const len4 = arr4.length;
      const result4 = arr4.$_get(len4 + 1);
      expect(result4).assertUndefined();
      // 5. $_get(length+5) on (1,2) -> undefined
      const arr5 = new SparseArray<int>(1, 2);
      const len5 = arr5.length;
      const result5 = arr5.$_get(len5 + 5);
      expect(result5).assertUndefined();
      // 6. $_get(0) on empty -> typeof 'undefined'
      const arr6 = new SparseArray<int>();
      const result6 = arr6.$_get(0);
      let actual6: string = typeof result6;
      let expected6: string = 'undefined';
      expect(actual6).assertEqual(expected6);
      // 7. $_get(0)/-1/100 on empty keeps length 0
      const arr7 = new SparseArray<int>();
      const r7a = arr7.$_get(0);
      const r7b = arr7.$_get(-1);
      const r7c = arr7.$_get(100);
      expect(r7a).assertUndefined();
      expect(r7b).assertUndefined();
      expect(r7c).assertUndefined();
      let actual7: int = arr7.length;
      let expected7: int = 0;
      expect(actual7).assertEqual(expected7);
      // 8. $_get(1) on SparseArray('only') -> typeof 'undefined'
      const arr8 = new SparseArray<string>('only');
      const result8 = arr8.$_get(1);
      let actual8: string = typeof result8;
      let expected8: string = 'undefined';
      expect(actual8).assertEqual(expected8);
      // 9. $_get(length) on (true,true,true) -> undefined
      const arr9 = new SparseArray<boolean>(true, true, true);
      const len9 = arr9.length;
      const result9 = arr9.$_get(len9);
      expect(result9).assertUndefined();
      // 10. $_get(1) on len=5 sparse@{0,2,4} -> undefined
      const arr10 = new SparseArray<int>(5);
      arr10[0] = 100;
      arr10[2] = 200;
      arr10[4] = 300;
      const result10 = arr10.$_get(1);
      expect(result10).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_GET_PART_0700
     * @tc.name sparseArrayIndexGetPartTest007
     * @tc.desc $_get length-setter, push & mutation-safety parity (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayIndexGetPartTest007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. $_get(1)/2/3 on len=5 sparse@{0,4} -> undefined
      const arr1 = new SparseArray<int>(5);
      arr1[0] = 1;
      arr1[4] = 5;
      const r1a = arr1.$_get(1);
      const r1b = arr1.$_get(2);
      const r1c = arr1.$_get(3);
      expect(r1a).assertUndefined();
      expect(r1b).assertUndefined();
      expect(r1c).assertUndefined();
      // 2. $_get(length-1) on len=4 sparse(empty) -> undefined
      const arr2 = new SparseArray<int>(4);
      const lastIdx2 = arr2.length - 1;
      const result2 = arr2.$_get(lastIdx2);
      expect(result2).assertUndefined();
      // 3. $_get(3) after length=5 on (1,2) -> undefined
      const arr3 = new SparseArray<int>(1, 2);
      arr3.length = 5;
      const result3 = arr3.$_get(3);
      expect(result3).assertUndefined();
      // 4. $_get(1) on len=3 string sparse@{0,2} -> typeof 'undefined'
      const arr4 = new SparseArray<string>(3);
      arr4[0] = 'A';
      arr4[2] = 'C';
      const result4 = arr4.$_get(1);
      let actual4: string = typeof result4;
      let expected4: string = 'undefined';
      expect(actual4).assertEqual(expected4);
      // 5. $_get(3) after length=2 on (10,20,30,40,50) -> undefined
      const arr5 = new SparseArray<int>(10, 20, 30, 40, 50);
      arr5.length = 2;
      const result5 = arr5.$_get(3);
      expect(result5).assertUndefined();
      // 6. $_get(2) after push(3) on (1,2) -> 3
      const arr6 = new SparseArray<int>(1, 2);
      arr6.push(3);
      const result6 = arr6.$_get(2);
      expect(result6).assertEqual(3);
      // 7. $_get(length) after push(3) on (1,2) -> undefined
      const arr7 = new SparseArray<int>(1, 2);
      arr7.push(3);
      const len7 = arr7.length;
      const result7 = arr7.$_get(len7);
      expect(result7).assertUndefined();
      // 8. $_get(100)/-50 on (1,2,3) -> undefined
      const arr8 = new SparseArray<int>(1, 2, 3);
      const r8a = arr8.$_get(100);
      const r8b = arr8.$_get(-50);
      expect(r8a).assertUndefined();
      expect(r8b).assertUndefined();
      // 9. $_get(0)/10/-5/INT_MAX on empty keeps length 0
      const arr9 = new SparseArray<int>();
      const r9a = arr9.$_get(0);
      const r9b = arr9.$_get(10);
      const r9c = arr9.$_get(-5);
      const r9d = arr9.$_get(2147483647);
      expect(r9a).assertUndefined();
      expect(r9b).assertUndefined();
      expect(r9c).assertUndefined();
      expect(r9d).assertUndefined();
      let actual9: int = arr9.length;
      let expected9: int = 0;
      expect(actual9).assertEqual(expected9);
      // 10. $_get(100)/-1/INT_MAX no mutation; $_get(0..4) still 10..50
      const arr10 = new SparseArray<int>(10, 20, 30, 40, 50);
      arr10.$_get(100);
      arr10.$_get(-1);
      arr10.$_get(2147483647);
      let actual10a = arr10.$_get(0);
      let expected10a: int = 10;
      expect(actual10a).assertEqual(expected10a);
      let actual10b = arr10.$_get(1);
      let expected10b: int = 20;
      expect(actual10b).assertEqual(expected10b);
      let actual10c = arr10.$_get(2);
      let expected10c: int = 30;
      expect(actual10c).assertEqual(expected10c);
      let actual10d = arr10.$_get(3);
      let expected10d: int = 40;
      expect(actual10d).assertEqual(expected10d);
      let actual10e = arr10.$_get(4);
      let expected10e: int = 50;
      expect(actual10e).assertEqual(expected10e);
    });
  });
}
