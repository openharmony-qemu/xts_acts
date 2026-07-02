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
class AccPrivateSample {
  private subtract(value: int): int {
    return value - 1;
  }
}

class AccPublicSample {
  public add(value: int): int {
    return value + 1;
  }
}

class AccByteParamSample {
  public acceptByte(value: byte): void {
  }
}

class AccShortParamSample {
  public acceptShort(value: short): void {
  }
}

class AccCharParamSample {
  public acceptChar(value: char): void {
  }
}

class AccStringParamSample {
  public acceptString(value: string): void {
  }
}

class AccObjectInputSample {
}

class AccObjectParamSample {
  public acceptObject(value: AccObjectInputSample): void {
  }
}

class AccDiffClassASample {
  public methodA(): void {
  }
}

class AccDiffClassBSample {
  public methodB(): void {
  }
}

class AccConstructorSample {
  constructor() {
  }
}

class AccStaticSample {
  public static staticMethod(): void {
  }
}

class AccFinalSample {
  public final finalMethod(): void {
  }
}

class AccGetterSetterSample {
  private _value: int = 0;

  get value(): int {
    return this._value;
  }

  set value(v: int) {
    this._value = v;
  }
}

abstract class AccAbstractSample {
  abstract doWork(): void;
}

class AccParentSample {
  public parentMethod(): void {
  }
}

class AccChildSample extends AccParentSample {
}

class AccCombinedSample {
  public static combined(): void {
  }

  protected final doFinal(): void {
  }

  private doPrivate(): void {
  }

  defaultMethod(): void {
  }
}

class AccProtectedSample {
  protected doProtected(): void {
  }
}

class AccDefaultSample {
  defaultMethod(): void {
  }
}

class AccStaticPrivateSample {
  private static staticPrivate(): void {
  }
}

class AccStaticProtectedSample {
  protected static staticProtected(): void {
  }
}

abstract class AccAbstractProtectedSample {
  protected abstract doProtectedAbstract(): void;
}

class AccInheritedProtectedParentSample {
  protected inheritedProtected(): void {
  }
}

class AccInheritedProtectedChildSample extends AccInheritedProtectedParentSample {
}

class AccOverridePublicParentSample {
  public overrideTarget(): void {
  }
}

class AccOverridePublicChildSample extends AccOverridePublicParentSample {
  public overrideTarget(): void {
  }
}

class AccOverrideProtectedParentSample {
  protected overrideTarget(): void {
  }
}

class AccOverrideProtectedChildSample extends AccOverrideProtectedParentSample {
  protected overrideTarget(): void {
  }
}

class AccHideParentPublicSample {
  public hiddenTarget(): void {
  }
}

class AccHideChildPrivateSample {
  private hiddenTarget(): void {
  }
}

class AccHideChildProtectedSample {
  protected hiddenTarget(): void {
  }
}

class AccGenericSample<T> {
  public value(input: T): T {
    return input;
  }
}

class AccSelfReturnSample {
  private self(): AccSelfReturnSample {
    return this;
  }
}

enum AccEnumSample {
  FIRST,
  SECOND
}

class AccEnumParamSample {
  public acceptEnum(value: AccEnumSample): void {
  }
}

class AccArrayParamSample {
  public acceptArray(value: int[]): void {
  }
}

class AccLongNameSample {
  public thisIsAVeryLongMethodNameForAccessModifierBoundary(): void {
  }
}

class AccSpecialNameSample {
  public $method_123(): void {
  }
}

class AccUnicodeNameSample {
  public 方法(): void {
  }

  public テスト(): void {
  }
}

class AccOverloadSample {
  method(value: int): void {
  }

  method(value: int, text: string): void {
  }
}

function findAccessMethod(classType: ClassType, name: string, wantStatic?: boolean): Method {
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

export default function MethodGetAccessModifierTest(): void {
  describe('MethodGetAccessModifierTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_0100
     * @tc.name testMethodGetAccessModifier001
     * @tc.desc Verify that getAccessModifier can be called without parameters and returns number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<AccPublicSample>() as ClassType).getMethodByName("add");
      let result: int = method.getAccessModifier();
      expect(typeof result).assertEqual("int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_0200
     * @tc.name testMethodGetAccessModifier002
     * @tc.desc Verify that different classes with same access modifier return consistent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const methodA = (Type.from<AccDiffClassASample>() as ClassType).getMethodByName("methodA");
      const methodB = (Type.from<AccDiffClassBSample>() as ClassType).getMethodByName("methodB");
      let modA: int = methodA.getAccessModifier();
      let modB: int = methodB.getAccessModifier();
      expect(modA).assertEqual(modB);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_0300
     * @tc.name testMethodGetAccessModifier003
     * @tc.desc Verify getAccessModifier on constructor returns int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<AccConstructorSample>() as ClassType).getConstructor(0);
      let result: int = method.getAccessModifier();
      expect(typeof result).assertEqual("int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_0400
     * @tc.name testMethodGetAccessModifier004
     * @tc.desc Verify getAccessModifier on static public method returns int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<AccStaticSample>() as ClassType;
      let method: Method | undefined = undefined;
      for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
        const m = classType.getMethod(i);
        if (m.getName() === "staticMethod") {
          method = m;
          break;
        }
      }
      let result: int = method!.getAccessModifier();
      expect(typeof result).assertEqual("int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_0500
     * @tc.name testMethodGetAccessModifier005
     * @tc.desc Verify getAccessModifier on final public method returns int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<AccFinalSample>() as ClassType).getMethodByName("finalMethod");
      let result: int = method.getAccessModifier();
      expect(typeof result).assertEqual("int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_0600
     * @tc.name testMethodGetAccessModifier006
     * @tc.desc Verify getAccessModifier on getter and setter returns int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<AccGetterSetterSample>() as ClassType;
      const getter = classType.getMethodByName("%%get-value");
      const setter = classType.getMethodByName("%%set-value");
      let getterMod: int = getter.getAccessModifier();
      let setterMod: int = setter.getAccessModifier();
      expect(typeof getterMod).assertEqual("int");
      expect(typeof setterMod).assertEqual("int");
      expect(getterMod).assertEqual(setterMod);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_0700
     * @tc.name testMethodGetAccessModifier007
     * @tc.desc Verify getAccessModifier on abstract method returns int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<AccAbstractSample>() as ClassType).getMethodByName("doWork");
      let result: int = method.getAccessModifier();
      expect(typeof result).assertEqual("int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_0800
     * @tc.name testMethodGetAccessModifier008
     * @tc.desc Verify getAccessModifier on inherited method returns same value as parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentMethod = (Type.from<AccParentSample>() as ClassType).getMethodByName("parentMethod");
      const childMethod = (Type.from<AccChildSample>() as ClassType).getMethodByName("parentMethod");
      let parentMod: int = parentMethod.getAccessModifier();
      let childMod: int = childMethod.getAccessModifier();
      expect(parentMod).assertEqual(childMod);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_0900
     * @tc.name testMethodGetAccessModifier009
     * @tc.desc Verify getAccessModifier combined with isStatic and getName returns consistent metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<AccCombinedSample>() as ClassType;
      let staticMethod: Method | undefined = undefined;
      for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
        const m = classType.getMethod(i);
        if (m.getName() === "combined") {
          staticMethod = m;
          break;
        }
      }
      expect(staticMethod!.isStatic()).assertTrue();
      expect(staticMethod!.getName()).assertEqual("combined");
      let mod: int = staticMethod!.getAccessModifier();
      expect(typeof mod).assertEqual("int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_1000
     * @tc.name testMethodGetAccessModifier010
     * @tc.desc Verify multiple getAccessModifier calls in a loop return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<AccPublicSample>() as ClassType).getMethodByName("add");
      let firstResult: int = method.getAccessModifier();
      for (let i: int = 0; i < 5; i += 1) {
        const current: int = method.getAccessModifier();
        expect(current).assertEqual(firstResult);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_1100
     * @tc.name testMethodGetAccessModifier011
     * @tc.desc Verify public instance method access modifier uses public baseline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = findAccessMethod(Type.from<AccPublicSample>() as ClassType, "add");
      expect(method.getAccessModifier()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_1200
     * @tc.name testMethodGetAccessModifier012
     * @tc.desc Verify private instance method access modifier differs from public baseline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = findAccessMethod(Type.from<AccPrivateSample>() as ClassType, "subtract");
      expect(method.getAccessModifier()).assertEqual(AccessModifier.PRIVATE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_1300
     * @tc.name testMethodGetAccessModifier013
     * @tc.desc Verify protected instance method access modifier differs from public baseline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = findAccessMethod(Type.from<AccProtectedSample>() as ClassType, "doProtected");
      expect(method.getAccessModifier()).assertEqual(AccessModifier.PROTECTED);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_1400
     * @tc.name testMethodGetAccessModifier014
     * @tc.desc Verify default instance method access modifier equals public baseline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const publicMethod = findAccessMethod(Type.from<AccPublicSample>() as ClassType, "add");
      const defaultMethod = findAccessMethod(Type.from<AccDefaultSample>() as ClassType, "defaultMethod");
      expect(defaultMethod.getAccessModifier()).assertEqual(publicMethod.getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_1500
     * @tc.name testMethodGetAccessModifier015
     * @tc.desc Verify public static method access modifier equals public instance baseline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const publicMethod = findAccessMethod(Type.from<AccPublicSample>() as ClassType, "add");
      const staticMethod = findAccessMethod(Type.from<AccStaticSample>() as ClassType, "staticMethod", true);
      expect(staticMethod.getAccessModifier()).assertEqual(publicMethod.getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_1600
     * @tc.name testMethodGetAccessModifier016
     * @tc.desc Verify private static method access modifier differs from public baseline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = findAccessMethod(Type.from<AccStaticPrivateSample>() as ClassType, "staticPrivate", true);
      expect(method.getAccessModifier()).assertEqual(AccessModifier.PRIVATE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_1700
     * @tc.name testMethodGetAccessModifier017
     * @tc.desc Verify protected static method access modifier differs from public baseline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = findAccessMethod(Type.from<AccStaticProtectedSample>() as ClassType, "staticProtected", true);
      expect(method.getAccessModifier()).assertEqual(AccessModifier.PROTECTED);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_1800
     * @tc.name testMethodGetAccessModifier018
     * @tc.desc Verify public constructor access modifier equals public method baseline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const publicMethod = findAccessMethod(Type.from<AccPublicSample>() as ClassType, "add");
      const constructorMethod = (Type.from<AccConstructorSample>() as ClassType).getConstructor(0);
      expect(constructorMethod.getAccessModifier()).assertEqual(publicMethod.getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_1900
     * @tc.name testMethodGetAccessModifier019
     * @tc.desc Verify public abstract method access modifier equals public baseline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const publicMethod = findAccessMethod(Type.from<AccPublicSample>() as ClassType, "add");
      const abstractMethod = findAccessMethod(Type.from<AccAbstractSample>() as ClassType, "doWork");
      expect(abstractMethod.getAccessModifier()).assertEqual(publicMethod.getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_2000
     * @tc.name testMethodGetAccessModifier020
     * @tc.desc Verify protected abstract method access modifier differs from public baseline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = findAccessMethod(Type.from<AccAbstractProtectedSample>() as ClassType, "doProtectedAbstract");
      expect(method.getAccessModifier()).assertEqual(AccessModifier.PROTECTED);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_2100
     * @tc.name testMethodGetAccessModifier021
     * @tc.desc Verify final public method access modifier equals public baseline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const publicMethod = findAccessMethod(Type.from<AccPublicSample>() as ClassType, "add");
      const finalMethod = findAccessMethod(Type.from<AccFinalSample>() as ClassType, "finalMethod");
      expect(finalMethod.getAccessModifier()).assertEqual(publicMethod.getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_2200
     * @tc.name testMethodGetAccessModifier022
     * @tc.desc Verify public getter access modifier equals public baseline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const publicMethod = findAccessMethod(Type.from<AccPublicSample>() as ClassType, "add");
      const getter = findAccessMethod(Type.from<AccGetterSetterSample>() as ClassType, "%%get-value");
      expect(getter.getAccessModifier()).assertEqual(publicMethod.getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_2300
     * @tc.name testMethodGetAccessModifier023
     * @tc.desc Verify public setter access modifier equals public baseline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const publicMethod = findAccessMethod(Type.from<AccPublicSample>() as ClassType, "add");
      const setter = findAccessMethod(Type.from<AccGetterSetterSample>() as ClassType, "%%set-value");
      expect(setter.getAccessModifier()).assertEqual(publicMethod.getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_2400
     * @tc.name testMethodGetAccessModifier024
     * @tc.desc Verify inherited public method keeps parent access modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentMethod = findAccessMethod(Type.from<AccParentSample>() as ClassType, "parentMethod");
      const childMethod = findAccessMethod(Type.from<AccChildSample>() as ClassType, "parentMethod");
      expect(childMethod.getAccessModifier()).assertEqual(parentMethod.getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_2500
     * @tc.name testMethodGetAccessModifier025
     * @tc.desc Verify inherited protected method keeps parent access modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentMethod = findAccessMethod(Type.from<AccInheritedProtectedParentSample>() as ClassType, "inheritedProtected");
      const childMethod = findAccessMethod(Type.from<AccInheritedProtectedChildSample>() as ClassType, "inheritedProtected");
      expect(childMethod.getAccessModifier()).assertEqual(parentMethod.getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_2600
     * @tc.name testMethodGetAccessModifier026
     * @tc.desc Verify public override method keeps public access modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const publicMethod = findAccessMethod(Type.from<AccPublicSample>() as ClassType, "add");
      const method = findAccessMethod(Type.from<AccOverridePublicChildSample>() as ClassType, "overrideTarget");
      expect(method.getAccessModifier()).assertEqual(publicMethod.getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_2700
     * @tc.name testMethodGetAccessModifier027
     * @tc.desc Verify protected override method keeps protected access modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parentMethod = findAccessMethod(Type.from<AccOverrideProtectedParentSample>() as ClassType, "overrideTarget");
      const childMethod = findAccessMethod(Type.from<AccOverrideProtectedChildSample>() as ClassType, "overrideTarget");
      expect(childMethod.getAccessModifier()).assertEqual(parentMethod.getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_2800
     * @tc.name testMethodGetAccessModifier028
     * @tc.desc Verify child private method with same name as parent public method reports non-public access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = findAccessMethod(Type.from<AccHideChildPrivateSample>() as ClassType, "hiddenTarget");
      expect(method.getAccessModifier()).assertEqual(AccessModifier.PRIVATE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_2900
     * @tc.name testMethodGetAccessModifier029
     * @tc.desc Verify child protected method with same name as parent public method reports non-public access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = findAccessMethod(Type.from<AccHideChildProtectedSample>() as ClassType, "hiddenTarget");
      expect(method.getAccessModifier()).assertEqual(AccessModifier.PROTECTED);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_3000
     * @tc.name testMethodGetAccessModifier030
     * @tc.desc Verify generic public method access modifier equals public baseline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const publicMethod = findAccessMethod(Type.from<AccPublicSample>() as ClassType, "add");
      const genericMethod = findAccessMethod(Type.from<AccGenericSample<string>>() as ClassType, "value");
      expect(genericMethod.getAccessModifier()).assertEqual(publicMethod.getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_3100
     * @tc.name testMethodGetAccessModifier031
     * @tc.desc Verify private method returning self type reports non-public access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = findAccessMethod(Type.from<AccSelfReturnSample>() as ClassType, "self");
      expect(method.getAccessModifier()).assertEqual(AccessModifier.PRIVATE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_3200
     * @tc.name testMethodGetAccessModifier032
     * @tc.desc Verify public method with array parameter keeps public access modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const publicMethod = findAccessMethod(Type.from<AccPublicSample>() as ClassType, "add");
      const arrayMethod = findAccessMethod(Type.from<AccArrayParamSample>() as ClassType, "acceptArray");
      expect(arrayMethod.getAccessModifier()).assertEqual(publicMethod.getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_3300
     * @tc.name testMethodGetAccessModifier033
     * @tc.desc Verify public method with enum parameter keeps public access modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const publicMethod = findAccessMethod(Type.from<AccPublicSample>() as ClassType, "add");
      const enumMethod = findAccessMethod(Type.from<AccEnumParamSample>() as ClassType, "acceptEnum");
      expect(enumMethod.getAccessModifier()).assertEqual(publicMethod.getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_3400
     * @tc.name testMethodGetAccessModifier034
     * @tc.desc Verify long public method name keeps public access modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const publicMethod = findAccessMethod(Type.from<AccPublicSample>() as ClassType, "add");
      const method = findAccessMethod(Type.from<AccLongNameSample>() as ClassType,
        "thisIsAVeryLongMethodNameForAccessModifierBoundary");
      expect(method.getAccessModifier()).assertEqual(publicMethod.getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_3500
     * @tc.name testMethodGetAccessModifier035
     * @tc.desc Verify special public method name keeps public access modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const publicMethod = findAccessMethod(Type.from<AccPublicSample>() as ClassType, "add");
      const method = findAccessMethod(Type.from<AccSpecialNameSample>() as ClassType, "$method_123");
      expect(method.getAccessModifier()).assertEqual(publicMethod.getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_3600
     * @tc.name testMethodGetAccessModifier036
     * @tc.desc Verify Unicode public method names keep public access modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const publicMethod = findAccessMethod(Type.from<AccPublicSample>() as ClassType, "add");
      const chineseMethod = findAccessMethod(Type.from<AccUnicodeNameSample>() as ClassType, "方法");
      const japaneseMethod = findAccessMethod(Type.from<AccUnicodeNameSample>() as ClassType, "テスト");
      expect(chineseMethod.getAccessModifier()).assertEqual(publicMethod.getAccessModifier());
      expect(japaneseMethod.getAccessModifier()).assertEqual(publicMethod.getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_3700
     * @tc.name testMethodGetAccessModifier037
     * @tc.desc Verify public methods with byte and short parameters keep public access modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const publicMethod = findAccessMethod(Type.from<AccPublicSample>() as ClassType, "add");
      const byteMethod = findAccessMethod(Type.from<AccByteParamSample>() as ClassType, "acceptByte");
      const shortMethod = findAccessMethod(Type.from<AccShortParamSample>() as ClassType, "acceptShort");
      expect(byteMethod.getAccessModifier()).assertEqual(publicMethod.getAccessModifier());
      expect(shortMethod.getAccessModifier()).assertEqual(publicMethod.getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_3800
     * @tc.name testMethodGetAccessModifier038
     * @tc.desc Verify public method with char parameter keeps public access modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const publicMethod = findAccessMethod(Type.from<AccPublicSample>() as ClassType, "add");
      const charMethod = findAccessMethod(Type.from<AccCharParamSample>() as ClassType, "acceptChar");
      expect(charMethod.getAccessModifier()).assertEqual(publicMethod.getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_3900
     * @tc.name testMethodGetAccessModifier039
     * @tc.desc Verify public method with string parameter keeps public access modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const publicMethod = findAccessMethod(Type.from<AccPublicSample>() as ClassType, "add");
      const stringMethod = findAccessMethod(Type.from<AccStringParamSample>() as ClassType, "acceptString");
      expect(stringMethod.getAccessModifier()).assertEqual(publicMethod.getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_4000
     * @tc.name testMethodGetAccessModifier040
     * @tc.desc Verify public method with custom object parameter keeps public access modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const publicMethod = findAccessMethod(Type.from<AccPublicSample>() as ClassType, "add");
      const objectMethod = findAccessMethod(Type.from<AccObjectParamSample>() as ClassType, "acceptObject");
      expect(objectMethod.getAccessModifier()).assertEqual(publicMethod.getAccessModifier());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ACCESS_MODIFIER_4100
     * @tc.name testMethodGetAccessModifier041
     * @tc.desc Verify overloaded methods keep the same access modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMethodGetAccessModifier041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classType = Type.from<AccOverloadSample>() as ClassType;
      let oneParamMethod: Method | undefined = undefined;
      let twoParamMethod: Method | undefined = undefined;
      for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
        const method = classType.getMethod(i);
        if (method.getName() === "method") {
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
      expect(oneParamMethod!.getAccessModifier()).assertEqual(twoParamMethod!.getAccessModifier());
    });
  });
}
