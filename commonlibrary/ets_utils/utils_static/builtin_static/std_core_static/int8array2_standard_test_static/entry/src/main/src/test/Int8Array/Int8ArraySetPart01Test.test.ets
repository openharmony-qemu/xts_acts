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

export default function int8ArraySetPart01Test(): void {
  describe('Int8ArraySetPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_0100
     * @tc.name int8ArraySetPart01Test001
     * @tc.desc Verify set(insertPos, val) overload1 two-param standard call writes to position 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      const v: byte = 42;
      arr.set(0, v);
      let pos0Value: number = arr.$_get(0);
      let expectedPos0Value: int = 42;
      expect(pos0Value).assertEqual(expectedPos0Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_0200
     * @tc.name int8ArraySetPart01Test002
     * @tc.desc Verify set(insertPos, val) insertPos=0 overwrites first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      const v: byte = 7;
      arr.set(0, v);
      let pos0Value: number = arr.$_get(0);
      let expectedPos0Value: int = 7;
      expect(pos0Value).assertEqual(expectedPos0Value);
      let pos1Value: number = arr.$_get(1);
      let expectedPos1Value: int = 20;
      expect(pos1Value).assertEqual(expectedPos1Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_0300
     * @tc.name int8ArraySetPart01Test003
     * @tc.desc Verify set(insertPos, val) insertPos=length-1 writes last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      const v: byte = 7;
      arr.set(2, v);
      let pos2Value: number = arr.$_get(2);
      let expectedPos2Value: int = 7;
      expect(pos2Value).assertEqual(expectedPos2Value);
      let pos1Value: number = arr.$_get(1);
      let expectedPos1Value: int = 20;
      expect(pos1Value).assertEqual(expectedPos1Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_0400
     * @tc.name int8ArraySetPart01Test004
     * @tc.desc Verify set(insertPos, val) insertPos=1 writes middle position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      const v: byte = 7;
      arr.set(1, v);
      let pos1Value: number = arr.$_get(1);
      let expectedPos1Value: int = 7;
      expect(pos1Value).assertEqual(expectedPos1Value);
      let pos0Value: number = arr.$_get(0);
      let expectedPos0Value: int = 10;
      expect(pos0Value).assertEqual(expectedPos0Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_0500
     * @tc.name int8ArraySetPart01Test005
     * @tc.desc Verify set(insertPos, val) val=0 writes default zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      const v: byte = 0;
      arr.set(1, v);
      let pos1Value: number = arr.$_get(1);
      let expectedPos1Value: int = 0;
      expect(pos1Value).assertEqual(expectedPos1Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_0600
     * @tc.name int8ArraySetPart01Test006
     * @tc.desc Verify set(insertPos, val) val=127 writes int8 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      const v: byte = 127;
      arr.set(1, v);
      let pos1Value: number = arr.$_get(1);
      let expectedPos1Value: number = INT8_MAX;
      expect(pos1Value).assertEqual(expectedPos1Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_0700
     * @tc.name int8ArraySetPart01Test007
     * @tc.desc Verify set(insertPos, val) val=-128 writes int8 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      const v: byte = -128;
      arr.set(1, v);
      let pos1Value: number = arr.$_get(1);
      let expectedPos1Value: number = INT8_MIN;
      expect(pos1Value).assertEqual(expectedPos1Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_0800
     * @tc.name int8ArraySetPart01Test008
     * @tc.desc Verify set(insertPos, val) val=1 writes ordinary positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      const v: byte = 1;
      arr.set(0, v);
      let pos0Value: number = arr.$_get(0);
      let expectedPos0Value: int = 1;
      expect(pos0Value).assertEqual(expectedPos0Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_0900
     * @tc.name int8ArraySetPart01Test009
     * @tc.desc Verify set(insertPos, val) val=-1 writes ordinary negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(10, 20, 30);
      const v: byte = -1;
      arr.set(0, v);
      let pos0Value: number = arr.$_get(0);
      let expectedPos0Value: int = -1;
      expect(pos0Value).assertEqual(expectedPos0Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_1000
     * @tc.name int8ArraySetPart01Test010
     * @tc.desc Verify set writes correct value to position 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      const v: byte = 5;
      arr.set(0, v);
      let pos0Value: number = arr.$_get(0);
      let expectedPos0Value: int = 5;
      expect(pos0Value).assertEqual(expectedPos0Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_1100
     * @tc.name int8ArraySetPart01Test011
     * @tc.desc Verify $_get reads value consistent with set value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      const v: byte = 88;
      arr.set(1, v);
      let pos1Value: number = arr.$_get(1);
      let expectedPos1Value: int = 88;
      expect(pos1Value).assertEqual(expectedPos1Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_1200
     * @tc.name int8ArraySetPart01Test012
     * @tc.desc Verify length remains unchanged after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      const v: byte = 33;
      arr.set(2, v);
      let lengthValue: int = arr.length;
      let expectedLengthValue: int = 4;
      expect(lengthValue).assertEqual(expectedLengthValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_1300
     * @tc.name int8ArraySetPart01Test013
     * @tc.desc Verify unaffected elements keep original values after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(11, 22, 33, 44);
      const v: byte = 99;
      arr.set(1, v);
      let pos0Value: number = arr.$_get(0);
      let expectedPos0Value: int = 11;
      expect(pos0Value).assertEqual(expectedPos0Value);
      let pos2Value: number = arr.$_get(2);
      let expectedPos2Value: int = 33;
      expect(pos2Value).assertEqual(expectedPos2Value);
      let pos3Value: number = arr.$_get(3);
      let expectedPos3Value: int = 44;
      expect(pos3Value).assertEqual(expectedPos3Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_1400
     * @tc.name int8ArraySetPart01Test014
     * @tc.desc Verify set overwriting non-default value loses original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(100, 100, 100);
      const v: byte = 50;
      arr.set(1, v);
      let pos1Value: number = arr.$_get(1);
      let expectedPos1Value: int = 50;
      expect(pos1Value).assertEqual(expectedPos1Value);
      let pos0Value: number = arr.$_get(0);
      let expectedPos0Value: int = 100;
      expect(pos0Value).assertEqual(expectedPos0Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_1500
     * @tc.name int8ArraySetPart01Test015
     * @tc.desc Verify consecutive set on same position overwrites previous value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      const firstValue: byte = 11;
      const secondValue: byte = 22;
      arr.set(0, firstValue);
      arr.set(0, secondValue);
      let pos0Value: number = arr.$_get(0);
      let expectedPos0Value: int = 22;
      expect(pos0Value).assertEqual(expectedPos0Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_1600
     * @tc.name int8ArraySetPart01Test016
     * @tc.desc Verify multi-position sequential set values are independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      const a: byte = 5;
      const b: byte = 15;
      const c: byte = 25;
      arr.set(0, a);
      arr.set(1, b);
      arr.set(2, c);
      let pos0Value: number = arr.$_get(0);
      let expectedPos0Value: int = 5;
      expect(pos0Value).assertEqual(expectedPos0Value);
      let pos1Value: number = arr.$_get(1);
      let expectedPos1Value: int = 15;
      expect(pos1Value).assertEqual(expectedPos1Value);
      let pos2Value: number = arr.$_get(2);
      let expectedPos2Value: int = 25;
      expect(pos2Value).assertEqual(expectedPos2Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_1700
     * @tc.name int8ArraySetPart01Test017
     * @tc.desc Verify set on single-element Int8Array writes unique position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(1);
      const v: byte = 77;
      arr.set(0, v);
      let pos0Value: number = arr.$_get(0);
      let expectedPos0Value: int = 77;
      expect(pos0Value).assertEqual(expectedPos0Value);
      let lengthValue: int = arr.length;
      let expectedLengthValue: int = 1;
      expect(lengthValue).assertEqual(expectedLengthValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_1800
     * @tc.name int8ArraySetPart01Test018
     * @tc.desc Verify byteOffset unchanged after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int8Array = new Int8Array(buf, 1, 2);
      let before: int = arr.byteOffset;
      const v: byte = 9;
      arr.set(0, v);
      let byteOffsetValue: int = arr.byteOffset;
      let expectedByteOffsetValue: int = before;
      expect(byteOffsetValue).assertEqual(expectedByteOffsetValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_1900
     * @tc.name int8ArraySetPart01Test019
     * @tc.desc Verify underlying buffer reference unchanged after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int8Array = new Int8Array(buf, 0, 4);
      const v: byte = 9;
      arr.set(0, v);
      let bufferValue: ArrayBuffer = arr.buffer;
      let expectedBufferValue: ArrayBuffer = buf;
      expect(bufferValue).assertEqual(expectedBufferValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_2000
     * @tc.name int8ArraySetPart01Test020
     * @tc.desc Verify toString reflects new value after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      const v: byte = 8;
      arr.set(1, v);
      let strValue: string = arr.toString();
      let expectedStrValue: string = '1,8,3';
      expect(strValue).assertEqual(expectedStrValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_2100
     * @tc.name int8ArraySetPart01Test021
     * @tc.desc Verify entries iterator contains new value after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      const v: byte = 9;
      arr.set(0, v);
      let iter = arr.entries();
      let nextVal = iter.next();
      let first = nextVal.value as [int, number];
      let entryValue: number = first[1];
      let expectedEntryValue: int = 9;
      expect(entryValue).assertEqual(expectedEntryValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_2200
     * @tc.name int8ArraySetPart01Test022
     * @tc.desc Verify keys iterator range unchanged after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      const v: byte = 9;
      arr.set(2, v);
      let iter = arr.keys();
      let key0 = iter.next().value as int;
      let key1 = iter.next().value as int;
      let key2 = iter.next().value as int;
      expect(key0).assertEqual(0);
      expect(key1).assertEqual(1);
      expect(key2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_2300
     * @tc.name int8ArraySetPart01Test023
     * @tc.desc Verify values iterator contains new value after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      const v: byte = 9;
      arr.set(1, v);
      let iter = arr.values();
      iter.next();
      let second = iter.next().value as number;
      expect(second).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_2400
     * @tc.name int8ArraySetPart01Test024
     * @tc.desc Verify set(array, offset) overload8 two-param standard call copies from offset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = new Int8Array(3);
      let src: Int8Array = Int8Array.of(1, 2, 3);
      dst.set(src, 0);
      let pos0Value: number = dst.$_get(0);
      let expectedPos0Value: int = 1;
      expect(pos0Value).assertEqual(expectedPos0Value);
      let pos1Value: number = dst.$_get(1);
      let expectedPos1Value: int = 2;
      expect(pos1Value).assertEqual(expectedPos1Value);
      let pos2Value: number = dst.$_get(2);
      let expectedPos2Value: int = 3;
      expect(pos2Value).assertEqual(expectedPos2Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_2500
     * @tc.name int8ArraySetPart01Test025
     * @tc.desc Verify set(array, offset) empty source on non-empty target leaves target unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = Int8Array.of(10, 20, 30);
      let src: Int8Array = new Int8Array(0);
      dst.set(src, 0);
      let pos0Value: number = dst.$_get(0);
      let expectedPos0Value: int = 10;
      expect(pos0Value).assertEqual(expectedPos0Value);
      let pos1Value: number = dst.$_get(1);
      let expectedPos1Value: int = 20;
      expect(pos1Value).assertEqual(expectedPos1Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_2600
     * @tc.name int8ArraySetPart01Test026
     * @tc.desc Verify set(array, offset) single-element source set to target first position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = Int8Array.of(10, 20, 30);
      let src: Int8Array = Int8Array.of(99);
      dst.set(src, 0);
      let pos0Value: number = dst.$_get(0);
      let expectedPos0Value: int = 99;
      expect(pos0Value).assertEqual(expectedPos0Value);
      let pos1Value: number = dst.$_get(1);
      let expectedPos1Value: int = 20;
      expect(pos1Value).assertEqual(expectedPos1Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_2700
     * @tc.name int8ArraySetPart01Test027
     * @tc.desc Verify set(array, offset) multi-element source overwrites target front segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = Int8Array.of(0, 0, 0, 0);
      let src: Int8Array = Int8Array.of(5, 6, 7);
      dst.set(src, 0);
      let pos0Value: number = dst.$_get(0);
      let expectedPos0Value: int = 5;
      expect(pos0Value).assertEqual(expectedPos0Value);
      let pos1Value: number = dst.$_get(1);
      let expectedPos1Value: int = 6;
      expect(pos1Value).assertEqual(expectedPos1Value);
      let pos2Value: number = dst.$_get(2);
      let expectedPos2Value: int = 7;
      expect(pos2Value).assertEqual(expectedPos2Value);
      let pos3Value: number = dst.$_get(3);
      let expectedPos3Value: int = 0;
      expect(pos3Value).assertEqual(expectedPos3Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_2800
     * @tc.name int8ArraySetPart01Test028
     * @tc.desc Verify set(array, offset) source with -128 boundary value correctly copied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = new Int8Array(2);
      let src: Int8Array = Int8Array.of(-128, 0);
      dst.set(src, 0);
      let pos0Value: number = dst.$_get(0);
      let expectedPos0Value: number = INT8_MIN;
      expect(pos0Value).assertEqual(expectedPos0Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_2900
     * @tc.name int8ArraySetPart01Test029
     * @tc.desc Verify set(array, offset) source with 127 boundary value correctly copied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = new Int8Array(2);
      let src: Int8Array = Int8Array.of(127, 0);
      dst.set(src, 0);
      let pos0Value: number = dst.$_get(0);
      let expectedPos0Value: number = INT8_MAX;
      expect(pos0Value).assertEqual(expectedPos0Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_3000
     * @tc.name int8ArraySetPart01Test030
     * @tc.desc Verify set(array, offset) source with default zero correctly copied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = Int8Array.of(99, 99);
      let src: Int8Array = Int8Array.of(0, 0);
      dst.set(src, 0);
      let pos0Value: number = dst.$_get(0);
      let expectedPos0Value: int = 0;
      expect(pos0Value).assertEqual(expectedPos0Value);
      let pos1Value: number = dst.$_get(1);
      let expectedPos1Value: int = 0;
      expect(pos1Value).assertEqual(expectedPos1Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_3100
     * @tc.name int8ArraySetPart01Test031
     * @tc.desc Verify set(array, offset) source with mixed [-128,0,127] boundary values correctly copied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = new Int8Array(3);
      let src: Int8Array = Int8Array.of(-128, 0, 127);
      dst.set(src, 0);
      let pos0Value: number = dst.$_get(0);
      let expectedPos0Value: number = INT8_MIN;
      expect(pos0Value).assertEqual(expectedPos0Value);
      let pos1Value: number = dst.$_get(1);
      let expectedPos1Value: int = 0;
      expect(pos1Value).assertEqual(expectedPos1Value);
      let pos2Value: number = dst.$_get(2);
      let expectedPos2Value: number = INT8_MAX;
      expect(pos2Value).assertEqual(expectedPos2Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_3200
     * @tc.name int8ArraySetPart01Test032
     * @tc.desc Verify set(array, offset) source length equals target length fills completely at offset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = new Int8Array(3);
      let src: Int8Array = Int8Array.of(1, 2, 3);
      dst.set(src, 0);
      let pos0Value: number = dst.$_get(0);
      let expectedPos0Value: int = 1;
      expect(pos0Value).assertEqual(expectedPos0Value);
      let pos2Value: number = dst.$_get(2);
      let expectedPos2Value: int = 3;
      expect(pos2Value).assertEqual(expectedPos2Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_3300
     * @tc.name int8ArraySetPart01Test033
     * @tc.desc Verify set(array, offset) large source array 100 elements to equal-length target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = new Int8Array(100);
      let src: Int8Array = new Int8Array(100);
      const sv0: byte = 1;
      const sv99: byte = 2;
      src.set(0, sv0);
      src.set(99, sv99);
      dst.set(src, 0);
      let pos0Value: number = dst.$_get(0);
      let expectedPos0Value: int = 1;
      expect(pos0Value).assertEqual(expectedPos0Value);
      let pos99Value: number = dst.$_get(99);
      let expectedPos99Value: int = 2;
      expect(pos99Value).assertEqual(expectedPos99Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_3400
     * @tc.name int8ArraySetPart01Test034
     * @tc.desc Verify set(array, offset) self-copy equal reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      arr.set(arr, 0);
      let pos0Value: number = arr.$_get(0);
      let expectedPos0Value: int = 1;
      expect(pos0Value).assertEqual(expectedPos0Value);
      let pos1Value: number = arr.$_get(1);
      let expectedPos1Value: int = 2;
      expect(pos1Value).assertEqual(expectedPos1Value);
      let pos2Value: number = arr.$_get(2);
      let expectedPos2Value: int = 3;
      expect(pos2Value).assertEqual(expectedPos2Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_3500
     * @tc.name int8ArraySetPart01Test035
     * @tc.desc Verify set(array, offset) offset=0 copies from target start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = Int8Array.of(9, 9, 9, 9);
      let src: Int8Array = Int8Array.of(1, 2);
      dst.set(src, 0);
      let pos0Value: number = dst.$_get(0);
      let expectedPos0Value: int = 1;
      expect(pos0Value).assertEqual(expectedPos0Value);
      let pos1Value: number = dst.$_get(1);
      let expectedPos1Value: int = 2;
      expect(pos1Value).assertEqual(expectedPos1Value);
      let pos2Value: number = dst.$_get(2);
      let expectedPos2Value: int = 9;
      expect(pos2Value).assertEqual(expectedPos2Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_3600
     * @tc.name int8ArraySetPart01Test036
     * @tc.desc Verify set(array, offset) offset=1 copies from middle position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = Int8Array.of(9, 9, 9, 9);
      let src: Int8Array = Int8Array.of(1, 2);
      dst.set(src, 1);
      let pos0Value: number = dst.$_get(0);
      let expectedPos0Value: int = 9;
      expect(pos0Value).assertEqual(expectedPos0Value);
      let pos1Value: number = dst.$_get(1);
      let expectedPos1Value: int = 1;
      expect(pos1Value).assertEqual(expectedPos1Value);
      let pos2Value: number = dst.$_get(2);
      let expectedPos2Value: int = 2;
      expect(pos2Value).assertEqual(expectedPos2Value);
      let pos3Value: number = dst.$_get(3);
      let expectedPos3Value: int = 9;
      expect(pos3Value).assertEqual(expectedPos3Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_3700
     * @tc.name int8ArraySetPart01Test037
     * @tc.desc Verify set(array, offset) offset=length-1 source length 1 fills last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = Int8Array.of(9, 9, 9);
      let src: Int8Array = Int8Array.of(7);
      dst.set(src, 2);
      let pos2Value: number = dst.$_get(2);
      let expectedPos2Value: int = 7;
      expect(pos2Value).assertEqual(expectedPos2Value);
      let pos1Value: number = dst.$_get(1);
      let expectedPos1Value: int = 9;
      expect(pos1Value).assertEqual(expectedPos1Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_3800
     * @tc.name int8ArraySetPart01Test038
     * @tc.desc Verify set(array, offset) offset=length empty source no error target unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = Int8Array.of(1, 2, 3);
      let src: Int8Array = new Int8Array(0);
      dst.set(src, 3);
      let pos0Value: number = dst.$_get(0);
      let expectedPos0Value: int = 1;
      expect(pos0Value).assertEqual(expectedPos0Value);
      let lengthValue: int = dst.length;
      let expectedLengthValue: int = 3;
      expect(lengthValue).assertEqual(expectedLengthValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_3900
     * @tc.name int8ArraySetPart01Test039
     * @tc.desc Verify set(array, offset) offset=-1 negative behavior check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = Int8Array.of(1, 2, 3);
      let src: Int8Array = Int8Array.of(7);
      try {
        dst.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_4000
     * @tc.name int8ArraySetPart01Test040
     * @tc.desc Verify set(array, offset) offset=-length negative to first behavior check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = Int8Array.of(1, 2, 3);
      let src: Int8Array = Int8Array.of(7);
      try {
        dst.set(src, -3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_4100
     * @tc.name int8ArraySetPart01Test041
     * @tc.desc Verify set(array, offset) offset=-length-1 negative out-of-bounds behavior check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = Int8Array.of(1, 2, 3);
      let src: Int8Array = Int8Array.of(7);
      try {
        dst.set(src, -4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_4200
     * @tc.name int8ArraySetPart01Test042
     * @tc.desc Verify set(array, offset) writes correct values at offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = new Int8Array(3);
      let src: Int8Array = Int8Array.of(1, 2, 3);
      dst.set(src, 0);
      let pos0Value: number = dst.$_get(0);
      let expectedPos0Value: int = 1;
      expect(pos0Value).assertEqual(expectedPos0Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_4300
     * @tc.name int8ArraySetPart01Test043
     * @tc.desc Verify set(array, offset) target multi-element content correct after copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = new Int8Array(4);
      let src: Int8Array = Int8Array.of(11, 22, 33);
      dst.set(src, 1);
      let pos1Value: number = dst.$_get(1);
      let expectedPos1Value: int = 11;
      expect(pos1Value).assertEqual(expectedPos1Value);
      let pos2Value: number = dst.$_get(2);
      let expectedPos2Value: int = 22;
      expect(pos2Value).assertEqual(expectedPos2Value);
      let pos3Value: number = dst.$_get(3);
      let expectedPos3Value: int = 33;
      expect(pos3Value).assertEqual(expectedPos3Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_4400
     * @tc.name int8ArraySetPart01Test044
     * @tc.desc Verify set(array, offset) target length unchanged after copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = new Int8Array(5);
      let src: Int8Array = Int8Array.of(1, 2);
      dst.set(src, 0);
      let lengthValue: int = dst.length;
      let expectedLengthValue: int = 5;
      expect(lengthValue).assertEqual(expectedLengthValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_4500
     * @tc.name int8ArraySetPart01Test045
     * @tc.desc Verify set(array, offset) target unaffected area keeps original values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = Int8Array.of(10, 20, 30, 40);
      let src: Int8Array = Int8Array.of(99, 99);
      dst.set(src, 1);
      let pos0Value: number = dst.$_get(0);
      let expectedPos0Value: int = 10;
      expect(pos0Value).assertEqual(expectedPos0Value);
      let pos3Value: number = dst.$_get(3);
      let expectedPos3Value: int = 40;
      expect(pos3Value).assertEqual(expectedPos3Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_4600
     * @tc.name int8ArraySetPart01Test046
     * @tc.desc Verify set(array, offset) overwriting target area loses original values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = Int8Array.of(100, 100, 100);
      let src: Int8Array = Int8Array.of(1, 2);
      dst.set(src, 1);
      let pos1Value: number = dst.$_get(1);
      let expectedPos1Value: int = 1;
      expect(pos1Value).assertEqual(expectedPos1Value);
      let pos2Value: number = dst.$_get(2);
      let expectedPos2Value: int = 2;
      expect(pos2Value).assertEqual(expectedPos2Value);
      let pos0Value: number = dst.$_get(0);
      let expectedPos0Value: int = 100;
      expect(pos0Value).assertEqual(expectedPos0Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_4700
     * @tc.name int8ArraySetPart01Test047
     * @tc.desc Verify set(array, offset) offset+sourceLength exceeds targetLength by 1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = new Int8Array(3);
      let src: Int8Array = Int8Array.of(1, 2, 3, 4);
      try {
        dst.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_4800
     * @tc.name int8ArraySetPart01Test048
     * @tc.desc Verify set(array, offset) offset=length-1 source length 1 fills last position no error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = new Int8Array(4);
      let src: Int8Array = Int8Array.of(77);
      dst.set(src, 3);
      let pos3Value: number = dst.$_get(3);
      let expectedPos3Value: int = 77;
      expect(pos3Value).assertEqual(expectedPos3Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_4900
     * @tc.name int8ArraySetPart01Test049
     * @tc.desc Verify set(array, offset) offset=length source length 1 overflow throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = new Int8Array(4);
      let src: Int8Array = Int8Array.of(77);
      try {
        dst.set(src, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_5000
     * @tc.name int8ArraySetPart01Test050
     * @tc.desc Verify set(array, offset) offset=length-1 source length 2 overflow by 1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = new Int8Array(4);
      let src: Int8Array = Int8Array.of(1, 2);
      try {
        dst.set(src, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_5100
     * @tc.name int8ArraySetPart01Test051
     * @tc.desc Verify set(array, offset) same buffer overlapping region set front segment to back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let view: Int8Array = new Int8Array(buf);
      let init: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      view.set(init, 0);
      let src: Int8Array = new Int8Array(buf, 0, 3);
      let dst: Int8Array = new Int8Array(buf, 2, 3);
      dst.set(src, 0);
      let pos0Value: number = view.$_get(0);
      let expectedPos0Value: int = 1;
      expect(pos0Value).assertEqual(expectedPos0Value);
      let pos2Value: number = view.$_get(2);
      let expectedPos2Value: int = 1;
      expect(pos2Value).assertEqual(expectedPos2Value);
      let pos3Value: number = view.$_get(3);
      let expectedPos3Value: int = 2;
      expect(pos3Value).assertEqual(expectedPos3Value);
      let pos4Value: number = view.$_get(4);
      let expectedPos4Value: int = 3;
      expect(pos4Value).assertEqual(expectedPos4Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_5200
     * @tc.name int8ArraySetPart01Test052
     * @tc.desc Verify set(array, offset) same buffer overlapping region set back segment to front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let view: Int8Array = new Int8Array(buf);
      let init: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      view.set(init, 0);
      let src: Int8Array = new Int8Array(buf, 2, 3);
      let dst: Int8Array = new Int8Array(buf, 0, 3);
      dst.set(src, 0);
      let pos0Value: number = view.$_get(0);
      let expectedPos0Value: int = 3;
      expect(pos0Value).assertEqual(expectedPos0Value);
      let pos1Value: number = view.$_get(1);
      let expectedPos1Value: int = 4;
      expect(pos1Value).assertEqual(expectedPos1Value);
      let pos2Value: number = view.$_get(2);
      let expectedPos2Value: int = 5;
      expect(pos2Value).assertEqual(expectedPos2Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_5300
     * @tc.name int8ArraySetPart01Test053
     * @tc.desc Verify set(array, offset) subarray source set to parent array at specified position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4, 5);
      let sub: Int8Array = arr.subarray(0, 2);
      arr.set(sub, 3);
      let pos3Value: number = arr.$_get(3);
      let expectedPos3Value: int = 1;
      expect(pos3Value).assertEqual(expectedPos3Value);
      let pos4Value: number = arr.$_get(4);
      let expectedPos4Value: int = 2;
      expect(pos4Value).assertEqual(expectedPos4Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_5400
     * @tc.name int8ArraySetPart01Test054
     * @tc.desc Verify set(array, offset) subarray target receives source write reflected to parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0, 0, 0, 0, 0);
      let sub: Int8Array = arr.subarray(1, 4);
      let src: Int8Array = Int8Array.of(7, 8, 9);
      sub.set(src, 0);
      let pos1Value: number = arr.$_get(1);
      let expectedPos1Value: int = 7;
      expect(pos1Value).assertEqual(expectedPos1Value);
      let pos2Value: number = arr.$_get(2);
      let expectedPos2Value: int = 8;
      expect(pos2Value).assertEqual(expectedPos2Value);
      let pos3Value: number = arr.$_get(3);
      let expectedPos3Value: int = 9;
      expect(pos3Value).assertEqual(expectedPos3Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_5500
     * @tc.name int8ArraySetPart01Test055
     * @tc.desc Verify set(array, offset) same buffer non-overlapping regions set independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let view: Int8Array = new Int8Array(buf);
      let init: Int8Array = Int8Array.of(1, 2, 3, 4, 5, 6);
      view.set(init, 0);
      let src: Int8Array = new Int8Array(buf, 0, 3);
      let dst: Int8Array = new Int8Array(buf, 3, 3);
      dst.set(src, 0);
      let pos0Value: number = view.$_get(0);
      let expectedPos0Value: int = 1;
      expect(pos0Value).assertEqual(expectedPos0Value);
      let pos3Value: number = view.$_get(3);
      let expectedPos3Value: int = 1;
      expect(pos3Value).assertEqual(expectedPos3Value);
      let pos4Value: number = view.$_get(4);
      let expectedPos4Value: int = 2;
      expect(pos4Value).assertEqual(expectedPos4Value);
      let pos5Value: number = view.$_get(5);
      let expectedPos5Value: int = 3;
      expect(pos5Value).assertEqual(expectedPos5Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_5600
     * @tc.name int8ArraySetPart01Test056
     * @tc.desc Verify set(array, offset) source modification does not affect target with independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = new Int8Array(3);
      let src: Int8Array = Int8Array.of(1, 2, 3);
      dst.set(src, 0);
      const nv: byte = 99;
      src.set(0, nv);
      let pos0Value: number = dst.$_get(0);
      let expectedPos0Value: int = 1;
      expect(pos0Value).assertEqual(expectedPos0Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_5700
     * @tc.name int8ArraySetPart01Test057
     * @tc.desc Verify set(array, offset) multiple set accumulates in different regions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = new Int8Array(6);
      let s1: Int8Array = Int8Array.of(1, 2);
      let s2: Int8Array = Int8Array.of(3, 4);
      let s3: Int8Array = Int8Array.of(5, 6);
      dst.set(s1, 0);
      dst.set(s2, 2);
      dst.set(s3, 4);
      let pos0Value: number = dst.$_get(0);
      let expectedPos0Value: int = 1;
      expect(pos0Value).assertEqual(expectedPos0Value);
      let pos3Value: number = dst.$_get(3);
      let expectedPos3Value: int = 4;
      expect(pos3Value).assertEqual(expectedPos3Value);
      let pos5Value: number = dst.$_get(5);
      let expectedPos5Value: int = 6;
      expect(pos5Value).assertEqual(expectedPos5Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_SET_PART01_TEST_5800
     * @tc.name int8ArraySetPart01Test058
     * @tc.desc Verify set(array, offset) partial region set other regions keep original values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArraySetPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int8Array = Int8Array.of(10, 20, 30, 40, 50);
      let src: Int8Array = Int8Array.of(99, 99);
      dst.set(src, 1);
      let pos0Value: number = dst.$_get(0);
      let expectedPos0Value: int = 10;
      expect(pos0Value).assertEqual(expectedPos0Value);
      let pos3Value: number = dst.$_get(3);
      let expectedPos3Value: int = 40;
      expect(pos3Value).assertEqual(expectedPos3Value);
      let pos4Value: number = dst.$_get(4);
      let expectedPos4Value: int = 50;
      expect(pos4Value).assertEqual(expectedPos4Value);
    });
  });
}
