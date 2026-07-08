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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

class IterObj {
  v: int = 0;

  constructor(v: int) {
    this.v = v;
  }
}

export default function BlockingQueueIterableVariantTest(): void {
  describe('BlockingQueueIterableVariantTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_0100
     * @tc.name testBlockingQueueIterable001
     * @tc.desc Verify LinkedBlockingQueue<int> from Array<int> literal iterable preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ARRAY_VALUE: int = 1;
      const ARRAY_VALUE_2: int = 2;
      const ARRAY_VALUE_3: int = 3;
      const ARRAY_VALUE_4: int = 4;
      const ARRAY_VALUE_5: int = 5;
      let arr: int[] = [ARRAY_VALUE, ARRAY_VALUE_2, ARRAY_VALUE_3, ARRAY_VALUE_4, ARRAY_VALUE_5];
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      for (let i: int = 0; i < arr.length; i++) {
        expect(q.pop()).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_0200
     * @tc.name testBlockingQueueIterable002
     * @tc.desc Verify LinkedBlockingQueue<int> from new Array<int>(0) empty array iterable creates empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const EXPECTED_SIZE: int = 0;
      let arr: int[] = [];
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_0300
     * @tc.name testBlockingQueueIterable003
     * @tc.desc Verify LinkedBlockingQueue<int> from new Array<int>(1) single-slot uninitialized array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const INDEX: int = 0;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_VALUE: int = 0;
      const ARRAY_VALUE: int = 0;
      let arr: int[] = [ARRAY_VALUE];
      arr[INDEX] = 0;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.getFirst()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_0400
     * @tc.name testBlockingQueueIterable004
     * @tc.desc Verify LinkedBlockingQueue<int> from Array.values() iterator preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ARRAY_VALUE: int = 11;
      const ARRAY_VALUE_2: int = 22;
      const ARRAY_VALUE_3: int = 33;
      const ARRAY_VALUE_4: int = 44;
      const ARRAY_VALUE_5: int = 55;
      let arr: int[] = [ARRAY_VALUE, ARRAY_VALUE_2, ARRAY_VALUE_3, ARRAY_VALUE_4, ARRAY_VALUE_5];
      let it = arr.values();
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(it);
      for (let i: int = 0; i < arr.length; i++) {
        expect(q.pop()).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_0500
     * @tc.name testBlockingQueueIterable005
     * @tc.desc Verify ArrayBlockingQueue<int>(20, Array.values() iterator) preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 20;
      const ARRAY_VALUE: int = 9;
      const ARRAY_VALUE_2: int = 8;
      const ARRAY_VALUE_3: int = 7;
      const ARRAY_VALUE_4: int = 6;
      const ARRAY_VALUE_5: int = 5;
      let arr: int[] = [ARRAY_VALUE, ARRAY_VALUE_2, ARRAY_VALUE_3, ARRAY_VALUE_4, ARRAY_VALUE_5];
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr.values());
      for (let i: int = 0; i < arr.length; i++) {
        expect(q.pop()).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_0600
     * @tc.name testBlockingQueueIterable006
     * @tc.desc Verify LinkedBlockingQueue<int> from Set<int> iterable initializes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ADD_VALUE: int = 100;
      const ADD_VALUE_2: int = 200;
      const ADD_VALUE_3: int = 300;
      const EXPECTED_SIZE: int = 3;
      const EXPECTED_VALUE: int = 600;
      let s = new Set<int>();
      s.add(ADD_VALUE);
      s.add(ADD_VALUE_2);
      s.add(ADD_VALUE_3);
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(s);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      let total: int = 0;
      while (!q.isEmpty()) {
        total += q.pop();
      }
      expect(total).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_0700
     * @tc.name testBlockingQueueIterable007
     * @tc.desc Verify ArrayBlockingQueue<int>(50, Set<int>) initializes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 50;
      const EXPECTED_SIZE: int = 30;
      const EXPECTED_CAPACITY: int = 50;
      let s = new Set<int>();
      for (let i: int = 0; i < 30; i++) {
        s.add(i);
      }
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, s);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_0800
     * @tc.name testBlockingQueueIterable008
     * @tc.desc Verify LinkedBlockingQueue<string> from Set<string> iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ADD_TEXT: string = "apple";
      const ADD_TEXT_2: string = "banana";
      const ADD_TEXT_3: string = "cherry";
      const EXPECTED_SIZE: int = 3;
      const EXPECTED_ENTRY: string = "apple";
      const EXPECTED_ENTRY_2: string = "banana";
      const EXPECTED_ENTRY_3: string = "cherry";
      let s = new Set<string>();
      s.add(ADD_TEXT);
      s.add(ADD_TEXT_2);
      s.add(ADD_TEXT_3);
      let q: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>(s);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      let collected = new Set<string>();
      while (!q.isEmpty()) {
        collected.add(q.pop());
      }
      expect(collected.size).assertEqual(EXPECTED_SIZE);
      expect(collected.has(EXPECTED_ENTRY)).assertTrue();
      expect(collected.has(EXPECTED_ENTRY_2)).assertTrue();
      expect(collected.has(EXPECTED_ENTRY_3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_0900
     * @tc.name testBlockingQueueIterable009
     * @tc.desc Verify LinkedBlockingQueue<int> from Map.keys() iterator preserves keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const MAP_VALUE_TEXT: string = "one";
      const MAP_KEY: int = 1;
      const MAP_VALUE_TEXT_2: string = "two";
      const MAP_KEY_2: int = 2;
      const MAP_VALUE_TEXT_3: string = "three";
      const MAP_KEY_3: int = 3;
      const EXPECTED_SIZE: int = 3;
      const EXPECTED_VALUE: int = 6;
      let m = new Map<int, string>();
      m.set(MAP_KEY, MAP_VALUE_TEXT);
      m.set(MAP_KEY_2, MAP_VALUE_TEXT_2);
      m.set(MAP_KEY_3, MAP_VALUE_TEXT_3);
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(m.keys());
      expect(q.size).assertEqual(EXPECTED_SIZE);
      let total: int = 0;
      while (!q.isEmpty()) {
        total += q.pop();
      }
      expect(total).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_1000
     * @tc.name testBlockingQueueIterable010
     * @tc.desc Verify LinkedBlockingQueue<string> from Map.values() iterator preserves values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const MAP_VALUE_TEXT: string = "one";
      const MAP_KEY: int = 1;
      const MAP_VALUE_TEXT_2: string = "two";
      const MAP_KEY_2: int = 2;
      const EXPECTED_SIZE: int = 2;
      const EXPECTED_ENTRY: string = "one";
      const EXPECTED_ENTRY_2: string = "two";
      let m = new Map<int, string>();
      m.set(MAP_KEY, MAP_VALUE_TEXT);
      m.set(MAP_KEY_2, MAP_VALUE_TEXT_2);
      let q: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>(m.values());
      expect(q.size).assertEqual(EXPECTED_SIZE);
      let collected = new Set<string>();
      while (!q.isEmpty()) {
        collected.add(q.pop());
      }
      expect(collected.has(EXPECTED_ENTRY)).assertTrue();
      expect(collected.has(EXPECTED_ENTRY_2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_1100
     * @tc.name testBlockingQueueIterable011
     * @tc.desc Verify ArrayBlockingQueue<int>(10, Map.keys()) handles map-keys iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const MAP_KEY: int = 10;
      const CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 5;
      let m = new Map<int, int>();
      for (let i: int = 0; i < 5; i++) {
        m.set(i * MAP_KEY, i);
      }
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, m.keys());
      expect(q.size).assertEqual(EXPECTED_SIZE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_1200
     * @tc.name testBlockingQueueIterable012
     * @tc.desc Verify LinkedBlockingQueue<int> from large Set<int> (1000 elements) initializes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIterable012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_SIZE: int = 1000;
      const EXPECTED_CAPACITY: int = 2147483647;
      let s = new Set<int>();
      for (let i: int = 0; i < 1000; i++) {
        s.add(i);
      }
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(s);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_1300
     * @tc.name testBlockingQueueIterable013
     * @tc.desc Verify LinkedBlockingQueue<int> from int[] of length 1000 (large) preserves all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIterable013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_SIZE: int = 1000;
      let arr: int[] = [];
      for (let i: int = 0; i < 1000; i++) {
        arr.push(i);
      }
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      for (let i: int = 0; i < 100; i++) {
        expect(q.pop()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_1400
     * @tc.name testBlockingQueueIterable014
     * @tc.desc Verify ArrayBlockingQueue<int>(2000, large array) accepts 1000 elements with capacity slack
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIterable014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 2000;
      const EXPECTED_SIZE: int = 1000;
      const EXPECTED_REMAINING_CAPACITY: int = 1000;
      let arr: int[] = [];
      for (let i: int = 0; i < 1000; i++) {
        arr.push(i);
      }
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_1500
     * @tc.name testBlockingQueueIterable015
     * @tc.desc Verify LinkedBlockingQueue<int>(5, 100-element iterable) truncates to first 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 1;
      const CAPACITY: int = 5;
      const EXPECTED_SIZE: int = 5;
      const EXPECTED_VALUE: int = 1;
      let arr: int[] = [];
      for (let i: int = 0; i < 100; i++) {
        arr.push(i + PUSH_VALUE);
      }
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      for (let i: int = 0; i < 5; i++) {
        expect(q.pop()).assertEqual(i + EXPECTED_VALUE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_1600
     * @tc.name testBlockingQueueIterable016
     * @tc.desc Verify ArrayBlockingQueue<int>(3, 100-element iterable) truncates to first 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 1;
      const CAPACITY: int = 3;
      const EXPECTED_SIZE: int = 3;
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_VALUE_2: int = 2;
      const EXPECTED_VALUE_3: int = 3;
      let arr: int[] = [];
      for (let i: int = 0; i < 100; i++) {
        arr.push(i + PUSH_VALUE);
      }
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.pop()).assertEqual(EXPECTED_VALUE);
      expect(q.pop()).assertEqual(EXPECTED_VALUE_2);
      expect(q.pop()).assertEqual(EXPECTED_VALUE_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_1700
     * @tc.name testBlockingQueueIterable017
     * @tc.desc Verify LinkedBlockingQueue<string> from string[] iterable preserves all string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ARRAY_TEXT: string = "a";
      const ARRAY_TEXT_2: string = "b";
      const ARRAY_TEXT_3: string = "c";
      const ARRAY_TEXT_4: string = "d";
      const ARRAY_TEXT_5: string = "e";
      let arr: string[] = [ARRAY_TEXT, ARRAY_TEXT_2, ARRAY_TEXT_3, ARRAY_TEXT_4, ARRAY_TEXT_5];
      let q: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>(arr);
      for (let i: int = 0; i < arr.length; i++) {
        expect(q.pop()).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_1800
     * @tc.name testBlockingQueueIterable018
     * @tc.desc Verify LinkedBlockingQueue<boolean> from boolean[] iterable preserves all values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ARRAY_FLAG: boolean = true;
      const ARRAY_FLAG_2: boolean = false;
      const ARRAY_FLAG_3: boolean = true;
      const ARRAY_FLAG_4: boolean = true;
      const ARRAY_FLAG_5: boolean = false;
      let arr: boolean[] = [ARRAY_FLAG, ARRAY_FLAG_2, ARRAY_FLAG_3, ARRAY_FLAG_4, ARRAY_FLAG_5];
      let q: containers.BlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>(arr);
      for (let i: int = 0; i < arr.length; i++) {
        expect(q.pop()).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_1900
     * @tc.name testBlockingQueueIterable019
     * @tc.desc Verify ArrayBlockingQueue<boolean>(10, boolean[]) preserves all values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const ARRAY_FLAG: boolean = false;
      const ARRAY_FLAG_2: boolean = true;
      const ARRAY_FLAG_3: boolean = false;
      const ARRAY_FLAG_4: boolean = true;
      let arr: boolean[] = [ARRAY_FLAG, ARRAY_FLAG_2, ARRAY_FLAG_3, ARRAY_FLAG_4];
      let q: containers.BlockingQueue<boolean> = new containers.ArrayBlockingQueue<boolean>(CAPACITY, arr);
      for (let i: int = 0; i < arr.length; i++) {
        expect(q.pop()).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_2000
     * @tc.name testBlockingQueueIterable020
     * @tc.desc Verify LinkedBlockingQueue<IterObj> from IterObj[] iterable preserves references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const OBJECT_VALUE: int = 3;
      const OBJECT_VALUE_2: int = 2;
      const OBJECT_VALUE_3: int = 1;
      let arr: IterObj[] = [new IterObj(OBJECT_VALUE_3), new IterObj(OBJECT_VALUE_2), new IterObj(OBJECT_VALUE)];
      let q: containers.BlockingQueue<IterObj> = new containers.LinkedBlockingQueue<IterObj>(arr);
      for (let i: int = 0; i < arr.length; i++) {
        let r = q.pop();
        expect(r).assertEqual(arr[i]);
        expect(r.v).assertEqual(arr[i].v);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_2100
     * @tc.name testBlockingQueueIterable021
     * @tc.desc Verify LinkedBlockingQueue<int> from new Array<int>(0) and capacity=10 produces empty queue with full slack
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 0;
      const EXPECTED_CAPACITY: int = 10;
      const EXPECTED_REMAINING_CAPACITY: int = 10;
      let arr: int[] = [];
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.capacity).assertEqual(EXPECTED_CAPACITY);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_2200
     * @tc.name testBlockingQueueIterable022
     * @tc.desc Verify ArrayBlockingQueue<int>(10, new Array<int>(0)) creates empty queue with full capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 0;
      const EXPECTED_REMAINING_CAPACITY: int = 10;
      let arr: int[] = [];
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_2300
     * @tc.name testBlockingQueueIterable023
     * @tc.desc Verify LinkedBlockingQueue<int>(capacity=Int.MAX_VALUE) from large iterable preserves all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 100;
      const CAPACITY: int = 2147483647;
      const EXPECTED_SIZE: int = 500;
      const EXPECTED_REMAINING_CAPACITY: int = 500;
      const EXPECTED_REMAINING_CAPACITY_2: int = 2147483647;
      let arr: int[] = [];
      for (let i: int = 0; i < 500; i++) {
        arr.push(i + PUSH_VALUE);
      }
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY_2 - EXPECTED_REMAINING_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_2400
     * @tc.name testBlockingQueueIterable024
     * @tc.desc Verify LinkedBlockingQueue<int> from string-array.values() preserves order via iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ARRAY_TEXT: string = "x";
      const ARRAY_TEXT_2: string = "y";
      const ARRAY_TEXT_3: string = "z";
      const ARRAY_TEXT_4: string = "w";
      let arr: string[] = [ARRAY_TEXT, ARRAY_TEXT_2, ARRAY_TEXT_3, ARRAY_TEXT_4];
      let q: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>(arr.values());
      for (let i: int = 0; i < arr.length; i++) {
        expect(q.pop()).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_2500
     * @tc.name testBlockingQueueIterable025
     * @tc.desc Verify LinkedBlockingQueue<int> from Set with single element creates 1-size queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ADD_VALUE: int = 99;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_VALUE: int = 99;
      let s = new Set<int>();
      s.add(ADD_VALUE);
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(s);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.pop()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_2600
     * @tc.name testBlockingQueueIterable026
     * @tc.desc Verify LinkedBlockingQueue<int> from empty Set produces empty queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const EXPECTED_SIZE: int = 0;
      let s = new Set<int>();
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(s);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_2700
     * @tc.name testBlockingQueueIterable027
     * @tc.desc Verify ArrayBlockingQueue<int>(5, empty Set) creates empty queue with capacity=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const EXPECTED_SIZE: int = 0;
      const EXPECTED_CAPACITY: int = 5;
      let s = new Set<int>();
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, s);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.capacity).assertEqual(EXPECTED_CAPACITY);
      expect(q.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_2800
     * @tc.name testBlockingQueueIterable028
     * @tc.desc Verify LinkedBlockingQueue from Map with int values via keys iterator with capacity slack
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const MAP_VALUE: int = 1;
      const MAP_KEY_TEXT: string = "a";
      const MAP_VALUE_2: int = 2;
      const MAP_KEY_TEXT_2: string = "b";
      const MAP_VALUE_3: int = 3;
      const MAP_KEY_TEXT_3: string = "c";
      const CAPACITY: int = 100;
      const EXPECTED_SIZE: int = 3;
      const EXPECTED_CAPACITY: int = 100;
      let m = new Map<string, int>();
      m.set(MAP_KEY_TEXT, MAP_VALUE);
      m.set(MAP_KEY_TEXT_2, MAP_VALUE_2);
      m.set(MAP_KEY_TEXT_3, MAP_VALUE_3);
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, m.values());
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.capacity).assertEqual(EXPECTED_CAPACITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_2900
     * @tc.name testBlockingQueueIterable029
     * @tc.desc Verify ArrayBlockingQueue<string>(50, Map.keys()) preserves all map keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const MAP_VALUE: int = 1;
      const MAP_KEY_TEXT: string = "alpha";
      const MAP_VALUE_2: int = 2;
      const MAP_KEY_TEXT_2: string = "beta";
      const CAPACITY: int = 50;
      const EXPECTED_SIZE: int = 2;
      const EXPECTED_ENTRY: string = "alpha";
      const EXPECTED_ENTRY_2: string = "beta";
      let m = new Map<string, int>();
      m.set(MAP_KEY_TEXT, MAP_VALUE);
      m.set(MAP_KEY_TEXT_2, MAP_VALUE_2);
      let q: containers.BlockingQueue<string> = new containers.ArrayBlockingQueue<string>(CAPACITY, m.keys());
      expect(q.size).assertEqual(EXPECTED_SIZE);
      let collected = new Set<string>();
      while (!q.isEmpty()) {
        collected.add(q.pop());
      }
      expect(collected.has(EXPECTED_ENTRY)).assertTrue();
      expect(collected.has(EXPECTED_ENTRY_2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_3000
     * @tc.name testBlockingQueueIterable030
     * @tc.desc Verify LinkedBlockingQueue<int>(1, 100-element iterable) truncates to first element only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 999;
      const CAPACITY: int = 1;
      const EXPECTED_SIZE: int = 1;
      const EXPECTED_VALUE: int = 999;
      let arr: int[] = [];
      for (let i: int = 0; i < 100; i++) {
        arr.push(PUSH_VALUE - i);
      }
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.pop()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_3100
     * @tc.name testBlockingQueueIterable031
     * @tc.desc Verify LinkedBlockingQueue from sparse-style iterable behavior with default value 0 in Array<int>(N)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 10;
      const EXPECTED_SIZE: int = 5;
      const EXPECTED_VALUE: int = 10;
      let arr: int[] = [];
      for (let i: int = 0; i < 5; i++) {
        arr.push(i * PUSH_VALUE);
      }
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      for (let i: int = 0; i < 5; i++) {
        expect(q.pop()).assertEqual(i * EXPECTED_VALUE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_3200
     * @tc.name testBlockingQueueIterable032
     * @tc.desc Verify LinkedBlockingQueue<int>(capacity=10, iterable=10) constructs full queue, push throws when add fails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_SIZE: int = 10;
      const EXPECTED_REMAINING_CAPACITY: int = 0;
      const ADD_VALUE: int = 11;
      const ARRAY_VALUE: int = 1;
      const ARRAY_VALUE_2: int = 2;
      const ARRAY_VALUE_3: int = 3;
      const ARRAY_VALUE_4: int = 4;
      const ARRAY_VALUE_5: int = 5;
      const ARRAY_VALUE_6: int = 6;
      const ARRAY_VALUE_7: int = 7;
      const ARRAY_VALUE_8: int = 8;
      const ARRAY_VALUE_9: int = 9;
      const ARRAY_VALUE_10: int = 10;
      let arr: int[] = [ARRAY_VALUE, ARRAY_VALUE_2, ARRAY_VALUE_3, ARRAY_VALUE_4, ARRAY_VALUE_5, ARRAY_VALUE_6, ARRAY_VALUE_7, ARRAY_VALUE_8, ARRAY_VALUE_9, ARRAY_VALUE_10];
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.remainingCapacity()).assertEqual(EXPECTED_REMAINING_CAPACITY);
      expect(q.add(ADD_VALUE)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_3300
     * @tc.name testBlockingQueueIterable033
     * @tc.desc Verify ArrayBlockingQueue<int>(5, iterable=5) constructs full queue, add fourth fails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const EXPECTED_SIZE: int = 5;
      const ADD_VALUE: int = 60;
      const ARRAY_VALUE: int = 10;
      const ARRAY_VALUE_2: int = 20;
      const ARRAY_VALUE_3: int = 30;
      const ARRAY_VALUE_4: int = 40;
      const ARRAY_VALUE_5: int = 50;
      let arr: int[] = [ARRAY_VALUE, ARRAY_VALUE_2, ARRAY_VALUE_3, ARRAY_VALUE_4, ARRAY_VALUE_5];
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.add(ADD_VALUE)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_3400
     * @tc.name testBlockingQueueIterable034
     * @tc.desc Verify queue constructed from iterable with negative ints preserves all values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ARRAY_VALUE: int = -5;
      const ARRAY_VALUE_2: int = -10;
      const ARRAY_VALUE_3: int = -100;
      const ARRAY_VALUE_4: int = -2147483648;
      const ARRAY_VALUE_5: int = 0;
      const ARRAY_VALUE_6: int = 1;
      let arr: int[] = [ARRAY_VALUE, ARRAY_VALUE_2, ARRAY_VALUE_3, ARRAY_VALUE_4, ARRAY_VALUE_5, ARRAY_VALUE_6];
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      for (let i: int = 0; i < arr.length; i++) {
        expect(q.pop()).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_3500
     * @tc.name testBlockingQueueIterable035
     * @tc.desc Verify queue constructed from string iterable with empty/whitespace strings preserves all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ARRAY_TEXT: string = "";
      const ARRAY_TEXT_2: string = " ";
      const ARRAY_TEXT_3: string = "  ";
      const ARRAY_TEXT_4: string = "\t";
      const ARRAY_TEXT_5: string = "\n";
      const ARRAY_TEXT_6: string = "x";
      let arr: string[] = [ARRAY_TEXT, ARRAY_TEXT_2, ARRAY_TEXT_3, ARRAY_TEXT_4, ARRAY_TEXT_5, ARRAY_TEXT_6];
      let q: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>(arr);
      for (let i: int = 0; i < arr.length; i++) {
        expect(q.pop()).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_3600
     * @tc.name testBlockingQueueIterable036
     * @tc.desc Verify queue constructed from Unicode-heavy string array preserves all characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ARRAY_TEXT: string = "中文";
      const ARRAY_TEXT_2: string = "日本語";
      const ARRAY_TEXT_3: string = "한국어";
      const ARRAY_TEXT_4: string = "العربية";
      const ARRAY_TEXT_5: string = "русский";
      const ARRAY_TEXT_6: string = "Ελληνικά";
      const ARRAY_TEXT_7: string = "🔥💎🎉";
      let arr: string[] = [ARRAY_TEXT, ARRAY_TEXT_2, ARRAY_TEXT_3, ARRAY_TEXT_4, ARRAY_TEXT_5, ARRAY_TEXT_6, ARRAY_TEXT_7];
      let q: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>(arr);
      for (let i: int = 0; i < arr.length; i++) {
        expect(q.pop()).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_3700
     * @tc.name testBlockingQueueIterable037
     * @tc.desc Verify ArrayBlockingQueue<string>(20, Unicode-heavy iterable) preserves all characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 20;
      const ARRAY_TEXT: string = "α";
      const ARRAY_TEXT_2: string = "β";
      const ARRAY_TEXT_3: string = "γ";
      const ARRAY_TEXT_4: string = "δ";
      let arr: string[] = [ARRAY_TEXT, ARRAY_TEXT_2, ARRAY_TEXT_3, ARRAY_TEXT_4];
      let q: containers.BlockingQueue<string> = new containers.ArrayBlockingQueue<string>(CAPACITY, arr);
      for (let i: int = 0; i < arr.length; i++) {
        expect(q.pop()).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_3800
     * @tc.name testBlockingQueueIterable038
     * @tc.desc Verify LinkedBlockingQueue<int>(capacity=2, 5 elements) only first 2 enqueued, rest discarded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 2;
      const EXPECTED_SIZE: int = 2;
      const EXPECTED_VALUE: int = 10;
      const EXPECTED_VALUE_2: int = 20;
      const ARRAY_VALUE: int = 10;
      const ARRAY_VALUE_2: int = 20;
      const ARRAY_VALUE_3: int = 30;
      const ARRAY_VALUE_4: int = 40;
      const ARRAY_VALUE_5: int = 50;
      let arr: int[] = [ARRAY_VALUE, ARRAY_VALUE_2, ARRAY_VALUE_3, ARRAY_VALUE_4, ARRAY_VALUE_5];
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY, arr);
      expect(q.size).assertEqual(EXPECTED_SIZE);
      expect(q.pop()).assertEqual(EXPECTED_VALUE);
      expect(q.pop()).assertEqual(EXPECTED_VALUE_2);
      expect(q.poll()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_3900
     * @tc.name testBlockingQueueIterable039
     * @tc.desc Verify queue from iterable preserves head/tail correctly: getFirst=first iterable element, getEnd=last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const EXPECTED_VALUE: int = 7;
      const EXPECTED_VALUE_2: int = 35;
      const ARRAY_VALUE: int = 7;
      const ARRAY_VALUE_2: int = 14;
      const ARRAY_VALUE_3: int = 21;
      const ARRAY_VALUE_4: int = 28;
      const ARRAY_VALUE_5: int = 35;
      let arr: int[] = [ARRAY_VALUE, ARRAY_VALUE_2, ARRAY_VALUE_3, ARRAY_VALUE_4, ARRAY_VALUE_5];
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      expect(q.getFirst()).assertEqual(EXPECTED_VALUE);
      expect(q.getEnd()).assertEqual(EXPECTED_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_ITERABLE_4000
     * @tc.name testBlockingQueueIterable040
     * @tc.desc Verify ArrayBlockingQueue<int>(20, [10..30]) getFirst/getEnd matches array boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIterable040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 10;
      const CAPACITY: int = 50;
      const EXPECTED_VALUE: int = 10;
      const EXPECTED_VALUE_2: int = 30;
      let arr: int[] = [];
      for (let i: int = 0; i <= 20; i++) {
        arr.push(i + PUSH_VALUE);
      }
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
      expect(q.getFirst()).assertEqual(EXPECTED_VALUE);
      expect(q.getEnd()).assertEqual(EXPECTED_VALUE_2);
    });

  });
}
