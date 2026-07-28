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

export default function uint32ArrayOverallOneTest(): void {
  describe('Uint32ArrayOverallOneTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_0100
     * @tc.name testUint32ArrayOverallOne001
     * @tc.desc Verify constructor(length: number) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 2.0;
      const v = new Uint32Array(len);
      expect(v.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_0200
     * @tc.name testUint32ArrayOverallOne002
     * @tc.desc Verify constructor(other: Uint32Array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(7, 8);
      const v = new Uint32Array(src);
      expect(v.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_0300
     * @tc.name testUint32ArrayOverallOne003
     * @tc.desc Verify constructor(numbers: FixedArray&lt;int&gt;)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [1, 2];
      const v = new Uint32Array(src);
      expect(v.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_0400
     * @tc.name testUint32ArrayOverallOne004
     * @tc.desc Verify constructor(numbers: FixedArray&lt;number&gt;)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0, 2.0];
      const v = new Uint32Array(src);
      expect(v.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_0500
     * @tc.name testUint32ArrayOverallOne005
     * @tc.desc Verify constructor(elements: Iterable) Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(1.0);
      src.add(2.0);
      const v = new Uint32Array(src);
      expect(v.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_0600
     * @tc.name testUint32ArrayOverallOne006
     * @tc.desc Verify constructor(buf: ArrayBuffer) ArrayLike|ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const v = new Uint32Array(buf);
      expect(v.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_0700
     * @tc.name testUint32ArrayOverallOne007
     * @tc.desc Verify constructor(buf, byteOffset: int)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Uint32Array(new ArrayBuffer(8), 0);
      expect(v.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_0800
     * @tc.name testUint32ArrayOverallOne008
     * @tc.desc Verify constructor(buf, byteOffset: number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 4.0;
      const v = new Uint32Array(new ArrayBuffer(8), off);
      expect(v.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_0900
     * @tc.name testUint32ArrayOverallOne009
     * @tc.desc Verify constructor(buf, byteOffset: int, length: int)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Uint32Array(new ArrayBuffer(8), 0, 2);
      expect(v.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_1000
     * @tc.name testUint32ArrayOverallOne010
     * @tc.desc Verify Uint32Array.of() length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Uint32Array.of();
      expect(v.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_1100
     * @tc.name testUint32ArrayOverallOne011
     * @tc.desc Verify Uint32Array.of(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Uint32Array.of(42);
      expect(v.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_1200
     * @tc.name testUint32ArrayOverallOne012
     * @tc.desc Verify Uint32Array.of(...)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Uint32Array.of(1, 2, 3, 4, 5);
      expect(v.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_1300
     * @tc.name testUint32ArrayOverallOne013
     * @tc.desc Verify Uint32Array.from(arr)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0];
      const v = Uint32Array.from(src);
      expect(v.length).assertEqual(2);
      expect(v.$_get(0)).assertEqual(1);
      expect(v.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_1400
     * @tc.name testUint32ArrayOverallOne014
     * @tc.desc Verify Uint32Array.from(arr, mapfn)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ["1", "2"];
      const v = Uint32Array.from<string>(src, (value: string, index: number) => index + 1);
      expect(v.length).assertEqual(2);
      expect(v.$_get(0)).assertEqual(1);
      expect(v.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_1500
     * @tc.name testUint32ArrayOverallOne015
     * @tc.desc Verify fill(value) arity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Uint32Array(3);
      v.fill(5);
      expect(v.$_get(0)).assertEqual(5);
      expect(v.$_get(1)).assertEqual(5);
      expect(v.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_1600
     * @tc.name testUint32ArrayOverallOne016
     * @tc.desc Verify fill(value, start) arity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Uint32Array(3);
      v.fill(5, 1);
      expect(v.$_get(0)).assertEqual(0);
      expect(v.$_get(1)).assertEqual(5);
      expect(v.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_1700
     * @tc.name testUint32ArrayOverallOne017
     * @tc.desc Verify fill(value, start, end) arity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Uint32Array(4);
      v.fill(5, 1, 3);
      expect(v.$_get(0)).assertEqual(0);
      expect(v.$_get(1)).assertEqual(5);
      expect(v.$_get(2)).assertEqual(5);
      expect(v.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_1800
     * @tc.name testUint32ArrayOverallOne018
     * @tc.desc Verify slice() arity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Uint32Array.of(1, 2, 3);
      const s = v.slice();
      expect(s.length).assertEqual(3);
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(1)).assertEqual(2);
      expect(s.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_1900
     * @tc.name testUint32ArrayOverallOne019
     * @tc.desc Verify slice(begin) arity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Uint32Array.of(1, 2, 3);
      const s = v.slice(1);
      expect(s.length).assertEqual(2);
      expect(s.$_get(0)).assertEqual(2);
      expect(s.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_2000
     * @tc.name testUint32ArrayOverallOne020
     * @tc.desc Verify slice(begin, end) arity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Uint32Array.of(1, 2, 3);
      const s = v.slice(0, 2);
      expect(s.length).assertEqual(2);
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_2100
     * @tc.name testUint32ArrayOverallOne021
     * @tc.desc Verify subarray() arity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Uint32Array.of(1, 2, 3);
      const s = v.subarray();
      expect(s.length).assertEqual(3);
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_2200
     * @tc.name testUint32ArrayOverallOne022
     * @tc.desc Verify subarray(begin) arity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Uint32Array.of(1, 2, 3);
      const s = v.subarray(1);
      expect(s.length).assertEqual(2);
      expect(s.$_get(0)).assertEqual(2);
      expect(s.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_2300
     * @tc.name testUint32ArrayOverallOne023
     * @tc.desc Verify subarray(begin, end) arity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Uint32Array.of(1, 2, 3);
      const s = v.subarray(0, 2);
      expect(s.length).assertEqual(2);
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_2400
     * @tc.name testUint32ArrayOverallOne024
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Uint32Array.of(1, 2);
      expect(v.join()).assertEqual("1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_2500
     * @tc.name testUint32ArrayOverallOne025
     * @tc.desc Verify sort() arity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Uint32Array.of(3, 1, 2);
      v.sort();
      expect(v.$_get(0)).assertEqual(1);
      expect(v.$_get(1)).assertEqual(2);
      expect(v.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_2600
     * @tc.name testUint32ArrayOverallOne026
     * @tc.desc Verify sort(compareFn) arity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Uint32Array.of(3, 1, 2);
      v.sort((a: number, b: number): int => a < b ? 1 : -1);
      expect(v.$_get(0)).assertEqual(3);
      expect(v.$_get(1)).assertEqual(2);
      expect(v.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_2700
     * @tc.name testUint32ArrayOverallOne027
     * @tc.desc Verify includes(search) arity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Uint32Array.of(4, 5, 6);
      expect(v.includes(5)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_2800
     * @tc.name testUint32ArrayOverallOne028
     * @tc.desc Verify includes(search, fromIndex) arity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Uint32Array.of(4, 5, 6);
      expect(v.includes(5, 2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_2900
     * @tc.name testUint32ArrayOverallOne029
     * @tc.desc Verify copyWithin(target, start) arity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Uint32Array.of(1, 2, 3, 4);
      v.copyWithin(0, 2);
      expect(v.$_get(0)).assertEqual(3);
      expect(v.$_get(1)).assertEqual(4);
      expect(v.$_get(2)).assertEqual(3);
      expect(v.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_3000
     * @tc.name testUint32ArrayOverallOne030
     * @tc.desc Verify copyWithin(target, start, end) arity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = Uint32Array.of(10, 20, 30, 40);
      v.copyWithin(1, 0, 2);
      expect(v.$_get(0)).assertEqual(10);
      expect(v.$_get(1)).assertEqual(10);
      expect(v.$_get(2)).assertEqual(20);
      expect(v.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_3100
     * @tc.name testUint32ArrayOverallOne031
     * @tc.desc Verify set(array) arity Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Uint32Array(2);
      v.set(Uint32Array.of(1, 2));
      expect(v.$_get(0)).assertEqual(1);
      expect(v.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_3200
     * @tc.name testUint32ArrayOverallOne032
     * @tc.desc Verify set(array, offset) arity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Uint32Array(3);
      v.set(Uint32Array.of(1, 2), 1);
      expect(v.$_get(0)).assertEqual(0);
      expect(v.$_get(1)).assertEqual(1);
      expect(v.$_get(2)).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_3300
     * @tc.name testUint32ArrayOverallOne033
     * @tc.desc Verify length:int = 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Uint32Array(1);
      expect(v.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_3400
     * @tc.name testUint32ArrayOverallOne034
     * @tc.desc Verify length:int = 4 byteLength 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Uint32Array(4);
      expect(v.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_3500
     * @tc.name testUint32ArrayOverallOne035
     * @tc.desc Verify length:int = 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Uint32Array(65535);
      expect(v.length).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_3600
     * @tc.name testUint32ArrayOverallOne036
     * @tc.desc Verify length:int = -1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint32Array(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_3700
     * @tc.name testUint32ArrayOverallOne037
     * @tc.desc Verify length:int = -2147483648 int32.MIN RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint32Array(-2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_3800
     * @tc.name testUint32ArrayOverallOne038
     * @tc.desc Verify length:number = 3.9 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 3.9;
      const v = new Uint32Array(len);
      expect(v.length).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_3900
     * @tc.name testUint32ArrayOverallOne039
     * @tc.desc Verify length:number = -0.0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = -0.0;
      const v = new Uint32Array(len);
      expect(v.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_4000
     * @tc.name testUint32ArrayOverallOne040
     * @tc.desc Verify length:number = Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint32Array(Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_4100
     * @tc.name testUint32ArrayOverallOne041
     * @tc.desc Verify length:number = -1.5 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint32Array(-1.5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_4200
     * @tc.name testUint32ArrayOverallOne042
     * @tc.desc Verify length:number = 1e3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 1e3;
      const v = new Uint32Array(len);
      expect(v.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_4300
     * @tc.name testUint32ArrayOverallOne043
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array();
      const v = new Uint32Array(src);
      expect(v.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_4400
     * @tc.name testUint32ArrayOverallOne044
     * @tc.desc Verify Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(42);
      const v = new Uint32Array(src);
      expect(v.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_4500
     * @tc.name testUint32ArrayOverallOne045
     * @tc.desc Verify uint32 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4294967295);
      const v = new Uint32Array(src);
      expect(v.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_4600
     * @tc.name testUint32ArrayOverallOne046
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2);
      const v = new Uint32Array(src);
      src.$_set(0, 99);
      expect(v.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_4700
     * @tc.name testUint32ArrayOverallOne047
     * @tc.desc Verify FixedArray&lt;int&gt; 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [0];
      const v = new Uint32Array(src);
      expect(v.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_4800
     * @tc.name testUint32ArrayOverallOne048
     * @tc.desc Verify FixedArray&lt;int&gt; int32.MAX 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [2147483647];
      const v = new Uint32Array(src);
      expect(v.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_4900
     * @tc.name testUint32ArrayOverallOne049
     * @tc.desc Verify FixedArray&lt;int&gt; -1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [-1];
      const v = new Uint32Array(src);
      expect(v.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_5000
     * @tc.name testUint32ArrayOverallOne050
     * @tc.desc Verify FixedArray&lt;int&gt; int32.MIN -2147483648 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [-2147483648];
      const v = new Uint32Array(src);
      expect(v.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_5100
     * @tc.name testUint32ArrayOverallOne051
     * @tc.desc Verify FixedArray&lt;number&gt; 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [3.14];
      const v = new Uint32Array(src);
      expect(v.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_5200
     * @tc.name testUint32ArrayOverallOne052
     * @tc.desc Verify FixedArray&lt;number&gt; uint32.MAX 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [4294967295];
      const v = new Uint32Array(src);
      expect(v.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_5300
     * @tc.name testUint32ArrayOverallOne053
     * @tc.desc Verify Array&lt;int&gt;
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [1, 2, 3];
      const v = new Uint32Array(src);
      expect(v.length).assertEqual(3);
      expect(v.$_get(0)).assertEqual(1);
      expect(v.$_get(1)).assertEqual(2);
      expect(v.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_5400
     * @tc.name testUint32ArrayOverallOne054
     * @tc.desc Verify Array&lt;int&gt; 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [0, 0, 0];
      const v = new Uint32Array(src);
      expect(v.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_5500
     * @tc.name testUint32ArrayOverallOne055
     * @tc.desc Verify Array&lt;int&gt;
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [7, 7, 7];
      const v = new Uint32Array(src);
      expect(v.$_get(1)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_5600
     * @tc.name testUint32ArrayOverallOne056
     * @tc.desc Verify Set&lt;number&gt;
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(9.0);
      const v = new Uint32Array(src);
      expect(v.$_get(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_5700
     * @tc.name testUint32ArrayOverallOne057
     * @tc.desc Verify Set&lt;number&gt;
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Set<number>();
      src.add(5.0);
      src.add(5.0);
      const v = new Uint32Array(src);
      expect(v.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_5800
     * @tc.name testUint32ArrayOverallOne058
     * @tc.desc Verify Array&lt;number&gt; Iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0];
      const v = new Uint32Array(src);
      expect(v.length).assertEqual(3);
      expect(v.$_get(0)).assertEqual(1);
      expect(v.$_get(1)).assertEqual(2);
      expect(v.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_5900
     * @tc.name testUint32ArrayOverallOne059
     * @tc.desc Verify ArrayBuffer 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const v = new Uint32Array(buf);
      expect(v.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_6000
     * @tc.name testUint32ArrayOverallOne060
     * @tc.desc Verify new Uint32Array(ArrayBuffer 5) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint32Array(new ArrayBuffer(5));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_6100
     * @tc.name testUint32ArrayOverallOne061
     * @tc.desc Verify ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1024);
      const v = new Uint32Array(buf);
      expect(v.length).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_6200
     * @tc.name testUint32ArrayOverallOne062
     * @tc.desc Verify byteOffset:int = 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Uint32Array(new ArrayBuffer(8), 4);
      expect(v.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_6300
     * @tc.name testUint32ArrayOverallOne063
     * @tc.desc Verify byteOffset:int = 8 length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Uint32Array(new ArrayBuffer(8), 8);
      expect(v.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_6400
     * @tc.name testUint32ArrayOverallOne064
     * @tc.desc Verify byteOffset:int = 1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint32Array(new ArrayBuffer(8), 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_6500
     * @tc.name testUint32ArrayOverallOne065
     * @tc.desc Verify byteOffset:int = 2 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint32Array(new ArrayBuffer(8), 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_6600
     * @tc.name testUint32ArrayOverallOne066
     * @tc.desc Verify byteOffset:int = 3 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint32Array(new ArrayBuffer(8), 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_6700
     * @tc.name testUint32ArrayOverallOne067
     * @tc.desc Verify byteOffset:int buffer RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint32Array(new ArrayBuffer(8), 12);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_6800
     * @tc.name testUint32ArrayOverallOne068
     * @tc.desc Verify byteOffset:number = 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 0.0;
      const v = new Uint32Array(new ArrayBuffer(8), off);
      expect(v.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_6900
     * @tc.name testUint32ArrayOverallOne069
     * @tc.desc Verify byteOffset:number = 1.5 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 1.5;
      try {
        new Uint32Array(new ArrayBuffer(8), off);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_7000
     * @tc.name testUint32ArrayOverallOne070
     * @tc.desc Verify byteOffset=0 length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Uint32Array(new ArrayBuffer(8), 0, 0);
      expect(v.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_7100
     * @tc.name testUint32ArrayOverallOne071
     * @tc.desc Verify byteOffset=4 length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Uint32Array(new ArrayBuffer(8), 4, 1);
      expect(v.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_7200
     * @tc.name testUint32ArrayOverallOne072
     * @tc.desc Verify length = 2147483647 buffer RangeError int32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint32Array(new ArrayBuffer(8), 0, 2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_7300
     * @tc.name testUint32ArrayOverallOne073
     * @tc.desc Verify byteOffset+length*4 byteLength RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint32Array(new ArrayBuffer(8), 0, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_7400
     * @tc.name testUint32ArrayOverallOne074
     * @tc.desc Verify length:int = -1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint32Array(new ArrayBuffer(8), 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_7500
     * @tc.name testUint32ArrayOverallOne075
     * @tc.desc Verify byteOffset=8 length=1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint32Array(new ArrayBuffer(8), 8, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_7600
     * @tc.name testUint32ArrayOverallOne076
     * @tc.desc Verify byteOffset=undefined length=undefined buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Uint32Array(new ArrayBuffer(8), undefined, undefined);
      expect(v.byteOffset).assertEqual(0);
      expect(v.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_7700
     * @tc.name testUint32ArrayOverallOne077
     * @tc.desc Verify byteOffset=0 length=undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Uint32Array(new ArrayBuffer(8), 0, undefined);
      expect(v.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_7800
     * @tc.name testUint32ArrayOverallOne078
     * @tc.desc Verify byteOffset=undefined length=2 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = new Uint32Array(new ArrayBuffer(8), undefined, 2);
      expect(v.byteOffset).assertEqual(0);
      expect(v.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_7900
     * @tc.name testUint32ArrayOverallOne079
     * @tc.desc Verify byteOffset=4.0 length=undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 4.0;
      const v = new Uint32Array(new ArrayBuffer(8), off, undefined);
      expect(v.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_8000
     * @tc.name testUint32ArrayOverallOne080
     * @tc.desc Verify FixedArray&lt;number&gt; 4294967296 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [4294967296];
      const v = new Uint32Array(src);
      expect(v.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_8100
     * @tc.name testUint32ArrayOverallOne081
     * @tc.desc Verify FixedArray&lt;number&gt; 0x80000000 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [0x80000000];
      const v = new Uint32Array(src);
      expect(v.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_8200
     * @tc.name testUint32ArrayOverallOne082
     * @tc.desc Verify FixedArray&lt;number&gt; 9007199254740991 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [9007199254740991];
      const v = new Uint32Array(src);
      expect(v.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_8300
     * @tc.name testUint32ArrayOverallOne083
     * @tc.desc Verify FixedArray&lt;int&gt; 0o17
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [0o17];
      const v = new Uint32Array(src);
      expect(v.$_get(0)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_8400
     * @tc.name testUint32ArrayOverallOne084
     * @tc.desc Verify FixedArray&lt;int&gt; 0b1010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [0b1010];
      const v = new Uint32Array(src);
      expect(v.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_8500
     * @tc.name testUint32ArrayOverallOne085
     * @tc.desc Verify FixedArray&lt;number&gt; 1e3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1e3];
      const v = new Uint32Array(src);
      expect(v.$_get(0)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_8600
     * @tc.name testUint32ArrayOverallOne086
     * @tc.desc Verify FixedArray&lt;number&gt; 0xDEADBEEF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [0xDEADBEEF];
      const v = new Uint32Array(src);
      expect(v.$_get(0)).assertEqual(3735928559);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_8700
     * @tc.name testUint32ArrayOverallOne087
     * @tc.desc Verify set throws RangeError when source length exceeds target capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(2);
      try {
        arr.set(Uint32Array.of(1, 2, 3));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_8800
     * @tc.name testUint32ArrayOverallOne088
     * @tc.desc Verify Uint32Array BYTES_PER_ELEMENT static and instance equal 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint32Array.BYTES_PER_ELEMENT).assertEqual(4);
      const arr: Uint32Array = new Uint32Array(3);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_8900
     * @tc.name testUint32ArrayOverallOne089
     * @tc.desc Verify slice and subarray clamp negative index via length plus index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const sl: Uint32Array = arr.slice(-2);
      expect(sl.length).assertEqual(2);
      expect(sl.$_get(0)).assertEqual(40);
      expect(sl.$_get(1)).assertEqual(50);
      const sub: Uint32Array = arr.subarray(-3, -1);
      expect(sub.length).assertEqual(2);
      expect(sub.$_get(0)).assertEqual(30);
      expect(sub.$_get(1)).assertEqual(40);
    });

  });
}
