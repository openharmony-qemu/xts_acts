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

export default function Uint8ArrayMapTest(): void {
  describe('Uint8ArrayMapTest', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_0100
     * @tc.name testUint8ArrayMap001
     * @tc.desc Verify map with single required parameter fn for basic execution
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v + 1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_0200
     * @tc.name testUint8ArrayMap002
     * @tc.desc Verify val parameter receives source array element value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([0]);
      let captured: number = 0;
      src.map((v: number, i: int, a: Uint8Array): number => { captured = v; return v; });
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_0300
     * @tc.name testUint8ArrayMap003
     * @tc.desc Verify val parameter receives source array element value 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1]);
      let captured: number = 0;
      src.map((v: number, i: int, a: Uint8Array): number => { captured = v; return v; });
      expect(captured).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_0400
     * @tc.name testUint8ArrayMap004
     * @tc.desc Verify val parameter receives source array element value 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([127]);
      let captured: number = 0;
      src.map((v: number, i: int, a: Uint8Array): number => { captured = v; return v; });
      expect(captured).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_0500
     * @tc.name testUint8ArrayMap005
     * @tc.desc Verify val parameter receives source array element value 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([128]);
      let captured: number = 0;
      src.map((v: number, i: int, a: Uint8Array): number => { captured = v; return v; });
      expect(captured).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_0600
     * @tc.name testUint8ArrayMap006
     * @tc.desc Verify val parameter receives source array element value 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([255]);
      let captured: number = 0;
      src.map((v: number, i: int, a: Uint8Array): number => { captured = v; return v; });
      expect(captured).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_0700
     * @tc.name testUint8ArrayMap007
     * @tc.desc Verify val parameter receives hexadecimal 0x80 source value 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([0x80]);
      let captured: number = 0;
      src.map((v: number, i: int, a: Uint8Array): number => { captured = v; return v; });
      expect(captured).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_0800
     * @tc.name testUint8ArrayMap008
     * @tc.desc Verify val parameter receives hexadecimal 0xFF source value 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([0xFF]);
      let captured: number = 0;
      src.map((v: number, i: int, a: Uint8Array): number => { captured = v; return v; });
      expect(captured).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_0900
     * @tc.name testUint8ArrayMap009
     * @tc.desc Verify val parameter receives overflow value 256 truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([256]);
      let captured: number = 0;
      src.map((v: number, i: int, a: Uint8Array): number => { captured = v; return v; });
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_1000
     * @tc.name testUint8ArrayMap010
     * @tc.desc Verify val parameter receives negative value -1 wrapped to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([-1]);
      let captured: number = 0;
      src.map((v: number, i: int, a: Uint8Array): number => { captured = v; return v; });
      expect(captured).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_1100
     * @tc.name testUint8ArrayMap011
     * @tc.desc Verify val parameter receives default zero value from new Uint8Array(3)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array(3);
      let captured: number = 0;
      src.map((v: number, i: int, a: Uint8Array): number => { captured = v; return v; });
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_1200
     * @tc.name testUint8ArrayMap012
     * @tc.desc Verify index parameter for first element is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([10, 20]);
      let captured: int = -1;
      src.map((v: number, i: int, a: Uint8Array): number => {
        if (captured === -1) { captured = i; }
        return v;
      });
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_1300
     * @tc.name testUint8ArrayMap013
     * @tc.desc Verify index parameter for second element is 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([10, 20]);
      let captured: int = -1;
      let callCount: int = 0;
      src.map((v: number, i: int, a: Uint8Array): number => {
        if (callCount === 1) { captured = i; }
        callCount++;
        return v;
      });
      expect(captured).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_1400
     * @tc.name testUint8ArrayMap014
     * @tc.desc Verify index increments from 0 to length-1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([0, 0, 0]);
      let indices: string = '';
      src.map((v: number, i: int, a: Uint8Array): number => { indices += i.toString(); return v; });
      expect(indices).assertEqual('012');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_1500
     * @tc.name testUint8ArrayMap015
     * @tc.desc Verify index parameter value used as calculation result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array(4);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => i);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_1600
     * @tc.name testUint8ArrayMap016
     * @tc.desc Verify index is 0 for single element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([42]);
      let captured: int = -1;
      src.map((v: number, i: int, a: Uint8Array): number => { captured = i; return v; });
      expect(captured).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_1700
     * @tc.name testUint8ArrayMap017
     * @tc.desc Verify index participates in calculation returning i*64
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array(4);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => i * 64);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(64);
      expect(result[2]).assertEqual(128);
      expect(result[3]).assertEqual(192);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_1800
     * @tc.name testUint8ArrayMap018
     * @tc.desc Verify array parameter is same reference as calling object
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2]);
      let sameRef: boolean = false;
      src.map((v: number, i: int, a: Uint8Array): number => { sameRef = (a === src); return v; });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_1900
     * @tc.name testUint8ArrayMap019
     * @tc.desc Verify array parameter length equals source array length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([10, 20, 30]);
      let arrLen: int = 0;
      src.map((v: number, i: int, a: Uint8Array): number => { arrLen = a.length; return v; });
      expect(arrLen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_2000
     * @tc.name testUint8ArrayMap020
     * @tc.desc Verify reading element value through array parameter matches val
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([77, 88]);
      let match: boolean = true;
      src.map((v: number, i: int, a: Uint8Array): number => {
        if (a[i] !== v) { match = false; }
        return v;
      });
      expect(match).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_2100
     * @tc.name testUint8ArrayMap021
     * @tc.desc Verify reading non-current index element through array parameter
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([10, 20, 30]);
      let sum: number = 0;
      src.map((v: number, i: int, a: Uint8Array): number => {
        if (i === 1) { sum = a[0] + a[2]; }
        return v;
      });
      expect(sum).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_2200
     * @tc.name testUint8ArrayMap022
     * @tc.desc Verify reading last element through array parameter
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([5, 10, 15]);
      let lastVal: number = 0;
      src.map((v: number, i: int, a: Uint8Array): number => {
        if (i === 0) { lastVal = a[a.length - 1]; }
        return v;
      });
      expect(lastVal).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_2300
     * @tc.name testUint8ArrayMap023
     * @tc.desc Verify callback returns 0, result array all zeros
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => 0);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_2400
     * @tc.name testUint8ArrayMap024
     * @tc.desc Verify callback returns 1, result array all ones
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => 1);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_2500
     * @tc.name testUint8ArrayMap025
     * @tc.desc Verify callback returns 127, result array all 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => 127);
      expect(result[0]).assertEqual(127);
      expect(result[1]).assertEqual(127);
      expect(result[2]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_2600
     * @tc.name testUint8ArrayMap026
     * @tc.desc Verify callback returns 128, result array all 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => 128);
      expect(result[0]).assertEqual(128);
      expect(result[1]).assertEqual(128);
      expect(result[2]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_2700
     * @tc.name testUint8ArrayMap027
     * @tc.desc Verify callback returns 255, result array all 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => 255);
      expect(result[0]).assertEqual(255);
      expect(result[1]).assertEqual(255);
      expect(result[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_2800
     * @tc.name testUint8ArrayMap028
     * @tc.desc Verify callback returns 256, truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => 256);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_2900
     * @tc.name testUint8ArrayMap029
     * @tc.desc Verify callback returns -1, wrapped to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => -1);
      expect(result[0]).assertEqual(255);
      expect(result[1]).assertEqual(255);
      expect(result[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_3000
     * @tc.name testUint8ArrayMap030
     * @tc.desc Verify callback returns -256, truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => -256);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_3100
     * @tc.name testUint8ArrayMap031
     * @tc.desc Verify callback returns -257, wrapped to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => -257);
      expect(result[0]).assertEqual(255);
      expect(result[1]).assertEqual(255);
      expect(result[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_3200
     * @tc.name testUint8ArrayMap032
     * @tc.desc Verify callback returns 1.0, truncated to 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => 1.0);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_3300
     * @tc.name testUint8ArrayMap033
     * @tc.desc Verify callback returns 1.9, truncated to 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => 1.9);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_3400
     * @tc.name testUint8ArrayMap034
     * @tc.desc Verify callback returns 255.9, truncated to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => 255.9);
      expect(result[0]).assertEqual(255);
      expect(result[1]).assertEqual(255);
      expect(result[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_3500
     * @tc.name testUint8ArrayMap035
     * @tc.desc Verify callback returns -0.5, truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => -0.5);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_3600
     * @tc.name testUint8ArrayMap036
     * @tc.desc Verify callback returns -1.5, wrapped to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => -1.5);
      expect(result[0]).assertEqual(255);
      expect(result[1]).assertEqual(255);
      expect(result[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_3700
     * @tc.name testUint8ArrayMap037
     * @tc.desc Verify callback returns NaN, truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => Number.NaN);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_3800
     * @tc.name testUint8ArrayMap038
     * @tc.desc Verify callback returns Infinity, truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => Number.POSITIVE_INFINITY);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_3900
     * @tc.name testUint8ArrayMap039
     * @tc.desc Verify callback returns -Infinity, truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => Number.NEGATIVE_INFINITY);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_4000
     * @tc.name testUint8ArrayMap040
     * @tc.desc Verify callback returns Number.MAX_VALUE, truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => Number.MAX_VALUE);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_4100
     * @tc.name testUint8ArrayMap041
     * @tc.desc Verify callback returns 257, truncated to 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => 257);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_4200
     * @tc.name testUint8ArrayMap042
     * @tc.desc Verify callback returns 512, truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => 512);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_4300
     * @tc.name testUint8ArrayMap043
     * @tc.desc Verify callback returns 1000, truncated to 232
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => 1000);
      expect(result[0]).assertEqual(232);
      expect(result[1]).assertEqual(232);
      expect(result[2]).assertEqual(232);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_4400
     * @tc.name testUint8ArrayMap044
     * @tc.desc Verify callback returns -512, truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => -512);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_4500
     * @tc.name testUint8ArrayMap045
     * @tc.desc Verify callback returns -1000, truncated to 24
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => -1000);
      expect(result[0]).assertEqual(24);
      expect(result[1]).assertEqual(24);
      expect(result[2]).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_4600
     * @tc.name testUint8ArrayMap046
     * @tc.desc Verify callback returns 65536, truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => 65536);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_4700
     * @tc.name testUint8ArrayMap047
     * @tc.desc Verify callback returns -65536, truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => -65536);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_4800
     * @tc.name testUint8ArrayMap048
     * @tc.desc Verify callback returns 0x100, truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => 0x100);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_4900
     * @tc.name testUint8ArrayMap049
     * @tc.desc Verify callback returns 0xFF, truncated to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => 0xFF);
      expect(result[0]).assertEqual(255);
      expect(result[1]).assertEqual(255);
      expect(result[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_5000
     * @tc.name testUint8ArrayMap050
     * @tc.desc Verify callback returns 0x1FF, truncated to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => 0x1FF);
      expect(result[0]).assertEqual(255);
      expect(result[1]).assertEqual(255);
      expect(result[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_5100
     * @tc.name testUint8ArrayMap051
     * @tc.desc Verify callback returns 0o400, truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => 0o400);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_5200
     * @tc.name testUint8ArrayMap052
     * @tc.desc Verify callback returns 0o377, truncated to 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => 0o377);
      expect(result[0]).assertEqual(255);
      expect(result[1]).assertEqual(255);
      expect(result[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_5300
     * @tc.name testUint8ArrayMap053
     * @tc.desc Verify callback returns 0b100000000, truncated to 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => 0b100000000);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_5400
     * @tc.name testUint8ArrayMap054
     * @tc.desc Verify map returns new array without modifying original
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v * 2);
      expect(src[0]).assertEqual(1);
      expect(src[1]).assertEqual(2);
      expect(src[2]).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_5500
     * @tc.name testUint8ArrayMap055
     * @tc.desc Verify map returns array with same length as source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_5600
     * @tc.name testUint8ArrayMap056
     * @tc.desc Verify map returns Uint8Array type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_5700
     * @tc.name testUint8ArrayMap057
     * @tc.desc Verify map returns array does not share memory with source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v * 2);
      result.set([99], 0);
      expect(src.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_5800
     * @tc.name testUint8ArrayMap058
     * @tc.desc Verify map returns array has newly allocated buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v);
      expect(result.buffer !== src.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_5900
     * @tc.name testUint8ArrayMap059
     * @tc.desc Verify map returns array byteLength equals source
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v);
      expect(result.byteLength).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_6000
     * @tc.name testUint8ArrayMap060
     * @tc.desc Verify map returns array byteOffset is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_6100
     * @tc.name testUint8ArrayMap061
     * @tc.desc Verify callback returns v + 100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v + 100);
      expect(result[0]).assertEqual(101);
      expect(result[1]).assertEqual(102);
      expect(result[2]).assertEqual(103);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_6200
     * @tc.name testUint8ArrayMap062
     * @tc.desc Verify callback returns v * 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v * 2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_6300
     * @tc.name testUint8ArrayMap063
     * @tc.desc Verify callback returns v - 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v - 1);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_6400
     * @tc.name testUint8ArrayMap064
     * @tc.desc Verify callback returns v / 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([2, 4, 6]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v / 2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_6500
     * @tc.name testUint8ArrayMap065
     * @tc.desc Verify callback returns v % 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v % 2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(1);
      expect(result[3]).assertEqual(0);
      expect(result[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_6600
     * @tc.name testUint8ArrayMap066
     * @tc.desc Verify callback returns v & 0x0F
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([0, 15, 16, 31, 32]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v & 0x0F);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(15);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(15);
      expect(result[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_6700
     * @tc.name testUint8ArrayMap067
     * @tc.desc Verify callback returns v | 0x80
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([0, 1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v | 0x80);
      expect(result[0]).assertEqual(128);
      expect(result[1]).assertEqual(129);
      expect(result[2]).assertEqual(130);
      expect(result[3]).assertEqual(131);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_6800
     * @tc.name testUint8ArrayMap068
     * @tc.desc Verify callback returns v ^ 0xFF
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([0, 1, 127, 128, 255]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v ^ 0xFF);
      expect(result[0]).assertEqual(255);
      expect(result[1]).assertEqual(254);
      expect(result[2]).assertEqual(128);
      expect(result[3]).assertEqual(127);
      expect(result[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_6900
     * @tc.name testUint8ArrayMap069
     * @tc.desc Verify callback returns v << 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 4, 8, 16]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v << 1);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(8);
      expect(result[3]).assertEqual(16);
      expect(result[4]).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_7000
     * @tc.name testUint8ArrayMap070
     * @tc.desc Verify callback returns v >> 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([2, 4, 8, 16, 32]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v >> 1);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(4);
      expect(result[3]).assertEqual(8);
      expect(result[4]).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_7100
     * @tc.name testUint8ArrayMap071
     * @tc.desc Verify callback returns ~v
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([0, 1, 127, 128, 255]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => ~v);
      expect(result[0]).assertEqual(255);
      expect(result[1]).assertEqual(254);
      expect(result[2]).assertEqual(128);
      expect(result[3]).assertEqual(127);
      expect(result[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_7200
     * @tc.name testUint8ArrayMap072
     * @tc.desc Verify callback returns v ** 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v ** 2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(9);
      expect(result[3]).assertEqual(16);
      expect(result[4]).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_7300
     * @tc.name testUint8ArrayMap073
     * @tc.desc Verify callback returns Math.abs(v - 128)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([0, 64, 128, 192, 255]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => Math.abs(v - 128));
      expect(result[0]).assertEqual(128);
      expect(result[1]).assertEqual(64);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(64);
      expect(result[4]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_7400
     * @tc.name testUint8ArrayMap074
     * @tc.desc Verify callback returns v > 128 ? 255 : 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([0, 64, 128, 129, 255]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v > 128 ? 255 : 0);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(255);
      expect(result[4]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_7500
     * @tc.name testUint8ArrayMap075
     * @tc.desc Verify callback returns v === 0 ? 255 : v
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([0, 1, 128, 255]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v === 0 ? 255 : v);
      expect(result[0]).assertEqual(255);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(128);
      expect(result[3]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_7600
     * @tc.name testUint8ArrayMap076
     * @tc.desc Verify callback returns v & 1 ? v : 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([0, 1, 2, 3, 4]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v & 1 ? v : 0);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(3);
      expect(result[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_7700
     * @tc.name testUint8ArrayMap077
     * @tc.desc Verify callback returns v + i
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([10, 20, 30]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v + i);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(21);
      expect(result[2]).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_7800
     * @tc.name testUint8ArrayMap078
     * @tc.desc Verify callback returns v * i
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([10, 20, 30]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v * i);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_7900
     * @tc.name testUint8ArrayMap079
     * @tc.desc Verify callback returns v + a[i]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([10, 20, 30]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v + a[i]);
      expect(result[0]).assertEqual(20);
      expect(result[1]).assertEqual(40);
      expect(result[2]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_8000
     * @tc.name testUint8ArrayMap080
     * @tc.desc Verify callback returns v + a[(i+1)%length]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([10, 20, 30]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v + a[(i + 1) % a.length]);
      expect(result[0]).assertEqual(30);
      expect(result[1]).assertEqual(50);
      expect(result[2]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_8100
     * @tc.name testUint8ArrayMap081
     * @tc.desc Verify callback returns v + a[(i-1+length)%length]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([10, 20, 30]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => v + a[(i - 1 + a.length) % a.length]);
      expect(result[0]).assertEqual(40);
      expect(result[1]).assertEqual(30);
      expect(result[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_8200
     * @tc.name testUint8ArrayMap082
     * @tc.desc Verify modifying source array element in callback
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => {
        if (i === 0) { a.set([255], 1); }
        return v;
      });
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(255);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_8300
     * @tc.name testUint8ArrayMap083
     * @tc.desc Verify map callback can compute sum of all elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => {
        let sum: number = 0;
        for (let j: int = 0; j < a.length; j++) {
          sum += a[j];
        }
        return v + sum;
      });
      expect(result[0]).assertEqual(7);
      expect(result[1]).assertEqual(8);
      expect(result[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_MAP_8400
     * @tc.name testUint8ArrayMap084
     * @tc.desc Verify map callback can find maximum of all elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayMap084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: Uint8Array = src.map((v: number, i: int, a: Uint8Array): number => {
        let max: number = 0;
        for (let j: int = 0; j < a.length; j++) {
          if (a[j] > max) { max = a[j]; }
        }
        return v + max;
      });
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(5);
      expect(result[2]).assertEqual(6);
    });
  });
}