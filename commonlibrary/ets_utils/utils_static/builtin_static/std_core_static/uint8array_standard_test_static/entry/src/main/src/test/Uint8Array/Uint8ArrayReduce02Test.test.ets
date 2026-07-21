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
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Uint8ArrayReduce02Test(): void {
  describe('Uint8ArrayReduce02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_0100
     * @tc.name testUint8ArrayReduce001
     * @tc.desc Verify reduce with 1 parameter (callbackfn) for addition accumulation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_0200
     * @tc.name testUint8ArrayReduce002
     * @tc.desc Verify callbackfn predefined as const passed to reduce call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn = (prev: number, curr: number): number => prev + curr;
      const arr = Uint8Array.of(4, 5, 6);
      const result = arr.reduce(fn);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_0300
     * @tc.name testUint8ArrayReduce003
     * @tc.desc Verify callbackfn addition accumulation [1,2,3,4,5]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      const result = arr.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_0400
     * @tc.name testUint8ArrayReduce004
     * @tc.desc Verify callbackfn multiplication accumulation [2,3,4]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(2, 3, 4);
      const result = arr.reduce((prev, curr) => prev * curr);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_0500
     * @tc.name testUint8ArrayReduce005
     * @tc.desc Verify callbackfn subtraction [100,10,20,30]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(100, 10, 20, 30);
      const result = arr.reduce((prev, curr) => prev - curr);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_0600
     * @tc.name testUint8ArrayReduce006
     * @tc.desc Verify callbackfn division [256,2,4]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(256, 2, 4);
      const result = arr.reduce((prev, curr) => prev / curr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_0700
     * @tc.name testUint8ArrayReduce007
     * @tc.desc Verify callbackfn using Math.max to find maximum [3,1,4,1,5]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(3, 1, 4, 1, 5);
      const result = arr.reduce((prev, curr) => Math.max(prev, curr));
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_0800
     * @tc.name testUint8ArrayReduce008
     * @tc.desc Verify callbackfn using Math.min to find minimum [10,2,8,4]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 2, 8, 4);
      const result = arr.reduce((prev, curr) => Math.min(prev, curr));
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_0900
     * @tc.name testUint8ArrayReduce009
     * @tc.desc Verify callbackfn ternary operator to find maximum [1,9,4,7]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 9, 4, 7);
      const result = arr.reduce((prev, curr) => prev > curr ? prev : curr);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_1000
     * @tc.name testUint8ArrayReduce010
     * @tc.desc Verify callbackfn ternary operator to find minimum [8,3,6,2]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(8, 3, 6, 2);
      const result = arr.reduce((prev, curr) => prev < curr ? prev : curr);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_1100
     * @tc.name testUint8ArrayReduce011
     * @tc.desc Verify callbackfn bitwise OR [0x0F,0xF0] hexadecimal
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0x0F, 0xF0);
      const result = arr.reduce((prev, curr) => prev | curr);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_1200
     * @tc.name testUint8ArrayReduce012
     * @tc.desc Verify callbackfn bitwise AND [0xFF,0x0F,0xF0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0xFF, 0x0F, 0xF0);
      const result = arr.reduce((prev, curr) => prev & curr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_1300
     * @tc.name testUint8ArrayReduce013
     * @tc.desc Verify callbackfn bitwise XOR [0b101,0b011,0b110] binary literals
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0b101, 0b011, 0b110);
      const result = arr.reduce((prev, curr) => prev ^ curr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_1400
     * @tc.name testUint8ArrayReduce014
     * @tc.desc Verify callbackfn exponentiation [2,3,2] using **
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(2, 3, 2);
      const result = arr.reduce((prev, curr) => prev ** curr);
      expect(result).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_1500
     * @tc.name testUint8ArrayReduce015
     * @tc.desc Verify callbackfn number concatenation [1,2,3,4] using prev*10+curr
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4);
      const result = arr.reduce((prev, curr) => prev * 10 + curr);
      expect(result).assertEqual(1234);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_1600
     * @tc.name testUint8ArrayReduce016
     * @tc.desc Verify callbackfn modulo 256 truncation sum [150,150,150]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(150, 150, 150);
      const result = arr.reduce((prev, curr) => (prev + curr) & 0xFF);
      expect(result).assertEqual(194);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_1700
     * @tc.name testUint8ArrayReduce017
     * @tc.desc Verify callbackfn identity return prev [7,1,2,3] first element unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(7, 1, 2, 3);
      const result = arr.reduce((prev, curr) => prev);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_1800
     * @tc.name testUint8ArrayReduce018
     * @tc.desc Verify callbackfn forward return curr [7,1,2,3] result is last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(7, 1, 2, 3);
      const result = arr.reduce((prev, curr) => curr);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_1900
     * @tc.name testUint8ArrayReduce019
     * @tc.desc Verify callbackfn sum of squares [1,3,5] using prev+curr*curr
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 3, 5);
      const result = arr.reduce((prev, curr) => prev + curr * curr);
      expect(result).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_2000
     * @tc.name testUint8ArrayReduce020
     * @tc.desc Verify callbackfn absolute difference [100,30,20] using Math.abs
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(100, 30, 20);
      const result = arr.reduce((prev, curr) => Math.abs(prev - curr));
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_2100
     * @tc.name testUint8ArrayReduce021
     * @tc.desc Verify callbackfn prev*curr+prev [2,3,1]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(2, 3, 1);
      const result = arr.reduce((prev, curr) => prev * curr + prev);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_2200
     * @tc.name testUint8ArrayReduce022
     * @tc.desc Verify callbackfn prev+curr*10 [1,2,3,4]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4);
      const result = arr.reduce((prev, curr) => prev + curr * 10);
      expect(result).assertEqual(91);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_2300
     * @tc.name testUint8ArrayReduce023
     * @tc.desc Verify callbackfn conditional sum [10,50,5,100] only add values greater than 20
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 50, 5, 100);
      const result = arr.reduce((prev, curr) => curr > 20 ? prev + curr : prev);
      expect(result).assertEqual(160);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_2400
     * @tc.name testUint8ArrayReduce024
     * @tc.desc Verify callbackfn prev*(curr+1) [1,2,3]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const result = arr.reduce((prev, curr) => prev * (curr + 1));
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_2500
     * @tc.name testUint8ArrayReduce025
     * @tc.desc Verify callbackfn left shift accumulation [1,1,1,1] using (prev<<1)+curr
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 1, 1, 1);
      const result = arr.reduce((prev, curr) => (prev << 1) + curr);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_2600
     * @tc.name testUint8ArrayReduce026
     * @tc.desc Verify callbackfn bitwise OR three elements [0xAA,0x55,0xFF]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0xAA, 0x55, 0xFF);
      const result = arr.reduce((prev, curr) => prev | curr);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_2700
     * @tc.name testUint8ArrayReduce027
     * @tc.desc Verify callbackfn add a[0] each time [1,2,3]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const result = arr.reduce((prev, curr, idx, a) => prev + curr + a[0]);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_2800
     * @tc.name testUint8ArrayReduce028
     * @tc.desc Verify callbackfn multi-statement body [3,1,4,1,5] with internal const declaration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(3, 1, 4, 1, 5);
      const result = arr.reduce((prev, curr) => {
        const p = prev;
        const c = curr;
        return p + c;
      });
      expect(result).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_2900
     * @tc.name testUint8ArrayReduce029
     * @tc.desc Verify callbackfn using Math.floor divide by 2 [3,6,9]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(3, 6, 9);
      const result = arr.reduce((prev, curr) => prev + Math.floor(curr / 2));
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_3000
     * @tc.name testUint8ArrayReduce030
     * @tc.desc Verify callbackfn prev-Math.abs(curr) [100,30,200]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(100, 30, 200);
      const result = arr.reduce((prev, curr) => prev - Math.abs(curr));
      expect(result).assertEqual(-130);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_3100
     * @tc.name testUint8ArrayReduce031
     * @tc.desc Verify callbackfn prev ^ (curr<<1) [1,2,3]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const result = arr.reduce((prev, curr) => prev ^ (curr << 1));
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_3200
     * @tc.name testUint8ArrayReduce032
     * @tc.desc Verify callbackfn Math.abs(prev-curr) [10,30,5]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 30, 5);
      const result = arr.reduce((prev, curr) => Math.abs(prev - curr));
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_3300
     * @tc.name testUint8ArrayReduce033
     * @tc.desc Verify callbackfn first currentIndex is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstIdx: number = -1;
      const arr = Uint8Array.of(5, 10, 15);
      arr.reduce((prev, curr, idx) => {
        if (firstIdx === -1) {
          firstIdx = idx;
        }
        return prev + curr;
      });
      expect(firstIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_3400
     * @tc.name testUint8ArrayReduce034
     * @tc.desc Verify callbackfn last currentIndex is length-1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lastIdx: number = -1;
      const arr = Uint8Array.of(5, 10, 15);
      arr.reduce((prev, curr, idx) => {
        lastIdx = idx;
        return prev + curr;
      });
      expect(lastIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_3500
     * @tc.name testUint8ArrayReduce035
     * @tc.desc Verify callbackfn accumulate index values [1,2,3,4,5] verify index sequence
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sumIdx: number = 0;
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      arr.reduce((prev, curr, idx) => {
        sumIdx += idx;
        return prev + curr;
      });
      expect(sumIdx).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_3600
     * @tc.name testUint8ArrayReduce036
     * @tc.desc Verify callbackfn index strictly increments by 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let prevIdx: number = -1;
      let monotonic: boolean = true;
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      arr.reduce((prev, curr, idx) => {
        if (prevIdx !== -1 && idx !== prevIdx + 1) {
          monotonic = false;
        }
        prevIdx = idx;
        return prev + curr;
      });
      expect(monotonic).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_3700
     * @tc.name testUint8ArrayReduce037
     * @tc.desc Verify callbackfn call count equals length-1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: number = 0;
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      arr.reduce((prev, curr, idx) => {
        callCount++;
        return prev + curr;
      });
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_3800
     * @tc.name testUint8ArrayReduce038
     * @tc.desc Verify callbackfn a[idx] === curr
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let match: boolean = true;
      const arr = Uint8Array.of(5, 10, 15, 20);
      arr.reduce((prev, curr, idx, a) => {
        if (a[idx] !== curr) {
          match = false;
        }
        return prev + curr;
      });
      expect(match).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_3900
     * @tc.name testUint8ArrayReduce039
     * @tc.desc Verify callbackfn array parameter === original array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let sameRef: boolean = false;
      arr.reduce((prev, curr, idx, a) => {
        sameRef = (a === arr);
        return prev + curr;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_4000
     * @tc.name testUint8ArrayReduce040
     * @tc.desc Verify callbackfn array parameter length property
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4);
      let arrLen: number = 0;
      arr.reduce((prev, curr, idx, a) => {
        arrLen = a.length;
        return prev + curr;
      });
      expect(arrLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_4100
     * @tc.name testUint8ArrayReduce041
     * @tc.desc Verify callbackfn array parameter BYTES_PER_ELEMENT
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let bpe: number = 0;
      arr.reduce((prev, curr, idx, a) => {
        bpe = a.BYTES_PER_ELEMENT;
        return prev + curr;
      });
      expect(bpe).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_4200
     * @tc.name testUint8ArrayReduce042
     * @tc.desc Verify callbackfn array parameter buffer sharing
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let sameBuf: boolean = false;
      arr.reduce((prev, curr, idx, a) => {
        if (idx === 1) {
          sameBuf = (a.buffer === arr.buffer);
        }
        return prev + curr;
      });
      expect(sameBuf).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_4300
     * @tc.name testUint8ArrayReduce043
     * @tc.desc Verify return value type is number
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const result = arr.reduce((prev, curr) => prev + curr);
      const resultType = Class.of(result).getName();
      expect(resultType).assertEqual('std.core.Double');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_4400
     * @tc.name testUint8ArrayReduce044
     * @tc.desc Verify single element [42] returns the element itself
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(42);
      const result = arr.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_4500
     * @tc.name testUint8ArrayReduce045
     * @tc.desc Verify single element [0] returns 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0);
      const result = arr.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_4600
     * @tc.name testUint8ArrayReduce046
     * @tc.desc Verify two elements [10,20] addition
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20);
      const result = arr.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_4700
     * @tc.name testUint8ArrayReduce047
     * @tc.desc Verify all-zero array sum is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 0, 0, 0);
      const result = arr.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_4800
     * @tc.name testUint8ArrayReduce048
     * @tc.desc Verify floating point literal truncation storage [1.5, 2.7] sum
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1.5, 2.7);
      const result = arr.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_4900
     * @tc.name testUint8ArrayReduce049
     * @tc.desc Verify negative value wraparound [-1] stored as 255 returns 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(-1);
      const result = arr.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_5000
     * @tc.name testUint8ArrayReduce050
     * @tc.desc Verify overflow truncation [256,257] stored as [0,1]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(256, 257);
      const result = arr.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_5100
     * @tc.name testUint8ArrayReduce051
     * @tc.desc Verify all 255 four elements sum
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(255, 255, 255, 255);
      const result = arr.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(1020);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_5200
     * @tc.name testUint8ArrayReduce052
     * @tc.desc Verify [128,127] midpoint boundary
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(128, 127);
      const result = arr.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_5300
     * @tc.name testUint8ArrayReduce053
     * @tc.desc Verify single element callback not executed, returns element itself
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let invoked: boolean = false;
      const arr = Uint8Array.of(99);
      const result = arr.reduce((prev, curr) => {
        invoked = true;
        return prev + curr;
      });
      expect(invoked).assertFalse();
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_5400
     * @tc.name testUint8ArrayReduce054
     * @tc.desc Verify result toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce((prev, curr) => prev + curr);
      expect(result.toString()).assertEqual('60');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_5500
     * @tc.name testUint8ArrayReduce055
     * @tc.desc Verify empty array no constructor reduce throws exception
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      try {
        arr.reduce((prev, curr) => prev + curr);
        expect().assertFail();
      } catch (e) {
        expect(Class.of(e as Object).getName()).assertEqual('std.core.TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_5600
     * @tc.name testUint8ArrayReduce056
     * @tc.desc Verify empty ArrayBuffer view reduce throws exception
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(new ArrayBuffer(0));
      try {
        arr.reduce((prev, curr) => prev + curr);
        expect().assertFail();
      } catch (e) {
        expect(Class.of(e as Object).getName()).assertEqual('std.core.TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_5700
     * @tc.name testUint8ArrayReduce057
     * @tc.desc Verify filter result empty array reduce throws exception
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint8Array.of(1, 2, 3);
      const empty = src.filter(x => x > 100);
      try {
        empty.reduce((prev, curr) => prev + curr);
        expect().assertFail();
      } catch (e) {
        expect(Class.of(e as Object).getName()).assertEqual('std.core.TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_5800
     * @tc.name testUint8ArrayReduce058
     * @tc.desc Verify callback throwing Error passthrough
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      try {
        arr.reduce((prev, curr) => {
          throw new Error();
        });
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_5900
     * @tc.name testUint8ArrayReduce059
     * @tc.desc Verify callback throwing RangeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      try {
        arr.reduce((prev, curr) => {
          throw new RangeError();
        });
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_6000
     * @tc.name testUint8ArrayReduce060
     * @tc.desc Verify callback throwing error at specific iteration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      try {
        arr.reduce((prev, curr, idx) => {
          if (idx === 3) {
            throw new Error();
          }
          return prev + curr;
        });
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_6100
     * @tc.name testUint8ArrayReduce061
     * @tc.desc Verify callback throwing custom error message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      try {
        arr.reduce((prev, curr) => {
          throw new Error('reduce fail');
        });
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_6200
     * @tc.name testUint8ArrayReduce062
     * @tc.desc Verify slice reduced sum
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint8Array.of(1, 2, 3, 4, 5);
      const sub = src.slice(1, 4);
      const result = sub.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_6300
     * @tc.name testUint8ArrayReduce063
     * @tc.desc Verify ArrayBuffer view reduce sum
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(5);
      const arr = new Uint8Array(buf, 1, 3);
      arr.set([10], 0);
      arr.set([20], 1);
      arr.set([30], 2);
      const result = arr.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_6400
     * @tc.name testUint8ArrayReduce064
     * @tc.desc Verify map then reduce
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint8Array.of(1, 2, 3);
      const doubled = src.map(x => x * 2);
      const result = doubled.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_6500
     * @tc.name testUint8ArrayReduce065
     * @tc.desc Verify filter then reduce
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint8Array.of(1, 2, 3, 4, 5);
      const filtered = src.filter(x => x > 2);
      const result = filtered.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_6600
     * @tc.name testUint8ArrayReduce066
     * @tc.desc Verify sub-view reduce
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const firstView = new Uint8Array(buf, 0, 3);
      firstView.set([1], 0);
      firstView.set([2], 1);
      firstView.set([3], 2);
      const secondView = new Uint8Array(buf, 3, 3);
      secondView.set([10], 0);
      secondView.set([20], 1);
      secondView.set([30], 2);
      const result = firstView.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_6700
     * @tc.name testUint8ArrayReduce067
     * @tc.desc Verify constructor(length) then reduce
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(4);
      arr.set([5], 0);
      arr.set([10], 1);
      arr.set([15], 2);
      arr.set([20], 3);
      const result = arr.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_6800
     * @tc.name testUint8ArrayReduce068
     * @tc.desc Verify from array-like reduce sum
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.from([10, 20, 30]);
      const result = arr.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_6900
     * @tc.name testUint8ArrayReduce069
     * @tc.desc Verify from with mapFn reduce sum
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.from([1.0, 2.0, 3.0], (x: number): number => x * 10);
      const result = arr.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_7000
     * @tc.name testUint8ArrayReduce070
     * @tc.desc Verify closure variable in from mapFn reduce sum
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const multiplier = 5;
      const arr = Uint8Array.from([1.0, 2.0, 3.0], (x: number): number => x * multiplier);
      const result = arr.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_7100
     * @tc.name testUint8ArrayReduce071
     * @tc.desc Verify number array reduce sum
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.from([1.0, 2.0, 3.0]);
      const result = arr.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_7200
     * @tc.name testUint8ArrayReduce072
     * @tc.desc Verify Set iterable reduce sum
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<number>();
      s.add(10);
      s.add(20);
      s.add(30);
      const arr = Uint8Array.from(s);
      const result = arr.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_7300
     * @tc.name testUint8ArrayReduce073
     * @tc.desc Verify Map entries iterable reduce sum
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, number>();
      m.set('a', 10);
      m.set('b', 20);
      m.set('c', 30);
      const arr = Uint8Array.from(m.values());
      const result = arr.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_7400
     * @tc.name testUint8ArrayReduce074
     * @tc.desc Verify TypedArray reduce sum
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int32Array([10, 20, 30]);
      const arr = Uint8Array.from(src);
      const result = arr.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_7500
     * @tc.name testUint8ArrayReduce075
     * @tc.desc Verify from empty array-like reduce throws exception
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.from([]);
      try {
        arr.reduce((prev, curr) => prev + curr);
        expect().assertFail();
      } catch (e) {
        expect(Class.of(e as Object).getName()).assertEqual('std.core.TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE02_7600
     * @tc.name testUint8ArrayReduce076
     * @tc.desc Verify from with mapFn truncation overflow reduce sum
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.from([256.0, 257.0, 258.0], (x: number): number => x);
      const result = arr.reduce((prev, curr) => prev + curr);
      expect(result).assertEqual(3);
    });
  });
}