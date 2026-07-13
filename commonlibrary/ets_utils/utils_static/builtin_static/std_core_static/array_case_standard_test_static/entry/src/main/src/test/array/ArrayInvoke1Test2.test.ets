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
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level,
  Size, TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

abstract class AbstractInvokeItem {
  abstract getValue(): int;
}

class ConcreteInvokeItem extends AbstractInvokeItem {
  private val: int = 0;

  constructor(v: int) {
    super();
    this.val = v;
  }

  getValue(): int {
    return this.val;
  }
}

interface ShapeInvoke {
  name: string;
  area(): int;
}

class CircleInvoke implements ShapeInvoke {
  name: string = 'circle';
  private radius: int;

  constructor(r: int) {
    this.radius = r;
  }

  area(): int {
    return this.radius * this.radius * 3;
  }
}

class SquareInvoke implements ShapeInvoke {
  name: string = 'square';
  private side: int;

  constructor(s: int) {
    this.side = s;
  }

  area(): int {
    return this.side * this.side;
  }
}

function innerScopeArray(): Array<int> {
  return new Array<int>();
}

function makeNestedScopeArray(): Array<int> {
  const arr = innerScopeArray();
  arr.pushOne(42);
  return arr;
}

function makeClosureArray(): () => Array<int> {
  const arr = new Array<int>();
  arr.pushOne(99);
  return (): Array<int> => arr;
}

function fillArrayViaParam(a: Array<int>, v: int): void {
  a.pushOne(v);
}

class Invoke1Grandparent {
  arr: Array<int> = new Array<int>();
}

class Invoke1Parent extends Invoke1Grandparent {
}

class Invoke1Child extends Invoke1Parent {
}

class Invoke1SubArray extends Array<int> {
}

class Invoke1Item {
  val: int = 0;

  constructor(v: int) {
    this.val = v;
  }
}

class Invoke1CustomStatic {
  static $_invoke(): int {
    return 42;
  }
}

export default function ArrayInvoke1Test2(): void {
  describe('ArrayInvoke1Test2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_0100
     * @tc.name testArrayInvoke1001
     * @tc.desc Verify empty Array<double> can be created and push values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>();
      expect(arr.length).assertEqual(0);
      arr.pushOne(1.5);
      arr.pushOne(2.5);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1.5);
      expect(arr[1]).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_0200
     * @tc.name testArrayInvoke1002
     * @tc.desc Verify empty Array<boolean> can be created and push values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>();
      expect(arr.length).assertEqual(0);
      arr.pushOne(true);
      arr.pushOne(false);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertTrue();
      expect(arr[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_0300
     * @tc.name testArrayInvoke1003
     * @tc.desc Verify empty Array<int | string> can be created and push both types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string>();
      expect(arr.length).assertEqual(0);
      arr.pushOne(1);
      arr.pushOne('two');
      arr.pushOne(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual('two');
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_0400
     * @tc.name testArrayInvoke1004
     * @tc.desc Verify empty array pop on empty returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      const val = arr.pop();
      expect(val).assertUndefined();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_0500
     * @tc.name testArrayInvoke1005
     * @tc.desc Verify empty array grow to 1000 elements via pushOne
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      for (let i = 0; i < 1000; i++) {
        arr.pushOne(i);
      }
      expect(arr.length).assertEqual(1000);
      expect(arr[0]).assertEqual(0);
      expect(arr[999]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_0600
     * @tc.name testArrayInvoke1006
     * @tc.desc Verify empty array reduce with initial value works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      const sum = arr.reduce((acc: int, v: int): int => acc + v, 0);
      expect(sum).assertEqual(0);

      const concat = arr.reduce((acc: string, v: int): string => acc + v.toString(), 'init');
      expect(concat).assertEqual('init');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_0700
     * @tc.name testArrayInvoke1007
     * @tc.desc Verify empty array filter and map return empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      expect(arr.filter((v: int): boolean => v > 0).length).assertEqual(0);
      expect(arr.map((v: int): int => v * 2).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_0800
     * @tc.name testArrayInvoke1008
     * @tc.desc Verify two separate no-arg constructions produce physically independent array instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>();
      const arr2 = new Array<int>();
      expect(arr1 !== arr2).assertTrue();
      expect(arr1.length).assertEqual(0);
      expect(arr2.length).assertEqual(0);
      arr1.pushOne(1);
      arr2.pushOne(2);
      expect(arr1[0]).assertEqual(1);
      expect(arr2[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_0900
     * @tc.name testArrayInvoke1009
     * @tc.desc Verify no-arg construct with abstract class generic type produces usable typed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<AbstractInvokeItem>();
      expect(arr.length).assertEqual(0);
      arr.pushOne(new ConcreteInvokeItem(42));
      arr.pushOne(new ConcreteInvokeItem(100));
      expect(arr[0].getValue()).assertEqual(42);
      expect(arr[1].getValue()).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_1000
     * @tc.name testArrayInvoke1010
     * @tc.desc Verify no-arg construction works correctly inside multiple nested scope levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = makeNestedScopeArray();
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_1100
     * @tc.name testArrayInvoke1011
     * @tc.desc Verify no-arg construction remains robust after an exception is caught and handled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>();
      try {
        arr1[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      const arr2 = new Array<int>();
      arr2.pushOne(42);
      expect(arr2[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_1200
     * @tc.name testArrayInvoke1012
     * @tc.desc Verify no-arg construction via a mediator variable holding the Array constructor reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      expect(arr.length).assertEqual(0);
      arr.pushOne(10);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_1300
     * @tc.name testArrayInvoke1013
     * @tc.desc Verify optional chaining with a nullable container that holds an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int> | null = new Array<int>();
      arr?.pushOne(5);
      expect(arr?.length).assertEqual(1);
      expect(arr?.[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_1400
     * @tc.name testArrayInvoke1014
     * @tc.desc Verify nullish coalescing operator handles empty array length correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      const result = arr.length ?? -1;
      expect(result).assertEqual(0);
      arr.pushOne(1);
      const result2 = arr.length ?? -1;
      expect(result2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_1500
     * @tc.name testArrayInvoke1015
     * @tc.desc Verify no-arg construction of deeply nested generic type Array<Array<Array<int>>>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<Array<int>>>();
      expect(arr.length).assertEqual(0);
      const inner = new Array<Array<int>>();
      inner.pushOne(new Array<int>(1, 2));
      arr.pushOne(inner);
      expect(arr.length).assertEqual(1);
      expect(arr[0][0][0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_1600
     * @tc.name testArrayInvoke1016
     * @tc.desc Verify empty array captured in a closure retains its reference and elements correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn = makeClosureArray();
      const result = fn();
      expect(result[0]).assertEqual(99);
      result.pushOne(100);
      const result2 = fn();
      expect(result2[1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_1700
     * @tc.name testArrayInvoke1017
     * @tc.desc Verify multiple no-arg constructions produce independent arrays each with their own pushOne values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const results: Array<Array<int>> = new Array<Array<int>>();
      for (let i = 0; i < 5; i++) {
        const arr = new Array<int>();
        arr.pushOne(i * 10);
        results.pushOne(arr);
      }
      expect(results.length).assertEqual(5);
      expect(results[0][0]).assertEqual(0);
      expect(results[2][0]).assertEqual(20);
      expect(results[4][0]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_1800
     * @tc.name testArrayInvoke1018
     * @tc.desc Verify alternating push and pop on an empty-constructed array maintains correct state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      arr.pushOne(1);
      arr.pop();
      arr.pushOne(2);
      arr.pop();
      arr.pushOne(3);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_1900
     * @tc.name testArrayInvoke1019
     * @tc.desc Verify empty array can be passed across multiple function boundaries and filled correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      fillArrayViaParam(arr, 10);
      fillArrayViaParam(arr, 20);
      fillArrayViaParam(arr, 30);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_2000
     * @tc.name testArrayInvoke1020
     * @tc.desc Verify empty array typed by interface can hold multiple implementing class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<ShapeInvoke>();
      arr.pushOne(new CircleInvoke(5));
      arr.pushOne(new SquareInvoke(4));
      expect(arr.length).assertEqual(2);
      expect(arr[0].name).assertEqual('circle');
      expect(arr[0].area()).assertEqual(75);
      expect(arr[1].name).assertEqual('square');
      expect(arr[1].area()).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_2100
     * @tc.name testArrayInvoke1021
     * @tc.desc Verify empty union typed array accepts class instances interleaved with null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<ConcreteInvokeItem | null>();
      arr.pushOne(new ConcreteInvokeItem(10));
      arr.pushOne(null);
      arr.pushOne(new ConcreteInvokeItem(30));
      expect(arr.length).assertEqual(3);
      expect(arr[0]!.getValue()).assertEqual(10);
      expect(arr[1]).assertNull();
      expect(arr[2]!.getValue()).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_2200
     * @tc.name testArrayInvoke1022
     * @tc.desc Verify conditional push after empty construction based on a boolean flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      const flag = true;
      if (flag) {
        arr.pushOne(100);
      }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(100);

      const arr2 = new Array<int>();
      const flag2 = false;
      if (flag2) {
        arr2.pushOne(200);
      }
      expect(arr2.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_2300
     * @tc.name testArrayInvoke1023
     * @tc.desc Verify no-arg construction with bigint generic type creates empty Array<bigint>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>();
      expect(arr.length).assertEqual(0);
      arr.pushOne(1n);
      arr.pushOne(2n);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_2400
     * @tc.name testArrayInvoke1024
     * @tc.desc Verify no-arg constructed array can pushOne 42 and access element at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      expect(arr.length).assertEqual(0);
      arr.pushOne(42);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_2500
     * @tc.name testArrayInvoke1025
     * @tc.desc Verify no-arg constructed array can pushOne 77 and access element at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      expect(arr.length).assertEqual(0);
      arr.pushOne(77);
      expect(arr[0]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_2600
     * @tc.name testArrayInvoke1026
     * @tc.desc Verify no-arg constructed array can pushOne 99 and access element at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      expect(arr.length).assertEqual(0);
      arr.pushOne(99);
      expect(arr[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_2700
     * @tc.name testArrayInvoke1027
     * @tc.desc Verify high-volume no-arg construction of 5000 arrays is stable and each is independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const containers = new Array<Array<int>>();
      for (let i = 0; i < 5000; i++) {
        const a = new Array<int>();
        a.pushOne(i);
        containers.pushOne(a);
      }
      expect(containers.length).assertEqual(5000);
      expect(containers[0][0]).assertEqual(0);
      expect(containers[4999][0]).assertEqual(4999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_2800
     * @tc.name testArrayInvoke1028
     * @tc.desc Verify no-arg constructed array with pushOne: [10,20,30], length=3, elements at correct indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      arr.pushOne(10);
      arr.pushOne(20);
      arr.pushOne(30);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_2900
     * @tc.name testArrayInvoke1029
     * @tc.desc Verify WeakRef wrapping of no-arg constructed array retains reference correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      arr.pushOne(55);
      const ref = new WeakRef<Array<int>>(arr);
      const deref = ref.deref();
      if (deref !== undefined) {
        expect(deref[0]).assertEqual(55);
      }else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_3000
     * @tc.name testArrayInvoke1030
     * @tc.desc Verify subclass of Array constructed via no-arg inherits Array behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Invoke1SubArray();
      expect(arr.length).assertEqual(0);
      arr.pushOne(100);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_3100
     * @tc.name testArrayInvoke1031
     * @tc.desc Verify array construction via destructured alias to Array constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      expect(arr.length).assertEqual(0);
      arr.pushOne(33);
      expect(arr[0]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_3200
     * @tc.name testArrayInvoke1032
     * @tc.desc Verify no-arg constructed array pushOne sets length to 1 and element correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      arr.pushOne(5);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_3300
     * @tc.name testArrayInvoke1033
     * @tc.desc Verify no-arg constructed array has initial length of 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_3400
     * @tc.name testArrayInvoke1034
     * @tc.desc Verify shrinkTo and extendTo operations on no-arg constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      arr.pushOne(1);
      arr.pushOne(2);
      arr.pushOne(3);
      expect(arr.length).assertEqual(3);
      arr.shrinkTo(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1);
      arr.extendTo(3, 0);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_3500
     * @tc.name testArrayInvoke1035
     * @tc.desc Verify multi-reference: modify no-arg array through one alias does not affect other independent arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>();
      const arr2 = new Array<int>();
      arr1.pushOne(10);
      arr2.pushOne(20);
      const alias = arr1;
      alias.pushOne(30);
      expect(arr1.length).assertEqual(2);
      expect(arr1[1]).assertEqual(30);
      expect(arr2.length).assertEqual(1);
      expect(arr2[0]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_3600
     * @tc.name testArrayInvoke1036
     * @tc.desc Verify high-throughput create push pop check cycle on no-arg arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        const arr = new Array<int>();
        arr.pushOne(i);
        arr.pushOne(i * 2);
        const v = arr.pop();
        expect(v).assertEqual(i * 2);
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_3700
     * @tc.name testArrayInvoke1037
     * @tc.desc Verify no-arg constructed array can pushOne 7 and access element at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      expect(arr.length).assertEqual(0);
      arr.pushOne(7);
      expect(arr[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_3800
     * @tc.name testArrayInvoke1038
     * @tc.desc Verify no-arg construction of class with array field accessed through inheritance chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Invoke1Child();
      expect(obj.arr.length).assertEqual(0);
      obj.arr.pushOne(999);
      expect(obj.arr[0]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_3900
     * @tc.name testArrayInvoke1039
     * @tc.desc Verify Array.isArray returns true for no-arg constructed arrays of various types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const iArr = new Array<int>();
      const sArr = new Array<string>();
      const dArr = new Array<double>();
      const bArr = new Array<boolean>();
      expect(Array.isArray(iArr)).assertTrue();
      expect(Array.isArray(sArr)).assertTrue();
      expect(Array.isArray(dArr)).assertTrue();
      expect(Array.isArray(bArr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_4000
     * @tc.name testArrayInvoke1040
     * @tc.desc Verify copyWithin on no-arg constructed empty array is a no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      const result = arr.copyWithin(0, 0, 0);
      expect(result.length).assertEqual(0);
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_4100
     * @tc.name testArrayInvoke1041
     * @tc.desc Verify splice on no-arg constructed empty array inserts elements correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      arr.splice(0, 0, 1, 2, 3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_4200
     * @tc.name testArrayInvoke1042
     * @tc.desc Verify reverse on no-arg constructed array reverses elements correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      arr.pushOne(1);
      arr.pushOne(2);
      arr.pushOne(3);
      arr.reverse();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(3);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_4300
     * @tc.name testArrayInvoke1043
     * @tc.desc Verify sort on no-arg constructed array sorts elements correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      arr.pushOne(3);
      arr.pushOne(1);
      arr.pushOne(2);
      arr.sort();
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_4400
     * @tc.name testArrayInvoke1044
     * @tc.desc Verify toString on no-arg constructed empty array returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      expect(arr.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_4500
     * @tc.name testArrayInvoke1045
     * @tc.desc Verify toLocaleString on no-arg constructed empty array returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      expect(arr.toLocaleString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_4600
     * @tc.name testArrayInvoke1046
     * @tc.desc Verify Object.is returns false for two distinct no-arg constructed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>();
      const arr2 = new Array<int>();
      expect(arr1 !== arr2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_4700
     * @tc.name testArrayInvoke1047
     * @tc.desc Verify Array.isArray on no-arg arrays of union and object types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const uArr = new Array<int | string>();
      const oArr = new Array<Invoke1Item>();
      expect(Array.isArray(uArr)).assertTrue();
      expect(Array.isArray(oArr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_4800
     * @tc.name testArrayInvoke1048
     * @tc.desc Verify Class reflection on no-arg constructed array returns Array type name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      const typeName = Class.of(arr).getName().split('.');
      expect(typeName[typeName.length - 1]).assertEqual('Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_4900
     * @tc.name testArrayInvoke1049
     * @tc.desc Verify interleaved create push pop across multiple no-arg arrays maintains state isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>();
      const b = new Array<int>();
      const c = new Array<int>();
      a.pushOne(1);
      b.pushOne(2);
      c.pushOne(3);
      expect(a.pop()).assertEqual(1);
      b.pushOne(4);
      c.pushOne(5);
      expect(a.length).assertEqual(0);
      expect(b.length).assertEqual(2);
      expect(b[1]).assertEqual(4);
      expect(c.length).assertEqual(2);
      expect(c[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_5000
     * @tc.name testArrayInvoke1050
     * @tc.desc Verify fill and subsequent mutation on no-arg constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      arr.pushOne(0);
      arr.pushOne(0);
      arr.pushOne(0);
      arr.fill(5);
      expect(arr[0]).assertEqual(5);
      expect(arr[2]).assertEqual(5);
      arr[1] = 99;
      expect(arr[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_5100
     * @tc.name testArrayInvoke1051
     * @tc.desc Verify custom class with own static $_invoke does not interfere with Array.$_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Invoke1CustomStatic.$_invoke();
      expect(result).assertEqual(42);
      const arr = new Array<int>();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_5200
     * @tc.name testArrayInvoke1052
     * @tc.desc Verify high-throughput mixed operations at scale on no-arg constructed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayInvoke1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 500; i++) {
        const a = new Array<int>();
        const b = new Array<int>();
        const c = new Array<int>();
        a.pushOne(i);
        b.pushOne(i * 10);
        c.pushOne(i * 100);
        expect(a[0]).assertEqual(i);
        expect(b[0]).assertEqual(i * 10);
        expect(c[0]).assertEqual(i * 100);
        const avg = (a[0] + b[0] + c[0]) / 3;
        expect(avg).assertEqual(i * 37);
      }
    });
  });
}