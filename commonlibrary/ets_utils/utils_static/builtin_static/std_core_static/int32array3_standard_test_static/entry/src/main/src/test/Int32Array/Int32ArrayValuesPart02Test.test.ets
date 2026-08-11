'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:
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

export default function int32ArrayValuesPart02Test(): void {
  describe('Int32ArrayValuesPart02Test', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayValuesPart02Test001
     * @tc.desc Verify the first values() result has done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      let it = a.values();
      expect(it.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayValuesPart02Test002
     * @tc.desc Verify values() yields the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(9);
      let it = a.values();
      expect(it.next().value).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayValuesPart02Test003
     * @tc.desc Verify a non-empty values() result has done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = Int32Array.of(3).values().next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayValuesPart02Test004
     * @tc.desc Verify a non-empty values() result has done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new Int32Array([4]).values().next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayValuesPart02Test005
     * @tc.desc Verify next() returns the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let it = Int32Array.of(1, 2).values();
      expect(it.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayValuesPart02Test006
     * @tc.desc Verify values() returns an iterator, not an Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(5);
      let it = a.values();
      expect((it as Object) instanceof Int32Array).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayValuesPart02Test007
     * @tc.desc Verify Array Array.isArray false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let it = a.values();
      expect(Array.isArray(it)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayValuesPart02Test008
     * @tc.desc Verify ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      let it: Object = a.values() as Object;
      expect(ArrayBuffer.isView(it)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayValuesPart02Test009
     * @tc.desc Verify next done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new Int32Array([11]).values().next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayValuesPart02Test010
     * @tc.desc Verify next() yields 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = Int32Array.of(42).values().next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArrayValuesPart02Test011
     * @tc.desc Verify an exhausted iterator returns value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new Int32Array(0).values().next();
      expect(r.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArrayValuesPart02Test012
     * @tc.desc Verify next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let it = new Int32Array([7]).values();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArrayValuesPart02Test013
     * @tc.desc Verify an exhausted iterator returns value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let it = Int32Array.of(7).values();
      it.next();
      expect(it.next().value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArrayValuesPart02Test014
     * @tc.desc Verify next done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let it = new Int32Array([1, 2]).values();
      it.next();
      it.next();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArrayValuesPart02Test015
     * @tc.desc Verify IteratorResult done value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: IteratorResult<number> = Int32Array.of(1).values().next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArrayValuesPart02Test016
     * @tc.desc Verify done=false and value 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new Int32Array([99]).values().next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArrayValuesPart02Test017
     * @tc.desc Verify an exhausted iterator has done=true and value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let it = Int32Array.of(1).values();
      it.next();
      let r = it.next();
      expect(r.done).assertTrue();
      expect(r.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArrayValuesPart02Test018
     * @tc.desc Verify value 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new Int32Array([88]).values().next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArrayValuesPart02Test019
     * @tc.desc Verify next() returns value 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = Int32Array.of(88).values().next();
      expect(r.value).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArrayValuesPart02Test020
     * @tc.desc Verify Number() 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new Int32Array([88]).values().next();
      expect(Number(r.value)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArrayValuesPart02Test021
     * @tc.desc Verify valueOf() 55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = Int32Array.of(55).values().next();
      expect((r.value!.valueOf() as number)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArrayValuesPart02Test022
     * @tc.desc Verify next() returns value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new Int32Array([1]).values().next();
      expect(r.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArrayValuesPart02Test023
     * @tc.desc Verify second value 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let it = new Int32Array([10, 20]).values();
      it.next();
      let r = it.next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArrayValuesPart02Test024
     * @tc.desc Verify [33,44] next 33 44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let it = new Int32Array([33, 44]).values();
      expect(Number(it.next().value)).assertEqual(33);
      expect(Number(it.next().value)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArrayValuesPart02Test025
     * @tc.desc Verify [5,15,25] next 25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let it = Int32Array.of(5, 15, 25).values();
      it.next();
      it.next();
      expect(Number(it.next().value)).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArrayValuesPart02Test026
     * @tc.desc Verify [100,200,300,400] next value=400
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([100, 200, 300, 400]);
      let it = a.values();
      it.next();
      it.next();
      it.next();
      expect(Number(it.next().value)).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArrayValuesPart02Test027
     * @tc.desc Verify -2/0/2 -2 0 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let it = new Int32Array([-2, 0, 2]).values();
      expect(Number(it.next().value)).assertEqual(-2);
      expect(Number(it.next().value)).assertEqual(0);
      expect(Number(it.next().value)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArrayValuesPart02Test028
     * @tc.desc Verify INT_MAX=2147483647 value=2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 2147483647);
      expect(Number(a.values().next().value)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArrayValuesPart02Test029
     * @tc.desc Verify INT_MIN=-2147483648 value=-2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -2147483648 as number);
      expect(Number(a.values().next().value)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArrayValuesPart02Test030
     * @tc.desc Verify 3 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let it = a.values();
      expect(Number(it.next().value)).assertEqual(0);
      expect(Number(it.next().value)).assertEqual(0);
      expect(Number(it.next().value)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArrayValuesPart02Test031
     * @tc.desc Verify fill(MAX) 2 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.fill(2147483647);
      let it = a.values();
      expect(Number(it.next().value)).assertEqual(2147483647);
      expect(Number(it.next().value)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArrayValuesPart02Test032
     * @tc.desc Verify [9,7,5] 9 7 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.$_set(0, 9);
      a.$_set(1, 7);
      a.$_set(2, 5);
      let it = a.values();
      expect(Number(it.next().value)).assertEqual(9);
      expect(Number(it.next().value)).assertEqual(7);
      expect(Number(it.next().value)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArrayValuesPart02Test033
     * @tc.desc Verify Number.NaN ToInt32 0 value=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, Number.NaN);
      expect(Number(a.values().next().value)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArrayValuesPart02Test034
     * @tc.desc Verify 2.7 2 value=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 2.7);
      expect(Number(a.values().next().value)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArrayValuesPart02Test035
     * @tc.desc Verify -2.7 -2 value=-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -2.7);
      expect(Number(a.values().next().value)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArrayValuesPart02Test036
     * @tc.desc Verify 0.3 1 0 value=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 0.3);
      expect(Number(a.values().next().value)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArrayValuesPart02Test037
     * @tc.desc Verify 4294967295 0xFFFFFFFF ToInt32 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 4294967295 as number);
      expect(Number(a.values().next().value)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArrayValuesPart02Test038
     * @tc.desc Verify 4294967296 2^32 ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 4294967296 as number);
      expect(Number(a.values().next().value)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArrayValuesPart02Test039
     * @tc.desc Verify values() length=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      a.values();
      expect(a.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArrayValuesPart02Test040
     * @tc.desc Verify values() byteLength=20 5*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      a.values();
      expect(a.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArrayValuesPart02Test041
     * @tc.desc Verify values() byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      a.values();
      expect(a.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArrayValuesPart02Test042
     * @tc.desc Verify 8 values() byteOffset 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let a: Int32Array = new Int32Array(buf, 8, 2);
      a.values();
      expect(a.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArrayValuesPart02Test043
     * @tc.desc Verify values() byteLength = length*4 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let a: Int32Array = new Int32Array(buf, 8, 2);
      a.values();
      expect(a.byteLength).assertEqual(8);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArrayValuesPart02Test044
     * @tc.desc Verify values() buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf);
      a.values();
      expect(a.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArrayValuesPart02Test045
     * @tc.desc Verify values() BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
      a.values();
      expect(a.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_4600
     * @tc.name int32ArrayValuesPart02Test046
     * @tc.desc Verify values() ArrayBuffer.isView(arr) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      let it = a.values();
      expect(it.next().done).assertFalse();
      expect(it.next().done).assertFalse();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_4700
     * @tc.name int32ArrayValuesPart02Test047
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let it = a.values();
      while (!it.next().done) {
      }
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_4800
     * @tc.name int32ArrayValuesPart02Test048
     * @tc.desc Verify byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let it = a.values();
      it.next();
      it.next();
      it.next();
      expect(a.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_4900
     * @tc.name int32ArrayValuesPart02Test049
     * @tc.desc Verify values() [4,5,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([4, 5, 6]);
      a.values();
      expect(a.$_get(0)).assertEqual(4);
      expect(a.$_get(1)).assertEqual(5);
      expect(a.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_5000
     * @tc.name int32ArrayValuesPart02Test050
     * @tc.desc Verify next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20);
      a.values().next();
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_5100
     * @tc.name int32ArrayValuesPart02Test051
     * @tc.desc Verify consuming the values iterator does not mutate the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-3, 0, 3]);
      let it = a.values();
      while (!it.next().done) {
      }
      expect(a.$_get(0)).assertEqual(-3);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_5200
     * @tc.name int32ArrayValuesPart02Test052
     * @tc.desc Verify values() yields 7 and 8 and then completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(7, 8);
      let it = a.values();
      expect(it.next().value).assertEqual(7);
      expect(it.next().value).assertEqual(8);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_5300
     * @tc.name int32ArrayValuesPart02Test053
     * @tc.desc Verify values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.$_set(0, 111);
      a.$_set(1, 222);
      a.values();
      a.values();
      expect(a.$_get(0)).assertEqual(111);
      expect(a.$_get(1)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_5400
     * @tc.name int32ArrayValuesPart02Test054
     * @tc.desc Verify values() $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.values();
      a.$_set(0, 99);
      expect(a.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_5500
     * @tc.name int32ArrayValuesPart02Test055
     * @tc.desc Verify values() iterator yields array data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
      let it = a.values();
      expect(it.next().done).assertFalse();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_5600
     * @tc.name int32ArrayValuesPart02Test056
     * @tc.desc Verify separate values iterators maintain independent iteration positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let it1 = a.values();
      let it2 = a.values();
      it1.next();
      it1.next();
      expect(Number(it2.next().value)).assertEqual(10);
      expect(Number(it1.next().value)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_5700
     * @tc.name int32ArrayValuesPart02Test057
     * @tc.desc Verify values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(5, 6);
      let it1 = a.values();
      it1.next();
      it1.next();
      it1.next();
      let r = a.values().next();
      expect(r.done).assertFalse();
      expect(Number(r.value)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_5800
     * @tc.name int32ArrayValuesPart02Test058
     * @tc.desc Verify next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let it = new Int32Array().values();
      expect(it.next().done).assertTrue();
      expect(it.next().done).assertTrue();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_5900
     * @tc.name int32ArrayValuesPart02Test059
     * @tc.desc Verify length cursor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let it: Object = new Int32Array([1, 2]).values() as Object;
      expect((it as Object).hasOwnProperty('length')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_6000
     * @tc.name int32ArrayValuesPart02Test060
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let it: Object = Int32Array.of(1).values() as Object;
      expect((it as Object).hasOwnProperty('buffer')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_6100
     * @tc.name int32ArrayValuesPart02Test061
     * @tc.desc Verify byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterator: IterableIterator<number> = new Int32Array(1).values();
      let result: IteratorResult<number> = iterator.next();
      expect(result.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_6200
     * @tc.name int32ArrayValuesPart02Test062
     * @tc.desc Verify byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterator: IterableIterator<number> = Int32Array.of(1).values();
      let result: IteratorResult<number> = iterator.next();
      expect(result.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_6300
     * @tc.name int32ArrayValuesPart02Test063
     * @tc.desc Verify ArrayBuffer Int32Array a1 a2.values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a1: Int32Array = new Int32Array(buf);
      let a2: Int32Array = new Int32Array(buf);
      a1.$_set(0, 303);
      expect(Number(a2.values().next().value)).assertEqual(303);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_6400
     * @tc.name int32ArrayValuesPart02Test064
     * @tc.desc Verify subarray values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let sub = a.subarray(2);
      sub.$_set(0, 707);
      let it = a.values();
      it.next();
      it.next();
      expect(Number(it.next().value)).assertEqual(707);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_6500
     * @tc.name int32ArrayValuesPart02Test065
     * @tc.desc Verify next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let alias = a.subarray(0);
      let it = a.values();
      it.next();
      alias.$_set(1, 999);
      expect(Number(it.next().value)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_6600
     * @tc.name int32ArrayValuesPart02Test066
     * @tc.desc Verify value Number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2]);
      let it = a.values();
      let first = it.next().value;
      a.$_set(0, 888);
      expect(Number(first)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_6700
     * @tc.name int32ArrayValuesPart02Test067
     * @tc.desc Verify values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let full: Int32Array = new Int32Array(buf);
      full.$_set(0, 11);
      full.$_set(1, 22);
      full.$_set(2, 33);
      full.$_set(3, 44);
      let off: Int32Array = new Int32Array(buf, 8, 2);
      expect(Number(off.values().next().value)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_6800
     * @tc.name int32ArrayValuesPart02Test068
     * @tc.desc Verify ArrayBuffer = byteOffset + length*4 values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf, 4, 2);
      a.$_set(0, 505);
      a.$_set(1, 606);
      let it = a.values();
      expect(Number(it.next().value)).assertEqual(505);
      expect(Number(it.next().value)).assertEqual(606);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_6900
     * @tc.name int32ArrayValuesPart02Test069
     * @tc.desc Verify subarray(2,2) next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub = a.subarray(2, 2);
      expect(sub.values().next().done).assertTrue();
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_7000
     * @tc.name int32ArrayValuesPart02Test070
     * @tc.desc Verify subarray(2) values() [3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      let sub = a.subarray(2);
      let it = sub.values();
      expect(Number(it.next().value)).assertEqual(3);
      expect(Number(it.next().value)).assertEqual(4);
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_7100
     * @tc.name int32ArrayValuesPart02Test071
     * @tc.desc Verify slice values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let cp = a.slice(0);
      cp.values().next();
      expect(a.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_7200
     * @tc.name int32ArrayValuesPart02Test072
     * @tc.desc Verify slice values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let cp = a.slice(0);
      cp.$_set(0, 999);
      expect(Number(a.values().next().value)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_7300
     * @tc.name int32ArrayValuesPart02Test073
     * @tc.desc Verify Int32Array values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(-7, 0, 7);
      let dst: Int32Array = new Int32Array(src);
      let it = dst.values();
      expect(Number(it.next().value)).assertEqual(-7);
      expect(Number(it.next().value)).assertEqual(0);
      expect(Number(it.next().value)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_7400
     * @tc.name int32ArrayValuesPart02Test074
     * @tc.desc Verify reverse values() $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      a.reverse();
      let it = a.values();
      expect(Number(it.next().value)).assertEqual(a.$_get(0));
      expect(Number(it.next().value)).assertEqual(a.$_get(1));
      expect(Number(it.next().value)).assertEqual(a.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_7500
     * @tc.name int32ArrayValuesPart02Test075
     * @tc.desc Verify sort values() $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(3, 1, 4, 2);
      a.sort();
      let it = a.values();
      for (let i = 0; i < a.length; i++) {
        expect(Number(it.next().value)).assertEqual(a.$_get(i));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_7600
     * @tc.name int32ArrayValuesPart02Test076
     * @tc.desc Verify copyWithin(0,2) values() =3 $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      a.copyWithin(0, 2);
      let v = Number(a.values().next().value);
      expect(v).assertEqual(a.$_get(0));
      expect(v).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_7700
     * @tc.name int32ArrayValuesPart02Test077
     * @tc.desc Verify set(array) values() $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let src: number[] = [-10, 0, 10];
      a.set(src);
      let it = a.values();
      for (let i = 0; i < 3; i++) {
        expect(Number(it.next().value)).assertEqual(a.$_get(i));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_7800
     * @tc.name int32ArrayValuesPart02Test078
     * @tc.desc Verify fill(-1) values() -1 $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.fill(-1);
      let it = a.values();
      expect(Number(it.next().value)).assertEqual(a.$_get(0));
      expect(Number(it.next().value)).assertEqual(a.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_7900
     * @tc.name int32ArrayValuesPart02Test079
     * @tc.desc Verify values() next yields all elements in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30]);
      let collected: number[] = [];
      let it = a.values();
      let r = it.next();
      while (!r.done) {
        collected.push(Number(r.value));
        r = it.next();
      }
      expect(collected.length).assertEqual(3);
      expect(collected.$_get(0)).assertEqual(10);
      expect(collected.$_get(1)).assertEqual(20);
      expect(collected.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_8000
     * @tc.name int32ArrayValuesPart02Test080
     * @tc.desc Verify values() on an empty Int32Array is immediately done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array();
      let it = a.values();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_8100
     * @tc.name int32ArrayValuesPart02Test081
     * @tc.desc Verify values() yields one value and then completes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(77);
      let it = a.values();
      let r = it.next();
      expect(r.value).assertEqual(77);
      expect(r.done).assertFalse();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_8200
     * @tc.name int32ArrayValuesPart02Test082
     * @tc.desc Verify for-of break values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4]);
      for (let i = 0; i < a.length; i++) {
        let v = a.$_get(i);
        if (Number(v) === 2) {
          break;
        }
      }
      expect(Number(a.values().next().value)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_8300
     * @tc.name int32ArrayValuesPart02Test083
     * @tc.desc Verify Symbol.iterator next value values() next value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([5, 6]);
      let vd: number = Number(a.values().next().value);
      let vv: number = Number(a.values().next().value);
      expect(vd).assertEqual(vv);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_8400
     * @tc.name int32ArrayValuesPart02Test084
     * @tc.desc Verify next done=true values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: IteratorResult<number> = new Int32Array().values().next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_8500
     * @tc.name int32ArrayValuesPart02Test085
     * @tc.desc Verify values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let itD: IterableIterator<number> = a.values();
      let itV: IterableIterator<number> = a.values();
      itD.next();
      expect(Number(itV.next().value)).assertEqual(1);
      expect(Number(itD.next().value)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_8600
     * @tc.name int32ArrayValuesPart02Test086
     * @tc.desc Verify two values() iterators maintain independent positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let it1 = a.values();
      let it2 = a.values();
      expect(it1.next().value).assertEqual(1);
      expect(it1.next().value).assertEqual(2);
      expect(it2.next().value).assertEqual(1);
      expect(it2.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART02_TEST_MINDMAP_8700
     * @tc.name int32ArrayValuesPart02Test087
     * @tc.desc Verify next while length for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart02Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(11, 22, 33, 44);
      let it = a.values();
      let n = 0;
      while (true) {
        let r = it.next();
        if (r.done) {
          break;
        }
        n++;
      }
      expect(n).assertEqual(a.length);
    });
  });
}
