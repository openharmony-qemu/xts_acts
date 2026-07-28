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

export default function Float32ArraySet1Test(): void {
  describe('Float32ArraySet1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0010
     * @tc.name testFloat32ArraySetOne001
     * @tc.desc Verify set(0, 7) stores 7 at index 0 in Float32Array(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(2);
      const value = 7;
      arr.set(0, value);
      const element001 = arr.$_get(0);
      expect(element001).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0020
     * @tc.name testFloat32ArraySetOne002
     * @tc.desc Verify set(1, 9) stores 9 at index 1 in [0.0,0.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0, 0.0]);
      const value = 9;
      arr.set(1, value);
      const element002 = arr.$_get(1);
      expect(element002).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0030
     * @tc.name testFloat32ArraySetOne003
     * @tc.desc Verify set(0,11) and set(2,22) store at indices 0 and 2 in Float32Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const a = 11;
      const b = 22;
      arr.set(0, a);
      arr.set(2, b);
      const element003 = arr.$_get(0);
      expect(element003).assertEqual(11);
      const element003Part2 = arr.$_get(2);
      expect(element003Part2).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0040
     * @tc.name testFloat32ArraySetOne004
     * @tc.desc Verify insertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0, 0.0, 0.0, 0.0, 0.0]);
      const value = 50;
      arr.set(0, value);
      const element004 = arr.$_get(0);
      expect(element004).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0050
     * @tc.name testFloat32ArraySetOne005
     * @tc.desc Verify insertPos=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0, 0.0, 0.0, 0.0, 0.0]);
      const value = 30;
      arr.set(2, value);
      const element005 = arr.$_get(2);
      expect(element005).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0060
     * @tc.name testFloat32ArraySetOne006
     * @tc.desc Verify insertPos=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0, 0.0, 0.0, 0.0, 0.0]);
      const value = 99;
      arr.set(4, value);
      const element006 = arr.$_get(4);
      expect(element006).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0070
     * @tc.name testFloat32ArraySetOne007
     * @tc.desc Verify insertPos=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0, 0.0, 0.0]);
      const value = 8;
      arr.set(1, value);
      const element007 = arr.$_get(1);
      expect(element007).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0080
     * @tc.name testFloat32ArraySetOne008
     * @tc.desc Verify insertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = 1;
      arr.set(0, value);
      const element008 = arr.$_get(0);
      expect(element008).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0090
     * @tc.name testFloat32ArraySetOne009
     * @tc.desc Verify insertPos=lengthRangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(2);
      const value = 5;
      try {
        arr.set(2, value);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0100
     * @tc.name testFloat32ArraySetOne010
     * @tc.desc Verify insertPos=length+1RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(2);
      const value = 5;
      try {
        arr.set(3, value);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0110
     * @tc.name testFloat32ArraySetOne011
     * @tc.desc Verify insertPos=-1RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(2);
      const value = 5;
      try {
        arr.set(-1, value);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0120
     * @tc.name testFloat32ArraySetOne012
     * @tc.desc Verify insertPos=-lengthRangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const value = 5;
      try {
        arr.set(-3, value);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0130
     * @tc.name testFloat32ArraySetOne013
     * @tc.desc Verify insertPos=-length-1RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const value = 5;
      try {
        arr.set(-4, value);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0140
     * @tc.name testFloat32ArraySetOne014
     * @tc.desc Verify insertPos=2147483647RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(2);
      const value = 5;
      try {
        arr.set(2147483647, value);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0150
     * @tc.name testFloat32ArraySetOne015
     * @tc.desc Verify insertPos=-2147483648RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(2);
      const value = 5;
      try {
        arr.set(-2147483648, value);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0160
     * @tc.name testFloat32ArraySetOne016
     * @tc.desc Verify val=+00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = 0;
      arr.set(0, value);
      const element016 = arr.$_get(0);
      expect(element016).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0170
     * @tc.name testFloat32ArraySetOne017
     * @tc.desc Verify val=-01/x-Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = -0.0;
      arr.set(0, value);
      const element017 = 1 / arr.$_get(0);
      expect(element017).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0180
     * @tc.name testFloat32ArraySetOne018
     * @tc.desc Verify val=1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = 1.0;
      arr.set(0, value);
      const element018 = arr.$_get(0);
      expect(element018).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0190
     * @tc.name testFloat32ArraySetOne019
     * @tc.desc Verify val=-1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = -1.0;
      arr.set(0, value);
      const element019 = arr.$_get(0);
      expect(element019).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0200
     * @tc.name testFloat32ArraySetOne020
     * @tc.desc Verify val=0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = 0.5;
      arr.set(0, value);
      const element020 = arr.$_get(0);
      expect(element020).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0210
     * @tc.name testFloat32ArraySetOne021
     * @tc.desc Verify val=100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = 100;
      arr.set(0, value);
      const element021 = arr.$_get(0);
      expect(element021).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0220
     * @tc.name testFloat32ArraySetOne022
     * @tc.desc Verify val=Float32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = 3.4028234663852886e+38;
      arr.set(0, value);
      const element022 = arr.$_get(0);
      expect(element022).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0230
     * @tc.name testFloat32ArraySetOne023
     * @tc.desc Verify val=-Float32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = -3.4028234663852886e+38;
      arr.set(0, value);
      const element023 = arr.$_get(0);
      expect(element023).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0240
     * @tc.name testFloat32ArraySetOne024
     * @tc.desc Verify val=Float32.MIN_NORMAL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = 1.1754943508222875e-38;
      arr.set(0, value);
      const element024 = arr.$_get(0);
      expect(element024).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0250
     * @tc.name testFloat32ArraySetOne025
     * @tc.desc Verify val=Float32.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = 1.401298464324817e-45;
      arr.set(0, value);
      const element025 = arr.$_get(0);
      expect(element025).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0260
     * @tc.name testFloat32ArraySetOne026
     * @tc.desc Verify val=NaNassertNaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = Number.NaN;
      arr.set(0, value);
      const element026 = arr.$_get(0);
      expect(element026).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0270
     * @tc.name testFloat32ArraySetOne027
     * @tc.desc Verify val=+InfinityInfinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = Number.POSITIVE_INFINITY;
      arr.set(0, value);
      const element027 = arr.$_get(0);
      expect(element027).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0280
     * @tc.name testFloat32ArraySetOne028
     * @tc.desc Verify val=-Infinity-Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = -Number.POSITIVE_INFINITY;
      arr.set(0, value);
      const element028 = arr.$_get(0);
      expect(element028).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0290
     * @tc.name testFloat32ArraySetOne029
     * @tc.desc Verify val=16777216(2^24)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = 16777216;
      arr.set(0, value);
      const element029 = arr.$_get(0);
      expect(element029).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0300
     * @tc.name testFloat32ArraySetOne030
     * @tc.desc Verify val=16777215
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = 16777215;
      arr.set(0, value);
      const element030 = arr.$_get(0);
      expect(element030).assertEqual(16777215);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0310
     * @tc.name testFloat32ArraySetOne031
     * @tc.desc Verify val=-2147483648(int)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = -2147483648;
      arr.set(0, value);
      const element031 = arr.$_get(0);
      expect(element031).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0320
     * @tc.name testFloat32ArraySetOne032
     * @tc.desc Verify val=9.0(=9.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = 9.0;
      arr.set(0, value);
      const element033 = arr.$_get(0);
      expect(element033).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0330
     * @tc.name testFloat32ArraySetOne033
     * @tc.desc Verify val=1e3(=1000.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = 1e3;
      arr.set(0, value);
      const element034 = arr.$_get(0);
      expect(element034).assertEqual(1000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0340
     * @tc.name testFloat32ArraySetOne034
     * @tc.desc Verify val=16777217(2^24+1)16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = 16777217;
      arr.set(0, value);
      const element035 = arr.$_get(0);
      expect(element035).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0350
     * @tc.name testFloat32ArraySetOne035
     * @tc.desc Verify val=2147483647(int)2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = 2147483647;
      arr.set(0, value);
      const element036 = arr.$_get(0);
      expect(element036).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0360
     * @tc.name testFloat32ArraySetOne036
     * @tc.desc Verify val=1.0e40+Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = 1.0e40;
      arr.set(0, value);
      const element037 = arr.$_get(0);
      expect(element037).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0370
     * @tc.name testFloat32ArraySetOne037
     * @tc.desc Verify val=-1.0e40-Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = -1.0e40;
      arr.set(0, value);
      const element038 = arr.$_get(0);
      expect(element038).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0380
     * @tc.name testFloat32ArraySetOne038
     * @tc.desc Verify val=1.0e-46+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = 1.0e-46;
      arr.set(0, value);
      const element039 = 1 / arr.$_get(0);
      expect(element039).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0390
     * @tc.name testFloat32ArraySetOne039
     * @tc.desc Verify val=-1.0e-46-0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = -1.0e-46;
      arr.set(0, value);
      const element040 = 1 / arr.$_get(0);
      expect(element040).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0400
     * @tc.name testFloat32ArraySetOne040
     * @tc.desc Verify val=9007199254740993(2^53+1)9007199254740992
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = 9007199254740993;
      arr.set(0, value);
      const element041 = arr.$_get(0);
      expect(element041).assertEqual(9007199254740992);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0410
     * @tc.name testFloat32ArraySetOne041
     * @tc.desc Verify val=0.1 float32float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const value = 0.1;
      arr.set(0, value);
      const element042 = arr.$_get(0);
      expect(element042).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0420
     * @tc.name testFloat32ArraySetOne042
     * @tc.desc Verify setundefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0, 0.0]);
      const value = 5;
      const observedValue043 = arr.set(0, value);
      expect(observedValue043).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0430
     * @tc.name testFloat32ArraySetOne043
     * @tc.desc Verify set(0,99) does not modify other element at index 1 in [10.0,20.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0]);
      const value = 99;
      arr.set(0, value);
      const element044 = arr.$_get(1);
      expect(element044).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0440
     * @tc.name testFloat32ArraySetOne044
     * @tc.desc Verify set(0,99) stores 99 at index 0 in [10.0,20.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0]);
      const value = 99;
      arr.set(0, value);
      const element045 = arr.$_get(0);
      expect(element045).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0450
     * @tc.name testFloat32ArraySetOne045
     * @tc.desc Verify arityset(source, 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const source: FixedArray<number> = [1, 2];
      arr.set(source, 0);
      const element046 = arr.$_get(0);
      expect(element046).assertEqual(1);
      const element046Part2 = arr.$_get(1);
      expect(element046Part2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0460
     * @tc.name testFloat32ArraySetOne046
     * @tc.desc Verify arityset(source, 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const source: FixedArray<number> = [1, 2];
      arr.set(source, 1);
      const element047 = arr.$_get(1);
      expect(element047).assertEqual(1);
      const element047Part2 = arr.$_get(2);
      expect(element047Part2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0470
     * @tc.name testFloat32ArraySetOne047
     * @tc.desc Verify insertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([5.0, 6.0, 7.0]);
      const source: FixedArray<number> = [];
      arr.set(source, 0);
      const element048 = arr.$_get(0);
      expect(element048).assertEqual(5.0);
      const element048Part2 = arr.$_get(2);
      expect(element048Part2).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0480
     * @tc.name testFloat32ArraySetOne048
     * @tc.desc Verify [1]insertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const source: FixedArray<number> = [1];
      arr.set(source, 0);
      const element049 = arr.$_get(0);
      expect(element049).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0490
     * @tc.name testFloat32ArraySetOne049
     * @tc.desc Verify [10,20]insertPos=00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const source: FixedArray<number> = [10, 20];
      arr.set(source, 0);
      const element050 = arr.$_get(0);
      expect(element050).assertEqual(10);
      const element050Part2 = arr.$_get(1);
      expect(element050Part2).assertEqual(20);
      const element050Part3 = arr.$_get(2);
      expect(element050Part3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0500
     * @tc.name testFloat32ArraySetOne050
     * @tc.desc Verify [7,8]insertPos=10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const source: FixedArray<number> = [7, 8];
      arr.set(source, 1);
      const element051 = arr.$_get(0);
      expect(element051).assertEqual(0);
      const element051Part2 = arr.$_get(1);
      expect(element051Part2).assertEqual(7);
      const element051Part3 = arr.$_get(2);
      expect(element051Part3).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0510
     * @tc.name testFloat32ArraySetOne051
     * @tc.desc Verify [1,2,3]insertPos=0length-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const source: FixedArray<number> = [1, 2, 3];
      arr.set(source, 0);
      const element052 = arr.$_get(0);
      expect(element052).assertEqual(1);
      const element052Part2 = arr.$_get(2);
      expect(element052Part2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0520
     * @tc.name testFloat32ArraySetOne052
     * @tc.desc Verify [-1,-2]insertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const source: FixedArray<number> = [-1, -2];
      arr.set(source, 0);
      const element053 = arr.$_get(0);
      expect(element053).assertEqual(-1);
      const element053Part2 = arr.$_get(1);
      expect(element053Part2).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0530
     * @tc.name testFloat32ArraySetOne053
     * @tc.desc Verify MAXinsertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const source: FixedArray<number> = [3.4028234663852886e+38];
      arr.set(source, 0);
      const element054 = arr.$_get(0);
      expect(element054).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0540
     * @tc.name testFloat32ArraySetOne054
     * @tc.desc Verify NaNinsertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const source: FixedArray<number> = [Number.NaN];
      arr.set(source, 0);
      const element055 = arr.$_get(0);
      expect(element055).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0550
     * @tc.name testFloat32ArraySetOne055
     * @tc.desc Verify InfinityinsertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const source: FixedArray<number> = [Number.POSITIVE_INFINITY];
      arr.set(source, 0);
      const element056 = arr.$_get(0);
      expect(element056).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0560
     * @tc.name testFloat32ArraySetOne056
     * @tc.desc Verify -InfinityinsertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const source: FixedArray<number> = [-Number.POSITIVE_INFINITY];
      arr.set(source, 0);
      const element057 = arr.$_get(0);
      expect(element057).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0570
     * @tc.name testFloat32ArraySetOne057
     * @tc.desc Verify -0insertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const source: FixedArray<number> = [-0.0];
      arr.set(source, 0);
      const element058 = 1 / arr.$_get(0);
      expect(element058).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0580
     * @tc.name testFloat32ArraySetOne058
     * @tc.desc Verify 0.1insertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const source: FixedArray<number> = [0.1];
      arr.set(source, 0);
      const element059 = arr.$_get(0);
      expect(element059).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0590
     * @tc.name testFloat32ArraySetOne059
     * @tc.desc Verify [5,5,5]insertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const source: FixedArray<number> = [5, 5, 5];
      arr.set(source, 0);
      const element060 = arr.$_get(0);
      expect(element060).assertEqual(5);
      const element060Part2 = arr.$_get(2);
      expect(element060Part2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0600
     * @tc.name testFloat32ArraySetOne060
     * @tc.desc Verify [1,2,3,4]insertPos=0length-4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(4);
      const source: FixedArray<number> = [1, 2, 3, 4];
      arr.set(source, 0);
      const element061 = arr.$_get(0);
      expect(element061).assertEqual(1);
      const element061Part2 = arr.$_get(3);
      expect(element061Part2).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0610
     * @tc.name testFloat32ArraySetOne061
     * @tc.desc Verify (50)length-50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(50);
      const source: FixedArray<number> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50];
      arr.set(source, 0);
      const element062 = arr.$_get(0);
      expect(element062).assertEqual(1);
      const element062Part2 = arr.$_get(49);
      expect(element062Part2).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0620
     * @tc.name testFloat32ArraySetOne062
     * @tc.desc Verify insertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([9.0, 9.0, 9.0]);
      const source: FixedArray<number> = [1, 2];
      arr.set(source, 0);
      const element063 = arr.$_get(0);
      expect(element063).assertEqual(1);
      const element063Part2 = arr.$_get(1);
      expect(element063Part2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0630
     * @tc.name testFloat32ArraySetOne063
     * @tc.desc Verify insertPos=1length-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([9.0, 9.0, 9.0]);
      const source: FixedArray<number> = [1, 2];
      arr.set(source, 1);
      const element064 = arr.$_get(1);
      expect(element064).assertEqual(1);
      const element064Part2 = arr.$_get(2);
      expect(element064Part2).assertEqual(2);
      const element064Part3 = arr.$_get(0);
      expect(element064Part3).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0640
     * @tc.name testFloat32ArraySetOne064
     * @tc.desc Verify insertPos=2length-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([9.0, 9.0, 9.0]);
      const source: FixedArray<number> = [7];
      arr.set(source, 2);
      const element065 = arr.$_get(2);
      expect(element065).assertEqual(7);
      const element065Part2 = arr.$_get(0);
      expect(element065Part2).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0650
     * @tc.name testFloat32ArraySetOne065
     * @tc.desc Verify insertPos=2length-4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([9.0, 9.0, 9.0, 9.0]);
      const source: FixedArray<number> = [1, 2];
      arr.set(source, 2);
      const element066 = arr.$_get(2);
      expect(element066).assertEqual(1);
      const element066Part2 = arr.$_get(3);
      expect(element066Part2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0660
     * @tc.name testFloat32ArraySetOne066
     * @tc.desc Verify insertPos=lengthRangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const source: FixedArray<number> = [1];
      try {
        arr.set(source, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0670
     * @tc.name testFloat32ArraySetOne067
     * @tc.desc Verify insertPos=length+1RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const source: FixedArray<number> = [1];
      try {
        arr.set(source, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0680
     * @tc.name testFloat32ArraySetOne068
     * @tc.desc Verify insertPos=-1RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const source: FixedArray<number> = [1];
      try {
        arr.set(source, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0690
     * @tc.name testFloat32ArraySetOne069
     * @tc.desc Verify insertPos=-lengthRangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const source: FixedArray<number> = [1];
      try {
        arr.set(source, -3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0700
     * @tc.name testFloat32ArraySetOne070
     * @tc.desc Verify insertPos=2147483647 throws IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const source: FixedArray<number> = [1];
      try {
        arr.set(source, 2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0710
     * @tc.name testFloat32ArraySetOne071
     * @tc.desc Verify 4>30RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const source: FixedArray<number> = [1, 2, 3, 4];
      try {
        arr.set(source, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0720
     * @tc.name testFloat32ArraySetOne072
     * @tc.desc Verify 3 insertPos=1length-3RangeError(1+3>3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const source: FixedArray<number> = [1, 2, 3];
      try {
        arr.set(source, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0730
     * @tc.name testFloat32ArraySetOne073
     * @tc.desc Verify 2 insertPos=2length-3RangeError(2+2>3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const source: FixedArray<number> = [1, 2];
      try {
        arr.set(source, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0740
     * @tc.name testFloat32ArraySetOne074
     * @tc.desc Verify =+10RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(2);
      const source: FixedArray<number> = [1, 2, 3];
      try {
        arr.set(source, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0750
     * @tc.name testFloat32ArraySetOne075
     * @tc.desc Verify 1677721716777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const source: FixedArray<number> = [16777217];
      arr.set(source, 0);
      const element076 = arr.$_get(0);
      expect(element076).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0760
     * @tc.name testFloat32ArraySetOne076
     * @tc.desc Verify 1e40Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const source: FixedArray<number> = [1.0e40];
      arr.set(source, 0);
      const element077 = arr.$_get(0);
      expect(element077).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0770
     * @tc.name testFloat32ArraySetOne077
     * @tc.desc Verify 1e-46+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const source: FixedArray<number> = [1.0e-46];
      arr.set(source, 0);
      const element078 = 1 / arr.$_get(0);
      expect(element078).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0780
     * @tc.name testFloat32ArraySetOne078
     * @tc.desc Verify 21474836472147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const source: FixedArray<number> = [2147483647];
      arr.set(source, 0);
      const element079 = arr.$_get(0);
      expect(element079).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0790
     * @tc.name testFloat32ArraySetOne079
     * @tc.desc Verify -MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const source: FixedArray<number> = [-3.4028234663852886e+38];
      arr.set(source, 0);
      const element080 = arr.$_get(0);
      expect(element080).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0800
     * @tc.name testFloat32ArraySetOne080
     * @tc.desc Verify setundefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const source: FixedArray<number> = [1, 2];
      const observedValue081 = arr.set(source, 0);
      expect(observedValue081).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0810
     * @tc.name testFloat32ArraySetOne081
     * @tc.desc Verify set([99,99], 2) does not modify element at index 0 and 1 in [10.0,20.0,30.0,40.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      const source: FixedArray<number> = [99, 99];
      arr.set(source, 2);
      const element082 = arr.$_get(0);
      expect(element082).assertEqual(10.0);
      const element082Part2 = arr.$_get(1);
      expect(element082Part2).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0820
     * @tc.name testFloat32ArraySetOne082
     * @tc.desc Verify set([99,99],1) does not modify element at index 4 in [10.0,20.0,30.0,40.0,50.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const source: FixedArray<number> = [99, 99];
      arr.set(source, 1);
      const element083 = arr.$_get(4);
      expect(element083).assertEqual(50.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0830
     * @tc.name testFloat32ArraySetOne083
     * @tc.desc Verify sequential set(s1,0) and set(s2,3) write to correct positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(5);
      const s1: FixedArray<number> = [1, 2];
      const s2: FixedArray<number> = [8, 9];
      arr.set(s1, 0);
      arr.set(s2, 3);
      const element084 = arr.$_get(0);
      expect(element084).assertEqual(1);
      const element084Part2 = arr.$_get(3);
      expect(element084Part2).assertEqual(8);
      const element084Part3 = arr.$_get(4);
      expect(element084Part3).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0840
     * @tc.name testFloat32ArraySetOne084
     * @tc.desc Verify arityset(sourceFloat32)0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const source: Float32Array = Float32Array.of(1.0, 2.0);
      arr.set(source);
      const element085 = arr.$_get(0);
      expect(element085).assertEqual(1);
      const element085Part2 = arr.$_get(1);
      expect(element085Part2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0850
     * @tc.name testFloat32ArraySetOne085
     * @tc.desc Verify arityset(Float32Array.of)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      arr.set(Float32Array.of(5.0, 6.0, 7.0));
      const element086 = arr.$_get(0);
      expect(element086).assertEqual(5);
      const element086Part2 = arr.$_get(2);
      expect(element086Part2).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0860
     * @tc.name testFloat32ArraySetOne086
     * @tc.desc Verify length0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([5.0, 6.0, 7.0]);
      const source: Float32Array = new Float32Array(0);
      arr.set(source);
      const element087 = arr.$_get(0);
      expect(element087).assertEqual(5.0);
      const element087Part2 = arr.$_get(2);
      expect(element087Part2).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0870
     * @tc.name testFloat32ArraySetOne087
     * @tc.desc Verify set(Float32Array.of(1.0)) stores 1 at index 0 in Float32Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const source: Float32Array = Float32Array.of(1.0);
      arr.set(source);
      const element088 = arr.$_get(0);
      expect(element088).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0880
     * @tc.name testFloat32ArraySetOne088
     * @tc.desc Verify [10,20]0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const source: Float32Array = Float32Array.of(10.0, 20.0);
      arr.set(source);
      const element089 = arr.$_get(0);
      expect(element089).assertEqual(10);
      const element089Part2 = arr.$_get(1);
      expect(element089Part2).assertEqual(20);
      const element089Part3 = arr.$_get(2);
      expect(element089Part3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0890
     * @tc.name testFloat32ArraySetOne089
     * @tc.desc Verify length-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const source: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      arr.set(source);
      const element090 = arr.$_get(0);
      expect(element090).assertEqual(1);
      const element090Part2 = arr.$_get(2);
      expect(element090Part2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0900
     * @tc.name testFloat32ArraySetOne090
     * @tc.desc Verify NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const source: Float32Array = Float32Array.of(Number.NaN);
      arr.set(source);
      const element091 = arr.$_get(0);
      expect(element091).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0910
     * @tc.name testFloat32ArraySetOne091
     * @tc.desc Verify Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const source: Float32Array = Float32Array.of(Number.POSITIVE_INFINITY);
      arr.set(source);
      const element092 = arr.$_get(0);
      expect(element092).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0920
     * @tc.name testFloat32ArraySetOne092
     * @tc.desc Verify -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const source: Float32Array = Float32Array.of(-Number.POSITIVE_INFINITY);
      arr.set(source);
      const element093 = arr.$_get(0);
      expect(element093).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0930
     * @tc.name testFloat32ArraySetOne093
     * @tc.desc Verify -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const source: Float32Array = Float32Array.of(-0.0);
      arr.set(source);
      const element094 = 1 / arr.$_get(0);
      expect(element094).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0940
     * @tc.name testFloat32ArraySetOne094
     * @tc.desc Verify MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const source: Float32Array = Float32Array.of(3.4028234663852886e+38);
      arr.set(source);
      const element095 = arr.$_get(0);
      expect(element095).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0950
     * @tc.name testFloat32ArraySetOne095
     * @tc.desc Verify -MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const source: Float32Array = Float32Array.of(-3.4028234663852886e+38);
      arr.set(source);
      const element096 = arr.$_get(0);
      expect(element096).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0960
     * @tc.name testFloat32ArraySetOne096
     * @tc.desc Verify 0.1float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const source: Float32Array = Float32Array.of(0.1);
      arr.set(source);
      const element097 = arr.$_get(0);
      expect(element097).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0970
     * @tc.name testFloat32ArraySetOne097
     * @tc.desc Verify 16777217
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const source: Float32Array = Float32Array.of(16777217.0);
      arr.set(source);
      const element098 = arr.$_get(0);
      expect(element098).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0980
     * @tc.name testFloat32ArraySetOne098
     * @tc.desc Verify set(Float32Array.of(5.0,5.0,5.0)) stores 5 at indices 0 and 2 in Float32Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const source: Float32Array = Float32Array.of(5.0, 5.0, 5.0);
      arr.set(source);
      const element099 = arr.$_get(0);
      expect(element099).assertEqual(5);
      const element099Part2 = arr.$_get(2);
      expect(element099Part2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_0990
     * @tc.name testFloat32ArraySetOne099
     * @tc.desc Verify 1e40Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const source: Float32Array = new Float32Array([1.0e40]);
      arr.set(source);
      const element100 = arr.$_get(0);
      expect(element100).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_1000
     * @tc.name testFloat32ArraySetOne100
     * @tc.desc Verify 1e-46+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const source: Float32Array = new Float32Array([1.0e-46]);
      arr.set(source);
      const element101 = 1 / arr.$_get(0);
      expect(element101).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_1010
     * @tc.name testFloat32ArraySetOne101
     * @tc.desc Verify 21474836472147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const source: Float32Array = new Float32Array([2147483647]);
      arr.set(source);
      const element102 = arr.$_get(0);
      expect(element102).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_1020
     * @tc.name testFloat32ArraySetOne102
     * @tc.desc Verify MIN_NORMAL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(1);
      const source: Float32Array = new Float32Array([1.1754943508222875e-38]);
      arr.set(source);
      const element103 = arr.$_get(0);
      expect(element103).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_1030
     * @tc.name testFloat32ArraySetOne103
     * @tc.desc Verify set(arr)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      arr.set(arr);
      const element104 = arr.$_get(0);
      expect(element104).assertEqual(1.0);
      const element104Part2 = arr.$_get(2);
      expect(element104Part2).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_1040
     * @tc.name testFloat32ArraySetOne104
     * @tc.desc Verify set(arr)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      arr.set(arr);
      const element105 = arr.$_get(0);
      expect(element105).assertEqual(1.0);
      const element105Part2 = arr.$_get(1);
      expect(element105Part2).assertEqual(2.0);
      const element105Part3 = arr.$_get(2);
      expect(element105Part3).assertEqual(3.0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_1050
     * @tc.name testFloat32ArraySetOne105
     * @tc.desc Verify subarray(2,4)0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view: Float32Array = arr.subarray(2, 4);
      arr.set(view);
      const element106 = arr.$_get(0);
      expect(element106).assertEqual(3.0);
      const element106Part2 = arr.$_get(1);
      expect(element106Part2).assertEqual(4.0);
      const element106Part3 = arr.$_get(2);
      expect(element106Part3).assertEqual(3.0);
      const element106Part4 = arr.$_get(3);
      expect(element106Part4).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_1060
     * @tc.name testFloat32ArraySetOne106
     * @tc.desc Verify subarray(1,3)0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      const view: Float32Array = arr.subarray(1, 3);
      arr.set(view);
      const element107 = arr.$_get(0);
      expect(element107).assertEqual(20.0);
      const element107Part2 = arr.$_get(1);
      expect(element107Part2).assertEqual(30.0);
      const element107Part3 = arr.$_get(2);
      expect(element107Part3).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_1070
     * @tc.name testFloat32ArraySetOne107
     * @tc.desc Verify set writes values into target array and leaves source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(2);
      const source: Float32Array = Float32Array.of(7.0, 8.0);
      arr.set(source);
      const element108 = source.$_get(0);
      expect(element108).assertEqual(7);
      const element108Part2 = source.$_get(1);
      expect(element108Part2).assertEqual(8);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_1080
     * @tc.name testFloat32ArraySetOne108
     * @tc.desc Verify subarraybuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const child: Float32Array = base.subarray(0, 2);
      const target: Float32Array = new Float32Array([9.0, 9.0]);
      target.set(child);
      base.$_set(0, 100.0);
      const element109 = target.$_get(0);
      expect(element109).assertEqual(1.0);
      const element109Part2 = base.$_get(0);
      expect(element109Part2).assertEqual(100.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_1090
     * @tc.name testFloat32ArraySetOne109
     * @tc.desc Verify setundefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const source: Float32Array = Float32Array.of(1.0, 2.0);
      const observedValue110 = arr.set(source);
      expect(observedValue110).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_1100
     * @tc.name testFloat32ArraySetOne110
     * @tc.desc Verify set(Float32Array.of(1.0,2.0)) does not change array length of 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([9.0, 9.0, 9.0]);
      const source: Float32Array = Float32Array.of(1.0, 2.0);
      arr.set(source);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(1)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_1110
     * @tc.name testFloat32ArraySetOne111
     * @tc.desc Verify set(Float32Array.of(99.0)) only modifies index 0, leaves indices 1 and 2 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      const source: Float32Array = Float32Array.of(99.0);
      arr.set(source);
      const element112 = arr.$_get(1);
      expect(element112).assertEqual(20.0);
      const element112Part2 = arr.$_get(2);
      expect(element112Part2).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_1120
     * @tc.name testFloat32ArraySetOne112
     * @tc.desc Verify 4>3RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(3);
      const source: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      try {
        arr.set(source);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_ONE_1130
     * @tc.name testFloat32ArraySetOne113
     * @tc.desc Verify =+1RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetOne113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(2);
      const source: Float32Array = Float32Array.of(1.0, 2.0, 3.0);
      try {
        arr.set(source);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });
