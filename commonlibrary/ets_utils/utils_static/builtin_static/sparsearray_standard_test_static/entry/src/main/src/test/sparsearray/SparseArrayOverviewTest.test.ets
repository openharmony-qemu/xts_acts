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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';

import Utils from '../Util.test';

function createLargeSparseArray(): SparseArray<int> {
  let sa = new SparseArray<int>(1000);
  sa.push(1);
  sa.push(2);
  sa.splice(500, 0, 100, 200);
  return sa;
}

export default function SparseArrayOverviewTest(): void {
  describe('SparseArrayOverviewTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OVERVIEW_0100
     * @tc.name testOverviewNormal001
     * @tc.desc Verify SparseArray overview scenarios across multiple APIs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOverviewNormal001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let sa = new SparseArray<int>();
        expect(sa.length).assertEqual(0);
        let newLen = sa.push(10, 20);
        expect(newLen).assertEqual(2);
        expect(sa.length).assertEqual(2);
        expect(sa.at(0)).assertEqual(10);
        expect(sa.at(1)).assertEqual(20);

      }
      {

        let sa = createLargeSparseArray();
        let sum = 0;
        let count = 0;
        sa.forEach((val, index, arr) => {
          sum += val;
          count++;
        });
        expect(count).assertEqual(4);
        expect(sum).assertEqual(303);

      }
      {

        let sa = new SparseArray<int>();
        sa.length = 3;
        sa.push(1);
        sa.push(2);
        expect(sa.toString()).assertEqual(',,,1,2');

      }
      {

        let sa = createLargeSparseArray();
        let found = sa.find((val) => val > 100);
        expect(found).assertEqual(200);
        let notFound = sa.find((val) => val > 500);
        expect(notFound).assertEqual(undefined);

      }
      {

        let sa = new SparseArray<int>();
        sa.length = 5;
        sa.push(10, 20);
        let deleted = sa.splice(2, 4, 100);
        expect(sa.length).assertEqual(4);
        expect(deleted.length).assertEqual(4);
        expect(deleted.at(3)).assertEqual(10);
        expect(sa.at(2)).assertEqual(100);
        expect(sa.at(3)).assertEqual(20);

      }
      {

        let sa = createLargeSparseArray();
        let index = sa.findIndex((val) => val === 200);
        expect(index).assertEqual(501);
        let notFoundIndex = sa.findIndex((val) => val === 999);
        expect(notFoundIndex).assertEqual(-1);

      }
      {

        let sa = createLargeSparseArray();
        let filtered = sa.filter((val) => val > 10);
        expect(filtered.length).assertEqual(2);
        expect(filtered.at(0)).assertEqual(100);
        expect(filtered.at(1)).assertEqual(200);

      }
      {

        let sa = createLargeSparseArray();
        expect(sa.includes(100)).assertEqual(true);
        expect(sa.includes(999)).assertEqual(false);
        expect(sa.includes(200, 501)).assertEqual(true);
        expect(sa.includes(100, 501)).assertEqual(false);

      }
      {

        let sa = createLargeSparseArray();
        expect(sa.indexOf(100)).assertEqual(500);
        expect(sa.indexOf(999)).assertEqual(-1);
        expect(sa.indexOf(100, 501)).assertEqual(-1);
        expect(sa.indexOf(2, 1000)).assertEqual(1003);

      }
      {

        let sa = new SparseArray<int>();
        expect(SparseArray.isArray(sa)).assertEqual(true);
        expect(SparseArray.isArray(new Array<int>())).assertEqual(false);
        expect(SparseArray.isArray(1)).assertEqual(false);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OVERVIEW_0200
     * @tc.name testOverviewNormal002
     * @tc.desc Verify SparseArray overview scenarios across multiple APIs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOverviewNormal002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let sa = new SparseArray<int>();
        sa.push(1);
        sa.length = 3;
        sa.push(2);
        expect(sa.join()).assertEqual('1,,,2');
        expect(sa.join('-')).assertEqual('1---2');

      }
      {

        let sa = createLargeSparseArray();
        let sliced = sa.slice(500, 502);
        expect(sliced.length).assertEqual(2);
        expect(sliced.at(0)).assertEqual(100);
        expect(sliced.at(1)).assertEqual(200);

      }
      {

        let sa = new SparseArray<int>(1, 2, 3);
        expect(sa.length).assertEqual(3);
        sa.length = 1;
        expect(sa.length).assertEqual(1);
        expect(sa.at(0)).assertEqual(1);
        expect(sa.at(1)).assertEqual(undefined);

      }
      {

        let arr = SparseArray.from<int>([1, 2, 3]);
        expect(arr.length).assertEqual(3);
        expect(arr.at(0)).assertEqual(1);

        let arrMap = SparseArray.from<int, string>([1, 2, 3], (v: int) => v.toString());
        expect(arrMap.at(0)).assertEqual("1");

      }
      {

        let sa = new SparseArray<int>();
        sa[0] = 10;
        sa[2] = 30;
        sa[4] = 50;
        let found = sa.findLast((v: int) => v > 20);
        expect(found).assertEqual(50);
        let index = sa.findLastIndex((v: int) => v > 20);
        expect(index).assertEqual(4);

      }
      {

        let sa = new SparseArray<int>(3, 1, 4, 1, 5);
        sa.sort((a: int, b: int) => a - b);
        expect(sa.at(0)).assertEqual(1);
        expect(sa.at(1)).assertEqual(1);
        expect(sa.at(2)).assertEqual(3);
        expect(sa.at(3)).assertEqual(4);
        expect(sa.at(4)).assertEqual(5);

      }
      {

        let sa = new SparseArray<int>(1, 2, 3, 4, 5);
        sa.copyWithin(0, 3, 4);
        expect(sa.at(0)).assertEqual(4);
        expect(sa.at(1)).assertEqual(2);

      }
      {

        let sa1 = new SparseArray<int>(1, 2);
        let sa2 = new Array<int>(3, 4);
        let newSa = sa1.concat(sa2);
        expect(newSa.length).assertEqual(4);
        expect(newSa.at(2)).assertEqual(3);

      }
      {

        let inner = new SparseArray<int>(44, 55);
        let sa = new SparseArray<int | SparseArray<int>>();
        sa.push(1, 3);
        sa.push(inner);
        let res = sa.flat();
        expect(res.length).assertEqual(4);

      }
      {

        let sa = new SparseArray<int>(1, 2);
        let res = sa.flatMap((v: int) => {
          let inner = new SparseArray<int>();
          inner.push(v, v * 10);
          return inner;
        });
        expect(res.length).assertEqual(2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OVERVIEW_0300
     * @tc.name testOverviewNormal003
     * @tc.desc Verify SparseArray overview scenarios across multiple APIs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOverviewNormal003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let sa = new SparseArray<int>(1, 2, 3);
        expect(sa.some((v: int) => v > 2)).assertEqual(true);
        expect(sa.some((v: int) => v > 5)).assertEqual(false);

      }
      {

        let sa = new SparseArray<int>(1, 2);
        let doubled = sa.map((v: int) => v * 2);
        expect(doubled.at(0)).assertEqual(2);
        expect(doubled.at(1)).assertEqual(4);

      }
      {

        let sa = new SparseArray<int>(1, 2, 3);
        expect(sa.pop()).assertEqual(3);
        expect(sa.length).assertEqual(2);
        expect(sa.shift()).assertEqual(1);
        expect(sa.length).assertEqual(1);
        expect(sa.at(0)).assertEqual(2);

      }
      {

        let sa = new SparseArray<int>(1, 2, 3);
        sa.fill(4);
        expect(sa.at(0)).assertEqual(4);
        expect(sa.at(2)).assertEqual(4);

      }
      {

        let sa = new SparseArray<int>(3, 4);
        let len = sa.unshift(1, 2);
        expect(len).assertEqual(4);
        expect(sa.at(0)).assertEqual(1);
        expect(sa.at(2)).assertEqual(3);

      }
      {

        let sa = new SparseArray<int>(1, 2, 3);
        sa.reverse();
        expect(sa.at(0)).assertEqual(3);
        expect(sa.at(2)).assertEqual(1);

      }
      {

        let sa = new SparseArray<int>(1, 2, 3);
        let reversed = sa.toReversed();
        expect(reversed.at(0)).assertEqual(3);
        expect(sa.at(0)).assertEqual(1);

      }
      {

        let sa = new SparseArray<int>(1, 2, 3, 2, 4);
        expect(sa.lastIndexOf(2)).assertEqual(3);
        expect(sa.lastIndexOf(5)).assertEqual(-1);

      }
      {

        let sa = new SparseArray<int>(1, 2, 3, 4);
        let sum = sa.reduce((acc: int, curr: int) => acc + curr);
        expect(sum).assertEqual(10);
        let sumRight = sa.reduceRight((acc: int, curr: int) => acc + curr);
        expect(sumRight).assertEqual(10);

      }
      {

        let sa = new SparseArray<int>(1, 2, 3);
        expect(sa.every((v: int) => v > 0)).assertEqual(true);
        expect(sa.every((v: int) => v > 1)).assertEqual(false);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OVERVIEW_0400
     * @tc.name testOverviewNormal004
     * @tc.desc Verify SparseArray overview scenarios across multiple APIs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testOverviewNormal004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let sa = SparseArray.of<string>("a", "b", "c");
        expect(sa.length).assertEqual(3);
        expect(sa.at(0)).assertEqual("a");

      }
      {

        let sa = new SparseArray<string>("a", "b");

        let keys = sa.keys();
        expect(keys.next().value).assertEqual(0);
        expect(keys.next().value).assertEqual(1);

        let values = sa.values();
        expect(values.next().value).assertEqual("a");
        expect(values.next().value).assertEqual("b");

      }
      {
        // 1. from on source array of two undefined elements produces array with length 2
        const src1: (int | undefined)[] = [undefined, undefined];
        const arr1: SparseArray<int | undefined> = SparseArray.from<int | undefined>(src1);
        expect(arr1.length).assertEqual(2);
        // 2. flat on SparseArray containing inner SparseArray(2,3) flattens result to length 3
        const inner2: SparseArray<int> = new SparseArray<int>(2, 3);
        const arr2: SparseArray<SparseArray<int> | int> = new SparseArray<SparseArray<int> | int>(1, inner2);
        const r2: SparseArray<int> = arr2.flat<int>();
        expect(r2.length).assertEqual(3);
        // 3. entries on SparseArray(10,20) yields first iterator value [0,10]
        const arr3: SparseArray<int> = new SparseArray<int>(10, 20);
        const iter3: Iterator<[int, int]> = arr3.entries();
        const r3: IteratorResult<[int, int]> = iter3.next();
        expect(r3.value![0]).assertEqual(0);
        expect(r3.value![1]).assertEqual(10);
        // 4. join on length-1 SparseArray(1) renders the empty slot as empty string
        const arr4: SparseArray<int> = new SparseArray<int>(1);
        expect(arr4.join()).assertEqual('');
        // 5. calling next twice on values iterator of SparseArray(5) sets done true after yielding element
        const arr5: SparseArray<int> = SparseArray.of<int>(5);
        const iter5: IterableIterator<int> = arr5.values();
        let r5: IteratorResult<int> = iter5.next();
        r5 = iter5.next();
        expect(r5.done).assertTrue();
        // 6. read-only join() and toString() on SparseArray(1,2,3) leave the length property at 3
        const arr6 = new SparseArray<int>(1, 2, 3);
        arr6.join();
        arr6.toString();
        expect(arr6.length).assertEqual(3);
        // 7. findIndex with v greater than 1 predicate on SparseArray(1,2,3) returns index 1
        const arr7: SparseArray<int> = SparseArray.of<int>(1, 2, 3);
        expect(arr7.findIndex((v: int): boolean => v > 1)).assertEqual(1);
        // 8. findLastIndex with v greater than 10 predicate on SparseArray(5) returns -1 since no element matches
        const arr8: SparseArray<int> = SparseArray.of<int>(5);
        expect(arr8.findLastIndex((v: int): boolean => v > 10)).assertEqual(-1);
        // 9. findLast with x equal 3 predicate on SparseArray(1,3,5,3) returns last matching element 3
        const arr9: SparseArray<int> = SparseArray.of<int>(1, 3, 5, 3);
        expect(arr9.findLast((x: int): boolean => x === 3)).assertEqual(3);
        // 10. every with even predicate on SparseArray(2,4,6) returns true
        const arr10: SparseArray<int> = SparseArray.of<int>(2, 4, 6);
        expect(arr10.every((v: int): boolean => v % 2 === 0)).assertTrue();

      }
      {
        // 1. find with v greater than 0 predicate on empty SparseArray returns undefined
        const arr1: SparseArray<int> = new SparseArray<int>();
        expect(arr1.find((v: int): boolean => v > 0)).assertUndefined();
        // 2. some with v greater than 0 predicate on SparseArray(1,2,3) returns true after evaluating only first element
        const arr2: SparseArray<int> = new SparseArray<int>(1, 2, 3);
        let count2: int = 0;
        const r2: boolean = arr2.some((v: int): boolean => {
          count2 += 1;
          return v > 0;
        });
        expect(r2).assertTrue();
        expect(count2).assertEqual(1);
        // 3. unshift(0) then push(3) on SparseArray(1,2) grows it to 0,1,2,3 as verified by toString
        const arr3: SparseArray<int> = new SparseArray<int>(1, 2);
        expect(arr3.unshift(0)).assertEqual(3);
        expect(arr3.push(3)).assertEqual(4);
        expect(arr3.toString()).assertEqual('0,1,2,3');
        // 4. copyWithin(-1,0) on SparseArray(1,2,3) copies arr[0] making arr[2] equal 1
        const arr4: SparseArray<int> = new SparseArray<int>(1, 2, 3);
        arr4.copyWithin(-1, 0);
        expect(arr4[2]!).assertEqual(1);
        // 5. splice(1,0,0) on SparseArray(2147483647,-1) inserts 0 at index 1 making length 3
        const arr5: SparseArray<int> = new SparseArray<int>(2147483647, -1);
        arr5.splice(1, 0, 0);
        expect(arr5.length).assertEqual(3);
        expect(arr5[0]!).assertEqual(2147483647);
        expect(arr5[1]!).assertEqual(0);
        expect(arr5[2]!).assertEqual(-1);
        // 6. sort ascending on SparseArray(2147483647,-1,0,-2147483648) makes arr[0] -2147483648 and arr[3] 2147483647
        const arr6: SparseArray<int> = new SparseArray<int>(2147483647, -1, 0, -2147483648);
        arr6.sort((a: int, b: int): int => {
          if (a < b) {
            return -1;
          }
          if (a > b) {
            return 1;
          }
          return 0;
        });
        expect(arr6[0]!).assertEqual(-2147483648);
        expect(arr6[3]!).assertEqual(2147483647);
        // 7. filter(v>-1) then map(v+1) on SparseArray(2147483647,-1,0,-2147483648) yields mapped[0] -2147483648 via int overflow
        const arr7: SparseArray<int> = new SparseArray<int>(2147483647, -1, 0, -2147483648);
        const filtered7: SparseArray<int> = arr7.filter((v: int): boolean => {
          return v > -1;
        });
        const mapped7: SparseArray<int> = filtered7.map((v: int): int => {
          return v + 1;
        });
        expect(mapped7.length).assertEqual(2);
        expect(mapped7[0]!).assertEqual(-2147483648);
        // 8. chaining copyWithin(1,0,2) then copyWithin(3,1,3) makes arr[3] 2147483647 and arr[4] -1
        const arr8: SparseArray<int> = new SparseArray<int>(2147483647, -1, 0, -2147483648, 0);
        arr8.copyWithin(1, 0, 2).copyWithin(3, 1, 3);
        expect(arr8[3]!).assertEqual(2147483647);
        expect(arr8[4]!).assertEqual(-1);
        // 9. toSpliced(1,2) then toSorted on SparseArray(2147483647,-1,0,-2147483648) leaves original length 4 while sorted copy has length 2
        const arr9: SparseArray<int> = new SparseArray<int>(2147483647, -1, 0, -2147483648);
        const spliced9: SparseArray<int> = arr9.toSpliced(1, 2);
        const sorted9: SparseArray<int> = spliced9.toSorted((a: int, b: int): int => {
          return a - b;
        });
        expect(arr9.length).assertEqual(4);
        expect(arr9[1]!).assertEqual(-1);
        expect(sorted9.length).assertEqual(2);
        // 10. splice(1,2) on SparseArray(1,2,3,4) returns removed sub-array of length 2
        const arr10: SparseArray<int> = new SparseArray<int>(1, 2, 3, 4);
        const ret10: SparseArray<int> = arr10.splice(1, 2);
        expect(ret10.length).assertEqual(2);

      }
    });

  });
}
