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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArraySubarrayThreeTest(): void {
  describe('Uint32ArraySubarrayThreeTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_0100
     * @tc.name testUint32ArraySubarrayThree001
     * @tc.desc Verify subarray no-args returns full-length view sharing buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray();
      expect(view.length).assertEqual(5);
      expect(view.buffer).assertEqual(values.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_0200
     * @tc.name testUint32ArraySubarrayThree002
     * @tc.desc Verify subarray(-2) returns last 2 elements starting at 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(-2);
      expect(view.length).assertEqual(2);
      expect(view.$_get(0)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_0300
     * @tc.name testUint32ArraySubarrayThree003
     * @tc.desc Verify subarray(-3,-1) returns 2 elements ending at 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(-3, -1);
      expect(view.length).assertEqual(2);
      expect(view.$_get(1)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_0400
     * @tc.name testUint32ArraySubarrayThree004
     * @tc.desc Verify subarray(-1) returns last element 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(-1);
      expect(view.length).assertEqual(1);
      expect(view.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_0500
     * @tc.name testUint32ArraySubarrayThree005
     * @tc.desc Verify subarray(-length) returns full array starting at 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(-5);
      expect(view.length).assertEqual(5);
      expect(view.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_0600
     * @tc.name testUint32ArraySubarrayThree006
     * @tc.desc Verify subarray(-999999) clamps begin to 0 and returns full array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(-999999);
      expect(view.length).assertEqual(5);
      expect(view.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_0700
     * @tc.name testUint32ArraySubarrayThree007
     * @tc.desc Verify subarray(length+1) returns empty view of length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(6);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_0800
     * @tc.name testUint32ArraySubarrayThree008
     * @tc.desc Verify subarray(0) returns full array copy view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(0);
      expect(view.length).assertEqual(5);
      expect(view.$_get(0)).assertEqual(10);
      expect(view.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_0900
     * @tc.name testUint32ArraySubarrayThree009
     * @tc.desc Verify subarray(-1) on length-3 array returns last element 300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(100, 200, 300);
      const view = values.subarray(-1);
      expect(view.length).assertEqual(1);
      expect(view.$_get(0)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_1000
     * @tc.name testUint32ArraySubarrayThree010
     * @tc.desc Verify subarray(-length) on length-3 array returns full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(100, 200, 300);
      const view = values.subarray(-3);
      expect(view.length).assertEqual(3);
      expect(view.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_1100
     * @tc.name testUint32ArraySubarrayThree011
     * @tc.desc Verify subarray(-length-1) clamps begin to 0 on length-3 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(100, 200, 300);
      const view = values.subarray(-4);
      expect(view.length).assertEqual(3);
      expect(view.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_1200
     * @tc.name testUint32ArraySubarrayThree012
     * @tc.desc Verify subarray(length) on length-3 array returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(100, 200, 300);
      const view = values.subarray(3);
      expect(view.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_1300
     * @tc.name testUint32ArraySubarrayThree013
     * @tc.desc Verify subarray(0,-1) returns first 4 elements ending at 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(0, -1);
      expect(view.length).assertEqual(4);
      expect(view.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_1400
     * @tc.name testUint32ArraySubarrayThree014
     * @tc.desc Verify subarray(0,-length) returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(0, -5);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_1500
     * @tc.name testUint32ArraySubarrayThree015
     * @tc.desc Verify subarray(0,length) returns full array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(0, 5);
      expect(view.length).assertEqual(5);
      expect(view.$_get(0)).assertEqual(10);
      expect(view.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_1600
     * @tc.name testUint32ArraySubarrayThree016
     * @tc.desc Verify subarray(0,int32.MAX) clamps end to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(0, 2147483647);
      expect(view.length).assertEqual(5);
      expect(view.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_1700
     * @tc.name testUint32ArraySubarrayThree017
     * @tc.desc Verify subarray(0,-1) on length-3 array returns 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(100, 200, 300);
      const view = values.subarray(0, -1);
      expect(view.length).assertEqual(2);
      expect(view.$_get(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_1800
     * @tc.name testUint32ArraySubarrayThree018
     * @tc.desc Verify subarray(0,-length) on length-3 array returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(100, 200, 300);
      const view = values.subarray(0, -3);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_1900
     * @tc.name testUint32ArraySubarrayThree019
     * @tc.desc Verify subarray(0,-length-1) clamps end to 0 returning empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(100, 200, 300);
      const view = values.subarray(0, -4);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_2000
     * @tc.name testUint32ArraySubarrayThree020
     * @tc.desc Verify subarray(0,length) on length-3 array returns full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(100, 200, 300);
      const view = values.subarray(0, 3);
      expect(view.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_2100
     * @tc.name testUint32ArraySubarrayThree021
     * @tc.desc Verify subarray(0,length+1) clamps end to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(100, 200, 300);
      const view = values.subarray(0, 4);
      expect(view.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_2200
     * @tc.name testUint32ArraySubarrayThree022
     * @tc.desc Verify subarray(-length,-1) returns first 4 elements starting at 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(-5, -1);
      expect(view.length).assertEqual(4);
      expect(view.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_2300
     * @tc.name testUint32ArraySubarrayThree023
     * @tc.desc Verify subarray(2,1) with begin greater than end returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(2, 1);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_2400
     * @tc.name testUint32ArraySubarrayThree024
     * @tc.desc Verify subarray(length,0) returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(5, 0);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_2500
     * @tc.name testUint32ArraySubarrayThree025
     * @tc.desc Verify subarray(-1,0) with resolved begin greater than end returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(-1, 0);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_2600
     * @tc.name testUint32ArraySubarrayThree026
     * @tc.desc Verify subarray(3,-2) with begin equal to resolved end returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(3, -2);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_2700
     * @tc.name testUint32ArraySubarrayThree027
     * @tc.desc Verify subarray(-2,-1) returns single element 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(-2, -1);
      expect(view.length).assertEqual(1);
      expect(view.$_get(0)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_2800
     * @tc.name testUint32ArraySubarrayThree028
     * @tc.desc Verify subarray(-3,-3) with begin equal to end returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(-3, -3);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_2900
     * @tc.name testUint32ArraySubarrayThree029
     * @tc.desc Verify subarray(length,length) returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(5, 5);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_3000
     * @tc.name testUint32ArraySubarrayThree030
     * @tc.desc Verify subarray(6,7) beyond length returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(6, 7);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_3100
     * @tc.name testUint32ArraySubarrayThree031
     * @tc.desc Verify subarray(-length-1,-1) clamps begin to 0 returning 4 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(-6, -1);
      expect(view.length).assertEqual(4);
      expect(view.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_3200
     * @tc.name testUint32ArraySubarrayThree032
     * @tc.desc Verify subarray(4) in-range byteOffset equals 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(4);
      expect(view.byteOffset).assertEqual(16);
      expect(view.length).assertEqual(1);
      expect(view.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_3300
     * @tc.name testUint32ArraySubarrayThree033
     * @tc.desc Verify toString() on out-of-range subarray view returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(9);
      expect(view.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_3400
     * @tc.name testUint32ArraySubarrayThree034
     * @tc.desc Verify subarray(0) on empty view returns another empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const empty = values.subarray(9);
      const view = empty.subarray(0);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_3500
     * @tc.name testUint32ArraySubarrayThree035
     * @tc.desc Verify $_get(0) on empty view throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(9);
      try {
        view.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_3600
     * @tc.name testUint32ArraySubarrayThree036
     * @tc.desc Verify join(',') on out-of-range subarray view returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(9);
      expect(view.join(',')).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_3700
     * @tc.name testUint32ArraySubarrayThree037
     * @tc.desc Verify subarray(0) on empty array returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const view = values.subarray(0);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_3800
     * @tc.name testUint32ArraySubarrayThree038
     * @tc.desc Verify subarray(-1) on empty array returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const view = values.subarray(-1);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_3900
     * @tc.name testUint32ArraySubarrayThree039
     * @tc.desc Verify subarray(0,5) on empty array returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const view = values.subarray(0, 5);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_4000
     * @tc.name testUint32ArraySubarrayThree040
     * @tc.desc Verify subarray(-1,-1) on empty array returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const view = values.subarray(-1, -1);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_4100
     * @tc.name testUint32ArraySubarrayThree041
     * @tc.desc Verify subarray() on single-element array returns full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7);
      const view = values.subarray();
      expect(view.length).assertEqual(1);
      expect(view.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_4200
     * @tc.name testUint32ArraySubarrayThree042
     * @tc.desc Verify subarray(0) on single-element array returns full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7);
      const view = values.subarray(0);
      expect(view.length).assertEqual(1);
      expect(view.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_4300
     * @tc.name testUint32ArraySubarrayThree043
     * @tc.desc Verify subarray(-1) on single-element array returns full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7);
      const view = values.subarray(-1);
      expect(view.length).assertEqual(1);
      expect(view.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_4400
     * @tc.name testUint32ArraySubarrayThree044
     * @tc.desc Verify subarray(0,1) on single-element array returns full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7);
      const view = values.subarray(0, 1);
      expect(view.length).assertEqual(1);
      expect(view.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_4500
     * @tc.name testUint32ArraySubarrayThree045
     * @tc.desc Verify subarray(1) on single-element array returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7);
      const view = values.subarray(1);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_4600
     * @tc.name testUint32ArraySubarrayThree046
     * @tc.desc Verify subarray(0,-1) on single-element array returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7);
      const view = values.subarray(0, -1);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_4700
     * @tc.name testUint32ArraySubarrayThree047
     * @tc.desc Verify subarray(-1,-1) on single-element array returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7);
      const view = values.subarray(-1, -1);
      expect(view.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_4800
     * @tc.name testUint32ArraySubarrayThree048
     * @tc.desc Verify subarray(1,3) length 2 values 2 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const view = values.subarray(1, 3);
      expect(view.length).assertEqual(2);
      expect(view.$_get(0)).assertEqual(2);
      expect(view.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_4900
     * @tc.name testUint32ArraySubarrayThree049
     * @tc.desc Verify subarray(-2) on length-4 array returns last 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const view = values.subarray(-2);
      expect(view.length).assertEqual(2);
      expect(view.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_5000
     * @tc.name testUint32ArraySubarrayThree050
     * @tc.desc Verify subarray(0,4) on length-4 array returns full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(9, 9, 9, 9);
      const view = values.subarray(0, 4);
      expect(view.length).assertEqual(4);
      expect(view.$_get(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_5100
     * @tc.name testUint32ArraySubarrayThree051
     * @tc.desc Verify subarray(10) beyond length-4 array returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(9, 9, 9, 9);
      const view = values.subarray(10);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_5200
     * @tc.name testUint32ArraySubarrayThree052
     * @tc.desc Verify subarray(undefined,undefined) returns full array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(undefined, undefined);
      expect(view.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_5300
     * @tc.name testUint32ArraySubarrayThree053
     * @tc.desc Verify subarray(2,undefined) treats end as length returning 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(2, undefined);
      expect(view.length).assertEqual(3);
      expect(view.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_5400
     * @tc.name testUint32ArraySubarrayThree054
     * @tc.desc Verify subarray(undefined,3) treats begin as 0 returning 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(undefined, 3);
      expect(view.length).assertEqual(3);
      expect(view.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_5500
     * @tc.name testUint32ArraySubarrayThree055
     * @tc.desc Verify subarray(2,100) clamps end to length returning 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(2, 100);
      expect(view.length).assertEqual(3);
      expect(view.$_get(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_5600
     * @tc.name testUint32ArraySubarrayThree056
     * @tc.desc Verify subarray(2,int32.MAX) clamps end to length returning 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(2, 2147483647);
      expect(view.length).assertEqual(3);
      expect(view.$_get(0)).assertEqual(30);
      expect(view.$_get(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_5700
     * @tc.name testUint32ArraySubarrayThree057
     * @tc.desc Verify subarray(-1,int32.MAX) returns last element 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(-1, 2147483647);
      expect(view.length).assertEqual(1);
      expect(view.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_5800
     * @tc.name testUint32ArraySubarrayThree058
     * @tc.desc Verify subarray view reflects parent buffer mutation via $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(1, 4);
      values.$_set(2, 999);
      expect(view.$_get(1)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_5900
     * @tc.name testUint32ArraySubarrayThree059
     * @tc.desc Verify parent array reflects mutation done via subarray view $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(0, 3);
      view.$_set(1, 888);
      expect(values.$_get(1)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_6000
     * @tc.name testUint32ArraySubarrayThree060
     * @tc.desc Verify nested subarray of subarray shares the underlying buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const v1 = values.subarray(1, 4);
      const v2 = v1.subarray(1, 2);
      values.$_set(2, 555);
      expect(v2.$_get(0)).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_6100
     * @tc.name testUint32ArraySubarrayThree061
     * @tc.desc Verify subarray(2) byteOffset equals 8 for uint32 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(2);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_6200
     * @tc.name testUint32ArraySubarrayThree062
     * @tc.desc Verify subarray(1,4) byteLength equals 12 for length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(1, 4);
      expect(view.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_6300
     * @tc.name testUint32ArraySubarrayThree063
     * @tc.desc Verify sibling subarray views share the parent buffer for independent ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const v1 = values.subarray(0, 2);
      const v2 = values.subarray(2, 4);
      values.$_set(1, 111);
      values.$_set(3, 333);
      expect(v1.$_get(1)).assertEqual(111);
      expect(v2.$_get(1)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_6400
     * @tc.name testUint32ArraySubarrayThree064
     * @tc.desc Verify overlapping subarray views share buffer and reflect each other mutations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const v1 = values.subarray(1, 4);
      const v2 = values.subarray(0, 5);
      v1.$_set(0, 777);
      expect(v2.$_get(1)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_6500
     * @tc.name testUint32ArraySubarrayThree065
     * @tc.desc Verify subarray(1,4) length and element values equal parent slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(1, 4);
      expect(view.length).assertEqual(3);
      expect(view.$_get(0)).assertEqual(20);
      expect(view.$_get(2)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_6600
     * @tc.name testUint32ArraySubarrayThree066
     * @tc.desc Verify reverse() on subarray view mutates parent buffer in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(1, 4);
      view.reverse();
      expect(values.$_get(1)).assertEqual(40);
      expect(values.$_get(3)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_6700
     * @tc.name testUint32ArraySubarrayThree067
     * @tc.desc Verify subarray view shares the same buffer reference as parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(1, 3);
      expect(view.buffer).assertEqual(values.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_6800
     * @tc.name testUint32ArraySubarrayThree068
     * @tc.desc Verify subarray(0) byteOffset equals parent byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(0);
      expect(view.byteOffset).assertEqual(values.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_6900
     * @tc.name testUint32ArraySubarrayThree069
     * @tc.desc Verify subarray(length) length is 0 and buffer equals parent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(5);
      expect(view.length).assertEqual(0);
      expect(view.buffer).assertEqual(values.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_7000
     * @tc.name testUint32ArraySubarrayThree070
     * @tc.desc Verify fill(0) on subarray view mutates parent buffer in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(1, 4);
      view.fill(0);
      expect(values.$_get(1)).assertEqual(0);
      expect(values.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_THREE_7100
     * @tc.name testUint32ArraySubarrayThree071
     * @tc.desc Verify set(src) on subarray view writes into parent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayThree071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(0, 3);
      const src = Uint32Array.of(100, 200, 300);
      view.set(src);
      expect(values.$_get(0)).assertEqual(100);
      expect(values.$_get(2)).assertEqual(300);
    });

  });
}
