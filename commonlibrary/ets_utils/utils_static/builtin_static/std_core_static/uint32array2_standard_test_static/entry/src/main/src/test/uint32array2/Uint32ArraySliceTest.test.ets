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

export default function uint32ArraySliceOneTest(): void {
  describe('Uint32ArraySliceOneTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_0100
     * @tc.name testUint32ArraySliceOne001
     * @tc.desc Verify arity=0 slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice();
      expect(r.length).assertEqual(5);
      expect(r[0]).assertEqual(10);
      expect(r[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_0200
     * @tc.name testUint32ArraySliceOne002
     * @tc.desc Verify arity=1 slice(2) 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(2);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(30);
      expect(r[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_0300
     * @tc.name testUint32ArraySliceOne003
     * @tc.desc Verify arity=2 slice(1, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(1, 4);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(20);
      expect(r[2]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_0400
     * @tc.name testUint32ArraySliceOne004
     * @tc.desc Verify arity=1 begin=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(4);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_0500
     * @tc.name testUint32ArraySliceOne005
     * @tc.desc Verify arity=2 begin=0 end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(0, 5);
      expect(r.length).assertEqual(5);
      expect(r[0]).assertEqual(10);
      expect(r[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_0600
     * @tc.name testUint32ArraySliceOne006
     * @tc.desc Verify begin=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(0);
      expect(r.length).assertEqual(5);
      expect(r[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_0700
     * @tc.name testUint32ArraySliceOne007
     * @tc.desc Verify begin=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(1);
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_0800
     * @tc.name testUint32ArraySliceOne008
     * @tc.desc Verify begin=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(5);
      expect(r.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_0900
     * @tc.name testUint32ArraySliceOne009
     * @tc.desc Verify begin=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(-1);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_1000
     * @tc.name testUint32ArraySliceOne010
     * @tc.desc Verify begin=-length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(-5);
      expect(r.length).assertEqual(5);
      expect(r[0]).assertEqual(10);
      expect(r[4]).assertEqual(50);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_1100
     * @tc.name testUint32ArraySliceOne011
     * @tc.desc Verify begin=int32.MIN -2147483648 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(-2147483648);
      expect(r.length).assertEqual(5);
      expect(r[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_1200
     * @tc.name testUint32ArraySliceOne012
     * @tc.desc Verify begin=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(3);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(40);
      expect(r[1]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_1300
     * @tc.name testUint32ArraySliceOne013
     * @tc.desc Verify begin=-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(-2);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(40);
      expect(r[1]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_1400
     * @tc.name testUint32ArraySliceOne014
     * @tc.desc Verify begin=-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(-3);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_1500
     * @tc.name testUint32ArraySliceOne015
     * @tc.desc Verify begin=-4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(-4);
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual(20);
      expect(r[3]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_1600
     * @tc.name testUint32ArraySliceOne016
     * @tc.desc Verify end=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(0, 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_1700
     * @tc.name testUint32ArraySliceOne017
     * @tc.desc Verify end=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(0, 1);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_1800
     * @tc.name testUint32ArraySliceOne018
     * @tc.desc Verify end=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(0, 4);
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual(10);
      expect(r[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_1900
     * @tc.name testUint32ArraySliceOne019
     * @tc.desc Verify end=length+1 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(0, 6);
      expect(r.length).assertEqual(5);
      expect(r[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_2000
     * @tc.name testUint32ArraySliceOne020
     * @tc.desc Verify end=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(0, -1);
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual(10);
      expect(r[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_2100
     * @tc.name testUint32ArraySliceOne021
     * @tc.desc Verify slice(0,-5) end=-length returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(0, -5);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_2200
     * @tc.name testUint32ArraySliceOne022
     * @tc.desc Verify end=int32.MAX 2147483647 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(0, 2147483647);
      expect(r.length).assertEqual(5);
      expect(r[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_2300
     * @tc.name testUint32ArraySliceOne023
     * @tc.desc Verify end=int32.MIN -2147483648 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(0, -2147483648);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_2400
     * @tc.name testUint32ArraySliceOne024
     * @tc.desc Verify end=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(0, 2);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(10);
      expect(r[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_2500
     * @tc.name testUint32ArraySliceOne025
     * @tc.desc Verify end=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(0, 3);
      expect(r.length).assertEqual(3);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_2600
     * @tc.name testUint32ArraySliceOne026
     * @tc.desc Verify end=-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(0, -2);
      expect(r.length).assertEqual(3);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_2700
     * @tc.name testUint32ArraySliceOne027
     * @tc.desc Verify end=-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(0, -3);
      expect(r.length).assertEqual(2);
      expect(r[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_2800
     * @tc.name testUint32ArraySliceOne028
     * @tc.desc Verify end=-4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(0, -4);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_2900
     * @tc.name testUint32ArraySliceOne029
     * @tc.desc Verify end=100 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(0, 100);
      expect(r.length).assertEqual(5);
      expect(r[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_3000
     * @tc.name testUint32ArraySliceOne030
     * @tc.desc Verify end=-2147483647 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(0, -2147483647);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_3100
     * @tc.name testUint32ArraySliceOne031
     * @tc.desc Verify begin=end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(2, 2);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_3200
     * @tc.name testUint32ArraySliceOne032
     * @tc.desc Verify begin>end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(4, 1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_3300
     * @tc.name testUint32ArraySliceOne033
     * @tc.desc Verify begin=2 end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(2, 4);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(30);
      expect(r[1]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_3400
     * @tc.name testUint32ArraySliceOne034
     * @tc.desc Verify begin=-3 end=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(-3, -1);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(30);
      expect(r[1]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_3500
     * @tc.name testUint32ArraySliceOne035
     * @tc.desc Verify begin=-1 end=1 begin>end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(-1, 1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_3600
     * @tc.name testUint32ArraySliceOne036
     * @tc.desc Verify begin=1 end=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(1, -1);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(20);
      expect(r[2]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_3700
     * @tc.name testUint32ArraySliceOne037
     * @tc.desc Verify begin=-2 end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(-2, 5);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(40);
      expect(r[1]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_3800
     * @tc.name testUint32ArraySliceOne038
     * @tc.desc Verify begin=length end=length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(5, 6);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_3900
     * @tc.name testUint32ArraySliceOne039
     * @tc.desc Verify begin=-length end=-length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(-5, -4);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_4000
     * @tc.name testUint32ArraySliceOne040
     * @tc.desc Verify begin=-length end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(-5, 5);
      expect(r.length).assertEqual(5);
      expect(r[0]).assertEqual(10);
      expect(r[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_4100
     * @tc.name testUint32ArraySliceOne041
     * @tc.desc Verify begin=1000 end=1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(1000, 1000);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_4200
     * @tc.name testUint32ArraySliceOne042
     * @tc.desc Verify begin=-1000 end=1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(-1000, 1000);
      expect(r.length).assertEqual(5);
      expect(r[0]).assertEqual(10);
      expect(r[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_4300
     * @tc.name testUint32ArraySliceOne043
     * @tc.desc Verify slice(2,10) end=length+5 clamps to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(2, 10);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(30);
      expect(r[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_4400
     * @tc.name testUint32ArraySliceOne044
     * @tc.desc Verify begin=int32.MAX end=int32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(2147483647, 2147483647);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_4500
     * @tc.name testUint32ArraySliceOne045
     * @tc.desc Verify begin=int32.MIN end=int32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(-2147483648, 2147483647);
      expect(r.length).assertEqual(5);
      expect(r[0]).assertEqual(10);
      expect(r[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_4600
     * @tc.name testUint32ArraySliceOne046
     * @tc.desc Verify begin=int32.MIN end=int32.MIN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(-2147483648, -2147483648);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_4700
     * @tc.name testUint32ArraySliceOne047
     * @tc.desc Verify begin=-2 end=-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(-2, -2);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_4800
     * @tc.name testUint32ArraySliceOne048
     * @tc.desc Verify begin=undefined undefined 0 end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(undefined, 3);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(10);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_4900
     * @tc.name testUint32ArraySliceOne049
     * @tc.desc Verify end=undefined undefined length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(2, undefined);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(30);
      expect(r[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_5000
     * @tc.name testUint32ArraySliceOne050
     * @tc.desc Verify begin=3 end=2 begin>end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(3, 2);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_5100
     * @tc.name testUint32ArraySliceOne051
     * @tc.desc Verify begin=4 end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(4, 4);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_5200
     * @tc.name testUint32ArraySliceOne052
     * @tc.desc Verify begin=-4 end=-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(-4, -2);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(20);
      expect(r[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_5300
     * @tc.name testUint32ArraySliceOne053
     * @tc.desc Verify begin=1 end=2147483647 end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(1, 2147483647);
      expect(r.length).assertEqual(4);
      expect(r[0]).assertEqual(20);
      expect(r[3]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_5400
     * @tc.name testUint32ArraySliceOne054
     * @tc.desc Verify slice(-2147483648,2) begin clamps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(-2147483648, 2);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(10);
      expect(r[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_5500
     * @tc.name testUint32ArraySliceOne055
     * @tc.desc Verify uint32.MAX slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(4294967295, 1, 2);
      const r: Uint32Array = src.slice(0, 1);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_5600
     * @tc.name testUint32ArraySliceOne056
     * @tc.desc Verify 0 slice 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(0, 1, 2);
      const r: Uint32Array = src.slice(0, 1);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_5700
     * @tc.name testUint32ArraySliceOne057
     * @tc.desc Verify -1 4294967295 slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(7, -1, 9);
      const r: Uint32Array = src.slice(1, 2);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_5800
     * @tc.name testUint32ArraySliceOne058
     * @tc.desc Verify slice(1, 3) on [0,0,0] returns two zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(0, 0, 0);
      const r: Uint32Array = src.slice(1, 3);
      expect(r.length).assertEqual(2);
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_5900
     * @tc.name testUint32ArraySliceOne059
     * @tc.desc Verify slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of();
      const r: Uint32Array = src.slice();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_6000
     * @tc.name testUint32ArraySliceOne060
     * @tc.desc Verify slice(0,5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of();
      const r: Uint32Array = src.slice(0, 5);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_6100
     * @tc.name testUint32ArraySliceOne061
     * @tc.desc Verify slice(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of();
      const r: Uint32Array = src.slice(-1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_6200
     * @tc.name testUint32ArraySliceOne062
     * @tc.desc Verify slice(-1,-3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of();
      const r: Uint32Array = src.slice(-1, -3);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_6300
     * @tc.name testUint32ArraySliceOne063
     * @tc.desc Verify slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(42);
      const r: Uint32Array = src.slice();
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_6400
     * @tc.name testUint32ArraySliceOne064
     * @tc.desc Verify slice(0,1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(42);
      const r: Uint32Array = src.slice(0, 1);
      expect(r.length).assertEqual(1);
      expect(r[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_6500
     * @tc.name testUint32ArraySliceOne065
     * @tc.desc Verify slice(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(42);
      const r: Uint32Array = src.slice(1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_6600
     * @tc.name testUint32ArraySliceOne066
     * @tc.desc Verify slice(0,0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(42);
      const r: Uint32Array = src.slice(0, 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_6700
     * @tc.name testUint32ArraySliceOne067
     * @tc.desc Verify slice returns an independent copy that does not share buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(1, 4);
      expect(r.buffer === src.buffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_6800
     * @tc.name testUint32ArraySliceOne068
     * @tc.desc Verify slice does not propagate mutations back to source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(0, 2);
      r.$_set(0, 999);
      expect(src.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SLICE_6900
     * @tc.name testUint32ArraySliceOne069
     * @tc.desc Verify slice returns a Uint32Array instance with BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySliceOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const r: Uint32Array = src.slice(1, 3);
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

  });
}
