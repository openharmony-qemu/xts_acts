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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

class MyClass001 {
  private static _name: string = '';
  public static get name(): string {
    return MyClass001._name;
  }
}

class MyClass002 {
  private static _name: string = '';
  public static get name(): string {
    return MyClass002._name;
  }
}

class MyClass003 {
  public static normalMethod(): void {}
}

class MyClass004 {
  private static _name: string = '';
  public static set name(value: string) {
    MyClass004._name = value;
  }
}

class MyClass005 {
  private static _name: string = '';
  public static get name(): string {
    return MyClass005._name;
  }
}

class MyClass006 {
  private static _name: string = '';
  private static get name(): string {
    return MyClass006._name;
  }
}

class MyClass007 {
  private static _name: string = '';
  protected static get name(): string {
    return MyClass007._name;
  }
}

class MyClass008 {
  private static _str: string = '';
  private static _num: int = 0;
  private static _bool: boolean = true;
  public static get strProp(): string { return MyClass008._str; }
  public static get numProp(): int { return MyClass008._num; }
  public static get boolProp(): boolean { return MyClass008._bool; }
}

class MyClass009 {
  private static _firstName: string = '';
  private static _lastName: string = '';
  public static get fullName(): string {
    return MyClass009._firstName + ' ' + MyClass009._lastName;
  }
}

class MyClass010 {
  private static _name: string = '';
  public static get name(): string { return MyClass010._name; }
}

class MyClass011 {
  private static _name: string = '';
  public static get name(): string { return MyClass011._name; }
}

class MyClass012 {
  private static _name: string = '';
  public static get name(): string { return MyClass012._name; }
}

class MyClass013 {
  private static _name: string = '';
  public static get name(): string { return MyClass013._name; }
  public static set name(value: string) { MyClass013._name = value; }
}

abstract class AbstractClass014 {
  private static _value: int = 0;
  public static get value(): int { return AbstractClass014._value; }
}

final class FinalClass015 {
  private static _value: int = 0;
  public static get value(): int { return FinalClass015._value; }
}

class MyClass016 {
  private static _readOnlyValue: int = 42;
  public static get readOnlyValue(): int { return MyClass016._readOnlyValue; }
}

class MyClass017 {
  private static _myProp: string = '';
  public static get myProp(): string { return MyClass017._myProp; }
}

class MyClass018 {
  private static _name: string = '';
  public static get name(): string { return MyClass018._name; }
}

class MyClass019 {
  private static _value: int = 0;
  public static get value(): int { return MyClass019._value; }
}

abstract class AbstractClass021 {
  private static _abstractValue: int = 0;
  public static get abstractValue(): int { return AbstractClass021._abstractValue; }
}

final class FinalClass021 {
  private static _finalValue: int = 0;
  public static get finalValue(): int { return FinalClass021._finalValue; }
}

class NormalClass021 {
  private static _normalValue: int = 0;
  public static get normalValue(): int { return NormalClass021._normalValue; }
}

class MyClass022 {
  private static _prop1: string = '';
  private static _prop2: int = 0;
  private static _prop3: boolean = true;
  public static get prop1(): string { return MyClass022._prop1; }
  public static get prop2(): int { return MyClass022._prop2; }
  public static get prop3(): boolean { return MyClass022._prop3; }
}

class MyClass023 {
  private static _name: string = '';
  public static get name(): string { return MyClass023._name; }
}

class MyClass024 {
  private static _prop1: string = '';
  private static _prop2: int = 0;
  public static get prop1(): string { return MyClass024._prop1; }
  public static set prop1(value: string) { MyClass024._prop1 = value; }
  public static get prop2(): int { return MyClass024._prop2; }
  public static normalMethod(): void {}
}

class MyClass025 {
  private static _name: string = '';
  private static _age: int = 0;
  public static get name(): string { return MyClass025._name; }
  public static set name(value: string) { MyClass025._name = value; }
  public static get age(): int { return MyClass025._age; }
}

export default function StaticMethodIsGetterTest(): void {
  describe('StaticMethodIsGetterTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): void => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number STATIC_METHOD_TEST_IS_GETTER_0100
     * @tc.name testStaticMethodIsGetter001
     * @tc.desc Verify isGetter() call with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass001>();
      let method = cls.getStaticMethod('%%get-name');
      expect(method != undefined).assertTrue();
      let isGetter: boolean = method!.isGetter();
      return;
    });

    /**
     * @tc.number STATIC_METHOD_TEST_IS_GETTER_0200
     * @tc.name testStaticMethodIsGetter002
     * @tc.desc Verify isGetter() returns true for getter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass002>();
      let method = cls.getStaticMethod('%%get-name');
      expect(method != undefined).assertTrue();
      let isGetter: boolean = method!.isGetter();
      expect(isGetter).assertTrue();
      expect(typeof isGetter).assertEqual('boolean');
      return;
    });

    /**
     * @tc.number STATIC_METHOD_TEST_IS_GETTER_0300
     * @tc.name testStaticMethodIsGetter003
     * @tc.desc Verify isGetter() returns false for normal method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass003>();
      let method = cls.getStaticMethod('normalMethod');
      expect(method != undefined).assertTrue();
      let isGetter: boolean = method!.isGetter();
      expect(isGetter).assertFalse();
      return;
    });

    /**
     * @tc.number STATIC_METHOD_TEST_IS_GETTER_0400
     * @tc.name testStaticMethodIsGetter004
     * @tc.desc Verify isGetter() returns false for setter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass004>().getStaticMethod('%%set-name');
      expect(method != undefined).assertTrue();
      expect(method!.isGetter()).assertFalse();
      expect(method!.isSetter()).assertTrue();
      return;
    });

    /**
     * @tc.number STATIC_METHOD_TEST_IS_GETTER_0500
     * @tc.name testStaticMethodIsGetter005
     * @tc.desc Verify isGetter() for public getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass005>().getStaticMethod('%%get-name');
      expect(method != undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
      expect(method!.isPublic()).assertTrue();
      return;
    });

    /**
     * @tc.number STATIC_METHOD_TEST_IS_GETTER_0600
     * @tc.name testStaticMethodIsGetter006
     * @tc.desc Verify isGetter() for private getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass006>().getStaticMethod('%%get-name');
      expect(method == undefined).assertTrue();
      return;
    });

    /**
     * @tc.number STATIC_METHOD_TEST_IS_GETTER_0700
     * @tc.name testStaticMethodIsGetter007
     * @tc.desc Verify isGetter() for protected getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass007>().getStaticMethod('%%get-name');
      expect(method == undefined).assertTrue();
      return;
    });

    /**
     * @tc.number STATIC_METHOD_TEST_IS_GETTER_0800
     * @tc.name testStaticMethodIsGetter008
     * @tc.desc Verify isGetter() for getters returning different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass008>();
      expect(cls.getStaticMethod('%%get-strProp')!.isGetter()).assertTrue();
      expect(cls.getStaticMethod('%%get-numProp')!.isGetter()).assertTrue();
      expect(cls.getStaticMethod('%%get-boolProp')!.isGetter()).assertTrue();
      return;
    });

    /**
     * @tc.number STATIC_METHOD_TEST_IS_GETTER_0900
     * @tc.name testStaticMethodIsGetter009
     * @tc.desc Verify isGetter() for computed property getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass009>().getStaticMethod('%%get-fullName');
      expect(method != undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
      return;
    });

    /**
     * @tc.number STATIC_METHOD_TEST_IS_GETTER_1000
     * @tc.name testStaticMethodIsGetter010
     * @tc.desc Verify isGetter() return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass010>();
      let method = cls.getStaticMethod('%%get-name');
      expect(method != undefined).assertTrue();
      let isGetter: boolean = method!.isGetter();
      expect(typeof isGetter).assertEqual('boolean');
      expect(isGetter === true || isGetter === false).assertTrue();
      return;
    });

    /**
     * @tc.number STATIC_METHOD_TEST_IS_GETTER_1100
     * @tc.name testStaticMethodIsGetter011
     * @tc.desc Verify isGetter() returns only true or false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass011>();
      let method = cls.getStaticMethod('%%get-name');
      expect(method != undefined).assertTrue();
      let isGetter: boolean = method!.isGetter();
      expect(isGetter === true || isGetter === false).assertTrue();
      return;
    });

    /**
     * @tc.number STATIC_METHOD_TEST_IS_GETTER_1200
     * @tc.name testStaticMethodIsGetter012
     * @tc.desc Verify getter method has zero parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass012>().getStaticMethod('%%get-name');
      expect(method != undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
      expect(method!.getParametersNum()).assertEqual(0);
      return;
    });

    /**
     * @tc.number STATIC_METHOD_TEST_IS_GETTER_1300
     * @tc.name testStaticMethodIsGetter013
     * @tc.desc Verify getter and setter are mutually exclusive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass013>();
      let getter = cls.getStaticMethod('%%get-name');
      let setter = cls.getStaticMethod('%%set-name');
      expect(getter != undefined).assertTrue();
      expect(setter != undefined).assertTrue();
      expect(getter!.isGetter() && !getter!.isSetter()).assertTrue();
      expect(setter!.isSetter() && !setter!.isGetter()).assertTrue();
      return;
    });

    /**
     * @tc.number STATIC_METHOD_TEST_IS_GETTER_1400
     * @tc.name testStaticMethodIsGetter014
     * @tc.desc Verify isGetter() for abstract class getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<AbstractClass014>().getStaticMethod('%%get-value');
      expect(method != undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
      return;
    });

    /**
     * @tc.number STATIC_METHOD_TEST_IS_GETTER_1500
     * @tc.name testStaticMethodIsGetter015
     * @tc.desc Verify isGetter() for final class getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<FinalClass015>().getStaticMethod('%%get-value');
      expect(method != undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
      return;
    });

    /**
     * @tc.number STATIC_METHOD_TEST_IS_GETTER_1600
     * @tc.name testStaticMethodIsGetter016
     * @tc.desc Verify isGetter() for readonly property with only getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass016>().getStaticMethod('%%get-readOnlyValue');
      expect(method != undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
      return;
    });

    /**
     * @tc.number STATIC_METHOD_TEST_IS_GETTER_1700
     * @tc.name testStaticMethodIsGetter017
     * @tc.desc Verify getter method name starts with %%get- prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass017>().getStaticMethod('%%get-myProp');
      expect(method != null).assertTrue();
      expect(method!.getName()).assertEqual('%%get-myProp');
      expect(method!.isGetter()).assertTrue();
      return;
    });

    /**
     * @tc.number STATIC_METHOD_TEST_IS_GETTER_1800
     * @tc.name testStaticMethodIsGetter018
     * @tc.desc Verify isGetter() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass018>();
      let method = cls.getStaticMethod('%%get-name');
      expect(method != undefined).assertTrue();
      let isGetter: boolean = method!.isGetter();
      return;
    });

    /**
     * @tc.number STATIC_METHOD_TEST_IS_GETTER_1900
     * @tc.name testStaticMethodIsGetter019
     * @tc.desc Verify isGetter() for public getter with annotation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass019>().getStaticMethod('%%get-value');
      expect(method != undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
      expect(method!.isPublic()).assertTrue();
      return;
    });

    /**
     * @tc.number STATIC_METHOD_TEST_IS_GETTER_2000
     * @tc.name testStaticMethodIsGetter020
     * @tc.desc Verify isGetter() for normal, abstract, and final class getters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let m1 = Class.from<AbstractClass021>().getStaticMethod('%%get-abstractValue');
      let m2 = Class.from<FinalClass021>().getStaticMethod('%%get-finalValue');
      let m3 = Class.from<NormalClass021>().getStaticMethod('%%get-normalValue');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m3 != undefined).assertTrue();
      expect(m1!.isGetter()).assertTrue();
      expect(m2!.isGetter()).assertTrue();
      expect(m3!.isGetter()).assertTrue();
      return;
    });

    /**
     * @tc.number STATIC_METHOD_TEST_IS_GETTER_2100
     * @tc.name testStaticMethodIsGetter021
     * @tc.desc Verify isGetter() counts getters in a class correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass022>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let getterCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isGetter()) {
          getterCount++;
        }
      }
      expect(getterCount).assertEqual(3);
      return;
    });

    /**
     * @tc.number STATIC_METHOD_TEST_IS_GETTER_2200
     * @tc.name testStaticMethodIsGetter022
     * @tc.desc Verify isGetter() combined with other method property checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass023>().getStaticMethod('%%get-name');
      expect(method != undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
      expect(method!.isSetter()).assertFalse();
      expect(method!.getParametersNum()).assertEqual(0);
      expect(method!.getReturnType().getName()).assertEqual('std.core.String');
      return;
    });

    /**
     * @tc.number STATIC_METHOD_TEST_IS_GETTER_2300
     * @tc.name testStaticMethodIsGetter023
     * @tc.desc Verify filtering getter methods from all static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass024>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let getters: Array<reflect.StaticMethod> = [];
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isGetter()) {
          getters.push(methods[i]);
        }
      }
      expect(getters.length).assertEqual(2);
      return;
    });

    /**
     * @tc.number STATIC_METHOD_TEST_IS_GETTER_2400
     * @tc.name testStaticMethodIsGetter024
     * @tc.desc Verify getter and setter pairing — some properties may have only getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass025>();
      let nameGetter = cls.getStaticMethod('%%get-name');
      let nameSetter = cls.getStaticMethod('%%set-name');
      let ageGetter = cls.getStaticMethod('%%get-age');
      let ageSetter = cls.getStaticMethod('%%set-age');

      expect(nameGetter != undefined).assertTrue();
      expect(nameSetter != undefined).assertTrue();
      expect(ageGetter != undefined).assertTrue();
      expect(nameGetter!.isGetter()).assertTrue();
      expect(nameSetter!.isSetter()).assertTrue();
      expect(ageGetter!.isGetter()).assertTrue();
      expect(ageSetter == null).assertTrue();
      return;
    });
  });
}
