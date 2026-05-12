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
  public static test(): void {}
}

class MyClass002 {
  public static test(): void {}
}

class ClassA003 {
  public static methodA(): void {}
}

class ClassB003 {
  public static methodB(): void {}
}

class ParentClass004 {
  public static parentMethod(): void {}
}

class ChildClass004 extends ParentClass004 {
  public static childMethod(): void {}
}

class _PrivateClass005 {
  public static test(): void {}
}

class $SpecialClass005 {
  public static test(): void {}
}

class MyClass006 {
  public static test(): void {}
}

class MyClass007 {
  public static test(): void {}
}

class GenericClass008<T> {
  public static staticMethod(): void {}
}

interface Interface1009 {
  method1(): void;
}

interface Interface2009 {
  method2(): void;
}

class MyClass009 implements Interface1009, Interface2009 {
  public method1(): void {}
  public method2(): void {}
  public static ownMethod(): void {}
}

class MyClass010 {
  public static test(): void {}
}

class MyClass011 {
  public static publicMethod(): void {}
  public static async asyncMethod(): Promise<void>  {}
  public static finalMethod(): void {}
}

class MyClass012 {
  public static async fetchData(): Promise<string> {
    return 'data';
  }
}

abstract class AbstractClass013 {
  public static abstractMethod(): void {}
}

final class FinalClass013 {
  public static finalMethod(): void {}
}

class NormalClass013 {
  public static normalMethod(): void {}
}

class MyClass014 {
  private static _name: string = '';
  public static get name(): string {
    return MyClass014._name;
  }
  public static set name(value: string) {
    MyClass014._name = value;
  }
}

class MyClass015 {
  public static method1(): void {}
  public static method2(): void {}
  public static method3(): void {}
}

export default function StaticMethodGetOwnerTest(): void {
  describe('StaticMethodGetOwnerTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0100
     * @tc.name testStaticMethodGetOwner001
     * @tc.desc Verify getOwner() call with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass001>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let owner: Class = method!.getOwner();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0200
     * @tc.name testStaticMethodGetOwner002
     * @tc.desc Verify getOwner() returns Class object with correct class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass002>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let owner: Class = method!.getOwner();
      expect(owner!= null).assertTrue();
      expect(owner.getName().includes('MyClass002')).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0300
     * @tc.name testStaticMethodGetOwner003
     * @tc.desc Verify getOwner() returns correct Class object for different classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let methodA = Class.from<ClassA003>().getStaticMethod('methodA');
      let methodB = Class.from<ClassB003>().getStaticMethod('methodB');
      expect(methodA != undefined).assertTrue();
      expect(methodB != undefined).assertTrue();
      expect(methodA!.getOwner().getName().includes('ClassA003')).assertTrue();
      expect(methodB!.getOwner().getName().includes('ClassB003')).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0400
     * @tc.name testStaticMethodGetOwner004
     * @tc.desc Verify getOwner() for parent and child class static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let parentMethod = Class.from<ParentClass004>().getStaticMethod('parentMethod');
      let childMethod = Class.from<ChildClass004>().getStaticMethod('childMethod');
      expect(parentMethod != undefined).assertTrue();
      expect(childMethod != undefined).assertTrue();
      expect(parentMethod!.getOwner().getName().includes('ParentClass004')).assertTrue();
      expect(childMethod!.getOwner().getName().includes('ChildClass004')).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0500
     * @tc.name testStaticMethodGetOwner005
     * @tc.desc Verify getOwner() for classes with special names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls1: Class = Class.from<_PrivateClass005>();
      let cls2: Class = Class.from<$SpecialClass005>();
      expect(cls1.getStaticMethod('test')!.getOwner().getName().includes('_PrivateClass005')).assertTrue();
      expect(cls2.getStaticMethod('test')!.getOwner().getName().includes('$SpecialClass005')).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0600
     * @tc.name testStaticMethodGetOwner006
     * @tc.desc Verify getOwner() return type is object with getName method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass006>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let owner: Class = method!.getOwner();
      expect(typeof owner).assertEqual('object');
      expect(owner.getName!= null).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0700
     * @tc.name testStaticMethodGetOwner007
     * @tc.desc Verify getOwner() returns Class object with complete set of methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass007>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let owner: Class = method!.getOwner();
      expect(owner.getName()!= null).assertTrue();
      expect(owner.getSuper!= null).assertTrue();
      expect(owner.isSubtypeOf!= null).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0800
     * @tc.name testStaticMethodGetOwner008
     * @tc.desc Verify getOwner() for generic class static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<GenericClass008<int>>();
      let method = cls.getStaticMethod('staticMethod');
      expect(method != undefined).assertTrue();
      expect(method!.getOwner().getName().includes('GenericClass008')).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_0900
     * @tc.name testStaticMethodGetOwner009
     * @tc.desc Verify getOwner() for class implementing multiple interfaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass009>();
      let method = cls.getStaticMethod('ownMethod');
      expect(method != undefined).assertTrue();
      expect(method!.getOwner().getName().includes('MyClass009')).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_1000
     * @tc.name testStaticMethodGetOwner010
     * @tc.desc Verify getOwner() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass010>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let owner: Class = method!.getOwner();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_1100
     * @tc.name testStaticMethodGetOwner011
     * @tc.desc Verify getOwner() for methods with different modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass011>();
      let m1 = cls.getStaticMethod('publicMethod');
      let m2 = cls.getStaticMethod('asyncMethod');
      let m3 = cls.getStaticMethod('finalMethod');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m3 != undefined).assertTrue();
      expect(m1!.getOwner().getName().includes('MyClass011')).assertTrue();
      expect(m2!.getOwner().getName().includes('MyClass011')).assertTrue();
      expect(m3!.getOwner().getName().includes('MyClass011')).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_1200
     * @tc.name testStaticMethodGetOwner012
     * @tc.desc Verify getOwner() for async static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass012>();
      let method = cls.getStaticMethod('fetchData');
      expect(method != undefined).assertTrue();
      expect(method!.getOwner().getName().includes('MyClass012')).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_1300
     * @tc.name testStaticMethodGetOwner013
     * @tc.desc Verify getOwner() for abstract, final, and normal class static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let m1 = Class.from<AbstractClass013>().getStaticMethod('abstractMethod');
      let m2 = Class.from<FinalClass013>().getStaticMethod('finalMethod');
      let m3 = Class.from<NormalClass013>().getStaticMethod('normalMethod');
      expect(m1 != undefined).assertTrue();
      expect(m2 != undefined).assertTrue();
      expect(m3 != undefined).assertTrue();
      expect(m1!.getOwner().getName().includes('AbstractClass013')).assertTrue();
      expect(m2!.getOwner().getName().includes('FinalClass013')).assertTrue();
      expect(m3!.getOwner().getName().includes('NormalClass013')).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_1400
     * @tc.name testStaticMethodGetOwner014
     * @tc.desc Verify getOwner() for getter and setter static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass014>();
      let getter = cls.getStaticMethod('%%get-name');
      let setter = cls.getStaticMethod('%%set-name');
      expect(getter != undefined).assertTrue();
      expect(setter != undefined).assertTrue();
      expect(getter!.getOwner().getName().includes('MyClass014')).assertTrue();
      expect(setter!.getOwner().getName().includes('MyClass014')).assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_OWNER_1500
     * @tc.name testStaticMethodGetOwner015
     * @tc.desc Verify getOwner() returns the same Class object for all static methods in a class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetOwner015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass015>();
      let methods: FixedArray<reflect.StaticMethod> = cls.getStaticMethods();
      let ownerName: string = cls.getName();
      for (let i: int = 0; i < methods.length; i++) {
        expect(methods[i].getOwner().getName()).assertEqual(ownerName);
      }
      return;
    });
  });
}
