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


import { beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';
import * as Utils from '../utils/TestUtils';

// ============================================================================
// Sendable 等价替代类型定义
// ============================================================================
/** 替代 object_complex（索引签名）→ Map<string, number> */

/** 替代 object_normal: { name: "test", age: 20 } */
@Sendable
class NormalObj {
  name: string;
  age: number;
  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

/** 替代 object_empty: {} */
@Sendable
class EmptyObj {
  constructor() {}
}

// ============================================================================
// 继承测试子类定义
// ============================================================================

/** 基础继承 — 添加自定义方法 */
@Sendable
class RecoveryMySet<T> extends collections.Set<T> {
  constructor() {
    try {
      super();
    } catch (e) {
      throw new Error('RecoveryMySet constructor failed: ' + e);
    }
  }
  customMethod(): string { return 'custom'; }
  getSize(): number { return this.size; }
}

/** 重写 forEach */
@Sendable
class LoggingSet extends collections.Set<number> {
  constructor() {
    try {
      super();
    } catch (e) {
      throw new Error('LoggingSet constructor failed: ' + e);
    }
  }
  forEach(callbackFn: (value: number, value2: number, set: collections.Set<number>) => void): void {
    console.info('LoggingSet forEach called');
    super.forEach(callbackFn);
  }
}

/** constructor 继承 — 通过 if/else 分支收窄类型，分别匹配两个 super 重载 */
@Sendable
class SubSetWithConstructor extends collections.Set<number> {
  constructor(values?: Iterable<number>) {
    try {
      if (values === undefined) {
        super();
      } else {
        super(values);
      }
    } catch (e) {
      throw new Error('SubSetWithConstructor constructor failed: ' + e);
    }
  }
}

/** 泛型继承 — 添加自定义泛型方法 */
@Sendable
class GenericSubSet<T> extends collections.Set<T> {
  constructor() {
    try {
      super();
    } catch (e) {
      throw new Error('GenericSubSet constructor failed: ' + e);
    }
  }
  count(): number { return this.size; }
  hasAll(values: collections.Array<T>): boolean {
    let all: boolean = true;
    for (let i: number = 0; i < values.length; i++) {
      if (!this.has(values[i])) { all = false; }
    }
    return all;
  }
}

/** 多态用子类 */
@Sendable
class ExtendedSet extends collections.Set<number> {
  constructor() {
    try {
      super();
    } catch (e) {
      throw new Error('ExtendedSet constructor failed: ' + e);
    }
  }
}

/** instanceof 检测用子类 */
@Sendable
class DerivedSet extends collections.Set<number> {
  constructor() {
    try {
      super();
    } catch (e) {
      throw new Error('DerivedSet constructor failed: ' + e);
    }
  }
}

// 多态辅助函数
function processSet(set: collections.Set<number>): number {
  let sum: number = 0;
  set.forEach((v: number): void => { sum = sum + v; });
  return sum;
}

export default function collectionsSetInheritanceAndSendableTypesTest() {
  describe('collectionsSetInheritanceAndSendableTypesTest', (): void => {

    beforeEach(async () => {
      await Utils.sleep(50);
    });

    // ========================================================================
    // 一、继承测试
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_INHERITANCE_0100
     * @tc.name   testSetSendableInheritance0001
     * @tc.desc   Verify @Sendable class extends collections.Set — basic inheritance with custom method
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableInheritance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableInheritance0001';
      console.info(`[${caseName}] start`);
      let mySet = new RecoveryMySet<number>();
      expect(mySet instanceof collections.Set).assertTrue();
      expect(mySet instanceof RecoveryMySet).assertTrue();
      expect(mySet.size).assertEqual(0);
      mySet.add(1); mySet.add(2); mySet.add(3);
      expect(mySet.size).assertEqual(3);
      expect(mySet.has(2)).assertTrue();
      expect(mySet.has(999)).assertFalse();
      let count: number = 0;
      mySet.forEach((_v: number): void => { count++; });
      expect(count).assertEqual(3);
      expect(mySet.customMethod()).assertEqual('custom');
      expect(mySet.getSize()).assertEqual(3);
      mySet.delete(1);
      expect(mySet.size).assertEqual(2);
      mySet.clear();
      expect(mySet.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_INHERITANCE_0200
     * @tc.name   testSetSendableInheritance0002
     * @tc.desc   Verify @Sendable class extends collections.Set — override forEach method
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableInheritance0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableInheritance0002';
      console.info(`[${caseName}] start`);
      let logSet = new LoggingSet();
      logSet.add(1); logSet.add(2); logSet.add(3);
      let count: number = 0;
      logSet.forEach((_v: number): void => { count++; });
      expect(count).assertEqual(3);
      expect(logSet.size).assertEqual(3);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_INHERITANCE_0300
     * @tc.name   testSetSendableInheritance0003
     * @tc.desc   Verify @Sendable class extends collections.Set — instanceof detection
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableInheritance0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableInheritance0003';
      console.info(`[${caseName}] start`);
      let baseSet = new collections.Set<number>();
      expect(baseSet instanceof collections.Set).assertTrue();
      let derived = new DerivedSet();
      derived.add(10);
      expect(derived instanceof collections.Set).assertTrue();
      expect(derived instanceof DerivedSet).assertTrue();
      expect(derived.has(10)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_INHERITANCE_0400
     * @tc.name   testSetSendableInheritance0004
     * @tc.desc   Verify @Sendable class extends collections.Set — polymorphism
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableInheritance0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableInheritance0004';
      console.info(`[${caseName}] start`);
      let baseSet = new collections.Set<number>();
      baseSet.add(1); baseSet.add(2);
      expect(processSet(baseSet)).assertEqual(3);
      let extSet = new ExtendedSet();
      extSet.add(3); extSet.add(4); extSet.add(5);
      expect(processSet(extSet)).assertEqual(12);
      let parentRef: collections.Set<number> = extSet;
      parentRef.add(6);
      expect(extSet.has(6)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_INHERITANCE_0500
     * @tc.name   testSetSendableInheritance0005
     * @tc.desc   Verify @Sendable class extends collections.Set — constructor inheriting with values
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableInheritance0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableInheritance0005';
      console.info(`[${caseName}] start`);
      let fromArr = new SubSetWithConstructor([1, 2, 3]);
      expect(fromArr.size).assertEqual(3);
      expect(fromArr.has(1)).assertTrue();
      expect(fromArr.has(2)).assertTrue();
      expect(fromArr.has(3)).assertTrue();
      let fromSet = new SubSetWithConstructor(fromArr);
      expect(fromSet.size).assertEqual(3);
      expect(fromSet.has(1)).assertTrue();
      let empty = new SubSetWithConstructor();
      expect(empty.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_INHERITANCE_0600
     * @tc.name   testSetSendableInheritance0006
     * @tc.desc   Verify @Sendable class extends collections.Set — generic inheritance with custom generic methods
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableInheritance0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableInheritance0006';
      console.info(`[${caseName}] start`);
      let strSet = new GenericSubSet<string>();
      strSet.add('a'); strSet.add('b'); strSet.add('c');
      expect(strSet.count()).assertEqual(3);
      let checks: collections.Array<string> = new collections.Array<string>('a', 'b');
      expect(strSet.hasAll(checks)).assertTrue();
      let numSet = new GenericSubSet<number>();
      numSet.add(10); numSet.add(20); numSet.add(30);
      expect(numSet.count()).assertEqual(3);
      expect(numSet.has(20)).assertTrue();
      expect(numSet.has(99)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_INHERITANCE_0700
     * @tc.name   testSetSendableInheritance0007
     * @tc.desc   Verify @Sendable class extends collections.Set — multi-type MySet usage with NormalObj
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableInheritance0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableInheritance0007';
      console.info(`[${caseName}] start`);
      let objSet = new RecoveryMySet<NormalObj>();
      let obj = new NormalObj('test', 42);
      objSet.add(obj);
      expect(objSet.size).assertEqual(1);
      expect(objSet.has(obj)).assertTrue();
      expect(objSet.customMethod()).assertEqual('custom');
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_INHERITANCE_0800
     * @tc.name   testSetSendableInheritance0008
     * @tc.desc   Verify @Sendable class extends collections.Set — mixed types with RecoveryMySet union
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableInheritance0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableInheritance0008';
      console.info(`[${caseName}] start`);
      let mixed = new RecoveryMySet<NormalObj | collections.Array<number> | collections.Map<string, number>>();
      let obj = new NormalObj('x', 1);
      let arr = new collections.Array<number>(100, 200);
      let map = new collections.Map<string, number>();
      map.set('k', 999);
      mixed.add(obj); mixed.add(arr); mixed.add(map);
      expect(mixed.size).assertEqual(3);
      expect(mixed.has(obj)).assertTrue();
      expect(mixed.has(arr)).assertTrue();
      expect(mixed.has(map)).assertTrue();
      let count: number = 0;
      mixed.forEach((_v: NormalObj | collections.Array<number> | collections.Map<string, number>): void => { count++; });
      expect(count).assertEqual(3);
      expect(mixed.customMethod()).assertEqual('custom');
      console.info(`[${caseName}] end`);
      done();
    });

    // ========================================================================
    // 二、复合类型 — constructor(iterable)
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_0100
     * @tc.name   testSetSendableConstructor0001
     * @tc.desc   Verify constructor(iterable) with NormalObj — creates Set from array of @Sendable class instances
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableConstructor0001';
      console.info(`[${caseName}] start`);
      let obj1 = new NormalObj('test', 20);
      let obj2 = new NormalObj('test', 20);
      let set = new collections.Set<NormalObj>([obj1, obj2]);
      expect(set.size).assertEqual(2);
      expect(set.has(obj1)).assertTrue();
      expect(set.has(obj2)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_0200
     * @tc.name   testSetSendableConstructor0002
     * @tc.desc   Verify constructor(iterable) with EmptyObj — creates Set from array of empty @Sendable class instances
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableConstructor0002';
      console.info(`[${caseName}] start`);
      let e1 = new EmptyObj();
      let e2 = new EmptyObj();
      let set = new collections.Set<EmptyObj>([e1, e2]);
      expect(set.size).assertEqual(2);
      expect(set.has(e1)).assertTrue();
      expect(set.has(e2)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_0300
     * @tc.name   testSetSendableConstructor0003
     * @tc.desc   Verify constructor(iterable) with collections.Map — creates Set containing nested Map
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableConstructor0003';
      console.info(`[${caseName}] start`);
      let m1 = new collections.Map<string, number>();
      m1.set('x', 10);
      let m2 = new collections.Map<string, number>();
      m2.set('y', 20);
      let set = new collections.Set<collections.Map<string, number>>([m1, m2]);
      expect(set.size).assertEqual(2);
      expect(set.has(m1)).assertTrue();
      expect(set.has(m2)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_0400
     * @tc.name   testSetSendableConstructor0004
     * @tc.desc   Verify constructor(iterable) with collections.Array<number> — creates Set containing nested Array
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableConstructor0004';
      console.info(`[${caseName}] start`);
      let a1 = new collections.Array<number>(1, 2, 3);
      let a2 = new collections.Array<number>(4, 5, 6);
      let set = new collections.Set<collections.Array<number>>([a1, a2]);
      expect(set.size).assertEqual(2);
      expect(set.has(a1)).assertTrue();
      expect(set.has(a2)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_0500
     * @tc.name   testSetSendableConstructor0005
     * @tc.desc   Verify constructor(iterable) with empty collections.Array — creates Set containing empty Array instances
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableConstructor0005';
      console.info(`[${caseName}] start`);
      let ea1 = new collections.Array<number>();
      let ea2 = new collections.Array<number>();
      let set = new collections.Set<collections.Array<number>>([ea1, ea2]);
      expect(set.size).assertEqual(2);
      expect(set.has(ea1)).assertTrue();
      expect(set.has(ea2)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_0600
     * @tc.name   testSetSendableConstructor0006
     * @tc.desc   Verify constructor(iterable) with sparse-simulated collections.Array<number|undefined>
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableConstructor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableConstructor0006';
      console.info(`[${caseName}] start`);
      let sa1 = new collections.Array<number | undefined>();
      sa1.push(1); sa1.push(undefined); sa1.push(3);
      let sa2 = new collections.Array<number | undefined>();
      sa2.push(undefined); sa2.push(2);
      let set = new collections.Set<collections.Array<number | undefined>>([sa1, sa2]);
      expect(set.size).assertEqual(2);
      expect(set.has(sa1)).assertTrue();
      expect(set.has(sa2)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    // ========================================================================
    // 三、复合类型 — constructor(values)
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_0700
     * @tc.name   testSetSendableConstructor0007
     * @tc.desc   Verify constructor(values) with NormalObj — creates Set from another Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableConstructor0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableConstructor0007';
      console.info(`[${caseName}] start`);
      let obj = new NormalObj('a', 1);
      let src = new collections.Set<NormalObj>();
      src.add(obj);
      let set = new collections.Set<NormalObj>(src);
      expect(set.size).assertEqual(1);
      expect(set.has(obj)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_0800
     * @tc.name   testSetSendableConstructor0008
     * @tc.desc   Verify constructor(values) with EmptyObj — creates Set from another Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableConstructor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableConstructor0008';
      console.info(`[${caseName}] start`);
      let e = new EmptyObj();
      let src = new collections.Set<EmptyObj>();
      src.add(e);
      let set = new collections.Set<EmptyObj>(src);
      expect(set.size).assertEqual(1);
      expect(set.has(e)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_0900
     * @tc.name   testSetSendableConstructor0009
     * @tc.desc   Verify constructor(values) with collections.Map — creates Set from another Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableConstructor0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableConstructor0009';
      console.info(`[${caseName}] start`);
      let m = new collections.Map<string, number>();
      m.set('k', 100);
      let src = new collections.Set<collections.Map<string, number>>();
      src.add(m);
      let set = new collections.Set<collections.Map<string, number>>(src);
      expect(set.size).assertEqual(1);
      expect(set.has(m)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_1000
     * @tc.name   testSetSendableConstructor0010
     * @tc.desc   Verify constructor(values) with collections.Array<number> — creates Set from another Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableConstructor0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableConstructor0010';
      console.info(`[${caseName}] start`);
      let a = new collections.Array<number>(1, 2, 3);
      let src = new collections.Set<collections.Array<number>>();
      src.add(a);
      let set = new collections.Set<collections.Array<number>>(src);
      expect(set.size).assertEqual(1);
      expect(set.has(a)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_1100
     * @tc.name   testSetSendableConstructor0011
     * @tc.desc   Verify constructor(values) with empty collections.Array — creates Set from another Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableConstructor0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableConstructor0011';
      console.info(`[${caseName}] start`);
      let ea = new collections.Array<number>();
      let src = new collections.Set<collections.Array<number>>();
      src.add(ea);
      let set = new collections.Set<collections.Array<number>>(src);
      expect(set.size).assertEqual(1);
      expect(set.has(ea)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_1200
     * @tc.name   testSetSendableConstructor0012
     * @tc.desc   Verify constructor(values) with sparse-simulated Array — creates Set from another Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableConstructor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableConstructor0012';
      console.info(`[${caseName}] start`);
      let sa = new collections.Array<number | undefined>();
      sa.push(1); sa.push(undefined); sa.push(3);
      let src = new collections.Set<collections.Array<number | undefined>>();
      src.add(sa);
      let set = new collections.Set<collections.Array<number | undefined>>(src);
      expect(set.size).assertEqual(1);
      expect(set.has(sa)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    // ========================================================================
    // 四、复合类型 — forEach
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_1300
     * @tc.name   testSetSendableForEach0001
     * @tc.desc   Verify forEach with NormalObj — traverses @Sendable class instances by reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableForEach0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableForEach0001';
      console.info(`[${caseName}] start`);
      let obj = new NormalObj('test', 20);
      let set = new collections.Set<NormalObj>();
      set.add(obj);
      let count: number = 0;
      set.forEach((value: NormalObj, key: NormalObj): void => {
        expect(value.name).assertEqual('test');
        expect(value.age).assertEqual(20);
        expect(key).assertEqual(value);
        count++;
      });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_1400
     * @tc.name   testSetSendableForEach0002
     * @tc.desc   Verify forEach with EmptyObj — traverses empty @Sendable class instances
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableForEach0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableForEach0002';
      console.info(`[${caseName}] start`);
      let e = new EmptyObj();
      let set = new collections.Set<EmptyObj>();
      set.add(e);
      let count: number = 0;
      set.forEach((value: EmptyObj, key: EmptyObj): void => {
        expect(key).assertEqual(value);
        count++;
      });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_1500
     * @tc.name   testSetSendableForEach0003
     * @tc.desc   Verify forEach with collections.Map — traverses nested Map instances
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableForEach0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableForEach0003';
      console.info(`[${caseName}] start`);
      let m = new collections.Map<string, number>();
      m.set('x', 10);
      let set = new collections.Set<collections.Map<string, number>>();
      set.add(m);
      let count: number = 0;
      set.forEach((value: collections.Map<string, number>, key: collections.Map<string, number>): void => {
        expect(value.get('x')).assertEqual(10);
        expect(key).assertEqual(value);
        count++;
      });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_1600
     * @tc.name   testSetSendableForEach0004
     * @tc.desc   Verify forEach with collections.Array<number> — traverses nested Array instances
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableForEach0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableForEach0004';
      console.info(`[${caseName}] start`);
      let a = new collections.Array<number>(1, 2, 3);
      let set = new collections.Set<collections.Array<number>>();
      set.add(a);
      let count: number = 0;
      set.forEach((value: collections.Array<number>, key: collections.Array<number>): void => {
        expect(value.length).assertEqual(3);
        expect(value[0]).assertEqual(1);
        expect(key).assertEqual(value);
        count++;
      });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_1700
     * @tc.name   testSetSendableForEach0005
     * @tc.desc   Verify forEach with empty collections.Array — traverses empty nested Array instances
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableForEach0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableForEach0005';
      console.info(`[${caseName}] start`);
      let ea = new collections.Array<number>();
      let set = new collections.Set<collections.Array<number>>();
      set.add(ea);
      let count: number = 0;
      set.forEach((value: collections.Array<number>, key: collections.Array<number>): void => {
        expect(value.length).assertEqual(0);
        expect(key).assertEqual(value);
        count++;
      });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_1800
     * @tc.name   testSetSendableForEach0006
     * @tc.desc   Verify forEach with sparse-simulated Array — traverses Array<number|undefined>
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableForEach0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableForEach0006';
      console.info(`[${caseName}] start`);
      let sa = new collections.Array<number | undefined>();
      sa.push(1); sa.push(undefined); sa.push(3);
      let set = new collections.Set<collections.Array<number | undefined>>();
      set.add(sa);
      let count: number = 0;
      set.forEach((value: collections.Array<number | undefined>, key: collections.Array<number | undefined>): void => {
        expect(value.length).assertEqual(3);
        expect(value[0]).assertEqual(1);
        expect(value[1]).assertEqual(undefined);
        expect(value[2]).assertEqual(3);
        expect(key).assertEqual(value);
        count++;
      });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });

    // ========================================================================
    // 五、复合类型 — entries
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_1900
     * @tc.name   testSetSendableEntries0001
     * @tc.desc   Verify entries with NormalObj — returns [value, value] pairs for @Sendable class instances
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableEntries0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableEntries0001';
      console.info(`[${caseName}] start`);
      let obj = new NormalObj('test', 20);
      let set = new collections.Set<NormalObj>();
      set.add(obj);
      let iter: IterableIterator<[NormalObj, NormalObj]> = set.entries();
      let entry: IteratorResult<[NormalObj, NormalObj]> = iter.next();
      expect(entry.value[0]).assertEqual(obj);
      expect(entry.value[1]).assertEqual(obj);
      expect(entry.done).assertFalse();
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_2000
     * @tc.name   testSetSendableEntries0002
     * @tc.desc   Verify entries with EmptyObj — returns [value, value] pairs for empty class instances
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableEntries0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableEntries0002';
      console.info(`[${caseName}] start`);
      let e = new EmptyObj();
      let set = new collections.Set<EmptyObj>();
      set.add(e);
      let iter: IterableIterator<[EmptyObj, EmptyObj]> = set.entries();
      let entry: IteratorResult<[EmptyObj, EmptyObj]> = iter.next();
      expect(entry.value[0]).assertEqual(e);
      expect(entry.value[1]).assertEqual(e);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_2100
     * @tc.name   testSetSendableEntries0003
     * @tc.desc   Verify entries with collections.Map — returns [value, value] pairs for nested Map
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableEntries0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableEntries0003';
      console.info(`[${caseName}] start`);
      let m = new collections.Map<string, number>();
      m.set('k', 666);
      let set = new collections.Set<collections.Map<string, number>>();
      set.add(m);
      let iter: IterableIterator<[collections.Map<string, number>, collections.Map<string, number>]> = set.entries();
      let entry: IteratorResult<[collections.Map<string, number>, collections.Map<string, number>]> = iter.next();
      expect(entry.value[0]).assertEqual(m);
      expect(entry.value[1]).assertEqual(m);
      expect(entry.value[0].get('k')).assertEqual(666);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_2200
     * @tc.name   testSetSendableEntries0004
     * @tc.desc   Verify entries with collections.Array<number> — returns [value, value] pairs for nested Array
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableEntries0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableEntries0004';
      console.info(`[${caseName}] start`);
      let a = new collections.Array<number>(1, 2, 3);
      let set = new collections.Set<collections.Array<number>>();
      set.add(a);
      let iter: IterableIterator<[collections.Array<number>, collections.Array<number>]> = set.entries();
      let entry: IteratorResult<[collections.Array<number>, collections.Array<number>]> = iter.next();
      expect(entry.value[0]).assertEqual(a);
      expect(entry.value[1]).assertEqual(a);
      expect(entry.value[0].length).assertEqual(3);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_2300
     * @tc.name   testSetSendableEntries0005
     * @tc.desc   Verify entries with empty collections.Array — returns [value, value] for empty nested Array
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableEntries0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableEntries0005';
      console.info(`[${caseName}] start`);
      let ea = new collections.Array<number>();
      let set = new collections.Set<collections.Array<number>>();
      set.add(ea);
      let iter: IterableIterator<[collections.Array<number>, collections.Array<number>]> = set.entries();
      let entry: IteratorResult<[collections.Array<number>, collections.Array<number>]> = iter.next();
      expect(entry.value[0]).assertEqual(ea);
      expect(entry.value[1]).assertEqual(ea);
      expect(entry.value[0].length).assertEqual(0);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_2400
     * @tc.name   testSetSendableEntries0006
     * @tc.desc   Verify entries with sparse-simulated Array — returns [value, value] pairs
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableEntries0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableEntries0006';
      console.info(`[${caseName}] start`);
      let sa = new collections.Array<number | undefined>();
      sa.push(1); sa.push(undefined); sa.push(3);
      let set = new collections.Set<collections.Array<number | undefined>>();
      set.add(sa);
      let iter: IterableIterator<[collections.Array<number
        | undefined>, collections.Array<number | undefined>]> = set.entries();
      let entry: IteratorResult<[collections.Array<number
        | undefined>, collections.Array<number | undefined>]> = iter.next();
      expect(entry.value[0]).assertEqual(sa);
      expect(entry.value[1]).assertEqual(sa);
      expect(entry.value[0].length).assertEqual(3);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    // ========================================================================
    // 六、复合类型 — keys
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_2500
     * @tc.name   testSetSendableKeys0001
     * @tc.desc   Verify keys with NormalObj — returns @Sendable class instances
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableKeys0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableKeys0001';
      console.info(`[${caseName}] start`);
      let obj = new NormalObj('k', 1);
      let set = new collections.Set<NormalObj>();
      set.add(obj);
      let iter: IterableIterator<NormalObj> = set.keys();
      let k: IteratorResult<NormalObj> = iter.next();
      expect(k.value).assertEqual(obj);
      expect(k.value.name).assertEqual('k');
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_2600
     * @tc.name   testSetSendableKeys0002
     * @tc.desc   Verify keys with EmptyObj — returns empty class instances
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableKeys0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableKeys0002';
      console.info(`[${caseName}] start`);
      let e = new EmptyObj();
      let set = new collections.Set<EmptyObj>();
      set.add(e);
      let iter: IterableIterator<EmptyObj> = set.keys();
      let k: IteratorResult<EmptyObj> = iter.next();
      expect(k.value).assertEqual(e);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_2700
     * @tc.name   testSetSendableKeys0003
     * @tc.desc   Verify keys with collections.Map — returns nested Map instances
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableKeys0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableKeys0003';
      console.info(`[${caseName}] start`);
      let m = new collections.Map<string, number>();
      m.set('y', 888);
      let set = new collections.Set<collections.Map<string, number>>();
      set.add(m);
      let iter: IterableIterator<collections.Map<string, number>> = set.keys();
      let k: IteratorResult<collections.Map<string, number>> = iter.next();
      expect(k.value).assertEqual(m);
      expect(k.value.get('y')).assertEqual(888);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_2800
     * @tc.name   testSetSendableKeys0004
     * @tc.desc   Verify keys with collections.Array<number> — returns nested Array instances
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableKeys0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableKeys0004';
      console.info(`[${caseName}] start`);
      let a = new collections.Array<number>(1, 2, 3);
      let set = new collections.Set<collections.Array<number>>();
      set.add(a);
      let iter: IterableIterator<collections.Array<number>> = set.keys();
      let k: IteratorResult<collections.Array<number>> = iter.next();
      expect(k.value).assertEqual(a);
      expect(k.value.length).assertEqual(3);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_2900
     * @tc.name   testSetSendableKeys0005
     * @tc.desc   Verify keys with empty collections.Array — returns empty nested Array
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableKeys0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableKeys0005';
      console.info(`[${caseName}] start`);
      let ea = new collections.Array<number>();
      let set = new collections.Set<collections.Array<number>>();
      set.add(ea);
      let iter: IterableIterator<collections.Array<number>> = set.keys();
      let k: IteratorResult<collections.Array<number>> = iter.next();
      expect(k.value).assertEqual(ea);
      expect(k.value.length).assertEqual(0);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_3000
     * @tc.name   testSetSendableKeys0006
     * @tc.desc   Verify keys with sparse-simulated Array — returns Array<number|undefined>
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableKeys0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableKeys0006';
      console.info(`[${caseName}] start`);
      let sa = new collections.Array<number | undefined>();
      sa.push(1); sa.push(undefined); sa.push(3);
      let set = new collections.Set<collections.Array<number | undefined>>();
      set.add(sa);
      let iter: IterableIterator<collections.Array<number | undefined>> = set.keys();
      let k: IteratorResult<collections.Array<number | undefined>> = iter.next();
      expect(k.value).assertEqual(sa);
      expect(k.value.length).assertEqual(3);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    // ========================================================================
    // 七、复合类型 — values
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_3100
     * @tc.name   testSetSendableValues0001
     * @tc.desc   Verify values with NormalObj — returns @Sendable class instances
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableValues0001';
      console.info(`[${caseName}] start`);
      let obj = new NormalObj('v', 99);
      let set = new collections.Set<NormalObj>();
      set.add(obj);
      let iter: IterableIterator<NormalObj> = set.values();
      let v: IteratorResult<NormalObj> = iter.next();
      expect(v.value).assertEqual(obj);
      expect(v.value.name).assertEqual('v');
      expect(v.value.age).assertEqual(99);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_3200
     * @tc.name   testSetSendableValues0002
     * @tc.desc   Verify values with EmptyObj — returns empty class instances
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableValues0002';
      console.info(`[${caseName}] start`);
      let e = new EmptyObj();
      let set = new collections.Set<EmptyObj>();
      set.add(e);
      let iter: IterableIterator<EmptyObj> = set.values();
      let v: IteratorResult<EmptyObj> = iter.next();
      expect(v.value).assertEqual(e);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_3300
     * @tc.name   testSetSendableValues0003
     * @tc.desc   Verify values with collections.Map — returns nested Map instances
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableValues0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableValues0003';
      console.info(`[${caseName}] start`);
      let m = new collections.Map<string, number>();
      m.set('mapKey', 777);
      let set = new collections.Set<collections.Map<string, number>>();
      set.add(m);
      let iter: IterableIterator<collections.Map<string, number>> = set.values();
      let v: IteratorResult<collections.Map<string, number>> = iter.next();
      expect(v.value).assertEqual(m);
      expect(v.value.get('mapKey')).assertEqual(777);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_3400
     * @tc.name   testSetSendableValues0004
     * @tc.desc   Verify values with collections.Array<number> — returns nested Array instances
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableValues0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableValues0004';
      console.info(`[${caseName}] start`);
      let a = new collections.Array<number>(10, 20, 30);
      let set = new collections.Set<collections.Array<number>>();
      set.add(a);
      let iter: IterableIterator<collections.Array<number>> = set.values();
      let v: IteratorResult<collections.Array<number>> = iter.next();
      expect(v.value).assertEqual(a);
      expect(v.value[0]).assertEqual(10);
      expect(v.value[2]).assertEqual(30);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_3500
     * @tc.name   testSetSendableValues0005
     * @tc.desc   Verify values with empty collections.Array — returns empty nested Array
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableValues0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableValues0005';
      console.info(`[${caseName}] start`);
      let ea = new collections.Array<number>();
      let set = new collections.Set<collections.Array<number>>();
      set.add(ea);
      let iter: IterableIterator<collections.Array<number>> = set.values();
      let v: IteratorResult<collections.Array<number>> = iter.next();
      expect(v.value).assertEqual(ea);
      expect(v.value.length).assertEqual(0);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_3600
     * @tc.name   testSetSendableValues0006
     * @tc.desc   Verify values with sparse-simulated Array — returns Array<number|undefined>
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableValues0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableValues0006';
      console.info(`[${caseName}] start`);
      let sa = new collections.Array<number | undefined>();
      sa.push(1); sa.push(undefined); sa.push(3);
      let set = new collections.Set<collections.Array<number | undefined>>();
      set.add(sa);
      let iter: IterableIterator<collections.Array<number | undefined>> = set.values();
      let v: IteratorResult<collections.Array<number | undefined>> = iter.next();
      expect(v.value).assertEqual(sa);
      expect(v.value[0]).assertEqual(1);
      expect(v.value[1]).assertEqual(undefined);
      expect(v.value[2]).assertEqual(3);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    // ========================================================================
    // 八、复合类型 — add
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_3700
     * @tc.name   testSetSendableAdd0001
     * @tc.desc   Verify add with NormalObj — adds @Sendable class instance, same-value different instances are distinct
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableAdd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableAdd0001';
      console.info(`[${caseName}] start`);
      let obj1 = new NormalObj('x', 1);
      let obj2 = new NormalObj('x', 1);
      let set = new collections.Set<NormalObj>();
      set.add(obj1);
      expect(set.size).assertEqual(1);
      set.add(obj2);
      expect(set.size).assertEqual(2);
      set.add(obj1);
      expect(set.size).assertEqual(2);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_3800
     * @tc.name   testSetSendableAdd0002
     * @tc.desc   Verify add with EmptyObj — adds empty class instance, reference semantics
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableAdd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableAdd0002';
      console.info(`[${caseName}] start`);
      let e1 = new EmptyObj();
      let e2 = new EmptyObj();
      let set = new collections.Set<EmptyObj>();
      set.add(e1);
      set.add(e2);
      expect(set.size).assertEqual(2);
      set.add(e1);
      expect(set.size).assertEqual(2);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_3900
     * @tc.name   testSetSendableAdd0003
     * @tc.desc   Verify add with collections.Map — adds nested Map, same content different instances are distinct
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableAdd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableAdd0003';
      console.info(`[${caseName}] start`);
      let m1 = new collections.Map<string, number>();
      m1.set('a', 1);
      let m2 = new collections.Map<string, number>();
      m2.set('a', 1);
      let set = new collections.Set<collections.Map<string, number>>();
      set.add(m1);
      set.add(m2);
      expect(set.size).assertEqual(2);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_4000
     * @tc.name   testSetSendableAdd0004
     * @tc.desc   Verify add with collections.Array<number> — adds nested Array, reference semantics
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableAdd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableAdd0004';
      console.info(`[${caseName}] start`);
      let a1 = new collections.Array<number>(1, 2);
      let a2 = new collections.Array<number>(1, 2);
      let set = new collections.Set<collections.Array<number>>();
      set.add(a1);
      set.add(a2);
      expect(set.size).assertEqual(2);
      set.add(a1);
      expect(set.size).assertEqual(2);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_4100
     * @tc.name   testSetSendableAdd0005
     * @tc.desc   Verify add with empty collections.Array — adds empty nested Array, reference semantics
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableAdd0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableAdd0005';
      console.info(`[${caseName}] start`);
      let ea = new collections.Array<number>();
      let set = new collections.Set<collections.Array<number>>();
      set.add(ea);
      expect(set.size).assertEqual(1);
      set.add(ea);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_4200
     * @tc.name   testSetSendableAdd0006
     * @tc.desc   Verify add with sparse-simulated Array — adds Array<number|undefined>
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableAdd0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableAdd0006';
      console.info(`[${caseName}] start`);
      let sa = new collections.Array<number | undefined>();
      sa.push(1); sa.push(undefined); sa.push(3);
      let set = new collections.Set<collections.Array<number | undefined>>();
      set.add(sa);
      expect(set.size).assertEqual(1);
      expect(set.has(sa)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    // ========================================================================
    // 九、复合类型 — has
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_4300
     * @tc.name   testSetSendableHas0001
     * @tc.desc   Verify has with NormalObj — returns true for exact reference, false for same-value different instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableHas0001';
      console.info(`[${caseName}] start`);
      let obj1 = new NormalObj('h', 5);
      let obj2 = new NormalObj('h', 5);
      let set = new collections.Set<NormalObj>();
      set.add(obj1);
      expect(set.has(obj1)).assertTrue();
      expect(set.has(obj2)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_4400
     * @tc.name   testSetSendableHas0002
     * @tc.desc   Verify has with EmptyObj — returns true only for the exact same instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableHas0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableHas0002';
      console.info(`[${caseName}] start`);
      let e1 = new EmptyObj();
      let e2 = new EmptyObj();
      let set = new collections.Set<EmptyObj>();
      set.add(e1);
      expect(set.has(e1)).assertTrue();
      expect(set.has(e2)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_4500
     * @tc.name   testSetSendableHas0003
     * @tc.desc   Verify has with collections.Map — reference semantics for nested Map
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableHas0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableHas0003';
      console.info(`[${caseName}] start`);
      let m1 = new collections.Map<string, number>();
      m1.set('x', 1);
      let m2 = new collections.Map<string, number>();
      m2.set('x', 1);
      let set = new collections.Set<collections.Map<string, number>>();
      set.add(m1);
      expect(set.has(m1)).assertTrue();
      expect(set.has(m2)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_4600
     * @tc.name   testSetSendableHas0004
     * @tc.desc   Verify has with collections.Array<number> — reference semantics for nested Array
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableHas0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableHas0004';
      console.info(`[${caseName}] start`);
      let a1 = new collections.Array<number>(1, 2);
      let a2 = new collections.Array<number>(1, 2);
      let set = new collections.Set<collections.Array<number>>();
      set.add(a1);
      expect(set.has(a1)).assertTrue();
      expect(set.has(a2)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_4700
     * @tc.name   testSetSendableHas0005
     * @tc.desc   Verify has with empty collections.Array — reference semantics for empty nested Array
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableHas0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableHas0005';
      console.info(`[${caseName}] start`);
      let ea1 = new collections.Array<number>();
      let ea2 = new collections.Array<number>();
      let set = new collections.Set<collections.Array<number>>();
      set.add(ea1);
      expect(set.has(ea1)).assertTrue();
      expect(set.has(ea2)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_4800
     * @tc.name   testSetSendableHas0006
     * @tc.desc   Verify has with sparse-simulated Array — reference semantics
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableHas0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableHas0006';
      console.info(`[${caseName}] start`);
      let sa1 = new collections.Array<number | undefined>();
      sa1.push(1); sa1.push(undefined); sa1.push(3);
      let sa2 = new collections.Array<number | undefined>();
      sa2.push(1); sa2.push(undefined); sa2.push(3);
      let set = new collections.Set<collections.Array<number | undefined>>();
      set.add(sa1);
      expect(set.has(sa1)).assertTrue();
      expect(set.has(sa2)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });

    // ========================================================================
    // 十、复合类型 — delete
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_4900
     * @tc.name   testSetSendableDelete0001
     * @tc.desc   Verify delete with NormalObj — removes by exact reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableDelete0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableDelete0001';
      console.info(`[${caseName}] start`);
      let obj = new NormalObj('d', 99);
      let set = new collections.Set<NormalObj>();
      set.add(obj);
      expect(set.delete(obj)).assertTrue();
      expect(set.size).assertEqual(0);
      expect(set.delete(obj)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_5000
     * @tc.name   testSetSendableDelete0002
     * @tc.desc   Verify delete with EmptyObj — removes by exact reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableDelete0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableDelete0002';
      console.info(`[${caseName}] start`);
      let e = new EmptyObj();
      let set = new collections.Set<EmptyObj>();
      set.add(e);
      expect(set.delete(e)).assertTrue();
      expect(set.has(e)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_5100
     * @tc.name   testSetSendableDelete0003
     * @tc.desc   Verify delete with collections.Map — removes nested Map by reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableDelete0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableDelete0003';
      console.info(`[${caseName}] start`);
      let m = new collections.Map<string, number>();
      m.set('del', 1);
      let set = new collections.Set<collections.Map<string, number>>();
      set.add(m);
      expect(set.size).assertEqual(1);
      expect(set.delete(m)).assertTrue();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_5200
     * @tc.name   testSetSendableDelete0004
     * @tc.desc   Verify delete with collections.Array<number> — removes nested Array by reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableDelete0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableDelete0004';
      console.info(`[${caseName}] start`);
      let a = new collections.Array<number>(1, 2);
      let set = new collections.Set<collections.Array<number>>();
      set.add(a);
      expect(set.delete(a)).assertTrue();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_5300
     * @tc.name   testSetSendableDelete0005
     * @tc.desc   Verify delete with empty collections.Array — removes empty nested Array
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableDelete0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableDelete0005';
      console.info(`[${caseName}] start`);
      let ea = new collections.Array<number>();
      let set = new collections.Set<collections.Array<number>>();
      set.add(ea);
      expect(set.delete(ea)).assertTrue();
      expect(set.has(ea)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_5400
     * @tc.name   testSetSendableDelete0006
     * @tc.desc   Verify delete with sparse-simulated Array — removes by reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableDelete0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableDelete0006';
      console.info(`[${caseName}] start`);
      let sa = new collections.Array<number | undefined>();
      sa.push(1); sa.push(undefined); sa.push(3);
      let set = new collections.Set<collections.Array<number | undefined>>();
      set.add(sa);
      expect(set.delete(sa)).assertTrue();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });

    // ========================================================================
    // 十一、复合类型 — clear
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_5500
     * @tc.name   testSetSendableClear0001
     * @tc.desc   Verify clear with NormalObj — empties Set containing @Sendable class instances
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableClear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableClear0001';
      console.info(`[${caseName}] start`);
      let obj = new NormalObj('c', 1);
      let set = new collections.Set<NormalObj>();
      set.add(obj);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(obj)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_5600
     * @tc.name   testSetSendableClear0002
     * @tc.desc   Verify clear with EmptyObj — empties Set containing empty class instances
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableClear0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableClear0002';
      console.info(`[${caseName}] start`);
      let e = new EmptyObj();
      let set = new collections.Set<EmptyObj>();
      set.add(e);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_5700
     * @tc.name   testSetSendableClear0003
     * @tc.desc   Verify clear with collections.Map — empties Set containing nested Map
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableClear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableClear0003';
      console.info(`[${caseName}] start`);
      let m = new collections.Map<string, number>();
      m.set('c', 0);
      let set = new collections.Set<collections.Map<string, number>>();
      set.add(m);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_5800
     * @tc.name   testSetSendableClear0004
     * @tc.desc   Verify clear with collections.Array<number> — empties Set containing nested Array
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableClear0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableClear0004';
      console.info(`[${caseName}] start`);
      let a = new collections.Array<number>(1, 2, 3);
      let set = new collections.Set<collections.Array<number>>();
      set.add(a);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_5900
     * @tc.name   testSetSendableClear0005
     * @tc.desc   Verify clear with empty collections.Array — empties Set containing empty nested Array
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableClear0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableClear0005';
      console.info(`[${caseName}] start`);
      let ea = new collections.Array<number>();
      let set = new collections.Set<collections.Array<number>>();
      set.add(ea);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_6000
     * @tc.name   testSetSendableClear0006
     * @tc.desc   Verify clear with sparse-simulated Array — empties Set containing Array<number|undefined>
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableClear0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableClear0006';
      console.info(`[${caseName}] start`);
      let sa = new collections.Array<number | undefined>();
      sa.push(1); sa.push(undefined); sa.push(3);
      let set = new collections.Set<collections.Array<number | undefined>>();
      set.add(sa);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });

    // ========================================================================
    // 十二、复合类型 — size
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_6100
     * @tc.name   testSetSendableSize0001
     * @tc.desc   Verify size with NormalObj — reflects element count correctly
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableSize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableSize0001';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<NormalObj>();
      expect(set.size).assertEqual(0);
      set.add(new NormalObj('s1', 1));
      expect(set.size).assertEqual(1);
      set.add(new NormalObj('s2', 2));
      set.add(new NormalObj('s3', 3));
      expect(set.size).assertEqual(3);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_6200
     * @tc.name   testSetSendableSize0002
     * @tc.desc   Verify size with EmptyObj — reflects element count correctly
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableSize0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableSize0002';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<EmptyObj>();
      expect(set.size).assertEqual(0);
      set.add(new EmptyObj());
      set.add(new EmptyObj());
      expect(set.size).assertEqual(2);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_6300
     * @tc.name   testSetSendableSize0003
     * @tc.desc   Verify size with collections.Map — reflects nested Map element count
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableSize0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableSize0003';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<collections.Map<string, number>>();
      expect(set.size).assertEqual(0);
      let m = new collections.Map<string, number>();
      m.set('a', 1);
      set.add(m);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_6400
     * @tc.name   testSetSendableSize0004
     * @tc.desc   Verify size with collections.Array<number> — reflects nested Array element count
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableSize0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableSize0004';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<collections.Array<number>>();
      expect(set.size).assertEqual(0);
      let a = new collections.Array<number>(1, 2, 3);
      set.add(a);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_6500
     * @tc.name   testSetSendableSize0005
     * @tc.desc   Verify size with empty collections.Array — reflects empty nested Array count
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableSize0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableSize0005';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<collections.Array<number>>();
      set.add(new collections.Array<number>());
      set.add(new collections.Array<number>());
      expect(set.size).assertEqual(2);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_SENDABLE_6600
     * @tc.name   testSetSendableSize0006
     * @tc.desc   Verify size with sparse-simulated Array — reflects element count
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableSize0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableSize0006';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<collections.Array<number | undefined>>();
      expect(set.size).assertEqual(0);
      let sa = new collections.Array<number | undefined>();
      sa.push(1); sa.push(undefined); sa.push(3);
      set.add(sa);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });

  });
}
