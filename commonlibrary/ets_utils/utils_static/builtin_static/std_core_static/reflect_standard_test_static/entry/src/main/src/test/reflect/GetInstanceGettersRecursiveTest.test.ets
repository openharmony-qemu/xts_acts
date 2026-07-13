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
  TestType
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

class BasicGetterClass {
  private _name: string = '';

  public get name(): string {
    return this._name;
  }
}

class NoGetterClass {
  public name: string = 'test';
  public age: int = 30;
}

class BaseGetterClass {
  private _baseField: string = '';

  public get baseField(): string {
    return this._baseField;
  }
}

class ChildGetterClass extends BaseGetterClass {
  private _childField: string = '';

  public get childField(): string {
    return this._childField;
  }
}

class BasePlainFieldClass {
  public plainField: string = '';
}

class ChildOnlyGetterClass extends BasePlainFieldClass {
  private _onlyChild: string = '';

  public get onlyChild(): string {
    return this._onlyChild;
  }
}

class MyGetterHierarchyClass extends BaseGetterClass {
  private _name: string = '';

  public get name(): string {
    return this._name;
  }
}

class GrandParentGetterClass {
  private _grandField: string = '';

  public get grandField(): string {
    return this._grandField;
  }
}

class ParentGetterClass extends GrandParentGetterClass {
  private _parentField: string = '';

  public get parentField(): string {
    return this._parentField;
  }
}

class DeepGetterLevel1 {
  private _field1: string = '';

  public get field1(): string {
    return this._field1;
  }
}

class DeepGetterLevel2 extends DeepGetterLevel1 {
  private _field2: string = '';

  public get field2(): string {
    return this._field2;
  }
}

class DeepGetterLevel3 extends DeepGetterLevel2 {
  private _field3: string = '';

  public get field3(): string {
    return this._field3;
  }
}

class DeepGetterLevel4 extends DeepGetterLevel3 {
  private _field4: string = '';

  public get field4(): string {
    return this._field4;
  }
}

class DeepGetterLevel5 extends DeepGetterLevel4 {
  private _field5: string = '';

  public get field5(): string {
    return this._field5;
  }
}

class SkipMiddleGetterL1 {
  private _field1: string = '';

  public get field1(): string {
    return this._field1;
  }
}

class SkipMiddleGetterL2 extends SkipMiddleGetterL1 {
  private _field2: string = '';
}

class SkipMiddleGetterL3 extends SkipMiddleGetterL2 {
  private _field3: string = '';

  public get field3(): string {
    return this._field3;
  }
}

class OverrideBaseClass {
  private _value: Object = new Object();

  public get value(): Object {
    return this._value;
  }
}

class OverrideDerivedClass extends OverrideBaseClass {
  private _derivedValue: string = 'derived';

  public override get value(): string {
    return this._derivedValue;
  }
}

class PublicGetterClass {
  private _value: string = '';

  public get value(): string {
    return this._value;
  }
}

class ProtectedGetterClass {
  private _value: string = '';

  protected get value(): string {
    return this._value;
  }
}

class PrivateGetterClass {
  private _value: string = '';

  private get value(): string {
    return this._value;
  }
}

class MixedMethodClass {
  private _name: string = '';

  public get name(): string {
    return this._name;
  }

  public normalMethod(): void {
  }

  public compute(a: int, b: int): int {
    return a + b;
  }
}

class GetterSetterClass {
  private _name: string = '';

  public get name(): string {
    return this._name;
  }

  public set name(value: string) {
    this._name = value;
  }
}

class OnlySetterClass {
  private _name: string = '';

  public set name(value: string) {
    this._name = value;
  }
}

interface MyInterface {
  name: string;
  age: int;
}

abstract class AbstractGetterClass {
  public abstract get field(): string;
}

class AbstractGetterImpl extends AbstractGetterClass {
  private _field: string = 'abstract';

  public override get field(): string {
    return this._field;
  }
}

class GenericGetterClass<T> {
  private _value?: T;

  public get value(): T | undefined {
    return this._value;
  }
}

class PairGetterClass<K, V> {
  private _key?: K;
  private _val?: V;

  public get key(): K | undefined {
    return this._key;
  }

  public get value(): V | undefined {
    return this._val;
  }
}

final class FinalGetterClass {
  private _name: string = '';

  public get name(): string {
    return this._name;
  }
}

enum Color {
  RED,
  GREEN,
  BLUE
}

class InterfaceImplClass implements MyInterface {
  public name: string = '';
  public age: int = 0;

  public get displayName(): string {
    return 'Name: ' + this.name;
  }
}

class ArrayGetterClass {
  private _data: Array<int> = [];

  public get data(): Array<int> {
    return this._data;
  }
}

class Inner {
  public value: int = 0;
}

class CustomTypeGetterClass {
  private _inner: Inner = new Inner();

  public get inner(): Inner {
    return this._inner;
  }
}

class StringGetterClass {
  private _name: string = 'test';

  public get name(): string {
    return this._name;
  }
}

class IntGetterClass {
  private _age: int = 0;

  public get age(): int {
    return this._age;
  }
}

class BooleanGetterClass {
  private _active: boolean = true;

  public get active(): boolean {
    return this._active;
  }
}

class FloatGetterClass {
  private _score: float = 0.0f;

  public get score(): float {
    return this._score;
  }
}

class ManyGettersClass {
  private _f1: string = '';
  private _f2: string = '';
  private _f3: string = '';
  private _f4: string = '';
  private _f5: string = '';
  private _f6: int = 0;
  private _f7: int = 0;
  private _f8: boolean = false;
  private _f9: boolean = false;
  private _f10: float = 0.0f;

  public get f1(): string {
    return this._f1;
  }

  public get f2(): string {
    return this._f2;
  }

  public get f3(): string {
    return this._f3;
  }

  public get f4(): string {
    return this._f4;
  }

  public get f5(): string {
    return this._f5;
  }

  public get f6(): int {
    return this._f6;
  }

  public get f7(): int {
    return this._f7;
  }

  public get f8(): boolean {
    return this._f8;
  }

  public get f9(): boolean {
    return this._f9;
  }

  public get f10(): float {
    return this._f10;
  }
}

class FinalMethodClass {
  private _name: string = '';

  public final get name(): string {
    return this._name;
  }
}

class StaticGetterClass {
  private static _staticName: string = '';
  private _instanceName: string = '';

  public static get staticName(): string {
    return StaticGetterClass._staticName;
  }

  public get instanceName(): string {
    return this._instanceName;
  }
}

class ComputedGetterClass {
  public get computed(): string {
    return 'computed value';
  }
}

class InvokeGetterClass {
  private _name: string = 'Alice';

  public get name(): string {
    return this._name;
  }
}

class InvokeOtherClass {
  private _value: string = 'other';

  public get value(): string {
    return this._value;
  }
}

class DynamicGetterClass {
  private _name: string = 'Alice';
  private _age: int = 30;

  public get name(): string {
    return this._name;
  }

  public get age(): int {
    return this._age;
  }
}

class SerializableGetterClass {
  private _id: int = 1;
  private _name: string = 'test';
  private _active: boolean = true;

  public get id(): int {
    return this._id;
  }

  public get name(): string {
    return this._name;
  }

  public get active(): boolean {
    return this._active;
  }
}

const GETTERS_TEST_MODULE_PREFIX: string =
  "entry.src.main.src.test.reflect.GetInstanceGettersRecursiveTest.test.";

function verifyManyGettersClassGetterNames(): void {
  let cls = Class.from<ManyGettersClass>();
  let getters = reflect.getInstanceGettersRecursive(cls);
  expect(getters.length).assertEqual(10);
  let hasF1 = false;
  let hasF2 = false;
  let hasF3 = false;
  let hasF4 = false;
  let hasF5 = false;
  let hasF6 = false;
  let hasF7 = false;
  let hasF8 = false;
  let hasF9 = false;
  let hasF10 = false;
  for (let getter of getters) {
    if (getter.getName() === "%%get-f1") {
      hasF1 = true;
      expect(getter.isGetter()).assertEqual(true);
    }
    if (getter.getName() === "%%get-f2") {
      hasF2 = true;
      expect(getter.isGetter()).assertEqual(true);
    }
    if (getter.getName() === "%%get-f3") {
      hasF3 = true;
      expect(getter.isGetter()).assertEqual(true);
    }
    if (getter.getName() === "%%get-f4") {
      hasF4 = true;
      expect(getter.isGetter()).assertEqual(true);
    }
    if (getter.getName() === "%%get-f5") {
      hasF5 = true;
      expect(getter.isGetter()).assertEqual(true);
    }
    if (getter.getName() === "%%get-f6") {
      hasF6 = true;
      expect(getter.isGetter()).assertEqual(true);
    }
    if (getter.getName() === "%%get-f7") {
      hasF7 = true;
      expect(getter.isGetter()).assertEqual(true);
    }
    if (getter.getName() === "%%get-f8") {
      hasF8 = true;
      expect(getter.isGetter()).assertEqual(true);
    }
    if (getter.getName() === "%%get-f9") {
      hasF9 = true;
      expect(getter.isGetter()).assertEqual(true);
    }
    if (getter.getName() === "%%get-f10") {
      hasF10 = true;
      expect(getter.isGetter()).assertEqual(true);
    }
  }
  expect(hasF1).assertTrue();
  expect(hasF2).assertTrue();
  expect(hasF3).assertTrue();
  expect(hasF4).assertTrue();
  expect(hasF5).assertTrue();
  expect(hasF6).assertTrue();
  expect(hasF7).assertTrue();
  expect(hasF8).assertTrue();
  expect(hasF9).assertTrue();
  expect(hasF10).assertTrue();
}

export default function GetInstanceGettersRecursiveTest(): void {
  describe('GetInstanceGettersRecursiveTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_0100
     * @tc.name testGetInstanceGettersRecursive001
     * @tc.desc Verify GetInstanceGettersRecursive case 001: Class.from<BasicGetterClass>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters instanceof Array).assertTrue();
      expect(getters.length).assertEqual(1);
      expect(getters[0].getName()).assertEqual("%%get-name");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_0200
     * @tc.name testGetInstanceGettersRecursive002
     * @tc.desc Verify GetInstanceGettersRecursive case 002: Class.from<BasicGetterClass>(), getInstanceGettersRecursive result verified, owner Class verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(1);
      expect(getters[0].getName()).assertEqual("%%get-name");
      expect(getters[0].getOwner().getName()).assertEqual(`${GETTERS_TEST_MODULE_PREFIX}BasicGetterClass`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_0300
     * @tc.name testGetInstanceGettersRecursive003
     * @tc.desc Verify GetInstanceGettersRecursive case 003: Class.of(instance), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new BasicGetterClass();
      let cls = Class.of(obj);
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(1);
      expect(getters[0].getName()).assertEqual("%%get-name");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_0400
     * @tc.name testGetInstanceGettersRecursive004
     * @tc.desc Verify GetInstanceGettersRecursive case 004: getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new BasicGetterClass();
      let cls = Class.ofAny(obj);
      if (cls === undefined) {
        expect().assertFail();
        return;
      }
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(1);
      expect(getters[0].getName()).assertEqual("%%get-name");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_0500
     * @tc.name testGetInstanceGettersRecursive005
     * @tc.desc Verify GetInstanceGettersRecursive case 005: Class.from<int>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters instanceof Array).assertTrue();
      expect(getters.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_0600
     * @tc.name testGetInstanceGettersRecursive006
     * @tc.desc Verify GetInstanceGettersRecursive case 006: getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.PRIMITIVE_INT;
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_0700
     * @tc.name testGetInstanceGettersRecursive007
     * @tc.desc Verify GetInstanceGettersRecursive case 007: invalid input throws ClassCastError, getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 预期 compile-time warning：nullish cast 至非 nullish 类型，运行时抛 ClassCastError
      try {
        reflect.getInstanceGettersRecursive(null as Class);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_0800
     * @tc.name testGetInstanceGettersRecursive008
     * @tc.desc Verify GetInstanceGettersRecursive case 008: invalid input throws ClassCastError, getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 预期 compile-time warning：nullish cast 至非 nullish 类型，运行时抛 ClassCastError
      try {
        reflect.getInstanceGettersRecursive(undefined as Class);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_0900
     * @tc.name testGetInstanceGettersRecursive009
     * @tc.desc Verify GetInstanceGettersRecursive case 009: invalid input throws ClassCastError, getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 预期 compile-time warning：非 Class 实例 cast，运行时抛 ClassCastError
      try {
        reflect.getInstanceGettersRecursive((new BasicGetterClass()) as Class);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_1000
     * @tc.name testGetInstanceGettersRecursive010
     * @tc.desc Verify GetInstanceGettersRecursive case 010: invalid input throws ClassCastError, getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 预期 compile-time warning：非 Class 类型 cast，运行时抛 ClassCastError
      try {
        let invalidArg: int = 123;
        reflect.getInstanceGettersRecursive(invalidArg as Class);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_1100
     * @tc.name testGetInstanceGettersRecursive011
     * @tc.desc Verify GetInstanceGettersRecursive case 011: invalid input throws ClassCastError, getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 预期 compile-time warning：非 Class 类型 cast，运行时抛 ClassCastError
      try {
        let invalidArg: string = "MyClass";
        reflect.getInstanceGettersRecursive(invalidArg as Class);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_1200
     * @tc.name testGetInstanceGettersRecursive012
     * @tc.desc Verify GetInstanceGettersRecursive case 012: Class.from<ChildGetterClass>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ChildGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(2);
      let hasChildField = false;
      let hasBaseField = false;
      for (let getter of getters) {
        if (getter.getName() === "%%get-childField") {
          hasChildField = true;
        } else if (getter.getName() === "%%get-baseField") {
          hasBaseField = true;
        }
      }
      expect(hasChildField).assertTrue();
      expect(hasBaseField).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_1300
     * @tc.name testGetInstanceGettersRecursive013
     * @tc.desc Verify GetInstanceGettersRecursive case 013: Class.from<NoGetterClass>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NoGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters instanceof Array).assertTrue();
      expect(getters.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_1400
     * @tc.name testGetInstanceGettersRecursive014
     * @tc.desc Verify GetInstanceGettersRecursive case 014: Class.from<MyGetterHierarchyClass>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyGetterHierarchyClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(2);
      expect(getters[0].getName()).assertEqual("%%get-name");
      expect(getters[1].getName()).assertEqual("%%get-baseField");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_1500
     * @tc.name testGetInstanceGettersRecursive015
     * @tc.desc Verify GetInstanceGettersRecursive case 015: Class.from<BasicGetterClass>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicGetterClass>();
      let getters1 = reflect.getInstanceGettersRecursive(cls);
      let getters2 = reflect.getInstanceGettersRecursive(cls);
      expect(getters1 === getters2).assertEqual(false);
      expect(getters1.length).assertEqual(getters2.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_1600
     * @tc.name testGetInstanceGettersRecursive016
     * @tc.desc Verify GetInstanceGettersRecursive case 016: Class.from<ParentGetterClass>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ParentGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(2);
      expect(getters[0].getName()).assertEqual("%%get-parentField");
      expect(getters[1].getName()).assertEqual("%%get-grandField");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_1700
     * @tc.name testGetInstanceGettersRecursive017
     * @tc.desc Verify GetInstanceGettersRecursive case 017: Class.from<BasicGetterClass>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(typeof getters).assertEqual("object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_1800
     * @tc.name testGetInstanceGettersRecursive018
     * @tc.desc Verify GetInstanceGettersRecursive case 018: Class.from<BasicGetterClass>(), getName returns "%%get-name", getInstanceGettersRecursive result verified, invoke behavior verified, parameter type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(1);
      let getter = getters[0];
      expect(getter.getName()).assertEqual("%%get-name");
      expect(getter.getReturnType().getName()).assertEqual("std.core.String");
      expect(getter.getOwner().getName()).assertEqual(`${GETTERS_TEST_MODULE_PREFIX}BasicGetterClass`);
      expect(getter.getParameterTypes().length).assertEqual(0);
      expect(getter.isGetter()).assertTrue();
      let invokeResult = getter.invoke(new BasicGetterClass());
      expect(invokeResult instanceof string).assertTrue();
      expect(invokeResult as string).assertEqual("");
    });

    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_1900
     * @tc.name testGetInstanceGettersRecursive019
     * @tc.desc Verify GetInstanceGettersRecursive case 019: Class.from<BasicGetterClass>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(1);
      expect(getters[0].isGetter()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_2000
     * @tc.name testGetInstanceGettersRecursive020
     * @tc.desc Verify GetInstanceGettersRecursive case 020: Class.from<BaseGetterClass>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BaseGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(1);
      expect(getters[0].getName()).assertEqual("%%get-baseField");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_2100
     * @tc.name testGetInstanceGettersRecursive021
     * @tc.desc Verify GetInstanceGettersRecursive case 021: Class.from<ChildOnlyGetterClass>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ChildOnlyGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(1);
      expect(getters[0].getName()).assertEqual("%%get-onlyChild");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_2200
     * @tc.name testGetInstanceGettersRecursive022
     * @tc.desc Verify GetInstanceGettersRecursive case 022: Class.from<OnlySetterClass>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OnlySetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters instanceof Array).assertTrue();
      expect(getters.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_2300
     * @tc.name testGetInstanceGettersRecursive023
     * @tc.desc Verify GetInstanceGettersRecursive case 023: Class.from<DeepGetterLevel3>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DeepGetterLevel3>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(3);
      expect(getters[0].getName()).assertEqual("%%get-field3");
      expect(getters[1].getName()).assertEqual("%%get-field2");
      expect(getters[2].getName()).assertEqual("%%get-field1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_2400
     * @tc.name testGetInstanceGettersRecursive024
     * @tc.desc Verify GetInstanceGettersRecursive case 024: Class.from<SkipMiddleGetterL3>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SkipMiddleGetterL3>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(2);
      let field1Count: int = 0;
      let field2Count: int = 0;
      let field3Count: int = 0;
      for (let getter of getters) {
        if (getter.getName() === "%%get-field1") {
          field1Count++;
        } else if (getter.getName() === "%%get-field2") {
          field2Count++;
        } else if (getter.getName() === "%%get-field3") {
          field3Count++;
        }
      }
      expect(field1Count).assertEqual(1);
      expect(field2Count).assertEqual(0);
      expect(field3Count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_2500
     * @tc.name testGetInstanceGettersRecursive025
     * @tc.desc Verify GetInstanceGettersRecursive case 025: Class.from<DeepGetterLevel5>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DeepGetterLevel5>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(5);
      let field1Count: int = 0;
      let field2Count: int = 0;
      let field3Count: int = 0;
      let field4Count: int = 0;
      let field5Count: int = 0;
      for (let getter of getters) {
        if (getter.getName() === "%%get-field1") {
          field1Count++;
        } else if (getter.getName() === "%%get-field2") {
          field2Count++;
        } else if (getter.getName() === "%%get-field3") {
          field3Count++;
        } else if (getter.getName() === "%%get-field4") {
          field4Count++;
        } else if (getter.getName() === "%%get-field5") {
          field5Count++;
        }
      }
      expect(field1Count).assertEqual(1);
      expect(field2Count).assertEqual(1);
      expect(field3Count).assertEqual(1);
      expect(field4Count).assertEqual(1);
      expect(field5Count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_2600
     * @tc.name testGetInstanceGettersRecursive026
     * @tc.desc Verify GetInstanceGettersRecursive case 026: Class.from<OverrideDerivedClass>(), getInstanceGettersRecursive result verified, owner Class verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OverrideDerivedClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(2);
      expect(getters[0].getName()).assertEqual("%%get-value");
      expect(getters[1].getName()).assertEqual("%%get-value");
      expect(getters[0].getOwner().getName()).assertEqual(`${GETTERS_TEST_MODULE_PREFIX}OverrideDerivedClass`);
      expect(getters[1].getOwner().getName()).assertEqual(`${GETTERS_TEST_MODULE_PREFIX}OverrideBaseClass`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_2700
     * @tc.name testGetInstanceGettersRecursive027
     * @tc.desc Verify GetInstanceGettersRecursive case 027: Class.from<OverrideDerivedClass>(), getInstanceGettersRecursive result verified, return type verified, owner Class verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OverrideDerivedClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(2);
      expect(getters[0].getReturnType().getName()).assertEqual("std.core.String");
      expect(getters[1].getReturnType().getName()).assertEqual("std.core.Object");
      expect(getters[0].getOwner().getName()).assertEqual(`${GETTERS_TEST_MODULE_PREFIX}OverrideDerivedClass`);
      expect(getters[1].getOwner().getName()).assertEqual(`${GETTERS_TEST_MODULE_PREFIX}OverrideBaseClass`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_2800
     * @tc.name testGetInstanceGettersRecursive028
     * @tc.desc Verify GetInstanceGettersRecursive case 028: Class.from<GrandParentGetterClass>(), getInstanceGettersRecursive result verified, owner Class verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GrandParentGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(1);
      expect(getters[0].getOwner().getName()).assertEqual(`${GETTERS_TEST_MODULE_PREFIX}GrandParentGetterClass`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_2900
     * @tc.name testGetInstanceGettersRecursive029
     * @tc.desc Verify GetInstanceGettersRecursive case 029: Class.from<PublicGetterClass>(), getInstanceGettersRecursive result verified, isPublic flag verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PublicGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(1);
      expect(getters[0].getName()).assertEqual("%%get-value");
      expect(getters[0].isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_3000
     * @tc.name testGetInstanceGettersRecursive030
     * @tc.desc Verify GetInstanceGettersRecursive case 030: Class.from<ProtectedGetterClass>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters instanceof Array).assertTrue();
      expect(getters.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_3100
     * @tc.name testGetInstanceGettersRecursive031
     * @tc.desc Verify GetInstanceGettersRecursive case 031: Class.from<PrivateGetterClass>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters instanceof Array).assertTrue();
      expect(getters.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_3200
     * @tc.name testGetInstanceGettersRecursive032
     * @tc.desc Verify GetInstanceGettersRecursive case 032: Class.from<MixedMethodClass>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedMethodClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(1);
      expect(getters[0].getName()).assertEqual("%%get-name");
      expect(getters[0].isGetter()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_3300
     * @tc.name testGetInstanceGettersRecursive033
     * @tc.desc Verify GetInstanceGettersRecursive case 033: Class.from<GetterSetterClass>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GetterSetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(1);
      expect(getters[0].getName()).assertEqual("%%get-name");
      expect(getters[0].isGetter()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_3400
     * @tc.name testGetInstanceGettersRecursive034
     * @tc.desc Verify GetInstanceGettersRecursive case 034: Class.from<MyInterface>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyInterface>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters instanceof Array).assertTrue();
      expect(getters.length).assertEqual(2);
      let nameFound = false;
      let ageFound = false;
      for (let getter of getters) {
        if (getter.getName() === "%%get-name") {
          nameFound = true;
        } else if (getter.getName() === "%%get-age") {
          ageFound = true;
        }
      }
      expect(nameFound).assertTrue();
      expect(ageFound).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_3500
     * @tc.name testGetInstanceGettersRecursive035
     * @tc.desc Verify GetInstanceGettersRecursive case 035: Class.from<AbstractGetterImpl>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractGetterImpl>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(2);
      let fieldGetterCount: int = 0;
      for (let getter of getters) {
        if (getter.getName() === "%%get-field") {
          fieldGetterCount++;
        }
      }
      expect(fieldGetterCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_3600
     * @tc.name testGetInstanceGettersRecursive036
     * @tc.desc Verify GetInstanceGettersRecursive case 036: Class.from<AbstractGetterImpl>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractGetterImpl>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(2);
      for (let getter of getters) {
        expect(getter.isGetter()).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_3700
     * @tc.name testGetInstanceGettersRecursive037
     * @tc.desc Verify GetInstanceGettersRecursive case 037: Class.from<GenericGetterClass<string>>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericGetterClass<string>>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(1);
      expect(getters[0].getName()).assertEqual("%%get-value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_3800
     * @tc.name testGetInstanceGettersRecursive038
     * @tc.desc Verify GetInstanceGettersRecursive case 038: Class.from<PairGetterClass<string, int>>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PairGetterClass<string, int>>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(2);
      expect(getters[0].getName()).assertEqual("%%get-key");
      expect(getters[1].getName()).assertEqual("%%get-value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_3900
     * @tc.name testGetInstanceGettersRecursive039
     * @tc.desc Verify GetInstanceGettersRecursive case 039: Class.from<FinalGetterClass>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(1);
      expect(getters[0].getName()).assertEqual("%%get-name");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_4000
     * @tc.name testGetInstanceGettersRecursive040
     * @tc.desc Verify GetInstanceGettersRecursive case 040: Class.from<Color>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Color>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters instanceof Array).assertTrue();
      expect(getters.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_4100
     * @tc.name testGetInstanceGettersRecursive041
     * @tc.desc Verify GetInstanceGettersRecursive case 041: Class.from<InterfaceImplClass>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<InterfaceImplClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(3);
      let displayNameFound = false;
      for (let getter of getters) {
        if (getter.getName() === "%%get-displayName") {
          displayNameFound = true;
        }
      }
      expect(displayNameFound).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_4200
     * @tc.name testGetInstanceGettersRecursive042
     * @tc.desc Verify GetInstanceGettersRecursive case 042: Class.from<int | string>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters instanceof Array).assertTrue();
      expect(getters.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_4300
     * @tc.name testGetInstanceGettersRecursive043
     * @tc.desc Verify GetInstanceGettersRecursive case 043: Class.from<Array<int>>(), isFixedArray returns false, getName returns "std.core.Array", getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Array<int>>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters instanceof Array).assertTrue();
      expect(getters.length).assertEqual(1);
      expect(getters[0].isGetter()).assertEqual(true);
      expect(cls.getName()).assertEqual("std.core.Array");
      expect(cls.isFixedArray()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_4400
     * @tc.name testGetInstanceGettersRecursive044
     * @tc.desc Verify GetInstanceGettersRecursive case 044: Class.from<FixedArray<int>>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FixedArray<int>>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters instanceof Array).assertTrue();
      expect(getters.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_4500
     * @tc.name testGetInstanceGettersRecursive045
     * @tc.desc Verify GetInstanceGettersRecursive case 045: Class.from<Map<string, int>>(), isInterface returns false, getName returns "std.core.Map", getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Map<string, int>>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters instanceof Array).assertTrue();
      expect(getters.length).assertEqual(1);
      expect(getters[0].isGetter()).assertEqual(true);
      expect(cls.getName()).assertEqual("std.core.Map");
      expect(cls.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_4600
     * @tc.name testGetInstanceGettersRecursive046
     * @tc.desc Verify GetInstanceGettersRecursive case 046: Class.from<Set<string>>(), isEnum returns false, getName returns "std.core.Set", getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Set<string>>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters instanceof Array).assertTrue();
      expect(getters.length).assertEqual(1);
      expect(getters[0].isGetter()).assertEqual(true);
      expect(cls.getName()).assertEqual("std.core.Set");
      expect(cls.isEnum()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_4700
     * @tc.name testGetInstanceGettersRecursive047
     * @tc.desc Verify GetInstanceGettersRecursive case 047: Class.from<StringGetterClass>(), getInstanceGettersRecursive result verified, return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(1);
      expect(getters[0].getReturnType().getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_4800
     * @tc.name testGetInstanceGettersRecursive048
     * @tc.desc Verify GetInstanceGettersRecursive case 048: Class.from<IntGetterClass>(), getInstanceGettersRecursive result verified, return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(1);
      expect(getters[0].getReturnType().getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_4900
     * @tc.name testGetInstanceGettersRecursive049
     * @tc.desc Verify GetInstanceGettersRecursive case 049: Class.from<BooleanGetterClass>(), getInstanceGettersRecursive result verified, return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BooleanGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(1);
      expect(getters[0].getReturnType().getName()).assertEqual("u1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_5000
     * @tc.name testGetInstanceGettersRecursive050
     * @tc.desc Verify GetInstanceGettersRecursive case 050: Class.from<FloatGetterClass>(), getInstanceGettersRecursive result verified, return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FloatGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(1);
      expect(getters[0].getReturnType().getName()).assertEqual("f32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_5100
     * @tc.name testGetInstanceGettersRecursive051
     * @tc.desc Verify GetInstanceGettersRecursive case 051: Class.from<ArrayGetterClass>(), getInstanceGettersRecursive result verified, return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ArrayGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(1);
      expect(getters[0].getName()).assertEqual("%%get-data");
      expect(getters[0].getReturnType().getName()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_5200
     * @tc.name testGetInstanceGettersRecursive052
     * @tc.desc Verify GetInstanceGettersRecursive case 052: Class.from<CustomTypeGetterClass>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CustomTypeGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(1);
      expect(getters[0].getName()).assertEqual("%%get-inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_5300
     * @tc.name testGetInstanceGettersRecursive053
     * @tc.desc Verify GetInstanceGettersRecursive case 053: Class.from<BasicGetterClass>(), getInstanceGettersRecursive result verified, parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters[0].getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_5400
     * @tc.name testGetInstanceGettersRecursive054
     * @tc.desc Verify GetInstanceGettersRecursive case 054: Class.from<BasicGetterClass>(), getInstanceGettersRecursive result verified, parameter type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters[0].getParameterTypes().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_5500
     * @tc.name testGetInstanceGettersRecursive055
     * @tc.desc Verify GetInstanceGettersRecursive case 055: behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      verifyManyGettersClassGetterNames();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_5600
     * @tc.name testGetInstanceGettersRecursive056
     * @tc.desc Verify GetInstanceGettersRecursive case 056: Class.from<FinalMethodClass>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalMethodClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(1);
      expect(getters[0].isFinal()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_5700
     * @tc.name testGetInstanceGettersRecursive057
     * @tc.desc Verify GetInstanceGettersRecursive case 057: Class.from<StaticGetterClass>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(1);
      expect(getters[0].getName()).assertEqual("%%get-instanceName");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_5800
     * @tc.name testGetInstanceGettersRecursive058
     * @tc.desc Verify GetInstanceGettersRecursive case 058: Class.from<ComputedGetterClass>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ComputedGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(1);
      expect(getters[0].getName()).assertEqual("%%get-computed");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_5900
     * @tc.name testGetInstanceGettersRecursive059
     * @tc.desc Verify GetInstanceGettersRecursive case 059: Class.from<InvokeGetterClass>(), getInstanceGettersRecursive result verified, invoke behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new InvokeGetterClass();
      let cls = Class.from<InvokeGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters[0].getName()).assertEqual("%%get-name");
      let invokeResult = getters[0].invoke(obj);
      expect(invokeResult instanceof string).assertTrue();
      expect(invokeResult as string).assertEqual("Alice");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_6000
     * @tc.name testGetInstanceGettersRecursive060
     * @tc.desc Verify GetInstanceGettersRecursive case 060: invalid input throws TypeError, Class.from<InvokeGetterClass>(), getInstanceGettersRecursive result verified, invoke behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        reflect.getInstanceGettersRecursive(Class.from<InvokeGetterClass>())[0].invoke(new InvokeOtherClass());
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_6100
     * @tc.name testGetInstanceGettersRecursive061
     * @tc.desc Verify GetInstanceGettersRecursive case 061: Class.from<InvokeGetterClass>(), getInstanceGettersRecursive result verified, invoke behavior verified, parameter type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new InvokeGetterClass();
      let cls = Class.from<InvokeGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters[0].getParameterTypes().length).assertEqual(0);
      let invokeResult = getters[0].invoke(obj);
      expect(invokeResult instanceof string).assertTrue();
      expect(invokeResult as string).assertEqual("Alice");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_6200
     * @tc.name testGetInstanceGettersRecursive062
     * @tc.desc Verify GetInstanceGettersRecursive case 062: Class.from<BasicGetterClass>(), getInstanceGettersRecursive result verified, equals returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicGetterClass>();
      let getters1 = reflect.getInstanceGettersRecursive(cls);
      let getters2 = reflect.getInstanceGettersRecursive(cls);
      expect(getters1[0].equals(getters2[0])).assertEqual(true);
      expect(getters1[0] === getters2[0]).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_6300
     * @tc.name testGetInstanceGettersRecursive063
     * @tc.desc Verify GetInstanceGettersRecursive case 063: Class.from<DynamicGetterClass>(), getInstanceGettersRecursive result verified, equals returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DynamicGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(2);
      expect(getters[0].equals(getters[1])).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_6400
     * @tc.name testGetInstanceGettersRecursive064
     * @tc.desc Verify GetInstanceGettersRecursive case 064: Class.from<SerializableGetterClass>(), getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SerializableGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(getters.length).assertEqual(3);
      let idCount: int = 0;
      let nameCount: int = 0;
      let activeCount: int = 0;
      for (let getter of getters) {
        let propName = getter.getName().substring(6);
        if (propName === "id") {
          idCount++;
        } else if (propName === "name") {
          nameCount++;
        } else if (propName === "active") {
          activeCount++;
        }
      }
      expect(idCount).assertEqual(1);
      expect(nameCount).assertEqual(1);
      expect(activeCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_6500
     * @tc.name testGetInstanceGettersRecursive065
     * @tc.desc Verify GetInstanceGettersRecursive case 065: Class.from<InterfaceImplClass>(), getInstanceGettersRecursive result verified, owner Class verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<InterfaceImplClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      let displayNameFound = false;
      for (let getter of getters) {
        if (getter.getName() === "%%get-displayName") {
          displayNameFound = true;
          expect(getter.getOwner().getName()).assertEqual(`${GETTERS_TEST_MODULE_PREFIX}InterfaceImplClass`);
        }
      }
      expect(displayNameFound).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_6600
     * @tc.name testGetInstanceGettersRecursive066
     * @tc.desc Verify GetInstanceGettersRecursive case 066: Class.of(instance), getInstanceGettersRecursive result verified, invoke behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new DynamicGetterClass();
      let cls = Class.of(obj);
      let getters = reflect.getInstanceGettersRecursive(cls);
      let nameFound = false;
      let ageFound = false;
      for (let getter of getters) {
        let name = getter.getName();
        let value = getter.invoke(obj);
        if (name === "%%get-name") {
          nameFound = true;
          expect(value instanceof string).assertTrue();
          expect(value as string).assertEqual("Alice");
        } else if (name === "%%get-age") {
          ageFound = true;
          expect(value instanceof int).assertTrue();
          expect(value as int).assertEqual(30);
        }
      }
      expect(nameFound).assertTrue();
      expect(ageFound).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_6700
     * @tc.name testGetInstanceGettersRecursive067
     * @tc.desc Verify GetInstanceGettersRecursive case 067: Class.from<BasicGetterClass>(), instance fields result verified, getInstanceGettersRecursive result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BasicGetterClass>();
      let fields = reflect.getInstanceFieldsRecursive(cls);
      let getters = reflect.getInstanceGettersRecursive(cls);
      expect(fields.length).assertEqual(0);
      expect(getters.length).assertEqual(1);
      expect(getters[0].getName()).assertEqual("%%get-name");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_6800
     * @tc.name testGetInstanceGettersRecursive068
     * @tc.desc Verify GetInstanceGettersRecursive case 068: Class.from<SerializableGetterClass>(), getInstanceGettersRecursive result verified, invoke behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new SerializableGetterClass();
      let cls = Class.from<SerializableGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      let parts: Array<string> = [];
      for (let getter of getters) {
        let propName = getter.getName().substring(6);
        let value = getter.invoke(obj);
        parts.push(propName + ':' + value);
      }
      let json = '{' + parts.join(',') + '}';
      expect(json.indexOf('id:1') >= 0).assertEqual(true);
      expect(json.indexOf('name:test') >= 0).assertEqual(true);
      expect(json.indexOf('active:true') >= 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_6900
     * @tc.name testGetInstanceGettersRecursive069
     * @tc.desc Verify GetInstanceGettersRecursive case 069: invalid input throws ClassCastError, Class.from<InvokeGetterClass>(), getInstanceGettersRecursive result verified, invoke behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<InvokeGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      try {
        getters[0].invoke(null as Object);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_INSTANCE_GETTERS_RECURSIVE_7000
     * @tc.name testGetInstanceGettersRecursive070
     * @tc.desc Verify GetInstanceGettersRecursive case 070: invalid input throws ClassCastError, Class.from<InvokeGetterClass>(), getInstanceGettersRecursive result verified, invoke behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetInstanceGettersRecursive070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<InvokeGetterClass>();
      let getters = reflect.getInstanceGettersRecursive(cls);
      try {
        getters[0].invoke(undefined as Object);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });
  });
}
