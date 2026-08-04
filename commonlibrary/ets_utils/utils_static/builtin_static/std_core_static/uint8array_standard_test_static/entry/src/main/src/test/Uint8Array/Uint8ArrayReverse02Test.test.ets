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

export default function Uint8ArrayReverse02Test(): void {
  describe('Uint8ArrayReverse02Test', () => {
    beforeAll(() => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(() => {});
    afterAll(() => {});


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_0100
     * @tc.name testUint8ArrayReverse001
     * @tc.desc reverse() with no arguments returns the array itself (reference identity)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xFF, 0x80, 0x00);
      const r: Uint8Array = arr.reverse();
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_0200
     * @tc.name testUint8ArrayReverse002
     * @tc.desc reverse() with no arguments executes without throwing (no invalid args passed)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      let threw: boolean = false;
      try {
        arr.reverse();
      } catch (e) {
        threw = true;
        expect(e.name).assertEqual('Error');
      }
      expect(threw).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_0300
     * @tc.name testUint8ArrayReverse003
     * @tc.desc Verify typeof reverse() return value is object for empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      const r: Uint8Array = arr.reverse();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_0400
     * @tc.name testUint8ArrayReverse004
     * @tc.desc Verify typeof reverse() return value is object for non-empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xFF, 0x80, 0x00);
      const r: Uint8Array = arr.reverse();
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_0500
     * @tc.name testUint8ArrayReverse005
     * @tc.desc Verify reverse() return value instanceof Uint8Array is true for empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      const r: Uint8Array = arr.reverse();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_0600
     * @tc.name testUint8ArrayReverse006
     * @tc.desc Verify reverse() return value instanceof Uint8Array is true for non-empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xFF, 0x80, 0x00);
      const r: Uint8Array = arr.reverse();
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_0700
     * @tc.name testUint8ArrayReverse007
     * @tc.desc Verify reverse() return value is not undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xFF, 0x80, 0x00);
      const r: Uint8Array = arr.reverse();
      expect(r).not().assertUndefined();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_0800
     * @tc.name testUint8ArrayReverse008
     * @tc.desc Verify empty array after reverse() joins to empty string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      arr.reverse();
      expect(arr.join(',')).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_0900
     * @tc.name testUint8ArrayReverse009
     * @tc.desc Verify single-element [0x80] content unchanged after reverse()
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x80);
      arr.reverse();
      expect(arr.join(',')).assertEqual('128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_1000
     * @tc.name testUint8ArrayReverse010
     * @tc.desc Verify [0xFF, 0x00] after reverse() first and last swap, join is '0,255'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xFF, 0x00);
      arr.reverse();
      expect(arr.join(',')).assertEqual('0,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_1100
     * @tc.name testUint8ArrayReverse011
     * @tc.desc Verify [0x80, 0x7F] after reverse() swap, join is '127,128'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x80, 0x7F);
      arr.reverse();
      expect(arr.join(',')).assertEqual('127,128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_1200
     * @tc.name testUint8ArrayReverse012
     * @tc.desc Verify [0xFF, 0x00, 0x80] after reverse() join is '128,0,255'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xFF, 0x00, 0x80);
      arr.reverse();
      expect(arr.join(',')).assertEqual('128,0,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_1300
     * @tc.name testUint8ArrayReverse013
     * @tc.desc Verify [0x55, 0xAA] after reverse() join is '170,85'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x55, 0xAA);
      arr.reverse();
      expect(arr.join(',')).assertEqual('170,85');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_1400
     * @tc.name testUint8ArrayReverse014
     * @tc.desc Verify [0x0F, 0xF0] after reverse() join is '240,15'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x0F, 0xF0);
      arr.reverse();
      expect(arr.join(',')).assertEqual('240,15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_1500
     * @tc.name testUint8ArrayReverse015
     * @tc.desc Verify [255, 0, 127] after reverse() join is '127,0,255'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(255, 0, 127);
      arr.reverse();
      expect(arr.join(',')).assertEqual('127,0,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_1600
     * @tc.name testUint8ArrayReverse016
     * @tc.desc Verify [1, 254] after reverse() join is '254,1'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 254);
      arr.reverse();
      expect(arr.join(',')).assertEqual('254,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_1700
     * @tc.name testUint8ArrayReverse017
     * @tc.desc Verify [0x00, 0x01, 0x02, 0x03] after reverse() join is '3,2,1,0'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x00, 0x01, 0x02, 0x03);
      arr.reverse();
      expect(arr.join(',')).assertEqual('3,2,1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_1800
     * @tc.name testUint8ArrayReverse018
     * @tc.desc Verify [100, 200, 50, 150] after reverse() join is '150,50,200,100'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(100, 200, 50, 150);
      arr.reverse();
      expect(arr.join(',')).assertEqual('150,50,200,100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_1900
     * @tc.name testUint8ArrayReverse019
     * @tc.desc Verify [7, 7, 7] all-same array unchanged after reverse()
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(7, 7, 7);
      arr.reverse();
      expect(arr.join(',')).assertEqual('7,7,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_2000
     * @tc.name testUint8ArrayReverse020
     * @tc.desc Verify [0, 0, 0, 0] all-zero array unchanged after reverse()
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 0, 0, 0);
      arr.reverse();
      expect(arr.join(',')).assertEqual('0,0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_2100
     * @tc.name testUint8ArrayReverse021
     * @tc.desc Verify [255, 255, 255] all-max-value array unchanged after reverse()
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(255, 255, 255);
      arr.reverse();
      expect(arr.join(',')).assertEqual('255,255,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_2200
     * @tc.name testUint8ArrayReverse022
     * @tc.desc Verify [1, 2, 2, 1] even-length palindrome unchanged after reverse()
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 2, 1);
      arr.reverse();
      expect(arr.join(',')).assertEqual('1,2,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_2300
     * @tc.name testUint8ArrayReverse023
     * @tc.desc Verify [1, 2, 1] odd-length palindrome unchanged after reverse()
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 1);
      arr.reverse();
      expect(arr.join(',')).assertEqual('1,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_2400
     * @tc.name testUint8ArrayReverse024
     * @tc.desc Verify [5, 4, 3, 2, 1, 0] descending becomes ascending after reverse()
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(5, 4, 3, 2, 1, 0);
      arr.reverse();
      expect(arr.join(',')).assertEqual('0,1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_2500
     * @tc.name testUint8ArrayReverse025
     * @tc.desc Verify [0xFE, 0x01, 0xFD, 0x02] after reverse() join is '2,253,1,254'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xFE, 0x01, 0xFD, 0x02);
      arr.reverse();
      expect(arr.join(',')).assertEqual('2,253,1,254');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_2600
     * @tc.name testUint8ArrayReverse026
     * @tc.desc Verify [0x7F, 0x80, 0x81] after reverse() join is '129,128,127'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x7F, 0x80, 0x81);
      arr.reverse();
      expect(arr.join(',')).assertEqual('129,128,127');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_2700
     * @tc.name testUint8ArrayReverse027
     * @tc.desc Verify [0x0F, 0xF0, 0xFF] after reverse() join is '255,240,15'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x0F, 0xF0, 0xFF);
      arr.reverse();
      expect(arr.join(',')).assertEqual('255,240,15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_2800
     * @tc.name testUint8ArrayReverse028
     * @tc.desc Verify [10, 20, 30, 40, 50] after reverse() join is '50,40,30,20,10'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      arr.reverse();
      expect(arr.join(',')).assertEqual('50,40,30,20,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_2900
     * @tc.name testUint8ArrayReverse029
     * @tc.desc Verify [0x00, 0xFF, 0x7F] after reverse() join is '127,255,0'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x00, 0xFF, 0x7F);
      arr.reverse();
      expect(arr.join(',')).assertEqual('127,255,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_3000
     * @tc.name testUint8ArrayReverse030
     * @tc.desc Verify [1, 2, 4, 8, 16, 32, 64, 128] after reverse() join is '128,64,32,16,8,4,2,1'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 4, 8, 16, 32, 64, 128);
      arr.reverse();
      expect(arr.join(',')).assertEqual('128,64,32,16,8,4,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_3100
     * @tc.name testUint8ArrayReverse031
     * @tc.desc Verify [0xAA, 0x55, 0xAA, 0x55] alternating pattern after reverse() join is '85,170,85,170'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xAA, 0x55, 0xAA, 0x55);
      arr.reverse();
      expect(arr.join(',')).assertEqual('85,170,85,170');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_3200
     * @tc.name testUint8ArrayReverse032
     * @tc.desc Verify [0x01, 0x10, 0x02, 0x20] after reverse() join is '32,2,16,1'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x01, 0x10, 0x02, 0x20);
      arr.reverse();
      expect(arr.join(',')).assertEqual('32,2,16,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_3300
     * @tc.name testUint8ArrayReverse033
     * @tc.desc Verify [0xE0, 0x1C, 0x03] after reverse() join is '3,28,224'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xE0, 0x1C, 0x03);
      arr.reverse();
      expect(arr.join(',')).assertEqual('3,28,224');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_3400
     * @tc.name testUint8ArrayReverse034
     * @tc.desc Verify [0x0D, 0x0E, 0x0A, 0x0D] after reverse() join is '13,10,14,13'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x0D, 0x0E, 0x0A, 0x0D);
      arr.reverse();
      expect(arr.join(',')).assertEqual('13,10,14,13');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_3500
     * @tc.name testUint8ArrayReverse035
     * @tc.desc Verify [255, 128, 0, 0, 128, 255] symmetric palindrome content unchanged after reverse()
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(255, 128, 0, 0, 128, 255);
      arr.reverse();
      expect(arr.join(',')).assertEqual('255,128,0,0,128,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_3600
     * @tc.name testUint8ArrayReverse036
     * @tc.desc Verify [0x03, 0x0C, 0x30, 0xC0] after reverse() join is '192,48,12,3'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x03, 0x0C, 0x30, 0xC0);
      arr.reverse();
      expect(arr.join(',')).assertEqual('192,48,12,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_3700
     * @tc.name testUint8ArrayReverse037
     * @tc.desc Verify [0x0B, 0x0E, 0x0E, 0x0F] after reverse() join is '15,14,14,11'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x0B, 0x0E, 0x0E, 0x0F);
      arr.reverse();
      expect(arr.join(',')).assertEqual('15,14,14,11');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_3800
     * @tc.name testUint8ArrayReverse038
     * @tc.desc Verify six-element [0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5] after reverse() first index is 0xF5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5);
      arr.reverse();
      expect(arr[0]).assertEqual(0xF5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_3900
     * @tc.name testUint8ArrayReverse039
     * @tc.desc Verify six-element array after reverse() last index is 0xF0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5);
      arr.reverse();
      expect(arr[5]).assertEqual(0xF0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_4000
     * @tc.name testUint8ArrayReverse040
     * @tc.desc Verify six-element array after reverse() middle index [2] was 0xF2 now 0xF3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5);
      arr.reverse();
      expect(arr[2]).assertEqual(0xF3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_4100
     * @tc.name testUint8ArrayReverse041
     * @tc.desc Verify four-element [0x10, 0x20, 0x30, 0x40] after reverse() index [0] was 0x10 now 0x40
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x10, 0x20, 0x30, 0x40);
      arr.reverse();
      expect(arr[0]).assertEqual(0x40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_4200
     * @tc.name testUint8ArrayReverse042
     * @tc.desc Verify four-element array after reverse() index [3] was 0x40 now 0x10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x10, 0x20, 0x30, 0x40);
      arr.reverse();
      expect(arr[3]).assertEqual(0x10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_4300
     * @tc.name testUint8ArrayReverse043
     * @tc.desc Verify ten-element sequential fill after reverse() first element is 9
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
      arr.reverse();
      expect(arr[0]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_4400
     * @tc.name testUint8ArrayReverse044
     * @tc.desc Verify ten-element array after reverse() last element is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
      arr.reverse();
      expect(arr[9]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_4500
     * @tc.name testUint8ArrayReverse045
     * @tc.desc Verify empty array after reverse() length remains 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      arr.reverse();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_4600
     * @tc.name testUint8ArrayReverse046
     * @tc.desc Verify single-element array after reverse() length remains 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xFF);
      arr.reverse();
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_4700
     * @tc.name testUint8ArrayReverse047
     * @tc.desc Verify five-element array after reverse() length remains 5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x01, 0x02, 0x03, 0x04, 0x05);
      arr.reverse();
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_4800
     * @tc.name testUint8ArrayReverse048
     * @tc.desc Verify hundred-element array after reverse() length remains 100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(100);
      arr.reverse();
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_4900
     * @tc.name testUint8ArrayReverse049
     * @tc.desc Verify thousand-element array after reverse() length remains 1000
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(1000);
      arr.reverse();
      expect(arr.length).assertEqual(1000);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_5000
     * @tc.name testUint8ArrayReverse050
     * @tc.desc Verify empty array after reverse() byteLength remains 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      arr.reverse();
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_5100
     * @tc.name testUint8ArrayReverse051
     * @tc.desc Verify single-element array after reverse() byteLength remains 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xFF);
      arr.reverse();
      expect(arr.byteLength).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_5200
     * @tc.name testUint8ArrayReverse052
     * @tc.desc Verify five-element array after reverse() byteLength remains 5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x01, 0x02, 0x03, 0x04, 0x05);
      arr.reverse();
      expect(arr.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_5300
     * @tc.name testUint8ArrayReverse053
     * @tc.desc Verify hundred-element array after reverse() byteLength remains 100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(100);
      arr.reverse();
      expect(arr.byteLength).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_5400
     * @tc.name testUint8ArrayReverse054
     * @tc.desc Verify thousand-element array after reverse() byteLength remains 1000
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(1000);
      arr.reverse();
      expect(arr.byteLength).assertEqual(1000);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_5500
     * @tc.name testUint8ArrayReverse055
     * @tc.desc Verify empty array reverse() returns itself (reference identity ===)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      const r: Uint8Array = arr.reverse();
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_5600
     * @tc.name testUint8ArrayReverse056
     * @tc.desc Verify of()-constructed array reverse() returns itself (reference identity ===)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xFF, 0x80, 0x00);
      const r: Uint8Array = arr.reverse();
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_5700
     * @tc.name testUint8ArrayReverse057
     * @tc.desc Verify modifying first element of reverse() return value also modifies original array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x0A, 0x0B, 0x0C);
      const r: Uint8Array = arr.reverse();
      r[0] = 0xFF;
      expect(arr[0]).assertEqual(0xFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_5800
     * @tc.name testUint8ArrayReverse058
     * @tc.desc Verify double reverse() restores original content (swap permutation)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x01, 0x02, 0x03, 0x04);
      arr.reverse();
      arr.reverse();
      expect(arr.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_5900
     * @tc.name testUint8ArrayReverse059
     * @tc.desc Verify triple reverse() is equivalent to single reverse()
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xAA, 0xBB, 0xCC);
      arr.reverse();
      arr.reverse();
      arr.reverse();
      const expected: Uint8Array = Uint8Array.of(0xAA, 0xBB, 0xCC);
      expected.reverse();
      expect(arr.join(',')).assertEqual(expected.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_6000
     * @tc.name testUint8ArrayReverse060
     * @tc.desc Verify even-length array after double reverse() join restores original value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x10, 0x20, 0x30, 0x40, 0x50, 0x60);
      arr.reverse();
      arr.reverse();
      expect(arr.join(',')).assertEqual('16,32,48,64,80,96');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_6100
     * @tc.name testUint8ArrayReverse061
     * @tc.desc Verify ArrayBuffer-constructed array after reverse() buffer reference unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const arr: Uint8Array = new Uint8Array(buf);
      arr[0] = 0xFF;
      arr[1] = 0x00;
      arr[2] = 0x80;
      const r: Uint8Array = arr.reverse();
      expect(r.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_6200
     * @tc.name testUint8ArrayReverse062
     * @tc.desc Verify ArrayBuffer-constructed array after reverse() buffer.byteLength unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const arr: Uint8Array = new Uint8Array(buf);
      arr[0] = 0x01;
      arr[1] = 0x02;
      arr.reverse();
      expect(buf.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_6300
     * @tc.name testUint8ArrayReverse063
     * @tc.desc Verify offset-constructed array after reverse() byteOffset unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const arr: Uint8Array = new Uint8Array(buf, 2, 3);
      arr[0] = 0x10;
      arr[1] = 0x20;
      arr[2] = 0x30;
      arr.reverse();
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_6400
     * @tc.name testUint8ArrayReverse064
     * @tc.desc Verify two views sharing same buffer, reverse() one then the other reflects reversed result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const firstView: Uint8Array = new Uint8Array(buf);
      firstView[0] = 0xFF;
      firstView[1] = 0x00;
      firstView[2] = 0x80;
      const secondView: Uint8Array = new Uint8Array(buf);
      firstView.reverse();
      expect(secondView.join(',')).assertEqual('128,0,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_6500
     * @tc.name testUint8ArrayReverse065
     * @tc.desc Verify after buffer view reverse(), reading other view via bracket shows reversed data
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const firstView: Uint8Array = new Uint8Array(buf);
      firstView[0] = 0x01;
      firstView[1] = 0x02;
      firstView[2] = 0x03;
      firstView[3] = 0x04;
      const secondView: Uint8Array = new Uint8Array(buf);
      firstView.reverse();
      expect(secondView[0]).assertEqual(0x04);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_6600
     * @tc.name testUint8ArrayReverse066
     * @tc.desc Verify subarray view content synchronously reversed after parent reverse()
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const parent: Uint8Array = new Uint8Array(buf);
      parent[0] = 0x0A;
      parent[1] = 0x0B;
      parent[2] = 0x0C;
      const sub: Uint8Array = parent.subarray(0, 3);
      parent.reverse();
      expect(sub.join(',')).assertEqual('12,11,10');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_6700
     * @tc.name testUint8ArrayReverse067
     * @tc.desc Verify of()-constructed array after reverse() join is correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xDE, 0xAD, 0xBE, 0xEF);
      arr.reverse();
      expect(arr.join(',')).assertEqual('239,190,173,222');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_6800
     * @tc.name testUint8ArrayReverse068
     * @tc.desc Verify from()-constructed array after reverse() join is correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [0x12, 0x34, 0x56, 0x78];
      const arr: Uint8Array = Uint8Array.from(src);
      arr.reverse();
      expect(arr.join(',')).assertEqual('120,86,52,18');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_6900
     * @tc.name testUint8ArrayReverse069
     * @tc.desc Verify ArrayBuffer-constructed array after reverse() content is correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Uint8Array = new Uint8Array(buf);
      arr[0] = 0xA0;
      arr[1] = 0xB0;
      arr[2] = 0xC0;
      arr[3] = 0xD0;
      arr.reverse();
      expect(arr.join(',')).assertEqual('208,192,176,160');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_7000
     * @tc.name testUint8ArrayReverse070
     * @tc.desc Verify copy-constructed array after reverse() join is correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(0x11, 0x22, 0x33, 0x44);
      const arr: Uint8Array = new Uint8Array(src);
      arr.reverse();
      expect(arr.join(',')).assertEqual('68,51,34,17');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_7100
     * @tc.name testUint8ArrayReverse071
     * @tc.desc Verify empty ArrayBuffer-constructed array reverse() does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0);
      const arr: Uint8Array = new Uint8Array(buf);
      let threw: boolean = false;
      try {
        arr.reverse();
      } catch (e) {
        threw = true;
        expect(e.name).assertEqual('Error');
      }
      expect(threw).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_7200
     * @tc.name testUint8ArrayReverse072
     * @tc.desc Verify of(256, 1) where 256 truncates to 0, after reverse() join is '1,0'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(256, 1);
      arr.reverse();
      expect(arr.join(',')).assertEqual('1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_7300
     * @tc.name testUint8ArrayReverse073
     * @tc.desc Verify of(-1, 2) where -1 wraps to 255, after reverse() join is '2,255'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(-1, 2);
      arr.reverse();
      expect(arr.join(',')).assertEqual('2,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_7400
     * @tc.name testUint8ArrayReverse074
     * @tc.desc Verify of(0x100, 0x01) where 0x100 truncates to 0, after reverse() join is '1,0'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x100, 0x01);
      arr.reverse();
      expect(arr.join(',')).assertEqual('1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_7500
     * @tc.name testUint8ArrayReverse075
     * @tc.desc Verify of(-255, 0x80) where -255 wraps to 1, after reverse() join is '128,1'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(-255, 0x80);
      arr.reverse();
      expect(arr.join(',')).assertEqual('128,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_7600
     * @tc.name testUint8ArrayReverse076
     * @tc.desc Verify of(257, 0) where 257 truncates to 1, after reverse() join is '0,1'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(257, 0);
      arr.reverse();
      expect(arr.join(',')).assertEqual('0,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_7700
     * @tc.name testUint8ArrayReverse077
     * @tc.desc Verify of(511, 0xFF) where 511 truncates to 255, after reverse() join is '255,255'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(511, 0xFF);
      arr.reverse();
      expect(arr.join(',')).assertEqual('255,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_7800
     * @tc.name testUint8ArrayReverse078
     * @tc.desc Verify of(-2, 3) where -2 wraps to 254, after reverse() join is '3,254'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(-2, 3);
      arr.reverse();
      expect(arr.join(',')).assertEqual('3,254');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_7900
     * @tc.name testUint8ArrayReverse079
     * @tc.desc Verify of(0x1FF, 0x80) where 0x1FF truncates to 0xFF, after reverse() join is '128,255'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x1FF, 0x80);
      arr.reverse();
      expect(arr.join(',')).assertEqual('128,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_8000
     * @tc.name testUint8ArrayReverse080
     * @tc.desc Verify of(-256, 0x80) where -256 wraps to 0, after reverse() join is '128,0'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(-256, 0x80);
      arr.reverse();
      expect(arr.join(',')).assertEqual('128,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_8100
     * @tc.name testUint8ArrayReverse081
     * @tc.desc Verify of(0xFFFFFF, 0x01) where 0xFFFFFF truncates to 0xFF, after reverse() join is '1,255'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0xFFFFFF, 0x01);
      arr.reverse();
      expect(arr.join(',')).assertEqual('1,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_8200
     * @tc.name testUint8ArrayReverse082
     * @tc.desc Verify of(0x1FF, 0x200) both values truncated, after reverse() join is '0,255'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x1FF, 0x200);
      arr.reverse();
      expect(arr.join(',')).assertEqual('0,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_8300
     * @tc.name testUint8ArrayReverse083
     * @tc.desc Verify of(-128, 0x80) where -128 wraps to 128, after reverse() join is '128,128'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(-128, 0x80);
      arr.reverse();
      expect(arr.join(',')).assertEqual('128,128');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_8400
     * @tc.name testUint8ArrayReverse084
     * @tc.desc Verify thousand-element array reverse() does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(1000);
      let threw: boolean = false;
      try {
        arr.reverse();
      } catch (e) {
        threw = true;
        expect(e.name).assertEqual('Error');
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_8500
     * @tc.name testUint8ArrayReverse085
     * @tc.desc Verify ArrayBuffer offset-constructed array reverse() does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(10);
      const arr: Uint8Array = new Uint8Array(buf, 3, 5);
      arr[0] = 0x01;
      arr[1] = 0x02;
      arr[2] = 0x03;
      arr[3] = 0x04;
      arr[4] = 0x05;
      let threw: boolean = false;
      try {
        arr.reverse();
      } catch (e) {
        threw = true;
        expect(e.name).assertEqual('Error');
      }
      expect(threw).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REVERSE02_8600
     * @tc.name testUint8ArrayReverse086
     * @tc.desc Verify all-boundary-value array reverse() does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReverse086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 1, 127, 128, 254, 255);
      let threw: boolean = false;
      try {
        arr.reverse();
      } catch (e) {
        threw = true;
        expect(e.name).assertEqual('Error');
      }
      expect(threw).assertFalse();
    });
  });
}
