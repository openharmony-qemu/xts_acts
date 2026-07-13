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

class BasicOwnerClass {
  public static sayHello(msg: string): string { return msg; }
}

class NameOwnerClass {
  public static getVersion(): int { return 1; }
}

class ClassA003 {
  public static methodA(x: int): string { return x.toString(); }
}

class ClassB003 {
  public static methodB(y: float): boolean { return y > 0.0; }
}

class ParentClass004 {
  public static parentMethod(msg: string): string { return msg; }
}

class ChildClass004 extends ParentClass004 {
  public static childMethod(n: int): int { return n; }
}

class _PrivateClass005 {
  public static privateOp(): float { return 1.0; }
}

class $SpecialClass005 {
  public static specialOp(): boolean { return true; }
}

class TypeCheckOwnerClass {
  public static computeValue(n: int): int { return n; }
}

class MethodListOwnerClass {
  public static fetchName(): string { return 'name'; }
}

class GenericClass008<T> {
  public static staticMethod(): string { return 'generic'; }
}

interface Interface1009 {
  method1(): void;
}

interface Interface2009 {
  method2(): void;
}

class InterfaceOwnerClass implements Interface1009, Interface2009 {
  public method1(): void {}
  public method2(): void {}
  public static ownMethod(name: string): string { return name; }
}

class NoThrowOwnerClass {
  public static isValid(): boolean { return false; }
}

class ModifierOwnerClass {
  public static publicMethod(name: string): string { return name; }
  public static async asyncMethod(delay: int): Promise<string> { return delay.toString(); }
  public static finalMethod(value: int): int { return value; }
}

class AsyncFetchOwnerClass {
  public static async fetchData(): Promise<int> {
    return 42;
  }
}

abstract class AbstractClass013 {
  public static abstractMethod(): string { return 'abstract'; }
}

final class FinalClass013 {
  public static finalMethod(): int { return 0; }
}

class NormalClass013 {
  public static normalMethod(flag: boolean): boolean { return flag; }
}

class PropertyOwnerClass {
  private static _title: string = '';
  public static get title(): string {
    return PropertyOwnerClass._title;
  }
  public static set title(value: string) {
    PropertyOwnerClass._title = value;
  }
}

class MultiMethodOwnerClass {
  public static method1(x: int): int { return x; }
  public static method2(s: string): string { return s; }
  public static method3(b: boolean): boolean { return b; }
}

class BaseOwnerClass {
  public static baseMethod(prefix: string): string { return prefix; }
  private static parentPrivate(): void {}
}

class DerivedOwnerClass extends BaseOwnerClass {
  public static derivedMethod(k: int): int { return k; }
}

class EmptyOwnerClass {
  // No static methods
}

class SingleMethodOwnerClass {
  public static onlyMethod(value: float): float { return value; }
}

export default function StaticMethodGetOwnerTest(): void {
  describe('StaticMethodGetOwnerTest', (): void => {
    beforeAll(() => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_0100
     * @tc.name testStaticMethodGetOwner001
     * @tc.desc Verify getOwner() call with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<BasicOwnerClass>();
      let method = cls.getStaticMethod('sayHello');
      expect(method !== undefined).assertTrue();
      let owner: Class = method!.getOwner();
      expect(owner !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_0200
     * @tc.name testStaticMethodGetOwner002
     * @tc.desc Verify getOwner() returns Class object with correct class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NameOwnerClass>();
      let method = cls.getStaticMethod('getVersion');
      expect(method !== undefined).assertTrue();
      let owner: Class = method!.getOwner();
      expect(owner !== null).assertTrue();
      expect(owner.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwnerTest.test.NameOwnerClass');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_0300
     * @tc.name testStaticMethodGetOwner003
     * @tc.desc Verify getOwner() returns correct Class object for different classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = Class.from<ClassA003>();
      let clsB = Class.from<ClassB003>();
      let methodA = clsA.getStaticMethod('methodA');
      let methodB = clsB.getStaticMethod('methodB');
      expect(methodA !== undefined).assertTrue();
      expect(methodB !== undefined).assertTrue();
      let ownerA = methodA!.getOwner();
      let ownerB = methodB!.getOwner();
      expect(ownerA.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwnerTest.test.ClassA003');
      expect(ownerB.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwnerTest.test.ClassB003');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_0400
     * @tc.name testStaticMethodGetOwner004
     * @tc.desc Verify getOwner() for parent and child class static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass004>();
      let childCls = Class.from<ChildClass004>();
      let parentMethod = parentCls.getStaticMethod('parentMethod');
      let childMethod = childCls.getStaticMethod('childMethod');
      expect(parentMethod !== undefined).assertTrue();
      expect(childMethod !== undefined).assertTrue();
      let parentOwner = parentMethod!.getOwner();
      let childOwner = childMethod!.getOwner();
      expect(parentOwner.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwnerTest.test.ParentClass004');
      expect(childOwner.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwnerTest.test.ChildClass004');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_0500
     * @tc.name testStaticMethodGetOwner005
     * @tc.desc Verify getOwner() for classes with special names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1: Class = Class.from<_PrivateClass005>();
      let cls2: Class = Class.from<$SpecialClass005>();
      let m1 = cls1.getStaticMethod('privateOp');
      let m2 = cls2.getStaticMethod('specialOp');
      let o1 = m1!.getOwner();
      let o2 = m2!.getOwner();
      expect(o1.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwnerTest.test._PrivateClass005');
      expect(o2.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwnerTest.test.$SpecialClass005');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_0600
     * @tc.name testStaticMethodGetOwner006
     * @tc.desc Verify getOwner() return type is object with getName method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<TypeCheckOwnerClass>();
      let method = cls.getStaticMethod('computeValue');
      expect(method !== undefined).assertTrue();
      let owner = method!.getOwner();
      let ownerTypeName = Class.of(owner).getName();
      expect(ownerTypeName !== null).assertTrue();
      expect(owner.getName !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_0700
     * @tc.name testStaticMethodGetOwner007
     * @tc.desc Verify getOwner() returns Class object with complete set of methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MethodListOwnerClass>();
      let method = cls.getStaticMethod('fetchName');
      expect(method !== undefined).assertTrue();
      let owner: Class = method!.getOwner();
      expect(owner.getName() !== null).assertTrue();
      expect(owner.getSuper !== null).assertTrue();
      expect(owner.isSubtypeOf !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_0800
     * @tc.name testStaticMethodGetOwner008
     * @tc.desc Verify getOwner() for generic class static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<GenericClass008<int>>();
      let method = cls.getStaticMethod('staticMethod');
      expect(method !== undefined).assertTrue();
      let owner = method!.getOwner();
      expect(owner.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwnerTest.test.GenericClass008');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_0900
     * @tc.name testStaticMethodGetOwner009
     * @tc.desc Verify getOwner() for class implementing multiple interfaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<InterfaceOwnerClass>();
      let method = cls.getStaticMethod('ownMethod');
      expect(method !== undefined).assertTrue();
      let owner = method!.getOwner();
      expect(owner.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwnerTest.test.InterfaceOwnerClass');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_1000
     * @tc.name testStaticMethodGetOwner010
     * @tc.desc Verify getOwner() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NoThrowOwnerClass>();
      let method = cls.getStaticMethod('isValid');
      expect(method !== undefined).assertTrue();
      let owner: Class = method!.getOwner();
      expect(owner !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_1100
     * @tc.name testStaticMethodGetOwner011
     * @tc.desc Verify getOwner() for methods with different modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ModifierOwnerClass>();
      let m1 = cls.getStaticMethod('publicMethod');
      let m2 = cls.getStaticMethod('asyncMethod');
      let m3 = cls.getStaticMethod('finalMethod');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m3 !== undefined).assertTrue();
      let o1 = m1!.getOwner();
      let o2 = m2!.getOwner();
      let o3 = m3!.getOwner();
      expect(o1.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwnerTest.test.ModifierOwnerClass');
      expect(o2.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwnerTest.test.ModifierOwnerClass');
      expect(o3.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwnerTest.test.ModifierOwnerClass');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_1200
     * @tc.name testStaticMethodGetOwner012
     * @tc.desc Verify getOwner() for async static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AsyncFetchOwnerClass>();
      let method = cls.getStaticMethod('fetchData');
      expect(method !== undefined).assertTrue();
      let owner = method!.getOwner();
      expect(owner.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwnerTest.test.AsyncFetchOwnerClass');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_1300
     * @tc.name testStaticMethodGetOwner013
     * @tc.desc Verify getOwner() for abstract, final, and normal class static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsAbs = Class.from<AbstractClass013>();
      let clsFin = Class.from<FinalClass013>();
      let clsNor = Class.from<NormalClass013>();
      let m1 = clsAbs.getStaticMethod('abstractMethod');
      let m2 = clsFin.getStaticMethod('finalMethod');
      let m3 = clsNor.getStaticMethod('normalMethod');
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m3 !== undefined).assertTrue();
      let o1 = m1!.getOwner();
      let o2 = m2!.getOwner();
      let o3 = m3!.getOwner();
      expect(o1.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwnerTest.test.AbstractClass013');
      expect(o2.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwnerTest.test.FinalClass013');
      expect(o3.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwnerTest.test.NormalClass013');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_1400
     * @tc.name testStaticMethodGetOwner014
     * @tc.desc Verify getOwner() for getter and setter static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PropertyOwnerClass>();
      let getter = cls.getStaticMethod('%%get-title');
      let setter = cls.getStaticMethod('%%set-title');
      expect(getter !== undefined).assertTrue();
      expect(setter !== undefined).assertTrue();
      let gOwner = getter!.getOwner();
      let sOwner = setter!.getOwner();
      expect(gOwner.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwnerTest.test.PropertyOwnerClass');
      expect(sOwner.getName()).assertEqual('entry.src.main.src.test.staticMethod.StaticMethodGetOwnerTest.test.PropertyOwnerClass');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_1500
     * @tc.name testStaticMethodGetOwner015
     * @tc.desc Verify getOwner() returns the same Class object for all static methods in a class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MultiMethodOwnerClass>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let ownerName: string = cls.getName();
      for (let i: int = 0; i < methods.length; i++) {
        let method = methods[i];
        let owner = method.getOwner();
        let nameFromMethod = owner.getName();
        expect(nameFromMethod).assertEqual(ownerName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_1600
     * @tc.name testStaticMethodGetOwner016
     * @tc.desc Verify getStaticMethods() on child class only returns own methods, not parent methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // arkts-sta-reflect.md:822 — getStaticMethods() returns only this class's own methods
      let childCls: Class = Class.from<DerivedOwnerClass>();
      let childMethods = childCls.getStaticMethods();
      expect(childMethods.length).assertEqual(1);
      expect(childMethods[0].getName()).assertEqual('derivedMethod');

      let parentCls: Class = childCls.getSuper()!;
      let parentMethods = parentCls.getStaticMethods();
      expect(parentMethods.length).assertEqual(1);
      expect(parentMethods[0].getName()).assertEqual('baseMethod');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_1700
     * @tc.name testStaticMethodGetOwner017
     * @tc.desc Verify getStaticMethods() returns empty for class with no static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<EmptyOwnerClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_OWNER_1800
     * @tc.name testStaticMethodGetOwner018
     * @tc.desc Verify getStaticMethods() returns exactly one method for class with single static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SingleMethodOwnerClass>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      expect(methods[0].getName()).assertEqual('onlyMethod');
    });
  });
}
