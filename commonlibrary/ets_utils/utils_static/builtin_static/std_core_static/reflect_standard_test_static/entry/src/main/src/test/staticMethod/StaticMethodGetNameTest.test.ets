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

class MyClass003 {
  public static method1(): void {}
  public static method2(): void {}
  public static methodName(): void {}
  public static _privateMethod(): void {}
}

class MyClass004 {
  private static _name: string = '';
  public static get name(): string {
    return MyClass004._name;
  }
  public static set name(value: string) {
    MyClass004._name = value;
  }
}

class MyClass005 {
  public static test(): void {}
}

class MyClass006 {
  public static test(): void {}
}

class MyClass007 {
  public static a(): void {}
}

class MyClass008 {
  public static veryLongMethodNameWithManyCharacters(): void {}
}

class MyClass009 {
  public static test(): void {}
}

class MyClass010 {
  public static publicMethod(): void {}
  public static async asyncMethod(): Promise<void>  {}
  public static finalMethod(): void {}
}

class MyClass011 {
  public static async fetchData(): Promise<string> {
    return 'data';
  }
}

class ClassA012 {
  public static methodA(): void {}
}

class ClassB012 {
  public static methodB(): void {}
}

class ParentClass013 {
  public static parentMethod(): void {}
}

class ChildClass013 extends ParentClass013 {
  public static childMethod(): void {}
}

export default function StaticMethodGetNameTest(): void {
  describe('StaticMethodGetNameTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0100
     * @tc.name testStaticMethodGetName001
     * @tc.desc Verify getName() call with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass001>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let name: string = method!.getName();
      expect(name).assertEqual('test');
      expect(typeof name).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0200
     * @tc.name testStaticMethodGetName002
     * @tc.desc Verify standard return value — returns method name string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass002>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let name: string = method!.getName();
      expect(name).assertEqual('test');
      expect(typeof name).assertEqual('string');
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0300
     * @tc.name testStaticMethodGetName003
     * @tc.desc Verify getName() returns correct names for multiple different static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass003>();
      expect(cls.getStaticMethod('method1')!.getName()).assertEqual('method1');
      expect(cls.getStaticMethod('method2')!.getName()).assertEqual('method2');
      expect(cls.getStaticMethod('methodName')!.getName()).assertEqual('methodName');
      expect(cls.getStaticMethod('_privateMethod')!.getName()).assertEqual('_privateMethod');
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0400
     * @tc.name testStaticMethodGetName004
     * @tc.desc Verify getName() returns special method names for getter and setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass004>();
      let getter = cls.getStaticMethod('%%get-name');
      let setter = cls.getStaticMethod('%%set-name');
      expect(getter != undefined).assertTrue();
      expect(setter != undefined).assertTrue();
      expect(getter!.getName()).assertEqual('%%get-name');
      expect(setter!.getName()).assertEqual('%%set-name');
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0500
     * @tc.name testStaticMethodGetName005
     * @tc.desc Verify getName() return type is string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass005>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let name: string = method!.getName();
      expect(typeof name === 'string').assertTrue();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0600
     * @tc.name testStaticMethodGetName006
     * @tc.desc Verify getName() returns non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass006>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let name: string = method!.getName();
      expect(name.length).assertLarger(0);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0700
     * @tc.name testStaticMethodGetName007
     * @tc.desc Verify getName() for single-character method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass007>();
      let method = cls.getStaticMethod('a');
      expect(method != undefined).assertTrue();
      expect(method!.getName()).assertEqual('a');
      expect(method!.getName().length).assertEqual(1);
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0800
     * @tc.name testStaticMethodGetName008
     * @tc.desc Verify getName() for very long method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass008>();
      let method = cls.getStaticMethod('veryLongMethodNameWithManyCharacters');
      expect(method != undefined).assertTrue();
      expect(method!.getName()).assertEqual('veryLongMethodNameWithManyCharacters');
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0900
     * @tc.name testStaticMethodGetName009
     * @tc.desc Verify getName() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass009>();
      let method = cls.getStaticMethod('test');
      expect(method != undefined).assertTrue();
      let name: string = method!.getName();
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_1000
     * @tc.name testStaticMethodGetName010
     * @tc.desc Verify getName() for methods with different modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass010>();
      expect(cls.getStaticMethod('publicMethod')!.getName()).assertEqual('publicMethod');
      expect(cls.getStaticMethod('asyncMethod')!.getName()).assertEqual('asyncMethod');
      expect(cls.getStaticMethod('finalMethod')!.getName()).assertEqual('finalMethod');
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_1100
     * @tc.name testStaticMethodGetName011
     * @tc.desc Verify getName() for async static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls: Class = Class.from<MyClass011>();
      let method = cls.getStaticMethod('fetchData');
      expect(method != undefined).assertTrue();
      expect(method!.getName()).assertEqual('fetchData');
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_1200
     * @tc.name testStaticMethodGetName012
     * @tc.desc Verify getName() for static methods from different classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let methodA = Class.from<ClassA012>().getStaticMethod('methodA');
      let methodB = Class.from<ClassB012>().getStaticMethod('methodB');
      expect(methodA != undefined).assertTrue();
      expect(methodB != undefined).assertTrue();
      expect(methodA!.getName()).assertEqual('methodA');
      expect(methodB!.getName()).assertEqual('methodB');
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_1300
     * @tc.name testStaticMethodGetName013
     * @tc.desc Verify getName() in inheritance scenario with parent and child class methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let parentMethod = Class.from<ParentClass013>().getStaticMethod('parentMethod');
      let childMethod = Class.from<ChildClass013>().getStaticMethod('childMethod');
      expect(parentMethod != undefined).assertTrue();
      expect(childMethod != undefined).assertTrue();
      expect(parentMethod!.getName()).assertEqual('parentMethod');
      expect(childMethod!.getName()).assertEqual('childMethod');
      return;
    });
  });
}
