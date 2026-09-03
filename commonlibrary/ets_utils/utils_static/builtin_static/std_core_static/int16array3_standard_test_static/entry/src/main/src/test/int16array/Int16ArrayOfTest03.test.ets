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

export default function Int16ArrayOfTest03(): void {
  describe('Int16ArrayOfTest03', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_0100
     * @tc.name testInt16ArrayOfTestThree001
     * @tc.desc Verify Int16Array.of(a,b) buffer.byteLength equals length*2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 10;
      let b: short = 20;
      let arr = Int16Array.of(a, b);
      let r1: int = arr.buffer.byteLength;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_0200
     * @tc.name testInt16ArrayOfTestThree002
     * @tc.desc Verify Int16Array.of(a,b) elements readable via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 100;
      let b: short = 200;
      let arr = Int16Array.of(a, b);
      let r1: number = arr.$_get(0);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 200;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_0300
     * @tc.name testInt16ArrayOfTestThree003
     * @tc.desc Verify Int16Array.of() result elements writable via $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 5;
      let arr = Int16Array.of(a);
      arr.$_set(0, 99);
      let r1: number = arr.$_get(0);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_0400
     * @tc.name testInt16ArrayOfTestThree004
     * @tc.desc Verify Int16Array.of() two calls return independent instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 1;
      let arr1 = Int16Array.of(a);
      let arr2 = Int16Array.of(a);
      arr1.$_set(0, 99);
      let r1: number = arr2.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_0500
     * @tc.name testInt16ArrayOfTestThree005
     * @tc.desc Verify Int16Array.of() empty result join returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of();
      let r1: string = arr.join(',');
      let e1: string = '';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_0600
     * @tc.name testInt16ArrayOfTestThree006
     * @tc.desc Verify Int16Array.of(a,b) join(',') returns correct string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 1;
      let b: short = 2;
      let arr = Int16Array.of(a, b);
      let r1: string = arr.join(',');
      let e1: string = '1,2';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_0700
     * @tc.name testInt16ArrayOfTestThree007
     * @tc.desc Verify Int16Array.of() empty length and byteLength readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of();
      let len: number = arr.length;
      let blen: number = arr.byteLength;
      expect(len).assertEqual(0);
      expect(blen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_0800
     * @tc.name testInt16ArrayOfTestThree008
     * @tc.desc Verify Int16Array.of() with no args does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array | null = null;
      try {
        arr = Int16Array.of();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let rNull: boolean = arr !== null;
      expect(rNull).assertTrue();
      let r1: int = arr!.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_0900
     * @tc.name testInt16ArrayOfTestThree009
     * @tc.desc Verify Int16Array.of(...) with 50 short args returns length 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: short = 7;
      let arr = Int16Array.of(
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
        v,
      );
      let r1: int = arr.length;
      let e1: int = 50;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_1000
     * @tc.name testInt16ArrayOfTestThree010
     * @tc.desc Verify Int16Array.of() out-of-range $_get throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 1;
      let arr = Int16Array.of(a);
      try {
        arr.$_get(99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_1100
     * @tc.name testInt16ArrayOfTestThree011
     * @tc.desc Verify Int16Array.of() out-of-range $_set throws RangeError or no-ops, index 0 preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 1;
      let arr = Int16Array.of(a);
      let original: number = arr.$_get(0);
      try {
        arr.$_set(99, 999);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1: number = arr.$_get(0);
      let e1: number = original;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_1200
     * @tc.name testInt16ArrayOfTestThree012
     * @tc.desc Verify Int16Array.of() result fill chain works without throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 1;
      let b: short = 2;
      let c: short = 3;
      let arr = Int16Array.of(a, b, c);
      arr.fill(0);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_1300
     * @tc.name testInt16ArrayOfTestThree013
     * @tc.desc Verify Int16Array.of() empty length matches empty constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrOf = Int16Array.of();
      let arrNew = new Int16Array(new FixedArray<int>(0));
      let r1: int = arrOf.length;
      let e1: number = arrNew.length;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_1400
     * @tc.name testInt16ArrayOfTestThree014
     * @tc.desc Verify Int16Array.of(0,1) elements match constructor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 0;
      let b: short = 1;
      let arrOf = Int16Array.of(a, b);
      let src: FixedArray<int> = [0, 1];
      let arrNew = new Int16Array(src);
      let r1: number = arrOf.$_get(0);
      let e1: number = arrNew.$_get(0);
      expect(r1).assertEqual(e1);
      let r2: number = arrOf.$_get(1);
      let e2: number = arrNew.$_get(1);
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_1500
     * @tc.name testInt16ArrayOfTestThree015
     * @tc.desc Verify Int16Array.of(-32768,32767) matches constructor boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = -32768;
      let b: short = 32767;
      let arrOf = Int16Array.of(a, b);
      let src: FixedArray<int> = [-32768, 32767];
      let arrNew = new Int16Array(src);
      let r1: number = arrOf.$_get(0);
      let e1: number = arrNew.$_get(0);
      expect(r1).assertEqual(e1);
      let r2: number = arrOf.$_get(1);
      let e2: number = arrNew.$_get(1);
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_1600
     * @tc.name testInt16ArrayOfTestThree016
     * @tc.desc Verify Int16Array.of() empty matches constructor OOB read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrOf = Int16Array.of();
      let arrNew = new Int16Array();
      try {
        arrOf.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        arrNew.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_1700
     * @tc.name testInt16ArrayOfTestThree017
     * @tc.desc Verify Int16Array.of(a,b) matches constructor then $_set values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 42;
      let b: short = -99;
      let arrOf = Int16Array.of(a, b);
      let src: FixedArray<int> = [0, 0];
      let arrNew = new Int16Array(src);
      arrNew.$_set(0, 42);
      arrNew.$_set(1, -99);
      let r1: number = arrOf.$_get(0);
      let e1: number = arrNew.$_get(0);
      expect(r1).assertEqual(e1);
      let r2: number = arrOf.$_get(1);
      let e2: number = arrNew.$_get(1);
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_1800
     * @tc.name testInt16ArrayOfTestThree018
     * @tc.desc Verify Int16Array.of() buffer independent from constructor buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 5;
      let arrOf = Int16Array.of(a);
      let src: FixedArray<int> = [5];
      let arrNew = new Int16Array(src);
      arrOf.$_set(0, 99);
      let r1: number = arrNew.$_get(0);
      let e1: int = 5;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_1900
     * @tc.name testInt16ArrayOfTestThree019
     * @tc.desc Verify Int16Array.of short overload returns Int16Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 100;
      let b: short = 200;
      let arr = Int16Array.of(a, b);
      let r1: boolean = arr instanceof Int16Array;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_2000
     * @tc.name testInt16ArrayOfTestThree020
     * @tc.desc Verify Int16Array.of number overload returns Int16Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n1: number = 100;
      let n2: number = 200;
      let arr = Int16Array.of(n1, n2);
      let r1: boolean = arr instanceof Int16Array;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_2100
     * @tc.name testInt16ArrayOfTestThree021
     * @tc.desc Verify Int16Array.of number literals returns Int16Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(50, 150);
      let r1: boolean = arr instanceof Int16Array;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_2200
     * @tc.name testInt16ArrayOfTestThree022
     * @tc.desc Verify Int16Array.of short/number overloads same positive $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sv: short = 42;
      let nv: number = 42;
      let arrS = Int16Array.of(sv);
      let arrN = Int16Array.of(nv);
      let r1: number = arrS.$_get(0);
      let e1: number = arrN.$_get(0);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_2300
     * @tc.name testInt16ArrayOfTestThree023
     * @tc.desc Verify Int16Array.of short/number overloads same negative $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sv: short = -100;
      let nv: number = -100;
      let arrS = Int16Array.of(sv);
      let arrN = Int16Array.of(nv);
      let r1: number = arrS.$_get(0);
      let e1: number = arrN.$_get(0);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_2400
     * @tc.name testInt16ArrayOfTestThree024
     * @tc.desc Verify Int16Array.of short/number multi-element same $_get(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 10;
      let s2: short = 20;
      let s3: short = 30;
      let n1: number = 10;
      let n2: number = 20;
      let n3: number = 30;
      let arrS = Int16Array.of(s1, s2, s3);
      let arrN = Int16Array.of(n1, n2, n3);
      let r1: number = arrS.$_get(1);
      let e1: number = arrN.$_get(1);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_2500
     * @tc.name testInt16ArrayOfTestThree025
     * @tc.desc Verify Int16Array.of short/number overloads same zero $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sz: short = 0;
      let nz: number = 0;
      let arrS = Int16Array.of(sz);
      let arrN = Int16Array.of(nz);
      let r1: number = arrS.$_get(0);
      let e1: number = arrN.$_get(0);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_2600
     * @tc.name testInt16ArrayOfTestThree026
     * @tc.desc Verify Int16Array.of short/number overloads same MIN -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let smin: short = -32768;
      let nmin: number = -32768;
      let arrS = Int16Array.of(smin);
      let arrN = Int16Array.of(nmin);
      let r1: number = arrS.$_get(0);
      let e1: number = arrN.$_get(0);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_2700
     * @tc.name testInt16ArrayOfTestThree027
     * @tc.desc Verify Int16Array.of short/number overloads same MAX 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let smax: short = 32767;
      let nmax: number = 32767;
      let arrS = Int16Array.of(smax);
      let arrN = Int16Array.of(nmax);
      let r1: number = arrS.$_get(0);
      let e1: number = arrN.$_get(0);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_2800
     * @tc.name testInt16ArrayOfTestThree028
     * @tc.desc Verify Int16Array.of short/number multi-element same length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sa: short = 5;
      let sb: short = 15;
      let na: number = 5;
      let nb: number = 15;
      let arrS = Int16Array.of(sa, sb);
      let arrN = Int16Array.of(na, nb);
      let r1: int = arrS.length;
      let e1: number = arrN.length;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_2900
     * @tc.name testInt16ArrayOfTestThree029
     * @tc.desc Verify Int16Array.of number 32768 wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ov: number = 32768;
      let arr = Int16Array.of(ov);
      let r1: number = arr.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_3000
     * @tc.name testInt16ArrayOfTestThree030
     * @tc.desc Verify Int16Array.of number -32769 wraps to 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uv: number = -32769;
      let arr = Int16Array.of(uv);
      let r1: number = arr.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_3100
     * @tc.name testInt16ArrayOfTestThree031
     * @tc.desc Verify Int16Array.of number 3.7 truncates to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(3.7);
      let r1: number = arr.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_3200
     * @tc.name testInt16ArrayOfTestThree032
     * @tc.desc Verify Int16Array.of number -3.7 truncates to -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-3.7);
      let r1: number = arr.$_get(0);
      let e1: int = -3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_3300
     * @tc.name testInt16ArrayOfTestThree033
     * @tc.desc Verify Int16Array.of Number.NaN yields 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(Number.NaN);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_3400
     * @tc.name testInt16ArrayOfTestThree034
     * @tc.desc Verify Int16Array.of Number.POSITIVE_INFINITY yields 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(Number.POSITIVE_INFINITY);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_3500
     * @tc.name testInt16ArrayOfTestThree035
     * @tc.desc Verify Int16Array.of Number.NEGATIVE_INFINITY yields 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(Number.NEGATIVE_INFINITY);
      let r1: number = arr.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_3600
     * @tc.name testInt16ArrayOfTestThree036
     * @tc.desc Verify Int16Array.of() empty array length equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of();
      let r1: int = arr.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_3700
     * @tc.name testInt16ArrayOfTestThree037
     * @tc.desc Verify Int16Array.of number multi-element length equals arity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(100, 200, 300);
      let r1: int = arr.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_3800
     * @tc.name testInt16ArrayOfTestThree038
     * @tc.desc Verify Int16Array.of short matches new Int16Array $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: short = 77;
      let arrOf = Int16Array.of(s);
      let arrNew = new Int16Array(1);
      arrNew.$_set(0, 77);
      let r1: number = arrOf.$_get(0);
      let e1: number = arrNew.$_get(0);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_3900
     * @tc.name testInt16ArrayOfTestThree039
     * @tc.desc Verify Int16Array.of number matches new Int16Array tail element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n1: number = 111;
      let n2: number = 222;
      let arrOf = Int16Array.of(n1, n2);
      let arrNew = new Int16Array(2);
      arrNew.$_set(0, 111);
      arrNew.$_set(1, 222);
      let r1: number = arrOf.$_get(1);
      let e1: number = arrNew.$_get(1);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_4000
     * @tc.name testInt16ArrayOfTestThree040
     * @tc.desc Verify Int16Array.of number result BYTES_PER_ELEMENT equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10);
      let r1: int = arr.BYTES_PER_ELEMENT;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_4100
     * @tc.name testInt16ArrayOfTestThree041
     * @tc.desc Verify Int16Array.of short byteLength equals length * BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 1;
      let s2: short = 2;
      let arr = Int16Array.of(s1, s2);
      let r1: int = arr.byteLength;
      let e1: number = arr.length * arr.BYTES_PER_ELEMENT;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_4200
     * @tc.name testInt16ArrayOfTestThree042
     * @tc.desc Verify Int16Array.of number byteLength equals length * BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(5, 10, 15);
      let r1: int = arr.byteLength;
      let e1: number = arr.length * arr.BYTES_PER_ELEMENT;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_4300
     * @tc.name testInt16ArrayOfTestThree043
     * @tc.desc Verify Int16Array.of number result byteOffset equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(50);
      let r1: int = arr.byteOffset;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_4400
     * @tc.name testInt16ArrayOfTestThree044
     * @tc.desc Verify Int16Array.of short result buffer is ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: short = 25;
      let arr = Int16Array.of(v);
      let r1: boolean = arr.buffer instanceof ArrayBuffer;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_4500
     * @tc.name testInt16ArrayOfTestThree045
     * @tc.desc Verify Int16Array.of number result buffer is ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(25);
      let r1: boolean = arr.buffer instanceof ArrayBuffer;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_4600
     * @tc.name testInt16ArrayOfTestThree046
     * @tc.desc Verify Int16Array.of short element values match args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 300;
      let b: short = 400;
      let arr = Int16Array.of(a, b);
      let r1: number = arr.$_get(0);
      let e1: int = 300;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_4700
     * @tc.name testInt16ArrayOfTestThree047
     * @tc.desc Verify Int16Array.of number element values match args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(300, 400);
      let r1: number = arr.$_get(1);
      let e1: int = 400;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_4800
     * @tc.name testInt16ArrayOfTestThree048
     * @tc.desc Verify Int16Array.of short buffer.byteLength equals elementCount * 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 8;
      let y: short = 16;
      let z: short = 32;
      let arr = Int16Array.of(x, y, z);
      let r1: int = arr.buffer.byteLength;
      let e1: int = 6;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_4900
     * @tc.name testInt16ArrayOfTestThree049
     * @tc.desc Verify Int16Array.of number buffer.byteLength equals elementCount * 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(8, 16, 32, 64);
      let r1: int = arr.buffer.byteLength;
      let e1: int = 8;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_5000
     * @tc.name testInt16ArrayOfTestThree050
     * @tc.desc Verify Int16Array.of short overload returns valid Int16Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 7;
      let result: Int16Array = Int16Array.of(a, a);
      let r1: boolean = result instanceof Int16Array;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_5100
     * @tc.name testInt16ArrayOfTestThree051
     * @tc.desc Verify Int16Array.of short result length remains correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: short = 99;
      let result: Int16Array = Int16Array.of(s);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_5200
     * @tc.name testInt16ArrayOfTestThree052
     * @tc.desc Verify Int16Array.of number result $_get(0) remains correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 12345;
      let result: Int16Array = Int16Array.of(v);
      let r1: number = result.$_get(0);
      let e1: int = 12345;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_5300
     * @tc.name testInt16ArrayOfTestThree053
     * @tc.desc Verify Int16Array.of short BYTES_PER_ELEMENT remains 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 1;
      let result: Int16Array = Int16Array.of(a);
      let r1: int = result.BYTES_PER_ELEMENT;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_5400
     * @tc.name testInt16ArrayOfTestThree054
     * @tc.desc Verify Int16Array.of number result buffer remains ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Int16Array = Int16Array.of(3, 6, 9);
      let r1: boolean = result.buffer instanceof ArrayBuffer;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_5500
     * @tc.name testInt16ArrayOfTestThree055
     * @tc.desc Verify two Int16Array.of short calls create distinct instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 11;
      let y: short = 22;
      let r1: Int16Array = Int16Array.of(x);
      let r2: Int16Array = Int16Array.of(y);
      let v1: boolean = r1 === r2;
      expect(v1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_5600
     * @tc.name testInt16ArrayOfTestThree056
     * @tc.desc Verify two Int16Array.of number calls have independent buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: Int16Array = Int16Array.of(44);
      let r2: Int16Array = Int16Array.of(88);
      let v1: boolean = r1.buffer === r2.buffer;
      expect(v1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_5700
     * @tc.name testInt16ArrayOfTestThree057
     * @tc.desc Verify Int16Array.of short toString returns non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: short = 55;
      let arr = Int16Array.of(s);
      let str = arr.toString();
      let r1: boolean = str.length > 0;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_5800
     * @tc.name testInt16ArrayOfTestThree058
     * @tc.desc Verify Int16Array.of number toString returns non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(55);
      let str = arr.toString();
      let r1: boolean = str.length > 0;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_5900
     * @tc.name testInt16ArrayOfTestThree059
     * @tc.desc Verify Int16Array.of short/number same content toString equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sv: short = 12;
      let nv: number = 12;
      let arrS = Int16Array.of(sv, sv);
      let arrN = Int16Array.of(nv, nv);
      let r1: string = arrS.toString();
      let e1: string = arrN.toString();
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_6000
     * @tc.name testInt16ArrayOfTestThree060
     * @tc.desc Verify Int16Array.of short/number same content join(',') equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 111;
      let s2: short = 222;
      let n1: number = 111;
      let n2: number = 222;
      let arrS = Int16Array.of(s1, s2);
      let arrN = Int16Array.of(n1, n2);
      let r1: string = arrS.join(',');
      let e1: string = arrN.join(',');
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_6100
     * @tc.name testInt16ArrayOfTestThree061
     * @tc.desc Verify Int16Array.of short valueOf returns self reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: short = 500;
      let arr = Int16Array.of(v);
      let r1: boolean = arr.valueOf() === arr;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_6200
     * @tc.name testInt16ArrayOfTestThree062
     * @tc.desc Verify Int16Array.of number valueOf returns self reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(500);
      let r1: boolean = arr.valueOf() === arr;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_6300
     * @tc.name testInt16ArrayOfTestThree063
     * @tc.desc Verify Int16Array.of short entries first index is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: short = 1000;
      let arr = Int16Array.of(s);
      for (let entry of arr.entries()) {
        let r1: number = entry[0];
        let e1: int = 0;
        expect(r1).assertEqual(e1);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_6400
     * @tc.name testInt16ArrayOfTestThree064
     * @tc.desc Verify Int16Array.of number entries first value matches arg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1000);
      for (let entry of arr.entries()) {
        let r1: number = entry[1];
        let e1: int = 1000;
        expect(r1).assertEqual(e1);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_6500
     * @tc.name testInt16ArrayOfTestThree065
     * @tc.desc Verify Int16Array.of short keys first key is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 8080;
      let arr = Int16Array.of(a);
      for (let key of arr.keys()) {
        expect(key).assertEqual(0);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_6600
     * @tc.name testInt16ArrayOfTestThree066
     * @tc.desc Verify Int16Array.of number values first value matches arg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(8080);
      for (let val of arr.values()) {
        expect(val).assertEqual(8080);
        break;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_6700
     * @tc.name testInt16ArrayOfTestThree067
     * @tc.desc Verify Int16Array.of short/number same value at(0) equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sv: short = 75;
      let nv: number = 75;
      let arrS = Int16Array.of(sv);
      let arrN = Int16Array.of(nv);
      let r1 = arrS.at(0);
      let e1 = arrN.at(0);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_6800
     * @tc.name testInt16ArrayOfTestThree068
     * @tc.desc Verify Int16Array.of short/number same value includes equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sa: short = 200;
      let na: number = 200;
      let arrS = Int16Array.of(sa);
      let arrN = Int16Array.of(na);
      let r1: boolean = arrS.includes(200);
      let e1: boolean = arrN.includes(200);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_6900
     * @tc.name testInt16ArrayOfTestThree069
     * @tc.desc Verify Int16Array.of short/number same value indexOf equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sv: short = 90;
      let nv: number = 90;
      let arrS = Int16Array.of(sv);
      let arrN = Int16Array.of(nv);
      let r1: int = arrS.indexOf(90);
      let e1: number = arrN.indexOf(90);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_7000
     * @tc.name testInt16ArrayOfTestThree070
     * @tc.desc Verify Int16Array.of short with(0, newVal) first element correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: short = 10;
      let arr = Int16Array.of(s);
      let replaced = arr.with(0, 99);
      let r1: number = replaced.$_get(0);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_7100
     * @tc.name testInt16ArrayOfTestThree071
     * @tc.desc Verify Int16Array.of number with(0, newVal) first element correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10);
      let replaced = arr.with(0, 99);
      let r1: number = replaced.$_get(0);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_7200
     * @tc.name testInt16ArrayOfTestThree072
     * @tc.desc Verify Int16Array.of short with does not mutate original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: short = 40;
      let arr = Int16Array.of(s);
      let unused = arr.with(0, 80);
      let r1: number = arr.$_get(0);
      let e1: int = 40;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_7300
     * @tc.name testInt16ArrayOfTestThree073
     * @tc.desc Verify Int16Array.of number with does not mutate original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(40);
      let unused = arr.with(0, 80);
      let r1: number = arr.$_get(0);
      let e1: int = 40;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_7400
     * @tc.name testInt16ArrayOfTestThree074
     * @tc.desc Verify Int16Array.of short/number fill(0) results equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 60;
      let s2: short = 70;
      let n1: number = 60;
      let n2: number = 70;
      let arrS = Int16Array.of(s1, s2);
      let arrN = Int16Array.of(n1, n2);
      arrS.fill(0);
      arrN.fill(0);
      let r1: number = arrS.$_get(0);
      let e1: number = arrN.$_get(0);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_7500
     * @tc.name testInt16ArrayOfTestThree075
     * @tc.desc Verify Int16Array.of short/number reverse results equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sa: short = 11;
      let sb: short = 22;
      let na: number = 11;
      let nb: number = 22;
      let arrS = Int16Array.of(sa, sb);
      let arrN = Int16Array.of(na, nb);
      arrS.reverse();
      arrN.reverse();
      let r1: number = arrS.$_get(0);
      let e1: number = arrN.$_get(0);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_7600
     * @tc.name testInt16ArrayOfTestThree076
     * @tc.desc Verify Int16Array.of short/number sort results equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 30;
      let s2: short = 10;
      let s3: short = 20;
      let n1: number = 30;
      let n2: number = 10;
      let n3: number = 20;
      let arrS = Int16Array.of(s1, s2, s3);
      let arrN = Int16Array.of(n1, n2, n3);
      arrS.sort();
      arrN.sort();
      let r1: number = arrS.$_get(0);
      let e1: number = arrN.$_get(0);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_7700
     * @tc.name testInt16ArrayOfTestThree077
     * @tc.desc Verify Int16Array.of short/number copyWithin results equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sa: short = 1;
      let sb: short = 2;
      let sc: short = 3;
      let na: number = 1;
      let nb: number = 2;
      let nc: number = 3;
      let arrS = Int16Array.of(sa, sb, sc);
      let arrN = Int16Array.of(na, nb, nc);
      arrS.copyWithin(0, 1, 3);
      arrN.copyWithin(0, 1, 3);
      let r1: number = arrS.$_get(0);
      let e1: number = arrN.$_get(0);
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_7800
     * @tc.name testInt16ArrayOfTestThree078
     * @tc.desc Verify two Int16Array.of short same args yield distinct instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 100;
      let y: short = 200;
      let arr1 = Int16Array.of(x, y);
      let arr2 = Int16Array.of(x, y);
      let r1: boolean = arr1 === arr2;
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_7900
     * @tc.name testInt16ArrayOfTestThree079
     * @tc.desc Verify two Int16Array.of number same args yield distinct instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = Int16Array.of(100, 200);
      let arr2 = Int16Array.of(100, 200);
      let r1: boolean = arr1 === arr2;
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_8000
     * @tc.name testInt16ArrayOfTestThree080
     * @tc.desc Verify Int16Array.of short and number same content are distinct instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 50;
      let n1: number = 50;
      let arrS = Int16Array.of(s1);
      let arrN = Int16Array.of(n1);
      let r1: boolean = arrS === arrN;
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_8100
     * @tc.name testInt16ArrayOfTestThree081
     * @tc.desc Verify Int16Array.of short $_set does not affect another of result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 1;
      let b: short = 2;
      let arr1 = Int16Array.of(a, b);
      let arr2 = Int16Array.of(a, b);
      arr1.$_set(0, 999);
      let r1: number = arr2.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_8200
     * @tc.name testInt16ArrayOfTestThree082
     * @tc.desc Verify Int16Array.of number $_set does not affect another of result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = Int16Array.of(1, 2);
      let arr2 = Int16Array.of(1, 2);
      arr1.$_set(1, 888);
      let r1: number = arr2.$_get(1);
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_8300
     * @tc.name testInt16ArrayOfTestThree083
     * @tc.desc Verify Int16Array.of short/number buffers are distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: short = 9;
      let arrS = Int16Array.of(s);
      let arrN = Int16Array.of(9);
      let r1: boolean = arrS.buffer === arrN.buffer;
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_8400
     * @tc.name testInt16ArrayOfTestThree084
     * @tc.desc Verify mutating short source after Int16Array.of does not change result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: short = 100;
      let arr = Int16Array.of(orig);
      orig = 200;
      let r1: number = arr.$_get(0);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_8500
     * @tc.name testInt16ArrayOfTestThree085
     * @tc.desc Verify mutating number source after Int16Array.of does not change result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: number = 100;
      let arr = Int16Array.of(orig);
      orig = 200;
      let r1: number = arr.$_get(0);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_8600
     * @tc.name testInt16ArrayOfTestThree086
     * @tc.desc Verify fill on Int16Array.of short does not affect number of result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sv: short = 7;
      let arrS = Int16Array.of(sv, sv);
      let arrN = Int16Array.of(7, 7);
      arrS.fill(0);
      let r1: number = arrN.$_get(0);
      let e1: int = 7;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_8700
     * @tc.name testInt16ArrayOfTestThree087
     * @tc.desc Verify reverse on Int16Array.of number does not affect short of result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let na: number = 18;
      let nb: number = 36;
      let sa: short = 18;
      let sb: short = 36;
      let arrN = Int16Array.of(na, nb);
      let arrS = Int16Array.of(sa, sb);
      arrN.reverse();
      let r1: number = arrS.$_get(0);
      let e1: int = 18;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_8800
     * @tc.name testInt16ArrayOfTestThree088
     * @tc.desc Verify sort on Int16Array.of short does not affect number of result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: short = 50;
      let s2: short = 10;
      let arrS = Int16Array.of(s1, s2);
      let arrN = Int16Array.of(50, 10);
      arrS.sort();
      let r1: number = arrN.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_OF_THREE_8900
     * @tc.name testInt16ArrayOfTestThree089
     * @tc.desc Verify copyWithin on Int16Array.of number does not affect short of result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayOfTestThree089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n1: number = 4;
      let n2: number = 8;
      let n3: number = 12;
      let s1: short = 4;
      let s2: short = 8;
      let s3: short = 12;
      let arrN = Int16Array.of(n1, n2, n3);
      let arrS = Int16Array.of(s1, s2, s3);
      arrN.copyWithin(0, 1, 3);
      let r1: number = arrS.$_get(0);
      let e1: int = 4;
      expect(r1).assertEqual(e1);
    });
  });
}
