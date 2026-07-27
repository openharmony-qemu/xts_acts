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

export default function uint16Arrayset001Test(): void {
  describe('Uint16Arrayset001', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_0100
     * @tc.name testUint16Arrayset001001
     * @tc.desc Verify indexed assignment stores 42 at the first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let val: int = 83;
      target[0] = val;
      expect(target.$_get(0)).assertEqual(83);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_0200
     * @tc.name testUint16Arrayset001002
     * @tc.desc Verify indexed assignment at an index equal to length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let val: int = 140;
      try {
        target[3] = val;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_0300
     * @tc.name testUint16Arrayset001003
     * @tc.desc Verify scalar set with a negative index throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let val: int = 140;
      try {
        target.set(-1, val);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_0400
     * @tc.name testUint16Arrayset001004
     * @tc.desc Verify indexed assignment stores zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let val: int = 0;
      target[0] = val;
      expect(target.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_0500
     * @tc.name testUint16Arrayset001005
     * @tc.desc Verify indexed assignment wraps 65536 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let val: int = 65536;
      target[0] = val;
      expect(target.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_0600
     * @tc.name testUint16Arrayset001006
     * @tc.desc Verify indexed assignment wraps negative one to 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let val: int = -1;
      target[0] = val;
      expect(target.$_get(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_0700
     * @tc.name testUint16Arrayset001007
     * @tc.desc Verify indexed assignment wraps negative 65536 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let val: int = -65536;
      target[0] = val;
      expect(target.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_0800
     * @tc.name testUint16Arrayset001008
     * @tc.desc Verify indexed assignment wraps hexadecimal 0x10000 to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let val: int = 0x10000;
      target[0] = val;
      expect(target.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_0900
     * @tc.name testUint16Arrayset001009
     * @tc.desc Verify 0xFFFF max boundary stored as 65535
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let val: int = 0xFFFF;
      target[0] = val;
      expect(target.$_get(0)).assertEqual(0);
});
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_1000
     * @tc.name testUint16Arrayset001010
     * @tc.desc Verify indexed assignment wraps twice the Uint16 range to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let val: int = 65536 * 2;
      target[0] = val;
      expect(target.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_1100
     * @tc.name testUint16Arrayset001011
     * @tc.desc Verify $_get returns a value written by indexed assignment
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let val: int = 596;
      target[0] = val;
      let result: number = target.$_get(0);
      expect(result).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_1200
     * @tc.name testUint16Arrayset001012
     * @tc.desc Verify overwrite middle element preserves neighbors
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      target[0] = 10;
      target[1] = 20;
      target[2] = 30;
      target[1] = 99;
      expect(target.$_get(0)).assertEqual(10);
      expect(target.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_1300
     * @tc.name testUint16Arrayset001013
     * @tc.desc Verify sequential set across all five indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target[0] = 1;
      target[1] = 2;
      target[2] = 3;
      target[3] = 4;
      target[4] = 5;
      expect(target.$_get(0)).assertEqual(1);
      expect(target.$_get(1)).assertEqual(2);
      expect(target.$_get(2)).assertEqual(3);
      expect(target.$_get(3)).assertEqual(4);
      expect(target.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_1400
     * @tc.name testUint16Arrayset001014
     * @tc.desc Verify length 0 set RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(0);
      let val: int = 140;
      try {
        target[0] = val;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_1500
     * @tc.name testUint16Arrayset001015
     * @tc.desc Verify a later indexed assignment overwrites the same element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      target[0] = 100;
      target[0] = 200;
      expect(target.$_get(0)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_1600
     * @tc.name testUint16Arrayset001016
     * @tc.desc Verify indexed assignments truncate fractional values before Uint16 conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let v1: double = 3.14;
      let v2: double = 65535.9;
      target[0] = v1.toInt();
      expect(target.$_get(0)).assertEqual(3);
      target[0] = v2.toInt();
      expect(target.$_get(0)).assertEqual(65535);
      let v3: int = (-0.5).toInt();
      target[0] = v3;
      expect(target.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_1700
     * @tc.name testUint16Arrayset001017
     * @tc.desc Verify indexed assignment wraps 100000 to 34464
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let val: int = 100000;
      target[0] = val;
      expect(target.$_get(0)).assertEqual(34464);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_1800
     * @tc.name testUint16Arrayset001018
     * @tc.desc Verify indexed assignment wraps 0x1FFFE to 65534
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let val: int = 0x1FFFE;
      target[0] = val;
      expect(target.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_1900
     * @tc.name testUint16Arrayset001019
     * @tc.desc Verify FixedArray values are copied starting at offset one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [10, 20];
      target.set(source, 1);
      expect(target.$_get(1)).assertEqual(10);
      expect(target.$_get(2)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_2000
     * @tc.name testUint16Arrayset001020
     * @tc.desc Verify FixedArray values are copied from offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [1, 2];
      target.set(source, 0);
      expect(target.$_get(0)).assertEqual(1);
      expect(target.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_2100
     * @tc.name testUint16Arrayset001021
     * @tc.desc Verify a FixedArray that exceeds the remaining target capacity throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [1, 2];
      try {
        target.set(source, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_2200
     * @tc.name testUint16Arrayset001022
     * @tc.desc Verify setting an empty FixedArray preserves existing target values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      target[0] = 10;
      target[1] = 20;
      target[2] = 30;
      let source: FixedArray<int> = [];
      target.set(source, 0);
      expect(target.$_get(0)).assertEqual(10);
      expect(target.$_get(1)).assertEqual(20);
      expect(target.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_2300
     * @tc.name testUint16Arrayset001023
     * @tc.desc Verify a one-element FixedArray is written at a nonzero offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [99];
      target.set(source, 1);
      expect(target.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_2400
     * @tc.name testUint16Arrayset001024
     * @tc.desc Verify a three-element FixedArray populates the target prefix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(4);
      let source: FixedArray<int> = [1, 2, 3];
      target.set(source, 0);
      expect(target.$_get(0)).assertEqual(1);
      expect(target.$_get(1)).assertEqual(2);
      expect(target.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_2500
     * @tc.name testUint16Arrayset001025
     * @tc.desc Verify FixedArray zero values are stored without conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [0, 0];
      target.set(source, 0);
      expect(target.$_get(0)).assertEqual(0);
      expect(target.$_get(1)).assertEqual(0);
    });

    

    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_2600
     * @tc.name testUint16Arrayset001026
     * @tc.desc Verify FixedArray value 65536 wraps to zero during copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [65536];
      target.set(source, 0);
      expect(target.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_2700
     * @tc.name testUint16Arrayset001027
     * @tc.desc Verify FixedArray negative one wraps to 65535 during copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [-1];
      target.set(source, 0);
      expect(target.$_get(0)).assertEqual(65535);
    });

    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_2800
     * @tc.name testUint16Arrayset001028
     * @tc.desc Verify a short FixedArray copy leaves trailing elements unchanged at zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      let source: FixedArray<int> = [1, 2];
      target.set(source, 0);
      expect(target.$_get(0)).assertEqual(1);
      expect(target.$_get(1)).assertEqual(2);
      expect(target.$_get(2)).assertEqual(0);
    });

    

    

    

    

    

    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_2900
     * @tc.name testUint16Arrayset001029
     * @tc.desc Verify a FixedArray copy at offset one preserves the leading element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(4);
      let source: FixedArray<int> = [10, 20, 30];
      target.set(source, 1);
      expect(target.$_get(0)).assertEqual(0);
      expect(target.$_get(1)).assertEqual(10);
      expect(target.$_get(2)).assertEqual(20);
      expect(target.$_get(3)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_3000
     * @tc.name testUint16Arrayset001030
     * @tc.desc Verify a FixedArray copy overwrites values beginning at offset two
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(4);
      target[0] = 100;
      target[1] = 200;
      let source: FixedArray<int> = [10, 20];
      target.set(source, 2);
      expect(target.$_get(0)).assertEqual(100);
      expect(target.$_get(1)).assertEqual(200);
      expect(target.$_get(2)).assertEqual(10);
      expect(target.$_get(3)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_3100
     * @tc.name testUint16Arrayset001031
     * @tc.desc Verify a FixedArray prefix copy preserves later target elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target[4] = 999;
      let source: FixedArray<int> = [1, 2, 3];
      target.set(source, 0);
      expect(target.$_get(3)).assertEqual(0);
      expect(target.$_get(4)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_3200
     * @tc.name testUint16Arrayset001032
     * @tc.desc Verify copying three FixedArray elements at offset one throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [1, 2, 3];
      try {
        target.set(source, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_3300
     * @tc.name testUint16Arrayset001033
     * @tc.desc Verify a one-element FixedArray fits at the final target index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [777];
      target.set(source, 2);
      expect(target.$_get(2)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_3400
     * @tc.name testUint16Arrayset001034
     * @tc.desc Verify a one-element FixedArray at an index equal to length throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: FixedArray<int> = [777];
      try {
        target.set(source, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_3500
     * @tc.name testUint16Arrayset001035
     * @tc.desc Verify a 100-element number array copies its first and last values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(100);
      let source: number[] = [];
      let i: number = 0;
      while (i < 100) {
        source.push(i);
        i++;
      }
      target.set(source, 0);
      expect(target.$_get(0)).assertEqual(0);
      expect(target.$_get(99)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_3600
     * @tc.name testUint16Arrayset001036
     * @tc.desc Verify a Uint16Array source copies all elements at offset zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: Uint16Array = Uint16Array.of(51, 61, 71);
      target.set(source);
      expect(target.$_get(0)).assertEqual(10);
      expect(target.$_get(1)).assertEqual(20);
      expect(target.$_get(2)).assertEqual(30);
    });

    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_3700
     * @tc.name testUint16Arrayset001037
     * @tc.desc Verify a single-element Uint16Array source copies its value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let source: Uint16Array = Uint16Array.of(83);
      target.set(source);
      expect(target.$_get(0)).assertEqual(42);
    });

    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_3800
     * @tc.name testUint16Arrayset001038
     * @tc.desc Verify a zero-filled Uint16Array source overwrites all target elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      target[0] = 99;
      target[1] = 99;
      target[2] = 99;
      let source: Uint16Array = Uint16Array.of(0, 0, 0);
      target.set(source);
      expect(target.$_get(0)).assertEqual(0);
      expect(target.$_get(1)).assertEqual(0);
      expect(target.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_3900
     * @tc.name testUint16Arrayset001039
     * @tc.desc Verify a Uint16Array source retains maximum Uint16 values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(2);
      let source: Uint16Array = Uint16Array.of(65535, 65535);
      target.set(source);
      expect(target.$_get(0)).assertEqual(65535);
      expect(target.$_get(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_4000
     * @tc.name testUint16Arrayset001040
     * @tc.desc Verify a Uint16Array source copies mixed boundary values in order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(4);
      let source: Uint16Array = Uint16Array.of(0, 65535, 32768, 42);
      target.set(source);
      expect(target.$_get(0)).assertEqual(0);
      expect(target.$_get(1)).assertEqual(65535);
      expect(target.$_get(2)).assertEqual(32768);
      expect(target.$_get(3)).assertEqual(1);
    });

    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_4100
     * @tc.name testUint16Arrayset001041
     * @tc.desc Verify a short Uint16Array copy preserves the target suffix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(5);
      target[0] = 100;
      target[1] = 200;
      target[2] = 300;
      target[3] = 400;
      target[4] = 500;
      let source: Uint16Array = Uint16Array.of(42, 43);
      target.set(source);
      expect(target.$_get(0)).assertEqual(1);
      expect(target.$_get(1)).assertEqual(2);
      expect(target.$_get(2)).assertEqual(300);
      expect(target.$_get(3)).assertEqual(400);
      expect(target.$_get(4)).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_4200
     * @tc.name testUint16Arrayset001042
     * @tc.desc Verify a Uint16Array source longer than its target throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(2);
      let source: Uint16Array = Uint16Array.of(42, 43, 44);
      try {
        target.set(source);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_4300
     * @tc.name testUint16Arrayset001043
     * @tc.desc Verify ArrayBuffer Uint16Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let srcView: Uint16Array = new Uint16Array(buf);
      srcView.set(0, 111);
      srcView.set(1, 222);
      srcView.set(2, 333);
      let target: Uint16Array = new Uint16Array(3);
      target.set(srcView);
      expect(target.$_get(0)).assertEqual(111);
      expect(target.$_get(1)).assertEqual(222);
      expect(target.$_get(2)).assertEqual(333);
    });

    

    

    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_4400
     * @tc.name testUint16Arrayset001044
     * @tc.desc Verify a Uint16Array prefix copy preserves an initialized final element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(4);
      target[3] = 999;
      let source: Uint16Array = Uint16Array.of(42, 43, 44);
      target.set(source);
      expect(target.$_get(0)).assertEqual(1);
      expect(target.$_get(1)).assertEqual(2);
      expect(target.$_get(2)).assertEqual(3);
      expect(target.$_get(3)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_4500
     * @tc.name testUint16Arrayset001045
     * @tc.desc Verify overlapping subarray copy uses source values before overwrite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = Uint16Array.of(42, 43, 44, 45);
      let source: Uint16Array = target.subarray(0, 3);
      target.set(source, 1);
      expect(target.join(',')).assertEqual('1,1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_4600
     * @tc.name testUint16Arrayset001046
     * @tc.desc Verify a Uint16Array copy preserves the target backing buffer identity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      let bufBefore: ArrayBuffer = target.buffer;
      let source: Uint16Array = Uint16Array.of(51, 61, 71);
      target.set(source);
      expect(target.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_4700
     * @tc.name testUint16Arrayset001047
     * @tc.desc Verify a two-element Uint16Array source cannot fit in a one-element target
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(1);
      let source: Uint16Array = Uint16Array.of(42, 43);
      try {
        target.set(source);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_4800
     * @tc.name testUint16Arrayset001048
     * @tc.desc Verify copying an empty Uint16Array preserves target contents
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint16Array = new Uint16Array(3);
      target[0] = 10;
      target[1] = 20;
      target[2] = 30;
      let emptySrc: Uint16Array = new Uint16Array(0);
      target.set(emptySrc);
      expect(target.$_get(0)).assertEqual(10);
      expect(target.$_get(1)).assertEqual(20);
      expect(target.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_4900
     * @tc.name testUint16Arrayset001049
     * @tc.desc Verify scalar set wraps 65537 to one at the middle index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint16Array = Uint16Array.of(51, 61, 71);
      target.set(1, 65537);
      expect(target.join(',')).assertEqual('10,1,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_5000
     * @tc.name testUint16Arrayset001050
     * @tc.desc Verify scalar set writes the first element and preserves the remaining elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(51, 61, 71);
      a.set(0, 99);
      expect(a.join(',')).assertEqual('99,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_5100
     * @tc.name testUint16Arrayset001051
     * @tc.desc Verify scalar set writes the middle element and preserves both neighbours
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(51, 61, 71);
      a.set(1, 99);
      expect(a.join(',')).assertEqual('10,99,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_5200
     * @tc.name testUint16Arrayset001052
     * @tc.desc Verify scalar set writes the final valid index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(51, 61, 71);
      a.set(2, 99);
      expect(a.join(',')).assertEqual('10,20,99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_5300
     * @tc.name testUint16Arrayset001053
     * @tc.desc Verify scalar set truncates a positive fractional value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(50, 50);
      a.set(0, 3.9);
      expect(a.join(',')).assertEqual('3,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_5400
     * @tc.name testUint16Arrayset001054
     * @tc.desc Verify scalar set truncates a negative fraction toward zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(50, 50);
      a.set(1, -0.9);
      expect(a.join(',')).assertEqual('9,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_5500
     * @tc.name testUint16Arrayset001055
     * @tc.desc Verify scalar set wraps the first value above Uint16 range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array(2);
      a.set(0, 65536);
      expect(a.join(',')).assertEqual('0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_5600
     * @tc.name testUint16Arrayset001056
     * @tc.desc Verify scalar set wraps a negative integer modulo 65536
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array(2);
      a.set(1, -2);
      expect(a.join(',')).assertEqual('0,65534');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_5700
     * @tc.name testUint16Arrayset001057
     * @tc.desc Verify scalar set stores the Uint16 maximum without conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array(1);
      a.set(0, 65535);
      expect(a[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_5800
     * @tc.name testUint16Arrayset001058
     * @tc.desc Verify scalar set updates a nonzero ArrayBuffer view at the correct backing index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(8);
      const all: Uint16Array = new Uint16Array(b);
      const v: Uint16Array = new Uint16Array(b, 2, 2);
      v.set(0, 77);
      expect(all.join(',')).assertEqual('0,77,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_5900
     * @tc.name testUint16Arrayset001059
     * @tc.desc Verify scalar set through one view is visible through an overlapping view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(8);
      const x: Uint16Array = new Uint16Array(b, 0, 3);
      const y: Uint16Array = new Uint16Array(b, 2, 2);
      x.set(1, 88);
      expect(y[0]).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_6000
     * @tc.name testUint16Arrayset001060
     * @tc.desc Verify scalar set overwrites an earlier scalar write
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(42, 43, 44);
      a.set(1, 20);
      a.set(1, 200);
      expect(a.join(',')).assertEqual('1,200,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_6100
     * @tc.name testUint16Arrayset001061
     * @tc.desc Verify scalar set preserves the backing buffer identity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(42, 43);
      const b: ArrayBuffer = a.buffer;
      a.set(0, 7);
      expect(a.buffer).assertEqual(b);
      expect(a.join(',')).assertEqual('7,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_6200
     * @tc.name testUint16Arrayset001062
     * @tc.desc Verify scalar set preserves view dimensions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array(new ArrayBuffer(10), 2, 3);
      a.set(2, 7);
      expect(a.byteOffset).assertEqual(2);
      expect(a.byteLength).assertEqual(6);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_6300
     * @tc.name testUint16Arrayset001063
     * @tc.desc Verify scalar set rejects index equal to length without modification
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(42, 43, 44);
      try {
        a.set(3, 9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(a.join(',')).assertEqual('1,2,3');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_6400
     * @tc.name testUint16Arrayset001064
     * @tc.desc Verify scalar set rejects a negative index without modification
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(42, 43, 44);
      try {
        a.set(-1, 9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(a.join(',')).assertEqual('1,2,3');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_6500
     * @tc.name testUint16Arrayset001065
     * @tc.desc Verify scalar set rejects a distant positive index atomically
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(45, 46);
      try {
        a.set(100, 9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(a.join(',')).assertEqual('4,5');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_6600
     * @tc.name testUint16Arrayset001066
     * @tc.desc Verify scalar set rejects writes to an empty typed array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array();
      try {
        a.set(0, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        expect(a.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_6700
     * @tc.name testUint16Arrayset001067
     * @tc.desc Verify scalar set writes byte typed input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array(2);
      const v: byte = 127;
      a.set(1, v);
      expect(a.join(',')).assertEqual('0,127');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_6800
     * @tc.name testUint16Arrayset001068
     * @tc.desc Verify scalar set writes short typed input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array(2);
      const v: short = 32000;
      a.set(0, v);
      expect(a.join(',')).assertEqual('32000,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_6900
     * @tc.name testUint16Arrayset001069
     * @tc.desc Verify scalar set writes int typed input above signed short range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array(1);
      const v: int = 50000;
      a.set(0, v);
      expect(a[0]).assertEqual(50000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_7000
     * @tc.name testUint16Arrayset001070
     * @tc.desc Verify scalar set writes a computed value exactly once
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(42, 43, 44);
      let calls: int = 0;
      const v: int = (() => {
        calls++;
        return 44;
      })();
      a.set(2, v);
      expect(a.join(',')).assertEqual('1,2,44');
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_7100
     * @tc.name testUint16Arrayset001071
     * @tc.desc Verify scalar set changes only one byte-pair in a shared buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(6);
      const a: Uint16Array = new Uint16Array(b);
      a.set(1, 0x1234);
      expect(a.join(',')).assertEqual('0,4660,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_7200
     * @tc.name testUint16Arrayset001072
     * @tc.desc Verify scalar set can restore an original element value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(46, 47, 48);
      a.set(0, 50);
      a.set(0, 5);
      expect(a.join(',')).assertEqual('5,6,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_7300
     * @tc.name testUint16Arrayset001073
     * @tc.desc Verify scalar set on a copied array does not mutate its source
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint16Array = Uint16Array.of(42, 43);
      const copy: Uint16Array = new Uint16Array(src);
      copy.set(0, 9);
      expect(src.join(',')).assertEqual('1,2');
      expect(copy.join(',')).assertEqual('9,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_7400
     * @tc.name testUint16Arrayset001074
     * @tc.desc Verify scalar set accepts a value read from another typed array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint16Array = Uint16Array.of(52, 63);
      const dst: Uint16Array = new Uint16Array(3);
      dst.set(2, src[1]);
      expect(dst.join(',')).assertEqual('0,0,22');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_7500
     * @tc.name testUint16Arrayset001075
     * @tc.desc Verify scalar set reads the current value of a shared alias
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(4);
      const a: Uint16Array = new Uint16Array(b);
      const alias: Uint16Array = new Uint16Array(b);
      alias[0] = 12;
      a.set(1, alias[0]);
      expect(a.join(',')).assertEqual('12,12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_7600
     * @tc.name testUint16Arrayset001076
     * @tc.desc Verify scalar set wraps a large multiple plus remainder
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array(1);
      a.set(0, 196613);
      expect(a[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_7700
     * @tc.name testUint16Arrayset001077
     * @tc.desc Verify scalar set truncates then wraps a negative fractional value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array(1);
      a.set(0, -65537.9);
      expect(a[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_7800
     * @tc.name testUint16Arrayset001078
     * @tc.desc Verify scalar set leaves an unrelated sibling view unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: ArrayBuffer = new ArrayBuffer(8);
      const left: Uint16Array = new Uint16Array(b, 0, 2);
      const right: Uint16Array = new Uint16Array(b, 4, 2);
      right.set(0, 7);
      expect(left.join(',')).assertEqual('0,0');
      expect(right.join(',')).assertEqual('7,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_7900
     * @tc.name testUint16Arrayset001079
     * @tc.desc Verify scalar set writes both ends in separate operations
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = new Uint16Array(4);
      a.set(0, 1);
      a.set(3, 4);
      expect(a.join(',')).assertEqual('1,0,0,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SET001_8000
     * @tc.name testUint16Arrayset001080
     * @tc.desc Verify scalar set stores zero over a nonzero element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16Arrayset001080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint16Array = Uint16Array.of(49, 50);
      a.set(1, 0);
      expect(a.join(',')).assertEqual('8,0');
    });

  });
}
