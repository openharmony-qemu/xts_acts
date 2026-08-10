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

export default function Float32ArraySet3Test(): void {
  describe('Float32ArraySet3Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_0100
     * @tc.name testFloat32ArraySetThree001
     * @tc.desc Verify 3 arity=1 FixedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      const src: FixedArray<number> = [1, 2];
      target.set(src);
      const element001 = target.$_get(0);
      expect(element001).assertEqual(1);
      const element001Part2 = target.$_get(1);
      expect(element001Part2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_0200
     * @tc.name testFloat32ArraySetThree002
     * @tc.desc Verify 6 arity=2 FixedArray insertPos
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(3);
      const src: FixedArray<number> = [1.0, 2.0];
      target.set(src, 1);
      const element002 = target.$_get(1);
      expect(element002).assertEqual(1.0);
      const element002Part2 = target.$_get(2);
      expect(element002Part2).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_0300
     * @tc.name testFloat32ArraySetThree003
     * @tc.desc Verify 9 arity=1 offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      target.set([10, 20]);
      const element003 = target.$_get(0);
      expect(element003).assertEqual(10);
      const element003Part2 = target.$_get(1);
      expect(element003Part2).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_0400
     * @tc.name testFloat32ArraySetThree004
     * @tc.desc Verify 9 arity=2 offset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      target.set([10, 20], 0);
      const element004 = target.$_get(0);
      expect(element004).assertEqual(10);
      const element004Part2 = target.$_get(1);
      expect(element004Part2).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_0500
     * @tc.name testFloat32ArraySetThree005
     * @tc.desc Verify 9 arity=1 arity=2 offset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(2);
      a.set([7, 8]);
      const b = new Float32Array(2);
      b.set([7, 8], 0);
      const element005 = a.$_get(0);
      expect(element005).assertEqual(7);
      const element005Part2 = a.$_get(1);
      expect(element005Part2).assertEqual(8);
      const element005Part3 = b.$_get(0);
      expect(element005Part3).assertEqual(7);
      const element005Part4 = b.$_get(1);
      expect(element005Part4).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_0600
     * @tc.name testFloat32ArraySetThree006
     * @tc.desc Verify 3 FixedArray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      const src: FixedArray<number> = [];
      target.set(src);
      const element006 = target.$_get(0);
      expect(element006).assertEqual(0);
      const element006Part2 = target.$_get(1);
      expect(element006Part2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_0700
     * @tc.name testFloat32ArraySetThree007
     * @tc.desc Verify 3 FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(3);
      const src: FixedArray<number> = [9];
      target.set(src);
      const element007 = target.$_get(0);
      expect(element007).assertEqual(9);
      const element007Part2 = target.$_get(1);
      expect(element007Part2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_0800
     * @tc.name testFloat32ArraySetThree008
     * @tc.desc Verify 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      const src: FixedArray<number> = [-5, -6];
      target.set(src);
      const element009 = target.$_get(0);
      expect(element009).assertEqual(-5);
      const element009Part2 = target.$_get(1);
      expect(element009Part2).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_0900
     * @tc.name testFloat32ArraySetThree009
     * @tc.desc Verify 3 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      const src: FixedArray<number> = [0, 0];
      target.set(src);
      const element010 = target.$_get(0);
      expect(element010).assertEqual(0);
      const element010Part2 = target.$_get(1);
      expect(element010Part2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_1000
     * @tc.name testFloat32ArraySetThree010
     * @tc.desc Verify 3 Float32 MIN VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [1.401298464324817e-45];
      target.set(src);
      const element011 = target.$_get(0);
      expect(element011).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_1100
     * @tc.name testFloat32ArraySetThree011
     * @tc.desc Verify 3 2 24 16777216 float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [16777216];
      target.set(src);
      const element012 = target.$_get(0);
      expect(element012).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_1200
     * @tc.name testFloat32ArraySetThree012
     * @tc.desc Verify 3 16 0x10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [0x10];
      target.set(src);
      const element013 = target.$_get(0);
      expect(element013).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_1300
     * @tc.name testFloat32ArraySetThree013
     * @tc.desc Verify 3 1.0e3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [1.0e3];
      target.set(src);
      const element014 = target.$_get(0);
      expect(element014).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_1400
     * @tc.name testFloat32ArraySetThree014
     * @tc.desc Verify 3 int -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [-2147483648];
      target.set(src);
      const element015 = target.$_get(0);
      expect(element015).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_1500
     * @tc.name testFloat32ArraySetThree015
     * @tc.desc Verify 6 insertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      const src: FixedArray<number> = [9.0];
      target.set(src, 0);
      const element017 = target.$_get(0);
      expect(element017).assertEqual(9.0);
      const element017Part2 = target.$_get(1);
      expect(element017Part2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_1600
     * @tc.name testFloat32ArraySetThree016
     * @tc.desc Verify 6 insertPos
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(3);
      const src: FixedArray<number> = [9.0];
      target.set(src, 2);
      const element018 = target.$_get(2);
      expect(element018).assertEqual(9.0);
      const element018Part2 = target.$_get(0);
      expect(element018Part2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_1700
     * @tc.name testFloat32ArraySetThree017
     * @tc.desc Verify 6 insertPos
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(5);
      const src: FixedArray<number> = [1.0, 2.0];
      target.set(src, 2);
      const element019 = target.$_get(2);
      expect(element019).assertEqual(1.0);
      const element019Part2 = target.$_get(3);
      expect(element019Part2).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_1800
     * @tc.name testFloat32ArraySetThree018
     * @tc.desc Verify 6 NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [Number.NaN];
      target.set(src, 0);
      const element020 = target.$_get(0);
      expect(element020).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_1900
     * @tc.name testFloat32ArraySetThree019
     * @tc.desc Verify 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [Number.POSITIVE_INFINITY];
      target.set(src, 0);
      const element021 = target.$_get(0);
      expect(element021).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_2000
     * @tc.name testFloat32ArraySetThree020
     * @tc.desc Verify 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [-Number.POSITIVE_INFINITY];
      target.set(src, 0);
      const element022 = target.$_get(0);
      expect(element022).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_2100
     * @tc.name testFloat32ArraySetThree021
     * @tc.desc Verify 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [-0];
      target.set(src, 0);
      const element023 = 1 / target.$_get(0);
      expect(element023).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_2200
     * @tc.name testFloat32ArraySetThree022
     * @tc.desc Verify 6 Float32 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [3.4028234663852886e+38];
      target.set(src, 0);
      const element024 = target.$_get(0);
      expect(element024).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_2300
     * @tc.name testFloat32ArraySetThree023
     * @tc.desc Verify 6 16777217 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [16777217];
      target.set(src, 0);
      const element025 = target.$_get(0);
      expect(element025).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_2400
     * @tc.name testFloat32ArraySetThree024
     * @tc.desc Verify 6 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [0.1];
      target.set(src, 0);
      const element026 = target.$_get(0);
      expect(element026).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_2500
     * @tc.name testFloat32ArraySetThree025
     * @tc.desc Verify 6 2.5e2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [2.5e2];
      target.set(src, 0);
      const element027 = target.$_get(0);
      expect(element027).assertEqual(250);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_2600
     * @tc.name testFloat32ArraySetThree026
     * @tc.desc Verify 6 16 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [0xFF];
      target.set(src, 0);
      const element028 = target.$_get(0);
      expect(element028).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_2700
     * @tc.name testFloat32ArraySetThree027
     * @tc.desc Verify 6 1.0e40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [1.0e40];
      target.set(src, 0);
      const element029 = target.$_get(0);
      expect(element029).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_2800
     * @tc.name testFloat32ArraySetThree028
     * @tc.desc Verify 6 1.0e-46
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [1.0e-46];
      target.set(src, 0);
      const element030 = target.$_get(0);
      expect(element030).assertEqual(0);
      expect(1.0 / element030).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_2900
     * @tc.name testFloat32ArraySetThree029
     * @tc.desc Verify 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      const src: FixedArray<number> = [-1.5, -2.5];
      target.set(src, 0);
      const element031 = target.$_get(0);
      expect(element031).assertEqual(-1.5);
      const element031Part2 = target.$_get(1);
      expect(element031Part2).assertEqual(-2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_3000
     * @tc.name testFloat32ArraySetThree030
     * @tc.desc Verify 6 2147483647 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [2147483647];
      target.set(src, 0);
      const element032 = target.$_get(0);
      expect(element032).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_3100
     * @tc.name testFloat32ArraySetThree031
     * @tc.desc Verify 6 -3.5e38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [-3.5e38];
      target.set(src, 0);
      const element033 = target.$_get(0);
      expect(element033).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_3200
     * @tc.name testFloat32ArraySetThree032
     * @tc.desc Verify 6 insertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(3);
      const src: FixedArray<number> = [1.0, 2.0, 3.0];
      target.set(src, 0);
      const element034 = target.$_get(0);
      expect(element034).assertEqual(1.0);
      const element034Part2 = target.$_get(2);
      expect(element034Part2).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_3300
     * @tc.name testFloat32ArraySetThree033
     * @tc.desc Verify 6 insertPos=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(3);
      const src: FixedArray<number> = [7.0, 8.0];
      target.set(src, 1);
      const element035 = target.$_get(0);
      expect(element035).assertEqual(0);
      const element035Part2 = target.$_get(1);
      expect(element035Part2).assertEqual(7.0);
      const element035Part3 = target.$_get(2);
      expect(element035Part3).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_3400
     * @tc.name testFloat32ArraySetThree034
     * @tc.desc Verify 6 insertPos length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(4);
      const src: FixedArray<number> = [6.0];
      target.set(src, 3);
      const element036 = target.$_get(3);
      expect(element036).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_3500
     * @tc.name testFloat32ArraySetThree035
     * @tc.desc Verify 6 insertPos length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      const src: FixedArray<number> = [];
      target.set(src, 2);
      const element037 = target.$_get(0);
      expect(element037).assertEqual(0);
      const element037Part2 = target.$_get(1);
      expect(element037Part2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_3600
     * @tc.name testFloat32ArraySetThree036
     * @tc.desc Verify 6 insertPos length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      const src: FixedArray<number> = [1.0];
      try {
        target.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_3700
     * @tc.name testFloat32ArraySetThree037
     * @tc.desc Verify 6 insertPos length+1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      const src: FixedArray<number> = [1.0];
      try {
        target.set(src, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_3800
     * @tc.name testFloat32ArraySetThree038
     * @tc.desc Verify 6 insertPos=-1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      const src: FixedArray<number> = [1.0];
      try {
        target.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_3900
     * @tc.name testFloat32ArraySetThree039
     * @tc.desc Verify FixedArray insertPos=-2 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      const src: FixedArray<number> = [1.0];
      try {
        target.set(src, -2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_4000
     * @tc.name testFloat32ArraySetThree040
     * @tc.desc Verify overload 6 insertPos = 2147483647 throws IndexOutOfBoundsError for a large positive index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      const src: FixedArray<number> = [1.0];
      try {
        target.set(src, 2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_4100
     * @tc.name testFloat32ArraySetThree041
     * @tc.desc Verify 6 insertPos
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(4);
      const src: FixedArray<number> = [1.0, 2.0];
      target.set(src, 2);
      const element044 = target.$_get(2);
      expect(element044).assertEqual(1.0);
      const element044Part2 = target.$_get(3);
      expect(element044Part2).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_4200
     * @tc.name testFloat32ArraySetThree042
     * @tc.desc Verify 9 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      target.set([42]);
      const element046 = target.$_get(0);
      expect(element046).assertEqual(42);
      const element046Part2 = target.$_get(1);
      expect(element046Part2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_4300
     * @tc.name testFloat32ArraySetThree043
     * @tc.desc Verify 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(3);
      target.set([1, 2, 3]);
      const element047 = target.$_get(0);
      expect(element047).assertEqual(1);
      const element047Part2 = target.$_get(2);
      expect(element047Part2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_4400
     * @tc.name testFloat32ArraySetThree044
     * @tc.desc Verify 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      target.set([-3, -4]);
      const element048 = target.$_get(0);
      expect(element048).assertEqual(-3);
      const element048Part2 = target.$_get(1);
      expect(element048Part2).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_4500
     * @tc.name testFloat32ArraySetThree045
     * @tc.desc Verify 9 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      target.set([0, 0]);
      const element049 = target.$_get(0);
      expect(element049).assertEqual(0);
      const element049Part2 = target.$_get(1);
      expect(element049Part2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_4600
     * @tc.name testFloat32ArraySetThree046
     * @tc.desc Verify 9 16 0x20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      target.set([0x20]);
      const element062 = target.$_get(0);
      expect(element062).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_4700
     * @tc.name testFloat32ArraySetThree047
     * @tc.desc Verify 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(4);
      target.set([1, 2]);
      const element063 = target.$_get(0);
      expect(element063).assertEqual(1);
      const element063Part2 = target.$_get(1);
      expect(element063Part2).assertEqual(2);
      const element063Part3 = target.$_get(2);
      expect(element063Part3).assertEqual(0);
      const element063Part4 = target.$_get(3);
      expect(element063Part4).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_4800
     * @tc.name testFloat32ArraySetThree048
     * @tc.desc Verify 9 -3.5e38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      target.set([-3.5e38]);
      const element064 = target.$_get(0);
      expect(element064).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_4900
     * @tc.name testFloat32ArraySetThree049
     * @tc.desc Verify 9 offset=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(3);
      target.set([7, 8], 1);
      const element066 = target.$_get(0);
      expect(element066).assertEqual(0);
      const element066Part2 = target.$_get(1);
      expect(element066Part2).assertEqual(7);
      const element066Part3 = target.$_get(2);
      expect(element066Part3).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_5000
     * @tc.name testFloat32ArraySetThree050
     * @tc.desc Verify 9 offset length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(4);
      target.set([9], 3);
      const element067 = target.$_get(3);
      expect(element067).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_5100
     * @tc.name testFloat32ArraySetThree051
     * @tc.desc Verify 9 offset length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      target.set([], 2);
      const element068 = target.$_get(0);
      expect(element068).assertEqual(0);
      const element068Part2 = target.$_get(1);
      expect(element068Part2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_5200
     * @tc.name testFloat32ArraySetThree052
     * @tc.desc Verify 9 offset length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      try {
        target.set([1], 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_5300
     * @tc.name testFloat32ArraySetThree053
     * @tc.desc Verify 9 offset length+1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      try {
        target.set([1], 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_5400
     * @tc.name testFloat32ArraySetThree054
     * @tc.desc Verify 9 offset=-1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      try {
        target.set([1], -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_5500
     * @tc.name testFloat32ArraySetThree055
     * @tc.desc Verify ArrayLike offset=-2 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      try {
        target.set([1], -2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_5600
     * @tc.name testFloat32ArraySetThree056
     * @tc.desc Verify overload 9 offset = 2147483647 throws IndexOutOfBoundsError for a large positive offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      try {
        target.set([1], 2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_5700
     * @tc.name testFloat32ArraySetThree057
     * @tc.desc Verify 9 offset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      target.set([1, 2], 0);
      target.set([9], 0);
      const element074 = target.$_get(0);
      expect(element074).assertEqual(9);
      const element074Part2 = target.$_get(1);
      expect(element074Part2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_5800
     * @tc.name testFloat32ArraySetThree058
     * @tc.desc Verify 9 offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(4);
      target.set([1, 2], 2);
      const element075 = target.$_get(2);
      expect(element075).assertEqual(1);
      const element075Part2 = target.$_get(3);
      expect(element075Part2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_5900
     * @tc.name testFloat32ArraySetThree059
     * @tc.desc Verify 6 FixedArray 9 ArrayLike
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      const srcA: FixedArray<number> = [1.0, 2.0];
      a.set(srcA, 1);
      const b = new Float32Array(3);
      b.set([1, 2], 1);
      const element078 = a.$_get(1);
      expect(element078).assertEqual(1);
      const element078Part2 = a.$_get(2);
      expect(element078Part2).assertEqual(2);
      const element078Part3 = b.$_get(1);
      expect(element078Part3).assertEqual(1);
      const element078Part4 = b.$_get(2);
      expect(element078Part4).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_6000
     * @tc.name testFloat32ArraySetThree060
     * @tc.desc Verify 3 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(3);
      const src: FixedArray<number> = [1, 2];
      target.set(src);
      const element061 = target.$_get(0);
      expect(element061).assertEqual(1);
      const element061Part2 = target.$_get(1);
      expect(element061Part2).assertEqual(2);
      expect(target.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_6100
     * @tc.name testFloat32ArraySetThree061
     * @tc.desc Verify 6 byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(3);
      const src: FixedArray<number> = [1.0, 2.0];
      target.set(src, 1);
      const element062 = target.$_get(1);
      expect(element062).assertEqual(1.0);
      const element062Part2 = target.$_get(2);
      expect(element062Part2).assertEqual(2.0);
      expect(target.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_6200
     * @tc.name testFloat32ArraySetThree062
     * @tc.desc Verify 3 FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      const src: FixedArray<number> = [7, 8];
      target.set(src);
      const element063 = target.$_get(0);
      expect(element063).assertEqual(7);
      const element063Part2 = target.$_get(1);
      expect(element063Part2).assertEqual(8);
      expect(src[0]).assertEqual(7);
      expect(src[1]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_6300
     * @tc.name testFloat32ArraySetThree063
     * @tc.desc Verify 6 FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      const src: FixedArray<number> = [3.0, 4.0];
      target.set(src, 0);
      const element064 = target.$_get(0);
      expect(element064).assertEqual(3.0);
      const element064Part2 = target.$_get(1);
      expect(element064Part2).assertEqual(4.0);
      expect(src[0]).assertEqual(3.0);
      expect(src[1]).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_6400
     * @tc.name testFloat32ArraySetThree064
     * @tc.desc Verify 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(4);
      const src: FixedArray<number> = [1.0, 2.0];
      target.set(src, 1);
      const element083 = target.$_get(0);
      expect(element083).assertEqual(0);
      const element083Part2 = target.$_get(1);
      expect(element083Part2).assertEqual(1.0);
      const element083Part3 = target.$_get(2);
      expect(element083Part3).assertEqual(2.0);
      const element083Part4 = target.$_get(3);
      expect(element083Part4).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_6500
     * @tc.name testFloat32ArraySetThree065
     * @tc.desc Verify 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(4);
      target.set([1, 2], 1);
      const element084 = target.$_get(0);
      expect(element084).assertEqual(0);
      const element084Part2 = target.$_get(1);
      expect(element084Part2).assertEqual(1);
      const element084Part3 = target.$_get(2);
      expect(element084Part3).assertEqual(2);
      const element084Part4 = target.$_get(3);
      expect(element084Part4).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_6600
     * @tc.name testFloat32ArraySetThree066
     * @tc.desc Verify 3 byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(3);
      const src: FixedArray<number> = [1, 2];
      target.set(src);
      const element067 = target.$_get(0);
      expect(element067).assertEqual(1);
      const element067Part2 = target.$_get(1);
      expect(element067Part2).assertEqual(2);
      expect(target.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_6700
     * @tc.name testFloat32ArraySetThree067
     * @tc.desc Verify 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(3);
      const src: FixedArray<number> = [1, 2, 3];
      target.set(src);
      let sum: number = 0;
      for (let __f32i = 0; __f32i < target.length; __f32i++) { const v = target.$_get(__f32i);
        sum = sum + v;
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_6800
     * @tc.name testFloat32ArraySetThree068
     * @tc.desc Verify 6 at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(3);
      const src: FixedArray<number> = [10.0, 20.0, 30.0];
      target.set(src, 0);
      const atValue087 = target.at(1);
      expect(atValue087).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_6900
     * @tc.name testFloat32ArraySetThree069
     * @tc.desc Verify 9 get length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(3);
      target.set([5, 6, 7], 0);
      const element088 = target.$_get(2);
      expect(element088).assertEqual(7);
      expect(target.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_7000
     * @tc.name testFloat32ArraySetThree070
     * @tc.desc Verify 3 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      const src: FixedArray<number> = [1, 2, 3];
      try {
        target.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_7100
     * @tc.name testFloat32ArraySetThree071
     * @tc.desc Verify 6 insertPos RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(3);
      const src: FixedArray<number> = [1.0, 2.0, 3.0];
      try {
        target.set(src, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_7200
     * @tc.name testFloat32ArraySetThree072
     * @tc.desc Verify 9 offset RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(3);
      try {
        target.set([1, 2, 3], 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_7300
     * @tc.name testFloat32ArraySetThree073
     * @tc.desc Verify 3 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(0);
      const src: FixedArray<number> = [1];
      try {
        target.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_7400
     * @tc.name testFloat32ArraySetThree074
     * @tc.desc Verify 9 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(0);
      try {
        target.set([1]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_7500
     * @tc.name testFloat32ArraySetThree075
     * @tc.desc Verify 6 insertPos=0 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(0);
      const src: FixedArray<number> = [1.0];
      try {
        target.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_7600
     * @tc.name testFloat32ArraySetThree076
     * @tc.desc Verify 9 offset RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      try {
        target.set([1, 2], 100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_7700
     * @tc.name testFloat32ArraySetThree077
     * @tc.desc Verify 6 insertPos RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      const src: FixedArray<number> = [1.0, 2.0];
      try {
        target.set(src, 100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_7800
     * @tc.name testFloat32ArraySetThree078
     * @tc.desc Verify 9 number float32 16777219 16777220
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      target.set([16777219]);
      const element097 = target.$_get(0);
      expect(element097).assertEqual(16777220);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_7900
     * @tc.name testFloat32ArraySetThree079
     * @tc.desc Verify 3 number float32 3.5e38 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [3.5e38];
      target.set(src);
      const element098 = target.$_get(0);
      expect(element098).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_8000
     * @tc.name testFloat32ArraySetThree080
     * @tc.desc Verify 6 number float32 -1.0e40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [-1.0e40];
      target.set(src, 0);
      const element099 = target.$_get(0);
      expect(element099).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_8100
     * @tc.name testFloat32ArraySetThree081
     * @tc.desc Verify 9 number float32 1.0000001 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      target.set([1.0000001]);
      const element100 = target.$_get(0);
      expect(element100).assertEqual(1.0000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_8200
     * @tc.name testFloat32ArraySetThree082
     * @tc.desc Verify 3 number float32 1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [1.1];
      target.set(src);
      const element101 = target.$_get(0);
      expect(element101).assertEqual(1.100000023841858);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_8300
     * @tc.name testFloat32ArraySetThree083
     * @tc.desc Verify 6 number float32 33554433 33554432
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [33554433];
      target.set(src, 0);
      const element102 = target.$_get(0);
      expect(element102).assertEqual(33554432);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_8400
     * @tc.name testFloat32ArraySetThree084
     * @tc.desc Verify 9 number float32 -16777217 -16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      target.set([-16777217]);
      const element103 = target.$_get(0);
      expect(element103).assertEqual(-16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_8500
     * @tc.name testFloat32ArraySetThree085
     * @tc.desc Verify 3 number float32 0.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [0.2];
      target.set(src);
      const element104 = target.$_get(0);
      expect(element104).assertEqual(0.20000000298023224);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_8600
     * @tc.name testFloat32ArraySetThree086
     * @tc.desc Verify 6 number float32 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [0.3];
      target.set(src, 0);
      const element105 = target.$_get(0);
      expect(element105).assertEqual(0.30000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_8700
     * @tc.name testFloat32ArraySetThree087
     * @tc.desc Verify 3 number float32 MIN NORMAL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: FixedArray<number> = [1.1754943508222875e-38];
      target.set(src);
      const element106 = target.$_get(0);
      expect(element106).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_8800
     * @tc.name testFloat32ArraySetThree088
     * @tc.desc Verify set(Int32Array) cross-type copies ints to Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(3);
      const src: Int32Array = new Int32Array([1, 2, 3]);
      target.set(src);
      expect(target.$_get(0)).assertEqual(1.0);
      expect(target.$_get(1)).assertEqual(2.0);
      expect(target.$_get(2)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_8900
     * @tc.name testFloat32ArraySetThree089
     * @tc.desc Verify set(Float64Array) cross-type converts double to Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      const src: Float64Array = new Float64Array([1.5, 2.5]);
      target.set(src);
      expect(target.$_get(0)).assertEqual(Math.fround(1.5));
      expect(target.$_get(1)).assertEqual(Math.fround(2.5));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_9000
     * @tc.name testFloat32ArraySetThree090
     * @tc.desc Verify set(Int8Array) cross-type copies small ints to Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(3);
      const src: Int8Array = new Int8Array([-1, 0, 127]);
      target.set(src);
      expect(target.$_get(0)).assertEqual(-1.0);
      expect(target.$_get(1)).assertEqual(0.0);
      expect(target.$_get(2)).assertEqual(127.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_9100
     * @tc.name testFloat32ArraySetThree091
     * @tc.desc Verify set(Uint8Array) cross-type copies unsigned ints to Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(3);
      const src: Uint8Array = new Uint8Array([100, 200, 255]);
      target.set(src);
      expect(target.$_get(0)).assertEqual(100.0);
      expect(target.$_get(1)).assertEqual(200.0);
      expect(target.$_get(2)).assertEqual(255.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_9200
     * @tc.name testFloat32ArraySetThree092
     * @tc.desc Verify set(Int16Array) cross-type copies short ints to Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      const src: Int16Array = new Int16Array([-32768, 32767]);
      target.set(src);
      expect(target.$_get(0)).assertEqual(-32768.0);
      expect(target.$_get(1)).assertEqual(32767.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_9300
     * @tc.name testFloat32ArraySetThree093
     * @tc.desc Verify set(Uint32Array) cross-type copies unsigned ints to Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      const src: Uint32Array = new Uint32Array([0, 100000]);
      target.set(src);
      expect(target.$_get(0)).assertEqual(0.0);
      expect(target.$_get(1)).assertEqual(100000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_9400
     * @tc.name testFloat32ArraySetThree094
     * @tc.desc Verify set(Int32Array, offset) cross-type at specific position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(4);
      target.$_set(0, 1.0);
      target.$_set(1, 2.0);
      const src: Int32Array = new Int32Array([3, 4]);
      target.set(src, 2);
      expect(target.$_get(0)).assertEqual(1.0);
      expect(target.$_get(1)).assertEqual(2.0);
      expect(target.$_get(2)).assertEqual(3.0);
      expect(target.$_get(3)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_9500
     * @tc.name testFloat32ArraySetThree095
     * @tc.desc Verify set(Float64Array) cross-type large double precision truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(1);
      const src: Float64Array = new Float64Array([Math.PI]);
      target.set(src);
      expect(target.$_get(0)).assertEqual(Math.fround(Math.PI));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_THREE_9600
     * @tc.name testFloat32ArraySetThree096
     * @tc.desc Verify set(Int32Array) cross-type large integer conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetThree096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target = new Float32Array(2);
      const src: Int32Array = new Int32Array([-1, 10000000]);
      target.set(src);
      expect(target.$_get(0)).assertEqual(-1.0);
      expect(target.$_get(1)).assertEqual(10000000.0);
    });

  });
}
