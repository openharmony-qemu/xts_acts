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
  Level,
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function int8ArrayConstructorPart15TestTest(): void {
  describe('Int8ArrayConstructorPart15TestTest', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_0100
     * @tc.name int8ArrayConstructorPart15Test001
     * @tc.desc Verify 0 length FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array(0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_0200
     * @tc.name int8ArrayConstructorPart15Test002
     * @tc.desc Verify 5 length:int length=5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array(5);
      expect(arr.length).assertEqual(5);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_0300
     * @tc.name int8ArrayConstructorPart15Test003
     * @tc.desc Verify new Int8Array(2) other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(2);
      src.$_set(0, 7);
      const copy: Int8Array = new Int8Array(src);
      expect(copy.length).assertEqual(2);
      expect(copy.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_0400
     * @tc.name int8ArrayConstructorPart15Test004
     * @tc.desc Verify FixedArray<int> FixedArray<E>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [1, 2, 3];
      const arr: Int8Array = new Int8Array(fa);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_0500
     * @tc.name int8ArrayConstructorPart15Test005
     * @tc.desc Verify FixedArray<number> FixedArray<number> 1.9 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [1.9, -1.9];
      const arr: Int8Array = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_0600
     * @tc.name int8ArrayConstructorPart15Test006
     * @tc.desc Verify Array<int> Array<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [10, 20, 30];
      const arr: Int8Array = new Int8Array(src);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_0700
     * @tc.name int8ArrayConstructorPart15Test007
     * @tc.desc Verify Array<Number> Iterable<Number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const iter: Array<Number> = [5, 10];
      const arr: Int8Array = new Int8Array(iter);
      expect(arr.length).assertEqual(2);
      expect(arr.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_0800
     * @tc.name int8ArrayConstructorPart15Test008
     * @tc.desc Verify (buf, int ) byteOffset:int buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const off: int = 0;
      const view: Int8Array = new Int8Array(buf, off);
      expect(view.byteOffset).assertEqual(0);
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_0900
     * @tc.name int8ArrayConstructorPart15Test009
     * @tc.desc Verify (buf, number ) byteOffset:number buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const off: number = 0.0;
      const view: Int8Array = new Int8Array(buf, off);
      expect(view.byteOffset).assertEqual(0);
      expect(view.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_1000
     * @tc.name int8ArrayConstructorPart15Test010
     * @tc.desc Verify (buf, 0, 2) (int, int) length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view: Int8Array = new Int8Array(buf, 0, 2);
      expect(view.byteOffset).assertEqual(0);
      expect(view.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_1100
     * @tc.name int8ArrayConstructorPart15Test011
     * @tc.desc Verify (buf, undefined, undefined) (Number|undefined, Number|undefined) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(view.byteOffset).assertEqual(0);
      expect(view.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_1200
     * @tc.name int8ArrayConstructorPart15Test012
     * @tc.desc Verify ArrayBuffer ArrayLike|ArrayBuffer buffer byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view: Int8Array = new Int8Array(buf);
      expect(view.buffer).assertEqual(buf);
      expect(view.byteOffset).assertEqual(0);
      expect(view.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_1300
     * @tc.name int8ArrayConstructorPart15Test013
     * @tc.desc Verify constructor() length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_1400
     * @tc.name int8ArrayConstructorPart15Test014
     * @tc.desc Verify (buf, 0) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view: Int8Array = new Int8Array(buf, 0);
      expect(view.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_1500
     * @tc.name int8ArrayConstructorPart15Test015
     * @tc.desc Verify (buf, undefined, undefined) byteOffset 0, length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const view: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(view.byteOffset).assertEqual(0);
      expect(view.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_1600
     * @tc.name int8ArrayConstructorPart15Test016
     * @tc.desc Verify (buf, undefined, undefined) (buf, 0) byteOffset/length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const viewA: Int8Array = new Int8Array(buf, 0);
      const viewB: Int8Array = new Int8Array(buf, undefined, undefined);
      expect(viewA.byteOffset).assertEqual(viewB.byteOffset);
      expect(viewA.length).assertEqual(viewB.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_1700
     * @tc.name int8ArrayConstructorPart15Test017
     * @tc.desc Verify (buf, 0, 4) length (buf, 0) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const viewA: Int8Array = new Int8Array(buf, 0);
      const viewB: Int8Array = new Int8Array(buf, 0, 4);
      expect(viewA.length).assertEqual(viewB.length);
      expect(viewA.byteOffset).assertEqual(viewB.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_1800
     * @tc.name int8ArrayConstructorPart15Test018
     * @tc.desc Verify (buf) vs (buf, 0) byteOffset/length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const viewA: Int8Array = new Int8Array(buf);
      const viewB: Int8Array = new Int8Array(buf, 0);
      expect(viewA.byteOffset).assertEqual(viewB.byteOffset);
      expect(viewA.length).assertEqual(viewB.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_1900
     * @tc.name int8ArrayConstructorPart15Test019
     * @tc.desc Verify vs length=0 byteLength/length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1: Int8Array = new Int8Array();
      const a2: Int8Array = new Int8Array(0);
      expect(a1.byteLength).assertEqual(a2.byteLength);
      expect(a1.length).assertEqual(a2.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_2000
     * @tc.name int8ArrayConstructorPart15Test020
     * @tc.desc Verify BYTES_PER_ELEMENT === 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const fa: FixedArray<int> = [1, 2];
      const e1: int = (new Int8Array(1)).BYTES_PER_ELEMENT;
      const e2: int = (new Int8Array(1)).BYTES_PER_ELEMENT;
      const e3: int = (new Int8Array(1)).BYTES_PER_ELEMENT;
      const e4: int = (new Int8Array(1)).BYTES_PER_ELEMENT;
      const e5: int = (new Int8Array(1)).BYTES_PER_ELEMENT;
      expect(e1).assertEqual(1);
      expect(e2).assertEqual(1);
      expect(e3).assertEqual(1);
      expect(e4).assertEqual(1);
      expect(e5).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_2100
     * @tc.name int8ArrayConstructorPart15Test021
     * @tc.desc Verify length=4 byteLength === 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array(4);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_2200
     * @tc.name int8ArrayConstructorPart15Test022
     * @tc.desc Verify FixedArray byteLength ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [1, 2, 3];
      const arr: Int8Array = new Int8Array(fa);
      expect(arr.byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_2300
     * @tc.name int8ArrayConstructorPart15Test023
     * @tc.desc Verify Array<int> byteLength ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [10, 20];
      const arr: Int8Array = new Int8Array(src);
      expect(arr.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_2400
     * @tc.name int8ArrayConstructorPart15Test024
     * @tc.desc Verify byteLength === length int8 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const view: Int8Array = new Int8Array(buf, 0, 3);
      expect(view.byteLength).assertEqual(view.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_2500
     * @tc.name int8ArrayConstructorPart15Test025
     * @tc.desc Verify byteOffset === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array();
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_2600
     * @tc.name int8ArrayConstructorPart15Test026
     * @tc.desc Verify byteOffset ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const view: Int8Array = new Int8Array(buf, 2);
      expect(view.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_2700
     * @tc.name int8ArrayConstructorPart15Test027
     * @tc.desc Verify (buf, 2, 1) byteOffset=2, length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const view: Int8Array = new Int8Array(buf, 2, 1);
      expect(view.byteOffset).assertEqual(2);
      expect(view.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_2800
     * @tc.name int8ArrayConstructorPart15Test028
     * @tc.desc Verify buffer ArrayBuffer byteLength=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array();
      expect(arr.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_2900
     * @tc.name int8ArrayConstructorPart15Test029
     * @tc.desc Verify buffer === buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view: Int8Array = new Int8Array(buf, 0, 2);
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_3000
     * @tc.name int8ArrayConstructorPart15Test030
     * @tc.desc Verify (buf) buffer === buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view: Int8Array = new Int8Array(buf);
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_3100
     * @tc.name int8ArrayConstructorPart15Test031
     * @tc.desc Verify (other: Int8Array) buffer !== buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(2);
      const copy: Int8Array = new Int8Array(src);
      expect(copy.buffer).not().assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_3200
     * @tc.name int8ArrayConstructorPart15Test032
     * @tc.desc Verify FixedArray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [1, 2];
      const a1: Int8Array = new Int8Array(fa);
      const a2: Int8Array = new Int8Array(fa);
      expect(a1.buffer).not().assertEqual(a2.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_3300
     * @tc.name int8ArrayConstructorPart15Test033
     * @tc.desc Verify Array<int> buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [1, 2];
      const a1: Int8Array = new Int8Array(src);
      const a2: Int8Array = new Int8Array(src);
      expect(a1.buffer).not().assertEqual(a2.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_3400
     * @tc.name int8ArrayConstructorPart15Test034
     * @tc.desc Verify name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const fa: FixedArray<int> = [1];
      const n1: string = (new Int8Array(1)).name;
      const n2: string = (new Int8Array(1)).name;
      const n3: string = (new Int8Array(1)).name;
      const n4: string = (new Int8Array(1)).name;
      expect(n1).assertEqual(n2);
      expect(n2).assertEqual(n3);
      expect(n3).assertEqual(n4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_3500
     * @tc.name int8ArrayConstructorPart15Test035
     * @tc.desc Verify toString === ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array();
      expect(arr.toString()).assertEqual('');
    });

    /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_3600
       * @tc.name int8ArrayConstructorPart15Test036
       * @tc.desc Verify length=3 toString === ',,'
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayConstructorPart15Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr: Int8Array = new Int8Array(3);
        expect(arr.toString()).assertEqual('0,0,0');
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_3700
     * @tc.name int8ArrayConstructorPart15Test037
     * @tc.desc Verify FixedArray<int> [1,2,3] toString === '1,2,3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [1, 2, 3];
      const arr: Int8Array = new Int8Array(fa);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_3800
     * @tc.name int8ArrayConstructorPart15Test038
     * @tc.desc Verify Array<int> [-1, 127] toString === '-1,127'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [-1, INT8_MAX];
      const arr: Int8Array = new Int8Array(src);
      expect(arr.toString()).assertEqual('-1,127');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_3900
     * @tc.name int8ArrayConstructorPart15Test039
     * @tc.desc Verify Int8Array toString === .toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(2);
      src.$_set(0, 5);
      src.$_set(1, 10);
      const copy: Int8Array = new Int8Array(src);
      expect(copy.toString()).assertEqual(src.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_4000
     * @tc.name int8ArrayConstructorPart15Test040
     * @tc.desc Verify toString buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const view: Int8Array = new Int8Array(buf);
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      expect(view.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_4100
     * @tc.name int8ArrayConstructorPart15Test041
     * @tc.desc Verify join(',') === ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int8Array = new Int8Array();
      expect(arr.join(',')).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_4200
     * @tc.name int8ArrayConstructorPart15Test042
     * @tc.desc Verify join('|')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const view: Int8Array = new Int8Array(buf, 0, 3);
      view.$_set(0, 7);
      view.$_set(1, 8);
      view.$_set(2, 9);
      expect(view.join('|')).assertEqual('7|8|9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_4300
     * @tc.name int8ArrayConstructorPart15Test043
     * @tc.desc Verify offset RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        new Int8Array(buf, 8, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_4400
     * @tc.name int8ArrayConstructorPart15Test044
     * @tc.desc Verify length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        new Int8Array(buf, 0, 8);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_4500
     * @tc.name int8ArrayConstructorPart15Test045
     * @tc.desc Verify length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Int8Array(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_4600
     * @tc.name int8ArrayConstructorPart15Test046
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        new Int8Array(buf, 8, 1);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const view: Int8Array = new Int8Array(buf, 0, 2);
      expect(view.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_4700
     * @tc.name int8ArrayConstructorPart15Test047
     * @tc.desc Verify ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        new Int8Array(buf, 8, 1);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(buf.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_4800
     * @tc.name int8ArrayConstructorPart15Test048
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view: Int8Array = new Int8Array(buf);
      view.$_set(0, 42);
      try {
        new Int8Array(buf, 8, 1);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(view.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_4900
     * @tc.name int8ArrayConstructorPart15Test049
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view: Int8Array = new Int8Array(buf, 0, 2);
      view.$_set(0, 99);
      try {
        new Int8Array(buf, 8, 1);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(view.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_5000
     * @tc.name int8ArrayConstructorPart15Test050
     * @tc.desc Verify (other: Int8Array) !==
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(2);
      const copy: Int8Array = new Int8Array(src);
      expect(copy).not().assertEqual(src);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_5100
     * @tc.name int8ArrayConstructorPart15Test051
     * @tc.desc Verify Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(2);
      src.$_set(0, 5);
      const copy: Int8Array = new Int8Array(src);
      src.$_set(0, 99);
      expect(copy.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_5200
     * @tc.name int8ArrayConstructorPart15Test052
     * @tc.desc Verify FixedArray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [1, 2];
      const a1: Int8Array = new Int8Array(fa);
      const a2: Int8Array = new Int8Array(fa);
      a1.$_set(0, 99);
      expect(a2.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_5300
     * @tc.name int8ArrayConstructorPart15Test053
     * @tc.desc Verify Array<int> buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [1, 2];
      const a1: Int8Array = new Int8Array(src);
      const a2: Int8Array = new Int8Array(src);
      a1.$_set(0, 99);
      expect(a2.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_5400
     * @tc.name int8ArrayConstructorPart15Test054
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view: Int8Array = new Int8Array(buf, 0, 2);
      expect(view).not().assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_5500
     * @tc.name int8ArrayConstructorPart15Test055
     * @tc.desc Verify buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const writer: Int8Array = new Int8Array(buf, 0, 4);
      writer.$_set(0, 42);
      const reader: Int8Array = new Int8Array(buf, 0, 4);
      expect(reader.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_5600
     * @tc.name int8ArrayConstructorPart15Test056
     * @tc.desc Verify (buf) (buf, off, len)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const writer: Int8Array = new Int8Array(buf);
      writer.$_set(1, 77);
      const reader: Int8Array = new Int8Array(buf, 1, 1);
      expect(reader.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_5700
     * @tc.name int8ArrayConstructorPart15Test057
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const viewA: Int8Array = new Int8Array(buf, 0, 4);
      const viewB: Int8Array = new Int8Array(buf, 0, 4);
      viewA.$_set(2, 33);
      expect(viewB.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_5800
     * @tc.name int8ArrayConstructorPart15Test058
     * @tc.desc Verify byteOffset buffer v1[2] v2[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const viewA: Int8Array = new Int8Array(buf, 0, 4);
      const viewB: Int8Array = new Int8Array(buf, 2, 2);
      viewA.$_set(2, 55);
      expect(viewB.$_get(0)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_5900
     * @tc.name int8ArrayConstructorPart15Test059
     * @tc.desc Verify length buffer offset=2, length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view: Int8Array = new Int8Array(buf, 2, 2);
      expect(view.length).assertEqual(2);
      expect(view.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_6000
     * @tc.name int8ArrayConstructorPart15Test060
     * @tc.desc Verify byteOffset buffer offset=0 offset=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const offset0View: Int8Array = new Int8Array(buf, 0, 2);
      const offsetView: Int8Array = new Int8Array(buf, 2, 2);
      offset0View.$_set(1, 11);
      offsetView.$_set(0, 22);
      const full: Int8Array = new Int8Array(buf, 0, 4);
      expect(full.$_get(1)).assertEqual(11);
      expect(full.$_get(2)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_6100
     * @tc.name int8ArrayConstructorPart15Test061
     * @tc.desc Verify vs slice slice slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view: Int8Array = new Int8Array(buf, 0, 4);
      view.$_set(0, 1);
      view.$_set(1, 2);
      view.$_set(2, 3);
      view.$_set(3, 4);
      const sliced: Int8Array = view.slice(0, 2);
      sliced.$_set(0, 99);
      expect(view.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_6200
     * @tc.name int8ArrayConstructorPart15Test062
     * @tc.desc Verify subarray buffer subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view: Int8Array = new Int8Array(buf, 0, 4);
      const sub: Int8Array = view.subarray(0, 2);
      sub.$_set(0, 88);
      expect(view.$_get(0)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_6300
     * @tc.name int8ArrayConstructorPart15Test063
     * @tc.desc Verify slice buffer slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view: Int8Array = new Int8Array(buf, 0, 4);
      const sliced: Int8Array = view.slice(0, 2);
      expect(sliced.buffer).not().assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_6400
     * @tc.name int8ArrayConstructorPart15Test064
     * @tc.desc Verify Int8Array(other) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view: Int8Array = new Int8Array(buf, 0, 4);
      const copy: Int8Array = new Int8Array(view);
      expect(copy.buffer).not().assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_6500
     * @tc.name int8ArrayConstructorPart15Test065
     * @tc.desc Verify buffer view subarray subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const baseView: Int8Array = new Int8Array(buf, 0, 4);
      const subViewA: Int8Array = baseView.subarray(0, 4);
      const subViewB: Int8Array = subViewA.subarray(0, 4);
      subViewB.$_set(0, 44);
      expect(baseView.$_get(0)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_6600
     * @tc.name int8ArrayConstructorPart15Test066
     * @tc.desc Verify subarray buffer === buf subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view: Int8Array = new Int8Array(buf, 0, 4);
      const sub: Int8Array = view.subarray(1, 3);
      expect(sub.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_6700
     * @tc.name int8ArrayConstructorPart15Test067
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2);
      const viewA: Int8Array = new Int8Array(buf, 0, 2);
      const viewB: Int8Array = new Int8Array(buf, 0, 2);
      viewA.$_set(0, 10);
      viewB.$_set(1, 20);
      const full: Int8Array = new Int8Array(buf, 0, 2);
      expect(full.$_get(0)).assertEqual(10);
      expect(full.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_6800
     * @tc.name int8ArrayConstructorPart15Test068
     * @tc.desc Verify byteOffset= length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view: Int8Array = new Int8Array(buf, 4, 0);
      expect(view.length).assertEqual(0);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_6900
     * @tc.name int8ArrayConstructorPart15Test069
     * @tc.desc Verify (buf, 0) (buf, 0, 4) length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const viewA: Int8Array = new Int8Array(buf, 0);
      const viewB: Int8Array = new Int8Array(buf, 0, 4);
      expect(viewA.byteOffset).assertEqual(viewB.byteOffset);
      expect(viewA.length).assertEqual(viewB.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_7000
     * @tc.name int8ArrayConstructorPart15Test070
     * @tc.desc Verify FixedArray<number> 255 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [255];
      const arr: Int8Array = new Int8Array(fa);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_7100
     * @tc.name int8ArrayConstructorPart15Test071
     * @tc.desc Verify Iterable<Number> NaN 0 number int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const iter: Array<Number> = [Number.NaN];
      const arr: Int8Array = new Int8Array(iter);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_7200
     * @tc.name int8ArrayConstructorPart15Test072
     * @tc.desc Verify Int8Array 127 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(1);
      src.$_set(0, INT8_MAX);
      const copy: Int8Array = new Int8Array(src);
      expect(copy.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_7300
     * @tc.name int8ArrayConstructorPart15Test073
     * @tc.desc Verify ArrayBuffer buffer 200 -56 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(1);
      const writer: Int8Array = new Int8Array(buf, 0, 1);
      writer.$_set(0, 200);
      const reader: Int8Array = new Int8Array(buf, 0, 1);
      expect(reader.$_get(0)).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_7400
     * @tc.name int8ArrayConstructorPart15Test074
     * @tc.desc Verify Array<int> -129 127 int int8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [-129];
      const arr: Int8Array = new Int8Array(src);
      expect(arr.$_get(0)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_7500
     * @tc.name int8ArrayConstructorPart15Test075
     * @tc.desc Verify buf offset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const fullView: Int8Array = new Int8Array(buf, 0, 4);
      const offsetView: Int8Array = new Int8Array(buf, 2, 2);
      fullView.$_set(2, 50);
      expect(offsetView.$_get(0)).assertEqual(50);
      offsetView.$_set(1, 60);
      expect(fullView.$_get(3)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_7600
     * @tc.name int8ArrayConstructorPart15Test076
     * @tc.desc Verify FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [1, 2, 3];
      const a1: Int8Array = new Int8Array(fa);
      const a2: Int8Array = new Int8Array(a1);
      a1.$_set(0, 99);
      expect(a2.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_7700
     * @tc.name int8ArrayConstructorPart15Test077
     * @tc.desc Verify Iterable subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const iter: Array<Number> = [1, 2, 3, 4];
      const arr: Int8Array = new Int8Array(iter);
      const sub: Int8Array = arr.subarray(1, 3);
      sub.$_set(0, 99);
      expect(arr.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_7800
     * @tc.name int8ArrayConstructorPart15Test078
     * @tc.desc Verify ArrayBuffer / /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const fullView: Int8Array = new Int8Array(buf);
      const leftView: Int8Array = new Int8Array(buf, 0, 2);
      const rightView: Int8Array = new Int8Array(buf, 2, 2);
      expect(fullView.length).assertEqual(4);
      expect(leftView.length).assertEqual(2);
      expect(rightView.length).assertEqual(2);
      expect(leftView.byteOffset).assertEqual(0);
      expect(rightView.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_7900
     * @tc.name int8ArrayConstructorPart15Test079
     * @tc.desc Verify (other: Int8Array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view: Int8Array = new Int8Array(buf, 0, 4);
      view.$_set(0, 7);
      const copy: Int8Array = new Int8Array(view);
      view.$_set(0, 99);
      expect(copy.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_8000
     * @tc.name int8ArrayConstructorPart15Test080
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view: Int8Array = new Int8Array(buf, 0, 4);
      const copy: Int8Array = new Int8Array(view);
      copy.$_set(0, 99);
      expect(view.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_8100
     * @tc.name int8ArrayConstructorPart15Test081
     * @tc.desc Verify byteOffset int vs number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const off1: int = 2;
      const off2: number = 2.0;
      const viewA: Int8Array = new Int8Array(buf, off1);
      const viewB: Int8Array = new Int8Array(buf, off2);
      expect(viewA.byteOffset).assertEqual(viewB.byteOffset);
      expect(viewA.length).assertEqual(viewB.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_8200
     * @tc.name int8ArrayConstructorPart15Test082
     * @tc.desc Verify Int8Array length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int8Array = new Int8Array(0);
      const copy: Int8Array = new Int8Array(src);
      expect(copy.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_8300
     * @tc.name int8ArrayConstructorPart15Test083
     * @tc.desc Verify FixedArray length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<int> = [];
      const arr: Int8Array = new Int8Array(fa);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_8400
     * @tc.name int8ArrayConstructorPart15Test084
     * @tc.desc Verify Array<int> length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<int> = [];
      const arr: Int8Array = new Int8Array(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_8500
     * @tc.name int8ArrayConstructorPart15Test085
     * @tc.desc Verify Iterable length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayConstructorPart15Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const iter: Array<Number> = [];
      const arr: Int8Array = new Int8Array(iter);
      expect(arr.length).assertEqual(0);
    });

      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_8600
       * @tc.name int8ArrayConstructorPart15Test086
       * @tc.desc Verify
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayConstructorPart15Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const buf: ArrayBuffer = new ArrayBuffer(4);
        try {
          new Int8Array(buf, 8, 1);
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        const view: Int8Array = new Int8Array(buf, 0, 2);
        expect(view.length).assertEqual(2);
      });
      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_8700
       * @tc.name int8ArrayConstructorPart15Test087
       * @tc.desc Verify ArrayBuffer
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayConstructorPart15Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const buf: ArrayBuffer = new ArrayBuffer(4);
        try {
          new Int8Array(buf, 8, 1);
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        expect(buf.byteLength).assertEqual(4);
      });
      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_8800
       * @tc.name int8ArrayConstructorPart15Test088
       * @tc.desc Verify buffer
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayConstructorPart15Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const buf: ArrayBuffer = new ArrayBuffer(4);
        const view: Int8Array = new Int8Array(buf);
        view.$_set(0, 42);
        try {
          new Int8Array(buf, 8, 1);
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        expect(view.$_get(0)).assertEqual(42);
      });
      /**
       * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_CONSTRUCTOR_PART15_TEST_8900
       * @tc.name int8ArrayConstructorPart15Test089
       * @tc.desc Verify
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level LEVEL2
       */
      it('int8ArrayConstructorPart15Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const buf: ArrayBuffer = new ArrayBuffer(4);
        const view: Int8Array = new Int8Array(buf, 0, 2);
        view.$_set(0, 99);
        try {
          new Int8Array(buf, 8, 1);
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
        expect(view.$_get(0)).assertEqual(99);
      });
});
}
