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

export default function Float32ArrayIntegration5Test(): void {
  describe('Float32ArrayIntegration5Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_0100
     * @tc.name testFloat32ArrayIntegrationFive001
     * @tc.desc Verify a parent write is visible through a subarray child sharing the same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1, 2, 3, 4]);
      const child = parent.subarray(1, 3);
      parent.$_set(1, 99);
      const element001 = child.$_get(0);
      expect(element001).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_0200
     * @tc.name testFloat32ArrayIntegrationFive002
     * @tc.desc Verify a subarray child write is visible through the parent at the matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1, 2, 3, 4]);
      const child = parent.subarray(1, 3);
      child.$_set(0, 88);
      const element002 = parent.$_get(1);
      expect(element002).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_0300
     * @tc.name testFloat32ArrayIntegrationFive003
     * @tc.desc Verify ArrayBuffer-backed views map parent index 2 to child index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const parent = new Float32Array(buf);
      const child = new Float32Array(buf, 8, 2);
      parent.$_set(2, 77);
      const element003 = child.$_get(0);
      expect(element003).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_0400
     * @tc.name testFloat32ArrayIntegrationFive004
     * @tc.desc Verify ArrayBuffer-backed views map child index 0 to parent index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const parent = new Float32Array(buf);
      const child = new Float32Array(buf, 8, 2);
      child.$_set(0, 66);
      const element004 = parent.$_get(2);
      expect(element004).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_0500
     * @tc.name testFloat32ArrayIntegrationFive005
     * @tc.desc Verify two disjoint subarrays write back to their own parent ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1, 2, 3, 4]);
      const a = parent.subarray(0, 2);
      const b = parent.subarray(2, 4);
      a.$_set(1, 50);
      b.$_set(0, 60);
      const element005 = parent.$_get(1);
      expect(element005).assertEqual(50);
      const element005Part2 = parent.$_get(2);
      expect(element005Part2).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_0600
     * @tc.name testFloat32ArrayIntegrationFive006
     * @tc.desc Verify a nested subarray still shares the underlying buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1, 2, 3, 4, 5]);
      const mid = parent.subarray(1, 4);
      const inner = mid.subarray(1, 2);
      inner.$_set(0, 42);
      const element006 = parent.$_get(2);
      expect(element006).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_0700
     * @tc.name testFloat32ArrayIntegrationFive007
     * @tc.desc Verify set(source) writes through a subarray view to the corresponding parent slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1, 2, 3, 4]);
      const child = parent.subarray(1, 3);
      child.set(new Float32Array([55, 56]));
      const element007 = parent.$_get(1);
      expect(element007).assertEqual(55);
      const element007Part2 = parent.$_get(2);
      expect(element007Part2).assertEqual(56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_0800
     * @tc.name testFloat32ArrayIntegrationFive008
     * @tc.desc Verify fill writes through a subarray view only to the corresponding parent range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1, 2, 3, 4, 5]);
      const child = parent.subarray(1, 4);
      child.fill(7);
      const element008 = parent.$_get(1);
      expect(element008).assertEqual(7);
      const element008Part2 = parent.$_get(2);
      expect(element008Part2).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_0900
     * @tc.name testFloat32ArrayIntegrationFive009
     * @tc.desc Verify reverse on a subarray view reverses the corresponding parent range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1, 2, 3, 4, 5]);
      const child = parent.subarray(1, 4);
      child.reverse();
      const element009 = parent.$_get(1);
      expect(element009).assertEqual(4);
      const element009Part2 = parent.$_get(3);
      expect(element009Part2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_1000
     * @tc.name testFloat32ArrayIntegrationFive010
     * @tc.desc Verify sort on a subarray view sorts the corresponding parent range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([5, 3, 1, 4, 2]);
      const child = parent.subarray(0, 3);
      child.sort();
      const element010 = parent.$_get(0);
      expect(element010).assertEqual(1);
      const element010Part2 = parent.$_get(2);
      expect(element010Part2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_1100
     * @tc.name testFloat32ArrayIntegrationFive011
     * @tc.desc Verify copyWithin on a subarray view rewrites the corresponding parent slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1, 2, 3, 4, 5]);
      const child = parent.subarray(0, 4);
      child.copyWithin(2, 0, 1);
      const element011 = parent.$_get(2);
      expect(element011).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_1200
     * @tc.name testFloat32ArrayIntegrationFive012
     * @tc.desc Verify with on a subarray returns a new array without modifying the parent array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1, 2, 3, 4]);
      const child = parent.subarray(1, 3);
      const r = child.with(0, 100);
      const element012 = parent.$_get(1);
      expect(element012).assertEqual(2);
      const element012Part2 = r.$_get(0);
      expect(element012Part2).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_1300
     * @tc.name testFloat32ArrayIntegrationFive013
     * @tc.desc Verify map on a subarray returns a new array and leaves the parent array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1, 2, 3, 4]);
      const child = parent.subarray(1, 3);
      const r = child.map((v: number, index: int, array: Float32Array) => {
        return v * 10;
      });
      const element013 = parent.$_get(1);
      expect(element013).assertEqual(2);
      const element013Part2 = r.$_get(1);
      expect(element013Part2).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_1400
     * @tc.name testFloat32ArrayIntegrationFive014
     * @tc.desc Verify toReversed on a subarray returns a new array and leaves the parent array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1, 2, 3, 4]);
      const child = parent.subarray(1, 3);
      const r = child.toReversed();
      const element014 = parent.$_get(1);
      expect(element014).assertEqual(2);
      const element014Part2 = r.$_get(0);
      expect(element014Part2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_1500
     * @tc.name testFloat32ArrayIntegrationFive015
     * @tc.desc Verify toSorted on a subarray returns a new array and leaves the parent array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1, 3, 2, 4]);
      const child = parent.subarray(0, 3);
      const r = child.toSorted();
      const element015 = parent.$_get(1);
      expect(element015).assertEqual(3);
      const element015Part2 = r.$_get(0);
      expect(element015Part2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_1600
     * @tc.name testFloat32ArrayIntegrationFive016
     * @tc.desc Verify subarray byteOffset reflects the byte offset relative to the buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1, 2, 3, 4]);
      const child = parent.subarray(2, 4);
      expect(child.byteOffset).assertEqual(parent.byteOffset + 8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_1700
     * @tc.name testFloat32ArrayIntegrationFive017
     * @tc.desc Verify subarray byteLength equals the element count multiplied by 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1, 2, 3, 4]);
      const child = parent.subarray(1, 3);
      expect(child.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_1800
     * @tc.name testFloat32ArrayIntegrationFive018
     * @tc.desc Verify subarray length equals the element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1, 2, 3, 4]);
      const child = parent.subarray(1, 3);
      expect(child.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_1900
     * @tc.name testFloat32ArrayIntegrationFive019
     * @tc.desc Verify negative subarray indices create a tail view that still shares the buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1, 2, 3, 4]);
      const child = parent.subarray(-2);
      child.$_set(0, 11);
      const element019 = parent.$_get(2);
      expect(element019).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_2000
     * @tc.name testFloat32ArrayIntegrationFive020
     * @tc.desc Verify three disjoint views on the same buffer can write independently and a full view reads all changes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const observedValue020 = new Float32Array(buf, 0, 1);
      const observedValue020Part2 = new Float32Array(buf, 4, 1);
      const observedValue020Part3 = new Float32Array(buf, 8, 1);
      observedValue020.$_set(0, 10);
      observedValue020Part2.$_set(0, 20);
      observedValue020Part3.$_set(0, 30);
      const all = new Float32Array(buf);
      const element020 = all.$_get(0);
      expect(element020).assertEqual(10);
      const element020Part2 = all.$_get(2);
      expect(element020Part2).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_2100
     * @tc.name testFloat32ArrayIntegrationFive021
     * @tc.desc Verify a zero-length subarray remains empty after the parent array is modified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1, 2, 3, 4]);
      const child = parent.subarray(2, 2);
      parent.$_set(2, 99);
      expect(child.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_2200
     * @tc.name testFloat32ArrayIntegrationFive022
     * @tc.desc Verify fill on a subarray stays within view bounds and leaves parent edges unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1, 2, 3, 4, 5]);
      const child = parent.subarray(1, 4);
      child.fill(0);
      const element022 = parent.$_get(0);
      expect(element022).assertEqual(1);
      const element022Part2 = parent.$_get(4);
      expect(element022Part2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_2300
     * @tc.name testFloat32ArrayIntegrationFive023
     * @tc.desc Verify copyWithin on a subarray stays within view bounds and leaves parent slots outside the range unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1, 2, 3, 4, 5]);
      const child = parent.subarray(0, 3);
      child.copyWithin(0, 2, 3);
      const element023 = parent.$_get(0);
      expect(element023).assertEqual(3);
      const element023Part2 = parent.$_get(3);
      expect(element023Part2).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_2400
     * @tc.name testFloat32ArrayIntegrationFive024
     * @tc.desc Verify byteLength remains a multiple of 4, with three elements represented as 12 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3]);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_2500
     * @tc.name testFloat32ArrayIntegrationFive025
     * @tc.desc Verify the root view byteOffset is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3]);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_2600
     * @tc.name testFloat32ArrayIntegrationFive026
     * @tc.desc Verify an ArrayBuffer view can be constructed with byteOffset 4 and length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Float32Array(buf, 4, 3);
      expect(view.byteOffset).assertEqual(4);
      expect(view.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_2700
     * @tc.name testFloat32ArrayIntegrationFive027
     * @tc.desc Verify an ArrayBuffer view can be constructed with byteOffset 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const view = new Float32Array(buf, 8, 3);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_2800
     * @tc.name testFloat32ArrayIntegrationFive028
     * @tc.desc Verify subarray byteOffset remains four-byte aligned relative to the parent view with difference 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1, 2, 3, 4, 5]);
      const child = parent.subarray(2, 4);
      const byteOffsetValue028 = child.byteOffset - parent.byteOffset;
      expect(byteOffsetValue028).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_2900
     * @tc.name testFloat32ArrayIntegrationFive029
     * @tc.desc Verify reverse returns the same reference and mutating the return value updates the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3]);
      const ret = arr.reverse();
      expect(ret).assertEqual(arr);
      ret.$_set(0, 99);
      const element030 = arr.$_get(0);
      expect(element030).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_3000
     * @tc.name testFloat32ArrayIntegrationFive030
     * @tc.desc Verify sort returns the same reference and mutating the return value updates the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3, 1, 2]);
      const ret = arr.sort();
      expect(ret).assertEqual(arr);
      ret.$_set(0, 99);
      const element031 = arr.$_get(0);
      expect(element031).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_3100
     * @tc.name testFloat32ArrayIntegrationFive031
     * @tc.desc Verify fill returns the same reference and mutating the return value updates the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const ret = arr.fill(5);
      expect(ret).assertEqual(arr);
      ret.$_set(1, 99);
      const element032 = arr.$_get(1);
      expect(element032).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_3200
     * @tc.name testFloat32ArrayIntegrationFive032
     * @tc.desc Verify copyWithin returns the same reference and mutating the return value updates the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3, 4]);
      const ret = arr.copyWithin(0, 2, 4);
      expect(ret).assertEqual(arr);
      ret.$_set(0, 99);
      const element033 = arr.$_get(0);
      expect(element033).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_3300
     * @tc.name testFloat32ArrayIntegrationFive033
     * @tc.desc Verify map returns a new array and mutating the result leaves the original array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3]);
      const ret = arr.map((v: number, index: int, array: Float32Array) => {
        return v + 1;
      });
      ret.$_set(0, 99);
      const element034 = arr.$_get(0);
      expect(element034).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_3400
     * @tc.name testFloat32ArrayIntegrationFive034
     * @tc.desc Verify filter returns a new array and mutating the result leaves the original array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3]);
      const ret = arr.filter((v: number, index: int, array: Float32Array) => {
        return v > 1;
      });
      ret.$_set(0, 99);
      const element035 = arr.$_get(1);
      expect(element035).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_3500
     * @tc.name testFloat32ArrayIntegrationFive035
     * @tc.desc Verify with returns a new array and leaves the original array position unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3]);
      const ret = arr.with(1, 99);
      const element036 = arr.$_get(1);
      expect(element036).assertEqual(2);
      const element036Part2 = ret.$_get(1);
      expect(element036Part2).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_3600
     * @tc.name testFloat32ArrayIntegrationFive036
     * @tc.desc Verify toReversed returns a new array and leaves the original array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3]);
      const ret = arr.toReversed();
      const element037 = arr.$_get(0);
      expect(element037).assertEqual(1);
      const element037Part2 = ret.$_get(0);
      expect(element037Part2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_3700
     * @tc.name testFloat32ArrayIntegrationFive037
     * @tc.desc Verify toSorted returns a new array and leaves the original array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3, 1, 2]);
      const ret = arr.toSorted();
      const element038 = arr.$_get(0);
      expect(element038).assertEqual(3);
      const element038Part2 = ret.$_get(0);
      expect(element038Part2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_3800
     * @tc.name testFloat32ArrayIntegrationFive038
     * @tc.desc Verify nested reverse(reverse(x)) restores the original order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3]);
      arr.reverse().reverse();
      const element039 = arr.$_get(0);
      expect(element039).assertEqual(1);
      const element039Part2 = arr.$_get(2);
      expect(element039Part2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_3900
     * @tc.name testFloat32ArrayIntegrationFive039
     * @tc.desc Verify nested sort(sort(x)) keeps ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3, 1, 2]);
      arr.sort().sort();
      const element040 = arr.$_get(0);
      expect(element040).assertEqual(1);
      const element040Part2 = arr.$_get(2);
      expect(element040Part2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_4000
     * @tc.name testFloat32ArrayIntegrationFive040
     * @tc.desc Verify nested map(map(x)) adds 1 twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3]);
      const r = arr.map((v: number, index: int, array: Float32Array) => {
        return v + 1;
      }).map((v: number, index: int, array: Float32Array) => {
        return v + 1;
      });
      const element041 = r.$_get(0);
      expect(element041).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_4100
     * @tc.name testFloat32ArrayIntegrationFive041
     * @tc.desc Verify nested filter followed by map filters and transforms values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3, 4]);
      const r = arr.filter((v: number, index: int, array: Float32Array) => {
        return v > 1;
      }).map((v: number, index: int, array: Float32Array) => {
        return v * 10;
      });
      const element042 = r.$_get(0);
      expect(element042).assertEqual(20);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_4200
     * @tc.name testFloat32ArrayIntegrationFive042
     * @tc.desc Verify nested fill followed by copyWithin performs chained in-place updates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3, 4]);
      arr.fill(5).copyWithin(2, 0, 1);
      const element043 = arr.$_get(0);
      expect(element043).assertEqual(5);
      const element043Part2 = arr.$_get(3);
      expect(element043Part2).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_4300
     * @tc.name testFloat32ArrayIntegrationFive043
     * @tc.desc Verify nested with calls form an immutable chain and leave the original array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3]);
      const r = arr.with(0, 10).with(1, 20);
      const element044 = arr.$_get(0);
      expect(element044).assertEqual(1);
      const element044Part2 = r.$_get(0);
      expect(element044Part2).assertEqual(10);
      const element044Part3 = r.$_get(1);
      expect(element044Part3).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_4400
     * @tc.name testFloat32ArrayIntegrationFive044
     * @tc.desc Verify nested toReversed followed by toSorted leaves the original array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 3, 2]);
      const r = arr.toReversed().toSorted();
      const element045 = arr.$_get(0);
      expect(element045).assertEqual(1);
      const element045Part2 = r.$_get(0);
      expect(element045Part2).assertEqual(1);
      const element045Part3 = r.$_get(2);
      expect(element045Part3).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_4500
     * @tc.name testFloat32ArrayIntegrationFive045
     * @tc.desc Verify a forEach callback writes to external accumulator state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum = 0;
      const arr = new Float32Array([1, 2, 3]);
      arr.forEach((v: number, index: int, array: Float32Array) => {
        sum = sum + (v.toInt());
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_4600
     * @tc.name testFloat32ArrayIntegrationFive046
     * @tc.desc Verify a map callback reads external multiplier state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let factor = 10;
      const arr = new Float32Array([1, 2, 3]);
      const r = arr.map((v: number, index: int, array: Float32Array) => {
        return v * factor;
      });
      const element047 = r.$_get(2);
      expect(element047).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_4700
     * @tc.name testFloat32ArrayIntegrationFive047
     * @tc.desc Verify forEach reads later elements modified during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3]);
      let seen = 0;
      arr.forEach((v: number, i: int) => {
        if (i === 0) {
          arr.$_set(1, 99);
        }
        if (i === 1) {
          seen = v.toInt();
        }
      });
      expect(seen).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_4800
     * @tc.name testFloat32ArrayIntegrationFive048
     * @tc.desc Verify forEach propagates callback errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3]);
      try {
        arr.forEach((v: number, index: int, array: Float32Array) => {
          throw new Error('cb');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('cb');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_4900
     * @tc.name testFloat32ArrayIntegrationFive049
     * @tc.desc Verify map propagates callback errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3]);
      try {
        arr.map((v: number, index: int, array: Float32Array) => {
          throw new Error('cb');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('cb');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_5000
     * @tc.name testFloat32ArrayIntegrationFive050
     * @tc.desc Verify filter propagates callback errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3]);
      try {
        arr.filter((v: number, index: int, array: Float32Array) => {
          throw new Error('cb');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('cb');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_5100
     * @tc.name testFloat32ArrayIntegrationFive051
     * @tc.desc Verify find propagates callback errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3]);
      try {
        arr.find((v: number, index: int, array: Float32Array) => {
          throw new Error('cb');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('cb');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_5200
     * @tc.name testFloat32ArrayIntegrationFive052
     * @tc.desc Verify the same index reflects write-read-overwrite-read as the latest value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      arr.$_set(0, 42);
      const element053 = arr.$_get(0);
      expect(element053).assertEqual(42);
      arr.$_set(0, 84);
      const element053Part2 = arr.$_get(0);
      expect(element053Part2).assertEqual(84);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_5300
     * @tc.name testFloat32ArrayIntegrationFive053
     * @tc.desc Verify at reads the same index value after $_set writes it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0, 0, 0]);
      arr.$_set(2, 33);
      const atValue054 = arr.at(2);
      expect(atValue054).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_5400
     * @tc.name testFloat32ArrayIntegrationFive054
     * @tc.desc Verify fill on a partial range followed by slice changes only the requested range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3, 4]);
      arr.fill(0, 1, 3);
      const r = arr.slice(0, 4);
      const element055 = r.$_get(1);
      expect(element055).assertEqual(0);
      const element055Part2 = r.$_get(3);
      expect(element055Part2).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_5500
     * @tc.name testFloat32ArrayIntegrationFive055
     * @tc.desc Verify reverse moves the value written with $_set to the mirror position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3]);
      arr.$_set(0, 9);
      arr.reverse();
      const element056 = arr.$_get(2);
      expect(element056).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_5600
     * @tc.name testFloat32ArrayIntegrationFive056
     * @tc.desc Verify for-of iterates over and sums all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10, 20, 30]);
      let sum = 0.0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const v = arr.$_get(__f32i);
        sum = sum + v;
      }
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_5700
     * @tc.name testFloat32ArrayIntegrationFive057
     * @tc.desc Verify values().next() returns elements in sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10, 20]);
      const it = arr.values();
      const a = it.next();
      const b = it.next();
      expect(a.value).assertEqual(10);
      expect(b.value).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_5800
     * @tc.name testFloat32ArrayIntegrationFive058
     * @tc.desc Verify entries() yields [index, value] pairs for each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5, 6, 7]);
      const iter = arr.entries();
      const a = iter.next();
      const b = iter.next();
      const c = iter.next();
      const d = iter.next();
      expect(a.value![0]).assertEqual(0);
      expect(a.value![1]).assertEqual(5);
      expect(b.value![0]).assertEqual(1);
      expect(b.value![1]).assertEqual(6);
      expect(c.value![0]).assertEqual(2);
      expect(c.value![1]).assertEqual(7);
      expect(d.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_5900
     * @tc.name testFloat32ArrayIntegrationFive059
     * @tc.desc Verify keys().next() returns the index sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5, 6, 7]);
      const it = arr.keys();
      const a = it.next();
      const b = it.next();
      expect(a.value).assertEqual(0);
      expect(b.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_6000
     * @tc.name testFloat32ArrayIntegrationFive060
     * @tc.desc Verify an exhausted iterator returns undefined as the value from next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5]);
      const it = arr.values();
      it.next();
      const last = it.next();
      expect(last.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_6100
     * @tc.name testFloat32ArrayIntegrationFive061
     * @tc.desc Verify two independent iterators do not interfere and each starts from the beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10, 20, 30]);
      const it1 = arr.values();
      const it2 = arr.values();
      const a1 = it1.next();
      const a2 = it2.next();
      const b1 = it1.next();
      const b2 = it2.next();
      expect(a1.value).assertEqual(10);
      expect(a2.value).assertEqual(10);
      expect(b1.value).assertEqual(20);
      expect(b2.value).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_6200
     * @tc.name testFloat32ArrayIntegrationFive062
     * @tc.desc Verify $_iterator() returns an iterator whose next() yields elements in sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2]);
      const it = arr.$_iterator();
      const a = it.next();
      const b = it.next();
      expect(a.value).assertEqual(1);
      expect(b.value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_6300
     * @tc.name testFloat32ArrayIntegrationFive063
     * @tc.desc Verify a new iterator reads the latest value after array mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3]);
      arr.$_set(0, 99);
      const it = arr.values();
      const a = it.next();
      expect(a.value).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INTEGRATION_FIVE_6400
     * @tc.name testFloat32ArrayIntegrationFive064
     * @tc.desc Verify forEach reads a value changed externally before iteration begins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIntegrationFive064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3]);
      arr.$_set(1, 50);
      let saw = 0;
      arr.forEach((v: number, i: int) => {
        if (i === 1) {
          saw = v.toInt();
        }
      });
      expect(saw).assertEqual(50);
    });

  });
}
