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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArrayToStringOneTest(): void {
  describe('Uint32ArrayToStringOneTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_0100
     * @tc.name testUint32ArrayToStringOne001
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(42);
      const s: string = arr.toString();
      expect(s).assertEqual("42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_0200
     * @tc.name testUint32ArrayToStringOne002
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2);
      const s: string = arr.toString();
      expect(s).assertEqual("1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_0300
     * @tc.name testUint32ArrayToStringOne003
     * @tc.desc Verify new Uint32Array(length) toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(3);
      const s: string = arr.toString();
      expect(s).assertEqual("0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_0400
     * @tc.name testUint32ArrayToStringOne004
     * @tc.desc Verify new Uint32Array(number[]) toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array([7, 8, 9]);
      const s: string = arr.toString();
      expect(s).assertEqual("7,8,9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_0500
     * @tc.name testUint32ArrayToStringOne005
     * @tc.desc Verify MAX toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967295);
      const s: string = arr.toString();
      expect(s).assertEqual("4294967295");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_0600
     * @tc.name testUint32ArrayToStringOne006
     * @tc.desc Verify 0o17 toString "15"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0o17);
      const s: string = arr.toString();
      expect(s).assertEqual("15");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_0700
     * @tc.name testUint32ArrayToStringOne007
     * @tc.desc Verify 0o777 toString "511"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0o777);
      const s: string = arr.toString();
      expect(s).assertEqual("511");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_0800
     * @tc.name testUint32ArrayToStringOne008
     * @tc.desc Verify -2 4294967294 toString "4294967294"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(-2);
      const s: string = arr.toString();
      expect(s).assertEqual("4294967294");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_0900
     * @tc.name testUint32ArrayToStringOne009
     * @tc.desc Verify -2147483648 int32 2147483648 toString "2147483648"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(-2147483648);
      const s: string = arr.toString();
      expect(s).assertEqual("2147483648");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_1000
     * @tc.name testUint32ArrayToStringOne010
     * @tc.desc Verify -4294967296 -2^32 0 toString "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(-4294967296);
      const s: string = arr.toString();
      expect(s).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_1100
     * @tc.name testUint32ArrayToStringOne011
     * @tc.desc Verify 4294967297 2^32+1 1 toString "1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967297);
      const s: string = arr.toString();
      expect(s).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_1200
     * @tc.name testUint32ArrayToStringOne012
     * @tc.desc Verify 8589934591 2^33-1 4294967295 toString "4294967295"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(8589934591);
      const s: string = arr.toString();
      expect(s).assertEqual("4294967295");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_1300
     * @tc.name testUint32ArrayToStringOne013
     * @tc.desc Verify 3.14 3 toString "3"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(3.14);
      const s: string = arr.toString();
      expect(s).assertEqual("3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_1400
     * @tc.name testUint32ArrayToStringOne014
     * @tc.desc Verify 0.5 0 toString "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0.5);
      const s: string = arr.toString();
      expect(s).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_1500
     * @tc.name testUint32ArrayToStringOne015
     * @tc.desc Verify 999.999 999 toString "999"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(999.999);
      const s: string = arr.toString();
      expect(s).assertEqual("999");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_1600
     * @tc.name testUint32ArrayToStringOne016
     * @tc.desc Verify NaN 0 toString "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(Number.NaN);
      const s: string = arr.toString();
      expect(s).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_1700
     * @tc.name testUint32ArrayToStringOne017
     * @tc.desc Verify 9007199254740991 2^53-1 4294967295 toString "4294967295"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(9007199254740991);
      const s: string = arr.toString();
      expect(s).assertEqual("4294967295");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_1800
     * @tc.name testUint32ArrayToStringOne018
     * @tc.desc Verify 2147483647.9 2147483647 toString "2147483647"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(2147483647.9);
      const s: string = arr.toString();
      expect(s).assertEqual("2147483647");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_1900
     * @tc.name testUint32ArrayToStringOne019
     * @tc.desc Verify 0 9 toString "0,1,2,3,4,5,6,7,8,9"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
      const s: string = arr.toString();
      expect(s).assertEqual("0,1,2,3,4,5,6,7,8,9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_2000
     * @tc.name testUint32ArrayToStringOne020
     * @tc.desc Verify MAX 0 toString "4294967295,0,4294967295"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967295, 0, 4294967295);
      const s: string = arr.toString();
      expect(s).assertEqual("4294967295,0,4294967295");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_2100
     * @tc.name testUint32ArrayToStringOne021
     * @tc.desc Verify toString "255,65535,16777215,4294967295"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0xFF, 0xFFFF, 0xFFFFFF, 0xFFFFFFFF);
      const s: string = arr.toString();
      expect(s).assertEqual("255,65535,16777215,4294967295");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_2200
     * @tc.name testUint32ArrayToStringOne022
     * @tc.desc Verify int32 toString "2147483647,2147483648"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(2147483647, 2147483648);
      const s: string = arr.toString();
      expect(s).assertEqual("2147483647,2147483648");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_2300
     * @tc.name testUint32ArrayToStringOne023
     * @tc.desc Verify toString "4294967295,4294967294,4294967293"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(-1, -2, -3);
      const s: string = arr.toString();
      expect(s).assertEqual("4294967295,4294967294,4294967293");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_2400
     * @tc.name testUint32ArrayToStringOne024
     * @tc.desc Verify toString "0,1,2"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967296, 4294967297, 4294967298);
      const s: string = arr.toString();
      expect(s).assertEqual("0,1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_2500
     * @tc.name testUint32ArrayToStringOne025
     * @tc.desc Verify toString "0,0,0,0,0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 0, 0, 0, 0);
      const s: string = arr.toString();
      expect(s).assertEqual("0,0,0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_2600
     * @tc.name testUint32ArrayToStringOne026
     * @tc.desc Verify MAX toString "4294967295,4294967295,4294967295"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967295, 4294967295, 4294967295);
      const s: string = arr.toString();
      expect(s).assertEqual("4294967295,4294967295,4294967295");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_2700
     * @tc.name testUint32ArrayToStringOne027
     * @tc.desc Verify 2 toString "1,2,4,8,16,32,64,128"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 4, 8, 16, 32, 64, 128);
      const s: string = arr.toString();
      expect(s).assertEqual("1,2,4,8,16,32,64,128");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOSTRING_2800
     * @tc.name testUint32ArrayToStringOne028
     * @tc.desc Verify empty Uint32Array toString returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToStringOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(0);
      const s: string = arr.toString();
      expect(s).assertEqual("");
    });

  });
}
