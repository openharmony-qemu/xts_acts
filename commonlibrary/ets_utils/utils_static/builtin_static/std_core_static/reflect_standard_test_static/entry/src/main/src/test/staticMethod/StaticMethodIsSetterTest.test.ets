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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

class TitleSetterClass {
  private static _title: string = '';
  public static set title(value: string) {
    TitleSetterClass._title = value;
  }
}

class LabelSetterClass {
  private static _label: string = '';
  public static set label(value: string) {
    LabelSetterClass._label = value;
  }
}

class NormalMethodSetterClass {
  public static normalMethod(): string { return 'normal'; }
}

class KeyGetterSetterClass {
  private static _key: string = '';
  public static get key(): string { return KeyGetterSetterClass._key; }
}

class TagSetterClass {
  private static _tag: string = '';
  public static set tag(value: string) {
    TagSetterClass._tag = value;
  }
}

class SecretSetterClass {
  private static _secret: string = '';
  private static set secret(value: string) {
    SecretSetterClass._secret = value;
  }
}

class TokenSetterClass {
  private static _token: string = '';
  protected static set token(value: string) {
    TokenSetterClass._token = value;
  }
}

class MultiPropSetterClass {
  private static _str: string = '';
  private static _num: int = 0;
  private static _bool: boolean = true;
  public static set strProp(value: string) { MultiPropSetterClass._str = value; }
  public static set numProp(value: int) { MultiPropSetterClass._num = value; }
  public static set boolProp(value: boolean) { MultiPropSetterClass._bool = value; }
}

class WriteOnlySetterClass {
  private static _writeOnlyValue: int = 0;
  public static set writeOnlyValue(value: int) {
    WriteOnlySetterClass._writeOnlyValue = value;
  }
}

class CodeSetterClass {
  private static _code: string = '';
  public static set code(value: string) {
    CodeSetterClass._code = value;
  }
}

class TextSetterClass {
  private static _text: string = '';
  public static set text(value: string) {
    TextSetterClass._text = value;
  }
}

class PathSetterClass {
  private static _path: string = '';
  public static set path(value: string) { PathSetterClass._path = value; }
}

class AliasSetterClass {
  private static _alias: string = '';
  public static set alias(value: string) { AliasSetterClass._alias = value; }
}

class PrefixGetterSetterClass {
  private static _prefix: string = '';
  public static get prefix(): string { return PrefixGetterSetterClass._prefix; }
  public static set prefix(value: string) { PrefixGetterSetterClass._prefix = value; }
}

abstract class AbstractClass015 {
  private static _amount: int = 0;
  public static set amount(value: int) { AbstractClass015._amount = value; }
}

final class FinalClass016 {
  private static _total: int = 0;
  public static set total(value: int) { FinalClass016._total = value; }
}

class MyPropSetterClass {
  private static _myProp: string = '';
  public static set myProp(value: string) { MyPropSetterClass._myProp = value; }
}

class NickSetterClass {
  private static _nick: string = '';
  public static set nick(value: string) { NickSetterClass._nick = value; }
}

@interface TestAnno018 {}

class CountAnnoSetterClass {
  private static _count: int = 0;
  @TestAnno018
  public static set count(val: int) { CountAnnoSetterClass._count = val; }
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

class AlphaBetaSetterClass {
  private static _alpha: string = '';
  private static _beta: int = 0;
  private static _gamma: boolean = true;
  public static set alpha(value: string) { AlphaBetaSetterClass._alpha = value; }
  public static set beta(value: int) { AlphaBetaSetterClass._beta = value; }
  public static set gamma(value: boolean) { AlphaBetaSetterClass._gamma = value; }
}

class InputSetterClass {
  private static _input: string = '';
  public static set input(value: string) { InputSetterClass._input = value; }
}

class FirstSecondSetterClass {
  private static _first: string = '';
  private static _second: int = 0;
  public static get first(): string { return FirstSecondSetterClass._first; }
  public static set first(value: string) { FirstSecondSetterClass._first = value; }
  public static set second(value: int) { FirstSecondSetterClass._second = value; }
  public static normalMethod(): string { return 'ok'; }
}

class XySetterClass {
  private static _x: string = '';
  private static _y: int = 0;
  public static get x(): string { return XySetterClass._x; }
  public static set x(value: string) { XySetterClass._x = value; }
  public static set y(value: int) { XySetterClass._y = value; }
}

class DataGetterSetterClass {
  private static _data: string = '';
  public static get data(): string { return DataGetterSetterClass._data; }
  public static set data(val: string) { DataGetterSetterClass._data = val; }
}

export default function StaticMethodIsSetterTest(): void {
  describe('StaticMethodIsSetterTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_0100
     * @tc.name testStaticMethodIsSetter001
     * @tc.desc Verify isSetter() call with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<TitleSetterClass>();
      let method = cls.getStaticMethod('%%set-title');
      expect(method !== undefined).assertTrue();
      let isSetter: boolean = method!.isSetter();
      expect(isSetter).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_0200
     * @tc.name testStaticMethodIsSetter002
     * @tc.desc Verify isSetter() returns true for setter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<LabelSetterClass>();
      let method = cls.getStaticMethod('%%set-label');
      expect(method !== undefined).assertTrue();
      let isSetter: boolean = method!.isSetter();
      expect(isSetter).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_0300
     * @tc.name testStaticMethodIsSetter003
     * @tc.desc Verify isSetter() returns false for normal method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NormalMethodSetterClass>();
      let method = cls.getStaticMethod('normalMethod');
      expect(method !== undefined).assertTrue();
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
    it('testStaticMethodIsSetter004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls004 = Class.from<KeyGetterSetterClass>();
      let method = cls004.getStaticMethod('%%get-key');
      expect(method !== undefined).assertTrue();
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
    it('testStaticMethodIsSetter005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls005 = Class.from<TagSetterClass>();
      let method = cls005.getStaticMethod('%%set-tag');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_0600
     * @tc.name testStaticMethodIsSetter006
     * @tc.desc Verify private static setter is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls006 = Class.from<SecretSetterClass>();
      let method = cls006.getStaticMethod('%%set-secret');
      expect(method === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_0700
     * @tc.name testStaticMethodIsSetter007
     * @tc.desc Verify protected static setter is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls007 = Class.from<TokenSetterClass>();
      let method = cls007.getStaticMethod('%%set-token');
      expect(method === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_0800
     * @tc.name testStaticMethodIsSetter008
     * @tc.desc Verify isSetter() for setters accepting different parameter types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MultiPropSetterClass>();
      let mStr = cls.getStaticMethod('%%set-strProp');
      let mNum = cls.getStaticMethod('%%set-numProp');
      let mBool = cls.getStaticMethod('%%set-boolProp');
      expect(mStr!.isSetter()).assertTrue();
      expect(mNum!.isSetter()).assertTrue();
      expect(mBool!.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_0900
     * @tc.name testStaticMethodIsSetter009
     * @tc.desc Verify isSetter() for write-only property with only setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls009 = Class.from<WriteOnlySetterClass>();
      let method = cls009.getStaticMethod('%%set-writeOnlyValue');
      expect(method !== undefined).assertTrue();
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
    it('testStaticMethodIsSetter010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CodeSetterClass>();
      let method = cls.getStaticMethod('%%set-code');
      expect(method !== undefined).assertTrue();
      let isSetter = method!.isSetter();
      let isSetterType = Class.of(isSetter).getName();
      expect(isSetterType).assertEqual('std.core.Boolean');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_1100
     * @tc.name testStaticMethodIsSetter011
     * @tc.desc Verify setter method has exactly one parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls012 = Class.from<PathSetterClass>();
      let method = cls012.getStaticMethod('%%set-path');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_1200
     * @tc.name testStaticMethodIsSetter012
     * @tc.desc Verify setter method returns void type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls013 = Class.from<AliasSetterClass>();
      let method = cls013.getStaticMethod('%%set-alias');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      let rt = method!.getReturnType();
      expect(rt.getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_1300
     * @tc.name testStaticMethodIsSetter013
     * @tc.desc Verify setter and getter are mutually exclusive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PrefixGetterSetterClass>();
      let getter = cls.getStaticMethod('%%get-prefix');
      let setter = cls.getStaticMethod('%%set-prefix');
      expect(getter !== undefined).assertTrue();
      expect(setter !== undefined).assertTrue();
      let setterCheck: boolean = setter!.isSetter() && !setter!.isGetter();
      expect(setterCheck).assertTrue();
      let getterCheck: boolean = getter!.isGetter() && !getter!.isSetter();
      expect(getterCheck).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_1400
     * @tc.name testStaticMethodIsSetter014
     * @tc.desc Verify isSetter() for abstract class setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsAbs = Class.from<AbstractClass015>();
      let method = clsAbs.getStaticMethod('%%set-amount');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_1500
     * @tc.name testStaticMethodIsSetter015
     * @tc.desc Verify isSetter() for final class setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsFin = Class.from<FinalClass016>();
      let method = clsFin.getStaticMethod('%%set-total');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_1600
     * @tc.name testStaticMethodIsSetter016
     * @tc.desc Verify setter method name starts with %%set- prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls017 = Class.from<MyPropSetterClass>();
      let method = cls017.getStaticMethod('%%set-myProp');
      expect(method !== null).assertTrue();
      expect(method!.getName()).assertEqual('%%set-myProp');
      expect(method!.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_1700
     * @tc.name testStaticMethodIsSetter017
     * @tc.desc Verify isSetter() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NickSetterClass>();
      let method = cls.getStaticMethod('%%set-nick');
      expect(method !== undefined).assertTrue();
      let isSetter: boolean = method!.isSetter();
      expect(isSetter).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_1800
     * @tc.name testStaticMethodIsSetter018
     * @tc.desc Verify isSetter() for public setter with annotation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls019 = Class.from<CountAnnoSetterClass>();
      let method = cls019.getStaticMethod('%%set-count');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_1900
     * @tc.name testStaticMethodIsSetter019
     * @tc.desc Verify isSetter() for normal, abstract, and final class setters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsAbs = Class.from<AbstractClass021>();
      let clsFin = Class.from<FinalClass021>();
      let clsNor = Class.from<NormalClass021>();
      let m1 = clsAbs.getStaticMethod('%%set-abstractValue');
      let m2 = clsFin.getStaticMethod('%%set-finalValue');
      let m3 = clsNor.getStaticMethod('%%set-normalValue');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m3 !== undefined).assertTrue();
      expect(m1!.isSetter()).assertTrue();
      expect(m2!.isSetter()).assertTrue();
      expect(m3!.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_2000
     * @tc.name testStaticMethodIsSetter020
     * @tc.desc Verify isSetter() counts setters in a class correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AlphaBetaSetterClass>();
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_2100
     * @tc.name testStaticMethodIsSetter021
     * @tc.desc Verify isSetter() combined with other method property checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls023 = Class.from<InputSetterClass>();
      let method = cls023.getStaticMethod('%%set-input');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      expect(method!.isGetter()).assertFalse();
      expect(method!.getParametersNum()).assertEqual(1);
      let rt = method!.getReturnType();
      expect(rt.getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_2200
     * @tc.name testStaticMethodIsSetter022
     * @tc.desc Verify filtering setter methods from all static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FirstSecondSetterClass>();
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_2300
     * @tc.name testStaticMethodIsSetter023
     * @tc.desc Verify setter and getter pairing — some properties may have only setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<XySetterClass>();
      let nameGetter = cls.getStaticMethod('%%get-x');
      let nameSetter = cls.getStaticMethod('%%set-x');
      let ageSetter = cls.getStaticMethod('%%set-y');
      let ageGetter = cls.getStaticMethod('%%get-y');

      expect(nameGetter !== undefined).assertTrue();
      expect(nameSetter !== undefined).assertTrue();
      expect(ageSetter !== undefined).assertTrue();
      expect(nameGetter!.isGetter()).assertTrue();
      expect(nameSetter!.isSetter()).assertTrue();
      expect(ageSetter!.isSetter()).assertTrue();
      let noGetter = ageGetter === undefined;
      expect(noGetter).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_2400
     * @tc.name testStaticMethodIsSetter024
     * @tc.desc Verify setter parameter type matches corresponding getter return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<DataGetterSetterClass>();
      let getter = cls.getStaticMethod('%%get-data');
      let setter = cls.getStaticMethod('%%set-data');
      expect(getter !== undefined).assertTrue();
      expect(setter !== undefined).assertTrue();
      expect(getter!.isGetter()).assertTrue();
      expect(setter!.isSetter()).assertTrue();
      let rt = getter!.getReturnType();
      expect(rt.getName()).assertEqual('std.core.String');
      expect(setter!.getParameterType(0)!.getName()).assertEqual('std.core.String');
    });
  });
}
