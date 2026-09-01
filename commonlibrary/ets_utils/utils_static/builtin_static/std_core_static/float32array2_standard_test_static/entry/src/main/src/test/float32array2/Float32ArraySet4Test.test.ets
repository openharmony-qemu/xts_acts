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

export default function Float32ArraySet4Test(): void {
  describe('Float32ArraySet4Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_0100
     * @tc.name testFloat32ArraySetFour001
     * @tc.desc Verify set(0, 9) sets element 0 to 9 and leaves elements 1,2 as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.set(0, 9);
      const element001 = arr.$_get(0);
      expect(element001).assertEqual(9);
      const element001Part2 = arr.$_get(1);
      expect(element001Part2).assertEqual(0);
      const element001Part3 = arr.$_get(2);
      expect(element001Part3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_0200
     * @tc.name testFloat32ArraySetFour002
     * @tc.desc Verify set(0, val:E) and set(0, val:number) both set element 0 to 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1);
      const b = new Float32Array(1);
      const vf = 7;
      const vn: number = 7;
      a.set(0, vf);
      b.set(0, vn);
      const element002 = a.$_get(0);
      expect(element002).assertEqual(7);
      const element002Part2 = b.$_get(0);
      expect(element002Part2).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_0300
     * @tc.name testFloat32ArraySetFour003
     * @tc.desc Verify set(FixedArray) and set(FixedArray, 0) both copy [3,4] to elements 0,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(2);
      const b = new Float32Array(2);
      const src: FixedArray<number> = [3, 4];
      a.set(src);
      b.set(src, 0);
      const element003 = a.$_get(0);
      expect(element003).assertEqual(3);
      const element003Part2 = a.$_get(1);
      expect(element003Part2).assertEqual(4);
      const element003Part3 = b.$_get(0);
      expect(element003Part3).assertEqual(3);
      const element003Part4 = b.$_get(1);
      expect(element003Part4).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_0400
     * @tc.name testFloat32ArraySetFour004
     * @tc.desc Verify set(Float32Array) and set(Float32Array, 0) both copy [8,9] to elements 0,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(2);
      const b = new Float32Array(2);
      const src = Float32Array.of(8.0, 9.0);
      a.set(src);
      b.set(src, 0);
      const element004 = a.$_get(0);
      expect(element004).assertEqual(8);
      const element004Part2 = a.$_get(1);
      expect(element004Part2).assertEqual(9);
      const element004Part3 = b.$_get(0);
      expect(element004Part3).assertEqual(8);
      const element004Part4 = b.$_get(1);
      expect(element004Part4).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_0500
     * @tc.name testFloat32ArraySetFour005
     * @tc.desc Verify set(ArrayLike) and set(ArrayLike, 0) both copy [10,11] to elements 0,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(2);
      const b = new Float32Array(2);
      const src: Array<number> = Array.of(10.0, 11.0);
      a.set(src);
      b.set(src, 0);
      const element005 = a.$_get(0);
      expect(element005).assertEqual(10);
      const element005Part2 = a.$_get(1);
      expect(element005Part2).assertEqual(11);
      const element005Part3 = b.$_get(0);
      expect(element005Part3).assertEqual(10);
      const element005Part4 = b.$_get(1);
      expect(element005Part4).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_0600
     * @tc.name testFloat32ArraySetFour006
     * @tc.desc Verify set with FixedArray, Float32Array, and Array all produce [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      const b = new Float32Array(3);
      const c = new Float32Array(3);
      const d = new Float32Array(3);
      const s1: FixedArray<number> = [1, 2, 3];
      const s2: FixedArray<number> = [1.0, 2.0, 3.0];
      const s3 = Float32Array.of(1.0, 2.0, 3.0);
      const s4: Array<number> = Array.of(1.0, 2.0, 3.0);
      a.set(s1);
      b.set(s2);
      c.set(s3);
      d.set(s4);
      const element006 = a.$_get(0);
      expect(element006).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
      expect(b.$_get(0)).assertEqual(1);
      const element006Part2 = b.$_get(1);
      expect(element006Part2).assertEqual(2);
      expect(b.$_get(2)).assertEqual(3);
      expect(c.$_get(0)).assertEqual(1);
      expect(c.$_get(1)).assertEqual(2);
      const element006Part3 = c.$_get(2);
      expect(element006Part3).assertEqual(3);
      expect(d.$_get(0)).assertEqual(1);
      expect(d.$_get(1)).assertEqual(2);
      expect(d.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_0700
     * @tc.name testFloat32ArraySetFour007
     * @tc.desc Verify set(1, 2) sets element 1 to 2 and leaves element 0 as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.set(1, 2);
      const element007 = arr.$_get(1);
      expect(element007).assertEqual(2);
      const element007Part2 = arr.$_get(0);
      expect(element007Part2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_0800
     * @tc.name testFloat32ArraySetFour008
     * @tc.desc Verify set(FixedArray) copies [100,200] to elements 0,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const src: FixedArray<number> = [100, 200];
      arr.set(src);
      const element008 = arr.$_get(0);
      expect(element008).assertEqual(100);
      const element008Part2 = arr.$_get(1);
      expect(element008Part2).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_0900
     * @tc.name testFloat32ArraySetFour009
     * @tc.desc Verify set(FixedArray) copies [150.5,250.25] to elements 0,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const src: FixedArray<number> = [150.5, 250.25];
      arr.set(src);
      const element009 = arr.$_get(0);
      expect(element009).assertEqual(150.5);
      const element009Part2 = arr.$_get(1);
      expect(element009Part2).assertEqual(250.25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_1000
     * @tc.name testFloat32ArraySetFour010
     * @tc.desc Verify set(Float32Array) copies [11,22] to elements 0,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const src = Float32Array.of(11.0, 22.0);
      arr.set(src);
      const element010 = arr.$_get(0);
      expect(element010).assertEqual(11);
      const element010Part2 = arr.$_get(1);
      expect(element010Part2).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_1100
     * @tc.name testFloat32ArraySetFour011
     * @tc.desc Verify set(ArrayLike) copies [33,44] to elements 0,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const src: Array<number> = Array.of(33.0, 44.0);
      arr.set(src);
      const element011 = arr.$_get(0);
      expect(element011).assertEqual(33);
      const element011Part2 = arr.$_get(1);
      expect(element011Part2).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_1200
     * @tc.name testFloat32ArraySetFour012
     * @tc.desc Verify set(0, val:E) and set(0, val:number) both set element 0 to -5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1);
      const b = new Float32Array(1);
      const vf = -5;
      const vn: number = -5;
      a.set(0, vf);
      b.set(0, vn);
      const element012 = a.$_get(0);
      expect(element012).assertEqual(-5);
      const element012Part2 = b.$_get(0);
      expect(element012Part2).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_1300
     * @tc.name testFloat32ArraySetFour013
     * @tc.desc Verify set(FixedArray, 1) and set(FixedArray<number>, 1) both copy [7,8] at offset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      const b = new Float32Array(3);
      const s1: FixedArray<number> = [7, 8];
      const s2: FixedArray<number> = [7.0, 8.0];
      a.set(s1, 1);
      b.set(s2, 1);
      const element013 = a.$_get(1);
      expect(element013).assertEqual(7);
      const element013Part2 = a.$_get(2);
      expect(element013Part2).assertEqual(8);
      const element013Part3 = b.$_get(1);
      expect(element013Part3).assertEqual(7);
      const element013Part4 = b.$_get(2);
      expect(element013Part4).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_1400
     * @tc.name testFloat32ArraySetFour014
     * @tc.desc Verify set(Float32Array, 1) and set(ArrayLike, 1) both copy [9,10] at offset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      const b = new Float32Array(3);
      const s1 = Float32Array.of(9.0, 10.0);
      const s2: Array<number> = Array.of(9.0, 10.0);
      a.set(s1, 1);
      b.set(s2, 1);
      const element014 = a.$_get(1);
      expect(element014).assertEqual(9);
      const element014Part2 = a.$_get(2);
      expect(element014Part2).assertEqual(10);
      const element014Part3 = b.$_get(1);
      expect(element014Part3).assertEqual(9);
      const element014Part4 = b.$_get(2);
      expect(element014Part4).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_1500
     * @tc.name testFloat32ArraySetFour015
     * @tc.desc Verify set(3, 77) sets element 3 to 77 and leaves element 4 as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(5);
      arr.set(3, 77);
      const element015 = arr.$_get(3);
      expect(element015).assertEqual(77);
      const element015Part2 = arr.$_get(4);
      expect(element015Part2).assertEqual(0);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_1600
     * @tc.name testFloat32ArraySetFour016
     * @tc.desc Verify set(1, val:E) and set(1, val:number) both set element 1 to 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(2);
      const b = new Float32Array(2);
      const vf = 99;
      const vn: number = 99;
      a.set(1, vf);
      b.set(1, vn);
      const element016 = a.$_get(1);
      expect(element016).assertEqual(99);
      const element016Part2 = b.$_get(1);
      expect(element016Part2).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_1700
     * @tc.name testFloat32ArraySetFour017
     * @tc.desc Verify set(FixedArray) and set(Float32Array) both copy [1,2,3] to elements 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      const b = new Float32Array(3);
      const s1: FixedArray<number> = [1, 2, 3];
      const s2 = Float32Array.of(1.0, 2.0, 3.0);
      a.set(s1);
      b.set(s2);
      const element017 = a.$_get(0);
      expect(element017).assertEqual(1);
      const element017Part2 = a.$_get(1);
      expect(element017Part2).assertEqual(2);
      const element017Part3 = a.$_get(2);
      expect(element017Part3).assertEqual(3);
      const element017Part4 = b.$_get(0);
      expect(element017Part4).assertEqual(1);
      const element017Part5 = b.$_get(1);
      expect(element017Part5).assertEqual(2);
      const element017Part6 = b.$_get(2);
      expect(element017Part6).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_1800
     * @tc.name testFloat32ArraySetFour018
     * @tc.desc Verify set(FixedArray<int>) and set(FixedArray<number>) both copy [-1,-2] to elements 0,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(2);
      const b = new Float32Array(2);
      const s1: FixedArray<number> = [-1, -2];
      const s2: FixedArray<number> = [-1.0, -2.0];
      a.set(s1);
      b.set(s2);
      const element018 = a.$_get(0);
      expect(element018).assertEqual(-1);
      const element018Part2 = a.$_get(1);
      expect(element018Part2).assertEqual(-2);
      const element018Part3 = b.$_get(0);
      expect(element018Part3).assertEqual(-1);
      const element018Part4 = b.$_get(1);
      expect(element018Part4).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_1900
     * @tc.name testFloat32ArraySetFour019
     * @tc.desc Verify set(FixedArray) and set(ArrayLike) copy distinct nonzero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(2);
      const b = new Float32Array(2);
      const s1: FixedArray<number> = [1, 2];
      const s2: Array<number> = Array.of(1.0, 2.0);
      a.set(s1);
      b.set(s2);
      const element019 = a.$_get(0);
      expect(element019).assertEqual(1);
      const element019Part2 = a.$_get(1);
      expect(element019Part2).assertEqual(2);
      const element019Part3 = b.$_get(0);
      expect(element019Part3).assertEqual(1);
      const element019Part4 = b.$_get(1);
      expect(element019Part4).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_2000
     * @tc.name testFloat32ArraySetFour020
     * @tc.desc Verify set(FixedArray) and set(0, val:number) both set element 0 to 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(2);
      const b = new Float32Array(2);
      const src: FixedArray<number> = [42];
      const v = 42;
      a.set(src);
      b.set(0, v);
      const element020 = a.$_get(0);
      expect(element020).assertEqual(42);
      const element020Part2 = b.$_get(0);
      expect(element020Part2).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_2100
     * @tc.name testFloat32ArraySetFour021
     * @tc.desc Verify set(FixedArray<number>) and set(0, val:number) both set element 0 to 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(2);
      const b = new Float32Array(2);
      const src: FixedArray<number> = [42.0];
      const v: number = 42;
      a.set(src);
      b.set(0, v);
      const element021 = a.$_get(0);
      expect(element021).assertEqual(42);
      const element021Part2 = b.$_get(0);
      expect(element021Part2).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_2200
     * @tc.name testFloat32ArraySetFour022
     * @tc.desc Verify set(Float32Array) and set(0, val:number) both set element 0 to 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(2);
      const b = new Float32Array(2);
      const src = Float32Array.of(42.0);
      const v: number = 42;
      a.set(src);
      b.set(0, v);
      const element022 = a.$_get(0);
      expect(element022).assertEqual(42);
      const element022Part2 = b.$_get(0);
      expect(element022Part2).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_2300
     * @tc.name testFloat32ArraySetFour023
     * @tc.desc Verify set(0, 5) sets element 0 to 5 without changing length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.set(0, 5);
      expect(arr.length).assertEqual(3);
      const element023 = arr.$_get(0);
      expect(element023).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_2400
     * @tc.name testFloat32ArraySetFour024
     * @tc.desc Verify set(FixedArray, 2) and set(FixedArray<number>, 2) both copy [1,2] at offset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(4);
      const b = new Float32Array(4);
      const s1: FixedArray<number> = [1, 2];
      const s2: FixedArray<number> = [1.0, 2.0];
      a.set(s1, 2);
      b.set(s2, 2);
      const element024 = a.$_get(2);
      expect(element024).assertEqual(1);
      const element024Part2 = a.$_get(3);
      expect(element024Part2).assertEqual(2);
      const element024Part3 = b.$_get(2);
      expect(element024Part3).assertEqual(1);
      const element024Part4 = b.$_get(3);
      expect(element024Part4).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_2500
     * @tc.name testFloat32ArraySetFour025
     * @tc.desc Verify set(Float32Array) and set(ArrayLike) both set element 0 to 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(2);
      const b = new Float32Array(2);
      const s1 = Float32Array.of(7.0);
      const s2: Array<number> = Array.of(7.0);
      a.set(s1);
      b.set(s2);
      const element025 = a.$_get(0);
      expect(element025).assertEqual(7);
      const element025Part2 = b.$_get(0);
      expect(element025Part2).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_2600
     * @tc.name testFloat32ArraySetFour026
     * @tc.desc Verify set(0, val:E) and set(0, val:number) produce same join result '3,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(2);
      const b = new Float32Array(2);
      const vf = 3;
      const vn: number = 3;
      a.set(0, vf);
      b.set(0, vn);
      const joinedValue026 = a.join(',');
      expect(joinedValue026).assertEqual('3,0');
      const joinedValue026Part2 = b.join(',');
      expect(joinedValue026Part2).assertEqual('3,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_2700
     * @tc.name testFloat32ArraySetFour027
     * @tc.desc Verify set(0, val:E) and set(0, val:number) both write 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1);
      const b = new Float32Array(1);
      const vf = 128;
      const vn: number = 128;
      a.set(0, vf);
      b.set(0, vn);
      expect(a.$_get(0)).assertEqual(128);
      expect(b.$_get(0)).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_2800
     * @tc.name testFloat32ArraySetFour028
     * @tc.desc Verify set(FixedArray) and set(ArrayLike) both produce at(-1) equal to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      const b = new Float32Array(3);
      const s1: FixedArray<number> = [1, 2, 3];
      const s2: Array<number> = Array.of(1.0, 2.0, 3.0);
      a.set(s1);
      b.set(s2);
      const atValue028 = a.at(-1);
      expect(atValue028).assertEqual(3);
      const atValue028Part2 = b.at(-1);
      expect(atValue028Part2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_2900
     * @tc.name testFloat32ArraySetFour029
     * @tc.desc Verify set(1, val:E) sets element 1 to 55 and leaves elements 0,2 as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const v = 55;
      arr.set(1, v);
      const element029 = arr.$_get(0);
      expect(element029).assertEqual(0);
      const element029Part2 = arr.$_get(1);
      expect(element029Part2).assertEqual(55);
      const element029Part3 = arr.$_get(2);
      expect(element029Part3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_3000
     * @tc.name testFloat32ArraySetFour030
     * @tc.desc Verify set(FixedArray) copies [1,2] to elements 0,1 and leaves element 2 as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const src: FixedArray<number> = [1, 2];
      arr.set(src);
      const element030 = arr.$_get(0);
      expect(element030).assertEqual(1);
      const element030Part2 = arr.$_get(2);
      expect(element030Part2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_3100
     * @tc.name testFloat32ArraySetFour031
     * @tc.desc Verify set(FixedArray<number>) copies [7,8] to elements 0,1 and leaves element 2 as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const src: FixedArray<number> = [7.0, 8.0];
      arr.set(src);
      const element031 = arr.$_get(0);
      expect(element031).assertEqual(7);
      const element031Part2 = arr.$_get(2);
      expect(element031Part2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_3200
     * @tc.name testFloat32ArraySetFour032
     * @tc.desc Verify set(Float32Array) copies [1,2] to elements 0,1 and leaves element 2 as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const src = Float32Array.of(1.0, 2.0);
      arr.set(src);
      const element032 = arr.$_get(0);
      expect(element032).assertEqual(1);
      const element032Part2 = arr.$_get(2);
      expect(element032Part2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_3300
     * @tc.name testFloat32ArraySetFour033
     * @tc.desc Verify set(ArrayLike) copies [1,2] to elements 0,1 and leaves element 2 as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const src: Array<number> = Array.of(1.0, 2.0);
      arr.set(src);
      const element033 = arr.$_get(0);
      expect(element033).assertEqual(1);
      const element033Part2 = arr.$_get(2);
      expect(element033Part2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_3400
     * @tc.name testFloat32ArraySetFour034
     * @tc.desc Verify set(FixedArray) copies [1,2,3] to elements 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const src: FixedArray<number> = [1, 2, 3];
      arr.set(src);
      const element034 = arr.$_get(0);
      expect(element034).assertEqual(1);
      const element034Part2 = arr.$_get(2);
      expect(element034Part2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_3500
     * @tc.name testFloat32ArraySetFour035
     * @tc.desc Verify set(3, 9) then set(FixedArray) overwrites elements 0,1 and preserves element 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.set(3, 9);
      const src: FixedArray<number> = [1, 2];
      arr.set(src);
      const element035 = arr.$_get(0);
      expect(element035).assertEqual(1);
      const element035Part2 = arr.$_get(3);
      expect(element035Part2).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_3600
     * @tc.name testFloat32ArraySetFour036
     * @tc.desc Verify set(3, 9) then set(FixedArray, 0) overwrites elements 0,1 and preserves element 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.set(3, 9);
      const src: FixedArray<number> = [1, 2];
      arr.set(src, 0);
      const element036 = arr.$_get(0);
      expect(element036).assertEqual(1);
      const element036Part2 = arr.$_get(3);
      expect(element036Part2).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_3700
     * @tc.name testFloat32ArraySetFour037
     * @tc.desc Verify set(3, 9) then set(FixedArray) and set(FixedArray, 0) both preserve element 3 as 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(4);
      const b = new Float32Array(4);
      a.set(3, 9);
      b.set(3, 9);
      const src: FixedArray<number> = [1.0, 2.0];
      a.set(src);
      b.set(src, 0);
      const element037 = a.$_get(3);
      expect(element037).assertEqual(9);
      const element037Part2 = b.$_get(3);
      expect(element037Part2).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_3800
     * @tc.name testFloat32ArraySetFour038
     * @tc.desc Verify set(3, 9) then set(Float32Array) and set(Float32Array, 0) both preserve element 3 as 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(4);
      const b = new Float32Array(4);
      a.set(3, 9);
      b.set(3, 9);
      const src = Float32Array.of(1.0, 2.0);
      a.set(src);
      b.set(src, 0);
      const element038 = a.$_get(3);
      expect(element038).assertEqual(9);
      const element038Part2 = b.$_get(3);
      expect(element038Part2).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_3900
     * @tc.name testFloat32ArraySetFour039
     * @tc.desc Verify set(3, 9) then set(ArrayLike) and set(ArrayLike, 0) both preserve element 3 as 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(4);
      const b = new Float32Array(4);
      a.set(3, 9);
      b.set(3, 9);
      const src: Array<number> = Array.of(1.0, 2.0);
      a.set(src);
      b.set(src, 0);
      const element039 = a.$_get(3);
      expect(element039).assertEqual(9);
      const element039Part2 = b.$_get(3);
      expect(element039Part2).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_4000
     * @tc.name testFloat32ArraySetFour040
     * @tc.desc Verify set(FixedArray) and set(FixedArray, 0) both throw RangeError when source exceeds target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const src: FixedArray<number> = [1, 2, 3, 4];
      try {
        arr.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        arr.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_4100
     * @tc.name testFloat32ArraySetFour041
     * @tc.desc Verify set(Float32Array) and set(Float32Array, 0) both throw RangeError when source exceeds target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const src = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      try {
        arr.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        arr.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_4200
     * @tc.name testFloat32ArraySetFour042
     * @tc.desc Verify set(ArrayLike) and set(ArrayLike, 0) both throw RangeError when source exceeds target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const src: Array<number> = Array.of(1.0, 2.0, 3.0, 4.0);
      try {
        arr.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        arr.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_4300
     * @tc.name testFloat32ArraySetFour043
     * @tc.desc Verify set(FixedArray) and set(FixedArray, 0) both keep target length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      const b = new Float32Array(3);
      const src: FixedArray<number> = [1, 2];
      a.set(src);
      b.set(src, 0);
      expect(a.length).assertEqual(3);
      expect(b.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(b.$_get(0)).assertEqual(1);
      expect(b.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_4400
     * @tc.name testFloat32ArraySetFour044
     * @tc.desc Verify set(FixedArray) and set(FixedArray, 0) both copy [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      const b = new Float32Array(3);
      const src: FixedArray<number> = [1.0, 2.0];
      a.set(src);
      b.set(src, 0);
      expect(a.$_get(0)).assertEqual(1.0);
      expect(a.$_get(1)).assertEqual(2.0);
      expect(b.$_get(0)).assertEqual(1.0);
      expect(b.$_get(1)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_4500
     * @tc.name testFloat32ArraySetFour045
     * @tc.desc Verify set(0, val:E) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = 1;
      const r = arr.set(0, v);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_4600
     * @tc.name testFloat32ArraySetFour046
     * @tc.desc Verify set(0, val:number) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const r = arr.set(0, 1);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_4700
     * @tc.name testFloat32ArraySetFour047
     * @tc.desc Verify set(FixedArray) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const src: FixedArray<number> = [1, 2];
      const r = arr.set(src);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_4800
     * @tc.name testFloat32ArraySetFour048
     * @tc.desc Verify set(FixedArray<number>, insertPos) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const src: FixedArray<number> = [1.0, 2.0];
      const r = arr.set(src, 1);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_4900
     * @tc.name testFloat32ArraySetFour049
     * @tc.desc Verify set(Float32Array) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const src = Float32Array.of(1.0, 2.0);
      const r = arr.set(src);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_5000
     * @tc.name testFloat32ArraySetFour050
     * @tc.desc Verify set(Float32Array, offset) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const src = Float32Array.of(1.0, 2.0);
      const r = arr.set(src, 1);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_5100
     * @tc.name testFloat32ArraySetFour051
     * @tc.desc Verify set(ArrayLike, offset) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const src: Array<number> = Array.of(1.0, 2.0);
      const r = arr.set(src, 1);
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_5200
     * @tc.name testFloat32ArraySetFour052
     * @tc.desc Verify set(FixedArray) and set(Float32Array) both produce toString '1,2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(2);
      const b = new Float32Array(2);
      const s1: FixedArray<number> = [1, 2];
      const s2 = Float32Array.of(1.0, 2.0);
      a.set(s1);
      b.set(s2);
      const observedValue053 = a.toString();
      expect(observedValue053).assertEqual('1,2');
      const observedValue053Part2 = b.toString();
      expect(observedValue053Part2).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_5300
     * @tc.name testFloat32ArraySetFour053
     * @tc.desc Verify set(FixedArray) and set(ArrayLike) both keep target length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      const b = new Float32Array(3);
      const s1: FixedArray<number> = [1, 2];
      const s2: Array<number> = Array.of(1.0, 2.0);
      a.set(s1);
      b.set(s2);
      expect(a.length).assertEqual(3);
      expect(b.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(b.$_get(0)).assertEqual(1);
      expect(b.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_5400
     * @tc.name testFloat32ArraySetFour054
     * @tc.desc Verify set(FixedArray) does not change the buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const buf = arr.buffer;
      const src: FixedArray<number> = [1, 2, 3];
      arr.set(src);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_5500
     * @tc.name testFloat32ArraySetFour055
     * @tc.desc Verify set(FixedArray) does not change byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const off = arr.byteOffset;
      const src: FixedArray<number> = [1.0, 2.0, 3.0];
      arr.set(src);
      expect(arr.byteOffset).assertEqual(off);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_5600
     * @tc.name testFloat32ArraySetFour056
     * @tc.desc Verify set(Float32Array) does not change byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const bl = arr.byteLength;
      const src = Float32Array.of(1.0, 2.0, 3.0);
      arr.set(src);
      expect(arr.byteLength).assertEqual(bl);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_5700
     * @tc.name testFloat32ArraySetFour057
     * @tc.desc Verify set(1, val:E) and set(1, val:number) produce same join result '0,5,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      const b = new Float32Array(3);
      const vf = 5;
      a.set(1, vf);
      b.set(1, 5);
      const joinedValue058 = a.join(',');
      expect(joinedValue058).assertEqual('0,5,0');
      const joinedValue058Part2 = b.join(',');
      expect(joinedValue058Part2).assertEqual('0,5,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_5800
     * @tc.name testFloat32ArraySetFour058
     * @tc.desc Verify set(FixedArray<int>) and set(FixedArray<number>) both set element 1 to 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(3);
      const b = new Float32Array(3);
      const s1: FixedArray<number> = [10, 20, 30];
      const s2: FixedArray<number> = [10.0, 20.0, 30.0];
      a.set(s1);
      b.set(s2);
      const element059 = a.$_get(1);
      expect(element059).assertEqual(20);
      const element059Part2 = b.$_get(1);
      expect(element059Part2).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_5900
     * @tc.name testFloat32ArraySetFour059
     * @tc.desc Verify set(FixedArray) copies [7,8] to elements 0,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const src: FixedArray<number> = [7, 8];
      arr.set(src);
      const element060 = arr.$_get(0);
      expect(element060).assertEqual(7);
      const element060Part2 = arr.$_get(1);
      expect(element060Part2).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_6000
     * @tc.name testFloat32ArraySetFour060
     * @tc.desc Verify set(FixedArray) and set(Float32Array) both produce at(0) equal to 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(2);
      const b = new Float32Array(2);
      const s1: FixedArray<number> = [4, 5];
      const s2 = Float32Array.of(4.0, 5.0);
      a.set(s1);
      b.set(s2);
      const atValue061 = a.at(0);
      expect(atValue061).assertEqual(4);
      const atValue061Part2 = b.at(0);
      expect(atValue061Part2).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_6100
     * @tc.name testFloat32ArraySetFour061
     * @tc.desc Verify set(FixedArray, 10) throws RangeError and target length remains 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const src: FixedArray<number> = [1, 2];
      try {
        arr.set(src, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_6200
     * @tc.name testFloat32ArraySetFour062
     * @tc.desc Verify set(FixedArray, 10) throws RangeError and target reference unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const src: FixedArray<number> = [1, 2];
      try {
        arr.set(src, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_6300
     * @tc.name testFloat32ArraySetFour063
     * @tc.desc Verify set(FixedArray, 10) throws RangeError and prior set(0, 5) is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.set(0, 5);
      const src: FixedArray<number> = [1, 2];
      try {
        arr.set(src, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const element064 = arr.$_get(0);
      expect(element064).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_6400
     * @tc.name testFloat32ArraySetFour064
     * @tc.desc Verify set(FixedArray, 10) throws RangeError and subsequent set(0, 9) still works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const src: FixedArray<number> = [1, 2];
      try {
        arr.set(src, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      arr.set(0, 9);
      const element065 = arr.$_get(0);
      expect(element065).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_6500
     * @tc.name testFloat32ArraySetFour065
     * @tc.desc Verify set(FixedArray, 10) throws RangeError and elements 0,1 remain 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const src: FixedArray<number> = [1, 2];
      try {
        arr.set(src, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const element066 = arr.$_get(0);
      expect(element066).assertEqual(0);
      const element066Part2 = arr.$_get(1);
      expect(element066Part2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_6600
     * @tc.name testFloat32ArraySetFour066
     * @tc.desc Verify set(FixedArray) throws RangeError when source exceeds target and byteLength remains 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const src: FixedArray<number> = [1, 2, 3, 4];
      try {
        arr.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_6700
     * @tc.name testFloat32ArraySetFour067
     * @tc.desc Verify set(FixedArray) throws RangeError when source exceeds target and byteOffset remains 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const src: FixedArray<number> = [1, 2, 3, 4];
      try {
        arr.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_6800
     * @tc.name testFloat32ArraySetFour068
     * @tc.desc Verify set(Float32Array, 5) throws RangeError and element 0 remains 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const src = Float32Array.of(1.0, 2.0);
      try {
        arr.set(src, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const element069 = arr.$_get(0);
      expect(element069).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_6900
     * @tc.name testFloat32ArraySetFour069
     * @tc.desc Verify set(ArrayLike, 5) throws RangeError and element 0 remains 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const src: Array<number> = Array.of(1.0, 2.0);
      try {
        arr.set(src, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const element070 = arr.$_get(0);
      expect(element070).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_7000
     * @tc.name testFloat32ArraySetFour070
     * @tc.desc Verify set(FixedArray) and set(FixedArray, 1) both throw RangeError and length remains 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const src: FixedArray<number> = [1, 2, 3];
      try {
        arr.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        arr.set(src, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_7100
     * @tc.name testFloat32ArraySetFour071
     * @tc.desc Verify set(FixedArray, 10) throws RangeError and prior set(1, 7) is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.set(1, 7);
      const src: FixedArray<number> = [1, 2];
      try {
        arr.set(src, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const element072 = arr.$_get(1);
      expect(element072).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_7200
     * @tc.name testFloat32ArraySetFour072
     * @tc.desc Verify set(FixedArray, 10) throws RangeError and values() still yields first element 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.set(0, 4);
      const src: FixedArray<number> = [1, 2];
      try {
        arr.set(src, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const it = arr.values();
      const first = it.next();
      expect(first.value).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_7300
     * @tc.name testFloat32ArraySetFour073
     * @tc.desc Verify set(FixedArray, 10) throws RangeError and join still yields '6,0,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.set(0, 6);
      const src: FixedArray<number> = [1, 2];
      try {
        arr.set(src, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const joinedValue074 = arr.join(',');
      expect(joinedValue074).assertEqual('6,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_7400
     * @tc.name testFloat32ArraySetFour074
     * @tc.desc Verify set(FixedArray) throws RangeError and subsequent set(Float32Array) copies [5,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const src1: FixedArray<number> = [1, 2, 3, 4];
      try {
        arr.set(src1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const src2 = Float32Array.of(5.0, 6.0);
      arr.set(src2);
      const element075 = arr.$_get(0);
      expect(element075).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_7500
     * @tc.name testFloat32ArraySetFour075
     * @tc.desc Verify set(FixedArray, 10) throws RangeError and subsequent set(FixedArray, 0) copies [3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const src1: FixedArray<number> = [1.0, 2.0];
      try {
        arr.set(src1, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const src2: FixedArray<number> = [3, 4];
      arr.set(src2, 0);
      const element076 = arr.$_get(0);
      expect(element076).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_7600
     * @tc.name testFloat32ArraySetFour076
     * @tc.desc Verify set(FixedArray, 10) throws RangeError and buffer reference unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const buf = arr.buffer;
      const src: FixedArray<number> = [1, 2];
      try {
        arr.set(src, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_7700
     * @tc.name testFloat32ArraySetFour077
     * @tc.desc Verify set(FixedArray, 10) throws RangeError and values() still yields 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const src: FixedArray<number> = [1, 2];
      try {
        arr.set(src, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const it = arr.values();
      let count = 0;
      let r = it.next();
      while (!r.done) {
        count = count + 1;
        r = it.next();
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_7800
     * @tc.name testFloat32ArraySetFour078
     * @tc.desc Verify set(FixedArray, 10) throws RangeError on Float32Array(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const src: FixedArray<number> = [1, 2];
      try {
        arr.set(src, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_7900
     * @tc.name testFloat32ArraySetFour079
     * @tc.desc Verify set(FixedArray, 4) throws RangeError and length remains 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(5);
      const src: FixedArray<number> = [1, 2, 3];
      try {
        arr.set(src, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_8000
     * @tc.name testFloat32ArraySetFour080
     * @tc.desc Verify set(FixedArray, 10) throws RangeError and $_get(-1) also throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const src: FixedArray<number> = [1, 2];
      try {
        arr.set(src, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        arr.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_8100
     * @tc.name testFloat32ArraySetFour081
     * @tc.desc Verify set(Float32Array) copies values and mutating source does not affect target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(1.0, 2.0);
      const arr = new Float32Array(2);
      arr.set(src);
      src.set(0, 99);
      src.set(1, 88);
      const element082 = arr.$_get(0);
      expect(element082).assertEqual(1);
      const element082Part2 = arr.$_get(1);
      expect(element082Part2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_8200
     * @tc.name testFloat32ArraySetFour082
     * @tc.desc Verify set(FixedArray) copies values and mutating one target does not affect another
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1, 2];
      const a = new Float32Array(2);
      const b = new Float32Array(2);
      a.set(src);
      b.set(src);
      a.set(0, 99);
      const element083 = a.$_get(0);
      expect(element083).assertEqual(99);
      const element083Part2 = b.$_get(0);
      expect(element083Part2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_8300
     * @tc.name testFloat32ArraySetFour083
     * @tc.desc Verify set(ArrayLike) copies values and mutating source does not affect target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = Array.of(1.0, 2.0);
      const arr = new Float32Array(2);
      arr.set(src);
      src.$_set(0, 99);
      const element084 = arr.$_get(0);
      expect(element084).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_8400
     * @tc.name testFloat32ArraySetFour084
     * @tc.desc Verify set(FixedArray) on shared ArrayBuffer view is visible to overlapping view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const a = new Float32Array(buf, 0, 2);
      const b = new Float32Array(buf, 4, 2);
      const src: FixedArray<number> = [7, 8];
      a.set(src);
      const element085 = b.$_get(0);
      expect(element085).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_8500
     * @tc.name testFloat32ArraySetFour085
     * @tc.desc Verify set(self, 0) is a no-op and all elements remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      arr.set(0, 1);
      arr.set(1, 2);
      arr.set(2, 3);
      arr.set(3, 4);
      arr.set(arr, 0);
      const element086 = arr.$_get(0);
      expect(element086).assertEqual(1);
      const element086Part2 = arr.$_get(3);
      expect(element086Part2).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_8600
     * @tc.name testFloat32ArraySetFour086
     * @tc.desc Verify set(self) is a no-op and all elements remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 6.0, 7.0);
      arr.set(arr);
      const element087 = arr.$_get(0);
      expect(element087).assertEqual(5);
      const element087Part2 = arr.$_get(2);
      expect(element087Part2).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_8700
     * @tc.name testFloat32ArraySetFour087
     * @tc.desc Verify set(self, 1) throws RangeError because source exceeds remaining target length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      try {
        arr.set(arr, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_8800
     * @tc.name testFloat32ArraySetFour088
     * @tc.desc Verify set(Float32Array) does not change the buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const buf = arr.buffer;
      const src = Float32Array.of(1.0, 2.0, 3.0);
      arr.set(src);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_8900
     * @tc.name testFloat32ArraySetFour089
     * @tc.desc Verify set(FixedArray) then set(Float32Array) overwrites elements 0,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf);
      const s1: FixedArray<number> = [1, 2];
      arr.set(s1);
      const element090 = arr.$_get(0);
      expect(element090).assertEqual(1);
      const s2 = Float32Array.of(3.0, 4.0);
      arr.set(s2);
      const element090Part2 = arr.$_get(0);
      expect(element090Part2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_9000
     * @tc.name testFloat32ArraySetFour090
     * @tc.desc Verify set(FixedArray) on subarray writes through to parent at offset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const parent = new Float32Array(buf);
      const child = parent.subarray(2, 4);
      const src: FixedArray<number> = [7, 8];
      child.set(src);
      const element093 = parent.$_get(2);
      expect(element093).assertEqual(7);
      const element093Part2 = parent.$_get(3);
      expect(element093Part2).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_9100
     * @tc.name testFloat32ArraySetFour091
     * @tc.desc Verify set(FixedArray) on subarray writes through to parent and leaves outside unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float32Array.of(0.0, 0.0, 0.0, 0.0);
      const child = parent.subarray(1, 3);
      const src: FixedArray<number> = [9, 9];
      child.set(src);
      const element094 = parent.$_get(1);
      expect(element094).assertEqual(9);
      const element094Part2 = parent.$_get(3);
      expect(element094Part2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_9200
     * @tc.name testFloat32ArraySetFour092
     * @tc.desc Verify set(ArrayLike) with 16777217.0 rounds to 16777216 in float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const src: Array<number> = Array.of(16777217.0);
      arr.set(src);
      const element095 = arr.$_get(0);
      expect(element095).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_9300
     * @tc.name testFloat32ArraySetFour093
     * @tc.desc Verify set(ArrayLike) with 1.0e40 yields Infinity in float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const src: Array<number> = Array.of(1.0e40);
      arr.set(src);
      const element096 = arr.$_get(0);
      expect(element096).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SET_FOUR_9400
     * @tc.name testFloat32ArraySetFour094
     * @tc.desc Verify set(0, NaN) sets element 0 to NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySetFour094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const v = Number.NaN;
      arr.set(0, v);
      const element097 = arr.$_get(0);
      expect(element097).assertNaN();
    });

  });
}
