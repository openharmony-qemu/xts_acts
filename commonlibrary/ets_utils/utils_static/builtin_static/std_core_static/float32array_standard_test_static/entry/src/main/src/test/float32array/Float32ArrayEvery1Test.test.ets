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

export default function Float32ArrayEvery1Test(): void {
  describe('Float32ArrayEvery1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_0100
     * @tc.name testFloat32ArrayEveryONE001
     * @tc.desc Verify every accepts only 1 argument predicate, single-argument call with all true returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, 1000000.0);
      const r: boolean = arr.every((e: number) => e > 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_0200
     * @tc.name testFloat32ArrayEveryONE002
     * @tc.desc Verify every single-argument call, returns false on encountering a false element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, -2.0, 3.0);
      const r: boolean = arr.every((e: number) => e > 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_0300
     * @tc.name testFloat32ArrayEveryONE003
     * @tc.desc Verify predicate zero-argument form, empty array calls 0 times and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      let count: number = 0;
      const r: boolean = arr.every(() => {
        count = count + 1;
        return true;
      });
      expect(r).assertTrue();
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_0400
     * @tc.name testFloat32ArrayEveryONE004
     * @tc.desc Verify predicate zero-argument form, three-element array calls 3 times and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(10.0, 20.0, 30.0);
      let count: number = 0;
      const r: boolean = arr.every(() => {
        count = count + 1;
        return true;
      });
      expect(r).assertTrue();
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_0500
     * @tc.name testFloat32ArrayEveryONE005
     * @tc.desc Verify predicate one-argument form receives only element, multi-element all true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.5, 2.5, 3.5);
      const r: boolean = arr.every((e: number) => e >= 1.5);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_0600
     * @tc.name testFloat32ArrayEveryONE006
     * @tc.desc Verify predicate two-argument form receives element and index, uses index for judgment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(10.0, 20.0, 30.0);
      const r: boolean = arr.every((e: number, i: int) => e === (i + 1) * 10);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_0700
     * @tc.name testFloat32ArrayEveryONE007
     * @tc.desc Verify predicate three-argument form receives element, index, array, full-argument judgment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const r: boolean = arr.every((e: number, i: int, a: Float32Array) => e === a.$_get(i));
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_0800
     * @tc.name testFloat32ArrayEveryONE008
     * @tc.desc Verify predicate three-argument form but only uses element, ignoring index and array is still correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(2.0, 4.0, 6.0);
      const r: boolean = arr.every((e: number, i: int, a: Float32Array) => e % 2 === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_0900
     * @tc.name testFloat32ArrayEveryONE009
     * @tc.desc Verify element is Float32.MAX, callback receives the correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(3.4028234663852886e+38);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_1000
     * @tc.name testFloat32ArrayEveryONE010
     * @tc.desc Verify element is Float32.MIN_NORMAL, callback receives the correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.1754943508222875e-38);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_1100
     * @tc.name testFloat32ArrayEveryONE011
     * @tc.desc Verify element is Float32.MIN_VALUE, callback receives the correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.401298464324817e-45);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_1200
     * @tc.name testFloat32ArrayEveryONE012
     * @tc.desc Verify element is NaN, callback receives NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(NaN);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_1300
     * @tc.name testFloat32ArrayEveryONE013
     * @tc.desc Verify element is +Infinity, callback receives Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(Infinity);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_1400
     * @tc.name testFloat32ArrayEveryONE014
     * @tc.desc Verify element is -Infinity, callback receives -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(-Infinity);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_1500
     * @tc.name testFloat32ArrayEveryONE015
     * @tc.desc Verify element is +0, callback receives positive zero (distinguished by 1/e)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0.0);
      let got: number = -1;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(1 / got).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_1600
     * @tc.name testFloat32ArrayEveryONE016
     * @tc.desc Verify element is -0, callback receives negative zero (distinguished by 1/e)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(-0.0);
      let got: number = 1;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(1 / got).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_1700
     * @tc.name testFloat32ArrayEveryONE017
     * @tc.desc Verify element is the minimum finite negative value -Float32.MAX, callback receives the correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(-3.4028234663852886e+38);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_1800
     * @tc.name testFloat32ArrayEveryONE018
     * @tc.desc Verify element is 0.1, callback receives the float32 truncated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0.1);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_1900
     * @tc.name testFloat32ArrayEveryONE019
     * @tc.desc Verify element is 0.2, callback receives the float32 truncated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0.2);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_2000
     * @tc.name testFloat32ArrayEveryONE020
     * @tc.desc Verify element is 0.3, callback receives the float32 truncated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0.3);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_2100
     * @tc.name testFloat32ArrayEveryONE021
     * @tc.desc Verify element is 1.1, callback receives the float32 truncated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.1);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_2200
     * @tc.name testFloat32ArrayEveryONE022
     * @tc.desc Verify element is 1.0000001, callback receives the float32 truncated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0000001);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_2300
     * @tc.name testFloat32ArrayEveryONE023
     * @tc.desc Verify element is 16777216 (2^24), callback receives the exact integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(16777216.0);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_2400
     * @tc.name testFloat32ArrayEveryONE024
     * @tc.desc Verify element is 16777217 (2^24+1), callback receives truncated to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(16777217.0);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_2500
     * @tc.name testFloat32ArrayEveryONE025
     * @tc.desc Verify element is 1.0e40, overflow callback receives Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0e40);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_2600
     * @tc.name testFloat32ArrayEveryONE026
     * @tc.desc Verify element is -1.0e40, underflow callback receives -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(-1.0e40);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_2700
     * @tc.name testFloat32ArrayEveryONE027
     * @tc.desc Verify element is 1.0e-46, underflow callback receives +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0e-46);
      let got: number = -1;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(1 / got).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_2800
     * @tc.name testFloat32ArrayEveryONE028
     * @tc.desc Verify element is -1, callback receives -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(-1.0);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_2900
     * @tc.name testFloat32ArrayEveryONE029
     * @tc.desc Verify element is 2147483647 (int max value), callback receives the correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(2147483647.0);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_3000
     * @tc.name testFloat32ArrayEveryONE030
     * @tc.desc Verify element is -2147483648 (int min value), callback receives the correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(-2147483648.0);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_3100
     * @tc.name testFloat32ArrayEveryONE031
     * @tc.desc Verify element is scientific notation 1.0e3, callback receives 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0e3);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_3200
     * @tc.name testFloat32ArrayEveryONE032
     * @tc.desc Verify element is hexadecimal literal 0xFF, callback receives 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0xFF);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_3300
     * @tc.name testFloat32ArrayEveryONE033
     * @tc.desc Verify element is octal literal 0o17, callback receives 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0o17);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_3400
     * @tc.name testFloat32ArrayEveryONE034
     * @tc.desc Verify element is binary literal 0b1010, callback receives 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0b1010);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_3500
     * @tc.name testFloat32ArrayEveryONE035
     * @tc.desc Verify element is 1e10, callback receives 10000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1e10);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(10000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_3600
     * @tc.name testFloat32ArrayEveryONE036
     * @tc.desc Verify element is 1.5, callback receives 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.5);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_3700
     * @tc.name testFloat32ArrayEveryONE037
     * @tc.desc Verify element is -2.5, callback receives -2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(-2.5);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(-2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_3800
     * @tc.name testFloat32ArrayEveryONE038
     * @tc.desc Verify element is 8388608 (2^23), callback receives the exact integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(8388608.0);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(8388608);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_3900
     * @tc.name testFloat32ArrayEveryONE039
     * @tc.desc Verify element is 16777215 (2^24-1), callback receives the exact integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(16777215.0);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(16777215);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_4000
     * @tc.name testFloat32ArrayEveryONE040
     * @tc.desc Verify element is 0.5, callback receives 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0.5);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_4100
     * @tc.name testFloat32ArrayEveryONE041
     * @tc.desc Verify element is -0.5, callback receives -0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(-0.5);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(-0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_4200
     * @tc.name testFloat32ArrayEveryONE042
     * @tc.desc Verify element is 100.5, callback receives 100.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(100.5);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(100.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_4300
     * @tc.name testFloat32ArrayEveryONE043
     * @tc.desc Verify element is 123456.789, callback receives the float32 truncated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(123456.789);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_4400
     * @tc.name testFloat32ArrayEveryONE044
     * @tc.desc Verify element is 2147483648 (2^31), callback receives the exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(2147483648.0);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_4500
     * @tc.name testFloat32ArrayEveryONE045
     * @tc.desc Verify element is 4294967296 (2^32), callback receives the exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(4294967296.0);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(4294967296);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_4600
     * @tc.name testFloat32ArrayEveryONE046
     * @tc.desc Verify element is 1e-30, callback receives the float32 truncated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1e-30);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_4700
     * @tc.name testFloat32ArrayEveryONE047
     * @tc.desc Verify element is -1e-30, callback receives the float32 truncated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(-1e-30);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_4800
     * @tc.name testFloat32ArrayEveryONE048
     * @tc.desc Verify element is subnormal value 5e-40, callback receives the float32 subnormal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(5e-40);
      let got: number = 0;
      arr.every((e: number) => {
        got = e;
        return true;
      });
      expect(got).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_4900
     * @tc.name testFloat32ArrayEveryONE049
     * @tc.desc Verify multi-element array containing MAX and MIN, the callback receives the respective correct value by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(3.4028234663852886e+38, 1.401298464324817e-45, 0.0);
      let gotMax: number = 0;
      let gotMin: number = 0;
      arr.every((e: number, i: int) => {
        if (i === 0) {
          gotMax = e;
        }
        if (i === 1) {
          gotMin = e;
        }
        return true;
      });
      expect(gotMax).assertEqual(3.4028234663852886e+38);
      expect(gotMin).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_5000
     * @tc.name testFloat32ArrayEveryONE050
     * @tc.desc Verify multi-element array containing +0 and -0, the callback distinguishes the two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0.0, -0.0);
      let gotFirst: number = 1;
      let gotSecond: number = 1;
      arr.every((e: number, i: int) => {
        if (i === 0) {
          gotFirst = e;
        }
        if (i === 1) {
          gotSecond = e;
        }
        return true;
      });
      expect(1 / gotFirst).assertEqual(Infinity);
      expect(1 / gotSecond).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_5100
     * @tc.name testFloat32ArrayEveryONE051
     * @tc.desc Verify multi-element array containing NaN and Infinity, the callback receives the respective special value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(NaN, Infinity, -Infinity);
      let gotNaN: number = 0;
      let gotPosInf: number = 0;
      let gotNegInf: number = 0;
      arr.every((e: number, i: int) => {
        if (i === 0) {
          gotNaN = e;
        }
        if (i === 1) {
          gotPosInf = e;
        }
        if (i === 2) {
          gotNegInf = e;
        }
        return true;
      });
      expect(gotNaN).assertNaN();
      expect(gotPosInf).assertEqual(Infinity);
      expect(gotNegInf).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_5200
     * @tc.name testFloat32ArrayEveryONE052
     * @tc.desc Verify three-element array, the first callback index is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(10.0, 20.0, 30.0);
      let firstIdx: number = -1;
      arr.every((e: number, i: int) => {
        if (firstIdx === -1) {
          firstIdx = i;
        }
        return true;
      });
      expect(firstIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_5300
     * @tc.name testFloat32ArrayEveryONE053
     * @tc.desc Verify three-element array, the last callback index is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(10.0, 20.0, 30.0);
      let lastIdx: number = -1;
      arr.every((e: number, i: int) => {
        lastIdx = i;
        return true;
      });
      expect(lastIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_5400
     * @tc.name testFloat32ArrayEveryONE054
     * @tc.desc Verify three-element array, the index sequence is 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(10.0, 20.0, 30.0);
      let seq: string = '';
      arr.every((e: number, i: int) => {
        seq = seq + i;
        return true;
      });
      expect(seq).assertEqual('012');
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_5500
     * @tc.name testFloat32ArrayEveryONE055
     * @tc.desc Verify five-element array, the middle element index is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      let midIdx: number = -1;
      arr.every((e: number, i: int) => {
        if (e === -1.0) {
          midIdx = i;
        }
        return true;
      });
      expect(midIdx).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_5600
     * @tc.name testFloat32ArrayEveryONE056
     * @tc.desc Verify callback index is always an integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      let lastIdx: number = -1;
      arr.every((e: number, i: int) => {
        lastIdx = i;
        return true;
      });
      expect(lastIdx % 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_5700
     * @tc.name testFloat32ArrayEveryONE057
     * @tc.desc Verify when the first false short-circuits, the index stops at 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      let stopIdx: number = -1;
      arr.every((e: number, i: int) => {
        stopIdx = i;
        return e < 2.0;
      });
      expect(stopIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_5800
     * @tc.name testFloat32ArrayEveryONE058
     * @tc.desc Verify when all true, the last index equals length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      let lastIdx: number = -1;
      arr.every((e: number, i: int) => {
        lastIdx = i;
        return true;
      });
      expect(lastIdx).assertEqual(arr.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_5900
     * @tc.name testFloat32ArrayEveryONE059
     * @tc.desc Verify index increments by 1 with the call count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(5.0, 6.0, 7.0);
      let prev: number = -1;
      let stepOk: boolean = true;
      arr.every((e: number, i: int) => {
        if (prev !== -1 && i !== prev + 1) {
          stepOk = false;
        }
        prev = i;
        return true;
      });
      expect(stepOk).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_6000
     * @tc.name testFloat32ArrayEveryONE060
     * @tc.desc Verify two-element array, the second element index is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(11.0, 22.0);
      let secondIdx: number = -1;
      arr.every((e: number, i: int) => {
        if (e === 22.0) {
          secondIdx = i;
        }
        return true;
      });
      expect(secondIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_6100
     * @tc.name testFloat32ArrayEveryONE061
     * @tc.desc Verify the array argument reference equals the iterated array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      let sameRef: boolean = false;
      arr.every((e: number, i: int, a: Float32Array) => {
        sameRef = (a === arr);
        return true;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_6200
     * @tc.name testFloat32ArrayEveryONE062
     * @tc.desc Verify array.length inside the callback equals the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      let len: number = -1;
      arr.every((e: number, i: int, a: Float32Array) => {
        len = a.length;
        return true;
      });
      expect(len).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_6300
     * @tc.name testFloat32ArrayEveryONE063
     * @tc.desc Verify array.byteLength inside the callback is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      let bl: number = -1;
      arr.every((e: number, i: int, a: Float32Array) => {
        bl = a.byteLength;
        return true;
      });
      expect(bl).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_6400
     * @tc.name testFloat32ArrayEveryONE064
     * @tc.desc Verify the array argument is a Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0);
      let isF32: boolean = false;
      arr.every((e: number, i: int, a: Float32Array) => {
        isF32 = (a instanceof Float32Array);
        return true;
      });
      expect(isF32).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_6500
     * @tc.name testFloat32ArrayEveryONE065
     * @tc.desc Verify array.$_get(index) reads the current element inside the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(10.0, 20.0, 30.0);
      let match: boolean = true;
      arr.every((e: number, i: int, a: Float32Array) => {
        if (a.$_get(i) !== e) {
          match = false;
        }
        return true;
      });
      expect(match).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_6600
     * @tc.name testFloat32ArrayEveryONE066
     * @tc.desc Verify across multiple callbacks the array reference stays the same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      let firstRef: Float32Array | null = null;
      let allSame: boolean = true;
      arr.every((e: number, i: int, a: Float32Array) => {
        if (firstRef === null) {
          firstRef = a;
        } else if (a !== firstRef) {
          allSame = false;
        }
        return true;
      });
      expect(allSame).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_6700
     * @tc.name testFloat32ArrayEveryONE067
     * @tc.desc Verify array.BYTES_PER_ELEMENT inside the callback is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0);
      let bpe: number = -1;
      arr.every((e: number, i: int, a: Float32Array) => {
        bpe = a.BYTES_PER_ELEMENT;
        return true;
      });
      expect(bpe).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_6800
     * @tc.name testFloat32ArrayEveryONE068
     * @tc.desc Verify single-element array, the array argument reference is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(42.0);
      let sameRef: boolean = false;
      arr.every((e: number, i: int, a: Float32Array) => {
        sameRef = (a === arr);
        return true;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_6900
     * @tc.name testFloat32ArrayEveryONE069
     * @tc.desc Verify large array, array.length inside the callback is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(20);
      let len: number = -1;
      arr.every((e: number, i: int, a: Float32Array) => {
        len = a.length;
        return true;
      });
      expect(len).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_7000
     * @tc.name testFloat32ArrayEveryONE070
     * @tc.desc Verify inside the callback, other elements are read via array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(10.0, 20.0, 30.0);
      let other: number = 0;
      arr.every((e: number, i: int, a: Float32Array) => {
        if (i === 0) {
          other = a.$_get(2);
        }
        return true;
      });
      expect(other).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_7100
     * @tc.name testFloat32ArrayEveryONE071
     * @tc.desc Verify array.byteOffset inside the callback is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0);
      let off: number = -1;
      arr.every((e: number, i: int, a: Float32Array) => {
        off = a.byteOffset;
        return true;
      });
      expect(off).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_7200
     * @tc.name testFloat32ArrayEveryONE072
     * @tc.desc Verify predicate first element false, called only 1 time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      let count: number = 0;
      const r: boolean = arr.every((e: number) => {
        count = count + 1;
        return false;
      });
      expect(r).assertFalse();
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_7300
     * @tc.name testFloat32ArrayEveryONE073
     * @tc.desc Verify predicate middle element false, called index+1 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, -1.0, 4.0);
      let count: number = 0;
      const r: boolean = arr.every((e: number) => {
        count = count + 1;
        return e !== -1.0;
      });
      expect(r).assertFalse();
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_7400
     * @tc.name testFloat32ArrayEveryONE074
     * @tc.desc Verify predicate last element false, called length times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      let count: number = 0;
      const r: boolean = arr.every((e: number) => {
        count = count + 1;
        return e !== -1.0;
      });
      expect(r).assertFalse();
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_7500
     * @tc.name testFloat32ArrayEveryONE075
     * @tc.desc Verify predicate reads an external variable as the threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const threshold: number = 10.0;
      const r: boolean = arr.every((e: number) => e <= threshold);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_7600
     * @tc.name testFloat32ArrayEveryONE076
     * @tc.desc Verify predicate nested call to another array's every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const other: Float32Array = Float32Array.of(1.0, 1.0);
      let nested: boolean = false;
      const r: boolean = arr.every((e: number) => {
        nested = other.every((x: number) => x > 0);
        return e > -2;
      });
      expect(r).assertTrue();
      expect(nested).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_7700
     * @tc.name testFloat32ArrayEveryONE077
     * @tc.desc Verify predicate judges the NaN element with e === e and returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(NaN);
      const r: boolean = arr.every((e: number) => e === e);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_7800
     * @tc.name testFloat32ArrayEveryONE078
     * @tc.desc Verify predicate judges the Infinity element with e > 1e30 and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(Infinity);
      const r: boolean = arr.every((e: number) => e > 1e30);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_7900
     * @tc.name testFloat32ArrayEveryONE079
     * @tc.desc Verify predicate judges the -0 element with 1/e as -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(-0.0);
      const r: boolean = arr.every((e: number) => 1 / e === -Infinity);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_8000
     * @tc.name testFloat32ArrayEveryONE080
     * @tc.desc Verify predicate compares the relationship between element and index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0.0, 1.0, 2.0);
      const r: boolean = arr.every((e: number, i: int) => e === i);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_8100
     * @tc.name testFloat32ArrayEveryONE081
     * @tc.desc Verify predicate compares element with array.$_get(index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(5.0, 6.0, 7.0);
      const r: boolean = arr.every((e: number, i: int, a: Float32Array) => e === a.$_get(i));
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_8200
     * @tc.name testFloat32ArrayEveryONE082
     * @tc.desc Verify predicate accumulates element inside the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      let sum: number = 0;
      arr.every((e: number) => {
        sum = sum + e;
        return true;
      });
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_8300
     * @tc.name testFloat32ArrayEveryONE083
     * @tc.desc Verify predicate accumulates index inside the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      let sumIdx: number = 0;
      arr.every((e: number, i: int) => {
        sumIdx = sumIdx + i;
        return true;
      });
      expect(sumIdx).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_8400
     * @tc.name testFloat32ArrayEveryONE084
     * @tc.desc Verify predicate uses the three-argument form to read array.length for validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const r: boolean = arr.every((e: number, i: int, a: Float32Array) => a.length === 3);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_8500
     * @tc.name testFloat32ArrayEveryONE085
     * @tc.desc Verify hundred-element array all true, callback called 100 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(100);
      let count: number = 0;
      const r: boolean = arr.every((e: number) => {
        count = count + 1;
        return true;
      });
      expect(r).assertTrue();
      expect(count).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_8600
     * @tc.name testFloat32ArrayEveryONE086
     * @tc.desc Verify predicate judges an all-negative array as all negative and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(-1.0, -2.0, -3.5);
      const r: boolean = arr.every((e: number) => e < 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_8700
     * @tc.name testFloat32ArrayEveryONE087
     * @tc.desc Verify predicate on an array with positive and negative values, short-circuits on a positive value returning false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(-1.0, -2.0, 3.0, -4.0);
      let count: number = 0;
      const r: boolean = arr.every((e: number) => {
        count = count + 1;
        return e < 0;
      });
      expect(r).assertFalse();
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_8800
     * @tc.name testFloat32ArrayEveryONE088
     * @tc.desc Verify predicate judges an all-same-value array as equal and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(2.5, 2.5, 2.5);
      const r: boolean = arr.every((e: number) => e === 2.5);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_8900
     * @tc.name testFloat32ArrayEveryONE089
     * @tc.desc Verify predicate on a single-element array with true returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(9.0);
      const r: boolean = arr.every((e: number) => e === 9.0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_9000
     * @tc.name testFloat32ArrayEveryONE090
     * @tc.desc Verify predicate on a mixed array containing MAX and 0, the callback receives by index respectively
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(3.4028234663852886e+38, 0.0);
      let gotAt0: number = -1;
      let gotAt1: number = -1;
      arr.every((e: number, i: int) => {
        if (i === 0) {
          gotAt0 = e;
        }
        if (i === 1) {
          gotAt1 = e;
        }
        return true;
      });
      expect(gotAt0).assertEqual(3.4028234663852886e+38);
      expect(gotAt1).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_9100
     * @tc.name testFloat32ArrayEveryONE091
     * @tc.desc Verify predicate on an array containing hexadecimal and binary literals, the callback receives 255 and 10 respectively
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0xFF, 0b1010);
      let gotHex: number = -1;
      let gotBin: number = -1;
      arr.every((e: number, i: int) => {
        if (i === 0) {
          gotHex = e;
        }
        if (i === 1) {
          gotBin = e;
        }
        return true;
      });
      expect(gotHex).assertEqual(255);
      expect(gotBin).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYONE_9200
     * @tc.name testFloat32ArrayEveryONE092
     * @tc.desc Verify modifying a later element before it is visited affects the later predicate value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryONE092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      let seenLast: number = 0;
      const result: boolean = arr.every((e: number, i: int, a: Float32Array) => {
        if (i === 0) {
          a.$_set(2, 9.0);
        }
        if (i === 2) {
          seenLast = e;
        }
        return e < 20.0;
      });
      expect(result).assertTrue();
      expect(seenLast).assertEqual(9.0);
    });

  });
}
