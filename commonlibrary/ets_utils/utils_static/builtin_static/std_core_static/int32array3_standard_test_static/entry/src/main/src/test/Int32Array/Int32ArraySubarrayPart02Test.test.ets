'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:
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

export default function int32ArraySubarrayPart02Test(): void {
  describe('int32ArraySubarrayPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArraySubarrayPart02Test001
     * @tc.desc Verify subarray() preserves length and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 6, 9);
      let sub: Int32Array = arr.subarray();
      expect(sub.length).assertEqual(3);
      expect(sub.$_get(0)).assertEqual(3);
      expect(sub.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArraySubarrayPart02Test002
     * @tc.desc Verify subarray(1) returns values 15,25,35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 15, 25, 35);
      let sub: Int32Array = arr.subarray(1);
      expect(sub.length).assertEqual(3);
      expect(sub.$_get(0)).assertEqual(15);
      expect(sub.$_get(2)).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArraySubarrayPart02Test003
     * @tc.desc Verify subarray(1,2) returns value 14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 14, 21);
      let sub: Int32Array = arr.subarray(1, 2);
      expect(sub.length).assertEqual(1);
      expect(sub.$_get(0)).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArraySubarrayPart02Test004
     * @tc.desc Verify begin greater than end returns an empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2, 4, 6);
      let sub: Int32Array = arr.subarray(2, 0);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArraySubarrayPart02Test005
     * @tc.desc Verify subarray() on an empty array returns length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let sub: Int32Array = arr.subarray();
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArraySubarrayPart02Test006
     * @tc.desc Verify subarray returns a view with length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33);
      let obj: Object = arr.subarray() as Object;
      expect((obj as Int32Array).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArraySubarrayPart02Test007
     * @tc.desc Verify Array.isArray subarray false( ); Also verify verify subarray 3 byteLength=12; Also verify verify subarray() buffer=== buffer; Also verify verify ArrayBuffer.isView subarray true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let sub: Int32Array = arr.subarray();
      expect(Array.isArray(sub)).assertFalse();

      {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let sub: Int32Array = arr.subarray();
      expect(sub.byteLength).assertEqual(12);
      }

      {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let sub: Int32Array = arr.subarray();
      expect(sub.buffer).assertEqual(arr.buffer);
      }

      {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let sub: Int32Array = arr.subarray();
      expect(ArrayBuffer.isView(sub)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArraySubarrayPart02Test008
     * @tc.desc Verify subarray Array.isArray false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let sub: Int32Array = arr.subarray(1, 1);
      expect(Array.isArray(sub)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArraySubarrayPart02Test009
     * @tc.desc Verify BYTES_PER_ELEMENT 4; Also verify verify subarray byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub: Int32Array = arr.subarray();
      expect(sub.BYTES_PER_ELEMENT).assertEqual(4);

      {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub: Int32Array = arr.subarray();
      expect(sub.byteOffset).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArraySubarrayPart02Test010
     * @tc.desc Verify BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let sub: Int32Array = arr.subarray(0, 2);
      expect(sub.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArraySubarrayPart02Test011
     * @tc.desc Verify BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      let sub: Int32Array = arr.subarray(3, 3);
      expect(sub.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArraySubarrayPart02Test012
     * @tc.desc Verify subarray BYTES_PER_ELEMENT 4; Also verify verify subarray().subarray() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let sub: Int32Array = arr.subarray(1).subarray(1);
      expect(sub.BYTES_PER_ELEMENT).assertEqual(4);

      {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let sub: Int32Array = arr.subarray(1).subarray(1);
      expect(sub.buffer).assertEqual(arr.buffer);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArraySubarrayPart02Test013
     * @tc.desc Verify subarray 6 length=6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50, 60);
      let sub: Int32Array = arr.subarray();
      expect(sub.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArraySubarrayPart02Test014
     * @tc.desc Verify subarray(2) 6 length=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50, 60);
      let sub: Int32Array = arr.subarray(2);
      expect(sub.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArraySubarrayPart02Test015
     * @tc.desc Verify subarray(1,4) 6 length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50, 60);
      let sub: Int32Array = arr.subarray(1, 4);
      expect(sub.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArraySubarrayPart02Test016
     * @tc.desc Verify subarray(0,0) length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(9, 8, 7);
      let sub: Int32Array = arr.subarray(0, 0);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArraySubarrayPart02Test017
     * @tc.desc Verify subarray(length,length) length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub: Int32Array = arr.subarray(arr.length, arr.length);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArraySubarrayPart02Test018
     * @tc.desc Verify subarray() length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-99);
      let sub: Int32Array = arr.subarray();
      expect(sub.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArraySubarrayPart02Test019
     * @tc.desc Verify begin>end (subarray(4,2))length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let sub: Int32Array = arr.subarray(4, 2);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArraySubarrayPart02Test020
     * @tc.desc Verify subarray(0,1) length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100, 200, 300);
      let sub: Int32Array = arr.subarray(0, 1);
      expect(sub.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArraySubarrayPart02Test021
     * @tc.desc Verify subarray(2) 5 byteLength=12(3 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let sub: Int32Array = arr.subarray(2);
      expect(sub.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArraySubarrayPart02Test022
     * @tc.desc Verify subarray(1,4)byteLength=12(3*4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(6);
      let sub: Int32Array = arr.subarray(1, 4);
      expect(sub.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArraySubarrayPart02Test023
     * @tc.desc Verify subarray byteLength=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8, 9);
      let sub: Int32Array = arr.subarray(1, 1);
      expect(sub.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArraySubarrayPart02Test024
     * @tc.desc Verify byteLength=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33, 44);
      let sub: Int32Array = arr.subarray(3, 4);
      expect(sub.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArraySubarrayPart02Test025
     * @tc.desc Verify byteLength length*BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6, 7);
      let sub: Int32Array = arr.subarray(2, 5);
      expect(sub.byteLength).assertEqual(sub.length * sub.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArraySubarrayPart02Test026
     * @tc.desc Verify subarray(0) byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let sub: Int32Array = arr.subarray(0);
      expect(sub.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArraySubarrayPart02Test027
     * @tc.desc Verify subarray(1) byteOffset=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let sub: Int32Array = arr.subarray(1);
      expect(sub.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArraySubarrayPart02Test028
     * @tc.desc Verify subarray(3) byteOffset=12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      let sub: Int32Array = arr.subarray(3);
      expect(sub.byteOffset).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArraySubarrayPart02Test029
     * @tc.desc Verify subarray(2,5)byteOffset=8( 2 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(6);
      let sub: Int32Array = arr.subarray(2, 5);
      expect(sub.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArraySubarrayPart02Test030
     * @tc.desc Verify subarray(3,3)byteOffset 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      let sub: Int32Array = arr.subarray(3, 3);
      expect(sub.byteOffset).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArraySubarrayPart02Test031
     * @tc.desc Verify ArrayBuffer 8 subarray(0)byteOffset 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let parent: Int32Array = new Int32Array(buf, 8, 3);
      let sub: Int32Array = parent.subarray(0);
      expect(sub.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArraySubarrayPart02Test032
     * @tc.desc Verify ArrayBuffer 4 subarray(2)byteOffset=4+2*4=12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let parent: Int32Array = new Int32Array(buf, 4, 4);
      let sub: Int32Array = parent.subarray(2);
      expect(sub.byteOffset).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArraySubarrayPart02Test033
     * @tc.desc Verify subarray buffer byteLength is 24 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let parent: Int32Array = new Int32Array(buf, 12, 4);
      let sub: Int32Array = parent.subarray(1, 3);
      expect(sub.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArraySubarrayPart02Test034
     * @tc.desc Verify subarray()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(101, 202, 303, 404);
      let sub: Int32Array = arr.subarray();
      expect(sub.$_get(0)).assertEqual(101);
      expect(sub.$_get(1)).assertEqual(202);
      expect(sub.$_get(2)).assertEqual(303);
      expect(sub.$_get(3)).assertEqual(404);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArraySubarrayPart02Test035
     * @tc.desc Verify subarray(2) 2; Also verify verify subarray(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let sub: Int32Array = arr.subarray(2);
      expect(sub.$_get(sub.length - 1)).assertEqual(50);

      {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let sub: Int32Array = arr.subarray(2);
      expect(sub.$_get(0)).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArraySubarrayPart02Test036
     * @tc.desc Verify subarray(1,3) [1] [2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 14, 21, 28);
      let sub: Int32Array = arr.subarray(1, 3);
      expect(sub.$_get(0)).assertEqual(14);
      expect(sub.$_get(1)).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArraySubarrayPart02Test037
     * @tc.desc Verify subarray(0,1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(77, 88, 99);
      let sub: Int32Array = arr.subarray(0, 1);
      expect(sub.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArraySubarrayPart02Test038
     * @tc.desc Verify subarray(length-1,length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33, 44);
      let sub: Int32Array = arr.subarray(arr.length - 1, arr.length);
      expect(sub.$_get(0)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArraySubarrayPart02Test039
     * @tc.desc Verify INT_MAX subarray() 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647, 0);
      let sub: Int32Array = arr.subarray();
      expect(sub.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArraySubarrayPart02Test040
     * @tc.desc Verify INT_MIN subarray() -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -2147483648);
      let sub: Int32Array = arr.subarray();
      expect(sub.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArraySubarrayPart02Test041
     * @tc.desc Verify subarray $_get(0) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Int32Array = Int32Array.of(5, 6, 7);
        let sub: Int32Array = arr.subarray(1, 1);
        expect(sub.$_get(0)).assertEqual(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArraySubarrayPart02Test042
     * @tc.desc Verify (-1) subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1, -2, -3);
      let sub: Int32Array = arr.subarray(1, 3);
      expect(sub.$_get(0)).assertEqual(-2);
      expect(sub.$_get(1)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArraySubarrayPart02Test043
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf, 4, 3);
      parent.$_set(0, 111);
      parent.$_set(1, 222);
      parent.$_set(2, 333);
      let sub: Int32Array = parent.subarray(1, 3);
      expect(sub.$_get(0)).assertEqual(222);
      expect(sub.$_get(1)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArraySubarrayPart02Test044
     * @tc.desc Verify subarray() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let before: int = arr.length;
      arr.subarray();
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArraySubarrayPart02Test045
     * @tc.desc Verify subarray(begin,end)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(9, 8, 7, 6);
      arr.subarray(1, 3);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(1)).assertEqual(8);
      expect(arr.$_get(2)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_4600
     * @tc.name int32ArraySubarrayPart02Test046
     * @tc.desc Verify subarray byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      let before: int = arr.byteLength;
      arr.subarray(2, 4);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_4700
     * @tc.name int32ArraySubarrayPart02Test047
     * @tc.desc Verify subarray byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.subarray(1);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_4800
     * @tc.name int32ArraySubarrayPart02Test048
     * @tc.desc Verify begin>end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(13, 26, 39);
      arr.subarray(3, 0);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(13);
      expect(arr.$_get(2)).assertEqual(39);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_4900
     * @tc.name int32ArraySubarrayPart02Test049
     * @tc.desc Verify subarray() length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.subarray();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_5000
     * @tc.name int32ArraySubarrayPart02Test050
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.subarray(0, 2);
      arr.subarray(1, 3);
      arr.subarray(2, 4);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_5100
     * @tc.name int32ArraySubarrayPart02Test051
     * @tc.desc Verify subarray()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let sub: Int32Array = arr.subarray();
      let notSame1: boolean = (sub !== arr);
      expect(notSame1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_5200
     * @tc.name int32ArraySubarrayPart02Test052
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let s1: Int32Array = arr.subarray(0, 2);
      let s2: Int32Array = arr.subarray(0, 2);
      let notSame2: boolean = (s1 !== s2);
      expect(notSame2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_5300
     * @tc.name int32ArraySubarrayPart02Test053
     * @tc.desc Verify subarray(0,length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let sub: Int32Array = arr.subarray(0, arr.length);
      let notSame3: boolean = (sub !== arr);
      expect(notSame3).assertTrue();
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_5400
     * @tc.name int32ArraySubarrayPart02Test054
     * @tc.desc Verify subarray(1).subarray(1) 5-2=3; Also verify verify subarray(1).subarray(1) 2; Also verify verify subarray(1).subarray(1)byteOffset 1*4+1*4=8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let sub: Int32Array = arr.subarray(1).subarray(1);
      expect(sub.length).assertEqual(3);

      {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let sub: Int32Array = arr.subarray(1).subarray(1);
      expect(sub.$_get(0)).assertEqual(30);
      }

      {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let sub: Int32Array = arr.subarray(1).subarray(1);
      expect(sub.byteOffset).assertEqual(8);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_5500
     * @tc.name int32ArraySubarrayPart02Test055
     * @tc.desc Verify subarray 6-3=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6);
      let sub: Int32Array = arr.subarray(1).subarray(1).subarray(1);
      expect(sub.length).assertEqual(3);
      expect(sub.$_get(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_5600
     * @tc.name int32ArraySubarrayPart02Test056
     * @tc.desc Verify subarray buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6);
      let sub: Int32Array = arr.subarray(1).subarray(1).subarray(1);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_5700
     * @tc.name int32ArraySubarrayPart02Test057
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let sub: Int32Array = arr.subarray(2, 2).subarray();
      expect(sub.length).assertEqual(0);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_5800
     * @tc.name int32ArraySubarrayPart02Test058
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50, 60);
      let sub: Int32Array = arr.subarray(2).subarray(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub.$_get(0)).assertEqual(40);
      expect(sub.$_get(1)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_5900
     * @tc.name int32ArraySubarrayPart02Test059
     * @tc.desc Verify subarray(2) buffer=== buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub: Int32Array = arr.subarray(2);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_6000
     * @tc.name int32ArraySubarrayPart02Test060
     * @tc.desc Verify subarray(1,3) buffer=== buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub: Int32Array = arr.subarray(1, 3);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_6100
     * @tc.name int32ArraySubarrayPart02Test061
     * @tc.desc Verify subarray buffer=== buffer; Also verify verify ArrayBuffer.isView subarray true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let sub: Int32Array = arr.subarray(2, 2);
      expect(sub.buffer).assertEqual(arr.buffer);

      {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let sub: Int32Array = arr.subarray(2, 2);
      expect(ArrayBuffer.isView(sub)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_6200
     * @tc.name int32ArraySubarrayPart02Test062
     * @tc.desc Verify subarray buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 6);
      let sub: Int32Array = arr.subarray(0, 1);
      expect(sub.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_6300
     * @tc.name int32ArraySubarrayPart02Test063
     * @tc.desc Verify subarray buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let parent: Int32Array = new Int32Array(buf, 8, 3);
      let sub: Int32Array = parent.subarray(1);
      expect(sub.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_6400
     * @tc.name int32ArraySubarrayPart02Test064
     * @tc.desc Verify $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub: Int32Array = arr.subarray(1, 3);
      sub.$_set(0, 222);
      expect(arr.$_get(1)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_6500
     * @tc.name int32ArraySubarrayPart02Test065
     * @tc.desc Verify $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub: Int32Array = arr.subarray(1, 3);
      sub.$_set(1, 333);
      expect(arr.$_get(2)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_6600
     * @tc.name int32ArraySubarrayPart02Test066
     * @tc.desc Verify $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub: Int32Array = arr.subarray(1, 3);
      sub.$_set(0, 999);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_6700
     * @tc.name int32ArraySubarrayPart02Test067
     * @tc.desc Verify begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let sub: Int32Array = arr.subarray(-2);
      sub.$_set(0, 333);
      expect(arr.$_get(2)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_6800
     * @tc.name int32ArraySubarrayPart02Test068
     * @tc.desc Verify INT_MAX(2147483647)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0);
      let sub: Int32Array = arr.subarray(1, 2);
      sub.$_set(0, 2147483647);
      expect(arr.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_6900
     * @tc.name int32ArraySubarrayPart02Test069
     * @tc.desc Verify INT_MIN(-2147483648)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0);
      let sub: Int32Array = arr.subarray(1, 2);
      sub.$_set(0, -2147483648);
      expect(arr.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_7000
     * @tc.name int32ArraySubarrayPart02Test070
     * @tc.desc Verify $_set buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let sub: Int32Array = arr.subarray(1).subarray(1);
      sub.$_set(0, 888);
      expect(arr.$_get(2)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_7100
     * @tc.name int32ArraySubarrayPart02Test071
     * @tc.desc Verify $_set ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub: Int32Array = arr.subarray(1, 3);
      arr.$_set(1, 202);
      expect(sub.$_get(0)).assertEqual(202);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_7200
     * @tc.name int32ArraySubarrayPart02Test072
     * @tc.desc Verify $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub: Int32Array = arr.subarray(1, 3);
      arr.$_set(0, 111);
      arr.$_set(3, 444);
      expect(sub.$_get(0)).assertEqual(2);
      expect(sub.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_7300
     * @tc.name int32ArraySubarrayPart02Test073
     * @tc.desc Verify $_set end ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub: Int32Array = arr.subarray(1, 3);
      arr.$_set(2, 303);
      expect(sub.$_get(1)).assertEqual(303);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_7400
     * @tc.name int32ArraySubarrayPart02Test074
     * @tc.desc Verify source writes are visible through a subarray created from an offset buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let parent: Int32Array = new Int32Array(buf, 4, 4);
      parent.$_set(0, 1);
      parent.$_set(1, 2);
      parent.$_set(2, 3);
      parent.$_set(3, 4);
      let sub: Int32Array = parent.subarray(1, 3);
      parent.$_set(1, 222);
      expect(sub.$_get(0)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_7500
     * @tc.name int32ArraySubarrayPart02Test075
     * @tc.desc Verify $_set on an empty subarray throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Int32Array = Int32Array.of(1, 2, 3);
        let sub: Int32Array = arr.subarray(1, 1);
        sub.$_set(0, 999);
        expect(arr.$_get(1)).assertEqual(2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_7600
     * @tc.name int32ArraySubarrayPart02Test076
     * @tc.desc Verify subarray $_set length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Int32Array = Int32Array.of(1, 2, 3);
        let sub: Int32Array = arr.subarray(2, 2);
        sub.$_set(0, 777);
        expect(sub.length).assertEqual(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_7700
     * @tc.name int32ArraySubarrayPart02Test077
     * @tc.desc Verify begin>end $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Int32Array = Int32Array.of(11, 22, 33);
        let sub: Int32Array = arr.subarray(3, 1);
        sub.$_set(0, 555);
        expect(arr.$_get(0)).assertEqual(11);
        expect(arr.$_get(1)).assertEqual(22);
        expect(arr.$_get(2)).assertEqual(33);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_7800
     * @tc.name int32ArraySubarrayPart02Test078
     * @tc.desc Verify ArrayBuffer.isView subarray true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub: Int32Array = arr.subarray(1, 3);
      expect(ArrayBuffer.isView(sub)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_7900
     * @tc.name int32ArraySubarrayPart02Test079
     * @tc.desc Verify ArrayBuffer.isView subarray true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub: Int32Array = arr.subarray(1).subarray(1);
      expect(ArrayBuffer.isView(sub)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_8000
     * @tc.name int32ArraySubarrayPart02Test080
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let s1: Int32Array = arr.subarray(0, 3);
      let s2: Int32Array = arr.subarray(2, 5);
      s1.$_set(2, 999);
      expect(s2.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_8100
     * @tc.name int32ArraySubarrayPart02Test081
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let s1: Int32Array = arr.subarray(0, 2);
      let s2: Int32Array = arr.subarray(2, 4);
      s1.$_set(0, 111);
      s2.$_set(0, 333);
      expect(s1.$_get(0)).assertEqual(111);
      expect(s1.$_get(1)).assertEqual(2);
      expect(s2.$_get(0)).assertEqual(333);
      expect(s2.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_8200
     * @tc.name int32ArraySubarrayPart02Test082
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub: Int32Array = arr.subarray(1, 3);
      sub.fill(7);
      expect(arr.$_get(1)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(7);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_8300
     * @tc.name int32ArraySubarrayPart02Test083
     * @tc.desc Verify reverse ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let sub: Int32Array = arr.subarray(1, 4);
      sub.reverse();
      expect(arr.$_get(1)).assertEqual(4);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_8400
     * @tc.name int32ArraySubarrayPart02Test084
     * @tc.desc Verify subarray buffer slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let sub: Int32Array = arr.subarray();
      let sl: Int32Array = arr.slice();
      expect(sub.buffer).assertEqual(arr.buffer);
      expect(sl.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_8500
     * @tc.name int32ArraySubarrayPart02Test085
     * @tc.desc Verify subarray , slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = Int32Array.of(0, 0, 0);
      let a2: Int32Array = Int32Array.of(0, 0, 0);
      let sub: Int32Array = a1.subarray();
      let sl: Int32Array = a2.slice();
      sub.$_set(0, 123);
      sl.$_set(0, 456);
      expect(a1.$_get(0)).assertEqual(123);
      expect(a2.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_8600
     * @tc.name int32ArraySubarrayPart02Test086
     * @tc.desc Verify forEach length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let sub: Int32Array = arr.subarray(1, 4);
      let count: int = 0;
      sub.forEach((_v: number, _i: int) => {
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART02_TEST_MINDMAP_8700
     * @tc.name int32ArraySubarrayPart02Test087
     * @tc.desc Verify for-of $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart02Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let sub: Int32Array = arr.subarray(1, 3);
      let collected: number[] = [];
      for (let i = 0; i < sub.length; i++) {
        let v = sub.$_get(i);
        collected.push(Double.toInt(v));
      }
      expect(collected.length).assertEqual(2);
      expect(collected.$_get(0)).assertEqual(20);
      expect(collected.$_get(1)).assertEqual(30);
    });
  });
}
