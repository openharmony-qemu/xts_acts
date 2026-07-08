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

class EqualsNormalSample {
  add(value: int): int {
    return value + 1;
  }

  subtract(value: int): int {
    return value - 1;
  }
}

class EqualsSameNameA {
  add(value: int): int {
    return value + 1;
  }
}

class EqualsSameNameB {
  add(value: int): int {
    return value + 2;
  }
}

class EqualsTwoMethodsSample {
  add(value: int): int {
    return value + 1;
  }

  subtract(value: int): int {
    return value - 1;
  }
}

class EqualsStaticSample {
  static staticMethod(): int {
    return 0;
  }
}

class EqualsConstructorSample {
  constructor() {
  }
}

class EqualsFinalSample {
  final finalMethod(): int {
    return 0;
  }
}

abstract class EqualsAbstractParent {
  abstract abstractMethod(): int;
}

class EqualsAbstractChild extends EqualsAbstractParent {
  abstractMethod(): int {
    return 1;
  }
}

class EqualsGetterSetterSample {
  private _value: int = 0;

  get value(): int {
    return this._value;
  }

  set value(val: int) {
    this._value = val;
  }
}

class EqualsDiffCtorA {
  constructor() {
  }
}

class EqualsDiffCtorB {
  constructor() {
  }
}

class EqualsObjectInputSample {
}

class EqualsNativeSample {
  native doNative(): void;
}

class EqualsInheritedParent {
  shared(): void {
  }
}

class EqualsInheritedChild extends EqualsInheritedParent {
}

class EqualsNamePatternSample {
  foo(): void {
  }

  bar(): void {
  }

  GetName(): void {
  }

  getName(): void {
  }

  m1(): void {
  }

  m2(): void {
  }

  my_method(): void {
  }

  test(): void {
  }

  $run(): void {
  }

  run(): void {
  }

  foobar(): void {
  }

  a(): void {
  }

  b(): void {
  }

  testA(): void {
  }

  testB(): void {
  }
}

class EqualsParamZeroSample {
  m(): void {
  }
}

class EqualsParamOneIntSample {
  m(value: int): void {
  }
}

class EqualsParamByteSample {
  m(value: byte): void {
  }
}

class EqualsParamShortSample {
  m(value: short): void {
  }
}

class EqualsParamCharSample {
  m(value: char): void {
  }
}

class EqualsParamDefaultIntSample {
  m(value: int = 1): void {
  }
}

class EqualsParamOptionalIntSample {
  m(value?: int): void {
  }
}

class EqualsParamTwoIntSample {
  m(left: int, right: int): void {
  }
}

class EqualsParamThreeIntSample {
  m(first: int, second: int, third: int): void {
  }
}

class EqualsParamLongSample {
  m(value: long): void {
  }
}

class EqualsParamDoubleSample {
  m(value: double): void {
  }
}

class EqualsParamFloatSample {
  m(value: float): void {
  }
}

class EqualsParamBooleanSample {
  m(value: boolean): void {
  }
}

class EqualsParamStringSample {
  m(value: string): void {
  }
}

class EqualsParamObjectSample {
  m(value: EqualsObjectInputSample): void {
  }
}

class EqualsParamArrayStringSample {
  m(value: string[]): void {
  }
}

class EqualsParamRestStringSample {
  m(...values: string[]): void {
  }
}

class EqualsParamArrayIntSample {
  m(value: int[]): void {
  }
}

class EqualsParamArrayLongSample {
  m(value: long[]): void {
  }
}

class EqualsParamMultiArraySample {
  m(value: int[][]): void {
  }
}

class EqualsParamOrderIntStringSample {
  m(value: int, label: string): void {
  }
}

class EqualsParamOrderStringIntSample {
  m(label: string, value: int): void {
  }
}

class EqualsOverloadSample {
  m(value: int): int {
    return value + 1;
  }

  m(value: string): string {
    return value + "1";
  }

  m(value: int, label: string): int {
    return value;
  }
}

interface EqualsInterfaceRunSample {
  run(): void;
}

abstract class EqualsInterfaceAbstractRunSample implements EqualsInterfaceRunSample {
  abstract run(): void;
}

class EqualsInterfaceRunImplSample implements EqualsInterfaceRunSample {
  run(): void {
  }
}

abstract class EqualsAbstractGoSample {
  abstract go(): void;
}

class EqualsConcreteGoSample extends EqualsAbstractGoSample {
  go(): void {
  }
}

class EqualsAccessSample {
  private priv(): void {
  }

  protected prot(): void {
  }
}

class EqualsStaticSameNameSample {
  static s(): void {
  }
}

class EqualsInstanceSameNameSample {
  s(): void {
  }
}

class EqualsGenericHolderSample<T> {
  value(value: T): T {
    return value;
  }
}

class EqualsTenParamSample {
  many(a: int, b: int, c: int, d: int, e: int, f: int, g: int, h: int, i: int, j: int): int {
    return a + b + c + d + e + f + g + h + i + j;
  }
}

class EqualsLongNameSample {
  thisIsAVeryLongMethodNameThatChecksEqualsBoundaryHandling(): void {
  }
}

class EqualsReturnIntSample {
  get(): int {
    return 1;
  }
}

class EqualsReturnLongSample {
  get(): long {
    return 1;
  }
}

class EqualsDeepParentSample {
  sharedDeep(): void {
  }
}

class EqualsDeepLevelTwo extends EqualsDeepParentSample {
}
class EqualsDeepLevelThree extends EqualsDeepLevelTwo {
}
class EqualsDeepLevelFour extends EqualsDeepLevelThree {
}
class EqualsDeepLevelFive extends EqualsDeepLevelFour {
}
class EqualsDeepLevelSix extends EqualsDeepLevelFive {
}
class EqualsDeepLevelSeven extends EqualsDeepLevelSix {
}
class EqualsDeepLevelEight extends EqualsDeepLevelSeven {
}
class EqualsDeepLevelNine extends EqualsDeepLevelEight {
}
class EqualsDeepLevelTen extends EqualsDeepLevelNine {
}

class EqualsDeepOverrideParentSample {
  overriddenDeep(): void {
  }
}

class EqualsDeepOverrideChildSample extends EqualsDeepOverrideParentSample {
  overriddenDeep(): void {
  }
}

class EqualsSelfRefSample {
  getSelf(): EqualsSelfRefSample {
    return this;
  }
}

class EqualsCircularASample {
  getB(): EqualsCircularBSample {
    return new EqualsCircularBSample();
  }
}

class EqualsCircularBSample {
  getA(): EqualsCircularASample {
    return new EqualsCircularASample();
  }
}

enum EqualsEnumParamSample {
  FIRST,
  SECOND
}

class EqualsEnumMethodSample {
  m(value: EqualsEnumParamSample): void {
  }
}

class EqualsMultiStringArraySample {
  m(value: string[][]): void {
  }
}

class EqualsGenericBoundBaseSample {
}

class EqualsGenericBoundMethodSample<T extends EqualsGenericBoundBaseSample> {
  bounded(value: T): T {
    return value;
  }
}

class EqualsSpecialNameSample {
  $test_001(): void {
  }
}

class EqualsUnicodeNameSample {
  方法(): void {
  }

  テスト(): void {
  }
}

function findEqualsMethod(classType: ClassType, name: string, wantStatic?: boolean): Method {
  for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
    const method = classType.getMethod(i);
    if (method.getName() === name) {
      if (wantStatic === undefined || method.isStatic() === wantStatic) {
        return method;
      }
    }
  }
  expect().assertFail();
  throw new Error(`Missing method: ${name}`);
}

export default function MethodEqualsTest(): void {
  describe('MethodEqualsTest', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_0100
     * @tc.name testMethodEquals001
     * @tc.desc Verify equals returns true when comparing the same Method instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = findEqualsMethod(Type.from<EqualsNormalSample>() as ClassType, "add");
      expect(method.equals(method)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_0200
     * @tc.name testMethodEquals002
     * @tc.desc Verify that equals with undefined param returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqualsNormalSample>() as ClassType;
      const method = classType.getMethodByName("add");
      let result: boolean = method.equals(undefined);
      expect(typeof result).assertEqual("boolean");
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_0300
     * @tc.name testMethodEquals003
     * @tc.desc Verify equals with null param returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = findEqualsMethod(Type.from<EqualsNormalSample>() as ClassType, "add");
      expect(method.equals(null)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_0400
     * @tc.name testMethodEquals004
     * @tc.desc Verify two lookups of the same method from the same class are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqualsNormalSample>() as ClassType;
      const first = classType.getMethodByName("add");
      const second = classType.getMethodByName("add");
      expect(first.equals(second)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_0500
     * @tc.name testMethodEquals005
     * @tc.desc Verify default parameter method differs from required parameter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const required = findEqualsMethod(Type.from<EqualsParamOneIntSample>() as ClassType, "m");
      const defaulted = findEqualsMethod(Type.from<EqualsParamDefaultIntSample>() as ClassType, "m");
      expect(defaulted.equals(required)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_0600
     * @tc.name testMethodEquals006
     * @tc.desc Verify optional parameter method differs from required parameter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const required = findEqualsMethod(Type.from<EqualsParamOneIntSample>() as ClassType, "m");
      const optional = findEqualsMethod(Type.from<EqualsParamOptionalIntSample>() as ClassType, "m");
      expect(optional.equals(required)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_0700
     * @tc.name testMethodEquals007
     * @tc.desc Verify rest parameter method differs from array parameter method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rest = findEqualsMethod(Type.from<EqualsParamRestStringSample>() as ClassType, "m");
      const array = findEqualsMethod(Type.from<EqualsParamArrayStringSample>() as ClassType, "m");
      expect(rest.equals(array)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_0800
     * @tc.name testMethodEquals008
     * @tc.desc Verify that equals does not throw Error on normal call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqualsNormalSample>() as ClassType;
      const method = classType.getMethodByName("add");
      const other = classType.getMethodByName("add");
      let result: boolean = method.equals(other);
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_0900
     * @tc.name testMethodEquals009
     * @tc.desc Verify equals returns true for static methods from the same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqualsStaticSample>() as ClassType;
      let m1: Method | undefined = undefined;
      for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
        const m = classType.getMethod(i);
        if (m.isStatic() && m.getName() === "staticMethod") {
          m1 = m;
          break;
        }
      }
      let result: boolean = m1!.equals(m1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_1000
     * @tc.name testMethodEquals010
     * @tc.desc Verify equals returns true for constructors from the same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqualsConstructorSample>() as ClassType;
      const ctor1 = classType.getConstructor(0);
      const ctor2 = classType.getConstructor(0);
      let result: boolean = ctor1.equals(ctor2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_1100
     * @tc.name testMethodEquals011
     * @tc.desc Verify equals returns true for final methods from the same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqualsFinalSample>() as ClassType;
      const m1 = classType.getMethodByName("finalMethod");
      const m2 = classType.getMethodByName("finalMethod");
      let result: boolean = m1.equals(m2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_1200
     * @tc.name testMethodEquals012
     * @tc.desc Verify equals returns false for abstract method vs child override
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentType = Type.from<EqualsAbstractParent>() as ClassType;
      const childType = Type.from<EqualsAbstractChild>() as ClassType;
      const parentMethod = parentType.getMethodByName("abstractMethod");
      const childMethod = childType.getMethodByName("abstractMethod");
      let result: boolean = parentMethod.equals(childMethod);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_1300
     * @tc.name testMethodEquals013
     * @tc.desc Verify equals returns true for getter accessor from the same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqualsGetterSetterSample>() as ClassType;
      const getter1 = classType.getMethodByName("%%get-value");
      const getter2 = classType.getMethodByName("%%get-value");
      let result: boolean = getter1.equals(getter2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_1400
     * @tc.name testMethodEquals014
     * @tc.desc Verify equals returns false for constructors from different classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const typeA = Type.from<EqualsDiffCtorA>() as ClassType;
      const typeB = Type.from<EqualsDiffCtorB>() as ClassType;
      const ctorA = typeA.getConstructor(0);
      const ctorB = typeB.getConstructor(0);
      let result: boolean = ctorA.equals(ctorB);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_1500
     * @tc.name testMethodEquals015
     * @tc.desc Verify equals returns false for function input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = findEqualsMethod(Type.from<EqualsNormalSample>() as ClassType, "add");
      const input = (): void => {
      };
      expect(method.equals(input)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_1600
     * @tc.name testMethodEquals016
     * @tc.desc Verify equals returns false for additional non-Method primitive inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = findEqualsMethod(Type.from<EqualsNormalSample>() as ClassType, "add");
      expect(method.equals("")).assertFalse();
      expect(method.equals(0)).assertFalse();
      expect(method.equals(-1)).assertFalse();
      expect(method.equals(false)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_1700
     * @tc.name testMethodEquals017
     * @tc.desc Verify equals returns false for different methods in the same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqualsTwoMethodsSample>() as ClassType;
      const add = classType.getMethodByName("add");
      const subtract = classType.getMethodByName("subtract");
      expect(add.equals(subtract)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_1800
     * @tc.name testMethodEquals018
     * @tc.desc Verify equals returns true for native method reflected twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqualsNativeSample>() as ClassType;
      const left = findEqualsMethod(classType, "doNative");
      const right = findEqualsMethod(classType, "doNative");
      expect(left.equals(right)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_1900
     * @tc.name testMethodEquals019
     * @tc.desc Verify inherited method equals returns true for parent and child lookup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentMethod = findEqualsMethod(Type.from<EqualsInheritedParent>() as ClassType, "shared");
      const childMethod = findEqualsMethod(Type.from<EqualsInheritedChild>() as ClassType, "shared");
      expect(parentMethod.equals(childMethod)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_2000
     * @tc.name testMethodEquals020
     * @tc.desc Verify non-Method inputs return false without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = findEqualsMethod(Type.from<EqualsNormalSample>() as ClassType, "add");
      expect(method.equals("a")).assertFalse();
      expect(method.equals(1)).assertFalse();
      expect(method.equals(true)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_2100
     * @tc.name testMethodEquals021
     * @tc.desc Verify equals returns false for null and object inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = findEqualsMethod(Type.from<EqualsNormalSample>() as ClassType, "add");
      expect(method.equals(null)).assertFalse();
      expect(method.equals(new EqualsObjectInputSample())).assertFalse();
      expect(method.equals([1, 2, 3])).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_2200
     * @tc.name testMethodEquals022
     * @tc.desc Verify method name differences return false for equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqualsNamePatternSample>() as ClassType;
      expect(findEqualsMethod(classType, "foo").equals(findEqualsMethod(classType, "bar"))).assertFalse();
      expect(findEqualsMethod(classType, "GetName").equals(findEqualsMethod(classType, "getName"))).assertFalse();
      expect(findEqualsMethod(classType, "m1").equals(findEqualsMethod(classType, "m2"))).assertFalse();
      expect(findEqualsMethod(classType, "my_method").equals(findEqualsMethod(classType, "test"))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_2300
     * @tc.name testMethodEquals023
     * @tc.desc Verify parameter count differences across same method name in different classes return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zero = findEqualsMethod(Type.from<EqualsParamZeroSample>() as ClassType, "m");
      const one = findEqualsMethod(Type.from<EqualsParamOneIntSample>() as ClassType, "m");
      const two = findEqualsMethod(Type.from<EqualsParamTwoIntSample>() as ClassType, "m");
      const three = findEqualsMethod(Type.from<EqualsParamThreeIntSample>() as ClassType, "m");
      expect(zero.equals(one)).assertFalse();
      expect(one.equals(two)).assertFalse();
      expect(two.equals(three)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_2400
     * @tc.name testMethodEquals024
     * @tc.desc Verify primitive parameter type differences across same method name return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const intMethod = findEqualsMethod(Type.from<EqualsParamOneIntSample>() as ClassType, "m");
      const longMethod = findEqualsMethod(Type.from<EqualsParamLongSample>() as ClassType, "m");
      const doubleMethod = findEqualsMethod(Type.from<EqualsParamDoubleSample>() as ClassType, "m");
      const floatMethod = findEqualsMethod(Type.from<EqualsParamFloatSample>() as ClassType, "m");
      expect(intMethod.equals(longMethod)).assertFalse();
      expect(doubleMethod.equals(floatMethod)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_2500
     * @tc.name testMethodEquals025
     * @tc.desc Verify boolean string and custom object parameter type differences return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const boolMethod = findEqualsMethod(Type.from<EqualsParamBooleanSample>() as ClassType, "m");
      const stringMethod = findEqualsMethod(Type.from<EqualsParamStringSample>() as ClassType, "m");
      const objectMethod = findEqualsMethod(Type.from<EqualsParamObjectSample>() as ClassType, "m");
      expect(boolMethod.equals(stringMethod)).assertFalse();
      expect(stringMethod.equals(objectMethod)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_2600
     * @tc.name testMethodEquals026
     * @tc.desc Verify array parameter differences return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const stringArray = findEqualsMethod(Type.from<EqualsParamArrayStringSample>() as ClassType, "m");
      const intArray = findEqualsMethod(Type.from<EqualsParamArrayIntSample>() as ClassType, "m");
      const longArray = findEqualsMethod(Type.from<EqualsParamArrayLongSample>() as ClassType, "m");
      const multiArray = findEqualsMethod(Type.from<EqualsParamMultiArraySample>() as ClassType, "m");
      expect(stringArray.equals(intArray)).assertFalse();
      expect(intArray.equals(longArray)).assertFalse();
      expect(intArray.equals(multiArray)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_2700
     * @tc.name testMethodEquals027
     * @tc.desc Verify parameter order differences return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const intString = findEqualsMethod(Type.from<EqualsParamOrderIntStringSample>() as ClassType, "m");
      const stringInt = findEqualsMethod(Type.from<EqualsParamOrderStringIntSample>() as ClassType, "m");
      expect(intString.equals(stringInt)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_2800
     * @tc.name testMethodEquals028
     * @tc.desc Verify interface abstract method and implementation method are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const interfaceMethod = findEqualsMethod(Type.from<EqualsInterfaceAbstractRunSample>() as ClassType, "run");
      const implMethod = findEqualsMethod(Type.from<EqualsInterfaceRunImplSample>() as ClassType, "run");
      expect(interfaceMethod.equals(implMethod)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_2900
     * @tc.name testMethodEquals029
     * @tc.desc Verify abstract class method and concrete implementation are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const abstractMethod = findEqualsMethod(Type.from<EqualsAbstractGoSample>() as ClassType, "go");
      const concreteMethod = findEqualsMethod(Type.from<EqualsConcreteGoSample>() as ClassType, "go");
      expect(abstractMethod.equals(concreteMethod)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_3000
     * @tc.name testMethodEquals030
     * @tc.desc Verify private and protected methods are equal to themselves when reflected twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqualsAccessSample>() as ClassType;
      expect(findEqualsMethod(classType, "priv").equals(findEqualsMethod(classType, "priv"))).assertTrue();
      expect(findEqualsMethod(classType, "prot").equals(findEqualsMethod(classType, "prot"))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_3100
     * @tc.name testMethodEquals031
     * @tc.desc Verify static and instance methods with same name in different classes are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const staticMethod = findEqualsMethod(Type.from<EqualsStaticSameNameSample>() as ClassType, "s", true);
      const instanceMethod = findEqualsMethod(Type.from<EqualsInstanceSameNameSample>() as ClassType, "s", false);
      expect(staticMethod.equals(instanceMethod)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_3200
     * @tc.name testMethodEquals032
     * @tc.desc Verify generic and multi-parameter methods are equal to themselves when reflected twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const genericType = Type.from<EqualsGenericHolderSample<string>>() as ClassType;
      const tenParamType = Type.from<EqualsTenParamSample>() as ClassType;
      expect(findEqualsMethod(genericType, "value").equals(findEqualsMethod(genericType, "value"))).assertTrue();
      expect(findEqualsMethod(tenParamType, "many").equals(findEqualsMethod(tenParamType, "many"))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_3300
     * @tc.name testMethodEquals033
     * @tc.desc Verify long method name is equal to itself when reflected twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqualsLongNameSample>() as ClassType;
      const name = "thisIsAVeryLongMethodNameThatChecksEqualsBoundaryHandling";
      expect(findEqualsMethod(classType, name).equals(findEqualsMethod(classType, name))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_3400
     * @tc.name testMethodEquals034
     * @tc.desc Verify different return types in different declaring classes are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const intReturn = findEqualsMethod(Type.from<EqualsReturnIntSample>() as ClassType, "get");
      const longReturn = findEqualsMethod(Type.from<EqualsReturnLongSample>() as ClassType, "get");
      expect(intReturn.equals(longReturn)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_3500
     * @tc.name testMethodEquals035
     * @tc.desc Verify deep inherited method equals parent lookup and deep override differs from parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentInherited = findEqualsMethod(Type.from<EqualsDeepParentSample>() as ClassType, "sharedDeep");
      const deepInherited = findEqualsMethod(Type.from<EqualsDeepLevelTen>() as ClassType, "sharedDeep");
      const parentOverride = findEqualsMethod(Type.from<EqualsDeepOverrideParentSample>() as ClassType, "overriddenDeep");
      const childOverride = findEqualsMethod(Type.from<EqualsDeepOverrideChildSample>() as ClassType, "overriddenDeep");
      expect(parentInherited.equals(deepInherited)).assertTrue();
      expect(parentOverride.equals(childOverride)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_3600
     * @tc.name testMethodEquals036
     * @tc.desc Verify self referenced and circular referenced return methods are equal to themselves
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const selfType = Type.from<EqualsSelfRefSample>() as ClassType;
      const circularAType = Type.from<EqualsCircularASample>() as ClassType;
      const circularBType = Type.from<EqualsCircularBSample>() as ClassType;
      expect(findEqualsMethod(selfType, "getSelf").equals(findEqualsMethod(selfType, "getSelf"))).assertTrue();
      expect(findEqualsMethod(circularAType, "getB").equals(findEqualsMethod(circularAType, "getB"))).assertTrue();
      expect(findEqualsMethod(circularBType, "getA").equals(findEqualsMethod(circularBType, "getA"))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_3700
     * @tc.name testMethodEquals037
     * @tc.desc Verify same-name same-signature methods from different classes are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = findEqualsMethod(Type.from<EqualsSameNameA>() as ClassType, "add");
      const second = findEqualsMethod(Type.from<EqualsSameNameB>() as ClassType, "add");
      expect(first.getName()).assertEqual(second.getName());
      expect(first.equals(second)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_3800
     * @tc.name testMethodEquals038
     * @tc.desc Verify abstract interface carrier method and abstract class method are equal to themselves
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const interfaceCarrierType = Type.from<EqualsInterfaceAbstractRunSample>() as ClassType;
      const abstractType = Type.from<EqualsAbstractGoSample>() as ClassType;
      expect(findEqualsMethod(interfaceCarrierType, "run").equals(findEqualsMethod(interfaceCarrierType, "run"))).assertTrue();
      expect(findEqualsMethod(abstractType, "go").equals(findEqualsMethod(abstractType, "go"))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_3900
     * @tc.name testMethodEquals039
     * @tc.desc Verify enum parameter method is equal to itself when reflected twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqualsEnumMethodSample>() as ClassType;
      expect(findEqualsMethod(classType, "m").equals(findEqualsMethod(classType, "m"))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_4000
     * @tc.name testMethodEquals040
     * @tc.desc Verify multidimensional array parameter method is equal to itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqualsMultiStringArraySample>() as ClassType;
      expect(findEqualsMethod(classType, "m").equals(findEqualsMethod(classType, "m"))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_4100
     * @tc.name testMethodEquals041
     * @tc.desc Verify array parameter and non-array parameter methods are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrayMethod = findEqualsMethod(Type.from<EqualsParamArrayIntSample>() as ClassType, "m");
      const intMethod = findEqualsMethod(Type.from<EqualsParamOneIntSample>() as ClassType, "m");
      expect(arrayMethod.equals(intMethod)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_4200
     * @tc.name testMethodEquals042
     * @tc.desc Verify bounded generic method is equal to itself when reflected twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqualsGenericBoundMethodSample<EqualsGenericBoundBaseSample>>() as ClassType;
      expect(findEqualsMethod(classType, "bounded").equals(findEqualsMethod(classType, "bounded"))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_4300
     * @tc.name testMethodEquals043
     * @tc.desc Verify void return no-parameter method is equal to itself when reflected twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqualsParamZeroSample>() as ClassType;
      expect(findEqualsMethod(classType, "m").equals(findEqualsMethod(classType, "m"))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_4400
     * @tc.name testMethodEquals044
     * @tc.desc Verify setter accessor method is equal to itself when reflected twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqualsGetterSetterSample>() as ClassType;
      const setter = classType.getMethodByName("%%set-value");
      expect(setter.equals(classType.getMethodByName("%%set-value"))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_4500
     * @tc.name testMethodEquals045
     * @tc.desc Verify special-symbol method name is equal to itself when reflected twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqualsSpecialNameSample>() as ClassType;
      const method = findEqualsMethod(classType, "$test_001");
      expect(method.equals(findEqualsMethod(classType, "$test_001"))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_4600
     * @tc.name testMethodEquals046
     * @tc.desc Verify Unicode method names with different languages are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqualsUnicodeNameSample>() as ClassType;
      const chineseMethod = findEqualsMethod(classType, "方法");
      const japaneseMethod = findEqualsMethod(classType, "テスト");
      expect(chineseMethod.equals(japaneseMethod)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_4700
     * @tc.name testMethodEquals047
     * @tc.desc Verify byte and short parameter method signatures are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const byteMethod = findEqualsMethod(Type.from<EqualsParamByteSample>() as ClassType, "m");
      const shortMethod = findEqualsMethod(Type.from<EqualsParamShortSample>() as ClassType, "m");
      expect(byteMethod.equals(shortMethod)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_4800
     * @tc.name testMethodEquals048
     * @tc.desc Verify char and string parameter method signatures are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const charMethod = findEqualsMethod(Type.from<EqualsParamCharSample>() as ClassType, "m");
      const stringMethod = findEqualsMethod(Type.from<EqualsParamStringSample>() as ClassType, "m");
      expect(charMethod.equals(stringMethod)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_4900
     * @tc.name testMethodEquals049
     * @tc.desc Verify overloaded methods with the same name but different signatures are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodEquals049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<EqualsOverloadSample>() as ClassType;
      let oneParamMethod: Method | undefined = undefined;
      let twoParamMethod: Method | undefined = undefined;
      for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
        const method = classType.getMethod(i);
        if (method.getName() === "m") {
          const parameterCount = method.getType().getParametersNum();
          if (parameterCount === 1) {
            oneParamMethod = method;
          } else if (parameterCount === 2) {
            twoParamMethod = method;
          }
        }
      }
            expect(oneParamMethod !== undefined).assertTrue();
            expect(twoParamMethod !== undefined).assertTrue();
      expect(oneParamMethod!.equals(twoParamMethod!)).assertFalse();
    });
  });
}
