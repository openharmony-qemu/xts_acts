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

export default function Float32ArrayReduce1Test(): void {
  describe('Float32ArrayReduce1Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(45);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0010
     * @tc.name testFloat32ArrayReduceOne001
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0, 4.0] = 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0020
     * @tc.name testFloat32ArrayReduceOne002
     * @tc.desc Verify reduce on [10.0, 20.0, 30.0] = 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0030
     * @tc.name testFloat32ArrayReduceOne003
     * @tc.desc Verify reduce on [5.0, 5.0, 5.0] = 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 5.0, 5.0);
      const result = arr.reduce<number>((acc: number, v: number, index: int, array: Float32Array): number => acc + v, 0);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0040
     * @tc.name testFloat32ArrayReduceOne004
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce<number>((acc, v) => acc * v, 1);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0050
     * @tc.name testFloat32ArrayReduceOne005
     * @tc.desc Verify reduce on [10.0, 10.0, 10.0] = 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 10.0, 10.0);
      const result = arr.reduce<number>((acc, v, i) => acc + v * i, 0);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0060
     * @tc.name testFloat32ArrayReduceOne006
     * @tc.desc Verify reduce on [2.0, 4.0, 6.0] = 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2.0, 4.0, 6.0);
      const result = arr.reduce<number>((acc, v, i, a) => acc + a.$_get(i), 0);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0070
     * @tc.name testFloat32ArrayReduceOne007
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce<number>((acc, v) => 0, 100);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0080
     * @tc.name testFloat32ArrayReduceOne008
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = -6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce<number>((acc, v) => acc - v, 0);
      expect(result).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0090
     * @tc.name testFloat32ArrayReduceOne009
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce<number>((acc, v) => acc, 42);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0100
     * @tc.name testFloat32ArrayReduceOne010
     * @tc.desc Verify reduce callback returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce<number>((acc, v) => Number.NaN, 0);
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0110
     * @tc.name testFloat32ArrayReduceOne011
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce<number>((acc, v) => Number.POSITIVE_INFINITY, 0);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0120
     * @tc.name testFloat32ArrayReduceOne012
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce<number>((acc, v) => -Number.POSITIVE_INFINITY, 0);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0130
     * @tc.name testFloat32ArrayReduceOne013
     * @tc.desc Verify reduce callback returns -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const result = arr.reduce<number>((acc, v) => -0, 0);
      const observedValue013 = 1 / result;
      expect(observedValue013).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0140
     * @tc.name testFloat32ArrayReduceOne014
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      let multiplier = 10;
      const result = arr.reduce<number>((acc, v) => acc + v * multiplier, 0);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0150
     * @tc.name testFloat32ArrayReduceOne015
     * @tc.desc Verify reduce callback accumulates via toInt()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      let sum = 0;
      arr.reduce<number>((acc, v) => { sum += v.toInt(); return acc + v; }, 0);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0160
     * @tc.name testFloat32ArrayReduceOne016
     * @tc.desc Verify reduce on [1.0, 2.0] = 63
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const outer = Float32Array.of(1.0, 2.0);
      const result = outer.reduce<number>((acc, v) => acc + v + Float32Array.of(10.0, 20.0).reduce<number>((a2, v2) => a2 + v2, 0), 0);
      expect(result).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0170
     * @tc.name testFloat32ArrayReduceOne017
     * @tc.desc Verify reduce callback is called 5 times on length-5 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      let count = 0;
      arr.reduce<number>((acc, v) => { count++; return acc + v; }, 0);
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0180
     * @tc.name testFloat32ArrayReduceOne018
     * @tc.desc Verify reduce callback first currentIndex is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      let firstIndex = -1;
      arr.reduce<number>((acc, v, i) => { if (i === 0) { firstIndex = i; } return acc + v; }, 0);
      expect(firstIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0190
     * @tc.name testFloat32ArrayReduceOne019
     * @tc.desc Verify reduce callback second element currentIndex is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      let secondIndex = -1;
      arr.reduce<number>((acc, v, i) => { if (i === 1) { secondIndex = i; } return acc + v; }, 0);
      expect(secondIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0200
     * @tc.name testFloat32ArrayReduceOne020
     * @tc.desc Verify reduce callback last currentIndex equals length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      let lastIndex = -1;
      arr.reduce<number>((acc, v, i) => { lastIndex = i; return acc + v; }, 0);
      expect(lastIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0210
     * @tc.name testFloat32ArrayReduceOne021
     * @tc.desc Verify reduce callback array param has length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      let capturedLen = 0;
      arr.reduce<number>((acc, v, i, a) => { if (i === 0) { capturedLen = a.length; } return acc + v; }, 0);
      expect(capturedLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0220
     * @tc.name testFloat32ArrayReduceOne022
     * @tc.desc Verify reduce callback can mutate the source Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      arr.reduce<number>((acc, v, i, a) => { if (i === 0) { a.$_set(2, 99); } return acc + v; }, 0);
      const element022 = arr.$_get(2);
      expect(element022).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0230
     * @tc.name testFloat32ArrayReduceOne023
     * @tc.desc Verify reduce callback array.\$_get(i) matches currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0, 8.0, 9.0);
      let captured = 0;
      arr.reduce((acc, v, i, a) => { if (i === 1) { captured = a.$_get(1).toInt(); } return (acc + v).toInt(); }, 0);
      expect(captured).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0240
     * @tc.name testFloat32ArrayReduceOne024
     * @tc.desc Verify reduce throws RangeError when callback throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      try {
        arr.reduce<number>((acc, v) => { throw new RangeError('boom'); }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0250
     * @tc.name testFloat32ArrayReduceOne025
     * @tc.desc Verify reduce throws TypeError when callback throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      try {
        arr.reduce<number>((acc, v) => { throw new TypeError('bad'); }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0260
     * @tc.name testFloat32ArrayReduceOne026
     * @tc.desc Verify reduce throws Error when callback throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      try {
        arr.reduce<number>((acc, v) => { throw new Error('err'); }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0270
     * @tc.name testFloat32ArrayReduceOne027
     * @tc.desc Verify reduce throws on first element, stops after 1 call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      let calls = 0;
      try {
        arr.reduce<number>((acc, v) => { calls++; if (calls === 1) { throw new RangeError('first'); } return acc + v; }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(calls).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0280
     * @tc.name testFloat32ArrayReduceOne028
     * @tc.desc Verify reduce throws on the third callback and stops after 3 calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      let calls = 0;
      try {
        arr.reduce<number>((acc, v) => { calls++; if (calls === 3) { throw new RangeError('last'); } return acc + v; }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(calls).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0290
     * @tc.name testFloat32ArrayReduceOne029
     * @tc.desc Verify reduce propagates RangeError from the second callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      let calls = 0;
      try {
        arr.reduce<number>((acc, v) => { calls++; if (calls === 2) { throw new RangeError('mid'); } return acc + v; }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(calls).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0300
     * @tc.name testFloat32ArrayReduceOne030
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0310
     * @tc.name testFloat32ArrayReduceOne031
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce<number>((acc, v) => acc + v, -5);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0320
     * @tc.name testFloat32ArrayReduceOne032
     * @tc.desc Verify reduce on [0.0, 0.0, 0.0] with initialValue 3.4028234663852886e+38 = 3.4028234663852886e+38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0, 0.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 3.4028234663852886e+38);
      expect(result).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0330
     * @tc.name testFloat32ArrayReduceOne033
     * @tc.desc Verify reduce on [0.0, 0.0] = 1.1754943508222875e-38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 1.1754943508222875e-38);
      expect(result).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0340
     * @tc.name testFloat32ArrayReduceOne034
     * @tc.desc Verify reduce on [0.0, 0.0] = 1.401298464324817e-45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 1.401298464324817e-45);
      expect(result).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0350
     * @tc.name testFloat32ArrayReduceOne035
     * @tc.desc Verify initialValue NaN NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce<number>((acc, v) => acc + v, Number.NaN);
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0360
     * @tc.name testFloat32ArrayReduceOne036
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce<number>((acc, v) => acc + v, Number.POSITIVE_INFINITY);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0370
     * @tc.name testFloat32ArrayReduceOne037
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce<number>((acc, v) => acc + v, -Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0380
     * @tc.name testFloat32ArrayReduceOne038
     * @tc.desc Verify reduce on [1.0, 2.0] = 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0390
     * @tc.name testFloat32ArrayReduceOne039
     * @tc.desc Verify initialValue -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0);
      const result = arr.reduce<number>((acc, v) => acc + v, -0.0);
      const observedValue039 = 1 / result;
      expect(observedValue039).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0400
     * @tc.name testFloat32ArrayReduceOne040
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = '123'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce<string>((acc, v) => acc + v, '');
      expect(result).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0410
     * @tc.name testFloat32ArrayReduceOne041
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = 'x=123'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce<string>((acc, v) => acc + v, 'x=');
      expect(result).assertEqual('x=123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0420
     * @tc.name testFloat32ArrayReduceOne042
     * @tc.desc Verify reduce on [0.0, 0.0] = 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 0.1);
      expect(result).assertEqual(0.1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0430
     * @tc.name testFloat32ArrayReduceOne043
     * @tc.desc Verify reduce on [0.0, 0.0] = 9007199254740991
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 9007199254740991);
      expect(result).assertEqual(9007199254740991);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0440
     * @tc.name testFloat32ArrayReduceOne044
     * @tc.desc Verify reduce on [0.0, 0.0] = 9007199254740992
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 9007199254740992);
      expect(result).assertEqual(9007199254740992);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0450
     * @tc.name testFloat32ArrayReduceOne045
     * @tc.desc Verify reduce on [0.0, 0.0] = 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 16777216);
      expect(result).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0460
     * @tc.name testFloat32ArrayReduceOne046
     * @tc.desc Verify reduce on [0.0, 0.0] = 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 0x10);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0470
     * @tc.name testFloat32ArrayReduceOne047
     * @tc.desc Verify reduce on [0.0, 0.0] = 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 0o10);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0480
     * @tc.name testFloat32ArrayReduceOne048
     * @tc.desc Verify reduce on [0.0, 0.0] = 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 0b10);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0490
     * @tc.name testFloat32ArrayReduceOne049
     * @tc.desc Verify reduce on [0.0, 0.0] = 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 1.0e3);
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0500
     * @tc.name testFloat32ArrayReduceOne050
     * @tc.desc Verify reduce on [0.0, 0.0] = -3.4028234663852886e+38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0);
      const result = arr.reduce<number>((acc, v) => acc + v, -3.4028234663852886e+38);
      expect(result).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0510
     * @tc.name testFloat32ArrayReduceOne051
     * @tc.desc Verify reduce on [0.0, 0.0] = 2.9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 2.9);
      expect(result).assertEqual(2.9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0520
     * @tc.name testFloat32ArrayReduceOne052
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce<number>((acc, v) => acc > v ? acc : v, 100);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0530
     * @tc.name testFloat32ArrayReduceOne053
     * @tc.desc Verify reduce [1.0,2.0,3.0] with initial 10.0 = 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 10.0);
      expect(result).assertEqual(16.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0540
     * @tc.name testFloat32ArrayReduceOne054
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0, 4.0, 5.0] = 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0550
     * @tc.name testFloat32ArrayReduceOne055
     * @tc.desc Verify initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.reduce<number>((acc, v) => acc + v, 42);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0560
     * @tc.name testFloat32ArrayReduceOne056
     * @tc.desc Verify reduce on [10.0, 20.0, 30.0] = '10,20,30,'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const result = arr.reduce<string>((acc, v) => acc + v + ',', '');
      expect(result).assertEqual('10,20,30,');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0570
     * @tc.name testFloat32ArrayReduceOne057
     * @tc.desc Verify reduce with initialValue does not mutate original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      arr.reduce<number>((acc, v) => acc + v, 0);
      const element058 = arr.$_get(0);
      expect(element058).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0580
     * @tc.name testFloat32ArrayReduceOne058
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 0) * 2;
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0590
     * @tc.name testFloat32ArrayReduceOne059
     * @tc.desc Verify reduce on [5.0] with initialValue 10 = 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 10);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0600
     * @tc.name testFloat32ArrayReduceOne060
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = 94
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce<number>((acc, v) => acc - v, 100);
      expect(result).assertEqual(94);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0610
     * @tc.name testFloat32ArrayReduceOne061
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0, 4.0] = 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const result = arr.reduce<number>((acc, v) => acc * v, 1);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0620
     * @tc.name testFloat32ArrayReduceOne062
     * @tc.desc Verify reduce on [3.0, 1.0, 4.0, 1.0, 5.0] = 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 4.0, 1.0, 5.0);
      const result = arr.reduce<number>((acc, v) => acc > v ? acc : v, -Number.POSITIVE_INFINITY);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0630
     * @tc.name testFloat32ArrayReduceOne063
     * @tc.desc Verify reduce on [3.0, 1.0, 4.0, 1.0, 5.0] = 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 4.0, 1.0, 5.0);
      const result = arr.reduce<number>((acc, v) => acc < v ? acc : v, Number.POSITIVE_INFINITY);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0640
     * @tc.name testFloat32ArrayReduceOne064
     * @tc.desc Verify reduce on empty array with initialValue does not invoke callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      let count = 0;
      arr.reduce<number>((acc, v) => { count++; return acc + v; }, 0);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0650
     * @tc.name testFloat32ArrayReduceOne065
     * @tc.desc Verify reduce throws RangeError when callback throws on v===1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      try {
        arr.reduce<number>((acc, v) => { if (v === 1) { throw new RangeError('a'); } return acc + v; }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0660
     * @tc.name testFloat32ArrayReduceOne066
     * @tc.desc Verify reduce throws RangeError when callback throws on v===3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      try {
        arr.reduce<number>((acc, v) => { if (v === 3) { throw new RangeError('z'); } return acc + v; }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0670
     * @tc.name testFloat32ArrayReduceOne067
     * @tc.desc Verify reduce throws RangeError after accumulating sum via toInt()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      let sum = 0;
      try {
        arr.reduce<number>((acc, v) => { sum += v.toInt(); if (v === 3) { throw new RangeError('p'); } return acc + v; }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(sum).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0680
     * @tc.name testFloat32ArrayReduceOne068
     * @tc.desc Verify reduce with initialValue on single-element array invokes callback once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0);
      let calls = 0;
      const result = arr.reduce<number>((acc, v) => { calls++; return acc + v; }, 10);
      expect(calls).assertEqual(1);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0690
     * @tc.name testFloat32ArrayReduceOne069
     * @tc.desc Verify NaN NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, Number.NaN, 3.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 0);
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0700
     * @tc.name testFloat32ArrayReduceOne070
     * @tc.desc Verify reduce on [3.4028234663852886e+38, 0.0] = 3.4028234663852886e+38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.4028234663852886e+38, 0.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0710
     * @tc.name testFloat32ArrayReduceOne071
     * @tc.desc Verify reduce on [1.1754943508222875e-38, 0.0] = 1.1754943508222875e-38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.1754943508222875e-38, 0.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0720
     * @tc.name testFloat32ArrayReduceOne072
     * @tc.desc Verify reduce on [1.401298464324817e-45, 0.0] = 1.401298464324817e-45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.401298464324817e-45, 0.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0730
     * @tc.name testFloat32ArrayReduceOne073
     * @tc.desc Verify NaN NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, 1.0, 2.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 0);
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0740
     * @tc.name testFloat32ArrayReduceOne074
     * @tc.desc Verify reduce on [Infinity, 1.0, 2.0] = Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.POSITIVE_INFINITY, 1.0, 2.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0750
     * @tc.name testFloat32ArrayReduceOne075
     * @tc.desc Verify reduce on [-Infinity, 1.0, 2.0] = -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-Number.POSITIVE_INFINITY, 1.0, 2.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0760
     * @tc.name testFloat32ArrayReduceOne076
     * @tc.desc Verify -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-0.0, -0.0);
      const result = arr.reduce<number>((acc, v) => acc + v, -0);
      const observedValue077 = 1 / result;
      expect(observedValue077).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0770
     * @tc.name testFloat32ArrayReduceOne077
     * @tc.desc Verify reduce on [0.1, 0.2] = 0.30000000447034836
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.1, 0.2);
      const result = arr.reduce<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(0.30000000447034836);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0780
     * @tc.name testFloat32ArrayReduceOne078
     * @tc.desc Verify reduce on [16777217.0] = 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777217.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0790
     * @tc.name testFloat32ArrayReduceOne079
     * @tc.desc Verify reduce on [1.0e40] = Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0e40);
      const result = arr.reduce<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0800
     * @tc.name testFloat32ArrayReduceOne080
     * @tc.desc Verify reduce on [-1.0e40] = -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0e40);
      const result = arr.reduce<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0810
     * @tc.name testFloat32ArrayReduceOne081
     * @tc.desc Verify reduce on [1.0e-46] = 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0e-46);
      const result = arr.reduce<number>((acc, v) => acc + v, 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0820
     * @tc.name testFloat32ArrayReduceOne082
     * @tc.desc Verify reduce on [0.0, 0.0, 0.0, 0.0] = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0, 0.0, 0.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0830
     * @tc.name testFloat32ArrayReduceOne083
     * @tc.desc Verify reduce on [5.0, 5.0, 5.0, 5.0] = 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 5.0, 5.0, 5.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0840
     * @tc.name testFloat32ArrayReduceOne084
     * @tc.desc Verify reduce on [-1.0, 2.0, -3.0, 4.0] = 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, 2.0, -3.0, 4.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0850
     * @tc.name testFloat32ArrayReduceOne085
     * @tc.desc Verify reduce on [42.0] = 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(42.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 8);
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0860
     * @tc.name testFloat32ArrayReduceOne086
     * @tc.desc Verify reduce on [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0] = 103
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(103);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0870
     * @tc.name testFloat32ArrayReduceOne087
     * @tc.desc Verify reduce on [0x10, 0x20] = 48
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0x20);
      const result = arr.reduce<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(48);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0880
     * @tc.name testFloat32ArrayReduceOne088
     * @tc.desc Verify reduce on [16777216.0, 1.0] = 16777217
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777216.0, 1.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(16777217);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0890
     * @tc.name testFloat32ArrayReduceOne089
     * @tc.desc Verify reduce on [-1.0, -2.0, -3.0] = -6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, -2.0, -3.0);
      const result = arr.reduce<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0900
     * @tc.name testFloat32ArrayReduceOne090
     * @tc.desc Verify currentIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      let seq = '';
      arr.reduce<number>((acc, v, i) => { seq += i; return acc + v; }, 0);
      expect(seq).assertEqual('012');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0910
     * @tc.name testFloat32ArrayReduceOne091
     * @tc.desc Verify currentIndex currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0, 8.0, 9.0);
      let mismatch = 0;
      arr.reduce<number>((acc, v, i, a) => { if (a.$_get(i) !== v) { mismatch++; } return acc + v; }, 0);
      expect(mismatch).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0920
     * @tc.name testFloat32ArrayReduceOne092
     * @tc.desc Verify currentIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0);
      let idx = -1;
      arr.reduce<number>((acc, v, i) => { idx = i; return acc + v; }, 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0930
     * @tc.name testFloat32ArrayReduceOne093
     * @tc.desc Verify reduce callback array param is Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      let isInstance = false;
      arr.reduce<number>((acc, v, i, a) => { if (i === 0) { isInstance = a === arr; } return acc + v; }, 0);
      expect(isInstance).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0940
     * @tc.name testFloat32ArrayReduceOne094
     * @tc.desc Verify reduce callback array.byteLength equals 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      let captured = 0;
      arr.reduce<number>((acc, v, i, a) => { if (i === 0) { captured = a.byteLength; } return acc + v; }, 0);
      expect(captured).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0950
     * @tc.name testFloat32ArrayReduceOne095
     * @tc.desc Verify reduce callback array.buffer is the same reference as source array.buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      let sameBuffer = false;
      arr.reduce<number>((acc, v, i, a) => { if (i === 0) { sameBuffer = a.buffer === arr.buffer; } return acc + v; }, 0);
      expect(sameBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0960
     * @tc.name testFloat32ArrayReduceOne096
     * @tc.desc Verify reduce callback array param mutation persists to source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      arr.reduce<number>((acc, v, i, a) => { if (i === 0) { a.$_set(0, 77); } return acc + v; }, 0);
      const element097 = arr.$_get(0);
      expect(element097).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0970
     * @tc.name testFloat32ArrayReduceOne097
     * @tc.desc Verify reduce on [10.0, 20.0, 30.0] = '0:10 1:20 2:30 '
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const result = arr.reduce<string>((acc, v, i) => acc + i + ':' + v + ' ', '');
      expect(result).assertEqual('0:10 1:20 2:30 ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0980
     * @tc.name testFloat32ArrayReduceOne098
     * @tc.desc Verify reduce on [10.0, 20.0, 30.0] = ',10,20,30'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const result = arr.reduce<string>((acc, v) => acc + ',' + v, '');
      expect(result).assertEqual(',10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_0990
     * @tc.name testFloat32ArrayReduceOne099
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = '321'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce<string>((acc, v) => v + acc, '');
      expect(result).assertEqual('321');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_1000
     * @tc.name testFloat32ArrayReduceOne100
     * @tc.desc Verify reduce<string>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 200.0, 3.0);
      const result = arr.reduce<string>((acc, v) => acc + v, '>');
      expect(result).assertEqual('>102003');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_1010
     * @tc.name testFloat32ArrayReduceOne101
     * @tc.desc Verify reduce on [1.5, 2.5] = '1.52.5'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.5, 2.5);
      const result = arr.reduce<string>((acc, v) => acc + v, '');
      expect(result).assertEqual('1.52.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_ONE_1020
     * @tc.name testFloat32ArrayReduceOne102
     * @tc.desc Verify reduce on [9.0] = 'n=9'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceOne102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(9.0);
      const result = arr.reduce<string>((acc, v) => acc + v, 'n=');
      expect(result).assertEqual('n=9');
    });

  });
}
