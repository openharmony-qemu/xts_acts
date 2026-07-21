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

export default function Uint8ArrayReduce01Test(): void {
  describe('Uint8ArrayReduce01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_0100
     * @tc.name testUint8ArrayReduce001
     * @tc.desc Verify reduce with 2 parameters (callbackfn + initialValue) using addition accumulation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce<number>((prev, curr) => prev + curr, 0);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_0200
     * @tc.name testUint8ArrayReduce002
     * @tc.desc Verify callbackfn with subtraction operator, array [10,20,30], initial value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce<number>((prev, curr) => prev - curr, 0);
      expect(result).assertEqual(-60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_0300
     * @tc.name testUint8ArrayReduce003
     * @tc.desc Verify callbackfn with multiplication operator, array [2,3,4], initial value 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(2, 3, 4);
      const result = arr.reduce<number>((prev, curr) => prev * curr, 1);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_0400
     * @tc.name testUint8ArrayReduce004
     * @tc.desc Verify callbackfn with Math.max to get maximum value, array [3,1,4,1,5], initial value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(3, 1, 4, 1, 5);
      const result = arr.reduce<number>((prev, curr) => Math.max(prev, curr), 0);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_0500
     * @tc.name testUint8ArrayReduce005
     * @tc.desc Verify callbackfn with Math.min to get minimum value, array [3,1,4,1,5], initial value 10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(3, 1, 4, 1, 5);
      const result = arr.reduce<number>((prev, curr) => Math.min(prev, curr), 10);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_0600
     * @tc.name testUint8ArrayReduce006
     * @tc.desc Verify callbackfn with bitwise OR operator, array [1,2,4], initial value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 4);
      const result = arr.reduce<number>((prev, curr) => prev | curr, 0);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_0700
     * @tc.name testUint8ArrayReduce007
     * @tc.desc Verify callbackfn with bitwise AND operator, array [3,7,15], initial value 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(3, 7, 15);
      const result = arr.reduce<number>((prev, curr) => prev & curr, 127);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_0800
     * @tc.name testUint8ArrayReduce008
     * @tc.desc Verify callbackfn with bitwise XOR operator, array [1,2,3], initial value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const result = arr.reduce<number>((prev, curr) => prev ^ curr, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_0900
     * @tc.name testUint8ArrayReduce009
     * @tc.desc Verify callbackfn with 4 parameters (prev, curr, idx, array) using idx in calculation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce<number>((prev, curr, idx) => prev + curr + idx, 0);
      expect(result).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_1000
     * @tc.name testUint8ArrayReduce010
     * @tc.desc Verify callbackfn array parameter references the same array as original
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      let sameRef: boolean = true;
      arr.reduce<number>((prev, curr, idx, a): number => {
        if (a !== arr) {
          sameRef = false;
        }
        return prev + curr;
      }, 0);
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_1100
     * @tc.name testUint8ArrayReduce011
     * @tc.desc Verify callbackfn always returns prev (ignoring all curr), initial value 999
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce<number>((prev, curr) => prev, 999);
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_1200
     * @tc.name testUint8ArrayReduce012
     * @tc.desc Verify callbackfn always returns curr (takes last element value), initial value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce<number>((prev, curr) => curr, 0);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_1300
     * @tc.name testUint8ArrayReduce013
     * @tc.desc Verify callbackfn returns constant value 42, ignoring all parameters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce<number>((prev, curr) => 42, 0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_1400
     * @tc.name testUint8ArrayReduce014
     * @tc.desc Verify callbackfn reads external scope variable for accumulation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let factor: number = 2;
      const result = arr.reduce<number>((prev, curr) => prev + curr * factor, 0);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_1500
     * @tc.name testUint8ArrayReduce015
     * @tc.desc Verify callbackfn records call count by modifying external variable
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      let callCount: int = 0;
      arr.reduce<number>((prev, curr) => {
        callCount++;
        return prev + curr;
      }, 0);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_1600
     * @tc.name testUint8ArrayReduce016
     * @tc.desc Verify callbackfn with compound operation prev + curr * curr
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const result = arr.reduce<number>((prev, curr) => prev + curr * curr, 0);
      expect(result).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_1700
     * @tc.name testUint8ArrayReduce017
     * @tc.desc Verify callbackfn with conditional branch, only accumulates odd elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4);
      const result = arr.reduce<number>((prev, curr) => (curr % 2 === 1) ? prev + curr : prev, 0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_1800
     * @tc.name testUint8ArrayReduce018
     * @tc.desc Verify callbackfn uses prev + 1 for counting, initial value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce<number>((prev, curr) => prev + 1, 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_1900
     * @tc.name testUint8ArrayReduce019
     * @tc.desc Verify callbackfn calls external function to process current value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce<number>((prev, curr) => prev + (curr > 15 ? curr : 0), 0);
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_2000
     * @tc.name testUint8ArrayReduce020
     * @tc.desc Verify callbackfn uses conditional judgment to distinguish first call processing
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const result = arr.reduce<number>((prev, curr, idx) => idx === 0 ? prev + curr : prev + curr * 10, 0);
      expect(result).assertEqual(51);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_2100
     * @tc.name testUint8ArrayReduce021
     * @tc.desc Verify callbackfn uses index parity to decide whether to accumulate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30, 40);
      const result = arr.reduce<number>((prev, curr, idx) => (idx % 2 === 0) ? prev + curr : prev, 0);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_2200
     * @tc.name testUint8ArrayReduce022
     * @tc.desc Verify callbackfn uses average formula (prev + curr) / 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce<number>((prev, curr) => (prev + curr) / 2, 0);
      expect(result).assertEqual(21.25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_2300
     * @tc.name testUint8ArrayReduce023
     * @tc.desc Verify callbackfn uses absolute difference formula Math.abs(prev - curr)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce<number>((prev, curr) => (prev > curr) ? prev - curr : curr - prev, 0);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_2400
     * @tc.name testUint8ArrayReduce024
     * @tc.desc Verify initialValue is 1, addition accumulation on [10,20,30]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce<number>((prev, curr) => prev + curr, 1);
      expect(result).assertEqual(61);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_2500
     * @tc.name testUint8ArrayReduce025
     * @tc.desc Verify initialValue is -1, addition accumulation on [10,20,30]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce<number>((prev, curr) => prev + curr, -1);
      expect(result).assertEqual(59);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_2600
     * @tc.name testUint8ArrayReduce026
     * @tc.desc Verify initialValue is 255 (uint8 max value), addition accumulation on [10,20,30]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce<number>((prev, curr) => prev + curr, 255);
      expect(result).assertEqual(315);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_2700
     * @tc.name testUint8ArrayReduce027
     * @tc.desc Verify initialValue is 256 (exceeds uint8 range), addition accumulation on [10]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10);
      const result = arr.reduce<number>((prev, curr) => prev + curr, 256);
      expect(result).assertEqual(266);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_2800
     * @tc.name testUint8ArrayReduce028
     * @tc.desc Verify initialValue is 0.5 (floating point), addition accumulation on [10,20]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20);
      const result = arr.reduce<number>((prev, curr) => prev + curr, 0.5);
      expect(result).assertEqual(30.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_2900
     * @tc.name testUint8ArrayReduce029
     * @tc.desc Verify initialValue is 127 (middle value), addition accumulation on [10,20,30]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce<number>((prev, curr) => prev + curr, 127);
      expect(result).assertEqual(187);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_3000
     * @tc.name testUint8ArrayReduce030
     * @tc.desc Verify initialValue is 128 (middle value+1), addition accumulation on [10,20,30]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce<number>((prev, curr) => prev + curr, 128);
      expect(result).assertEqual(188);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_3100
     * @tc.name testUint8ArrayReduce031
     * @tc.desc Verify initialValue is 0xFF (hexadecimal 255), addition accumulation on [10,20,30]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce<number>((prev, curr) => prev + curr, 0xFF);
      expect(result).assertEqual(315);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_3200
     * @tc.name testUint8ArrayReduce032
     * @tc.desc Verify initialValue is 0o377 (octal 255), addition accumulation on [10,20,30]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce<number>((prev, curr) => prev + curr, 0o377);
      expect(result).assertEqual(315);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_3300
     * @tc.name testUint8ArrayReduce033
     * @tc.desc Verify initialValue is 0b11111111 (binary 255), addition accumulation on [10,20,30]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce<number>((prev, curr) => prev + curr, 0b11111111);
      expect(result).assertEqual(315);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_3400
     * @tc.name testUint8ArrayReduce034
     * @tc.desc Verify initialValue is 1e3 (scientific notation 1000), addition accumulation on [10,20,30]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce<number>((prev, curr) => prev + curr, 1e3);
      expect(result).assertEqual(1060);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_3500
     * @tc.name testUint8ArrayReduce035
     * @tc.desc Verify initialValue is 3.14 (floating point), addition accumulation on [1,2]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      const result = arr.reduce<number>((prev, curr) => prev + curr, 3.14);
      expect(result).assertEqual(6.140000000000001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_3600
     * @tc.name testUint8ArrayReduce036
     * @tc.desc Verify initialValue is Double.NaN, addition accumulation on [10,20]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20);
      const result = arr.reduce<number>((prev, curr) => prev + curr, Double.NaN);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_3700
     * @tc.name testUint8ArrayReduce037
     * @tc.desc Verify initialValue is Double.POSITIVE_INFINITY, addition accumulation on [10,20]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20);
      const result = arr.reduce<number>((prev, curr) => prev + curr, Double.POSITIVE_INFINITY);
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_3800
     * @tc.name testUint8ArrayReduce038
     * @tc.desc Verify initialValue is Double.NEGATIVE_INFINITY, addition accumulation on [10,20]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20);
      const result = arr.reduce<number>((prev, curr) => prev + curr, Double.NEGATIVE_INFINITY);
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_3900
     * @tc.name testUint8ArrayReduce039
     * @tc.desc Verify initialValue is -0.5 (negative floating point), addition accumulation on [10,20]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20);
      const result = arr.reduce<number>((prev, curr) => prev + curr, -0.5);
      expect(result).assertEqual(29.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_4000
     * @tc.name testUint8ArrayReduce040
     * @tc.desc Verify initialValue is 0x80 (hexadecimal 128), addition accumulation on [10,20,30]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce<number>((prev, curr) => prev + curr, 0x80);
      expect(result).assertEqual(188);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_4100
     * @tc.name testUint8ArrayReduce041
     * @tc.desc Verify U explicitly specified as string, concatenating numbers as strings
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const result = arr.reduce<string>((prev, curr) => prev + curr.toString(), '');
      expect(result).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_4200
     * @tc.name testUint8ArrayReduce042
     * @tc.desc Verify U is string with comma separator concatenation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce<string>((prev, curr, idx) => prev + (idx === 0 ? '' : ',') + curr.toString(), '');
      expect(result).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_4300
     * @tc.name testUint8ArrayReduce043
     * @tc.desc Verify U is string with sequence number prefix concatenation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(5, 10);
      const result = arr.reduce<string>((prev, curr, idx) => prev + '[' + idx.toString() + ':' + curr.toString() + ']', '');
      expect(result).assertEqual('[0:5][1:10]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_4400
     * @tc.name testUint8ArrayReduce044
     * @tc.desc Verify U is string with non-empty string initial value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      const result = arr.reduce<string>((prev, curr) => prev + ',' + curr.toString(), 'start');
      expect(result).assertEqual('start,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_4500
     * @tc.name testUint8ArrayReduce045
     * @tc.desc Verify U is string, callbackfn returns empty string slice
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const result = arr.reduce<string>((prev, curr) => {
        const str = curr.toString();
        const firstChar = str.charAt(0);
        return prev + firstChar;
      }, '');
      expect(result).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_4600
     * @tc.name testUint8ArrayReduce046
     * @tc.desc Verify U is string, concatenates string after condition check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 1, 2);
      const result = arr.reduce<string>((prev, curr) => prev + (curr > 0 ? curr.toString() : ''), '');
      expect(result).assertEqual('12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_4700
     * @tc.name testUint8ArrayReduce047
     * @tc.desc Verify U is number with multiplication operation to verify result type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(2, 3);
      const result = arr.reduce<number>((prev, curr) => prev * curr, 1);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_4800
     * @tc.name testUint8ArrayReduce048
     * @tc.desc Verify empty array reduce returns initialValue
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      const result = arr.reduce<number>((prev, curr) => prev + curr, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_4900
     * @tc.name testUint8ArrayReduce049
     * @tc.desc Verify empty array reduce returns initialValue 100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      const result = arr.reduce<number>((prev, curr) => prev + curr, 100);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_5000
     * @tc.name testUint8ArrayReduce050
     * @tc.desc Verify single element array [5] reduce result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(5);
      const result = arr.reduce<number>((prev, curr) => prev + curr, 10);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_5100
     * @tc.name testUint8ArrayReduce051
     * @tc.desc Verify two element array [1,2] reduce
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2);
      const result = arr.reduce<number>((prev, curr) => prev + curr, 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_5200
     * @tc.name testUint8ArrayReduce052
     * @tc.desc Verify all-zero array [0,0,0] reduce
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 0, 0);
      const result = arr.reduce<number>((prev, curr) => prev + curr, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_5300
     * @tc.name testUint8ArrayReduce053
     * @tc.desc Verify all-255 array [255,255] reduce multiplication to verify truncation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(255, 255);
      const result = arr.reduce<number>((prev, curr) => prev + curr, 0);
      expect(result).assertEqual(510);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_5400
     * @tc.name testUint8ArrayReduce054
     * @tc.desc Verify array with truncation values [256, -1, 128] (actually stored as [0, 255, 128])
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(256, -1, 128);
      const result = arr.reduce<number>((prev, curr) => prev + curr, 0);
      expect(result).assertEqual(383);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_5500
     * @tc.name testUint8ArrayReduce055
     * @tc.desc Verify array created from subarray
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint8Array.of(10, 20, 30, 40, 50);
      const view = src.subarray(1, 4);
      const result = view.reduce<number>((prev, curr) => prev + curr, 0);
      expect(result).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_5600
     * @tc.name testUint8ArrayReduce056
     * @tc.desc Verify array created from new Uint8Array(5) zero-filled
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      const result = arr.reduce<number>((prev, curr) => prev + curr, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_5700
     * @tc.name testUint8ArrayReduce057
     * @tc.desc Verify large array (10 elements) reduce
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      const result = arr.reduce<number>((prev, curr) => prev + curr, 0);
      expect(result).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_5800
     * @tc.name testUint8ArrayReduce058
     * @tc.desc Verify array with boundary values [0, 255, 127]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 255, 127);
      const result = arr.reduce<number>((prev, curr) => prev - curr, 1000);
      expect(result).assertEqual(618);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_5900
     * @tc.name testUint8ArrayReduce059
     * @tc.desc Verify U=number result type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce<number>((prev, curr) => prev + curr, 0);
      expect(Class.of(result).getName()).assertEqual('std.core.Double');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_6000
     * @tc.name testUint8ArrayReduce060
     * @tc.desc Verify U=string result type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const result = arr.reduce<string>((prev, curr) => prev + curr.toString(), '');
      expect(Class.of(result).getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_6100
     * @tc.name testUint8ArrayReduce061
     * @tc.desc Verify empty array reduce returns initial string value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      const result = arr.reduce<string>((prev, curr) => prev + curr.toString(), 'empty');
      expect(result).assertEqual('empty');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_6200
     * @tc.name testUint8ArrayReduce062
     * @tc.desc Verify single element array reduce equals initialValue + element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(7);
      const result = arr.reduce<number>((prev, curr) => prev + curr, 3);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_6300
     * @tc.name testUint8ArrayReduce063
     * @tc.desc Verify reduce does not modify array content
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      arr.reduce<number>((prev, curr) => prev + curr, 0);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_6400
     * @tc.name testUint8ArrayReduce064
     * @tc.desc Verify reduce does not change array length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      arr.reduce<number>((prev, curr) => prev + curr, 0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_6500
     * @tc.name testUint8ArrayReduce065
     * @tc.desc Verify 100-element array reduce correctness
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.set([i + 1], i);
      }
      const result = arr.reduce<number>((prev, curr) => prev + curr, 0);
      expect(result).assertEqual(5050);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_6600
     * @tc.name testUint8ArrayReduce066
     * @tc.desc Verify callbackfn exception propagates out
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      try {
        arr.reduce<number>((prev, curr) => {
          throw new Error('reduce error');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.message).assertEqual('reduce error');
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_6700
     * @tc.name testUint8ArrayReduce067
     * @tc.desc Verify callbackfn throws RangeError that propagates out
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      try {
        arr.reduce<number>((prev, curr) => {
          throw new RangeError('out of range');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_6800
     * @tc.name testUint8ArrayReduce068
     * @tc.desc Verify callbackfn throws TypeError that propagates out
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      try {
        arr.reduce<number>((prev, curr) => {
          throw new TypeError('type mismatch');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_6900
     * @tc.name testUint8ArrayReduce069
     * @tc.desc Verify callbackfn throws at specific index that propagates out
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      try {
        arr.reduce<number>((prev, curr, idx) => {
          if (idx === 2) {
            throw new Error('error at index 2');
          }
          return prev + curr;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.message).assertEqual('error at index 2');
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_7000
     * @tc.name testUint8ArrayReduce070
     * @tc.desc Verify callbackfn throws interrupts processing
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      let processedCount: int = 0;
      try {
        arr.reduce<number>((prev, curr) => {
          processedCount++;
          if (processedCount === 2) {
            throw new Error('stop');
          }
          return prev + curr;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(processedCount).assertEqual(2);
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_7100
     * @tc.name testUint8ArrayReduce071
     * @tc.desc Verify empty array with initial value does not throw error
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      let errorThrown: boolean = false;
      try {
        arr.reduce<number>((prev, curr) => prev + curr, 0);
      } catch (e) {
        errorThrown = true;
        expect(e.name).assertEqual('Error');
      }
      expect(errorThrown).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_7200
     * @tc.name testUint8ArrayReduce072
     * @tc.desc Verify callback receives proper values during iteration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.reduce<number>((prev, curr, idx, a) => {
        if (idx === 0) {
          return curr;
        }
        return prev + curr;
      }, 0);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_7300
     * @tc.name testUint8ArrayReduce073
     * @tc.desc Verify single element array with large initial value does not truncate
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1);
      const result = arr.reduce<number>((prev, curr) => prev * curr, 1000000);
      expect(result).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE01_7400
     * @tc.name testUint8ArrayReduce074
     * @tc.desc Verify reduce uses array parameter to read element values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduce074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(5, 10, 15);
      const result = arr.reduce<number>((prev, curr, idx, a) => prev + a[idx], 0);
      expect(result).assertEqual(30);
    });
  });
}