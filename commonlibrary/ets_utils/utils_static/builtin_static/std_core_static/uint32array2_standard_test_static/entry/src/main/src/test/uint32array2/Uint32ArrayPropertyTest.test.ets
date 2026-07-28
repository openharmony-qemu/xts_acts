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

export default function uint32ArrayPropertyOneTest(): void {
  describe('Uint32ArrayPropertyOneTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_0100
     * @tc.name testUint32ArrayPropertyOne001
     * @tc.desc Verify arity0 new Uint32Array() length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new Uint32Array();
      expect(v.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_0200
     * @tc.name testUint32ArrayPropertyOne002
     * @tc.desc Verify arity0 BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new Uint32Array();
      expect(v.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_0300
     * @tc.name testUint32ArrayPropertyOne003
     * @tc.desc Verify arity0 name Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new Uint32Array();
      expect(v.name).assertEqual('Uint32Array');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_0400
     * @tc.name testUint32ArrayPropertyOne004
     * @tc.desc Verify arity1 length byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new Uint32Array(5);
      expect(v.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_0500
     * @tc.name testUint32ArrayPropertyOne005
     * @tc.desc Verify arity1 length buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new Uint32Array(5);
      expect(v.buffer.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_0600
     * @tc.name testUint32ArrayPropertyOne006
     * @tc.desc Verify arity1 typedArray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Uint32Array.of(1, 2, 3);
      let v = new Uint32Array(src);
      expect(v.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_0700
     * @tc.name testUint32ArrayPropertyOne007
     * @tc.desc Verify arity1 typedArray byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Uint32Array.of(1, 2, 3);
      let v = new Uint32Array(src);
      expect(v.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_0800
     * @tc.name testUint32ArrayPropertyOne008
     * @tc.desc Verify arity1 typedArray byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Uint32Array.of(1, 2, 3);
      let v = new Uint32Array(src);
      expect(v.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_0900
     * @tc.name testUint32ArrayPropertyOne009
     * @tc.desc Verify arity1 typedArray buffer 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Uint32Array.of(1, 2, 3);
      let v = new Uint32Array(src);
      expect(v.buffer.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_1000
     * @tc.name testUint32ArrayPropertyOne010
     * @tc.desc Verify arity1 buffer length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let v = new Uint32Array(buf);
      expect(v.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_1100
     * @tc.name testUint32ArrayPropertyOne011
     * @tc.desc Verify arity1 buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let v = new Uint32Array(buf);
      expect(v.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_1200
     * @tc.name testUint32ArrayPropertyOne012
     * @tc.desc Verify arity1 buffer byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let v = new Uint32Array(buf);
      expect(v.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_1300
     * @tc.name testUint32ArrayPropertyOne013
     * @tc.desc Verify arity1 buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let v = new Uint32Array(buf);
      let same: boolean = v.buffer === buf;
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_1400
     * @tc.name testUint32ArrayPropertyOne014
     * @tc.desc Verify arity2 new Uint32Array(buf,4) length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let v = new Uint32Array(buf, 4);
      expect(v.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_1500
     * @tc.name testUint32ArrayPropertyOne015
     * @tc.desc Verify arity2 new Uint32Array(buf,4) byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let v = new Uint32Array(buf, 4);
      expect(v.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_1600
     * @tc.name testUint32ArrayPropertyOne016
     * @tc.desc Verify arity2 byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let v = new Uint32Array(buf, 4);
      expect(v.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_1700
     * @tc.name testUint32ArrayPropertyOne017
     * @tc.desc Verify arity2 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let v = new Uint32Array(buf, 4);
      const sameBuffer: boolean = v.buffer === buf;
      expect(sameBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_1800
     * @tc.name testUint32ArrayPropertyOne018
     * @tc.desc Verify arity3 new Uint32Array(buf,4,2) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let v = new Uint32Array(buf, 4, 2);
      expect(v.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_1900
     * @tc.name testUint32ArrayPropertyOne019
     * @tc.desc Verify arity3 new Uint32Array(buf,4,2) byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let v = new Uint32Array(buf, 4, 2);
      expect(v.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_2000
     * @tc.name testUint32ArrayPropertyOne020
     * @tc.desc Verify arity3 byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let v = new Uint32Array(buf, 4, 2);
      expect(v.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_2100
     * @tc.name testUint32ArrayPropertyOne021
     * @tc.desc Verify arity3 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let v = new Uint32Array(buf, 4, 2);
      const sameBuffer: boolean = v.buffer === buf;
      expect(sameBuffer).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_2200
     * @tc.name testUint32ArrayPropertyOne022
     * @tc.desc Verify length 1 byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new Uint32Array(1);
      expect(v.byteLength).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_2300
     * @tc.name testUint32ArrayPropertyOne023
     * @tc.desc Verify length 65535 byteLength 262140
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new Uint32Array(65535);
      expect(v.byteLength).assertEqual(262140);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_2400
     * @tc.name testUint32ArrayPropertyOne024
     * @tc.desc Verify length -1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint32Array(-1);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_2500
     * @tc.name testUint32ArrayPropertyOne025
     * @tc.desc Verify length 2147483647 int32 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint32Array(2147483647);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_2600
     * @tc.name testUint32ArrayPropertyOne026
     * @tc.desc Verify length 0o100 (64) byteLength 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new Uint32Array(0o100);
      expect(v.byteLength).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_2700
     * @tc.name testUint32ArrayPropertyOne027
     * @tc.desc Verify length 0b100 (4) byteLength 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new Uint32Array(0b100);
      expect(v.byteLength).assertEqual(16);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_2800
     * @tc.name testUint32ArrayPropertyOne028
     * @tc.desc Verify length 0o10 (8) length 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new Uint32Array(0o10);
      expect(v.length).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_2900
     * @tc.name testUint32ArrayPropertyOne029
     * @tc.desc Verify byteOffset 0 byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(20);
      let v = new Uint32Array(buf, 0, 3);
      expect(v.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_3000
     * @tc.name testUint32ArrayPropertyOne030
     * @tc.desc Verify byteOffset 4 byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(20);
      let v = new Uint32Array(buf, 4, 3);
      expect(v.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_3100
     * @tc.name testUint32ArrayPropertyOne031
     * @tc.desc Verify byteOffset 12 byteOffset 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(20);
      let v = new Uint32Array(buf, 12, 2);
      expect(v.byteOffset).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_3200
     * @tc.name testUint32ArrayPropertyOne032
     * @tc.desc Verify byteOffset 0 length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(20);
      let v = new Uint32Array(buf, 0);
      expect(v.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_3300
     * @tc.name testUint32ArrayPropertyOne033
     * @tc.desc Verify byteOffset 4 length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(20);
      let v = new Uint32Array(buf, 4);
      expect(v.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_3400
     * @tc.name testUint32ArrayPropertyOne034
     * @tc.desc Verify byteOffset 8 length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(20);
      let v = new Uint32Array(buf, 8);
      expect(v.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_3500
     * @tc.name testUint32ArrayPropertyOne035
     * @tc.desc Verify byteOffset 16 length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(20);
      let v = new Uint32Array(buf, 16);
      expect(v.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_3600
     * @tc.name testUint32ArrayPropertyOne036
     * @tc.desc Verify byteOffset 0 byteLength 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(20);
      let v = new Uint32Array(buf, 0);
      expect(v.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_3700
     * @tc.name testUint32ArrayPropertyOne037
     * @tc.desc Verify byteOffset 4 byteLength 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(20);
      let v = new Uint32Array(buf, 4);
      expect(v.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_3800
     * @tc.name testUint32ArrayPropertyOne038
     * @tc.desc Verify byteOffset 1 4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(20);
      try {
        new Uint32Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_3900
     * @tc.name testUint32ArrayPropertyOne039
     * @tc.desc Verify byteOffset -1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(20);
      try {
        new Uint32Array(buf, -1);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_4000
     * @tc.name testUint32ArrayPropertyOne040
     * @tc.desc Verify byteOffset 0x8 (8) byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(20);
      let v = new Uint32Array(buf, 0x8, 2);
      expect(v.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_4100
     * @tc.name testUint32ArrayPropertyOne041
     * @tc.desc Verify byteOffset 16 length 2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(20);
      try {
        new Uint32Array(buf, 16, 2);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_4200
     * @tc.name testUint32ArrayPropertyOne042
     * @tc.desc Verify byteOffset 12 length 2 length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(20);
      let v = new Uint32Array(buf, 12, 2);
      expect(v.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_4300
     * @tc.name testUint32ArrayPropertyOne043
     * @tc.desc Verify byteOffset 16 length 1 length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(20);
      let v = new Uint32Array(buf, 16, 1);
      expect(v.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_4400
     * @tc.name testUint32ArrayPropertyOne044
     * @tc.desc Verify byteOffset 24 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(20);
      try {
        new Uint32Array(buf, 24);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_4500
     * @tc.name testUint32ArrayPropertyOne045
     * @tc.desc Verify buffer 4 length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let v = new Uint32Array(buf);
      expect(v.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_4600
     * @tc.name testUint32ArrayPropertyOne046
     * @tc.desc Verify buffer 1024 length 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1024);
      let v = new Uint32Array(buf);
      expect(v.length).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_4700
     * @tc.name testUint32ArrayPropertyOne047
     * @tc.desc Verify buffer 5 4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(5);
      try {
        new Uint32Array(buf);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_4800
     * @tc.name testUint32ArrayPropertyOne048
     * @tc.desc Verify source 1 typedArray length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Uint32Array.of(7);
      let v = new Uint32Array(src);
      expect(v.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_4900
     * @tc.name testUint32ArrayPropertyOne049
     * @tc.desc Verify source 1000 length 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Uint32Array(1000);
      let v = new Uint32Array(src);
      expect(v.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_5000
     * @tc.name testUint32ArrayPropertyOne050
     * @tc.desc Verify source uint32 0 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Uint32Array.of(4294967295, 0, 4294967295);
      let v = new Uint32Array(src);
      expect(v.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_5100
     * @tc.name testUint32ArrayPropertyOne051
     * @tc.desc Verify source typedArray byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Uint32Array.of(1, 2);
      let v = new Uint32Array(src);
      expect(v.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_5200
     * @tc.name testUint32ArrayPropertyOne052
     * @tc.desc Verify typedArray constructor creates independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = Uint32Array.of(1, 2, 3);
      let v = new Uint32Array(src);
      let same: boolean = v.buffer === src.buffer;
      expect(same).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_PROPERTY_5300
     * @tc.name testUint32ArrayPropertyOne053
     * @tc.desc Verify subarray constructor resets byteOffset to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayPropertyOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = Uint32Array.of(10, 20, 30, 40, 50);
      let view = base.subarray(1, 4);
      let v = new Uint32Array(view);
      expect(v.length).assertEqual(3);
      expect(v.byteOffset).assertEqual(0);
    });

  });
}
