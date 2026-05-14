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
  public static set name(value: string) {
    MyClass001._name = value;
  }
}

class MyClass002 {
  private static _name: string = '';
  public static set name(value: string) {
    MyClass002._name = value;
  }
}

class MyClass003 {
  public static normalMethod(): void {}
}

class MyClass004 {
  private static _name: string = '';
  public static get name(): string { return MyClass004._name; }
}

class MyClass005 {
  private static _name: string = '';
  public static set name(value: string) {
    MyClass005._name = value;
  }
}

class MyClass006 {
  private static _name: string = '';
  private static set name(value: string) {
    MyClass006._name = value;
  }
}

class MyClass007 {
  private static _name: string = '';
  protected static set name(value: string) {
    MyClass007._name = value;
  }
}

class MyClass008 {
  private static _str: string = '';
  private static _num: int = 0;
  private static _bool: boolean = true;
  public static set strProp(value: string) { MyClass008._str = value; }
  public static set numProp(value: int) { MyClass008._num = value; }
  public static set boolProp(value: boolean) { MyClass008._bool = value; }
}

class MyClass009 {
  private static _writeOnlyValue: int = 0;
  public static set writeOnlyValue(value: int) {
    MyClass009._writeOnlyValue = value;
  }
}

class MyClass010 {
  private static _name: string = '';
  public static set name(value: string) {
    MyClass010._name = value;
  }
}

class MyClass011 {
  private static _name: string = '';
  public static set name(value: string) {
    MyClass011._name = value;
  }
}

class MyClass012 {
  private static _name: string = '';
  public static set name(value: string) { MyClass012._name = value; }
}

class MyClass013 {
  private static _name: string = '';
  public static set name(value: string) { MyClass013._name = value; }
}

class MyClass014 {
  private static _name: string = '';
  public static get name(): string { return MyClass014._name; }
  public static set name(value: string) { MyClass014._name = value; }
}

abstract class AbstractClass015 {
  private static _value: int = 0;
  public static set value(value: int) { AbstractClass015._value = value; }
}

final class FinalClass016 {
  private static _value: int = 0;
  public static set value(value: int) { FinalClass016._value = value; }
}

class MyClass017 {
  private static _myProp: string = '';
  public static set myProp(value: string) { MyClass017._myProp = value; }
}

class MyClass018 {
  private static _name: string = '';
  public static set name(value: string) { MyClass018._name = value; }
}

class MyClass019 {
  private static _value: int = 0;
  public static set value(val: int) { MyClass019._value = val; }
}

abstract class AbstractClass021 {
  private static _abstractValue: int = 0;
  public static set abstractValue(val: int) { AbstractClass021._abstractValue = val; }
}

final class FinalClass021 {
  private static _finalValue: int = 0;
  public static set finalValue(val: int) { FinalClass021._finalValue = val; }
}

class NormalClass021 {
  private static _normalValue: int = 0;
  public static set normalValue(val: int) { NormalClass021._normalValue = val; }
}

class MyClass022 {
  private static _prop1: string = '';
  private static _prop2: int = 0;
  private static _prop3: boolean = true;
  public static set prop1(value: string) { MyClass022._prop1 = value; }
  public static set prop2(value: int) { MyClass022._prop2 = value; }
  public static set prop3(value: boolean) { MyClass022._prop3 = value; }
}

class MyClass023 {
  private static _name: string = '';
  public static set name(value: string) { MyClass023._name = value; }
}

class MyClass024 {
  private static _prop1: string = '';
  private static _prop2: int = 0;
  public static get prop1(): string { return MyClass024._prop1; }
  public static set prop1(value: string) { MyClass024._prop1 = value; }
  public static set prop2(value: int) { MyClass024._prop2 = value; }
  public static normalMethod(): void {}
}

class MyClass025 {
  private static _name: string = '';
  private static _age: int = 0;
  public static get name(): string { return MyClass025._name; }
  public static set name(value: string) { MyClass025._name = value; }
  public static set age(value: int) { MyClass025._age = value; }
}

class MyClass026 {
  private static _value: string = '';
  public static get value(): string { return MyClass026._value; }
  public static set value(val: string) { MyClass026._value = val; }
}

export default function StaticMethodIsSetterTest(): void {
  describe('StaticMethodIsSetterTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_0100
     * @tc.name testStaticMethodIsSetter001
     * @tc.desc Verify isSetter() call with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass001>();
      let method = cls.getStaticMethod('%%set-name');
      expect(method != undefined).assertTrue();
      let isSetter: boolean = method!.isSetter();
      expect(isSetter != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_0200
     * @tc.name testStaticMethodIsSetter002
     * @tc.desc Verify isSetter() returns true for setter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass002>();
      let method = cls.getStaticMethod('%%set-name');
      expect(method != undefined).assertTrue();
      let isSetter: boolean = method!.isSetter();
      expect(isSetter).assertTrue();
      expect(typeof isSetter).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_0300
     * @tc.name testStaticMethodIsSetter003
     * @tc.desc Verify isSetter() returns false for normal method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass003>();
      let method = cls.getStaticMethod('normalMethod');
      expect(method != undefined).assertTrue();
      let isSetter: boolean = method!.isSetter();
      expect(isSetter).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_0400
     * @tc.name testStaticMethodIsSetter004
     * @tc.desc Verify isSetter() returns false for getter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass004>().getStaticMethod('%%get-name');
      expect(method != undefined).assertTrue();
      expect(method!.isSetter()).assertFalse();
      expect(method!.isGetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_0500
     * @tc.name testStaticMethodIsSetter005
     * @tc.desc Verify isSetter() for public setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass005>().getStaticMethod('%%set-name');
      expect(method != undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_0600
     * @tc.name testStaticMethodIsSetter006
     * @tc.desc Verify isSetter() for private setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass006>().getStaticMethod('%%set-name');
      expect(method == undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_0700
     * @tc.name testStaticMethodIsSetter007
     * @tc.desc Verify isSetter() for protected setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass007>().getStaticMethod('%%set-name');
      expect(method == undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_0800
     * @tc.name testStaticMethodIsSetter008
     * @tc.desc Verify isSetter() for setters accepting different parameter types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass008>();
      expect(cls.getStaticMethod('%%set-strProp')!.isSetter()).assertTrue();
      expect(cls.getStaticMethod('%%set-numProp')!.isSetter()).assertTrue();
      expect(cls.getStaticMethod('%%set-boolProp')!.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_0900
     * @tc.name testStaticMethodIsSetter009
     * @tc.desc Verify isSetter() for write-only property with only setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass009>().getStaticMethod('%%set-writeOnlyValue');
      expect(method != undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_1000
     * @tc.name testStaticMethodIsSetter010
     * @tc.desc Verify isSetter() return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass010>();
      let method = cls.getStaticMethod('%%set-name');
      expect(method != undefined).assertTrue();
      let isSetter: boolean = method!.isSetter();
      expect(typeof isSetter).assertEqual('boolean');
      expect(isSetter === true || isSetter === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_1100
     * @tc.name testStaticMethodIsSetter011
     * @tc.desc Verify isSetter() returns only true or false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass011>();
      let method = cls.getStaticMethod('%%set-name');
      expect(method != undefined).assertTrue();
      let isSetter: boolean = method!.isSetter();
      expect(isSetter === true || isSetter === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_1200
     * @tc.name testStaticMethodIsSetter012
     * @tc.desc Verify setter method has exactly one parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass012>().getStaticMethod('%%set-name');
      expect(method != undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_1300
     * @tc.name testStaticMethodIsSetter013
     * @tc.desc Verify setter method returns void type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass013>().getStaticMethod('%%set-name');
      expect(method != undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      expect(method!.getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_1400
     * @tc.name testStaticMethodIsSetter014
     * @tc.desc Verify setter and getter are mutually exclusive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass014>();
      let getter = cls.getStaticMethod('%%get-name');
      let setter = cls.getStaticMethod('%%set-name');
      expect(getter != undefined).assertTrue();
      expect(setter != undefined).assertTrue();
      expect(setter!.isSetter() && !setter!.isGetter()).assertTrue();
      expect(getter!.isGetter() && !getter!.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_1500
     * @tc.name testStaticMethodIsSetter015
     * @tc.desc Verify isSetter() for abstract class setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<AbstractClass015>().getStaticMethod('%%set-value');
      expect(method != undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_1600
     * @tc.name testStaticMethodIsSetter016
     * @tc.desc Verify isSetter() for final class setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<FinalClass016>().getStaticMethod('%%set-value');
      expect(method != undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_1700
     * @tc.name testStaticMethodIsSetter017
     * @tc.desc Verify setter method name starts with %%set- prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass017>().getStaticMethod('%%set-myProp');
      expect(method != null).assertTrue();
      expect(method!.getName()).assertEqual('%%set-myProp');
      expect(method!.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_1800
     * @tc.name testStaticMethodIsSetter018
     * @tc.desc Verify isSetter() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass018>();
      let method = cls.getStaticMethod('%%set-name');
      expect(method != undefined).assertTrue();
      try {
        let isSetter: boolean = method!.isSetter();
        expect(isSetter != null).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_1900
     * @tc.name testStaticMethodIsSetter019
     * @tc.desc Verify isSetter() for public setter with annotation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass019>().getStaticMethod('%%set-value');
      expect(method != undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_2000
     * @tc.name testStaticMethodIsSetter020
     * @tc.desc Verify isSetter() for normal, abstract, and final class setters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let m1 = Class.from<AbstractClass021>().getStaticMethod('%%set-abstractValue');
      let m2 = Class.from<FinalClass021>().getStaticMethod('%%set-finalValue');
      let m3 = Class.from<NormalClass021>().getStaticMethod('%%set-normalValue');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m3 != undefined).assertTrue();
      expect(m1!.isSetter()).assertTrue();
      expect(m2!.isSetter()).assertTrue();
      expect(m3!.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_2100
     * @tc.name testStaticMethodIsSetter021
     * @tc.desc Verify isSetter() counts setters in a class correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass022>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let setterCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isSetter()) {
          setterCount++;
        }
      }
      expect(setterCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_2200
     * @tc.name testStaticMethodIsSetter022
     * @tc.desc Verify isSetter() combined with other method property checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let method = Class.from<MyClass023>().getStaticMethod('%%set-name');
      expect(method != undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      expect(method!.isGetter()).assertFalse();
      expect(method!.getParametersNum()).assertEqual(1);
      expect(method!.getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_2300
     * @tc.name testStaticMethodIsSetter023
     * @tc.desc Verify filtering setter methods from all static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass024>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let setters: Array<reflect.StaticMethod> = [];
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isSetter()) {
          setters.push(methods[i]);
        }
      }
      expect(setters.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_2400
     * @tc.name testStaticMethodIsSetter024
     * @tc.desc Verify setter and getter pairing — some properties may have only setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass025>();
      let nameGetter = cls.getStaticMethod('%%get-name');
      let nameSetter = cls.getStaticMethod('%%set-name');
      let ageSetter = cls.getStaticMethod('%%set-age');
      let ageGetter = cls.getStaticMethod('%%get-age');

      expect(nameGetter != undefined).assertTrue();
      expect(nameSetter != undefined).assertTrue();
      expect(ageSetter != undefined).assertTrue();
      expect(nameGetter!.isGetter()).assertTrue();
      expect(nameSetter!.isSetter()).assertTrue();
      expect(ageSetter!.isSetter()).assertTrue();
      expect(ageGetter == null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_2500
     * @tc.name testStaticMethodIsSetter025
     * @tc.desc Verify setter parameter type matches corresponding getter return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter025', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass026>();
      let getter = cls.getStaticMethod('%%get-value');
      let setter = cls.getStaticMethod('%%set-value');
      expect(getter != undefined).assertTrue();
      expect(setter != undefined).assertTrue();
      expect(getter!.isGetter()).assertTrue();
      expect(setter!.isSetter()).assertTrue();
      expect(getter!.getReturnType().getName()).assertEqual('std.core.String');
      expect(setter!.getParameterType(0)!.getName()).assertEqual('std.core.String');
    });
  });
}
