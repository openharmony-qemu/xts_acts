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

export default function Float32ArraySlice1Test(): void {
  describe('Float32ArraySlice1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_0100
     * @tc.name testFloat32ArraySliceOne001
     * @tc.desc Verify slice() on [1.0, 2.0, 3.0, 4.0, 5.0] has length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice();
      expect(r.length).assertEqual(5);
      const element001 = r.$_get(0);
      expect(element001).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_0200
     * @tc.name testFloat32ArraySliceOne002
     * @tc.desc Verify slice(2) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(2);
      expect(r.length).assertEqual(3);
      const element002 = r.$_get(0);
      expect(element002).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_0300
     * @tc.name testFloat32ArraySliceOne003
     * @tc.desc Verify slice(1, 4) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(1, 4);
      expect(r.length).assertEqual(3);
      const element003 = r.$_get(0);
      expect(element003).assertEqual(2.0);
      const element003Part2 = r.$_get(2);
      expect(element003Part2).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_0400
     * @tc.name testFloat32ArraySliceOne004
     * @tc.desc Verify slice() on empty Float32Array has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array(0);
      const r: Float32Array = src.slice();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_0500
     * @tc.name testFloat32ArraySliceOne005
     * @tc.desc Verify slice(0) on an empty Float32Array has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array(0);
      const r: Float32Array = src.slice(0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_0600
     * @tc.name testFloat32ArraySliceOne006
     * @tc.desc Verify slice() on [7.0] has length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([7.0]);
      const r: Float32Array = src.slice();
      expect(r.length).assertEqual(1);
      const element006 = r.$_get(0);
      expect(element006).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_0700
     * @tc.name testFloat32ArraySliceOne007
     * @tc.desc Verify slice(0, 1) on [7.0] has length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([7.0]);
      const r: Float32Array = src.slice(0, 1);
      expect(r.length).assertEqual(1);
      const element007 = r.$_get(0);
      expect(element007).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_0800
     * @tc.name testFloat32ArraySliceOne008
     * @tc.desc Verify slice() copies a 100-element Float32Array including boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array(100);
      src.$_set(0, 1.0);
      src.$_set(99, 100.0);
      const r: Float32Array = src.slice();
      expect(r.length).assertEqual(100);
      const element008 = r.$_get(0);
      expect(element008).assertEqual(1.0);
      const element008Part2 = r.$_get(99);
      expect(element008Part2).assertEqual(100.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_0900
     * @tc.name testFloat32ArraySliceOne009
     * @tc.desc Verify slice(0, 5) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(0, 5);
      expect(r.length).assertEqual(5);
      const element009 = r.$_get(4);
      expect(element009).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_1000
     * @tc.name testFloat32ArraySliceOne010
     * @tc.desc Verify slice(0, 0) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(0, 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_1100
     * @tc.name testFloat32ArraySliceOne011
     * @tc.desc Verify slice(0) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(0);
      expect(r.length).assertEqual(5);
      const element011 = r.$_get(0);
      expect(element011).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_1200
     * @tc.name testFloat32ArraySliceOne012
     * @tc.desc Verify slice(1) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(1);
      expect(r.length).assertEqual(4);
      const element012 = r.$_get(0);
      expect(element012).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_1300
     * @tc.name testFloat32ArraySliceOne013
     * @tc.desc Verify slice(2) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(2);
      expect(r.length).assertEqual(3);
      const element013 = r.$_get(2);
      expect(element013).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_1400
     * @tc.name testFloat32ArraySliceOne014
     * @tc.desc Verify slice(3) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(3);
      expect(r.length).assertEqual(2);
      const element014 = r.$_get(0);
      expect(element014).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_1500
     * @tc.name testFloat32ArraySliceOne015
     * @tc.desc Verify slice(4) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(4);
      expect(r.length).assertEqual(1);
      const element015 = r.$_get(0);
      expect(element015).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_1600
     * @tc.name testFloat32ArraySliceOne016
     * @tc.desc Verify slice(5) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(5);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_1700
     * @tc.name testFloat32ArraySliceOne017
     * @tc.desc Verify slice(6) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(6);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_1800
     * @tc.name testFloat32ArraySliceOne018
     * @tc.desc Verify slice(10) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(10);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_1900
     * @tc.name testFloat32ArraySliceOne019
     * @tc.desc Verify slice(-1) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(-1);
      expect(r.length).assertEqual(1);
      const element019 = r.$_get(0);
      expect(element019).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_2000
     * @tc.name testFloat32ArraySliceOne020
     * @tc.desc Verify slice(-2) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(-2);
      expect(r.length).assertEqual(2);
      const element020 = r.$_get(0);
      expect(element020).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_2100
     * @tc.name testFloat32ArraySliceOne021
     * @tc.desc Verify slice(-3) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(-3);
      expect(r.length).assertEqual(3);
      const element021 = r.$_get(0);
      expect(element021).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_2200
     * @tc.name testFloat32ArraySliceOne022
     * @tc.desc Verify slice(-4) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(-4);
      expect(r.length).assertEqual(4);
      const element022 = r.$_get(0);
      expect(element022).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_2300
     * @tc.name testFloat32ArraySliceOne023
     * @tc.desc Verify slice(-5) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(-5);
      expect(r.length).assertEqual(5);
      const element023 = r.$_get(0);
      expect(element023).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_2400
     * @tc.name testFloat32ArraySliceOne024
     * @tc.desc Verify slice(-6) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(-6);
      expect(r.length).assertEqual(5);
      const element024 = r.$_get(4);
      expect(element024).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_2500
     * @tc.name testFloat32ArraySliceOne025
     * @tc.desc Verify slice(-10) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(-10);
      expect(r.length).assertEqual(5);
      const element025 = r.$_get(2);
      expect(element025).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_2600
     * @tc.name testFloat32ArraySliceOne026
     * @tc.desc Verify slice(2147483647) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(2147483647);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_2700
     * @tc.name testFloat32ArraySliceOne027
     * @tc.desc Verify slice(-2147483648) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(-2147483648);
      expect(r.length).assertEqual(5);
      const element027 = r.$_get(0);
      expect(element027).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_2800
     * @tc.name testFloat32ArraySliceOne028
     * @tc.desc Verify slice(16777216) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(16777216);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_2900
     * @tc.name testFloat32ArraySliceOne029
     * @tc.desc Verify slice(16777217) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(16777217);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_3000
     * @tc.name testFloat32ArraySliceOne030
     * @tc.desc Verify slice(-1) on an empty Float32Array has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array(0);
      const r: Float32Array = src.slice(-1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_3100
     * @tc.name testFloat32ArraySliceOne031
     * @tc.desc Verify slice(0) on [9.0] has length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([9.0]);
      const r: Float32Array = src.slice(0);
      expect(r.length).assertEqual(1);
      const element031 = r.$_get(0);
      expect(element031).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_3200
     * @tc.name testFloat32ArraySliceOne032
     * @tc.desc Verify slice(-1) on [9.0] has length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([9.0]);
      const r: Float32Array = src.slice(-1);
      expect(r.length).assertEqual(1);
      const element032 = r.$_get(0);
      expect(element032).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_3300
     * @tc.name testFloat32ArraySliceOne033
     * @tc.desc Verify slice(1) on [9.0] has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([9.0]);
      const r: Float32Array = src.slice(1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_3400
     * @tc.name testFloat32ArraySliceOne034
     * @tc.desc Verify slice(-2) on [9.0] has length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([9.0]);
      const r: Float32Array = src.slice(-2);
      expect(r.length).assertEqual(1);
      const element034 = r.$_get(0);
      expect(element034).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_3500
     * @tc.name testFloat32ArraySliceOne035
     * @tc.desc Verify slice(1) on [3.4028234663852886e+38, 0.0, -3.4028234663852886e+38] has length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([3.4028234663852886e+38, 0.0, -3.4028234663852886e+38]);
      const r: Float32Array = src.slice(1);
      expect(r.length).assertEqual(2);
      const element035 = r.$_get(0);
      expect(element035).assertEqual(0.0);
      const element035Part2 = r.$_get(1);
      expect(element035Part2).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_3600
     * @tc.name testFloat32ArraySliceOne036
     * @tc.desc Verify slice(0) on [NaN, 1.0, 2.0] has length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([Number.NaN, 1.0, 2.0]);
      const r: Float32Array = src.slice(0);
      expect(r.length).assertEqual(3);
      const element036 = r.$_get(0);
      expect(element036).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_3700
     * @tc.name testFloat32ArraySliceOne037
     * @tc.desc Verify slice(1) on [Infinity, -Infinity, 0.0] has length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY, 0.0]);
      const r: Float32Array = src.slice(1);
      expect(r.length).assertEqual(2);
      const element037 = r.$_get(0);
      expect(element037).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_3800
     * @tc.name testFloat32ArraySliceOne038
     * @tc.desc Verify slice(0, 1) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(0, 1);
      expect(r.length).assertEqual(1);
      const element038 = r.$_get(0);
      expect(element038).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_3900
     * @tc.name testFloat32ArraySliceOne039
     * @tc.desc Verify slice(0, 2) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(0, 2);
      expect(r.length).assertEqual(2);
      const element039 = r.$_get(0);
      expect(element039).assertEqual(1.0);
      const element039Part2 = r.$_get(1);
      expect(element039Part2).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_4000
     * @tc.name testFloat32ArraySliceOne040
     * @tc.desc Verify slice(0, 3) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(0, 3);
      expect(r.length).assertEqual(3);
      const element040 = r.$_get(0);
      expect(element040).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_4100
     * @tc.name testFloat32ArraySliceOne041
     * @tc.desc Verify slice(0, 4) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(0, 4);
      expect(r.length).assertEqual(4);
      const element041 = r.$_get(0);
      expect(element041).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_4200
     * @tc.name testFloat32ArraySliceOne042
     * @tc.desc Verify slice(0, 6) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(0, 6);
      expect(r.length).assertEqual(5);
      const element042 = r.$_get(0);
      expect(element042).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_4300
     * @tc.name testFloat32ArraySliceOne043
     * @tc.desc Verify slice(0, 10) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(0, 10);
      expect(r.length).assertEqual(5);
      const element043 = r.$_get(0);
      expect(element043).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_4400
     * @tc.name testFloat32ArraySliceOne044
     * @tc.desc Verify slice(2, 0) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(2, 0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_4500
     * @tc.name testFloat32ArraySliceOne045
     * @tc.desc Verify slice(0, -1) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(0, -1);
      expect(r.length).assertEqual(4);
      const element045 = r.$_get(0);
      expect(element045).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_4600
     * @tc.name testFloat32ArraySliceOne046
     * @tc.desc Verify slice(0, -2) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(0, -2);
      expect(r.length).assertEqual(3);
      const element046 = r.$_get(0);
      expect(element046).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_4700
     * @tc.name testFloat32ArraySliceOne047
     * @tc.desc Verify slice(0, -3) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(0, -3);
      expect(r.length).assertEqual(2);
      const element047 = r.$_get(0);
      expect(element047).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_4800
     * @tc.name testFloat32ArraySliceOne048
     * @tc.desc Verify slice(0, -4) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(0, -4);
      expect(r.length).assertEqual(1);
      const element048 = r.$_get(0);
      expect(element048).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_4900
     * @tc.name testFloat32ArraySliceOne049
     * @tc.desc Verify slice(0, -5) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(0, -5);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_5000
     * @tc.name testFloat32ArraySliceOne050
     * @tc.desc Verify slice(0, -6) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(0, -6);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_5100
     * @tc.name testFloat32ArraySliceOne051
     * @tc.desc Verify slice(0, -10) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(0, -10);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_5200
     * @tc.name testFloat32ArraySliceOne052
     * @tc.desc Verify slice(0, 2147483647) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(0, 2147483647);
      expect(r.length).assertEqual(5);
      const element052 = r.$_get(0);
      expect(element052).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_5300
     * @tc.name testFloat32ArraySliceOne053
     * @tc.desc Verify slice(0, -2147483648) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(0, -2147483648);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_5400
     * @tc.name testFloat32ArraySliceOne054
     * @tc.desc Verify slice(1, 3) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(1, 3);
      expect(r.length).assertEqual(2);
      const element054 = r.$_get(0);
      expect(element054).assertEqual(2.0);
      const element054Part2 = r.$_get(1);
      expect(element054Part2).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_5500
     * @tc.name testFloat32ArraySliceOne055
     * @tc.desc Verify slice(2, 4) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(2, 4);
      expect(r.length).assertEqual(2);
      const element055 = r.$_get(0);
      expect(element055).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_5600
     * @tc.name testFloat32ArraySliceOne056
     * @tc.desc Verify slice(-3, -1) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(-3, -1);
      expect(r.length).assertEqual(2);
      const element056 = r.$_get(0);
      expect(element056).assertEqual(3.0);
      const element056Part2 = r.$_get(1);
      expect(element056Part2).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_5700
     * @tc.name testFloat32ArraySliceOne057
     * @tc.desc Verify slice(1, 1) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(1, 1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_5800
     * @tc.name testFloat32ArraySliceOne058
     * @tc.desc Verify slice(3, 1) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(3, 1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_5900
     * @tc.name testFloat32ArraySliceOne059
     * @tc.desc Verify slice(-1, 2) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(-1, 2);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_6000
     * @tc.name testFloat32ArraySliceOne060
     * @tc.desc Verify slice(1, -1) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(1, -1);
      expect(r.length).assertEqual(3);
      const element060 = r.$_get(0);
      expect(element060).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_6100
     * @tc.name testFloat32ArraySliceOne061
     * @tc.desc Verify slice(-2, -1) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(-2, -1);
      expect(r.length).assertEqual(1);
      const element061 = r.$_get(0);
      expect(element061).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_6200
     * @tc.name testFloat32ArraySliceOne062
     * @tc.desc Verify slice(2, 2) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(2, 2);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_6300
     * @tc.name testFloat32ArraySliceOne063
     * @tc.desc Verify slice(undefined) on [1.0, 2.0, 3.0] has length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      const r: Float32Array = src.slice(undefined);
      expect(r.length).assertEqual(3);
      const element063 = r.$_get(0);
      expect(element063).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_6400
     * @tc.name testFloat32ArraySliceOne064
     * @tc.desc Verify slice(undefined, undefined) on [1.0, 2.0, 3.0] has length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      const r: Float32Array = src.slice(undefined, undefined);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_6500
     * @tc.name testFloat32ArraySliceOne065
     * @tc.desc Verify slice(undefined, 2) on [1.0, 2.0, 3.0] has length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      const r: Float32Array = src.slice(undefined, 2);
      expect(r.length).assertEqual(2);
      const element065 = r.$_get(0);
      expect(element065).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_6600
     * @tc.name testFloat32ArraySliceOne066
     * @tc.desc Verify slice(1, undefined) on [1.0, 2.0, 3.0] has length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      const r: Float32Array = src.slice(1, undefined);
      expect(r.length).assertEqual(2);
      const element066 = r.$_get(0);
      expect(element066).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_6700
     * @tc.name testFloat32ArraySliceOne067
     * @tc.desc Verify slice() on [1.0, 2.0, 3.0] has length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      const r: Float32Array = src.slice();
      expect(r.length).assertEqual(3);
      const element067 = r.$_get(2);
      expect(element067).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_6800
     * @tc.name testFloat32ArraySliceOne068
     * @tc.desc Verify slice(-1) on [1.0, 2.0, 3.0] has length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      const r: Float32Array = src.slice(-1);
      expect(r.length).assertEqual(1);
      const element068 = r.$_get(0);
      expect(element068).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_6900
     * @tc.name testFloat32ArraySliceOne069
     * @tc.desc Verify slice(-4, -2) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(-4, -2);
      expect(r.length).assertEqual(2);
      const element069 = r.$_get(0);
      expect(element069).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_7000
     * @tc.name testFloat32ArraySliceOne070
     * @tc.desc Verify slice(1, -2) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(1, -2);
      expect(r.length).assertEqual(2);
      const element070 = r.$_get(0);
      expect(element070).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_7100
     * @tc.name testFloat32ArraySliceOne071
     * @tc.desc Verify slice(-3, 4) on [1.0, 2.0, 3.0, 4.0, 5.0] has length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r: Float32Array = src.slice(-3, 4);
      expect(r.length).assertEqual(2);
      const element071 = r.$_get(0);
      expect(element071).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_7200
     * @tc.name testFloat32ArraySliceOne072
     * @tc.desc Verify slice(0) on [10.0, 20.0, 30.0] has length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      const r: Float32Array = src.slice(0);
      expect(r.length).assertEqual(3);
      const element072 = r.$_get(2);
      expect(element072).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_7300
     * @tc.name testFloat32ArraySliceOne073
     * @tc.desc Verify slice(0, 3) on [10.0, 20.0, 30.0] has length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      const r: Float32Array = src.slice(0, 3);
      expect(r.length).assertEqual(3);
      const element073 = r.$_get(0);
      expect(element073).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_7400
     * @tc.name testFloat32ArraySliceOne074
     * @tc.desc Verify slice(5) on [10.0, 20.0, 30.0] has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      const r: Float32Array = src.slice(5);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_7500
     * @tc.name testFloat32ArraySliceOne075
     * @tc.desc Verify slice(1, 100) on [10.0, 20.0, 30.0] has length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      const r: Float32Array = src.slice(1, 100);
      expect(r.length).assertEqual(2);
      const element075 = r.$_get(0);
      expect(element075).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_7600
     * @tc.name testFloat32ArraySliceOne076
     * @tc.desc Verify slice(-3) on [10.0, 20.0, 30.0] has length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      const r: Float32Array = src.slice(-3);
      expect(r.length).assertEqual(3);
      const element076 = r.$_get(0);
      expect(element076).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_7700
     * @tc.name testFloat32ArraySliceOne077
     * @tc.desc Verify slice(-10, -10) on [1.0, 2.0, 3.0] has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0]);
      const r: Float32Array = src.slice(-10, -10);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_ONE_7800
     * @tc.name testFloat32ArraySliceOne078
     * @tc.desc Verify slice(-5) on [8.0] has length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([8.0]);
      const r: Float32Array = src.slice(-5);
      expect(r.length).assertEqual(1);
      const element078 = r.$_get(0);
      expect(element078).assertEqual(8.0);
    });

  });
}
