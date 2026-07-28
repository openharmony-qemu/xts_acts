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

export default function Float32ArraySubarray3Test(): void {
  describe('Float32ArraySubarray3Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(45);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_0100
     * @tc.name testFloat32ArraySubarrayThree001
     * @tc.desc Verify subarray(2) returns view with 3 elements from index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(2);
      expect(view.length).assertEqual(3);
      const element001 = view.$_get(0);
      expect(element001).assertEqual(3.0);
      const element001Part2 = view.$_get(2);
      expect(element001Part2).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_0200
     * @tc.name testFloat32ArraySubarrayThree002
     * @tc.desc Verify subarray(1, 4) returns view with 3 elements from index 1 to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(1, 4);
      expect(view.length).assertEqual(3);
      const element002 = view.$_get(0);
      expect(element002).assertEqual(2.0);
      const element002Part2 = view.$_get(2);
      expect(element002Part2).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_0300
     * @tc.name testFloat32ArraySubarrayThree003
     * @tc.desc Verify begin=length-1 (4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(4);
      expect(view.length).assertEqual(1);
      const element003 = view.$_get(0);
      expect(element003).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_0400
     * @tc.name testFloat32ArraySubarrayThree004
     * @tc.desc Verify begin=length (5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(5);
      expect(view.length).assertEqual(0);
      try {
        view.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_0500
     * @tc.name testFloat32ArraySubarrayThree005
     * @tc.desc Verify begin=length+1 (6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(6);
      expect(view.length).assertEqual(0);
      try {
        view.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_0600
     * @tc.name testFloat32ArraySubarrayThree006
     * @tc.desc Verify begin=-length-1 (-6) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(-6);
      expect(view.length).assertEqual(5);
      const element006 = view.$_get(0);
      expect(element006).assertEqual(1.0);
      const element006Part2 = view.$_get(4);
      expect(element006Part2).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_0700
     * @tc.name testFloat32ArraySubarrayThree007
     * @tc.desc Verify begin=-7 clamped to 0 returns full view with 5 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(-7);
      expect(view.length).assertEqual(5);
      const element007 = view.$_get(4);
      expect(element007).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_0800
     * @tc.name testFloat32ArraySubarrayThree008
     * @tc.desc Verify begin=2147483647 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(2147483647);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_0900
     * @tc.name testFloat32ArraySubarrayThree009
     * @tc.desc Verify begin=-2147483648 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(-2147483648);
      expect(view.length).assertEqual(5);
      const element009 = view.$_get(0);
      expect(element009).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_1000
     * @tc.name testFloat32ArraySubarrayThree010
     * @tc.desc Verify begin=length-2 (3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(3);
      expect(view.length).assertEqual(2);
      const element010 = view.$_get(0);
      expect(element010).assertEqual(4.0);
      const element010Part2 = view.$_get(1);
      expect(element010Part2).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_1100
     * @tc.name testFloat32ArraySubarrayThree011
     * @tc.desc Verify begin=-2 on [1,2,3,4,5] returns last 2 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(-2);
      expect(view.length).assertEqual(2);
      const element011 = view.$_get(0);
      expect(element011).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_1200
     * @tc.name testFloat32ArraySubarrayThree012
     * @tc.desc Verify begin=-3 returns view with 3 elements from index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(-3);
      expect(view.length).assertEqual(3);
      const element012 = view.$_get(0);
      expect(element012).assertEqual(3.0);
      const element012Part2 = view.$_get(2);
      expect(element012Part2).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_1300
     * @tc.name testFloat32ArraySubarrayThree013
     * @tc.desc Verify end = 0 returns an empty view when begin is also 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(0, 0);
      expect(view.length).assertEqual(0);
      try {
        view.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_1400
     * @tc.name testFloat32ArraySubarrayThree014
     * @tc.desc Verify end=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(0, 1);
      expect(view.length).assertEqual(1);
      const element014 = view.$_get(0);
      expect(element014).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_1500
     * @tc.name testFloat32ArraySubarrayThree015
     * @tc.desc Verify end=length (5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(0, 5);
      expect(view.length).assertEqual(5);
      const element015 = view.$_get(4);
      expect(element015).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_1600
     * @tc.name testFloat32ArraySubarrayThree016
     * @tc.desc Verify end=length+1 (6) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(0, 6);
      expect(view.length).assertEqual(5);
      const element016 = view.$_get(0);
      expect(element016).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_1700
     * @tc.name testFloat32ArraySubarrayThree017
     * @tc.desc Verify end=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(0, -1);
      expect(view.length).assertEqual(4);
      const element017 = view.$_get(3);
      expect(element017).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_1800
     * @tc.name testFloat32ArraySubarrayThree018
     * @tc.desc Verify end=-length (-5) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(0, -5);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_1900
     * @tc.name testFloat32ArraySubarrayThree019
     * @tc.desc Verify end = -6 is clamped to 0 and returns an empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(0, -6);
      expect(view.length).assertEqual(0);
      try {
        view.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_2000
     * @tc.name testFloat32ArraySubarrayThree020
     * @tc.desc Verify end=2147483647 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(0, 2147483647);
      expect(view.length).assertEqual(5);
      const element020 = view.$_get(4);
      expect(element020).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_2100
     * @tc.name testFloat32ArraySubarrayThree021
     * @tc.desc Verify end=-2147483648 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(0, -2147483648);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_2200
     * @tc.name testFloat32ArraySubarrayThree022
     * @tc.desc Verify end=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(0, 2);
      expect(view.length).assertEqual(2);
      const element022 = view.$_get(1);
      expect(element022).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_2300
     * @tc.name testFloat32ArraySubarrayThree023
     * @tc.desc Verify end=length-1 (4) 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(0, 4);
      expect(view.length).assertEqual(4);
      const element023 = view.$_get(3);
      expect(element023).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_2400
     * @tc.name testFloat32ArraySubarrayThree024
     * @tc.desc Verify end=-4 returns view with 1 element from index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(0, -4);
      expect(view.length).assertEqual(1);
      const element024 = view.$_get(0);
      expect(element024).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_2500
     * @tc.name testFloat32ArraySubarrayThree025
     * @tc.desc Verify begin=length end=length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(5, 6);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_2600
     * @tc.name testFloat32ArraySubarrayThree026
     * @tc.desc Verify begin=-(length+1) end=-1 returns view with 4 elements from index 0 to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(-6, -1);
      expect(view.length).assertEqual(4);
      const element026 = view.$_get(0);
      expect(element026).assertEqual(1.0);
      const element026Part2 = view.$_get(3);
      expect(element026Part2).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_2700
     * @tc.name testFloat32ArraySubarrayThree027
     * @tc.desc Verify begin=2147483647 end=2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(2147483647, 2147483647);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_2800
     * @tc.name testFloat32ArraySubarrayThree028
     * @tc.desc Verify begin=-2147483648 end=2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(-2147483648, 2147483647);
      expect(view.length).assertEqual(5);
      const element028 = view.$_get(0);
      expect(element028).assertEqual(1.0);
      const element028Part2 = view.$_get(4);
      expect(element028Part2).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_2900
     * @tc.name testFloat32ArraySubarrayThree029
     * @tc.desc Verify begin=length+1 end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(6, 5);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_3000
     * @tc.name testFloat32ArraySubarrayThree030
     * @tc.desc Verify begin=-1 end=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(-1, -1);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_3100
     * @tc.name testFloat32ArraySubarrayThree031
     * @tc.desc Verify begin=3 end=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(3, 2);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_3200
     * @tc.name testFloat32ArraySubarrayThree032
     * @tc.desc Verify begin=-2 end=-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(-2, -3);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_3300
     * @tc.name testFloat32ArraySubarrayThree033
     * @tc.desc Verify begin=1 end=-1 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(1, -1);
      expect(view.length).assertEqual(3);
      const element033 = view.$_get(0);
      expect(element033).assertEqual(2.0);
      const element033Part2 = view.$_get(2);
      expect(element033Part2).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_3400
     * @tc.name testFloat32ArraySubarrayThree034
     * @tc.desc Verify begin=-4 end=4 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(-4, 4);
      expect(view.length).assertEqual(3);
      const element034 = view.$_get(0);
      expect(element034).assertEqual(2.0);
      const element034Part2 = view.$_get(2);
      expect(element034Part2).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_3500
     * @tc.name testFloat32ArraySubarrayThree035
     * @tc.desc Verify BYTES_PER_ELEMENT 4 Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(1, 4);
      expect(view.BYTES_PER_ELEMENT).assertEqual(4);
      expect(view.length).assertEqual(3);
      expect(view.$_get(0)).assertEqual(2.0);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_3600
     * @tc.name testFloat32ArraySubarrayThree036
     * @tc.desc Verify subarray(1, 4) view length is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(1, 4);
      expect(view.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_3700
     * @tc.name testFloat32ArraySubarrayThree037
     * @tc.desc Verify subarray begin index 2 produces byteOffset 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(2);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_3800
     * @tc.name testFloat32ArraySubarrayThree038
     * @tc.desc Verify subarray(0, 3) view byteLength is 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(0, 3);
      expect(view.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_3900
     * @tc.name testFloat32ArraySubarrayThree039
     * @tc.desc Verify subarray view shares the same underlying ArrayBuffer as source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(1, 3);
      expect(view.buffer).assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_4000
     * @tc.name testFloat32ArraySubarrayThree040
     * @tc.desc Verify subarray view length and buffer are consistent with source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const observedValue040: Float32Array = src.subarray(1, 3);
      const observedValue040Part2: Float32Array = src.subarray(1, 3);
      expect(observedValue040.length).assertEqual(2);
      expect(observedValue040.buffer).assertEqual(src.buffer);
      expect(observedValue040Part2.buffer).assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_4100
     * @tc.name testFloat32ArraySubarrayThree041
     * @tc.desc Verify an empty source array with begin = 0 returns an empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([]);
      const view: Float32Array = src.subarray(0);
      expect(view.length).assertEqual(0);
      try {
        view.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_4200
     * @tc.name testFloat32ArraySubarrayThree042
     * @tc.desc Verify an empty source array with begin = -1 returns an empty view after clamping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([]);
      const view: Float32Array = src.subarray(-1);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_4300
     * @tc.name testFloat32ArraySubarrayThree043
     * @tc.desc Verify an empty source array with begin = 0 and end = 0 returns an empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([]);
      const view: Float32Array = src.subarray(0, 0);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_4400
     * @tc.name testFloat32ArraySubarrayThree044
     * @tc.desc Verify begin=0 end=5 on empty array returns empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([]);
      const view: Float32Array = src.subarray(0, 5);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_4500
     * @tc.name testFloat32ArraySubarrayThree045
     * @tc.desc Verify begin=2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([]);
      const view: Float32Array = src.subarray(2147483647);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_4600
     * @tc.name testFloat32ArraySubarrayThree046
     * @tc.desc Verify begin=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([9.0]);
      const view: Float32Array = src.subarray(0);
      expect(view.length).assertEqual(1);
      const element046 = view.$_get(0);
      expect(element046).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_4700
     * @tc.name testFloat32ArraySubarrayThree047
     * @tc.desc Verify begin=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([9.0]);
      const view: Float32Array = src.subarray(-1);
      expect(view.length).assertEqual(1);
      const element047 = view.$_get(0);
      expect(element047).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_4800
     * @tc.name testFloat32ArraySubarrayThree048
     * @tc.desc Verify begin=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([9.0]);
      const view: Float32Array = src.subarray(1);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_4900
     * @tc.name testFloat32ArraySubarrayThree049
     * @tc.desc Verify begin=0 end=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([9.0]);
      const view: Float32Array = src.subarray(0, 1);
      expect(view.length).assertEqual(1);
      const element049 = view.$_get(0);
      expect(element049).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_5000
     * @tc.name testFloat32ArraySubarrayThree050
     * @tc.desc Verify begin=-1 end=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([9.0]);
      const view: Float32Array = src.subarray(-1, 0);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_5100
     * @tc.name testFloat32ArraySubarrayThree051
     * @tc.desc Verify begin=-2 on single-element array returns view with 1 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([9.0]);
      const view: Float32Array = src.subarray(-2);
      expect(view.length).assertEqual(1);
      const element051 = view.$_get(0);
      expect(element051).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_5200
     * @tc.name testFloat32ArraySubarrayThree052
     * @tc.desc Verify begin=1 end=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([7.0, 7.0, 7.0, 7.0]);
      const view: Float32Array = src.subarray(1, 3);
      expect(view.length).assertEqual(2);
      const element052 = view.$_get(0);
      expect(element052).assertEqual(7.0);
      const element052Part2 = view.$_get(1);
      expect(element052Part2).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_5300
     * @tc.name testFloat32ArraySubarrayThree053
     * @tc.desc Verify begin=-2 on [7,7,7,7] returns last 2 elements with value 7.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([7.0, 7.0, 7.0, 7.0]);
      const view: Float32Array = src.subarray(-2);
      expect(view.length).assertEqual(2);
      const element053 = view.$_get(1);
      expect(element053).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_5400
     * @tc.name testFloat32ArraySubarrayThree054
     * @tc.desc Verify begin=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([7.0, 7.0, 7.0, 7.0]);
      const view: Float32Array = src.subarray(4);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_5500
     * @tc.name testFloat32ArraySubarrayThree055
     * @tc.desc Verify begin=2 end=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([7.0, 7.0, 7.0, 7.0]);
      const view: Float32Array = src.subarray(2, 2);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_5600
     * @tc.name testFloat32ArraySubarrayThree056
     * @tc.desc Verify subarray(0,2) $_set writes through to source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(0, 2);
      view.$_set(0, 99);
      const element056 = src.$_get(0);
      expect(element056).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_5700
     * @tc.name testFloat32ArraySubarrayThree057
     * @tc.desc Verify subarray(1,3) $_set at index1 writes through to source index2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(1, 3);
      view.$_set(1, 88);
      const element057 = src.$_get(2);
      expect(element057).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_5800
     * @tc.name testFloat32ArraySubarrayThree058
     * @tc.desc Verify subarray(2) $_set at index0 writes through to source index2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(2);
      view.$_set(0, 77);
      const element058 = src.$_get(2);
      expect(element058).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_5900
     * @tc.name testFloat32ArraySubarrayThree059
     * @tc.desc Verify subarray(-2) $_set writes through to source index3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(-2);
      view.$_set(0, 66);
      const element059 = src.$_get(3);
      expect(element059).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_6000
     * @tc.name testFloat32ArraySubarrayThree060
     * @tc.desc Verify source $_set reflects in subarray(1,4) view via shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(1, 4);
      src.$_set(2, 55);
      const element060 = view.$_get(1);
      expect(element060).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_6100
     * @tc.name testFloat32ArraySubarrayThree061
     * @tc.desc Verify subarray(1,3) fill() modifies the original array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(1, 3);
      view.fill(7);
      const element061 = src.$_get(1);
      expect(element061).assertEqual(7);
      const element061Part2 = src.$_get(2);
      expect(element061Part2).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_6200
     * @tc.name testFloat32ArraySubarrayThree062
     * @tc.desc Verify subarray(1,4) reverse() reorders elements in the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(1, 4);
      view.reverse();
      const element062 = src.$_get(1);
      expect(element062).assertEqual(4.0);
      const element062Part2 = src.$_get(3);
      expect(element062Part2).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_6300
     * @tc.name testFloat32ArraySubarrayThree063
     * @tc.desc Verify overlapping subarrays(0,3) and (1,4) share the same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const a: Float32Array = src.subarray(0, 3);
      const b: Float32Array = src.subarray(1, 4);
      a.$_set(1, 50);
      const element063 = b.$_get(0);
      expect(element063).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_6400
     * @tc.name testFloat32ArraySubarrayThree064
     * @tc.desc Verify chained subarray(1,4).subarray(1,3) $_set writes through to source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const inner: Float32Array = src.subarray(1, 4).subarray(1, 3);
      inner.$_set(0, 44);
      const element064 = src.$_get(2);
      expect(element064).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_6500
     * @tc.name testFloat32ArraySubarrayThree065
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const observedValue065: Float32Array = src.subarray(1, 4);
      const observedValue065Part2: Float32Array = observedValue065.subarray(1);
      expect(observedValue065Part2.buffer).assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_6600
     * @tc.name testFloat32ArraySubarrayThree066
     * @tc.desc Verify byteOffset begin=1 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(1);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_6700
     * @tc.name testFloat32ArraySubarrayThree067
     * @tc.desc Verify byteOffset begin=-1 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(-1);
      expect(view.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_6800
     * @tc.name testFloat32ArraySubarrayThree068
     * @tc.desc Verify subarray(5) byteOffset equals 20 for empty view at end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(5);
      expect(view.length).assertEqual(0);
      expect(view.byteOffset).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_6900
     * @tc.name testFloat32ArraySubarrayThree069
     * @tc.desc Verify subarray(2,5) $_set at index2 writes through to source index4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(2, 5);
      view.$_set(2, 33);
      const element069 = src.$_get(4);
      expect(element069).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_7000
     * @tc.name testFloat32ArraySubarrayThree070
     * @tc.desc Verify subarray(0,3) fill(0) modifies only the subarray range in source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(0, 3);
      view.fill(0);
      const element070 = src.$_get(0);
      expect(element070).assertEqual(0);
      const element070Part2 = src.$_get(2);
      expect(element070Part2).assertEqual(0);
      const element070Part3 = src.$_get(4);
      expect(element070Part3).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_7100
     * @tc.name testFloat32ArraySubarrayThree071
     * @tc.desc Verify subarray(0,4) copyWithin(0,2) copies elements within shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(0, 4);
      view.copyWithin(0, 2);
      const element071 = src.$_get(0);
      expect(element071).assertEqual(3.0);
      const element071Part2 = src.$_get(1);
      expect(element071Part2).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_7200
     * @tc.name testFloat32ArraySubarrayThree072
     * @tc.desc Verify subarray(0,2) set() writes Float32Array data into shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(0, 2);
      const data: Float32Array = new Float32Array([10.0, 20.0]);
      view.set(data);
      const element072 = src.$_get(0);
      expect(element072).assertEqual(10.0);
      const element072Part2 = src.$_get(1);
      expect(element072Part2).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_7300
     * @tc.name testFloat32ArraySubarrayThree073
     * @tc.desc Verify subarray(0,3) sort() reorders elements in the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([5.0, 3.0, 1.0, 4.0, 2.0]);
      const view: Float32Array = src.subarray(0, 3);
      view.sort();
      const element073 = src.$_get(0);
      expect(element073).assertEqual(1.0);
      const element073Part2 = src.$_get(2);
      expect(element073Part2).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_7400
     * @tc.name testFloat32ArraySubarrayThree074
     * @tc.desc Verify non-overlapping subarray views operate independently on same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const head: Float32Array = src.subarray(0, 1);
      const tail: Float32Array = src.subarray(4, 5);
      head.$_set(0, 100);
      tail.$_set(0, 200);
      const element074 = src.$_get(0);
      expect(element074).assertEqual(100);
      const element074Part2 = src.$_get(4);
      expect(element074Part2).assertEqual(200);
      const element074Part3 = src.$_get(2);
      expect(element074Part3).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_7500
     * @tc.name testFloat32ArraySubarrayThree075
     * @tc.desc Verify source $_set at index3 reflects in subarray(2,5) view at index1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(2, 5);
      src.$_set(3, 999);
      const element075 = view.$_get(1);
      expect(element075).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_7600
     * @tc.name testFloat32ArraySubarrayThree076
     * @tc.desc Verify subarray length differs from original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const view: Float32Array = src.subarray(1, 3);
      expect(view.length).assertEqual(2);
      expect(src.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_THREE_7700
     * @tc.name testFloat32ArraySubarrayThree077
     * @tc.desc Verify overlapping subarray(0,3) and subarray(2,5) share elements through same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayThree077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const first: Float32Array = src.subarray(0, 3);
      const second: Float32Array = src.subarray(2, 5);
      first.$_set(2, 42);
      const element077 = second.$_get(0);
      expect(element077).assertEqual(42);
    });

  });
}
