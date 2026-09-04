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

export default function Float32ArrayReduceRight1Test(): void {
  describe('Float32ArrayReduceRight1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0010
     * @tc.name testFloat32ArrayReduceRightOne001
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0, 4.0] = 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0020
     * @tc.name testFloat32ArrayReduceRightOne002
     * @tc.desc Verify reduceRight on empty array with initialValue 99 returns 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 99);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0030
     * @tc.name testFloat32ArrayReduceRightOne003
     * @tc.desc Verify reduceRight on [7.0] = 107
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 100);
      expect(result).assertEqual(107);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0040
     * @tc.name testFloat32ArrayReduceRightOne004
     * @tc.desc Verify reduceRight on [1.0, 10.0] = -11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 10.0);
      const result = arr.reduceRight<number>((acc, v) => acc - v, 0);
      expect(result).assertEqual(-11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0050
     * @tc.name testFloat32ArrayReduceRightOne005
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0] = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight<number>((acc, v) => 0, 100);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0060
     * @tc.name testFloat32ArrayReduceRightOne006
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0] = -6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight<number>((acc, v) => acc - v, 0);
      expect(result).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0070
     * @tc.name testFloat32ArrayReduceRightOne007
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0] = 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight<number>((acc, v) => acc, 42);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0080
     * @tc.name testFloat32ArrayReduceRightOne008
     * @tc.desc Verify reduceRight callback returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight<number>((acc, v) => Number.NaN, 0);
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0090
     * @tc.name testFloat32ArrayReduceRightOne009
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0] = Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight<number>((acc, v) => Number.POSITIVE_INFINITY, 0);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0100
     * @tc.name testFloat32ArrayReduceRightOne010
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0] = -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight<number>((acc, v) => -Number.POSITIVE_INFINITY, 0);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0110
     * @tc.name testFloat32ArrayReduceRightOne011
     * @tc.desc Verify reduceRight on [1.0, 2.0] = maxVal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const maxVal: number = 3.4028234663852886e+38;
      const result = arr.reduceRight<number>((acc, v) => maxVal, 0);
      expect(result).assertEqual(maxVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0120
     * @tc.name testFloat32ArrayReduceRightOne012
     * @tc.desc Verify reduceRight on [0.0, 0.0, 0.0, 0.0] = 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0, 0.0, 0.0);
      const result = arr.reduceRight<number>((acc, v) => acc + 1, 0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0130
     * @tc.name testFloat32ArrayReduceRightOne013
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0] = 36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      let external: number = 10;
      const result = arr.reduceRight<number>((acc, v) => acc + v + external, 0);
      expect(result).assertEqual(36);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0140
     * @tc.name testFloat32ArrayReduceRightOne014
     * @tc.desc Verify callbackfn processes elements right-to-left yielding 3,2,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const sink: number[] = [];
      arr.reduceRight<number>((acc, v) => {
        sink.push(v);
        return acc + v;
      }, 0);
      expect(sink[0]).assertEqual(3);
      expect(sink[1]).assertEqual(2);
      expect(sink[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0150
     * @tc.name testFloat32ArrayReduceRightOne015
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0, 4.0] = 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const result = arr.reduceRight<number>((acc, v) => {
        const inner = Float32Array.of(v, v).reduceRight<number>((a, x) => a + x, 0);
        return acc + inner;
      }, 0);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0160
     * @tc.name testFloat32ArrayReduceRightOne016
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0, 4.0] = 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const result = arr.reduceRight<number>((acc, v) => acc * v, 1);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0170
     * @tc.name testFloat32ArrayReduceRightOne017
     * @tc.desc Verify reduceRight on [5.0, 6.0, 7.0] = 18
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 6.0, 7.0);
      const result = arr.reduceRight<number>((acc, v, i, a) => acc + a.$_get(a.length - 1 - i), 0);
      expect(result).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0180
     * @tc.name testFloat32ArrayReduceRightOne018
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0] = 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight<number>((acc, v, i, a) => acc + a.length, 0);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0190
     * @tc.name testFloat32ArrayReduceRightOne019
     * @tc.desc Verify callbackfn initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0);
      try {
        arr.reduceRight<number>((acc, v) => {
          throw new Error('first call');
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0200
     * @tc.name testFloat32ArrayReduceRightOne020
     * @tc.desc Verify callbackfn throws mid error after 3 iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      let callCount: number = 0;
      try {
        arr.reduceRight<number>((acc, v) => {
          callCount = callCount + 1;
          if (v === 2) {
            throw new Error('mid error');
          }
          return acc + v;
        }, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(callCount).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0210
     * @tc.name testFloat32ArrayReduceRightOne021
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0] = 94
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight<number>((acc, v) => acc - v, 100);
      expect(result).assertEqual(94);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0220
     * @tc.name testFloat32ArrayReduceRightOne022
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0] = true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight<boolean>((p, v) => p && v > 0, true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0230
     * @tc.name testFloat32ArrayReduceRightOne023
     * @tc.desc Verify reduceRight detects any positive value in [-1,-2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, -2.0, 3.0);
      const result = arr.reduceRight<boolean>((p, v) => p || v > 0, false);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0240
     * @tc.name testFloat32ArrayReduceRightOne024
     * @tc.desc Verify reduceRight on [3.0, 7.0, 2.0, 9.0, 1.0] = 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 7.0, 2.0, 9.0, 1.0);
      let result = arr.reduceRight<number>((acc, v) => acc > v ? acc : v, -Number.POSITIVE_INFINITY);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0250
     * @tc.name testFloat32ArrayReduceRightOne025
     * @tc.desc Verify reduceRight on [3.0, 7.0, 2.0, 9.0, 1.0] = 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 7.0, 2.0, 9.0, 1.0);
      const result = arr.reduceRight<number>((acc, v) => acc < v ? acc : v, Number.POSITIVE_INFINITY);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0260
     * @tc.name testFloat32ArrayReduceRightOne026
     * @tc.desc Verify reduceRight on [0.0, 0.0, 0.0, 0.0] = 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0, 0.0, 0.0);
      const result = arr.reduceRight<number>((acc, v, i) => acc + i, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0270
     * @tc.name testFloat32ArrayReduceRightOne027
     * @tc.desc Verify reduceRight on [10.0, 20.0, 30.0] = 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const result = arr.reduceRight<number>((acc, v) => acc + 5, 0);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0280
     * @tc.name testFloat32ArrayReduceRightOne028
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0] = 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0290
     * @tc.name testFloat32ArrayReduceRightOne029
     * @tc.desc Verify reduceRight on empty array with initialValue -0 returns -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, -0);
      const observedValue038 = 1 / result;
      expect(observedValue038).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0300
     * @tc.name testFloat32ArrayReduceRightOne030
     * @tc.desc Verify reduceRight on [2.0, 3.0, 4.0] = 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2.0, 3.0, 4.0);
      const result = arr.reduceRight<number>((acc, v) => acc * v, 1);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0310
     * @tc.name testFloat32ArrayReduceRightOne031
     * @tc.desc Verify reduceRight on [1.0, 2.0] = 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, -1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0320
     * @tc.name testFloat32ArrayReduceRightOne032
     * @tc.desc Verify initialValue = Float32.MAX (3.4028234663852886e+38)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const maxVal: number = 3.4028234663852886e+38;
      const result = arr.reduceRight<number>((acc, v) => acc + v, maxVal);
      expect(result).assertEqual(maxVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0330
     * @tc.name testFloat32ArrayReduceRightOne033
     * @tc.desc Verify reduceRight on empty array with initialValue -3.4028234663852886e+38 returns same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const minNeg: number = -3.4028234663852886e+38;
      const result = arr.reduceRight<number>((acc, v) => acc + v, minNeg);
      expect(result).assertEqual(minNeg);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0340
     * @tc.name testFloat32ArrayReduceRightOne034
     * @tc.desc Verify initialValue = Float32.MIN_NORMAL (1.1754943508222875e-38)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const minNormal: number = 1.1754943508222875e-38;
      const result = arr.reduceRight<number>((acc, v) => acc + v, minNormal);
      expect(result).assertEqual(minNormal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0350
     * @tc.name testFloat32ArrayReduceRightOne035
     * @tc.desc Verify initialValue = Float32.MIN_VALUE (1.401298464324817e-45)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const minVal: number = 1.401298464324817e-45;
      const result = arr.reduceRight<number>((acc, v) => acc + v, minVal);
      expect(result).assertEqual(minVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0360
     * @tc.name testFloat32ArrayReduceRightOne036
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0] with initialValue NaN returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, Number.NaN);
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0370
     * @tc.name testFloat32ArrayReduceRightOne037
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0] = Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, Number.POSITIVE_INFINITY);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0380
     * @tc.name testFloat32ArrayReduceRightOne038
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0] = -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, -Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0390
     * @tc.name testFloat32ArrayReduceRightOne039
     * @tc.desc Verify initialValue = 0.1 (float32 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 0.1);
      expect(result).assertEqual(0.1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0400
     * @tc.name testFloat32ArrayReduceRightOne040
     * @tc.desc Verify reduceRight on [0.1] with initialValue 0.2 returns 0.2 + arr.$_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.1);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 0.2);
      expect(result).assertEqual(0.2 + arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0410
     * @tc.name testFloat32ArrayReduceRightOne041
     * @tc.desc Verify initialValue = 16777216 (2^24, float32 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 16777216);
      expect(result).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0420
     * @tc.name testFloat32ArrayReduceRightOne042
     * @tc.desc Verify initialValue = 16777217 (2^24+1, )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 16777217);
      expect(result).assertEqual(16777217);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0430
     * @tc.name testFloat32ArrayReduceRightOne043
     * @tc.desc Verify reduceRight on empty array with initialValue 1.0e40 returns same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 1.0e40);
      expect(result).assertEqual(1.0e40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0440
     * @tc.name testFloat32ArrayReduceRightOne044
     * @tc.desc Verify initialValue = -1.0e40 double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, -1.0e40);
      expect(result).assertEqual(-1.0e40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0450
     * @tc.name testFloat32ArrayReduceRightOne045
     * @tc.desc Verify initialValue = 1.0e-46 (float32 ) double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 1.0e-46);
      expect(result).assertEqual(1.0e-46);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0460
     * @tc.name testFloat32ArrayReduceRightOne046
     * @tc.desc Verify reduceRight on [1.0, 2.0] = 19
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 0x10);
      expect(result).assertEqual(19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0470
     * @tc.name testFloat32ArrayReduceRightOne047
     * @tc.desc Verify reduceRight on [1.0, 2.0] = 18
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 0o17);
      expect(result).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0480
     * @tc.name testFloat32ArrayReduceRightOne048
     * @tc.desc Verify reduceRight on [1.0, 2.0] = 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 0b1010);
      expect(result).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0490
     * @tc.name testFloat32ArrayReduceRightOne049
     * @tc.desc Verify reduceRight on [1.0, 2.0] = 1003
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 1.0e3);
      expect(result).assertEqual(1003);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0500
     * @tc.name testFloat32ArrayReduceRightOne050
     * @tc.desc Verify reduceRight on [1.0, 2.0] = 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 9.0);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0510
     * @tc.name testFloat32ArrayReduceRightOne051
     * @tc.desc Verify initialValue = 2147483647 (int )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 2147483647);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0520
     * @tc.name testFloat32ArrayReduceRightOne052
     * @tc.desc Verify initialValue = -2147483648 (int )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, -2147483648);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0530
     * @tc.name testFloat32ArrayReduceRightOne053
     * @tc.desc Verify reduceRight on [1.0, 2.0] = 5.9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 2.9);
      expect(result).assertEqual(5.9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0540
     * @tc.name testFloat32ArrayReduceRightOne054
     * @tc.desc Verify initialValue = -2.9 ()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, -2.9);
      const observedValue063 = Math.abs(result - 0.1);
      expect(observedValue063).assertLess(1e-15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0550
     * @tc.name testFloat32ArrayReduceRightOne055
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0] = '321'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight<string>((acc, v) => acc + v, '');
      expect(result).assertEqual('321');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0560
     * @tc.name testFloat32ArrayReduceRightOne056
     * @tc.desc Verify reduceRight on [1.0, 2.0] = 'x21'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const result = arr.reduceRight<string>((acc, v) => acc + v, 'x');
      expect(result).assertEqual('x21');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0570
     * @tc.name testFloat32ArrayReduceRightOne057
     * @tc.desc Verify reduceRight on [5.0, 6.0] = 'prefix-65'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 6.0);
      const result = arr.reduceRight<string>((acc, v) => acc + v, 'prefix-');
      expect(result).assertEqual('prefix-65');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0580
     * @tc.name testFloat32ArrayReduceRightOne058
     * @tc.desc Verify reduceRight on [-1.0, -2.0, -3.0] = false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, -2.0, -3.0);
      const result = arr.reduceRight<boolean>((p, v) => p || v > 0, false);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0590
     * @tc.name testFloat32ArrayReduceRightOne059
     * @tc.desc Verify reduceRight on [10.0, 20.0, 30.0] = 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const result = arr.reduceRight<number>((acc, v) => acc - v, 100);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0600
     * @tc.name testFloat32ArrayReduceRightOne060
     * @tc.desc Verify reduceRight on [10.0, 20.0, 30.0] = -40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, -100);
      expect(result).assertEqual(-40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0610
     * @tc.name testFloat32ArrayReduceRightOne061
     * @tc.desc Verify reduceRight on [2.0, 4.0] = 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2.0, 4.0);
      const result = arr.reduceRight<number>((acc, v) => acc * v, 0.5);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0620
     * @tc.name testFloat32ArrayReduceRightOne062
     * @tc.desc Verify initialValue = 3.14159 ()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 3.14159);
      expect(result).assertEqual(3.14159);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0630
     * @tc.name testFloat32ArrayReduceRightOne063
     * @tc.desc Verify reduceRight on [8.0] = 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(8.0);
      const result = arr.reduceRight<number>((acc, v) => acc * v, 3);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0640
     * @tc.name testFloat32ArrayReduceRightOne064
     * @tc.desc Verify reduceRight does not modify array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      arr.reduceRight<number>((acc, v) => acc + v, 0);
      const element074 = arr.$_get(0);
      expect(element074).assertEqual(1);
      const element074Part2 = arr.$_get(1);
      expect(element074Part2).assertEqual(2);
      const element074Part3 = arr.$_get(2);
      expect(element074Part3).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0650
     * @tc.name testFloat32ArrayReduceRightOne065
     * @tc.desc Verify - reduceRight length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(6);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0660
     * @tc.name testFloat32ArrayReduceRightOne066
     * @tc.desc Verify reduceRight on [1.0, 2.0] = '21'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const result = arr.reduceRight<string>((acc, v) => acc + v, '');
      expect(result).assertEqual('21');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0670
     * @tc.name testFloat32ArrayReduceRightOne067
     * @tc.desc Verify reduceRight with boolean generic returns boolean accumulator value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const result = arr.reduceRight<boolean>((p, v) => p && v > 0, true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0680
     * @tc.name testFloat32ArrayReduceRightOne068
     * @tc.desc Verify reduceRight on [10.0, 20.0] = 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0690
     * @tc.name testFloat32ArrayReduceRightOne069
     * @tc.desc Verify reduceRight result reused in further computation yields 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 0);
      const observedValue079 = result * 2;
      expect(observedValue079).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0700
     * @tc.name testFloat32ArrayReduceRightOne070
     * @tc.desc Verify reduceRight<string> initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.reduceRight<string>((acc, v) => acc + v, 'seed');
      expect(result).assertEqual('seed');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0710
     * @tc.name testFloat32ArrayReduceRightOne071
     * @tc.desc Verify reduceRight on [0.1] with initialValue 0 returns 0+arr.$_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.1);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0720
     * @tc.name testFloat32ArrayReduceRightOne072
     * @tc.desc Verify reduceRight callback currentIndex starts at length-1 then descends to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0, 0.0);
      const idx: number[] = [];
      arr.reduceRight<number>((acc, v, i) => {
        idx.push(i);
        return acc + i;
      }, 0);
      expect(idx[0]).assertEqual(2);
      expect(idx[1]).assertEqual(1);
      expect(idx[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0730
     * @tc.name testFloat32ArrayReduceRightOne073
     * @tc.desc Verify reduceRight callback first currentIndex equals length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0, 40.0);
      let firstIdx: number = -1;
      arr.reduceRight<number>((acc, v, i) => {
        if (firstIdx === -1) {
          firstIdx = i;
        }
        return acc + v;
      }, 0);
      expect(firstIdx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0740
     * @tc.name testFloat32ArrayReduceRightOne074
     * @tc.desc Verify reduceRight callback last currentIndex equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0, 40.0);
      let lastIdx: number = -1;
      arr.reduceRight<number>((acc, v, i) => {
        lastIdx = i;
        return acc + v;
      }, 0);
      expect(lastIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0750
     * @tc.name testFloat32ArrayReduceRightOne075
     * @tc.desc Verify reduceRight on [9.0] = 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(9.0);
      let callCount: number = 0;
      let capturedIdx: number = -1;
      const result = arr.reduceRight<number>((acc, v, i) => {
        callCount = callCount + 1;
        capturedIdx = i;
        return acc + v;
      }, 0);
      expect(callCount).assertEqual(1);
      expect(capturedIdx).assertEqual(0);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0760
     * @tc.name testFloat32ArrayReduceRightOne076
     * @tc.desc Verify index1 index0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 100.0);
      const order: number[] = [];
      arr.reduceRight<number>((acc, v, i) => {
        order.push(i);
        return acc + v;
      }, 0);
      expect(order[0]).assertEqual(1);
      expect(order[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0770
     * @tc.name testFloat32ArrayReduceRightOne077
     * @tc.desc Verify reduceRight on [5.0, 6.0, 7.0] = 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 6.0, 7.0);
      const result = arr.reduceRight<number>((acc, v, i, a) => acc + (a.$_get(i) === v ? 1 : 0), 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0780
     * @tc.name testFloat32ArrayReduceRightOne078
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0, 4.0, 5.0] = '54321'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const result = arr.reduceRight<string>((acc, v) => acc + v, '');
      expect(result).assertEqual('54321');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0790
     * @tc.name testFloat32ArrayReduceRightOne079
     * @tc.desc Verify reduceRight index sum 0..9 = 45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(10);
      const idxSum = arr.reduceRight<number>((acc, v, i) => acc + i, 0);
      expect(idxSum).assertEqual(45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0800
     * @tc.name testFloat32ArrayReduceRightOne080
     * @tc.desc Verify reduceRight on [-1.0, 2.0, -3.0, 4.0] = 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, 2.0, -3.0, 4.0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0810
     * @tc.name testFloat32ArrayReduceRightOne081
     * @tc.desc Verify NaN NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, Number.NaN, 3.0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 0);
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0820
     * @tc.name testFloat32ArrayReduceRightOne082
     * @tc.desc Verify reduceRight on [1.0, 2.0, Infinity] = Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, Number.POSITIVE_INFINITY);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0830
     * @tc.name testFloat32ArrayReduceRightOne083
     * @tc.desc Verify reduceRight on [1.0, 2.0, -Infinity] = -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, -Number.POSITIVE_INFINITY);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0840
     * @tc.name testFloat32ArrayReduceRightOne084
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0, 4.0] = -10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const result = arr.reduceRight<number>((acc, v) => acc - v, 0);
      expect(result).assertEqual(-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0850
     * @tc.name testFloat32ArrayReduceRightOne085
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0, 4.0] = '4321'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const result = arr.reduceRight<string>((acc, v) => acc + v, '');
      expect(result).assertEqual('4321');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0860
     * @tc.name testFloat32ArrayReduceRightOne086
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0] = '1|2|3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight<string>((acc, v) => acc.length === 0 ? `${v}` : `${v}|${acc}`, '');
      expect(result).assertEqual('1|2|3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0870
     * @tc.name testFloat32ArrayReduceRightOne087
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0] = '123'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight<string>((acc, v) => `${v}${acc}`, '');
      expect(result).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0880
     * @tc.name testFloat32ArrayReduceRightOne088
     * @tc.desc Verify reduceRight on [1.0, 22.0, 333.0] = '321'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 22.0, 333.0);
      const result = arr.reduceRight<string>((acc, v) => acc + v.toString().length, '');
      expect(result).assertEqual('321');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0890
     * @tc.name testFloat32ArrayReduceRightOne089
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0, 4.0] = true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const result = arr.reduceRight<boolean>((p, v) => p && v > 0, true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0900
     * @tc.name testFloat32ArrayReduceRightOne090
     * @tc.desc Verify reduceRight on [0.0, -5.0] all <= 0 becomes false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, -5.0);
      const result = arr.reduceRight<boolean>((p, v) => p || v > 0, false);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0910
     * @tc.name testFloat32ArrayReduceRightOne091
     * @tc.desc Verify reduceRight on [7.0, 8.0] = 'v=87'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0, 8.0);
      const result = arr.reduceRight<string>((acc, v) => acc + v, 'v=');
      expect(result).assertEqual('v=87');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0920
     * @tc.name testFloat32ArrayReduceRightOne092
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0] = 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      let counter: number = 0;
      const result = arr.reduceRight<number>((acc, v) => {
        counter = counter + 1;
        return acc + v + counter;
      }, 0);
      expect(counter).assertEqual(3);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0930
     * @tc.name testFloat32ArrayReduceRightOne093
     * @tc.desc Verify callbackfn processes right-to-left: 30, 20, 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const trace: number[] = [];
      arr.reduceRight<number>((acc, v) => {
        trace.push(v);
        return acc;
      }, 0);
      expect(trace.length).assertEqual(3);
      expect(trace[0]).assertEqual(30);
      expect(trace[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0940
     * @tc.name testFloat32ArrayReduceRightOne094
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0] = '963'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight<string>((acc, v) => {
        const innerSum = Float32Array.of(v, v, v).reduceRight<number>((a, x) => a + x, 0);
        return acc + innerSum.toString();
      }, '');
      expect(result).assertEqual('963');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0950
     * @tc.name testFloat32ArrayReduceRightOne095
     * @tc.desc Verify reduceRight initialValue reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const first = arr.reduceRight<number>((acc, v) => acc + v, 0);
      const second = arr.reduceRight<number>((acc, v) => acc + v, first);
      expect(second).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0960
     * @tc.name testFloat32ArrayReduceRightOne096
     * @tc.desc Verify reduceRight on [1..100] returns 5050
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [];
      for (let i = 1; i <= 100; i++) {
        src.push(i);
      }
      const arr = Float32Array.from(src);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(5050);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0970
     * @tc.name testFloat32ArrayReduceRightOne097
     * @tc.desc Verify reduceRight on 5-element zero array returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(5);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0980
     * @tc.name testFloat32ArrayReduceRightOne098
     * @tc.desc Verify reduceRight on [2.0, 2.0, 2.0, 2.0] = 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2.0, 2.0, 2.0, 2.0);
      const result = arr.reduceRight<number>((acc, v) => acc * v, 1);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_0990
     * @tc.name testFloat32ArrayReduceRightOne099
     * @tc.desc Verify reduceRight on [-5.0, -5.0] = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-5.0, -5.0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_1000
     * @tc.name testFloat32ArrayReduceRightOne100
     * @tc.desc Verify reduceRight on [5.0, 10.0, 15.0] = 40 (v*i summed right-to-left: 15*2+10*1+5*0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 10.0, 15.0);
      const result = arr.reduceRight<number>((acc, v, i) => acc + v * i, 0);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_1010
     * @tc.name testFloat32ArrayReduceRightOne101
     * @tc.desc Verify reduceRight on [1.0e40] = Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0e40);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_1020
     * @tc.name testFloat32ArrayReduceRightOne102
     * @tc.desc Verify reduceRight on [-1.0e40] = -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0e40);
      const result = arr.reduceRight<number>((acc, v) => acc + v, 0);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_1030
     * @tc.name testFloat32ArrayReduceRightOne103
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0] = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight<number>((acc, v) => acc + v, -6);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_1040
     * @tc.name testFloat32ArrayReduceRightOne104
     * @tc.desc Verify reduceRight on [5.0] = true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0);
      const result = arr.reduceRight<boolean>((p, v) => p && v > 0, true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_1050
     * @tc.name testFloat32ArrayReduceRightOne105
     * @tc.desc Verify reduceRight on [42.0] = '42'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(42.0);
      const result = arr.reduceRight<string>((acc, v) => acc + v, '');
      expect(result).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_1060
     * @tc.name testFloat32ArrayReduceRightOne106
     * @tc.desc Verify reduceRight on [3.0, 4.0] = 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 4.0);
      const result = arr.reduceRight<number>((acc, v) => acc / v, 12);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_1070
     * @tc.name testFloat32ArrayReduceRightOne107
     * @tc.desc Verify reduceRight on [1.0, 2.0, 3.0, 4.0, 5.0] = 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const result = arr.reduceRight<number>((acc, v) => (acc + v) % 7, 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_1080
     * @tc.name testFloat32ArrayReduceRightOne108
     * @tc.desc Verify reduceRight<boolean> initialValue callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      let called: boolean = false;
      const result = arr.reduceRight<boolean>((p, v) => {
        called = true;
        return p && v > 0;
      }, true);
      expect(called).assertFalse();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_ONE_1090
     * @tc.name testFloat32ArrayReduceRightOne109
     * @tc.desc Verify reduceRight<string> initialValue callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightOne109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      let called: boolean = false;
      const result = arr.reduceRight<string>((acc, v) => {
        called = true;
        return acc + v;
      }, 'init');
      expect(called).assertFalse();
      expect(result).assertEqual('init');
    });

  });
}
