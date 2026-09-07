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

export default function Float32ArrayJoin2Test(): void {
  describe('Float32ArrayJoin2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_0100
     * @tc.name testFloat32ArrayJoinTwo001
     * @tc.desc join() on subarray(1) of [1.0,2.0,3.0,4.0] returns '2,3,4'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const sub = arr.subarray(1);
      const result = sub.join();
      expect(result).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_0200
     * @tc.name testFloat32ArrayJoinTwo002
     * @tc.desc join() on 5-element [1.0,2.0,3.0,4.0,5.0] returns '1,2,3,4,5'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const result = arr.join();
      expect(result).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_0300
     * @tc.name testFloat32ArrayJoinTwo003
     * @tc.desc join() on single element [5.0] returns '5'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0);
      const result = arr.join();
      expect(result).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_0400
     * @tc.name testFloat32ArrayJoinTwo004
     * @tc.desc join() on [NaN, 1.0] returns 'NaN,1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, 1.0);
      const result = arr.join();
      expect(result).assertEqual('NaN,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_0500
     * @tc.name testFloat32ArrayJoinTwo005
     * @tc.desc join() on [Infinity, 1.0] returns 'Infinity,1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.POSITIVE_INFINITY, 1.0);
      const result = arr.join();
      expect(result).assertEqual('Infinity,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_0600
     * @tc.name testFloat32ArrayJoinTwo006
     * @tc.desc join(undefined) on [1.0,2.0] returns '1,2' (default separator)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const result = arr.join(undefined);
      expect(result).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_0700
     * @tc.name testFloat32ArrayJoinTwo007
     * @tc.desc join('') on [1.0,2.0] concatenates elements: '12'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const result = arr.join('');
      expect(result).assertEqual('12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_0800
     * @tc.name testFloat32ArrayJoinTwo008
     * @tc.desc subarray(0,1).join() on [1.0,2.0] returns '1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0);
      const view = base.subarray(0, 1);
      const joinedValue009 = view.join();
      expect(joinedValue009).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_0900
     * @tc.name testFloat32ArrayJoinTwo009
     * @tc.desc join() on [NaN, 2.0] returns 'NaN,2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, 2.0);
      const result = arr.join();
      expect(result).assertEqual('NaN,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_1000
     * @tc.name testFloat32ArrayJoinTwo010
     * @tc.desc join() on max float32 value 3.4028234663852886e+38 preserves string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.4028234663852886e+38);
      const result = arr.join();
      expect(result).assertEqual('3.4028234663852886e+38');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_1100
     * @tc.name testFloat32ArrayJoinTwo011
     * @tc.desc join() on min float32 value 1.401298464324817e-45 preserves string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.401298464324817e-45);
      const result = arr.join();
      expect(result).assertEqual('1.401298464324817e-45');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_1200
     * @tc.name testFloat32ArrayJoinTwo012
     * @tc.desc join() on [-5.0,-10.0] returns '-5,-10'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-5.0, -10.0);
      const result = arr.join();
      expect(result).assertEqual('-5,-10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_1300
     * @tc.name testFloat32ArrayJoinTwo013
     * @tc.desc join() on single element [9.0] returns '9'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(9.0);
      const result = arr.join();
      expect(result).assertEqual('9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_1400
     * @tc.name testFloat32ArrayJoinTwo014
     * @tc.desc join() on [-1.0,0.0,1.0] returns '-1,0,1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, 0.0, 1.0);
      const result = arr.join();
      expect(result).assertEqual('-1,0,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_1500
     * @tc.name testFloat32ArrayJoinTwo015
     * @tc.desc join() on [5,5,5] returns '5,5,5'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 5.0, 5.0);
      const result = arr.join();
      expect(result).assertEqual('5,5,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_1600
     * @tc.name testFloat32ArrayJoinTwo016
     * @tc.desc join(':') on [0.5, -0.5, NaN, Infinity] returns '0.5:-0.5:NaN:Infinity'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.5, -0.5, Number.NaN, Number.POSITIVE_INFINITY);
      const result = arr.join(':');
      expect(result).assertEqual('0.5:-0.5:NaN:Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_1700
     * @tc.name testFloat32ArrayJoinTwo017
     * @tc.desc join() on byteOffset view of ArrayBuffer(16) at offset 4 returns correct slice values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 3);
      arr.$_set(0, 10.0);
      arr.$_set(1, 20.0);
      arr.$_set(2, 30.0);
      const result = arr.join();
      expect(result).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_1800
     * @tc.name testFloat32ArrayJoinTwo018
     * @tc.desc join('\n') on [1,2] returns '1\n2' (newline separator)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const result = arr.join('\n');
      expect(result).assertEqual('1\n2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_1900
     * @tc.name testFloat32ArrayJoinTwo019
     * @tc.desc join('\t') on [1,2] returns '1\t2' (tab separator)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const result = arr.join('\t');
      expect(result).assertEqual('1\t2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_2000
     * @tc.name testFloat32ArrayJoinTwo020
     * @tc.desc join(undefined) on single element [7] returns '7'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0);
      const result = arr.join(undefined);
      expect(result).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_2100
     * @tc.name testFloat32ArrayJoinTwo021
     * @tc.desc join('::') on [1,2,3] returns '1::2::3' (multi-char separator)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join('::');
      expect(result).assertEqual('1::2::3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_2200
     * @tc.name testFloat32ArrayJoinTwo022
     * @tc.desc join('|') on empty array returns '' with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.join('|');
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_2300
     * @tc.name testFloat32ArrayJoinTwo023
     * @tc.desc join('|') on single element [42] returns '42' (no separator inserted)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(42.0);
      const result = arr.join('|');
      expect(result).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_2400
     * @tc.name testFloat32ArrayJoinTwo024
     * @tc.desc join('') on [1,22,3] concatenates to '1223'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 22.0, 3.0);
      const result = arr.join('');
      expect(result).assertEqual('1223');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_2500
     * @tc.name testFloat32ArrayJoinTwo025
     * @tc.desc join(':') on [1,2,30] returns '1:2:30' (mixed-width values)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 30.0);
      const result = arr.join(':');
      expect(result).assertEqual('1:2:30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_2600
     * @tc.name testFloat32ArrayJoinTwo026
     * @tc.desc join() on [NaN, Infinity] returns 'NaN,Infinity'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, Number.POSITIVE_INFINITY);
      const result = arr.join();
      expect(result).assertEqual('NaN,Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_2700
     * @tc.name testFloat32ArrayJoinTwo027
     * @tc.desc join() on [123456] returns '123456' (integer string conversion)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(123456.0);
      const result = arr.join();
      expect(result).assertEqual('123456');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_2800
     * @tc.name testFloat32ArrayJoinTwo028
     * @tc.desc join(',') vs join('---') length difference is 4 on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const r1 = arr.join(',').length;
      const r2 = arr.join('---').length;
      const observedValue033 = r2 - r1;
      expect(observedValue033).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_2900
     * @tc.name testFloat32ArrayJoinTwo029
     * @tc.desc join('').length on [42] equals 2 ('42'.length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(42.0);
      const lengthValue034 = arr.join('').length;
      expect(lengthValue034).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_3000
     * @tc.name testFloat32ArrayJoinTwo030
     * @tc.desc join(',').length on [1,22,333] equals 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 22.0, 333.0);
      const lengthValue035 = arr.join(',').length;
      expect(lengthValue035).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_3100
     * @tc.name testFloat32ArrayJoinTwo031
     * @tc.desc join('--').length on [1,22,333] equals 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 22.0, 333.0);
      const lengthValue036 = arr.join('--').length;
      expect(lengthValue036).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_3200
     * @tc.name testFloat32ArrayJoinTwo032
     * @tc.desc join('---').length on empty array equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const lengthValue037 = arr.join('---').length;
      expect(lengthValue037).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_3300
     * @tc.name testFloat32ArrayJoinTwo033
     * @tc.desc join().length on 10-element array [1..10] equals 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0);
      const lengthValue038 = arr.join().length;
      expect(lengthValue038).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_3400
     * @tc.name testFloat32ArrayJoinTwo034
     * @tc.desc join() does not change array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const before = arr.length;
      const beforeByteLength = arr.byteLength;
      arr.join();
      expect(arr.length).assertEqual(before);
      expect(arr.byteLength).assertEqual(beforeByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_3500
     * @tc.name testFloat32ArrayJoinTwo035
     * @tc.desc join() does not mutate element at index 0 (still equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      arr.join();
      const element040 = arr.$_get(0);
      expect(element040).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_3600
     * @tc.name testFloat32ArrayJoinTwo036
     * @tc.desc Verify join() on [16777217] returns '16777216' (float32 precision loss at 2^24+1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777217);
      expect(arr.join()).assertEqual('16777216');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_3700
     * @tc.name testFloat32ArrayJoinTwo037
     * @tc.desc join('|') does not mutate element at index 2 (still equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      arr.join('|');
      const element042 = arr.$_get(2);
      expect(element042).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_3800
     * @tc.name testFloat32ArrayJoinTwo038
     * @tc.desc join() does not change underlying buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const buf = arr.buffer;
      const before = buf.byteLength;
      arr.join();
      expect(buf.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_3900
     * @tc.name testFloat32ArrayJoinTwo039
     * @tc.desc Repeated join()/join('|')/join('') calls do not change array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      arr.join();
      arr.join('|');
      arr.join('');
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_4000
     * @tc.name testFloat32ArrayJoinTwo040
     * @tc.desc join() and at(-1) still returns last element 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      arr.join();
      const atValue045 = arr.at(-1);
      expect(atValue045).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_4100
     * @tc.name testFloat32ArrayJoinTwo041
     * @tc.desc join('---') and at(0) still returns first element 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0);
      arr.join('---');
      const atValue046 = arr.at(0);
      expect(atValue046).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_4200
     * @tc.name testFloat32ArrayJoinTwo042
     * @tc.desc join() result captured before fill(0) is not affected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join();
      arr.fill(0);
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_4300
     * @tc.name testFloat32ArrayJoinTwo043
     * @tc.desc join() result captured before sort() is not affected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 2.0);
      const result = arr.join();
      arr.sort();
      expect(result).assertEqual('3,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_4400
     * @tc.name testFloat32ArrayJoinTwo044
     * @tc.desc join() result captured before reverse() is not affected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join();
      arr.reverse();
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_4500
     * @tc.name testFloat32ArrayJoinTwo045
     * @tc.desc join() result captured before set() is not affected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join();
      arr.set(Float32Array.of(9.0, 9.0, 9.0));
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_4600
     * @tc.name testFloat32ArrayJoinTwo046
     * @tc.desc join() result captured before copyWithin() is not affected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const result = arr.join();
      arr.copyWithin(0, 2);
      expect(result).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_4700
     * @tc.name testFloat32ArrayJoinTwo047
     * @tc.desc join().toUpperCase() on [NaN, Infinity] returns 'NAN,INFINITY'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, Number.POSITIVE_INFINITY);
      const result = arr.join().toUpperCase();
      expect(result).assertEqual('NAN,INFINITY');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_4800
     * @tc.name testFloat32ArrayJoinTwo048
     * @tc.desc join(',').split(',') on [1,2,3] produces 3 parts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const parts = arr.join(',').split(',');
      expect(parts.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_4900
     * @tc.name testFloat32ArrayJoinTwo049
     * @tc.desc join().includes('2') on [1,2,3] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const joinedValue054 = arr.join().includes('2');
      expect(joinedValue054).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_5000
     * @tc.name testFloat32ArrayJoinTwo050
     * @tc.desc join().indexOf('2') on [1,2,3] returns 2 (position in '1,2,3')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const joinedValue055 = arr.join().indexOf('2');
      expect(joinedValue055).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_5100
     * @tc.name testFloat32ArrayJoinTwo051
     * @tc.desc join().replace(',',';') on [1,2,3] returns '1;2,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join().replace(',', ';');
      expect(result).assertEqual('1;2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_5200
     * @tc.name testFloat32ArrayJoinTwo052
     * @tc.desc join().$_get(0) on [1,2,3] returns '1' (first char of result string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const element057 = arr.join().$_get(0);
      expect(element057).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_5300
     * @tc.name testFloat32ArrayJoinTwo053
     * @tc.desc join().slice(0,3) on [1,2,3] returns '1,2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const joinedValue058 = arr.join().slice(0, 3);
      expect(joinedValue058).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_5400
     * @tc.name testFloat32ArrayJoinTwo054
     * @tc.desc join().concat('!') on [1,2] returns '1,2!'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const joinedValue059 = arr.join().concat('!');
      expect(joinedValue059).assertEqual('1,2!');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_5500
     * @tc.name testFloat32ArrayJoinTwo055
     * @tc.desc join().repeat(2) on [1,2,3] returns '1,2,31,2,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const joinedValue060 = arr.join().repeat(2);
      expect(joinedValue060).assertEqual('1,2,31,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_5600
     * @tc.name testFloat32ArrayJoinTwo056
     * @tc.desc join(',').split(',').length on [10,20,30,40] equals 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0, 40.0);
      const lengthValue061 = arr.join(',').split(',').length;
      expect(lengthValue061).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_5700
     * @tc.name testFloat32ArrayJoinTwo057
     * @tc.desc join(',').split(',')[1] on [1,2,3] equals '2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const parts = arr.join(',').split(',');
      expect(parts[1]).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_5800
     * @tc.name testFloat32ArrayJoinTwo058
     * @tc.desc join(',').split(',').join(';) on [1,2,3] returns '1;2;3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join(',').split(',').join(';');
      expect(result).assertEqual('1;2;3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_5900
     * @tc.name testFloat32ArrayJoinTwo059
     * @tc.desc join('|').includes('|') on [1,2,3] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const joinedValue064 = arr.join('|').includes('|');
      expect(joinedValue064).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_6000
     * @tc.name testFloat32ArrayJoinTwo060
     * @tc.desc join().toLowerCase() on [NaN, Infinity] returns 'nan,infinity'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, Number.POSITIVE_INFINITY);
      const joinedValue065 = arr.join().toLowerCase();
      expect(joinedValue065).assertEqual('nan,infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_6100
     * @tc.name testFloat32ArrayJoinTwo061
     * @tc.desc join(',').split(',').join(',') roundtrip on [1,2,3] returns '1,2,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.join(',').split(',').join(',');
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_6200
     * @tc.name testFloat32ArrayJoinTwo062
     * @tc.desc subarray(1,3).join() on [1,2,3,4] returns '2,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const view = base.subarray(1, 3);
      const joinedValue067 = view.join();
      expect(joinedValue067).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_6300
     * @tc.name testFloat32ArrayJoinTwo063
     * @tc.desc subarray view join reflects base mutation via shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0, 3.0);
      const view = base.subarray(0, 2);
      base.$_set(0, 99);
      const joinedValue068 = view.join();
      expect(joinedValue068).assertEqual('99,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_6400
     * @tc.name testFloat32ArrayJoinTwo064
     * @tc.desc slice() copy join is unaffected by later base mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0, 3.0);
      const copy = base.slice();
      base.$_set(0, 99);
      const joinedValue069 = copy.join();
      expect(joinedValue069).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_6500
     * @tc.name testFloat32ArrayJoinTwo065
     * @tc.desc Two subarray views on same buffer reflect same base mutation in join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0, 3.0);
      const observedValue070 = base.subarray(0, 2);
      const observedValue070Part2 = base.subarray(0, 2);
      base.$_set(0, 8);
      const joinedValue070 = observedValue070.join();
      const joinedValue070Part2 = observedValue070Part2.join();
      expect(joinedValue070).assertEqual('8,2');
      expect(joinedValue070Part2).assertEqual('8,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_6600
     * @tc.name testFloat32ArrayJoinTwo066
     * @tc.desc Float32Array with byteOffset 8 join() returns '30,40'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const full = new Float32Array(buf);
      full.$_set(0, 10);
      full.$_set(1, 20);
      full.$_set(2, 30);
      full.$_set(3, 40);
      const view = new Float32Array(buf, 8, 2);
      const joinedValue071 = view.join();
      expect(joinedValue071).assertEqual('30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_6700
     * @tc.name testFloat32ArrayJoinTwo067
     * @tc.desc Base join() reflects subarray mutation via shared buffer: '1,50,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0, 3.0);
      const view = base.subarray(1);
      view.$_set(0, 50);
      const joinedValue072 = base.join();
      expect(joinedValue072).assertEqual('1,50,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_6800
     * @tc.name testFloat32ArrayJoinTwo068
     * @tc.desc subarray(1,1) empty view join() returns ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0, 3.0);
      const view = base.subarray(1, 1);
      const joinedValue073 = view.join();
      expect(joinedValue073).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_6900
     * @tc.name testFloat32ArrayJoinTwo069
     * @tc.desc subarray(1,2) single-element view join() returns '2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0, 3.0);
      const view = base.subarray(1, 2);
      const joinedValue074 = view.join();
      expect(joinedValue074).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_7000
     * @tc.name testFloat32ArrayJoinTwo070
     * @tc.desc subarray out-of-range view join() returns ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0, 3.0);
      const view = base.subarray(5, 10);
      const joinedValue075 = view.join();
      expect(joinedValue075).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_7100
     * @tc.name testFloat32ArrayJoinTwo071
     * @tc.desc join() equals join(undefined) on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const joinedValue076 = arr.join();
      expect(joinedValue076).assertEqual(arr.join(undefined));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_JOIN_TWO_7200
     * @tc.name testFloat32ArrayJoinTwo072
     * @tc.desc Float32Array(2.9) truncates to length 2, join() returns '0,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayJoinTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2.9);
      const result = arr.join();
      expect(result).assertEqual('0,0');
    });

  });
}
