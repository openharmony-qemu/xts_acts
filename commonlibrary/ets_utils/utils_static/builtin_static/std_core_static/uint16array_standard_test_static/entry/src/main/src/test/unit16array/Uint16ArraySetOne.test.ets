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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint16Array$Set01Test(): void {
  describe('Uint16Array$Set01Test', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0001
     * @tc.name testUint16ArraySetOne001
     * @tc.desc Verify assigning index 1 preserves array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let lenBefore: int = arr.length;
      arr[1] = 99;
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0002
     * @tc.name testUint16ArraySetOne002
     * @tc.desc Verify index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      arr[0] = 99;
      expect(arr.at(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0003
     * @tc.name testUint16ArraySetOne003
     * @tc.desc Verify index=length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      try {
        arr[5] = 99;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0004
     * @tc.name testUint16ArraySetOne004
     * @tc.desc Verify index=-1 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      try {
        arr[-1] = 99;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0005
     * @tc.name testUint16ArraySetOne005
     * @tc.desc Verify index=1.2 truncates to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      arr[Double.toInt(1.2)] = 99;
      expect(arr.at(1)).assertEqual(99);
      expect(arr.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0006
     * @tc.name testUint16ArraySetOne006
     * @tc.desc Verify index=NaN no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      arr[Double.toInt(Number.NaN)] = 99;
      expect(arr.at(0)).assertEqual(99);
      expect(arr.at(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0007
     * @tc.name testUint16ArraySetOne007
     * @tc.desc Verify index=Infinity no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      try {
        arr[Double.toInt(Number.POSITIVE_INFINITY)] = 99;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0008
     * @tc.name testUint16ArraySetOne008
     * @tc.desc Verify index=-Infinity no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      try {
        arr[Double.toInt(-Number.POSITIVE_INFINITY)] = 99;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0009
     * @tc.name testUint16ArraySetOne009
     * @tc.desc Verify value=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 0;
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0010
     * @tc.name testUint16ArraySetOne010
     * @tc.desc Verify value=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 1;
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0011
     * @tc.name testUint16ArraySetOne011
     * @tc.desc Verify value=65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 65535;
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0012
     * @tc.name testUint16ArraySetOne012
     * @tc.desc Verify value=32768 0x8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 32768;
      expect(arr.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0013
     * @tc.name testUint16ArraySetOne013
     * @tc.desc Verify value=128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 128;
      expect(arr.at(0)).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0014
     * @tc.name testUint16ArraySetOne014
     * @tc.desc Verify value=32767 int15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 32767;
      expect(arr.at(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0015
     * @tc.name testUint16ArraySetOne015
     * @tc.desc Verify value=0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 0xFFFF;
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0016
     * @tc.name testUint16ArraySetOne016
     * @tc.desc Verify value=0x7FFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 0x7FFF;
      expect(arr.at(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0017
     * @tc.name testUint16ArraySetOne017
     * @tc.desc Verify value=0x8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 0x8000;
      expect(arr.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0018
     * @tc.name testUint16ArraySetOne018
     * @tc.desc Verify value=0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 0xFF;
      expect(arr.at(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0019
     * @tc.name testUint16ArraySetOne019
     * @tc.desc Verify value=0x100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 0x100;
      expect(arr.at(0)).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0020
     * @tc.name testUint16ArraySetOne020
     * @tc.desc Verify value=0x00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 0x00;
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0021
     * @tc.name testUint16ArraySetOne021
     * @tc.desc Verify value=0o177777
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 0o177777;
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0022
     * @tc.name testUint16ArraySetOne022
     * @tc.desc Verify value=0o100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 0o100000;
      expect(arr.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0023
     * @tc.name testUint16ArraySetOne023
     * @tc.desc Verify value=0o077777
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 0o077777;
      expect(arr.at(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0024
     * @tc.name testUint16ArraySetOne024
     * @tc.desc Verify value=0b1111111111111111
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 0b1111111111111111;
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0025
     * @tc.name testUint16ArraySetOne025
     * @tc.desc Verify value=0b1000000000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 0b1000000000000000;
      expect(arr.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0026
     * @tc.name testUint16ArraySetOne026
     * @tc.desc Verify value=6.5535e4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 6.5535e4;
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0027
     * @tc.name testUint16ArraySetOne027
     * @tc.desc Verify value=1e5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 1e5;
      expect(arr.at(0)).assertEqual(34464);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0028
     * @tc.name testUint16ArraySetOne028
     * @tc.desc Verify value=65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      arr[2] = 65535;
      expect(arr.at(2)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0029
     * @tc.name testUint16ArraySetOne029
     * @tc.desc Verify value=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      arr[2] = 0;
      expect(arr.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0030
     * @tc.name testUint16ArraySetOne030
     * @tc.desc Verify value=65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      arr[1] = 65535;
      expect(arr.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0031
     * @tc.name testUint16ArraySetOne031
     * @tc.desc Verify value=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      arr[1] = 0;
      expect(arr.at(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0032
     * @tc.name testUint16ArraySetOne032
     * @tc.desc Verify overwriting 65535 with 0 stores 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 65535;
      arr[0] = 0;
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0033
     * @tc.name testUint16ArraySetOne033
     * @tc.desc Verify overwriting 0 with 65535 stores 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 0;
      arr[0] = 65535;
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0034
     * @tc.name testUint16ArraySetOne034
     * @tc.desc Verify value=65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 65536;
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0035
     * @tc.name testUint16ArraySetOne035
     * @tc.desc Verify value=65537 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 65537;
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0036
     * @tc.name testUint16ArraySetOne036
     * @tc.desc Verify value=131071 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 131071;
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0037
     * @tc.name testUint16ArraySetOne037
     * @tc.desc Verify value=131072 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 131072;
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0038
     * @tc.name testUint16ArraySetOne038
     * @tc.desc Verify value=0x10001 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 0x10001;
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0039
     * @tc.name testUint16ArraySetOne039
     * @tc.desc Verify value=0x1FFFF 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 0x1FFFF;
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0040
     * @tc.name testUint16ArraySetOne040
     * @tc.desc Verify value=98304 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 98304;
      expect(arr.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0041
     * @tc.name testUint16ArraySetOne041
     * @tc.desc Verify value=65664 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 65664;
      expect(arr.at(0)).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0042
     * @tc.name testUint16ArraySetOne042
     * @tc.desc Verify value=4294967295 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 4294967295;
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0043
     * @tc.name testUint16ArraySetOne043
     * @tc.desc Verify value=-1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = -1;
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0044
     * @tc.name testUint16ArraySetOne044
     * @tc.desc Verify value=-65535 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = -65535;
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0045
     * @tc.name testUint16ArraySetOne045
     * @tc.desc Verify value=-65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = -65536;
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0046
     * @tc.name testUint16ArraySetOne046
     * @tc.desc Verify value=-65537 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = -65537;
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0047
     * @tc.name testUint16ArraySetOne047
     * @tc.desc Verify value=-32768 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = -32768;
      expect(arr.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0048
     * @tc.name testUint16ArraySetOne048
     * @tc.desc Verify value=-128 65408
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = -128;
      expect(arr.at(0)).assertEqual(65408);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0049
     * @tc.name testUint16ArraySetOne049
     * @tc.desc Verify value=-4294967295 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = -4294967295;
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0050
     * @tc.name testUint16ArraySetOne050
     * @tc.desc Verify value=3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 3.14;
      expect(arr.at(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0051
     * @tc.name testUint16ArraySetOne051
     * @tc.desc Verify value=65535.9 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 65535.9;
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0052
     * @tc.name testUint16ArraySetOne052
     * @tc.desc Verify value=0.999 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 0.999;
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0053
     * @tc.name testUint16ArraySetOne053
     * @tc.desc Verify value=1.999 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 1.999;
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0054
     * @tc.name testUint16ArraySetOne054
     * @tc.desc Verify value=32768.5 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 32768.5;
      expect(arr.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0055
     * @tc.name testUint16ArraySetOne055
     * @tc.desc Verify value=65534.1 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 65534.1;
      expect(arr.at(0)).assertEqual(65534);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0056
     * @tc.name testUint16ArraySetOne056
     * @tc.desc Verify value=-0.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = -0.5;
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0057
     * @tc.name testUint16ArraySetOne057
     * @tc.desc Verify value=-1.5 65534
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = -1.5;
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0058
     * @tc.name testUint16ArraySetOne058
     * @tc.desc Verify value=-65535.9 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = -65535.9;
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0059
     * @tc.name testUint16ArraySetOne059
     * @tc.desc Verify value=65536.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 65536.5;
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0060
     * @tc.name testUint16ArraySetOne060
     * @tc.desc Verify value=-65536.5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = -65536.5;
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0061
     * @tc.name testUint16ArraySetOne061
     * @tc.desc Verify value=NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = Number.NaN;
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0062
     * @tc.name testUint16ArraySetOne062
     * @tc.desc Verify value=Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = Number.POSITIVE_INFINITY;
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0063
     * @tc.name testUint16ArraySetOne063
     * @tc.desc Verify value=-Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = -Number.POSITIVE_INFINITY;
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0064
     * @tc.name testUint16ArraySetOne064
     * @tc.desc Verify 65536+32768=98304 index=1 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      arr[1] = 98304;
      expect(arr.at(1)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0065
     * @tc.name testUint16ArraySetOne065
     * @tc.desc Verify -1 index=2 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      arr[2] = -1;
      expect(arr.at(2)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0066
     * @tc.name testUint16ArraySetOne066
     * @tc.desc Verify 65536 index=length-1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      arr[4] = 65536;
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0067
     * @tc.name testUint16ArraySetOne067
     * @tc.desc Verify 65535.9 index=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      arr[2] = 65535.9;
      expect(arr.at(2)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0068
     * @tc.name testUint16ArraySetOne068
     * @tc.desc Verify assigning mixed out-of-range and special values applies Uint16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr[0] = 65536;
      arr[1] = -1;
      arr[2] = 3.14;
      arr[3] = Number.NaN;
      arr[4] = Number.POSITIVE_INFINITY;
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(3);
      expect(arr.at(3)).assertEqual(0);
      expect(arr.at(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0069
     * @tc.name testUint16ArraySetOne069
     * @tc.desc Verify 0o400000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 0o400000;
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0070
     * @tc.name testUint16ArraySetOne070
     * @tc.desc Verify 0b10000000000000000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 0b10000000000000000;
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0071
     * @tc.name testUint16ArraySetOne071
     * @tc.desc Verify boundary values 0 1 32767 32768 65534 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(6);
      arr[0] = 0;
      arr[1] = 1;
      arr[2] = 32767;
      arr[3] = 32768;
      arr[4] = 65534;
      arr[5] = 65535;
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(1);
      expect(arr.at(2)).assertEqual(32767);
      expect(arr.at(3)).assertEqual(32768);
      expect(arr.at(4)).assertEqual(65534);
      expect(arr.at(5)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET_ONE_0072
     * @tc.name testUint16ArraySetOne072
     * @tc.desc Verify ArrayBuffer view offset dual view 65536 wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArraySetOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer: ArrayBuffer = new ArrayBuffer(12);
      let view1: Uint16Array = new Uint16Array(buffer, 2, 4);
      view1[0] = 100;
      view1[1] = 32768;
      view1[2] = 65535;
      view1[3] = 65536;
      let view2: Uint16Array = new Uint16Array(buffer, 2, 4);
      expect(view2.at(0)).assertEqual(100);
      expect(view2.at(1)).assertEqual(32768);
      expect(view2.at(2)).assertEqual(65535);
      expect(view2.at(3)).assertEqual(0);
    });

  });
}
