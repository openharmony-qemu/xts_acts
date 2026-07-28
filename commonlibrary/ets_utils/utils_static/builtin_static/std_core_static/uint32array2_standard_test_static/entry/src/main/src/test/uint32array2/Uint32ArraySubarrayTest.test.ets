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

export default function uint32ArraySubarrayOneTest(): void {
  describe('Uint32ArraySubarrayOneTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_0100
     * @tc.name testUint32ArraySubarrayOne001
     * @tc.desc Verify subarray()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray();
      expect(view.length).assertEqual(6);
      expect(view.$_get(0)).assertEqual(10);
      expect(view.$_get(5)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_0200
     * @tc.name testUint32ArraySubarrayOne002
     * @tc.desc Verify subarray() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = new Uint32Array(0);
      const view: Uint32Array = src.subarray();
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_0300
     * @tc.name testUint32ArraySubarrayOne003
     * @tc.desc Verify subarray() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(70);
      const view: Uint32Array = src.subarray();
      expect(view.length).assertEqual(1);
      expect(view.$_get(0)).assertEqual(70);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_0400
     * @tc.name testUint32ArraySubarrayOne004
     * @tc.desc Verify subarray(begin) begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(2);
      expect(view.length).assertEqual(4);
      expect(view.$_get(0)).assertEqual(30);
      expect(view.$_get(3)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_0500
     * @tc.name testUint32ArraySubarrayOne005
     * @tc.desc Verify subarray(begin, end) [begin, end)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(1, 4);
      expect(view.length).assertEqual(3);
      expect(view.$_get(0)).assertEqual(20);
      expect(view.$_get(2)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_0600
     * @tc.name testUint32ArraySubarrayOne006
     * @tc.desc Verify subarray(begin, end) begin end 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(2, 2);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_0700
     * @tc.name testUint32ArraySubarrayOne007
     * @tc.desc Verify begin=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(0);
      expect(view.length).assertEqual(6);
      expect(view.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_0800
     * @tc.name testUint32ArraySubarrayOne008
     * @tc.desc Verify begin=1 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(1);
      expect(view.length).assertEqual(5);
      expect(view.$_get(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_0900
     * @tc.name testUint32ArraySubarrayOne009
     * @tc.desc Verify begin=length-1(5) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(5);
      expect(view.length).assertEqual(1);
      expect(view.$_get(0)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_1000
     * @tc.name testUint32ArraySubarrayOne010
     * @tc.desc Verify begin=length(6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(6);
      expect(view.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_1100
     * @tc.name testUint32ArraySubarrayOne011
     * @tc.desc Verify begin=2147483647(int32 MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(2147483647);
      expect(view.length).assertEqual(0);
      expect(view.byteOffset).assertEqual(src.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_1200
     * @tc.name testUint32ArraySubarrayOne012
     * @tc.desc Verify begin=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(-1);
      expect(view.length).assertEqual(1);
      expect(view.$_get(0)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_1300
     * @tc.name testUint32ArraySubarrayOne013
     * @tc.desc Verify begin=-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(-2);
      expect(view.length).assertEqual(2);
      expect(view.$_get(0)).assertEqual(50);
      expect(view.$_get(1)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_1400
     * @tc.name testUint32ArraySubarrayOne014
     * @tc.desc Verify begin=-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(-3);
      expect(view.length).assertEqual(3);
      expect(view.$_get(0)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_1500
     * @tc.name testUint32ArraySubarrayOne015
     * @tc.desc Verify begin=-length(-6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(-6);
      expect(view.length).assertEqual(6);
      expect(view.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_1600
     * @tc.name testUint32ArraySubarrayOne016
     * @tc.desc Verify begin=-length-1(-7) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(-7);
      expect(view.length).assertEqual(6);
      expect(view.$_get(5)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_1700
     * @tc.name testUint32ArraySubarrayOne017
     * @tc.desc Verify begin=-2147483648(int32 MIN) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(-2147483647 - 1);
      expect(view.length).assertEqual(6);
      expect(view.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_1800
     * @tc.name testUint32ArraySubarrayOne018
     * @tc.desc Verify begin=0b1 1 5 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(0b1);
      expect(view.length).assertEqual(5);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_1900
     * @tc.name testUint32ArraySubarrayOne019
     * @tc.desc Verify begin=0b10 2 4 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(0b10);
      expect(view.length).assertEqual(4);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_2000
     * @tc.name testUint32ArraySubarrayOne020
     * @tc.desc Verify begin=0x3 3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(0x3);
      expect(view.length).assertEqual(3);
      expect(view.$_get(0)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_2100
     * @tc.name testUint32ArraySubarrayOne021
     * @tc.desc Verify end=0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(0, 0);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_2200
     * @tc.name testUint32ArraySubarrayOne022
     * @tc.desc Verify end=1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(0, 1);
      expect(view.length).assertEqual(1);
      expect(view.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_2300
     * @tc.name testUint32ArraySubarrayOne023
     * @tc.desc Verify end=2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(0, 2);
      expect(view.length).assertEqual(2);
      expect(view.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_2400
     * @tc.name testUint32ArraySubarrayOne024
     * @tc.desc Verify end=length-1(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(0, 5);
      expect(view.length).assertEqual(5);
      expect(view.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_2500
     * @tc.name testUint32ArraySubarrayOne025
     * @tc.desc Verify end=length(6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(0, 6);
      expect(view.length).assertEqual(6);
      expect(view.$_get(5)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_2600
     * @tc.name testUint32ArraySubarrayOne026
     * @tc.desc Verify end=length+1(7) 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(0, 7);
      expect(view.length).assertEqual(6);
      expect(view.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_2700
     * @tc.name testUint32ArraySubarrayOne027
     * @tc.desc Verify end=2147483647(int32 MAX) 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(0, 2147483647);
      expect(view.length).assertEqual(6);
      expect(view.$_get(5)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_2800
     * @tc.name testUint32ArraySubarrayOne028
     * @tc.desc Verify end=-1 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(0, -1);
      expect(view.length).assertEqual(5);
      expect(view.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_2900
     * @tc.name testUint32ArraySubarrayOne029
     * @tc.desc Verify end=-2 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(0, -2);
      expect(view.length).assertEqual(4);
      expect(view.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_3000
     * @tc.name testUint32ArraySubarrayOne030
     * @tc.desc Verify end=-3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(0, -3);
      expect(view.length).assertEqual(3);
      expect(view.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_3100
     * @tc.name testUint32ArraySubarrayOne031
     * @tc.desc Verify end=-length(-6) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(0, -6);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_3200
     * @tc.name testUint32ArraySubarrayOne032
     * @tc.desc Verify end=-length-1(-7) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(0, -7);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_3300
     * @tc.name testUint32ArraySubarrayOne033
     * @tc.desc Verify end=-2147483648(int32 MIN) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(0, -2147483647 - 1);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_3400
     * @tc.name testUint32ArraySubarrayOne034
     * @tc.desc Verify end=0x3 3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(0, 0x3);
      expect(view.length).assertEqual(3);
      expect(view.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_3500
     * @tc.name testUint32ArraySubarrayOne035
     * @tc.desc Verify begin=1, end=-1 begin end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(1, -1);
      expect(view.length).assertEqual(4);
      expect(view.$_get(0)).assertEqual(20);
      expect(view.$_get(3)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_3600
     * @tc.name testUint32ArraySubarrayOne036
     * @tc.desc Verify begin=-2, end=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(-2, -1);
      expect(view.length).assertEqual(1);
      expect(view.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_3700
     * @tc.name testUint32ArraySubarrayOne037
     * @tc.desc Verify begin=-4, end=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(-4, -1);
      expect(view.length).assertEqual(3);
      expect(view.$_get(0)).assertEqual(30);
      expect(view.$_get(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_3800
     * @tc.name testUint32ArraySubarrayOne038
     * @tc.desc Verify begin=-100, end=100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(-100, 100);
      expect(view.length).assertEqual(6);
      expect(view.$_get(0)).assertEqual(10);
      expect(view.$_get(5)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_3900
     * @tc.name testUint32ArraySubarrayOne039
     * @tc.desc Verify begin=2, end=length+5(11) end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(2, 11);
      expect(view.length).assertEqual(4);
      expect(view.$_get(0)).assertEqual(30);
      expect(view.$_get(3)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_4000
     * @tc.name testUint32ArraySubarrayOne040
     * @tc.desc Verify begin=length(6), end=length+5(11) begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(6, 11);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_4100
     * @tc.name testUint32ArraySubarrayOne041
     * @tc.desc Verify begin=3, end=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(3, 3);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_4200
     * @tc.name testUint32ArraySubarrayOne042
     * @tc.desc Verify begin=4, end=2 begin end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(4, 2);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_4300
     * @tc.name testUint32ArraySubarrayOne043
     * @tc.desc Verify subarray(1) view $_set 999 reflects to source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(1);
      view.$_set(0, 999);
      expect(src.$_get(1)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_4400
     * @tc.name testUint32ArraySubarrayOne044
     * @tc.desc Verify subarray(2) view reflects source $_set 888
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(2);
      src.$_set(2, 888);
      expect(view.$_get(0)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_4500
     * @tc.name testUint32ArraySubarrayOne045
     * @tc.desc Verify subarray() shares buffer with source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray();
      const sameBuffer: boolean = view.buffer === src.buffer;
      expect(sameBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_4600
     * @tc.name testUint32ArraySubarrayOne046
     * @tc.desc Verify subarray() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray();
      expect(view.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_4700
     * @tc.name testUint32ArraySubarrayOne047
     * @tc.desc Verify subarray(2) begin 4 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(2);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_4800
     * @tc.name testUint32ArraySubarrayOne048
     * @tc.desc Verify subarray(1,4) 4 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(1, 4);
      expect(view.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_4900
     * @tc.name testUint32ArraySubarrayOne049
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const child: Uint32Array = src.subarray(2);
      const grandchild: Uint32Array = child.subarray();
      const sameBuffer: boolean = grandchild.buffer === src.buffer;
      expect(sameBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_5000
     * @tc.name testUint32ArraySubarrayOne050
     * @tc.desc Verify nested subarray() shares buffer with source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const child: Uint32Array = src.subarray(2);
      const grandchild: Uint32Array = child.subarray();
      grandchild.$_set(0, 555);
      expect(src.$_get(2)).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_5100
     * @tc.name testUint32ArraySubarrayOne051
     * @tc.desc Verify non-overlapping subarrays keep independent $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const a: Uint32Array = src.subarray(0, 2);
      const b: Uint32Array = src.subarray(4, 6);
      a.$_set(0, 111);
      expect(src.$_get(0)).assertEqual(111);
      expect(b.$_get(0)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_5200
     * @tc.name testUint32ArraySubarrayOne052
     * @tc.desc Verify overlapping subarrays share buffer $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const a: Uint32Array = src.subarray(1, 4);
      const b: Uint32Array = src.subarray(3, 6);
      a.$_set(2, 222);
      expect(b.$_get(0)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_5300
     * @tc.name testUint32ArraySubarrayOne053
     * @tc.desc Verify empty subarray(6,6) shares buffer with source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(6, 6);
      expect(view.length).assertEqual(0);
      const sameBuffer: boolean = view.buffer === src.buffer;
      expect(sameBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_5400
     * @tc.name testUint32ArraySubarrayOne054
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const a: Uint32Array = src.subarray(1);
      const b: Uint32Array = a.subarray(1);
      const c: Uint32Array = b.subarray(1);
      const sameBuffer: boolean = c.buffer === src.buffer;
      expect(sameBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_5500
     * @tc.name testUint32ArraySubarrayOne055
     * @tc.desc Verify subarray(-2) byteOffset 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(-2);
      expect(view.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_5600
     * @tc.name testUint32ArraySubarrayOne056
     * @tc.desc Verify subarray(2,4) view $_set reflects to source within bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(2, 4);
      view.$_set(0, 999);
      view.$_set(1, 888);
      expect(src.$_get(0)).assertEqual(10);
      expect(src.$_get(1)).assertEqual(20);
      expect(src.$_get(2)).assertEqual(999);
      expect(src.$_get(3)).assertEqual(888);
      expect(src.$_get(4)).assertEqual(50);
      expect(src.$_get(5)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_5700
     * @tc.name testUint32ArraySubarrayOne057
     * @tc.desc Verify adjacent subarray views share buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const first: Uint32Array = src.subarray(0, 3);
      const second: Uint32Array = src.subarray(3, 6);
      first.$_set(2, 333);
      second.$_set(0, 444);
      expect(src.$_get(2)).assertEqual(333);
      expect(src.$_get(3)).assertEqual(444);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_5800
     * @tc.name testUint32ArraySubarrayOne058
     * @tc.desc Verify subarray(1,5) view $_set reflects to source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(1, 5);
      view.$_set(0, 100);
      view.$_set(1, 200);
      view.$_set(2, 300);
      view.$_set(3, 400);
      expect(src.$_get(1)).assertEqual(100);
      expect(src.$_get(2)).assertEqual(200);
      expect(src.$_get(3)).assertEqual(300);
      expect(src.$_get(4)).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_5900
     * @tc.name testUint32ArraySubarrayOne059
     * @tc.desc Verify subarray() full view $_set reflects to source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray();
      view.$_set(5, 123);
      expect(src.$_get(5)).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SUBARRAY_6000
     * @tc.name testUint32ArraySubarrayOne060
     * @tc.desc Verify subarray returns a shared-buffer view with expected length, byteOffset and content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySubarrayOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50, 60);
      const view: Uint32Array = src.subarray(1, 4);
      expect(view.length).assertEqual(3);
      expect(view.byteOffset).assertEqual(4);
      expect(view.$_get(0)).assertEqual(20);
      expect(view.$_get(2)).assertEqual(40);
      const sameBuffer: boolean = view.buffer === src.buffer;
      expect(sameBuffer).assertTrue();
    });

  });
}
