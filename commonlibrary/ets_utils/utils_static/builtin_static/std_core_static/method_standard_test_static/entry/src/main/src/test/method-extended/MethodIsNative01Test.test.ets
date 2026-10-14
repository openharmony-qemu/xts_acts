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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

function _M(ct: ClassType, name: string): Method {
  return ct.getMethodByName(name) as Method;
}
function _findMethod(ct: ClassType, name: string): Method | undefined {
  let n: number = ct.getMethodsNum();
  for (let i: number = 0; i < n; i += 1) {
    const m = ct.getMethod(i.toLong());
    if (m.getName() === name) {
      return m;
    }
  }
  return undefined;
}
class S01_MethodIsNative01 {
  native nativeMethod(): void;
  normalMethod(): void {}
}
class S02_MethodIsNative01 {
  native nativeFunc1(): void;
  native nativeFunc2(): void;
}
class S03_MethodIsNative01 {
  normalFunc1(): void {}
  normalFunc2(): void {}
  normalFunc3(): void {}
}
class S04_MethodIsNative01 {
  static native nativeFunc1(): void;
  native nativeFunc2(): void;
}
class S05_MethodIsNative01 {
  static staticNormalFunc(): void {}
  instanceNormalFunc(): void {}
}
abstract class S08_MethodIsNative01 {
  abstract abstractFunc(): void;
  native nativeMethod(): void;
}
class S09_MethodIsNative01 {
  get prop(): number {
    return 1;
  }
  native nativeMethod(): void;
}
class S11_MethodIsNative01 {
  constructor() {}
  native nativeMethod(): void;
}
class S12_MethodIsNative01 {
  overloadedFunc(x: number | string): void {}
  native nativeMethod(): void;
}
class S15_MethodIsNative01 {
  native nativeMethod(p: number): void;
  native nativeMethod(): void;
}
class S16_MethodIsNative01 {
  normalWithParam(p: number): void {}
  normalWithoutParam(): void {}
}
class S17_MethodIsNative01 {
  native nativeWithReturn(): number;
  native nativeMethod(): void;
}
class S21_A_MethodIsNative01 {
  native nativeMethod(): void;
}
class S21_B_MethodIsNative01 {
  native nativeMethod(): void;
}
class S22_A_MethodIsNative01 {
  normalFunc(): void {}
}
class S22_B_MethodIsNative01 {
  normalFunc(): void {}
}
class S23_Base_MethodIsNative01 {
  native nativeMethod(): void;
}
class S23_Derived_MethodIsNative01 extends S23_Base_MethodIsNative01 {
  methodName(): void {}
}
class S27_MethodIsNative01<T> {
  native nativeMethod(): void;
  normalFunc(): void {}
}
class S30_MethodIsNative01 {
  static readonly VALUE_A: S30_MethodIsNative01 = new S30_MethodIsNative01();
  static readonly VALUE_B: S30_MethodIsNative01 = new S30_MethodIsNative01();
  customFunc(): void {}
}
class S42_GP_MethodIsNative01 {
  normalFunc(): void {}
}
class S42_P_MethodIsNative01 extends S42_GP_MethodIsNative01 {}
class S42_C_MethodIsNative01 extends S42_P_MethodIsNative01 {}
class S62_System_MethodIsNative01 {
  native toString(): string;
}
class S62_User_MethodIsNative01 {
  toString(): string { return ''; }
}
class S65_MethodIsNative01 {
  native toString(): string;
  customMethod(): void {}
}
class S76_MethodIsNative01 {
  native nativeMethod(): void;
}
class S80_MethodIsNative01 {
  native nativeMethod(): void;
}
class S81_MethodIsNative01 {
  normalFunc(): void {}
}
class S82_MethodIsNative01 {
  native nativeMethod(a: number, b: string): void;
}
class S83_MethodIsNative01 {
  normalWithParams(a: number, b: string, c: boolean): void {}
}
class S84_MethodIsNative01 {
  native nativeMethod(): void;
}
class S85_MethodIsNative01 {
  normalFunc(): void {}
}
class S86_MethodIsNative01 {
  native nativeGetData(): number;
}
class S87_MethodIsNative01 {
  normalGetData(): string {
    return '';
  }
}
class S95_Object_MethodIsNative01 {
  native nativeMethod(): void;
}
class S95_User_MethodIsNative01 {
  userMethod(): void {}
}
class S96_Enum_MethodIsNative01 {
  static readonly A: S96_Enum_MethodIsNative01 = new S96_Enum_MethodIsNative01();
  static readonly B: S96_Enum_MethodIsNative01 = new S96_Enum_MethodIsNative01();
  static readonly C: S96_Enum_MethodIsNative01 = new S96_Enum_MethodIsNative01();
  private constructor() {}
  customEnumMethod(): void {}
  native nativeEnumFunc(): void;
}
class MainCls_MethodIsNative03 {
  nativeFunc(): void {}
  emptyNative(): void {}
  commentOnlyMethod(): void {}
  deprecatedNative(): void {}
  chainMethod(): void {}
  finalNativeMethod(): void {}
  removedMethod(): void {}
  dynamicallyAddedMethod(): void {}
  sharedNative(): void {}
}
class BaseCls_MethodIsNative03 {
  chainMethod(): void {}
  diamondNative(): void {}
  overriddenNative(): void {}
  staticHideMethod(): void {}
  finalNativeMethod(): void {}
}
class ChildCls_MethodIsNative03 extends BaseCls_MethodIsNative03 {
  chainMethod(): void {}
  staticHideMethod(): void {}
}
class DestroyedCls_MethodIsNative03 {
  nativeFunc(): void {}
}
class ClsFromLoaderA_MethodIsNative03 {
  nativeFunc(): void {}
}
class ClsFromLoaderB_MethodIsNative03 {
  nativeFunc(): void {}
}

export default function MethodIsNative01Test(): void {
  describe('MethodIsNative01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_0100
     * @tc.name testMethodIsNativeAtOne001
     * @tc.desc Verify that isNative returns true for native method and false for normal method in the same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S01_MethodIsNative01>() as ClassType;
      const nativeMethod = _M(cls, 'nativeMethod');
      const normalMethod = cls.getMethodByName('normalMethod');
      expect(nativeMethod.isNative()).assertTrue();
      expect(normalMethod.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_0200
     * @tc.name testMethodIsNativeAtOne002
     * @tc.desc Verify that isNative returns true for multiple native methods in the same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S02_MethodIsNative01>() as ClassType;
      const m1 = _M(cls, 'nativeFunc1');
      const m2 = cls.getMethodByName('nativeFunc2');
      expect(m1.isNative()).assertTrue();
      expect(m2.isNative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_0300
     * @tc.name testMethodIsNativeAtOne003
     * @tc.desc Verify that isNative returns false for all normal methods in the same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S03_MethodIsNative01>() as ClassType;
      const m1 = cls.getMethodByName('normalFunc1');
      const m2 = cls.getMethodByName('normalFunc2');
      const m3 = cls.getMethodByName('normalFunc3');
      expect(m1.isNative()).assertFalse();
      expect(m2.isNative()).assertFalse();
      expect(m3.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_0400
     * @tc.name testMethodIsNativeAtOne004
     * @tc.desc Verify that isNative returns true for both static native and instance native methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S04_MethodIsNative01>() as ClassType;
      const staticNative: Method | undefined = _findMethod(cls, 'nativeFunc1');
      const instanceNative = cls.getMethodByName('nativeFunc2');
      expect(staticNative).not().assertUndefined();
      expect(staticNative!.isNative()).assertTrue();
      expect(instanceNative.isNative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_0500
     * @tc.name testMethodIsNativeAtOne005
     * @tc.desc Verify that isNative returns false for both static normal and instance normal methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S05_MethodIsNative01>() as ClassType;
      const staticNormal: Method | undefined = _findMethod(cls, 'staticNormalFunc');
      const instanceNormal = cls.getMethodByName('instanceNormalFunc');
      expect(staticNormal).not().assertUndefined();
      expect(staticNormal!.isNative()).assertFalse();
      expect(instanceNormal.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_0600
     * @tc.name testMethodIsNativeAtOne006
     * @tc.desc Verify that isNative returns false for abstract method and true for native method in abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S08_MethodIsNative01>() as ClassType;
      const abstractMethod = cls.getMethodByName('abstractFunc');
      const nativeMethod = _M(cls, 'nativeMethod');
      if (abstractMethod != null) {
        expect(abstractMethod.isNative()).assertFalse();
      } else { expect().assertFail(); }
      if (nativeMethod != null) {
        expect(nativeMethod.isNative()).assertTrue();
      } else { expect().assertFail(); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_0700
     * @tc.name testMethodIsNativeAtOne007
     * @tc.desc Verify that isNative returns false for getter and true for native method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S09_MethodIsNative01>() as ClassType;
      const getterMethod = cls.getMethodByName('%%get-prop');
      const nativeMethod = _M(cls, 'nativeMethod');
      expect(getterMethod.isNative()).assertFalse();
      expect(nativeMethod.isNative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_0800
     * @tc.name testMethodIsNativeAtOne008
     * @tc.desc Verify that isNative returns false for constructor and true for native method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S11_MethodIsNative01>() as ClassType;
      const ctor = cls.getConstructor(0);
      const nativeMethod = _M(cls, 'nativeMethod');
      expect(ctor.isNative()).assertFalse();
      expect(nativeMethod.isNative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_0900
     * @tc.name testMethodIsNativeAtOne009
     * @tc.desc Verify that isNative returns false for union-type normal method and true for native method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S12_MethodIsNative01>() as ClassType;
      const overloaded = cls.getMethodByName('overloadedFunc');
      const nativeMethod = _M(cls, 'nativeMethod');
      expect(overloaded.isNative()).assertFalse();
      expect(nativeMethod.isNative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_1000
     * @tc.name testMethodIsNativeAtOne010
     * @tc.desc Verify that isNative returns true for both parameterized and parameterless native methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S15_MethodIsNative01>() as ClassType;
      const withParam = _M(cls, 'nativeMethod');
      const withoutParam = _M(cls, 'nativeMethod');
      expect(withParam.isNative()).assertTrue();
      expect(withoutParam.isNative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_1100
     * @tc.name testMethodIsNativeAtOne011
     * @tc.desc Verify that isNative returns false for both parameterized and parameterless normal methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S16_MethodIsNative01>() as ClassType;
      const withParam = cls.getMethodByName('normalWithParam');
      const withoutParam = cls.getMethodByName('normalWithoutParam');
      expect(withParam.isNative()).assertFalse();
      expect(withoutParam.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_1200
     * @tc.name testMethodIsNativeAtOne012
     * @tc.desc Verify that isNative returns true for both return and void native methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S17_MethodIsNative01>() as ClassType;
      const retMethod = cls.getMethodByName('nativeWithReturn');
      const voidMethod = _M(cls, 'nativeMethod');
      expect(retMethod.isNative()).assertTrue();
      expect(voidMethod.isNative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_1300
     * @tc.name testMethodIsNativeAtOne013
     * @tc.desc Verify that isNative returns true for native methods in different classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classA = Type.from<S21_A_MethodIsNative01>() as ClassType;
      const classB = Type.from<S21_B_MethodIsNative01>() as ClassType;
      const nativeA = _M(classA, 'nativeMethod');
      const nativeB = _M(classB, 'nativeMethod');
      expect(nativeA.isNative()).assertTrue();
      expect(nativeB.isNative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_1400
     * @tc.name testMethodIsNativeAtOne014
     * @tc.desc Verify that isNative returns false for normal methods in different classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const classA = Type.from<S22_A_MethodIsNative01>() as ClassType;
      const classB = Type.from<S22_B_MethodIsNative01>() as ClassType;
      const normalA = classA.getMethodByName('normalFunc');
      const normalB = classB.getMethodByName('normalFunc');
      expect(normalA.isNative()).assertFalse();
      expect(normalB.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_1500
     * @tc.name testMethodIsNativeAtOne015
     * @tc.desc Verify that isNative returns true for inherited native method in sub class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const baseCls = Type.from<S23_Base_MethodIsNative01>() as ClassType;
      const subCls = Type.from<S23_Derived_MethodIsNative01>() as ClassType;
      const baseNative = _M(baseCls, 'nativeMethod');
      const subNormal = _M(subCls, 'nativeMethod');
      if (baseNative != null) {
        expect(baseNative.isNative()).assertTrue();
      } else { expect().assertFail(); }
      if (subNormal != null) {
        expect(subNormal.isNative()).assertTrue();
      } else { expect().assertFail(); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_1600
     * @tc.name testMethodIsNativeAtOne016
     * @tc.desc Verify that isNative returns true for native method and false for normal method in a generic class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const genericCls = Type.from<S27_MethodIsNative01<number>>() as ClassType;
      const nativeM = _M(genericCls, 'nativeMethod');
      const normalM = genericCls.getMethodByName('normalFunc');
      expect(nativeM.isNative()).assertTrue();
      expect(normalM.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_1700
     * @tc.name testMethodIsNativeAtOne017
     * @tc.desc Verify that isNative returns false for custom method in enum-style class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const enumCls = Type.from<S30_MethodIsNative01>() as ClassType;
      const customM = enumCls.getMethodByName('customFunc');
      expect(customM.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_1800
     * @tc.name testMethodIsNativeAtOne018
     * @tc.desc Verify that isNative returns false for inherited normal methods in multi-level inheritance chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const grandParent = Type.from<S42_GP_MethodIsNative01>() as ClassType;
      const parent = Type.from<S42_P_MethodIsNative01>() as ClassType;
      const child = Type.from<S42_C_MethodIsNative01>() as ClassType;
      const g = grandParent.getMethodByName('normalFunc');
      const p = parent.getMethodByName('normalFunc');
      const c = child.getMethodByName('normalFunc');
      expect(g.isNative()).assertFalse();
      expect(p.isNative()).assertFalse();
      expect(c.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_1900
     * @tc.name testMethodIsNativeAtOne019
     * @tc.desc Verify that isNative returns true for system-native method and false for user-defined normal method with the same name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const systemCls = Type.from<S62_System_MethodIsNative01>() as ClassType;
      const userCls = Type.from<S62_User_MethodIsNative01>() as ClassType;
      const systemNative = systemCls.getMethodByName('toString');
      const userNormal = userCls.getMethodByName('toString');
      expect(systemNative.isNative()).assertTrue();
      expect(userNormal.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_2000
     * @tc.name testMethodIsNativeAtOne020
     * @tc.desc Verify that isNative returns true for Object native method override and false for custom normal method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S65_MethodIsNative01>() as ClassType;
      const overrideNative = cls.getMethodByName('toString');
      const normalM = cls.getMethodByName('customMethod');
      expect(overrideNative.isNative()).assertTrue();
      expect(normalM.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_2100
     * @tc.name testMethodIsNativeAtOne021
     * @tc.desc Verify that isNative returns consistent true when calling the same native method object multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S76_MethodIsNative01>() as ClassType;
      const m = _M(cls, 'nativeMethod');
      const r1: boolean = m.isNative();
      const r2: boolean = m.isNative();
      const r3: boolean = m.isNative();
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_2200
     * @tc.name testMethodIsNativeAtOne022
     * @tc.desc Verify that isNative returns true and isConstructor returns false on the same native method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S80_MethodIsNative01>() as ClassType;
      const m = _M(cls, 'nativeMethod');
      expect(m.isNative()).assertTrue();
      expect(m.isConstructor()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_2300
     * @tc.name testMethodIsNativeAtOne023
     * @tc.desc Verify that isNative returns false and isConstructor returns false on the same normal method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S81_MethodIsNative01>() as ClassType;
      const m = cls.getMethodByName('normalFunc');
      expect(m.isNative()).assertFalse();
      expect(m.isConstructor()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_2400
     * @tc.name testMethodIsNativeAtOne024
     * @tc.desc Verify isNative returns true and getParametersNum returns correct count on a native method with parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S82_MethodIsNative01>() as ClassType;
      const m = _M(cls, 'nativeMethod');
      expect(m.isNative()).assertTrue();
      expect(m.getType().getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_2500
     * @tc.name testMethodIsNativeAtOne025
     * @tc.desc Verify isNative returns false and getParametersNum returns correct count on a normal method with parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S83_MethodIsNative01>() as ClassType;
      const m = cls.getMethodByName('normalWithParams');
      expect(m.isNative()).assertFalse();
      expect(m.getType().getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_2600
     * @tc.name testMethodIsNativeAtOne026
     * @tc.desc Verify isNative returns true and getName returns the correct name on a native method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S84_MethodIsNative01>() as ClassType;
      const m = _M(cls, 'nativeMethod');
      expect(m.isNative()).assertTrue();
      expect(m.getName()).assertEqual('nativeMethod');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_2700
     * @tc.name testMethodIsNativeAtOne027
     * @tc.desc Verify isNative returns false and getName returns the correct name on a normal method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S85_MethodIsNative01>() as ClassType;
      const m = cls.getMethodByName('normalFunc');
      expect(m.isNative()).assertFalse();
      expect(m.getName()).assertEqual('normalFunc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_2800
     * @tc.name testMethodIsNativeAtOne028
     * @tc.desc Verify isNative returns true and getResultType returns the correct type on a native method with return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S86_MethodIsNative01>() as ClassType;
      const m = cls.getMethodByName('nativeGetData');
      expect(m.isNative()).assertTrue();
      expect(m.getType().getResultType()).assertEqual(Type.from<number>());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_2900
     * @tc.name testMethodIsNativeAtOne029
     * @tc.desc Verify isNative returns false and getResultType returns the correct type on a normal method with return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S87_MethodIsNative01>() as ClassType;
      const m = cls.getMethodByName('normalGetData');
      expect(m.isNative()).assertFalse();
      expect(m.getType().getResultType()).assertEqual(Type.from<string>());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_3000
     * @tc.name testMethodIsNativeAtOne030
     * @tc.desc Verify that isNative returns true for a native method and false for a user class normal method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const objectCls = Type.from<S95_Object_MethodIsNative01>() as ClassType;
      const userCls = Type.from<S95_User_MethodIsNative01>() as ClassType;
      const nativeFromObject = _M(objectCls, 'nativeMethod');
      const normalFromUser = userCls.getMethodByName('userMethod');
      expect(nativeFromObject.isNative()).assertTrue();
      expect(normalFromUser.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_3100
     * @tc.name testMethodIsNativeAtOne031
     * @tc.desc Verify that isNative returns true for native method in enum class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const enumCls = Type.from<S96_Enum_MethodIsNative01>() as ClassType;
      expect(enumCls.getMethodByName('nativeEnumFunc').isNative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_3200
     * @tc.name testMethodIsNativeAtOne032
     * @tc.desc Verify getMethodByName finds normal method with native in its name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ct = Type.from<DestroyedCls_MethodIsNative03>() as ClassType;
      let method = ct.getMethodByName('nativeFunc');
      expect(method as Object).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_3300
     * @tc.name testMethodIsNativeAtOne033
     * @tc.desc Verify multiple Method objects for the same native-named normal method return same isNative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ct = Type.from<MainCls_MethodIsNative03>() as ClassType;
      let m1 = ct.getMethodByName('nativeFunc');
      let m2 = ct.getMethodByName('nativeFunc');
      expect(m1.isNative()).assertEqual(m2.isNative());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_3400
     * @tc.name testMethodIsNativeAtOne034
     * @tc.desc Verify isNative comparison between same native-named normal method from different classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctA = Type.from<ClsFromLoaderA_MethodIsNative03>() as ClassType;
      let ctB = Type.from<ClsFromLoaderB_MethodIsNative03>() as ClassType;
      let m1 = ctA.getMethodByName('nativeFunc');
      let m2 = ctB.getMethodByName('nativeFunc');
      expect(m1.isNative()).assertEqual(m2.isNative());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_3500
     * @tc.name testMethodIsNativeAtOne035
     * @tc.desc Verify isNative returns false for both child and base methods when chainMethod is overridden
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCt = Type.from<ChildCls_MethodIsNative03>() as ClassType;
      let baseCt = Type.from<BaseCls_MethodIsNative03>() as ClassType;
      let method = childCt.getMethodByName('chainMethod');
      let baseMethod = baseCt.getMethodByName('chainMethod');
      expect(method.isNative()).assertFalse();
      expect(baseMethod.isNative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISNATIVE_ONE_3600
     * @tc.name testMethodIsNativeAtOne036
     * @tc.desc Verify isNative returns false for native method with empty body
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsNativeAtOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ct = Type.from<MainCls_MethodIsNative03>() as ClassType;
      let method = ct.getMethodByName('emptyNative');
      expect(method.isNative()).assertFalse();
    });
  });
}
