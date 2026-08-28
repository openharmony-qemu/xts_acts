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

export default function Int16ArrayValuesTest01(): void {
  describe('Int16ArrayValuesTest01', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_0100
     * @tc.name testInt16ArrayValuesTestOne001
     * @tc.desc Verify values() IterableIterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let iter: IterableIterator<Number> = arr.values();
      let rNull: boolean = iter !== null;
      expect(rNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_0200
     * @tc.name testInt16ArrayValuesTestOne002
     * @tc.desc Verify 0 values next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: boolean = r.done;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_0300
     * @tc.name testInt16ArrayValuesTestOne003
     * @tc.desc Verify 0 values next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_0400
     * @tc.name testInt16ArrayValuesTestOne004
     * @tc.desc Verify 1 values next().done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: boolean = r.done;
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_0500
     * @tc.name testInt16ArrayValuesTestOne005
     * @tc.desc Verify 1 values next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 7;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_0600
     * @tc.name testInt16ArrayValuesTestOne006
     * @tc.desc Verify 2 values next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 10;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_0700
     * @tc.name testInt16ArrayValuesTestOne007
     * @tc.desc Verify 3 values next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_0800
     * @tc.name testInt16ArrayValuesTestOne008
     * @tc.desc Verify new Int16Array(length) 10 values next().value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(10);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_0900
     * @tc.name testInt16ArrayValuesTestOne009
     * @tc.desc Verify 100 values next().done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(100);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: boolean = r.done;
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_1000
     * @tc.name testInt16ArrayValuesTestOne010
     * @tc.desc Verify [0] values next().value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_1100
     * @tc.name testInt16ArrayValuesTestOne011
     * @tc.desc Verify [0, 0, 0] values next().value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_1200
     * @tc.name testInt16ArrayValuesTestOne012
     * @tc.desc Verify [MAX=32767] values next().value 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([32767]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_1300
     * @tc.name testInt16ArrayValuesTestOne013
     * @tc.desc Verify MAX [32767, 32767] values next().value 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([32767, 32767]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_1400
     * @tc.name testInt16ArrayValuesTestOne014
     * @tc.desc Verify [-1] values next().value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-1]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_1500
     * @tc.name testInt16ArrayValuesTestOne015
     * @tc.desc Verify [MIN=-32768] values next().value -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32768]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_1600
     * @tc.name testInt16ArrayValuesTestOne016
     * @tc.desc Verify [MIN+1=-32767] values next().value -32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32767]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = -32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_1700
     * @tc.name testInt16ArrayValuesTestOne017
     * @tc.desc Verify [-1, -32768] values next().value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-1, -32768]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_1800
     * @tc.name testInt16ArrayValuesTestOne018
     * @tc.desc Verify MIN [-32768, -32768] values next().value -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32768, -32768]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_1900
     * @tc.name testInt16ArrayValuesTestOne019
     * @tc.desc Verify [-1, 0, 1] values next().value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-1, 0, 1]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_2000
     * @tc.name testInt16ArrayValuesTestOne020
     * @tc.desc Verify [MIN, 0, MAX] values next().value -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32768, 0, 32767]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_2100
     * @tc.name testInt16ArrayValuesTestOne021
     * @tc.desc Verify [32768] -32768 values next().value -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([32768]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = -32768;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_2200
     * @tc.name testInt16ArrayValuesTestOne022
     * @tc.desc Verify [-32769] 32767 values next().value 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32769]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 32767;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_2300
     * @tc.name testInt16ArrayValuesTestOne023
     * @tc.desc Verify [65536] 0 values next().value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([65536]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_2400
     * @tc.name testInt16ArrayValuesTestOne024
     * @tc.desc Verify [NaN] 0 values next().value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([Number.NaN]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_2500
     * @tc.name testInt16ArrayValuesTestOne025
     * @tc.desc Verify [+Infinity] 0 values next().value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([Number.POSITIVE_INFINITY]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_2600
     * @tc.name testInt16ArrayValuesTestOne026
     * @tc.desc Verify [-Infinity] 0 values next().value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([Number.NEGATIVE_INFINITY]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_2700
     * @tc.name testInt16ArrayValuesTestOne027
     * @tc.desc Verify [3.7] 3 values next().value 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3.7]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_2800
     * @tc.name testInt16ArrayValuesTestOne028
     * @tc.desc Verify [-3.7] -3 values next().value -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-3.7]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = -3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_2900
     * @tc.name testInt16ArrayValuesTestOne029
     * @tc.desc Verify new Int16Array(0) values next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: boolean = r.done;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_3000
     * @tc.name testInt16ArrayValuesTestOne030
     * @tc.desc Verify new Int16Array(buf, 0, 3) values next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int16Array = new Int16Array(buf, 0, 3);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_3100
     * @tc.name testInt16ArrayValuesTestOne031
     * @tc.desc Verify new Int16Array(buf, 2, 2) values next().done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 2, 2);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: boolean = r.done;
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_3200
     * @tc.name testInt16ArrayValuesTestOne032
     * @tc.desc Verify new Int16Array(buf, 4, 1) values next().value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int16Array = new Int16Array(buf, 4, 1);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_3300
     * @tc.name testInt16ArrayValuesTestOne033
     * @tc.desc Verify new Int16Array(buf) buffer values next().done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: boolean = r.done;
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_3400
     * @tc.name testInt16ArrayValuesTestOne034
     * @tc.desc Verify new Int16Array(buf, 2) values next().value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Int16Array = new Int16Array(buf, 2);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_3500
     * @tc.name testInt16ArrayValuesTestOne035
     * @tc.desc Verify new Int16Array(Int8Array) values next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = new Int8Array([10, 20, 30]);
      let arr: Int16Array = new Int16Array(src);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 10;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_3600
     * @tc.name testInt16ArrayValuesTestOne036
     * @tc.desc Verify new Int16Array(Uint16Array) values next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint16Array = new Uint16Array([100, 200, 300]);
      let arr: Int16Array = new Int16Array(src);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_3700
     * @tc.name testInt16ArrayValuesTestOne037
     * @tc.desc Verify new Int16Array(Float32Array) values next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float32Array = new Float32Array([1.7, 2.3, 3.9]);
      let arr: Int16Array = new Int16Array(src);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_3800
     * @tc.name testInt16ArrayValuesTestOne038
     * @tc.desc Verify new Int16Array(Int32Array) values next().value int16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([70000, -70000]);
      let arr: Int16Array = new Int16Array(src);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 4464;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_3900
     * @tc.name testInt16ArrayValuesTestOne039
     * @tc.desc Verify fill(0) values next().value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      arr.fill(0);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_4000
     * @tc.name testInt16ArrayValuesTestOne040
     * @tc.desc Verify reverse() values next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      arr.reverse();
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_4100
     * @tc.name testInt16ArrayValuesTestOne041
     * @tc.desc Verify sort() values next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3, 1, 2]);
      arr.sort();
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_4200
     * @tc.name testInt16ArrayValuesTestOne042
     * @tc.desc Verify $_set values next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      arr.$_set(0, 99);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_4300
     * @tc.name testInt16ArrayValuesTestOne043
     * @tc.desc Verify copyWithin values next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      arr.copyWithin(0, 2);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_4400
     * @tc.name testInt16ArrayValuesTestOne044
     * @tc.desc Verify set(source) values next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      arr.set(new Int16Array([10, 20, 30]));
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 10;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_4500
     * @tc.name testInt16ArrayValuesTestOne045
     * @tc.desc Verify [0, 0, 0, 0] values next().value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0]);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_4600
     * @tc.name testInt16ArrayValuesTestOne046
     * @tc.desc Verify subarray(1, 3) values next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
      let sub: Int16Array = arr.subarray(1, 3);
      let iter: IterableIterator<Number> = sub.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 20;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_4700
     * @tc.name testInt16ArrayValuesTestOne047
     * @tc.desc Verify subarray(0, 0) values next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let sub: Int16Array = arr.subarray(0, 0);
      let iter: IterableIterator<Number> = sub.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: boolean = r.done;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_4800
     * @tc.name testInt16ArrayValuesTestOne048
     * @tc.desc Verify subarray() values next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 15]);
      let sub: Int16Array = arr.subarray();
      let iter: IterableIterator<Number> = sub.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 5;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_4900
     * @tc.name testInt16ArrayValuesTestOne049
     * @tc.desc Verify new Int16Array(Set) values next().value Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<number>();
      s.add(42);
      s.add(99);
      let arr: Int16Array = new Int16Array(s);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 42;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_5000
     * @tc.name testInt16ArrayValuesTestOne050
     * @tc.desc Verify ArrayBuffer buffer values next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Int16Array = new Int16Array(buf);
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: boolean = r.done;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_5100
     * @tc.name testInt16ArrayValuesTestOne051
     * @tc.desc Verify values fill reverse next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      arr.fill(0).reverse();
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_5200
     * @tc.name testInt16ArrayValuesTestOne052
     * @tc.desc Verify $_set no-op values next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20]);
      try {
        arr.$_set(99, 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let iter: IterableIterator<Number> = arr.values();
      let r: IteratorResult<Number> = iter.next();
      let r1: number = r.value!;
      let e1: int = 10;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_5300
     * @tc.name testInt16ArrayValuesTestOne053
     * @tc.desc Verify values() leaves original array content unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20]);
      let iter: IterableIterator<Number> = arr.values();
      let r1: number = arr.$_get(0 as int);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1 as int);
      let e2: int = 20;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_5400
     * @tc.name testInt16ArrayValuesTestOne054
     * @tc.desc Verify values() returns non-null iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10]);
      let iter: IterableIterator<Number> = arr.values();
      let r1: boolean = iter !== null;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_5500
     * @tc.name testInt16ArrayValuesTestOne055
     * @tc.desc Verify values() preserves original array properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10]);
      let iter: IterableIterator<Number> = arr.values();
      let r1: string = typeof iter;
      let e1: string = 'object';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_5600
     * @tc.name testInt16ArrayValuesTestOne056
     * @tc.desc Verify values() iterator next is function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10]);
      let iter: IterableIterator<Number> = arr.values();
      let r1: string = typeof iter.next;
      let e1: string = 'function';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_5700
     * @tc.name testInt16ArrayValuesTestOne057
     * @tc.desc Verify values() iterator yields length count via next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 14, 21]);
      let iter: IterableIterator<Number> = arr.values();
      let count: int = 0;
      let r: IteratorResult<Number> = iter.next();
      while (!r.done) {
        count = count + 1;
        r = iter.next();
      }
      let r1: int = count;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_5800
     * @tc.name testInt16ArrayValuesTestOne058
     * @tc.desc Verify values() next() returns non-null result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([42]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      let r1: boolean = result !== null;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_5900
     * @tc.name testInt16ArrayValuesTestOne059
     * @tc.desc Verify values() next() result typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([42]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      let r1: string = typeof result;
      let e1: string = 'object';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_6000
     * @tc.name testInt16ArrayValuesTestOne060
     * @tc.desc Verify values() next().done typeof boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([99]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      let r1: string = typeof result.done;
      let e1: string = 'boolean';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_6100
     * @tc.name testInt16ArrayValuesTestOne061
     * @tc.desc Verify values() next().done typeof boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      let r1: string = typeof result.done;
      let e1: string = 'boolean';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUES_ONE_6200
     * @tc.name testInt16ArrayValuesTestOne062
     * @tc.desc Verify values() next().value typeof number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayValuesTestOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1]);
      let iter: IterableIterator<Number> = arr.values();
      let result: IteratorResult<Number> = iter.next();
      let r1: string = typeof result.value;
      let e1: string = 'number';
      expect(r1).assertEqual(e1);
    });
  });
}
