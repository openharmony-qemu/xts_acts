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
  beforeAll,
  beforeEach,
  afterEach,

  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from "@ohos/hypium-static/src/main/indexStatic";
import Utils from "../Util.test";

export default function sparseArrayOfTestPart01(): void {
  describe("SparseArrayOfTestPart01", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_PART01_0100
     * @tc.name sparseArrayOfTestPart01001
     * @tc.desc of() empty & single-arg typed elements (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayOfTestPart01001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. of<double>() with no args -> length 0, arr[0] undefined
      const arr1 = SparseArray.of<double>();
      expect(arr1.length).assertEqual(0);
      expect(arr1[0]).assertUndefined();
      // 2. of<RegExp>() with no args -> length 0, values()/entries() iterators done
      const arr2 = SparseArray.of<RegExp>();
      expect(arr2.length).assertEqual(0);
      expect(arr2.values().next().done).assertTrue();
      expect(arr2.entries().next().done).assertTrue();
      // 3. of<string>() with no args -> arr[0] undefined
      const arr3 = SparseArray.of<string>();
      expect(arr3[0]).assertUndefined();
      // 4. of<byte>(0x7f) -> length 1, arr[0] equals 127
      const arr4 = SparseArray.of<byte>(0x7f as byte);
      expect(arr4.length).assertEqual(1);
      expect(arr4[0] as byte).assertEqual(127 as byte);
      // 5. of<double>(3.14) -> length 1, arr[0] equals 3.14
      const arr5 = SparseArray.of<double>(3.14);
      expect(arr5.length).assertEqual(1);
      expect(arr5[0]!).assertEqual(3.14);
      // 6. of<char>('A'.charAt(0)) -> length 1, arr[0] equals 'A'
      const arr6 = SparseArray.of<char>('A'.charAt(0));
      expect(arr6.length).assertEqual(1);
      expect(arr6[0]!).assertEqual('A'.charAt(0));
      // 7. of<boolean>(true) -> length 1, arr[0] is true
      const arr7 = SparseArray.of<boolean>(true);
      expect(arr7.length).assertEqual(1);
      expect(arr7[0]!).assertTrue();
      // 8. of<int>(-2147483647-1) INT_MIN -> length 1, arr[0] equals -2147483648
      const arr8 = SparseArray.of<int>(-2147483647 - 1);
      expect(arr8.length).assertEqual(1);
      expect(arr8[0]!).assertEqual(-2147483648);
      // 9. of<int>(2147483647) INT_MAX -> length 1, arr[0] equals 2147483647
      const arr9 = SparseArray.of<int>(2147483647);
      expect(arr9.length).assertEqual(1);
      expect(arr9[0]!).assertEqual(2147483647);
      // 10. of<double>(1.5, 2.5) -> length 2
      const arr10 = SparseArray.of<double>(1.5, 2.5);
      expect(arr10.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_PART01_0200
     * @tc.name sparseArrayOfTestPart01002
     * @tc.desc of() multi-arg typed elements across types (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayOfTestPart01002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. of<float>(0.0, -3.14, 2.71) -> length 3, values preserved in order
      const arr1 = SparseArray.of<float>(0.0 as float, -3.14 as float, 2.71 as float);
      expect(arr1.length).assertEqual(3);
      expect(arr1[0] as float).assertEqual(0.0 as float);
      expect(arr1[1] as float).assertEqual(-3.14 as float);
      expect(arr1[2] as float).assertEqual(2.71 as float);
      // 2. of<int>(8,3,15,1,7,12,4,19) -> length 8, arr[0]=8, arr[3]=1, arr[7]=19
      const arr2 = SparseArray.of<int>(8, 3, 15, 1, 7, 12, 4, 19);
      expect(arr2.length).assertEqual(8);
      expect(arr2[0]!).assertEqual(8);
      expect(arr2[3]!).assertEqual(1);
      expect(arr2[7]!).assertEqual(19);
      // 3. of<string>('a','b','c','d') -> length 4
      const arr3 = SparseArray.of<string>('a', 'b', 'c', 'd');
      expect(arr3.length).assertEqual(4);
      // 4. of<string>("","","") -> length 3, arr[0] and arr[2] equal ''
      const arr4 = SparseArray.of<string>("", "", "");
      expect(arr4.length).assertEqual(3);
      expect(arr4[0]!).assertEqual('');
      expect(arr4[2]!).assertEqual('');
      // 5. of<double>(0.0..9.9) -> length 10, arr[0]=0.0, arr[9]=9.9
      const arr5 = SparseArray.of<double>(0.0, 1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, 9.9);
      expect(arr5.length).assertEqual(10);
      expect(arr5[0]!).assertEqual(0.0);
      expect(arr5[9]!).assertEqual(9.9);
      // 6. of<boolean>(alternating x10) -> length 10, arr[0] true, arr[1] false, arr[9] false
      const arr6 = SparseArray.of<boolean>(true, false, true, false, true, false, true, false, true, false);
      expect(arr6.length).assertEqual(10);
      expect(arr6[0]!).assertTrue();
      expect(arr6[1]!).assertFalse();
      expect(arr6[9]!).assertFalse();
      // 7. of<bigint>(100n, 200n) -> length 2, arr[0]=100n, arr[1]=200n
      const arr7 = SparseArray.of<bigint>(100n, 200n);
      expect(arr7.length).assertEqual(2);
      expect(arr7[0]!).assertEqual(100n);
      expect(arr7[1]!).assertEqual(200n);
      // 8. of<int>(-1, 0, 1) -> arr[0]=-1, arr[1]=0, arr[2]=1
      const arr8 = SparseArray.of<int>(-1, 0, 1);
      expect(arr8[0]!).assertEqual(-1);
      expect(arr8[1]!).assertEqual(0);
      expect(arr8[2]!).assertEqual(1);
      // 9. of<string>("aa","bb","aa","cc","bb") -> length 5, no dedup
      const arr9 = SparseArray.of<string>("aa", "bb", "aa", "cc", "bb");
      expect(arr9.length).assertEqual(5);
      expect(arr9[0]!).assertEqual("aa");
      expect(arr9[2]!).assertEqual("aa");
      expect(arr9[4]!).assertEqual("bb");
      // 10. of<int>(4,4,4,4,4) -> length 5, arr[0] and arr[4] equal 4
      const arr10 = SparseArray.of<int>(4, 4, 4, 4, 4);
      expect(arr10.length).assertEqual(5);
      expect(arr10[0]!).assertEqual(4);
      expect(arr10[4]!).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_PART01_0300
     * @tc.name sparseArrayOfTestPart01003
     * @tc.desc of() special values, escape strings & instance behavior (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayOfTestPart01003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. of<double>(Double.POSITIVE_INFINITY) -> arr[0] equals positive infinity
      const arr1 = SparseArray.of<double>(Double.POSITIVE_INFINITY);
      expect(arr1[0]!).assertEqual(Double.POSITIVE_INFINITY);
      // 2. of<double>(Double.NEGATIVE_INFINITY) -> length 1, arr[0] negative infinity
      const arr2 = SparseArray.of<double>(Double.NEGATIVE_INFINITY);
      expect(arr2.length).assertEqual(1);
      expect(arr2[0]).assertNegUnlimited();
      // 3. of<double>(Number.NaN) -> length 1, arr[0] is NaN
      const arr3 = SparseArray.of<double>(Number.NaN);
      expect(arr3.length).assertEqual(1);
      expect(isNaN(arr3[0]!)).assertTrue();
      // 4. of<string>('\n','\t') -> arr[0] equals newline, arr[1] equals tab
      const arr4 = SparseArray.of<string>('\n', '\t');
      expect(arr4[0]!).assertEqual('\n');
      expect(arr4[1]!).assertEqual('\t');
      // 5. of<string>('\u200B' zero-width space) -> length 1
      const arr5 = SparseArray.of<string>('\u200B');
      expect(arr5.length).assertEqual(1);
      // 6. of<string>("a,b") -> arr[0] equals "a,b"
      const arr6 = SparseArray.of<string>("a,b");
      expect(arr6[0]!).assertEqual("a,b");
      // 7. of<string>('😀') -> length 1, arr[0] equals the emoji
      const arr7 = SparseArray.of<string>('😀');
      expect(arr7.length).assertEqual(1);
      expect(arr7[0]!).assertEqual('😀');
      // 8. of<int>(1,2) then arr[0]=99 -> arr[0] overwritten, length stays 2
      const arr8 = SparseArray.of<int>(1, 2);
      arr8[0] = 99;
      expect(arr8[0]!).assertEqual(99);
      expect(arr8.length).assertEqual(2);
      // 9. of<string>('a') then push('b') -> length grows to 2, arr[1] equals 'b'
      const arr9 = SparseArray.of<string>('a');
      arr9.push('b');
      expect(arr9.length).assertEqual(2);
      expect(arr9[1]!).assertEqual('b');
      // 10. two of<int>(1) calls return distinct instances
      const arr10a = SparseArray.of<int>(1);
      const arr10b = SparseArray.of<int>(1);
      expect(arr10a === arr10b).assertFalse();
    });
  });
}
