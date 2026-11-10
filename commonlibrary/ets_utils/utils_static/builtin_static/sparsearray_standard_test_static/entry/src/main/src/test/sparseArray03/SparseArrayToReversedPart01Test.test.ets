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

interface ObjItem {
  id: int;
}

// Merged from SparseArrayToReversedPart01Test (23 scenarios -> 3 cases, each <=10)
export default function sparseArrayToReversedTestPart01(): void {
  describe("SparseArrayToReversedTestPart01", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_PART01_0100
     * @tc.name sparseArrayToReversedTestPart01001
     * @tc.desc toReversed returns new reversed copy, source unchanged (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayToReversedTestPart01001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. toReversed on ('中文','测试','hello') -> ['hello','测试','中文']
      const arr1 = new SparseArray<string>('中文', '测试', 'hello');
      const res1 = arr1.toReversed();
      expect(res1[0]).assertEqual('hello');
      expect(res1[1]).assertEqual('测试');
      expect(res1[2]).assertEqual('中文');
      // 2. toReversed on ('start',LONG_STR,'end') -> ['end',LONG_STR,'start'] with 200x repeated payload
      const LONG_STR: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'.repeat(200);
      const arr2 = new SparseArray<string>('start', LONG_STR, 'end');
      const res2 = arr2.toReversed();
      expect(res2[0]).assertEqual('end');
      expect(res2[1]).assertEqual(LONG_STR);
      expect(res2[2]).assertEqual('start');
      // 3. toReversed on push(1,2,3) -> length 3
      const arr3 = new SparseArray<int>();
      arr3.push(1);
      arr3.push(2);
      arr3.push(3);
      const res3 = arr3.toReversed();
      expect(res3.length).assertEqual(3);
      // 4. toReversed on (10,20,30,40,50) -> result[0]=50, result[4]=10
      const arr4 = new SparseArray<int>(10, 20, 30, 40, 50);
      const res4 = arr4.toReversed();
      expect(res4[0]).assertEqual(50);
      expect(res4[4]).assertEqual(10);
      // 5. toReversed on ('x','') -> ['','x']
      const arr5 = new SparseArray<string>('x', '');
      const res5 = arr5.toReversed();
      expect(res5[0]).assertEqual('');
      expect(res5[1]).assertEqual('x');
      // 6. toReversed on ('a\nb','c\td') -> ['c\td','a\nb']
      const arr6 = new SparseArray<string>('a\nb', 'c\td');
      const res6 = arr6.toReversed();
      expect(res6[0]).assertEqual('c\td');
      expect(res6[1]).assertEqual('a\nb');
      // 7. toReversed on (2147483647,2,1) -> [1,2,2147483647], length 3, source[0] unchanged
      const arr7 = new SparseArray<int>(2147483647, 2, 1);
      const res7 = arr7.toReversed();
      expect(res7.length).assertEqual(3);
      expect(res7[0]).assertEqual(1);
      expect(res7[1]).assertEqual(2);
      expect(res7[2]).assertEqual(2147483647);
      expect(arr7[0]).assertEqual(2147483647);
      // 8. toReversed on (10,20,30,40) -> [40,30,20,10], length 4
      const arr8 = new SparseArray<int>(10, 20, 30, 40);
      const res8 = arr8.toReversed();
      expect(res8.length).assertEqual(4);
      expect(res8[0]).assertEqual(40);
      expect(res8[1]).assertEqual(30);
      expect(res8[2]).assertEqual(20);
      expect(res8[3]).assertEqual(10);
      // 9. toReversed on ('1','2','3') -> ['3','2','1'] no numeric conversion
      const arr9 = new SparseArray<string>('1', '2', '3');
      const res9 = arr9.toReversed();
      expect(res9[0]).assertEqual('3');
      expect(res9[1]).assertEqual('2');
      expect(res9[2]).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_PART01_0200
     * @tc.name sparseArrayToReversedTestPart01002
     * @tc.desc toReversed on typed arrays (5 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayToReversedTestPart01002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. toReversed on boolean (true,false,true) -> [true,false,true]
      const arr1 = new SparseArray<boolean>(true, false, true);
      const res1 = arr1.toReversed();
      expect(res1[0]).assertTrue();
      expect(res1[1]).assertFalse();
      expect(res1[2]).assertTrue();
      // 2. toReversed on double (1.0,NaN,3.0) -> [3.0,NaN,1.0] with middle element isNaN
      const arr2 = new SparseArray<double>(1.0, Double.NaN, 3.0);
      const res2 = arr2.toReversed();
      expect(res2[0]).assertEqual(3.0);
      expect(res2[2]).assertEqual(1.0);
      expect(isNaN(res2[1]!)).assertTrue();
      // 3. toReversed on double (1.1,2.2,3.3) -> [3.3,2.2,1.1]
      const arr3 = new SparseArray<double>(1.1, 2.2, 3.3);
      const res3 = arr3.toReversed();
      expect(res3[0]).assertEqual(3.3);
      expect(res3[1]).assertEqual(2.2);
      expect(res3[2]).assertEqual(1.1);
      // 4. toReversed on SparseArray<ObjItem> keeps object references (result[0]===o3, [1]===o2, [2]===o1)
      const o1: ObjItem = { id: 1 };
      const o2: ObjItem = { id: 2 };
      const o3: ObjItem = { id: 3 };
      const arr4 = new SparseArray<ObjItem>(o1, o2, o3);
      const res4 = arr4.toReversed();
      expect(res4[0] === o3).assertTrue();
      expect(res4[1] === o2).assertTrue();
      expect(res4[2] === o1).assertTrue();
      // 5. toReversed on bigint (100n,200n,300n) -> [300n,200n,100n]
      const arr5 = new SparseArray<bigint>(100n, 200n, 300n);
      const res5 = arr5.toReversed();
      expect(res5[0]).assertEqual(300n);
      expect(res5[1]).assertEqual(200n);
      expect(res5[2]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_REVERSED_PART01_0300
     * @tc.name sparseArrayToReversedTestPart01003
     * @tc.desc toReversed on empty/single/sparse & new-instance independence (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayToReversedTestPart01003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. toReversed on empty SparseArray returns a distinct new array (result === arr is false)
      const arr1 = new SparseArray<int>();
      const res1 = arr1.toReversed();
      expect(res1 === arr1).assertFalse();
      // 2. calling toReversed twice on (1,2,3) returns two distinct arrays (r1 === r2 is false)
      const arr2 = new SparseArray<int>(1, 2, 3);
      const res2a = arr2.toReversed();
      const res2b = arr2.toReversed();
      expect(res2a === res2b).assertFalse();
      // 3. toReversed on len-4 sparse {0,1,2} -> result[0] undefined, [300,200,100] at indexes 1,2,3
      const arr3 = new SparseArray<int>(4);
      arr3[0] = 100;
      arr3[1] = 200;
      arr3[2] = 300;
      const res3 = arr3.toReversed();
      expect(res3[0]).assertUndefined();
      expect(res3[1]).assertEqual(300);
      expect(res3[2]).assertEqual(200);
      expect(res3[3]).assertEqual(100);
      // 4. toReversed on SparseArray.of<int>(42) -> result[0]=42
      const arr4 = SparseArray.of<int>(42);
      const res4 = arr4.toReversed();
      expect(res4[0]).assertEqual(42);
      // 5. toReversed on len-3 filled only at index 2 -> result[0]=300, [1],[2] undefined
      const arr5 = new SparseArray<int>(3);
      arr5[2] = 300;
      const res5 = arr5.toReversed();
      expect(res5[0]).assertEqual(300);
      expect(res5[1]).assertUndefined();
      expect(res5[2]).assertUndefined();
      // 6. calling toReversed twice on (1,2,3) -> each returns [3,2,1] independently
      const arr6 = new SparseArray<int>(1, 2, 3);
      const res6a = arr6.toReversed();
      const res6b = arr6.toReversed();
      expect(res6a[0]).assertEqual(3);
      expect(res6b[0]).assertEqual(3);
      expect(res6a[2]).assertEqual(1);
      expect(res6b[2]).assertEqual(1);
      // 7. toReversed returns independent array: overwrite result[0]=99 leaves source[2]=3 unchanged
      const arr7 = new SparseArray<int>(1, 2, 3);
      const res7 = arr7.toReversed();
      res7[0] = 99;
      expect(res7[0]).assertEqual(99);
      expect(arr7[2]).assertEqual(3);
      // 8. toReversed on len-1 all-hole SparseArray<int>(1) -> length 1, result[0] undefined
      const arr8 = new SparseArray<int>(1);
      const res8 = arr8.toReversed();
      expect(res8.length).assertEqual(1);
      expect(res8[0]).assertUndefined();
      // 9. toReversed on len-3 filled only at middle index 1 -> result[0] undef, [1]=2, [2] undef
      const arr9 = new SparseArray<int>(3);
      arr9[1] = 2;
      const res9 = arr9.toReversed();
      expect(res9[0]).assertUndefined();
      expect(res9[1]).assertEqual(2);
      expect(res9[2]).assertUndefined();
    });
  });
}
