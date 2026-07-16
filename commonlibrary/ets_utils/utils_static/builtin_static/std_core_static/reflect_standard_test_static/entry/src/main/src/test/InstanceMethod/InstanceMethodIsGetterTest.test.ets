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

  public get name(): string {
    return this._name;
  }
}

class MyClass005 {
  public normalMethod(): void {
  }

  public getNameMethod(): string {
    return 'test';
  }
}

class MyClass007 {
  private _value: number = 0;

  public get value(): number {
    return this._value;
  }
}

class MyClass008 {
  private _value: number = 0;

  private get value(): number {
    return this._value;
  }
}

class MyClass009 {
  private _value: number = 0;

  protected get value(): number {
    return this._value;
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
  private _readOnly: number = 0;

  public get readOnly(): number {
    return this._readOnly;
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

  public get value(): number {
    return this._value;
  }

  public getValue(): number {
    return this._value;
  }
}

class MyClass020 {
  public normalMethod(): void {
  }

  private _value: number = 0;

  public set value(v: number) {
    this._value = v;
  }
}

class MyClass021 {
  private _value: number = 0;

  public get value(): number {
    return this._value;
  }
}

class MyClass022 {
  private _value: number = 0;

  public get value(): number {
    return this._value;
  }

  public get stringValue(): string {
    return 'test';
  }
}

class MyClass023 {
  private _num: number = 0;
  private _str: string = '';
  private _bool: boolean = false;

  public get num(): number {
    return this._num;
  }

  public get str(): string {
    return this._str;
  }

  public get bool(): boolean {
    return this._bool;
  }
}

class MyClass024 {
  private _obj: object = {};

  public get obj(): object {
    return this._obj;
  }
}

class MyClass025 {
  private _arr: number[] = [];

  public get arr(): number[] {
    return this._arr;
  }
}

class CustomType030 {
}

class MyClass030 {
  private _custom: CustomType030 = new CustomType030();

  public get custom(): CustomType030 {
    return this._custom;
  }
}

class MyClass031 {
  private _map: Map<string, number> = new Map<string, number>();

  public get map(): Map<string, number> {
    return this._map;
  }
}

class MyClass032 {
  private _set: Set<number> = new Set<number>();

  public get set(): Set<number> {
    return this._set;
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

  public get a(): number {
    return this._a;
  }

  public get b(): string {
    return this._b;
  }

  public get c(): boolean {
    return this._c;
  }
}

class ParentClass036 {
  private _value: number = 0;

  public get value(): number {
    return this._value;
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
  private _data: string[] = [];

  public get data(): string[] {
    return this._data;
  }
}

class ParentClass043 {
  private _value: number = 0;

  public get value(): number {
    return this._value;
  }
}

abstract class AbstractClass052 {
  public abstract get name(): string;
}


class CustomType053 {
}

class ParentGetter059 {
  private _val: number = 0;

  public get parentVal(): number {
    return this._val;
  }
}

class ParentGetter060 {
  private _val: number = 0;

  public get overrideVal(): number {
    return this._val;
  }
}

export default function InstanceMethodIsGetterTest(): void {
  describe('InstanceMethodIsGetterTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISGETTER_0001
     * @tc.name testInstanceMethodIsGetter0001
     * @tc.desc Verify isGetter() returns true for a getter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsGetter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let method = cls.getInstanceMethod('%%get-name');
      let isGetter = method!.isGetter();
      expect(isGetter).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISGETTER_0002
     * @tc.name testInstanceMethodIsGetter0002
     * @tc.desc Verify non-getter method returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsGetter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass005>();
      let normalMethod = cls.getInstanceMethod('normalMethod');
      expect(normalMethod!.isGetter()).assertEqual(false);
      let getNameMethod = cls.getInstanceMethod('getNameMethod');
      expect(getNameMethod!.isGetter()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISGETTER_0003
     * @tc.name testInstanceMethodIsGetter0003
     * @tc.desc Verify public getter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsGetter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
      let method = cls.getInstanceMethod('%%get-value');
      expect(method!.isGetter()).assertEqual(true);
      expect(method!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISGETTER_0004
     * @tc.name testInstanceMethodIsGetter0004
     * @tc.desc Verify private getter method lookup returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsGetter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      let method = cls.getInstanceMethod('%%get-value');
      expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISGETTER_0005
     * @tc.name testInstanceMethodIsGetter0005
     * @tc.desc Verify protected getter method lookup returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsGetter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass009>();
      let method = cls.getInstanceMethod('%%get-value');
      expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISGETTER_0006
     * @tc.name testInstanceMethodIsGetter0006
     * @tc.desc Verify getter and setter are mutually exclusive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsGetter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass012>();
      let getter = cls.getInstanceMethod('%%get-value');
      expect(getter!.isGetter()).assertEqual(true);
      expect(getter!.isSetter()).assertEqual(false);
      let setter = cls.getInstanceMethod('%%set-value');
      expect(setter!.isGetter()).assertEqual(false);
      expect(setter!.isSetter()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISGETTER_0007
     * @tc.name testInstanceMethodIsGetter0007
     * @tc.desc Verify read-only property only has getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsGetter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass013>();
      let getter = cls.getInstanceMethod('%%get-readOnly');
      expect(getter!.getName()).assertEqual('%%get-readOnly');
      expect(getter!.isGetter()).assertEqual(true);
      let setter = cls.getInstanceMethod('%%set-readOnly');
      expect(setter).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISGETTER_0008
     * @tc.name testInstanceMethodIsGetter0008
     * @tc.desc Verify read-write property has both getter and setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsGetter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass014>();
      let getter = cls.getInstanceMethod('%%get-readWrite');
      let setter = cls.getInstanceMethod('%%set-readWrite');
      expect(getter!.getName()).assertEqual('%%get-readWrite');
      expect(getter!.isGetter()).assertEqual(true);
      expect(setter!.getName()).assertEqual('%%set-readWrite');
      expect(setter!.isSetter()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISGETTER_0009
     * @tc.name testInstanceMethodIsGetter0009
     * @tc.desc Verify identifying getter methods using isGetter()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsGetter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass015>();
      let methods = cls.getInstanceMethods();
      let getterCount: int = 0;
      let getterName = '';
      for (let i = 0; i < methods.length; i++) {
        let method = methods[i];
        if (method.isGetter()) {
          getterCount++;
          getterName = method.getName();
        }
      }
      expect(getterCount).assertEqual(1);
      expect(getterName).assertEqual('%%get-value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISGETTER_0010
     * @tc.name testInstanceMethodIsGetter0010
     * @tc.desc Verify non-getter method returns false and setter has correct parameter count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsGetter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass020>();
      let normalMethod = cls.getInstanceMethod('normalMethod');
      expect(normalMethod!.isGetter()).assertEqual(false);
      let setter = cls.getInstanceMethod('%%set-value');
      expect(setter!.isGetter()).assertEqual(false);
      expect(setter!.isSetter()).assertEqual(true);
      expect(setter!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISGETTER_0011
     * @tc.name testInstanceMethodIsGetter0011
     * @tc.desc Verify getter method has zero parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsGetter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass021>();
      let method = cls.getInstanceMethod('%%get-value');
      expect(method!.isGetter()).assertEqual(true);
      expect(method!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISGETTER_0012
     * @tc.name testInstanceMethodIsGetter0012
     * @tc.desc Verify getter method has return value type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsGetter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass022>();
      let numGetter = cls.getInstanceMethod('%%get-value');
      expect(numGetter!.isGetter()).assertEqual(true);
      expect(numGetter!.getReturnType().getName()).assertEqual('f64');
      let strGetter = cls.getInstanceMethod('%%get-stringValue');
      expect(strGetter!.isGetter()).assertEqual(true);
      expect(strGetter!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISGETTER_0013
     * @tc.name testInstanceMethodIsGetter0013
     * @tc.desc Verify getter for basic type properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsGetter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass023>();
      let numGetter = cls.getInstanceMethod('%%get-num');
      expect(numGetter!.isGetter()).assertEqual(true);
      let strGetter = cls.getInstanceMethod('%%get-str');
      expect(strGetter!.isGetter()).assertEqual(true);
      let boolGetter = cls.getInstanceMethod('%%get-bool');
      expect(boolGetter!.isGetter()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISGETTER_0014
     * @tc.name testInstanceMethodIsGetter0014
     * @tc.desc Verify getter for object type property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsGetter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass024>();
      let method = cls.getInstanceMethod('%%get-obj');
      expect(method!.isGetter()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISGETTER_0015
     * @tc.name testInstanceMethodIsGetter0015
     * @tc.desc Verify getter for array type property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsGetter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass025>();
      let method = cls.getInstanceMethod('%%get-arr');
      expect(method!.isGetter()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISGETTER_0016
     * @tc.name testInstanceMethodIsGetter0016
     * @tc.desc Verify getter for custom class type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsGetter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass030>();
      let method = cls.getInstanceMethod('%%get-custom');
      expect(method!.isGetter()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISGETTER_0017
     * @tc.name testInstanceMethodIsGetter0017
     * @tc.desc Verify getter for Map type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsGetter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass031>();
      let method = cls.getInstanceMethod('%%get-map');
      expect(method!.isGetter()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISGETTER_0018
     * @tc.name testInstanceMethodIsGetter0018
     * @tc.desc Verify getter for Set type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsGetter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass032>();
      let method = cls.getInstanceMethod('%%get-set');
      expect(method!.isGetter()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISGETTER_0019
     * @tc.name testInstanceMethodIsGetter0019
     * @tc.desc Verify empty class has no methods to check isGetter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsGetter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass033>();
      let methods = cls.getInstanceMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISGETTER_0020
     * @tc.name testInstanceMethodIsGetter0020
     * @tc.desc Verify setter is not a getter and normal method is not a getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsGetter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass034>();
      let getter = cls.getInstanceMethod('%%get-value');
      expect(getter!.isGetter()).assertEqual(true);
      let setter = cls.getInstanceMethod('%%set-value');
      expect(setter!.isGetter()).assertEqual(false);
      let normal = cls.getInstanceMethod('normalMethod');
      expect(normal!.isGetter()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISGETTER_0021
     * @tc.name testInstanceMethodIsGetter0021
     * @tc.desc Verify isGetter for all methods in a class with multiple getters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsGetter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass035>();
      let methods = cls.getInstanceMethods();
      let getterCount: int = 0;
      for (let i = 0; i < methods.length; i++) {
        if (methods[i].isGetter()) {
          getterCount++;
        }
      }
      expect(getterCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISGETTER_0022
     * @tc.name testInstanceMethodIsGetter0022
     * @tc.desc Verify inherited getter has isGetter true in child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @knownIssue childCls.getInstanceMethod for inherited methods returns undefined on current platform.
     *             When platform supports inherited method lookup, remove the guard.
     */
    it('testInstanceMethodIsGetter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass036>();
      let childCls = Class.from<ChildClass036>();
      expect(parentCls.getInstanceMethod('%%get-value')!.isGetter()).assertEqual(true);
      let childMethod = childCls.getInstanceMethod('%%get-value');
      if (childMethod !== undefined) {
        expect(childMethod!.isGetter()).assertEqual(true);
      } else {
        expect(childMethod).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISGETTER_0023
     * @tc.name testInstanceMethodIsGetter0023
     * @tc.desc Verify getter combined with isPublic check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsGetter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass037>();
      let getter = cls.getInstanceMethod('%%get-value');
      expect(getter!.isGetter()).assertEqual(true);
      expect(getter!.isPublic()).assertEqual(true);
      let setter = cls.getInstanceMethod('%%set-value');
      expect(setter!.isGetter()).assertEqual(false);
      expect(setter!.isSetter()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISGETTER_0024
     * @tc.name testInstanceMethodIsGetter0024
     * @tc.desc Verify getter for array type property returns true for isGetter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsGetter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass038>();
      let getter = cls.getInstanceMethod('%%get-data');
      expect(getter!.isGetter()).assertEqual(true);
      expect(getter!.isSetter()).assertEqual(false);
      expect(getter!.isPublic()).assertEqual(true);
      expect(getter!.getParametersNum()).assertEqual(0);
    });

  });
}
