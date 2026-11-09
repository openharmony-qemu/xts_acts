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
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

export default function int8ArraySetPart04Test(): void {
  describe('Int8ArraySetPart04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_0100
     * @tc.name int8ArraySetPart04Test001
     * @tc.desc Verify set(FixedArray<byte>, int) two-param standard call writes to position 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(2);
      const source: FixedArray<byte> = [1, 2];
      target.set(source, 0);
      let r1: number = target.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_0200
     * @tc.name int8ArraySetPart04Test002
     * @tc.desc Verify set(FixedArray<byte>, int) insertPos=1 offset write both params consumed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [1, 2];
      target.set(source, 1);
      let r1: number = target.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(1);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = target.$_get(2);
      let e3: int = 2;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_0300
     * @tc.name int8ArraySetPart04Test003
     * @tc.desc Verify set(FixedArray<byte>, int) insertPos=2 middle offset write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      const source: FixedArray<byte> = [1, 2];
      target.set(source, 2);
      let r1: number = target.$_get(2);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(3);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_0400
     * @tc.name int8ArraySetPart04Test004
     * @tc.desc Verify set single-element source writes one element rest stay zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [10];
      target.set(source, 0);
      let r1: number = target.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_0500
     * @tc.name int8ArraySetPart04Test005
     * @tc.desc Verify set multi-element source [1,2,3] consecutive write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [1, 2, 3];
      target.set(source, 0);
      let r1: number = target.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(2);
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_0600
     * @tc.name int8ArraySetPart04Test006
     * @tc.desc Verify set identical values source writes all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [5, 5, 5];
      target.set(source, 0);
      let r1: number = target.$_get(0);
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(2);
      let e2: int = 5;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_0700
     * @tc.name int8ArraySetPart04Test007
     * @tc.desc Verify set multi-element all-zero source writes all zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [0, 0, 0];
      target.set(source, 0);
      let r1: number = target.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(2);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_0800
     * @tc.name int8ArraySetPart04Test008
     * @tc.desc Verify set all negative source writes negatives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [-100, -50, -1];
      target.set(source, 0);
      let r1: number = target.$_get(0);
      let e1: int = -100;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(2);
      let e2: int = -1;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_0900
     * @tc.name int8ArraySetPart04Test009
     * @tc.desc Verify set all max source writes maxes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [127, 127, 127];
      target.set(source, 0);
      let r1: number = target.$_get(0);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(2);
      let e2: number = INT8_MAX;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_1000
     * @tc.name int8ArraySetPart04Test010
     * @tc.desc Verify set large 100-element source array bulk write first and last correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fill: byte = 7;
      const large: FixedArray<byte> = new FixedArray<byte>(100,0);
      for (let i = 0; i < 100; i++) {
        large[i] = fill;
      }
      const target = new Int8Array(100);
      target.set(large, 0);
      let r1: number = target.$_get(0);
      let e1: int = 7;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(99);
      let e2: int = 7;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_1100
     * @tc.name int8ArraySetPart04Test011
     * @tc.desc Verify set equal length overwrite at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      const source: FixedArray<byte> = [1, 2, 3, 4];
      target.set(source, 0);
      let r1: number = target.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(3);
      let e2: int = 4;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_1200
     * @tc.name int8ArraySetPart04Test012
     * @tc.desc Verify set source shorter than target partial write tail retains zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      const source: FixedArray<byte> = [1, 2];
      target.set(source, 0);
      let r1: number = target.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = target.$_get(3);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_1300
     * @tc.name int8ArraySetPart04Test013
     * @tc.desc Verify set tail position exact fit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      const source: FixedArray<byte> = [1, 2];
      target.set(source, 2);
      let r1: number = target.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(2);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = target.$_get(3);
      let e3: int = 2;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_1400
     * @tc.name int8ArraySetPart04Test014
     * @tc.desc Verify set matching values no observable change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      target.$_set(0, 5);
      target.$_set(1, 5);
      target.$_set(2, 5);
      target.$_set(3, 5);
      const source: FixedArray<byte> = [5, 5];
      target.set(source, 1);
      let r1: number = target.$_get(1);
      let e1: int = 5;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(2);
      let e2: int = 5;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_1500
     * @tc.name int8ArraySetPart04Test015
     * @tc.desc Verify set zero position writes beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      const source: FixedArray<byte> = [1, 2];
      target.set(source, 0);
      let r1: number = target.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(1);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_1600
     * @tc.name int8ArraySetPart04Test016
     * @tc.desc Verify insertPos=1 offset one position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      const source: FixedArray<byte> = [1, 2];
      target.set(source, 1);
      let r1: number = target.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(1);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = target.$_get(2);
      let e3: int = 2;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_1700
     * @tc.name int8ArraySetPart04Test017
     * @tc.desc Verify set tail boundary no error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      const source: FixedArray<byte> = [1, 2];
      target.set(source, 2);
      let r1: number = target.$_get(3);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_1800
     * @tc.name int8ArraySetPart04Test018
     * @tc.desc Verify set insertPos=INT_MAX weak assertion target unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      const source: FixedArray<byte> = [1, 2];
      try {
        target.set(source, 2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r2: number = target.$_get(0);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_1900
     * @tc.name int8ArraySetPart04Test019
     * @tc.desc Verify set empty source at length no op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      const source: FixedArray<byte> = [];
      target.set(source, 4);
      let r1: number = target.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(3);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_2000
     * @tc.name int8ArraySetPart04Test020
     * @tc.desc Verify set single element at tail position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      const source: FixedArray<byte> = [7];
      target.set(source, 3);
      let r1: number = target.$_get(2);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(3);
      let e2: int = 7;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_2100
     * @tc.name int8ArraySetPart04Test021
     * @tc.desc Verify set single element middle position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      const source: FixedArray<byte> = [9];
      target.set(source, 2);
      let r1: number = target.$_get(1);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(2);
      let e2: int = 9;
      expect(r2).assertEqual(e2);
      let r3: number = target.$_get(3);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_2200
     * @tc.name int8ArraySetPart04Test022
     * @tc.desc Verify set byte values written as is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(2);
      const source: FixedArray<byte> = [100, -100];
      target.set(source, 0);
      let r1: number = target.$_get(0);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(1);
      let e2: int = -100;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_2300
     * @tc.name int8ArraySetPart04Test023
     * @tc.desc Verify set three elements at one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(5);
      const source: FixedArray<byte> = [1, 2, 3];
      target.set(source, 1);
      let r1: number = target.$_get(1);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(2);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = target.$_get(3);
      let e3: int = 3;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_2400
     * @tc.name int8ArraySetPart04Test024
     * @tc.desc Verify set elements written at position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      const source: FixedArray<byte> = [8, 9];
      target.set(source, 1);
      let r1: number = target.$_get(1);
      let e1: int = 8;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(2);
      let e2: int = 9;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_2500
     * @tc.name int8ArraySetPart04Test025
     * @tc.desc Verify set side effect elements before insertPos remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      target.$_set(0, 3);
      const source: FixedArray<byte> = [1, 2];
      target.set(source, 2);
      let r1: number = target.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_2600
     * @tc.name int8ArraySetPart04Test026
     * @tc.desc Verify set side effect elements after write region unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      target.$_set(3, 6);
      const source: FixedArray<byte> = [1, 2];
      target.set(source, 0);
      let r1: number = target.$_get(2);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(3);
      let e2: int = 6;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_2700
     * @tc.name int8ArraySetPart04Test027
     * @tc.desc Verify set side effect source FixedArray not modified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [1, 2];
      target.set(source, 0);
      let r1: number = source[0];
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = source[1];
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_2800
     * @tc.name int8ArraySetPart04Test028
     * @tc.desc Verify set overwrites nonzero region
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      target.$_set(0, 9);
      target.$_set(1, 9);
      target.$_set(2, 9);
      target.$_set(3, 9);
      const source: FixedArray<byte> = [1, 2];
      target.set(source, 1);
      let r1: number = target.$_get(1);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(2);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_2900
     * @tc.name int8ArraySetPart04Test029
     * @tc.desc Verify set partial overwrite keeps rest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(5);
      target.$_set(0, 4);
      target.$_set(4, 7);
      const source: FixedArray<byte> = [1, 2, 3];
      target.set(source, 1);
      let r1: number = target.$_get(0);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(4);
      let e2: int = 7;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_3000
     * @tc.name int8ArraySetPart04Test030
     * @tc.desc Verify set then join reflects new values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [1, 2];
      target.set(source, 1);
      let r1: string = target.join(',');
      let e1: string = '0,1,2';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_3100
     * @tc.name int8ArraySetPart04Test031
     * @tc.desc Verify set then indexOf locates written value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      const source: FixedArray<byte> = [8, 9];
      target.set(source, 1);
      let r1: int = target.indexOf(9);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_3200
     * @tc.name int8ArraySetPart04Test032
     * @tc.desc Verify set then includes returns true for written value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      const source: FixedArray<byte> = [127];
      target.set(source, 2);
      let r1: boolean = target.includes(127);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_3300
     * @tc.name int8ArraySetPart04Test033
     * @tc.desc Verify set then at returns first source element at insertPos
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      const source: FixedArray<byte> = [6, 7];
      target.set(source, 1);
      let r1 = target.at(1);
      let e1: int = 6;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_3400
     * @tc.name int8ArraySetPart04Test034
     * @tc.desc Verify two consecutive legal set calls to different regions both effective
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(5);
      const s1: FixedArray<byte> = [1];
      const s2: FixedArray<byte> = [2, 3];
      target.set(s1, 0);
      target.set(s2, 3);
      let r1: number = target.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(3);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = target.$_get(4);
      let e3: int = 3;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_3500
     * @tc.name int8ArraySetPart04Test035
     * @tc.desc Verify target is subarray view set writes into view region shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Int8Array(6);
      const view = base.subarray(2, 5);
      const source: FixedArray<byte> = [1, 2, 3];
      view.set(source, 0);
      let r1: number = view.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = base.$_get(2);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = base.$_get(4);
      let e3: int = 3;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_3600
     * @tc.name int8ArraySetPart04Test036
     * @tc.desc Verify target is buffer view with byteOffset set writes at correct position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Int8Array(buf, 2, 4);
      const source: FixedArray<byte> = [1, 2];
      view.set(source, 1);
      let r1: number = view.$_get(1);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = view.$_get(2);
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_3700
     * @tc.name int8ArraySetPart04Test037
     * @tc.desc Verify set throw leaves target atomic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      target.$_set(0, 5);
      const source: FixedArray<byte> = [1, 2, 3, 4, 5];
      try {
        target.set(source, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r2: number = target.$_get(0);
      let e2: int = 5;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_3800
     * @tc.name int8ArraySetPart04Test038
     * @tc.desc Verify consecutive set second throws RangeError first write retained per-call atomic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      const s1: FixedArray<byte> = [1, 2];
      target.set(s1, 0);
      const s2: FixedArray<byte> = [3, 4, 5];
      try {
        target.set(s2, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r2: number = target.$_get(0);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = target.$_get(1);
      let e3: int = 2;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_3900
     * @tc.name int8ArraySetPart04Test039
     * @tc.desc Verify set min value written read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(2);
      const source: FixedArray<byte> = [-128];
      target.set(source, 0);
      let r1: number = target.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_4000
     * @tc.name int8ArraySetPart04Test040
     * @tc.desc Verify set max value written read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(2);
      const source: FixedArray<byte> = [127];
      target.set(source, 0);
      let r1: number = target.$_get(0);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_4100
     * @tc.name int8ArraySetPart04Test041
     * @tc.desc Verify set zero written read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(2);
      const source: FixedArray<byte> = [0];
      target.set(source, 0);
      let r1: number = target.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_4200
     * @tc.name int8ArraySetPart04Test042
     * @tc.desc Verify set negative one written read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(2);
      const source: FixedArray<byte> = [-1];
      target.set(source, 0);
      let r1: number = target.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_4300
     * @tc.name int8ArraySetPart04Test043
     * @tc.desc Verify set one written read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(2);
      const source: FixedArray<byte> = [1];
      target.set(source, 0);
      let r1: number = target.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_4400
     * @tc.name int8ArraySetPart04Test044
     * @tc.desc Verify set min max pair read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(2);
      const source: FixedArray<byte> = [-128, 127];
      target.set(source, 0);
      let r1: number = target.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(1);
      let e2: number = INT8_MAX;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_4500
     * @tc.name int8ArraySetPart04Test045
     * @tc.desc Verify set max min pair read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(2);
      const source: FixedArray<byte> = [127, -128];
      target.set(source, 0);
      let r1: number = target.$_get(0);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(1);
      let e2: number = INT8_MIN;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_4600
     * @tc.name int8ArraySetPart04Test046
     * @tc.desc Verify set min at tail read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [-128];
      target.set(source, 2);
      let r1: number = target.$_get(2);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(0);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_4700
     * @tc.name int8ArraySetPart04Test047
     * @tc.desc Verify set max middle read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      const source: FixedArray<byte> = [127];
      target.set(source, 2);
      let r1: number = target.$_get(2);
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_4800
     * @tc.name int8ArraySetPart04Test048
     * @tc.desc Verify set zero overwrites prefilled nine
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      target.$_set(1, 99);
      const source: FixedArray<byte> = [0];
      target.set(source, 1);
      let r1: number = target.$_get(1);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_4900
     * @tc.name int8ArraySetPart04Test049
     * @tc.desc Verify source [-128] written at offset 1 read back -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [-128];
      target.set(source, 1);
      let r1: number = target.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(1);
      let e2: number = INT8_MIN;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_5000
     * @tc.name int8ArraySetPart04Test050
     * @tc.desc Verify source [127] written at tail offset read back 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [127];
      target.set(source, 2);
      let r1: number = target.$_get(1);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(2);
      let e2: number = INT8_MAX;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_5100
     * @tc.name int8ArraySetPart04Test051
     * @tc.desc Verify source [-1] written at offset 1 read back -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      const source: FixedArray<byte> = [-1];
      target.set(source, 1);
      let r1: number = target.$_get(1);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(0);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_5200
     * @tc.name int8ArraySetPart04Test052
     * @tc.desc Verify set one overwrites prefilled value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      target.$_set(0, 88);
      const source: FixedArray<byte> = [1];
      target.set(source, 0);
      let r1: number = target.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_5300
     * @tc.name int8ArraySetPart04Test053
     * @tc.desc Verify set alternating boundary quad read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(4);
      const source: FixedArray<byte> = [-128, 127, -128, 127];
      target.set(source, 0);
      let r1: number = target.$_get(0);
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(3);
      let e2: number = INT8_MAX;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART04_TEST_5400
     * @tc.name int8ArraySetPart04Test054
     * @tc.desc Verify set zero pair overwrites prefilled values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Int8Array(3);
      target.$_set(0, 5);
      target.$_set(1, 5);
      const source: FixedArray<byte> = [0, 0];
      target.set(source, 0);
      let r1: number = target.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = target.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });
  });
}
