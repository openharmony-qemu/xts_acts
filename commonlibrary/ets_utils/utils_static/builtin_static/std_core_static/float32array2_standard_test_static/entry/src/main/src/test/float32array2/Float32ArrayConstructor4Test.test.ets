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

export default function Float32ArrayConstructor4Test(): void {
  describe('Float32ArrayConstructor4Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0010
     * @tc.name testFloat32ArrayConstructorFour001
     * @tc.desc Verify overload 4 passing Float32Array source constructs a copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(2);
      src.$_set(0, 1.0);
      src.$_set(1, 2.0);
      const c = new Float32Array(src);
      expect(c.length).assertEqual(2);
      const element001 = c.$_get(0);
      expect(element001).assertEqual(1.0);
      const element001Part2 = c.$_get(1);
      expect(element001Part2).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0020
     * @tc.name testFloat32ArrayConstructorFour002
     * @tc.desc Verify overload 4 source is empty Float32Array(length 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(0);
      const c = new Float32Array(src);
      expect(c.length).assertEqual(0);
      expect(c.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0030
     * @tc.name testFloat32ArrayConstructorFour003
     * @tc.desc Verify overload 4 source is single-element Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      src.$_set(0, 7.5);
      const c = new Float32Array(src);
      expect(c.length).assertEqual(1);
      const element003 = c.$_get(0);
      expect(element003).assertEqual(7.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0040
     * @tc.name testFloat32ArrayConstructorFour004
     * @tc.desc Verify overload 4 source contains Float32 maximum finite value 3.4028234663852886e+38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      src.$_set(0, 3.4028234663852886e+38);
      const c = new Float32Array(src);
      const element004 = c.$_get(0);
      expect(element004).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0050
     * @tc.name testFloat32ArrayConstructorFour005
     * @tc.desc Verify overload 4 source contains minimum finite negative value-3.4028234663852886e+38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      src.$_set(0, -3.4028234663852886e+38);
      const c = new Float32Array(src);
      const element005 = c.$_get(0);
      expect(element005).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0060
     * @tc.name testFloat32ArrayConstructorFour006
     * @tc.desc Verify overload 4 source contains minimum normal value 1.1754943508222875e-38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      src.$_set(0, 1.1754943508222875e-38);
      const c = new Float32Array(src);
      const element006 = c.$_get(0);
      expect(element006).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0070
     * @tc.name testFloat32ArrayConstructorFour007
     * @tc.desc Verify overload 4 source contains minimum positive subnormal value 1.401298464324817e-45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      src.$_set(0, 1.401298464324817e-45);
      const c = new Float32Array(src);
      const element007 = c.$_get(0);
      expect(element007).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0080
     * @tc.name testFloat32ArrayConstructorFour008
     * @tc.desc Verify overload 4 source contains NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      src.$_set(0, Number.NaN);
      const c = new Float32Array(src);
      const element008 = c.$_get(0);
      expect(element008).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0090
     * @tc.name testFloat32ArrayConstructorFour009
     * @tc.desc Verify overload 4 source contains +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      src.$_set(0, Number.POSITIVE_INFINITY);
      const c = new Float32Array(src);
      const element009 = c.$_get(0);
      expect(element009).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0100
     * @tc.name testFloat32ArrayConstructorFour010
     * @tc.desc Verify overload 4 source contains -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      src.$_set(0, -Number.POSITIVE_INFINITY);
      const c = new Float32Array(src);
      const element010 = c.$_get(0);
      expect(element010).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0110
     * @tc.name testFloat32ArrayConstructorFour011
     * @tc.desc Verify overload 4 source contains +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      src.$_set(0, 0);
      const c = new Float32Array(src);
      const element011 = 1 / c.$_get(0);
      expect(element011).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0120
     * @tc.name testFloat32ArrayConstructorFour012
     * @tc.desc Verify overload 4 source contains -0(negative zero is preserved)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      src.$_set(0, -0);
      const c = new Float32Array(src);
      const element012 = 1 / c.$_get(0);
      expect(element012).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0130
     * @tc.name testFloat32ArrayConstructorFour013
     * @tc.desc Verify overload 4 source contains 0.1 single-precision truncated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      src.$_set(0, 0.1);
      const c = new Float32Array(src);
      const element013 = c.$_get(0);
      expect(element013).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0140
     * @tc.name testFloat32ArrayConstructorFour014
     * @tc.desc Verify overload 4 source contains 16777217 truncates to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      src.$_set(0, 16777217);
      const c = new Float32Array(src);
      const element014 = c.$_get(0);
      expect(element014).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0150
     * @tc.name testFloat32ArrayConstructorFour015
     * @tc.desc Verify overload 4 source contains 1.0e40 overflows to +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      src.$_set(0, 1.0e40);
      const c = new Float32Array(src);
      const element015 = c.$_get(0);
      expect(element015).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0160
     * @tc.name testFloat32ArrayConstructorFour016
     * @tc.desc Verify overload 4 source contains -1.0e40 overflows to -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      src.$_set(0, -1.0e40);
      const c = new Float32Array(src);
      const element016 = c.$_get(0);
      expect(element016).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0170
     * @tc.name testFloat32ArrayConstructorFour017
     * @tc.desc Verify overload 4 source contains 1.0e-46 underflows to +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      src.$_set(0, 1.0e-46);
      const c = new Float32Array(src);
      const element017 = c.$_get(0);
      expect(element017).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0180
     * @tc.name testFloat32ArrayConstructorFour018
     * @tc.desc Verify overload 4 source contains 2147483647 truncates to 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      src.$_set(0, 2147483647);
      const c = new Float32Array(src);
      const element018 = c.$_get(0);
      expect(element018).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0190
     * @tc.name testFloat32ArrayConstructorFour019
     * @tc.desc Verify overload 4 source contains -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      src.$_set(0, -2147483648);
      const c = new Float32Array(src);
      const element019 = c.$_get(0);
      expect(element019).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0200
     * @tc.name testFloat32ArrayConstructorFour020
     * @tc.desc Verify overload 4 source contains mixed special values (NaN, Infinity, positive value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(3);
      src.$_set(0, Number.NaN);
      src.$_set(1, Number.POSITIVE_INFINITY);
      src.$_set(2, 3.5);
      const c = new Float32Array(src);
      const element020 = c.$_get(0);
      expect(element020).assertNaN();
      const element020Part2 = c.$_get(1);
      expect(element020Part2).assertEqual(Number.POSITIVE_INFINITY);
      const element020Part3 = c.$_get(2);
      expect(element020Part3).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0210
     * @tc.name testFloat32ArrayConstructorFour021
     * @tc.desc Verify overload 4 source is 100 element large array (order remains)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(100);
      for (let i = 0; i < 100; i++) {
        src.$_set(i, 1.5);
      }
      const c = new Float32Array(src);
      expect(c.length).assertEqual(100);
      const element021 = c.$_get(0);
      expect(element021).assertEqual(1.5);
      const element021Part2 = c.$_get(99);
      expect(element021Part2).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0220
     * @tc.name testFloat32ArrayConstructorFour022
     * @tc.desc Verify overload 4 source is of() creates number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(10.0, 20.0, 30.0);
      const c = new Float32Array(src);
      const element022 = c.$_get(0);
      expect(element022).assertEqual(10);
      const element022Part2 = c.$_get(2);
      expect(element022Part2).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0230
     * @tc.name testFloat32ArrayConstructorFour023
     * @tc.desc Verify overload 4 source is from() creates number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.from([1.0, 2.0, 3.0]);
      const c = new Float32Array(src);
      expect(c.length).assertEqual(3);
      const element023 = c.$_get(1);
      expect(element023).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0240
     * @tc.name testFloat32ArrayConstructorFour024
     * @tc.desc Verify copying a two-element Float32Array preserves length and zero initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(2);
      const c = new Float32Array(src);
      expect(c.length).assertEqual(2);
      expect(c.$_get(0)).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0250
     * @tc.name testFloat32ArrayConstructorFour025
     * @tc.desc Verify overload 4 copy length equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(5);
      const c = new Float32Array(src);
      expect(c.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0260
     * @tc.name testFloat32ArrayConstructorFour026
     * @tc.desc Verify overload 4 copy byteLength = length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(4);
      const c = new Float32Array(src);
      expect(c.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0270
     * @tc.name testFloat32ArrayConstructorFour027
     * @tc.desc Verify overload 4 copy byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(3);
      const c = new Float32Array(src);
      expect(c.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0280
     * @tc.name testFloat32ArrayConstructorFour028
     * @tc.desc Verify overload 4 copy BYTES_PER_ELEMENT is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      const c = new Float32Array(src);
      expect(c.BYTES_PER_ELEMENT).assertEqual(4);
      expect(c.length).assertEqual(1);
      expect(c.$_get(0)).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0290
     * @tc.name testFloat32ArrayConstructorFour029
     * @tc.desc Verify overload 4 copy name is "Float32Array"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      const c = new Float32Array(src);
      expect(c.name).assertEqual('Float32Array');
      expect(c.length).assertEqual(1);
      expect(c.$_get(0)).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0300
     * @tc.name testFloat32ArrayConstructorFour030
     * @tc.desc Verify overload 4 copy buffer(modifying copy does not affect source)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      src.$_set(0, 1.0);
      const c = new Float32Array(src);
      c.$_set(0, 999.0);
      const element030 = src.$_get(0);
      expect(element030).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0310
     * @tc.name testFloat32ArrayConstructorFour031
     * @tc.desc Verify overload 4 modifying source does not affect creates copy (buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      src.$_set(0, 5.0);
      const c = new Float32Array(src);
      src.$_set(0, 888.0);
      const element031 = c.$_get(0);
      expect(element031).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0320
     * @tc.name testFloat32ArrayConstructorFour032
     * @tc.desc Verify overload 4 from byteOffset view source copies (copy byteOffset zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const view = new Float32Array(buf, 4, 2);
      view.$_set(0, 11.0);
      view.$_set(1, 22.0);
      const c = new Float32Array(view);
      expect(c.byteOffset).assertEqual(0);
      expect(c.length).assertEqual(2);
      const element032 = c.$_get(0);
      expect(element032).assertEqual(11.0);
      const element032Part2 = c.$_get(1);
      expect(element032Part2).assertEqual(22.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0330
     * @tc.name testFloat32ArrayConstructorFour033
     * @tc.desc Verify overload 4 from byteOffset view source copies after copy does not affect buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const view = new Float32Array(buf, 4, 2);
      view.$_set(0, 11.0);
      const c = new Float32Array(view);
      c.$_set(0, 777.0);
      const element033 = view.$_get(0);
      expect(element033).assertEqual(11.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0340
     * @tc.name testFloat32ArrayConstructorFour034
     * @tc.desc Verify overload 8 passing Array<Number> iteration source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [1.0, 2.0];
      const c = new Float32Array(elements);
      expect(c.length).assertEqual(2);
      const element034 = c.$_get(0);
      expect(element034).assertEqual(1.0);
      const element034Part2 = c.$_get(1);
      expect(element034Part2).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0350
     * @tc.name testFloat32ArrayConstructorFour035
     * @tc.desc Verify overload 8 empty Array<Number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [];
      const c = new Float32Array(elements);
      expect(c.length).assertEqual(0);
      expect(c.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0360
     * @tc.name testFloat32ArrayConstructorFour036
     * @tc.desc Verify overload 8 single-element Array<Number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [9.25];
      const c = new Float32Array(elements);
      expect(c.length).assertEqual(1);
      const element036 = c.$_get(0);
      expect(element036).assertEqual(9.25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0370
     * @tc.name testFloat32ArrayConstructorFour037
     * @tc.desc Verify overload 8 Float32 maximum finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [3.4028234663852886e+38];
      const c = new Float32Array(elements);
      const element037 = c.$_get(0);
      expect(element037).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0380
     * @tc.name testFloat32ArrayConstructorFour038
     * @tc.desc Verify overload 8 minimum finite negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [-3.4028234663852886e+38];
      const c = new Float32Array(elements);
      const element038 = c.$_get(0);
      expect(element038).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0390
     * @tc.name testFloat32ArrayConstructorFour039
     * @tc.desc Verify overload 8 minimum normal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [1.1754943508222875e-38];
      const c = new Float32Array(elements);
      const element039 = c.$_get(0);
      expect(element039).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0400
     * @tc.name testFloat32ArrayConstructorFour040
     * @tc.desc Verify overload 8 minimum positive subnormal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [1.401298464324817e-45];
      const c = new Float32Array(elements);
      const element040 = c.$_get(0);
      expect(element040).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0410
     * @tc.name testFloat32ArrayConstructorFour041
     * @tc.desc Verify overload 8 NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [Number.NaN];
      const c = new Float32Array(elements);
      const element041 = c.$_get(0);
      expect(element041).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0420
     * @tc.name testFloat32ArrayConstructorFour042
     * @tc.desc Verify overload 8 +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [Number.POSITIVE_INFINITY];
      const c = new Float32Array(elements);
      const element042 = c.$_get(0);
      expect(element042).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0430
     * @tc.name testFloat32ArrayConstructorFour043
     * @tc.desc Verify overload 8 -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [-Number.POSITIVE_INFINITY];
      const c = new Float32Array(elements);
      const element043 = c.$_get(0);
      expect(element043).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0440
     * @tc.name testFloat32ArrayConstructorFour044
     * @tc.desc Verify overload 8 +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [0];
      const c = new Float32Array(elements);
      const element044 = 1 / c.$_get(0);
      expect(element044).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0450
     * @tc.name testFloat32ArrayConstructorFour045
     * @tc.desc Verify overload 8 -0(negative zero is preserved)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [-0];
      const c = new Float32Array(elements);
      const element045 = 1 / c.$_get(0);
      expect(element045).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0460
     * @tc.name testFloat32ArrayConstructorFour046
     * @tc.desc Verify overload 8 0.1 single-precision truncated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [0.1];
      const c = new Float32Array(elements);
      const element046 = c.$_get(0);
      expect(element046).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0470
     * @tc.name testFloat32ArrayConstructorFour047
     * @tc.desc Verify overload 8 16777217 truncates to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [16777217];
      const c = new Float32Array(elements);
      const element047 = c.$_get(0);
      expect(element047).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0480
     * @tc.name testFloat32ArrayConstructorFour048
     * @tc.desc Verify overload 8 1.0e40 overflows to +Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [1.0e40];
      const c = new Float32Array(elements);
      const element048 = c.$_get(0);
      expect(element048).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0490
     * @tc.name testFloat32ArrayConstructorFour049
     * @tc.desc Verify overload 8 -1.0e40 overflows to -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [-1.0e40];
      const c = new Float32Array(elements);
      const element049 = c.$_get(0);
      expect(element049).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0500
     * @tc.name testFloat32ArrayConstructorFour050
     * @tc.desc Verify overload 8 1.0e-46 underflows to +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [1.0e-46];
      const c = new Float32Array(elements);
      const element050 = c.$_get(0);
      expect(element050).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0510
     * @tc.name testFloat32ArrayConstructorFour051
     * @tc.desc Verify overload 8 2147483647 truncates to 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [2147483647];
      const c = new Float32Array(elements);
      const element051 = c.$_get(0);
      expect(element051).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0520
     * @tc.name testFloat32ArrayConstructorFour052
     * @tc.desc Verify overload 8 negative integer -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [-2147483648];
      const c = new Float32Array(elements);
      const element052 = c.$_get(0);
      expect(element052).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0530
     * @tc.name testFloat32ArrayConstructorFour053
     * @tc.desc Verify overload 8 16 literal 0x10 = 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [0x10];
      const c = new Float32Array(elements);
      const element053 = c.$_get(0);
      expect(element053).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0540
     * @tc.name testFloat32ArrayConstructorFour054
     * @tc.desc Verify overload 8 8 literal 0o17 = 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [0o17];
      const c = new Float32Array(elements);
      const element054 = c.$_get(0);
      expect(element054).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0550
     * @tc.name testFloat32ArrayConstructorFour055
     * @tc.desc Verify overload 8 2 literal 0b1010 = 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [0b1010];
      const c = new Float32Array(elements);
      const element055 = c.$_get(0);
      expect(element055).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0560
     * @tc.name testFloat32ArrayConstructorFour056
     * @tc.desc Verify overload 8 scientific notation 1e3 = 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [1e3];
      const c = new Float32Array(elements);
      const element056 = c.$_get(0);
      expect(element056).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0570
     * @tc.name testFloat32ArrayConstructorFour057
     * @tc.desc Verify overload 8 multi-element order remains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [1.0, 2.0, 3.0, 4.0];
      const c = new Float32Array(elements);
      const element057 = c.$_get(0);
      expect(element057).assertEqual(1.0);
      const element057Part2 = c.$_get(3);
      expect(element057Part2).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0580
     * @tc.name testFloat32ArrayConstructorFour058
     * @tc.desc Verify overload 8 all same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [2.5, 2.5, 2.5];
      const c = new Float32Array(elements);
      const element058 = c.$_get(0);
      expect(element058).assertEqual(2.5);
      const element058Part2 = c.$_get(2);
      expect(element058Part2).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0590
     * @tc.name testFloat32ArrayConstructorFour059
     * @tc.desc Verify Iterable<Number> construction preserves length and first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [1.0];
      const c = new Float32Array(elements);
      expect(c.length).assertEqual(1);
      expect(c.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0600
     * @tc.name testFloat32ArrayConstructorFour060
     * @tc.desc Verify overload 8 result byteLength = length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [1.0, 2.0, 3.0];
      const c = new Float32Array(elements);
      expect(c.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0610
     * @tc.name testFloat32ArrayConstructorFour061
     * @tc.desc Verify overload 8 result byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [1.0];
      const c = new Float32Array(elements);
      expect(c.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0620
     * @tc.name testFloat32ArrayConstructorFour062
     * @tc.desc Verify overload 8 result BYTES_PER_ELEMENT is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [1.0];
      const c = new Float32Array(elements);
      expect(c.BYTES_PER_ELEMENT).assertEqual(4);
      expect(c.length).assertEqual(1);
      expect(c.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0630
     * @tc.name testFloat32ArrayConstructorFour063
     * @tc.desc Verify overload 8 modifying number does not affect source Array<Number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [1.0, 2.0];
      const c = new Float32Array(elements);
      c.$_set(0, 999.0);
      expect(elements[0]).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0640
     * @tc.name testFloat32ArrayConstructorFour064
     * @tc.desc Verify overload 8 constructs after modifying source Array<Number> does not affect number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [5.0];
      const c = new Float32Array(elements);
      elements[0] = 888;
      const element064 = c.$_get(0);
      expect(element064).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0650
     * @tc.name testFloat32ArrayConstructorFour065
     * @tc.desc Verify overload 12 three-argument undefined(offset 0, covers all)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const c = new Float32Array(buf, undefined, undefined);
      expect(c.length).assertEqual(2);
      expect(c.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0660
     * @tc.name testFloat32ArrayConstructorFour066
     * @tc.desc Verify overload 12 two-argument (buf, byteOffset) omitting length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const c = new Float32Array(buf, 0);
      expect(c.length).assertEqual(2);
      expect(c.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0670
     * @tc.name testFloat32ArrayConstructorFour067
     * @tc.desc Verify ArrayBuffer view with byteOffset=0 length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const c = new Float32Array(buf, 0, 1);
      expect(c.byteOffset).assertEqual(0);
      expect(c.length).assertEqual(1);
      expect(c.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0680
     * @tc.name testFloat32ArrayConstructorFour068
     * @tc.desc Verify overload 12 byteOffset=4 length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const c = new Float32Array(buf, 4, 1);
      expect(c.byteOffset).assertEqual(4);
      expect(c.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0690
     * @tc.name testFloat32ArrayConstructorFour069
     * @tc.desc Verify overload 12 byteOffset=4 length=1(4 aligned)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const c = new Float32Array(buf, 4, undefined);
      expect(c.byteOffset).assertEqual(4);
      expect(c.length).assertEqual(1);
      expect(c.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0700
     * @tc.name testFloat32ArrayConstructorFour070
     * @tc.desc Verify ArrayBuffer view with byteOffset=undefined length=2 (offset defaults to 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const c = new Float32Array(buf, undefined, 2);
      expect(c.byteOffset).assertEqual(0);
      expect(c.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0710
     * @tc.name testFloat32ArrayConstructorFour071
     * @tc.desc Verify ArrayBuffer view with byteOffset=0 length=0 yields empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const c = new Float32Array(buf, 0, 0);
      expect(c.length).assertEqual(0);
      expect(c.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0720
     * @tc.name testFloat32ArrayConstructorFour072
     * @tc.desc Verify overload 12 byteOffset=0.0 Number float 0 truncates to 0 with length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const c = new Float32Array(buf, 0.0, 2);
      expect(c.byteOffset).assertEqual(0);
      expect(c.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0730
     * @tc.name testFloat32ArrayConstructorFour073
     * @tc.desc Verify overload 12 byteOffset=4.0 Number float 4 truncates to 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const c = new Float32Array(buf, 4.0, 1);
      expect(c.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0740
     * @tc.name testFloat32ArrayConstructorFour074
     * @tc.desc Verify overload 12 length=2.9 truncates to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const c = new Float32Array(buf, 0, 2.9);
      expect(c.length).assertEqual(2);
      expect(c.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0750
     * @tc.name testFloat32ArrayConstructorFour075
     * @tc.desc Verify overload 12 length=1.9 truncates to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const c = new Float32Array(buf, 0, 1.9);
      expect(c.length).assertEqual(1);
      expect(c.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0760
     * @tc.name testFloat32ArrayConstructorFour076
     * @tc.desc Verify ArrayBuffer view with byteOffset/length undefined covers full 4-byte buffer (length=1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const c = new Float32Array(buf, undefined, undefined);
      expect(c.length).assertEqual(1);
      expect(c.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0770
     * @tc.name testFloat32ArrayConstructorFour077
     * @tc.desc Verify empty ArrayBuffer with undefined offset/length yields empty view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      const c = new Float32Array(buf, undefined, undefined);
      expect(c.length).assertEqual(0);
      expect(c.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0780
     * @tc.name testFloat32ArrayConstructorFour078
     * @tc.desc Verify overload 12 0 empty buffer undefined(length 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      const c = new Float32Array(buf, 0, 0);
      expect(c.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0790
     * @tc.name testFloat32ArrayConstructorFour079
     * @tc.desc Verify overload 12 byteOffset=8 length=2 on 16 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const c = new Float32Array(buf, 8, 2);
      expect(c.byteOffset).assertEqual(8);
      expect(c.length).assertEqual(2);
      expect(c.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0800
     * @tc.name testFloat32ArrayConstructorFour080
     * @tc.desc Verify ArrayBuffer(8) with undefined offset/length keeps buffer identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const c = new Float32Array(buf, undefined, undefined);
      expect(c.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0810
     * @tc.name testFloat32ArrayConstructorFour081
     * @tc.desc Verify overload 12 view buffer and passing buf same for
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const c = new Float32Array(buf, 0, 1);
      expect(c.length).assertEqual(1);
      expect(c.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0820
     * @tc.name testFloat32ArrayConstructorFour082
     * @tc.desc Verify overload 12 view BYTES_PER_ELEMENT is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const c = new Float32Array(buf, undefined, undefined);
      expect(c.BYTES_PER_ELEMENT).assertEqual(4);
      expect(c.length).assertEqual(2);
      expect(c.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0830
     * @tc.name testFloat32ArrayConstructorFour083
     * @tc.desc Verify overload 12 view name is Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const c = new Float32Array(buf, 0, 1);
      expect(c.name).assertEqual('Float32Array');
      expect(c.length).assertEqual(1);
      expect(c.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0840
     * @tc.name testFloat32ArrayConstructorFour084
     * @tc.desc Verify overload 12 view byteLength less than buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const c = new Float32Array(buf, 0, 2);
      expect(c.byteLength).assertEqual(8);
      expect(c.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0850
     * @tc.name testFloat32ArrayConstructorFour085
     * @tc.desc Verify overload 12 view default element values are 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const c = new Float32Array(buf, undefined, undefined);
      const element085 = c.$_get(0);
      expect(element085).assertEqual(0);
      const element085Part2 = c.$_get(1);
      expect(element085Part2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0860
     * @tc.name testFloat32ArrayConstructorFour086
     * @tc.desc Verify overload 12 byteOffset=6 unaligned throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, 6, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0870
     * @tc.name testFloat32ArrayConstructorFour087
     * @tc.desc Verify overload 12 byteOffset=2.9 Number float throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, 2.9, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0880
     * @tc.name testFloat32ArrayConstructorFour088
     * @tc.desc Verify overload 12 byteOffset exceeds buffer throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, 12, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0890
     * @tc.name testFloat32ArrayConstructorFour089
     * @tc.desc Verify overload 12 byteOffset=3 unaligned throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, 3, undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0900
     * @tc.name testFloat32ArrayConstructorFour090
     * @tc.desc Verify overload 12 default byteOffset view shares buffer with another view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const observedValue094 = new Float32Array(buf, undefined, undefined);
      const observedValue094Part2 = new Float32Array(buf, 0, 2);
      observedValue094.$_set(0, 42.0);
      const element094 = observedValue094Part2.$_get(0);
      expect(element094).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0910
     * @tc.name testFloat32ArrayConstructorFour091
     * @tc.desc Verify overload 12 view affects underlying buffer, another view is visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const observedValue095 = new Float32Array(buf, 0, 2);
      const observedValue095Part2 = new Float32Array(buf, undefined, undefined);
      observedValue095Part2.$_set(1, 99.0);
      const element095 = observedValue095.$_get(1);
      expect(element095).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0920
     * @tc.name testFloat32ArrayConstructorFour092
     * @tc.desc Verify overload 12 two view writes, one view reads consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const low = new Float32Array(buf, 0, 2);
      const high = new Float32Array(buf, 8, 2);
      low.$_set(0, 1.0);
      high.$_set(0, 2.0);
      const element096 = low.$_get(0);
      expect(element096).assertEqual(1.0);
      const element096Part2 = high.$_get(0);
      expect(element096Part2).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0930
     * @tc.name testFloat32ArrayConstructorFour093
     * @tc.desc Verify overload 12 different offset view does not affect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const observedValue097 = new Float32Array(buf, 0, 1);
      const observedValue097Part2 = new Float32Array(buf, 4, 1);
      expect(observedValue097.buffer).assertEqual(buf);
      expect(observedValue097Part2.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0940
     * @tc.name testFloat32ArrayConstructorFour094
     * @tc.desc Verify overload 12 view share the same buffer for
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const part = new Float32Array(buf, 4, 2);
      const full = new Float32Array(buf, undefined, undefined);
      part.$_set(0, 7.0);
      const element098 = full.$_get(1);
      expect(element098).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0950
     * @tc.name testFloat32ArrayConstructorFour095
     * @tc.desc Verify overload 12 view after view corresponding position is visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const part = new Float32Array(buf, 8, 2);
      const full = new Float32Array(buf, 0, 4);
      full.$_set(2, 13.0);
      const element099 = part.$_get(0);
      expect(element099).assertEqual(13.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0960
     * @tc.name testFloat32ArrayConstructorFour096
     * @tc.desc Verify overload 12 view after view corresponding position is visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const v = new Float32Array(buf, 4, 2);
      v.$_set(0, 5.0);
      const probe = new Float32Array(buf, 4, 1);
      const element100 = probe.$_get(0);
      expect(element100).assertEqual(5.0);
      expect(v.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0970
     * @tc.name testFloat32ArrayConstructorFour097
     * @tc.desc Verify overload 12 view byteOffset buffer offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const v = new Float32Array(buf, 4, 2);
      v.$_set(1, 21.0);
      const probe = new Float32Array(buf, 8, 1);
      const element101 = probe.$_get(0);
      expect(element101).assertEqual(21.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0980
     * @tc.name testFloat32ArrayConstructorFour098
     * @tc.desc Verify overload 12 view two element for buffer offset byteOffset+4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const observedValue102 = new Float32Array(buf, 0, 1);
      const observedValue102Part2 = new Float32Array(buf, 4, 1);
      const observedValue102Part3 = new Float32Array(buf, 8, 1);
      observedValue102.$_set(0, 100.0);
      observedValue102Part2.$_set(0, 200.0);
      observedValue102Part3.$_set(0, 300.0);
      const all = new Float32Array(buf, undefined, undefined);
      const element102 = all.$_get(0);
      expect(element102).assertEqual(100.0);
      const element102Part2 = all.$_get(2);
      expect(element102Part2).assertEqual(300.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_0990
     * @tc.name testFloat32ArrayConstructorFour099
     * @tc.desc Verify overload 12 three view (v1 reads v3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const v = new Float32Array(buf, 0, 1);
      v.$_set(0, Number.NaN);
      const r = new Float32Array(buf, undefined, undefined);
      const element103 = r.$_get(0);
      expect(element103).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_1000
     * @tc.name testFloat32ArrayConstructorFour100
     * @tc.desc Verify ArrayBuffer view write of Infinity is visible via another view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const v = new Float32Array(buf, 0, 1);
      v.$_set(0, Number.POSITIVE_INFINITY);
      const r = new Float32Array(buf, 0, 1);
      const element104 = r.$_get(0);
      expect(element104).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_1010
     * @tc.name testFloat32ArrayConstructorFour101
     * @tc.desc Verify overload 12 view writes -0 appears as -Infinity via 1/x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const v = new Float32Array(buf, 0, 1);
      v.$_set(0, -0);
      const r = new Float32Array(buf, undefined, undefined);
      const element105 = 1 / r.$_get(0);
      expect(element105).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_1020
     * @tc.name testFloat32ArrayConstructorFour102
     * @tc.desc Verify overload 12 whole view write is visible in sub-view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const whole = new Float32Array(buf, 0, 2);
      const first = new Float32Array(buf, 0, 1);
      whole.$_set(0, 55.0);
      const element106 = first.$_get(0);
      expect(element106).assertEqual(55.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_1030
     * @tc.name testFloat32ArrayConstructorFour103
     * @tc.desc Verify overload 12 view $_set and $_get read back consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const v = new Float32Array(buf, undefined, undefined);
      v.$_set(0, 123.0);
      expect(v.$_get(0)).assertEqual(123.0);
      expect(buf.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_1040
     * @tc.name testFloat32ArrayConstructorFour104
     * @tc.desc Verify overload 12 view modifying after buffer.byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Float32Array(buf, undefined, undefined);
      view.$_set(0, 1.0);
      const copy = new Float32Array(view);
      copy.$_set(0, 999.0);
      const element108 = view.$_get(0);
      expect(element108).assertEqual(1.0);
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_1050
     * @tc.name testFloat32ArrayConstructorFour105
     * @tc.desc Verify overload 4 copy for (vs)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      src.$_set(0, 16777216);
      const c = new Float32Array(src);
      const element109 = c.$_get(0);
      expect(element109).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_1060
     * @tc.name testFloat32ArrayConstructorFour106
     * @tc.desc Verify overload 4 source contains 0.2 single-precision truncated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      src.$_set(0, 0.2);
      const c = new Float32Array(src);
      const element110 = c.$_get(0);
      expect(element110).assertEqual(0.20000000298023224);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_1070
     * @tc.name testFloat32ArrayConstructorFour107
     * @tc.desc Verify overload 4 multi-element in -0 remains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(3);
      src.$_set(0, 1.0);
      src.$_set(1, -0);
      src.$_set(2, 3.0);
      const c = new Float32Array(src);
      const element111 = 1 / c.$_get(1);
      expect(element111).assertEqual(-Number.POSITIVE_INFINITY);
      const element111Part2 = c.$_get(2);
      expect(element111Part2).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_1080
     * @tc.name testFloat32ArrayConstructorFour108
     * @tc.desc Verify overload 4 from view source copies after copy byteLength equals element count *4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Float32Array(buf, 4, 3);
      const c = new Float32Array(view);
      expect(c.byteLength).assertEqual(12);
      expect(c.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_1090
     * @tc.name testFloat32ArrayConstructorFour109
     * @tc.desc Verify overload 8 Float32Array.values() iterator constructs with elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(4.0, 8.0);
      const it: Iterable<Number> = src.values();
      const c = new Float32Array(it);
      expect(c.length).assertEqual(2);
      const element113 = c.$_get(0);
      expect(element113).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_1100
     * @tc.name testFloat32ArrayConstructorFour110
     * @tc.desc Verify overload 8 Float32Array.values() iterator constructs (Iterable<Number>)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(0);
      const it: Iterable<Number> = src.values();
      const c = new Float32Array(it);
      expect(c.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_1110
     * @tc.name testFloat32ArrayConstructorFour111
     * @tc.desc Verify Array<Number> source [0o21] constructs element value 17
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [0o21];
      const c = new Float32Array(elements);
      const element115 = c.$_get(0);
      expect(element115).assertEqual(17);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_1120
     * @tc.name testFloat32ArrayConstructorFour112
     * @tc.desc Verify overload 8 2 literal 0b1100 = 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [0b1100];
      const c = new Float32Array(elements);
      const element116 = c.$_get(0);
      expect(element116).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_1130
     * @tc.name testFloat32ArrayConstructorFour113
     * @tc.desc Verify overload 8 negative float -1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [-1.5];
      const c = new Float32Array(elements);
      const element117 = c.$_get(0);
      expect(element117).assertEqual(-1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_1140
     * @tc.name testFloat32ArrayConstructorFour114
     * @tc.desc Verify overload 8 8 element large array order and value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elements: Array<Number> = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0];
      const c = new Float32Array(elements);
      expect(c.length).assertEqual(8);
      const element118 = c.$_get(0);
      expect(element118).assertEqual(1.0);
      const element118Part2 = c.$_get(7);
      expect(element118Part2).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_1150
     * @tc.name testFloat32ArrayConstructorFour115
     * @tc.desc Verify overload 12 byteOffset=8 length=undefined covers remaining is 0(8 buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const c = new Float32Array(buf, 8, undefined);
      expect(c.byteOffset).assertEqual(8);
      expect(c.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_1160
     * @tc.name testFloat32ArrayConstructorFour116
     * @tc.desc Verify overload 12 byteOffset=0 length=undefined covers full 16-byte buffer (length 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const c = new Float32Array(buf, 0, undefined);
      expect(c.length).assertEqual(4);
      expect(c.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_1170
     * @tc.name testFloat32ArrayConstructorFour117
     * @tc.desc Verify ArrayBuffer view with number byteOffset=4.0 has offset 4 and length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const c = new Float32Array(buf, 4.0);
      expect(c.byteOffset).assertEqual(4);
      expect(c.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FOUR_1180
     * @tc.name testFloat32ArrayConstructorFour118
     * @tc.desc Verify default offset and length expose a shared Float32 value with float32 precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFour118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const v = new Float32Array(buf, 0, 1);
      v.$_set(0, 0.1);
      const r = new Float32Array(buf, undefined, undefined);
      const element122 = r.$_get(0);
      expect(element122).assertEqual(0.10000000149011612);
    });

  });
}
