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

export default function Float32ArrayWith1Test(): void {
  describe('Float32ArrayWith1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0010
     * @tc.name testFloat32ArrayWithONE001
     * @tc.desc Verify arity 2 legal call, returns a new array after replacing the element at the specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 30;
      const replaced = Float32Array.of(10.0, 20.0).with(1, value);
      expect(replaced.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0020
     * @tc.name testFloat32ArrayWithONE002
     * @tc.desc Verify arity 2 call, the returned array length equals the original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 50;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.length).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0030
     * @tc.name testFloat32ArrayWithONE003
     * @tc.desc Verify index = length (2) out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 1;
      try {
        Float32Array.of(10.0, 20.0).with(2, value);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0040
     * @tc.name testFloat32ArrayWithONE004
     * @tc.desc Verify index = length + 1 (3) out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 1;
      try {
        Float32Array.of(10.0, 20.0).with(3, value);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0050
     * @tc.name testFloat32ArrayWithONE005
     * @tc.desc Verify index -1 throws RangeError for negative index (two-element array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 77;
      try {
        Float32Array.of(10.0, 20.0).with(-1, value);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0060
     * @tc.name testFloat32ArrayWithONE006
     * @tc.desc Verify index -length throws RangeError for negative index (two-element array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 66;
      try {
        Float32Array.of(10.0, 20.0).with(-2, value);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0070
     * @tc.name testFloat32ArrayWithONE007
     * @tc.desc Verify index -length - 1 (-3) is out of bounds and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 1;
      try {
        Float32Array.of(10.0, 20.0).with(-3, value);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0080
     * @tc.name testFloat32ArrayWithONE008
     * @tc.desc Verify index 2147483647 very large positive number out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 1;
      try {
        Float32Array.of(10.0, 20.0).with(2147483647, value);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0090
     * @tc.name testFloat32ArrayWithONE009
     * @tc.desc Verify index -2147483648 very large negative number is out of bounds and throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 1;
      try {
        Float32Array.of(10.0, 20.0).with(-2147483648, value);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0100
     * @tc.name testFloat32ArrayWithONE010
     * @tc.desc Verify empty array index 0 out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 1;
      try {
        Float32Array.of().with(0, value);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0110
     * @tc.name testFloat32ArrayWithONE011
     * @tc.desc Verify empty array index -1 out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 1;
      try {
        Float32Array.of().with(-1, value);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0120
     * @tc.name testFloat32ArrayWithONE012
     * @tc.desc Verify single-element array index 1 out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 1;
      try {
        Float32Array.of(10.0).with(1, value);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0130
     * @tc.name testFloat32ArrayWithONE013
     * @tc.desc Verify value is Float32.MAX the largest positive finite value, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 3.4028234663852886e+38;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0140
     * @tc.name testFloat32ArrayWithONE014
     * @tc.desc Verify value is -Float32.MAX the smallest finite negative value, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = -3.4028234663852886e+38;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0150
     * @tc.name testFloat32ArrayWithONE015
     * @tc.desc Verify value is Float32.MIN_NORMAL the smallest positive normalized number, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 1.1754943508222875e-38;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0160
     * @tc.name testFloat32ArrayWithONE016
     * @tc.desc Verify value is Float32.MIN_VALUE the smallest positive subnormal number, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 1.401298464324817e-45;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0170
     * @tc.name testFloat32ArrayWithONE017
     * @tc.desc Verify value is NaN, read back as NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = NaN;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0180
     * @tc.name testFloat32ArrayWithONE018
     * @tc.desc Verify value is +Infinity, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = Infinity;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0190
     * @tc.name testFloat32ArrayWithONE019
     * @tc.desc Verify value is -Infinity, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = -Infinity;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0200
     * @tc.name testFloat32ArrayWithONE020
     * @tc.desc Verify value is +0.0, read back as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 0.0;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0210
     * @tc.name testFloat32ArrayWithONE021
     * @tc.desc Verify value is -0.0, read back as 0 with a negative sign bit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = -0.0;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(0);
      expect(1.0 / replaced.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0220
     * @tc.name testFloat32ArrayWithONE022
     * @tc.desc Verify value scientific notation 1.0e3 equals 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 1.0e3;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0230
     * @tc.name testFloat32ArrayWithONE023
     * @tc.desc Verify value hexadecimal float 9.0 equals 9.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 9.0;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0240
     * @tc.name testFloat32ArrayWithONE024
     * @tc.desc Verify value is integer 0, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 0;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0250
     * @tc.name testFloat32ArrayWithONE025
     * @tc.desc Verify value is -1, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = -1;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0260
     * @tc.name testFloat32ArrayWithONE026
     * @tc.desc Verify value is 0.5, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 0.5;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0270
     * @tc.name testFloat32ArrayWithONE027
     * @tc.desc Verify value is -0.5, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = -0.5;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0280
     * @tc.name testFloat32ArrayWithONE028
     * @tc.desc Verify value is 123.0, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 123.0;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0290
     * @tc.name testFloat32ArrayWithONE029
     * @tc.desc Verify value is -256.0, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = -256.0;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0300
     * @tc.name testFloat32ArrayWithONE030
     * @tc.desc Verify value is 2^24 = 16777216 an exactly representable integer, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 16777216;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0310
     * @tc.name testFloat32ArrayWithONE031
     * @tc.desc Verify value is 2.0, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 2.0;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0320
     * @tc.name testFloat32ArrayWithONE032
     * @tc.desc Verify value is -2.0, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = -2.0;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0330
     * @tc.name testFloat32ArrayWithONE033
     * @tc.desc Verify value is 1024.0, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 1024.0;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0340
     * @tc.name testFloat32ArrayWithONE034
     * @tc.desc Verify value is 0.25, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 0.25;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0350
     * @tc.name testFloat32ArrayWithONE035
     * @tc.desc Verify value is -0.125, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = -0.125;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0360
     * @tc.name testFloat32ArrayWithONE036
     * @tc.desc Verify value is 2^16 = 65536.0, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 65536.0;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0370
     * @tc.name testFloat32ArrayWithONE037
     * @tc.desc Verify value is -65536.0, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = -65536.0;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0380
     * @tc.name testFloat32ArrayWithONE038
     * @tc.desc Verify value is 1.0, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 1.0;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0390
     * @tc.name testFloat32ArrayWithONE039
     * @tc.desc Verify value is -1.0, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = -1.0;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0400
     * @tc.name testFloat32ArrayWithONE040
     * @tc.desc Verify value is 0.1 (float32 precision representation), round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 0.1;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(Math.abs(replaced.$_get(0) - value) < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0410
     * @tc.name testFloat32ArrayWithONE041
     * @tc.desc Verify value is 0.2 (float32 precision representation), round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 0.2;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(Math.abs(replaced.$_get(0) - value) < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0420
     * @tc.name testFloat32ArrayWithONE042
     * @tc.desc Verify value is 0.3 (float32 precision representation), round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 0.3;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(Math.abs(replaced.$_get(0) - value) < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0430
     * @tc.name testFloat32ArrayWithONE043
     * @tc.desc Verify value is 1.1 (float32 precision representation), round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 1.1;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(Math.abs(replaced.$_get(0) - value) < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0440
     * @tc.name testFloat32ArrayWithONE044
     * @tc.desc Verify value is 1.0000001 (float32 precision representation), round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 1.0000001;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(Math.abs(replaced.$_get(0) - value) < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0450
     * @tc.name testFloat32ArrayWithONE045
     * @tc.desc Verify value is -2^31 = -2147483648 an exactly representable integer, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = -2147483648;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0460
     * @tc.name testFloat32ArrayWithONE046
     * @tc.desc Verify value is 123.456 a floating-point value, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 123.456;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(Math.abs(replaced.$_get(0) - value) < 1e-3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0470
     * @tc.name testFloat32ArrayWithONE047
     * @tc.desc Verify value is -999.999 a floating-point value, round-trip consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = -999.999;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(Math.abs(replaced.$_get(0) - value) < 1e-3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0480
     * @tc.name testFloat32ArrayWithONE048
     * @tc.desc Verify value 16777217 (2^24+1) truncates to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 16777217;
      const replaced = Float32Array.of(0.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0490
     * @tc.name testFloat32ArrayWithONE049
     * @tc.desc Verify value 16777219 (2^24+3) truncates to 16777220
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 16777219;
      const replaced = Float32Array.of(0.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(16777220);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0500
     * @tc.name testFloat32ArrayWithONE050
     * @tc.desc Verify value MAX * 2 overflows to +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = 3.4028234663852886e+38;
      const value = max * 2;
      const replaced = Float32Array.of(0.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0510
     * @tc.name testFloat32ArrayWithONE051
     * @tc.desc Verify value -MAX * 2 overflows to -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = 3.4028234663852886e+38;
      const value = -max * 2;
      const replaced = Float32Array.of(0.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0520
     * @tc.name testFloat32ArrayWithONE052
     * @tc.desc Verify value smallest subnormal number / 2 underflows to +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tiny = 1.401298464324817e-45;
      const value = tiny / 2;
      const replaced = Float32Array.of(0.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0530
     * @tc.name testFloat32ArrayWithONE053
     * @tc.desc Verify value 2147483647 (2^31-1) truncates to 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 2147483647;
      const replaced = Float32Array.of(0.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0540
     * @tc.name testFloat32ArrayWithONE054
     * @tc.desc Verify value MAX squared overflows to +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = 3.4028234663852886e+38;
      const value = max * max;
      const replaced = Float32Array.of(0.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0550
     * @tc.name testFloat32ArrayWithONE055
     * @tc.desc Verify value 2^53+1 truncates to 2^53
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 9007199254740993;
      const replaced = Float32Array.of(0.0).with(0, value);
      expect(replaced.$_get(0)).assertEqual(9007199254740992);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0560
     * @tc.name testFloat32ArrayWithONE056
     * @tc.desc Verify return value BYTES_PER_ELEMENT is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 5;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0570
     * @tc.name testFloat32ArrayWithONE057
     * @tc.desc Verify returned array byteLength equals the original array byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 5;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0580
     * @tc.name testFloat32ArrayWithONE058
     * @tc.desc Verify at reads the replaced element as the new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 99;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.at(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0590
     * @tc.name testFloat32ArrayWithONE059
     * @tc.desc Verify elements before the replaced index remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 99;
      const replaced = Float32Array.of(1.0, 2.0, 3.0, 4.0).with(2, value);
      expect(replaced.$_get(0)).assertEqual(1);
      expect(replaced.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0600
     * @tc.name testFloat32ArrayWithONE060
     * @tc.desc Verify elements after the replaced index remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 99;
      const replaced = Float32Array.of(1.0, 2.0, 3.0, 4.0).with(1, value);
      expect(replaced.$_get(2)).assertEqual(3);
      expect(replaced.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0610
     * @tc.name testFloat32ArrayWithONE061
     * @tc.desc Verify the element at the replaced index of the original array is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(10.0, 20.0);
      const replaced = base.with(0, 99);
      expect(replaced.$_get(0)).assertEqual(99);
      expect(base.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0620
     * @tc.name testFloat32ArrayWithONE062
     * @tc.desc Verify elements at other indices of the original array are unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(10.0, 20.0);
      const replaced = base.with(0, 99);
      expect(replaced.$_get(0)).assertEqual(99);
      expect(base.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0630
     * @tc.name testFloat32ArrayWithONE063
     * @tc.desc Verify the returned array can be traversed with an indexed loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 9;
      const replaced = Float32Array.of(0x10, 0b1010, -1.0).with(0, value);
      let sum = 0;
      for (let __f32i = 0; __f32i < replaced.length; __f32i++) {
        const v = replaced.$_get(__f32i);
        sum += v;
      }
      expect(sum).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0640
     * @tc.name testFloat32ArrayWithONE064
     * @tc.desc Verify the returned array values() iterator first value is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 9;
      const replaced = Float32Array.of(1.0, 2.0).with(0, value);
      const it = replaced.values();
      expect(it.next().value).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0650
     * @tc.name testFloat32ArrayWithONE065
     * @tc.desc Verify the returned array join concatenated string is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 9;
      const replaced = Float32Array.of(0x10, 0b1010, -1.0).with(0, value);
      expect(replaced.join(',')).assertEqual('9,10,-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0660
     * @tc.name testFloat32ArrayWithONE066
     * @tc.desc Verify the returned array lastIndexOf locates the new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 99;
      const replaced = Float32Array.of(99.0, 2.0, 99.0).with(1, value);
      expect(replaced.lastIndexOf(99)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0670
     * @tc.name testFloat32ArrayWithONE067
     * @tc.desc Verify the returned array includes determines the new value exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 99;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.includes(99)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0680
     * @tc.name testFloat32ArrayWithONE068
     * @tc.desc Verify the returned array find finds the new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 99;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.find(x => x > 50)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0690
     * @tc.name testFloat32ArrayWithONE069
     * @tc.desc Verify the returned array findIndex locates the new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 99;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.findIndex(x => x > 50)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0700
     * @tc.name testFloat32ArrayWithONE070
     * @tc.desc Verify the returned array at(-1) reads the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 99;
      const replaced = Float32Array.of(0x10, 0b1010, -1.0).with(2, value);
      expect(replaced.at(-1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0710
     * @tc.name testFloat32ArrayWithONE071
     * @tc.desc Verify the returned array toString string is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 9;
      const replaced = Float32Array.of(0x10, 0b1010, -1.0).with(0, value);
      expect(replaced.toString()).assertEqual('9,10,-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0720
     * @tc.name testFloat32ArrayWithONE072
     * @tc.desc Verify the returned array byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 5;
      const replaced = Float32Array.of(10.0, 20.0).with(0, value);
      expect(replaced.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0730
     * @tc.name testFloat32ArrayWithONE073
     * @tc.desc Verify the returned array has an independent buffer, writing does not affect the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(10.0, 20.0);
      const replaced = base.with(0, 5);
      replaced.$_set(0, 999);
      expect(base.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0740
     * @tc.name testFloat32ArrayWithONE074
     * @tc.desc Verify chained with calls accumulate two replacements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Float32Array.of(0x10, 0b1010, -1.0).with(0, 9).with(1, 8);
      expect(r.$_get(0)).assertEqual(9);
      expect(r.$_get(1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0750
     * @tc.name testFloat32ArrayWithONE075
     * @tc.desc Verify the returned array can be summed by reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = 9;
      const replaced = Float32Array.of(0x10, 0b1010, -1.0).with(1, value);
      const s = replaced.reduce((a, b) => (a + b).toInt(), 0);
      expect(s).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0760
     * @tc.name testFloat32ArrayWithONE076
     * @tc.desc Verify after with call the original array length is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      const r = base.with(1, 99);
      expect(r.$_get(1)).assertEqual(99);
      expect(base.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0770
     * @tc.name testFloat32ArrayWithONE077
     * @tc.desc Verify after with call the original array byteLength is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      const r = base.with(1, 99);
      expect(r.byteLength).assertEqual(12);
      expect(base.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0780
     * @tc.name testFloat32ArrayWithONE078
     * @tc.desc Verify after with replaces the middle index, the middle element of the original array is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(10.0, 20.0, 30.0);
      const r = base.with(1, 99);
      expect(r.$_get(1)).assertEqual(99);
      expect(base.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0790
     * @tc.name testFloat32ArrayWithONE079
     * @tc.desc Verify after with replaces the last index, the last element of the original array is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(10.0, 20.0, 30.0);
      const r = base.with(2, 99);
      expect(r.$_get(2)).assertEqual(99);
      expect(base.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0800
     * @tc.name testFloat32ArrayWithONE080
     * @tc.desc Verify after multiple consecutive with calls the original array is completely unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      base.with(0, 9).with(1, 8).with(2, 7);
      expect(base.$_get(0)).assertEqual(16);
      expect(base.$_get(1)).assertEqual(10);
      expect(base.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0810
     * @tc.name testFloat32ArrayWithONE081
     * @tc.desc Verify after with, $_set write to the returned array does not affect the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(10.0, 20.0);
      const r = base.with(0, 5);
      r.$_set(1, 99);
      expect(r.$_get(1)).assertEqual(99);
      expect(base.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0820
     * @tc.name testFloat32ArrayWithONE082
     * @tc.desc Verify after with, fill on the returned array does not affect the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(10.0, 20.0);
      const r = base.with(0, 5);
      r.fill(7);
      expect(r.$_get(0)).assertEqual(7);
      expect(base.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0830
     * @tc.name testFloat32ArrayWithONE083
     * @tc.desc Verify after with, copyWithin on the returned array copies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Float32Array.of(1.0, 2.0, 3.0, 4.0).with(0, 9);
      r.copyWithin(0, 2);
      expect(r.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0840
     * @tc.name testFloat32ArrayWithONE084
     * @tc.desc Verify after with, reverse on the returned array reverses
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Float32Array.of(0x10, 0b1010, -1.0).with(0, 9);
      r.reverse();
      expect(r.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0850
     * @tc.name testFloat32ArrayWithONE085
     * @tc.desc Verify after with, sort on the returned array sorts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Float32Array.of(3.0, 1.0, 2.0).with(0, 9);
      r.sort();
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0860
     * @tc.name testFloat32ArrayWithONE086
     * @tc.desc Verify after with, map on the returned array maps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Float32Array.of(10.0, 20.0).with(0, 5);
      const m = r.map(x => x * 2);
      expect(m.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0870
     * @tc.name testFloat32ArrayWithONE087
     * @tc.desc Verify after with, filter on the returned array filters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Float32Array.of(1.0, 2.0, 3.0, 4.0).with(0, 9);
      const f = r.filter(x => x > 3);
      expect(f.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0880
     * @tc.name testFloat32ArrayWithONE088
     * @tc.desc Verify after with, reduce on the returned array sums
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Float32Array.of(0x10, 0b1010, -1.0).with(0, 9);
      const s = r.reduce((a, b) => (a + b).toInt(), 0);
      expect(s).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0890
     * @tc.name testFloat32ArrayWithONE089
     * @tc.desc Verify after with, slice on the returned array slices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Float32Array.of(1.0, 2.0, 3.0, 4.0).with(0, 9);
      const s = r.slice(1, 3);
      expect(s.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0900
     * @tc.name testFloat32ArrayWithONE090
     * @tc.desc Verify after with, subarray on the returned array takes a view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Float32Array.of(1.0, 2.0, 3.0, 4.0).with(0, 9);
      const s = r.subarray(1, 3);
      expect(s.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0910
     * @tc.name testFloat32ArrayWithONE091
     * @tc.desc Verify after with, indexOf on the returned array locates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Float32Array.of(10.0, 20.0).with(0, 99);
      expect(r.indexOf(99)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0920
     * @tc.name testFloat32ArrayWithONE092
     * @tc.desc Verify after with, at on the returned array reads the specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = Float32Array.of(5.0, 6.0, 7.0, 8.0, 9.0).with(3, 99);
      expect(r.at(3)).assertEqual(99);
      expect(r.at(-1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0930
     * @tc.name testFloat32ArrayWithONE093
     * @tc.desc Verify calling with on the slice result, the slice source is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = Float32Array.of(1.0, 2.0, 3.0, 4.0).slice(1, 3);
      const r = s.with(0, 99);
      expect(r.$_get(0)).assertEqual(99);
      expect(s.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0940
     * @tc.name testFloat32ArrayWithONE094
     * @tc.desc Verify calling with on the subarray view, the view source is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = Float32Array.of(1.0, 2.0, 3.0, 4.0).subarray(1, 3);
      const r = s.with(0, 99);
      expect(r.$_get(0)).assertEqual(99);
      expect(s.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0950
     * @tc.name testFloat32ArrayWithONE095
     * @tc.desc Verify with(-1, value) throws RangeError for negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const replacementValue: number = 99.0;
      const source = Float32Array.of(1.0, 2.0, 3.0);
      try {
        source.with(-1, replacementValue);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0960
     * @tc.name testFloat32ArrayWithONE096
     * @tc.desc Verify with result remains independent after the source is modified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sourceFirst: number = 1.0;
      const replacementValue: number = 50.0;
      const changedSourceValue: number = 80.0;
      const source = Float32Array.of(sourceFirst, 2.0);
      const result = source.with(0, replacementValue);
      source.$_set(0, changedSourceValue);
      expect(result.$_get(0)).assertEqual(replacementValue);
      expect(source.$_get(0)).assertEqual(changedSourceValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0970
     * @tc.name testFloat32ArrayWithONE097
     * @tc.desc Verify with on an offset view returns a compact array with byteOffset zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      const view = parent.subarray(1, 3);
      const replacementValue: number = 88.0;
      const result = view.with(1, replacementValue);
      expect(result.byteOffset).assertEqual(0);
      expect(result.$_get(0)).assertEqual(20.0);
      expect(result.$_get(1)).assertEqual(replacementValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0980
     * @tc.name testFloat32ArrayWithONE098
     * @tc.desc Verify with can replace an element with NaN while leaving the source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sourceValue: number = 5.0;
      const source = Float32Array.of(sourceValue, 6.0);
      const result = source.with(0, NaN);
      expect(result.$_get(0)).assertNaN();
      expect(source.$_get(0)).assertEqual(sourceValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_0990
     * @tc.name testFloat32ArrayWithONE099
     * @tc.desc Verify with(-length, value) throws RangeError for negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const replacementValue: number = 70.0;
      const source = Float32Array.of(7.0, 8.0, 9.0);
      const targetIndex: int = -source.length;
      try {
        source.with(targetIndex, replacementValue);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_WITHONE_1000
     * @tc.name testFloat32ArrayWithONE100
     * @tc.desc Verify negative index RangeError leaves all source elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayWithONE100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Float32Array.of(1.0, 2.0, 3.0);
      try {
        source.with(-1, 9.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(source.$_get(0)).assertEqual(1.0);
      expect(source.$_get(1)).assertEqual(2.0);
      expect(source.$_get(2)).assertEqual(3.0);
    });

  });
}
