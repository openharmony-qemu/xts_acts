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

class TagSetterClass {
  private static _tag: string = '';
  public static set tag(value: string) {
    TagSetterClass._tag = value;
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

class PathSetterClass {
  private static _path: string = '';
  public static set path(value: string) { PathSetterClass._path = value; }
}

class AliasSetterClass {
  private static _alias: string = '';
  public static set alias(value: string) { AliasSetterClass._alias = value; }
}

abstract class AbstractClass015 {
  private static _amount: int = 0;
  public static set amount(value: int) { AbstractClass015._amount = value; }
}

final class FinalClass016 {
  private static _total: int = 0;
  public static set total(value: int) { FinalClass016._total = value; }
}

class DataGetterSetterClass {
  private static _data: string = '';
  public static get data(): string { return DataGetterSetterClass._data; }
  public static set data(val: string) { DataGetterSetterClass._data = val; }
}

class CrossSetterOwnerClass {
  private static _name: string = '';
  public static set name(value: string) { CrossSetterOwnerClass._name = value; }
}

class CrossSetterMixedClass {
  private static _pair: string = '';
  public static get pair(): string { return CrossSetterMixedClass._pair; }
  public static set pair(value: string) { CrossSetterMixedClass._pair = value; }
}

class MultiParamSetterClass {
  private static _val: string = '';
  public static setValue(a: string, b: int): string { MultiParamSetterClass._val = a; return 'ok'; }
}

class SixSetterClass {
  private static _a: string = '';
  private static _b: int = 0;
  private static _c: boolean = false;
  private static _d: float = 0.0f;
  private static _e: string = '';
  private static _f: int = 0;
  public static set a(value: string) { SixSetterClass._a = value; }
  public static set b(value: int) { SixSetterClass._b = value; }
  public static set c(value: boolean) { SixSetterClass._c = value; }
  public static set d(value: float) { SixSetterClass._d = value; }
  public static set e(value: string) { SixSetterClass._e = value; }
  public static set f(value: int) { SixSetterClass._f = value; }
}

class GetterOnlyClass {
  private static _val: string = '';
  public static get value(): string { return GetterOnlyClass._val; }
}

class NestedSetterInner {
  private static _val: string = '';
  public static set value(v: string) { NestedSetterInner._val = v; }
}

class ParentSetterClass {
  private static _name: string = '';
  public static set name(v: string) { ParentSetterClass._name = v; }
}

class ChildSetterClass extends ParentSetterClass {
}

@interface deprecated {
  fromVersion: string
}

class DeprecatedSetterClass {
  private static _val: string = '';
  @deprecated("6.0")
  public static set deprecatedVal(v: string) { DeprecatedSetterClass._val = v; }
}

class FixedArrayParamSetterClass {
  private static _arr: Array<int> = [];
  public static set arr(v: Array<int>) { FixedArrayParamSetterClass._arr = v; }
}

class PairGetterSetterClass {
  private static _val: string = '';
  public static get val(): string { return PairGetterSetterClass._val; }
  public static set val(v: string) { PairGetterSetterClass._val = v; }
}

class TypeMatchGetterClass {
  private static _num: int = 0;
  public static get num(): int { return TypeMatchGetterClass._num; }
  public static set num(v: int) { TypeMatchGetterClass._num = v; }
}

class ParentSetterChildGetterClass extends ParentSetterClass {
  public static get name(): string { return 'child'; }
}
final class FinalSetterClass {
  private static _val: int = 0;
  public static set finalVal(v: int) { FinalSetterClass._val = v; }
}
class SetParamSetterClass {
  private static _set: Set<string> = new Set<string>();
  public static set setProp(v: Set<string>) { SetParamSetterClass._set = v; }
}
class CallableNotSetterClass {
  public static $_invoke(): int { return 42; }
}
class TripleModifierSetterA1 {
  private static _val: string = '';
  public static set tripleVal(value: string) { TripleModifierSetterA1._val = value; }
}
class MixedAccessSetterA2 {
  private static _val: string = '';
  public static set mixedVal(value: string) { MixedAccessSetterA2._val = value; }
  private static normalPrivate(): string { return 'private'; }
  protected static normalProtected(): string { return 'protected'; }
}
class PublicOnlySettersA3 {
  private static _a: string = '';
  private static _b: int = 0;
  private static _c: boolean = true;
  public static set propA(value: string) { PublicOnlySettersA3._a = value; }
  public static set propB(value: int) { PublicOnlySettersA3._b = value; }
  public static set propC(value: boolean) { PublicOnlySettersA3._c = value; }
}
class HighFreqSetterB1 {
  private static _val: string = '';
  public static set highFreqVal(value: string) { HighFreqSetterB1._val = value; }
}
class ParentPublicSetterC1 {
  private static _parentVal: string = '';
  public static set parentVal(value: string) { ParentPublicSetterC1._parentVal = value; }
}
class ParentSameNamedSetter {
  private static _sharedVal: string = '';
  public static set sharedVal(value: string) { ParentSameNamedSetter._sharedVal = value; }
}
class ChildSameNamedSetter extends ParentSameNamedSetter {
  private static _childSharedVal: string = '';
  public static set sharedVal(value: string) { ChildSameNamedSetter._childSharedVal = value; }
}
class ParentPrivateSetterC2 {
  private static _val: string = '';
  private static set privateVal(value: string) { ParentPrivateSetterC2._val = value; }
}
class ChildPrivateInheritC2 extends ParentPrivateSetterC2 {}
class ParentProtectedSetterC3 {
  private static _val: string = '';
  protected static set protectedVal(value: string) { ParentProtectedSetterC3._val = value; }
}
class ChildPublicSetterC3 extends ParentProtectedSetterC3 {
  private static _childVal: string = '';
  public static set protectedVal(value: string) { ChildPublicSetterC3._childVal = value; }
}
class ParentPubSetterC4 {
  private static _val: string = '';
  public static set publicVal(value: string) { ParentPubSetterC4._val = value; }
}
class ChildPrivSetterC4 extends ParentPubSetterC4 {
  private static _childVal: string = '';
  private static set publicVal(value: string) { ChildPrivSetterC4._childVal = value; }
}
class MapParamSetterD1 {
  private static _map: Map<string, int> = new Map<string, int>();
  public static set mapProp(value: Map<string, int>) { MapParamSetterD1._map = value; }
}
class CustomDataD2 {
  public value: int = 0;
}
class CustomObjSetterD2 {
  private static _data: CustomDataD2 = new CustomDataD2();
  public static set customDataProp(value: CustomDataD2) { CustomObjSetterD2._data = value; }
}
class LongParamSetterD3 {
  private static _val: long = 0;
  public static set longProp(value: long) { LongParamSetterD3._val = value; }
}
class FloatParamSetterD4 {
  private static _val: float = 0.0f;
  public static set floatProp(value: float) { FloatParamSetterD4._val = value; }
}
class NestedArrSetterD5 {
  private static _arr: Array<Array<int>> = [[]];
  public static set nestedArrProp(value: Array<Array<int>>) { NestedArrSetterD5._arr = value; }
}
class FloatGetterSetterE1 {
  private static _val: float = 0.0f;
  public static get floatVal(): float { return FloatGetterSetterE1._val; }
  public static set floatVal(value: float) { FloatGetterSetterE1._val = value; }
}
class DoubleGetterSetterE2 {
  private static _val: double = 0.0;
  public static get doubleVal(): double { return DoubleGetterSetterE2._val; }
  public static set doubleVal(value: double) { DoubleGetterSetterE2._val = value; }
}
class LongGetterSetterE3 {
  private static _val: long = 0;
  public static get longVal(): long { return LongGetterSetterE3._val; }
  public static set longVal(value: long) { LongGetterSetterE3._val = value; }
}
class BoolGetterSetterE4 {
  private static _val: boolean = false;
  public static get boolVal(): boolean { return BoolGetterSetterE4._val; }
  public static set boolVal(value: boolean) { BoolGetterSetterE4._val = value; }
}
class MixedMethodsClassF1 {
  private static _getVal: string = '';
  private static _setVal: string = '';
  private static _setVal2: int = 0;
  public static get getOnlyProp(): string { return MixedMethodsClassF1._getVal; }
  public static set setOnlyProp(value: string) { MixedMethodsClassF1._setVal = value; }
  public static set setOnlyProp2(value: int) { MixedMethodsClassF1._setVal2 = value; }
  public static normalFunc(): string { return 'normal'; }
}
class AllPublicSettersF2 {
  private static _a: string = '';
  private static _b: int = 0;
  public static set allSetterA(value: string) { AllPublicSettersF2._a = value; }
  public static set allSetterB(value: int) { AllPublicSettersF2._b = value; }
}
class CountMethodsClassF3 {
  private static _getVal: string = '';
  private static _setVal: string = '';
  private static _setVal2: int = 0;
  private static _setVal3: boolean = true;
  public static get getMethod(): string { return CountMethodsClassF3._getVal; }
  public static set setMethod1(value: string) { CountMethodsClassF3._setVal = value; }
  public static set setMethod2(value: int) { CountMethodsClassF3._setVal2 = value; }
  public static set setMethod3(value: boolean) { CountMethodsClassF3._setVal3 = value; }
  public static normalFunc(): string { return 'normal'; }
}
class NoPrefixVoidMethodG1 {
  public static noPrefixMethod(): void {}
}
class SetNamedMethodG2 {
  public static set(): string { return 'set'; }
}
class ParentSetterG3 {
  private static _val: string = '';
  public static set sharedProp(value: string) { ParentSetterG3._val = value; }
}
class ChildGetterOverrideG3 extends ParentSetterG3 {
  private static _childVal: string = '';
  public static get sharedProp(): string { return ChildGetterOverrideG3._childVal; }
}
class ChainCombinedClassH1 {
  private static _strVal: string = '';
  private static _intVal: int = 0;
  private static _boolVal: boolean = true;
  public static set strVal(value: string) { ChainCombinedClassH1._strVal = value; }
  public static set intVal(value: int) { ChainCombinedClassH1._intVal = value; }
  public static set boolVal(value: boolean) { ChainCombinedClassH1._boolVal = value; }
}
class BatchFiveClassH2 {
  private static _a: string = '';
  private static _b: int = 0;
  private static _c: boolean = true;
  public static set propA(value: string) { BatchFiveClassH2._a = value; }
  public static set propB(value: int) { BatchFiveClassH2._b = value; }
  public static set propC(value: boolean) { BatchFiveClassH2._c = value; }
}
class GenericSetterClass<T> {
  private static _val: string = '';
  public static set value(v: string) { GenericSetterClass._val = v; }
}
export default function StaticMethodIsSetter2Test(): void {
  describe('StaticMethodIsSetter2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_0100
     * @tc.name testStaticMethodIsSetter2_001
     * @tc.desc Verify isSetter() combined with equals() returns true for two identical setter static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CrossSetterOwnerClass>();
      let m1 = cls.getStaticMethod('%%set-name');
      let m2 = cls.getStaticMethod('%%set-name');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.isSetter()).assertTrue();
      expect(m1!.equals(m2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_0200
     * @tc.name testStaticMethodIsSetter2_002
     * @tc.desc Verify isSetter() combined with equals() returns false for setter and getter static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CrossSetterMixedClass>();
      let getter = cls.getStaticMethod('%%get-pair');
      let setter = cls.getStaticMethod('%%set-pair');
      expect(getter !== undefined).assertTrue();
      expect(setter !== undefined).assertTrue();
      expect(getter!.isGetter()).assertTrue();
      expect(setter!.isSetter()).assertTrue();
      expect(setter!.equals(getter!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_0300
     * @tc.name testStaticMethodIsSetter2_003
     * @tc.desc Verify isSetter() combined with getOwner() returns the declaring class of a setter static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CrossSetterOwnerClass>();
      let method = cls.getStaticMethod('%%set-name');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      let owner = method!.getOwner();
      expect(owner !== undefined).assertTrue();
      expect(owner.getName()).assertContain('CrossSetterOwnerClass');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_0400
     * @tc.name testStaticMethodIsSetter2_004
     * @tc.desc Verify isSetter() combined with getParameterTypes() returns the parameter type list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MultiPropSetterClass>();
      let method = cls.getStaticMethod('%%set-numProp');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
      expect(types[0].getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_0500
     * @tc.name testStaticMethodIsSetter2_005
     * @tc.desc Verify isSetter() and equals() and getOwner() on a setter static method of a final class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FinalClass016>();
      let m1 = cls.getStaticMethod('%%set-total');
      let m2 = cls.getStaticMethod('%%set-total');
      expect(m1 !== undefined).assertTrue();
      expect(m1!.isSetter()).assertTrue();
      expect(m1!.equals(m2!)).assertTrue();
      let owner = m1!.getOwner();
      expect(owner.getName()).assertContain('FinalClass016');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_0600
     * @tc.name testStaticMethodIsSetter2_006
     * @tc.desc Verify isSetter() and equals() and getOwner() on a setter static method of an abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AbstractClass015>();
      let m1 = cls.getStaticMethod('%%set-amount');
      let m2 = cls.getStaticMethod('%%set-amount');
      expect(m1 !== undefined).assertTrue();
      expect(m1!.isSetter()).assertTrue();
      expect(m1!.equals(m2!)).assertTrue();
      let owner = m1!.getOwner();
      expect(owner.getName()).assertContain('AbstractClass015');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_0700
     * @tc.name testStaticMethodIsSetter2_007
     * @tc.desc Verify isSetter() combined with isNative() returns false for a user-defined setter static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PathSetterClass>();
      let method = cls.getStaticMethod('%%set-path');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      expect(method!.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_0800
     * @tc.name testStaticMethodIsSetter2_008
     * @tc.desc Verify isSetter() returns false for multi-param method named setXxx
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MultiParamSetterClass>();
      let method = cls.getStaticMethod('setValue');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertFalse();
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_0900
     * @tc.name testStaticMethodIsSetter2_009
     * @tc.desc Verify isSetter() counts six setters in a class correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SixSetterClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let setterCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isSetter()) {
          setterCount++;
        }
      }
      expect(setterCount).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_1000
     * @tc.name testStaticMethodIsSetter2_010
     * @tc.desc Verify isSetter() returns false for getter-only method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GetterOnlyClass>();
      let method = cls.getStaticMethod('%%get-value');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertFalse();
      expect(method!.isGetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_1100
     * @tc.name testStaticMethodIsSetter2_011
     * @tc.desc Verify isSetter() on setter in nested class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NestedSetterInner>();
      let method = cls.getStaticMethod('%%set-value');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_1200
     * @tc.name testStaticMethodIsSetter2_012
     * @tc.desc Verify inherited static setter is not exposed via child class reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ChildSetterClass>();
      let method = cls.getStaticMethod('%%set-name');
      expect(method === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_1300
     * @tc.name testStaticMethodIsSetter2_013
     * @tc.desc Verify isSetter() combined with isPublic() on public setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<TagSetterClass>();
      let method = cls.getStaticMethod('%%set-tag');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_1400
     * @tc.name testStaticMethodIsSetter2_014
     * @tc.desc Verify isSetter() returns true for deprecated setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<DeprecatedSetterClass>();
      let method = cls.getStaticMethod('%%set-deprecatedVal');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_1500
     * @tc.name testStaticMethodIsSetter2_015
     * @tc.desc Verify isSetter() for setter with FixedArray parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FixedArrayParamSetterClass>();
      let method = cls.getStaticMethod('%%set-arr');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_1600
     * @tc.name testStaticMethodIsSetter2_016
     * @tc.desc Verify isSetter() combined with getParametersNum() returns 1 for setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AliasSetterClass>();
      let method = cls.getStaticMethod('%%set-alias');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_1700
     * @tc.name testStaticMethodIsSetter2_017
     * @tc.desc Verify isSetter() combined with getReturnType() returns void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<TagSetterClass>();
      let method = cls.getStaticMethod('%%set-tag');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      let rt = method!.getReturnType();
      expect(rt.getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_1800
     * @tc.name testStaticMethodIsSetter2_018
     * @tc.desc Verify isSetter() consistency across multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AliasSetterClass>();
      let method = cls.getStaticMethod('%%set-alias');
      expect(method !== undefined).assertTrue();
      for (let i: int = 0; i < 10; i++) {
        expect(method!.isSetter()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_1900
     * @tc.name testStaticMethodIsSetter2_019
     * @tc.desc Verify isSetter() and isGetter() mutual exclusivity on getter/setter pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PairGetterSetterClass>();
      let getter = cls.getStaticMethod('%%get-val');
      let setter = cls.getStaticMethod('%%set-val');
      expect(getter !== undefined).assertTrue();
      expect(setter !== undefined).assertTrue();
      expect(getter!.isGetter()).assertTrue();
      expect(getter!.isSetter()).assertFalse();
      expect(setter!.isSetter()).assertTrue();
      expect(setter!.isGetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_2000
     * @tc.name testStaticMethodIsSetter2_020
     * @tc.desc Verify setter parameter type matches corresponding getter return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<TypeMatchGetterClass>();
      let getter = cls.getStaticMethod('%%get-num');
      let setter = cls.getStaticMethod('%%set-num');
      expect(getter !== undefined).assertTrue();
      expect(setter !== undefined).assertTrue();
      let getterReturnType = getter!.getReturnType().getName();
      let setterParamType = setter!.getParameterType(0)!.getName();
      expect(getterReturnType).assertEqual(setterParamType);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_2100
     * @tc.name testStaticMethodIsSetter2_021
     * @tc.desc Verify isSetter() + invoke() setter set value then getter read verification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<DataGetterSetterClass>();
      let setter = cls.getStaticMethod('%%set-data');
      let getter = cls.getStaticMethod('%%get-data');
      expect(setter !== undefined).assertTrue();
      expect(getter !== undefined).assertTrue();
      expect(setter!.isSetter()).assertTrue();
      setter!.invoke(['hello']);
      let result: string = getter!.invoke() as string;
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_2200
     * @tc.name testStaticMethodIsSetter2_022
     * @tc.desc Verify parent setter + child getter same name, child reflects child method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls: Class = Class.from<ParentSetterChildGetterClass>();
      let method = childCls.getStaticMethod('%%set-name');
      expect(method === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_2300
     * @tc.name testStaticMethodIsSetter2_023
     * @tc.desc Verify isSetter() + getParametersNum(1) + getReturnType(void) full chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AliasSetterClass>();
      let method = cls.getStaticMethod('%%set-alias');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
      let rt = method!.getReturnType();
      expect(rt.getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_2400
     * @tc.name testStaticMethodIsSetter2_024
     * @tc.desc Verify isSetter() returns true for setter in final class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FinalSetterClass>();
      let method = cls.getStaticMethod('%%set-finalVal');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_2500
     * @tc.name testStaticMethodIsSetter2_025
     * @tc.desc Verify isSetter() returns true for setter with Set type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SetParamSetterClass>();
      let method = cls.getStaticMethod('%%set-setProp');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      let types = method!.getParameterTypes();
      expect(types.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_2600
     * @tc.name testStaticMethodIsSetter2_026
     * @tc.desc Verify isSetter() returns false for $_invoke callable method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CallableNotSetterClass>();
      let method = cls.getStaticMethod('$_invoke');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_2700
     * @tc.name testStaticMethodIsSetter2_027
     * @tc.desc Verify isSetter combined with isPublic isPrivate isProtected triple check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<TripleModifierSetterA1>();
      let method = cls.getStaticMethod('%%set-tripleVal');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      expect(method!.isPublic()).assertTrue();
      expect(method!.isPrivate()).assertFalse();
      expect(method!.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_2800
     * @tc.name testStaticMethodIsSetter2_028
     * @tc.desc Verify setter isSetter remains true when class also has private/protected normal methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MixedAccessSetterA2>();
      let setter = cls.getStaticMethod('%%set-mixedVal');
      expect(setter !== undefined).assertTrue();
      expect(setter!.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_2900
     * @tc.name testStaticMethodIsSetter2_029
     * @tc.desc Verify all setters in getStaticMethods return isSetter true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PublicOnlySettersA3>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      expect(methods.length).assertEqual(3);
      for (let i: int = 0; i < methods.length; i++) {
        expect(methods[i].isSetter()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_3000
     * @tc.name testStaticMethodIsSetter2_030
     * @tc.desc Verify isSetter consistency across 10000 repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<HighFreqSetterB1>();
      let method = cls.getStaticMethod('%%set-highFreqVal');
      expect(method !== undefined).assertTrue();
      for (let i: int = 0; i < 10000; i++) {
        expect(method!.isSetter()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_3100
     * @tc.name testStaticMethodIsSetter2_031
     * @tc.desc Verify child class can reflect its own setter when both parent and child have same-named setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls: Class = Class.from<ChildSameNamedSetter>();
      let parentCls: Class = Class.from<ParentSameNamedSetter>();
      let childMethod = childCls.getStaticMethod('%%set-sharedVal');
      let parentMethod = parentCls.getStaticMethod('%%set-sharedVal');
      expect(childMethod !== undefined).assertTrue();
      expect(parentMethod !== undefined).assertTrue();
      expect(childMethod!.isSetter()).assertTrue();
      expect(parentMethod!.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_3200
     * @tc.name testStaticMethodIsSetter2_032
     * @tc.desc Verify parent private setter not exposed via child reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls: Class = Class.from<ParentPrivateSetterC2>();
      let childCls: Class = Class.from<ChildPrivateInheritC2>();
      let parentMethod = parentCls.getStaticMethod('%%set-privateVal');
      let childMethod = childCls.getStaticMethod('%%set-privateVal');
      expect(parentMethod === undefined).assertTrue();
      expect(childMethod === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_3300
     * @tc.name testStaticMethodIsSetter2_033
     * @tc.desc Verify child public setter overrides parent protected setter visibility
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls: Class = Class.from<ParentProtectedSetterC3>();
      let childCls: Class = Class.from<ChildPublicSetterC3>();
      let parentMethod = parentCls.getStaticMethod('%%set-protectedVal');
      let childMethod = childCls.getStaticMethod('%%set-protectedVal');
      expect(parentMethod === undefined).assertTrue();
      expect(childMethod !== undefined).assertTrue();
      expect(childMethod!.isSetter()).assertTrue();
      expect(childMethod!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_3400
     * @tc.name testStaticMethodIsSetter2_034
     * @tc.desc Verify child private setter overrides parent public setter becomes inaccessible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls: Class = Class.from<ParentPubSetterC4>();
      let childCls: Class = Class.from<ChildPrivSetterC4>();
      let parentMethod = parentCls.getStaticMethod('%%set-publicVal');
      let childMethod = childCls.getStaticMethod('%%set-publicVal');
      expect(parentMethod !== undefined).assertTrue();
      expect(parentMethod!.isSetter()).assertTrue();
      expect(childMethod === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_3500
     * @tc.name testStaticMethodIsSetter2_035
     * @tc.desc Verify setter with Map parameter isSetter true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MapParamSetterD1>();
      let method = cls.getStaticMethod('%%set-mapProp');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_3600
     * @tc.name testStaticMethodIsSetter2_036
     * @tc.desc Verify setter with custom object parameter isSetter true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CustomObjSetterD2>();
      let method = cls.getStaticMethod('%%set-customDataProp');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_3700
     * @tc.name testStaticMethodIsSetter2_037
     * @tc.desc Verify setter with long parameter type i64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<LongParamSetterD3>();
      let method = cls.getStaticMethod('%%set-longProp');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
      let paramType = method!.getParameterType(0)!.getName();
      expect(paramType).assertEqual('i64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_3800
     * @tc.name testStaticMethodIsSetter2_038
     * @tc.desc Verify setter with float parameter type f32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FloatParamSetterD4>();
      let method = cls.getStaticMethod('%%set-floatProp');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
      let paramType = method!.getParameterType(0)!.getName();
      expect(paramType).assertEqual('f32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_3900
     * @tc.name testStaticMethodIsSetter2_039
     * @tc.desc Verify setter with nested Array parameter isSetter true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NestedArrSetterD5>();
      let method = cls.getStaticMethod('%%set-nestedArrProp');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertTrue();
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_4000
     * @tc.name testStaticMethodIsSetter2_040
     * @tc.desc Verify float getter return type matches float setter parameter type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<FloatGetterSetterE1>();
      let getter = cls.getStaticMethod('%%get-floatVal');
      let setter = cls.getStaticMethod('%%set-floatVal');
      expect(getter !== undefined).assertTrue();
      expect(setter !== undefined).assertTrue();
      let getterReturnType = getter!.getReturnType().getName();
      let setterParamType = setter!.getParameterType(0)!.getName();
      expect(getterReturnType).assertEqual(setterParamType);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_4100
     * @tc.name testStaticMethodIsSetter2_041
     * @tc.desc Verify double getter return type matches double setter parameter type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<DoubleGetterSetterE2>();
      let getter = cls.getStaticMethod('%%get-doubleVal');
      let setter = cls.getStaticMethod('%%set-doubleVal');
      expect(getter !== undefined).assertTrue();
      expect(setter !== undefined).assertTrue();
      let getterReturnType = getter!.getReturnType().getName();
      let setterParamType = setter!.getParameterType(0)!.getName();
      expect(getterReturnType).assertEqual(setterParamType);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_4200
     * @tc.name testStaticMethodIsSetter2_042
     * @tc.desc Verify long getter return type matches long setter parameter type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<LongGetterSetterE3>();
      let getter = cls.getStaticMethod('%%get-longVal');
      let setter = cls.getStaticMethod('%%set-longVal');
      expect(getter !== undefined).assertTrue();
      expect(setter !== undefined).assertTrue();
      let getterReturnType = getter!.getReturnType().getName();
      let setterParamType = setter!.getParameterType(0)!.getName();
      expect(getterReturnType).assertEqual(setterParamType);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_4300
     * @tc.name testStaticMethodIsSetter2_043
     * @tc.desc Verify boolean getter return type matches boolean setter parameter type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<BoolGetterSetterE4>();
      let getter = cls.getStaticMethod('%%get-boolVal');
      let setter = cls.getStaticMethod('%%set-boolVal');
      expect(getter !== undefined).assertTrue();
      expect(setter !== undefined).assertTrue();
      let getterReturnType = getter!.getReturnType().getName();
      let setterParamType = setter!.getParameterType(0)!.getName();
      expect(getterReturnType).assertEqual(setterParamType);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_4400
     * @tc.name testStaticMethodIsSetter2_044
     * @tc.desc Verify isSetter correctly filters setter vs getter vs normal methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MixedMethodsClassF1>();
      let getter = cls.getStaticMethod('%%get-getOnlyProp');
      let setter1 = cls.getStaticMethod('%%set-setOnlyProp');
      let setter2 = cls.getStaticMethod('%%set-setOnlyProp2');
      let normal = cls.getStaticMethod('normalFunc');
      expect(getter !== undefined).assertTrue();
      expect(setter1 !== undefined).assertTrue();
      expect(setter2 !== undefined).assertTrue();
      expect(normal !== undefined).assertTrue();
      expect(getter!.isSetter()).assertFalse();
      expect(setter1!.isSetter()).assertTrue();
      expect(setter2!.isSetter()).assertTrue();
      expect(normal!.isSetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_4500
     * @tc.name testStaticMethodIsSetter2_045
     * @tc.desc Verify all methods in all-public-setter class are isSetter true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AllPublicSettersF2>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
      for (let i: int = 0; i < methods.length; i++) {
        expect(methods[i].isSetter()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_4600
     * @tc.name testStaticMethodIsSetter2_046
     * @tc.desc Verify getter + setter + normal method count matches total getStaticMethods length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<CountMethodsClassF3>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let setterCount: int = 0;
      let getterCount: int = 0;
      let normalCount: int = 0;
      for (let i: int = 0; i < methods.length; i++) {
        if (methods[i].isSetter()) {
          setterCount++;
        } else if (methods[i].isGetter()) {
          getterCount++;
        } else {
          normalCount++;
        }
      }
      expect(methods.length).assertEqual(setterCount + getterCount + normalCount);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_4700
     * @tc.name testStaticMethodIsSetter2_047
     * @tc.desc Verify void method without set- prefix is not a setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NoPrefixVoidMethodG1>();
      let method = cls.getStaticMethod('noPrefixMethod');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_4800
     * @tc.name testStaticMethodIsSetter2_048
     * @tc.desc Verify method named set without setter prefix is not a setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SetNamedMethodG2>();
      let method = cls.getStaticMethod('set');
      expect(method !== undefined).assertTrue();
      expect(method!.isSetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_4900
     * @tc.name testStaticMethodIsSetter2_049
     * @tc.desc Verify parent setter becomes inaccessible when child overrides with getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls: Class = Class.from<ChildGetterOverrideG3>();
      let childMethod = childCls.getStaticMethod('%%set-sharedProp');
      expect(childMethod === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_5000
     * @tc.name testStaticMethodIsSetter2_050
     * @tc.desc Verify isSetter plus getReturnType plus getParametersNum full chain on three setter types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ChainCombinedClassH1>();
      let sStr = cls.getStaticMethod('%%set-strVal');
      let sInt = cls.getStaticMethod('%%set-intVal');
      let sBool = cls.getStaticMethod('%%set-boolVal');
      expect(sStr !== undefined).assertTrue();
      expect(sInt !== undefined).assertTrue();
      expect(sBool !== undefined).assertTrue();
      expect(sStr!.isSetter()).assertTrue();
      expect(sInt!.isSetter()).assertTrue();
      expect(sBool!.isSetter()).assertTrue();
      expect(sStr!.getParametersNum()).assertEqual(1);
      expect(sInt!.getParametersNum()).assertEqual(1);
      expect(sBool!.getParametersNum()).assertEqual(1);
      expect(sStr!.getReturnType().getName()).assertEqual('void');
      expect(sInt!.getReturnType().getName()).assertEqual('void');
      expect(sBool!.getReturnType().getName()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_5100
     * @tc.name testStaticMethodIsSetter2_051
     * @tc.desc Verify five properties batch isSetter isPublic not isGetter getParametersNum getReturnType void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<BatchFiveClassH2>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      expect(methods.length).assertEqual(3);
      for (let i: int = 0; i < methods.length; i++) {
        let m = methods[i];
        expect(m.isSetter()).assertTrue();
        expect(m.isPublic()).assertTrue();
        expect(m.isGetter()).assertFalse();
        expect(m.getParametersNum()).assertEqual(1);
        let rt = m.getReturnType();
        expect(rt.getName()).assertEqual('void');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_IS_SETTER_TWO_5200
     * @tc.name testStaticMethodIsSetter2_052
     * @tc.desc Verify isSetter returns true for setter in generic class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodIsSetter2_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GenericSetterClass<Object>>();
      let setter = cls.getStaticMethod('%%set-value');
      expect(setter !== undefined).assertTrue();
      expect(setter!.isSetter()).assertTrue();
    });
  });
}
