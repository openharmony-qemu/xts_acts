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
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Float32ArrayToString2Test(): void {
  describe('Float32ArrayToString2Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_0100
     * @tc.name testFloat32ArrayToStringTWO001
     * @tc.desc Verify [1.5].toString() returns the element text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5]);
      const result = arr.toString();
      expect(result).assertEqual('1.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_0200
     * @tc.name testFloat32ArrayToStringTWO002
     * @tc.desc Verify empty array toString() returns an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([]);
      const result = arr.toString();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_0300
     * @tc.name testFloat32ArrayToStringTWO003
     * @tc.desc Verify [1,2,3].toString() returns '1,2,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3]);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_0400
     * @tc.name testFloat32ArrayToStringTWO004
     * @tc.desc Verify [NaN, Infinity].toString() returns 'NaN,Infinity'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN, Infinity]);
      expect(arr.toString()).assertEqual('NaN,Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_0500
     * @tc.name testFloat32ArrayToStringTWO005
     * @tc.desc Verify [3,4].toString() returns no bracket characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3, 4]);
      expect(arr.toString()).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_0600
     * @tc.name testFloat32ArrayToStringTWO006
     * @tc.desc Verify [42].toString() returns '42'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([42]);
      expect(arr.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_0700
     * @tc.name testFloat32ArrayToStringTWO007
     * @tc.desc Verify [NaN, Infinity, 0].toString() returns 'NaN,Infinity,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN, Infinity, 0]);
      expect(arr.toString()).assertEqual('NaN,Infinity,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_0800
     * @tc.name testFloat32ArrayToStringTWO008
     * @tc.desc Verify [1,2].toString() returns '1,2' and byteLength remains length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2]);
      const before = arr.byteLength;
      const result = arr.toString();
      expect(result).assertEqual('1,2');
      expect(arr.byteLength).assertEqual(before);
      expect(arr.byteLength).assertEqual(arr.length * 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_0900
     * @tc.name testFloat32ArrayToStringTWO009
     * @tc.desc Verify [1,2,3,4].toString() returns four comma-separated elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3, 4]);
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_1000
     * @tc.name testFloat32ArrayToStringTWO010
     * @tc.desc Verify repeated toString() returns stable value and leaves arr.length unchanged for static values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.length;
      const first = arr.toString();
      const second = arr.toString();
      const third = arr.toString();
      expect(first).assertEqual('16,10,-1');
      expect(second).assertEqual(first);
      expect(third).assertEqual(first);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_1100
     * @tc.name testFloat32ArrayToStringTWO011
     * @tc.desc Verify [1.5].toString() returns '1.5' and arr.$_get(0) remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5]);
      const before = arr.$_get(0);
      const result = arr.toString();
      expect(result).assertEqual('1.5');
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_1200
     * @tc.name testFloat32ArrayToStringTWO012
     * @tc.desc Verify [1,2].toString() returns '1,2' and buffer reference remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2]);
      const buf = arr.buffer;
      const result = arr.toString();
      expect(result).assertEqual('1,2');
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_1300
     * @tc.name testFloat32ArrayToStringTWO013
     * @tc.desc Verify [1,2].toString() returns '1,2' and byteOffset remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2]);
      const before = arr.byteOffset;
      const result = arr.toString();
      expect(result).assertEqual('1,2');
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_1400
     * @tc.name testFloat32ArrayToStringTWO014
     * @tc.desc Verify static-value toString returns '16,10,-1' and subarray still shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const sub = arr.subarray(0, 1);
      const result = arr.toString();
      expect(result).assertEqual('16,10,-1');
      arr.$_set(0, 99);
      expect(sub.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_1500
     * @tc.name testFloat32ArrayToStringTWO015
     * @tc.desc Verify [-1,-2,-3].toString() returns '-1,-2,-3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1, -2, -3]);
      expect(arr.toString()).assertEqual('-1,-2,-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_1600
     * @tc.name testFloat32ArrayToStringTWO016
     * @tc.desc Verify [0,1,0].toString() returns '0,1,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0, 1, 0]);
      expect(arr.toString()).assertEqual('0,1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_1700
     * @tc.name testFloat32ArrayToStringTWO017
     * @tc.desc Verify [NaN, Infinity, -Infinity].toString() returns special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN, Infinity, -Infinity]);
      expect(arr.toString()).assertEqual('NaN,Infinity,-Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_1800
     * @tc.name testFloat32ArrayToStringTWO018
     * @tc.desc Verify [0.5,0.25].toString() returns '0.5,0.25'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.5, 0.25]);
      expect(arr.toString()).assertEqual('0.5,0.25');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_1900
     * @tc.name testFloat32ArrayToStringTWO019
     * @tc.desc Verify subarray(1,3) view toString reflects "10,-1" of static values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      const view = base.subarray(1, 3);
      expect(view.toString()).assertEqual('10,-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_2000
     * @tc.name testFloat32ArrayToStringTWO020
     * @tc.desc Verify empty subarray(2,2) view toString === ""
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      const view = base.subarray(2, 2);
      expect(view.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_2100
     * @tc.name testFloat32ArrayToStringTWO021
     * @tc.desc Verify non-zero byteOffset view toString (ArrayBuffer 12 bytes, offset 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const view = new Float32Array(buf, 4, 2);
      view.$_set(0, 7);
      view.$_set(1, 8);
      expect(view.toString()).assertEqual('7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_2200
     * @tc.name testFloat32ArrayToStringTWO022
     * @tc.desc Verify after modifying parent array, subarray view toString reflects change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      const view = base.subarray(0, 2);
      base.$_set(0, 50);
      expect(view.toString()).assertEqual('50,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_2300
     * @tc.name testFloat32ArrayToStringTWO023
     * @tc.desc Verify after modifying subarray view, parent array toString reflects change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      const view = base.subarray(1, 3);
      view.$_set(0, 77);
      expect(base.toString()).assertEqual('16,77,-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_2400
     * @tc.name testFloat32ArrayToStringTWO024
     * @tc.desc Verify two subarray views share buffer, toString independent of each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1, 2, 3, 4]);
      const v1 = base.subarray(0, 2);
      const v2 = base.subarray(2, 4);
      expect(v1.toString()).assertEqual('1,2');
      expect(v2.toString()).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_2500
     * @tc.name testFloat32ArrayToStringTWO025
     * @tc.desc Verify subarray(0) whole view toString === parent array toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      const view = base.subarray(0);
      expect(view.toString()).assertEqual(base.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_2600
     * @tc.name testFloat32ArrayToStringTWO026
     * @tc.desc Verify subarray(-2) negative index view toString === "10,-1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      const view = base.subarray(-2);
      expect(view.toString()).assertEqual('10,-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_2700
     * @tc.name testFloat32ArrayToStringTWO027
     * @tc.desc Verify subarray(1).toString() returns '10,-1' and byteOffset remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      const view = base.subarray(1);
      const before = view.byteOffset;
      const result = view.toString();
      expect(result).assertEqual('10,-1');
      expect(view.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_2800
     * @tc.name testFloat32ArrayToStringTWO028
     * @tc.desc Verify view toString returns '16,10' and does not affect parent array toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0);
      const view = base.subarray(0, 2);
      const result = view.toString();
      expect(result).assertEqual('16,10');
      expect(base.toString()).assertEqual('16,10,-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_2900
     * @tc.name testFloat32ArrayToStringTWO029
     * @tc.desc Verify nested subarray toString === "2"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1, 2, 3, 4]);
      const view = base.subarray(1, 3).subarray(0, 1);
      expect(view.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_3000
     * @tc.name testFloat32ArrayToStringTWO030
     * @tc.desc Verify subarray view toString returns only the view elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const view = base.subarray(1, 4);
      expect(view.toString()).assertEqual('10,-1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_3100
     * @tc.name testFloat32ArrayToStringTWO031
     * @tc.desc Verify empty subarray toString returns an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1.0, 2.0, 3.0]);
      const startIndex: int = 1;
      const endIndex: int = 1;
      const view = base.subarray(startIndex, endIndex);
      const expectText: string = '';
      expect(view.toString()).assertEqual(expectText);
      expect(view.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_3200
     * @tc.name testFloat32ArrayToStringTWO032
     * @tc.desc Verify toString formats NaN and Infinity special values in sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN, Infinity, -Infinity]);
      const expectText: string = 'NaN,Infinity,-Infinity';
      const actualText: string = arr.toString();
      expect(actualText).assertEqual(expectText);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_3300
     * @tc.name testFloat32ArrayToStringTWO033
     * @tc.desc Verify view toString reflects a backing array update made before the call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const base = new Float32Array(buf);
      const view = new Float32Array(buf, 4, 2);
      const firstValue: number = 12.0;
      const secondValue: number = 24.0;
      base.$_set(1, firstValue);
      base.$_set(2, secondValue);
      const expectText: string = '12,24';
      expect(view.toString()).assertEqual(expectText);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_3400
     * @tc.name testFloat32ArrayToStringTWO034
     * @tc.desc Verify toString does not modify length or byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([4.0, 5.0]);
      const beforeLength: int = arr.length;
      const beforeByteLength: int = arr.byteLength;
      const expectText: string = '4,5';
      const actualText: string = arr.toString();
      expect(actualText).assertEqual(expectText);
      expect(arr.length).assertEqual(beforeLength);
      expect(arr.byteLength).assertEqual(beforeByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_3500
     * @tc.name testFloat32ArrayToStringTWO035
     * @tc.desc Verify toString on a single-element offset view returns only that element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(12);
      const base = new Float32Array(buf);
      base.$_set(0, 1.0);
      base.$_set(1, 2.0);
      base.$_set(2, 3.0);
      const view = new Float32Array(buf, 4, 1);
      const expectText: string = '2';
      expect(view.toString()).assertEqual(expectText);
      expect(view.length).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGTWO_3600
     * @tc.name testFloat32ArrayToStringTWO036
     * @tc.desc Verify toString on an offset view only serializes the view range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringTWO036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const view = parent.subarray(1, 3);
      expect(view.toString()).assertEqual('2,3');
    });

  });
}
