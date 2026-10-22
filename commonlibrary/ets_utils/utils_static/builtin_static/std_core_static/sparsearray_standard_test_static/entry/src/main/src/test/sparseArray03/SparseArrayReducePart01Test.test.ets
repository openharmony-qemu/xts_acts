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
} from "../../../../hypium/index";
import Utils from "../Util.test";

interface Obj02102 {
  id: int;
  name: string;
}

class CustomReduceError01301 extends Error {
  errorCode: int = 0;
  constructor(msg: string, c: int) {
    super(msg);
    this.errorCode = c;
  }
}

export default function sparseArrayReduceTestPart01(): void {
  describe("SparseArrayReduceTestPart01", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_PART01_0100
     * @tc.name sparseArrayReduceTestPart01001
     * @tc.desc reduce sum/product/max on int & boolean arrays (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayReduceTestPart01001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. reduce product of three 5s via prev times curr callback yields 125
      const arr1 = new SparseArray<int>(5, 5, 5);
      const fn1: (prev: int, curr: int, i: int, a: SparseArray<int>) => int = (prev: int, curr: int, i: int, a: SparseArray<int>): int => { return prev * curr; };
      const result1: int = arr1.reduce(fn1);
      expect(result1).assertEqual(125);
      // 2. reduce sum of 10 20 30 leaves final captured prev as 30
      let capturedPrev2: int = 0;
      const arr2 = new SparseArray<int>(10, 20, 30);
      arr2.reduce((prev: int, curr: int, i: int, a: SparseArray<int>): int => { capturedPrev2 = prev; return prev + curr; });
      expect(capturedPrev2).assertEqual(30);
      // 3. reduce sum of 5 10 15 passes accumulated prev 15 into second callback
      let secondPrev3: int = 0;
      let callCount3: int = 0;
      const arr3 = new SparseArray<int>(5, 10, 15);
      arr3.reduce((prev: int, curr: int, i: int, a: SparseArray<int>): int => { callCount3++; if (callCount3 === 2) { secondPrev3 = prev; } return prev + curr; });
      expect(secondPrev3).assertEqual(15);
      // 4. reduce sums int max 2147483647 with 0 keeping 2147483647
      const arr4 = new SparseArray<int>(2147483647, 0);
      const result4 = arr4.reduce((acc: int, curr: int): int => acc + curr);
      expect(result4).assertEqual(2147483647);
      // 5. reduce on of(7) single-element int array returns 7 without callback
      const arr5 = SparseArray.of<int>(7);
      const result5: int = arr5.reduce((prev: int, curr: int, i: int, a: SparseArray<int>): int => prev + curr);
      expect(result5).assertEqual(7);
      // 6. reduce discards prev and returns curr on 1 2 99 yields last element 99
      const arr6 = new SparseArray<int>(1, 2, 99);
      const result6: int = arr6.reduce((prev: int, curr: int, i: int, a: SparseArray<int>): int => curr);
      expect(result6).assertEqual(99);
      // 7. reduce aborts with Error when accumulated sum exceeds 20 leaving result -999
      const arr7 = new SparseArray<int>(5, 10, 15);
      let resultCaptured7: int = -999;
      try {
        resultCaptured7 = arr7.reduce((prev: int, curr: int, i: int, a: SparseArray<int>): int => { if (prev + curr > 20) { throw new Error('stop at 20'); } return prev + curr; });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(resultCaptured7).assertEqual(-999);
      }
      // 8. reduce with AND over all-true booleans returns true
      const arr8 = new SparseArray<boolean>(true, true, true);
      const result8 = arr8.reduce((acc: boolean, curr: boolean): boolean => acc && curr);
      expect(result8).assertTrue();
      // 9. reduce with OR over false false true booleans returns true
      const arr9 = new SparseArray<boolean>(false, false, true);
      const result9 = arr9.reduce((acc: boolean, curr: boolean): boolean => acc || curr);
      expect(result9).assertTrue();
      // 10. reduce with OR over two false booleans returns false
      const arr10 = new SparseArray<boolean>(false, false);
      const fn10: (prev: boolean, curr: boolean, i: int, a: SparseArray<boolean>) => boolean = (prev: boolean, curr: boolean, i: int, a: SparseArray<boolean>): boolean => { return prev || curr; };
      const result10: boolean = arr10.reduce(fn10);
      expect(result10).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_PART01_0200
     * @tc.name sparseArrayReduceTestPart01002
     * @tc.desc reduce callback args (acc/curr) on string/double/object/RegExp/Date (10 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayReduceTestPart01002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. reduce on Chinese strings uses first element as initial prev
      let prevStr1: string = '';
      const arr1 = new SparseArray<string>('中文', '测试');
      arr1.reduce((prev: string, curr: string): string => { prevStr1 = prev; return prev + curr; });
      expect(prevStr1).assertEqual('中文');
      // 2. reduce on object array captures first object id 1 name first as prev
      let captured2: Obj02102 = { id: 0, name: '' } as Obj02102;
      const arr2 = new SparseArray<Obj02102>({ id: 1, name: 'first' } as Obj02102, { id: 2, name: 'second' } as Obj02102);
      arr2.reduce((prev: Obj02102, curr: Obj02102, i: int, a: SparseArray<Obj02102>): Obj02102 => { captured2 = prev; return curr; });
      expect(captured2.id).assertEqual(1);
      expect(captured2.name).assertEqual('first');
      // 3. reduce with doubles uses accumulated prev 1.5 for second callback on 0.0 1.5 2.5
      let prevDouble3: double = -1.0;
      const arr3 = new SparseArray<double>(0.0, 1.5, 2.5);
      arr3.reduce((prev: double, curr: double): double => { prevDouble3 = prev; return prev + curr; });
      expect(prevDouble3).assertEqual(1.5);
      // 4. reduce visits last element c as curr including empty string element
      let currStr4: string = 'x';
      const arr4 = new SparseArray<string>('a', '', 'c');
      arr4.reduce((prev: string, curr: string, i: int, a: SparseArray<string>): string => { currStr4 = curr; return prev + curr; });
      expect(currStr4).assertEqual('c');
      // 5. reduce with boolean AND visits final true as curr on true false true
      let currBool5: boolean = true;
      const arr5 = new SparseArray<boolean>(true, false, true);
      arr5.reduce((prev: boolean, curr: boolean, i: int, a: SparseArray<boolean>): boolean => { currBool5 = curr; return prev && curr; });
      expect(currBool5).assertTrue();
      // 6. reduce on single element hello returns it unchanged without calling callback
      const arr6 = new SparseArray<string>('hello');
      const result6 = arr6.reduce((acc: string, curr: string): string => acc + curr);
      expect(result6).assertEqual('hello');
      // 7. reduce concatenates Chinese strings into combined result
      const arr7 = new SparseArray<string>('你好', '世界');
      const result7 = arr7.reduce((acc: string, curr: string): string => acc + curr);
      expect(result7).assertEqual('你好世界');
      // 8. reduce joins string elements a b and c with a dash separator to yield a-b-c
      const arr8 = new SparseArray<string>('a', 'b', 'c');
      const fn8: (prev: string, curr: string, i: int, a: SparseArray<string>) => string = (prev: string, curr: string, i: int, a: SparseArray<string>): string => { return prev + '-' + curr; };
      const result8: string = arr8.reduce(fn8);
      expect(result8).assertEqual('a-b-c');
      // 9. reduce keeps initial RegExp acc whose source is a
      const arr9 = new SparseArray<RegExp>(new RegExp('a'), new RegExp('b'));
      const result9 = arr9.reduce((acc: RegExp, curr: RegExp): RegExp => acc);
      expect(result9.source).assertEqual('a');
      // 10. reduce over two Date elements returns the identical second Date instance
      const firstDate10 = new Date(0);
      const secondDate10 = new Date(1000);
      const arr10 = new SparseArray<Date>(firstDate10, secondDate10);
      const fn10: (prev: Date, curr: Date, i: int, a: SparseArray<Date>) => Date = (prev: Date, curr: Date, i: int, a: SparseArray<Date>): Date => { return curr; };
      const result10: Date = arr10.reduce(fn10);
      let actualBoolean10: boolean = result10 === secondDate10;
      expect(actualBoolean10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REDUCE_PART01_0300
     * @tc.name sparseArrayReduceTestPart01003
     * @tc.desc reduce on bigint/long/NaN typed elements & error propagation (8 scenarios)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('sparseArrayReduceTestPart01003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 1. reduce sums bigint elements 100n 200n and 300n to yield 600n
      const arr1 = new SparseArray<bigint>(100n, 200n, 300n);
      const fn1: (prev: bigint, curr: bigint, i: int, a: SparseArray<bigint>) => bigint = (prev: bigint, curr: bigint, i: int, a: SparseArray<bigint>): bigint => { return prev + curr; };
      const result1: bigint = arr1.reduce(fn1);
      expect(result1).assertEqual(600n);
      // 2. reduce sums long elements 1 2 and 3 to produce the long value 6
      const arr2 = new SparseArray<long>(1 as long, 2 as long, 3 as long);
      const fn2: (prev: long, curr: long, i: int, a: SparseArray<long>) => long = (prev: long, curr: long, i: int, a: SparseArray<long>): long => { return prev + curr; };
      const result2: long = arr2.reduce(fn2);
      let expectedLong2: long = 6 as long;
      expect(result2).assertEqual(expectedLong2);
      // 3. reduce summing double NaN with 1.0 and 3.0 yields NaN
      const arr3 = new SparseArray<double>(1.0, Double.NaN, 3.0);
      const result3 = arr3.reduce((acc: double, curr: double): double => acc + curr);
      let actualBoolean3: boolean = isNaN(result3);
      expect(actualBoolean3).assertTrue();
      // 4. reduce propagates TypeError thrown inside reducer callback
      const arr4 = new SparseArray<int>(10, 20, 30);
      try {
        arr4.reduce((prev: int, curr: int, i: int, a: SparseArray<int>): int => { throw new TypeError('type error in reducer'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      // 5. reduce propagates custom Error with message custom reduce error code 42
      const arr5 = new SparseArray<int>(1, 2, 3);
      try {
        arr5.reduce((prev: int, curr: int, i: int, a: SparseArray<int>): int => { throw new CustomReduceError01301('custom reduce error code 42', 42); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('custom reduce error code 42');
      }
      // 6. reduce propagates SyntaxError thrown inside reducer callback
      const arr6 = new SparseArray<int>(5, 10, 15);
      try {
        arr6.reduce((prev: int, curr: int, i: int, a: SparseArray<int>): int => { throw new SyntaxError('syntax error in reducer'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('SyntaxError');
      }
      // 7. reduce throws Error when boolean AND yields false leaving partialBool false
      const arr7 = new SparseArray<boolean>(true, true, false, true);
      let partialBool7: boolean = true;
      try {
        arr7.reduce((prev: boolean, curr: boolean, i: int, a: SparseArray<boolean>): boolean => { partialBool7 = prev && curr; if (partialBool7 === false) { throw new Error('false detected'); } return partialBool7; });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(partialBool7).assertFalse();
      }
      // 8. reduce propagates RangeError thrown inside the reducer callback
      const arr8 = new SparseArray<int>(1, 2, 3);
      try {
        arr8.reduce((prev: int, curr: int, i: int, a: SparseArray<int>): int => { throw new RangeError('value out of range in reducer'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });
  });
}
