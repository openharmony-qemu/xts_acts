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

export default function int32ArraySubarrayPart03Test(): void {
  describe('Int32ArraySubarrayPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_0100
     * @tc.name int32ArraySubarrayPart03Test001
     * @tc.desc Verify begin=-1 length-1; Also verify verify begin=INT_MIN clamp 0; Also verify verify begin=-1 byteOffset = byteOffset + (length-1)*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(-1);
      expect(sub.length).assertEqual(1);
      expect(sub.$_get(0)).assertEqual(50);

      {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(-2147483648);
      expect(sub.length).assertEqual(5);
      expect(sub.$_get(0)).assertEqual(10);
      }

      {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(-1);
      expect(sub.byteOffset).assertEqual(16);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_0200
     * @tc.name int32ArraySubarrayPart03Test002
     * @tc.desc Verify begin=-length -5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(-5);
      expect(sub.length).assertEqual(5);
      expect(sub.$_get(0)).assertEqual(10);
      expect(sub.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_0300
     * @tc.name int32ArraySubarrayPart03Test003
     * @tc.desc Verify begin=-length-1 -6 clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(-6);
      expect(sub.length).assertEqual(5);
      expect(sub.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_0400
     * @tc.name int32ArraySubarrayPart03Test004
     * @tc.desc Verify begin=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(0);
      expect(sub.length).assertEqual(5);
      expect(sub.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_0500
     * @tc.name int32ArraySubarrayPart03Test005
     * @tc.desc Verify begin=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(1);
      expect(sub.length).assertEqual(4);
      expect(sub.$_get(0)).assertEqual(20);
      expect(sub.$_get(3)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_0600
     * @tc.name int32ArraySubarrayPart03Test006
     * @tc.desc Verify begin=length-1 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(4);
      expect(sub.length).assertEqual(1);
      expect(sub.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_0700
     * @tc.name int32ArraySubarrayPart03Test007
     * @tc.desc Verify begin=length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(5);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_0800
     * @tc.name int32ArraySubarrayPart03Test008
     * @tc.desc Verify begin=length+1 6 clamp length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(6);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_0900
     * @tc.name int32ArraySubarrayPart03Test009
     * @tc.desc Verify begin=INT_MAX clamp length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(2147483647);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_1000
     * @tc.name int32ArraySubarrayPart03Test010
     * @tc.desc Verify undefined begin begin 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let sub: Int32Array = arr.subarray(undefined);
      expect(sub.length).assertEqual(3);
      expect(sub.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_1100
     * @tc.name int32ArraySubarrayPart03Test011
     * @tc.desc Verify end=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(0, 0);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_1200
     * @tc.name int32ArraySubarrayPart03Test012
     * @tc.desc Verify end=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(0, 1);
      expect(sub.length).assertEqual(1);
      expect(sub.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_1300
     * @tc.name int32ArraySubarrayPart03Test013
     * @tc.desc Verify end=length-1 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(0, 4);
      expect(sub.length).assertEqual(4);
      expect(sub.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_1400
     * @tc.name int32ArraySubarrayPart03Test014
     * @tc.desc Verify end=-1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(0, -1);
      expect(sub.length).assertEqual(4);
      expect(sub.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_1500
     * @tc.name int32ArraySubarrayPart03Test015
     * @tc.desc Verify end=-length -5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(0, -5);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_1600
     * @tc.name int32ArraySubarrayPart03Test016
     * @tc.desc Verify end=-length-1 -6 clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(0, -6);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_1700
     * @tc.name int32ArraySubarrayPart03Test017
     * @tc.desc Verify end=INT_MIN clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(0, -2147483648);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_1800
     * @tc.name int32ArraySubarrayPart03Test018
     * @tc.desc Verify end=length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(0, 5);
      expect(sub.length).assertEqual(5);
      expect(sub.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_1900
     * @tc.name int32ArraySubarrayPart03Test019
     * @tc.desc Verify end=length+1 6 clamp length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(0, 6);
      expect(sub.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_2000
     * @tc.name int32ArraySubarrayPart03Test020
     * @tc.desc Verify end=INT_MAX clamp length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(0, 2147483647);
      expect(sub.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_2100
     * @tc.name int32ArraySubarrayPart03Test021
     * @tc.desc Verify undefined end end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let sub: Int32Array = arr.subarray(1, undefined);
      expect(sub.length).assertEqual(2);
      expect(sub.$_get(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_2200
     * @tc.name int32ArraySubarrayPart03Test022
     * @tc.desc Verify begin=undefined end=undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let sub: Int32Array = arr.subarray(undefined, undefined);
      expect(sub.length).assertEqual(3);
      expect(sub.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_2300
     * @tc.name int32ArraySubarrayPart03Test023
     * @tc.desc Verify begin=length,end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(5, 5);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_2400
     * @tc.name int32ArraySubarrayPart03Test024
     * @tc.desc Verify begin=-1,end=-1 length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(-1, -1);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_2500
     * @tc.name int32ArraySubarrayPart03Test025
     * @tc.desc Verify begin=2,end=1 begin>end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(2, 1);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_2600
     * @tc.name int32ArraySubarrayPart03Test026
     * @tc.desc Verify begin=-1,end=-2 begin=4,end=3 begin>end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(-1, -2);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_2700
     * @tc.name int32ArraySubarrayPart03Test027
     * @tc.desc Verify begin=INT_MAX,end=INT_MIN clamp begin=length,end=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(2147483647, -2147483648);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_2800
     * @tc.name int32ArraySubarrayPart03Test028
     * @tc.desc Verify begin=INT_MIN,end=INT_MAX clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(-2147483648, 2147483647);
      expect(sub.length).assertEqual(5);
      expect(sub.$_get(0)).assertEqual(10);
      expect(sub.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_2900
     * @tc.name int32ArraySubarrayPart03Test029
     * @tc.desc Verify begin end clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let sub: Int32Array = arr.subarray(-100000, 100000);
      expect(sub.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_3000
     * @tc.name int32ArraySubarrayPart03Test030
     * @tc.desc Verify begin end clamp 0 end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(-100, 3);
      expect(sub.length).assertEqual(3);
      expect(sub.$_get(0)).assertEqual(10);
      expect(sub.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_3100
     * @tc.name int32ArraySubarrayPart03Test031
     * @tc.desc Verify begin end clamp begin length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(2, 100);
      expect(sub.length).assertEqual(3);
      expect(sub.$_get(0)).assertEqual(30);
      expect(sub.$_get(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_3200
     * @tc.name int32ArraySubarrayPart03Test032
     * @tc.desc Verify begin=length-1,end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let sub: Int32Array = arr.subarray(2, 3);
      expect(sub.length).assertEqual(1);
      expect(sub.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_3300
     * @tc.name int32ArraySubarrayPart03Test033
     * @tc.desc Verify subarray(-1) clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let sub: Int32Array = arr.subarray(-1);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_3400
     * @tc.name int32ArraySubarrayPart03Test034
     * @tc.desc Verify subarray(1) clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let sub: Int32Array = arr.subarray(1);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_3500
     * @tc.name int32ArraySubarrayPart03Test035
     * @tc.desc Verify subarray(INT_MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let sub: Int32Array = arr.subarray(2147483647);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_3600
     * @tc.name int32ArraySubarrayPart03Test036
     * @tc.desc Verify subarray(INT_MIN, INT_MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let sub: Int32Array = arr.subarray(-2147483648, 2147483647);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_3700
     * @tc.name int32ArraySubarrayPart03Test037
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let sub: Int32Array = arr.subarray();
      expect(sub.length).assertEqual(1);
      expect(sub.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_3800
     * @tc.name int32ArraySubarrayPart03Test038
     * @tc.desc Verify subarray(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let sub: Int32Array = arr.subarray(0);
      expect(sub.length).assertEqual(1);
      expect(sub.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_3900
     * @tc.name int32ArraySubarrayPart03Test039
     * @tc.desc Verify subarray(0,1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let sub: Int32Array = arr.subarray(0, 1);
      expect(sub.length).assertEqual(1);
      expect(sub.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_4000
     * @tc.name int32ArraySubarrayPart03Test040
     * @tc.desc Verify subarray(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let sub: Int32Array = arr.subarray(1);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_4100
     * @tc.name int32ArraySubarrayPart03Test041
     * @tc.desc Verify subarray(-1) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let sub: Int32Array = arr.subarray(-1);
      expect(sub.length).assertEqual(1);
      expect(sub.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_4200
     * @tc.name int32ArraySubarrayPart03Test042
     * @tc.desc Verify subarray(-2) clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let sub: Int32Array = arr.subarray(-2);
      expect(sub.length).assertEqual(1);
      expect(sub.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_4300
     * @tc.name int32ArraySubarrayPart03Test043
     * @tc.desc Verify subarray(-1,0) begin=0,end=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let sub: Int32Array = arr.subarray(-1, 0);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_4400
     * @tc.name int32ArraySubarrayPart03Test044
     * @tc.desc Verify subarray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0, 0]);
      let sub: Int32Array = arr.subarray(1, 4);
      expect(sub.length).assertEqual(3);
      expect(sub.$_get(0)).assertEqual(0);
      expect(sub.$_get(1)).assertEqual(0);
      expect(sub.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_4500
     * @tc.name int32ArraySubarrayPart03Test045
     * @tc.desc Verify INT_MAX subarray INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 2147483647, 2147483647]);
      let sub: Int32Array = arr.subarray(1, 2);
      expect(sub.length).assertEqual(1);
      expect(sub.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_4600
     * @tc.name int32ArraySubarrayPart03Test046
     * @tc.desc Verify -1 subarray -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -1, -1, -1]);
      let sub: Int32Array = arr.subarray(-1);
      expect(sub.length).assertEqual(1);
      expect(sub.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_4700
     * @tc.name int32ArraySubarrayPart03Test047
     * @tc.desc Verify INT_MIN subarray clamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, -2147483648]);
      let sub: Int32Array = arr.subarray(-10, 10);
      expect(sub.length).assertEqual(2);
      expect(sub.$_get(0)).assertEqual(-2147483648);
      expect(sub.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_4800
     * @tc.name int32ArraySubarrayPart03Test048
     * @tc.desc Verify begin=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(-1);
      sub.$_set(0, 99);
      expect(arr.$_get(4)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_4900
     * @tc.name int32ArraySubarrayPart03Test049
     * @tc.desc Verify begin=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(-1);
      arr.$_set(4, 88);
      expect(sub.$_get(0)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_5000
     * @tc.name int32ArraySubarrayPart03Test050
     * @tc.desc Verify begin=length buffer; Also verify verify begin=INT_MAX buffer; Also verify verify begin=length byteOffset = byteOffset + length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let sub: Int32Array = arr.subarray(3);
      expect(sub.buffer).assertEqual(arr.buffer);

      {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let sub: Int32Array = arr.subarray(2147483647);
      expect(sub.buffer).assertEqual(arr.buffer);
      }

      {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let sub: Int32Array = arr.subarray(3);
      expect(sub.byteOffset).assertEqual(12);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_5100
     * @tc.name int32ArraySubarrayPart03Test051
     * @tc.desc Verify begin=0,end=0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let sub: Int32Array = arr.subarray(0, 0);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_5200
     * @tc.name int32ArraySubarrayPart03Test052
     * @tc.desc Verify begin=2,end=1 begin>end buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let sub: Int32Array = arr.subarray(2, 1);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_5300
     * @tc.name int32ArraySubarrayPart03Test053
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub1: Int32Array = arr.subarray(1);
      let sub2: Int32Array = sub1.subarray(1);
      expect(sub2.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_5400
     * @tc.name int32ArraySubarrayPart03Test054
     * @tc.desc Verify subarray begin buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub1: Int32Array = arr.subarray(1);
      let sub2: Int32Array = sub1.subarray(-1);
      expect(sub2.buffer).assertEqual(arr.buffer);
      expect(sub2.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_5500
     * @tc.name int32ArraySubarrayPart03Test055
     * @tc.desc Verify $_set at index 0 on an empty subarray throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Int32Array = new Int32Array([10, 20, 30]);
        let sub: Int32Array = arr.subarray(3);
        sub.$_set(0, 999);
        expect(arr.$_get(0)).assertEqual(10);
        expect(arr.$_get(2)).assertEqual(30);
        expect(arr.length).assertEqual(3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_5600
     * @tc.name int32ArraySubarrayPart03Test056
     * @tc.desc Verify $_set at index -1 on a subarray throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Int32Array = new Int32Array([10, 20, 30]);
        let sub: Int32Array = arr.subarray(0, 0);
        sub.$_set(-1, 999);
        expect(arr.$_get(0)).assertEqual(10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_5700
     * @tc.name int32ArraySubarrayPart03Test057
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let sub1: Int32Array = arr.subarray(3);
      let sub2: Int32Array = sub1.subarray();
      expect(sub2.length).assertEqual(0);
      expect(sub2.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_5800
     * @tc.name int32ArraySubarrayPart03Test058
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let subA: Int32Array = arr.subarray(0, 2);
      let subB: Int32Array = arr.subarray(2, 4);
      subA.$_set(1, 222);
      subB.$_set(0, 333);
      expect(arr.$_get(1)).assertEqual(222);
      expect(arr.$_get(2)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_5900
     * @tc.name int32ArraySubarrayPart03Test059
     * @tc.desc Verify byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let sub: Int32Array = arr.subarray(2, 2);
      expect(sub.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_6000
     * @tc.name int32ArraySubarrayPart03Test060
     * @tc.desc Verify byteOffset subarray byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let base: Int32Array = new Int32Array(buf, 4, 5);
      base.$_set(0, 10);
      base.$_set(1, 20);
      base.$_set(2, 30);
      base.$_set(3, 40);
      base.$_set(4, 50);
      let sub: Int32Array = base.subarray(2);
      expect(sub.byteOffset).assertEqual(12);
      expect(sub.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_6100
     * @tc.name int32ArraySubarrayPart03Test061
     * @tc.desc Verify subarray(1).subarray(1) byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let base: Int32Array = new Int32Array(buf, 0, 8);
      base.$_set(0, 0);
      base.$_set(1, 10);
      base.$_set(2, 20);
      base.$_set(3, 30);
      let sub1: Int32Array = base.subarray(1);
      let sub2: Int32Array = sub1.subarray(1);
      expect(sub2.byteOffset).assertEqual(8);
      expect(sub2.$_get(0)).assertEqual(20);
      expect(sub2.buffer).assertEqual(base.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_6200
     * @tc.name int32ArraySubarrayPart03Test062
     * @tc.desc Verify set(array, offset) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(1, 4);
      let src: Int32Array = new Int32Array([222, 333]);
      sub.set(src, 1);
      expect(arr.$_get(2)).assertEqual(222);
      expect(arr.$_get(3)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_6300
     * @tc.name int32ArraySubarrayPart03Test063
     * @tc.desc Verify subarray length and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let sub: Int32Array = arr.subarray();
      expect(sub.length).assertEqual(3);
      expect(sub.$_get(0)).assertEqual(1);
      expect(sub.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_6400
     * @tc.name int32ArraySubarrayPart03Test064
     * @tc.desc Verify BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let sub: Int32Array = arr.subarray();
      expect(sub.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_6500
     * @tc.name int32ArraySubarrayPart03Test065
     * @tc.desc Verify BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let sub: Int32Array = arr.subarray(3);
      expect(sub.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_6600
     * @tc.name int32ArraySubarrayPart03Test066
     * @tc.desc Verify constructor Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let sub: Int32Array = arr.subarray(1);
      expect(sub.length).assertEqual(2);
      expect(sub.$_get(0)).assertEqual(2);
      expect(sub.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_6700
     * @tc.name int32ArraySubarrayPart03Test067
     * @tc.desc Verify subarray Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let sub1: Int32Array = arr.subarray();
      let sub2: Int32Array = arr.subarray();
      expect(sub1).not().assertEqual(sub2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_6800
     * @tc.name int32ArraySubarrayPart03Test068
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      arr.subarray(1, 2);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_6900
     * @tc.name int32ArraySubarrayPart03Test069
     * @tc.desc Verify length = end - begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(1, 4);
      expect(sub.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_7000
     * @tc.name int32ArraySubarrayPart03Test070
     * @tc.desc Verify byteLength = length * 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(1, 4);
      expect(sub.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_7100
     * @tc.name int32ArraySubarrayPart03Test071
     * @tc.desc Verify buffer buffer ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let sub: Int32Array = arr.subarray(1);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_7200
     * @tc.name int32ArraySubarrayPart03Test072
     * @tc.desc Verify begin length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let sub: Int32Array = arr.subarray(4);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_7300
     * @tc.name int32ArraySubarrayPart03Test073
     * @tc.desc Verify begin -1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let sub: Int32Array = arr.subarray(-1000000);
      expect(sub.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_7400
     * @tc.name int32ArraySubarrayPart03Test074
     * @tc.desc Verify end clamp length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let sub: Int32Array = arr.subarray(0, 1000000);
      expect(sub.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_7500
     * @tc.name int32ArraySubarrayPart03Test075
     * @tc.desc Verify begin > end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let sub: Int32Array = arr.subarray(2, 1);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_7600
     * @tc.name int32ArraySubarrayPart03Test076
     * @tc.desc Verify begin/end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let sub: Int32Array = arr.subarray(-100, 100);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_7700
     * @tc.name int32ArraySubarrayPart03Test077
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(1, 4);
      sub.fill(7);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
      expect(arr.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_7800
     * @tc.name int32ArraySubarrayPart03Test078
     * @tc.desc Verify reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(1, 4);
      sub.reverse();
      expect(arr.$_get(1)).assertEqual(40);
      expect(arr.$_get(2)).assertEqual(30);
      expect(arr.$_get(3)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_7900
     * @tc.name int32ArraySubarrayPart03Test079
     * @tc.desc Verify set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let sub: Int32Array = arr.subarray(1, 3);
      let src: Int32Array = new Int32Array([222, 333]);
      arr.set(src, 1);
      expect(sub.$_get(0)).assertEqual(222);
      expect(sub.$_get(1)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_SUBARRAY_PART03_TEST_MINDMAP_8000
     * @tc.name int32ArraySubarrayPart03Test080
     * @tc.desc Verify subarray ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArraySubarrayPart03Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let firstVal: Int32Array = new Int32Array(buf, 4, 4);
      firstVal.$_set(0, 1);
      firstVal.$_set(1, 2);
      firstVal.$_set(2, 3);
      firstVal.$_set(3, 4);
      let secondVal: Int32Array = firstVal.subarray(1, 3);
      secondVal.$_set(0, 22);
      secondVal.$_set(1, 33);
      expect(firstVal.$_get(1)).assertEqual(22);
      expect(firstVal.$_get(2)).assertEqual(33);
    });
  });
}
