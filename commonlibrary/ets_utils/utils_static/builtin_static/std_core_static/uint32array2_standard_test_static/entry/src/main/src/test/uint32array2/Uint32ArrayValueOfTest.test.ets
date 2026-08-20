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

export default function uint32ArrayValueOfTest(): void {
  describe('Uint32ArrayValueOfTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUEOF_0100
     * @tc.name testUint32ArrayValueOf001
     * @tc.desc Verify valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValueOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(7);
      let v: Uint32Array = arr.valueOf();
      expect(v).assertEqual(arr);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUEOF_0200
     * @tc.name testUint32ArrayValueOf002
     * @tc.desc Verify new Uint32Array(array) valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValueOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([10, 20, 30]);
      let v: Uint32Array = arr.valueOf();
      expect(v).assertEqual(arr);
      expect(v.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUEOF_0300
     * @tc.name testUint32ArrayValueOf003
     * @tc.desc Verify new Uint32Array(buffer, offset, length) valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValueOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Uint32Array = new Uint32Array(buf, 0, 4);
      let v: Uint32Array = arr.valueOf();
      expect(v).assertEqual(arr);
      expect(v.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUEOF_0400
     * @tc.name testUint32ArrayValueOf004
     * @tc.desc Verify subarray valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValueOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let view: Uint32Array = base.subarray(1, 4);
      let v: Uint32Array = view.valueOf();
      expect(v).assertEqual(view);
      expect(v.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUEOF_0500
     * @tc.name testUint32ArrayValueOf005
     * @tc.desc Verify slice valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValueOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      let copy: Uint32Array = base.slice(1, 3);
      let v: Uint32Array = copy.valueOf();
      expect(v).assertEqual(copy);
      expect(v.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUEOF_0600
     * @tc.name testUint32ArrayValueOf006
     * @tc.desc Verify map valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValueOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Uint32Array = Uint32Array.of(1, 2, 3);
      let m: Uint32Array = base.map((x: number): number => x * 2);
      let v: Uint32Array = m.valueOf();
      expect(v).assertEqual(m);
      expect(v.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUEOF_0700
     * @tc.name testUint32ArrayValueOf007
     * @tc.desc Verify filter valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValueOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let f: Uint32Array = base.filter((x: number): boolean => x % 2 === 0);
      let v: Uint32Array = f.valueOf();
      expect(v).assertEqual(f);
      expect(v.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUEOF_0800
     * @tc.name testUint32ArrayValueOf008
     * @tc.desc Verify with() valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValueOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Uint32Array = Uint32Array.of(1, 2, 3);
      let w: Uint32Array = base.with(1, 99);
      let v: Uint32Array = w.valueOf();
      expect(v).assertEqual(w);
      expect(v.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUEOF_0900
     * @tc.name testUint32ArrayValueOf009
     * @tc.desc Verify valueOf byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValueOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Uint32Array = new Uint32Array(buf, 4, 2);
      expect(arr.valueOf()).assertEqual(arr);
      expect(arr.valueOf().byteOffset).assertEqual(arr.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUEOF_1000
     * @tc.name testUint32ArrayValueOf010
     * @tc.desc Verify $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValueOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let v: Uint32Array = arr.valueOf();
      v.$_set(1, 888);
      expect(arr.$_get(1)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUEOF_1100
     * @tc.name testUint32ArrayValueOf011
     * @tc.desc Verify valueOf length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValueOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5, 6);
      expect(arr.valueOf()).assertEqual(arr);
      expect(arr.valueOf().length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUEOF_1200
     * @tc.name testUint32ArrayValueOf012
     * @tc.desc Verify valueOf byteLength length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValueOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      expect(arr.valueOf().byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUEOF_1300
     * @tc.name testUint32ArrayValueOf013
     * @tc.desc Verify valueOf buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValueOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2);
      let v: Uint32Array = arr.valueOf();
      expect(v.buffer.byteLength).assertEqual(8);
      expect(v.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUEOF_1400
     * @tc.name testUint32ArrayValueOf014
     * @tc.desc Verify NaN 0 valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValueOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([Number.NaN]);
      expect(arr.valueOf()).assertEqual(arr);
      expect(arr.valueOf().$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUEOF_1500
     * @tc.name testUint32ArrayValueOf015
     * @tc.desc Verify 4294967296 0 valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValueOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([4294967296]);
      expect(arr.valueOf()).assertEqual(arr);
      expect(arr.valueOf().$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUEOF_1600
     * @tc.name testUint32ArrayValueOf016
     * @tc.desc Verify MAX_SAFE_INTEGER valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValueOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array([9007199254740991]);
      expect(arr.valueOf()).assertEqual(arr);
      expect(arr.valueOf().$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUEOF_1700
     * @tc.name testUint32ArrayValueOf017
     * @tc.desc Verify valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValueOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array(0);
      let v: Uint32Array = arr.valueOf();
      expect(v).assertEqual(arr);
      expect(v.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUEOF_1800
     * @tc.name testUint32ArrayValueOf018
     * @tc.desc Verify valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValueOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Uint32Array = Uint32Array.of(1, 2, 3);
      let view: Uint32Array = base.subarray(2, 2);
      let v: Uint32Array = view.valueOf();
      expect(v).assertEqual(view);
      expect(v.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUEOF_1900
     * @tc.name testUint32ArrayValueOf019
     * @tc.desc Verify subarray valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValueOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      let view: Uint32Array = base.subarray(1, 3);
      let v: Uint32Array = view.valueOf();
      view.$_set(0, 50);
      expect(v.$_get(0)).assertEqual(50);
      expect(base.$_get(1)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUEOF_2000
     * @tc.name testUint32ArrayValueOf020
     * @tc.desc Verify valueOf fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValueOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array(3);
      let v: Uint32Array = arr.valueOf();
      v.fill(33, 0, 3);
      expect(arr.$_get(0)).assertEqual(33);
      expect(arr.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_VALUEOF_2100
     * @tc.name testUint32ArrayValueOf021
     * @tc.desc Verify valueOf at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayValueOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      let v: Uint32Array = arr.valueOf();
      expect(v.at(0)).assertEqual(arr.at(0));
      expect(v.at(-1)).assertEqual(arr.at(-1));
    });

  });
}
