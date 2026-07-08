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

class SingleNameClass {
  public static sayHello(name: string): string {
    return 'Hi ' + name;
  }
}

class UnusedNameClass {
  public static getVersion(): int { return 2; }
}

class MultiNameClass {
  public static method1(a: int): int { return a; }
  public static method2(msg: string): string { return msg; }
  public static methodName(flag: boolean): boolean { return flag; }
  public static _privateMethod(): string { return 'private'; }
}

class PropertyNameClass {
  private static _label: string = '';
  public static get label(): string {
    return PropertyNameClass._label;
  }
  public static set label(value: string) {
    PropertyNameClass._label = value;
  }
}

class ReturnTypeNameClass {
  public static getMessage(): string { return 'OK'; }
}

class NonEmptyNameClass {
  public static compute(value: float): float { return Double.toFloat(value * 2.0); }
}

class SingleCharNameClass {
  public static z(): boolean { return true; }
}

class LongNameClass {
  public static veryLongMethodNameWithManyCharacters(): int { return 1; }
}

class NoThrowNameClass {
  public static isReady(): boolean { return true; }
}

class ModifierNameClass {
  public static publicMethod(name: string): string { return name; }
  public static async asyncMethod(delay: int): Promise<string> { return delay.toString(); }
  public static finalMethod(value: int): int { return value; }
}

class AsyncNameClass {
  public static async fetchData(): Promise<int> {
    return 42;
  }
}

class ClassA012 {
  public static methodA(x: int): string { return x.toString(); }
}

class ClassB012 {
  public static methodB(y: float): boolean { return y > 0.0; }
}

class ParentClass013 {
  public static parentMethod(msg: string): string { return msg; }
}

class ChildClass013 extends ParentClass013 {
  public static childMethod(n: int): int { return n; }
}

export default function StaticMethodGetNameTest(): void {
  describe('StaticMethodGetNameTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_0100
     * @tc.name testStaticMethodGetName001
     * @tc.desc Verify getName() call with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SingleNameClass>();
      let method = cls.getStaticMethod('sayHello');
      expect(method !== undefined).assertTrue();
      let name: string = method!.getName();
      expect(name).assertEqual('sayHello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_0200
     * @tc.name testStaticMethodGetName002
     * @tc.desc Verify getName() returns correct names for multiple different static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<MultiNameClass>();
      let m1 = cls.getStaticMethod('method1');
      let m2 = cls.getStaticMethod('method2');
      let mn = cls.getStaticMethod('methodName');
      let mp = cls.getStaticMethod('_privateMethod');
      let n1 = m1!.getName();
      let n2 = m2!.getName();
      let nn = mn!.getName();
      let np = mp!.getName();
      expect(n1).assertEqual('method1');
      expect(n2).assertEqual('method2');
      expect(nn).assertEqual('methodName');
      expect(np).assertEqual('_privateMethod');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_0300
     * @tc.name testStaticMethodGetName003
     * @tc.desc Verify getName() returns special method names for getter and setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<PropertyNameClass>();
      let getter = cls.getStaticMethod('%%get-label');
      let setter = cls.getStaticMethod('%%set-label');
      expect(getter !== undefined).assertTrue();
      expect(setter !== undefined).assertTrue();
      expect(getter!.getName()).assertEqual('%%get-label');
      expect(setter!.getName()).assertEqual('%%set-label');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_0400
     * @tc.name testStaticMethodGetName004
     * @tc.desc Verify getName() return type is string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ReturnTypeNameClass>();
      let method = cls.getStaticMethod('getMessage');
      expect(method !== undefined).assertTrue();
      let name = method!.getName();
      let nameType = Class.of(name).getName();
      expect(nameType).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_0500
     * @tc.name testStaticMethodGetName005
     * @tc.desc Verify getName() returns non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NonEmptyNameClass>();
      let method = cls.getStaticMethod('compute');
      expect(method !== undefined).assertTrue();
      let name: string = method!.getName();
      expect(name.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_0600
     * @tc.name testStaticMethodGetName006
     * @tc.desc Verify getName() for single-character method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<SingleCharNameClass>();
      let method = cls.getStaticMethod('z');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('z');
      let nameLen: int = method!.getName().length;
      expect(nameLen).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_0700
     * @tc.name testStaticMethodGetName007
     * @tc.desc Verify getName() for very long method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<LongNameClass>();
      let method = cls.getStaticMethod('veryLongMethodNameWithManyCharacters');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('veryLongMethodNameWithManyCharacters');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_0800
     * @tc.name testStaticMethodGetName008
     * @tc.desc Verify getName() does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<NoThrowNameClass>();
      let method = cls.getStaticMethod('isReady');
      expect(method !== undefined).assertTrue();
      let name: string = method!.getName();
      expect(name !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_0900
     * @tc.name testStaticMethodGetName009
     * @tc.desc Verify getName() for methods with different modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<ModifierNameClass>();
      let mPublic = cls.getStaticMethod('publicMethod');
      let mAsync = cls.getStaticMethod('asyncMethod');
      let mFinal = cls.getStaticMethod('finalMethod');
      let namePublic = mPublic!.getName();
      let nameAsync = mAsync!.getName();
      let nameFinal = mFinal!.getName();
      expect(namePublic).assertEqual('publicMethod');
      expect(nameAsync).assertEqual('asyncMethod');
      expect(nameFinal).assertEqual('finalMethod');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_1000
     * @tc.name testStaticMethodGetName010
     * @tc.desc Verify getName() for async static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class = Class.from<AsyncNameClass>();
      let method = cls.getStaticMethod('fetchData');
      expect(method !== undefined).assertTrue();
      expect(method!.getName()).assertEqual('fetchData');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_1100
     * @tc.name testStaticMethodGetName011
     * @tc.desc Verify getName() for static methods from different classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = Class.from<ClassA012>();
      let clsB = Class.from<ClassB012>();
      let methodA = clsA.getStaticMethod('methodA');
      let methodB = clsB.getStaticMethod('methodB');
      expect(methodA !== undefined).assertTrue();
      expect(methodB !== undefined).assertTrue();
      expect(methodA!.getName()).assertEqual('methodA');
      expect(methodB!.getName()).assertEqual('methodB');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICMETHOD_GET_NAME_1200
     * @tc.name testStaticMethodGetName012
     * @tc.desc Verify getName() in inheritance scenario with parent and child class methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStaticMethodGetName012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass013>();
      let childCls = Class.from<ChildClass013>();
      let parentMethod = parentCls.getStaticMethod('parentMethod');
      let childMethod = childCls.getStaticMethod('childMethod');
      expect(parentMethod !== undefined).assertTrue();
      expect(childMethod !== undefined).assertTrue();
      expect(parentMethod!.getName()).assertEqual('parentMethod');
      expect(childMethod!.getName()).assertEqual('childMethod');
    });
  });
}
