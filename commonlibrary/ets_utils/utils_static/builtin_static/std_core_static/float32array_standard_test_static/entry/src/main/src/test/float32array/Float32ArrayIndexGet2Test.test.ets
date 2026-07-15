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

function expectRangeError(action: () => void): void {
  try {
    action();
    expect().assertFail();
  } catch (e) {
    expect(e.name).assertEqual('RangeError');
  }
}

export default function Float32ArrayIndexGet2Test(): void {
  describe('Float32ArrayIndexGet2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_0100
     * @tc.name testFloat32ArrayIndexGetTWO001
     * @tc.desc Verify reading index 0 returns the ordinary float element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5, 2.5, 3.5]);
      const v = arr.$_get(0);
      expect(v).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_0200
     * @tc.name testFloat32ArrayIndexGetTWO002
     * @tc.desc Verify reading index 0 returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN]);
      const v = arr.$_get(0);
      expect(v).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_0300
     * @tc.name testFloat32ArrayIndexGetTWO003
     * @tc.desc Verify reading index 0 returns positive Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Infinity]);
      const v = arr.$_get(0);
      expect(v).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_0400
     * @tc.name testFloat32ArrayIndexGetTWO004
     * @tc.desc Verify reading index 0 returns negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-Infinity]);
      const v = arr.$_get(0);
      expect(v).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_0500
     * @tc.name testFloat32ArrayIndexGetTWO005
     * @tc.desc Verify reading index 0 returns the default zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0]);
      const v = arr.$_get(0);
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_0600
     * @tc.name testFloat32ArrayIndexGetTWO006
     * @tc.desc Verify reading index 0 preserves negative zero sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.0]);
      const v = arr.$_get(0);
      expect(1 / v).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_0700
     * @tc.name testFloat32ArrayIndexGetTWO007
     * @tc.desc Verify reading index 0 returns Float32 maximum finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38]);
      const v = arr.$_get(0);
      expect(v).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_0800
     * @tc.name testFloat32ArrayIndexGetTWO008
     * @tc.desc Verify reading index 0 returns Float32 minimum positive denormalized value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.401298464324817e-45]);
      const v = arr.$_get(0);
      expect(v).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_0900
     * @tc.name testFloat32ArrayIndexGetTWO009
     * @tc.desc Verify reading index 0 returns the negative Float32 maximum finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-3.4028234663852886e+38]);
      const v = arr.$_get(0);
      expect(v).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_1000
     * @tc.name testFloat32ArrayIndexGetTWO010
     * @tc.desc Verify empty array index 0 read throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      expectRangeError((): void => {
        arr.$_get(0);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_1100
     * @tc.name testFloat32ArrayIndexGetTWO011
     * @tc.desc Verify out of bounds index=length read throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(3);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_1200
     * @tc.name testFloat32ArrayIndexGetTWO012
     * @tc.desc Verify out of bounds index=length+1 read throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(4);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_1300
     * @tc.name testFloat32ArrayIndexGetTWO013
     * @tc.desc Verify negative index -1 read throws RangeError (does not wrap)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(-1);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_1400
     * @tc.name testFloat32ArrayIndexGetTWO014
     * @tc.desc Verify negative index -length read throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(-3);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_1500
     * @tc.name testFloat32ArrayIndexGetTWO015
     * @tc.desc Verify negative index -length-1 read throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expectRangeError((): void => {
        arr.$_get(-4);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_1600
     * @tc.name testFloat32ArrayIndexGetTWO016
     * @tc.desc Verify subarray view element read returns the first visible value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      const view = base.subarray(1, 3);
      const v = view.$_get(0);
      expect(v).assertEqual(20);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_1700
     * @tc.name testFloat32ArrayIndexGetTWO017
     * @tc.desc Verify after $_set write, read returns the stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.$_set(0, 0x10);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_1800
     * @tc.name testFloat32ArrayIndexGetTWO018
     * @tc.desc Verify $_get(0) returns first element exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5, 2.5, 3.5]);
      expect(arr.$_get(0)).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_1900
     * @tc.name testFloat32ArrayIndexGetTWO019
     * @tc.desc Verify $_get(1) returns middle element exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5, 2.5, 3.5]);
      expect(arr.$_get(1)).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_2000
     * @tc.name testFloat32ArrayIndexGetTWO020
     * @tc.desc Verify $_get(2) returns last element exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5, 2.5, 3.5]);
      expect(arr.$_get(2)).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_2100
     * @tc.name testFloat32ArrayIndexGetTWO021
     * @tc.desc Verify read NaN element asserts NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN]);
      expect(arr.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_2200
     * @tc.name testFloat32ArrayIndexGetTWO022
     * @tc.desc Verify read +Infinity element exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Infinity]);
      expect(arr.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_2300
     * @tc.name testFloat32ArrayIndexGetTWO023
     * @tc.desc Verify read -Infinity element exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-Infinity]);
      expect(arr.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_2400
     * @tc.name testFloat32ArrayIndexGetTWO024
     * @tc.desc Verify read +0 element verified as positive zero via 1/x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0]);
      expect(1 / arr.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_2500
     * @tc.name testFloat32ArrayIndexGetTWO025
     * @tc.desc Verify read -0 element verified as negative zero via 1/x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.0]);
      expect(1 / arr.$_get(0)).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_2600
     * @tc.name testFloat32ArrayIndexGetTWO026
     * @tc.desc Verify read Float32.MAX exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38]);
      expect(arr.$_get(0)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_2700
     * @tc.name testFloat32ArrayIndexGetTWO027
     * @tc.desc Verify read Float32.MIN_NORMAL exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.1754943508222875e-38]);
      expect(arr.$_get(0)).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_2800
     * @tc.name testFloat32ArrayIndexGetTWO028
     * @tc.desc Verify read Float32.MIN_VALUE exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.401298464324817e-45]);
      expect(arr.$_get(0)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_2900
     * @tc.name testFloat32ArrayIndexGetTWO029
     * @tc.desc Verify read smallest finite negative value exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-3.4028234663852886e+38]);
      expect(arr.$_get(0)).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_3000
     * @tc.name testFloat32ArrayIndexGetTWO030
     * @tc.desc Verify read 16777217 truncated to 16777216 by float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777217]);
      expect(arr.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_3100
     * @tc.name testFloat32ArrayIndexGetTWO031
     * @tc.desc Verify read 2^24=16777216 exactly representable integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777216]);
      expect(arr.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_3200
     * @tc.name testFloat32ArrayIndexGetTWO032
     * @tc.desc Verify read 1.0e40 overflows to +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e40]);
      expect(arr.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_3300
     * @tc.name testFloat32ArrayIndexGetTWO033
     * @tc.desc Verify read -1.0e40 overflows to -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0e40]);
      expect(arr.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_3400
     * @tc.name testFloat32ArrayIndexGetTWO034
     * @tc.desc Verify read 1.0e-46 underflows to +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e-46]);
      expect(1 / arr.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_3500
     * @tc.name testFloat32ArrayIndexGetTWO035
     * @tc.desc Verify $_get(0) returns the first element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([9.25, 8.75]);
      expect(arr.$_get(0)).assertEqual(9.25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_3600
     * @tc.name testFloat32ArrayIndexGetTWO036
     * @tc.desc Verify $_get(1) equals arr.at(1) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([4.5, 5.5, 6.5]);
      expect(arr.$_get(1)).assertEqual(arr.at(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_3700
     * @tc.name testFloat32ArrayIndexGetTWO037
     * @tc.desc Verify out of bounds large index read throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      expectRangeError((): void => {
        arr.$_get(5);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_3800
     * @tc.name testFloat32ArrayIndexGetTWO038
     * @tc.desc Verify negative index read throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      expectRangeError((): void => {
        arr.$_get(-1);
      });
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_3900
     * @tc.name testFloat32ArrayIndexGetTWO039
     * @tc.desc Verify single-element array $_get(0) returns that element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([42.0]);
      expect(arr.$_get(0)).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_4000
     * @tc.name testFloat32ArrayIndexGetTWO040
     * @tc.desc Verify scientific notation 1.0e3 read returns 1000.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e3]);
      expect(arr.$_get(0)).assertEqual(1000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_4100
     * @tc.name testFloat32ArrayIndexGetTWO041
     * @tc.desc Verify hex literal 0xFF read returns 255.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0xFF]);
      expect(arr.$_get(0)).assertEqual(255.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_4200
     * @tc.name testFloat32ArrayIndexGetTWO042
     * @tc.desc Verify negative value -7.5 read returns exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-7.5, 3.0]);
      expect(arr.$_get(0)).assertEqual(-7.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_4300
     * @tc.name testFloat32ArrayIndexGetTWO043
     * @tc.desc Verify ten-element array read last index 9 exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0]);
      expect(arr.$_get(9)).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_4400
     * @tc.name testFloat32ArrayIndexGetTWO044
     * @tc.desc Verify after valid $_get, length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.$_get(0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_4500
     * @tc.name testFloat32ArrayIndexGetTWO045
     * @tc.desc Verify after out-of-bounds $_get, length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      expectRangeError((): void => {
        arr.$_get(5);
      });
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_4600
     * @tc.name testFloat32ArrayIndexGetTWO046
     * @tc.desc Verify after negative index $_get, length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      expectRangeError((): void => {
        arr.$_get(-1);
      });
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_4700
     * @tc.name testFloat32ArrayIndexGetTWO047
     * @tc.desc Verify after valid $_get, byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.$_get(1);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_4800
     * @tc.name testFloat32ArrayIndexGetTWO048
     * @tc.desc Verify after out-of-bounds $_get, byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      expectRangeError((): void => {
        arr.$_get(100);
      });
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_4900
     * @tc.name testFloat32ArrayIndexGetTWO049
     * @tc.desc Verify after directly constructed array $_get, byteOffset stays 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      arr.$_get(0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_5000
     * @tc.name testFloat32ArrayIndexGetTWO050
     * @tc.desc Verify after buffer view $_get, byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 3);
      arr.$_get(0);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_5100
     * @tc.name testFloat32ArrayIndexGetTWO051
     * @tc.desc Verify after multiple $_get, length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      arr.$_get(0);
      arr.$_get(1);
      arr.$_get(2);
      arr.$_get(3);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_5200
     * @tc.name testFloat32ArrayIndexGetTWO052
     * @tc.desc Verify after empty array $_get, byteLength stays 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      expectRangeError((): void => {
        arr.$_get(0);
      });
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_5300
     * @tc.name testFloat32ArrayIndexGetTWO053
     * @tc.desc Verify $_get does not change the element at the read index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.5, 6.6]);
      arr.$_get(0);
      expect(arr.$_get(0)).assertEqual(5.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_5400
     * @tc.name testFloat32ArrayIndexGetTWO054
     * @tc.desc Verify $_get does not change other index elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.1, 2.2, 3.3]);
      arr.$_get(0);
      expect(Math.abs(arr.$_get(2) - 3.3) < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_5500
     * @tc.name testFloat32ArrayIndexGetTWO055
     * @tc.desc Verify $_get idempotent read returns same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.7]);
      const a = arr.$_get(0);
      const b = arr.$_get(0);
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_5600
     * @tc.name testFloat32ArrayIndexGetTWO056
     * @tc.desc Verify $_get does not modify underlying buffer (view read)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf);
      arr.$_set(0, 11.0);
      arr.$_set(1, 22.0);
      arr.$_get(0);
      const view = new Float32Array(buf);
      expect(view.$_get(1)).assertEqual(22.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_5700
     * @tc.name testFloat32ArrayIndexGetTWO057
     * @tc.desc Verify subarray view $_get does not affect sibling views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const v1 = base.subarray(0, 2);
      const v2 = base.subarray(2, 4);
      v1.$_get(0);
      expect(v2.$_get(0)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_5800
     * @tc.name testFloat32ArrayIndexGetTWO058
     * @tc.desc Verify after $_set, $_get reads new value and $_get itself does not change value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      arr.$_set(0, 9.9);
      expect(Math.abs(arr.$_get(0) - 9.9) < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_5900
     * @tc.name testFloat32ArrayIndexGetTWO059
     * @tc.desc Verify after cross-multi-index $_get, overall content retained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.$_get(0);
      arr.$_get(2);
      arr.$_get(4);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_6000
     * @tc.name testFloat32ArrayIndexGetTWO060
     * @tc.desc Verify $_get returned value can participate in arithmetic proving not this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0]);
      expect(arr.$_get(0) + arr.$_get(1)).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_6100
     * @tc.name testFloat32ArrayIndexGetTWO061
     * @tc.desc Verify $_get returned value can be used as Math function input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16.0]);
      expect(Math.sqrt(arr.$_get(0))).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_6200
     * @tc.name testFloat32ArrayIndexGetTWO062
     * @tc.desc Verify subarray view $_get reads shared buffer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view = base.subarray(1, 3);
      expect(view.$_get(0)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_6300
     * @tc.name testFloat32ArrayIndexGetTWO063
     * @tc.desc Verify after parent array $_set, child view $_get reflects new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      const view = base.subarray(1, 3);
      base.$_set(1, 99.0);
      expect(view.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_6400
     * @tc.name testFloat32ArrayIndexGetTWO064
     * @tc.desc Verify after child view $_set, parent array $_get reflects new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      const view = base.subarray(1, 3);
      view.$_set(0, 88.0);
      expect(base.$_get(1)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_6500
     * @tc.name testFloat32ArrayIndexGetTWO065
     * @tc.desc Verify slice copy $_get does not reflect parent array modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      const copy = base.slice(0, 3);
      base.$_set(0, 99.0);
      expect(copy.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_6600
     * @tc.name testFloat32ArrayIndexGetTWO066
     * @tc.desc Verify subarray view byteOffset correctly reflects offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view = base.subarray(2, 4);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_6700
     * @tc.name testFloat32ArrayIndexGetTWO067
     * @tc.desc Verify two views of same buffer $_get see same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Float32Array(buf);
      const b = new Float32Array(buf);
      a.$_set(0, 7.0);
      expect(b.$_get(0)).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_6800
     * @tc.name testFloat32ArrayIndexGetTWO068
     * @tc.desc Verify subarray view ArrayBuffer.isView returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1.0, 2.0]);
      const view = base.subarray(0, 1);
      expect(ArrayBuffer.isView(view)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_6900
     * @tc.name testFloat32ArrayIndexGetTWO069
     * @tc.desc Verify buffer view with non-zero byteOffset $_get reads correct slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const arr = new Float32Array(buf);
      arr.$_set(0, 1.0);
      arr.$_set(1, 2.0);
      arr.$_set(2, 3.0);
      const view = new Float32Array(buf, 4, 2);
      expect(view.$_get(0)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_7000
     * @tc.name testFloat32ArrayIndexGetTWO070
     * @tc.desc Verify buffer view byteOffset reflects construction offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Float32Array(buf, 8, 2);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_7100
     * @tc.name testFloat32ArrayIndexGetTWO071
     * @tc.desc Verify cross-offset $_set propagates via shared buffer to offset view $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Float32Array(buf);
      const b = new Float32Array(buf, 4, 1);
      a.$_set(1, 55.0);
      expect(b.$_get(0)).assertEqual(55.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_7200
     * @tc.name testFloat32ArrayIndexGetTWO072
     * @tc.desc Verify view $_get equals parent array corresponding index $_get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([10.0, 20.0, 30.0]);
      const view = base.subarray(1, 3);
      expect(view.$_get(1)).assertEqual(base.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_7300
     * @tc.name testFloat32ArrayIndexGetTWO073
     * @tc.desc Verify empty subarray view $_get throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1.0, 2.0]);
      const view = base.subarray(2, 2);
      expectRangeError((): void => {
        view.$_get(0);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_7400
     * @tc.name testFloat32ArrayIndexGetTWO074
     * @tc.desc Verify view out-of-bounds $_get throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view = base.subarray(1, 3);
      expectRangeError((): void => {
        view.$_get(2);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_7500
     * @tc.name testFloat32ArrayIndexGetTWO075
     * @tc.desc Verify octal literal 0o17 read returns 15.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0o17]);
      expect(arr.$_get(0)).assertEqual(15.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_7600
     * @tc.name testFloat32ArrayIndexGetTWO076
     * @tc.desc Verify binary literal 0b101 read returns 5.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0b101]);
      expect(arr.$_get(0)).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_7700
     * @tc.name testFloat32ArrayIndexGetTWO077
     * @tc.desc Verify after Float32Array.of construction, $_get reads last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_7800
     * @tc.name testFloat32ArrayIndexGetTWO078
     * @tc.desc Verify after Float32Array.from construction, $_get reads element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.from([5.0, 6.0]);
      expect(arr.$_get(1)).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_7900
     * @tc.name testFloat32ArrayIndexGetTWO079
     * @tc.desc Verify view constructed from another array buffer $_get reads correct slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view = new Float32Array(src.buffer, 4, 2);
      expect(view.$_get(1)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_8000
     * @tc.name testFloat32ArrayIndexGetTWO080
     * @tc.desc Verify after fill, $_get reads filled value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(2.5);
      expect(arr.$_get(1)).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_8100
     * @tc.name testFloat32ArrayIndexGetTWO081
     * @tc.desc Verify after copyWithin, $_get reads moved value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      arr.copyWithin(0, 2, 4);
      expect(arr.$_get(0)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_8200
     * @tc.name testFloat32ArrayIndexGetTWO082
     * @tc.desc Verify length-constructed zero-filled array $_get reads 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_8300
     * @tc.name testFloat32ArrayIndexGetTWO083
     * @tc.desc Verify int upper bound 2147483647 stored in float32 reads as 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2147483647]);
      expect(arr.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_8400
     * @tc.name testFloat32ArrayIndexGetTWO084
     * @tc.desc Verify int lower bound -2147483648 stored in float32 reads exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-2147483648]);
      expect(arr.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_8500
     * @tc.name testFloat32ArrayIndexGetTWO085
     * @tc.desc Verify huge positive index 2147483647 read throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      expectRangeError((): void => {
        arr.$_get(2147483647);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_8600
     * @tc.name testFloat32ArrayIndexGetTWO086
     * @tc.desc Verify huge negative index -2147483648 read throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      expectRangeError((): void => {
        arr.$_get(-2147483648);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_8700
     * @tc.name testFloat32ArrayIndexGetTWO087
     * @tc.desc Verify middle position NaN element $_get asserts NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, NaN, 3.0]);
      expect(arr.$_get(1)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_8800
     * @tc.name testFloat32ArrayIndexGetTWO088
     * @tc.desc Verify mixed special values array $_get reads +Infinity slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0, Infinity, -Infinity, NaN]);
      expect(arr.$_get(1)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_8900
     * @tc.name testFloat32ArrayIndexGetTWO089
     * @tc.desc Verify mixed special values array $_get reads -Infinity slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0, Infinity, -Infinity, NaN]);
      expect(arr.$_get(2)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INDEX_GETTWO_9000
     * @tc.name testFloat32ArrayIndexGetTWO090
     * @tc.desc Verify mixed special values array $_get reads NaN slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIndexGetTWO090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0, Infinity, -Infinity, NaN]);
      expect(arr.$_get(3)).assertNaN();
    });

  });
}
