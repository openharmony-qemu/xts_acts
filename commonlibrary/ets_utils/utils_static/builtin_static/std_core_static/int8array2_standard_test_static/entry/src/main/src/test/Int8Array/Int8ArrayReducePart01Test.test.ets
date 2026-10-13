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

class Acc001 {
  sum: number = 0;
}
class Stats001 {
  count: int = 0;
  max: number = -128;
}
class AccC001 {
  sum: number = 0;
}

function boom001(): number {
  throw new Error('nested');
}

export default function int8ArrayReducePart01Test(): void {
  describe('Int8ArrayReducePart01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    const INT8_MAX = 127;
    const INT8_MIN = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_0100
     * @tc.name int8ArrayReducePart01Test001
     * @tc.desc Verify reduce 2 callbackfn + initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_0200
     * @tc.name int8ArrayReducePart01Test002
     * @tc.desc Verify callbackfn 1 previousValue reduce length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduce<number>((p: number) => p + 1, 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_0300
     * @tc.name int8ArrayReducePart01Test003
     * @tc.desc Verify reduce callbackfn 2 previousValue, currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduce<number>((p: number, c: number) => p + c, 10);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_0400
     * @tc.name int8ArrayReducePart01Test004
     * @tc.desc Verify reduce callbackfn 3 currentIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let result = arr.reduce<number>((p: number, c: number, i: int) => p + c + i, 0);
      expect(result).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_0500
     * @tc.name int8ArrayReducePart01Test005
     * @tc.desc Verify reduce callbackfn 4 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c + a.length, 0);
      expect(result).assertEqual(34);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_0600
     * @tc.name int8ArrayReducePart01Test006
     * @tc.desc Verify reduce previousValue initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      let captured: number = 0;
      arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => {
        if (i === 0) {
          captured = p;
        }
        return p + c;
      }, 99);
      expect(captured).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_0700
     * @tc.name int8ArrayReducePart01Test007
     * @tc.desc Verify reduce currentValue arr.$_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([42, 7]);
      let captured: number = 0;
      arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => {
        if (i === 0) {
          captured = c;
        }
        return p + c;
      }, 0);
      expect(captured).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_0800
     * @tc.name int8ArrayReducePart01Test008
     * @tc.desc Verify reduce currentIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      let captured: int = -1;
      arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => {
        if (i === 0) {
          captured = i;
        }
        return p + c;
      }, 0);
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_0900
     * @tc.name int8ArrayReducePart01Test009
     * @tc.desc Verify reduce callback array argument is Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let captured: Int8Array = arr;
      arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => {
        if (i === 0) {
          captured = a;
        }
        return p + c;
      }, 0);
      captured[0] = 77;
      let capturedValue: number = arr[0];
      let expectedValue: int = 77;
      expect(capturedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_1000
     * @tc.name int8ArrayReducePart01Test010
     * @tc.desc Verify reduce callback previousValue is 15 at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20]);
      let captured: number = 0;
      arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => {
        if (i === 1) {
          captured = p;
        }
        return p + c;
      }, 5);
      expect(captured).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_1100
     * @tc.name int8ArrayReducePart01Test011
     * @tc.desc Verify reduce currentIndex 1 0,1,2,...
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3, 4]);
      let indices: string = '';
      arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => {
        indices = indices + i.toString();
        return p + c;
      }, 0);
      expect(indices).assertEqual('0123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_1200
     * @tc.name int8ArrayReducePart01Test012
     * @tc.desc Verify reduce array iter0 iter1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let first: Int8Array = arr;
      let second: Int8Array = arr;
      arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => {
        if (i === 0) {
          first = a;
        }
        if (i === 1) {
          second = a;
        }
        return p + c;
      }, 0);
      first[2] = 55;
      let capturedValue: number = second[2];
      let expectedValue: int = 55;
      expect(capturedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_1300
     * @tc.name int8ArrayReducePart01Test013
     * @tc.desc Verify reduce callback receives currentValue sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let seq: string = '';
      arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => {
        seq = seq + c.toString() + ',';
        return p + c;
      }, 0);
      expect(seq).assertEqual('10,20,30,');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_1400
     * @tc.name int8ArrayReducePart01Test014
     * @tc.desc Verify reduce callback returns constant 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => 42, 0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_1500
     * @tc.name int8ArrayReducePart01Test015
     * @tc.desc Verify reduce callback previousValue initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p, 7);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_1600
     * @tc.name int8ArrayReducePart01Test016
     * @tc.desc Verify reduce callback p + c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-1, -2, -3]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      expect(result).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_1700
     * @tc.name int8ArrayReducePart01Test017
     * @tc.desc Verify reduce callback p * c initialValue=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([2, 3, 4]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p * c, 1);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_1800
     * @tc.name int8ArrayReducePart01Test018
     * @tc.desc Verify reduce callback with Math max returns one hundred
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-5, 100, 30]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => Math.max(p, c), -128);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_1900
     * @tc.name int8ArrayReducePart01Test019
     * @tc.desc Verify reduce callback p - c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 3, 2]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p - c, 0);
      expect(result).assertEqual(-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_2000
     * @tc.name int8ArrayReducePart01Test020
     * @tc.desc Verify reduce callback concatenates each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduce<string>((p: string, c: number, i: int, a: Int8Array) => p + c.toString(), '');
      expect(result).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_2100
     * @tc.name int8ArrayReducePart01Test021
     * @tc.desc Verify reduce callback U=Acc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20]);
      let init = new Acc001();
      let result = arr.reduce<Acc001>((p: Acc001, c: number, i: int, a: Int8Array) => {
        p.sum = p.sum + c;
        return p;
      }, init);
      let capturedSum: number = result.sum;
      let expectedValue: int = 30;
      expect(capturedSum).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_2200
     * @tc.name int8ArrayReducePart01Test022
     * @tc.desc Verify reduce callback multiplies each element by 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let multiplier: number = 10;
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c * multiplier, 0);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_2300
     * @tc.name int8ArrayReducePart01Test023
     * @tc.desc Verify reduce callback invoked for each of 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 5, 5]);
      let counter: int = 0;
      arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => {
        counter = counter + 1;
        return p + c;
      }, 0);
      expect(counter).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_2400
     * @tc.name int8ArrayReducePart01Test024
     * @tc.desc Verify reduce callback currentIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => (i === 0 ? p : p + c), 0);
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_2500
     * @tc.name int8ArrayReducePart01Test025
     * @tc.desc Verify reduce callback array length contributes 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([4, 5, 6]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + a.length, 0);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_2600
     * @tc.name int8ArrayReducePart01Test026
     * @tc.desc Verify reduce callback array.$_get(currentIndex) currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let ok: boolean = true;
      arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => {
        if (a[i] !== c) {
          ok = false;
        }
        return p + c;
      }, 0);
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_2700
     * @tc.name int8ArrayReducePart01Test027
     * @tc.desc Verify reduce callback with length minus index sums to six
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + (a.length - i), 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_2800
     * @tc.name int8ArrayReducePart01Test028
     * @tc.desc Verify reduce initialValue = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 10]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_2900
     * @tc.name int8ArrayReducePart01Test029
     * @tc.desc Verify reduce initialValue = -128 int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, -128);
      expect(result).assertEqual(-123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_3000
     * @tc.name int8ArrayReducePart01Test030
     * @tc.desc Verify reduce initialValue = 127 int8 int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 127);
      expect(result).assertEqual(132);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_3100
     * @tc.name int8ArrayReducePart01Test031
     * @tc.desc Verify reduce initialValue = -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 5]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, -1);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_3200
     * @tc.name int8ArrayReducePart01Test032
     * @tc.desc Verify reduce initialValue = 128 int8 number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 128);
      expect(result).assertEqual(129);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_3300
     * @tc.name int8ArrayReducePart01Test033
     * @tc.desc Verify reduce initialValue = -129 int8 number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, -129);
      expect(result).assertEqual(INT8_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_3400
     * @tc.name int8ArrayReducePart01Test034
     * @tc.desc Verify reduce initialValue = Number.NaN Number.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, Number.NaN);
      let isResultNaN: boolean = isNaN(result);
      expect(isResultNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_3500
     * @tc.name int8ArrayReducePart01Test035
     * @tc.desc Verify reduce with initialValue = Float.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, Float.POSITIVE_INFINITY);
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_3600
     * @tc.name int8ArrayReducePart01Test036
     * @tc.desc Verify reduce with initialValue = Float.NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, Float.NEGATIVE_INFINITY);
      expect(result).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_3700
     * @tc.name int8ArrayReducePart01Test037
     * @tc.desc Verify reduce initialValue = 1.9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 1.9);
      expect(result).assertEqual(2.9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_3800
     * @tc.name int8ArrayReducePart01Test038
     * @tc.desc Verify reduce with initialValue empty string infers U=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduce<string>(
        (p: string, c: number, i: int, a: Int8Array) => (p === '' ? c.toString() : p + ',' + c.toString()),
        '',
      );
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_3900
     * @tc.name int8ArrayReducePart01Test039
     * @tc.desc Verify reduce with initialValue "init" infers U=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      let result = arr.reduce<string>((p: string, c: number, i: int, a: Int8Array) => p + c.toString(), 'init');
      expect(result).assertEqual('init12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_4000
     * @tc.name int8ArrayReducePart01Test040
     * @tc.desc Verify reduce with initialValue "0" infers U=string accumulates result 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5]);
      let result = arr.reduce<string>((p: string, c: number, i: int, a: Int8Array) => p + c.toString(), '0');
      expect(result).assertEqual('05');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_4100
     * @tc.name int8ArrayReducePart01Test041
     * @tc.desc Verify reduce initialValue = true U=boolean AND
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduce<boolean>((p: boolean, c: number, i: int, a: Int8Array) => p && c > 0, true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_4200
     * @tc.name int8ArrayReducePart01Test042
     * @tc.desc Verify reduce initialValue = false U=boolean OR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduce<boolean>((p: boolean, c: number, i: int, a: Int8Array) => p || c < 0, false);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_4300
     * @tc.name int8ArrayReducePart01Test043
     * @tc.desc Verify reduce with Stats initial captures max seven
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([3, 7, 2]);
      let init = new Stats001();
      let result = arr.reduce<Stats001>((p: Stats001, c: number, i: int, a: Int8Array) => {
        p.count = p.count + 1;
        if (c > p.max) {
          p.max = c;
        }
        return p;
      }, init);
      let capturedMax: number = result.max;
      let expectedValue: int = 7;
      expect(capturedMax).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_4400
     * @tc.name int8ArrayReducePart01Test044
     * @tc.desc Verify reduce U=number number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      let reducedResult = result;
      let capturedType: string = typeof reducedResult;
      let expectedType: string = 'number';
      expect(capturedType).assertEqual(expectedType);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_4500
     * @tc.name int8ArrayReducePart01Test045
     * @tc.desc Verify reduce U=string string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      let result = arr.reduce<string>((p: string, c: number, i: int, a: Int8Array) => p + c.toString(), 'x');
      let reducedResult = result;
      let capturedType: string = typeof reducedResult;
      let expectedType: string = 'string';
      expect(capturedType).assertEqual(expectedType);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_4600
     * @tc.name int8ArrayReducePart01Test046
     * @tc.desc Verify reduce U=boolean boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1]);
      let result = arr.reduce<boolean>((p: boolean, c: number, i: int, a: Int8Array) => p && c > 0, true);
      let reducedResult = result;
      let capturedType: string = typeof reducedResult;
      let expectedType: string = 'boolean';
      expect(capturedType).assertEqual(expectedType);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_4700
     * @tc.name int8ArrayReducePart01Test047
     * @tc.desc Verify reduce invokes callback once per element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([7, 8, 9]);
      let calls: int = 0;
      arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => {
        calls = calls + 1;
        return p + c;
      }, 7);
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_4800
     * @tc.name int8ArrayReducePart01Test048
     * @tc.desc Verify reduce result used as initialValue gives 33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Int8Array([1, 2]);
      let arr2 = new Int8Array([10, 20]);
      let inner = arr1.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      let result = arr2.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, inner);
      expect(result).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_4900
     * @tc.name int8ArrayReducePart01Test049
     * @tc.desc Verify reduce + initialValue initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 42);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_5000
     * @tc.name int8ArrayReducePart01Test050
     * @tc.desc Verify reduce + initialValue p + c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 10);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_5100
     * @tc.name int8ArrayReducePart01Test051
     * @tc.desc Verify reduce + initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c * 2, 0);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_5200
     * @tc.name int8ArrayReducePart01Test052
     * @tc.desc Verify reduce keeps length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      let capturedLength: int = arr.length;
      let expectedValue: int = 3;
      expect(capturedLength).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_5300
     * @tc.name int8ArrayReducePart01Test053
     * @tc.desc Verify reduce leaves element 20 at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      let capturedValue: number = arr[1];
      let expectedValue: int = 20;
      expect(capturedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_5400
     * @tc.name int8ArrayReducePart01Test054
     * @tc.desc Verify reduce U= callback previousValue initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      let init = new AccC001();
      let result = arr.reduce<AccC001>((p: AccC001, c: number, i: int, a: Int8Array) => {
        p.sum = p.sum + c;
        return p;
      }, init);
      result.sum = 999;
      let capturedSum: number = init.sum;
      let expectedValue: int = 999;
      expect(capturedSum).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_5500
     * @tc.name int8ArrayReducePart01Test055
     * @tc.desc Verify reduce callback currentValue previousValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([10, 20, 30]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => c, 0);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_5600
     * @tc.name int8ArrayReducePart01Test056
     * @tc.desc Verify reduce propagates callback TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      try {
        arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => {
          throw new TypeError('type');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_5700
     * @tc.name int8ArrayReducePart01Test057
     * @tc.desc Verify reduce propagates callback plain Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      try {
        arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => {
          if (i === 1) {
            throw new Error('plain');
          }
          return p + c;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_5800
     * @tc.name int8ArrayReducePart01Test058
     * @tc.desc Verify reduce propagates nested callback Error('nested')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2]);
      try {
        arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => boom001(), 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('nested');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_6000
     * @tc.name int8ArrayReducePart01Test060
     * @tc.desc Verify reduce 127 int8 currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX]);
      let captured: number = 999;
      arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => {
        captured = c;
        return p + c;
      }, 0);
      expect(captured).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_6100
     * @tc.name int8ArrayReducePart01Test061
     * @tc.desc Verify reduce 0 currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([0]);
      let captured: number = 999;
      arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => {
        captured = c;
        return p + c;
      }, 1);
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_6200
     * @tc.name int8ArrayReducePart01Test062
     * @tc.desc Verify 128 -128 reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([128]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      expect(result).assertEqual(INT8_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_6300
     * @tc.name int8ArrayReducePart01Test063
     * @tc.desc Verify 255 -1 reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([255]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_6400
     * @tc.name int8ArrayReducePart01Test064
     * @tc.desc Verify 256 0 reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([256]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_6500
     * @tc.name int8ArrayReducePart01Test065
     * @tc.desc Verify Number.NaN 0 reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([Number.NaN]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_6600
     * @tc.name int8ArrayReducePart01Test066
     * @tc.desc Verify reduce on subarray view sums to 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = new Int8Array([1, 2, 3, 4, 5]);
      let view = base.subarray(1, 4);
      let result = view.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_6700
     * @tc.name int8ArrayReducePart01Test067
     * @tc.desc Verify reduce on filled array sums to 21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(3);
      arr.fill(7);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => p + c, 0);
      expect(result).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_6800
     * @tc.name int8ArrayReducePart01Test068
     * @tc.desc Verify reduce callback records sign of each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-5, 3, -1]);
      let result = arr.reduce<string>((p: string, c: number, i: int, a: Int8Array) => p + (c < 0 ? '-' : '+'), '');
      expect(result).assertEqual('-+-');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_6900
     * @tc.name int8ArrayReducePart01Test069
     * @tc.desc Verify reduce callback counts positive elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-5, 3, 7, -1, 2]);
      let result = arr.reduce<number>((p: number, c: number, i: int, a: Int8Array) => (c > 0 ? p + 1 : p), 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_REDUCE_PART01_7000
     * @tc.name int8ArrayReducePart01Test070
     * @tc.desc Verify reduce callback U=string concatenates char codes 65,66,67
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayReducePart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([65, 66, 67]);
      let result: string = arr.reduce<string>((p: string, c: number, i: int, a: Int8Array): string => {
        return p.length === 0 ? c.toString() : p + ',' + c.toString();
      }, '');
      let capturedValue0: string = result;
      let expectedJoined: string = '65,66,67';
      expect(capturedValue0).assertEqual(expectedJoined);
    });
  });
}
