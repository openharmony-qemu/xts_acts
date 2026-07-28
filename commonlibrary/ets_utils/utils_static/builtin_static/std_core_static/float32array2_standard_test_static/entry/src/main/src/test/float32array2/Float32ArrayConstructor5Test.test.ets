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

export default function Float32ArrayConstructor5Test(): void {
  describe('Float32ArrayConstructor5Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_0100
     * @tc.name testFloat32ArrayConstructorFive001
     * @tc.desc Verify arity 1 passing int literal 2, length is 2 and zero-initialized
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      expect(arr.length).assertEqual(2);
      const element002 = arr.$_get(0);
      expect(element002).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_0200
     * @tc.name testFloat32ArrayConstructorFive002
     * @tc.desc Verify arity 1 passing Float32Array instance, copy construction length equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(5.0, 6.0, 7.0);
      const arr = new Float32Array(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_0300
     * @tc.name testFloat32ArrayConstructorFive003
     * @tc.desc Verify arity 2 passing ArrayBuffer and int offset 0, view byteLength equals buffer capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf, 0);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_0400
     * @tc.name testFloat32ArrayConstructorFive004
     * @tc.desc Verify arity 3 passing ArrayBuffer, 0, 2, view length is 2 and byteLength is 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), 0, 2);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_0500
     * @tc.name testFloat32ArrayConstructorFive005
     * @tc.desc Verify arity 3 passing ArrayBuffer, undefined, undefined, offset 0 covers the whole buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(8), undefined, undefined);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_0600
     * @tc.name testFloat32ArrayConstructorFive006
     * @tc.desc Verify arity 1 passing FixedArray<number> literal, copies length equals element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0, 2.0, 3.0, 4.0];
      const arr = new Float32Array(src);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_0700
     * @tc.name testFloat32ArrayConstructorFive007
     * @tc.desc Verify arity 1 passing Array<Number> is Iterable<Number>, copies length equals element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = [100.0, 200.0, 300.0];
      const arr = new Float32Array(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_0800
     * @tc.name testFloat32ArrayConstructorFive008
     * @tc.desc Verify same literal 2 to int overload, result zero-initialized
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const element013 = arr.$_get(1);
      expect(element013).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_0900
     * @tc.name testFloat32ArrayConstructorFive009
     * @tc.desc Verify literal 2.0 to number overload, length is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2.0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_1000
     * @tc.name testFloat32ArrayConstructorFive010
     * @tc.desc Verify literal 2.9 to number overload and truncates to 2, byteLength is 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2.9);
      expect(arr.length).assertEqual(2);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_1100
     * @tc.name testFloat32ArrayConstructorFive011
     * @tc.desc Verify passing Float32Array to copy overload, instance buffer and source different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(1.0, 2.0);
      const arr = new Float32Array(src);
      arr.$_set(0, 99.0);
      const element016 = src.$_get(0);
      expect(element016).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_1200
     * @tc.name testFloat32ArrayConstructorFive012
     * @tc.desc Verify passing ArrayBuffer to ArrayLike|ArrayBuffer view overload, view and buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf);
      arr.$_set(0, 42.0);
      const other = new Float32Array(buf, 0);
      const element017 = other.$_get(0);
      expect(element017).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_1300
     * @tc.name testFloat32ArrayConstructorFive013
     * @tc.desc Verify arity1 ArrayBuffer and arity2 offset 0 result byteOffset are all 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a1 = new Float32Array(buf);
      const a2 = new Float32Array(buf, 0);
      expect(a1.byteOffset).assertEqual(0);
      expect(a2.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_1400
     * @tc.name testFloat32ArrayConstructorFive014
     * @tc.desc Verify arity3 explicit length and arity3 undefined length on offset 0 length consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const explicit = new Float32Array(buf, 0, 2);
      const defaulted = new Float32Array(buf, undefined, 2);
      expect(explicit.length).assertEqual(2);
      expect(defaulted.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_1500
     * @tc.name testFloat32ArrayConstructorFive015
     * @tc.desc Verify number -0 truncates to 0, length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(-0.0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_1600
     * @tc.name testFloat32ArrayConstructorFive016
     * @tc.desc Verify empty ArrayBuffer to ArrayLike|ArrayBuffer overload, length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(0));
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_1700
     * @tc.name testFloat32ArrayConstructorFive017
     * @tc.desc Verify empty Float32Array copies, length is 0 and byteLength is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array();
      const arr = new Float32Array(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_1800
     * @tc.name testFloat32ArrayConstructorFive018
     * @tc.desc Verify number 2.9 and int 2 after length are all 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(2);
      const b = new Float32Array(2.9);
      expect(a.length).assertEqual(2);
      expect(b.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_1900
     * @tc.name testFloat32ArrayConstructorFive019
     * @tc.desc Verify empty construction default fields: length 0, byteOffset 0, byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      expect(arr.length).assertEqual(0);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_2000
     * @tc.name testFloat32ArrayConstructorFive020
     * @tc.desc Verify int 3 default byteOffset 0 and buffer capacity equals byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.buffer.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_2100
     * @tc.name testFloat32ArrayConstructorFive021
     * @tc.desc Verify number 3.0 default byteOffset 0 and byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3.0);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_2200
     * @tc.name testFloat32ArrayConstructorFive022
     * @tc.desc Verify copy construction default byteOffset 0, length equals source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const arr = new Float32Array(src);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.length).assertEqual(src.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_2300
     * @tc.name testFloat32ArrayConstructorFive023
     * @tc.desc Verify FixedArray copies default byteOffset 0, length equals element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0, 2.0];
      const arr = new Float32Array(src);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_2400
     * @tc.name testFloat32ArrayConstructorFive024
     * @tc.desc Verify Array<number> copies default byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0];
      const arr = new Float32Array(src);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_2500
     * @tc.name testFloat32ArrayConstructorFive025
     * @tc.desc Verify Iterable<Number> copies default byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = [1.0, 2.0];
      const arr = new Float32Array(src);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_2600
     * @tc.name testFloat32ArrayConstructorFive026
     * @tc.desc Verify view overload buf and int offset 0 default covers the whole buffer, byteLength equals buf.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 0);
      expect(arr.byteLength).assertEqual(buf.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_2700
     * @tc.name testFloat32ArrayConstructorFive027
     * @tc.desc Verify view overload buf, 0, 2 byteOffset 0 and byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), 0, 2);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_2800
     * @tc.name testFloat32ArrayConstructorFive028
     * @tc.desc Verify optional-argument overload buf, undefined, undefined byteOffset 0 covers the whole buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const arr = new Float32Array(buf, undefined, undefined);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.byteLength).assertEqual(buf.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_2900
     * @tc.name testFloat32ArrayConstructorFive029
     * @tc.desc Verify optional-argument overload buf, undefined, 2 byteOffset 0 length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), undefined, 2);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_3000
     * @tc.name testFloat32ArrayConstructorFive030
     * @tc.desc Verify optional-argument overload buf, 4, undefined byteOffset 4 covers the remaining buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, undefined);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_3100
     * @tc.name testFloat32ArrayConstructorFive031
     * @tc.desc Verify optional-argument overload buf, 4, undefined length equals remaining element count 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, undefined);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_3200
     * @tc.name testFloat32ArrayConstructorFive032
     * @tc.desc Verify ArrayLike|ArrayBuffer overload buf byteOffset 0 and buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf);
      expect(arr.byteOffset).assertEqual(0);
      arr.$_set(0, 1.0);
      const probe = new Float32Array(buf, 0);
      const element043 = probe.$_get(0);
      expect(element043).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_3300
     * @tc.name testFloat32ArrayConstructorFive033
     * @tc.desc Verify across overloads BYTES_PER_ELEMENT are all 4(empty construction vs view)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array();
      const b = new Float32Array(new ArrayBuffer(4), 0);
      expect(a.BYTES_PER_ELEMENT).assertEqual(4);
      expect(b.BYTES_PER_ELEMENT).assertEqual(4);
      expect(a.length).assertEqual(0);
      expect(b.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_3400
     * @tc.name testFloat32ArrayConstructorFive034
     * @tc.desc Verify across overloads name are all Float32Array(copy overload vs view overload)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(1.0);
      const a = new Float32Array(src);
      const b = new Float32Array(new ArrayBuffer(4), 0, 1);
      expect(a.name).assertEqual('Float32Array');
      expect(b.name).assertEqual('Float32Array');
      expect(a.length).assertEqual(1);
      expect(b.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_3500
     * @tc.name testFloat32ArrayConstructorFive035
     * @tc.desc Verify copy overload byteOffset 0, view overload byteOffset is non 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(1.0, 2.0);
      const copy = new Float32Array(src);
      const view = new Float32Array(new ArrayBuffer(16), 8, 1);
      expect(copy.byteOffset).assertEqual(0);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_3600
     * @tc.name testFloat32ArrayConstructorFive036
     * @tc.desc Verify view overload buf, 8, 1 byteOffset 8 and byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), 8, 1);
      expect(arr.byteOffset).assertEqual(8);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_3700
     * @tc.name testFloat32ArrayConstructorFive037
     * @tc.desc Verify optional-argument overload buf, 8, 2 byteOffset 8 length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(16), 8, 2);
      expect(arr.byteOffset).assertEqual(8);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_3800
     * @tc.name testFloat32ArrayConstructorFive038
     * @tc.desc Verify view overload buf and number offset 4.0 to number offset overload, byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const off: number = 4.0;
      const arr = new Float32Array(new ArrayBuffer(16), off);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_3900
     * @tc.name testFloat32ArrayConstructorFive039
     * @tc.desc Verify across overloads name string content same (empty construction vs FixedArray copies)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array();
      const src: FixedArray<number> = [1.0];
      const b = new Float32Array(src);
      expect(a.name).assertEqual('Float32Array');
      expect(b.name).assertEqual('Float32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_4000
     * @tc.name testFloat32ArrayConstructorFive040
     * @tc.desc Verify copy construction toString and source toString consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(1.5, 2.5);
      const arr = new Float32Array(src);
      const observedValue053 = arr.toString();
      expect(observedValue053).assertEqual(src.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_4100
     * @tc.name testFloat32ArrayConstructorFive041
     * @tc.desc Verify view overload toString underlying buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const setup = new Float32Array(buf, 0);
      setup.$_set(0, 3.0);
      setup.$_set(1, 4.0);
      const arr = new Float32Array(buf, 0);
      const observedValue054 = arr.toString();
      expect(observedValue054).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_4200
     * @tc.name testFloat32ArrayConstructorFive042
     * @tc.desc Verify copy overload and view overload on same number toString consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(5.0, 6.0);
      const copy = new Float32Array(src);
      const view = new Float32Array(src.buffer, 0, 2);
      const observedValue055 = copy.toString();
      expect(observedValue055).assertEqual(view.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_4300
     * @tc.name testFloat32ArrayConstructorFive043
     * @tc.desc Verify copy overload $_set writes does not affect source (is writable but isolated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(1.0, 2.0);
      const arr = new Float32Array(src);
      arr.$_set(0, 99.0);
      const element056 = src.$_get(0);
      expect(element056).assertEqual(1.0);
      const element056Part2 = arr.$_get(0);
      expect(element056Part2).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_4400
     * @tc.name testFloat32ArrayConstructorFive044
     * @tc.desc Verify view overload $_set writes affects underlying buffer (is writable and shared)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf, 0);
      arr.$_set(0, 77.0);
      const probe = new Float32Array(buf, 0);
      const element057 = probe.$_get(0);
      expect(element057).assertEqual(77.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_4500
     * @tc.name testFloat32ArrayConstructorFive045
     * @tc.desc Verify overload $_get returns number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1);
      const b = new Float32Array(Float32Array.of(1.0));
      const c = new Float32Array(new ArrayBuffer(4), 0);
      const element058 = a.$_get(0);
      expect(element058).assertEqual(0);
      const element058Part2 = b.$_get(0);
      expect(element058Part2).assertEqual(1.0);
      const element058Part3 = c.$_get(0);
      expect(element058Part3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_4600
     * @tc.name testFloat32ArrayConstructorFive046
     * @tc.desc Verify buffer property overload reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(2);
      const b = new Float32Array(new ArrayBuffer(8), 0);
      expect(a.buffer.byteLength).assertEqual(8);
      expect(b.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_4700
     * @tc.name testFloat32ArrayConstructorFive047
     * @tc.desc Verify length property copy overload equals source, view overload equals specified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(1.0, 2.0, 3.0);
      const copy = new Float32Array(src);
      const view = new Float32Array(src.buffer, 0, 2);
      expect(copy.length).assertEqual(3);
      expect(view.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_4800
     * @tc.name testFloat32ArrayConstructorFive048
     * @tc.desc Verify name property overload reads and is Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array();
      const b = new Float32Array(new ArrayBuffer(4), 0, 1);
      expect(a.name).assertEqual('Float32Array');
      expect(b.name).assertEqual('Float32Array');
      expect(a.length).assertEqual(0);
      expect(b.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_4900
     * @tc.name testFloat32ArrayConstructorFive049
     * @tc.desc Verify BYTES_PER_ELEMENT overload reads and is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(1);
      const b = new Float32Array(Float32Array.of(1.0));
      const c = new Float32Array(new ArrayBuffer(4), 0);
      expect(a.BYTES_PER_ELEMENT).assertEqual(4);
      expect(b.BYTES_PER_ELEMENT).assertEqual(4);
      expect(c.BYTES_PER_ELEMENT).assertEqual(4);
      expect(a.length).assertEqual(1);
      expect(b.$_get(0)).assertEqual(1.0);
      expect(c.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_5000
     * @tc.name testFloat32ArrayConstructorFive050
     * @tc.desc Verify across overloads toString format consistent are all comma-separated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.0, 2.0];
      const a = new Float32Array(src);
      const b = new Float32Array(new ArrayBuffer(8), 0);
      b.$_set(0, 1.0);
      b.$_set(1, 2.0);
      const observedValue063 = a.toString();
      expect(observedValue063).assertEqual(b.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_5100
     * @tc.name testFloat32ArrayConstructorFive051
     * @tc.desc Verify copy overload toString and source join consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(1.0, 2.0, 3.0);
      const arr = new Float32Array(src);
      const observedValue064 = arr.toString();
      expect(observedValue064).assertEqual(src.join(','));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_5200
     * @tc.name testFloat32ArrayConstructorFive052
     * @tc.desc Verify view overload $_set after toString value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(8), 0, 2);
      arr.$_set(0, 1.0);
      arr.$_set(1, 2.0);
      const observedValue065 = arr.toString();
      expect(observedValue065).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_5300
     * @tc.name testFloat32ArrayConstructorFive053
     * @tc.desc Verify across overloads byteOffset reads: copies is 0, view is specified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const copy = new Float32Array(Float32Array.of(1.0));
      const view = new Float32Array(new ArrayBuffer(8), 4, 1);
      expect(copy.byteOffset).assertEqual(0);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_5400
     * @tc.name testFloat32ArrayConstructorFive054
     * @tc.desc Verify across overloads length reads: int vs FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(5);
      const src: FixedArray<number> = [1.0, 2.0, 3.0];
      const b = new Float32Array(src);
      expect(a.length).assertEqual(5);
      expect(b.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_5500
     * @tc.name testFloat32ArrayConstructorFive055
     * @tc.desc Verify copy overload buffer capacity equals byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(Float32Array.of(1.0, 2.0));
      expect(arr.buffer.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_5600
     * @tc.name testFloat32ArrayConstructorFive056
     * @tc.desc Verify view overload buffer capacity greater than view byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Float32Array(buf, 0, 2);
      const byteLengthValue069 = view.buffer.byteLength - view.byteLength;
      expect(byteLengthValue069).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_5700
     * @tc.name testFloat32ArrayConstructorFive057
     * @tc.desc Verify across overloads at negative index returns last element consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(1.0, 2.0, 3.0);
      const copy = new Float32Array(src);
      const view = new Float32Array(src.buffer, 0, 3);
      const atValue070 = copy.at(-1);
      expect(atValue070).assertEqual(3.0);
      const atValue070Part2 = view.at(-1);
      expect(atValue070Part2).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_5800
     * @tc.name testFloat32ArrayConstructorFive058
     * @tc.desc Verify across overloads join consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(4.0, 5.0);
      const copy = new Float32Array(src);
      const view = new Float32Array(src.buffer, 0, 2);
      const joinedValue071 = copy.join('-');
      expect(joinedValue071).assertEqual(view.join('-'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_5900
     * @tc.name testFloat32ArrayConstructorFive059
     * @tc.desc Verify across overloads for loop iterated element count consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(1.0, 2.0, 3.0);
      const copy = new Float32Array(src);
      const view = new Float32Array(src.buffer, 0, 3);
      let cc = 0;
      let vc = 0;
      for (let __f32i = 0; __f32i < copy.length; __f32i++) {
        cc = cc + 1;
      }
      for (let __f32i = 0; __f32i < view.length; __f32i++) {
        vc = vc + 1;
      }
      expect(cc).assertEqual(3);
      expect(vc).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_6000
     * @tc.name testFloat32ArrayConstructorFive060
     * @tc.desc Verify view overload unaligned byteOffset throws RangeError, existing constructed instance fields remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      try {
        new Float32Array(new ArrayBuffer(8), 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_6100
     * @tc.name testFloat32ArrayConstructorFive061
     * @tc.desc Verify with out of bounds throws RangeError, constructed instance content unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      try {
        arr.with(1000, 1.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const element075 = arr.$_get(0);
      expect(element075).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_6200
     * @tc.name testFloat32ArrayConstructorFive062
     * @tc.desc Verify set exceeds remaining length throws RangeError, constructed instance unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      try {
        arr.set(Float32Array.of(1.0, 2.0, 3.0), 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_6300
     * @tc.name testFloat32ArrayConstructorFive063
     * @tc.desc Verify reduce empty array without initial value throws TypeError, constructed instance name remains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      try {
        arr.reduce((acc: number, v: number, index: int, array: Float32Array) => acc + v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(arr.name).assertEqual('Float32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_6400
     * @tc.name testFloat32ArrayConstructorFive064
     * @tc.desc Verify map callback throw propagates, constructed instance length remains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      try {
        arr.map((v: number, index: int, array: Float32Array) => {
          throw new Error('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_6500
     * @tc.name testFloat32ArrayConstructorFive065
     * @tc.desc Verify constructs throws after instance byteLength remains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const outer = new Float32Array(3);
      try {
        new Float32Array(new ArrayBuffer(8), 2, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(outer.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_6600
     * @tc.name testFloat32ArrayConstructorFive066
     * @tc.desc Verify after construction succeeds triggers with negative index normalization out of bounds throws RangeError, instance buffer capacity remains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      try {
        arr.with(-3, 1.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_6700
     * @tc.name testFloat32ArrayConstructorFive067
     * @tc.desc Verify sort callback throw propagates, instance length remains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.$_set(0, 3.0);
      arr.$_set(1, 1.0);
      arr.$_set(2, 2.0);
      try {
        arr.sort((a: number, b: number) => {
          throw new Error('cmp');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_6800
     * @tc.name testFloat32ArrayConstructorFive068
     * @tc.desc Verify find callback throw propagates, instance first element remains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      arr.$_set(0, 5.0);
      try {
        arr.find((v: number, index: int, array: Float32Array) => {
          throw new Error('f');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      const element083 = arr.$_get(0);
      expect(element083).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_6900
     * @tc.name testFloat32ArrayConstructorFive069
     * @tc.desc Verify forEach callback throw propagates, instance byteOffset remains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(8), 0);
      try {
        arr.forEach((v: number, index: int, array: Float32Array) => {
          throw new Error('fe');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_7000
     * @tc.name testFloat32ArrayConstructorFive070
     * @tc.desc Verify constructed instance on try, catch after access does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(Float32Array.of(1.0, 2.0));
      try {
        new Float32Array(new ArrayBuffer(4), 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const element085 = arr.$_get(1);
      expect(element085).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_7100
     * @tc.name testFloat32ArrayConstructorFive071
     * @tc.desc Verify constructs two throws, one instance name remains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Float32Array(1);
      try {
        new Float32Array(new ArrayBuffer(8), 3, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(first.name).assertEqual('Float32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_7200
     * @tc.name testFloat32ArrayConstructorFive072
     * @tc.desc Verify reduceRight empty array without initial value throws TypeError, instance length remains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array();
      try {
        arr.reduceRight((acc: number, v: number, index: int, array: Float32Array) => acc + v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_7300
     * @tc.name testFloat32ArrayConstructorFive073
     * @tc.desc Verify view overload byteOffset 6 unaligned throws RangeError, existing view length remains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const existing = new Float32Array(new ArrayBuffer(8), 0, 2);
      try {
        new Float32Array(new ArrayBuffer(8), 6, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(existing.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_7400
     * @tc.name testFloat32ArrayConstructorFive074
     * @tc.desc Verify view length exceeds buffer throws RangeError after source buffer capacity remains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Float32Array(buf, 0, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(buf.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_7500
     * @tc.name testFloat32ArrayConstructorFive075
     * @tc.desc Verify constructed instance fill after with out of bounds throws, fill result remains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      arr.fill(5.0);
      try {
        arr.with(10, 1.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const element090 = arr.$_get(2);
      expect(element090).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_7600
     * @tc.name testFloat32ArrayConstructorFive076
     * @tc.desc Verify copies constructed instance after findIndex callback throws, length remains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(Float32Array.of(1.0, 2.0));
      try {
        arr.findIndex((v: number, index: int, array: Float32Array) => {
          throw new Error('fi');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_7700
     * @tc.name testFloat32ArrayConstructorFive077
     * @tc.desc Verify view constructed instance every callback throw propagates, byteOffset remains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(new ArrayBuffer(8), 4, 1);
      try {
        arr.every((v: number, index: int, array: Float32Array) => {
          throw new Error('ev');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_7800
     * @tc.name testFloat32ArrayConstructorFive078
     * @tc.desc Verify offset view writes is reflected in whole-buffer view corresponding position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const full = new Float32Array(buf, 0, 3);
      const offset = new Float32Array(buf, 4, 2);
      offset.$_set(0, 22.0);
      const element094 = full.$_get(1);
      expect(element094).assertEqual(22.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_7900
     * @tc.name testFloat32ArrayConstructorFive079
     * @tc.desc Verify arity1 ArrayBuffer view writes affects explicit length child view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const full = new Float32Array(buf);
      const sub = new Float32Array(buf, 0, 1);
      full.$_set(0, 44.0);
      const element096 = sub.$_get(0);
      expect(element096).assertEqual(44.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_8000
     * @tc.name testFloat32ArrayConstructorFive080
     * @tc.desc Verify subarray and constructs view share the same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Float32Array(buf, 0, 2);
      const sub = view.subarray(0, 1);
      sub.$_set(0, 55.0);
      const element097 = view.$_get(0);
      expect(element097).assertEqual(55.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_8100
     * @tc.name testFloat32ArrayConstructorFive081
     * @tc.desc Verify copy construction view creates buffer, writes does not affect source view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const src = new Float32Array(buf, 0, 2);
      src.$_set(0, 1.0);
      const copy = new Float32Array(src);
      copy.$_set(0, 99.0);
      const element098 = src.$_get(0);
      expect(element098).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_8200
     * @tc.name testFloat32ArrayConstructorFive082
     * @tc.desc Verify non zero byteOffset view writes is reflected in the underlying buffer correct byte position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const full = new Float32Array(buf, 0, 4);
      const at4 = new Float32Array(buf, 8, 1);
      at4.$_set(0, 88.0);
      const element100 = full.$_get(2);
      expect(element100).assertEqual(88.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_8300
     * @tc.name testFloat32ArrayConstructorFive083
     * @tc.desc Verify view byteLength equals length 4, buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Float32Array(buf, 0, 2);
      expect(view.byteLength).assertEqual(8);
      expect(view.buffer.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_8400
     * @tc.name testFloat32ArrayConstructorFive084
     * @tc.desc Verify view length writes within range, view.length subset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Float32Array(buf, 0, 2);
      expect(view.length).assertEqual(2);
      view.$_set(1, 1.0);
      const element103 = view.$_get(1);
      expect(element103).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_8500
     * @tc.name testFloat32ArrayConstructorFive085
     * @tc.desc Verify from view buffer derived view, from view instance copy construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const src = new Float32Array(buf, 0, 2);
      const shared = new Float32Array(src.buffer, 0, 2);
      const indep = new Float32Array(src);
      shared.$_set(0, 1.0);
      const element104 = src.$_get(0);
      expect(element104).assertEqual(1.0);
      indep.$_set(0, 2.0);
      const element104Part2 = src.$_get(0);
      expect(element104Part2).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_8600
     * @tc.name testFloat32ArrayConstructorFive086
     * @tc.desc Verify parent view reads child subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const parent = new Float32Array(buf, 0, 2);
      const child = parent.subarray(1);
      parent.$_set(1, 7.0);
      const element105 = child.$_get(0);
      expect(element105).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_8700
     * @tc.name testFloat32ArrayConstructorFive087
     * @tc.desc Verify child subarray reads parent view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const parent = new Float32Array(buf, 0, 2);
      const child = parent.subarray(0, 1);
      child.$_set(0, 9.0);
      const element106 = parent.$_get(0);
      expect(element106).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_8800
     * @tc.name testFloat32ArrayConstructorFive088
     * @tc.desc Verify buffer copies after source toString copy modifying affects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(3.0, 4.0);
      const copy = new Float32Array(src);
      copy.$_set(0, 0.0);
      const observedValue108 = src.toString();
      expect(observedValue108).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_8900
     * @tc.name testFloat32ArrayConstructorFive089
     * @tc.desc Verify copy construction after modifying source does not affect copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(1.0, 2.0);
      const copy = new Float32Array(src);
      src.$_set(0, 100.0);
      const element109 = copy.$_get(0);
      expect(element109).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_9000
     * @tc.name testFloat32ArrayConstructorFive090
     * @tc.desc Verify Array<number> copies after modifying source array does not affect copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0];
      const copy = new Float32Array(src);
      src.$_set(0, 100.0);
      const element110 = copy.$_get(0);
      expect(element110).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_9100
     * @tc.name testFloat32ArrayConstructorFive091
     * @tc.desc Verify Iterable<Number> copies creates buffer, copy modifying does not affect source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = [1.0, 2.0];
      const copy = new Float32Array(src);
      copy.$_set(0, 50.0);
      const element111 = copy.$_get(0);
      expect(element111).assertEqual(50.0);
      const element111Part2 = src.$_get(0).valueOf();
      expect(element111Part2).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_9200
     * @tc.name testFloat32ArrayConstructorFive092
     * @tc.desc Verify copy construction view, copy length equals view length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Float32Array(buf, 4, 3);
      const copy = new Float32Array(view);
      expect(copy.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_9300
     * @tc.name testFloat32ArrayConstructorFive093
     * @tc.desc Verify view constructs copy buffer shares the copy buffer rather than the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(1.0, 2.0);
      const copy = new Float32Array(src);
      const view = new Float32Array(copy.buffer, 0, 2);
      view.$_set(0, 8.0);
      const element113 = copy.$_get(0);
      expect(element113).assertEqual(8.0);
      const element113Part2 = src.$_get(0);
      expect(element113Part2).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_9400
     * @tc.name testFloat32ArrayConstructorFive094
     * @tc.desc Verify two length constructed instance buffer different (is)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array(2);
      const b = new Float32Array(2);
      a.$_set(0, 1.0);
      const element114 = b.$_get(0);
      expect(element114).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_9500
     * @tc.name testFloat32ArrayConstructorFive095
     * @tc.desc Verify whole-buffer view $_set after subarray reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const full = new Float32Array(buf, 0, 2);
      full.$_set(1, 13.0);
      const sub = full.subarray(1);
      const element116 = sub.$_get(0);
      expect(element116).assertEqual(13.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_9600
     * @tc.name testFloat32ArrayConstructorFive096
     * @tc.desc Verify copy construction deep-copies values, copy and source simultaneously modifying do not affect each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(1.0, 2.0);
      const copy = new Float32Array(src);
      copy.$_set(0, 10.0);
      src.$_set(1, 20.0);
      const element118 = copy.$_get(1);
      expect(element118).assertEqual(2.0);
      const element118Part2 = src.$_get(0);
      expect(element118Part2).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_9700
     * @tc.name testFloat32ArrayConstructorFive097
     * @tc.desc Verify view shared write view is read by another offset view corresponding position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const observedValue119 = new Float32Array(buf, 0, 4);
      const observedValue119Part2 = new Float32Array(buf, 8, 2);
      observedValue119.$_set(2, 31.0);
      const element119 = observedValue119Part2.$_get(0);
      expect(element119).assertEqual(31.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_CONSTRUCTOR_FIVE_9800
     * @tc.name testFloat32ArrayConstructorFive098
     * @tc.desc Verify Array<Number> copies creates buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayConstructorFive098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Number> = [1.0, 2.0];
      const copy = new Float32Array(src);
      copy.$_set(0, 0.0);
      const element120 = src.$_get(0).valueOf();
      expect(element120).assertEqual(1.0);
    });

  });
}
