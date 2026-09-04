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

export default function int32ArrayPropertiesPart02Test(): void {
  describe('Int32ArrayPropertiesPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_0100
     * @tc.name int32ArrayPropertiesPart02Test001
     * @tc.desc Verify BYTES_PER_ELEMENT is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_0200
     * @tc.name int32ArrayPropertiesPart02Test002
     * @tc.desc Verify Int32Array.BYTES_PER_ELEMENT is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int32Array.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_0300
     * @tc.name int32ArrayPropertiesPart02Test003
     * @tc.desc Verify BYTES_PER_ELEMENT BYTES_PER_ELEMENT ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(Int32Array.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_0400
     * @tc.name int32ArrayPropertiesPart02Test004
     * @tc.desc Verify BYTES_PER_ELEMENT === 4 === ==
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      let same: boolean = arr.BYTES_PER_ELEMENT === 4;
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_0500
     * @tc.name int32ArrayPropertiesPart02Test005
     * @tc.desc Verify BYTES_PER_ELEMENT int int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bpe: int = Int32Array.BYTES_PER_ELEMENT;
      expect(bpe).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_0600
     * @tc.name int32ArrayPropertiesPart02Test006
     * @tc.desc Verify INT_MIN(-2147483648) BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648]);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_0700
     * @tc.name int32ArrayPropertiesPart02Test007
     * @tc.desc Verify 64 BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(64);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_0800
     * @tc.name int32ArrayPropertiesPart02Test008
     * @tc.desc Verify ArrayBuffer+offset=8+length=1 BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 8, 1);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_0900
     * @tc.name int32ArrayPropertiesPart02Test009
     * @tc.desc Verify subarray BYTES_PER_ELEMENT ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4]);
      let child: Int32Array = parent.subarray(1, 3);
      expect(child.BYTES_PER_ELEMENT).assertEqual(parent.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_1000
     * @tc.name int32ArrayPropertiesPart02Test010
     * @tc.desc Verify Int32Array.from INT_MIN BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [-2147483648];
      let arr: Int32Array = Int32Array.from(src);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_1100
     * @tc.name int32ArrayPropertiesPart02Test011
     * @tc.desc Verify BYTES_PER_ELEMENT ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      let before: number = arr.BYTES_PER_ELEMENT;
      expect(arr.BYTES_PER_ELEMENT).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_1200
     * @tc.name int32ArrayPropertiesPart02Test012
     * @tc.desc Verify length is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_1300
     * @tc.name int32ArrayPropertiesPart02Test013
     * @tc.desc Verify length int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      let n: int = arr.length;
      expect(n).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_1400
     * @tc.name int32ArrayPropertiesPart02Test014
     * @tc.desc Verify length===0 byteLength===0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array();
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_1500
     * @tc.name int32ArrayPropertiesPart02Test015
     * @tc.desc Verify length===1 byteLength===4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      expect(arr.length).assertEqual(1);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_1600
     * @tc.name int32ArrayPropertiesPart02Test016
     * @tc.desc Verify 64 length===64 byteLength===256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(64);
      expect(arr.length).assertEqual(64);
      expect(arr.byteLength).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_1700
     * @tc.name int32ArrayPropertiesPart02Test017
     * @tc.desc Verify length === byteLength / BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(12);
      let calc: int = arr.byteLength / arr.BYTES_PER_ELEMENT;
      expect(arr.length).assertEqual(calc);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_1800
     * @tc.name int32ArrayPropertiesPart02Test018
     * @tc.desc Verify length * 4 === byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(7);
      expect(arr.length * 4).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_1900
     * @tc.name int32ArrayPropertiesPart02Test019
     * @tc.desc Verify ArrayBuffer(32)+offset=4 length (32-4)/4=7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Int32Array = new Int32Array(buf, 4);
      expect(arr.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_2000
     * @tc.name int32ArrayPropertiesPart02Test020
     * @tc.desc Verify ArrayBuffer(32)+offset=4+length=2 length===2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_2100
     * @tc.name int32ArrayPropertiesPart02Test021
     * @tc.desc Verify ArrayBuffer(32)+offset=12 length (32-12)/4=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Int32Array = new Int32Array(buf, 12);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_2200
     * @tc.name int32ArrayPropertiesPart02Test022
     * @tc.desc Verify subarray(1,3) length===2 byteLength===8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([10, 20, 30, 40]);
      let child: Int32Array = parent.subarray(1, 3);
      expect(child.length).assertEqual(2);
      expect(child.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_2300
     * @tc.name int32ArrayPropertiesPart02Test023
     * @tc.desc Verify subarray() length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(5);
      let child: Int32Array = parent.subarray();
      expect(child.length).assertEqual(parent.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_2400
     * @tc.name int32ArrayPropertiesPart02Test024
     * @tc.desc Verify subarray(2) begin=2 length length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(6);
      let child: Int32Array = parent.subarray(2);
      expect(child.length).assertEqual(parent.length - 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_2500
     * @tc.name int32ArrayPropertiesPart02Test025
     * @tc.desc Verify subarray(0,0) length===0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3]);
      let child: Int32Array = parent.subarray(0, 0);
      expect(child.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_2600
     * @tc.name int32ArrayPropertiesPart02Test026
     * @tc.desc Verify for-of 0 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array();
      let count: int = 0;
      for (let i: int = 0; i < arr.length; i++) {
        count = count + 1;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_2700
     * @tc.name int32ArrayPropertiesPart02Test027
     * @tc.desc Verify for-of 1 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([99]);
      let count: int = 0;
      for (let i: int = 0; i < arr.length; i++) {
        count = count + 1;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_2800
     * @tc.name int32ArrayPropertiesPart02Test028
     * @tc.desc Verify 64 for-of length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(64);
      let count: int = 0;
      for (let i: int = 0; i < arr.length; i++) {
        arr.$_get(i);
        count = count + 1;
      }
      expect(count).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_2900
     * @tc.name int32ArrayPropertiesPart02Test029
     * @tc.desc Verify byteLength is 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_3000
     * @tc.name int32ArrayPropertiesPart02Test030
     * @tc.desc Verify byteLength int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      let bl: int = arr.byteLength;
      expect(bl).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_3100
     * @tc.name int32ArrayPropertiesPart02Test031
     * @tc.desc Verify byteLength 4 0%4===0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array();
      expect(arr.byteLength % 4).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_3200
     * @tc.name int32ArrayPropertiesPart02Test032
     * @tc.desc Verify byteLength 4 offset=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Int32Array = new Int32Array(buf, 4);
      expect(arr.byteLength % 4).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_3300
     * @tc.name int32ArrayPropertiesPart02Test033
     * @tc.desc Verify byteLength 4 subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(10);
      let child: Int32Array = parent.subarray(3, 7);
      expect(child.byteLength % 4).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_3400
     * @tc.name int32ArrayPropertiesPart02Test034
     * @tc.desc Verify ArrayBuffer(32)+offset=4+length=2 byteLength===8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_3500
     * @tc.name int32ArrayPropertiesPart02Test035
     * @tc.desc Verify ArrayBuffer(32)+offset=12 byteLength===20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Int32Array = new Int32Array(buf, 12);
      expect(arr.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_3600
     * @tc.name int32ArrayPropertiesPart02Test036
     * @tc.desc Verify subarray(1,1) byteLength===0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3]);
      let child: Int32Array = parent.subarray(1, 1);
      expect(child.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_3700
     * @tc.name int32ArrayPropertiesPart02Test037
     * @tc.desc Verify offset=8 length=1 byteLength===4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 8, 1);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_3800
     * @tc.name int32ArrayPropertiesPart02Test038
     * @tc.desc Verify INT_MIN byteLength===4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648]);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_3900
     * @tc.name int32ArrayPropertiesPart02Test039
     * @tc.desc Verify 64 byteLength===256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(64);
      expect(arr.byteLength).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_4000
     * @tc.name int32ArrayPropertiesPart02Test040
     * @tc.desc Verify ArrayBuffer(16)+offset=12 length=0 byteLength===0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 12, 0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_4100
     * @tc.name int32ArrayPropertiesPart02Test041
     * @tc.desc Verify byteLength , byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      let before: number = arr.byteLength;
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_4200
     * @tc.name int32ArrayPropertiesPart02Test042
     * @tc.desc Verify byteOffset int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 8);
      let bo: int = arr.byteOffset;
      expect(bo).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_4300
     * @tc.name int32ArrayPropertiesPart02Test043
     * @tc.desc Verify byteOffset 4 byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      expect(arr.byteOffset % 4).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_4400
     * @tc.name int32ArrayPropertiesPart02Test044
     * @tc.desc Verify byteOffset 4 offset=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Int32Array = new Int32Array(buf, 4);
      expect(arr.byteOffset % 4).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_4500
     * @tc.name int32ArrayPropertiesPart02Test045
     * @tc.desc Verify byteOffset 4 offset=8 length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let arr: Int32Array = new Int32Array(buf, 8, 2);
      expect(arr.byteOffset % 4).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_4600
     * @tc.name int32ArrayPropertiesPart02Test046
     * @tc.desc Verify arr.buffer byteLength is 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      expect(arr.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_4700
     * @tc.name int32ArrayPropertiesPart02Test047
     * @tc.desc Verify buffer null byteLength===0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array();
      expect(arr.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_4800
     * @tc.name int32ArrayPropertiesPart02Test048
     * @tc.desc Verify new Int32Array(buf) buffer===buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf);
      let same: boolean = arr.buffer === buf;
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_4900
     * @tc.name int32ArrayPropertiesPart02Test049
     * @tc.desc Verify new Int32Array(buf,4) buffer===buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_5000
     * @tc.name int32ArrayPropertiesPart02Test050
     * @tc.desc Verify new Int32Array(buf,4,2) buffer===buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_5100
     * @tc.name int32ArrayPropertiesPart02Test051
     * @tc.desc Verify subarray buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = parent.subarray(2, 5);
      expect(child.buffer).assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_5200
     * @tc.name int32ArrayPropertiesPart02Test052
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(48);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = a.subarray(1);
      let c: Int32Array = b.subarray(2);
      expect(c.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_5300
     * @tc.name int32ArrayPropertiesPart02Test053
     * @tc.desc Verify Int32Array.from copies a two-element source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [10, 20];
      let arr: Int32Array = Int32Array.from(src);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_5400
     * @tc.name int32ArrayPropertiesPart02Test054
     * @tc.desc Verify Int32Array.of(-2147483648) buffer.byteLength===4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648);
      expect(arr.buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_5500
     * @tc.name int32ArrayPropertiesPart02Test055
     * @tc.desc Verify buffer.byteLength=== buffer.byteLength buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = parent.subarray(2, 6);
      expect(child.buffer.byteLength).assertEqual(parent.buffer.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_5600
     * @tc.name int32ArrayPropertiesPart02Test056
     * @tc.desc Verify new Int32Array(2) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      let b: Int32Array = new Int32Array(2);
      let differ: boolean = a.buffer !== b.buffer;
      expect(differ).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_5700
     * @tc.name int32ArrayPropertiesPart02Test057
     * @tc.desc Verify buffer.byteLength >= byteOffset + byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(8);
      let ok: boolean = arr.buffer.byteLength >= arr.byteOffset + arr.byteLength;
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_5800
     * @tc.name int32ArrayPropertiesPart02Test058
     * @tc.desc Verify buffer.byteLength >= byteOffset + byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(64);
      let arr: Int32Array = new Int32Array(buf, 12, 7);
      let ok: boolean = arr.buffer.byteLength >= arr.byteOffset + arr.byteLength;
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_5900
     * @tc.name int32ArrayPropertiesPart02Test059
     * @tc.desc Verify INT_MIN buffer.byteLength===4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648]);
      expect(arr.buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_6000
     * @tc.name int32ArrayPropertiesPart02Test060
     * @tc.desc Verify 64 buffer.byteLength===256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(64);
      expect(arr.buffer.byteLength).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_6100
     * @tc.name int32ArrayPropertiesPart02Test061
     * @tc.desc Verify buffer , ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf);
      let before: ArrayBuffer = arr.buffer;
      expect(arr.buffer).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_PROPERTIES_PART02_6200
     * @tc.name int32ArrayPropertiesPart02Test062
     * @tc.desc Verify of buffer buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayPropertiesPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let external: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = Int32Array.of(1, 2);
      let differ: boolean = arr.buffer !== external;
      expect(differ).assertTrue();
    });
  });
}
