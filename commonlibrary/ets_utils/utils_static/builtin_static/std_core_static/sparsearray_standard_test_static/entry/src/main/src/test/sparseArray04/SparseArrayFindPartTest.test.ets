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

interface SparseArrayFindPartItem {
  id: int;
  name: string;
}
interface SparseArrayFindPartItemC {
  a: int;
  b: string;
}

// Merged from SparseArrayFindPart01Test + SparseArrayFindPart02Test (61 scenarios -> 7 cases, each <=10)
export default function sparseArrayFindPartTest(): void {
  describe('SparseArrayFindPartTest', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_PART_0100
     * @tc.name sparseArrayFindPartTest001
     * @tc.desc find-with-match returns first matching value (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFindPartTest001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. find on (1,2,3) with value > 0 -> 1
      const arr1 = new SparseArray<int>(1, 2, 3);
      const result1 = arr1.find((value: int) => value > 0);
      expect(result1).assertEqual(1);
      // 2. find on (5,10,15) with value >= 10 -> 10
      const arr2 = new SparseArray<int>(5, 10, 15);
      const result2 = arr2.find((value: int) => value >= 10);
      expect(result2).assertEqual(10);
      // 3. find on (7,1,2) with value === 7 -> 7
      const arr3 = new SparseArray<int>(7, 1, 2);
      const result3 = arr3.find((value: int) => value === 7);
      expect(result3).assertEqual(7);
      // 4. find on (1,2,2,3) with value === 2 -> 2
      const arr4 = new SparseArray<int>(1, 2, 2, 3);
      const result4 = arr4.find((value: int) => value === 2);
      expect(result4).assertEqual(2);
      // 5. find on (3,8,15,4,2) with value > 5 && value < 10 -> 8
      const arr5 = new SparseArray<int>(3, 8, 15, 4, 2);
      const result5 = arr5.find((value: int) => value > 5 && value < 10);
      expect(result5).assertEqual(8);
      // 6. find on (1,3,5) with value * 2 === 6 -> 3
      const arr6 = new SparseArray<int>(1, 3, 5);
      const result6 = arr6.find((value: int) => value * 2 === 6);
      expect(result6).assertEqual(3);
      // 7. find on (5,-3,7,-8) with value < 0 -> -3
      const arr7 = new SparseArray<int>(5, -3, 7, -8);
      const result7 = arr7.find((value: int) => value < 0);
      expect(result7).assertEqual(-3);
      // 8. find on (10,20,30) with value > 15 -> 20
      const arr8 = new SparseArray<int>(10, 20, 30);
      const result8 = arr8.find((value: int) => value > 15);
      expect(result8).assertEqual(20);
      // 9. find on (33,-7,0,128) with value < 0 -> -7, array unchanged
      const arr9 = new SparseArray<int>(33, -7, 0, 128);
      const result9 = arr9.find((value: int) => value < 0);
      expect(result9).assertEqual(-7);
      expect(arr9[0]).assertEqual(33);
      expect(arr9[1]).assertEqual(-7);
      expect(arr9[2]).assertEqual(0);
      expect(arr9[3]).assertEqual(128);
      // 10. find on (100,200,300) with value > 150 -> 200, length 3
      const arr10 = new SparseArray<int>(100, 200, 300);
      const result10 = arr10.find((value: int) => value > 150);
      expect(result10).assertEqual(200);
      expect(arr10.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_PART_0200
     * @tc.name sparseArrayFindPartTest002
     * @tc.desc typed elements string/boolean/double/bigint/object/Array (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFindPartTest002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. string: find on ('alpha','beta','gamma') with value.length > 4 -> 'alpha'
      const arr1 = new SparseArray<string>('alpha', 'beta', 'gamma');
      const result1 = arr1.find((value: string) => value.length > 4);
      expect(result1).assertEqual('alpha');
      // 2. boolean: find on (false,true,false) with value -> true
      const arr2 = new SparseArray<boolean>(false, true, false);
      const result2 = arr2.find((value: boolean) => value);
      expect(result2).assertTrue();
      // 3. double: find on (1.5,2.5,3.5) with value > 2.0 -> 2.5
      const arr3 = new SparseArray<double>(1.5, 2.5, 3.5);
      const result3 = arr3.find((value: double) => value > 2.0);
      expect(result3).assertEqual(2.5);
      // 4. bigint: find on (0n,100n,200n) with value > 50n -> 100n
      const arr4 = new SparseArray<bigint>(0n, 100n, 200n);
      const result4 = arr4.find((value: bigint) => value > 50n);
      expect(result4).assertEqual(100n);
      // 5. object: find on (o1,o2) with value.id > 1 -> o2
      const o1_5: SparseArrayFindPartItem = { id: 1, name: 'a' };
      const o2_5: SparseArrayFindPartItem = { id: 2, name: 'b' };
      const arr5 = new SparseArray<SparseArrayFindPartItem>(o1_5, o2_5);
      const result5 = arr5.find((value: SparseArrayFindPartItem) => value.id > 1);
      expect(result5).assertEqual(o2_5);
      // 6. object c: find on (o1,o2) with value.a > 1 -> o2, elements verified
      const o1_6: SparseArrayFindPartItemC = { a: 1, b: 'one' };
      const o2_6: SparseArrayFindPartItemC = { a: 2, b: 'two' };
      const arr6 = new SparseArray<SparseArrayFindPartItemC>(o1_6, o2_6);
      const result6 = arr6.find((value: SparseArrayFindPartItemC) => value.a > 1);
      expect(result6).assertEqual(o2_6);
      expect(arr6[0]!.a).assertEqual(1);
      expect(arr6[0]!.b).assertEqual('one');
      expect(arr6[1]!.a).assertEqual(2);
      expect(arr6[1]!.b).assertEqual('two');
      // 7. double NaN: find on (NaN,10.0,20.0) with value > 5.0 -> 10.0, arr[0] isNaN
      const arr7 = new SparseArray<double>(Double.NaN, 10.0, 20.0);
      const result7 = arr7.find((value: double) => value > 5.0);
      expect(result7).assertEqual(10.0);
      expect(isNaN(arr7[0] as double)).assertTrue();
      // 8. string: find on ('a','b','c') with value.length > 0 -> 'a', pop 'c'
      const arr8 = new SparseArray<string>('a', 'b', 'c');
      const result8 = arr8.find((value: string) => value.length > 0);
      expect(result8).assertEqual('a');
      const popped8: string = arr8.pop() as string;
      expect(popped8).assertEqual('c');
      expect(arr8.length).assertEqual(2);
      // 9. string: find on ('cat','dog','bird') with value === 'dog' -> 'dog', includes
      const arr9 = new SparseArray<string>('cat', 'dog', 'bird');
      const result9 = arr9.find((value: string) => value === 'dog');
      expect(result9).assertEqual('dog');
      expect(arr9.includes('dog')).assertTrue();
      expect(arr9.includes('fish')).assertFalse();
      // 10. Array<int>: find on (nested1,nested2) with value.length > 2 -> nested1
      const nested1_10: Array<int> = [1, 2, 3];
      const nested2_10: Array<int> = [4, 5, 6];
      const arr10 = new SparseArray<Array<int>>(nested1_10, nested2_10);
      const result10 = arr10.find((value: Array<int>) => value.length > 2);
      expect(result10).assertEqual(nested1_10);
      expect(arr10[0]!.length).assertEqual(3);
      expect(arr10[1]!.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_PART_0300
     * @tc.name sparseArrayFindPartTest003
     * @tc.desc no-match returns undefined, empty array & int boundary values (8 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFindPartTest003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. find on (10,20,30) with false -> undefined
      const arr1 = new SparseArray<int>(10, 20, 30);
      const result1 = arr1.find((value: int) => false);
      expect(result1).assertUndefined();
      // 2. value 0 boundary: find on (0,1,2) receives value 0
      const arr2 = new SparseArray<int>(0, 1, 2);
      let receivedZero2: boolean = false;
      arr2.find((value: int) => {
        if (value === 0) {
          receivedZero2 = true;
        }
        return false;
      });
      expect(receivedZero2).assertTrue();
      // 3. value MAX boundary: find on (2147483647,0) receives value MAX
      const arr3 = new SparseArray<int>(2147483647, 0);
      let receivedMax3: boolean = false;
      arr3.find((value: int) => {
        if (value === 2147483647) {
          receivedMax3 = true;
        }
        return false;
      });
      expect(receivedMax3).assertTrue();
      // 4. string no-match: find on ('x','y') with value.length > 10 -> undefined
      const arr4 = new SparseArray<string>('x', 'y');
      const result4 = arr4.find((value: string) => value.length > 10);
      expect(result4).assertUndefined();
      // 5. sparse empty: find on SparseArray(4) no values with value > 0 -> undefined
      const arr5 = new SparseArray<int>(4);
      const result5 = arr5.find((value: int) => value > 0);
      expect(result5).assertUndefined();
      // 6. int MAX present: find on (2147483647,-1,0) with value < 0 -> -1
      const arr6 = new SparseArray<int>(2147483647, -1, 0);
      const result6 = arr6.find((value: int) => value < 0);
      expect(result6).assertEqual(-1);
      expect(arr6[0]).assertEqual(2147483647);
      // 7. int MIN present: find on (-2147483648,0,1) with value > 0 -> 1
      const arr7 = new SparseArray<int>(-2147483648, 0, 1);
      const result7 = arr7.find((value: int) => value > 0);
      expect(result7).assertEqual(1);
      expect(arr7[0]).assertEqual(-2147483648);
      // 8. empty array: find on empty with value > 0 -> undefined, then push(100) -> 100
      const arr8 = new SparseArray<int>();
      const r8a = arr8.find((value: int) => value > 0);
      expect(r8a).assertUndefined();
      arr8.push(100);
      const result8 = arr8.find((value: int) => value > 50);
      expect(result8).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_PART_0400
     * @tc.name sparseArrayFindPartTest004
     * @tc.desc sparse traversal over holey arrays (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFindPartTest004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. find on sparse(4){0=10,3=40} with value > 0 -> 10
      const arr1 = new SparseArray<int>(4);
      arr1[0] = 10;
      arr1[3] = 40;
      const result1 = arr1.find((value: int) => value > 0);
      expect(result1).assertEqual(10);
      // 2. find on sparse(3){0=1,2=3} collects indices [0,2]
      const arr2 = new SparseArray<int>(3);
      arr2[0] = 1;
      arr2[2] = 3;
      let indices2: int[] = [];
      arr2.find((value: int, index: int) => {
        indices2.push(index);
        return false;
      });
      expect(indices2[0]).assertEqual(0);
      expect(indices2[1]).assertEqual(2);
      // 3. find on sparse(3){1=20,2=30} leading hole, callCount=2 firstIndex=1
      const arr3 = new SparseArray<int>(3);
      arr3[1] = 20;
      arr3[2] = 30;
      let callCount3: int = 0;
      let firstIndex3: int = -1;
      arr3.find((value: int, index: int) => {
        callCount3 = callCount3 + 1;
        if (firstIndex3 === -1) {
          firstIndex3 = index;
        }
        return false;
      });
      expect(callCount3).assertEqual(2);
      expect(firstIndex3).assertEqual(1);
      // 4. find on sparse(4){0=10,2=30,3=40} middle hole, indices [0,2,3]
      const arr4 = new SparseArray<int>(4);
      arr4[0] = 10;
      arr4[2] = 30;
      arr4[3] = 40;
      let indices4: int[] = [];
      arr4.find((value: int, index: int) => {
        indices4.push(index);
        return false;
      });
      expect(indices4.length).assertEqual(3);
      expect(indices4[0]).assertEqual(0);
      expect(indices4[1]).assertEqual(2);
      expect(indices4[2]).assertEqual(3);
      // 5. find on sparse(5){0=1,2=3,4=5} callCount=3
      const arr5 = new SparseArray<int>(5);
      arr5[0] = 1;
      arr5[2] = 3;
      arr5[4] = 5;
      let callCount5: int = 0;
      arr5.find((value: int) => {
        callCount5 = callCount5 + 1;
        return false;
      });
      expect(callCount5).assertEqual(3);
      // 6. find on sparse(4){0=5,3=8} with index === 3 -> 8
      const arr6 = new SparseArray<int>(4);
      arr6[0] = 5;
      arr6[3] = 8;
      const result6 = arr6.find((value: int, index: int) => index === 3);
      expect(result6).assertEqual(8);
      // 7. find on sparse(5){4=100} with value > 50 -> 100
      const arr7 = new SparseArray<int>(5);
      arr7[4] = 100;
      const result7 = arr7.find((value: int) => value > 50);
      expect(result7).assertEqual(100);
      // 8. find on sparse(5){0=10,2=30,4=50} with value > 20 -> 30, length stable
      const arr8 = new SparseArray<int>(5);
      arr8[0] = 10;
      arr8[2] = 30;
      arr8[4] = 50;
      const lenBefore8: int = arr8.length;
      const result8 = arr8.find((value: int) => value > 20);
      expect(result8).assertEqual(30);
      expect(arr8.length).assertEqual(lenBefore8);
      // 9. find on sparse(4){1=10,2=20,3=30} with value > 15 -> 20, arr[0] undefined
      const arr9 = new SparseArray<int>(4);
      arr9[1] = 10;
      arr9[2] = 20;
      arr9[3] = 30;
      const result9 = arr9.find((value: int) => value > 15);
      expect(result9).assertEqual(20);
      expect(arr9[0]).assertUndefined();
      // 10. find on sparse(3){1=99} with value > 50 -> 99, alias verified
      const arr10 = new SparseArray<int>(3);
      arr10[1] = 99;
      const alias10: SparseArray<int> = arr10;
      const result10 = arr10.find((value: int) => value > 50);
      expect(result10).assertEqual(99);
      expect(alias10[1]).assertEqual(99);
      expect(alias10.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_PART_0500
     * @tc.name sparseArrayFindPartTest005
     * @tc.desc callback args value & index received by predicate (8 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFindPartTest005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. find on (1,2,3) captures firstValue=1
      const arr1 = new SparseArray<int>(1, 2, 3);
      let firstValue1: int = 0;
      arr1.find((value: int) => {
        firstValue1 = value;
        return true;
      });
      expect(firstValue1).assertEqual(1);
      // 2. find on (11,22,33) collects all values [11,22,33]
      const arr2 = new SparseArray<int>(11, 22, 33);
      let values2: int[] = [];
      arr2.find((value: int) => {
        values2.push(value);
        return false;
      });
      expect(values2[0]).assertEqual(11);
      expect(values2[1]).assertEqual(22);
      expect(values2[2]).assertEqual(33);
      // 3. find on sparse(100){0=100} typeof value='int', callCount=1, result=100
      const arr3 = new SparseArray<int>(100);
      arr3[0] = 100;
      let callCount3: int = 0;
      const result3 = arr3.find((value: int) => {
        callCount3++;
        let actualValue1: string = typeof value;
        let expectedValue1: string = 'int';
        expect(actualValue1).assertEqual(expectedValue1);
        return true;
      });
      expect(callCount3).assertEqual(1);
      expect(result3).assertEqual(100);
      // 4. find on sparse(4){1=20,2=30} leading hole, firstIndex=1
      const arr4 = new SparseArray<int>(4);
      arr4[1] = 20;
      arr4[2] = 30;
      let firstIndex4: int = -1;
      arr4.find((value: int, index: int) => {
        firstIndex4 = index;
        return true;
      });
      expect(firstIndex4).assertEqual(1);
      // 5. find on sparse(50){0=50} typeof index='int', callCount=1, result=50
      const arr5 = new SparseArray<int>(50);
      arr5[0] = 50;
      let callCount5: int = 0;
      const result5 = arr5.find((value: int, index: int) => {
        callCount5++;
        let actualValue1: string = typeof index;
        let expectedValue1: string = 'int';
        expect(actualValue1).assertEqual(expectedValue1);
        return true;
      });
      expect(callCount5).assertEqual(1);
      expect(result5).assertEqual(50);
      // 6. find on (100,200,300) collects all indices [0,1,2]
      const arr6 = new SparseArray<int>(100, 200, 300);
      let indices6: int[] = [];
      arr6.find((value: int, index: int) => {
        indices6.push(index);
        return false;
      });
      expect(indices6[0]).assertEqual(0);
      expect(indices6[1]).assertEqual(1);
      expect(indices6[2]).assertEqual(2);
      // 7. find on sparse(){0=99} singleIndex=0
      const arr7 = new SparseArray<int>();
      arr7[0] = 99;
      let singleIndex7: int = -1;
      arr7.find((value: int, index: int) => {
        singleIndex7 = index;
        return true;
      });
      expect(singleIndex7).assertEqual(0);
      // 8. find on (10,20,30) with 2-arg index === 1 -> 20
      const arr8 = new SparseArray<int>(10, 20, 30);
      const result8 = arr8.find((value: int, index: int) => index === 1);
      expect(result8).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_PART_0600
     * @tc.name sparseArrayFindPartTest006
     * @tc.desc callback args array (3-arg predicate) (7 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFindPartTest006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. find on (1,2,3) 3-arg mutates array[0]=999
      const arr1 = new SparseArray<int>(1, 2, 3);
      arr1.find((value: int, index: int, array: SparseArray<int>) => {
        array[0] = 999;
        return true;
      });
      expect(arr1[0]).assertEqual(999);
      // 2. find on (3,6,9) 3-arg array[index]===value, allMatch
      const arr2 = new SparseArray<int>(3, 6, 9);
      let allMatch2: boolean = true;
      arr2.find((value: int, index: int, array: SparseArray<int>) => {
        if (array[index] !== value) {
          allMatch2 = false;
        }
        return false;
      });
      expect(allMatch2).assertTrue();
      // 3. find on (10,20,30) 3-arg value===20 && index===1 && array.length===3
      const arr3 = new SparseArray<int>(10, 20, 30);
      let allAvailable3: boolean = false;
      arr3.find((value: int, index: int, array: SparseArray<int>) => {
        if (value === 20 && index === 1 && array.length === 3) {
          allAvailable3 = true;
        }
        return false;
      });
      expect(allAvailable3).assertTrue();
      // 4. find on (1,2,3) 3-arg mutates array[0]=999 at index 0, returns index===1 -> 2
      const arr4 = new SparseArray<int>(1, 2, 3);
      const result4 = arr4.find((value: int, index: int, array: SparseArray<int>) => {
        if (index === 0) {
          array[0] = 999;
        }
        return index === 1;
      });
      expect(result4).assertEqual(2);
      // 5. find on (1,2,3,4,5) 3-arg sets array.length=2 at index 1, callCount=2
      const arr5 = new SparseArray<int>(1, 2, 3, 4, 5);
      let callCount5: int = 0;
      arr5.find((value: int, index: int, array: SparseArray<int>) => {
        callCount5 = callCount5 + 1;
        if (index === 1) {
          array.length = 2;
        }
        return false;
      });
      expect(callCount5).assertEqual(2);
      // 6. find on (1,2,3,4,5) 3-arg array.length===5 && index===0 -> lengthChecked
      const arr6 = new SparseArray<int>(1, 2, 3, 4, 5);
      let lengthChecked6: boolean = false;
      arr6.find((value: int, index: int, array: SparseArray<int>) => {
        if (array.length === 5 && index === 0) {
          lengthChecked6 = true;
        }
        return lengthChecked6;
      });
      expect(lengthChecked6).assertTrue();
      // 7. find on (1,2,3) 3-arg array reference stable, referenceChanged=false
      const arr7 = new SparseArray<int>(1, 2, 3);
      let referenceChanged7: boolean = false;
      let firstArrayRef7: SparseArray<int> | null = null;
      arr7.find((value: int, index: int, array: SparseArray<int>) => {
        if (firstArrayRef7 === null) {
          firstArrayRef7 = array;
        } else if (firstArrayRef7 !== array) {
          referenceChanged7 = true;
        }
        return false;
      });
      expect(referenceChanged7).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_PART_0700
     * @tc.name sparseArrayFindPartTest007
     * @tc.desc predicate shapes named/constant, throw propagation & post-match operations (8 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayFindPartTest007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. named function predicate isPositive on (-1,2,-3) -> 2
      const isPositive1 = (value: int): boolean => value > 0;
      const arr1 = new SparseArray<int>(-1, 2, -3);
      const result1 = arr1.find(isPositive1);
      expect(result1).assertEqual(2);
      // 2. always-true predicate on (10,20,30) -> 10
      const arr2 = new SparseArray<int>(10, 20, 30);
      const result2 = arr2.find((value: int) => true);
      expect(result2).assertEqual(10);
      // 3. predicate throws Error('second element')
      const arr3 = new SparseArray<int>(1, 2, 3);
      try {
        arr3.find((value: int) => {
          if (value === 2) {
            throw new Error('second element');
          }
          return value === 999;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      // 4. predicate throws RangeError('test range')
      const arr4 = new SparseArray<int>(1, 2, 3);
      try {
        arr4.find((value: int) => {
          throw new RangeError('test range');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      // 5. find on (1,2) with value > 1 -> 2, then push(3)
      const arr5 = new SparseArray<int>(1, 2);
      const result5 = arr5.find((value: int) => value > 1);
      expect(result5).assertEqual(2);
      arr5.push(3);
      expect(arr5.length).assertEqual(3);
      expect(arr5[2]).assertEqual(3);
      // 6. find on (1,2,3) with value > 0 -> 1, $_iterator sum=6
      const arr6 = new SparseArray<int>(1, 2, 3);
      const result6 = arr6.find((value: int) => value > 0);
      expect(result6).assertEqual(1);
      let sum6: int = 0;
      const iter6 = arr6.$_iterator();
      let r6 = iter6.next();
      while (!r6.done) {
        sum6 = sum6 + (r6.value as int);
        r6 = iter6.next();
      }
      expect(sum6).assertEqual(6);
      // 7. find on (1,2,3) with value > 0 -> 1, then arr[1]=99
      const arr7 = new SparseArray<int>(1, 2, 3);
      const result7 = arr7.find((value: int) => value > 0);
      expect(result7).assertEqual(1);
      arr7[1] = 99;
      expect(arr7[1]).assertEqual(99);
      // 8. find on (10,20,30,40) with value > 25 -> 30, then length=2
      const arr8 = new SparseArray<int>(10, 20, 30, 40);
      const result8 = arr8.find((value: int) => value > 25);
      expect(result8).assertEqual(30);
      arr8.length = 2;
      expect(arr8.length).assertEqual(2);
      expect(arr8[0]).assertEqual(10);
      expect(arr8[1]).assertEqual(20);
    });
  });
}
