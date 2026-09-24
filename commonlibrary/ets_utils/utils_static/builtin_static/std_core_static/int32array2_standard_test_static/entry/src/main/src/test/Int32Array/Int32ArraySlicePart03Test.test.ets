'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
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

export default function int32ArraySlicePart03Test(): void {
  describe('Int32ArraySlicePart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_0100
     * @tc.name int32ArraySlicePart03Test001
     * @tc.desc Verify slice(0) length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let s: Int32Array = a.slice(0);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_0200
     * @tc.name int32ArraySlicePart03Test002
     * @tc.desc Verify slice(0,0) length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let s: Int32Array = a.slice(0, 0);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_0300
     * @tc.name int32ArraySlicePart03Test003
     * @tc.desc Verify slice(-1) begin clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let s: Int32Array = a.slice(-1);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_0400
     * @tc.name int32ArraySlicePart03Test004
     * @tc.desc Verify slice(1) begin length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let s: Int32Array = a.slice(1);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_0500
     * @tc.name int32ArraySlicePart03Test005
     * @tc.desc Verify slice(0,1) end clamp length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let s: Int32Array = a.slice(0, 1);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_0600
     * @tc.name int32ArraySlicePart03Test006
     * @tc.desc Verify slice(-100,100) clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let s: Int32Array = a.slice(-100, 100);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_0700
     * @tc.name int32ArraySlicePart03Test007
     * @tc.desc Verify slice(9999) begin length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let s: Int32Array = a.slice(9999);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_0800
     * @tc.name int32ArraySlicePart03Test008
     * @tc.desc Verify slice(-9999) begin clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let s: Int32Array = a.slice(-9999);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_0900
     * @tc.name int32ArraySlicePart03Test009
     * @tc.desc Verify slice buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let a: Int32Array = new Int32Array(buf);
      let s: Int32Array = a.slice();
      let _d: boolean = s.buffer !== a.buffer;
      expect(_d).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_1000
     * @tc.name int32ArraySlicePart03Test010
     * @tc.desc Verify slice(0,-1) end=-1 -1 clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let s: Int32Array = a.slice(0, -1);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_1100
     * @tc.name int32ArraySlicePart03Test011
     * @tc.desc Verify slice() length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([42]);
      let s: Int32Array = a.slice();
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_1200
     * @tc.name int32ArraySlicePart03Test012
     * @tc.desc Verify slice(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([7]);
      let s: Int32Array = a.slice(0);
      expect(s.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_1300
     * @tc.name int32ArraySlicePart03Test013
     * @tc.desc Verify slice(0,1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-5]);
      let s: Int32Array = a.slice(0, 1);
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_1400
     * @tc.name int32ArraySlicePart03Test014
     * @tc.desc Verify slice(1) begin=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([9]);
      let s: Int32Array = a.slice(1);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_1500
     * @tc.name int32ArraySlicePart03Test015
     * @tc.desc Verify slice(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([33]);
      let s: Int32Array = a.slice(-1);
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_1600
     * @tc.name int32ArraySlicePart03Test016
     * @tc.desc Verify slice(-1,1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([77]);
      let s: Int32Array = a.slice(-1, 1);
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_1700
     * @tc.name int32ArraySlicePart03Test017
     * @tc.desc Verify slice(0,-1) end=-1 0 begin>=end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([11]);
      let s: Int32Array = a.slice(0, -1);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_1800
     * @tc.name int32ArraySlicePart03Test018
     * @tc.desc Verify slice(2) begin length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([5]);
      let s: Int32Array = a.slice(2);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_1900
     * @tc.name int32ArraySlicePart03Test019
     * @tc.desc Verify slice(-2) begin clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([88]);
      let s: Int32Array = a.slice(-2);
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_2000
     * @tc.name int32ArraySlicePart03Test020
     * @tc.desc Verify MAX_INT slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([2147483647]);
      let s: Int32Array = a.slice();
      expect(s.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_2100
     * @tc.name int32ArraySlicePart03Test021
     * @tc.desc Verify a one-element full slice copies the source value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-2147483648]);
      let s: Int32Array = a.slice();
      expect(s.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_2200
     * @tc.name int32ArraySlicePart03Test022
     * @tc.desc Verify slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([123]);
      let s: Int32Array = a.slice();
      a.$_set(0, 999);
      expect(s.$_get(0)).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_2300
     * @tc.name int32ArraySlicePart03Test023
     * @tc.desc Verify 0 slice 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0]);
      let s: Int32Array = a.slice();
      expect(s.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_2400
     * @tc.name int32ArraySlicePart03Test024
     * @tc.desc Verify -1 slice -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-1]);
      let s: Int32Array = a.slice();
      expect(s.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_2500
     * @tc.name int32ArraySlicePart03Test025
     * @tc.desc Verify begin=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40]);
      let s: Int32Array = a.slice(0);
      expect(s.length).assertEqual(4);
      expect(s.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_2600
     * @tc.name int32ArraySlicePart03Test026
     * @tc.desc Verify begin=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let s: Int32Array = a.slice(2);
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_2700
     * @tc.name int32ArraySlicePart03Test027
     * @tc.desc Verify begin=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40]);
      let s: Int32Array = a.slice(4);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_2800
     * @tc.name int32ArraySlicePart03Test028
     * @tc.desc Verify begin=length+1 clamp length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40]);
      let s: Int32Array = a.slice(5);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_2900
     * @tc.name int32ArraySlicePart03Test029
     * @tc.desc Verify begin clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let s: Int32Array = a.slice(1000000);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_3000
     * @tc.name int32ArraySlicePart03Test030
     * @tc.desc Verify begin=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let s: Int32Array = a.slice(-1);
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_3100
     * @tc.name int32ArraySlicePart03Test031
     * @tc.desc Verify begin=-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let s: Int32Array = a.slice(-2);
      expect(s.length).assertEqual(2);
      expect(s.$_get(0)).assertEqual(40);
      expect(s.$_get(1)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_3200
     * @tc.name int32ArraySlicePart03Test032
     * @tc.desc Verify begin=-length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40]);
      let s: Int32Array = a.slice(-4);
      expect(s.length).assertEqual(4);
      expect(s.$_get(0)).assertEqual(10);
      expect(s.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_3300
     * @tc.name int32ArraySlicePart03Test033
     * @tc.desc Verify begin=-length-1 clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40]);
      let s: Int32Array = a.slice(-5);
      expect(s.length).assertEqual(4);
      expect(s.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_3400
     * @tc.name int32ArraySlicePart03Test034
     * @tc.desc Verify begin clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let s: Int32Array = a.slice(-999999);
      expect(s.length).assertEqual(3);
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_3500
     * @tc.name int32ArraySlicePart03Test035
     * @tc.desc Verify begin=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40]);
      let s: Int32Array = a.slice(1);
      expect(s.length).assertEqual(3);
      expect(s.$_get(0)).assertEqual(20);
      expect(s.$_get(2)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_3600
     * @tc.name int32ArraySlicePart03Test036
     * @tc.desc Verify begin=MIN_INT clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let s: Int32Array = a.slice(-2147483648);
      expect(s.length).assertEqual(3);
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_3700
     * @tc.name int32ArraySlicePart03Test037
     * @tc.desc Verify end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let s: Int32Array = a.slice(1);
      expect(s.length).assertEqual(2);
      expect(s.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_3800
     * @tc.name int32ArraySlicePart03Test038
     * @tc.desc Verify end=0 begin=0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let s: Int32Array = a.slice(0, 0);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_3900
     * @tc.name int32ArraySlicePart03Test039
     * @tc.desc Verify end=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let s: Int32Array = a.slice(0, 1);
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_4000
     * @tc.name int32ArraySlicePart03Test040
     * @tc.desc Verify end=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40]);
      let s: Int32Array = a.slice(0, 3);
      expect(s.length).assertEqual(3);
      expect(s.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_4100
     * @tc.name int32ArraySlicePart03Test041
     * @tc.desc Verify end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let s: Int32Array = a.slice(0, 3);
      expect(s.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_4200
     * @tc.name int32ArraySlicePart03Test042
     * @tc.desc Verify end=length+1 clamp length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let s: Int32Array = a.slice(0, 4);
      expect(s.length).assertEqual(3);
      expect(s.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_4300
     * @tc.name int32ArraySlicePart03Test043
     * @tc.desc Verify end=-length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40]);
      let s: Int32Array = a.slice(0, -4);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_4400
     * @tc.name int32ArraySlicePart03Test044
     * @tc.desc Verify end=-length-1 clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40]);
      let s: Int32Array = a.slice(0, -5);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_4500
     * @tc.name int32ArraySlicePart03Test045
     * @tc.desc Verify end clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let s: Int32Array = a.slice(0, -999999);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_4600
     * @tc.name int32ArraySlicePart03Test046
     * @tc.desc Verify begin end end begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let s: Int32Array = a.slice(1, -1);
      expect(s.length).assertEqual(3);
      expect(s.$_get(0)).assertEqual(20);
      expect(s.$_get(2)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_4700
     * @tc.name int32ArraySlicePart03Test047
     * @tc.desc Verify begin end begin end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60]);
      let s: Int32Array = a.slice(-4, 5);
      expect(s.length).assertEqual(3);
      expect(s.$_get(0)).assertEqual(30);
      expect(s.$_get(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_4800
     * @tc.name int32ArraySlicePart03Test048
     * @tc.desc Verify begin=1 end=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let s: Int32Array = a.slice(1, 1);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_4900
     * @tc.name int32ArraySlicePart03Test049
     * @tc.desc Verify begin=length-1 end=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let s: Int32Array = a.slice(2, 2);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_5000
     * @tc.name int32ArraySlicePart03Test050
     * @tc.desc Verify begin=length end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let s: Int32Array = a.slice(3, 3);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_5100
     * @tc.name int32ArraySlicePart03Test051
     * @tc.desc Verify begin=-length end=-length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let s: Int32Array = a.slice(-3, -3);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_5200
     * @tc.name int32ArraySlicePart03Test052
     * @tc.desc Verify begin=-1 end=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40]);
      let s: Int32Array = a.slice(-1, -1);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_5300
     * @tc.name int32ArraySlicePart03Test053
     * @tc.desc Verify begin=2 end=1 begin>end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let s: Int32Array = a.slice(2, 1);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_5400
     * @tc.name int32ArraySlicePart03Test054
     * @tc.desc Verify begin=3 end=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let s: Int32Array = a.slice(3, 0);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_5500
     * @tc.name int32ArraySlicePart03Test055
     * @tc.desc Verify begin end begin>=end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40]);
      let s: Int32Array = a.slice(3, -3);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_5600
     * @tc.name int32ArraySlicePart03Test056
     * @tc.desc Verify begin end begin>=end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let s: Int32Array = a.slice(-1, -2);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_5700
     * @tc.name int32ArraySlicePart03Test057
     * @tc.desc Verify begin=-1 end=0 begin length-1 end=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40]);
      let s: Int32Array = a.slice(-1, 0);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_5800
     * @tc.name int32ArraySlicePart03Test058
     * @tc.desc Verify begin end clamp begin=length end=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let s: Int32Array = a.slice(999, -999);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_5900
     * @tc.name int32ArraySlicePart03Test059
     * @tc.desc Verify begin=MAX_INT end=MIN_INT clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let s: Int32Array = a.slice(2147483647, -2147483648);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_6000
     * @tc.name int32ArraySlicePart03Test060
     * @tc.desc Verify slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0, 0, 0, 0, 0]);
      let s: Int32Array = a.slice();
      expect(s.length).assertEqual(5);
      expect(s.$_get(0)).assertEqual(0);
      expect(s.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_6100
     * @tc.name int32ArraySlicePart03Test061
     * @tc.desc Verify slice(1, 3) returns two elements from a four-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0, 0, 0, 0, 0]);
      let s: Int32Array = a.slice(1, -1);
      expect(s.length).assertEqual(3);
      expect(s.$_get(0)).assertEqual(0);
      expect(s.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_6200
     * @tc.name int32ArraySlicePart03Test062
     * @tc.desc Verify negative begin -3 returns the last three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([7, 7, 7, 7]);
      let s: Int32Array = a.slice(1, 3);
      expect(s.length).assertEqual(2);
      expect(s.$_get(0)).assertEqual(7);
      expect(s.$_get(1)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_6300
     * @tc.name int32ArraySlicePart03Test063
     * @tc.desc Verify slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-3, -3, -3, -3, -3]);
      let s: Int32Array = a.slice(-3);
      expect(s.length).assertEqual(3);
      expect(s.$_get(0)).assertEqual(-3);
      expect(s.$_get(2)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_6400
     * @tc.name int32ArraySlicePart03Test064
     * @tc.desc Verify MAX_INT slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([2147483647, 2147483647, 2147483647]);
      let s: Int32Array = a.slice(1);
      expect(s.length).assertEqual(2);
      expect(s.$_get(0)).assertEqual(2147483647);
      expect(s.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_6500
     * @tc.name int32ArraySlicePart03Test065
     * @tc.desc Verify MIN_INT slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-2147483648, -2147483648]);
      let s: Int32Array = a.slice();
      expect(s.$_get(0)).assertEqual(-2147483648);
      expect(s.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_6600
     * @tc.name int32ArraySlicePart03Test066
     * @tc.desc Verify a full slice is independent when the result is modified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-1, -1, -1, -1]);
      let s: Int32Array = a.slice(0, -1);
      expect(s.length).assertEqual(3);
      expect(s.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_6700
     * @tc.name int32ArraySlicePart03Test067
     * @tc.desc Verify slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([5, 5, 5, 5]);
      let s: Int32Array = a.slice();
      s.$_set(0, 99);
      expect(a.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_6800
     * @tc.name int32ArraySlicePart03Test068
     * @tc.desc Verify 1 begin>=end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 1, 1]);
      let s: Int32Array = a.slice(5, -5);
      expect(s.length).assertEqual(0);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_6900
     * @tc.name int32ArraySlicePart03Test069
     * @tc.desc Verify begin=length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let s: Int32Array = a.slice(4);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_7000
     * @tc.name int32ArraySlicePart03Test070
     * @tc.desc Verify begin=-length-1 clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let s: Int32Array = a.slice(-4);
      expect(s.length).assertEqual(3);
      expect(s.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_7100
     * @tc.name int32ArraySlicePart03Test071
     * @tc.desc Verify end=-length-1 clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let s: Int32Array = a.slice(0, -4);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_7200
     * @tc.name int32ArraySlicePart03Test072
     * @tc.desc Verify begin>end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      let s: Int32Array = a.slice(3, 1);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_7300
     * @tc.name int32ArraySlicePart03Test073
     * @tc.desc Verify slicing an empty Int32Array with out-of-range bounds returns an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let s: Int32Array = a.slice(100, -100);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_7400
     * @tc.name int32ArraySlicePart03Test074
     * @tc.desc Verify begin/end Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let s: Int32Array = a.slice(999, -999);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_7500
     * @tc.name int32ArraySlicePart03Test075
     * @tc.desc Verify slice begin=-length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([7]);
      let s: Int32Array = a.slice(-2);
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_7600
     * @tc.name int32ArraySlicePart03Test076
     * @tc.desc Verify slice end=-length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([7]);
      let s: Int32Array = a.slice(0, -2);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_7700
     * @tc.name int32ArraySlicePart03Test077
     * @tc.desc Verify slice buffer !== buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let s: Int32Array = a.slice();
      let _d: boolean = s.buffer !== a.buffer;
      expect(_d).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_7800
     * @tc.name int32ArraySlicePart03Test078
     * @tc.desc Verify slice buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let s: Int32Array = a.slice(5, 10);
      let _d: boolean = s.buffer !== a.buffer;
      expect(_d).assertTrue();
      expect(s.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_7900
     * @tc.name int32ArraySlicePart03Test079
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let s: Int32Array = a.slice(999);
      expect(s.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_8000
     * @tc.name int32ArraySlicePart03Test080
     * @tc.desc Verify byteLength = length * 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let s: Int32Array = a.slice(1, 4);
      expect(s.byteLength).assertEqual(12);
      expect(s.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_8100
     * @tc.name int32ArraySlicePart03Test081
     * @tc.desc Verify a full slice copies all three source elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let s: Int32Array = a.slice(1, 2);
      expect(s.byteLength).assertEqual(4);
      expect(s.$_get(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_8200
     * @tc.name int32ArraySlicePart03Test082
     * @tc.desc Verify modifying a full slice does not modify the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let s: Int32Array = a.slice();
      a.$_set(0, 999);
      a.$_set(1, 888);
      a.$_set(2, 777);
      expect(s.$_get(0)).assertEqual(10);
      expect(s.$_get(1)).assertEqual(20);
      expect(s.$_get(2)).assertEqual(30);
      {
        let a: Int32Array = new Int32Array([10, 20, 30]);
        let s: Int32Array = a.slice();
        s.$_set(0, 111);
        s.$_set(1, 222);
        s.$_set(2, 333);
        expect(a.$_get(0)).assertEqual(10);
        expect(a.$_get(1)).assertEqual(20);
        expect(a.$_get(2)).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_8300
     * @tc.name int32ArraySlicePart03Test083
     * @tc.desc Verify slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let s: Int32Array = a.slice(1, 4);
      s.$_set(0, 0);
      s.$_set(1, 0);
      s.$_set(2, 0);
      expect(a.$_get(1)).assertEqual(20);
      expect(a.$_get(2)).assertEqual(30);
      expect(a.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_8400
     * @tc.name int32ArraySlicePart03Test084
     * @tc.desc Verify slice copies elements into an independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let s: Int32Array = a.slice();
      expect(s.byteLength).assertEqual(8);
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(1)).assertEqual(2);
      expect(s.buffer).not().assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_8500
     * @tc.name int32ArraySlicePart03Test085
     * @tc.desc Verify 0 slice 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-1, 0, 1]);
      let s: Int32Array = a.slice(1, 2);
      expect(s.length).assertEqual(1);
      expect(s.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_8600
     * @tc.name int32ArraySlicePart03Test086
     * @tc.desc Verify -1 slice -1 0xFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-1, 100]);
      let s: Int32Array = a.slice(0, 1);
      expect(s.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_8700
     * @tc.name int32ArraySlicePart03Test087
     * @tc.desc Verify MAX_INT slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0, 2147483647, -1]);
      let s: Int32Array = a.slice(1, 2);
      expect(s.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_8800
     * @tc.name int32ArraySlicePart03Test088
     * @tc.desc Verify slice(0, 1) preserves INT32_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-2147483648, 0]);
      let s: Int32Array = a.slice(0, 1);
      expect(s.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_8900
     * @tc.name int32ArraySlicePart03Test089
     * @tc.desc Verify slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([2147483647, -2147483648, 0, -1, 1]);
      let s: Int32Array = a.slice(0, 3);
      expect(s.$_get(0)).assertEqual(2147483647);
      expect(s.$_get(1)).assertEqual(-2147483648);
      expect(s.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_9000
     * @tc.name int32ArraySlicePart03Test090
     * @tc.desc Verify nested slice(1, 4).slice(0, 2) returns values 20 and 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let s1: Int32Array = a.slice();
      let s2: Int32Array = s1.slice();
      expect(s2.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_9100
     * @tc.name int32ArraySlicePart03Test091
     * @tc.desc Verify nested negative slices return the final values 5 and 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let s1: Int32Array = a.slice(1, 4);
      let s2: Int32Array = s1.slice(0, 2);
      expect(s2.length).assertEqual(2);
      expect(s2.$_get(0)).assertEqual(20);
      expect(s2.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_9200
     * @tc.name int32ArraySlicePart03Test092
     * @tc.desc Verify slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
      let s1: Int32Array = a.slice(-4);
      let s2: Int32Array = s1.slice(-2);
      expect(s2.length).assertEqual(2);
      expect(s2.$_get(0)).assertEqual(5);
      expect(s2.$_get(1)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_9300
     * @tc.name int32ArraySlicePart03Test093
     * @tc.desc Verify byteOffset slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Int32Array = new Int32Array(buf, 4, 3);
      view.$_set(0, 11);
      view.$_set(1, 22);
      view.$_set(2, 33);
      let s: Int32Array = view.slice();
      expect(s.length).assertEqual(3);
      expect(s.$_get(0)).assertEqual(11);
      expect(s.$_get(2)).assertEqual(33);
      let _d: boolean = s.buffer !== buf;
      expect(_d).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_9400
     * @tc.name int32ArraySlicePart03Test094
     * @tc.desc Verify byteOffset slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Int32Array = new Int32Array(buf, 4, 3);
      let s: Int32Array = view.slice(10);
      expect(s.length).assertEqual(0);
      let _d: boolean = s.buffer !== buf;
      expect(_d).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_9500
     * @tc.name int32ArraySlicePart03Test095
     * @tc.desc Verify byteOffset slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Int32Array = new Int32Array(buf, 0, 4);
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      view.$_set(3, 4);
      let s: Int32Array = view.slice(1, 3);
      view.$_set(1, 99);
      view.$_set(2, 88);
      expect(s.$_get(0)).assertEqual(2);
      expect(s.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_9600
     * @tc.name int32ArraySlicePart03Test096
     * @tc.desc Verify buffer slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let firstVal: Int32Array = new Int32Array(buf, 0, 2);
      let secondVal: Int32Array = new Int32Array(buf, 8, 2);
      firstVal.$_set(0, 10);
      firstVal.$_set(1, 20);
      secondVal.$_set(0, 30);
      secondVal.$_set(1, 40);
      let s1: Int32Array = firstVal.slice();
      let s2: Int32Array = secondVal.slice();
      expect(s1.$_get(0)).assertEqual(10);
      expect(s1.$_get(1)).assertEqual(20);
      expect(s2.$_get(0)).assertEqual(30);
      expect(s2.$_get(1)).assertEqual(40);
      let _d: boolean = s1.buffer !== s2.buffer;
      expect(_d).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_9700
     * @tc.name int32ArraySlicePart03Test097
     * @tc.desc Verify slice() copies values into an independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let a: Int32Array = new Int32Array(buf);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      a.$_set(3, 4);
      a.$_set(4, 5);
      let s: Int32Array = a.slice(0, 2);
      expect(s.length).assertEqual(2);
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(1)).assertEqual(2);
      s.$_set(0, 55);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_9800
     * @tc.name int32ArraySlicePart03Test098
     * @tc.desc Verify subarray slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40]);
      let sub: Int32Array = a.subarray(1, 3);
      let s: Int32Array = sub.slice();
      s.$_set(0, 999);
      expect(sub.$_get(0)).assertEqual(20);
      expect(a.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SLICE_PART03_9900
     * @tc.name int32ArraySlicePart03Test099
     * @tc.desc Verify ArrayBuffer slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySlicePart03Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let a: Int32Array = new Int32Array(buf);
      let s: Int32Array = a.slice();
      expect(s.length).assertEqual(0);
    });
  });
}
