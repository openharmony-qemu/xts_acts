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

export default function Uint8ArrayToStringTest(): void {
  describe('Uint8ArrayToStringTest', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_0100
     * @tc.name testUint8ArrayToString001
     * @tc.desc Verify toString() with no arguments returns comma-separated string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: string = arr.toString();
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_0200
     * @tc.name testUint8ArrayToString002
     * @tc.desc Verify toString on empty Uint8Array(0) returns empty string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0);
      let result: string = arr.toString();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_0300
     * @tc.name testUint8ArrayToString003
     * @tc.desc Verify toString on empty Uint8Array from literal empty array returns empty string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([]);
      let result: string = arr.toString();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_0400
     * @tc.name testUint8ArrayToString004
     * @tc.desc Verify toString on Uint8Array.of() empty returns empty string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of();
      let result: string = arr.toString();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_0500
     * @tc.name testUint8ArrayToString005
     * @tc.desc Verify toString on Uint8Array.from empty source returns empty string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.from([], (x: number): number => x);
      let result: string = arr.toString();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_0600
     * @tc.name testUint8ArrayToString006
     * @tc.desc Verify toString on Uint8Array from zero-length ArrayBuffer returns empty string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Uint8Array = new Uint8Array(buf);
      let result: string = arr.toString();
      expect(result).assertEqual('');
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_0700
     * @tc.name testUint8ArrayToString007
     * @tc.desc Verify toString with element 0 returns '0'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0]);
      let result: string = arr.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_0800
     * @tc.name testUint8ArrayToString008
     * @tc.desc Verify toString with max element 255 returns '255'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([255]);
      let result: string = arr.toString();
      expect(result).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_0900
     * @tc.name testUint8ArrayToString009
     * @tc.desc Verify toString with mid value 127 returns '127'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([127]);
      let result: string = arr.toString();
      expect(result).assertEqual('127');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_1000
     * @tc.name testUint8ArrayToString010
     * @tc.desc Verify toString with element 128 returns '128'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([128]);
      let result: string = arr.toString();
      expect(result).assertEqual('128');
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_1100
     * @tc.name testUint8ArrayToString011
     * @tc.desc Verify toString with element 1 returns '1'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1]);
      let result: string = arr.toString();
      expect(result).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_1200
     * @tc.name testUint8ArrayToString012
     * @tc.desc Verify toString with element 254 returns '254'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([254]);
      let result: string = arr.toString();
      expect(result).assertEqual('254');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_1300
     * @tc.name testUint8ArrayToString013
     * @tc.desc Verify toString with overflow 256 truncates to 0 returns '0'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([256]);
      let result: string = arr.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_1400
     * @tc.name testUint8ArrayToString014
     * @tc.desc Verify toString with -1 wraps to 255 returns '255'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([-1]);
      let result: string = arr.toString();
      expect(result).assertEqual('255');
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_1500
     * @tc.name testUint8ArrayToString015
     * @tc.desc Verify toString with hex literal 0x80 returns '128'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0x80]);
      let result: string = arr.toString();
      expect(result).assertEqual('128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_1600
     * @tc.name testUint8ArrayToString016
     * @tc.desc Verify toString with hex max 0xFF returns '255'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0xFF]);
      let result: string = arr.toString();
      expect(result).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_1700
     * @tc.name testUint8ArrayToString017
     * @tc.desc Verify toString with hex overflow 0x100 returns '0'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0x100]);
      let result: string = arr.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_1800
     * @tc.name testUint8ArrayToString018
     * @tc.desc Verify toString with scientific notation 1e2 returns '100'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1e2]);
      let result: string = arr.toString();
      expect(result).assertEqual('100');
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_1900
     * @tc.name testUint8ArrayToString019
     * @tc.desc Verify toString with NaN converts to 0 returns '0'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([Number.NaN]);
      let result: string = arr.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_2000
     * @tc.name testUint8ArrayToString020
     * @tc.desc Verify toString with float 3.5 truncates to 3 returns '3'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([3.5]);
      let result: string = arr.toString();
      expect(result).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_2100
     * @tc.name testUint8ArrayToString021
     * @tc.desc Verify toString with negative float -3.5 wraps to 253 returns '253'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([-3.5]);
      let result: string = arr.toString();
      expect(result).assertEqual('253');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_2200
     * @tc.name testUint8ArrayToString022
     * @tc.desc Verify toString with -0 converts to 0 returns '0'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([-0]);
      let result: string = arr.toString();
      expect(result).assertEqual('0');
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_2300
     * @tc.name testUint8ArrayToString023
     * @tc.desc Verify toString with binary literal 0b11111111 returns '255'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0b11111111]);
      let result: string = arr.toString();
      expect(result).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_2400
     * @tc.name testUint8ArrayToString024
     * @tc.desc Verify toString with float integer 1.0 returns '1'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1.0]);
      let result: string = arr.toString();
      expect(result).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_2500
     * @tc.name testUint8ArrayToString025
     * @tc.desc Verify toString with -128 wraps to 128 returns '128'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([-128]);
      let result: string = arr.toString();
      expect(result).assertEqual('128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_2600
     * @tc.name testUint8ArrayToString026
     * @tc.desc Verify toString with -255 wraps to 1 returns '1'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([-255]);
      let result: string = arr.toString();
      expect(result).assertEqual('1');
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_2700
     * @tc.name testUint8ArrayToString027
     * @tc.desc Verify toString with mixed boundary values [0,255,127,128]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 255, 127, 128]);
      let result: string = arr.toString();
      expect(result).assertEqual('0,255,127,128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_2800
     * @tc.name testUint8ArrayToString028
     * @tc.desc Verify toString with all overflow/wrap elements [256,-1,0x100]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([256, -1, 0x100]);
      let result: string = arr.toString();
      expect(result).assertEqual('0,255,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_2900
     * @tc.name testUint8ArrayToString029
     * @tc.desc Verify toString with all zero elements [0,0,0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 0, 0]);
      let result: string = arr.toString();
      expect(result).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_3000
     * @tc.name testUint8ArrayToString030
     * @tc.desc Verify toString with all max elements [255,255,255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([255, 255, 255]);
      let result: string = arr.toString();
      expect(result).assertEqual('255,255,255');
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_3100
     * @tc.name testUint8ArrayToString031
     * @tc.desc Verify toString with ten consecutive elements [1..10]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      let result: string = arr.toString();
      expect(result).assertEqual('1,2,3,4,5,6,7,8,9,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_3200
     * @tc.name testUint8ArrayToString032
     * @tc.desc Verify toString with negative, mid and overflow mix [-128,127,256]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([-128, 127, 256]);
      let result: string = arr.toString();
      expect(result).assertEqual('128,127,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_3300
     * @tc.name testUint8ArrayToString033
     * @tc.desc Verify toString with five zero elements [0,0,0,0,0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0, 0, 0, 0, 0]);
      let result: string = arr.toString();
      expect(result).assertEqual('0,0,0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_3400
     * @tc.name testUint8ArrayToString034
     * @tc.desc Verify toString with float truncation combination [3.5,2.7]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([3.5, 2.7]);
      let result: string = arr.toString();
      expect(result).assertEqual('3,2');
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_3500
     * @tc.name testUint8ArrayToString035
     * @tc.desc Verify toString with hex boundary combination [0x7F,0x80,0xFF]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0x7F, 0x80, 0xFF]);
      let result: string = arr.toString();
      expect(result).assertEqual('127,128,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_3600
     * @tc.name testUint8ArrayToString036
     * @tc.desc Verify toString with scientific notation combination [1e1,2e1,3e1]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1e1, 2e1, 3e1]);
      let result: string = arr.toString();
      expect(result).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_3700
     * @tc.name testUint8ArrayToString037
     * @tc.desc Verify toString with partial overflow combination [100,200,300]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([100, 200, 300]);
      let result: string = arr.toString();
      expect(result).assertEqual('100,200,44');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_3800
     * @tc.name testUint8ArrayToString038
     * @tc.desc Verify toString with multiple negative wrap combination [-1,-2,-3]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([-1, -2, -3]);
      let result: string = arr.toString();
      expect(result).assertEqual('255,254,253');
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_3900
     * @tc.name testUint8ArrayToString039
     * @tc.desc Verify toString with NaN and float combination [NaN,3.5,2.7]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([Number.NaN, 3.5, 2.7]);
      let result: string = arr.toString();
      expect(result).assertEqual('0,3,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_4000
     * @tc.name testUint8ArrayToString040
     * @tc.desc Verify toString with binary literal combination [0b1010,0b1111]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0b1010, 0b1111]);
      let result: string = arr.toString();
      expect(result).assertEqual('10,15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_4100
     * @tc.name testUint8ArrayToString041
     * @tc.desc Verify toString with large overflow combination [1000,2000,3000]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1000, 2000, 3000]);
      let result: string = arr.toString();
      expect(result).assertEqual('232,208,184');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_4200
     * @tc.name testUint8ArrayToString042
     * @tc.desc Verify toString with -0 and 0 combination [-0,0,-0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([-0, 0, -0]);
      let result: string = arr.toString();
      expect(result).assertEqual('0,0,0');
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_4300
     * @tc.name testUint8ArrayToString043
     * @tc.desc Verify toString with decimal precision combination [0.1,0.9,1.1]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0.1, 0.9, 1.1]);
      let result: string = arr.toString();
      expect(result).assertEqual('0,0,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_4400
     * @tc.name testUint8ArrayToString044
     * @tc.desc Verify toString with different construction from ArrayBuffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let uint8: Uint8Array = new Uint8Array(buf);
      uint8[0] = 1;
      uint8[1] = 2;
      uint8[2] = 3;
      let result: string = uint8.toString();
      expect(result).assertEqual('1,2,3');
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_4500
     * @tc.name testUint8ArrayToString045
     * @tc.desc Verify toString on Uint8Array from ArrayBuffer with byteOffset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let uint8: Uint8Array = new Uint8Array(buf, 2, 3);
      uint8[0] = 10;
      uint8[1] = 20;
      uint8[2] = 30;
      let result: string = uint8.toString();
      expect(result).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_4600
     * @tc.name testUint8ArrayToString046
     * @tc.desc Verify toString on Uint8Array.of with multiple values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let result: string = arr.toString();
      expect(result).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_4700
     * @tc.name testUint8ArrayToString047
     * @tc.desc Verify toString on Uint8Array.from with mapFn
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.from([1.0, 2.0, 3.0], (x: number): number => x * 2);
      let result: string = arr.toString();
      expect(result).assertEqual('2,4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_4800
     * @tc.name testUint8ArrayToString048
     * @tc.desc Verify toString on Uint8Array from existing Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint8Array = new Uint8Array([10, 20, 30]);
      let arr: Uint8Array = new Uint8Array(src);
      let result: string = arr.toString();
      expect(result).assertEqual('10,20,30');
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_4900
     * @tc.name testUint8ArrayToString049
     * @tc.desc Verify toString on Uint8Array from TypedArray
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2, 3]);
      let arr: Uint8Array = new Uint8Array(src);
      let result: string = arr.toString();
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_5000
     * @tc.name testUint8ArrayToString050
     * @tc.desc Verify toString on Uint8Array from Array with overflow
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([300, 400, 500]);
      let result: string = arr.toString();
      expect(result).assertEqual('44,144,244');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_5100
     * @tc.name testUint8ArrayToString051
     * @tc.desc Verify toString on Uint8Array from Array with negative values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([-10, -20, -30]);
      let result: string = arr.toString();
      expect(result).assertEqual('246,236,226');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_5200
     * @tc.name testUint8ArrayToString052
     * @tc.desc Verify toString on Uint8Array from Array with float values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1.5, 2.5, 3.5]);
      let result: string = arr.toString();
      expect(result).assertEqual('1,2,3');
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_5300
     * @tc.name testUint8ArrayToString053
     * @tc.desc Verify toString on Uint8Array from Array with NaN and Infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY]);
      let result: string = arr.toString();
      expect(result).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_5400
     * @tc.name testUint8ArrayToString054
     * @tc.desc Verify toString on Uint8Array from Array with decimal values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0.1, 0.2, 0.3]);
      let result: string = arr.toString();
      expect(result).assertEqual('0,0,0');
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_5500
     * @tc.name testUint8ArrayToString055
     * @tc.desc Verify toString after slice operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let sliced: Uint8Array = arr.slice(1, 3);
      let result: string = sliced.toString();
      expect(result).assertEqual('2,3');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_5600
     * @tc.name testUint8ArrayToString056
     * @tc.desc Verify toString after filter operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let filtered: Uint8Array = arr.filter((x: number): boolean => x > 2);
      let result: string = filtered.toString();
      expect(result).assertEqual('3,4,5');
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_5700
     * @tc.name testUint8ArrayToString057
     * @tc.desc Verify toString after map operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let mapped: Uint8Array = arr.map((x: number): number => x * 10);
      let result: string = mapped.toString();
      expect(result).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_5800
     * @tc.name testUint8ArrayToString058
     * @tc.desc Verify toString after reverse operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      arr.reverse();
      let result: string = arr.toString();
      expect(result).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_5900
     * @tc.name testUint8ArrayToString059
     * @tc.desc Verify toString after sort operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([3, 1, 2]);
      arr.sort();
      let result: string = arr.toString();
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_6000
     * @tc.name testUint8ArrayToString060
     * @tc.desc Verify toString after fill operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      arr.fill(7);
      let result: string = arr.toString();
      expect(result).assertEqual('7,7,7');
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_6100
     * @tc.name testUint8ArrayToString061
     * @tc.desc Verify toString after copyWithin operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3, 5);
      let result: string = arr.toString();
      expect(result).assertEqual('4,5,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_6200
     * @tc.name testUint8ArrayToString062
     * @tc.desc Verify toString after set operation from array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      arr.set([10, 20, 30]);
      let result: string = arr.toString();
      expect(result).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_6300
     * @tc.name testUint8ArrayToString063
     * @tc.desc Verify toString after set operation from TypedArray
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      let src: Uint8Array = new Uint8Array([100, 200, 255]);
      arr.set(src);
      let result: string = arr.toString();
      expect(result).assertEqual('100,200,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_6400
     * @tc.name testUint8ArrayToString064
     * @tc.desc Verify toString after toReversed operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let reversed: Uint8Array = arr.toReversed();
      let result: string = reversed.toString();
      expect(result).assertEqual('3,2,1');
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_6500
     * @tc.name testUint8ArrayToString065
     * @tc.desc Verify toString after toSorted operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([3, 1, 2]);
      let sorted: Uint8Array = arr.toSorted();
      let result: string = sorted.toString();
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_6600
     * @tc.name testUint8ArrayToString066
     * @tc.desc Verify toString after index assignment with boundary values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      arr[0] = 0;
      arr[1] = 255;
      arr[2] = 128;
      let result: string = arr.toString();
      expect(result).assertEqual('0,255,128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_6700
     * @tc.name testUint8ArrayToString067
     * @tc.desc Verify toString after forEach modification
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      arr.forEach((value: number, index: int): void => {
        arr[index] = value * 2;
      });
      let result: string = arr.toString();
      expect(result).assertEqual('2,4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_6800
     * @tc.name testUint8ArrayToString068
     * @tc.desc Verify toString after reduce operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let sum: number = arr.reduce((acc: number, val: number): number => acc + val, 0);
      expect(sum).assertEqual(6);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_6900
     * @tc.name testUint8ArrayToString069
     * @tc.desc Verify toString after reduceRight operation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: number = arr.reduceRight((acc: number, val: number): number => acc + val, 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_7000
     * @tc.name testUint8ArrayToString070
     * @tc.desc Verify toString after entries iteration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let iter: IterableIterator<[int, number]> = arr.entries();
      let first: IteratorResult<[int, number]> = iter.next();
      let val: [int, number] | undefined = first.value;
      if (val != undefined) {
        expect(val[1]).assertEqual(1);
      }
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_7100
     * @tc.name testUint8ArrayToString071
     * @tc.desc Verify toString returns string type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: string = arr.toString();
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_7200
     * @tc.name testUint8ArrayToString072
     * @tc.desc Verify toString result contains commas for multi-element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: string = arr.toString();
      let hasComma: boolean = result.includes(',');
      expect(hasComma).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_7300
     * @tc.name testUint8ArrayToString073
     * @tc.desc Verify toString result does not contain commas for single element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([42]);
      let result: string = arr.toString();
      let hasComma: boolean = result.includes(',');
      expect(hasComma).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_7400
     * @tc.name testUint8ArrayToString074
     * @tc.desc Verify toString result does not contain trailing comma
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let result: string = arr.toString();
      let endsWithComma: boolean = result.endsWith(',');
      expect(endsWithComma).assertFalse();
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_7500
     * @tc.name testUint8ArrayToString075
     * @tc.desc Verify toString with large overflow 999 truncates to 231
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([999]);
      let result: string = arr.toString();
      expect(result).assertEqual('231');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_7600
     * @tc.name testUint8ArrayToString076
     * @tc.desc Verify toString with negative overflow -256 wraps to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([-256]);
      let result: string = arr.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_7700
     * @tc.name testUint8ArrayToString077
     * @tc.desc Verify toString with float 0.999 truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([0.999]);
      let result: string = arr.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_7800
     * @tc.name testUint8ArrayToString078
     * @tc.desc Verify toString with negative float -0.999 truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([-0.999]);
      let result: string = arr.toString();
      expect(result).assertEqual('0');
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_7900
     * @tc.name testUint8ArrayToString079
     * @tc.desc Verify toString with Infinity converts to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([Number.POSITIVE_INFINITY]);
      let result: string = arr.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_8000
     * @tc.name testUint8ArrayToString080
     * @tc.desc Verify toString with -Infinity converts to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([Number.NEGATIVE_INFINITY]);
      let result: string = arr.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_8100
     * @tc.name testUint8ArrayToString081
     * @tc.desc Verify toString with very small negative -1e-10 truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([-1e-10]);
      let result: string = arr.toString();
      expect(result).assertEqual('0');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_8200
     * @tc.name testUint8ArrayToString082
     * @tc.desc Verify toString on view from same ArrayBuffer reflects changes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let view1: Uint8Array = new Uint8Array(buf);
      let view2: Uint8Array = new Uint8Array(buf);
      view1[0] = 42;
      let result: string = view2.toString();
      expect(result).assertEqual('42,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_8300
     * @tc.name testUint8ArrayToString083
     * @tc.desc Verify toString on subarray view reflects original changes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      let sub: Uint8Array = arr.subarray(1, 4);
      arr[2] = 99;
      let result: string = sub.toString();
      expect(result).assertEqual('2,99,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_8400
     * @tc.name testUint8ArrayToString084
     * @tc.desc Verify toString on slice is independent from original
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let sliced: Uint8Array = arr.slice(0, 2);
      arr[0] = 99;
      let result: string = sliced.toString();
      expect(result).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_8500
     * @tc.name testUint8ArrayToString085
     * @tc.desc Verify toString on buffer with offset view
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let full: Uint8Array = new Uint8Array(buf);
      full[0] = 10;
      full[1] = 20;
      full[2] = 30;
      full[3] = 40;
      full[4] = 50;
      let offsetView: Uint8Array = new Uint8Array(buf, 2, 2);
      let result: string = offsetView.toString();
      expect(result).assertEqual('30,40');
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_8600
     * @tc.name testUint8ArrayToString086
     * @tc.desc Verify toString on multiple views of same buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let firstView: Uint8Array = new Uint8Array(buf);
      let secondView: Uint8Array = new Uint8Array(buf);
      firstView[0] = 5;
      firstView[1] = 10;
      firstView[2] = 15;
      let result: string = secondView.toString();
      expect(result).assertEqual('5,10,15');
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_8700
     * @tc.name testUint8ArrayToString087
     * @tc.desc Verify toString with Number.MAX_VALUE truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([Number.MAX_VALUE]);
      let result: string = arr.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_8800
     * @tc.name testUint8ArrayToString088
     * @tc.desc Verify toString with Number.MIN_VALUE truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([Number.MIN_VALUE]);
      let result: string = arr.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_8900
     * @tc.name testUint8ArrayToString089
     * @tc.desc Verify toString with -Number.MAX_VALUE wraps to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([-Number.MAX_VALUE]);
      let result: string = arr.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_9000
     * @tc.name testUint8ArrayToString090
     * @tc.desc Verify toString with -Number.MIN_VALUE truncates to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([-Number.MIN_VALUE]);
      let result: string = arr.toString();
      expect(result).assertEqual('0');
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_9100
     * @tc.name testUint8ArrayToString091
     * @tc.desc Verify toString after index assignment with boundary value 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr[0] = 255;
      let result: string = arr.toString();
      expect(result).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_9200
     * @tc.name testUint8ArrayToString092
     * @tc.desc Verify toString after index assignment with overflow 256
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr[0] = 256;
      let result: string = arr.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_9300
     * @tc.name testUint8ArrayToString093
     * @tc.desc Verify toString after multiple index assignments
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(4);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      let result: string = arr.toString();
      expect(result).assertEqual('10,20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_9400
     * @tc.name testUint8ArrayToString094
     * @tc.desc Verify toString after index assignment with float truncation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr[0] = 7.9;
      let result: string = arr.toString();
      expect(result).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_9500
     * @tc.name testUint8ArrayToString095
     * @tc.desc Verify toString after index assignment with wrap value -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(1);
      arr[0] = -1;
      let result: string = arr.toString();
      expect(result).assertEqual('255');
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_9600
     * @tc.name testUint8ArrayToString096
     * @tc.desc Verify toString on 100-element zero array has correct length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(100);
      let result: string = arr.toString();
      expect(result.length).assertEqual(199);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_9700
     * @tc.name testUint8ArrayToString097
     * @tc.desc Verify toString on 100-element zero array first char is '0'
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(100);
      let result: string = arr.toString();
      expect(result[0]).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_9800
     * @tc.name testUint8ArrayToString098
     * @tc.desc Verify toString on single element array has no extra prefix
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([5]);
      let result: string = arr.toString();
      expect(result[0]).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_STRING_9900
     * @tc.name testUint8ArrayToString099
     * @tc.desc Verify toString never throws exception on empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToString099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0);
      let threw: boolean = false;
      try {
        arr.toString();
      } catch (e) {
        threw = true;
        expect(e.name).assertEqual('Error');
      }
      expect(threw).assertFalse();
    });
  });
}