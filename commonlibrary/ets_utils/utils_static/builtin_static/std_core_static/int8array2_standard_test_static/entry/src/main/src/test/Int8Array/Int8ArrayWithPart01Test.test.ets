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

export default function int8ArrayWithPart01Test(): void {
  describe('Int8ArrayWithPart01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    const INT8_MAX = 127;
    const INT8_MIN = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_0100
     * @tc.name int8ArrayWithPart01Test001
     * @tc.desc Verify with(0, 10) writes 10 and keeps byteLength 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: number = 10;
      let r: Int8Array = arr.with(0, v);
      let r1: int = r.byteLength;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let written: number = r.$_get(0);
      let expectedWritten: int = 10;
      expect(written).assertEqual(expectedWritten);
      expect(r).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_0200
     * @tc.name int8ArrayWithPart01Test002
     * @tc.desc Verify with(-1, 20) writes last element 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: number = 20;
      let r: Int8Array = arr.with(-1, v);
      let r1: int = r.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let written: number = r.$_get(2);
      let expectedWritten: int = 20;
      expect(written).assertEqual(expectedWritten);
      let origLast: number = arr.$_get(2);
      let expectedOrig: int = 3;
      expect(origLast).assertEqual(expectedOrig);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_0300
     * @tc.name int8ArrayWithPart01Test003
     * @tc.desc Verify with(0, 30) on single-element array writes 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let v: number = 30;
      let r: Int8Array = arr.with(0, v);
      let r1: int = r.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let written: number = r.$_get(0);
      let expectedWritten: int = 30;
      expect(written).assertEqual(expectedWritten);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_0400
     * @tc.name int8ArrayWithPart01Test004
     * @tc.desc Verify with(2, 40) writes last element 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: number = 40;
      let r: Int8Array = arr.with(2, v);
      let r1: number = r[2];
      let e1: int = 40;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_0500
     * @tc.name int8ArrayWithPart01Test005
     * @tc.desc Verify with index=1 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let v: number = 50;
      let r: Int8Array = arr.with(1, v);
      let r1: number = r[1];
      let e1: int = 50;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_0600
     * @tc.name int8ArrayWithPart01Test006
     * @tc.desc Verify with(-1) writes value 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: number = 60;
      let r: Int8Array = arr.with(-1, v);
      let r1: number = r[2];
      let e1: int = 60;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_0700
     * @tc.name int8ArrayWithPart01Test007
     * @tc.desc Verify with index negative length writes first position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: number = 70;
      let r: Int8Array = arr.with(-3, v);
      let r1: number = r[0];
      let e1: int = 70;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_0800
     * @tc.name int8ArrayWithPart01Test008
     * @tc.desc Verify with index=-2 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let v: number = 80;
      let r: Int8Array = arr.with(-2, v);
      let r1: number = r[2];
      let e1: int = 80;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_0900
     * @tc.name int8ArrayWithPart01Test009
     * @tc.desc Verify with index=0 replaces only element of single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let v: number = 90;
      let r: Int8Array = arr.with(0, v);
      let r1: number = r[0];
      let e1: int = 90;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_1000
     * @tc.name int8ArrayWithPart01Test010
     * @tc.desc Verify with index=-1 index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let v: number = 100;
      let r: Int8Array = arr.with(-1, v);
      let r1: number = r[0];
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_1100
     * @tc.name int8ArrayWithPart01Test011
     * @tc.desc Verify 4 with(2, v) index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let v: number = 99;
      let r: Int8Array = arr.with(2, v);
      let r1: number = r[2];
      let e1: int = 99;
      expect(r1).assertEqual(e1);
      let r2: number = r[0];
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = r[1];
      let e3: int = 2;
      expect(r3).assertEqual(e3);
      let r4: number = r[3];
      let e4: int = 4;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_1200
     * @tc.name int8ArrayWithPart01Test012
     * @tc.desc Verify 4 with(-3, v) index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let v: number = 88;
      let r: Int8Array = arr.with(-3, v);
      let r1: number = r[1];
      let e1: int = 88;
      expect(r1).assertEqual(e1);
      let r2: number = r[0];
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = r[2];
      let e3: int = 3;
      expect(r3).assertEqual(e3);
      let r4: number = r[3];
      let e4: int = 4;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_1300
     * @tc.name int8ArrayWithPart01Test013
     * @tc.desc Verify 100 with(50, v) index 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(100);
      let v: number = 77;
      let r: Int8Array = arr.with(50, v);
      let r1: number = r[50];
      let e1: int = 77;
      expect(r1).assertEqual(e1);
      let r2: number = r[49];
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = r[51];
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_1400
     * @tc.name int8ArrayWithPart01Test014
     * @tc.desc Verify 2 with(-1, v)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20]);
      let v: number = 30;
      let r: Int8Array = arr.with(-1, v);
      let r1: number = r[1];
      let e1: int = 30;
      expect(r1).assertEqual(e1);
      let r2: number = r[0];
      let e2: int = 10;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_1500
     * @tc.name int8ArrayWithPart01Test015
     * @tc.desc Verify 2 with(-2, v)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20]);
      let v: number = 50;
      let r: Int8Array = arr.with(-2, v);
      let r1: number = r[0];
      let e1: int = 50;
      expect(r1).assertEqual(e1);
      let r2: number = r[1];
      let e2: int = 20;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_1600
     * @tc.name int8ArrayWithPart01Test016
     * @tc.desc Verify 100 with(0, byte 127)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(100);
      let v: number = 127;
      let r: Int8Array = arr.with(0, v);
      let r1: number = r[0];
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
      let r2: number = r[1];
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = r[99];
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_1700
     * @tc.name int8ArrayWithPart01Test017
     * @tc.desc Verify with value=byte 0 127 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX]);
      let v: number = 0;
      let r: Int8Array = arr.with(0, v);
      let r1: number = r[0];
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_1800
     * @tc.name int8ArrayWithPart01Test018
     * @tc.desc Verify with value=byte 1 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      let v: number = 1;
      let r: Int8Array = arr.with(0, v);
      let r1: number = r[0];
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_1900
     * @tc.name int8ArrayWithPart01Test019
     * @tc.desc Verify with value=byte 127 0 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      let v: number = 127;
      let r: Int8Array = arr.with(0, v);
      let r1: number = r[0];
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_2000
     * @tc.name int8ArrayWithPart01Test020
     * @tc.desc Verify with 42 byte 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42]);
      let v: number = 42;
      let r: Int8Array = arr.with(0, v);
      let r1: number = r[0];
      let e1: int = 42;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_2100
     * @tc.name int8ArrayWithPart01Test021
     * @tc.desc Verify with -128 byte 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr[0] = -128;
      let v: number = 0;
      let r: Int8Array = arr.with(0, v);
      let r1: number = r[0];
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_2200
     * @tc.name int8ArrayWithPart01Test022
     * @tc.desc Verify with -1 byte 255 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr[0] = -1;
      let v: number = 255;
      let r: Int8Array = arr.with(0, v);
      let r1: number = r[0];
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_2300
     * @tc.name int8ArrayWithPart01Test023
     * @tc.desc Verify with 127 byte 128 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX]);
      let v: number = 128;
      let r: Int8Array = arr.with(0, v);
      let r1: number = r[0];
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_2400
     * @tc.name int8ArrayWithPart01Test024
     * @tc.desc Verify with -56 byte 200 -56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      arr[0] = -56;
      let v: number = 200;
      let r: Int8Array = arr.with(0, v);
      let r1: number = r[0];
      let e1: int = -56;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_2500
     * @tc.name int8ArrayWithPart01Test025
     * @tc.desc Verify [7,7,7] with(1, byte 0) index 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 7, 7]);
      let v: number = 0;
      let r: Int8Array = arr.with(1, v);
      let r1: number = r[1];
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = r[0];
      let e2: int = 7;
      expect(r2).assertEqual(e2);
      let r3: number = r[2];
      let e3: int = 7;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_2600
     * @tc.name int8ArrayWithPart01Test026
     * @tc.desc Verify [-1,-2,-3] with(1, byte 127) index 1 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr[0] = -1;
      arr[1] = -2;
      arr[2] = -3;
      let v: number = 127;
      let r: Int8Array = arr.with(1, v);
      let r1: number = r[1];
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
      let r2: number = r[0];
      let e2: int = -1;
      expect(r2).assertEqual(e2);
      let r3: number = r[2];
      let e3: int = -3;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_2700
     * @tc.name int8ArrayWithPart01Test027
     * @tc.desc Verify [-128, 127] with(0, byte 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr[0] = -128;
      arr[1] = 127;
      let v: number = 0;
      let r: Int8Array = arr.with(0, v);
      let r1: number = r[0];
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = r[1];
      let e2: number = INT8_MAX;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_2800
     * @tc.name int8ArrayWithPart01Test028
     * @tc.desc Verify with(index, value) does not mutate original Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: number = 10;
      let r: Int8Array = arr.with(0, v);
      expect(r).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_2900
     * @tc.name int8ArrayWithPart01Test029
     * @tc.desc Verify with(index, value) does not mutate original array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: number = 99;
      arr.with(1, v);
      let r1: number = arr[0];
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = arr[1];
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = arr[2];
      let e3: int = 3;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_3000
     * @tc.name int8ArrayWithPart01Test030
     * @tc.desc Verify with(2, 25) returns new Int8Array with 3rd element replaced by 25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let v: number = 25;
      let r: Int8Array = arr.with(2, v);
      let r1: number = r[0];
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = r[1];
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = r[2];
      let e3: int = 25;
      expect(r3).assertEqual(e3);
      let r4: number = r[3];
      let e4: int = 40;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_3100
     * @tc.name int8ArrayWithPart01Test031
     * @tc.desc Verify with() returns new Int8Array with independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: number = 10;
      let r: Int8Array = arr.with(0, v);
      expect(r.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_3200
     * @tc.name int8ArrayWithPart01Test032
     * @tc.desc Verify with() result does not share buffer with original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: number = 10;
      let r: Int8Array = arr.with(0, v);
      r[1] = 50;
      let r1: number = arr[1];
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_3300
     * @tc.name int8ArrayWithPart01Test033
     * @tc.desc Verify 100 with 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(100);
      let v: number = 77;
      let r: Int8Array = arr.with(50, v);
      let r1: int = r.length;
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_3400
     * @tc.name int8ArrayWithPart01Test034
     * @tc.desc Verify chained with() calls: arr.with(0, 10).with(1, 20) produces new array with both elements replaced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let valA: number = 10;
      let valB: number = 20;
      let r: Int8Array = arr.with(0, valA).with(1, valB);
      let r1: number = r[0];
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = r[1];
      let e2: int = 20;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_3500
     * @tc.name int8ArrayWithPart01Test035
     * @tc.desc Verify with(1, 42) visible via at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: number = 42;
      let r: Int8Array = arr.with(1, v);
      let r1 = r.at(1);
      let e1: int = 42;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_3600
     * @tc.name int8ArrayWithPart01Test036
     * @tc.desc Verify buffer byteLength with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: number = 10;
      arr.with(0, v);
      let r1: int = arr.buffer.byteLength;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_3700
     * @tc.name int8ArrayWithPart01Test037
     * @tc.desc Verify independent with() calls return independent new arrays with respective values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let valA: number = 10;
      let valB: number = 20;
      let resultWithA: Int8Array = arr.with(0, valA);
      let resultWithB: Int8Array = arr.with(0, valB);
      let r1: number = resultWithA[0];
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = resultWithB[0];
      let e2: int = 20;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_3800
     * @tc.name int8ArrayWithPart01Test038
     * @tc.desc Verify with() result is independent of subsequent original array mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: number = 10;
      let r: Int8Array = arr.with(0, v);
      arr[1] = 99;
      let r1: number = r[1];
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_3900
     * @tc.name int8ArrayWithPart01Test039
     * @tc.desc Verify with(0) result subarray yields 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: number = 50;
      let r: Int8Array = arr.with(0, v);
      let sub: Int8Array = r.subarray(0, 2);
      let r1: int = sub.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = sub[0];
      let e2: int = 50;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_4000
     * @tc.name int8ArrayWithPart01Test040
     * @tc.desc Verify chained with(0).with(1).with(2) writes 10, 20, 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let valA: number = 10;
      let valB: number = 20;
      let valC: number = 30;
      let r: Int8Array = arr.with(0, valA).with(1, valB).with(2, valC);
      let r1: number = r[0];
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = r[1];
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = r[2];
      let e3: int = 30;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_4100
     * @tc.name int8ArrayWithPart01Test041
     * @tc.desc Verify with index equal length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: number = 10;
      try {
        arr.with(3, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_4200
     * @tc.name int8ArrayWithPart01Test042
     * @tc.desc Verify with index=2147483647 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: number = 10;
      try {
        arr.with(2147483647, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_4300
     * @tc.name int8ArrayWithPart01Test043
     * @tc.desc Verify with extreme negative index RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let v: number = 10;
      try {
        arr.with((arr.length - 2147483648).toInt(), v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_4400
     * @tc.name int8ArrayWithPart01Test044
     * @tc.desc Verify with index=0 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let v: number = 10;
      try {
        arr.with(0, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_4500
     * @tc.name int8ArrayWithPart01Test045
     * @tc.desc Verify with index=-1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let v: number = 10;
      try {
        arr.with(arr.length - 1, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_4600
     * @tc.name int8ArrayWithPart01Test046
     * @tc.desc Verify with index=1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let v: number = 10;
      try {
        arr.with(1, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_4700
     * @tc.name int8ArrayWithPart01Test047
     * @tc.desc Verify with 100 index=100 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(100);
      let v: number = 10;
      try {
        arr.with(100, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_4800
     * @tc.name int8ArrayWithPart01Test048
     * @tc.desc Verify with(2147483647) on empty array throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let v: number = 10;
      try {
        arr.with(2147483647, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_4900
     * @tc.name int8ArrayWithPart01Test049
     * @tc.desc Verify with(5) throws RangeError then with(0) works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let valA: number = 10;
      let valB: number = 20;
      try {
        arr.with(5, valA);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r: Int8Array = arr.with(0, valB);
      let r2: number = r[0];
      let e2: int = 20;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_5000
     * @tc.name int8ArrayWithPart01Test050
     * @tc.desc Verify with byte 128 -128 2 index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0]);
      let v: number = 128;
      let r: Int8Array = arr.with(1, v);
      let r1: number = r[1];
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2: number = arr[1];
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_5100
     * @tc.name int8ArrayWithPart01Test051
     * @tc.desc Verify with byte 255 -1 2 index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0]);
      let v: number = 255;
      let r: Int8Array = arr.with(0, v);
      let r1: number = r[0];
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      let r2: number = arr[0];
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_5200
     * @tc.name int8ArrayWithPart01Test052
     * @tc.desc Verify with byte 200 -56 [10, 20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20]);
      let v: number = 200;
      let r: Int8Array = arr.with(1, v);
      let r1: number = r[1];
      let e1: int = -56;
      expect(r1).assertEqual(e1);
      let r2: number = arr[1];
      let e2: int = 20;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_5300
     * @tc.name int8ArrayWithPart01Test053
     * @tc.desc Verify with 128 truncates copy keeps original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let arr: Int8Array = new Int8Array(buf);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      let v: number = 128;
      let r: Int8Array = arr.with(1, v);
      let r1: number = r[1];
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2: number = arr[1];
      let e2: int = 20;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_5400
     * @tc.name int8ArrayWithPart01Test054
     * @tc.desc Verify with two hundred truncates copy keeps original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array([1, 2, 3, 4]);
      let arr: Int8Array = base.subarray(1, 3);
      let v: number = 200;
      let r: Int8Array = arr.with(0, v);
      let r1: number = r[0];
      let e1: int = -56;
      expect(r1).assertEqual(e1);
      let r2: number = arr[0];
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_5500
     * @tc.name int8ArrayWithPart01Test055
     * @tc.desc Verify with byte 255 -1 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(100);
      let v: number = 255;
      let r: Int8Array = arr.with(99, v);
      let r1: number = r[99];
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      let r2: number = arr[99];
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_WITH_PART01_TEST_5600
     * @tc.name int8ArrayWithPart01Test056
     * @tc.desc Verify [-1,-2,-3] with(1, byte 0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayWithPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr[0] = -1;
      arr[1] = -2;
      arr[2] = -3;
      let v: number = 0;
      let r: Int8Array = arr.with(1, v);
      let r1: number = r[1];
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = r[0];
      let e2: int = -1;
      expect(r2).assertEqual(e2);
      let r3: number = r[2];
      let e3: int = -3;
      expect(r3).assertEqual(e3);
    });
  });
}
