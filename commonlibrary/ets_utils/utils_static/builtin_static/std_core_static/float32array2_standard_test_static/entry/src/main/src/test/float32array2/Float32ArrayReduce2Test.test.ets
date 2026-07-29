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

export default function Float32ArrayReduce2Test(): void {
  describe('Float32ArrayReduce2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0010
     * @tc.name testFloat32ArrayReduceTwo001
     * @tc.desc Verify reduce on [10.0, 20.0] = 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0020
     * @tc.name testFloat32ArrayReduceTwo002
     * @tc.desc Verify reduce on [42.0] = 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(42.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0030
     * @tc.name testFloat32ArrayReduceTwo003
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0, 4.0] = 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0040
     * @tc.name testFloat32ArrayReduceTwo004
     * @tc.desc Verify reduce on [5.0, 5.0, 5.0, 5.0] = 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 5.0, 5.0, 5.0);
      const result = arr.reduce((acc: number, v: number, index: int, array: Float32Array): number => acc + v);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0050
     * @tc.name testFloat32ArrayReduceTwo005
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0, 4.0] = 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const result = arr.reduce((acc, v) => acc * v);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0060
     * @tc.name testFloat32ArrayReduceTwo006
     * @tc.desc Verify reduce on [10.0, 10.0, 10.0, 10.0] = 10 + (10 + 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 10.0, 10.0, 10.0);
      const result = arr.reduce((acc, v, i) => acc + v + i);
      expect(result).assertEqual(10 + (10 + 1) + (10 + 2) + (10 + 3));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0070
     * @tc.name testFloat32ArrayReduceTwo007
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = 1 + (2 + 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce((acc, v, i, a) => acc + v + a.length);
      expect(result).assertEqual(1 + (2 + 3) + (3 + 3));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0080
     * @tc.name testFloat32ArrayReduceTwo008
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0, 4.0, 5.0] = 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const result = arr.reduce((acc, v) => 7);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0090
     * @tc.name testFloat32ArrayReduceTwo009
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce((acc, v) => 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0100
     * @tc.name testFloat32ArrayReduceTwo010
     * @tc.desc Verify reduce callback returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce((acc, v) => Number.NaN);
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0110
     * @tc.name testFloat32ArrayReduceTwo011
     * @tc.desc Verify reduce callback returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce((acc, v) => Number.POSITIVE_INFINITY);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0120
     * @tc.name testFloat32ArrayReduceTwo012
     * @tc.desc Verify reduce callback returns -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce((acc, v) => -Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0130
     * @tc.name testFloat32ArrayReduceTwo013
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce((acc, v) => -v);
      expect(result).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0140
     * @tc.name testFloat32ArrayReduceTwo014
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce((acc, v) => 0.1);
      expect(result).assertEqual(0.1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0150
     * @tc.name testFloat32ArrayReduceTwo015
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = 1 + 2 * 2 + 3 * 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      let factor = 2;
      const result = arr.reduce((acc, v) => acc + v * factor);
      expect(result).assertEqual(1 + 2 * 2 + 3 * 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0160
     * @tc.name testFloat32ArrayReduceTwo016
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0, 4.0] = 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      let count = 0;
      const result = arr.reduce((acc, v) => {
        count = count + 1;
        return acc + v;
      });
      expect(result).assertEqual(10);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0170
     * @tc.name testFloat32ArrayReduceTwo017
     * @tc.desc Verify callbackfn throws Error on first call, calls=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      let calls = 0;
      try {
        arr.reduce((acc, v) => {
          calls = calls + 1;
          throw new Error('first');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(calls).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0180
     * @tc.name testFloat32ArrayReduceTwo018
     * @tc.desc Verify callbackfn throws Error on second call, calls=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      let calls = 0;
      try {
        arr.reduce((acc, v) => {
          calls = calls + 1;
          if (calls === 2) {
            throw new Error('second');
          }
          return acc + v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(calls).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0190
     * @tc.name testFloat32ArrayReduceTwo019
     * @tc.desc Verify callbackfn throws Error with custom message 'custom-msg-123'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      try {
        arr.reduce((acc, v) => {
          throw new Error('custom-msg-123');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        const observedValue023 = (e as Error).message;
        expect(observedValue023).assertEqual('custom-msg-123');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0200
     * @tc.name testFloat32ArrayReduceTwo020
     * @tc.desc Verify reduce on [100.0, 2.0, 3.0, 4.0] = 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(100.0, 2.0, 3.0, 4.0);
      const result = arr.reduce((acc, v) => acc);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0210
     * @tc.name testFloat32ArrayReduceTwo021
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = 1 + (2 + 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce((acc, v) => acc + Float32Array.of(v, v).reduce((a, b) => a + b));
      expect(result).assertEqual(1 + (2 + 2) + (3 + 3));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0220
     * @tc.name testFloat32ArrayReduceTwo022
     * @tc.desc Verify previousValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0, 2.0, 3.0);
      let firstPrev = 0;
      let captured = false;
      arr.reduce((acc, v) => {
        if (!captured) {
          firstPrev = acc.toInt();
          captured = true;
        }
        return acc + v;
      });
      expect(firstPrev).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0230
     * @tc.name testFloat32ArrayReduceTwo023
     * @tc.desc Verify previousValue callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 10.0, 100.0);
      const prevs: number[] = [1, 10, 100];
      arr.reduce((acc, v) => {
        prevs.push(acc);
        return acc + v;
      });
      expect(prevs[3]).assertEqual(1);
      expect(prevs[4]).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0240
     * @tc.name testFloat32ArrayReduceTwo024
     * @tc.desc Verify reduce on [3.5] = 3.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.5);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0250
     * @tc.name testFloat32ArrayReduceTwo025
     * @tc.desc Verify reduce on [5.0, 0.0] = 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 0.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0260
     * @tc.name testFloat32ArrayReduceTwo026
     * @tc.desc Verify reduce on [5.0, -0.0] = 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, -0.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0270
     * @tc.name testFloat32ArrayReduceTwo027
     * @tc.desc Verify currentValue NaN NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, Number.NaN, 3.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0280
     * @tc.name testFloat32ArrayReduceTwo028
     * @tc.desc Verify currentValue Infinity Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, Number.POSITIVE_INFINITY, 3.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0290
     * @tc.name testFloat32ArrayReduceTwo029
     * @tc.desc Verify currentValue -Infinity -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, -Number.POSITIVE_INFINITY, 3.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0300
     * @tc.name testFloat32ArrayReduceTwo030
     * @tc.desc Verify currentValue Float32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 3.4028234663852886e+38);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0310
     * @tc.name testFloat32ArrayReduceTwo031
     * @tc.desc Verify reduce on [1.0, 1.1754943508222875e-38] = 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 1.1754943508222875e-38);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0320
     * @tc.name testFloat32ArrayReduceTwo032
     * @tc.desc Verify currentValue Float32.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 1.401298464324817e-45);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0330
     * @tc.name testFloat32ArrayReduceTwo033
     * @tc.desc Verify currentValue Float32.MAX 1 + (-MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, -3.4028234663852886e+38);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0340
     * @tc.name testFloat32ArrayReduceTwo034
     * @tc.desc Verify reduce on [0.0, 0.1] = 0.10000000149011612
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.1);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0350
     * @tc.name testFloat32ArrayReduceTwo035
     * @tc.desc Verify currentValue 0.1 0.2 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.1, 0.2);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(0.30000000447034836);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0360
     * @tc.name testFloat32ArrayReduceTwo036
     * @tc.desc Verify reduce on [0.0, 16777216.0] = 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 16777216.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0370
     * @tc.name testFloat32ArrayReduceTwo037
     * @tc.desc Verify currentValue 16777217 2^24+1 float32 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.$_set(0, 0);
      arr.$_set(1, 16777217);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0380
     * @tc.name testFloat32ArrayReduceTwo038
     * @tc.desc Verify currentValue 1.0e40 float32 Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.$_set(0, 0);
      arr.$_set(1, 1.0e40);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0390
     * @tc.name testFloat32ArrayReduceTwo039
     * @tc.desc Verify currentValue -1.0e40 float32 -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.$_set(0, 0);
      arr.$_set(1, -1.0e40);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0400
     * @tc.name testFloat32ArrayReduceTwo040
     * @tc.desc Verify currentValue 1.0e-46 +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.$_set(0, 0);
      arr.$_set(1, 1.0e-46);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0410
     * @tc.name testFloat32ArrayReduceTwo041
     * @tc.desc Verify reduce on [0x10, 0x20] = 48
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0x20);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(48);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0420
     * @tc.name testFloat32ArrayReduceTwo042
     * @tc.desc Verify reduce on [0o10, 0o20] = 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0o10, 0o20);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0430
     * @tc.name testFloat32ArrayReduceTwo043
     * @tc.desc Verify reduce on [0b1010, 0b0101] = 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0b1010, 0b0101);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0440
     * @tc.name testFloat32ArrayReduceTwo044
     * @tc.desc Verify reduce on [1e3, 2e3] = 3000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1e3, 2e3);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0450
     * @tc.name testFloat32ArrayReduceTwo045
     * @tc.desc Verify reduce on [9.0, 9.0] = 9.0 * 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(9.0, 9.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(9.0 * 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0460
     * @tc.name testFloat32ArrayReduceTwo046
     * @tc.desc Verify reduce on [0.0, 2147483647.0] = 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 2147483647.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0470
     * @tc.name testFloat32ArrayReduceTwo047
     * @tc.desc Verify reduce on [0.0, -2147483648.0] = -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, -2147483648.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0480
     * @tc.name testFloat32ArrayReduceTwo048
     * @tc.desc Verify reduce on [-1.0, -2.0, -3.0, -4.0] = -10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, -2.0, -3.0, -4.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0490
     * @tc.name testFloat32ArrayReduceTwo049
     * @tc.desc Verify reduce on [-5.0, 10.0, -3.0, 8.0] = 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-5.0, 10.0, -3.0, 8.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0500
     * @tc.name testFloat32ArrayReduceTwo050
     * @tc.desc Verify currentIndex 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      let firstIdx = -1;
      let captured = false;
      arr.reduce((acc, v, i) => {
        if (!captured) {
          firstIdx = i;
          captured = true;
        }
        return acc + v;
      });
      expect(firstIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0510
     * @tc.name testFloat32ArrayReduceTwo051
     * @tc.desc Verify currentIndex 1, 2, 3...
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const idxs: number[] = [];
      arr.reduce((acc, v, i) => {
        idxs.push(i);
        return acc + v;
      });
      expect(idxs[0]).assertEqual(1);
      expect(idxs[1]).assertEqual(2);
      expect(idxs[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0520
     * @tc.name testFloat32ArrayReduceTwo052
     * @tc.desc Verify currentIndex length - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      let lastIdx = -1;
      arr.reduce((acc, v, i) => {
        lastIdx = i;
        return acc + v;
      });
      expect(lastIdx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0530
     * @tc.name testFloat32ArrayReduceTwo053
     * @tc.desc Verify currentIndex 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      let idx = -1;
      arr.reduce((acc, v, i) => {
        idx = i;
        return acc + v;
      });
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0540
     * @tc.name testFloat32ArrayReduceTwo054
     * @tc.desc Verify currentIndex 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      let idx = -1;
      arr.reduce((acc, v, i) => {
        idx = i;
        return acc + v;
      });
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0550
     * @tc.name testFloat32ArrayReduceTwo055
     * @tc.desc Verify reduce on [1.0, 1.0, 1.0, 1.0] = 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 1.0, 1.0, 1.0);
      const result = arr.reduce((acc, v, i) => acc + v * i);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0560
     * @tc.name testFloat32ArrayReduceTwo056
     * @tc.desc Verify reduce callback array param references original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      let sameRef = false;
      arr.reduce((acc, v, i, a) => {
        sameRef = (a === arr);
        return acc + v;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0570
     * @tc.name testFloat32ArrayReduceTwo057
     * @tc.desc Verify array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      let len = 0;
      arr.reduce((acc, v, i, a) => {
        len = a.length;
        return acc + v;
      });
      expect(len).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0580
     * @tc.name testFloat32ArrayReduceTwo058
     * @tc.desc Verify array $_get(currentIndex) currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      let ok = true;
      arr.reduce((acc, v, i, a) => {
        if (a.$_get(i) !== v) {
          ok = false;
        }
        return acc + v;
      });
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0590
     * @tc.name testFloat32ArrayReduceTwo059
     * @tc.desc Verify array at(currentIndex) currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      let ok = true;
      arr.reduce((acc, v, i, a) => {
        if (a.at(i) !== v) {
          ok = false;
        }
        return acc + v;
      });
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0600
     * @tc.name testFloat32ArrayReduceTwo060
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = 6.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0610
     * @tc.name testFloat32ArrayReduceTwo061
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0, 4.0, 5.0] = 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0620
     * @tc.name testFloat32ArrayReduceTwo062
     * @tc.desc Verify reduce on [3.0, 7.0, 2.0, 9.0, 1.0] = 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 7.0, 2.0, 9.0, 1.0);
      const result = arr.reduce((acc, v) => acc > v ? acc : v);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0630
     * @tc.name testFloat32ArrayReduceTwo063
     * @tc.desc Verify reduce on [3.0, 7.0, 2.0, 9.0, 1.0] = 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 7.0, 2.0, 9.0, 1.0);
      const result = arr.reduce((acc, v) => acc < v ? acc : v);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0640
     * @tc.name testFloat32ArrayReduceTwo064
     * @tc.desc Verify reduce on [100.0, 10.0, 1.0] = 89
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(100.0, 10.0, 1.0);
      const result = arr.reduce((acc, v) => acc - v);
      expect(result).assertEqual(89);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0650
     * @tc.name testFloat32ArrayReduceTwo065
     * @tc.desc Verify reduce on [99.0] = 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(99.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0660
     * @tc.name testFloat32ArrayReduceTwo066
     * @tc.desc Verify NaN assertNaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, 1.0, 2.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0670
     * @tc.name testFloat32ArrayReduceTwo067
     * @tc.desc Verify Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.POSITIVE_INFINITY, 1.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0680
     * @tc.name testFloat32ArrayReduceTwo068
     * @tc.desc Verify reduce does not mutate Float32Array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      arr.reduce((acc, v) => acc + v);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0690
     * @tc.name testFloat32ArrayReduceTwo069
     * @tc.desc Verify reduce keeps original element values unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      arr.reduce((acc, v) => acc + v);
      const element073 = arr.$_get(0);
      expect(element073).assertEqual(1);
      const element073Part2 = arr.$_get(3);
      expect(element073Part2).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0700
     * @tc.name testFloat32ArrayReduceTwo070
     * @tc.desc Verify reduce reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const r1 = arr.reduce((acc, v) => acc + v);
      const arr2 = Float32Array.of(r1, r1);
      const r2 = arr2.reduce((acc, v) => acc + v);
      expect(r2).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0710
     * @tc.name testFloat32ArrayReduceTwo071
     * @tc.desc Verify initialValue TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      try {
        arr.reduce((acc, v) => acc + v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0720
     * @tc.name testFloat32ArrayReduceTwo072
     * @tc.desc Verify initialValue callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      let called = false;
      try {
        arr.reduce((acc, v) => {
          called = true;
          return acc + v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(called).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0730
     * @tc.name testFloat32ArrayReduceTwo073
     * @tc.desc Verify reduce throws ClassCastError when callback is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      try {
        arr.reduce(undefined as object as (a: number, b: number) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0740
     * @tc.name testFloat32ArrayReduceTwo074
     * @tc.desc Verify initialValue reduce TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      try {
        arr.reduce((previousValue: number, currentValue: number, currentIndex: int, array: Float32Array): number => {
          return previousValue + currentValue;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0750
     * @tc.name testFloat32ArrayReduceTwo075
     * @tc.desc Verify MAX + MAX reduce double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.4028234663852886e+38, 3.4028234663852886e+38);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(6.805646932770577e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0760
     * @tc.name testFloat32ArrayReduceTwo076
     * @tc.desc Verify reduce on [1.401298464324817e-45, 1.401298464324817e-45] = 2.802596928649634e-45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.401298464324817e-45, 1.401298464324817e-45);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(2.802596928649634e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0770
     * @tc.name testFloat32ArrayReduceTwo077
     * @tc.desc Verify -0 + -0 -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-0.0, -0.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(1 / result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0780
     * @tc.name testFloat32ArrayReduceTwo078
     * @tc.desc Verify +0 -0 +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, -0.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(1 / result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0790
     * @tc.name testFloat32ArrayReduceTwo079
     * @tc.desc Verify NaN NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, Number.NaN, 4.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0800
     * @tc.name testFloat32ArrayReduceTwo080
     * @tc.desc Verify reduce on [16777216.0, 1.0] = 16777217
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777216.0, 1.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(16777217);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0810
     * @tc.name testFloat32ArrayReduceTwo081
     * @tc.desc Verify reduce(acc+v) on [0.1,0.1,0.1] result is not exactly 0.3 due to float32 precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.1, 0.1, 0.1);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(0.30000000447034836);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0820
     * @tc.name testFloat32ArrayReduceTwo082
     * @tc.desc Verify reduce on [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0] = 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0830
     * @tc.name testFloat32ArrayReduceTwo083
     * @tc.desc Verify 100 1 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [];
      for (let i = 0; i < 100; i++) {
        src.push(1);
      }
      const arr = Float32Array.from(src);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0840
     * @tc.name testFloat32ArrayReduceTwo084
     * @tc.desc Verify Float32Array.from reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.from([1.0, 2.0, 3.0]);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0850
     * @tc.name testFloat32ArrayReduceTwo085
     * @tc.desc Verify reduce on $_set-initialized Float32Array [1,2,3] returns 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0860
     * @tc.name testFloat32ArrayReduceTwo086
     * @tc.desc Verify ArrayBuffer reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      arr.$_set(3, 4);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0870
     * @tc.name testFloat32ArrayReduceTwo087
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0, 4.0, 5.0, 6.0] = 2 + 3 + 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0, 6.0);
      const view = base.subarray(1, 4);
      const result = view.reduce((acc, v) => acc + v);
      expect(result).assertEqual(2 + 3 + 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0880
     * @tc.name testFloat32ArrayReduceTwo088
     * @tc.desc Verify reduce on [10.0, 20.0, 30.0, 40.0] = 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(10.0, 20.0, 30.0, 40.0);
      const copy = base.slice(1, 3);
      const result = copy.reduce((acc, v) => acc + v);
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0890
     * @tc.name testFloat32ArrayReduceTwo089
     * @tc.desc Verify reduce on [0.0, 0.0, 0.0, 0.0] = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0, 0.0, 0.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0900
     * @tc.name testFloat32ArrayReduceTwo090
     * @tc.desc Verify reduce on [7.0, 7.0, 7.0, 7.0, 7.0] = 35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0, 7.0, 7.0, 7.0, 7.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0910
     * @tc.name testFloat32ArrayReduceTwo091
     * @tc.desc Verify callback is not invoked for single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const single = Float32Array.of(5.0);
      let singleCalled = false;
      single.reduce((acc, v) => {
        singleCalled = true;
        return acc + v;
      });
      expect(singleCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0920
     * @tc.name testFloat32ArrayReduceTwo092
     * @tc.desc Verify callback length - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      let calls = 0;
      arr.reduce((acc, v) => {
        calls = calls + 1;
        return acc + v;
      });
      expect(calls).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0930
     * @tc.name testFloat32ArrayReduceTwo093
     * @tc.desc Verify callback array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      let total = 0;
      arr.reduce((acc, v, i, a) => {
        total = (total + a.$_get(i)).toInt();
        return acc + v;
      });
      expect(total).assertEqual(2 + 3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0940
     * @tc.name testFloat32ArrayReduceTwo094
     * @tc.desc Verify reduce on [42.0, 1.0, 2.0, 3.0] = 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(42.0, 1.0, 2.0, 3.0);
      const result = arr.reduce((acc, v) => acc);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0950
     * @tc.name testFloat32ArrayReduceTwo095
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0, 99.0] = 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 99.0);
      const result = arr.reduce((acc, v) => v);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0960
     * @tc.name testFloat32ArrayReduceTwo096
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0] = 55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0970
     * @tc.name testFloat32ArrayReduceTwo097
     * @tc.desc Verify reduce on [5.0, 3.0, 8.0, 1.0, 9.0, 2.0] = 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 3.0, 8.0, 1.0, 9.0, 2.0);
      const result = arr.reduce((acc, v) => acc > v ? acc : v);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0980
     * @tc.name testFloat32ArrayReduceTwo098
     * @tc.desc Verify reduce on [5.0, 3.0, 8.0, 1.0, 9.0, 2.0] = 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 3.0, 8.0, 1.0, 9.0, 2.0);
      const result = arr.reduce((acc, v) => acc < v ? acc : v);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_0990
     * @tc.name testFloat32ArrayReduceTwo099
     * @tc.desc Verify reduce on [1.0, 22.0, 333.0] = 356
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 22.0, 333.0);
      const result = arr.reduce((acc, v) => acc + v);
      expect(result).assertEqual(356);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_1000
     * @tc.name testFloat32ArrayReduceTwo100
     * @tc.desc Verify reduce on [100.0, 2.0, 5.0] = 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(100.0, 2.0, 5.0);
      const result = arr.reduce((acc, v) => acc / v);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_1010
     * @tc.name testFloat32ArrayReduceTwo101
     * @tc.desc Verify reduce on [100.0, 7.0, 3.0] = 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(100.0, 7.0, 3.0);
      const result = arr.reduce((acc, v) => acc % v);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_1020
     * @tc.name testFloat32ArrayReduceTwo102
     * @tc.desc Verify reduce on [3.0, 1.0, 4.0, 1.0, 5.0] = 14 and indexOf(4) is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 4.0, 1.0, 5.0);
      const idx = arr.indexOf(4);
      const result = arr.reduce((acc, v) => acc + v);
      expect(idx).assertEqual(2);
      expect(result).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_1030
     * @tc.name testFloat32ArrayReduceTwo103
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0, 4.0] = 10 and includes(4) is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const result = arr.reduce((acc, v) => acc + v);
      const predicateResult108 = arr.includes(4);
      expect(predicateResult108).assertTrue();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_1040
     * @tc.name testFloat32ArrayReduceTwo104
     * @tc.desc Verify reduce on [2.0, 3.0, 4.0] = 27
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2.0, 3.0, 4.0);
      const result = arr.reduce((acc, v) => acc + v * v);
      expect(result).assertEqual(27);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_1050
     * @tc.name testFloat32ArrayReduceTwo105
     * @tc.desc Verify reduce on [10.0, 10.0, 10.0, 10.0] = 70
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 10.0, 10.0, 10.0);
      const result = arr.reduce((acc, v, i) => acc + v * i);
      expect(result).assertEqual(70);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_1060
     * @tc.name testFloat32ArrayReduceTwo106
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0, 4.0, 5.0] = 120
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const result = arr.reduce((acc, v) => acc * v);
      expect(result).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_1070
     * @tc.name testFloat32ArrayReduceTwo107
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0] = 123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce((acc, v) => acc * 10 + v);
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_1080
     * @tc.name testFloat32ArrayReduceTwo108
     * @tc.desc Verify reduce on [1.0, 2.0, 3.0, 4.0, 5.0] = 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const result = arr.reduce<number>((acc, v) => v > 2 ? acc + 1 : acc, 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_1090
     * @tc.name testFloat32ArrayReduceTwo109
     * @tc.desc Verify reduce with initialValue NaN on [1,2,3] returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce((acc, v) => acc + v, Number.NaN);
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_1100
     * @tc.name testFloat32ArrayReduceTwo110
     * @tc.desc Verify reduce with initialValue Infinity on [1,2,3] returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce((acc, v) => acc + v, Number.POSITIVE_INFINITY);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_1110
     * @tc.name testFloat32ArrayReduceTwo111
     * @tc.desc Verify reduce with initialValue -Infinity on [1,2,3] returns -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduce((acc, v) => acc + v, -Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_TWO_1120
     * @tc.name testFloat32ArrayReduceTwo112
     * @tc.desc Verify reduce with initialValue -0.0 on empty array preserves -0 sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceTwo112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.reduce((acc, v) => acc + v, -0.0);
      const inv = 1.0 / result;
      expect(inv).assertEqual(-Number.POSITIVE_INFINITY);
    });

  });
}
