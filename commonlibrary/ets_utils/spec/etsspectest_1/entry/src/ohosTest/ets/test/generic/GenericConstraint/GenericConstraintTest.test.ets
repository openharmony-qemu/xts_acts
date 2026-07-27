/*
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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
} from '@ohos/hypium';

import {
  getProperty,
  compareValues,
  createInstance,
  DefaultHolder,
  NumberValue
} from './generic_constraint_ts_helper';

export interface HasId { id: number; }

export interface HasName { name: string; }

export interface HasLength { length: number; }

export class Animal {
  public name: string = '';

  public speak(): string {
    return 'animal sound';
  }
}

export class Cat extends Animal {
  public speak(): string {
    return 'meow';
  }
}

export interface Combo extends HasId, HasName {}

export function readId<T extends HasId>(value: T): number {
  return value.id;
}

export function process<T extends HasId>(value: T): T {
  return value;
}

export function getAnimalName<T extends Animal>(animal: T): string {
  return animal.name;
}

export function getLength<T extends HasLength>(value: T): number {
  return value.length;
}

export function processCombo<T extends Combo>(value: T): string {
  return `${value.id}: ${value.name}`;
}

export function processMultiple<T, U extends T>(base: T, derived: U): U {
  return derived;
}

type StringToNumberFunc = (s: string) => number;

export function applyFunc<T extends StringToNumberFunc>(fn: T, arg: string): number {
  return fn(arg);
}

export function getFirstElement<T extends number[]>(arr: T): number {
  return arr[0];
}

class TestId implements HasId {
  public id: number = 0;
  public name: string = '';
  public extra: number = 0;
}

class TestIdWithExtra implements HasId {
  public id: number = 0;
  public name: string = '';
  public extra: number = 0;
}

class TestObj {
  public a: number = 0;
  public b: string = '';
}

class ComboImpl implements Combo {
  public id: number = 0;
  public name: string = '';
}

class DefaultId implements HasId {
  public id: number = 0;
}

class StructuralId {
  public id: number = 0;
}

class GenericProcessor {
  public extractId<T extends HasId>(item: T): number {
    return item.id;
  }
}

class Container<T> {
  private items: T[] = [];

  public add<U extends T>(item: U): void {
    this.items.push(item);
  }

  public getFirst(): T | undefined {
    return this.items[0];
  }
}

export default function GenericConstraintTest() {
  describe('GenericConstraintTest', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number    SUB_GENERIC_CO_CONSTRAINT_0100
     * @tc.name      testConstraintDeclaration0001
     * @tc.desc      Verify T extends Constraint declaration compiles and works (GTP-CO-001)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConstraintDeclaration0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: TestId = new TestId();
      obj.id = 42;
      expect(readId(obj)).assertEqual(42);
    });

    /**
     * @tc.number    SUB_GENERIC_CO_CONSTRAINT_0200
     * @tc.name      testConstraintSatisfied0001
     * @tc.desc      Verify call succeeds when structural constraint satisfied by class without implements (GTP-CO-002)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConstraintSatisfied0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: StructuralId = new StructuralId();
      obj.id = 100;
      expect(readId(obj)).assertEqual(100);
    });


    /**
     * @tc.number    SUB_GENERIC_CO_CONSTRAINT_0300
     * @tc.name      testConstraintPreservesSubtypeExtra0001
     * @tc.desc      Verify constraint preserves subtype extra field (GTP-CO-004)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConstraintPreservesSubtypeExtra0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: TestIdWithExtra = new TestIdWithExtra();
      obj.id = 1;
      obj.name = 'Alice';
      obj.extra = 99;
      expect(process(obj).extra).assertEqual(99);
    });

    /**
     * @tc.number    SUB_GENERIC_CO_CONSTRAINT_0400
     * @tc.name      testConstraintPreservesSubtypeName0001
     * @tc.desc      Verify constraint preserves subtype name field (GTP-CO-004)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConstraintPreservesSubtypeName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: TestIdWithExtra = new TestIdWithExtra();
      obj.id = 1;
      obj.name = 'Alice';
      obj.extra = 99;
      expect(process(obj).name).assertEqual('Alice');
    });

    /**
     * @tc.number    SUB_GENERIC_CO_CONSTRAINT_0500
     * @tc.name      testClassConstraintSubclass0001
     * @tc.desc      Verify subclass instance satisfies parent class constraint (GTP-CO-005)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassConstraintSubclass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const cat: Cat = new Cat();
      cat.name = 'Whiskers';
      expect(getAnimalName(cat)).assertEqual('Whiskers');
    });


    /**
     * @tc.number    SUB_GENERIC_CO_CONSTRAINT_0600
     * @tc.name      testConstraintMemberAccessString0001
     * @tc.desc      Verify accessing constraint-declared length property on string (GTP-CO-006)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConstraintMemberAccessString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getLength('hello')).assertEqual(5);
    });

    /**
     * @tc.number    SUB_GENERIC_CO_CONSTRAINT_0700
     * @tc.name      testConstraintMemberAccessArray0001
     * @tc.desc      Verify accessing constraint-declared length property on array (GTP-CO-006)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConstraintMemberAccessArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getLength([1, 2, 3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_GENERIC_CO_CONSTRAINT_0800
     * @tc.name      testDependentConstraintNumber0001
     * @tc.desc      Verify K extends keyof T dependent constraint with number property (GTP-CO-007)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDependentConstraintNumber0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: TestObj = new TestObj();
      obj.a = 10;
      obj.b = 'hello';
      expect(getProperty(obj, 'a')).assertEqual(10);
    });

    /**
     * @tc.number    SUB_GENERIC_CO_CONSTRAINT_0900
     * @tc.name      testDependentConstraintString0001
     * @tc.desc      Verify K extends keyof T dependent constraint with string property (GTP-CO-007)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDependentConstraintString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: TestObj = new TestObj();
      obj.a = 10;
      obj.b = 'hello';
      expect(getProperty(obj, 'b')).assertEqual('hello');
    });

    /**
     * @tc.number    SUB_GENERIC_CO_CONSTRAINT_1000
     * @tc.name      testCompositeConstraint0001
     * @tc.desc      Verify composite interface combining multiple constraint types (GTP-CO-008)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCompositeConstraint0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: ComboImpl = new ComboImpl();
      obj.id = 123;
      obj.name = 'Composite';
      expect(processCombo(obj)).assertEqual('123: Composite');
    });

    /**
     * @tc.number    SUB_GENERIC_CO_CONSTRAINT_1100
     * @tc.name      testRecursiveConstraint0001
     * @tc.desc      Verify F-bounded self-referential generic constraint (GTP-CO-009)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testRecursiveConstraint0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(compareValues(new NumberValue(5), new NumberValue(3))).assertEqual(2);
    });

    /**
     * @tc.number    SUB_GENERIC_CO_CONSTRAINT_1200
     * @tc.name      testConstructorConstraintField0001
     * @tc.desc      Verify Constructor<T> generic constraint creates instance and access field (GTP-CO-010)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConstructorConstraintField0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const cat: Cat = createInstance(Cat);
      cat.name = 'Tom';
      expect(cat.name).assertEqual('Tom');
    });

    /**
     * @tc.number    SUB_GENERIC_CO_CONSTRAINT_1300
     * @tc.name      testConstructorConstraintMethod0001
     * @tc.desc      Verify Constructor<T> generic constraint instance method invoke (GTP-CO-010)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConstructorConstraintMethod0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const catInstance: Cat = createInstance(Cat);
      expect(catInstance.speak()).assertEqual('meow');
    });

    /**
     * @tc.number    SUB_GENERIC_CO_CONSTRAINT_1400
     * @tc.name      testDefaultSatisfiesConstraint0001
     * @tc.desc      Verify default type parameter satisfies declared generic constraint (GTP-CO-011)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConstraintDefaultSatisfies0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: DefaultId = new DefaultId();
      item.id = 999;
      expect(new DefaultHolder(item).getId()).assertEqual(999);
    });

    /**
     * @tc.number    SUB_GENERIC_CO_CONSTRAINT_1600
     * @tc.name      testMultipleTypeParametersConstraint0001
     * @tc.desc      Verify multi type parameter constraint U extends T relationship (GTP-CO-013)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMultipleTypeParametersConstraint0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const base: TestId = new TestId();
      base.id = 1;
      const derived: TestIdWithExtra = new TestIdWithExtra();
      derived.id = 1;
      derived.extra = 99;
      expect(processMultiple(base, derived).extra).assertEqual(99);
    });

    /**
     * @tc.number    SUB_GENERIC_CO_CONSTRAINT_1700
     * @tc.name      testClassMethodConstraint0001
     * @tc.desc      Verify generic constraint defined on class member method (GTP-CO-014)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodConstraint0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const processor: GenericProcessor = new GenericProcessor();
      const obj: TestId = new TestId();
      obj.id = 42;
      expect(processor.extractId(obj)).assertEqual(42);
    });

    /**
     * @tc.number    SUB_GENERIC_CO_CONSTRAINT_1800
     * @tc.name      testFunctionSignatureConstraint0001
     * @tc.desc      Verify generic constraint for function type signature (GTP-CO-015)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFunctionSignatureConstraint0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fn: StringToNumberFunc = (s: string) => s.length;
      expect(applyFunc(fn, 'hello')).assertEqual(5);
    });

    /**
     * @tc.number    SUB_GENERIC_CO_CONSTRAINT_1900
     * @tc.name      testArrayTypeConstraint0001
     * @tc.desc      Verify generic constraint bound to array concrete type (GTP-CO-016)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayTypeConstraint0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: number[] = [10, 20, 30];
      expect(getFirstElement(arr)).assertEqual(10);
    });

    /**
     * @tc.number    SUB_GENERIC_CO_CONSTRAINT_2000
     * @tc.name      testGenericClassMethodConstraint0001
     * @tc.desc      Verify generic class with dependent constraint on member method U extends T (GTP-CO-017)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testGenericClassMethodConstraint0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const container: Container<TestId> = new Container<TestId>();
      const item: TestIdWithExtra = new TestIdWithExtra();
      item.id = 1;
      container.add(item);
      const first: TestId | undefined = container.getFirst();
      expect(first === undefined).assertFalse();
      const firstId: number = first!.id;
      expect(firstId).assertEqual(1);
    });
  });
}
