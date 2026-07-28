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

export default function Float32ArrayIntegration1Test(): void {
  describe('Float32ArrayIntegration1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0010
     * @tc.name testFloat32ArrayIntegrationOne001
     * @tc.desc Verify constructor() 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array();
      expect(a.length).assertEqual(0);
      expect(a.byteLength).assertEqual(0);
      expect(a.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0020
     * @tc.name testFloat32ArrayIntegrationOne002
     * @tc.desc Verify constructor(3) int 3 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      expect(a.length).assertEqual(3);
      expect(a.byteLength).assertEqual(12);
      const element002 = a.$_get(0);
      expect(element002).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0030
     * @tc.name testFloat32ArrayIntegrationOne003
     * @tc.desc Verify constructor(3.9) number 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3.9);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0040
     * @tc.name testFloat32ArrayIntegrationOne004
     * @tc.desc Verify constructor(other) Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([1.0, 2.0, 3.0]);
      const a = new Float32Array(src);
      expect(a.length).assertEqual(3);
      const element004 = a.$_get(1);
      expect(element004).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0050
     * @tc.name testFloat32ArrayIntegrationOne005
     * @tc.desc Verify constructor(FixedArray)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      expect(a.length).assertEqual(3);
      const element005 = a.$_get(2);
      expect(element005).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0060
     * @tc.name testFloat32ArrayIntegrationOne006
     * @tc.desc Verify constructor(Array<number>)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0];
      const a = new Float32Array(src);
      expect(a.length).assertEqual(3);
      const element006 = a.$_get(0);
      expect(element006).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0070
     * @tc.name testFloat32ArrayIntegrationOne007
     * @tc.desc Verify constructor(ArrayBuffer) 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Float32Array(buf);
      expect(a.length).assertEqual(2);
      expect(a.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0080
     * @tc.name testFloat32ArrayIntegrationOne008
     * @tc.desc Verify constructor(ArrayBuffer, 4) byteOffset=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Float32Array(buf, 4);
      expect(a.length).assertEqual(1);
      expect(a.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0090
     * @tc.name testFloat32ArrayIntegrationOne009
     * @tc.desc Verify constructor(ArrayBuffer, 0, 2) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Float32Array(buf, 0, 2);
      expect(a.length).assertEqual(2);
      expect(a.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0100
     * @tc.name testFloat32ArrayIntegrationOne010
     * @tc.desc Verify length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(0);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0110
     * @tc.name testFloat32ArrayIntegrationOne011
     * @tc.desc Verify length=1 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1);
      expect(a.length).assertEqual(1);
      expect(a.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0120
     * @tc.name testFloat32ArrayIntegrationOne012
     * @tc.desc Verify length=1024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1024);
      expect(a.length).assertEqual(1024);
      const element014 = a.$_get(1023);
      expect(element014).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0130
     * @tc.name testFloat32ArrayIntegrationOne013
     * @tc.desc Verify length=2^53 ToIndex RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float32Array(2**53);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0140
     * @tc.name testFloat32ArrayIntegrationOne014
     * @tc.desc Verify length=2.9 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(2.9);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0150
     * @tc.name testFloat32ArrayIntegrationOne015
     * @tc.desc Verify length=2.1 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(2.1);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0160
     * @tc.name testFloat32ArrayIntegrationOne016
     * @tc.desc Verify length=3.99 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3.99);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0170
     * @tc.name testFloat32ArrayIntegrationOne017
     * @tc.desc Verify length=0.9 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(0.9);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0180
     * @tc.name testFloat32ArrayIntegrationOne018
     * @tc.desc Verify length=-0.5 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float32Array(-0.5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0190
     * @tc.name testFloat32ArrayIntegrationOne019
     * @tc.desc Verify length=5.0 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(5.0);
      expect(a.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0200
     * @tc.name testFloat32ArrayIntegrationOne020
     * @tc.desc Verify constructor(Float32Array) 5 elements element[4]=50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const a = new Float32Array(src);
      expect(a.length).assertEqual(5);
      const element025 = a.$_get(4);
      expect(element025).assertEqual(50.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0210
     * @tc.name testFloat32ArrayIntegrationOne021
     * @tc.desc Verify constructor(Float32Array(0)) length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(0);
      const a = new Float32Array(src);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0220
     * @tc.name testFloat32ArrayIntegrationOne022
     * @tc.desc Verify constructor(Float32Array([7])) length=1 element=7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([7.0]);
      const a = new Float32Array(src);
      expect(a.length).assertEqual(1);
      const element027 = a.$_get(0);
      expect(element027).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0230
     * @tc.name testFloat32ArrayIntegrationOne023
     * @tc.desc Verify constructor(Float32Array) copies data; mutating src after construction does not affect the new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([1.0, 2.0]);
      const a = new Float32Array(src);
      src.$_set(0, 99.0);
      const element028 = a.$_get(0);
      expect(element028).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0240
     * @tc.name testFloat32ArrayIntegrationOne024
     * @tc.desc Verify NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([Number.NaN, 2.0]);
      const a = new Float32Array(src);
      const element029 = a.$_get(0);
      expect(element029).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0250
     * @tc.name testFloat32ArrayIntegrationOne025
     * @tc.desc Verify FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([-1.0, -2.0, -3.0]);
      const element030 = a.$_get(0);
      expect(element030).assertEqual(-1.0);
      const element030Part2 = a.$_get(2);
      expect(element030Part2).assertEqual(-3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0260
     * @tc.name testFloat32ArrayIntegrationOne026
     * @tc.desc Verify constructor([]) length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([]);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0270
     * @tc.name testFloat32ArrayIntegrationOne027
     * @tc.desc Verify constructor([5]) length=1 element=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([5.0]);
      expect(a.length).assertEqual(1);
      const element032 = a.$_get(0);
      expect(element032).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0280
     * @tc.name testFloat32ArrayIntegrationOne028
     * @tc.desc Verify constructor([1.5,-2.5,3.5]) element[1]=-2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.5, -2.5, 3.5]);
      const element033 = a.$_get(1);
      expect(element033).assertEqual(-2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0290
     * @tc.name testFloat32ArrayIntegrationOne029
     * @tc.desc Verify constructor(Array<number>) copies element at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0];
      const a = new Float32Array(src);
      const element034 = a.$_get(1);
      expect(element034).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0300
     * @tc.name testFloat32ArrayIntegrationOne030
     * @tc.desc Verify Array 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0.1, 0.2];
      const a = new Float32Array(src);
      const element036 = a.$_get(0);
      expect(element036).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0310
     * @tc.name testFloat32ArrayIntegrationOne031
     * @tc.desc Verify constructor(Array<number>) copies element at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1, 2, 3];
      const a = new Float32Array(src);
      const element037 = a.$_get(2);
      expect(element037).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0320
     * @tc.name testFloat32ArrayIntegrationOne032
     * @tc.desc Verify constructor(Array<number>) preserves NaN and Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY];
      const a = new Float32Array(src);
      const element038 = a.$_get(1);
      expect(element038).assertEqual(Number.POSITIVE_INFINITY);
      const element038Part2 = a.$_get(0);
      expect(element038Part2).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0330
     * @tc.name testFloat32ArrayIntegrationOne033
     * @tc.desc Verify ArrayBuffer(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      const a = new Float32Array(buf);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0340
     * @tc.name testFloat32ArrayIntegrationOne034
     * @tc.desc Verify ArrayBuffer(4) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const a = new Float32Array(buf);
      expect(a.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0350
     * @tc.name testFloat32ArrayIntegrationOne035
     * @tc.desc Verify byteOffset=4 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Float32Array(buf, 4);
      expect(a.byteOffset).assertEqual(4);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0360
     * @tc.name testFloat32ArrayIntegrationOne036
     * @tc.desc Verify byteOffset=8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Float32Array(buf, 8);
      expect(a.length).assertEqual(2);
      expect(a.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0370
     * @tc.name testFloat32ArrayIntegrationOne037
     * @tc.desc Verify ArrayBuffer(2) 4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      try {
        new Float32Array(buf, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0380
     * @tc.name testFloat32ArrayIntegrationOne038
     * @tc.desc Verify byteOffset=16 buf 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Float32Array(buf, 16);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0390
     * @tc.name testFloat32ArrayIntegrationOne039
     * @tc.desc Verify byteOffset=-1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      try {
        new Float32Array(buf, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0400
     * @tc.name testFloat32ArrayIntegrationOne040
     * @tc.desc Verify (buf8, 0, 2) 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Float32Array(buf, 0, 2);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0410
     * @tc.name testFloat32ArrayIntegrationOne041
     * @tc.desc Verify (buf8, 4, 1) 1 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Float32Array(buf, 4, 1);
      expect(a.length).assertEqual(1);
      expect(a.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0420
     * @tc.name testFloat32ArrayIntegrationOne042
     * @tc.desc Verify (buf8, 0, 0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Float32Array(buf, 0, 0);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0430
     * @tc.name testFloat32ArrayIntegrationOne043
     * @tc.desc Verify (buf16, 0, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const a = new Float32Array(buf, 0, 4);
      expect(a.length).assertEqual(4);
      expect(a.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0440
     * @tc.name testFloat32ArrayIntegrationOne044
     * @tc.desc Verify $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const element058 = a.$_get(0);
      expect(element058).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0450
     * @tc.name testFloat32ArrayIntegrationOne045
     * @tc.desc Verify $_get(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const element059 = a.$_get(2);
      expect(element059).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0460
     * @tc.name testFloat32ArrayIntegrationOne046
     * @tc.desc Verify $_get(3) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.$_get(3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0470
     * @tc.name testFloat32ArrayIntegrationOne047
     * @tc.desc Verify $_get(4) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.$_get(4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0480
     * @tc.name testFloat32ArrayIntegrationOne048
     * @tc.desc Verify $_get(-1) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0490
     * @tc.name testFloat32ArrayIntegrationOne049
     * @tc.desc Verify $_get(2147483647) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.$_get(2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0500
     * @tc.name testFloat32ArrayIntegrationOne050
     * @tc.desc Verify $_set(0, 1.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      a.$_set(0, 1.5);
      const element064 = a.$_get(0);
      expect(element064).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0510
     * @tc.name testFloat32ArrayIntegrationOne051
     * @tc.desc Verify $_set(2, 9.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      a.$_set(2, 9.5);
      const element065 = a.$_get(2);
      expect(element065).assertEqual(9.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0520
     * @tc.name testFloat32ArrayIntegrationOne052
     * @tc.desc Verify $_set(3, 1.0) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.$_set(3, 1.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0530
     * @tc.name testFloat32ArrayIntegrationOne053
     * @tc.desc Verify $_set(-1, 1.0) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.$_set(-1, 1.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0540
     * @tc.name testFloat32ArrayIntegrationOne054
     * @tc.desc Verify $_set(100, 1.0) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.$_set(100, 1.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0550
     * @tc.name testFloat32ArrayIntegrationOne055
     * @tc.desc Verify value=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1);
      a.$_set(0, 0);
      const element069 = a.$_get(0);
      expect(element069).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0560
     * @tc.name testFloat32ArrayIntegrationOne056
     * @tc.desc Verify value=-0 1/x -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1);
      a.$_set(0, -0);
      const element070 = 1 / a.$_get(0);
      expect(element070).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0570
     * @tc.name testFloat32ArrayIntegrationOne057
     * @tc.desc Verify value=NaN NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1);
      a.$_set(0, Number.NaN);
      const element071 = a.$_get(0);
      expect(element071).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0580
     * @tc.name testFloat32ArrayIntegrationOne058
     * @tc.desc Verify value=Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1);
      a.$_set(0, Number.POSITIVE_INFINITY);
      const element072 = a.$_get(0);
      expect(element072).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0590
     * @tc.name testFloat32ArrayIntegrationOne059
     * @tc.desc Verify value=-Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1);
      a.$_set(0, -Number.POSITIVE_INFINITY);
      const element073 = a.$_get(0);
      expect(element073).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0600
     * @tc.name testFloat32ArrayIntegrationOne060
     * @tc.desc Verify value=Float32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1);
      a.$_set(0, 3.4028234663852886e+38);
      const element074 = a.$_get(0);
      expect(element074).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0610
     * @tc.name testFloat32ArrayIntegrationOne061
     * @tc.desc Verify value=MIN_NORMAL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1);
      a.$_set(0, 1.1754943508222875e-38);
      const element075 = a.$_get(0);
      expect(element075).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0620
     * @tc.name testFloat32ArrayIntegrationOne062
     * @tc.desc Verify value=MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1);
      a.$_set(0, 1.401298464324817e-45);
      const element076 = a.$_get(0);
      expect(element076).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0630
     * @tc.name testFloat32ArrayIntegrationOne063
     * @tc.desc Verify value=-Float32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1);
      a.$_set(0, -3.4028234663852886e+38);
      const element077 = a.$_get(0);
      expect(element077).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0640
     * @tc.name testFloat32ArrayIntegrationOne064
     * @tc.desc Verify value=16777216 2^24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1);
      a.$_set(0, 16777216);
      const element078 = a.$_get(0);
      expect(element078).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0650
     * @tc.name testFloat32ArrayIntegrationOne065
     * @tc.desc Verify value=16777217 2^24+1 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1);
      a.$_set(0, 16777217);
      const element079 = a.$_get(0);
      expect(element079).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0660
     * @tc.name testFloat32ArrayIntegrationOne066
     * @tc.desc Verify value=1.0e40 Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1);
      a.$_set(0, 1.0e40);
      const element080 = a.$_get(0);
      expect(element080).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0670
     * @tc.name testFloat32ArrayIntegrationOne067
     * @tc.desc Verify value=-1.0e40 -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1);
      a.$_set(0, -1.0e40);
      const element081 = a.$_get(0);
      expect(element081).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0680
     * @tc.name testFloat32ArrayIntegrationOne068
     * @tc.desc Verify value=1.0e-46 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1);
      a.$_set(0, 1.0e-46);
      const element082 = a.$_get(0);
      expect(element082).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0690
     * @tc.name testFloat32ArrayIntegrationOne069
     * @tc.desc Verify value=0.1 float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1);
      a.$_set(0, 0.1);
      const element083 = a.$_get(0);
      expect(element083).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0700
     * @tc.name testFloat32ArrayIntegrationOne070
     * @tc.desc Verify value=9.0 9.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1);
      a.$_set(0, 9.0);
      const element084 = a.$_get(0);
      expect(element084).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0710
     * @tc.name testFloat32ArrayIntegrationOne071
     * @tc.desc Verify value=1.0e3 1000.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1);
      a.$_set(0, 1.0e3);
      const element085 = a.$_get(0);
      expect(element085).assertEqual(1000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0720
     * @tc.name testFloat32ArrayIntegrationOne072
     * @tc.desc Verify at(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const atValue087 = a.at(2);
      expect(atValue087).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0730
     * @tc.name testFloat32ArrayIntegrationOne073
     * @tc.desc Verify at(-3) -length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const atValue089 = a.at(-3);
      expect(atValue089).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0740
     * @tc.name testFloat32ArrayIntegrationOne074
     * @tc.desc Verify at(-4) -length undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const atValue090 = a.at(-4);
      expect(atValue090).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0750
     * @tc.name testFloat32ArrayIntegrationOne075
     * @tc.desc Verify at(3) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const atValue091 = a.at(3);
      expect(atValue091).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0760
     * @tc.name testFloat32ArrayIntegrationOne076
     * @tc.desc Verify at(100) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const atValue092 = a.at(100);
      expect(atValue092).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0770
     * @tc.name testFloat32ArrayIntegrationOne077
     * @tc.desc Verify with(0, 5.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const r = a.with(0, 5.0);
      const element093 = r.$_get(0);
      expect(element093).assertEqual(5.0);
      const element093Part2 = a.$_get(0);
      expect(element093Part2).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0780
     * @tc.name testFloat32ArrayIntegrationOne078
     * @tc.desc Verify with(2, 7.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const r = a.with(2, 7.0);
      const element094 = r.$_get(2);
      expect(element094).assertEqual(7.0);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0790
     * @tc.name testFloat32ArrayIntegrationOne079
     * @tc.desc Verify with(3, 1.0) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.with(3, 1.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0800
     * @tc.name testFloat32ArrayIntegrationOne080
     * @tc.desc Verify with(-1, 9.0) returns correct element at last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const b = a.with(-1, 9.0);
      expect(b[0]).assertEqual(1.0);
      expect(b[1]).assertEqual(2.0);
      expect(b[2]).assertEqual(9.0);
      expect(b.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0810
     * @tc.name testFloat32ArrayIntegrationOne081
     * @tc.desc Verify with(-4, 1.0) -length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.with(-4, 1.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0820
     * @tc.name testFloat32ArrayIntegrationOne082
     * @tc.desc Verify with(100, 1.0) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      try {
        a.with(100, 1.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0830
     * @tc.name testFloat32ArrayIntegrationOne083
     * @tc.desc Verify with(0, NaN) NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const r = a.with(0, Number.NaN);
      const element099 = r.$_get(0);
      expect(element099).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0840
     * @tc.name testFloat32ArrayIntegrationOne084
     * @tc.desc Verify with(0, 16777217) 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const r = a.with(0, 16777217);
      const element100 = r.$_get(0);
      expect(element100).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0850
     * @tc.name testFloat32ArrayIntegrationOne085
     * @tc.desc Verify set(Array, 0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      const src: Array<number> = [1.0, 2.0, 3.0];
      a.set(src, 0);
      const element101 = a.$_get(2);
      expect(element101).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0860
     * @tc.name testFloat32ArrayIntegrationOne086
     * @tc.desc Verify set(Float32Array, 0) Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      const src = new Float32Array([4.0, 5.0, 6.0]);
      a.set(src, 0);
      const element102 = a.$_get(1);
      expect(element102).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0870
     * @tc.name testFloat32ArrayIntegrationOne087
     * @tc.desc Verify set(Array, 1) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(4);
      const src: Array<number> = [7.0, 8.0];
      a.set(src, 1);
      const element103 = a.$_get(1);
      expect(element103).assertEqual(7.0);
      const element103Part2 = a.$_get(2);
      expect(element103Part2).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0880
     * @tc.name testFloat32ArrayIntegrationOne088
     * @tc.desc Verify set(src, undefined) undefined 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      const src: Array<number> = [1.0, 2.0, 3.0];
      a.set(src, undefined);
      const element104 = a.$_get(0);
      expect(element104).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0890
     * @tc.name testFloat32ArrayIntegrationOne089
     * @tc.desc Verify set RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      const src: Array<number> = [1.0, 2.0];
      try {
        a.set(src, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0900
     * @tc.name testFloat32ArrayIntegrationOne090
     * @tc.desc Verify set RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      const src: Array<number> = [1.0, 2.0, 3.0, 4.0];
      try {
        a.set(src, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0910
     * @tc.name testFloat32ArrayIntegrationOne091
     * @tc.desc Verify fill(5.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      a.fill(5.0);
      const element107 = a.$_get(0);
      expect(element107).assertEqual(5.0);
      const element107Part2 = a.$_get(2);
      expect(element107Part2).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0920
     * @tc.name testFloat32ArrayIntegrationOne092
     * @tc.desc Verify fill(5.0, 1) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      a.fill(5.0, 1);
      const element108 = a.$_get(0);
      expect(element108).assertEqual(0);
      const element108Part2 = a.$_get(1);
      expect(element108Part2).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0930
     * @tc.name testFloat32ArrayIntegrationOne093
     * @tc.desc Verify fill(5.0, 1, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      a.fill(5.0, 1, 2);
      const element109 = a.$_get(1);
      expect(element109).assertEqual(5.0);
      const element109Part2 = a.$_get(2);
      expect(element109Part2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0940
     * @tc.name testFloat32ArrayIntegrationOne094
     * @tc.desc Verify fill(5.0, undefined, 2) start end 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      a.fill(5.0, undefined, 2);
      const element110 = a.$_get(0);
      expect(element110).assertEqual(5.0);
      const element110Part2 = a.$_get(2);
      expect(element110Part2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0950
     * @tc.name testFloat32ArrayIntegrationOne095
     * @tc.desc Verify fill(5.0, 2, 1) start end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      a.fill(5.0, 2, 1);
      const element111 = a.$_get(0);
      expect(element111).assertEqual(0);
      const element111Part2 = a.$_get(2);
      expect(element111Part2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0960
     * @tc.name testFloat32ArrayIntegrationOne096
     * @tc.desc Verify fill(NaN) NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(2);
      a.fill(Number.NaN);
      const element112 = a.$_get(0);
      expect(element112).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0970
     * @tc.name testFloat32ArrayIntegrationOne097
     * @tc.desc Verify copyWithin(0, 1) 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      a.copyWithin(0, 1);
      const element113 = a.$_get(0);
      expect(element113).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0980
     * @tc.name testFloat32ArrayIntegrationOne098
     * @tc.desc Verify copyWithin(0, 1, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      a.copyWithin(0, 1, 2);
      const element114 = a.$_get(0);
      expect(element114).assertEqual(2.0);
      const element114Part2 = a.$_get(1);
      expect(element114Part2).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_0990
     * @tc.name testFloat32ArrayIntegrationOne099
     * @tc.desc Verify copyWithin(1, 0, 2) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      a.copyWithin(1, 0, 2);
      const element115 = a.$_get(1);
      expect(element115).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_1000
     * @tc.name testFloat32ArrayIntegrationOne100
     * @tc.desc Verify copyWithin(-1, 0) target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      a.copyWithin(-1, 0);
      const element116 = a.$_get(2);
      expect(element116).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_1010
     * @tc.name testFloat32ArrayIntegrationOne101
     * @tc.desc Verify valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0]);
      const v = a.valueOf();
      const element117 = v.$_get(1);
      expect(element117).assertEqual(2.0);
      expect(v.length).assertEqual(2);
      expect(v === a).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_1020
     * @tc.name testFloat32ArrayIntegrationOne102
     * @tc.desc Verify Float32Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of();
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_1030
     * @tc.name testFloat32ArrayIntegrationOne103
     * @tc.desc Verify Float32Array.of(1.0, 2.0, 3.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float32Array.of(1.0, 2.0, 3.0);
      expect(a.length).assertEqual(3);
      const element119 = a.$_get(2);
      expect(element119).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_ONE_1040
     * @tc.name testFloat32ArrayIntegrationOne104
     * @tc.desc Verify slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationOne104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([1.0, 2.0, 3.0]);
      const s = a.slice();
      expect(s.length).assertEqual(3);
      const element120 = s.$_get(0);
      expect(element120).assertEqual(1.0);
    });

  });
}
