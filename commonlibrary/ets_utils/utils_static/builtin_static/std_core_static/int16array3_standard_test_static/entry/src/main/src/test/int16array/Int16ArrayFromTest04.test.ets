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
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

export default function Int16ArrayFromTest04(): void {
  describe('Int16ArrayFromTest04', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_0100
     * @tc.name testInt16ArrayFromTestFour001
     * @tc.desc Verify Int16Array.from loop traversal matches source values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [5, -5, 32767, -32768, 0];
      let expected: FixedArray<int> = [5, -5, 32767, -32768, 0];
      let result: Int16Array = Int16Array.from(src);
      let allMatch: boolean = true;
      for (let i: int = 0; i < result.length; i++) {
        if (result.$_get(i) !== expected[i]) {
          allMatch = false;
        }
      }
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_0200
     * @tc.name testInt16ArrayFromTestFour002
     * @tc.desc Verify Int16Array.from loop traversal wraps overflow elements correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [32768, -32769, 65535, 65536];
      let expected: FixedArray<int> = [-32768, 32767, -1, 0];
      let result: Int16Array = Int16Array.from(src);
      let allMatch: boolean = true;
      for (let i: int = 0; i < result.length; i++) {
        if (result.$_get(i) !== expected[i]) {
          allMatch = false;
        }
      }
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_0300
     * @tc.name testInt16ArrayFromTestFour003
     * @tc.desc Verify Int16Array.from is copy so source mutation does not affect result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2, 3];
      let result: Int16Array = Int16Array.from(src);
      src[0] = 999;
      let r1: number = result.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_0400
     * @tc.name testInt16ArrayFromTestFour004
     * @tc.desc Verify Int16Array.from result mutation does not affect source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2, 3];
      let result: Int16Array = Int16Array.from(src);
      result.$_set(0, 999);
      let r1: number = src[0];
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_0600
     * @tc.name testInt16ArrayFromTestFour006
     * @tc.desc Verify Int16Array.from with NaN element does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [Number.NaN, Number.NaN];
      let result: Int16Array = Int16Array.from(src);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_0700
     * @tc.name testInt16ArrayFromTestFour007
     * @tc.desc Verify Int16Array.from with Infinity element does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY];
      let result: Int16Array = Int16Array.from(src);
      let r1: int = result.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_0800
     * @tc.name testInt16ArrayFromTestFour008
     * @tc.desc Verify Int16Array.from empty array does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [];
      let result: Int16Array = Int16Array.from(src);
      let r1: boolean = result === null;
      let e1: boolean = false;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_0900
     * @tc.name testInt16ArrayFromTestFour009
     * @tc.desc Verify Int16Array.from large array keeps length without throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = new FixedArray<int>(1000, 0);
      for (let i: int = 0; i < 1000; i++) {
        src[i] = 1;
      }
      let result: Int16Array = Int16Array.from(src);
      let r1: int = result.length;
      let e1: int = 1000;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_1000
     * @tc.name testInt16ArrayFromTestFour010
     * @tc.desc Verify Int16Array.from preserves source element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [32767, -32768, 100, -100, 0];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 100;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3);
      let e4: int = -100;
      expect(r4).assertEqual(e4);
      let r5: number = result.$_get(4);
      let e5: int = 0;
      expect(r5).assertEqual(e5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_1100
     * @tc.name testInt16ArrayFromTestFour011
     * @tc.desc Verify Int16Array.from keeps relative order of wrap values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [-32769, 32768, -32769, 32768];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 32767;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3);
      let e4: int = -32768;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_1200
     * @tc.name testInt16ArrayFromTestFour012
     * @tc.desc Verify Int16Array.from truncates float before wrap floor then mod 2^16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [3.7, 32768.9];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -32768;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_1300
     * @tc.name testInt16ArrayFromTestFour013
     * @tc.desc Verify Int16Array.from truncates negative before wrap -32769.1 to 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [-32769.1];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_1400
     * @tc.name testInt16ArrayFromTestFour014
     * @tc.desc Verify Int16Array.from multi-level overflow modular consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [65535, 65536, 65537];
      let result: Int16Array = Int16Array.from(src);
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 1;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_1500
     * @tc.name testInt16ArrayFromTestFour015
     * @tc.desc Verify Int16Array.from ArrayLike length=2, result not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(10);
      source.push(20);
      let result: Int16Array = Int16Array.from(source);
      let rNull: boolean = result !== null;
      expect(rNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_1600
     * @tc.name testInt16ArrayFromTestFour016
     * @tc.desc Verify Int16Array.from ArrayLike length=0, byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.byteLength;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_1800
     * @tc.name testInt16ArrayFromTestFour018
     * @tc.desc Verify Int16Array.from ArrayLike length=0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lenVal: number = 0.5;
      let source: Array<number> = [];
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_2000
     * @tc.name testInt16ArrayFromTestFour020
     * @tc.desc Verify Int16Array.from ArrayLike length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = Array.create<number>(1, 0);
      source[0] = 5;
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_2900
     * @tc.name testInt16ArrayFromTestFour029
     * @tc.desc Verify Int16Array.from ArrayLike length=1, $_get(0) value, int16 wrap/truncate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = Array.create<number>(1, 0);
      source[0] = -65536;
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_3000
     * @tc.name testInt16ArrayFromTestFour030
     * @tc.desc Verify Int16Array.from ArrayLike length=1, $_get(0) value, int16 wrap/truncate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = Array.create<number>(1, 0);
      source[0] = 100000;
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = -31072;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_3300
     * @tc.name testInt16ArrayFromTestFour033
     * @tc.desc Verify Int16Array.from ArrayLike length=1, $_get(0) value, float truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = Array.create<number>(1, 0);
      source[0] = 0.9;
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_4000
     * @tc.name testInt16ArrayFromTestFour040
     * @tc.desc Verify Int16Array.from ArrayLike length=3, element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(10);
      source.push(20);
      source.push(30);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 30;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_4100
     * @tc.name testInt16ArrayFromTestFour041
     * @tc.desc Verify Int16Array.from ArrayLike length=5, element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(100);
      source.push(200);
      source.push(300);
      source.push(400);
      source.push(500);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(4);
      let e2: int = 500;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_4200
     * @tc.name testInt16ArrayFromTestFour042
     * @tc.desc Verify Int16Array.from ArrayLike length=100, element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      for (let _i: int = 0; _i < 100; _i++) {
        source.push(0);
      }
      source[0] = 1;
      source[99] = 2;
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.length;
      let e1: int = 100;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(99);
      let e3: int = 2;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_4500
     * @tc.name testInt16ArrayFromTestFour045
     * @tc.desc Verify Int16Array.from ArrayLike length=3, element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(0);
      source.push(0);
      source.push(0);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_4600
     * @tc.name testInt16ArrayFromTestFour046
     * @tc.desc Verify Int16Array.from ArrayLike length=3, element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(-1);
      source.push(-1);
      source.push(-1);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -1;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = -1;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_4700
     * @tc.name testInt16ArrayFromTestFour047
     * @tc.desc Verify Int16Array.from ArrayLike length=4, element values, int16 wrap/truncate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(-32768);
      source.push(32767);
      source.push(-32768);
      source.push(32767);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 32767;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = -32768;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3);
      let e4: int = 32767;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_4800
     * @tc.name testInt16ArrayFromTestFour048
     * @tc.desc Verify Int16Array.from ArrayLike length=3, element values, int16 wrap/truncate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(100);
      source.push(32767);
      source.push(-32768);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 32767;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = -32768;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_4900
     * @tc.name testInt16ArrayFromTestFour049
     * @tc.desc Verify Int16Array.from ArrayLike length=4, element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(50);
      source.push(-50);
      source.push(100);
      source.push(-100);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = 50;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -50;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 100;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3);
      let e4: int = -100;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_5000
     * @tc.name testInt16ArrayFromTestFour050
     * @tc.desc Verify Int16Array.from ArrayLike length=3, element values, int16 wrap/truncate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(32768);
      source.push(100);
      source.push(-32769);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 100;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 32767;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_5100
     * @tc.name testInt16ArrayFromTestFour051
     * @tc.desc Verify Int16Array.from ArrayLike length=3, element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      for (let _i: int = 0; _i < 3; _i++) {
        source.push(0);
      }
      source[0] = 42;
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = 42;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_5300
     * @tc.name testInt16ArrayFromTestFour053
     * @tc.desc Verify Int16Array.from ArrayLike length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(1);
      source.push(2);
      source.push(3);
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_5400
     * @tc.name testInt16ArrayFromTestFour054
     * @tc.desc Verify Int16Array.from ArrayLike length=3.7, float truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lenVal: number = 3.7;
      let source: Array<number> = [];
      while (source.length <= 0) {
        source.push(0);
      }
      source[0] = 10;
      while (source.length <= 1) {
        source.push(0);
      }
      source[1] = 20;
      while (source.length <= 2) {
        source.push(0);
      }
      source[2] = 30;
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_5500
     * @tc.name testInt16ArrayFromTestFour055
     * @tc.desc Verify Int16Array.from ArrayLike length=10000, element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      for (let _i: int = 0; _i < 10000; _i++) {
        source.push(0);
      }
      source[0] = 1;
      source[9999] = -1;
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.length;
      let e1: int = 10000;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(0);
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(9999);
      let e3: int = -1;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_5600
     * @tc.name testInt16ArrayFromTestFour056
     * @tc.desc Verify Int16Array.from ArrayLike length=2, returns Int16Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(1);
      source.push(2);
      let result: Int16Array = Int16Array.from(source);
      let r1: boolean = result instanceof Int16Array;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_5700
     * @tc.name testInt16ArrayFromTestFour057
     * @tc.desc Verify Int16Array.from ArrayLike length=1, result not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = Array.create<number>(1, 0);
      source[0] = 5;
      let result: Int16Array = Int16Array.from(source);
      let rNull: boolean = result !== null;
      expect(rNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_5800
     * @tc.name testInt16ArrayFromTestFour058
     * @tc.desc Verify Int16Array.from ArrayLike length=3, byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(1);
      source.push(2);
      source.push(3);
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.byteLength;
      let e1: int = 6;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_5900
     * @tc.name testInt16ArrayFromTestFour059
     * @tc.desc Verify Int16Array.from ArrayLike length=2, byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(1);
      source.push(2);
      let result: Int16Array = Int16Array.from(source);
      let r1: int = result.byteOffset;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_6300
     * @tc.name testInt16ArrayFromTestFour063
     * @tc.desc Verify Int16Array.from ArrayLike length=3, element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(30);
      source.push(10);
      source.push(20);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = 30;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 20;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_6600
     * @tc.name testInt16ArrayFromTestFour066
     * @tc.desc Verify Int16Array.from ArrayLike length=2, independent buffers across from calls, $_get(0) value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(1);
      source.push(2);
      let resultA: Int16Array = Int16Array.from(source);
      let resultB: Int16Array = Int16Array.from(source);
      resultA.$_set(0, 99);
      let r1: number = resultB.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_7600
     * @tc.name testInt16ArrayFromTestFour076
     * @tc.desc Verify Int16Array.from ArrayLike length=1, $_get(0) value, int16 wrap/truncate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = Array.create<number>(1, 0);
      source[0] = 1000000;
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = 16960;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_7800
     * @tc.name testInt16ArrayFromTestFour078
     * @tc.desc Verify Int16Array.from ArrayLike length=4, element values, int16 wrap/truncate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(32768);
      source.push(50);
      source.push(-32769);
      source.push(-50);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = 50;
      expect(r2).assertEqual(e2);
      let r3: number = result.$_get(2);
      let e3: int = 32767;
      expect(r3).assertEqual(e3);
      let r4: number = result.$_get(3);
      let e4: int = -50;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_8100
     * @tc.name testInt16ArrayFromTestFour081
     * @tc.desc Verify Int16Array.from ArrayLike length=2, element values, int16 wrap/truncate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(-32769);
      source.push(-100);
      let result: Int16Array = Int16Array.from(source);
      let r1: number = result.$_get(0);
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
      let r2: number = result.$_get(1);
      let e2: int = -100;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FROM_FOUR_8400
     * @tc.name testInt16ArrayFromTestFour084
     * @tc.desc Verify Int16Array.from ArrayLike length=3, source length unchanged after from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFromTestFour084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [];
      source.push(1);
      source.push(2);
      source.push(3);
      Int16Array.from(source);
      let r1: int = source.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });
  });
}
