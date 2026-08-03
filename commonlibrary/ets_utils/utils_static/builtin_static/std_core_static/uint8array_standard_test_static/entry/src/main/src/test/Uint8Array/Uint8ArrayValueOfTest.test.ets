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

export default function Uint8ArrayValueOfTest(): void {
  describe('Uint8ArrayValueOfTest', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_0100
     * @tc.name testUint8ArrayValueOf001
     * @tc.desc Verify valueOf() no-arg call returns self reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array(8);
      let r = a.valueOf();
      expect(r).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_0200
     * @tc.name testUint8ArrayValueOf002
     * @tc.desc Verify valueOf returns self reference for empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array(0);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_0300
     * @tc.name testUint8ArrayValueOf003
     * @tc.desc Verify valueOf returns self reference for single-element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array(1);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_0400
     * @tc.name testUint8ArrayValueOf004
     * @tc.desc Verify valueOf returns self reference for multi-element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3]);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_0500
     * @tc.name testUint8ArrayValueOf005
     * @tc.desc Verify valueOf returns self reference for array created by Uint8Array.of
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = Uint8Array.of(1, 2, 3);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_0600
     * @tc.name testUint8ArrayValueOf006
     * @tc.desc Verify valueOf returns self reference for array created by Uint8Array.from
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = Uint8Array.from([1, 2, 3]);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_0700
     * @tc.name testUint8ArrayValueOf007
     * @tc.desc Verify valueOf returns self reference for array constructed from ArrayBuffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a = new Uint8Array(buf);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_0800
     * @tc.name testUint8ArrayValueOf008
     * @tc.desc Verify valueOf returns self reference for array constructed from ArrayBuffer with offset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a = new Uint8Array(buf, 4);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_0900
     * @tc.name testUint8ArrayValueOf009
     * @tc.desc Verify valueOf returns self reference for array constructed from ArrayBuffer with offset and length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a = new Uint8Array(buf, 2, 3);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_1000
     * @tc.name testUint8ArrayValueOf010
     * @tc.desc Verify valueOf returns self reference after fill(0)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array(3);
      a.fill(0);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_1100
     * @tc.name testUint8ArrayValueOf011
     * @tc.desc Verify valueOf returns self reference after fill(255)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array(3);
      a.fill(255);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_1200
     * @tc.name testUint8ArrayValueOf012
     * @tc.desc Verify valueOf returns self reference after set
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array(5);
      a.set([1, 2], 1);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_1300
     * @tc.name testUint8ArrayValueOf013
     * @tc.desc Verify valueOf returns self reference after copyWithin
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3, 4, 5]);
      a.copyWithin(0, 2);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_1400
     * @tc.name testUint8ArrayValueOf014
     * @tc.desc Verify valueOf returns self reference after reverse
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3]);
      a.reverse();
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_1500
     * @tc.name testUint8ArrayValueOf015
     * @tc.desc Verify valueOf returns self reference after sort
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([3, 1, 2]);
      a.sort();
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_1600
     * @tc.name testUint8ArrayValueOf016
     * @tc.desc Verify valueOf returns self reference after index assignment
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array(3);
      a[0] = 10;
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_1700
     * @tc.name testUint8ArrayValueOf017
     * @tc.desc Verify two consecutive valueOf calls return the same reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array(3);
      expect(a.valueOf()).assertEqual(a.valueOf());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_1800
     * @tc.name testUint8ArrayValueOf018
     * @tc.desc Verify valueOf returns self reference after multi-operation chain
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3]);
      a.fill(1);
      a.reverse();
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_1900
     * @tc.name testUint8ArrayValueOf019
     * @tc.desc Verify valueOf preserves element value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([0]);
      expect(a.valueOf()[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_2000
     * @tc.name testUint8ArrayValueOf020
     * @tc.desc Verify valueOf preserves element value 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([255]);
      expect(a.valueOf()[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_2100
     * @tc.name testUint8ArrayValueOf021
     * @tc.desc Verify valueOf preserves element value 127
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([127]);
      expect(a.valueOf()[0]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_2200
     * @tc.name testUint8ArrayValueOf022
     * @tc.desc Verify valueOf preserves element value 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1]);
      expect(a.valueOf()[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_2300
     * @tc.name testUint8ArrayValueOf023
     * @tc.desc Verify valueOf preserves element value 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([128]);
      expect(a.valueOf()[0]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_2400
     * @tc.name testUint8ArrayValueOf024
     * @tc.desc Verify valueOf preserves element value 254
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([254]);
      expect(a.valueOf()[0]).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_2500
     * @tc.name testUint8ArrayValueOf025
     * @tc.desc Verify valueOf preserves elements of multi-element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([10, 20, 30]);
      let r = a.valueOf();
      expect(r[0]).assertEqual(10);
      expect(r[1]).assertEqual(20);
      expect(r[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_2600
     * @tc.name testUint8ArrayValueOf026
     * @tc.desc Verify valueOf preserves elements after fill(42)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array(3);
      a.fill(42);
      let r = a.valueOf();
      expect(r[0]).assertEqual(42);
      expect(r[1]).assertEqual(42);
      expect(r[2]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_2700
     * @tc.name testUint8ArrayValueOf027
     * @tc.desc Verify valueOf preserves elements after set
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array(5);
      a.set([1, 2], 1);
      let r = a.valueOf();
      expect(r[0]).assertEqual(0);
      expect(r[1]).assertEqual(1);
      expect(r[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_2800
     * @tc.name testUint8ArrayValueOf028
     * @tc.desc Verify valueOf preserves elements after copyWithin
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3, 4, 5]);
      a.copyWithin(0, 2);
      let r = a.valueOf();
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_2900
     * @tc.name testUint8ArrayValueOf029
     * @tc.desc Verify valueOf preserves elements after reverse
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3]);
      a.reverse();
      let r = a.valueOf();
      expect(r[0]).assertEqual(3);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_3000
     * @tc.name testUint8ArrayValueOf030
     * @tc.desc Verify valueOf preserves elements after sort
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([3, 1, 2]);
      a.sort();
      let r = a.valueOf();
      expect(r[0]).assertEqual(1);
      expect(r[1]).assertEqual(2);
      expect(r[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_3100
     * @tc.name testUint8ArrayValueOf031
     * @tc.desc Verify valueOf preserves elements after index assignment
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array(3);
      a[0] = 10;
      a[1] = 20;
      let r = a.valueOf();
      expect(r[0]).assertEqual(10);
      expect(r[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_3200
     * @tc.name testUint8ArrayValueOf032
     * @tc.desc Verify valueOf preserves elements from Uint8Array.from
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = Uint8Array.from([5, 10, 15]);
      let r = a.valueOf();
      expect(r[0]).assertEqual(5);
      expect(r[1]).assertEqual(10);
      expect(r[2]).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_3300
     * @tc.name testUint8ArrayValueOf033
     * @tc.desc Verify valueOf preserves elements from Uint8Array.of
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = Uint8Array.of(7, 14, 21);
      let r = a.valueOf();
      expect(r[0]).assertEqual(7);
      expect(r[1]).assertEqual(14);
      expect(r[2]).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_3400
     * @tc.name testUint8ArrayValueOf034
     * @tc.desc Verify valueOf result has same length property
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3]);
      let r = a.valueOf();
      expect(r.length).assertEqual(a.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_3500
     * @tc.name testUint8ArrayValueOf035
     * @tc.desc Verify valueOf result has same buffer property
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3]);
      let r = a.valueOf();
      expect(r.buffer).assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_3600
     * @tc.name testUint8ArrayValueOf036
     * @tc.desc Verify valueOf result has same constructor property
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3]);
      let r = a.valueOf();
      expect(r.length).assertEqual(3);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_3700
     * @tc.name testUint8ArrayValueOf037
     * @tc.desc Verify valueOf result shares the same ArrayBuffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3]);
      let r = a.valueOf();
      expect(r.buffer).assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_3800
     * @tc.name testUint8ArrayValueOf038
     * @tc.desc Verify modifying valueOf result element affects original array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3]);
      let r = a.valueOf();
      r[0] = 100;
      expect(a[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_3900
     * @tc.name testUint8ArrayValueOf039
     * @tc.desc Verify modifying original array affects valueOf result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3]);
      let r = a.valueOf();
      a[0] = 200;
      expect(r[0]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_4000
     * @tc.name testUint8ArrayValueOf040
     * @tc.desc Verify valueOf result supports fill method
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array(3);
      let r = a.valueOf();
      r.fill(5);
      expect(a[0]).assertEqual(5);
      expect(a[1]).assertEqual(5);
      expect(a[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_4100
     * @tc.name testUint8ArrayValueOf041
     * @tc.desc Verify valueOf result supports reverse method
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3]);
      let r = a.valueOf();
      r.reverse();
      expect(a[0]).assertEqual(3);
      expect(a[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_4200
     * @tc.name testUint8ArrayValueOf042
     * @tc.desc Verify valueOf result supports sort method
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([3, 1, 2]);
      let r = a.valueOf();
      r.sort();
      expect(a[0]).assertEqual(1);
      expect(a[1]).assertEqual(2);
      expect(a[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_4300
     * @tc.name testUint8ArrayValueOf043
     * @tc.desc Verify valueOf result supports set method
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array(5);
      let r = a.valueOf();
      r.set([1, 2], 1);
      expect(a[1]).assertEqual(1);
      expect(a[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_4400
     * @tc.name testUint8ArrayValueOf044
     * @tc.desc Verify valueOf result supports copyWithin method
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3, 4, 5]);
      let r = a.valueOf();
      r.copyWithin(0, 2);
      expect(a[0]).assertEqual(3);
      expect(a[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_4500
     * @tc.name testUint8ArrayValueOf045
     * @tc.desc Verify valueOf result supports subarray method
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3, 4, 5]);
      let r = a.valueOf();
      let sub = r.subarray(1, 3);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_4600
     * @tc.name testUint8ArrayValueOf046
     * @tc.desc Verify valueOf result supports slice method
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3, 4, 5]);
      let r = a.valueOf();
      let sliced = r.slice(1, 3);
      expect(sliced[0]).assertEqual(2);
      expect(sliced[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_4700
     * @tc.name testUint8ArrayValueOf047
     * @tc.desc Verify valueOf result supports map method
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3]);
      let r = a.valueOf();
      let mapped = r.map((v: number) => v * 2);
      expect(mapped[0]).assertEqual(2);
      expect(mapped[1]).assertEqual(4);
      expect(mapped[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_4800
     * @tc.name testUint8ArrayValueOf048
     * @tc.desc Verify valueOf result supports filter method
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3]);
      let r = a.valueOf();
      let filtered = r.filter((v: number) => v >= 2);
      expect(filtered[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_4900
     * @tc.name testUint8ArrayValueOf049
     * @tc.desc Verify modifying valueOf result via fill affects original array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array(3);
      let r = a.valueOf();
      r.fill(10);
      expect(a[0]).assertEqual(10);
      expect(a[1]).assertEqual(10);
      expect(a[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_5000
     * @tc.name testUint8ArrayValueOf050
     * @tc.desc Verify modifying valueOf result via copyWithin affects original array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3, 4, 5]);
      let r = a.valueOf();
      r.copyWithin(0, 2);
      expect(a[0]).assertEqual(3);
      expect(a[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_5100
     * @tc.name testUint8ArrayValueOf051
     * @tc.desc Verify modifying valueOf result via index assignment affects original array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3]);
      let r = a.valueOf();
      r[1] = 50;
      expect(a[1]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_5200
     * @tc.name testUint8ArrayValueOf052
     * @tc.desc Verify original array reverse causes valueOf result to change synchronously
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3]);
      let r = a.valueOf();
      a.reverse();
      expect(r[0]).assertEqual(3);
      expect(r[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_5300
     * @tc.name testUint8ArrayValueOf053
     * @tc.desc Verify original array set causes valueOf result to change synchronously
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array(5);
      let r = a.valueOf();
      a.set([11, 22], 1);
      expect(r[1]).assertEqual(11);
      expect(r[2]).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_5400
     * @tc.name testUint8ArrayValueOf054
     * @tc.desc Verify original array index assignment causes valueOf result to change synchronously
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3]);
      let r = a.valueOf();
      a[0] = 99;
      expect(r[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_5500
     * @tc.name testUint8ArrayValueOf055
     * @tc.desc Verify subarray of valueOf result shares buffer with original array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3, 4, 5]);
      let r = a.valueOf();
      let sub = r.subarray(1, 3);
      expect(sub.buffer).assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_5600
     * @tc.name testUint8ArrayValueOf056
     * @tc.desc Verify modifying subarray of valueOf result affects original array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3, 4, 5]);
      let r = a.valueOf();
      let sub = r.subarray(1, 3);
      sub[0] = 99;
      expect(a[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_5700
     * @tc.name testUint8ArrayValueOf057
     * @tc.desc Verify slice of valueOf result is independent from original array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3, 4, 5]);
      let r = a.valueOf();
      let sliced = r.slice(1, 3);
      expect(sliced[0]).assertEqual(2);
      expect(sliced[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_5800
     * @tc.name testUint8ArrayValueOf058
     * @tc.desc Verify modifying slice of valueOf result does not affect original array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3, 4, 5]);
      let r = a.valueOf();
      let sliced = r.slice(1, 3);
      sliced[0] = 99;
      expect(a[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_5900
     * @tc.name testUint8ArrayValueOf059
     * @tc.desc Verify valueOf result unchanged after original array slice
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3, 4, 5]);
      let sliced = a.slice(1, 3);
      sliced[0] = 77;
      let r = a.valueOf();
      expect(r[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_6000
     * @tc.name testUint8ArrayValueOf060
     * @tc.desc Verify valueOf preserves element constructed from float (3.14 becomes 3)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([3.14]);
      expect(a.valueOf()[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_6100
     * @tc.name testUint8ArrayValueOf061
     * @tc.desc Verify valueOf preserves element constructed from negative (-1 becomes 255)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([-1]);
      expect(a.valueOf()[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_6200
     * @tc.name testUint8ArrayValueOf062
     * @tc.desc Verify valueOf preserves element constructed from scientific notation (1e2 becomes 100)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1e2]);
      expect(a.valueOf()[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_6300
     * @tc.name testUint8ArrayValueOf063
     * @tc.desc Verify valueOf result toString equals original array toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3]);
      expect(a.valueOf().toString()).assertEqual(a.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_6400
     * @tc.name testUint8ArrayValueOf064
     * @tc.desc Verify valueOf result serializes correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3]);
      expect(JSON.stringify(a.valueOf())).assertEqual('{"0":1,"1":2,"2":3}');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_6500
     * @tc.name testUint8ArrayValueOf065
     * @tc.desc Verify valueOf result supports includes method
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3]);
      expect(a.valueOf().includes(2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_6600
     * @tc.name testUint8ArrayValueOf066
     * @tc.desc Verify valueOf result supports indexOf method
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3]);
      expect(a.valueOf().indexOf(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_6700
     * @tc.name testUint8ArrayValueOf067
     * @tc.desc Verify valueOf result supports some method
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3]);
      expect(a.valueOf().some((v: number) => v > 2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_6800
     * @tc.name testUint8ArrayValueOf068
     * @tc.desc Verify valueOf result supports every method
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3]);
      expect(a.valueOf().every((v: number) => v > 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_VALUE_OF_6900
     * @tc.name testUint8ArrayValueOf069
     * @tc.desc Verify valueOf result supports find method
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayValueOf069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Uint8Array([1, 2, 3]);
      expect(a.valueOf().find((v: number) => v === 2)).assertEqual(2);
    });
  });
}
