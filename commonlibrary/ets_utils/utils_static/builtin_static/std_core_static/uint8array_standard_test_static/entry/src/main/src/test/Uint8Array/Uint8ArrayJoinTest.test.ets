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

export default function Uint8ArrayJoinTest(): void {
  describe('Uint8ArrayJoinTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_0100
     * @tc.name testUint8ArrayJoin001
     * @tc.desc Verify join() with no parameters returns empty string for empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      const result: string = arr.join();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_0200
     * @tc.name testUint8ArrayJoin002
     * @tc.desc Verify join() with no parameters returns single element for single-element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([99]);
      const result: string = arr.join();
      expect(result).assertEqual('99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_0300
     * @tc.name testUint8ArrayJoin003
     * @tc.desc Verify join() with no parameters uses default comma separator for multi-element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5, 10, 15]);
      const result: string = arr.join();
      expect(result).assertEqual('5,10,15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_0400
     * @tc.name testUint8ArrayJoin004
     * @tc.desc Verify join(',') explicit comma matches default behavior
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: string = arr.join(',');
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_0500
     * @tc.name testUint8ArrayJoin005
     * @tc.desc Verify join('') empty string separator concatenates elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10, 20, 30]);
      const result: string = arr.join('');
      expect(result).assertEqual('102030');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_0600
     * @tc.name testUint8ArrayJoin006
     * @tc.desc Verify join('|') pipe separator works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: string = arr.join('|');
      expect(result).assertEqual('1|2|3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_0700
     * @tc.name testUint8ArrayJoin007
     * @tc.desc Verify join(' ') space separator works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: string = arr.join(' ');
      expect(result).assertEqual('1 2 3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_0800
     * @tc.name testUint8ArrayJoin008
     * @tc.desc Verify join('\t') tab separator works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: string = arr.join('\t');
      expect(result).assertEqual('1\t2\t3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_0900
     * @tc.name testUint8ArrayJoin009
     * @tc.desc Verify join(' => ') arrow separator works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: string = arr.join(' => ');
      expect(result).assertEqual('1 => 2 => 3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_1000
     * @tc.name testUint8ArrayJoin010
     * @tc.desc Verify join(' -> ') short arrow separator works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: string = arr.join(' -> ');
      expect(result).assertEqual('1 -> 2 -> 3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_1100
     * @tc.name testUint8ArrayJoin011
     * @tc.desc Verify join('---') triple dash separator works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: string = arr.join('---');
      expect(result).assertEqual('1---2---3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_1200
     * @tc.name testUint8ArrayJoin012
     * @tc.desc Verify join('...') ellipsis separator works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: string = arr.join('...');
      expect(result).assertEqual('1...2...3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_1300
     * @tc.name testUint8ArrayJoin013
     * @tc.desc Verify join('_') underscore separator works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: string = arr.join('_');
      expect(result).assertEqual('1_2_3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_1400
     * @tc.name testUint8ArrayJoin014
     * @tc.desc Verify join('::') double colon separator works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: string = arr.join('::');
      expect(result).assertEqual('1::2::3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_1500
     * @tc.name testUint8ArrayJoin015
     * @tc.desc Verify join('-*-') pattern separator works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: string = arr.join('-*-');
      expect(result).assertEqual('1-*-2-*-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_1600
     * @tc.name testUint8ArrayJoin016
     * @tc.desc Verify join('!@#') special character separator works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: string = arr.join('!@#');
      expect(result).assertEqual('1!@#2!@#3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_1700
     * @tc.name testUint8ArrayJoin017
     * @tc.desc Verify join() with multi-byte Unicode character separator works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: string = arr.join('中');
      expect(result).assertEqual('1中2中3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_1800
     * @tc.name testUint8ArrayJoin018
     * @tc.desc Verify join('~') tilde separator works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: string = arr.join('~');
      expect(result).assertEqual('1~2~3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_1900
     * @tc.name testUint8ArrayJoin019
     * @tc.desc Verify join() returns '255' for single max value element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([255]);
      const result: string = arr.join();
      expect(result).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_2000
     * @tc.name testUint8ArrayJoin020
     * @tc.desc Verify join() returns '128' for single middle value element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([128]);
      const result: string = arr.join();
      expect(result).assertEqual('128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_2100
     * @tc.name testUint8ArrayJoin021
     * @tc.desc Verify join() returns '1' for single one element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1]);
      const result: string = arr.join();
      expect(result).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_2200
     * @tc.name testUint8ArrayJoin022
     * @tc.desc Verify join() returns '127' for single value 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([127]);
      const result: string = arr.join();
      expect(result).assertEqual('127');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_2300
     * @tc.name testUint8ArrayJoin023
     * @tc.desc Verify join() returns '129' for single value 129
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([129]);
      const result: string = arr.join();
      expect(result).assertEqual('129');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_2400
     * @tc.name testUint8ArrayJoin024
     * @tc.desc Verify join() returns '254' for single value 254
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([254]);
      const result: string = arr.join();
      expect(result).assertEqual('254');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_2500
     * @tc.name testUint8ArrayJoin025
     * @tc.desc Verify join() returns '2' for single value 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([2]);
      const result: string = arr.join();
      expect(result).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_2600
     * @tc.name testUint8ArrayJoin026
     * @tc.desc Verify join() returns '3' for single value 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([3]);
      const result: string = arr.join();
      expect(result).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_2700
     * @tc.name testUint8ArrayJoin027
     * @tc.desc Verify join() returns '252' for single value 252
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([252]);
      const result: string = arr.join();
      expect(result).assertEqual('252');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_2800
     * @tc.name testUint8ArrayJoin028
     * @tc.desc Verify join() returns '4' for single value 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([4]);
      const result: string = arr.join();
      expect(result).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_2900
     * @tc.name testUint8ArrayJoin029
     * @tc.desc Verify join() returns '251' for single value 251
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([251]);
      const result: string = arr.join();
      expect(result).assertEqual('251');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_3000
     * @tc.name testUint8ArrayJoin030
     * @tc.desc Verify join() returns '5' for single value 5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([5]);
      const result: string = arr.join();
      expect(result).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_3100
     * @tc.name testUint8ArrayJoin031
     * @tc.desc Verify join() returns '250' for single value 250
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([250]);
      const result: string = arr.join();
      expect(result).assertEqual('250');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_3200
     * @tc.name testUint8ArrayJoin032
     * @tc.desc Verify join() returns '6' for single value 6
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([6]);
      const result: string = arr.join();
      expect(result).assertEqual('6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_3300
     * @tc.name testUint8ArrayJoin033
     * @tc.desc Verify join() returns '249' for single value 249
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([249]);
      const result: string = arr.join();
      expect(result).assertEqual('249');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_3400
     * @tc.name testUint8ArrayJoin034
     * @tc.desc Verify join() returns '7' for single value 7
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([7]);
      const result: string = arr.join();
      expect(result).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_3500
     * @tc.name testUint8ArrayJoin035
     * @tc.desc Verify join() returns '248' for single value 248
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([248]);
      const result: string = arr.join();
      expect(result).assertEqual('248');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_3600
     * @tc.name testUint8ArrayJoin036
     * @tc.desc Verify join() returns '8' for single value 8
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([8]);
      const result: string = arr.join();
      expect(result).assertEqual('8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_3700
     * @tc.name testUint8ArrayJoin037
     * @tc.desc Verify join() returns '247' for single value 247
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([247]);
      const result: string = arr.join();
      expect(result).assertEqual('247');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_3800
     * @tc.name testUint8ArrayJoin038
     * @tc.desc Verify join() returns '9' for single value 9
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([9]);
      const result: string = arr.join();
      expect(result).assertEqual('9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_3900
     * @tc.name testUint8ArrayJoin039
     * @tc.desc Verify join() returns '246' for single value 246
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([246]);
      const result: string = arr.join();
      expect(result).assertEqual('246');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_4000
     * @tc.name testUint8ArrayJoin040
     * @tc.desc Verify join() returns '10' for single value 10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([10]);
      const result: string = arr.join();
      expect(result).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_4100
     * @tc.name testUint8ArrayJoin041
     * @tc.desc Verify join() returns '245' for single value 245
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([245]);
      const result: string = arr.join();
      expect(result).assertEqual('245');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_4200
     * @tc.name testUint8ArrayJoin042
     * @tc.desc Verify join() returns '11' for single value 11
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([11]);
      const result: string = arr.join();
      expect(result).assertEqual('11');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_4300
     * @tc.name testUint8ArrayJoin043
     * @tc.desc Verify join() returns '244' for single value 244
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([244]);
      const result: string = arr.join();
      expect(result).assertEqual('244');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_4400
     * @tc.name testUint8ArrayJoin044
     * @tc.desc Verify join() returns '12' for single value 12
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([12]);
      const result: string = arr.join();
      expect(result).assertEqual('12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_4500
     * @tc.name testUint8ArrayJoin045
     * @tc.desc Verify join() returns '243' for single value 243
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([243]);
      const result: string = arr.join();
      expect(result).assertEqual('243');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_4600
     * @tc.name testUint8ArrayJoin046
     * @tc.desc Verify join() returns '13' for single value 13
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([13]);
      const result: string = arr.join();
      expect(result).assertEqual('13');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_4700
     * @tc.name testUint8ArrayJoin047
     * @tc.desc Verify join() returns '242' for single value 242
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([242]);
      const result: string = arr.join();
      expect(result).assertEqual('242');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_4800
     * @tc.name testUint8ArrayJoin048
     * @tc.desc Verify join() returns '14' for single value 14
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([14]);
      const result: string = arr.join();
      expect(result).assertEqual('14');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_4900
     * @tc.name testUint8ArrayJoin049
     * @tc.desc Verify join() returns '241' for single value 241
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([241]);
      const result: string = arr.join();
      expect(result).assertEqual('241');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_5000
     * @tc.name testUint8ArrayJoin050
     * @tc.desc Verify join() returns '15' for single value 15
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([15]);
      const result: string = arr.join();
      expect(result).assertEqual('15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_5100
     * @tc.name testUint8ArrayJoin051
     * @tc.desc Verify join() returns '240' for single value 240
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([240]);
      const result: string = arr.join();
      expect(result).assertEqual('240');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_5200
     * @tc.name testUint8ArrayJoin052
     * @tc.desc Verify join() returns '16' for single value 16
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([16]);
      const result: string = arr.join();
      expect(result).assertEqual('16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_5300
     * @tc.name testUint8ArrayJoin053
     * @tc.desc Verify join() returns '239' for single value 239
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([239]);
      const result: string = arr.join();
      expect(result).assertEqual('239');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_5400
     * @tc.name testUint8ArrayJoin054
     * @tc.desc Verify join() returns '17' for single value 17
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([17]);
      const result: string = arr.join();
      expect(result).assertEqual('17');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_5500
     * @tc.name testUint8ArrayJoin055
     * @tc.desc Verify join() returns '238' for single value 238
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([238]);
      const result: string = arr.join();
      expect(result).assertEqual('238');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_5600
     * @tc.name testUint8ArrayJoin056
     * @tc.desc Verify join() returns '18' for single value 18
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([18]);
      const result: string = arr.join();
      expect(result).assertEqual('18');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_5700
     * @tc.name testUint8ArrayJoin057
     * @tc.desc Verify join() returns '237' for single value 237
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([237]);
      const result: string = arr.join();
      expect(result).assertEqual('237');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_5800
     * @tc.name testUint8ArrayJoin058
     * @tc.desc Verify join() returns '19' for single value 19
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([19]);
      const result: string = arr.join();
      expect(result).assertEqual('19');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_5900
     * @tc.name testUint8ArrayJoin059
     * @tc.desc Verify join() returns '236' for single value 236
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([236]);
      const result: string = arr.join();
      expect(result).assertEqual('236');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_6000
     * @tc.name testUint8ArrayJoin060
     * @tc.desc Verify join() returns '20' for single value 20
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([20]);
      const result: string = arr.join();
      expect(result).assertEqual('20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_6100
     * @tc.name testUint8ArrayJoin061
     * @tc.desc Verify join() returns '235' for single value 235
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([235]);
      const result: string = arr.join();
      expect(result).assertEqual('235');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_6200
     * @tc.name testUint8ArrayJoin062
     * @tc.desc Verify join() returns '21' for single value 21
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([21]);
      const result: string = arr.join();
      expect(result).assertEqual('21');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_6300
     * @tc.name testUint8ArrayJoin063
     * @tc.desc Verify join() returns '234' for single value 234
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([234]);
      const result: string = arr.join();
      expect(result).assertEqual('234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_6400
     * @tc.name testUint8ArrayJoin064
     * @tc.desc Verify join() returns '22' for single value 22
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([22]);
      const result: string = arr.join();
      expect(result).assertEqual('22');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_6500
     * @tc.name testUint8ArrayJoin065
     * @tc.desc Verify join() returns '233' for single value 233
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([233]);
      const result: string = arr.join();
      expect(result).assertEqual('233');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_6600
     * @tc.name testUint8ArrayJoin066
     * @tc.desc Verify join() returns '23' for single value 23
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([23]);
      const result: string = arr.join();
      expect(result).assertEqual('23');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_6700
     * @tc.name testUint8ArrayJoin067
     * @tc.desc Verify join() returns '24' for single value 24
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([24]);
      const result: string = arr.join();
      expect(result).assertEqual('24');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_6800
     * @tc.name testUint8ArrayJoin068
     * @tc.desc Verify join() returns '25' for single value 25
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([25]);
      const result: string = arr.join();
      expect(result).assertEqual('25');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_6900
     * @tc.name testUint8ArrayJoin069
     * @tc.desc Verify join() returns '26' for single value 26
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([26]);
      const result: string = arr.join();
      expect(result).assertEqual('26');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_7000
     * @tc.name testUint8ArrayJoin070
     * @tc.desc Verify join() returns '0' for value 256 (truncated to 0)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([256]);
      const result: string = arr.join();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_7100
     * @tc.name testUint8ArrayJoin071
     * @tc.desc Verify join() returns '0' for value 512 (truncated to 0)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([512]);
      const result: string = arr.join();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_7200
     * @tc.name testUint8ArrayJoin072
     * @tc.desc Verify join() returns '253' for value 253 (max - 2)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([253]);
      const result: string = arr.join();
      expect(result).assertEqual('253');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_7300
     * @tc.name testUint8ArrayJoin073
     * @tc.desc Verify two views sharing same ArrayBuffer have consistent join results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const firstView: Uint8Array = new Uint8Array(buf);
      const secondView: Uint8Array = new Uint8Array(buf);
      firstView.set([10], 0);
      firstView.set([20], 1);
      firstView.set([30], 2);
      const firstResult: string = firstView.join();
      const secondResult: string = secondView.join();
      expect(firstResult).assertEqual(secondResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_7400
     * @tc.name testUint8ArrayJoin074
     * @tc.desc Verify subarray view join is independent from original view
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const sub: Uint8Array = arr.subarray(1, 4);
      const result: string = sub.join();
      expect(result).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_JOIN_7500
     * @tc.name testUint8ArrayJoin075
     * @tc.desc Verify join() does not throw exception on empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayJoin075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      let threw: boolean = false;
      try {
        arr.join();
      } catch (e) {
        threw = true;
        expect(e.name).assertEqual('Error');
      }
      expect(threw).assertFalse();
    });
  });
}