'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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

function getVal(): int {
  return 8;
}

export default function ArrayConstructor1_2Test(): void {
  describe('ArrayConstructor1_2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0100
     * @tc.name testArrayConstructorOne001
     * @tc.desc Verify hex literal 0xFF creates single-element array [255]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 0xFF);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0200
     * @tc.name testArrayConstructorOne002
     * @tc.desc Verify hex literal 0xABCD creates single-element array [43981]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 0xABCD);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(43981);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0300
     * @tc.name testArrayConstructorOne003
     * @tc.desc Verify binary literal 0b11111111 creates single-element array [255]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 0b11111111);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0400
     * @tc.name testArrayConstructorOne004
     * @tc.desc Verify INT32_MIN (-2147483648) creates single-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, -2147483648);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0500
     * @tc.name testArrayConstructorOne005
     * @tc.desc Verify INT32_MIN+1 (-2147483647) creates single-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, -2147483647);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0600
     * @tc.name testArrayConstructorOne006
     * @tc.desc Verify INT32_MAX-1 (2147483646) creates single-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 2147483646);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(2147483646);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0700
     * @tc.name testArrayConstructorOne007
     * @tc.desc Verify business marker value -1 creates single-element array [-1]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, -1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0800
     * @tc.name testArrayConstructorOne008
     * @tc.desc Verify business threshold 1000000 creates single-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 1000000);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_0900
     * @tc.name testArrayConstructorOne009
     * @tc.desc Verify 16-bit upper bound 65535 creates single-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 65535);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1000
     * @tc.name testArrayConstructorOne010
     * @tc.desc Verify medium value 99999 creates single-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 99999);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(99999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1100
     * @tc.name testArrayConstructorOne011
     * @tc.desc Verify negative int -100 as single-element Array.create argument
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, -100);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1200
     * @tc.name testArrayConstructorOne012
     * @tc.desc Verify function return value as single-element Array.create argument
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, getVal());
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1300
     * @tc.name testArrayConstructorOne013
     * @tc.desc Verify bitwise AND 0xFF & 0x0F creates single-element array [15]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 0xFF & 0x0F);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1400
     * @tc.name testArrayConstructorOne014
     * @tc.desc Verify bitwise OR 0xF0 | 0x0F creates single-element array [255]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 0xF0 | 0x0F);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1500
     * @tc.name testArrayConstructorOne015
     * @tc.desc Verify XOR 0xFF ^ 0x0F creates single-element array [240]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 0xFF ^ 0x0F);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(240);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1600
     * @tc.name testArrayConstructorOne016
     * @tc.desc Verify left shift 1 << 4 creates single-element array [16]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 1 << 4);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1700
     * @tc.name testArrayConstructorOne017
     * @tc.desc Verify right shift 16 >> 2 creates single-element array [4]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 16 >> 2);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1800
     * @tc.name testArrayConstructorOne018
     * @tc.desc Verify mask NOT (~0xFF & 0xFF) creates single-element array [0]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, ~0xFF & 0xFF);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_1900
     * @tc.name testArrayConstructorOne019
     * @tc.desc Verify compound bitwise (0xFF&0x0F)|0xF0 creates single-element array [255]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, (0xFF & 0x0F) | 0xF0);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2000
     * @tc.name testArrayConstructorOne020
     * @tc.desc Verify float zero 0.0 creates single-element Array<number>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 0.0);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2100
     * @tc.name testArrayConstructorOne021
     * @tc.desc Verify positive float 123.456 creates single-element Array<number>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 123.456);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(123.456);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2200
     * @tc.name testArrayConstructorOne022
     * @tc.desc Verify negative float -888.88 creates single-element Array<number>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, -888.88);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-888.88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2300
     * @tc.name testArrayConstructorOne023
     * @tc.desc Verify scientific notation 1.0e6 creates single-element Array<number>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1.0e6);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1000000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2400
     * @tc.name testArrayConstructorOne024
     * @tc.desc Verify float PI value 3.14159 creates single-element Array<number>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 3.14159);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(3.14159);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2500
     * @tc.name testArrayConstructorOne025
     * @tc.desc Verify Number.MAX_VALUE creates single-element Array<number>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = Number.MAX_VALUE;
      const arr = Array.create<number>(1, value);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2600
     * @tc.name testArrayConstructorOne026
     * @tc.desc Verify normal string 'test' creates single-element Array<string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, 'test');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2700
     * @tc.name testArrayConstructorOne027
     * @tc.desc Verify empty string creates single-element Array<string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, '');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2800
     * @tc.name testArrayConstructorOne028
     * @tc.desc Verify space string creates single-element Array<string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, ' ');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(' ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_2900
     * @tc.name testArrayConstructorOne029
     * @tc.desc Verify newline escape '\n' creates single-element Array<string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, '\n');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('\n');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3000
     * @tc.name testArrayConstructorOne030
     * @tc.desc Verify tab escape '\t' creates single-element Array<string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, '\t');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('\t');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3100
     * @tc.name testArrayConstructorOne031
     * @tc.desc Verify single char string 'a' creates single-element Array<string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, 'a');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3200
     * @tc.name testArrayConstructorOne032
     * @tc.desc Verify XSS special chars '<script>' creates single-element Array<string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, '<script>');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('<script>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3300
     * @tc.name testArrayConstructorOne033
     * @tc.desc Verify email format string creates single-element Array<string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, 'test@example.com');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('test@example.com');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3400
     * @tc.name testArrayConstructorOne034
     * @tc.desc Verify Unicode Chinese string creates single-element Array<string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, '\u4e2d\u6587');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('\u4e2d\u6587');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3500
     * @tc.name testArrayConstructorOne035
     * @tc.desc Verify Japanese string creates single-element Array<string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, 'テスト');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('テスト');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3600
     * @tc.name testArrayConstructorOne036
     * @tc.desc Verify Korean string creates single-element Array<string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, '테스트');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('테스트');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3700
     * @tc.name testArrayConstructorOne037
     * @tc.desc Verify Russian string creates single-element Array<string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, 'АБВГД');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('АБВГД');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3800
     * @tc.name testArrayConstructorOne038
     * @tc.desc Verify emoji surrogate pair string creates single-element Array<string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, '\uD83D\uDE00');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('\uD83D\uDE00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_3900
     * @tc.name testArrayConstructorOne039
     * @tc.desc Verify zero-width space string creates single-element Array<string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, '\u200B');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('\u200B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_4000
     * @tc.name testArrayConstructorOne040
     * @tc.desc Verify boolean true creates single-element Array<boolean>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<boolean>(1, true);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_4100
     * @tc.name testArrayConstructorOne041
     * @tc.desc Verify boolean false creates single-element Array<boolean>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<boolean>(1, false);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_4200
     * @tc.name testArrayConstructorOne042
     * @tc.desc Verify bigint 100n creates single-element Array<bigint>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<bigint>(1, 100n);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_4300
     * @tc.name testArrayConstructorOne043
     * @tc.desc Verify bigint 0n creates single-element Array<bigint>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<bigint>(1, 0n);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_4400
     * @tc.name testArrayConstructorOne044
     * @tc.desc Verify negative bigint -1n creates single-element Array<bigint>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<bigint>(1, -1n);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_4500
     * @tc.name testArrayConstructorOne045
     * @tc.desc Verify large bigint 9223372036854775807n creates single-element Array<bigint>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<bigint>(1, 9223372036854775807n);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_4600
     * @tc.name testArrayConstructorOne046
     * @tc.desc Verify large negative bigint -9223372036854775808n creates single-element Array<bigint>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<bigint>(1, -9223372036854775808n);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_4700
     * @tc.name testArrayConstructorOne047
     * @tc.desc Verify business large bigint 10000000000n creates single-element Array<bigint>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<bigint>(1, 10000000000n);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(10000000000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_4800
     * @tc.name testArrayConstructorOne048
     * @tc.desc Verify char literal c'a' creates single-element Array<char>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<char>(1, c'a');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(c'a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_4900
     * @tc.name testArrayConstructorOne049
     * @tc.desc Verify char digit c'0' creates single-element Array<char>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<char>(1, c'0');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(c'0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_5000
     * @tc.name testArrayConstructorOne050
     * @tc.desc Verify null char c'\u0000' creates single-element Array<char>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<char>(1, c'\u0000');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(c'\u0000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_5100
     * @tc.name testArrayConstructorOne051
     * @tc.desc Verify max char c'\uffff' creates single-element Array<char>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<char>(1, c'\uffff');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(c'\uffff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_5200
     * @tc.name testArrayConstructorOne052
     * @tc.desc Verify Unicode Chinese char c'\u4e2d' creates single-element Array<char>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<char>(1, c'\u4e2d');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(c'\u4e2d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_5300
     * @tc.name testArrayConstructorOne053
     * @tc.desc Verify newline char c'\n' creates single-element Array<char>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<char>(1, c'\n');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(c'\n');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_5400
     * @tc.name testArrayConstructorOne054
     * @tc.desc Verify union int|string with int value creates single-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int | string>(1, 42);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_5500
     * @tc.name testArrayConstructorOne055
     * @tc.desc Verify union int|string with string value creates single-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int | string>(1, 'hello');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_5600
     * @tc.name testArrayConstructorOne056
     * @tc.desc Verify union int|boolean with boolean value creates single-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int | boolean>(1, true);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_5700
     * @tc.name testArrayConstructorOne057
     * @tc.desc Verify nullable int|null with null value creates single-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int | null>(1, null);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_5800
     * @tc.name testArrayConstructorOne058
     * @tc.desc Verify nullable string|undefined with string value creates single-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string | undefined>(1, 'test');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_5900
     * @tc.name testArrayConstructorOne059
     * @tc.desc Verify nullable int|undefined with undefined value creates single-element array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int | undefined>(1, undefined);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_6000
     * @tc.name testArrayConstructorOne060
     * @tc.desc Verify octal literal as single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 0o777);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(511);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_6100
     * @tc.name testArrayConstructorOne061
     * @tc.desc Verify scientific notation as single int element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 150);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(150);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_6200
     * @tc.name testArrayConstructorOne062
     * @tc.desc Verify float minimum positive value as single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<float>(1, 1.4E-45f);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1.4E-45f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_6300
     * @tc.name testArrayConstructorOne063
     * @tc.desc Verify long maximum value as single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<long>(1, 9223372036854775807);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_6400
     * @tc.name testArrayConstructorOne064
     * @tc.desc Verify bigint minimum value as single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<bigint>(1, -9223372036854775808n);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_6500
     * @tc.name testArrayConstructorOne065
     * @tc.desc Verify byte minimum value as single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<byte>(1, -128);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_6600
     * @tc.name testArrayConstructorOne066
     * @tc.desc Verify short maximum value as single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<short>(1, 32767);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_6700
     * @tc.name testArrayConstructorOne067
     * @tc.desc Verify char maximum code point as single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<char>(1, c'\uffff');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(c'\uffff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_6800
     * @tc.name testArrayConstructorOne068
     * @tc.desc Verify whitespace string as single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, '   ');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('   ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_6900
     * @tc.name testArrayConstructorOne069
     * @tc.desc Verify double maximum value as single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<double>(1, 1.7976931348623157E308);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1.7976931348623157E308);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_7000
     * @tc.name testArrayConstructorOne070
     * @tc.desc Verify float NaN as single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<float>(1, Float.NaN);
      expect(arr.length).assertEqual(1);
      expect(isNaN(Float.toDouble(arr[0]))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_7100
     * @tc.name testArrayConstructorOne071
     * @tc.desc Verify float POSITIVE_INFINITY as single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<float>(1, Float.POSITIVE_INFINITY);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_7200
     * @tc.name testArrayConstructorOne072
     * @tc.desc Verify double NaN as single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<double>(1, Double.NaN);
      expect(arr.length).assertEqual(1);
      expect(isNaN(arr[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_7300
     * @tc.name testArrayConstructorOne073
     * @tc.desc Verify Double.POSITIVE_INFINITY as single-element Array.create element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<double>(1, Double.POSITIVE_INFINITY);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_7400
     * @tc.name testArrayConstructorOne074
     * @tc.desc Verify Date object as Array.create element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Date(2026, 0, 1);
      const arr = Array.create<Date>(1, d);
      expect(arr.length).assertEqual(1);
      expect(arr[0].getFullYear()).assertEqual(2026);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_7500
     * @tc.name testArrayConstructorOne075
     * @tc.desc Verify string with special characters as single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, '!@#$%');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('!@#$%');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_7600
     * @tc.name testArrayConstructorOne076
     * @tc.desc Verify string with hex format as single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, '0x123');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('0x123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_7700
     * @tc.name testArrayConstructorOne077
     * @tc.desc Verify byte zero creates single-element Array<byte>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<byte>(1, 0);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_7800
     * @tc.name testArrayConstructorOne078
     * @tc.desc Verify byte normal 12 creates single-element Array<byte>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<byte>(1, 12);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_7900
     * @tc.name testArrayConstructorOne079
     * @tc.desc Verify byte max 127 creates single-element Array<byte>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<byte>(1, 127);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_8000
     * @tc.name testArrayConstructorOne080
     * @tc.desc Verify short min -32768 creates single-element Array<short>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<short>(1, -32768);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_8100
     * @tc.name testArrayConstructorOne081
     * @tc.desc Verify short zero creates single-element Array<short>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<short>(1, 0);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_8200
     * @tc.name testArrayConstructorOne082
     * @tc.desc Verify short normal 100 creates single-element Array<short>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<short>(1, 100);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_8300
     * @tc.name testArrayConstructorOne083
     * @tc.desc Verify long zero creates single-element Array<long>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<long>(1, 0);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_8400
     * @tc.name testArrayConstructorOne084
     * @tc.desc Verify long -1 creates single-element Array<long>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<long>(1, -1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_8500
     * @tc.name testArrayConstructorOne085
     * @tc.desc Verify long normal 100 creates single-element Array<long>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<long>(1, 100);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_8600
     * @tc.name testArrayConstructorOne086
     * @tc.desc Verify float negative zero -0.0f creates single-element Array<float>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<float>(1, -0.0f);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_8700
     * @tc.name testArrayConstructorOne087
     * @tc.desc Verify Float.MIN_VALUE creates single-element Array<float>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<float>(1, Float.MIN_VALUE);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(Float.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_8800
     * @tc.name testArrayConstructorOne088
     * @tc.desc Verify Float.MAX_VALUE creates single-element Array<float>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<float>(1, Float.MAX_VALUE);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(Float.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_8900
     * @tc.name testArrayConstructorOne089
     * @tc.desc Verify double negative zero -0.0 creates single-element Array<double>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<double>(1, -0.0);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_9000
     * @tc.name testArrayConstructorOne090
     * @tc.desc Verify Double.MIN_VALUE creates single-element Array<double>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<double>(1, Double.MIN_VALUE);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(Double.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_9100
     * @tc.name testArrayConstructorOne091
     * @tc.desc Verify digit char c'8' creates single-element Array<char>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<char>(1, c'8');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(c'8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_9200
     * @tc.name testArrayConstructorOne092
     * @tc.desc Verify underscore char c'_' creates single-element Array<char>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<char>(1, c'_');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(c'_');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_9300
     * @tc.name testArrayConstructorOne093
     * @tc.desc Verify hex escape char c'\\x61' creates single-element Array<char>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<char>(1, c'\x61');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(c'a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_9400
     * @tc.name testArrayConstructorOne094
     * @tc.desc Verify pure number string '123456' creates single-element Array<string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, '123456');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('123456');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_9500
     * @tc.name testArrayConstructorOne095
     * @tc.desc Verify phone number format string creates single-element Array<string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, '13800138000');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('13800138000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_9600
     * @tc.name testArrayConstructorOne096
     * @tc.desc Verify illegal unicode char '\uFFFE' creates single-element Array<string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, '\uFFFE');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('\uFFFE');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_9700
     * @tc.name testArrayConstructorOne097
     * @tc.desc Verify replacement char '\uFFFD' creates single-element Array<string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, '\uFFFD');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('\uFFFD');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_9800
     * @tc.name testArrayConstructorOne098
     * @tc.desc Verify emoji + Chinese mixed string creates single-element Array<string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, '😀测试');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('😀测试');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_ONE_9900
     * @tc.name testArrayConstructorOne099
     * @tc.desc Verify fire emoji string creates single-element Array<string>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level Level 2
     */

    it('testArrayConstructorOne099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<string>(1, '🔥🔥');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('🔥🔥');
    });

  });
}
