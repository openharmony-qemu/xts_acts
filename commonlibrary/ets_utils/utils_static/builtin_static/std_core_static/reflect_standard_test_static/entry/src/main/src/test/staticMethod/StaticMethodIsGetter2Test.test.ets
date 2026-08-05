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

class TagGetterClass {
  private static _tag: string = '';
  public static get tag(): string { return TagGetterClass._tag; }
}

abstract class AbstractClass014 {
  private static _amount: int = 0;
  public static get amount(): int { return AbstractClass014._amount; }
}

final class FinalClass015 {
  private static _total: int = 0;
  public static get total(): int { return FinalClass015._total; }
}

class NullReturnGetterClass {
  private static _nullableVal: string | null = null;
  public static get nullableVal(): string | null {
    return NullReturnGetterClass._nullableVal;
  }
}

class GetterSetterPairClass {
  private static _flag: boolean = false;
  public static get flag(): boolean { return GetterSetterPairClass._flag; }
  public static set flag(value: boolean) { GetterSetterPairClass._flag = value; }
}

class CrossGetterOwnerClass {
  private static _name: string = '';
  public static get name(): string { return CrossGetterOwnerClass._name; }
}

class CrossGetterMultiClass {
  private static _a: int = 0;
  private static _b: string = '';
  public static get a(): int { return CrossGetterMultiClass._a; }
  public static get b(): string { return CrossGetterMultiClass._b; }
}

class CrossGetterMixedClass {
  private static _only: int = 0;
  private static _pair: string = '';
  public static get only(): int { return CrossGetterMixedClass._only; }
  public static get pair(): string { return CrossGetterMixedClass._pair; }
  public static set pair(value: string) { CrossGetterMixedClass._pair = value; }
  public static normalMethod(): string { return 'n'; }
}

class NotGetterGetNameClass {
  public static getName(param: string): string { return 'name: ' + param; }
}

class FourGetterClass {
  private static _a: string = '';
  private static _b: int = 0;
  private static _c: boolean = false;
  private static _d: float = 0.0f;
  public static get a(): string { return FourGetterClass._a; }
  public static get b(): int { return FourGetterClass._b; }
  public static get c(): boolean { return FourGetterClass._c; }
  public static get d(): float { return FourGetterClass._d; }
}

class SetterOnlyClass {
  private static _val: string = '';
  public static set value(v: string) { SetterOnlyClass._val = v; }
}

class PublicNormalMethodClass {
  public static normalMethod(): string { return 'normal'; }
}

class NestedGetterInner {
  private static _val: string = '';
  public static get nestedGetter(): string { return NestedGetterInner._val; }
}

class ParentGetterClass {
  private static _name: string = '';
  public static get name(): string { return ParentGetterClass._name; }
}

class ChildGetterClass extends ParentGetterClass {
}

@interface deprecated {
  fromVersion: string
}

class DeprecatedGetterClass {
  private static _val: string = '';
  @deprecated("6.0")
  public static get deprecatedVal(): string { return DeprecatedGetterClass._val; }
}

class FixedArrayGetterClass {
  private static _arr: Array<int> = [1, 2];
  public static get arr(): Array<int> { return FixedArrayGetterClass._arr; }
}

class MixedGetterSetterClass {
  private static _getterOnly: string = '';
  private static _setterOnly: string = '';
  private static _pair: int = 0;
  public static get getterOnly(): string { return MixedGetterSetterClass._getterOnly; }
  public static set setterOnly(v: string) { MixedGetterSetterClass._setterOnly = v; }
  public static get pair(): int { return MixedGetterSetterClass._pair; }
  public static set pair(v: int) { MixedGetterSetterClass._pair = v; }
  public static normal(): string { return 'normal'; }
}

class GetterSetterMutualClass {
  private static _value: int = 0;
  public static get value(): int { return GetterSetterMutualClass._value; }
  public static set value(v: int) { GetterSetterMutualClass._value = v; }
}
class ParentGetterSetterClass {
  protected static _val: int = 0;
  public static get val(): int { return ParentGetterSetterClass._val; }
  public static set val(v: int) { ParentGetterSetterClass._val = v; }
}
class ChildGetterSetterClass extends ParentGetterSetterClass {
  public static get val(): int { return ParentGetterSetterClass._val; }
  public static set val(v: int) { ParentGetterSetterClass._val = v; }
}
final class FinalGetterClass {
  private static _val: int = 0;
  public static get finalVal(): int { return FinalGetterClass._val; }
}
class SetReturnGetterClass {
  private static _set: Set<string> = new Set<string>();
  public static get setProp(): Set<string> { return SetReturnGetterClass._set; }
}
class HighPrecisionGetterClass {
  private static _dval: double = 3.1415926535;
  public static get doubleVal(): double { return HighPrecisionGetterClass._dval; }
  private static _fval: float = 1.5f;
  public static get floatVal(): float { return HighPrecisionGetterClass._fval; }
  private static _lval: long = 9223372036854775807;
  public static get longVal(): long { return HighPrecisionGetterClass._lval; }
}
class CallableNotGetterClass {
  public static $_invoke(): int { return 42; }
}
class GenericGetterClass<T> {
  private static _val: string = '';
  public static get value(): string { return GenericGetterClass._val; }
}
export default function StaticMethodIsGetter2Test(): void {
  describe('StaticMethodIsGetter2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_0100
     * @tc.name testStaticMethodIsGetter2_001
     * @tc.desc Verify isGetter() on a getter that returns null — getter itself is still a getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NullReturnGetterClass>();
      let method = cls.getStaticMethod('%%get-nullableVal');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_0200
     * @tc.name testStaticMethodIsGetter2_002
     * @tc.desc Verify isGetter() returns false on the setter method of a getter/setter pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GetterSetterPairClass>();
      let setter = cls.getStaticMethod('%%set-flag');
      expect(setter !== undefined).assertTrue();
      expect(setter!.isSetter()).assertTrue();
      expect(setter!.isGetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_0300
     * @tc.name testStaticMethodIsGetter2_003
     * @tc.desc Verify isGetter() combined with equals() returns true for two identical getter static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CrossGetterOwnerClass>();
      let m1 = cls.getStaticMethod('%%get-name');
      let m2 = cls.getStaticMethod('%%get-name');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.isGetter()).assertTrue();
      expect(m1!.equals(m2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_0400
     * @tc.name testStaticMethodIsGetter2_004
     * @tc.desc Verify isGetter() combined with equals() returns false for getter and setter static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CrossGetterMixedClass>();
      let getter = cls.getStaticMethod('%%get-pair');
      let setter = cls.getStaticMethod('%%set-pair');
      expect(getter !== undefined).assertTrue();
      expect(setter !== undefined).assertTrue();
      expect(getter!.isGetter()).assertTrue();
      expect(setter!.isSetter()).assertTrue();
      expect(getter!.equals(setter!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_0500
     * @tc.name testStaticMethodIsGetter2_005
     * @tc.desc Verify isGetter() combined with getOwner() returns the declaring class of a getter static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CrossGetterOwnerClass>();
      let method = cls.getStaticMethod('%%get-name');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
      let owner = method!.getOwner();
      expect(owner !== undefined).assertTrue();
      expect(owner.getName()).assertContain('CrossGetterOwnerClass');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_0600
     * @tc.name testStaticMethodIsGetter2_006
     * @tc.desc Verify isGetter() combined with getParameterTypes() returns an empty array for a getter static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CrossGetterMultiClass>();
      let method = cls.getStaticMethod('%%get-a');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_0700
     * @tc.name testStaticMethodIsGetter2_007
     * @tc.desc Verify isGetter() and equals() and getOwner() on a getter static method of a final class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FinalClass015>();
      let m1 = cls.getStaticMethod('%%get-total');
      let m2 = cls.getStaticMethod('%%get-total');
      expect(m1 !== undefined).assertTrue();
      expect(m1!.isGetter()).assertTrue();
      expect(m1!.equals(m2!)).assertTrue();
      let owner = m1!.getOwner();
      expect(owner.getName()).assertContain('FinalClass015');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_0800
     * @tc.name testStaticMethodIsGetter2_008
     * @tc.desc Verify isGetter() and equals() and getOwner() on a getter static method of an abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AbstractClass014>();
      let m1 = cls.getStaticMethod('%%get-amount');
      let m2 = cls.getStaticMethod('%%get-amount');
      expect(m1 !== undefined).assertTrue();
      expect(m1!.isGetter()).assertTrue();
      expect(m1!.equals(m2!)).assertTrue();
      let owner = m1!.getOwner();
      expect(owner.getName()).assertContain('AbstractClass014');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_0900
     * @tc.name testStaticMethodIsGetter2_009
     * @tc.desc Verify isGetter() combined with isNative() returns false for a user-defined getter static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<LabelGetterClass>();
      let method = cls.getStaticMethod('%%get-label');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
      expect(method!.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_1000
     * @tc.name testStaticMethodIsGetter2_010
     * @tc.desc Verify isGetter() returns false for method named getXxx with parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NotGetterGetNameClass>();
      let method = cls.getStaticMethod('getName');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_1100
     * @tc.name testStaticMethodIsGetter2_011
     * @tc.desc Verify isGetter() counts four getters in a class correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FourGetterClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let getterCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isGetter()) {
          getterCount++;
        }
      }
      expect(getterCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_1200
     * @tc.name testStaticMethodIsGetter2_012
     * @tc.desc Verify isGetter() returns false for setter-only method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SetterOnlyClass>();
      let method = cls.getStaticMethod('%%set-value');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertFalse();
      expect(method!.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_1300
     * @tc.name testStaticMethodIsGetter2_013
     * @tc.desc Verify isGetter() returns false for normal public method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PublicNormalMethodClass>();
      let method = cls.getStaticMethod('normalMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertFalse();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_1400
     * @tc.name testStaticMethodIsGetter2_014
     * @tc.desc Verify isGetter() on getter in nested class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NestedGetterInner>();
      let method = cls.getStaticMethod('%%get-nestedGetter');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_1500
     * @tc.name testStaticMethodIsGetter2_015
     * @tc.desc Verify inherited static getter is not exposed via child class reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ChildGetterClass>();
      let method = cls.getStaticMethod('%%get-name');
      expect(method === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_1600
     * @tc.name testStaticMethodIsGetter2_016
     * @tc.desc Verify isGetter() combined with isPublic() on public getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<TitleGetterClass>();
      let method = cls.getStaticMethod('%%get-title');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_1700
     * @tc.name testStaticMethodIsGetter2_017
     * @tc.desc Verify isGetter() returns true for deprecated getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<DeprecatedGetterClass>();
      let method = cls.getStaticMethod('%%get-deprecatedVal');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_1800
     * @tc.name testStaticMethodIsGetter2_018
     * @tc.desc Verify isGetter() returns true for getter returning FixedArray type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FixedArrayGetterClass>();
      let method = cls.getStaticMethod('%%get-arr');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_1900
     * @tc.name testStaticMethodIsGetter2_019
     * @tc.desc Verify isGetter() combined with getReturnType() returns correct return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<TagGetterClass>();
      let method = cls.getStaticMethod('%%get-tag');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
      let rt = method!.getReturnType();
      expect(rt.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_2000
     * @tc.name testStaticMethodIsGetter2_020
     * @tc.desc Verify isGetter() combined with getParametersNum() returns 0 for getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<LabelGetterClass>();
      let method = cls.getStaticMethod('%%get-label');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
      expect(method!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_2100
     * @tc.name testStaticMethodIsGetter2_021
     * @tc.desc Verify isGetter() returns false for setter-only and normal methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MixedGetterSetterClass>();
      let getter = cls.getStaticMethod('%%get-pair');
      let setter = cls.getStaticMethod('%%set-pair');
      let normal = cls.getStaticMethod('normal');
      let setterOnly = cls.getStaticMethod('%%set-setterOnly');
      expect(getter !== undefined).assertTrue();
      expect(setter !== undefined).assertTrue();
      expect(normal !== undefined).assertTrue();
      expect(setterOnly !== undefined).assertTrue();
      expect(getter!.isGetter()).assertTrue();
      expect(setter!.isGetter()).assertFalse();
      expect(normal!.isGetter()).assertFalse();
      expect(setterOnly!.isGetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_2200
     * @tc.name testStaticMethodIsGetter2_022
     * @tc.desc Verify isGetter() consistency across multiple calls on same getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<TagGetterClass>();
      let method = cls.getStaticMethod('%%get-tag');
      expect(method !== undefined).assertTrue();
      for (let i: int = 0; i < 10; i++) {
        expect(method!.isGetter()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_2300
     * @tc.name testStaticMethodIsGetter2_023
     * @tc.desc Verify isGetter() + isSetter() + isPublic() full mutual exclusion validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GetterSetterMutualClass>();
      let getter = cls.getStaticMethod('%%get-value');
      let setter = cls.getStaticMethod('%%set-value');
      expect(getter !== undefined).assertTrue();
      expect(setter !== undefined).assertTrue();
      expect(getter!.isGetter()).assertTrue();
      expect(getter!.isSetter()).assertFalse();
      expect(getter!.isPublic()).assertTrue();
      expect(setter!.isSetter()).assertTrue();
      expect(setter!.isGetter()).assertFalse();
      expect(setter!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_2400
     * @tc.name testStaticMethodIsGetter2_024
     * @tc.desc Verify parent getter + child setter same name, child reflection gets child method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls: Class = Class.from<ChildGetterSetterClass>();
      let method = childCls.getStaticMethod('%%get-val');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
      let setter = childCls.getStaticMethod('%%set-val');
      expect(setter !== undefined).assertTrue();
      expect(setter!.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_2500
     * @tc.name testStaticMethodIsGetter2_025
     * @tc.desc Verify isGetter() + invoke() getter invocation and return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GetterSetterMutualClass>();
      let setter = cls.getStaticMethod('%%set-value');
      let getter = cls.getStaticMethod('%%get-value');
      expect(setter !== undefined).assertTrue();
      expect(getter !== undefined).assertTrue();
      expect(getter!.isGetter()).assertTrue();
      setter!.invoke([99]);
      let result: int = getter!.invoke() as int;
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_2600
     * @tc.name testStaticMethodIsGetter2_026
     * @tc.desc Verify isGetter() returns true for getter in final class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FinalGetterClass>();
      let method = cls.getStaticMethod('%%get-finalVal');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_2700
     * @tc.name testStaticMethodIsGetter2_027
     * @tc.desc Verify isGetter() returns true for getter returning Set type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SetReturnGetterClass>();
      let method = cls.getStaticMethod('%%get-setProp');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertTrue();
      let rt = method!.getReturnType();
      expect(rt.getName()).assertEqual('std.core.Set');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_2800
     * @tc.name testStaticMethodIsGetter2_028
     * @tc.desc Verify isGetter() returns false for $_invoke callable method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CallableNotGetterClass>();
      let method = cls.getStaticMethod('$_invoke');
      expect(method !== undefined).assertTrue();
      expect(method!.isGetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_2900
     * @tc.name testStaticMethodIsGetter2_029
     * @tc.desc Verify isGetter returns true for getter with double float and long return types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<HighPrecisionGetterClass>();
      let doubleGetter = cls.getStaticMethod('%%get-doubleVal');
      expect(doubleGetter !== undefined).assertTrue();
      expect(doubleGetter!.isGetter()).assertTrue();
      let floatGetter = cls.getStaticMethod('%%get-floatVal');
      expect(floatGetter !== undefined).assertTrue();
      expect(floatGetter!.isGetter()).assertTrue();
      let longGetter = cls.getStaticMethod('%%get-longVal');
      expect(longGetter !== undefined).assertTrue();
      expect(longGetter!.isGetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_GETTER_TWO_3000
     * @tc.name testStaticMethodIsGetter2_030
     * @tc.desc Verify isGetter returns true for getter in generic class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsGetter2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GenericGetterClass<Object>>();
      let getter = cls.getStaticMethod('%%get-value');
      expect(getter !== undefined).assertTrue();
      expect(getter!.isGetter()).assertTrue();
    });
  });
}
