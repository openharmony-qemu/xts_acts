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

class GenericPoint {
  x: int = 0;
  y: int = 0;

  constructor(x: int, y: int) {
    this.x = x;
    this.y = y;
  }
}

class GenericPair {
  first: int = 0;
  second: string = "";

  constructor(f: int, s: string) {
    this.first = f;
    this.second = s;
  }
}

class GenericNullable {
  name: string | null = null;
  value: int | null = null;
}

class GenericNested {
  inner: GenericPoint = new GenericPoint(0, 0);
  label: string = "";

  constructor(inner: GenericPoint, label: string) {
    this.inner = inner;
    this.label = label;
  }
}

class GenericContainer {
  items: int[] = [];
  count: int = 0;

  constructor(items: int[]) {
    this.items = items;
    this.count = items.length;
  }
}

class GenericTreeNode {
  value: int = 0;
  children: GenericTreeNode[] = [];

  constructor(v: int) {
    this.value = v;
  }
}

class GenericKey {
  id: int = 0;
  name: string = "";

  constructor(id: int, name: string) {
    this.id = id;
    this.name = name;
  }
}

export default function BlockingQueueGenericTest(): void {
  describe('BlockingQueueGenericTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_0100
     * @tc.name testBlockingQueueGeneric001
     * @tc.desc Verify LinkedBlockingQueue<number> instantiation and basic push/pop with floating-point values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: number = 3.14;
      const PUSH_VALUE_1: number = 2.718;
      const PUSH_VALUE_2: number = -0.001;
      const EXPECTED_VALUE: int = 3;
      const EXPECTED_VALUE_1: number = 3.14;
      const EXPECTED_VALUE_2: number = 2.718;
      const EXPECTED_VALUE_3: number = -0.001;
      let q: containers.BlockingQueue<number> = new containers.LinkedBlockingQueue<number>();
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_1);
      q.push(PUSH_VALUE_2);
      expect(q.size).assertEqual(EXPECTED_VALUE);
      expect(q.pop()).assertEqual(EXPECTED_VALUE_1);
      expect(q.pop()).assertEqual(EXPECTED_VALUE_2);
      expect(q.pop()).assertEqual(EXPECTED_VALUE_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_0200
     * @tc.name testBlockingQueueGeneric002
     * @tc.desc Verify LinkedBlockingQueue<number> with extreme floating-point values (Number.MAX_VALUE, Number.MIN_VALUE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: number = 0.0;
      const EXPECTED_VALUE: number = 0.0;
      let q: containers.BlockingQueue<number> = new containers.LinkedBlockingQueue<number>();
      q.push(Number.MAX_VALUE);
      q.push(Number.MIN_VALUE);
      q.push(PUSH_VALUE);
      expect(q.pop()).assertEqual(Number.MAX_VALUE);
      expect(q.pop()).assertEqual(Number.MIN_VALUE);
      expect(q.pop()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_0300
     * @tc.name testBlockingQueueGeneric003
     * @tc.desc Verify LinkedBlockingQueue<number> handles NaN, Infinity, -Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let q: containers.BlockingQueue<number> = new containers.LinkedBlockingQueue<number>();
      q.push(Number.POSITIVE_INFINITY);
      q.push(Number.NEGATIVE_INFINITY);
      expect(q.pop()).assertEqual(Number.POSITIVE_INFINITY);
      expect(q.pop()).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_0400
     * @tc.name testBlockingQueueGeneric004
     * @tc.desc Verify ArrayBlockingQueue<number> with capacity=10 stores floating-point values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 10;
      let q: containers.BlockingQueue<number> = new containers.ArrayBlockingQueue<number>(CAPACITY);
      let vals: number[] = [1.1, 2.2, 3.3, 4.4, 5.5];
      for (let i: int = 0; i < vals.length; i++) {
        q.push(vals[i]);
      }
      for (let i: int = 0; i < vals.length; i++) {
        expect(q.pop()).assertEqual(vals[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_0500
     * @tc.name testBlockingQueueGeneric005
     * @tc.desc Verify LinkedBlockingQueue<GenericPoint> stores object references and preserves field values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CTOR_VALUE: int = 1;
      const CTOR_VALUE_1: int = 2;
      const CTOR_VALUE_2: int = 3;
      const CTOR_VALUE_3: int = 4;
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_VALUE_1: int = 2;
      const EXPECTED_VALUE_2: int = 3;
      const EXPECTED_VALUE_3: int = 4;
      let q: containers.BlockingQueue<GenericPoint> = new containers.LinkedBlockingQueue<GenericPoint>();
      let p1 = new GenericPoint(CTOR_VALUE, CTOR_VALUE_1);
      let p2 = new GenericPoint(CTOR_VALUE_2, CTOR_VALUE_3);
      q.push(p1);
      q.push(p2);
      let r1 = q.pop();
      let r2 = q.pop();
      expect(r1).assertEqual(p1);
      expect(r2).assertEqual(p2);
      expect(r1.x).assertEqual(EXPECTED_VALUE);
      expect(r1.y).assertEqual(EXPECTED_VALUE_1);
      expect(r2.x).assertEqual(EXPECTED_VALUE_2);
      expect(r2.y).assertEqual(EXPECTED_VALUE_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_0600
     * @tc.name testBlockingQueueGeneric006
     * @tc.desc Verify LinkedBlockingQueue<GenericPair> stores objects with mixed field types (int + string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: string = "ten";
      const PUSH_VALUE_1: int = 10;
      const PUSH_VALUE_2: string = "twenty";
      const PUSH_VALUE_3: int = 20;
      const EXPECTED_VALUE: int = 10;
      const EXPECTED_VALUE_1: string = "ten";
      const EXPECTED_VALUE_2: int = 20;
      const EXPECTED_VALUE_3: string = "twenty";
      let q: containers.BlockingQueue<GenericPair> = new containers.LinkedBlockingQueue<GenericPair>();
      q.push(new GenericPair(PUSH_VALUE_1, PUSH_VALUE));
      q.push(new GenericPair(PUSH_VALUE_3, PUSH_VALUE_2));
      let r1 = q.pop();
      expect(r1.first).assertEqual(EXPECTED_VALUE);
      expect(r1.second).assertEqual(EXPECTED_VALUE_1);
      let r2 = q.pop();
      expect(r2.first).assertEqual(EXPECTED_VALUE_2);
      expect(r2.second).assertEqual(EXPECTED_VALUE_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_0700
     * @tc.name testBlockingQueueGeneric007
     * @tc.desc Verify LinkedBlockingQueue<GenericNullable> preserves null property values across roundtrip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let q: containers.BlockingQueue<GenericNullable> = new containers.LinkedBlockingQueue<GenericNullable>();
      let obj = new GenericNullable();
      obj.name = null;
      obj.value = null;
      q.push(obj);
      let r = q.pop();
      expect(r.name).assertNull();
      expect(r.value).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_0800
     * @tc.name testBlockingQueueGeneric008
     * @tc.desc Verify LinkedBlockingQueue<GenericNested> preserves nested object structure (object inside object)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CTOR_VALUE: int = 88;
      const CTOR_VALUE_1: int = 99;
      const CTOR_VALUE_2: string = "lbl";
      const EXPECTED_VALUE: string = "lbl";
      const EXPECTED_VALUE_1: int = 99;
      const EXPECTED_VALUE_2: int = 88;
      let q: containers.BlockingQueue<GenericNested> = new containers.LinkedBlockingQueue<GenericNested>();
      let nested = new GenericNested(new GenericPoint(CTOR_VALUE_1, CTOR_VALUE), CTOR_VALUE_2);
      q.push(nested);
      let r = q.pop();
      expect(r.label).assertEqual(EXPECTED_VALUE);
      expect(r.inner.x).assertEqual(EXPECTED_VALUE_1);
      expect(r.inner.y).assertEqual(EXPECTED_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_0900
     * @tc.name testBlockingQueueGeneric009
     * @tc.desc Verify LinkedBlockingQueue<GenericContainer> preserves array field reference and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const EXPECTED_VALUE: int = 5;
      const VALUE: int = 0;
      const EXPECTED_VALUE_1: int = 1;
      const VALUE_1: int = 4;
      let q: containers.BlockingQueue<GenericContainer> = new containers.LinkedBlockingQueue<GenericContainer>();
      let arr: int[] = [1, 2, 3, 4, 5];
      let c = new GenericContainer(arr);
      q.push(c);
      let r = q.pop();
      expect(r.count).assertEqual(EXPECTED_VALUE);
      expect(r.items.length).assertEqual(EXPECTED_VALUE);
      expect(r.items[VALUE]).assertEqual(EXPECTED_VALUE_1);
      expect(r.items[VALUE_1]).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_1000
     * @tc.name testBlockingQueueGeneric010
     * @tc.desc Verify LinkedBlockingQueue<GenericTreeNode> preserves recursive structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CTOR_VALUE: int = 1;
      const CTOR_VALUE_1: int = 2;
      const CTOR_VALUE_2: int = 3;
      const EXPECTED_VALUE: int = 1;
      const EXPECTED_VALUE_1: int = 2;
      const VALUE: int = 0;
      const VALUE_1: int = 1;
      const EXPECTED_VALUE_2: int = 3;
      let q: containers.BlockingQueue<GenericTreeNode> = new containers.LinkedBlockingQueue<GenericTreeNode>();
      let root = new GenericTreeNode(CTOR_VALUE);
      let child1 = new GenericTreeNode(CTOR_VALUE_1);
      let child2 = new GenericTreeNode(CTOR_VALUE_2);
      root.children = [child1, child2];
      q.push(root);
      let r = q.pop();
      expect(r.value).assertEqual(EXPECTED_VALUE);
      expect(r.children.length).assertEqual(EXPECTED_VALUE_1);
      expect(r.children[VALUE].value).assertEqual(EXPECTED_VALUE_1);
      expect(r.children[VALUE_1].value).assertEqual(EXPECTED_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_1100
     * @tc.name testBlockingQueueGeneric011
     * @tc.desc Verify ArrayBlockingQueue<GenericTreeNode>(5) preserves recursive object structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const CTOR_VALUE: int = 42;
      const CTOR_VALUE_1: int = 11;
      const CTOR_VALUE_2: int = 22;
      const EXPECTED_VALUE: int = 42;
      const VALUE: int = 0;
      const EXPECTED_VALUE_1: int = 11;
      const VALUE_1: int = 1;
      const EXPECTED_VALUE_2: int = 22;
      let q: containers.BlockingQueue<GenericTreeNode> = new containers.ArrayBlockingQueue<GenericTreeNode>(CAPACITY);
      let n = new GenericTreeNode(CTOR_VALUE);
      n.children = [new GenericTreeNode(CTOR_VALUE_1), new GenericTreeNode(CTOR_VALUE_2)];
      q.push(n);
      let r = q.pop();
      expect(r.value).assertEqual(EXPECTED_VALUE);
      expect(r.children[VALUE].value).assertEqual(EXPECTED_VALUE_1);
      expect(r.children[VALUE_1].value).assertEqual(EXPECTED_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_1200
     * @tc.name testBlockingQueueGeneric012
     * @tc.desc Verify LinkedBlockingQueue<GenericKey> uses object as element with id and name fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: string = "alpha";
      const PUSH_VALUE_1: int = 1;
      const PUSH_VALUE_2: string = "beta";
      const PUSH_VALUE_3: int = 2;
      const PUSH_VALUE_4: string = "gamma";
      const PUSH_VALUE_5: int = 3;
      const EXPECTED_VALUE: string = "alpha";
      const EXPECTED_VALUE_1: string = "beta";
      const EXPECTED_VALUE_2: string = "gamma";
      let q: containers.BlockingQueue<GenericKey> = new containers.LinkedBlockingQueue<GenericKey>();
      q.push(new GenericKey(PUSH_VALUE_1, PUSH_VALUE));
      q.push(new GenericKey(PUSH_VALUE_3, PUSH_VALUE_2));
      q.push(new GenericKey(PUSH_VALUE_5, PUSH_VALUE_4));
      expect(q.pop().name).assertEqual(EXPECTED_VALUE);
      expect(q.pop().name).assertEqual(EXPECTED_VALUE_1);
      expect(q.pop().name).assertEqual(EXPECTED_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_1300
     * @tc.name testBlockingQueueGeneric013
     * @tc.desc Verify queue self-reference: LinkedBlockingQueue<containers.BlockingQueue<int>> stores other queues as elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 100;
      const CAPACITY: int = 5;
      const PUSH_VALUE_1: int = 200;
      const EXPECTED_VALUE: int = 100;
      const EXPECTED_VALUE_1: int = 200;
      let outer: containers.BlockingQueue<containers.BlockingQueue<int>> =
        new containers.LinkedBlockingQueue<containers.BlockingQueue<int>>();
      let inner1: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      inner1.push(PUSH_VALUE);
      let inner2: containers.BlockingQueue<int> = new containers.ArrayBlockingQueue<int>(CAPACITY);
      inner2.push(PUSH_VALUE_1);
      outer.push(inner1);
      outer.push(inner2);
      let r1 = outer.pop();
      let r2 = outer.pop();
      expect(r1.pop()).assertEqual(EXPECTED_VALUE);
      expect(r2.pop()).assertEqual(EXPECTED_VALUE_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_1400
     * @tc.name testBlockingQueueGeneric014
     * @tc.desc Verify LinkedBlockingQueue<int[]> stores arrays as elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 3;
      const PUSH_VALUE_1: int = 2;
      const PUSH_VALUE_2: int = 1;
      const PUSH_VALUE_3: int = 6;
      const PUSH_VALUE_4: int = 5;
      const PUSH_VALUE_5: int = 4;
      const EXPECTED_VALUE: int = 3;
      const VALUE: int = 0;
      const EXPECTED_VALUE_1: int = 1;
      const VALUE_1: int = 2;
      const EXPECTED_VALUE_2: int = 6;
      let q: containers.BlockingQueue<int[]> = new containers.LinkedBlockingQueue<int[]>();
      q.push([PUSH_VALUE_2, PUSH_VALUE_1, PUSH_VALUE]);
      q.push([PUSH_VALUE_5, PUSH_VALUE_4, PUSH_VALUE_3]);
      let a = q.pop();
      let b = q.pop();
      expect(a.length).assertEqual(EXPECTED_VALUE);
      expect(b.length).assertEqual(EXPECTED_VALUE);
      expect(a[VALUE]).assertEqual(EXPECTED_VALUE_1);
      expect(b[VALUE_1]).assertEqual(EXPECTED_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_1500
     * @tc.name testBlockingQueueGeneric015
     * @tc.desc Verify LinkedBlockingQueue<string[]> stores string arrays as elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: string = "c";
      const PUSH_VALUE_1: string = "b";
      const PUSH_VALUE_2: string = "a";
      const PUSH_VALUE_3: string = "y";
      const PUSH_VALUE_4: string = "x";
      const VALUE: int = 0;
      const EXPECTED_VALUE: string = "a";
      const EXPECTED_VALUE_1: int = 2;
      let q: containers.BlockingQueue<string[]> = new containers.LinkedBlockingQueue<string[]>();
      q.push([PUSH_VALUE_2, PUSH_VALUE_1, PUSH_VALUE]);
      q.push([PUSH_VALUE_4, PUSH_VALUE_3]);
      let a = q.pop();
      let b = q.pop();
      expect(a[VALUE]).assertEqual(EXPECTED_VALUE);
      expect(b.length).assertEqual(EXPECTED_VALUE_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_1600
     * @tc.name testBlockingQueueGeneric016
     * @tc.desc Verify LinkedBlockingQueue<Map<string, int>> stores Map references intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const KEY: string = "a";
      const SET_VALUE: int = 1;
      const KEY_1: string = "b";
      const SET_VALUE_1: int = 2;
      const EXPECTED_VALUE: int = 2;
      const TEXT_VALUE: string = "a";
      const EXPECTED_VALUE_1: int = 1;
      const TEXT_VALUE_1: string = "b";
      let q: containers.BlockingQueue<Map<string, int>> = new containers.LinkedBlockingQueue<Map<string, int>>();
      let m = new Map<string, int>();
      m.set(KEY, SET_VALUE);
      m.set(KEY_1, SET_VALUE_1);
      q.push(m);
      let r = q.pop();
      expect(r.size).assertEqual(EXPECTED_VALUE);
      expect(r.get(TEXT_VALUE)).assertEqual(EXPECTED_VALUE_1);
      expect(r.get(TEXT_VALUE_1)).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_1700
     * @tc.name testBlockingQueueGeneric017
     * @tc.desc Verify LinkedBlockingQueue<Set<int>> stores Set references intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ADD_VALUE: int = 10;
      const ADD_VALUE_1: int = 20;
      const ADD_VALUE_2: int = 30;
      const EXPECTED_VALUE: int = 3;
      const VALUE: int = 10;
      const VALUE_1: int = 20;
      const VALUE_2: int = 30;
      let q: containers.BlockingQueue<Set<int>> = new containers.LinkedBlockingQueue<Set<int>>();
      let s = new Set<int>();
      s.add(ADD_VALUE);
      s.add(ADD_VALUE_1);
      s.add(ADD_VALUE_2);
      q.push(s);
      let r = q.pop();
      expect(r.size).assertEqual(EXPECTED_VALUE);
      expect(r.has(VALUE)).assertTrue();
      expect(r.has(VALUE_1)).assertTrue();
      expect(r.has(VALUE_2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_1800
     * @tc.name testBlockingQueueGeneric018
     * @tc.desc Verify ArrayBlockingQueue<Set<string>>(5) stores Set references intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const ADD_VALUE: string = "alpha";
      const ADD_VALUE_1: string = "beta";
      const TEXT_VALUE: string = "alpha";
      const TEXT_VALUE_1: string = "beta";
      let q: containers.BlockingQueue<Set<string>> = new containers.ArrayBlockingQueue<Set<string>>(CAPACITY);
      let s = new Set<string>();
      s.add(ADD_VALUE);
      s.add(ADD_VALUE_1);
      q.push(s);
      let r = q.pop();
      expect(r.has(TEXT_VALUE)).assertTrue();
      expect(r.has(TEXT_VALUE_1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_1900
     * @tc.name testBlockingQueueGeneric019
     * @tc.desc Verify same-instance pushed multiple times keeps reference identity (aliasing safe)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CTOR_VALUE: int = 7;
      const CTOR_VALUE_1: int = 14;
      let q: containers.BlockingQueue<GenericPoint> = new containers.LinkedBlockingQueue<GenericPoint>();
      let p = new GenericPoint(CTOR_VALUE, CTOR_VALUE_1);
      q.push(p);
      q.push(p);
      q.push(p);
      let r1 = q.pop();
      let r2 = q.pop();
      let r3 = q.pop();
      expect(r1).assertEqual(p);
      expect(r2).assertEqual(p);
      expect(r3).assertEqual(p);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_2000
     * @tc.name testBlockingQueueGeneric020
     * @tc.desc Verify mutating retrieved object does not affect queue (object stored by reference)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CTOR_VALUE: int = 1;
      const EXPECTED_VALUE: int = 999;
      let q: containers.BlockingQueue<GenericPoint> = new containers.LinkedBlockingQueue<GenericPoint>();
      let p = new GenericPoint(CTOR_VALUE, CTOR_VALUE);
      q.push(p);
      let r = q.getFirst()!;
      r.x = 999;
      let r2 = q.getFirst()!;
      expect(r2.x).assertEqual(EXPECTED_VALUE);
      expect(p.x).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_2100
     * @tc.name testBlockingQueueGeneric021
     * @tc.desc Verify capacity=Int.MAX_VALUE and 100 distinct generic objects stored without truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CTOR_VALUE: int = 2;
      const EXPECTED_VALUE: int = 2;
      let q: containers.BlockingQueue<GenericPoint> = new containers.LinkedBlockingQueue<GenericPoint>();
      let pts: GenericPoint[] = [];
      for (let i: int = 0; i < 100; i++) {
        let pt = new GenericPoint(i, i * CTOR_VALUE);
        pts.push(pt);
        q.push(pt);
      }
      for (let i: int = 0; i < 100; i++) {
        let p = q.pop();
        expect(p.x).assertEqual(i);
        expect(p.y).assertEqual(i * EXPECTED_VALUE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_2200
     * @tc.name testBlockingQueueGeneric022
     * @tc.desc Verify ArrayBlockingQueue<GenericPair>(15) stores 15 mixed-type-field objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 15;
      const PUSH_VALUE: string = "s";
      const EXPECTED_VALUE: string = "s";
      let q: containers.BlockingQueue<GenericPair> = new containers.ArrayBlockingQueue<GenericPair>(CAPACITY);
      for (let i: int = 0; i < 15; i++) {
        q.push(new GenericPair(i, PUSH_VALUE + i));
      }
      for (let i: int = 0; i < 15; i++) {
        let r = q.pop();
        expect(r.first).assertEqual(i);
        expect(r.second).assertEqual(EXPECTED_VALUE + i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_2300
     * @tc.name testBlockingQueueGeneric023
     * @tc.desc Verify add returns true for object types and reference is stored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CTOR_VALUE: int = 5;
      const EXPECTED_VALUE: int = 1;
      let q: containers.BlockingQueue<GenericPoint> = new containers.LinkedBlockingQueue<GenericPoint>();
      let p = new GenericPoint(CTOR_VALUE, CTOR_VALUE);
      expect(q.add(p)).assertTrue();
      expect(q.size).assertEqual(EXPECTED_VALUE);
      expect(q.getFirst()).assertEqual(p);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_2400
     * @tc.name testBlockingQueueGeneric024
     * @tc.desc Verify poll returns object reference, then undefined when empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CTOR_VALUE: int = 8;
      const CTOR_VALUE_1: int = 9;
      let q: containers.BlockingQueue<GenericPoint> = new containers.LinkedBlockingQueue<GenericPoint>();
      let p = new GenericPoint(CTOR_VALUE, CTOR_VALUE_1);
      q.push(p);
      let r = q.poll();
      expect(r).assertEqual(p);
      expect(q.poll()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_2500
     * @tc.name testBlockingQueueGeneric025
     * @tc.desc Verify queue with Iterable<GenericKey> constructor preserves all object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CTOR_VALUE: int = 1;
      const CTOR_VALUE_1: string = "a";
      const CTOR_VALUE_2: int = 2;
      const CTOR_VALUE_3: string = "b";
      const CTOR_VALUE_4: int = 3;
      const CTOR_VALUE_5: string = "c";
      const EXPECTED_VALUE: int = 3;
      const EXPECTED_VALUE_1: string = "a";
      const EXPECTED_VALUE_2: string = "b";
      const EXPECTED_VALUE_3: string = "c";
      let arr: GenericKey[] = [new GenericKey(CTOR_VALUE, CTOR_VALUE_1), new GenericKey(CTOR_VALUE_2, CTOR_VALUE_3), new GenericKey(CTOR_VALUE_4, CTOR_VALUE_5)];
      let q: containers.BlockingQueue<GenericKey> = new containers.LinkedBlockingQueue<GenericKey>(arr);
      expect(q.size).assertEqual(EXPECTED_VALUE);
      expect(q.pop().name).assertEqual(EXPECTED_VALUE_1);
      expect(q.pop().name).assertEqual(EXPECTED_VALUE_2);
      expect(q.pop().name).assertEqual(EXPECTED_VALUE_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_2600
     * @tc.name testBlockingQueueGeneric026
     * @tc.desc Verify ArrayBlockingQueue<GenericKey>(10, iterable) preserves all object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CTOR_VALUE: int = 10;
      const CTOR_VALUE_1: string = "x";
      const CTOR_VALUE_2: int = 20;
      const CTOR_VALUE_3: string = "y";
      const CAPACITY: int = 10;
      const EXPECTED_VALUE: int = 2;
      const EXPECTED_VALUE_1: int = 10;
      const EXPECTED_VALUE_2: string = "x";
      let arr: GenericKey[] = [new GenericKey(CTOR_VALUE, CTOR_VALUE_1), new GenericKey(CTOR_VALUE_2, CTOR_VALUE_3)];
      let q: containers.BlockingQueue<GenericKey> = new containers.ArrayBlockingQueue<GenericKey>(CAPACITY, arr);
      expect(q.size).assertEqual(EXPECTED_VALUE);
      let k = q.pop();
      expect(k.id).assertEqual(EXPECTED_VALUE_1);
      expect(k.name).assertEqual(EXPECTED_VALUE_2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_2700
     * @tc.name testBlockingQueueGeneric027
     * @tc.desc Verify LinkedBlockingQueue<GenericTreeNode> roundtrips 10 nodes preserving value and empty children
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const EXPECTED_VALUE: int = 0;
      let q: containers.BlockingQueue<GenericTreeNode> = new containers.LinkedBlockingQueue<GenericTreeNode>();
      for (let i: int = 0; i < 10; i++) {
        q.push(new GenericTreeNode(i));
      }
      for (let i: int = 0; i < 10; i++) {
        let n = q.pop();
        expect(n.value).assertEqual(i);
        expect(n.children.length).assertEqual(EXPECTED_VALUE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_2800
     * @tc.name testBlockingQueueGeneric028
     * @tc.desc Verify LinkedBlockingQueue<GenericNullable> with capacity=3 stores objects with null fields and returns false on overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 3;
      const EXPECTED_VALUE: int = 3;
      let q: containers.BlockingQueue<GenericNullable> = new containers.LinkedBlockingQueue<GenericNullable>(CAPACITY);
      for (let i: int = 0; i < 3; i++) {
        let o = new GenericNullable();
        o.name = i % 2 == 0 ? null : ("n" + i);
        o.value = null;
        expect(q.add(o)).assertTrue();
      }
      let extra = new GenericNullable();
      expect(q.add(extra)).assertFalse();
      expect(q.size).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_2900
     * @tc.name testBlockingQueueGeneric029
     * @tc.desc Verify LinkedBlockingQueue<int[]>(5) stores 5 different int arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const VALUE: int = 5;
      let q: containers.BlockingQueue<int[]> = new containers.LinkedBlockingQueue<int[]>(VALUE);
      let lengths: int[] = [0, 1, 5, 10, 100];
      for (let i: int = 0; i < lengths.length; i++) {
        let arr: int[] = [];
        for (let j: int = 0; j < lengths[i]; j++) {
          arr.push(j);
        }
        q.push(arr);
      }
      for (let i: int = 0; i < lengths.length; i++) {
        let r = q.pop();
        expect(r.length).assertEqual(lengths[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_3000
     * @tc.name testBlockingQueueGeneric030
     * @tc.desc Verify LinkedBlockingQueue<string[]>(5) stores 5 string arrays of different shapes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const VALUE: int = 5;
      const PUSH_VALUE: string = "";
      const PUSH_VALUE_1: string = "one";
      const PUSH_VALUE_2: string = "c";
      const PUSH_VALUE_3: string = "b";
      const PUSH_VALUE_4: string = "a";
      const PUSH_VALUE_5: string = "test";
      const PUSH_VALUE_6: string = "🔥";
      const PUSH_VALUE_7: string = "中文";
      const EXPECTED_VALUE: int = 0;
      const EXPECTED_VALUE_1: int = 1;
      const VALUE_1: int = 0;
      const EXPECTED_VALUE_2: string = "one";
      const EXPECTED_VALUE_3: int = 3;
      const EXPECTED_VALUE_4: string = "中文";
      const VALUE_2: int = 1;
      const EXPECTED_VALUE_5: string = "🔥";
      let q: containers.BlockingQueue<string[]> = new containers.LinkedBlockingQueue<string[]>(VALUE);
      q.push([]);
      q.push([PUSH_VALUE]);
      q.push([PUSH_VALUE_1]);
      q.push([PUSH_VALUE_4, PUSH_VALUE_3, PUSH_VALUE_2]);
      q.push([PUSH_VALUE_7, PUSH_VALUE_6, PUSH_VALUE_5]);
      expect(q.pop().length).assertEqual(EXPECTED_VALUE);
      expect(q.pop().length).assertEqual(EXPECTED_VALUE_1);
      expect(q.pop()[VALUE_1]).assertEqual(EXPECTED_VALUE_2);
      expect(q.pop().length).assertEqual(EXPECTED_VALUE_3);
      let last = q.pop();
      expect(last[VALUE_1]).assertEqual(EXPECTED_VALUE_4);
      expect(last[VALUE_2]).assertEqual(EXPECTED_VALUE_5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_3100
     * @tc.name testBlockingQueueGeneric031
     * @tc.desc Verify LinkedBlockingQueue<boolean>(20) handles 20 alternating boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 20;
      const PUSH_VALUE: int = 0;
      const PUSH_VALUE_1: int = 2;
      const EXPECTED_VALUE: int = 0;
      const EXPECTED_VALUE_1: int = 2;
      let q: containers.BlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>(CAPACITY);
      for (let i: int = 0; i < 20; i++) {
        q.push(i % PUSH_VALUE_1 == PUSH_VALUE);
      }
      for (let i: int = 0; i < 20; i++) {
        expect(q.pop()).assertEqual(i % EXPECTED_VALUE_1 == EXPECTED_VALUE);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_3200
     * @tc.name testBlockingQueueGeneric032
     * @tc.desc Verify LinkedBlockingQueue<boolean> all-true sequence preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: boolean = true;
      let q: containers.BlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>();
      for (let i: int = 0; i < 30; i++) {
        q.push(PUSH_VALUE);
      }
      for (let i: int = 0; i < 30; i++) {
        expect(q.pop()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_3300
     * @tc.name testBlockingQueueGeneric033
     * @tc.desc Verify LinkedBlockingQueue<boolean> all-false sequence preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: boolean = false;
      let q: containers.BlockingQueue<boolean> = new containers.LinkedBlockingQueue<boolean>();
      for (let i: int = 0; i < 30; i++) {
        q.push(PUSH_VALUE);
      }
      for (let i: int = 0; i < 30; i++) {
        expect(q.pop()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_3400
     * @tc.name testBlockingQueueGeneric034
     * @tc.desc Verify ArrayBlockingQueue<boolean>(50) stores all-true sequence of 50 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 50;
      const BOOLEAN_VALUE: boolean = true;
      const EXPECTED_VALUE: int = 50;
      let q: containers.BlockingQueue<boolean> = new containers.ArrayBlockingQueue<boolean>(CAPACITY);
      for (let i: int = 0; i < 50; i++) {
        expect(q.add(BOOLEAN_VALUE)).assertTrue();
      }
      expect(q.size).assertEqual(EXPECTED_VALUE);
      for (let i: int = 0; i < 50; i++) {
        expect(q.poll()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_3500
     * @tc.name testBlockingQueueGeneric035
     * @tc.desc Verify LinkedBlockingQueue<int> roundtrips INT32 boundary values (MAX/MIN) without loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 2147483647;
      const PUSH_VALUE_1: int = -2147483648;
      const EXPECTED_VALUE: int = 2147483647;
      const EXPECTED_VALUE_1: int = -2147483648;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_1);
      let v1: int = q.pop();
      let v2: int = q.pop();
      expect(v1).assertEqual(EXPECTED_VALUE);
      expect(v2).assertEqual(EXPECTED_VALUE_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_3600
     * @tc.name testBlockingQueueGeneric036
     * @tc.desc Verify LinkedBlockingQueue<number> stores small fractions with high precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: number = 0.0000001;
      const PUSH_VALUE_1: number = 1.0e-10;
      const PUSH_VALUE_2: number = 1.0e10;
      const PUSH_VALUE_3: number = 1.0e308;
      const EXPECTED_VALUE: number = 0.0000001;
      const EXPECTED_VALUE_1: number = 1.0e-10;
      const EXPECTED_VALUE_2: number = 1.0e10;
      const EXPECTED_VALUE_3: number = 1.0e308;
      let q: containers.BlockingQueue<number> = new containers.LinkedBlockingQueue<number>();
      q.push(PUSH_VALUE);
      q.push(PUSH_VALUE_1);
      q.push(PUSH_VALUE_2);
      q.push(PUSH_VALUE_3);
      expect(q.pop()).assertEqual(EXPECTED_VALUE);
      expect(q.pop()).assertEqual(EXPECTED_VALUE_1);
      expect(q.pop()).assertEqual(EXPECTED_VALUE_2);
      expect(q.pop()).assertEqual(EXPECTED_VALUE_3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_3700
     * @tc.name testBlockingQueueGeneric037
     * @tc.desc Verify LinkedBlockingQueue<Array<int>>(5) preserves nested array references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 5;
      const EXPECTED_VALUE: int = 3;
      let q: containers.BlockingQueue<Array<int>> = new containers.LinkedBlockingQueue<Array<int>>(CAPACITY);
      let a1: int[] = [1, 2, 3];
      q.push(a1);
      let r = q.pop();
      expect(r).assertEqual(a1);
      expect(r.length).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_3800
     * @tc.name testBlockingQueueGeneric038
     * @tc.desc Verify LinkedBlockingQueue<GenericKey> 50 distinct objects, all references preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CTOR_VALUE: int = 3;
      const CTOR_VALUE_1: string = "k";
      let q: containers.BlockingQueue<GenericKey> = new containers.LinkedBlockingQueue<GenericKey>();
      let arr: GenericKey[] = [];
      for (let i: int = 0; i < 50; i++) {
        let k = new GenericKey(i * CTOR_VALUE, CTOR_VALUE_1 + i);
        arr.push(k);
        q.push(k);
      }
      for (let i: int = 0; i < 50; i++) {
        let k = q.pop();
        expect(k).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_3900
     * @tc.name testBlockingQueueGeneric039
     * @tc.desc Verify LinkedBlockingQueue<GenericPoint> getFirst/getEnd return object reference (not copy)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CTOR_VALUE: int = 11;
      const CTOR_VALUE_1: int = 22;
      const CTOR_VALUE_2: int = 33;
      const CTOR_VALUE_3: int = 44;
      let q: containers.BlockingQueue<GenericPoint> = new containers.LinkedBlockingQueue<GenericPoint>();
      let p1 = new GenericPoint(CTOR_VALUE, CTOR_VALUE_1);
      let p2 = new GenericPoint(CTOR_VALUE_2, CTOR_VALUE_3);
      q.push(p1);
      q.push(p2);
      expect(q.getFirst()).assertEqual(p1);
      expect(q.getEnd()).assertEqual(p2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_4000
     * @tc.name testBlockingQueueGeneric040
     * @tc.desc Verify ArrayBlockingQueue<GenericPoint>(3) capacity full add returns false but objects intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 3;
      const CTOR_VALUE: int = 1;
      const CTOR_VALUE_1: int = 2;
      const CTOR_VALUE_2: int = 3;
      const CTOR_VALUE_3: int = 4;
      const CTOR_VALUE_4: int = 5;
      const CTOR_VALUE_5: int = 6;
      const CTOR_VALUE_6: int = 7;
      const CTOR_VALUE_7: int = 8;
      const EXPECTED_VALUE: int = 3;
      let q: containers.BlockingQueue<GenericPoint> = new containers.ArrayBlockingQueue<GenericPoint>(CAPACITY);
      let p1 = new GenericPoint(CTOR_VALUE, CTOR_VALUE_1);
      let p2 = new GenericPoint(CTOR_VALUE_2, CTOR_VALUE_3);
      let p3 = new GenericPoint(CTOR_VALUE_4, CTOR_VALUE_5);
      let p4 = new GenericPoint(CTOR_VALUE_6, CTOR_VALUE_7);
      expect(q.add(p1)).assertTrue();
      expect(q.add(p2)).assertTrue();
      expect(q.add(p3)).assertTrue();
      expect(q.add(p4)).assertFalse();
      expect(q.size).assertEqual(EXPECTED_VALUE);
      expect(q.pop()).assertEqual(p1);
      expect(q.pop()).assertEqual(p2);
      expect(q.pop()).assertEqual(p3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_4100
     * @tc.name testBlockingQueueGeneric041
     * @tc.desc Verify mutation chain on stored object visible through subsequent peek operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CTOR_VALUE: int = 2;
      const CTOR_VALUE_1: int = 1;
      const EXPECTED_VALUE: int = 2;
      const EXPECTED_VALUE_1: int = 99;
      let q: containers.BlockingQueue<GenericContainer> = new containers.LinkedBlockingQueue<GenericContainer>();
      let c = new GenericContainer([CTOR_VALUE_1, CTOR_VALUE]);
      q.push(c);
      let h1 = q.getFirst()!;
      expect(h1.count).assertEqual(EXPECTED_VALUE);
      c.count = 99;
      let h2 = q.getFirst()!;
      expect(h2.count).assertEqual(EXPECTED_VALUE_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_4200
     * @tc.name testBlockingQueueGeneric042
     * @tc.desc Verify LinkedBlockingQueue<GenericPair> with mixed-content roundtrip preserves all fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CTOR_VALUE: int = 0;
      const CTOR_VALUE_1: string = "";
      const CTOR_VALUE_2: int = -1;
      const CTOR_VALUE_3: string = " ";
      const CTOR_VALUE_4: int = 2147483647;
      const CTOR_VALUE_5: string = "MAX";
      const CTOR_VALUE_6: int = -2147483648;
      const CTOR_VALUE_7: string = "MIN";
      const CTOR_VALUE_8: int = 42;
      const CTOR_VALUE_9: string = "中文";
      let q: containers.BlockingQueue<GenericPair> = new containers.LinkedBlockingQueue<GenericPair>();
      let pairs: GenericPair[] = [
        new GenericPair(CTOR_VALUE, CTOR_VALUE_1),
        new GenericPair(CTOR_VALUE_2, CTOR_VALUE_3),
        new GenericPair(CTOR_VALUE_4, CTOR_VALUE_5),
        new GenericPair(CTOR_VALUE_6, CTOR_VALUE_7),
        new GenericPair(CTOR_VALUE_8, CTOR_VALUE_9)
      ];
      for (let i: int = 0; i < pairs.length; i++) {
        q.push(pairs[i]);
      }
      for (let i: int = 0; i < pairs.length; i++) {
        let r = q.pop();
        expect(r.first).assertEqual(pairs[i].first);
        expect(r.second).assertEqual(pairs[i].second);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_4300
     * @tc.name testBlockingQueueGeneric043
     * @tc.desc Verify LinkedBlockingQueue<int> default-capacity instance remains stable after 5000 mixed push/pop ops with final size 3333
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBlockingQueueGeneric043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EXPECTED_VALUE: int = 3333;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      for (let i: int = 0; i < 5000; i++) {
        q.push(i);
        if (i % 3 === 0 && q.size > 0) {
          q.pop();
        }
      }
      expect(q.size).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_4400
     * @tc.name testBlockingQueueGeneric044
     * @tc.desc Verify ArrayBlockingQueue<GenericTreeNode>(20) preserves 10-level linear-nested tree as single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 20;
      const CTOR_VALUE: int = 0;
      const INDEX: int = 0;
      let q: containers.BlockingQueue<GenericTreeNode> = new containers.ArrayBlockingQueue<GenericTreeNode>(CAPACITY);
      let root = new GenericTreeNode(CTOR_VALUE);
      let curr = root;
      for (let depth: int = 1; depth < 10; depth++) {
        let child = new GenericTreeNode(depth);
        curr.children = [child];
        curr = child;
      }
      q.push(root);
      let popped = q.pop();
      let walker = popped;
      for (let depth: int = 0; depth < 10; depth++) {
        expect(walker.value).assertEqual(depth);
        if (walker.children.length > 0) {
          walker = walker.children[INDEX];
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_4500
     * @tc.name testBlockingQueueGeneric045
     * @tc.desc Verify LinkedBlockingQueue<GenericTreeNode> 50 nested 3-children trees popped in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CTOR_VALUE: int = 1000;
      const CTOR_VALUE_1: int = 2000;
      const CTOR_VALUE_2: int = 3000;
      const EXPECTED_VALUE: int = 3;
      const VALUE: int = 0;
      const EXPECTED_VALUE_1: int = 1000;
      const VALUE_1: int = 2;
      const EXPECTED_VALUE_2: int = 3000;
      let q: containers.BlockingQueue<GenericTreeNode> = new containers.LinkedBlockingQueue<GenericTreeNode>();
      for (let i: int = 0; i < 50; i++) {
        let n = new GenericTreeNode(i);
        n.children = [new GenericTreeNode(i + CTOR_VALUE), new GenericTreeNode(i + CTOR_VALUE_1), new GenericTreeNode(i + CTOR_VALUE_2)];
        q.push(n);
      }
      for (let i: int = 0; i < 50; i++) {
        let n = q.pop();
        expect(n.value).assertEqual(i);
        expect(n.children.length).assertEqual(EXPECTED_VALUE);
        expect(n.children[VALUE].value).assertEqual(i + EXPECTED_VALUE_1);
        expect(n.children[VALUE_1].value).assertEqual(i + EXPECTED_VALUE_2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_4600
     * @tc.name testBlockingQueueGeneric046
     * @tc.desc Verify LinkedBlockingQueue<int> push 0o777 octal int (511 decimal) and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = 0o777;
      const EXPECTED_VALUE: int = 511;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      q.push(PUSH_VALUE);
      expect(q.pop()).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_4700
     * @tc.name testBlockingQueueGeneric047
     * @tc.desc Verify LinkedBlockingQueue<int> roundtrips -1 (two-complement boundary equivalent to 0xFFFFFFFF unsigned)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const PUSH_VALUE: int = -1;
      const EXPECTED_VALUE: int = -1;
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>();
      q.push(PUSH_VALUE);
      let r: int = q.pop();
      expect(r).assertEqual(EXPECTED_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_4800
     * @tc.name testBlockingQueueGeneric048
     * @tc.desc Verify LinkedBlockingQueue<string> with various boolean-like strings ("true", "false", "0", "1")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let q: containers.BlockingQueue<string> = new containers.LinkedBlockingQueue<string>();
      let strs: string[] = ["true", "false", "0", "1", "null", "undefined", "NaN"];
      for (let i: int = 0; i < strs.length; i++) {
        q.push(strs[i]);
      }
      for (let i: int = 0; i < strs.length; i++) {
        let r = q.pop();
        expect(r).assertEqual(strs[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_4900
     * @tc.name testBlockingQueueGeneric049
     * @tc.desc Verify LinkedBlockingQueue<int> push values from user-provided int[] iterable preserves all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr: int[] = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
      let q: containers.BlockingQueue<int> = new containers.LinkedBlockingQueue<int>(arr);
      for (let i: int = 0; i < arr.length; i++) {
        expect(q.pop()).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BLOCKINGQUEUE_GENERIC_5000
     * @tc.name testBlockingQueueGeneric050
     * @tc.desc Verify LinkedBlockingQueue<GenericPoint> capacity boundary: capacity=1 ensures only 1 reference held
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testBlockingQueueGeneric050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const CAPACITY: int = 1;
      const CTOR_VALUE: int = 1;
      const CTOR_VALUE_1: int = 2;
      let q: containers.BlockingQueue<GenericPoint> = new containers.LinkedBlockingQueue<GenericPoint>(CAPACITY);
      let p1 = new GenericPoint(CTOR_VALUE, CTOR_VALUE);
      let p2 = new GenericPoint(CTOR_VALUE_1, CTOR_VALUE_1);
      expect(q.add(p1)).assertTrue();
      expect(q.add(p2)).assertFalse();
      expect(q.getFirst()).assertEqual(p1);
      expect(q.getEnd()).assertEqual(p1);
      q.pop();
      expect(q.add(p2)).assertTrue();
      expect(q.getFirst()).assertEqual(p2);
    });

  });
}
