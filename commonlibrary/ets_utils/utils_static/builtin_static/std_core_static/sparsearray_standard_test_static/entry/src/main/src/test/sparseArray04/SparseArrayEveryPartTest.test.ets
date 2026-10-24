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

// Merged from SparseArrayEveryPart01Test + SparseArrayEveryPart03Test (35 scenarios -> 4 cases, each <=10)
export default function sparseArrayEveryPartTest(): void {
  describe('SparseArrayEveryPartTest', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_PART_0100
     * @tc.name sparseArrayEveryPartTest001
     * @tc.desc every() all-true returns across types (8 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayEveryPartTest001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. every arity=1 on sparse len=4 {0:10, 3:40} value>0 -> true
      const arr1 = new SparseArray<int>(4);
      arr1[0] = 10;
      arr1[3] = 40;
      const result1 = arr1.every((value: int): boolean => value > 0);
      expect(result1).assertTrue();
      // 2. every T=string ('a','b','c') nonEmpty length>0 -> true
      const nonEmpty2 = (value: string): boolean => value.length > 0;
      const arr2 = new SparseArray<string>('a', 'b', 'c');
      const result2 = arr2.every(nonEmpty2);
      expect(result2).assertTrue();
      // 3. every T=boolean (true,true) value -> true (firstVal captured true)
      const arr3 = new SparseArray<boolean>(true, true);
      let firstVal3: boolean = false;
      const result3 = arr3.every((value: boolean): boolean => {
        firstVal3 = value;
        return value;
      });
      expect(firstVal3).assertTrue();
      expect(result3).assertTrue();
      // 4. every T=bigint (9223372036854775807n) value===max -> true (receivedMax true)
      const maxBig4: bigint = 9223372036854775807n;
      const arr4 = new SparseArray<bigint>(maxBig4);
      let receivedMax4: boolean = false;
      const result4 = arr4.every((value: bigint): boolean => {
        if (value === 9223372036854775807n) {
          receivedMax4 = true;
        }
        return value === 9223372036854775807n;
      });
      expect(receivedMax4).assertTrue();
      expect(result4).assertTrue();
      // 5. every null predicate [null] value===null -> true
      const arr5 = new SparseArray<int | null>();
      arr5[0] = null;
      const result5 = arr5.every(
        (value: int | null, _index: int, _array: SparseArray<int | null>): boolean => value === null,
      );
      expect(result5).assertTrue();
      // 6. every NaN predicate [NaN,NaN,NaN] isNaN -> true
      const arr6 = new SparseArray<number>();
      arr6[0] = Number.NaN;
      arr6[1] = Number.NaN;
      arr6[2] = Number.NaN;
      const result6 = arr6.every((value: number, _index: int, _array: SparseArray<number>): boolean => isNaN(value));
      expect(result6).assertTrue();
      // 7. every MAX_VALUE predicate value>0 -> true
      const arr7 = new SparseArray<number>();
      arr7[0] = Number.MAX_VALUE;
      const result7 = arr7.every((value: number, _index: int, _array: SparseArray<number>): boolean => value > 0);
      expect(result7).assertTrue();
      // 8. every bigint (-9223372036854775808n) value<0n -> true
      const arr8 = new SparseArray<bigint>(-9223372036854775808n);
      const result8 = arr8.every((value: bigint, _index: int, _array: SparseArray<bigint>): boolean => value < 0n);
      expect(result8).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_PART_0200
     * @tc.name sparseArrayEveryPartTest002
     * @tc.desc every() all-false returns across types (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayEveryPartTest002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. every T=int (0,1,2) receivedZero value!==0 -> false
      const arr1 = new SparseArray<int>(0, 1, 2);
      let receivedZero1: boolean = false;
      const result1 = arr1.every((value: int): boolean => {
        if (value === 0) {
          receivedZero1 = true;
        }
        return value !== 0;
      });
      expect(receivedZero1).assertTrue();
      expect(result1).assertFalse();
      // 2. every T=int (2147483647, 1) receivedMax value!==MAX -> false
      const maxInt2: int = 2147483647;
      const arr2 = new SparseArray<int>(maxInt2, 1);
      let receivedMax2: boolean = false;
      const result2 = arr2.every((value: int): boolean => {
        if (value === 2147483647) {
          receivedMax2 = true;
        }
        return value !== 2147483647;
      });
      expect(receivedMax2).assertTrue();
      expect(result2).assertFalse();
      // 3. every T=string ('','a','b') receivedEmpty length>0 -> false
      const arr3 = new SparseArray<string>('', 'a', 'b');
      let receivedEmpty3: boolean = false;
      const result3 = arr3.every((value: string): boolean => {
        if (value.length === 0) {
          receivedEmpty3 = true;
        }
        return value.length > 0;
      });
      expect(receivedEmpty3).assertTrue();
      expect(result3).assertFalse();
      // 4. every T=boolean (false,false) value -> false (firstVal false)
      const arr4 = new SparseArray<boolean>(false, false);
      let firstVal4: boolean = true;
      const result4 = arr4.every((value: boolean): boolean => {
        firstVal4 = value;
        return value;
      });
      expect(firstVal4).assertFalse();
      expect(result4).assertFalse();
      // 5. every T=double (NaN, 1.0) receivedNaN !isNaN -> false
      const arr5 = new SparseArray<double>(Number.NaN, 1.0);
      let receivedNaN5: boolean = false;
      const result5 = arr5.every((value: double): boolean => {
        let d: double = value;
        if (d != d) {
          receivedNaN5 = true;
        }
        return !isNaN(value);
      });
      expect(receivedNaN5).assertTrue();
      expect(result5).assertFalse();
      // 6. every T=double (Infinity, 1.0) receivedInf value!==Infinity -> false
      const arr6 = new SparseArray<double>(Number.POSITIVE_INFINITY, 1.0);
      let receivedInf6: boolean = false;
      const result6 = arr6.every((value: double): boolean => {
        if (value == 1.0 / 0.0) {
          receivedInf6 = true;
        }
        return value !== Number.POSITIVE_INFINITY;
      });
      expect(receivedInf6).assertTrue();
      expect(result6).assertFalse();
      // 7. every T=boolean (false,false,false) value -> false
      const arr7 = new SparseArray<boolean>(false, false, false);
      const result7 = arr7.every((value: boolean, _index: int, _array: SparseArray<boolean>): boolean => value);
      expect(result7).assertFalse();
      // 8. every T=int (1,-2,3) value>0 -> false
      const arr8 = new SparseArray<int>(1, -2, 3);
      const result8 = arr8.every((value: int, _index: int, _array: SparseArray<int>): boolean => value > 0);
      expect(result8).assertFalse();
      // 9. every T=boolean (true,false) value -> false
      const arr9 = new SparseArray<boolean>(true, false);
      const result9 = arr9.every((value: boolean, _index: int, _array: SparseArray<boolean>): boolean => value);
      expect(result9).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_PART_0300
     * @tc.name sparseArrayEveryPartTest003
     * @tc.desc every() callback args (value/index/array), sparse traversal & short-circuit (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayEveryPartTest003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. every arity=2 (value, index) on (10,20,30) captures index 1 value 20 -> indexUsed true
      const arr1 = new SparseArray<int>(10, 20, 30);
      let indexUsed1: boolean = false;
      arr1.every((value: int, index: int): boolean => {
        if (index === 1 && value === 20) {
          indexUsed1 = true;
        }
        return true;
      });
      expect(indexUsed1).assertTrue();
      // 2. every arity=3 (value, index, array) on (10,20,30) captures value 20 index 1 array.length 3 -> allAvailable true
      const arr2 = new SparseArray<int>(10, 20, 30);
      let allAvailable2: boolean = false;
      arr2.every((value: int, index: int, array: SparseArray<int>): boolean => {
        if (value === 20 && index === 1 && array.length === 3) {
          allAvailable2 = true;
        }
        return true;
      });
      expect(allAvailable2).assertTrue();
      // 3. every T=int on (100,200,300) checks arr[index]===value for all -> allMatch true
      const arr3 = new SparseArray<int>(100, 200, 300);
      let allMatch3: boolean = true;
      arr3.every((value: int, index: int): boolean => {
        if (arr3[index] !== value) {
          allMatch3 = false;
        }
        return true;
      });
      expect(allMatch3).assertTrue();
      // 4. every T=double (1.5,2.5,3.5) invokes predicate through last value -> lastVal 3.5
      const arr4 = new SparseArray<double>(1.5, 2.5, 3.5);
      let lastVal4: double = 0.0;
      arr4.every((value: double): boolean => {
        lastVal4 = value;
        return true;
      });
      expect(lastVal4).assertEqual(3.5);
      // 5. every on sparse len=100 {99:777} captures index 99 -> capturedIndex 99
      const arr5 = new SparseArray<int>(100);
      arr5[99] = 777;
      let capturedIndex5 = -1;
      arr5.every((_value: int, index: int, _array: SparseArray<int>): boolean => {
        capturedIndex5 = index;
        return true;
      });
      expect(capturedIndex5).assertEqual(99);
      // 6. every on (10,20,30) passes values 10,20,30 indexes 0,1,2 array ref; callCount 3 -> true
      const arr6 = new SparseArray<int>(10, 20, 30);
      let callCount6: int = 0;
      let visitedIndexes6: int[] = [];
      let visitedValues6: int[] = [];
      let callbackArray6 = new SparseArray<int>();
      const result6 = arr6.every((value: int, index: int, array: SparseArray<int>): boolean => {
        callCount6++;
        callbackArray6 = array;
        visitedIndexes6.push(index);
        visitedValues6.push(value);
        return true;
      });
      expect(result6).assertTrue();
      expect(callCount6).assertEqual(3);
      expect(visitedIndexes6[0]).assertEqual(0);
      expect(visitedIndexes6[1]).assertEqual(1);
      expect(visitedIndexes6[2]).assertEqual(2);
      expect(visitedValues6[0]).assertEqual(10);
      expect(visitedValues6[1]).assertEqual(20);
      expect(visitedValues6[2]).assertEqual(30);
      expect(callbackArray6).assertEqual(arr6);
      // 7. every on sparse len=10 {0:1, 9:9} visits stored entries indexes 0,9; callCount 2 -> true
      const arr7 = new SparseArray<int>(10);
      arr7[0] = 1;
      arr7[9] = 9;
      let callCount7: int = 0;
      let visitedIndexes7: int[] = [];
      let visitedValues7: int[] = [];
      let callbackArray7 = new SparseArray<int>();
      const result7 = arr7.every((value: int, index: int, array: SparseArray<int>): boolean => {
        callCount7++;
        callbackArray7 = array;
        visitedIndexes7.push(index);
        visitedValues7.push(value);
        return true;
      });
      expect(result7).assertTrue();
      expect(callCount7).assertEqual(2);
      expect(visitedIndexes7[0]).assertEqual(0);
      expect(visitedIndexes7[1]).assertEqual(9);
      expect(visitedValues7[0]).assertEqual(1);
      expect(visitedValues7[1]).assertEqual(9);
      expect(callbackArray7).assertEqual(arr7);
      // 8. every on (1,2,-1,4,5) value>0 stops at -1; visited length 3 [1,2,-1] -> false
      const arr8 = new SparseArray<int>(1, 2, -1, 4, 5);
      let visited8: int[] = [];
      const result8 = arr8.every((value: int, _index: int, _array: SparseArray<int>): boolean => {
        visited8.push(value);
        return value > 0;
      });
      expect(result8).assertFalse();
      let actualValue8a: int = visited8.length;
      let expectedValue8a: int = 3;
      expect(actualValue8a).assertEqual(expectedValue8a);
      let actualValue8b: number = visited8[0];
      let expectedValue8b: int = 1;
      expect(actualValue8b).assertEqual(expectedValue8b);
      let actualValue8c: number = visited8[1];
      let expectedValue8c: int = 2;
      expect(actualValue8c).assertEqual(expectedValue8c);
      let actualValue8d: number = visited8[2];
      let expectedValue8d: int = -1;
      expect(actualValue8d).assertEqual(expectedValue8d);
      // 9. every on sparse len=10 {0:1, 5:0, 9:3} value>0 stops at index 5; visited length 2 -> false
      const arr9 = new SparseArray<int>(10);
      arr9[0] = 1;
      arr9[5] = 0;
      arr9[9] = 3;
      let visited9: int[] = [];
      const result9 = arr9.every((value: int, _index: int, _array: SparseArray<int>): boolean => {
        visited9.push(value);
        return value > 0;
      });
      expect(result9).assertFalse();
      let actualValue9a: int = visited9.length;
      let expectedValue9a: int = 2;
      expect(actualValue9a).assertEqual(expectedValue9a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_PART_0400
     * @tc.name sparseArrayEveryPartTest004
     * @tc.desc every() throw propagation, traversal mutation & null-element handling (9 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayEveryPartTest004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. every predicate throws TypeError on (100,200) -> propagates TypeError
      const arr1 = new SparseArray<int>(100, 200);
      try {
        arr1.every((_value: int, _index: int, _array: SparseArray<int>): boolean => {
          throw new TypeError('type mismatch');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      // 2. every predicate throws RangeError at callCount 2 on (10,20,30,40) -> propagates RangeError
      const arr2 = new SparseArray<int>(10, 20, 30, 40);
      try {
        let callCount2 = 0;
        arr2.every((_value: int, _index: int, _array: SparseArray<int>): boolean => {
          callCount2++;
          if (callCount2 === 2) {
            throw new RangeError('out of range');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      // 3. every propagates Error after preceding callback returns true (throw at value 2) on (1,2,3)
      const arr3 = new SparseArray<int>(1, 2, 3);
      try {
        arr3.every((value: int, _index: int, _array: SparseArray<int>): boolean => {
          if (value === 2) {
            throw new Error('throw at value 2');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      // 4. every propagates Error thrown after callback modifies arr[0] on (1,2,3)
      const arr4 = new SparseArray<int>(1, 2, 3);
      try {
        arr4.every((_value: int, _index: int, _array: SparseArray<int>): boolean => {
          arr4[0] = 999;
          throw new Error('modify and throw');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      // 5. every on (1,2,3) supplies first two values before callback overwrites arr[2]=999
      const arr5 = new SparseArray<int>(1, 2, 3);
      let values5: int[] = [];
      arr5.every((value: int, _index: int, _array: SparseArray<int>): boolean => {
        values5.push(value);
        arr5[2] = 999;
        return true;
      });
      let actualValue5a: number = values5[0];
      let expectedValue5a: int = 1;
      expect(actualValue5a).assertEqual(expectedValue5a);
      let actualValue5b: number = values5[1];
      let expectedValue5b: int = 2;
      expect(actualValue5b).assertEqual(expectedValue5b);
      expect(arr5[2]).assertEqual(999);
      // 6. every on (1,2,3,4,5) clearing length=0 stops further callbacks; callCount 1
      const arr6 = new SparseArray<int>(1, 2, 3, 4, 5);
      let callCount6 = 0;
      arr6.every((_value: int, _index: int, _array: SparseArray<int>): boolean => {
        callCount6++;
        arr6.length = 0;
        return true;
      });
      expect(callCount6).assertEqual(1);
      // 7. every on (1,2,3) observes item appended during traversal; callCount 4 -> true
      const arr7 = new SparseArray<int>(1, 2, 3);
      let callCount7 = 0;
      const result7 = arr7.every((_value: int, index: int, _array: SparseArray<int>): boolean => {
        callCount7++;
        if (index === 0) {
          arr7[arr7.length] = 999;
        }
        return true;
      });
      expect(result7).assertTrue();
      expect(callCount7).assertEqual(4);
      // 8. every null predicate [null,null,null] value!==null -> false
      const arr8 = new SparseArray<int | null>();
      arr8[0] = null;
      arr8[1] = null;
      arr8[2] = null;
      const result8 = arr8.every(
        (value: int | null, _index: int, _array: SparseArray<int | null>): boolean => value !== null,
      );
      expect(result8).assertFalse();
      // 9. every null predicate [1,null,3] value!==null -> false
      const arr9 = new SparseArray<int | null>();
      arr9[0] = 1 as int;
      arr9[1] = null;
      arr9[2] = 3 as int;
      const result9 = arr9.every(
        (value: int | null, _index: int, _array: SparseArray<int | null>): boolean => value !== null,
      );
      expect(result9).assertFalse();
    });
  });
}
