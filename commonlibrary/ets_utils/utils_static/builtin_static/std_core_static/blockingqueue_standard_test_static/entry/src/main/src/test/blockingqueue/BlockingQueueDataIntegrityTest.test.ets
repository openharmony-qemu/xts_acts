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
} from '../../../../hypium/index';
import Utils from './../Util.test';

class IntegrityRecord {
  id: int = 0;
  name: string = "";
  active: boolean = false;

  constructor(id: int, name: string, active: boolean) {
    this.id = id;
    this.name = name;
    this.active = active;
  }
}

class IntegrityNode {
  value: int = 0;
  next: IntegrityNode | null = null;

  constructor(v: int) {
    this.value = v;
  }
}

class IntegrityCounter {
  count: int = 0;

  inc(): void {
    this.count++;
  }
}

class IntegrityWithArr {
  data: int[] = [];

  constructor(d: int[]) {
    this.data = d;
  }
}

class IntegrityWithMap {
  m: Map<string, int> = new Map<string, int>();
}

class IntegrityWithSet {
  s: Set<int> = new Set<int>();
}

export default function BlockingQueueDataIntegrityTest(): void {
  describe('BlockingQueueDataIntegrityTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_0100
     * @tc.name testBlockingQueueIntegrity001
     * @tc.desc Verify object reference identity preserved through push and pop (same instance returned)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CTOR_VALUE: int = 1;
      const CTOR_VALUE_1: string = "test";
      const CTOR_VALUE_2: boolean = true;
      let q: containers.BlockingQueue<IntegrityRecord> = new containers.LinkedBlockingQueue<IntegrityRecord>();
      let r = new IntegrityRecord(CTOR_VALUE, CTOR_VALUE_1, CTOR_VALUE_2);
      q.push(r);
      let retrieved = q.pop();
      expect(retrieved).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_0200
     * @tc.name testBlockingQueueIntegrity002
     * @tc.desc Verify all object fields preserved through push/pop (id, name, active)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CTOR_VALUE: int = 42;
      const CTOR_VALUE_1: string = "Alice";
      const CTOR_VALUE_2: boolean = true;
      const EXPECTED_VALUE: int = 42;
      const EXPECTED_VALUE_1: string = "Alice";
      let q: containers.BlockingQueue<IntegrityRecord> = new containers.LinkedBlockingQueue<IntegrityRecord>();
      let r = new IntegrityRecord(CTOR_VALUE, CTOR_VALUE_1, CTOR_VALUE_2);
      q.push(r);
      let retrieved = q.pop();
      expect(retrieved.id).assertEqual(EXPECTED_VALUE);
      expect(retrieved.name).assertEqual(EXPECTED_VALUE_1);
      expect(retrieved.active).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_0300
     * @tc.name testBlockingQueueIntegrity003
     * @tc.desc Verify ArrayBlockingQueue object reference identity preserved through push/pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const CTOR_VALUE: int = 99;
      const CTOR_VALUE_1: string = "Bob";
      const CTOR_VALUE_2: boolean = false;
      let q: containers.BlockingQueue<IntegrityRecord> = new containers.ArrayBlockingQueue<IntegrityRecord>(CAPACITY);
      let r = new IntegrityRecord(CTOR_VALUE, CTOR_VALUE_1, CTOR_VALUE_2);
      q.push(r);
      expect(q.pop()).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_0400
     * @tc.name testBlockingQueueIntegrity004
     * @tc.desc Verify mutating retrieved object reflects in queue (shared reference, not copy)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CTOR_VALUE: int = 1;
      const CTOR_VALUE_1: string = "before";
      const CTOR_VALUE_2: boolean = true;
      const EXPECTED_VALUE: string = "after";
      let q: containers.BlockingQueue<IntegrityRecord> = new containers.LinkedBlockingQueue<IntegrityRecord>();
      let r = new IntegrityRecord(CTOR_VALUE, CTOR_VALUE_1, CTOR_VALUE_2);
      q.push(r);
      let peek = q.getFirst()!;
      peek.name = "after";
      let snd = q.getFirst()!;
      expect(snd.name).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_0500
     * @tc.name testBlockingQueueIntegrity005
     * @tc.desc Verify external mutation of source object reflects in queue (no defensive copy)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CTOR_VALUE: int = 1;
      const CTOR_VALUE_1: string = "initial";
      const CTOR_VALUE_2: boolean = false;
      const EXPECTED_VALUE: string = "mutated";
      let q: containers.BlockingQueue<IntegrityRecord> = new containers.LinkedBlockingQueue<IntegrityRecord>();
      let r = new IntegrityRecord(CTOR_VALUE, CTOR_VALUE_1, CTOR_VALUE_2);
      q.push(r);
      r.name = "mutated";
      r.active = true;
      let retrieved = q.pop();
      expect(retrieved.name).assertEqual(EXPECTED_VALUE);
      expect(retrieved.active).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_0600
     * @tc.name testBlockingQueueIntegrity006
     * @tc.desc Verify same object pushed multiple times yields multiple pop returns to the same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CTOR_VALUE: int = 7;
      const CTOR_VALUE_1: string = "seven";
      const CTOR_VALUE_2: boolean = true;
      const EXPECTED_VALUE: int = 5;
      let q: containers.BlockingQueue<IntegrityRecord> = new containers.LinkedBlockingQueue<IntegrityRecord>();
      let r = new IntegrityRecord(CTOR_VALUE, CTOR_VALUE_1, CTOR_VALUE_2);
      for (let i: int = 0; i < 5; i++) {
        q.push(r);
      }
      expect(q.size).assertEqual(EXPECTED_VALUE);
      for (let i: int = 0; i < 5; i++) {
        expect(q.pop()).assertEqual(r);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_0700
     * @tc.name testBlockingQueueIntegrity007
     * @tc.desc Verify linked-list-of-objects: cyclic reference between IntegrityNode preserved via queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CTOR_VALUE: int = 1;
      const CTOR_VALUE_1: int = 2;
      const CTOR_VALUE_2: int = 3;
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_VALUE_1: int = 2;
      const EXPECTED_VALUE_2: int = 3;
      let q: containers.BlockingQueue<IntegrityNode> = new containers.LinkedBlockingQueue<IntegrityNode>();
      let n1 = new IntegrityNode(CTOR_VALUE);
      let n2 = new IntegrityNode(CTOR_VALUE_1);
      let n3 = new IntegrityNode(CTOR_VALUE_2);
      n1.next = n2;
      n2.next = n3;
      n3.next = n1;
      q.push(n1);
      let r = q.pop();
      expect(r.value).assertEqual(EXPECTED_VALUE);
      expect(r.next!.value).assertEqual(EXPECTED_VALUE_1);
      expect(r.next!.next!.value).assertEqual(EXPECTED_VALUE_2);
      expect(r.next!.next!.next!.value).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_0800
     * @tc.name testBlockingQueueIntegrity008
     * @tc.desc Verify counter object: incremented after push, retrieved object reflects increment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const EXPECTED_VALUE: int = 3;
      let q: containers.BlockingQueue<IntegrityCounter> = new containers.LinkedBlockingQueue<IntegrityCounter>();
      let c = new IntegrityCounter();
      c.inc();
      c.inc();
      q.push(c);
      c.inc();
      let r = q.pop();
      expect(r.count).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_0900
     * @tc.name testBlockingQueueIntegrity009
     * @tc.desc Verify FIFO ordering preserved with 100 distinct objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CTOR_VALUE: string = "rec";
      const CTOR_VALUE_1: int = 0;
      const CTOR_VALUE_2: int = 2;
      const EXPECTED_VALUE: string = "rec";
      let q: containers.BlockingQueue<IntegrityRecord> = new containers.LinkedBlockingQueue<IntegrityRecord>();
      let arr: IntegrityRecord[] = [];
      for (let i: int = 0; i < 100; i++) {
        let r = new IntegrityRecord(i, CTOR_VALUE + i, i % CTOR_VALUE_2 == CTOR_VALUE_1);
        arr.push(r);
        q.push(r);
      }
      for (let i: int = 0; i < 100; i++) {
        let r = q.pop();
        expect(r).assertEqual(arr[i]);
        expect(r.id).assertEqual(i);
        expect(r.name).assertEqual(EXPECTED_VALUE + i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_1000
     * @tc.name testBlockingQueueIntegrity010
     * @tc.desc Verify no element duplication: 50 objects pushed, exactly 50 popped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: boolean = true;
      const PUSH_VALUE_1: string = "n";
      const EXPECTED_VALUE: int = 50;
      let q: containers.BlockingQueue<IntegrityRecord> = new containers.LinkedBlockingQueue<IntegrityRecord>();
      let seen = new Set<int>();
      for (let i: int = 0; i < 50; i++) {
        q.push(new IntegrityRecord(i, PUSH_VALUE_1, PUSH_VALUE));
      }
      let popped: int = 0;
      while (!q.isEmpty()) {
        let r = q.pop();
        seen.add(r.id);
        popped++;
      }
      expect(popped).assertEqual(EXPECTED_VALUE);
      expect(seen.size).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_1100
     * @tc.name testBlockingQueueIntegrity011
     * @tc.desc Verify no element loss: 100 ints pushed via push, exactly 100 popped via pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const EXPECTED_VALUE: int = 100;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let pushed = new Set<int>();
      for (let i: int = 1; i <= 100; i++) {
        q.push(i);
        pushed.add(i);
      }
      let collected = new Set<int>();
      while (!q.isEmpty()) {
        collected.add(q.pop());
      }
      expect(collected.size).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_1200
     * @tc.name testBlockingQueueIntegrity012
     * @tc.desc Verify integrity in capacity=Int.MAX_VALUE: 5000 ints pushed, all retrieved in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIntegrity012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = 0; i < 5000; i++) {
        q.push(i);
      }
      for (let i: int = 0; i < 5000; i++) {
        expect(q.pop()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_1300
     * @tc.name testBlockingQueueIntegrity013
     * @tc.desc Verify integrity in ArrayBlockingQueue capacity=1000: 1000 ints, all retrieved in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIntegrity013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 1000;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      for (let i: int = 0; i < 1000; i++) {
        q.push(i);
      }
      for (let i: int = 0; i < 1000; i++) {
        expect(q.pop()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_1400
     * @tc.name testBlockingQueueIntegrity014
     * @tc.desc Verify Unicode string integrity: 50 Unicode strings pushed and popped exactly preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let strs: string[] = [
        "中文", "日本語", "한국어", "العربية", "русский",
        "Ελληνικά", "ภาษาไทย", "हिन्दी", "ខ្មែរ", "ဗမာ",
        "🔥", "💎", "🎉", "😀", "🌍",
        "alpha", "beta", "gamma", "delta", "epsilon",
        "test1", "test2", "test3", "test4", "test5"
      ];
      let q: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      for (let i: int = 0; i < strs.length; i++) {
        q.push(strs[i]);
      }
      for (let i: int = 0; i < strs.length; i++) {
        expect(q.pop()).assertEqual(strs[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_1500
     * @tc.name testBlockingQueueIntegrity015
     * @tc.desc Verify no cross-contamination: two queues with overlapping data don't interfere
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 100;
      const EXPECTED_VALUE: int = 10;
      const EXPECTED_VALUE_1: int = 0;
      const EXPECTED_VALUE_2: int = 100;
      let q1: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let q2: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = 0; i < 10; i++) {
        q1.push(i);
      }
      for (let i: int = 0; i < 10; i++) {
        q2.push(i + PUSH_VALUE);
      }
      expect(q1.size).assertEqual(EXPECTED_VALUE);
      expect(q2.size).assertEqual(EXPECTED_VALUE);
      expect(q1.getFirst()).assertEqual(EXPECTED_VALUE_1);
      expect(q2.getFirst()).assertEqual(EXPECTED_VALUE_2);
      for (let i: int = 0; i < 10; i++) {
        expect(q1.pop()).assertEqual(i);
      }
      for (let i: int = 0; i < 10; i++) {
        expect(q2.pop()).assertEqual(i + EXPECTED_VALUE_2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_1600
     * @tc.name testBlockingQueueIntegrity016
     * @tc.desc Verify int[] field of object preserved through queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CTOR_VALUE: int = 25;
      const CTOR_VALUE_1: int = 20;
      const CTOR_VALUE_2: int = 15;
      const CTOR_VALUE_3: int = 10;
      const CTOR_VALUE_4: int = 5;
      const EXPECTED_VALUE: int = 5;
      const EXPECTED_VALUE_1: int = 1;
      let q: containers.BlockingQueue<IntegrityWithArr> = new containers.LinkedBlockingQueue<IntegrityWithArr>();
      let obj = new IntegrityWithArr([CTOR_VALUE_4, CTOR_VALUE_3, CTOR_VALUE_2, CTOR_VALUE_1, CTOR_VALUE]);
      q.push(obj);
      let r = q.pop();
      expect(r.data.length).assertEqual(EXPECTED_VALUE);
      for (let i: int = 0; i < 5; i++) {
        let v: int = r.data[i];
        expect(v).assertEqual((i + EXPECTED_VALUE_1) * EXPECTED_VALUE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_1700
     * @tc.name testBlockingQueueIntegrity017
     * @tc.desc Verify sum-of-values invariant: pushing 100 ints sums to known value, popping all sums to same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const EXPECTED_VALUE: int = 5050;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let pushSum: int = 0;
      for (let i: int = 1; i <= 100; i++) {
        q.push(i);
        pushSum += i;
      }
      let popSum: int = 0;
      while (!q.isEmpty()) {
        popSum += q.pop();
      }
      expect(popSum).assertEqual(pushSum);
      expect(popSum).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_1800
     * @tc.name testBlockingQueueIntegrity018
     * @tc.desc Verify ArrayBlockingQueue sum-of-values: same invariant for array implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 200;
      const EXPECTED_VALUE: int = 20100;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      let pushSum: int = 0;
      for (let i: int = 1; i <= 200; i++) {
        q.push(i);
        pushSum += i;
      }
      let popSum: int = 0;
      while (!q.isEmpty()) {
        popSum += q.pop();
      }
      expect(popSum).assertEqual(pushSum);
      expect(popSum).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_1900
     * @tc.name testBlockingQueueIntegrity019
     * @tc.desc Verify iterable construction preserves all source elements (round-trip equality)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: int[] = [13, 21, 34, 55, 89, 144, 233];
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      for (let i: int = 0; i < arr.length; i++) {
        expect(q.pop()).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_2000
     * @tc.name testBlockingQueueIntegrity020
     * @tc.desc Verify ArrayBlockingQueue iterable construction preserves all source elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 20;
      let arr: int[] = [11, 13, 17, 19, 23, 29, 31, 37];
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
      for (let i: int = 0; i < arr.length; i++) {
        expect(q.pop()).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_2100
     * @tc.name testBlockingQueueIntegrity021
     * @tc.desc Verify duplicate values FIFO order: pushing same value twice produces two pops returning same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 42;
      const EXPECTED_VALUE: int = 42;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = 0; i < 10; i++) {
        q.push(PUSH_VALUE);
      }
      for (let i: int = 0; i < 10; i++) {
        expect(q.pop()).assertEqual(EXPECTED_VALUE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_2200
     * @tc.name testBlockingQueueIntegrity022
     * @tc.desc Verify duplicate string values FIFO order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let q: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      let dup = "duplicate";
      for (let i: int = 0; i < 5; i++) {
        q.push(dup);
      }
      for (let i: int = 0; i < 5; i++) {
        expect(q.pop()).assertEqual(dup);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_2300
     * @tc.name testBlockingQueueIntegrity023
     * @tc.desc Verify alternating push-pop-push-pop preserves integrity over 1000 cycles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIntegrity023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 1;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = 0; i < 1000; i++) {
        q.push(i);
        expect(q.pop()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_2400
     * @tc.name testBlockingQueueIntegrity024
     * @tc.desc Verify ArrayBlockingQueue alternating push-pop-push-pop integrity over 1000 cycles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueIntegrity024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CAPACITY: int = 1;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      for (let i: int = 0; i < 1000; i++) {
        q.push(i);
        expect(q.pop()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_2500
     * @tc.name testBlockingQueueIntegrity025
     * @tc.desc Verify boolean-only queue: 100 alternating boolean pushes, FIFO order preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 0;
      const PUSH_VALUE_1: int = 2;
      const EXPECTED_VALUE: int = 0;
      const EXPECTED_VALUE_1: int = 2;
      let q: containers.BlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>();
      for (let i: int = 0; i < 100; i++) {
        q.push(i % PUSH_VALUE_1 == PUSH_VALUE);
      }
      for (let i: int = 0; i < 100; i++) {
        expect(q.pop()).assertEqual(i % EXPECTED_VALUE_1 == EXPECTED_VALUE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_2600
     * @tc.name testBlockingQueueIntegrity026
     * @tc.desc Verify after pop and re-push integrity: drain half, refill, drain remaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 20;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = 0; i < 20; i++) {
        q.push(i);
      }
      for (let i: int = 0; i < 10; i++) {
        expect(q.pop()).assertEqual(i);
      }
      for (let i: int = 100; i < 110; i++) {
        q.push(i);
      }
      for (let i: int = 10; i < 20; i++) {
        expect(q.pop()).assertEqual(i);
      }
      for (let i: int = 100; i < 110; i++) {
        expect(q.pop()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_2700
     * @tc.name testBlockingQueueIntegrity027
     * @tc.desc Verify ArrayBlockingQueue ring-buffer wraparound integrity: 30 cycles preserve all data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 7;
      const EXPECTED_VALUE: int = 150;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      let counter: int = 0;
      for (let cy: int = 0; cy < 30; cy++) {
        for (let i: int = 0; i < 5; i++) {
          q.push(counter);
          counter++;
        }
        for (let i: int = 0; i < 5; i++) {
          q.pop();
        }
      }
      expect(q.isEmpty()).assertTrue();
      expect(counter).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_2800
     * @tc.name testBlockingQueueIntegrity028
     * @tc.desc Verify LinkedBlockingQueue integrity with random subset of values 0..99 visited
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      let nums: int[] = [73, 12, 99, 0, 1, 50, 25, 88, 33, 67];
      let nset = new Set<int>();
      for (let i: int = 0; i < nums.length; i++) {
        q.push(nums[i]);
        nset.add(nums[i]);
      }
      let collected = new Set<int>();
      while (!q.isEmpty()) {
        collected.add(q.pop());
      }
      expect(collected.size).assertEqual(nums.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_2900
     * @tc.name testBlockingQueueIntegrity029
     * @tc.desc Verify pre-filled iterable queue: original arr modification does NOT affect queue contents (already enqueued)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const EXPECTED_VALUE: int = 10;
      const EXPECTED_VALUE_1: int = 20;
      const EXPECTED_VALUE_2: int = 30;
      const INDEX: int = 0;
      const INDEX_1: int = 1;
      const INDEX_2: int = 2;
      let arr: int[] = [10, 20, 30];
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      arr[INDEX] = 999;
      arr[INDEX_1] = 888;
      arr[INDEX_2] = 777;
      expect(q.pop()).assertEqual(EXPECTED_VALUE);
      expect(q.pop()).assertEqual(EXPECTED_VALUE_1);
      expect(q.pop()).assertEqual(EXPECTED_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_3000
     * @tc.name testBlockingQueueIntegrity030
     * @tc.desc Verify ArrayBlockingQueue: original arr modification does NOT affect queue contents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_VALUE_1: int = 2;
      const EXPECTED_VALUE_2: int = 3;
      const INDEX: int = 0;
      const INDEX_1: int = 1;
      const INDEX_2: int = 2;
      let arr: int[] = [1, 2, 3];
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY, arr);
      arr[INDEX] = -1;
      arr[INDEX_1] = -2;
      arr[INDEX_2] = -3;
      expect(q.pop()).assertEqual(EXPECTED_VALUE);
      expect(q.pop()).assertEqual(EXPECTED_VALUE_1);
      expect(q.pop()).assertEqual(EXPECTED_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_3100
     * @tc.name testBlockingQueueIntegrity031
     * @tc.desc Verify pushing same array (object) reference twice: same array object appears twice in queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let q: containers.BlockingQueue<int[]> = new containers.LinkedBlockingQueue<int[]>();
      let shared: int[] = [1, 2, 3];
      q.push(shared);
      q.push(shared);
      let r1 = q.pop();
      let r2 = q.pop();
      expect(r1).assertEqual(shared);
      expect(r2).assertEqual(shared);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_3200
     * @tc.name testBlockingQueueIntegrity032
     * @tc.desc Verify mutating element via getFirst affects future getFirst (no defensive copy on read)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: boolean = false;
      const PUSH_VALUE_1: string = "x";
      const PUSH_VALUE_2: int = 1;
      const EXPECTED_VALUE: int = 999;
      let q: containers.BlockingQueue<IntegrityRecord> = new containers.LinkedBlockingQueue<IntegrityRecord>();
      q.push(new IntegrityRecord(PUSH_VALUE_2, PUSH_VALUE_1, PUSH_VALUE));
      let head = q.getFirst()!;
      head.id = 999;
      let head2 = q.getFirst()!;
      expect(head2.id).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_3300
     * @tc.name testBlockingQueueIntegrity033
     * @tc.desc Verify Map element field preservation through queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const KEY: string = "a";
      const SET_VALUE: int = 1;
      const KEY_1: string = "b";
      const SET_VALUE_1: int = 2;
      const TEXT_VALUE: string = "a";
      const EXPECTED_VALUE: int = 1;
      const TEXT_VALUE_1: string = "b";
      const EXPECTED_VALUE_1: int = 2;
      let q: containers.BlockingQueue<IntegrityWithMap> = new containers.LinkedBlockingQueue<IntegrityWithMap>();
      let obj = new IntegrityWithMap();
      obj.m.set(KEY, SET_VALUE);
      obj.m.set(KEY_1, SET_VALUE_1);
      q.push(obj);
      let r = q.pop();
      expect(r.m.get(TEXT_VALUE)).assertEqual(EXPECTED_VALUE);
      expect(r.m.get(TEXT_VALUE_1)).assertEqual(EXPECTED_VALUE_1);
      expect(r.m.size).assertEqual(EXPECTED_VALUE_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_3400
     * @tc.name testBlockingQueueIntegrity034
     * @tc.desc Verify Set element field preservation through queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ADD_VALUE: int = 10;
      const ADD_VALUE_1: int = 20;
      const ADD_VALUE_2: int = 30;
      const EXPECTED_VALUE: int = 3;
      const VALUE: int = 10;
      const VALUE_1: int = 20;
      const VALUE_2: int = 30;
      let q: containers.BlockingQueue<IntegrityWithSet> = new containers.LinkedBlockingQueue<IntegrityWithSet>();
      let obj = new IntegrityWithSet();
      obj.s.add(ADD_VALUE);
      obj.s.add(ADD_VALUE_1);
      obj.s.add(ADD_VALUE_2);
      q.push(obj);
      let r = q.pop();
      expect(r.s.size).assertEqual(EXPECTED_VALUE);
      expect(r.s.has(VALUE)).assertTrue();
      expect(r.s.has(VALUE_1)).assertTrue();
      expect(r.s.has(VALUE_2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_3500
     * @tc.name testBlockingQueueIntegrity035
     * @tc.desc Verify deeply nested object integrity through multiple push/pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CTOR_VALUE: int = 0;
      const EXPECTED_VALUE: int = 19;
      let chain = new IntegrityNode(CTOR_VALUE);
      let cur = chain;
      for (let i: int = 1; i < 20; i++) {
        cur.next = new IntegrityNode(i);
        cur = cur.next!;
      }
      let q: containers.BlockingQueue<IntegrityNode> = new containers.LinkedBlockingQueue<IntegrityNode>();
      q.push(chain);
      let r = q.pop();
      let walker = r;
      let depth: int = 0;
      while (walker.next !== null) {
        expect(walker.value).assertEqual(depth);
        walker = walker.next!;
        depth++;
      }
      expect(walker.value).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_3600
     * @tc.name testBlockingQueueIntegrity036
     * @tc.desc Verify queue contents reset across instances: previous queue's data does not leak to a new instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const PUSH_VALUE: int = 1;
      const PUSH_VALUE_1: int = 2;
      const PUSH_VALUE_2: int = 3;
      const EXPECTED_VALUE: int = 0;
      let q1: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      q1.push(PUSH_VALUE);
      q1.push(PUSH_VALUE_1);
      q1.push(PUSH_VALUE_2);
      let q2: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      expect(q2.size).assertEqual(EXPECTED_VALUE);
      expect(q2.isEmpty()).assertTrue();
      expect(q2.getFirst()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_3700
     * @tc.name testBlockingQueueIntegrity037
     * @tc.desc Verify integrity of mixed-method operations: push-add-poll-pop-push sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      const PUSH_VALUE: int = 1;
      const VALUE: int = 2;
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_VALUE_1: int = 2;
      const PUSH_VALUE_1: int = 3;
      const VALUE_1: int = 4;
      const EXPECTED_VALUE_2: int = 3;
      const EXPECTED_VALUE_3: int = 4;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      q.push(PUSH_VALUE);
      expect(q.add(VALUE)).assertTrue();
      expect(q.poll()).assertEqual(EXPECTED_VALUE);
      expect(q.pop()).assertEqual(EXPECTED_VALUE_1);
      q.push(PUSH_VALUE_1);
      expect(q.add(VALUE_1)).assertTrue();
      expect(q.size).assertEqual(EXPECTED_VALUE_1);
      expect(q.getFirst()).assertEqual(EXPECTED_VALUE_2);
      expect(q.getEnd()).assertEqual(EXPECTED_VALUE_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_3800
     * @tc.name testBlockingQueueIntegrity038
     * @tc.desc Verify integrity over 100 enqueue and 100 dequeue: order, count, and values all preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 150;
      const PUSH_VALUE: int = 5;
      const PUSH_VALUE_1: int = 13;
      const EXPECTED_VALUE: int = 100;
      let q: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      let pushed: int[] = [];
      for (let i: int = 0; i < 100; i++) {
        pushed.push(i * PUSH_VALUE_1 + PUSH_VALUE);
        q.push(pushed[i]);
      }
      expect(q.size).assertEqual(EXPECTED_VALUE);
      for (let i: int = 0; i < 100; i++) {
        expect(q.pop()).assertEqual(pushed[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_3900
     * @tc.name testBlockingQueueIntegrity039
     * @tc.desc Verify integrity with mixed push and add: 50 push + 50 add interleaved, all preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 200;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = 0; i < 100; i++) {
        if (i % 2 == 0) {
          q.push(i);
        } else {
          expect(q.add(i)).assertTrue();
        }
      }
      for (let i: int = 0; i < 100; i++) {
        expect(q.pop()).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_INTEGRITY_4000
     * @tc.name testBlockingQueueIntegrity040
     * @tc.desc Verify integrity with mixed pop and poll: 100 elements pushed, drained via interleaved pop/poll
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueIntegrity040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 200;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(CAPACITY);
      for (let i: int = 0; i < 100; i++) {
        q.push(i);
      }
      for (let i: int = 0; i < 100; i++) {
        if (i % 2 == 0) {
          expect(q.pop()).assertEqual(i);
        } else {
          expect(q.poll()).assertEqual(i);
        }
      }
      expect(q.isEmpty()).assertTrue();
    });

  });
}
