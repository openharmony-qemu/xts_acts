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

export default function Uint8ArrayToReversedTest(): void {
  describe('Uint8ArrayToReversedTest', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_0100
     * @tc.name testUint8ArrayToReversed001
     * @tc.desc Verify toReversed with no arguments returns object type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let result: Uint8Array = arr.toReversed();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_0200
     * @tc.name testUint8ArrayToReversed002
     * @tc.desc Verify empty array toReversed returns length 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array();
      let result: Uint8Array = arr.toReversed();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_0300
     * @tc.name testUint8ArrayToReversed003
     * @tc.desc Verify empty array toReversed returns object type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array();
      let result: Object = arr.toReversed();
      expect(result.length).assertEqual(0);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_0400
     * @tc.name testUint8ArrayToReversed004
     * @tc.desc Verify empty array toReversed returns instanceof Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array();
      let result: Uint8Array = arr.toReversed();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_0500
     * @tc.name testUint8ArrayToReversed005
     * @tc.desc Verify empty array toReversed join returns empty string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array();
      let result: Uint8Array = arr.toReversed();
      expect(result.join()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_0600
     * @tc.name testUint8ArrayToReversed006
     * @tc.desc Verify empty array toReversed does not change original array length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array();
      arr.toReversed();
      expect(arr.length).assertEqual(0);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_0700
     * @tc.name testUint8ArrayToReversed007
     * @tc.desc Verify new Uint8Array(0) toReversed returns empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(0);
      let result: Uint8Array = arr.toReversed();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_0800
     * @tc.name testUint8ArrayToReversed008
     * @tc.desc Verify single element [0] toReversed first element is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_0900
     * @tc.name testUint8ArrayToReversed009
     * @tc.desc Verify single element [255] toReversed first element is 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(255);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(255);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_1000
     * @tc.name testUint8ArrayToReversed010
     * @tc.desc Verify single element [127] toReversed first element is 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(127);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_1100
     * @tc.name testUint8ArrayToReversed011
     * @tc.desc Verify single element [0x80] toReversed first element is 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0x80);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_1200
     * @tc.name testUint8ArrayToReversed012
     * @tc.desc Verify single element [0xFF] toReversed first element is 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0xFF);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(255);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_1300
     * @tc.name testUint8ArrayToReversed013
     * @tc.desc Verify single element [0x00] toReversed first element is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0x00);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_1400
     * @tc.name testUint8ArrayToReversed014
     * @tc.desc Verify single element [256] truncated to 0 then toReversed first element is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(256);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_1500
     * @tc.name testUint8ArrayToReversed015
     * @tc.desc Verify single element [-1] wraps to 255 then toReversed first element is 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(-1);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(255);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_1600
     * @tc.name testUint8ArrayToReversed016
     * @tc.desc Verify single element toReversed returns length 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(42);
      let result: Uint8Array = arr.toReversed();
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_1700
     * @tc.name testUint8ArrayToReversed017
     * @tc.desc Verify single element toReversed original array element unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(42);
      arr.toReversed();
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_1800
     * @tc.name testUint8ArrayToReversed018
     * @tc.desc Verify [0, 255] toReversed result[0] is 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 255);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(255);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_1900
     * @tc.name testUint8ArrayToReversed019
     * @tc.desc Verify [0, 255] toReversed result[1] is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 255);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_2000
     * @tc.name testUint8ArrayToReversed020
     * @tc.desc Verify [127, 128] toReversed result[0] is 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(127, 128);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_2100
     * @tc.name testUint8ArrayToReversed021
     * @tc.desc Verify [127, 128] toReversed result[1] is 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(127, 128);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(1)).assertEqual(127);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_2200
     * @tc.name testUint8ArrayToReversed022
     * @tc.desc Verify [255, 0] toReversed result[0] is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(255, 0);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_2300
     * @tc.name testUint8ArrayToReversed023
     * @tc.desc Verify [255, 0] toReversed result[1] is 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(255, 0);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(1)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_2400
     * @tc.name testUint8ArrayToReversed024
     * @tc.desc Verify [100, 100] same elements toReversed result[0] is 100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(100, 100);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(100);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_2500
     * @tc.name testUint8ArrayToReversed025
     * @tc.desc Verify [100, 100] same elements toReversed result[1] is 100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(100, 100);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(1)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_2600
     * @tc.name testUint8ArrayToReversed026
     * @tc.desc Verify two elements toReversed returns length 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 10);
      let result: Uint8Array = arr.toReversed();
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_2700
     * @tc.name testUint8ArrayToReversed027
     * @tc.desc Verify two elements toReversed original array[0] unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 10);
      arr.toReversed();
      expect(arr.$_get(0)).assertEqual(5);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_2800
     * @tc.name testUint8ArrayToReversed028
     * @tc.desc Verify two elements toReversed original array[1] unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(5, 10);
      arr.toReversed();
      expect(arr.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_2900
     * @tc.name testUint8ArrayToReversed029
     * @tc.desc Verify [1, 2, 3] toReversed result[0] is 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_3000
     * @tc.name testUint8ArrayToReversed030
     * @tc.desc Verify [1, 2, 3] toReversed result[1] is 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(1)).assertEqual(2);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_3100
     * @tc.name testUint8ArrayToReversed031
     * @tc.desc Verify [1, 2, 3] toReversed result[2] is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_3200
     * @tc.name testUint8ArrayToReversed032
     * @tc.desc Verify [0, 127, 255] toReversed result[0] is 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 127, 255);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_3300
     * @tc.name testUint8ArrayToReversed033
     * @tc.desc Verify [0, 127, 255] toReversed result[1] is 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 127, 255);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(1)).assertEqual(127);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_3400
     * @tc.name testUint8ArrayToReversed034
     * @tc.desc Verify [0, 127, 255] toReversed result[2] is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 127, 255);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_3500
     * @tc.name testUint8ArrayToReversed035
     * @tc.desc Verify [1, 2, 3] toReversed returns length 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let result: Uint8Array = arr.toReversed();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_3600
     * @tc.name testUint8ArrayToReversed036
     * @tc.desc Verify [1, 2, 3] toReversed original array[0] unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      arr.toReversed();
      expect(arr.$_get(0)).assertEqual(1);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_3700
     * @tc.name testUint8ArrayToReversed037
     * @tc.desc Verify [1, 2, 3] toReversed original array[1] unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      arr.toReversed();
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_3800
     * @tc.name testUint8ArrayToReversed038
     * @tc.desc Verify [1, 2, 3] toReversed original array[2] unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      arr.toReversed();
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_3900
     * @tc.name testUint8ArrayToReversed039
     * @tc.desc Verify [1, 2, 3] toReversed original array length unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      arr.toReversed();
      expect(arr.length).assertEqual(3);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_4000
     * @tc.name testUint8ArrayToReversed040
     * @tc.desc Verify [1, 2, 3] double toReversed restores original order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let rev1: Uint8Array = arr.toReversed();
      let rev2: Uint8Array = rev1.toReversed();
      expect(rev2.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_4100
     * @tc.name testUint8ArrayToReversed041
     * @tc.desc Verify [10, 20, 30, 40] toReversed result[0] is 40
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_4200
     * @tc.name testUint8ArrayToReversed042
     * @tc.desc Verify [10, 20, 30, 40] toReversed result[3] is 10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(3)).assertEqual(10);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_4300
     * @tc.name testUint8ArrayToReversed043
     * @tc.desc Verify [10, 20, 30, 40] toReversed result[1] is 30
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_4400
     * @tc.name testUint8ArrayToReversed044
     * @tc.desc Verify [10, 20, 30, 40] toReversed result[2] is 20
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(2)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_4500
     * @tc.name testUint8ArrayToReversed045
     * @tc.desc Verify [10, 20, 30, 40] toReversed returns length 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      let result: Uint8Array = arr.toReversed();
      expect(result.length).assertEqual(4);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_4600
     * @tc.name testUint8ArrayToReversed046
     * @tc.desc Verify [0, 1, 2, 3, 4] toReversed result[0] is 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_4700
     * @tc.name testUint8ArrayToReversed047
     * @tc.desc Verify [0, 1, 2, 3, 4] toReversed result[4] is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_4800
     * @tc.name testUint8ArrayToReversed048
     * @tc.desc Verify [0, 1, 2, 3, 4] toReversed result[1] is 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(1)).assertEqual(3);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_4900
     * @tc.name testUint8ArrayToReversed049
     * @tc.desc Verify [0, 1, 2, 3, 4] toReversed result[3] is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_5000
     * @tc.name testUint8ArrayToReversed050
     * @tc.desc Verify [0, 1, 2, 3, 4] toReversed result[2] middle element unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 1, 2, 3, 4);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_5100
     * @tc.name testUint8ArrayToReversed051
     * @tc.desc Verify [0, 255, 0, 255] alternating boundary toReversed result[0] is 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 255, 0, 255);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(255);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_5200
     * @tc.name testUint8ArrayToReversed052
     * @tc.desc Verify [0, 255, 0, 255] alternating boundary toReversed result[3] is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 255, 0, 255);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_5300
     * @tc.name testUint8ArrayToReversed053
     * @tc.desc Verify [0, 255, 0, 255] alternating boundary toReversed result[1] is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 255, 0, 255);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_5400
     * @tc.name testUint8ArrayToReversed054
     * @tc.desc Verify [0, 255, 0, 255] alternating boundary toReversed result[2] is 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 255, 0, 255);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(2)).assertEqual(255);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_5500
     * @tc.name testUint8ArrayToReversed055
     * @tc.desc Verify [0, 255, 0, 255] alternating boundary toReversed returns length 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 255, 0, 255);
      let result: Uint8Array = arr.toReversed();
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_5600
     * @tc.name testUint8ArrayToReversed056
     * @tc.desc Verify [0, 255, 0, 255] alternating boundary toReversed original array[0] unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 255, 0, 255);
      arr.toReversed();
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_5700
     * @tc.name testUint8ArrayToReversed057
     * @tc.desc Verify [0, 255, 0, 255] alternating boundary toReversed original array[1] unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 255, 0, 255);
      arr.toReversed();
      expect(arr.$_get(1)).assertEqual(255);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_5800
     * @tc.name testUint8ArrayToReversed058
     * @tc.desc Verify [0, 255, 0, 255] alternating boundary toReversed original array[2] unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 255, 0, 255);
      arr.toReversed();
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_5900
     * @tc.name testUint8ArrayToReversed059
     * @tc.desc Verify [0, 255, 0, 255] alternating boundary toReversed original array[3] unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 255, 0, 255);
      arr.toReversed();
      expect(arr.$_get(3)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_6000
     * @tc.name testUint8ArrayToReversed060
     * @tc.desc Verify Uint8Array.of toReversed returns object type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let result: Uint8Array = arr.toReversed();
      expect(result.length).assertEqual(3);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_6100
     * @tc.name testUint8ArrayToReversed061
     * @tc.desc Verify new Uint8Array([1, 2, 3]) toReversed result[0] is 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array([1, 2, 3]);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_6200
     * @tc.name testUint8ArrayToReversed062
     * @tc.desc Verify Uint8Array.from([1, 2, 3]) toReversed result[0] is 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.from([1, 2, 3]);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_6300
     * @tc.name testUint8ArrayToReversed063
     * @tc.desc Verify new Uint8Array(3) filled toReversed result[0] is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(3);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_6400
     * @tc.name testUint8ArrayToReversed064
     * @tc.desc Verify new Uint8Array(3) filled toReversed result[2] is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(3);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_6500
     * @tc.name testUint8ArrayToReversed065
     * @tc.desc Verify toReversed returns Uint8Array type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let result: Uint8Array = arr.toReversed();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_6600
     * @tc.name testUint8ArrayToReversed066
     * @tc.desc Verify toReversed returns new array not same reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let rev: Uint8Array = arr.toReversed();
      expect(rev !== arr).assertTrue();
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_6700
     * @tc.name testUint8ArrayToReversed067
     * @tc.desc Verify toReversed returns array with same length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_6800
     * @tc.name testUint8ArrayToReversed068
     * @tc.desc Verify toReversed result elements are in reverse order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(5);
      expect(rev.$_get(1)).assertEqual(4);
      expect(rev.$_get(2)).assertEqual(3);
      expect(rev.$_get(3)).assertEqual(2);
      expect(rev.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_6900
     * @tc.name testUint8ArrayToReversed069
     * @tc.desc Verify toReversed result join string is reversed
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.join()).assertEqual('3,2,1');
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_7000
     * @tc.name testUint8ArrayToReversed070
     * @tc.desc Verify toReversed result toString is reversed
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_7100
     * @tc.name testUint8ArrayToReversed071
     * @tc.desc Verify toReversed on empty array does not throw error
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array();
      let result: Uint8Array = arr.toReversed();
      expect(result.length).assertEqual(0);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_7200
     * @tc.name testUint8ArrayToReversed072
     * @tc.desc Verify toReversed on single element array does not throw error
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(50);
      let result: Uint8Array = arr.toReversed();
      expect(result.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_7300
     * @tc.name testUint8ArrayToReversed073
     * @tc.desc Verify toReversed original array[0] unchanged after call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      arr.toReversed();
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_7400
     * @tc.name testUint8ArrayToReversed074
     * @tc.desc Verify toReversed original array[2] unchanged after call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      arr.toReversed();
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_7500
     * @tc.name testUint8ArrayToReversed075
     * @tc.desc Verify toReversed original array length unchanged after call
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      arr.toReversed();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_7600
     * @tc.name testUint8ArrayToReversed076
     * @tc.desc Verify toReversed original array[0] unchanged after call with boundary values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 255, 128);
      arr.toReversed();
      expect(arr.$_get(0)).assertEqual(0);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_7700
     * @tc.name testUint8ArrayToReversed077
     * @tc.desc Verify toReversed original array[1] unchanged after call with boundary values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 255, 128);
      arr.toReversed();
      expect(arr.$_get(1)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_7800
     * @tc.name testUint8ArrayToReversed078
     * @tc.desc Verify toReversed original array[2] unchanged after call with boundary values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 255, 128);
      arr.toReversed();
      expect(arr.$_get(2)).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_7900
     * @tc.name testUint8ArrayToReversed079
     * @tc.desc Verify toReversed returns result can call indexOf to find original last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.indexOf(10)).assertEqual(3);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_8000
     * @tc.name testUint8ArrayToReversed080
     * @tc.desc Verify toReversed returns result join string correct
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.join(',')).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_8100
     * @tc.name testUint8ArrayToReversed081
     * @tc.desc Verify toReversed returns result can continue slice
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30);
      let rev: Uint8Array = arr.toReversed();
      let sliced: Uint8Array = rev.slice(0);
      expect(sliced.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_8200
     * @tc.name testUint8ArrayToReversed082
     * @tc.desc Verify toReversed returns result can continue filter
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(0, 1, 0, 2);
      let rev: Uint8Array = arr.toReversed();
      let filtered: Uint8Array = rev.filter((v: number): boolean => v > 0);
      expect(filtered.length).assertEqual(2);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_8300
     * @tc.name testUint8ArrayToReversed083
     * @tc.desc Verify toReversed returns result indexOf finds original first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.indexOf(40)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_8400
     * @tc.name testUint8ArrayToReversed084
     * @tc.desc Verify toReversed returns result includes original last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      let rev: Uint8Array = arr.toReversed();
      expect(rev.includes(10)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_8500
     * @tc.name testUint8ArrayToReversed085
     * @tc.desc Verify 100 elements toReversed returns length 100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i: number = 0; i < 100; i++) {
        arr.$_set(i.toInt(), i.toInt());
      }
      let rev: Uint8Array = arr.toReversed();
      expect(rev.length).assertEqual(100);
    });/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_8600
     * @tc.name testUint8ArrayToReversed086
     * @tc.desc Verify 100 elements toReversed result[0] is 99
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i: number = 0; i < 100; i++) {
        arr.$_set(i.toInt(), i.toInt());
      }
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_8700
     * @tc.name testUint8ArrayToReversed087
     * @tc.desc Verify 100 elements toReversed result[99] is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i: number = 0; i < 100; i++) {
        arr.$_set(i.toInt(), i.toInt());
      }
      let rev: Uint8Array = arr.toReversed();
      expect(rev.$_get(99)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_REVERSED_8800
     * @tc.name testUint8ArrayToReversed088
     * @tc.desc Verify 100 elements toReversed original array[0] unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToReversed088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint8Array = new Uint8Array(100);
      for (let i: number = 0; i < 100; i++) {
        arr.$_set(i.toInt(), i.toInt());
      }
      arr.toReversed();
      expect(arr.$_get(0)).assertEqual(0);
    });
  });
}
