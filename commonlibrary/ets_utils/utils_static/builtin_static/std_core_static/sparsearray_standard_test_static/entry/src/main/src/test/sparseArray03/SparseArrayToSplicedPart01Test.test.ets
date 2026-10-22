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
} from '../../../../hypium/index';
import Utils from '../Util.test';

// Merged from SparseArrayToSplicedPart01Test (24 scenarios -> 3 cases, each <=10)
export default function sparseArrayToSplicedTestPart01(): void {
  describe('SparseArrayToSplicedTestPart01', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_PART01_0100
     * @tc.name sparseArrayToSplicedTestPart01001
     * @tc.desc toSpliced delete/insert/replace variants (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'sparseArrayToSplicedTestPart01001',
      Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        // 1. toSpliced(0,1,99) on (10,20,30) -> [99,20,30] length 3 replacing first
        const arr1 = new SparseArray<int>(10, 20, 30);
        const r1 = arr1.toSpliced(0, 1, 99);
        expect(r1.length).assertEqual(3);
        expect(r1[0]!).assertEqual(99);
        expect(r1[1]!).assertEqual(20);
        expect(r1[2]!).assertEqual(30);
        // 2. toSpliced(0,0,1,2,3) on (10,20,30) prepends -> length 6 [1,2,3,10,20,30]
        const arr2 = new SparseArray<int>(10, 20, 30);
        const r2 = arr2.toSpliced(0, 0, 1, 2, 3);
        expect(r2.length).assertEqual(6);
        expect(r2[0]!).assertEqual(1);
        expect(r2[1]!).assertEqual(2);
        expect(r2[2]!).assertEqual(3);
        expect(r2[3]!).assertEqual(10);
        expect(r2[4]!).assertEqual(20);
        expect(r2[5]!).assertEqual(30);
        // 3. toSpliced(1,1) on (10,20,30,40,50) removes idx 1 -> [10,30,40,50] length 4
        const arr3 = new SparseArray<int>(10, 20, 30, 40, 50);
        const r3 = arr3.toSpliced(1, 1);
        expect(r3.length).assertEqual(4);
        expect(r3[0]!).assertEqual(10);
        expect(r3[1]!).assertEqual(30);
        expect(r3[2]!).assertEqual(40);
        expect(r3[3]!).assertEqual(50);
        // 4. toSpliced(6,2,77,88) start past end appends -> length 7 with [5]=77 [6]=88
        const arr4 = new SparseArray<int>(10, 20, 30, 40, 50);
        const r4 = arr4.toSpliced(6, 2, 77, 88);
        expect(r4.length).assertEqual(7);
        expect(r4[4]!).assertEqual(50);
        expect(r4[5]!).assertEqual(77);
        expect(r4[6]!).assertEqual(88);
        // 5. toSpliced(0,5,1,2,3) replaces all five -> [1,2,3] length 3
        const arr5 = new SparseArray<int>(10, 20, 30, 40, 50);
        const r5 = arr5.toSpliced(0, 5, 1, 2, 3);
        expect(r5.length).assertEqual(3);
        expect(r5[0]!).assertEqual(1);
        expect(r5[1]!).assertEqual(2);
        expect(r5[2]!).assertEqual(3);
        // 6. toSpliced(0,1,4.5) on double (1.5,2.5,3.5) -> result[0]=4.5
        const arr6 = new SparseArray<double>(1.5, 2.5, 3.5);
        const r6 = arr6.toSpliced(0, 1, 4.5);
        expect(r6[0]!).assertEqual(4.5);
        // 7. toSpliced(0,1,'z') on string ('x','y') -> result[0]='z'
        const arr7 = new SparseArray<string>('x', 'y');
        const r7 = arr7.toSpliced(0, 1, 'z');
        expect(r7[0]!).assertEqual('z');
        // 8. toSpliced(0,1,30n) on bigint (10n,20n) -> result[0]=30n
        const arr8 = new SparseArray<bigint>(10n, 20n);
        const r8 = arr8.toSpliced(0, 1, 30n);
        expect(r8[0]!).assertEqual(30n);
        // 9. toSpliced(1,0,88) on (1,2,3) inserts 88 at idx 1 -> result[1]=88
        const arr9 = new SparseArray<int>(1, 2, 3);
        const r9 = arr9.toSpliced(1, 0, 88);
        expect(r9[1]!).assertEqual(88);
        // 10. toSpliced(1,0,false,true) on (true) inserts false at idx1, true at idx2
        const arr10 = new SparseArray<boolean>(true);
        const r10 = arr10.toSpliced(1, 0, false, true);
        expect(r10[1]!).assertFalse();
        expect(r10[2]!).assertTrue();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_PART01_0200
     * @tc.name sparseArrayToSplicedTestPart01002
     * @tc.desc toSpliced returns new spliced copy & source unchanged (7 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'sparseArrayToSplicedTestPart01002',
      Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        // 1. toSpliced(0,0) on empty SparseArray<int>() -> new array length 0
        const arr1 = new SparseArray<int>();
        const r1 = arr1.toSpliced(0, 0);
        expect(r1.length).assertEqual(0);
        // 2. toSpliced(-1,1) negative start removes last 50 -> [10,20,30,40] length 4
        const arr2 = new SparseArray<int>(10, 20, 30, 40, 50);
        const r2 = arr2.toSpliced(-1 as int, 1);
        expect(r2[0]!).assertEqual(10);
        expect(r2[1]!).assertEqual(20);
        expect(r2[2]!).assertEqual(30);
        expect(r2[3]!).assertEqual(40);
        expect(r2.length).assertEqual(4);
        // 3. toSpliced(2147483647,1) start=INT_MAX removes nothing -> length 5 identical
        const arr3 = new SparseArray<int>(10, 20, 30, 40, 50);
        const r3 = arr3.toSpliced(2147483647 as int, 1);
        expect(r3[0]!).assertEqual(10);
        expect(r3[1]!).assertEqual(20);
        expect(r3[2]!).assertEqual(30);
        expect(r3[3]!).assertEqual(40);
        expect(r3[4]!).assertEqual(50);
        expect(r3.length).assertEqual(5);
        // 4. toSpliced(0,2147483647) huge deleteCount removes all -> length 0
        const arr4 = new SparseArray<int>(10, 20, 30, 40, 50);
        const r4 = arr4.toSpliced(0, 2147483647 as int);
        expect(r4.length).assertEqual(0);
        // 5. toSpliced(0,-1,42,43) on empty treats neg count as 0 -> [42,43] length 2
        const arr5 = new SparseArray<int>();
        const r5 = arr5.toSpliced(0, -1 as int, 42, 43);
        expect(r5[0]!).assertEqual(42);
        expect(r5[1]!).assertEqual(43);
        expect(r5.length).assertEqual(2);
        // 6. toSpliced(0,-1,99) on SparseArray.of(42) neg count as 0 -> [99,42] length 2
        const arr6 = SparseArray.of<int>(42);
        const r6 = arr6.toSpliced(0, -1 as int, 99);
        expect(r6[0]!).assertEqual(99);
        expect(r6[1]!).assertEqual(42);
        expect(r6.length).assertEqual(2);
        // 7. toSpliced(1,2,99) on (10,20,30,40) -> new [10,99,40] len 3, original unchanged
        const arr7 = new SparseArray<int>(10, 20, 30, 40);
        const r7 = arr7.toSpliced(1, 2, 99);
        const isNewArr: boolean = r7 !== arr7;
        expect(isNewArr).assertTrue();
        expect(r7.length).assertEqual(3);
        expect(r7[0]).assertEqual(10);
        expect(r7[1]).assertEqual(99);
        expect(r7[2]).assertEqual(40);
        const iter = arr7.values();
        let step = iter.next();
        expect(step.done).assertFalse();
        expect(step.value as int).assertEqual(10);
        step = iter.next();
        expect(step.value as int).assertEqual(20);
        step = iter.next();
        expect(step.value as int).assertEqual(30);
        step = iter.next();
        expect(step.value as int).assertEqual(40);
        step = iter.next();
        expect(step.done).assertTrue();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_PART01_0300
     * @tc.name sparseArrayToSplicedTestPart01003
     * @tc.desc toSpliced new-instance independence (7 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'sparseArrayToSplicedTestPart01003',
      Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        // 1. chained toSpliced on boolean: r1=toSpliced(1,2,true), r2=toSpliced(0,0,false) -> len 4, r2[0]=false
        const arr1 = new SparseArray<boolean>(true, false, true, false);
        const r1 = arr1.toSpliced(1, 2, true);
        const r2 = r1.toSpliced(0, 0, false);
        expect(r2.length).assertEqual(4);
        expect(r2[0]!).assertFalse();
        // 2. chained toSpliced on Date: r1=toSpliced(1,1,Date(5000)), r2=toSpliced(2,0,Date(9999)) -> getTime [0,5000,9999,2000]
        const arr2 = new SparseArray<Date>(new Date(0), new Date(1000), new Date(2000));
        const spliced11 = arr2.toSpliced(1, 1, new Date(5000));
        const spliced12 = spliced11.toSpliced(2, 0, new Date(9999));
        expect(spliced12.length).assertEqual(4);
        expect(spliced12[0]!.getTime()).assertEqual(0);
        expect(spliced12[1]!.getTime()).assertEqual(5000);
        expect(spliced12[2]!.getTime()).assertEqual(9999);
        expect(spliced12[3]!.getTime()).assertEqual(2000);
        // 3. chained toSpliced: r1=toSpliced(0,5) empties, r2=toSpliced(0,0,10,20,30) -> len 3 [10,_,30]
        const arr3 = new SparseArray<int>(1, 2, 3, 4, 5);
        const e1 = arr3.toSpliced(0, 5);
        const e2 = e1.toSpliced(0, 0, 10, 20, 30);
        expect(e2.length).assertEqual(3);
        expect(e2[0]!).assertEqual(10);
        expect(e2[2]!).assertEqual(30);
        // 4. toSpliced(1,2,99) returns writable new array: result[1]=77 -> 77
        const arr4 = new SparseArray<int>(10, 20, 30, 40, 50);
        const r4 = arr4.toSpliced(1, 2, 99);
        r4[1] = 77;
        expect(r4[1]!).assertEqual(77);
        // 5. toSpliced(0,1,true) on boolean array returns writable new array: result[1]=true -> true
        const arr5 = new SparseArray<boolean>(false, false, false);
        const r5 = arr5.toSpliced(0, 1, true);
        r5[1] = true;
        expect(r5[1]!).assertTrue();
        // 6. toSpliced(1,2,99) new array shift() returns 10 leaving length 3
        const arr6 = new SparseArray<int>(10, 20, 30, 40, 50);
        const r6 = arr6.toSpliced(1, 2, 99);
        const shifted: int | undefined = r6.shift();
        expect(shifted!).assertEqual(10);
        expect(r6.length).assertEqual(3);
        // 7. splice(0,2,77,88) on toSpliced(1,2,99) result deletes [10,99] -> len 4 [77,88,...]
        const arr7 = new SparseArray<int>(10, 20, 30, 40, 50);
        const r7 = arr7.toSpliced(1, 2, 99);
        const deleted = r7.splice(0, 2, 77, 88);
        expect(deleted.length).assertEqual(2);
        expect(deleted[0]).assertEqual(10);
        expect(deleted[1]).assertEqual(99);
        expect(r7.length).assertEqual(4);
        expect(r7[0]!).assertEqual(77);
        expect(r7[1]!).assertEqual(88);
      },
    );
  });
}
