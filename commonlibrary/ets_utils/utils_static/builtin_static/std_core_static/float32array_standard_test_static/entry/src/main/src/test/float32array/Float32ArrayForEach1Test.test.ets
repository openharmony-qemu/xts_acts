'use static'
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
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

class Holder {
  val: number = 0;
}

export default function Float32ArrayForEach1Test(): void {
  describe('Float32ArrayForEach1Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_0100
     * @tc.name testFloat32ArrayForEachONE001
     * @tc.desc Verify callback value parameter equals the element at index 0 (single element 3.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.5]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(3.5);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_0200
     * @tc.name testFloat32ArrayForEachONE002
     * @tc.desc Verify callback value parameter equals each element in turn (three elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      let idx = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(arr.$_get(idx));
        idx = idx + 1;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_0300
     * @tc.name testFloat32ArrayForEachONE003
     * @tc.desc Verify callback value parameter is a negative number (-7.25)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-7.25]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(-7.25);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_0400
     * @tc.name testFloat32ArrayForEachONE004
     * @tc.desc Verify callback value parameter is the integer 0 (+0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_0500
     * @tc.name testFloat32ArrayForEachONE005
     * @tc.desc Verify callback value parameter receives expected element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(i === 0 ? 1.0 : 2.0);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_0600
     * @tc.name testFloat32ArrayForEachONE006
     * @tc.desc Verify callback value parameter receives NaN (assertNaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertNaN();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_0700
     * @tc.name testFloat32ArrayForEachONE007
     * @tc.desc Verify callback value parameter receives Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Infinity]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(Infinity);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_0800
     * @tc.name testFloat32ArrayForEachONE008
     * @tc.desc Verify callback value parameter receives -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-Infinity]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(-Infinity);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_0900
     * @tc.name testFloat32ArrayForEachONE009
     * @tc.desc Verify callback value parameter receives -0 (1/v is -Infinity to verify the sign bit)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.0]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(1 / v).assertEqual(-Infinity);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_1000
     * @tc.name testFloat32ArrayForEachONE010
     * @tc.desc Verify callback value parameter receives Float32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(3.4028234663852886e+38);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_1100
     * @tc.name testFloat32ArrayForEachONE011
     * @tc.desc Verify callback value parameter receives the smallest denormalized number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.401298464324817e-45]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(1.401298464324817e-45);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_1200
     * @tc.name testFloat32ArrayForEachONE012
     * @tc.desc Verify callback value parameter receives 0.1 (float32 precision bit pattern)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.1]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(new Float32Array([0.1])[0]);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_1300
     * @tc.name testFloat32ArrayForEachONE013
     * @tc.desc Verify callback value parameter receives the overflow value 1.0e40 (stored as Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e40]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(Infinity);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_1400
     * @tc.name testFloat32ArrayForEachONE014
     * @tc.desc Verify callback value parameter receives the underflow value 1.0e-46 (stored as +0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e-46]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_1500
     * @tc.name testFloat32ArrayForEachONE015
     * @tc.desc Verify callback value parameter receives mixed special values with bit-by-bit verification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN, Infinity, -0.0, 1.5]);
      let n = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        const expected = arr.$_get(i);
        if (expected !== expected) {
          expect(v).assertNaN();
        } else {
          expect(v).assertEqual(expected);
        }
        n = n + 1;
      });
      expect(n).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_1600
     * @tc.name testFloat32ArrayForEachONE016
     * @tc.desc Verify callback index parameter strictly increases starting from 0 (five elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      let prev = -1;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(i > prev).assertTrue();
        prev = i;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_1700
     * @tc.name testFloat32ArrayForEachONE017
     * @tc.desc Verify callback index parameter has a first value of 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([9.0, 8.0, 7.0]);
      let first = -1;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        if (first === -1) {
          first = i;
        }
      });
      expect(first).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_1800
     * @tc.name testFloat32ArrayForEachONE018
     * @tc.desc Verify callback index parameter has a last value of length - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let last = -1;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        last = i;
      });
      expect(last).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_1900
     * @tc.name testFloat32ArrayForEachONE019
     * @tc.desc Verify callback index parameter sequence equals 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 6.0, 7.0]);
      let seq = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(i).assertEqual(seq);
        seq = seq + 1;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_2000
     * @tc.name testFloat32ArrayForEachONE020
     * @tc.desc Verify callback index parameter stays within valid range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(i >= 0 && i < a.length).assertTrue();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_2100
     * @tc.name testFloat32ArrayForEachONE021
     * @tc.desc Verify callback index parameter is an integer (no fractional part)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(i).assertEqual(Math.floor(i));
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_2200
     * @tc.name testFloat32ArrayForEachONE022
     * @tc.desc Verify callback is not invoked for an empty array (count is 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([]);
      let count = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        count = count + 1;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_2300
     * @tc.name testFloat32ArrayForEachONE023
     * @tc.desc Verify callback is invoked once for a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      let count = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        count = count + 1;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_2400
     * @tc.name testFloat32ArrayForEachONE024
     * @tc.desc Verify callback is invoked 3 times for a three-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let count = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        count = count + 1;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_2500
     * @tc.name testFloat32ArrayForEachONE025
     * @tc.desc Verify number of calls equals the array length (ten elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]);
      let count = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        count = count + 1;
      });
      expect(count).assertEqual(arr.length);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_2600
     * @tc.name testFloat32ArrayForEachONE026
     * @tc.desc Verify number of calls for a view array equals the view length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 2);
      let count = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        count = count + 1;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_2700
     * @tc.name testFloat32ArrayForEachONE027
     * @tc.desc Verify closure accumulates the sum (1+2+3=6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let sum = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        sum = (sum + v).toInt();
      });
      expect(sum).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_2800
     * @tc.name testFloat32ArrayForEachONE028
     * @tc.desc Verify closure accumulates the product (1*2*3*4=24)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let product = 1;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        product = (product * v).toInt();
      });
      expect(product).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_2900
     * @tc.name testFloat32ArrayForEachONE029
     * @tc.desc Verify closure collects elements into an external Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const collected = new Float32Array(3);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        collected.$_set(i, v);
      });
      expect(collected.$_get(0)).assertEqual(16);
      expect(collected.$_get(1)).assertEqual(10);
      expect(collected.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_3000
     * @tc.name testFloat32ArrayForEachONE030
     * @tc.desc Verify closure computes the max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 9.0, 1.0, 7.0]);
      let max = arr.$_get(0);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        if (v > max) {
          max = v;
        }
      });
      expect(max).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_3100
     * @tc.name testFloat32ArrayForEachONE031
     * @tc.desc Verify closure computes the min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 9.0, 1.0, 7.0]);
      let min = arr.$_get(0);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        if (v < min) {
          min = v;
        }
      });
      expect(min).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_3200
     * @tc.name testFloat32ArrayForEachONE032
     * @tc.desc Verify closure counts the number of elements satisfying a condition (the number greater than 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 5.0, 2.0, 8.0, 4.0]);
      let cnt = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        if (v > 4.0) {
          cnt = cnt + 1;
        }
      });
      expect(cnt).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_3300
     * @tc.name testFloat32ArrayForEachONE033
     * @tc.desc Verify closure collects index-value pairs into two parallel arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      const idxArr = new Int32Array(3);
      const valArr = new Float32Array(3);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        idxArr[i] = i;
        valArr.$_set(i, v);
      });
      expect(idxArr[2]).assertEqual(2);
      expect(valArr.$_get(2)).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_3400
     * @tc.name testFloat32ArrayForEachONE034
     * @tc.desc Verify closure accumulates the sum of negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0, -2.0, -3.0]);
      let sum = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        sum = (sum + v).toInt();
      });
      expect(sum).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_3500
     * @tc.name testFloat32ArrayForEachONE035
     * @tc.desc Verify an exception thrown by the callback on the first call propagates immediately (interrupted after count is 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let count = 0;
      try {
        arr.forEach((v: number, i: int, a: Float32Array): void => {
          count = count + 1;
          throw new Error('stop');
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_3600
     * @tc.name testFloat32ArrayForEachONE036
     * @tc.desc Verify an exception thrown by the callback at a middle element, the number of already traversed calls equals the throwing position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      let count = 0;
      try {
        arr.forEach((v: number, i: int, a: Float32Array): void => {
          count = count + 1;
          if (i === 2) {
            throw new Error('mid');
          }
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_3700
     * @tc.name testFloat32ArrayForEachONE037
     * @tc.desc Verify an exception thrown by the callback at the last element propagates after traversing all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let count = 0;
      try {
        arr.forEach((v: number, i: int, a: Float32Array): void => {
          count = count + 1;
          if (i === 2) {
            throw new Error('last');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_3800
     * @tc.name testFloat32ArrayForEachONE038
     * @tc.desc Verify the original array elements remain unchanged after the callback throws an exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      try {
        arr.forEach((v: number, i: int, a: Float32Array): void => {
          throw new Error('immediate');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(1)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_3900
     * @tc.name testFloat32ArrayForEachONE039
     * @tc.desc Verify the type propagated when the callback throws a TypeError is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      try {
        arr.forEach((v: number, i: int, a: Float32Array): void => {
          throw new TypeError('type');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_4000
     * @tc.name testFloat32ArrayForEachONE040
     * @tc.desc Verify count is 1 after the callback throws an exception in a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0]);
      let count = 0;
      try {
        arr.forEach((v: number, i: int, a: Float32Array): void => {
          count = count + 1;
          throw new Error('one');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_4100
     * @tc.name testFloat32ArrayForEachONE041
     * @tc.desc Verify modifying the current element inside the callback does not affect the already recorded value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let firstVal = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        if (i === 0) {
          firstVal = v.toInt();
          a[i] = 99.0;
        }
      });
      expect(firstVal).assertEqual(16);
      expect(arr.$_get(0)).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_4200
     * @tc.name testFloat32ArrayForEachONE042
     * @tc.desc Verify modifying a later element inside the callback, the new value is visible in later iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let seenAt2 = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        if (i === 0) {
          a[2] = 99.0;
        }
        if (i === 2) {
          seenAt2 = v.toInt();
        }
      });
      expect(seenAt2).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_4300
     * @tc.name testFloat32ArrayForEachONE043
     * @tc.desc Verify incrementing each element by 1 inside the callback, all elements are increased by 1 after traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        a[i] = v + 1.0;
      });
      expect(arr.$_get(0)).assertEqual(17);
      expect(arr.$_get(1)).assertEqual(11);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_4400
     * @tc.name testFloat32ArrayForEachONE044
     * @tc.desc Verify modifying an unvisited element inside the callback does not affect the current value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let vAt1 = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        if (i === 1) {
          vAt1 = v.toInt();
          a[2] = 77.0;
        }
      });
      expect(vAt1).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(77.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_4500
     * @tc.name testFloat32ArrayForEachONE045
     * @tc.desc Verify zeroing the first element inside the callback, later iterations read the already modified value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 6.0, 7.0]);
      let vAt0First = 0;
      let vAt0Second = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        if (i === 0) {
          vAt0First = v.toInt();
          a[0] = 0.0;
        }
      });
      vAt0Second = arr.$_get(0).toInt();
      expect(vAt0First).assertEqual(5.0);
      expect(vAt0Second).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_4600
     * @tc.name testFloat32ArrayForEachONE046
     * @tc.desc Verify callback value and index have different types (v is the element value, i is the position)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([42.0]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(42.0);
        expect(i).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_4700
     * @tc.name testFloat32ArrayForEachONE047
     * @tc.desc Verify callback value is not equal to index (the element value differs from the index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([100.0, 200.0, 300.0]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(arr.$_get(i));
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_4800
     * @tc.name testFloat32ArrayForEachONE048
     * @tc.desc Verify the special construction where callback value equals index (verifies consistency when i==v)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, 1.0, 2.0]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(i);
      });
    });





    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_4900
     * @tc.name testFloat32ArrayForEachONE049
     * @tc.desc Verify forEach on a subarray view only iterates the elements within the view range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const arr = base.subarray(1, 4);
      let count = 0;
      let sum = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        count = count + 1;
        sum = (sum + v).toInt();
      });
      expect(count).assertEqual(3);
      expect(sum).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_5000
     * @tc.name testFloat32ArrayForEachONE050
     * @tc.desc Verify the index of forEach on a view starts from 0 (view-local index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 8, 2);
      let firstIdx = -1;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        if (firstIdx === -1) {
          firstIdx = i;
        }
      });
      expect(firstIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_5100
     * @tc.name testFloat32ArrayForEachONE051
     * @tc.desc Verify forEach iterates in order on an array constructed by Float32Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      let seq = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(i).assertEqual(seq);
        seq = seq + 1;
      });
      expect(seq).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_5200
     * @tc.name testFloat32ArrayForEachONE052
     * @tc.desc Verify the number of forEach calls on an array constructed by Float32Array.from equals the length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.from([1.0, 2.0, 3.0, 4.0]);
      let count = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        count = count + 1;
      });
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_5300
     * @tc.name testFloat32ArrayForEachONE053
     * @tc.desc Verify the callback writes to an external object property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const h = new Holder();
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        h.val = h.val + v;
      });
      expect(h.val).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_5400
     * @tc.name testFloat32ArrayForEachONE054
     * @tc.desc Verify the callback accumulates a floating-point sum (the result of 0.1+0.2 in float32)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.1, 0.2]);
      let sum: number = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        sum = sum + v;
      });
      expect(sum).assertEqual(new Float32Array([0.1])[0] + new Float32Array([0.2])[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_5500
     * @tc.name testFloat32ArrayForEachONE055
     * @tc.desc Verify read-only access inside the callback does not affect the external accumulator's initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const base = 100;
      let acc = base;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        acc = (acc + v).toInt();
      });
      expect(acc).assertEqual(125);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_5600
     * @tc.name testFloat32ArrayForEachONE056
     * @tc.desc Verify closure counts the number of negative elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -2.0, 3.0, -4.0, -5.0]);
      let negCount = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        if (v < 0) {
          negCount = negCount + 1;
        }
      });
      expect(negCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_5700
     * @tc.name testFloat32ArrayForEachONE057
     * @tc.desc Verify closure counts the number of zero elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, 1.0, 0.0, 2.0, 0.0]);
      let zeroCount = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        if (v === 0) {
          zeroCount = zeroCount + 1;
        }
      });
      expect(zeroCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_5800
     * @tc.name testFloat32ArrayForEachONE058
     * @tc.desc Verify closure computes the sum of squares
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let sqSum = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        sqSum = (sqSum + v * v).toInt();
      });
      expect(sqSum).assertEqual(357);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_5900
     * @tc.name testFloat32ArrayForEachONE059
     * @tc.desc Verify closure accumulating a NaN element does not change the sum result (NaN propagation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, NaN, 3.0]);
      let sum: number = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        sum = sum + v;
      });
      expect(sum).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_6000
     * @tc.name testFloat32ArrayForEachONE060
     * @tc.desc Verify closure computes the average
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2.0, 4.0, 6.0]);
      let sum = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        sum = (sum + v).toInt();
      });
      expect(sum / arr.length).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_6100
     * @tc.name testFloat32ArrayForEachONE061
     * @tc.desc Verify closure finds the index of the first element satisfying a condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 3.0, 5.0, 2.0, 4.0]);
      let firstGt4 = -1;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        if (firstGt4 === -1 && v > 4.0) {
          firstGt4 = i;
        }
      });
      expect(firstGt4).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_6200
     * @tc.name testFloat32ArrayForEachONE062
     * @tc.desc Verify closure counts the number of Infinity elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Infinity, 1.0, -Infinity]);
      let infCount = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        if (v === Infinity || v === -Infinity) {
          infCount = infCount + 1;
        }
      });
      expect(infCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_6300
     * @tc.name testFloat32ArrayForEachONE063
     * @tc.desc Verify closure accumulates the sum of absolute values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0, 2.0, -3.0]);
      let absSum = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        if (v < 0) {
          absSum = (absSum - v).toInt();
        } else {
          absSum = (absSum + v).toInt();
        }
      });
      expect(absSum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_6400
     * @tc.name testFloat32ArrayForEachONE064
     * @tc.desc Verify callback value parameter receives the smallest normalized number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.1754943508222875e-38]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(1.1754943508222875e-38);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_6500
     * @tc.name testFloat32ArrayForEachONE065
     * @tc.desc Verify callback value parameter receives 2^24=16777216 (the exact integer boundary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777216]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(16777216);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_6600
     * @tc.name testFloat32ArrayForEachONE066
     * @tc.desc Verify callback value parameter receives 2^24+1 (precision loss, stored as 16777216)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777217]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(16777216);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_6700
     * @tc.name testFloat32ArrayForEachONE067
     * @tc.desc Verify callback value parameter receives -Float32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-3.4028234663852886e+38]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(-3.4028234663852886e+38);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_6800
     * @tc.name testFloat32ArrayForEachONE068
     * @tc.desc Verify callback value parameter receives the large negative number -1.0e40 (stored as -Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0e40]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(-Infinity);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_6900
     * @tc.name testFloat32ArrayForEachONE069
     * @tc.desc Verify callback value parameter receives 0.2 (float32 precision bit pattern)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.2]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(new Float32Array([0.2])[0]);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_7000
     * @tc.name testFloat32ArrayForEachONE070
     * @tc.desc Verify the number of calls for an array containing NaN elements still equals the length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN, 1.0, NaN]);
      let count = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        count = count + 1;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_7100
     * @tc.name testFloat32ArrayForEachONE071
     * @tc.desc Verify in-order traversal of an array containing Infinity elements is not affected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Infinity, 1.0, -Infinity]);
      let seq = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(i).assertEqual(seq);
        seq = seq + 1;
      });
      expect(seq).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_7200
     * @tc.name testFloat32ArrayForEachONE072
     * @tc.desc Verify the number of calls for an all-zero array equals the length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(5);
      let count = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        count = count + 1;
      });
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_7300
     * @tc.name testFloat32ArrayForEachONE073
     * @tc.desc Verify a single NaN element array is iterated once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN]);
      let count = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        count = count + 1;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_7400
     * @tc.name testFloat32ArrayForEachONE074
     * @tc.desc Verify setting all visited elements to -1 inside the callback, all elements are -1 after traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        a[i] = -1.0;
      });
      expect(arr.$_get(0)).assertEqual(-1.0);
      expect(arr.$_get(1)).assertEqual(-1.0);
      expect(arr.$_get(2)).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_7500
     * @tc.name testFloat32ArrayForEachONE075
     * @tc.desc Verify the number of calls is unchanged after modifying a later element inside the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let count = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        count = count + 1;
        if (i === 0) {
          a[3] = 99.0;
        }
      });
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_7600
     * @tc.name testFloat32ArrayForEachONE076
     * @tc.desc Verify modifying the current element inside the callback, the current value is not affected (the value was already passed in)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 6.0]);
      let vAt0 = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        if (i === 0) {
          vAt0 = v.toInt();
          a[0] = 0.0;
        }
      });
      expect(vAt0).assertEqual(5.0);
      expect(arr.$_get(0)).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_7700
     * @tc.name testFloat32ArrayForEachONE077
     * @tc.desc Verify the index sequence for a two-element array is 0,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const idxs = new Int32Array(2);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        idxs[i] = i;
      });
      expect(idxs[0]).assertEqual(0);
      expect(idxs[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_7800
     * @tc.name testFloat32ArrayForEachONE078
     * @tc.desc Verify the last index for a four-element array is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let last = -1;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        last = i;
      });
      expect(last).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_7900
     * @tc.name testFloat32ArrayForEachONE079
     * @tc.desc Verify index is a read-only position inside the callback and does not change with value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      let idxSum = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        idxSum = idxSum + i;
      });
      expect(idxSum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_8000
     * @tc.name testFloat32ArrayForEachONE080
     * @tc.desc Verify asserting the correspondence of value and index inside the callback (v at i equals arr.$_get(i))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([100.0, 200.0, 300.0]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(a[i]);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_8100
     * @tc.name testFloat32ArrayForEachONE081
     * @tc.desc Verify accumulating value plus index inside the callback (sum of v+i)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let total = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        total = (total + v + i).toInt();
      });
      expect(total).assertEqual(28);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_8200
     * @tc.name testFloat32ArrayForEachONE082
     * @tc.desc Verify the first element's value and index inside the callback both match expectations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0, 8.0, 9.0]);
      let firstV = 0;
      let firstI = -1;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        if (i === 0) {
          firstV = v.toInt();
          firstI = i;
        }
      });
      expect(firstV).assertEqual(7.0);
      expect(firstI).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_8300
     * @tc.name testFloat32ArrayForEachONE083
     * @tc.desc Verify the last element's value and index inside the callback both match expectations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0, 8.0, 9.0]);
      let lastV = 0;
      let lastI = -1;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        lastV = v.toInt();
        lastI = i;
      });
      expect(lastV).assertEqual(9.0);
      expect(lastI).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHONE_8400
     * @tc.name testFloat32ArrayForEachONE084
     * @tc.desc Verify modifying a later element in the callback changes the value observed when that index is visited
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachONE084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      let seenAt3 = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        if (i === 0) {
          a.$_set(3, 99.0);
        }
        if (i === 3) {
          seenAt3 = v.toInt();
        }
      });
      expect(seenAt3).assertEqual(99);
      expect(arr.$_get(3)).assertEqual(99.0);
    });

  });
}
