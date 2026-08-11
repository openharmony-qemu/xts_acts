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

export default function int32ArrayValuesPart01Test(): void {
  describe('int32ArrayValuesPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayValuesPart01Test001
     * @tc.desc Verify empty values() iterator is done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array();
      let it = a.values();
      let r = it.next();
      expect(r.done).assertTrue();
      expect(r.value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayValuesPart01Test002
     * @tc.desc Verify values() yields the initial zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let it = a.values();
      let r = it.next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayValuesPart01Test003
     * @tc.desc Verify values() yields the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let it = a.values();
      let r = it.next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayValuesPart01Test004
     * @tc.desc Verify Int32Array.of(5,6,7) values() next done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = Int32Array.of(5, 6, 7).values().next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayValuesPart01Test005
     * @tc.desc Verify values() yields Int32Array.from data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [8, 9];
      let a: Int32Array = Int32Array.from(src);
      let it = a.values();
      expect(it.next().value).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayValuesPart01Test006
     * @tc.desc Verify independent values() iterators start at the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20);
      let it1 = a.values();
      let it2 = a.values();
      expect(it1.next().value).assertEqual(10);
      expect(it2.next().value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayValuesPart01Test007
     * @tc.desc Verify const array values() yields the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Int32Array = Int32Array.of(1, 2);
      let it = a.values();
      expect(it.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayValuesPart01Test008
     * @tc.desc Verify values() observes an assigned element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.$_set(0, 77);
      let it = a.values();
      expect(it.next().value).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayValuesPart01Test009
     * @tc.desc Verify values() observes filled data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.fill(42);
      let it = a.values();
      expect(it.next().value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayValuesPart01Test010
     * @tc.desc Verify values() observes reversed data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(3, 2, 1);
      a.reverse();
      let it = a.values();
      expect(it.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArrayValuesPart01Test011
     * @tc.desc Verify values() observes sorted data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2, 3, 1);
      a.sort();
      let it = a.values();
      expect(it.next().value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArrayValuesPart01Test012
     * @tc.desc Verify it1 it2 next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let it1 = a.values();
      it1.next();
      let it2 = a.values();
      let r = it2.next();
      let v = r.value as number;
      expect(v).assertEqual(10);
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArrayValuesPart01Test013
     * @tc.desc Verify length=0 new Int32Array() values() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new Int32Array().values().next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArrayValuesPart01Test014
     * @tc.desc Verify length=0 new Int32Array(0) values() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new Int32Array(0).values().next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArrayValuesPart01Test015
     * @tc.desc Verify length=1 values() next done=false value=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new Int32Array(1).values().next();
      expect(r.done).assertFalse();
      let v = r.value as number;
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArrayValuesPart01Test016
     * @tc.desc Verify length=2 values() next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([11, 22]);
      let v = a.values().next().value as number;
      expect(v).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArrayValuesPart01Test017
     * @tc.desc Verify length=3 values() next done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = Int32Array.of(1, 2, 3).values().next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArrayValuesPart01Test018
     * @tc.desc Verify length=1 next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let it = new Int32Array([9]).values();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArrayValuesPart01Test019
     * @tc.desc Verify length=3 4 next length done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let it = new Int32Array([1, 2, 3]).values();
      it.next();
      it.next();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArrayValuesPart01Test020
     * @tc.desc Verify length=16 2 values() next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(16);
      a.$_set(0, 55);
      let v = a.values().next().value as number;
      expect(v).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArrayValuesPart01Test021
     * @tc.desc Verify length=0 next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let it = new Int32Array(0).values();
      it.next();
      expect(it.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArrayValuesPart01Test022
     * @tc.desc Verify length=5 values() next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let v = a.values().next().value as number;
      expect(v).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArrayValuesPart01Test023
     * @tc.desc Verify new Int32Array() values() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Int32Array().values().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArrayValuesPart01Test024
     * @tc.desc Verify new Int32Array(1) values() value=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new Int32Array(1).values().next().value as number;
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArrayValuesPart01Test025
     * @tc.desc Verify JS new Int32Array([]) values() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [];
      expect(new Int32Array(src).values().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArrayValuesPart01Test026
     * @tc.desc Verify JS new Int32Array([42]) values() value=42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([42]);
      let v = a.values().next().value as number;
      expect(v).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArrayValuesPart01Test027
     * @tc.desc Verify Int32Array.of() values() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Int32Array.of().values().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArrayValuesPart01Test028
     * @tc.desc Verify Int32Array.of(99) values() value=99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = Int32Array.of(99).values().next().value as number;
      expect(v).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArrayValuesPart01Test029
     * @tc.desc Verify Int32Array.from values() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: number[] = [];
      expect(Int32Array.from(empty).values().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArrayValuesPart01Test030
     * @tc.desc Verify Int32Array.from([5,6,7]) values() value=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [5, 6, 7];
      let v = Int32Array.from(src).values().next().value as number;
      expect(v).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArrayValuesPart01Test031
     * @tc.desc Verify ArrayBuffer new Int32Array(buf) byteLength=12 3 values() value=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf);
      let v = a.values().next().value as number;
      expect(v).assertEqual(0);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArrayValuesPart01Test032
     * @tc.desc Verify ArrayBuffer new Int32Array(buf, 0, 0) length=0 values() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 0);
      expect(a.values().next().done).assertTrue();
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArrayValuesPart01Test033
     * @tc.desc Verify ArrayBuffer new Int32Array(buf, 4, 2) values() value=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 4, 2);
      let v = a.values().next().value as number;
      expect(v).assertEqual(0);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArrayValuesPart01Test034
     * @tc.desc Verify ArrayBuffer new Int32Array(buf, 8, 1) values() value=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf, 8, 1);
      let v = a.values().next().value as number;
      expect(v).assertEqual(0);
      expect(a.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArrayValuesPart01Test035
     * @tc.desc Verify TypedArray new Int32Array(other) values() value=
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(11, 22, 33);
      let a: Int32Array = new Int32Array(src);
      let v = a.values().next().value as number;
      expect(v).assertEqual(11);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArrayValuesPart01Test036
     * @tc.desc Verify TypedArray new Int32Array(empty) values() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array();
      let a: Int32Array = new Int32Array(src);
      expect(a.values().next().done).assertTrue();
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArrayValuesPart01Test037
     * @tc.desc Verify ArrayBuffer new ArrayBuffer(0) values() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let a: Int32Array = new Int32Array(buf);
      expect(a.values().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArrayValuesPart01Test038
     * @tc.desc Verify 0 values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new Int32Array([0]).values().next().value as number;
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArrayValuesPart01Test039
     * @tc.desc Verify 1 values() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new Int32Array([1]).values().next().value as number;
      expect(v).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArrayValuesPart01Test040
     * @tc.desc Verify -1 values() -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new Int32Array([-1]).values().next().value as number;
      expect(v).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArrayValuesPart01Test041
     * @tc.desc Verify int32 2147483647 0x7FFFFFFF values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new Int32Array([2147483647]).values().next().value as number;
      expect(v).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArrayValuesPart01Test042
     * @tc.desc Verify int32 -2147483648 values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new Int32Array([-2147483648]).values().next().value as number;
      expect(v).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArrayValuesPart01Test043
     * @tc.desc Verify -2 values() -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = new Int32Array([-2]).values().next().value as number;
      expect(v).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArrayValuesPart01Test044
     * @tc.desc Verify 0x7FFFFFFF MAX values() 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 0x7FFFFFFF);
      let v = a.values().next().value as number;
      expect(v).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArrayValuesPart01Test045
     * @tc.desc Verify $_set 4294967296 2^32 ToInt32 0 values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 4294967296 as number);
      let v = a.values().next().value as number;
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArrayValuesPart01Test046
     * @tc.desc Verify $_set 4294967295 0xFFFFFFFF ToInt32 -1 values() -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 4294967295 as number);
      let v = a.values().next().value as number;
      expect(v).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArrayValuesPart01Test047
     * @tc.desc Verify $_set(0, 3.7) 3 values() 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 3.7);
      let v = a.values().next().value as number;
      expect(v).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArrayValuesPart01Test048
     * @tc.desc Verify $_set(0, -3.7) -3 values() -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -3.7);
      let v = a.values().next().value as number;
      expect(v).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArrayValuesPart01Test049
     * @tc.desc Verify $_set(0, 0.5) 1 0 values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 0.5);
      let v = a.values().next().value as number;
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArrayValuesPart01Test050
     * @tc.desc Verify $_set(0, -0.9) -1 0 values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, -0.9);
      let v = a.values().next().value as number;
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArrayValuesPart01Test051
     * @tc.desc Verify $_set(0, Number.NaN) ToInt32 0 values() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, Number.NaN);
      let v = a.values().next().value as number;
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArrayValuesPart01Test052
     * @tc.desc Verify subarray(0) values() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let sub = a.subarray(0);
      let v = sub.values().next().value as number;
      expect(v).assertEqual(10);
      expect(sub.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArrayValuesPart01Test053
     * @tc.desc Verify subarray(1) 2 values() value= 1 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let sub = a.subarray(1);
      let v = sub.values().next().value as number;
      expect(v).assertEqual(20);
      expect(sub.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArrayValuesPart01Test054
     * @tc.desc Verify subarray(1,2) 1 values() value=20 done=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let sub = a.subarray(1, 2);
      let r = sub.values().next();
      let v = r.value as number;
      expect(v).assertEqual(20);
      expect(r.done).assertFalse();
      expect(sub.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArrayValuesPart01Test055
     * @tc.desc Verify subarray(0,0) values() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let sub = a.subarray(0, 0);
      expect(sub.values().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArrayValuesPart01Test056
     * @tc.desc Verify subarray(3,3) values() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let sub = a.subarray(3, 3);
      expect(sub.values().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArrayValuesPart01Test057
     * @tc.desc Verify slice(0) values() value= 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let cp = a.slice(0);
      let v = cp.values().next().value as number;
      expect(v).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArrayValuesPart01Test058
     * @tc.desc Verify slice(1,2) values() value=20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let cp = a.slice(1, 2);
      let v = cp.values().next().value as number;
      expect(v).assertEqual(20);
      expect(cp.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_5900
     * @tc.name int32ArrayValuesPart01Test059
     * @tc.desc Verify slice(3) values() next done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let cp = a.slice(3);
      expect(cp.values().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArrayValuesPart01Test060
     * @tc.desc Verify buffer $_set subarray values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let sub = a.subarray(1);
      a.$_set(1, 88);
      let v = sub.values().next().value as number;
      expect(v).assertEqual(88);
      expect(sub.$_get(0)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_6100
     * @tc.name int32ArrayValuesPart01Test061
     * @tc.desc Verify ArrayBuffer a1 a2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let a1: Int32Array = new Int32Array(buf, 0, 1);
      let a2: Int32Array = new Int32Array(buf, 4, 1);
      a1.$_set(0, 123);
      let v = a2.values().next().value as number;
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_6200
     * @tc.name int32ArrayValuesPart01Test062
     * @tc.desc Verify $_set(0, 5) values() value=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 5);
      let v = a.values().next().value as number;
      expect(v).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_6300
     * @tc.name int32ArrayValuesPart01Test063
     * @tc.desc Verify $_set values() value= 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.$_set(0, 11);
      a.$_set(1, 22);
      a.$_set(2, 33);
      let v = a.values().next().value as number;
      expect(v).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_6400
     * @tc.name int32ArrayValuesPart01Test064
     * @tc.desc Verify $_set(0, 1) $_set(0, 9) values() 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      a.$_set(0, 1);
      a.$_set(0, 9);
      let v = a.values().next().value as number;
      expect(v).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_6500
     * @tc.name int32ArrayValuesPart01Test065
     * @tc.desc Verify fill(8) values() value=8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.fill(8);
      let v = a.values().next().value as number;
      expect(v).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_6600
     * @tc.name int32ArrayValuesPart01Test066
     * @tc.desc Verify fill(-1) values() value=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.fill(-1);
      let v = a.values().next().value as number;
      expect(v).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_6700
     * @tc.name int32ArrayValuesPart01Test067
     * @tc.desc Verify fill(MAX) values() value=2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.fill(2147483647);
      let v = a.values().next().value as number;
      expect(v).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_6800
     * @tc.name int32ArrayValuesPart01Test068
     * @tc.desc Verify [1,2,3].reverse() values() value=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      a.reverse();
      let v = a.values().next().value as number;
      expect(v).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_6900
     * @tc.name int32ArrayValuesPart01Test069
     * @tc.desc Verify [3,1,2].sort() values() value=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(3, 1, 2);
      a.sort();
      let v = a.values().next().value as number;
      expect(v).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_7000
     * @tc.name int32ArrayValuesPart01Test070
     * @tc.desc Verify [1,2,3,4].copyWithin(0,2) values() value=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      a.copyWithin(0, 2);
      let v = a.values().next().value as number;
      expect(v).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_7100
     * @tc.name int32ArrayValuesPart01Test071
     * @tc.desc Verify new Int32Array(3).set([7,8,9]) values() value=7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let src: number[] = [7, 8, 9];
      a.set(src);
      let v = a.values().next().value as number;
      expect(v).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_7200
     * @tc.name int32ArrayValuesPart01Test072
     * @tc.desc Verify new Int32Array(4).set([11,22], 2) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let src: number[] = [11, 22];
      a.set(src, 2);
      let v = a.values().next().value as number;
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_7300
     * @tc.name int32ArrayValuesPart01Test073
     * @tc.desc Verify .fill(0).reverse().sort() values() value=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let v = a.fill(0)
      .reverse()
      .sort()
      .values()
      .next()
      .value as number;
      expect(v).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_7400
     * @tc.name int32ArrayValuesPart01Test074
     * @tc.desc Verify Int32Array.from([1,2,3], x => x*2) values() value=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2, 3];
      let a: Int32Array = Int32Array.from(src, (x: number) => x * 2);
      let v = a.values().next().value as number;
      expect(v).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_7500
     * @tc.name int32ArrayValuesPart01Test075
     * @tc.desc Verify Int32Array.from([1], x => -x) values() value=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1];
      let a: Int32Array = Int32Array.from(src, (x: number) => -x);
      let v = a.values().next().value as number;
      expect(v).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_7600
     * @tc.name int32ArrayValuesPart01Test076
     * @tc.desc Verify [-5, 0, 5] values() value=-5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-5, 0, 5]);
      let v = a.values().next().value as number;
      expect(v).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_7700
     * @tc.name int32ArrayValuesPart01Test077
     * @tc.desc Verify [7,7,7] values() value=7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([7, 7, 7]);
      let v = a.values().next().value as number;
      expect(v).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_7800
     * @tc.name int32ArrayValuesPart01Test078
     * @tc.desc Verify [MAX, MIN] values() value=MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.$_set(0, 2147483647);
      a.$_set(1, -2147483648 as number);
      let v = a.values().next().value as number;
      expect(v).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_7900
     * @tc.name int32ArrayValuesPart01Test079
     * @tc.desc Verify [0, -1, 1] values() value=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0, -1, 1]);
      let it = a.values();
      it.next();
      it.next();
      let v = it.next().value as number;
      expect(v).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_8000
     * @tc.name int32ArrayValuesPart01Test080
     * @tc.desc Verify values() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      a.values();
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_8100
     * @tc.name int32ArrayValuesPart01Test081
     * @tc.desc Verify values() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let it = a.values();
      it.next();
      it.next();
      it.next();
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_8200
     * @tc.name int32ArrayValuesPart01Test082
     * @tc.desc Verify values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(100);
      let it = a.values();
      it.next();
      it.next();
      expect(a.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_8300
     * @tc.name int32ArrayValuesPart01Test083
     * @tc.desc Verify values() next().value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new Int32Array([42]).values().next();
      expect(r.done).assertFalse();
      expect(r.value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUES_PART01_TEST_MINDMAP_8400
     * @tc.name int32ArrayValuesPart01Test084
     * @tc.desc Verify empty Int32Array values() next().value is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValuesPart01Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new Int32Array().values().next();
      expect(r.value).assertEqual(undefined);
    });
  });
}
