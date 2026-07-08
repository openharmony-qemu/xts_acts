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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

class TitleGetterClass {
  private static _title: string = '';
  public static get title(): string {
    return TitleGetterClass._title;
  }
}

class LabelGetterClass {
  private static _label: string = '';
  public static get label(): string {
    return LabelGetterClass._label;
  }
}

class NormalMethodGetterClass {
  public static normalMethod(): string { return 'normal'; }
}

class DataSetterOnlyClass {
  private static _data: string = '';
  public static set data(value: string) {
    DataSetterOnlyClass._data = value;
  }
}

class KeyGetterClass {
  private static _key: string = '';
  public static get key(): string {
    return KeyGetterClass._key;
  }
}

class SecretGetterClass {
  private static _secret: string = '';
  private static get secret(): string {
    return SecretGetterClass._secret;
  }
}

class TokenGetterClass {
  private static _token: string = '';
  protected static get token(): string {
    return TokenGetterClass._token;
  }
}

class MultiPropGetterClass {
  private static _str: string = '';
  private static _num: int = 0;
  private static _bool: boolean = true;
  public static get strProp(): string { return MultiPropGetterClass._str; }
  public static get numProp(): int { return MultiPropGetterClass._num; }
  public static get boolProp(): boolean { return MultiPropGetterClass._bool; }
}

class FullNameGetterClass {
  private static _firstName: string = '';
  private static _lastName: string = '';
  public static get fullName(): string {
    return FullNameGetterClass._firstName + ' ' + FullNameGetterClass._lastName;
  }
}

class TagGetterClass {
  private static _tag: string = '';
  public static get tag(): string { return TagGetterClass._tag; }
}

class CodeGetterClass {
  private static _code: string = '';
  public static get code(): string { return CodeGetterClass._code; }
}

class TextGetterClass {
  private static _text: string = '';
  public static get text(): string { return TextGetterClass._text; }
}

class AliasGetterSetterClass {
  private static _alias: string = '';
  public static get alias(): string { return AliasGetterSetterClass._alias; }
  public static set alias(value: string) { AliasGetterSetterClass._alias = value; }
}

abstract class AbstractClass014 {
  private static _amount: int = 0;
  public static get amount(): int { return AbstractClass014._amount; }
}

final class FinalClass015 {
  private static _total: int = 0;
  public static get total(): int { return FinalClass015._total; }
}

class ReadOnlyGetterClass {
  private static _readOnlyValue: int = 42;
  public static get readOnlyValue(): int { return ReadOnlyGetterClass._readOnlyValue; }
}

class MyPropGetterClass {
  private static _myProp: string = '';
  public static get myProp(): string { return MyPropGetterClass._myProp; }
}

class PrefixGetterClass {
  private static _prefix: string = '';
  public static get prefix(): string { return PrefixGetterClass._prefix; }
}

@interface TestAnno018 {}

class CountAnnoGetterClass {
  private static _count: int = 0;
  @TestAnno018
  public static get count(): int { return CountAnnoGetterClass._count; }
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

class AlphaBetaGetterClass {
  private static _alpha: string = '';
  private static _beta: int = 0;
  private static _gamma: boolean = true;
  public static get alpha(): string { return AlphaBetaGetterClass._alpha; }
  public static get beta(): int { return AlphaBetaGetterClass._beta; }
  public static get gamma(): boolean { return AlphaBetaGetterClass._gamma; }
}

class PathGetterClass {
  private static _path: string = '';
  public static get path(): string { return PathGetterClass._path; }
}

class InputOutputGetterClass {
  private static _input: string = '';
  private static _output: int = 0;
  public static get input(): string { return InputOutputGetterClass._input; }
  public static set input(value: string) { InputOutputGetterClass._input = value; }
  public static get output(): int { return InputOutputGetterClass._output; }
  public static normalMethod(): string { return 'ok'; }
}

class NickRankGetterClass {
  private static _nick: string = '';
  private static _rank: int = 0;
  public static get nick(): string { return NickRankGetterClass._nick; }
  public static set nick(value: string) { NickRankGetterClass._nick = value; }
  public static get rank(): int { return NickRankGetterClass._rank; }
}

export default function StaticMethodIsGetterTest(): void {
  describe('StaticMethodIsGetterTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_0100
     * @tc.name testStaticMethodIsGetter001
     * @tc.desc Verify isGetter() call with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<TitleGetterClass>();
      let method = cls.getStaticMethod('%%get-title');
      expect(method !== undefined).assertTrue();
      let isGetter: boolean = method!.isGetter();
      expect(isGetter).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_0200
     * @tc.name testStaticMethodIsGetter002
     * @tc.desc Verify isGetter() returns true for getter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<LabelGetterClass>();
      let method = cls.getStaticMethod('%%get-label');
      expect(method !== undefined).assertTrue();
      let isGetter: boolean = method!.isGetter();
      expect(isGetter).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_0300
     * @tc.name testStaticMethodIsGetter003
     * @tc.desc Verify isGetter() returns false for normal method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NormalMethodGetterClass>();
      let method = cls.getStaticMethod('normalMethod');
      expect(method !== undefined).assertTrue();
      let isGetter: boolean = method!.isGetter();
      expect(isGetter).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_0400
     * @tc.name testStaticMethodIsGetter004
     * @tc.desc Verify isGetter() returns false for setter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls004 = Class.from<DataSetterOnlyClass>();
      let method = cls004.getStaticMethod('%%set-data');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      expect(method!.isGetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_0500
     * @tc.name testStaticMethodIsGetter005
     * @tc.desc Verify isGetter() for public getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls005 = Class.from<KeyGetterClass>();
      let method = cls005.getStaticMethod('%%get-key');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_0600
     * @tc.name testStaticMethodIsGetter006
     * @tc.desc Verify private static getter is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls006 = Class.from<SecretGetterClass>();
      let method = cls006.getStaticMethod('%%get-secret');
      expect(method === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_0700
     * @tc.name testStaticMethodIsGetter007
     * @tc.desc Verify protected static getter is not accessible via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls007 = Class.from<TokenGetterClass>();
      let method = cls007.getStaticMethod('%%get-token');
      expect(method === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_0800
     * @tc.name testStaticMethodIsGetter008
     * @tc.desc Verify isGetter() for getters returning different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MultiPropGetterClass>();
      let mStr = cls.getStaticMethod('%%get-strProp');
      let mNum = cls.getStaticMethod('%%get-numProp');
      let mBool = cls.getStaticMethod('%%get-boolProp');
      expect(mStr!.isGetter()).assertTrue();
      expect(mNum!.isGetter()).assertTrue();
      expect(mBool!.isGetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_0900
     * @tc.name testStaticMethodIsGetter009
     * @tc.desc Verify isGetter() for computed property getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls009 = Class.from<FullNameGetterClass>();
      let method = cls009.getStaticMethod('%%get-fullName');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_1000
     * @tc.name testStaticMethodIsGetter010
     * @tc.desc Verify isGetter() return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<TagGetterClass>();
      let method = cls.getStaticMethod('%%get-tag');
      expect(method !== undefined).assertTrue();
      let isGetter = method!.isGetter();
      let isGetterType = Class.of(isGetter).getName();
      expect(isGetterType).assertEqual('std.core.Boolean');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_1100
     * @tc.name testStaticMethodIsGetter011
     * @tc.desc Verify getter method has zero parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls012 = Class.from<TextGetterClass>();
      let method = cls012.getStaticMethod('%%get-text');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
      expect(method!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_1200
     * @tc.name testStaticMethodIsGetter012
     * @tc.desc Verify getter and setter are mutually exclusive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AliasGetterSetterClass>();
      let getter = cls.getStaticMethod('%%get-alias');
      let setter = cls.getStaticMethod('%%set-alias');
      expect(getter !== undefined).assertTrue();
      expect(setter !== undefined).assertTrue();
      let getterCheck: boolean = getter!.isGetter() && !getter!.isSetter();
      expect(getterCheck).assertTrue();
      let setterCheck: boolean = setter!.isSetter() && !setter!.isGetter();
      expect(setterCheck).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_1300
     * @tc.name testStaticMethodIsGetter013
     * @tc.desc Verify isGetter() for abstract class getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsAbs = Class.from<AbstractClass014>();
      let method = clsAbs.getStaticMethod('%%get-amount');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_1400
     * @tc.name testStaticMethodIsGetter014
     * @tc.desc Verify isGetter() for final class getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsFin = Class.from<FinalClass015>();
      let method = clsFin.getStaticMethod('%%get-total');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_1500
     * @tc.name testStaticMethodIsGetter015
     * @tc.desc Verify isGetter() for readonly property with only getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls016 = Class.from<ReadOnlyGetterClass>();
      let method = cls016.getStaticMethod('%%get-readOnlyValue');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_1600
     * @tc.name testStaticMethodIsGetter016
     * @tc.desc Verify getter method name starts with %%get- prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls017 = Class.from<MyPropGetterClass>();
      let method = cls017.getStaticMethod('%%get-myProp');
      expect(method !== null).assertTrue();
      expect(method!.getName()).assertEqual('%%get-myProp');
      expect(method!.isGetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_1700
     * @tc.name testStaticMethodIsGetter017
     * @tc.desc Verify isGetter() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PrefixGetterClass>();
      let method = cls.getStaticMethod('%%get-prefix');
      expect(method !== undefined).assertTrue();
      let isGetter: boolean = method!.isGetter();
      expect(isGetter).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_1800
     * @tc.name testStaticMethodIsGetter018
     * @tc.desc Verify isGetter() for public getter with annotation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls019 = Class.from<CountAnnoGetterClass>();
      let method = cls019.getStaticMethod('%%get-count');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_1900
     * @tc.name testStaticMethodIsGetter019
     * @tc.desc Verify isGetter() for normal, abstract, and final class getters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsAbs = Class.from<AbstractClass021>();
      let clsFin = Class.from<FinalClass021>();
      let clsNor = Class.from<NormalClass021>();
      let m1 = clsAbs.getStaticMethod('%%get-abstractValue');
      let m2 = clsFin.getStaticMethod('%%get-finalValue');
      let m3 = clsNor.getStaticMethod('%%get-normalValue');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m3 !== undefined).assertTrue();
      expect(m1!.isGetter()).assertTrue();
      expect(m2!.isGetter()).assertTrue();
      expect(m3!.isGetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_2000
     * @tc.name testStaticMethodIsGetter020
     * @tc.desc Verify isGetter() counts getters in a class correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AlphaBetaGetterClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let getterCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isGetter()) {
          getterCount++;
        }
      }
      expect(getterCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_2100
     * @tc.name testStaticMethodIsGetter021
     * @tc.desc Verify isGetter() combined with other method property checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls023 = Class.from<PathGetterClass>();
      let method = cls023.getStaticMethod('%%get-path');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
      expect(method!.isSetter()).assertFalse();
      expect(method!.getParametersNum()).assertEqual(0);
      let rt = method!.getReturnType();
      expect(rt.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_2200
     * @tc.name testStaticMethodIsGetter022
     * @tc.desc Verify filtering getter methods from all static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<InputOutputGetterClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let getters: Array<reflect.StaticMethod> = [];
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isGetter()) {
          getters.push(methods[i]);
        }
      }
      expect(getters.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_2300
     * @tc.name testStaticMethodIsGetter023
     * @tc.desc Verify getter and setter pairing — some properties may have only getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NickRankGetterClass>();
      let nameGetter = cls.getStaticMethod('%%get-nick');
      let nameSetter = cls.getStaticMethod('%%set-nick');
      let ageGetter = cls.getStaticMethod('%%get-rank');
      let ageSetter = cls.getStaticMethod('%%set-rank');

      expect(nameGetter !== undefined).assertTrue();
      expect(nameSetter !== undefined).assertTrue();
      expect(ageGetter !== undefined).assertTrue();
      expect(nameGetter!.isGetter()).assertTrue();
      expect(nameSetter!.isSetter()).assertTrue();
      expect(ageGetter!.isGetter()).assertTrue();
      let noSetter = ageSetter === undefined;
      expect(noSetter).assertTrue();
    });
  });
}
