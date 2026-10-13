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
  TestType,
} from '../../../../../hypium/index';
import Utils from '../../Util.test';

function assertGetter(cls: ClassType, name: string, expected: boolean): void {
  const m = cls.getMethodByName(name);
  if (m != null) {
    if (expected) {
      expect(m.isGetter()).assertTrue();
    } else {
      expect(m.isGetter()).assertFalse();
    }
  } else {
    expect().assertFail();
  }
}
class S01_IsGetter01 {
  get value(): number {
    return 1;
  }
  getValue(): number {
    return 1;
  }
}
class S02_IsGetter01 {
  static get timeout(): number {
    return 3000;
  }
  static getTimeout(): number {
    return 3000;
  }
}
class S03_IsGetter01 {
  get a(): number {
    return 1;
  }
  private get b(): number {
    return 2;
  }
  protected get c(): number {
    return 3;
  }
  static get d(): number {
    return 4;
  }
  a2(): number {
    return 1;
  }
  private b2(): number {
    return 2;
  }
}
class S04_IsGetter01 {
  get data(): string {
    return 'getter';
  }
  dataMethod(): string {
    return 'method';
  }
}
abstract class S07_Base_IsGetter01 {
  abstract getName(): string;
}
class S07_Derived_IsGetter01 extends S07_Base_IsGetter01 {
  getName(): string {
    return 'x';
  }
}
abstract class S08_IsGetter01 {
  abstract get pi(): number;
  abstract compute(): number;
  get e(): number {
    return 2718;
  }
  square(n: number): number {
    return n * n;
  }
}
interface S12_A_IsGetter01 {
  get a(): number;
}
interface S12_B_IsGetter01 {
  get b(): number;
}
class S12_Impl_IsGetter01 implements S12_A_IsGetter01, S12_B_IsGetter01 {
  get a(): number {
    return 1;
  }
  get b(): number {
    return 2;
  }
}
class IG1_Base26 {
  value(): number {
    return 1;
  }
}
class IG1_Derived26 extends IG1_Base26 {}
const findGetterMethodByClassTypeName = (classType: ClassType, name: string, wantStatic?: boolean): Method | null => {
  for (let i: number = 0; i < classType.getMethodsNum(); i += 1) {
    const method = classType.getMethod(i.toLong());
    if (method.getName() === name) {
      if (wantStatic === undefined || method.isStatic() === wantStatic) {
        return method;
      }
    }
  }
  return null;
};
function _M(ct: ClassType, name: string): Method {
  return ct.getMethodByName(name) as Method;
}
class IsGetter02_S2E2_MultiGetter {
  get a(): number {
    return 1;
  }
  get b(): number {
    return 2;
  }
}
class IsGetter02_S2E5_PublicGetter {
  get id(): number {
    return 1;
  }
}
class IsGetter02_S3E1_SimpleMethod {
  x(): number {
    return 1;
  }
}
class IsGetter02_S3E3_SetterWithGetter {
  private _v: number = 0;
  get v(): number {
    return this._v;
  }
  set v(val: number) {
    this._v = val;
  }
}
class IsGetter02_S3E14_ParamMethod {
  add(a: number, b: number): number {
    return a + b;
  }
}
abstract class IsGetter02_S3E15_AbstractMethod {
  abstract doWork(): void;
}
class IsGetter02_S5E1_MixedGetterMethod {
  get x(): number {
    return 1;
  }
  y(): number {
    return 2;
  }
}
class IsGetter02_S5E2_Calculator {
  get pi(): number {
    return 3;
  }
  get e(): number {
    return 2;
  }
  add(a: number, b: number): number {
    return a + b;
  }
  sub(a: number, b: number): number {
    return a - b;
  }
}
class IsGetter02_S5E3_Base {
  get baseProp(): number {
    return 0;
  }
  baseMethod(): void {}
}
class IsGetter02_S5E3_Derived extends IsGetter02_S5E3_Base {
  get derivedProp(): number {
    return 1;
  }
  derivedMethod(): void {}
}
class IsGetter02_S6E9_Box<T> {
  get item(): T {
    return null as T;
  }
}
class Empty23_MethodIsGetter03 {}
class Base43_MethodIsGetter03 {
  private get val(): number {
    return 0;
  }
}
class Derived43_MethodIsGetter03 extends Base43_MethodIsGetter03 {
  get val(): number {
    return 1;
  }
}
class A46_MethodIsGetter03 {
  val(): number {
    return 0;
  }
}
class B46_MethodIsGetter03 extends A46_MethodIsGetter03 {
  val(): number {
    return 1;
  }
}
class C46_MethodIsGetter03 extends B46_MethodIsGetter03 {
  val(): number {
    return 2;
  }
}
class A114_MethodIsGetter03 {
  get a(): number {
    return 1;
  }
  b(): number {
    return 2;
  }
  get c(): number {
    return 3;
  }
}
interface IContainer124_MethodIsGetter03<T> {
  getItem(): T;
}
class StringContainer124_MethodIsGetter03 implements IContainer124_MethodIsGetter03<string> {
  getItem(): string {
    return '';
  }
}
class Outer133_MethodIsGetter03 {
  get val(): number {
    return 0;
  }
}
class Inner133_MethodIsGetter03 {
  val(): number {
    return 1;
  }
}
class Inner134_MethodIsGetter03 {
  get x(): number {
    return 0;
  }
  y(): number {
    return 1;
  }
}
class Base164_MethodIsGetter03 {
  private get val(): number {
    return 0;
  }
}
class Derived164_MethodIsGetter03 extends Base164_MethodIsGetter03 {}

export default function MethodIsGetter01Test(): void {
  describe('MethodIsGetter01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_0100
     * @tc.name testMethodIsGetterAtOne001
     * @tc.desc Verify that isGetter returns true for getter and false for normal method when both exist in the same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S01_IsGetter01>() as ClassType;
      const getter = cls.getMethodByName('%%get-value');
      if (getter != null) {
        expect(getter.isGetter()).assertTrue();
      } else {
        expect().assertFail();
      }
      const normal = cls.getMethodByName('getValue');
      if (normal != null) {
        expect(normal.isGetter()).assertFalse();
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_0200
     * @tc.name testMethodIsGetterAtOne002
     * @tc.desc Verify that isGetter returns true for static getter and false for static normal method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S02_IsGetter01>() as ClassType;
      const getter = findGetterMethodByClassTypeName(cls, '%%get-timeout', true);
      const normal = findGetterMethodByClassTypeName(cls, 'getTimeout', true);
      if (getter != null) {
        expect(getter.isGetter()).assertTrue();
      } else {
        expect().assertFail();
      }
      if (normal != null) {
        expect(normal.isGetter()).assertFalse();
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_0300
     * @tc.name testMethodIsGetterAtOne003
     * @tc.desc Verify that isGetter returns correct result for getters and methods with combined access modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S03_IsGetter01>() as ClassType;
      assertGetter(cls, '%%get-a', true);
      assertGetter(cls, '%%get-b', true);
      assertGetter(cls, '%%get-c', true);
      const getterD = findGetterMethodByClassTypeName(cls, '%%get-d', true);
      if (getterD != null) {
        expect(getterD.isGetter()).assertTrue();
      } else {
        expect().assertFail();
      }
      assertGetter(cls, 'a2', false);
      assertGetter(cls, 'b2', false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_0400
     * @tc.name testMethodIsGetterAtOne004
     * @tc.desc Verify that isGetter returns true for getter in a class that also has normal methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S04_IsGetter01>() as ClassType;
      const getter = cls.getMethodByName('%%get-data');
      if (getter != null) {
        expect(getter.isGetter()).assertTrue();
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_0500
     * @tc.name testMethodIsGetterAtOne005
     * @tc.desc Verify that isGetter returns false for implemented abstract normal method accessed from derived class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S07_Derived_IsGetter01>() as ClassType;
      const method = cls.getMethodByName('getName');
      if (method != null) {
        expect(method.isGetter()).assertFalse();
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_0600
     * @tc.name testMethodIsGetterAtOne006
     * @tc.desc Verify that isGetter returns correct result for mixed abstract getters and methods in an abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S08_IsGetter01>() as ClassType;
      const getterPi = cls.getMethodByName('%%get-pi');
      if (getterPi != null) {
        expect(getterPi.isGetter()).assertTrue();
      } else {
        expect().assertFail();
      }
      const getterE = cls.getMethodByName('%%get-e');
      if (getterE != null) {
        expect(getterE.isGetter()).assertTrue();
      } else {
        expect().assertFail();
      }
      const compute = cls.getMethodByName('compute');
      if (compute != null) {
        expect(compute.isGetter()).assertFalse();
      } else {
        expect().assertFail();
      }
      const square = cls.getMethodByName('square');
      if (square != null) {
        expect(square.isGetter()).assertFalse();
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_0700
     * @tc.name testMethodIsGetterAtOne007
     * @tc.desc Verify that isGetter returns true for all getters when implementing multiple interfaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cls = Type.from<S12_Impl_IsGetter01>() as ClassType;
      const getterA = cls.getMethodByName('%%get-a');
      if (getterA != null) {
        expect(getterA.isGetter()).assertTrue();
      } else {
        expect().assertFail();
      }
      const getterB = cls.getMethodByName('%%get-b');
      if (getterB != null) {
        expect(getterB.isGetter()).assertTrue();
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_0800
     * @tc.name testMethodIsGetterAtOne008
     * @tc.desc Verify is getter returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Type.from<IG1_Base26>() as ClassType;
      const baseValue = base.getMethodByName('value');
      if (baseValue != null) {
        expect(baseValue.isGetter()).assertFalse();
      } else {
        expect().assertFail();
      }
      const derived = Type.from<IG1_Derived26>() as ClassType;
      const derivedValue = derived.getMethodByName('value');
      if (derivedValue != null) {
        expect(derivedValue.isGetter()).assertFalse();
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_0900
     * @tc.name testMethodIsGetterAtOne009
     * @tc.desc Verify isGetter returns true for multiple getter properties in the same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct = Type.from<IsGetter02_S2E2_MultiGetter>() as ClassType;
      const methodA = ct.getMethodByName('%%get-a');
      const methodB = ct.getMethodByName('%%get-b');
      expect(methodA.isGetter()).assertTrue();
      expect(methodB.isGetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_1000
     * @tc.name testMethodIsGetterAtOne010
     * @tc.desc Verify isGetter returns true for a public getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<IsGetter02_S2E5_PublicGetter>() as ClassType).getMethodByName('%%get-id');
      expect(method.isGetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_1300
     * @tc.name testMethodIsGetterAtOne013
     * @tc.desc Verify isGetter returns false for a simple normal method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = _M(Type.from<IsGetter02_S3E1_SimpleMethod>() as ClassType, 'x');
      expect(method.isGetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_1400
     * @tc.name testMethodIsGetterAtOne014
     * @tc.desc Verify isGetter returns false for a setter method that is paired with a getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<IsGetter02_S3E3_SetterWithGetter>() as ClassType).getMethodByName('%%set-v');
      expect(method.isGetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_1500
     * @tc.name testMethodIsGetterAtOne015
     * @tc.desc Verify isGetter returns false for a method with parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<IsGetter02_S3E14_ParamMethod>() as ClassType).getMethodByName('add');
      expect(method.isGetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_1600
     * @tc.name testMethodIsGetterAtOne016
     * @tc.desc Verify isGetter returns false for an abstract method in abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<IsGetter02_S3E15_AbstractMethod>() as ClassType).getMethodByName('doWork');
      expect(method.isGetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_1800
     * @tc.name testMethodIsGetterAtOne018
     * @tc.desc Verify isGetter distinguishes getter from method in the same class using assertTrue and assertFalse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct = Type.from<IsGetter02_S5E1_MixedGetterMethod>() as ClassType;
      expect(ct.getMethodByName('%%get-x').isGetter()).assertTrue();
      expect(ct.getMethodByName('y').isGetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_1900
     * @tc.name testMethodIsGetterAtOne019
     * @tc.desc Verify isGetter returns correct results for multiple getters and methods in Calculator-style class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct = Type.from<IsGetter02_S5E2_Calculator>() as ClassType;
      expect(ct.getMethodByName('%%get-pi').isGetter()).assertTrue();
      expect(ct.getMethodByName('%%get-e').isGetter()).assertTrue();
      expect(ct.getMethodByName('add').isGetter()).assertFalse();
      expect(ct.getMethodByName('sub').isGetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_2000
     * @tc.name testMethodIsGetterAtOne020
     * @tc.desc Verify isGetter returns correct results for getters and methods in inheritance chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct = Type.from<IsGetter02_S5E3_Derived>() as ClassType;
      expect(ct.getMethodByName('%%get-baseProp').isGetter()).assertTrue();
      expect(ct.getMethodByName('%%get-derivedProp').isGetter()).assertTrue();
      expect(ct.getMethodByName('baseMethod').isGetter()).assertFalse();
      expect(ct.getMethodByName('derivedMethod').isGetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_2400
     * @tc.name testMethodIsGetterAtOne024
     * @tc.desc Verify isGetter returns true for a generic class getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<IsGetter02_S6E9_Box<string>>() as ClassType).getMethodByName('%%get-item');
      expect(method.isGetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_2600
     * @tc.name testMethodIsGetterAtOne026
     * @tc.desc Verify getMethodByName for non-existent method throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ct: ClassType = Type.from<Empty23_MethodIsGetter03>() as ClassType;
      try {
        let m: Method | null = ct.getMethodByName('anything');
        expect(m).assertNull();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_2700
     * @tc.name testMethodIsGetterAtOne027
     * @tc.desc Verify that isGetter returns true when child method overrides parent private getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ct: ClassType = Type.from<Derived43_MethodIsGetter03>() as ClassType;
      expect(ct.getMethodByName('%%get-val').isGetter()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_2900
     * @tc.name testMethodIsGetterAtOne029
     * @tc.desc Verify that isGetter returns false for method overridden across multi-level method chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ct: ClassType = Type.from<C46_MethodIsGetter03>() as ClassType;
      expect(_M(ct, 'val').isGetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_3400
     * @tc.name testMethodIsGetterAtOne034
     * @tc.desc Verify that filtering getters by isGetter correctly identifies them in a collection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ct: ClassType = Type.from<A114_MethodIsGetter03>() as ClassType;
      let names: string[] = ['%%get-a', 'b', '%%get-c'];
      let getters: Method[] = [];
      for (let i: number = 0; i < names.length; i++) {
        let m = ct.getMethodByName(names[i.toInt()]);
        if (m !== undefined && m.isGetter()) {
          getters.push(m);
        }
      }
      expect(getters.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_3700
     * @tc.name testMethodIsGetterAtOne037
     * @tc.desc Verify that isGetter returns false for regular method implementation of generic interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ct: ClassType = Type.from<StringContainer124_MethodIsGetter03>() as ClassType;
      expect(ct.getMethodByName('getItem').isGetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_3800
     * @tc.name testMethodIsGetterAtOne038
     * @tc.desc Verify that isGetter returns true for outer class getter and false for inner class method when they share the same name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outerCt: ClassType = Type.from<Outer133_MethodIsGetter03>() as ClassType;
      expect(outerCt.getMethodByName('%%get-val').isGetter()).assertTrue();
      let innerCt: ClassType = Type.from<Inner133_MethodIsGetter03>() as ClassType;
      expect(_M(innerCt, 'val').isGetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_3900
     * @tc.name testMethodIsGetterAtOne039
     * @tc.desc Verify that isGetter returns correct values for getter and regular method in static inner class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ct: ClassType = Type.from<Inner134_MethodIsGetter03>() as ClassType;
      expect(ct.getMethodByName('%%get-x').isGetter()).assertTrue();
      expect(ct.getMethodByName('y').isGetter()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISGETTER_ONE_4100
     * @tc.name testMethodIsGetterAtOne041
     * @tc.desc Verify getMethodByName for parent private getter val on child class yields isGetter false, then the case voluntarily fails expecting TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsGetterAtOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let ct: ClassType = Type.from<Derived164_MethodIsGetter03>() as ClassType;
        expect(_M(ct, 'val').isGetter()).assertFalse();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });
  });
}
