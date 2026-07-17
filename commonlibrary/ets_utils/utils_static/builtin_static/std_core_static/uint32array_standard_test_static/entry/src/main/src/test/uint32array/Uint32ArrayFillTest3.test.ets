'use static'
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

export default function uint32ArrayFillTest3(): void {
  describe('Uint32ArrayFillTest3', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_0100
     * @tc.name testUint32ArrayFillPartThree001
     * @tc.desc Verify number=0 E
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      const v: number = 0;
      a.fill(v);
      expect(a[0]).assertEqual(0);
      expect(a[2]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_0200
     * @tc.name testUint32ArrayFillPartThree002
     * @tc.desc Verify number=0 number E
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      const b = new Uint32Array(3);
      const v: number = 0;
      a.fill(v);
      b.fill(0);
      expect(a[0]).assertEqual(b[0]);
      expect(a[2]).assertEqual(b[2]);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_0300
     * @tc.name testUint32ArrayFillPartThree003
     * @tc.desc Verify number=1 E
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      const v: number = 1;
      a.fill(v);
      expect(a[0]).assertEqual(1);
      expect(a[2]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_0400
     * @tc.name testUint32ArrayFillPartThree004
     * @tc.desc Verify number=1 number E
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      const b = new Uint32Array(3);
      const v: number = 1;
      a.fill(v);
      b.fill(1);
      expect(a[1]).assertEqual(b[1]);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_0500
     * @tc.name testUint32ArrayFillPartThree005
     * @tc.desc Verify number=127 number E
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(2);
      const v: number = 127;
      a.fill(v);
      expect(a[0]).assertEqual(127);
      expect(a[1]).assertEqual(127);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_0600
     * @tc.name testUint32ArrayFillPartThree006
     * @tc.desc Verify number=-1 E 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(2);
      const v: number = -1;
      a.fill(v);
      expect(a[0]).assertEqual(4294967295);
      expect(a[1]).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_0700
     * @tc.name testUint32ArrayFillPartThree007
     * @tc.desc Verify number=-128 number E 4294967168
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(2);
      const v: number = -128;
      a.fill(v);
      expect(a[0]).assertEqual(4294967168);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_0800
     * @tc.name testUint32ArrayFillPartThree008
     * @tc.desc Verify number=100 E
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      const v: number = 100;
      a.fill(v);
      expect(a[1]).assertEqual(100);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_0900
     * @tc.name testUint32ArrayFillPartThree009
     * @tc.desc Verify value=50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(4);
      const b = new Uint32Array(4);
      const v: number = 50;
      a.fill(v);
      b.fill(50);
      expect(a[2]).assertEqual(b[2]);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_1000
     * @tc.name testUint32ArrayFillPartThree010
     * @tc.desc Verify number=255 number number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      a.fill(255);
      expect(a[0]).assertEqual(255);
      expect(a[2]).assertEqual(255);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_1100
     * @tc.name testUint32ArrayFillPartThree011
     * @tc.desc Verify number=200 number number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      a.fill(200);
      expect(a[1]).assertEqual(200);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_1200
     * @tc.name testUint32ArrayFillPartThree012
     * @tc.desc Verify number=256 number number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(2);
      a.fill(256);
      expect(a[0]).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_1300
     * @tc.name testUint32ArrayFillPartThree013
     * @tc.desc Verify number=4294967295 uint32 number E
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(2);
      a.fill(4294967295);
      expect(a[0]).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_1400
     * @tc.name testUint32ArrayFillPartThree014
     * @tc.desc Verify number 5 number 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      const b = new Uint32Array(3);
      const bv: number = 5;
      const nv: number = 5;
      a.fill(bv);
      b.fill(nv);
      expect(a[1]).assertEqual(b[1]);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_1500
     * @tc.name testUint32ArrayFillPartThree015
     * @tc.desc Verify number 10 20 E
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(2);
      let v: number = 10;
      a.fill(v);
      v = 20;
      const b = new Uint32Array(2);
      b.fill(v);
      expect(a[0]).assertEqual(10);
      expect(b[0]).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_1600
     * @tc.name testUint32ArrayFillPartThree016
     * @tc.desc Verify number=2147483648 int32 +1 number E
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(2);
      a.fill(2147483648);
      expect(a[0]).assertEqual(2147483648);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_1700
     * @tc.name testUint32ArrayFillPartThree017
     * @tc.desc Verify number fill(value) start/end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      a.fill(7);
      expect(a[0]).assertEqual(7);
      expect(a[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_1800
     * @tc.name testUint32ArrayFillPartThree018
     * @tc.desc Verify number fill(value,1) end [1..length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      a.fill(9, 1);
      expect(a[0]).assertEqual(0);
      expect(a[1]).assertEqual(9);
      expect(a[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_1900
     * @tc.name testUint32ArrayFillPartThree019
     * @tc.desc Verify fill(value,1) end value=9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      const b = new Uint32Array(3);
      const v: number = 9;
      a.fill(v, 1);
      b.fill(9, 1);
      expect(a[2]).assertEqual(b[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_2000
     * @tc.name testUint32ArrayFillPartThree020
     * @tc.desc Verify number fill(value,0,length) fill(value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      const b = new Uint32Array(3);
      a.fill(4);
      b.fill(4, 0, 3);
      expect(a[0]).assertEqual(b[0]);
      expect(a[2]).assertEqual(b[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_2100
     * @tc.name testUint32ArrayFillPartThree021
     * @tc.desc Verify fill(value,0,2) value=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      const b = new Uint32Array(3);
      const v: number = 4;
      a.fill(v, 0, 2);
      b.fill(4, 0, 2);
      expect(a[1]).assertEqual(b[1]);
      expect(a[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_2200
     * @tc.name testUint32ArrayFillPartThree022
     * @tc.desc Verify number fill(value,0) end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      const b = new Uint32Array(3);
      a.fill(6, 0);
      b.fill(6, 0, 3);
      expect(a[2]).assertEqual(b[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_2300
     * @tc.name testUint32ArrayFillPartThree023
     * @tc.desc Verify (0,length) value=11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(4);
      const b = new Uint32Array(4);
      const v: number = 11;
      a.fill(v);
      b.fill(11, 0, 4);
      expect(a[3]).assertEqual(b[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_2400
     * @tc.name testUint32ArrayFillPartThree024
     * @tc.desc Verify E length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      const v: number = 42;
      a.fill(v);
      expect(a[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_2500
     * @tc.name testUint32ArrayFillPartThree025
     * @tc.desc Verify number length=0 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(0);
      a.fill(5);
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_2600
     * @tc.name testUint32ArrayFillPartThree026
     * @tc.desc Verify fill result and source share underlying buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(2);
      const v: number = 5;
      const r = a.fill(v);
      r[0] = 99;
      expect(a[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_2700
     * @tc.name testUint32ArrayFillPartThree027
     * @tc.desc Verify chained fill result and source share underlying buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(4);
      const v: number = 1;
      const r = a.fill(v, 0, 2).fill(2, 2, 4);
      r[0] = 77;
      expect(a[0]).assertEqual(77);
      expect(a[3]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_2800
     * @tc.name testUint32ArrayFillPartThree028
     * @tc.desc Verify number length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(5);
      const r = a.fill(8);
      expect(r.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_2900
     * @tc.name testUint32ArrayFillPartThree029
     * @tc.desc Verify number byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(5);
      const r = a.fill(8);
      expect(r.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_3000
     * @tc.name testUint32ArrayFillPartThree030
     * @tc.desc Verify number buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      a.fill(8);
      const fresh = new Uint32Array(a.buffer, 0, 3);
      expect(fresh[0]).assertEqual(8);
      expect(fresh[2]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_3100
     * @tc.name testUint32ArrayFillPartThree031
     * @tc.desc Verify number byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ab = new ArrayBuffer(16);
      const a = new Uint32Array(ab, 4, 2);
      const r = a.fill(3);
      expect(r.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_3200
     * @tc.name testUint32ArrayFillPartThree032
     * @tc.desc Verify E toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      const v: number = 5;
      a.fill(v);
      expect(a.toString()).assertEqual('5,5,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_3300
     * @tc.name testUint32ArrayFillPartThree033
     * @tc.desc Verify number toString E
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      const b = new Uint32Array(3);
      const v: number = 5;
      a.fill(v);
      b.fill(5);
      expect(a.toString()).assertEqual(b.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_3400
     * @tc.name testUint32ArrayFillPartThree034
     * @tc.desc Verify E join(',')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      const v: number = 5;
      a.fill(v);
      expect(a.join(',')).assertEqual('5,5,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_3500
     * @tc.name testUint32ArrayFillPartThree035
     * @tc.desc Verify number join(',') E
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      const b = new Uint32Array(3);
      const v: number = 5;
      a.fill(v);
      b.fill(5);
      expect(a.join(',')).assertEqual(b.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_3600
     * @tc.name testUint32ArrayFillPartThree036
     * @tc.desc Verify E join('|')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      const v: number = 5;
      a.fill(v);
      expect(a.join('|')).assertEqual('5|5|5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_3700
     * @tc.name testUint32ArrayFillPartThree037
     * @tc.desc Verify number join('|') E
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      const b = new Uint32Array(3);
      const v: number = 5;
      a.fill(v);
      b.fill(5);
      expect(a.join('|')).assertEqual(b.join('|'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_3800
     * @tc.name testUint32ArrayFillPartThree038
     * @tc.desc Verify E join('')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      const v: number = 5;
      a.fill(v);
      expect(a.join('')).assertEqual('555');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_3900
     * @tc.name testUint32ArrayFillPartThree039
     * @tc.desc Verify number join('') E
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      const b = new Uint32Array(3);
      const v: number = 5;
      a.fill(v);
      b.fill(5);
      expect(a.join('')).assertEqual(b.join(''));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_4000
     * @tc.name testUint32ArrayFillPartThree040
     * @tc.desc Verify fill(7) toString length=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(4);
      const b = new Uint32Array(4);
      const v: number = 7;
      a.fill(v);
      b.fill(7);
      expect(a.toString()).assertEqual(b.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_4100
     * @tc.name testUint32ArrayFillPartThree041
     * @tc.desc Verify number refA refB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      const b = a;
      a.fill(5);
      expect(b[0]).assertEqual(5);
      expect(b[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_4200
     * @tc.name testUint32ArrayFillPartThree042
     * @tc.desc Verify E number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(4);
      const b = a;
      const v: number = 1;
      a.fill(v, 0, 2);
      b.fill(2, 2, 4);
      expect(a[0]).assertEqual(1);
      expect(a[3]).assertEqual(2);
      expect(b[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_4300
     * @tc.name testUint32ArrayFillPartThree043
     * @tc.desc Verify number subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Uint32Array(6);
      const view = base.subarray(2, 5);
      view.fill(9);
      expect(base[2]).assertEqual(9);
      expect(base[4]).assertEqual(9);
      expect(base[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_4400
     * @tc.name testUint32ArrayFillPartThree044
     * @tc.desc Verify E number buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Uint32Array(6);
      const view = base.subarray(1, 5);
      const v: number = 3;
      view.fill(v, 0, 2);
      view.fill(7, 2, 4);
      expect(base[1]).assertEqual(3);
      expect(base[4]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_4500
     * @tc.name testUint32ArrayFillPartThree045
     * @tc.desc Verify number subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Uint32Array(5);
      const view = base.subarray(1, 4);
      base.fill(8, 1, 4);
      expect(view[0]).assertEqual(8);
      expect(view[2]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_4600
     * @tc.name testUint32ArrayFillPartThree046
     * @tc.desc Verify buffer number view1 view2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Uint32Array(6);
      const firstView = base.subarray(0, 3);
      const secondView = base.subarray(0, 3);
      firstView.fill(4);
      expect(secondView[0]).assertEqual(4);
      expect(secondView[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_4700
     * @tc.name testUint32ArrayFillPartThree047
     * @tc.desc Verify buffer view1 E view2 number buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Uint32Array(6);
      const v1 = base.subarray(0, 3);
      const v2 = base.subarray(0, 3);
      const bv: number = 1;
      v1.fill(bv, 0, 2);
      v2.fill(6, 2, 3);
      expect(base[0]).assertEqual(1);
      expect(base[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_4800
     * @tc.name testUint32ArrayFillPartThree048
     * @tc.desc Verify number start>end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      a[0] = 1;
      a[1] = 2;
      a[2] = 3;
      const r = a.fill(5, 2, 1);
      r[2] = 99;
      expect(a[2]).assertEqual(99);
      expect(a[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_4900
     * @tc.name testUint32ArrayFillPartThree049
     * @tc.desc Verify number start>end no-op length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(4);
      a.fill(5, 3, 1);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_5000
     * @tc.name testUint32ArrayFillPartThree050
     * @tc.desc Verify number start>end no-op byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(4);
      const before = a.byteLength;
      a.fill(5, 3, 1);
      expect(a.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_5100
     * @tc.name testUint32ArrayFillPartThree051
     * @tc.desc Verify number start length no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(3);
      a.fill(5, 5, 8);
      expect(a[0]).assertEqual(0);
      expect(a[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_5200
     * @tc.name testUint32ArrayFillPartThree052
     * @tc.desc Verify start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(4);
      const b = new Uint32Array(4);
      const v: number = 5;
      a.fill(v, -2);
      b.fill(5, -2);
      expect(a[2]).assertEqual(5);
      expect(a[3]).assertEqual(b[3]);
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_5300
     * @tc.name testUint32ArrayFillPartThree053
     * @tc.desc Verify end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(5);
      const b = new Uint32Array(5);
      const v: number = 7;
      a.fill(v, 0, -1);
      b.fill(7, 0, -1);
      expect(a[3]).assertEqual(7);
      expect(a[4]).assertEqual(0);
      expect(a[3]).assertEqual(b[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_5400
     * @tc.name testUint32ArrayFillPartThree054
     * @tc.desc Verify number=4294967296 0 number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(2);
      a.fill(4294967296);
      expect(a[0]).assertEqual(0);
      expect(a[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_5500
     * @tc.name testUint32ArrayFillPartThree055
     * @tc.desc Verify number=Number.NaN 0 number E
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(2);
      a.fill(Number.NaN);
      expect(a[0]).assertEqual(0);
      expect(a[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_5600
     * @tc.name testUint32ArrayFillPartThree056
     * @tc.desc Verify number=Number.POSITIVE_INFINITY 0 number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(2);
      a.fill(Number.POSITIVE_INFINITY);
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_5700
     * @tc.name testUint32ArrayFillPartThree057
     * @tc.desc Verify number=Number.NEGATIVE_INFINITY 0 number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(2);
      a.fill(Number.NEGATIVE_INFINITY);
      expect(a[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_5800
     * @tc.name testUint32ArrayFillPartThree058
     * @tc.desc Verify number=3.14 3 number E
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(2);
      a.fill(3.14);
      expect(a[0]).assertEqual(3);
      expect(a[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_5900
     * @tc.name testUint32ArrayFillPartThree059
     * @tc.desc Verify number=9007199254740991 uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.fill(9007199254740991);
      expect(a[0]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_6000
     * @tc.name testUint32ArrayFillPartThree060
     * @tc.desc Verify number=-2147483648 int32 number 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.fill(-2147483648);
      expect(a[0]).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_6100
     * @tc.name testUint32ArrayFillPartThree061
     * @tc.desc Verify number=2147483647 int32 number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.fill(2147483647);
      expect(a[0]).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_PARTTHREE_6200
     * @tc.name testUint32ArrayFillPartThree062
     * @tc.desc Verify number=65535 number uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillPartThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Uint32Array(1);
      a.fill(65535);
      expect(a[0]).assertEqual(65535);
    });

              });
}
