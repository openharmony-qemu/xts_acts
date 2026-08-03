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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint8ClampedArrayToStringTest(): void {
  describe('Uint8ClampedArrayToStringTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0010
     * @tc.name testUint8ClampedArrayToString001
     * @tc.desc Verify toString on Uint8ClampedArray [1,2,3] returns 1,2,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const s: string = arr.toString();
      expect(s).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0020
     * @tc.name testUint8ClampedArrayToString002
     * @tc.desc Verify toString on Uint8ClampedArray(0) empty array returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const s: string = arr.toString();
      expect(s).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0030
     * @tc.name testUint8ClampedArrayToString003
     * @tc.desc Verify toString on Uint8ClampedArray [0] returns '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      expect(arr.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0040
     * @tc.name testUint8ClampedArrayToString004
     * @tc.desc Verify toString on Uint8ClampedArray [255] returns '255'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255]);
      expect(arr.toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0050
     * @tc.name testUint8ClampedArrayToString005
     * @tc.desc Verify toString on Uint8ClampedArray [256] clamps to '255'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256]);
      expect(arr.toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0060
     * @tc.name testUint8ClampedArrayToString006
     * @tc.desc Verify toString on Uint8ClampedArray [-1] clamps to '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1]);
      expect(arr.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0070
     * @tc.name testUint8ClampedArrayToString007
     * @tc.desc Verify toString on Uint8ClampedArray [Number.NaN] clamps to '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.NaN]);
      expect(arr.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0080
     * @tc.name testUint8ClampedArrayToString008
     * @tc.desc Verify toString on Uint8ClampedArray [Number.POSITIVE_INFINITY] clamps to '255'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([Number.POSITIVE_INFINITY]);
      expect(arr.toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0090
     * @tc.name testUint8ClampedArrayToString009
     * @tc.desc Verify toString on Uint8ClampedArray [-Number.POSITIVE_INFINITY] clamps to '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-Number.POSITIVE_INFINITY]);
      expect(arr.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0100
     * @tc.name testUint8ClampedArrayToString010
     * @tc.desc Verify toString on Uint8ClampedArray [0.5] clamps to '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0.5]);
      expect(arr.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0110
     * @tc.name testUint8ClampedArrayToString011
     * @tc.desc Verify toString on Uint8ClampedArray [127.5] clamps to '128'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([127.5]);
      expect(arr.toString()).assertEqual('128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0120
     * @tc.name testUint8ClampedArrayToString012
     * @tc.desc Verify toString on Uint8ClampedArray [128.5] clamps to '128'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([128.5]);
      expect(arr.toString()).assertEqual('128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0130
     * @tc.name testUint8ClampedArrayToString013
     * @tc.desc Verify [0,255] toString '0,255'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 255]);
      expect(arr.toString()).assertEqual('0,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0140
     * @tc.name testUint8ClampedArrayToString014
     * @tc.desc Verify clamp [256,-1] toString '255,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([256, -1]);
      expect(arr.toString()).assertEqual('255,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0150
     * @tc.name testUint8ClampedArrayToString015
     * @tc.desc Verify toString on Uint8ClampedArray(5) all-zero array returns 0,0,0,0,0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(5);
      expect(arr.toString()).assertEqual('0,0,0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0160
     * @tc.name testUint8ClampedArrayToString016
     * @tc.desc Verify toString on Uint8ClampedArray [-5, 100, 999] clamps to 0,100,255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-5, 100, 999]);
      expect(arr.toString()).assertEqual('0,100,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0170
     * @tc.name testUint8ClampedArrayToString017
     * @tc.desc Verify Uint8ClampedArray.of(1,2,3).toString() returns 1,2,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8ClampedArray.of(1, 2, 3);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0180
     * @tc.name testUint8ClampedArrayToString018
     * @tc.desc Verify Uint8ClampedArray.from([10,20,30]).toString() returns 10,20,30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30];
      const arr = Uint8ClampedArray.from(src);
      expect(arr.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0190
     * @tc.name testUint8ClampedArrayToString019
     * @tc.desc Verify Uint8ClampedArray from ArrayBuffer(3) with values 7,8,9 toString returns 7,8,9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(3);
      const arr = new Uint8ClampedArray(buf);
      arr[0] = 7; arr[1] = 8; arr[2] = 9;
      expect(arr.toString()).assertEqual('7,8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0200
     * @tc.name testUint8ClampedArrayToString020
     * @tc.desc Verify Uint8ClampedArray from ArrayBuffer(5) with byteOffset=1 length=3 toString returns 11,22,33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(5);
      const arr = new Uint8ClampedArray(buf, 1, 3);
      arr[0] = 11; arr[1] = 22; arr[2] = 33;
      expect(arr.toString()).assertEqual('11,22,33');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0210
     * @tc.name testUint8ClampedArrayToString021
     * @tc.desc Verify Uint8ClampedArray constructed from another Uint8ClampedArray [4,5,6] toString returns 4,5,6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([4, 5, 6]);
      const arr = new Uint8ClampedArray(src);
      expect(arr.toString()).assertEqual('4,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0220
     * @tc.name testUint8ClampedArrayToString022
     * @tc.desc Verify subarray(1,4) on Uint8ClampedArray [10,20,30,40,50] toString returns 20,30,40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const sub = parent.subarray(1, 4);
      expect(sub.toString()).assertEqual('20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0230
     * @tc.name testUint8ClampedArrayToString023
     * @tc.desc Verify slice(2) on Uint8ClampedArray [10,20,30,40,50] toString returns 30,40,50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const s = parent.slice(2);
      expect(s.toString()).assertEqual('30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0240
     * @tc.name testUint8ClampedArrayToString024
     * @tc.desc Verify Uint8ClampedArray(4).fill(7) toString returns 7,7,7,7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      arr.fill(7);
      expect(arr.toString()).assertEqual('7,7,7,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0250
     * @tc.name testUint8ClampedArrayToString025
     * @tc.desc Verify Uint8ClampedArray(3).set([9,8,7], 0) toString returns 9,8,7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      const src: Array<number> = [9, 8, 7];
      arr.set(src, 0);
      expect(arr.toString()).assertEqual('9,8,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0260
     * @tc.name testUint8ClampedArrayToString026
     * @tc.desc Verify [1,2,3,4].copyWithin(2, 0, 2) toString returns 1,2,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      arr.copyWithin(2, 0, 2);
      expect(arr.toString()).assertEqual('1,2,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0270
     * @tc.name testUint8ClampedArrayToString027
     * @tc.desc Verify [1,2,3].reverse() toString returns 3,2,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.reverse();
      expect(arr.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0280
     * @tc.name testUint8ClampedArrayToString028
     * @tc.desc Verify [3,1,2].sort() toString returns 1,2,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([3, 1, 2]);
      arr.sort();
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0290
     * @tc.name testUint8ClampedArrayToString029
     * @tc.desc Verify Uint8ClampedArray [10,20] toString returns 10,20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      expect(arr.toString()).assertEqual('10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0300
     * @tc.name testUint8ClampedArrayToString030
     * @tc.desc Verify empty array toString ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(new Array<number>());
      expect(arr.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0310
     * @tc.name testUint8ClampedArrayToString031
     * @tc.desc Verify of() toString ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint8ClampedArray.of().toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0320
     * @tc.name testUint8ClampedArrayToString032
     * @tc.desc Verify empty ArrayBuffer toString ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      const arr = new Uint8ClampedArray(buf);
      expect(arr.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0330
     * @tc.name testUint8ClampedArrayToString033
     * @tc.desc Verify zero subarray toString ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      expect(arr.subarray(1, 1).toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0340
     * @tc.name testUint8ClampedArrayToString034
     * @tc.desc Verify zero slice toString ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      expect(arr.slice(2, 2).toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0350
     * @tc.name testUint8ClampedArrayToString035
     * @tc.desc Verify zero ArrayBuffer view toString ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf, 2, 0);
      expect(arr.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0360
     * @tc.name testUint8ClampedArrayToString036
     * @tc.desc Verify 1 toString '1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([1]).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0370
     * @tc.name testUint8ClampedArrayToString037
     * @tc.desc Verify 127 toString '127'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([127]).toString()).assertEqual('127');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0380
     * @tc.name testUint8ClampedArrayToString038
     * @tc.desc Verify 128 toString '128'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([128]).toString()).assertEqual('128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0390
     * @tc.name testUint8ClampedArrayToString039
     * @tc.desc Verify 0.4 toString '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([0.4]).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0400
     * @tc.name testUint8ClampedArrayToString040
     * @tc.desc Verify 0.9 toString '1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([0.9]).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0410
     * @tc.name testUint8ClampedArrayToString041
     * @tc.desc Verify 1e9 toString '255'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([1e9]).toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0420
     * @tc.name testUint8ClampedArrayToString042
     * @tc.desc Verify -0 toString '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([-0]).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0430
     * @tc.name testUint8ClampedArrayToString043
     * @tc.desc Verify MAX_VALUE toString '255'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([Number.MAX_VALUE]).toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0440
     * @tc.name testUint8ClampedArrayToString044
     * @tc.desc Verify MIN_VALUE toString '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([Number.MIN_VALUE]).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0450
     * @tc.name testUint8ClampedArrayToString045
     * @tc.desc Verify 0 0 toString '0,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([0, 0]).toString()).assertEqual('0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0460
     * @tc.name testUint8ClampedArrayToString046
     * @tc.desc Verify 1 2 toString '1,2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([1, 2]).toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0470
     * @tc.name testUint8ClampedArrayToString047
     * @tc.desc Verify 255 0 toString '255,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([255, 0]).toString()).assertEqual('255,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0480
     * @tc.name testUint8ClampedArrayToString048
     * @tc.desc Verify 255 255 toString '255,255'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([255, 255]).toString()).assertEqual('255,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0490
     * @tc.name testUint8ClampedArrayToString049
     * @tc.desc Verify NaN 100 toString '0,100'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([Number.NaN, 100]).toString()).assertEqual('0,100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0500
     * @tc.name testUint8ClampedArrayToString050
     * @tc.desc Verify Uint8ClampedArray [10,20,30,40,50] toString returns 10,20,30,40,50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([10, 20, 30, 40, 50]).toString()).assertEqual('10,20,30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0510
     * @tc.name testUint8ClampedArrayToString051
     * @tc.desc Verify Uint8ClampedArray [255,255,255,255] toString returns 255,255,255,255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([255, 255, 255, 255]).toString()).assertEqual('255,255,255,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0520
     * @tc.name testUint8ClampedArrayToString052
     * @tc.desc Verify Uint8ClampedArray [1..10] ascending toString returns 1,2,3,4,5,6,7,8,9,10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]).toString()).assertEqual('1,2,3,4,5,6,7,8,9,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0530
     * @tc.name testUint8ClampedArrayToString053
     * @tc.desc Verify Uint8ClampedArray [5,4,3,2,1] descending toString returns 5,4,3,2,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([5, 4, 3, 2, 1]).toString()).assertEqual('5,4,3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0540
     * @tc.name testUint8ClampedArrayToString054
     * @tc.desc Verify [256,256,256] clamps to 255 toString returns 255,255,255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([256, 256, 256]).toString()).assertEqual('255,255,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0550
     * @tc.name testUint8ClampedArrayToString055
     * @tc.desc Verify [-10,-20,-30] clamps to 0 toString returns 0,0,0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([-10, -20, -30]).toString()).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0560
     * @tc.name testUint8ClampedArrayToString056
     * @tc.desc Verify [0xFF, 0o17, 0b11] hex/octal/binary literals toString returns 255,15,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([0xFF, 0o17, 0b11]).toString()).assertEqual('255,15,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0570
     * @tc.name testUint8ClampedArrayToString057
     * @tc.desc Verify [1e2, 2e1] scientific notation toString returns 100,20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([1e2, 2e1]).toString()).assertEqual('100,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0580
     * @tc.name testUint8ClampedArrayToString058
     * @tc.desc Verify Uint8ClampedArray(10) all-zero array toString returns 0,0,0,0,0,0,0,0,0,0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray(10).toString()).assertEqual('0,0,0,0,0,0,0,0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0590
     * @tc.name testUint8ClampedArrayToString059
     * @tc.desc Verify len 100 zero length 199
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(100);
      expect(arr.toString().length).assertEqual(199);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0600
     * @tc.name testUint8ClampedArrayToString060
     * @tc.desc Verify Uint8ClampedArray(256) with values 0..255 toString equals join comma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(256);
      for (let i = 0; i < 256; i++) { arr[i] = i; }
      expect(arr.toString()).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0610
     * @tc.name testUint8ClampedArrayToString061
     * @tc.desc Verify len 1024 all 255 toString join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1024);
      arr.fill(255);
      expect(arr.toString()).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0620
     * @tc.name testUint8ClampedArrayToString062
     * @tc.desc Verify Uint8ClampedArray(3) with index writes 1,2,3 toString returns 1,2,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr[0] = 1; arr[1] = 2; arr[2] = 3;
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0630
     * @tc.name testUint8ClampedArrayToString063
     * @tc.desc Verify $_set(0,50) $_set(1,60) on Uint8ClampedArray(2) toString returns 50,60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr.$_set(0, 50); arr.$_set(1, 60);
      expect(arr.toString()).assertEqual('50,60');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0640
     * @tc.name testUint8ClampedArrayToString064
     * @tc.desc Verify Uint8ClampedArray(2) with index writes 300 and -50 clamps to 255,0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2);
      arr[0] = 300; arr[1] = -50;
      expect(arr.toString()).assertEqual('255,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0650
     * @tc.name testUint8ClampedArrayToString065
     * @tc.desc Verify Uint8ClampedArray [1,2,3] toString returns 1,2,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0660
     * @tc.name testUint8ClampedArrayToString066
     * @tc.desc Verify empty toString length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      expect(arr.toString().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0670
     * @tc.name testUint8ClampedArrayToString067
     * @tc.desc Verify 100 toString length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([100]).toString().length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0680
     * @tc.name testUint8ClampedArrayToString068
     * @tc.desc Verify 1 2 3 toString length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([1, 2, 3]).toString().length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0690
     * @tc.name testUint8ClampedArrayToString069
     * @tc.desc Verify toString on [1,2,3] does not mutate source array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      arr.toString();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0700
     * @tc.name testUint8ClampedArrayToString070
     * @tc.desc Verify toString on [10,20,30] does not mutate source array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30]);
      arr.toString();
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0710
     * @tc.name testUint8ClampedArrayToString071
     * @tc.desc Verify toString on [1,2,3] is idempotent two calls both return 1,2,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const s1: string = arr.toString();
      const s2: string = arr.toString();
      expect(s1).assertEqual('1,2,3');
      expect(s2).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0720
     * @tc.name testUint8ClampedArrayToString072
     * @tc.desc Verify toString on [42] first character is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([42]).toString().charAt(0).toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0730
     * @tc.name testUint8ClampedArrayToString073
     * @tc.desc Verify toString on [1,2,3] last character is 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = new Uint8ClampedArray([1, 2, 3]).toString();
      expect(s.charAt(s.length - 1).toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0740
     * @tc.name testUint8ClampedArrayToString074
     * @tc.desc Verify toString indexOf comma on [10,20] is at position 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      expect(arr.length).assertEqual(2);
      expect(arr.toString().indexOf(',')).assertEqual(2);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0750
     * @tc.name testUint8ClampedArrayToString075
     * @tc.desc Verify toString no leading comma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Uint8ClampedArray([1, 2]).toString().charAt(0).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0760
     * @tc.name testUint8ClampedArrayToString076
     * @tc.desc Verify toString() equals join(',') on empty Uint8ClampedArray(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      expect(arr.toString()).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0770
     * @tc.name testUint8ClampedArrayToString077
     * @tc.desc Verify toString() equals join(',') on single-element Uint8ClampedArray [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([42]);
      expect(arr.toString()).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0780
     * @tc.name testUint8ClampedArrayToString078
     * @tc.desc Verify toString() equals join(',') on multi-element Uint8ClampedArray [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      expect(arr.toString()).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0790
     * @tc.name testUint8ClampedArrayToString079
     * @tc.desc Verify toString() equals join(',') on Uint8ClampedArray(8) all-zero array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(8);
      expect(arr.toString()).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0800
     * @tc.name testUint8ClampedArrayToString080
     * @tc.desc Verify toString() equals join(',') on Uint8ClampedArray [255,255,255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([255, 255, 255]);
      expect(arr.toString()).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0810
     * @tc.name testUint8ClampedArrayToString081
     * @tc.desc Verify toString() equals join(',') on clamped [-1,256,Number.NaN,100] which becomes [0,255,0,100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([-1, 256, Number.NaN, 100]);
      expect(arr.toString()).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0830
     * @tc.name testUint8ClampedArrayToString083
     * @tc.desc Verify toString() equals join(',') on slice(0,3) of Uint8ClampedArray [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const arr = parent.slice(0, 3);
      expect(arr.toString()).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0840
     * @tc.name testUint8ClampedArrayToString084
     * @tc.desc Verify toString() equals join(',') on Uint8ClampedArray(3) with index writes [11,22,33]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(3);
      arr[0] = 11; arr[1] = 22; arr[2] = 33;
      expect(arr.toString()).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0850
     * @tc.name testUint8ClampedArrayToString085
     * @tc.desc Verify toString() equals join(',') on Uint8ClampedArray(4).fill(99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(4);
      arr.fill(99);
      expect(arr.toString()).assertEqual(arr.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0820
     * @tc.name testUint8ClampedArrayToString082
     * @tc.desc Verify subarray(1,3) on [1,2,3,4] parent length=4, sub length=2, all elements correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(1, 3);
      expect(arr.length).assertEqual(4);
      expect(sub.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0860
     * @tc.name testUint8ClampedArrayToString086
     * @tc.desc Verify 0.5 half-even 0 toString 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 0.5;
      expect(arr.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0870
     * @tc.name testUint8ClampedArrayToString087
     * @tc.desc Verify 1.5 half-even 2 toString 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 1.5;
      expect(arr.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0880
     * @tc.name testUint8ClampedArrayToString088
     * @tc.desc Verify 254.5 half-even 254 toString 254
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 254.5;
      expect(arr.toString()).assertEqual('254');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0890
     * @tc.name testUint8ClampedArrayToString089
     * @tc.desc Verify 1e9 toString 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 1e9;
      expect(arr.toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0900
     * @tc.name testUint8ClampedArrayToString090
     * @tc.desc Verify -1e9 toString 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = -1e9;
      expect(arr.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0910
     * @tc.name testUint8ClampedArrayToString091
     * @tc.desc Verify subarray(1,3) on [1,2,3,4] reflects parent mutation parent[1]=99 gives 99,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = parent.subarray(1, 3);
      parent[1] = 99;
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(99);
      expect(sub[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0920
     * @tc.name testUint8ClampedArrayToString092
     * @tc.desc Verify subarray(1,3) on [1,2,3,4] sub mutation sub[0]=88 gives sub=[88,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = parent.subarray(1, 3);
      sub[0] = 88;
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(88);
      expect(sub[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0930
     * @tc.name testUint8ClampedArrayToString093
     * @tc.desc Verify slice() on [1,2,3] creates independent copy mutating parent does not affect slice toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3]);
      const s = parent.slice();
      parent[0] = 99;
      expect(s.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0940
     * @tc.name testUint8ClampedArrayToString094
     * @tc.desc Verify Uint8ClampedArray constructed from [5,6,7] creates independent copy mutating source does not affect copy toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8ClampedArray([5, 6, 7]);
      const copy = new Uint8ClampedArray(src);
      src[0] = 100;
      expect(copy.toString()).assertEqual('5,6,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0950
     * @tc.name testUint8ClampedArrayToString095
     * @tc.desc Verify two Uint8ClampedArray views of same ArrayBuffer share storage write to one visible in other toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(3);
      const a = new Uint8ClampedArray(buf);
      const b = new Uint8ClampedArray(buf);
      a[0] = 1; a[1] = 2; a[2] = 3;
      expect(b.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0960
     * @tc.name testUint8ClampedArrayToString096
     * @tc.desc Verify Uint8ClampedArray(2048) all-zero toString length is 4095
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(2048);
      expect(arr.toString().length).assertEqual(4095);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0970
     * @tc.name testUint8ClampedArrayToString097
     * @tc.desc Verify zero view toString string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Uint8ClampedArray(buf, 4, 0);
      expect(arr.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0980
     * @tc.name testUint8ClampedArrayToString098
     * @tc.desc Verify zero subarray toString string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3]);
      expect(parent.subarray(0, 0).toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_0990
     * @tc.name testUint8ClampedArrayToString099
     * @tc.desc Verify write 256 toString '255'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 256;
      expect(arr.toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_1000
     * @tc.name testUint8ClampedArrayToString100
     * @tc.desc Verify write -1 toString '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = -1;
      expect(arr.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_1010
     * @tc.name testUint8ClampedArrayToString101
     * @tc.desc Verify write NaN toString '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = Number.NaN;
      expect(arr.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_1020
     * @tc.name testUint8ClampedArrayToString102
     * @tc.desc Verify write Infinity toString '255'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = Number.POSITIVE_INFINITY;
      expect(arr.toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_1030
     * @tc.name testUint8ClampedArrayToString103
     * @tc.desc Verify write -Infinity toString '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = -Number.POSITIVE_INFINITY;
      expect(arr.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_1040
     * @tc.name testUint8ClampedArrayToString104
     * @tc.desc Verify write 2.5 toString '2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = 2.5;
      expect(arr.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_TOSTRING_1050
     * @tc.name testUint8ClampedArrayToString105
     * @tc.desc Verify write MAX_SAFE_INTEGER toString '255'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArrayToString105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(1);
      arr[0] = Number.MAX_SAFE_INTEGER;
      expect(arr.toString()).assertEqual('255');
    });
  });
}
