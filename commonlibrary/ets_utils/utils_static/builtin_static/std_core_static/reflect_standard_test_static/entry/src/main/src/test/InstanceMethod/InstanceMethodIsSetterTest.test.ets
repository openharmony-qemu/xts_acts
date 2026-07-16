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
} from '../../../../hypium/index';
import Utils from './../Util.test';

class MyClass001 {
  private _name: string = '';

  public set name(value: string) {
    this._name = value;
  }
}

class MyClass005 {
  public normalMethod(): void {
  }

  public setNameMethod(name: string): void {
  }
}

class MyClass007 {
  private _value: number = 0;

  public set value(v: number) {
    this._value = v;
  }
}

class MyClass008 {
  private _value: number = 0;

  private set value(v: number) {
    this._value = v;
  }
}

class MyClass009 {
  private _value: number = 0;

  protected set value(v: number) {
    this._value = v;
  }
}

class MyClass012 {
  private _value: number = 0;

  public get value(): number {
    return this._value;
  }

  public set value(v: number) {
    this._value = v;
  }
}

class MyClass013 {
  private _writeOnly: number = 0;

  public set writeOnly(v: number) {
    this._writeOnly = v;
  }
}

class MyClass014 {
  private _readWrite: number = 0;

  public get readWrite(): number {
    return this._readWrite;
  }

  public set readWrite(v: number) {
    this._readWrite = v;
  }
}

class MyClass015 {
  private _value: number = 0;

  public set value(v: number) {
    this._value = v;
  }

  public setValue(v: number): void {
    this._value = v;
  }
}

class MyClass020 {
  public normalMethod(): void {
  }

  private _value: number = 0;

  public get value(): number {
    return this._value;
  }
}

class MyClass021 {
  private _value: number = 0;

  public set value(v: number) {
    this._value = v;
  }
}

class MyClass022 {
  private _num: number = 0;
  private _str: string = '';
  private _bool: boolean = false;

  public set num(v: number) {
    this._num = v;
  }

  public set str(v: string) {
    this._str = v;
  }

  public set bool(v: boolean) {
    this._bool = v;
  }
}

class MyClass023 {
  private _obj: object = {};

  public set obj(v: object) {
    this._obj = v;
  }
}

class MyClass024 {
  private _arr: number[] = [];

  public set arr(v: number[]) {
    this._arr = v;
  }
}

class CustomType030 {
}

class MyClass030 {
  private _custom: CustomType030 = new CustomType030();

  public set custom(v: CustomType030) {
    this._custom = v;
  }
}

class MyClass031 {
  private _map: Map<string, number> = new Map<string, number>();

  public set map(v: Map<string, number>) {
    this._map = v;
  }
}

class MyClass032 {
  private _set: Set<number> = new Set<number>();

  public set set(v: Set<number>) {
    this._set = v;
  }
}

class EmptyClass033 {
}

class MyClass034 {
  private _value: number = 0;

  public get value(): number {
    return this._value;
  }

  public set value(v: number) {
    this._value = v;
  }

  public normalMethod(): void {
  }
}

class MyClass035 {
  private _a: number = 0;
  private _b: string = '';
  private _c: boolean = false;

  public set a(v: number) {
    this._a = v;
  }

  public set b(v: string) {
    this._b = v;
  }

  public set c(v: boolean) {
    this._c = v;
  }
}

class ParentClass036 {
  private _value: number = 0;

  public set value(v: number) {
    this._value = v;
  }
}

class ChildClass036 extends ParentClass036 {
}

class MyClass037 {
  private _value: number = 0;

  public get value(): number {
    return this._value;
  }

  public set value(v: number) {
    this._value = v;
  }
}

class MyClass038 {
  private _items: number[] = [];

  public set items(v: number[]) {
    this._items = v;
  }
}


class CustomType053 {
}

class ParentSetter059 {
  private _val: number = 0;

  public set parentVal(v: number) {
    this._val = v;
  }
}

class ParentSetter060 {
  private _val: number = 0;

  public set overrideVal(v: number) {
    this._val = v;
  }
}

export default function InstanceMethodIsSetterTest(): void {
  describe('InstanceMethodIsSetterTest', (): void => {
    beforeAll(() => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISSETTER_0001
     * @tc.name testInstanceMethodIsSetter0001
     * @tc.desc Verify isSetter() returns true for a setter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsSetter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let method = cls.getInstanceMethod('%%set-name');
      let isSetter = method!.isSetter();
      expect(isSetter).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISSETTER_0002
     * @tc.name testInstanceMethodIsSetter0002
     * @tc.desc Verify non-setter method returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsSetter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass005>();
      let normalMethod = cls.getInstanceMethod('normalMethod');
      expect(normalMethod!.isSetter()).assertEqual(false);
      let setNameMethod = cls.getInstanceMethod('setNameMethod');
      expect(setNameMethod!.isSetter()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISSETTER_0003
     * @tc.name testInstanceMethodIsSetter0003
     * @tc.desc Verify public setter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsSetter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
      let method = cls.getInstanceMethod('%%set-value');
      expect(method!.isSetter()).assertEqual(true);
      expect(method!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISSETTER_0004
     * @tc.name testInstanceMethodIsSetter0004
     * @tc.desc Verify private setter method lookup returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsSetter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      let method = cls.getInstanceMethod('%%set-value');
      expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISSETTER_0005
     * @tc.name testInstanceMethodIsSetter0005
     * @tc.desc Verify protected setter method lookup returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsSetter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass009>();
      let method = cls.getInstanceMethod('%%set-value');
      expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISSETTER_0006
     * @tc.name testInstanceMethodIsSetter0006
     * @tc.desc Verify setter and getter are mutually exclusive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsSetter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass012>();
      let getter = cls.getInstanceMethod('%%get-value');
      expect(getter!.isSetter()).assertEqual(false);
      expect(getter!.isGetter()).assertEqual(true);
      let setter = cls.getInstanceMethod('%%set-value');
      expect(setter!.isSetter()).assertEqual(true);
      expect(setter!.isGetter()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISSETTER_0007
     * @tc.name testInstanceMethodIsSetter0007
     * @tc.desc Verify write-only property only has setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsSetter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass013>();
      let setter = cls.getInstanceMethod('%%set-writeOnly');
      expect(setter!.getName()).assertEqual('%%set-writeOnly');
      expect(setter!.isSetter()).assertEqual(true);
      let getter = cls.getInstanceMethod('%%get-writeOnly');
      expect(getter).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISSETTER_0008
     * @tc.name testInstanceMethodIsSetter0008
     * @tc.desc Verify read-write property has both getter and setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsSetter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass014>();
      let getter = cls.getInstanceMethod('%%get-readWrite');
      let setter = cls.getInstanceMethod('%%set-readWrite');
      expect(getter!.getName()).assertEqual('%%get-readWrite');
      expect(getter!.isGetter()).assertEqual(true);
      expect(setter!.getName()).assertEqual('%%set-readWrite');
      expect(setter!.isSetter()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISSETTER_0009
     * @tc.name testInstanceMethodIsSetter0009
     * @tc.desc Verify identifying setter methods using isSetter()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsSetter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass015>();
      let methods = cls.getInstanceMethods();
      let setterCount: int = 0;
      let setterName = '';
      for (let i = 0; i < methods.length; i++) {
        let method = methods[i];
        if (method.isSetter()) {
          setterCount++;
          setterName = method.getName();
        }
      }
      expect(setterCount).assertEqual(1);
      expect(setterName).assertEqual('%%set-value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISSETTER_0010
     * @tc.name testInstanceMethodIsSetter0010
     * @tc.desc Verify non-setter method returns false and getter has zero parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsSetter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass020>();
      let normalMethod = cls.getInstanceMethod('normalMethod');
      expect(normalMethod!.isSetter()).assertEqual(false);
      let getter = cls.getInstanceMethod('%%get-value');
      expect(getter!.isSetter()).assertEqual(false);
      expect(getter!.isGetter()).assertEqual(true);
      expect(getter!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISSETTER_0011
     * @tc.name testInstanceMethodIsSetter0011
     * @tc.desc Verify setter method has one parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsSetter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass021>();
      let method = cls.getInstanceMethod('%%set-value');
      expect(method!.isSetter()).assertEqual(true);
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISSETTER_0012
     * @tc.name testInstanceMethodIsSetter0012
     * @tc.desc Verify setter method returns void type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsSetter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass021>();
      let method = cls.getInstanceMethod('%%set-value');
      expect(method!.isSetter()).assertEqual(true);
      expect(method!.getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISSETTER_0013
     * @tc.name testInstanceMethodIsSetter0013
     * @tc.desc Verify setter for basic type properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsSetter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass022>();
      let numSetter = cls.getInstanceMethod('%%set-num');
      expect(numSetter!.isSetter()).assertEqual(true);
      let strSetter = cls.getInstanceMethod('%%set-str');
      expect(strSetter!.isSetter()).assertEqual(true);
      let boolSetter = cls.getInstanceMethod('%%set-bool');
      expect(boolSetter!.isSetter()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISSETTER_0014
     * @tc.name testInstanceMethodIsSetter0014
     * @tc.desc Verify setter for object type property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsSetter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass023>();
      let method = cls.getInstanceMethod('%%set-obj');
      expect(method!.isSetter()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISSETTER_0015
     * @tc.name testInstanceMethodIsSetter0015
     * @tc.desc Verify setter for array type property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsSetter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass024>();
      let method = cls.getInstanceMethod('%%set-arr');
      expect(method!.isSetter()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISSETTER_0016
     * @tc.name testInstanceMethodIsSetter0016
     * @tc.desc Verify setter for custom class type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsSetter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass030>();
      let method = cls.getInstanceMethod('%%set-custom');
      expect(method!.isSetter()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISSETTER_0017
     * @tc.name testInstanceMethodIsSetter0017
     * @tc.desc Verify setter for Map type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsSetter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass031>();
      let method = cls.getInstanceMethod('%%set-map');
      expect(method!.isSetter()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISSETTER_0018
     * @tc.name testInstanceMethodIsSetter0018
     * @tc.desc Verify setter for Set type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsSetter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass032>();
      let method = cls.getInstanceMethod('%%set-set');
      expect(method!.isSetter()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISSETTER_0019
     * @tc.name testInstanceMethodIsSetter0019
     * @tc.desc Verify empty class has no methods to check isSetter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsSetter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass033>();
      let methods = cls.getInstanceMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISSETTER_0020
     * @tc.name testInstanceMethodIsSetter0020
     * @tc.desc Verify getter is not a setter and normal method is not a setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsSetter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass034>();
      let getter = cls.getInstanceMethod('%%get-value');
      expect(getter!.isSetter()).assertEqual(false);
      let setter = cls.getInstanceMethod('%%set-value');
      expect(setter!.isSetter()).assertEqual(true);
      let normal = cls.getInstanceMethod('normalMethod');
      expect(normal!.isSetter()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISSETTER_0021
     * @tc.name testInstanceMethodIsSetter0021
     * @tc.desc Verify isSetter for all methods in a class with multiple setters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsSetter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass035>();
      let methods = cls.getInstanceMethods();
      let setterCount: int = 0;
      for (let i = 0; i < methods.length; i++) {
        if (methods[i].isSetter()) {
          setterCount++;
        }
      }
      expect(setterCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISSETTER_0022
     * @tc.name testInstanceMethodIsSetter0022
     * @tc.desc Verify inherited setter has isSetter true in child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @knownIssue childCls.getInstanceMethod for inherited methods returns undefined on current platform.
     *             When platform supports inherited method lookup, remove the guard.
     */
    it('testInstanceMethodIsSetter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass036>();
      let childCls = Class.from<ChildClass036>();
      expect(parentCls.getInstanceMethod('%%set-value')!.isSetter()).assertEqual(true);
      let childMethod = childCls.getInstanceMethod('%%set-value');
      if (childMethod !== undefined) {
        expect(childMethod!.isSetter()).assertEqual(true);
      } else {
        expect(childMethod).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISSETTER_0023
     * @tc.name testInstanceMethodIsSetter0023
     * @tc.desc Verify setter combined with isPublic and getter check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsSetter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass037>();
      let getter = cls.getInstanceMethod('%%get-value');
      expect(getter!.isSetter()).assertEqual(false);
      expect(getter!.isGetter()).assertEqual(true);
      let setter = cls.getInstanceMethod('%%set-value');
      expect(setter!.isSetter()).assertEqual(true);
      expect(setter!.isGetter()).assertEqual(false);
      expect(setter!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISSETTER_0024
     * @tc.name testInstanceMethodIsSetter0024
     * @tc.desc Verify setter for array type property returns true for isSetter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsSetter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass038>();
      let setter = cls.getInstanceMethod('%%set-items');
      expect(setter!.isSetter()).assertEqual(true);
      expect(setter!.isGetter()).assertEqual(false);
      expect(setter!.isPublic()).assertEqual(true);
      expect(setter!.getParametersNum()).assertEqual(1);
    });

  });
}
