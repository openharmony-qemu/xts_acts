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

// Merged within SparseArrayToStringPart01Test (20 scenarios -> 2 cases, each <=10)
export default function sparseArrayToStringTestPart01(): void {
  describe('SparseArrayToStringTestPart01', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_PART01_0100
     * @tc.name sparseArrayToStringTestPart01001
     * @tc.desc toString returns comma-joined string & typed values (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayToStringTestPart01001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. toString on (foo,bar,baz) -> "foo,bar,baz"
      const arr1 = new SparseArray<string>('foo', 'bar', 'baz');
      expect(arr1.toString()).assertEqual('foo,bar,baz');
      // 2. toString on emoji (😀,🚀) -> "😀,🚀"
      const arr2 = new SparseArray<string>('😀', '🚀');
      expect(arr2.toString()).assertEqual('😀,🚀');
      // 3. toString on (\t,\n) -> "\t,\n"
      const arr3 = new SparseArray<string>('\t', '\n');
      expect(arr3.toString()).assertEqual('\t,\n');
      // 4. toString on (-1,-2) -> "-1,-2"
      const arr4 = new SparseArray<int>(-1, -2);
      expect(arr4.toString()).assertEqual('-1,-2');
      // 5. toString on (1,22,333) -> "1,22,333" (length 8)
      const arr5 = new SparseArray<int>(1, 22, 333);
      expect(arr5.toString()).assertEqual('1,22,333');
      expect(arr5.toString().length).assertEqual(8);
      // 6. toString on single "a,b" -> "a,b" (comma inside element unescaped)
      const arr6 = new SparseArray<string>('a,b');
      expect(arr6.toString()).assertEqual('a,b');
      // 7. toString on double (3.14) -> "3.14"
      const arr7 = new SparseArray<double>(3.14);
      expect(arr7.toString()).assertEqual('3.14');
      // 8. toString on bigint (100n,200n) -> "100,200"
      const arr8 = new SparseArray<bigint>(100n, 200n);
      expect(arr8.toString()).assertEqual('100,200');
      const dateA: Date = new Date(0);
      const dateB: Date = new Date(1000);
      const arr9 = new SparseArray<Date>(dateA, dateB);
      expect(arr9.toString()).assertEqual(dateA.toString() + ',' + dateB.toString());
      // 10. toString after push(7) on empty -> "7"
      const arr10 = new SparseArray<int>();
      arr10.push(7);
      expect(arr10.toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_PART01_0200
     * @tc.name sparseArrayToStringTestPart01002
     * @tc.desc toString on sparse-holes, empty & special values (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayToStringTestPart01002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. toString on len-2 string {0} hole at 1 -> "a,"
      const arr1 = new SparseArray<string>(2);
      arr1[0] = 'a';
      expect(arr1.toString()).assertEqual('a,');
      // 2. toString on len-4 int {0,2,3} hole at 1 -> "10,,30,40"
      const arr2 = new SparseArray<int>(4);
      arr2[0] = 10;
      arr2[2] = 30;
      arr2[3] = 40;
      expect(arr2.toString()).assertEqual('10,,30,40');
      // 3. toString on len-5 int {0,4} -> "1,,,,5"
      const arr3 = new SparseArray<int>(5);
      arr3[0] = 1;
      arr3[4] = 5;
      expect(arr3.toString()).assertEqual('1,,,,5');
      // 4. toString on len-3 int {1,2} leading hole -> ",2,3"
      const arr4 = new SparseArray<int>(3);
      arr4[1] = 2;
      arr4[2] = 3;
      expect(arr4.toString()).assertEqual(',2,3');
      // 5. toString on len-3 int all holes -> ",,"
      const arr5 = new SparseArray<int>(3);
      expect(arr5.toString()).assertEqual(',,');
      // 6. toString on ("",'x') empty-like -> ",x"
      const arr6 = new SparseArray<string>('', 'x');
      expect(arr6.toString()).assertEqual(',x');
      // 7. toString on double (0.0) -> "0"
      const arr7 = new SparseArray<double>(0.0);
      expect(arr7.toString()).assertEqual('0');
      // 8. toString on double (-Infinity) -> "-Infinity"
      const arr8 = new SparseArray<double>(-Double.POSITIVE_INFINITY);
      expect(arr8.toString()).assertEqual('-Infinity');
      // 9. toString on double (NaN) -> "NaN"
      const arr9 = new SparseArray<double>(Number.NaN);
      expect(arr9.toString()).assertEqual('NaN');
      // 10. toString on double (Infinity) -> "Infinity"
      const arr10 = new SparseArray<double>(Double.POSITIVE_INFINITY);
      expect(arr10.toString()).assertEqual('Infinity');
    });
  });
}
