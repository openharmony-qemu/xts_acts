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

export default function Float32ArrayProperty1Test(): void {
  describe('Float32ArrayProperty1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_0100
     * @tc.name testFloat32ArrayPropertyOne001
     * @tc.desc Verify new Float32Array() has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_0200
     * @tc.name testFloat32ArrayPropertyOne002
     * @tc.desc Verify new Float32Array() has byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array();
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_0300
     * @tc.name testFloat32ArrayPropertyOne003
     * @tc.desc Verify new Float32Array() has byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array();
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_0400
     * @tc.name testFloat32ArrayPropertyOne004
     * @tc.desc Verify Float32Array.BYTES_PER_ELEMENT is 4 on default constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array();
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_0500
     * @tc.name testFloat32ArrayPropertyOne005
     * @tc.desc Verify new Float32Array() has constructor name Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array();
      expect(arr.name).assertEqual('Float32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_0600
     * @tc.name testFloat32ArrayPropertyOne006
     * @tc.desc Verify new Float32Array(number) creates array with given length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_0700
     * @tc.name testFloat32ArrayPropertyOne007
     * @tc.desc Verify 2(buffer,byteOffset) arity=2byteOffset4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf, 4);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_0800
     * @tc.name testFloat32ArrayPropertyOne008
     * @tc.desc Verify 3(buffer,byteOffset,length) arity=3length2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_0900
     * @tc.name testFloat32ArrayPropertyOne009
     * @tc.desc Verify length=1 byteLength4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array(1);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_1000
     * @tc.name testFloat32ArrayPropertyOne010
     * @tc.desc Verify length=2 byteLength8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array(2);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_1100
     * @tc.name testFloat32ArrayPropertyOne011
     * @tc.desc Verify length=0 byteLength0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_1200
     * @tc.name testFloat32ArrayPropertyOne012
     * @tc.desc Verify length=2.92 byteLength8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array(2.9);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_1300
     * @tc.name testFloat32ArrayPropertyOne013
     * @tc.desc Verify length=1.91 length1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array(1.9);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_1400
     * @tc.name testFloat32ArrayPropertyOne014
     * @tc.desc Verify length=3.0 length3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array(3.0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_1500
     * @tc.name testFloat32ArrayPropertyOne015
     * @tc.desc Verify length=2.52 length2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array(2.5);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_1600
     * @tc.name testFloat32ArrayPropertyOne016
     * @tc.desc Verify length=100 byteLength400
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array(100);
      expect(arr.byteLength).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_1700
     * @tc.name testFloat32ArrayPropertyOne017
     * @tc.desc Verify length=1024 byteLength4096
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array(1024);
      expect(arr.byteLength).assertEqual(4096);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_1800
     * @tc.name testFloat32ArrayPropertyOne018
     * @tc.desc Verify length=0x10(16) length16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array(0x10);
      expect(arr.length).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_1900
     * @tc.name testFloat32ArrayPropertyOne019
     * @tc.desc Verify length=0o10(8) length8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array(0o10);
      expect(arr.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_2000
     * @tc.name testFloat32ArrayPropertyOne020
     * @tc.desc Verify length=0b100(4) length4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array(0b100);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_2100
     * @tc.name testFloat32ArrayPropertyOne021
     * @tc.desc Verify length=1e1(10) length10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array(1e1);
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_2200
     * @tc.name testFloat32ArrayPropertyOne022
     * @tc.desc Verify length=-0 length0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array(-0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_2300
     * @tc.name testFloat32ArrayPropertyOne023
     * @tc.desc Verify length=NaN ToIndex0 length0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array(NaN);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_2400
     * @tc.name testFloat32ArrayPropertyOne024
     * @tc.desc Verify constructor length=-1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      try {
        new Float32Array(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_2500
     * @tc.name testFloat32ArrayPropertyOne025
     * @tc.desc Verify constructor length=-2147483648 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      try {
        new Float32Array(-2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_2600
     * @tc.name testFloat32ArrayPropertyOne026
     * @tc.desc Verify constructor length=Infinity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      try {
        new Float32Array(Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_2700
     * @tc.name testFloat32ArrayPropertyOne027
     * @tc.desc Verify length=5 byteOffset0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array(5);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_2800
     * @tc.name testFloat32ArrayPropertyOne028
     * @tc.desc Verify length=6 buffer.byteLength24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array(6);
      expect(arr.buffer.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_2900
     * @tc.name testFloat32ArrayPropertyOne029
     * @tc.desc Verify length=9 byteLength===length*4=36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array(9);
      expect(arr.byteLength).assertEqual(36);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_3000
     * @tc.name testFloat32ArrayPropertyOne030
     * @tc.desc Verify [1.0] length1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array([1.0]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_3100
     * @tc.name testFloat32ArrayPropertyOne031
     * @tc.desc Verify [1.0,2.0] byteLength8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array([1.0, 2.0]);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_3200
     * @tc.name testFloat32ArrayPropertyOne032
     * @tc.desc Verify [] byteLength0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array([]);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_3300
     * @tc.name testFloat32ArrayPropertyOne033
     * @tc.desc Verify Float32.MAX(3.4028234663852886e+38) length1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array([3.4028234663852886e+38]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_3400
     * @tc.name testFloat32ArrayPropertyOne034
     * @tc.desc Verify NaN length1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array([NaN]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_3500
     * @tc.name testFloat32ArrayPropertyOne035
     * @tc.desc Verify Infinity length1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array([Infinity]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_3600
     * @tc.name testFloat32ArrayPropertyOne036
     * @tc.desc Verify -Infinity length1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array([-Infinity]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_3700
     * @tc.name testFloat32ArrayPropertyOne037
     * @tc.desc Verify -0 length1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array([-0]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_3800
     * @tc.name testFloat32ArrayPropertyOne038
     * @tc.desc Verify [NaN,Infinity,-Infinity] length3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array([NaN, Infinity, -Infinity]);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_3900
     * @tc.name testFloat32ArrayPropertyOne039
     * @tc.desc Verify (1.401298464324817e-45) length1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array([1.401298464324817e-45]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_4000
     * @tc.name testFloat32ArrayPropertyOne040
     * @tc.desc Verify (1.1754943508222875e-38) length1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array([1.1754943508222875e-38]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_4100
     * @tc.name testFloat32ArrayPropertyOne041
     * @tc.desc Verify [0.1,0.2] length2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array([0.1, 0.2]);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_4200
     * @tc.name testFloat32ArrayPropertyOne042
     * @tc.desc Verify 2^24(16777216) length1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array([16777216]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_4300
     * @tc.name testFloat32ArrayPropertyOne043
     * @tc.desc Verify (-3.4028234663852886e+38) length1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array([-3.4028234663852886e+38]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_4400
     * @tc.name testFloat32ArrayPropertyOne044
     * @tc.desc Verify (1.0e40) length1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array([1.0e40]);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_4500
     * @tc.name testFloat32ArrayPropertyOne045
     * @tc.desc Verify 100 length100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const src: number[] = [];
      for (let i = 0; i < 100; i++) {
        src.push(i * 1.0);
      }
      const arr = new Float32Array(src);
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_4600
     * @tc.name testFloat32ArrayPropertyOne046
     * @tc.desc Verify [1.0,2.0,3.0] byteOffset0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array([1.0, 2.0, 3.0]);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_4700
     * @tc.name testFloat32ArrayPropertyOne047
     * @tc.desc Verify [1.0,2.0,3.0] byteLength12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array([1.0, 2.0, 3.0]);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_4800
     * @tc.name testFloat32ArrayPropertyOne048
     * @tc.desc Verify [1.0,2.0,3.0,4.0,5.0] byteLength20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      expect(arr.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_4900
     * @tc.name testFloat32ArrayPropertyOne049
     * @tc.desc Verify [1.0] bufferArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array([1.0]);
      expect(arr.buffer.byteLength).assertEqual(4);
      expect(arr.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_5000
     * @tc.name testFloat32ArrayPropertyOne050
     * @tc.desc Verify 10 byteLength40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]);
      expect(arr.byteLength).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_5100
     * @tc.name testFloat32ArrayPropertyOne051
     * @tc.desc Verify Float32Array[1.0,2.0,3.0] length3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const src = new Float32Array([1.0, 2.0, 3.0]);
      const arr = new Float32Array(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_5200
     * @tc.name testFloat32ArrayPropertyOne052
     * @tc.desc Verify Float32Array[1.0,2.0] byteLength8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const src = new Float32Array([1.0, 2.0]);
      const arr = new Float32Array(src);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_5300
     * @tc.name testFloat32ArrayPropertyOne053
     * @tc.desc Verify Float32Array[1.0,2.0] byteOffset0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const src = new Float32Array([1.0, 2.0]);
      const arr = new Float32Array(src);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_5400
     * @tc.name testFloat32ArrayPropertyOne054
     * @tc.desc Verify Float32Array[1.0] bufferArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const src = new Float32Array([1.0]);
      const arr = new Float32Array(src);
      expect(arr.buffer.byteLength).assertEqual(4);
      expect(arr.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_5500
     * @tc.name testFloat32ArrayPropertyOne055
     * @tc.desc Verify Float32Array[1.0] buffer.byteLength4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const src = new Float32Array([1.0]);
      const arr = new Float32Array(src);
      expect(arr.buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_5600
     * @tc.name testFloat32ArrayPropertyOne056
     * @tc.desc Verify Int32Array[10,20,30] length3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const src = new Int32Array([10, 20, 30]);
      const arr = new Float32Array(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_5700
     * @tc.name testFloat32ArrayPropertyOne057
     * @tc.desc Verify Int8Array[1,2,3,4] length4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const src = new Int8Array([1, 2, 3, 4]);
      const arr = new Float32Array(src);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_5800
     * @tc.name testFloat32ArrayPropertyOne058
     * @tc.desc Verify Uint8Array[1,2] length2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const src = new Uint8Array([1, 2]);
      const arr = new Float32Array(src);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_5900
     * @tc.name testFloat32ArrayPropertyOne059
     * @tc.desc Verify Float32Array length0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const src = new Float32Array([]);
      const arr = new Float32Array(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_6000
     * @tc.name testFloat32ArrayPropertyOne060
     * @tc.desc Verify buffer 8 length2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_6100
     * @tc.name testFloat32ArrayPropertyOne061
     * @tc.desc Verify buffer 8 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_6200
     * @tc.name testFloat32ArrayPropertyOne062
     * @tc.desc Verify buffer 12 byteLength12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(12);
      const arr = new Float32Array(buf);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_6300
     * @tc.name testFloat32ArrayPropertyOne063
     * @tc.desc Verify buffer 4 byteLength4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(4);
      const arr = new Float32Array(buf);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_6400
     * @tc.name testFloat32ArrayPropertyOne064
     * @tc.desc Verify buffer 0 byteLength0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(0);
      const arr = new Float32Array(buf);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_6500
     * @tc.name testFloat32ArrayPropertyOne065
     * @tc.desc Verify buf8 offset4 view byteLength is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf, 4);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_6600
     * @tc.name testFloat32ArrayPropertyOne066
     * @tc.desc Verify buf12 offset4 length2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(12);
      const arr = new Float32Array(buf, 4);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_6700
     * @tc.name testFloat32ArrayPropertyOne067
     * @tc.desc Verify buf8 offset0 length2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf, 0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_6800
     * @tc.name testFloat32ArrayPropertyOne068
     * @tc.desc Verify buf12 offset4 byteLength8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(12);
      const arr = new Float32Array(buf, 4);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_6900
     * @tc.name testFloat32ArrayPropertyOne069
     * @tc.desc Verify buf8 offset4 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf, 4);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_7000
     * @tc.name testFloat32ArrayPropertyOne070
     * @tc.desc Verify buf16 offset4 byteOffset4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_7100
     * @tc.name testFloat32ArrayPropertyOne071
     * @tc.desc Verify buf16 offset8 length2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 8);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_7200
     * @tc.name testFloat32ArrayPropertyOne072
     * @tc.desc Verify buf16 offset8 byteOffset8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 8);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_7300
     * @tc.name testFloat32ArrayPropertyOne073
     * @tc.desc Verify buf8 offset2(4) RangeError()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_7400
     * @tc.name testFloat32ArrayPropertyOne074
     * @tc.desc Verify buf8 offset1 RangeError()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_7500
     * @tc.name testFloat32ArrayPropertyOne075
     * @tc.desc Verify buf8 offset-4 ()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, -4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_7600
     * @tc.name testFloat32ArrayPropertyOne076
     * @tc.desc Verify buf16 off0 len3 length3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 0, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_7700
     * @tc.name testFloat32ArrayPropertyOne077
     * @tc.desc Verify buf16 off0 len3 byteLength12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 0, 3);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_7800
     * @tc.name testFloat32ArrayPropertyOne078
     * @tc.desc Verify buf12 off4 len2 byteOffset4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(12);
      const arr = new Float32Array(buf, 4, 2);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_7900
     * @tc.name testFloat32ArrayPropertyOne079
     * @tc.desc Verify buf12 off4 len2 byteLength8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(12);
      const arr = new Float32Array(buf, 4, 2);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_8000
     * @tc.name testFloat32ArrayPropertyOne080
     * @tc.desc Verify buf8 off4 len1 length1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf, 4, 1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_8100
     * @tc.name testFloat32ArrayPropertyOne081
     * @tc.desc Verify buf16 off4 len0 length0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_8200
     * @tc.name testFloat32ArrayPropertyOne082
     * @tc.desc Verify buf16 off4 len0 byteLength0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_8300
     * @tc.name testFloat32ArrayPropertyOne083
     * @tc.desc Verify buf12 off8 len1 byteOffset8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(12);
      const arr = new Float32Array(buf, 8, 1);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_8400
     * @tc.name testFloat32ArrayPropertyOne084
     * @tc.desc Verify buf12 off4 len2 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(12);
      const arr = new Float32Array(buf, 4, 2);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_8500
     * @tc.name testFloat32ArrayPropertyOne085
     * @tc.desc Verify buf20 off4 len3 byteOffset4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(20);
      const arr = new Float32Array(buf, 4, 3);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_8600
     * @tc.name testFloat32ArrayPropertyOne086
     * @tc.desc Verify buf8 off0 len4(0+4*4>8) RangeError()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_8700
     * @tc.name testFloat32ArrayPropertyOne087
     * @tc.desc Verify Float32Array.of(1.0) length and byte length properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = Float32Array.of(1.0);
      expect(arr.length).assertEqual(1);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_8800
     * @tc.name testFloat32ArrayPropertyOne088
     * @tc.desc Verify Float32Array.of(1.0, 2.0, 3.0) byteLength12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = Float32Array.of(1.0, 2.0, 3.0);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_8900
     * @tc.name testFloat32ArrayPropertyOne089
     * @tc.desc Verify Float32Array.of(NaN, Infinity) length and byte length properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = Float32Array.of(NaN, Infinity);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(8);
      expect(arr.$_get(1)).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_9000
     * @tc.name testFloat32ArrayPropertyOne090
     * @tc.desc Verify Float32Array.of(1.0) byteOffset0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = Float32Array.of(1.0);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_9100
     * @tc.name testFloat32ArrayPropertyOne091
     * @tc.desc Verify Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0) byteLength20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      expect(arr.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_9200
     * @tc.name testFloat32ArrayPropertyOne092
     * @tc.desc Verify Float32Array.from([1.0,2.0,3.0]) length3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = Float32Array.from([1.0, 2.0, 3.0]);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_9300
     * @tc.name testFloat32ArrayPropertyOne093
     * @tc.desc Verify Float32Array.from([]) length0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = Float32Array.from([]);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_9400
     * @tc.name testFloat32ArrayPropertyOne094
     * @tc.desc Verify Float32Array.from(Int32Array) length2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const src = new Int32Array([10, 20]);
      const arr = Float32Array.from(src);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_9500
     * @tc.name testFloat32ArrayPropertyOne095
     * @tc.desc Verify Float32Array.from([1.0,2.0,3.0,4.0]) byteLength16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = Float32Array.from([1.0, 2.0, 3.0, 4.0]);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_9600
     * @tc.name testFloat32ArrayPropertyOne096
     * @tc.desc Verify Float32Array.from([1.0]) bufferArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = Float32Array.from([1.0]);
      expect(arr.buffer.byteLength).assertEqual(4);
      expect(arr.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_9700
     * @tc.name testFloat32ArrayPropertyOne097
     * @tc.desc Verify Float32Array.from byteLength24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = Float32Array.from([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      expect(arr.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_9800
     * @tc.name testFloat32ArrayPropertyOne098
     * @tc.desc Verify 0 buffer.byteLengthbyteLength0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array();
      expect(arr.buffer.byteLength).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_PROPERTY_ONE_9900
     * @tc.name testFloat32ArrayPropertyOne099
     * @tc.desc Verify [1.0,2.0,3.0] buffer.byteLength12()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayPropertyOne099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {      const arr = new Float32Array([1.0, 2.0, 3.0]);
      expect(arr.buffer.byteLength).assertEqual(12);
    });

  });
}
