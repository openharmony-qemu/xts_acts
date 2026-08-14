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
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int16ArrayFillTestThreeTest(): void {
  describe('Int16ArrayFillTestThreeTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_0100
     * @tc.name testInt16ArrayFillTestThree001
     * @tc.desc Verify fill(99 as short) value only full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(11 as short, 22 as short, 33 as short, 44 as short, 55 as short, 66 as short);
      arr.fill(99 as short);
      let actual1: number = arr.$_get(0);
      let expected1: number = 99 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 99 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 99 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_0200
     * @tc.name testInt16ArrayFillTestThree002
     * @tc.desc Verify fill(77 as short) ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let arr = new Int16Array(buf, 0, 6);
      arr.fill(77 as short);
      let actual1: number = arr.$_get(0);
      let expected1: number = 77 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 77 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 77 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_0300
     * @tc.name testInt16ArrayFillTestThree003
     * @tc.desc Verify fill(55 as short, 3) from source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      let arr = Int16Array.from(src);
      arr.fill(55 as short, 3);
      let actual1: number = arr.$_get(0);
      let expected1: number = 1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 3 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 55 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(5);
      let expected4: number = 55 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_0400
     * @tc.name testInt16ArrayFillTestThree004
     * @tc.desc Verify fill(0 as short, 1, 4) value start end range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-10 as short, -20 as short, -30 as short, -40 as short, -50 as short, -60 as short);
      arr.fill(0 as short, 1, 4);
      let actual1: number = arr.$_get(0);
      let expected1: number = -10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 0 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 0 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(4);
      let expected4: number = -50 as short;
      expect(actual4).assertEqual(expected4);
      let actual5: number = arr.$_get(5);
      let expected5: number = -60 as short;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_0500
     * @tc.name testInt16ArrayFillTestThree005
     * @tc.desc Verify fill(33 as short, 2, 5) ArrayBuffer view; expect 0/0/33/33/33/0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(20);
      let arr = new Int16Array(buf, 4, 6);
      arr.fill(33 as short, 2, 5);
      let actual1: number = arr.$_get(0);
      let expected1: number = 0 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 0 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = 33 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      let expected4: number = 33 as short;
      expect(actual4).assertEqual(expected4);
      let actual5: number = arr.$_get(4);
      let expected5: number = 33 as short;
      expect(actual5).assertEqual(expected5);
      let actual6: number = arr.$_get(5);
      let expected6: number = 0 as short;
      expect(actual6).assertEqual(expected6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_0600
     * @tc.name testInt16ArrayFillTestThree006
     * @tc.desc Verify fill(fillVal) value only full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      let fillVal: short = 256 as short;
      arr.fill(fillVal);
      let actual1: number = arr.$_get(0);
      let expected1: number = 256 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 256 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 256 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_0700
     * @tc.name testInt16ArrayFillTestThree007
     * @tc.desc Verify fill((a * b) as short) value only full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(0 as short, 0 as short, 0 as short, 0 as short, 0 as short, 0 as short);
      let a: short = 10 as short;
      let b: short = 5 as short;
      arr.fill(a * b);
      let actual1: number = arr.$_get(0);
      let expected1: number = 50 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 50 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 50 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_0800
     * @tc.name testInt16ArrayFillTestThree008
     * @tc.desc Verify fill(val) value only full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = Int16Array.of(42 as short);
      let val: number = source.$_get(0);
      let arr = Int16Array.of(0 as short, 0 as short, 0 as short, 0 as short, 0 as short);
      arr.fill(val);
      let actual1: number = arr.$_get(0);
      let expected1: number = 42 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 42 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(4);
      let expected3: number = 42 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_0900
     * @tc.name testInt16ArrayFillTestThree009
     * @tc.desc Verify fill(32767 as short) value only full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-100 as short, -200 as short, -300 as short, -400 as short, -500 as short);
      arr.fill(32767 as short);
      let actual1: number = arr.$_get(0);
      let expected1: number = 32767 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 32767 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(4);
      let expected3: number = 32767 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_1000
     * @tc.name testInt16ArrayFillTestThree010
     * @tc.desc Verify fill(-32768 as short) overflow wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(100 as short, 200 as short, 300 as short, 400 as short);
      arr.fill(-32768 as short);
      let actual1: number = arr.$_get(0);
      let expected1: number = -32768 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = -32768 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = -32768 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_1100
     * @tc.name testInt16ArrayFillTestThree011
     * @tc.desc Verify fill(0x7FFF as short) ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      let arr = new Int16Array(buf, 0, 5);
      arr.fill(0x7fff as short);
      let actual1: number = arr.$_get(0);
      let expected1: number = 32767 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 32767 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(4);
      let expected3: number = 32767 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_1200
     * @tc.name testInt16ArrayFillTestThree012
     * @tc.desc Verify fill(0x0001 as short) value only full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(0 as short, 0 as short, 0 as short, 0 as short, 0 as short);
      arr.fill(0x0001 as short);
      let actual1: number = arr.$_get(0);
      let expected1: number = 1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(4);
      let expected2: number = 1 as short;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_1300
     * @tc.name testInt16ArrayFillTestThree013
     * @tc.desc Verify fill(0o1 as short) value only full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(99 as short, 99 as short, 99 as short, 99 as short);
      arr.fill(0o1 as short);
      let actual1: number = arr.$_get(0);
      let expected1: number = 1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 1 as short;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_1400
     * @tc.name testInt16ArrayFillTestThree014
     * @tc.desc Verify fill(0b1 as short) value only full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(0 as short, 0 as short, 0 as short, 0 as short, 0 as short, 0 as short);
      arr.fill(0b1 as short);
      let actual1: number = arr.$_get(0);
      let expected1: number = 1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 1 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 1 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_1500
     * @tc.name testInt16ArrayFillTestThree015
     * @tc.desc Verify fill(ov) overflow wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 1 as short, 1 as short, 1 as short, 1 as short, 1 as short);
      let ov: number = 32768;
      arr.fill(ov);
      let actual1: number = arr.$_get(0);
      let expected1: number = -32768 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = -32768 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = -32768 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_1600
     * @tc.name testInt16ArrayFillTestThree016
     * @tc.desc Verify fill(uv) overflow wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-1 as short, -1 as short, -1 as short, -1 as short, -1 as short, -1 as short);
      let uv: number = -32769;
      arr.fill(uv);
      let actual1: number = arr.$_get(0);
      let expected1: number = 32767 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 32767 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 32767 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_1700
     * @tc.name testInt16ArrayFillTestThree017
     * @tc.desc Verify fill(0x8000 as short) overflow wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(0 as short, 0 as short, 0 as short, 0 as short);
      arr.fill(0x8000);
      let actual1: number = arr.$_get(0);
      let expected1: number = -32768 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = -32768 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = -32768 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_1800
     * @tc.name testInt16ArrayFillTestThree018
     * @tc.desc Verify fill(nv) NaN to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(32767 as short, 32767 as short, 32767 as short, 32767 as short);
      let nv: number = Number.NaN;
      arr.fill(nv);
      let actual1: number = arr.$_get(0);
      let expected1: number = 0 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 0 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 0 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_1900
     * @tc.name testInt16ArrayFillTestThree019
     * @tc.desc Verify fill(pv) overflow wrap; Infinity to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-32768 as short, -32768 as short, -32768 as short);
      let pv: number = Number.POSITIVE_INFINITY;
      arr.fill(pv);
      let actual1: number = arr.$_get(0);
      let expected1: number = 0 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 0 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = 0 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_2000
     * @tc.name testInt16ArrayFillTestThree020
     * @tc.desc Verify fill(nv2) Infinity to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(100 as short, 200 as short, 300 as short, 400 as short, 500 as short, 600 as short);
      let nv2: number = -Number.POSITIVE_INFINITY;
      arr.fill(nv2);
      let actual1: number = arr.$_get(0);
      let expected1: number = 0 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 0 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 0 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_2100
     * @tc.name testInt16ArrayFillTestThree021
     * @tc.desc Verify fill(negZero) value only full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-1 as short, -1 as short, -1 as short, -1 as short);
      let negZero: short = -0 as short;
      arr.fill(negZero);
      let actual1: number = arr.$_get(0);
      let expected1: number = 0 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 0 as short;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_2200
     * @tc.name testInt16ArrayFillTestThree022
     * @tc.desc Verify fill(fp) float truncate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(0 as short, 0 as short, 0 as short, 0 as short, 0 as short);
      let fp: number = 3.14;
      arr.fill(fp);
      let actual1: number = arr.$_get(0);
      let expected1: number = 3 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 3 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(4);
      let expected3: number = 3 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_2300
     * @tc.name testInt16ArrayFillTestThree023
     * @tc.desc Verify fill(nfp) float truncate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(0 as short, 0 as short, 0 as short, 0 as short, 0 as short);
      let nfp: number = -3.14;
      arr.fill(nfp);
      let actual1: number = arr.$_get(0);
      let expected1: number = -3 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = -3 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(4);
      let expected3: number = -3 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_2400
     * @tc.name testInt16ArrayFillTestThree024
     * @tc.desc Verify fill(100 as short, 0) value start range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      arr.fill(100 as short, 0);
      let actual1: number = arr.$_get(0);
      let expected1: number = 100 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 100 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 100 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_2500
     * @tc.name testInt16ArrayFillTestThree025
     * @tc.desc Verify fill(77 as short, 2) value start range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short, 60 as short);
      arr.fill(77 as short, 2);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 20 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = 77 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(4);
      let expected4: number = 77 as short;
      expect(actual4).assertEqual(expected4);
      let actual5: number = arr.$_get(5);
      let expected5: number = 77 as short;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_2600
     * @tc.name testInt16ArrayFillTestThree026
     * @tc.desc Verify fill(88 as short, 4) value start range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      arr.fill(88 as short, 4);
      let actual1: number = arr.$_get(0);
      let expected1: number = 1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 4 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(4);
      let expected3: number = 88 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(5);
      let expected4: number = 88 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_2700
     * @tc.name testInt16ArrayFillTestThree027
     * @tc.desc Verify fill(99 as short, 6) value start range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(11 as short, 22 as short, 33 as short, 44 as short, 55 as short, 66 as short);
      arr.fill(99 as short, 6);
      let actual1: number = arr.$_get(0);
      let expected1: number = 11 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 44 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 66 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_2800
     * @tc.name testInt16ArrayFillTestThree028
     * @tc.desc Verify fill(50 as short, 8) value start range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      arr.fill(50 as short, 8);
      let actual1: number = arr.$_get(0);
      let expected1: number = 1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 3 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 6 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_2900
     * @tc.name testInt16ArrayFillTestThree029
     * @tc.desc Verify fill(99 as short, -1) negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short, 60 as short);
      arr.fill(99 as short, -1);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(4);
      let expected2: number = 50 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 99 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_3000
     * @tc.name testInt16ArrayFillTestThree030
     * @tc.desc Verify fill(77 as short, -3) negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      arr.fill(77 as short, -3);
      let actual1: number = arr.$_get(0);
      let expected1: number = 1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 3 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 77 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(5);
      let expected4: number = 77 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_3100
     * @tc.name testInt16ArrayFillTestThree031
     * @tc.desc Verify fill(111 as short, -6) negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      arr.fill(111 as short, -6);
      let actual1: number = arr.$_get(0);
      let expected1: number = 111 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 111 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 111 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_3200
     * @tc.name testInt16ArrayFillTestThree032
     * @tc.desc Verify fill(44 as short, -8) negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      arr.fill(44 as short, -8);
      let actual1: number = arr.$_get(0);
      let expected1: number = 44 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 44 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 44 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_3300
     * @tc.name testInt16ArrayFillTestThree033
     * @tc.desc Verify fill(99 as short, 2147483647 as int) clamp extreme int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(11 as short, 22 as short, 33 as short, 44 as short, 55 as short, 66 as short);
      arr.fill(99 as short, 2147483647 as int);
      let actual1: number = arr.$_get(0);
      let expected1: number = 11 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 44 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 66 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_3400
     * @tc.name testInt16ArrayFillTestThree034
     * @tc.desc Verify fill(99 as short, 0, 2) value start end range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(11 as short, 22 as short, 33 as short, 44 as short, 55 as short, 66 as short);
      arr.fill(99 as short, 0, 2);
      let actual1: number = arr.$_get(0);
      let expected1: number = 99 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 99 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = 33 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(5);
      let expected4: number = 66 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_3500
     * @tc.name testInt16ArrayFillTestThree035
     * @tc.desc Verify fill(77 as short, 0, 4) value start end range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      arr.fill(77 as short, 0, 4);
      let actual1: number = arr.$_get(0);
      let expected1: number = 77 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 77 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(4);
      let expected3: number = 5 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(5);
      let expected4: number = 6 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_3600
     * @tc.name testInt16ArrayFillTestThree036
     * @tc.desc Verify fill(88 as short, 0, 5) value start end range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short, 60 as short);
      arr.fill(88 as short, 0, 5);
      let actual1: number = arr.$_get(0);
      let expected1: number = 88 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(4);
      let expected2: number = 88 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 60 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_3700
     * @tc.name testInt16ArrayFillTestThree037
     * @tc.desc Verify fill(55 as short, 0, 6) value start end range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      arr.fill(55 as short, 0, 6);
      let actual1: number = arr.$_get(0);
      let expected1: number = 55 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 55 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 55 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_3800
     * @tc.name testInt16ArrayFillTestThree038
     * @tc.desc Verify fill(33 as short, 0, 7) value start end range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(11 as short, 22 as short, 33 as short, 44 as short, 55 as short, 66 as short);
      arr.fill(33 as short, 0, 7);
      let actual1: number = arr.$_get(0);
      let expected1: number = 33 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 33 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 33 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_3900
     * @tc.name testInt16ArrayFillTestThree039
     * @tc.desc Verify fill(99 as short, 0, -1) negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      arr.fill(99 as short, 0, -1);
      let actual1: number = arr.$_get(0);
      let expected1: number = 99 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(4);
      let expected2: number = 99 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 6 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_4000
     * @tc.name testInt16ArrayFillTestThree040
     * @tc.desc Verify fill(77 as short, 0, -3) negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short, 60 as short);
      arr.fill(77 as short, 0, -3);
      let actual1: number = arr.$_get(0);
      let expected1: number = 77 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 77 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 40 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(5);
      let expected4: number = 60 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_4100
     * @tc.name testInt16ArrayFillTestThree041
     * @tc.desc Verify fill(88 as short, 0, -6) negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      arr.fill(88 as short, 0, -6);
      let actual1: number = arr.$_get(0);
      let expected1: number = 1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 4 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 6 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_4200
     * @tc.name testInt16ArrayFillTestThree042
     * @tc.desc Verify fill(55 as short, 0, -7) negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(11 as short, 22 as short, 33 as short, 44 as short, 55 as short, 66 as short);
      arr.fill(55 as short, 0, -7);
      let actual1: number = arr.$_get(0);
      let expected1: number = 11 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 44 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 66 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_4300
     * @tc.name testInt16ArrayFillTestThree043
     * @tc.desc Verify fill(66 as short, 0, 2147483647 as int) clamp extreme int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      arr.fill(66 as short, 0, 2147483647 as int);
      let actual1: number = arr.$_get(0);
      let expected1: number = 66 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 66 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 66 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_4400
     * @tc.name testInt16ArrayFillTestThree044
     * @tc.desc Verify fill(99 as short, 1, 4) value start end range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short, 60 as short);
      arr.fill(99 as short, 1, 4);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 99 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 99 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(4);
      let expected4: number = 50 as short;
      expect(actual4).assertEqual(expected4);
      let actual5: number = arr.$_get(5);
      let expected5: number = 60 as short;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_4500
     * @tc.name testInt16ArrayFillTestThree045
     * @tc.desc Verify fill(77 as short, 2, 2) value start end range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      arr.fill(77 as short, 2, 2);
      let actual1: number = arr.$_get(0);
      let expected1: number = 1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 3 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 6 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_4600
     * @tc.name testInt16ArrayFillTestThree046
     * @tc.desc Verify fill(99 as short, 4, 1) value start end range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(11 as short, 22 as short, 33 as short, 44 as short, 55 as short, 66 as short);
      arr.fill(99 as short, 4, 1);
      let actual1: number = arr.$_get(0);
      let expected1: number = 11 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 44 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 66 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_4700
     * @tc.name testInt16ArrayFillTestThree047
     * @tc.desc Verify fill(88 as short, -4, -2) negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      arr.fill(88 as short, -4, -2);
      let actual1: number = arr.$_get(1);
      let expected1: number = 2 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 88 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 88 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(4);
      let expected4: number = 5 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_4800
     * @tc.name testInt16ArrayFillTestThree048
     * @tc.desc Verify fill(55 as short, -5, -1) negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short, 60 as short);
      arr.fill(55 as short, -5, -1);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 55 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(4);
      let expected3: number = 55 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(5);
      let expected4: number = 60 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_4900
     * @tc.name testInt16ArrayFillTestThree049
     * @tc.desc Verify fill(33 as short, -6, 6) negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      arr.fill(33 as short, -6, 6);
      let actual1: number = arr.$_get(0);
      let expected1: number = 33 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 33 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 33 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_5000
     * @tc.name testInt16ArrayFillTestThree050
     * @tc.desc Verify fill(44 as short, 1, 5) value start end range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(11 as short, 22 as short, 33 as short, 44 as short, 55 as short, 66 as short);
      arr.fill(44 as short, 1, 5);
      let actual1: number = arr.$_get(0);
      let expected1: number = 11 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 44 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(4);
      let expected3: number = 44 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(5);
      let expected4: number = 66 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_5100
     * @tc.name testInt16ArrayFillTestThree051
     * @tc.desc Verify fill(22 as short, 3, 6) value start end range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      arr.fill(22 as short, 3, 6);
      let actual1: number = arr.$_get(0);
      let expected1: number = 1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 3 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 22 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(5);
      let expected4: number = 22 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_5200
     * @tc.name testInt16ArrayFillTestThree052
     * @tc.desc Verify fill(99 as short, 0, 3) value start end range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short, 60 as short);
      arr.fill(99 as short, 0, 3);
      let actual1: number = arr.$_get(0);
      let expected1: number = 99 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 99 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 40 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(5);
      let expected4: number = 60 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_5300
     * @tc.name testInt16ArrayFillTestThree053
     * @tc.desc Verify fill(77 as short, -2, 6) negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      arr.fill(77 as short, -2, 6);
      let actual1: number = arr.$_get(0);
      let expected1: number = 1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 4 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(4);
      let expected3: number = 77 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(5);
      let expected4: number = 77 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_5400
     * @tc.name testInt16ArrayFillTestThree054
     * @tc.desc Verify fill(99 as short, -1, 0) negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10 as short, 20 as short, 30 as short, 40 as short, 50 as short, 60 as short);
      arr.fill(99 as short, -1, 0);
      let actual1: number = arr.$_get(0);
      let expected1: number = 10 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 40 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 60 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_5500
     * @tc.name testInt16ArrayFillTestThree055
     * @tc.desc Verify fill(88 as short, -2, -2) negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      arr.fill(88 as short, -2, -2);
      let actual1: number = arr.$_get(0);
      let expected1: number = 1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(4);
      let expected2: number = 5 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 6 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_5600
     * @tc.name testInt16ArrayFillTestThree056
     * @tc.desc Verify fill(55 as short, 5, 3) value start end range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(11 as short, 22 as short, 33 as short, 44 as short, 55 as short, 66 as short);
      arr.fill(55 as short, 5, 3);
      let actual1: number = arr.$_get(0);
      let expected1: number = 11 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 33 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 66 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_5700
     * @tc.name testInt16ArrayFillTestThree057
     * @tc.desc Verify fill(99 as short) multi fill; E vs number overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrE: Int16Array = Int16Array.of(1 as short, 2 as short, 3 as short);
      let arrNum: Int16Array = Int16Array.of(1 as short, 2 as short, 3 as short);
      arrE.fill(99 as short);
      arrNum.fill(99);
      let actual1: number = arrE.$_get(0);
      let expected1: number = arrNum.$_get(0);
      expect(actual1).assertEqual(expected1);
      let actual2: number = arrE.$_get(2);
      let expected2: number = arrNum.$_get(2);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_5800
     * @tc.name testInt16ArrayFillTestThree058
     * @tc.desc Verify fill(ev, 2) value start range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(11 as short, 22 as short, 33 as short, 44 as short, 55 as short, 66 as short);
      let ev: short = 88 as short;
      arr.fill(ev, 2);
      let actual1: number = arr.$_get(0);
      let expected1: number = 11 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 22 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = 88 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(5);
      let expected4: number = 88 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_5900
     * @tc.name testInt16ArrayFillTestThree059
     * @tc.desc Verify fill(ev2, 1, 5) value start end range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      let ev2: short = 77 as short;
      arr.fill(ev2, 1, 5);
      let actual1: number = arr.$_get(0);
      let expected1: number = 1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 77 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(4);
      let expected3: number = 77 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(5);
      let expected4: number = 6 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_6000
     * @tc.name testInt16ArrayFillTestThree060
     * @tc.desc Verify fill(32767 as short) value only full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(0 as short, 0 as short, 0 as short, 0 as short);
      arr.fill(32767 as short);
      let val: number = arr.$_get(1);
      expect(val).assertEqual(32767 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_6100
     * @tc.name testInt16ArrayFillTestThree061
     * @tc.desc Verify fill(typedVal) value only full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(0 as short, 0 as short, 0 as short);
      let typedVal: short = 42 as short;
      arr.fill(typedVal);
      let actual1: number = arr.$_get(0);
      let expected1: number = 42 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 42 as short;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_6200
     * @tc.name testInt16ArrayFillTestThree062
     * @tc.desc Verify fill(99 as short) returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      let ret = arr.fill(99 as short);
      let sameRef: boolean = ret === arr;
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_6300
     * @tc.name testInt16ArrayFillTestThree063
     * @tc.desc Verify fill(50 as short, 0, 2) chain sort; expect sorted 6/14/50/52
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(65 as short, 21 as short, 33 as short, 14 as short, 52 as short, 6 as short);
      arr.fill(50 as short, 0, 2).sort();
      let actual1: number = arr.$_get(0);
      let expected1: number = 6 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 14 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(4);
      let expected3: number = 50 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(5);
      let expected4: number = 52 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_6400
     * @tc.name testInt16ArrayFillTestThree064
     * @tc.desc Verify fill(88 as short, 3, 6) chain reverse; returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      let ret: Int16Array = arr.fill(88 as short, 3, 6).reverse();
      let actual1: boolean = ret === arr;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_6500
     * @tc.name testInt16ArrayFillTestThree065
     * @tc.desc Verify fill(33 as short, 0, 3) value start end range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      let returned: Int16Array = arr.fill(33 as short, 0, 3);
      let actual1: number = returned.$_get(0);
      let expected1: number = 33 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = returned.$_get(3);
      let expected2: number = 4 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = returned.$_get(5);
      let expected3: number = 6 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_6600
     * @tc.name testInt16ArrayFillTestThree066
     * @tc.desc Verify fill(1 as short, 0, 1) returns this; multi fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(0 as short, 0 as short, 0 as short, 0 as short, 0 as short, 0 as short);
      let r1: Int16Array = arr.fill(1 as short, 0, 1);
      let r2: Int16Array = r1.fill(2 as short, 1, 2);
      let r3: Int16Array = r2.fill(3 as short, 2, 3);
      let r4: Int16Array = r3.fill(4 as short, 3, 6);
      let actual1: boolean = r4 === arr;
      expect(actual1).assertTrue();
      let actual2: number = arr.$_get(0);
      let expected2: number = 1 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(1);
      let expected3: number = 2 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(2);
      let expected4: number = 3 as short;
      expect(actual4).assertEqual(expected4);
      let actual5: number = arr.$_get(4);
      let expected5: number = 4 as short;
      expect(actual5).assertEqual(expected5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_6700
     * @tc.name testInt16ArrayFillTestThree067
     * @tc.desc Verify fill(77 as short) return this $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      let ret = arr.fill(77 as short);
      ret.$_set(3, 99 as short);
      let actual1: number = arr.$_get(3);
      let expected1: number = 99 as short;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_6800
     * @tc.name testInt16ArrayFillTestThree068
     * @tc.desc Verify fill(33 as short) length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      let lenBefore: int = arr.length;
      arr.fill(33 as short);
      let actual1: int = arr.length;
      let expected1: number = lenBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_6900
     * @tc.name testInt16ArrayFillTestThree069
     * @tc.desc Verify fill(55 as short, 2, 5) byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      let byteLenBefore: int = arr.byteLength;
      arr.fill(55 as short, 2, 5);
      let actual1: int = arr.byteLength;
      let expected1: number = byteLenBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_7000
     * @tc.name testInt16ArrayFillTestThree070
     * @tc.desc Verify fill(99 as short) ArrayBuffer view; byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr = new Int16Array(buf, 4, 6);
      let offsetBefore: int = arr.byteOffset;
      arr.fill(99 as short);
      let actual1: int = arr.byteOffset;
      let expected1: number = offsetBefore;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_7100
     * @tc.name testInt16ArrayFillTestThree071
     * @tc.desc Verify fill(77 as short) ArrayBuffer view; returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let arr = new Int16Array(buf, 0, 6);
      let bufBefore = arr.buffer;
      arr.fill(77 as short);
      let bufAfter = arr.buffer;
      let sameBuf: boolean = bufBefore === bufAfter;
      expect(sameBuf).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_7200
     * @tc.name testInt16ArrayFillTestThree072
     * @tc.desc Verify fill(88 as short, 1, 4) chain subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      let sub = arr.fill(88 as short, 1, 4).subarray(2, 5);
      let actual1: number = sub.$_get(0);
      let expected1: number = 88 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = sub.$_get(2);
      let expected2: number = 5 as short;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_7300
     * @tc.name testInt16ArrayFillTestThree073
     * @tc.desc Verify fill(99 as short, 0, 3) chain reverse; multi fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      arr
        .fill(99 as short, 0, 3)
        .reverse()
        .fill(11 as short, 3, 6);
      let actual1: number = arr.$_get(0);
      let expected1: number = 6 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(2);
      let expected2: number = 4 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(3);
      let expected3: number = 11 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(5);
      let expected4: number = 11 as short;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_7400
     * @tc.name testInt16ArrayFillTestThree074
     * @tc.desc Verify fill(99 as short) empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array();
      let result = arr.fill(99 as short);
      let actual1: int = result.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_7500
     * @tc.name testInt16ArrayFillTestThree075
     * @tc.desc Verify fill(55 as short, 0, 0) empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array();
      arr.fill(55 as short, 0, 0);
      let actual1: int = arr.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_7600
     * @tc.name testInt16ArrayFillTestThree076
     * @tc.desc Verify fill(99 as short, 0, 1) value start end range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(42 as short);
      arr.fill(99 as short, 0, 1);
      let actual1: number = arr.$_get(0);
      let expected1: number = 99 as short;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_7700
     * @tc.name testInt16ArrayFillTestThree077
     * @tc.desc Verify fill(99 as short, 0, 0) value start end range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(42 as short);
      arr.fill(99 as short, 0, 0);
      let actual1: number = arr.$_get(0);
      let expected1: number = 42 as short;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_7800
     * @tc.name testInt16ArrayFillTestThree078
     * @tc.desc Verify fill(99 as short, 1) value start range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(42 as short);
      arr.fill(99 as short, 1);
      let actual1: number = arr.$_get(0);
      let expected1: number = 42 as short;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_7900
     * @tc.name testInt16ArrayFillTestThree079
     * @tc.desc Verify fill(88 as short, -1) negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(42 as short);
      arr.fill(88 as short, -1);
      let actual1: number = arr.$_get(0);
      let expected1: number = 88 as short;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_8000
     * @tc.name testInt16ArrayFillTestThree080
     * @tc.desc Verify fill(1 as short, 2, 4) overflow wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(32767 as short, 32767 as short, 0 as short, 0 as short, -32768 as short, -32768 as short);
      arr.fill(1 as short, 2, 4);
      let actual1: number = arr.$_get(0);
      let expected1: number = 32767 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 32767 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = 1 as short;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      let expected4: number = 1 as short;
      expect(actual4).assertEqual(expected4);
      let actual5: number = arr.$_get(4);
      let expected5: number = -32768 as short;
      expect(actual5).assertEqual(expected5);
      let actual6: number = arr.$_get(5);
      let expected6: number = -32768 as short;
      expect(actual6).assertEqual(expected6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_8100
     * @tc.name testInt16ArrayFillTestThree081
     * @tc.desc Verify fill(-1 as short) overflow wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(32767 as short, 0 as short, -32768 as short, 100 as short, -100 as short, 1 as short);
      arr.fill(-1 as short);
      let actual1: number = arr.$_get(0);
      let expected1: number = -1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = -1 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = -1 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_8200
     * @tc.name testInt16ArrayFillTestThree082
     * @tc.desc Verify fill(44 as short, 200 as int) value start range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 2 as short, 3 as short, 4 as short, 5 as short, 6 as short);
      arr.fill(44 as short, 200 as int);
      let actual1: number = arr.$_get(0);
      let expected1: number = 1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(5);
      let expected2: number = 6 as short;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_8300
     * @tc.name testInt16ArrayFillTestThree083
     * @tc.desc Verify fill(5 as short, -2147483647 as int) negative index; clamp extreme int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(11 as short, 22 as short, 33 as short, 44 as short, 55 as short, 66 as short);
      arr.fill(5 as short, -2147483647 as int);
      let actual1: number = arr.$_get(0);
      let expected1: number = 5 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(3);
      let expected2: number = 5 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(5);
      let expected3: number = 5 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_8400
     * @tc.name testInt16ArrayFillTestThree084
     * @tc.desc Verify fill(ov) overflow wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(0 as short);
      let ov: number = 32768;
      arr.fill(ov);
      let actual1: number = arr.$_get(0);
      let expected1: number = -32768 as short;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_8500
     * @tc.name testInt16ArrayFillTestThree085
     * @tc.desc Verify fill(uv) overflow wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(0 as short);
      let uv: number = -32769;
      arr.fill(uv);
      let actual1: number = arr.$_get(0);
      let expected1: number = 32767 as short;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_8600
     * @tc.name testInt16ArrayFillTestThree086
     * @tc.desc Verify fill(wv) overflow wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(0 as short, 0 as short, 0 as short);
      let wv: number = 65535;
      arr.fill(wv);
      let actual1: number = arr.$_get(0);
      let expected1: number = -1 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = -1 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = -1 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_8700
     * @tc.name testInt16ArrayFillTestThree087
     * @tc.desc Verify fill(wv2) overflow wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1 as short, 1 as short, 1 as short);
      let wv2: number = 65536;
      arr.fill(wv2);
      let actual1: number = arr.$_get(0);
      let expected1: number = 0 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = arr.$_get(1);
      let expected2: number = 0 as short;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: number = 0 as short;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FILL_THREE_8800
     * @tc.name testInt16ArrayFillTestThree088
     * @tc.desc Verify fill(ov2, 1, 4) then slice; overflow wrap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayFillTestThree088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(0 as short, 0 as short, 0 as short, 0 as short, 0 as short, 0 as short);
      let ov2: number = 32768;
      arr.fill(ov2, 1, 4);
      let sliced = arr.slice(1, 4);
      let actual1: number = sliced.$_get(0);
      let expected1: number = -32768 as short;
      expect(actual1).assertEqual(expected1);
      let actual2: number = sliced.$_get(2);
      let expected2: number = -32768 as short;
      expect(actual2).assertEqual(expected2);
    });
