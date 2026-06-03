'use static'
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
import Utils from '../Util.test';

class MyClass001 {
  public static staticMethod(): void {
    console.info("static method");
  }
}

class MyClass002 {}

class MyClass003 {
  public static method1(): void {}
  public static method2(): void {}
}

interface MyInterface004 {
  name: string;
}

abstract class AbstractClass005 {
  public static abstractMethod(): void {
    console.info("abstract static");
  }
  public abstract instanceMethod(): void;
}

final class FinalClass006 {
  public static finalMethod(): void {
    console.info("final static");
  }
}

class GenericClass007<T> {
  public static create(): GenericClass007<int> {
    return new GenericClass007<int>();
  }
  public static getValue(value: int): int {
    return value;
  }
}

class MyClass008 {
  public static method1(): void {}
  public static method2(): void {}
}

class NoStaticMethodClass009 {
  public instanceMethod(): void {
    console.info("instance");
  }
}

class ChildClass010 extends ParentClass010 {
  public static childMethod(): string {
    return "child";
  }
}

class ParentClass010 {
  public static parentMethod(): string {
    return "parent";
  }
}

class MixedClass011 {
  public static staticMethod(): void {
    console.info("static");
  }
  public instanceMethod(): void {
    console.info("instance");
  }
}

class MyClass012 {
  public static method(): void {}
}

class MyClass013 {
  public static method(): void {}
}

class MixedAccessClass014 {
  public static publicMethod(): string {
    return "public";
  }
  private static privateMethod(): string {
    return "private";
  }
  protected static protectedMethod(): string {
    return "protected";
  }
}

class PrivateStaticClass015 {
  public static publicMethod(): void {}
  private static privateMethod(): void {
    console.info("private");
  }
}

class OverloadClass016 {
  public static process(): string {
    return "no param";
  }
  public static process(msg: string): string {
    return msg;
  }
  public static process(msg: string, count: int): string {
    return msg + count;
  }
}

class MyClass017 {
  public static method(): void {}
}

class MyClass018 {
  public static method(): void {}
}

class ClassWithGetter019 {
  private static _value: string = '';
  public static get value(): string {
    return ClassWithGetter019._value;
  }
}

class ClassWithSetter020 {
  private static _value: string = '';
  public static set value(val: string) {
    ClassWithSetter020._value = val;
  }
}

class AsyncStaticClass021 {
  public static async asyncMethod(): Promise<string> {
    return "async result";
  }
  public static syncMethod(): string {
    return "sync result";
  }
}

class GenericStaticClass022 {
  public static createInt(): int {
    return 0;
  }
  public static processInt(value: int): int {
    return value;
  }
}

class ChildClass023 extends ParentClass023 {
  public static childMethod(): string {
    return "child";
  }
}

class ParentClass023 {
  public static parentMethod(): string {
    return "parent";
  }
}

class ChildClass024 extends ParentClass024 {
  public static childMethod(): string {
    return "child";
  }
}

class ParentClass024 {
  public static parentMethod(): string {
    return "parent";
  }
}

class ChildClass025 extends ParentClass025 {
  public static process(): string {
    return "child";
  }
}

class ParentClass025 {
  public static process(): string {
    return "parent";
  }
}

class MyClass026 {
  public static myStaticMethod(): void {}
}

class MyClass027 {
  public static getStringMethod(): string {
    return "test";
  }
  public static getIntMethod(): int {
    return 0;
  }
  public static getVoidMethod(): void {
    console.info("void");
  }
}

class MyClass028 {
  public static methodWithParams(a: int, b: string): void {}
  public static methodNoParams(): void {}
}

class MyClass029 {
  public static add(a: int, b: int): int {
    return a + b;
  }
}

class ManyStaticMethodsClass030 {
  public static method1(): void {}
  public static method2(): void {}
  public static method3(): void {}
  public static method4(): void {}
  public static method5(): void {}
}

class EmptyClass031 {}

class OnlyInstanceMethodsClass032 {
  public method1(): void {}
  public method2(): void {}
}

class StaticMethodInvoker033 {
  public static invokeAll(cls: Class, methodName: string, a: int, b: int): int {
    let methods = cls.getStaticMethods();
    let n = methods.length;
    for (let i = 0; i < n; i++) {
      let method = methods[i];
      if (method.getName() === methodName) {
        return method.invoke([a, b]) as int;
      }
    }
    throw new Error("Method not found: " + methodName);
  }
}

class MathUtils033 {
  public static add(a: int, b: int): int {
    return a + b;
  }
  public static multiply(a: int, b: int): int {
    return a * b;
  }
  public static divide(a: int, b: int): int {
    if (b === 0) {
      return 0;
    }
    return a / b;
  }
}

class MethodNameCollector034 {
  public static getStaticMethodNames(cls: Class): Array<string> {
    let methods = cls.getStaticMethods();
    let out: Array<string> = new Array<string>();
    let n = methods.length;
    for (let i = 0; i < n; i++) {
      out.push(methods[i].getName());
    }
    return out;
  }
}

class Utils034 {
  public static method1(): void {}
  public static method2(): void {}
  public static helper1(): void {}
  public static helper2(): void {}
}

class ApiFilter035 {
  public static getPublicApis(cls: Class): Array<reflect.StaticMethod> {
    let allMethods = cls.getStaticMethods();
    let publicApis: Array<reflect.StaticMethod> = new Array<reflect.StaticMethod>();
    let n = allMethods.length;
    for (let i = 0; i < n; i++) {
      let method = allMethods[i];
      let name = method.getName();
      if (name.startsWith("public")) {
        publicApis.push(method);
      }
    }
    return publicApis;
  }
}

class Service035 {
  public static publicApi(): string {
    return "public";
  }
  public static internalApi(): string {
    return "internal";
  }
}

class SignatureValidator036 {
  public static validateSignature(cls: Class, methodName: string): boolean {
    let methods = cls.getStaticMethods();
    let n = methods.length;
    for (let i = 0; i < n; i++) {
      let method = methods[i];
      if (method.getName() === methodName) {
        let num = method.getParametersNum();
        if (num > 0) {
          let firstParamType = method.getParameterType(0)!;
          return firstParamType.getName() === "std.core.Array";
        }
      }
    }
    return false;
  }
}

class MyService036 {
  public static processData(data: Array<int>): int {
    return data.length;
  }
}

class PerformanceTest037 {
  public static method001(): int { return 1; }
  public static method002(): int { return 2; }
  public static method003(): int { return 3; }
  public static method004(): int { return 4; }
  public static method005(): int { return 5; }
  public static method006(): int { return 6; }
  public static method007(): int { return 7; }
  public static method008(): int { return 8; }
  public static method009(): int { return 9; }
  public static method010(): int { return 10; }
  public static method011(): int { return 11; }
  public static method012(): int { return 12; }
  public static method013(): int { return 13; }
  public static method014(): int { return 14; }
  public static method015(): int { return 15; }
  public static method016(): int { return 16; }
  public static method017(): int { return 17; }
  public static method018(): int { return 18; }
  public static method019(): int { return 19; }
  public static method020(): int { return 20; }
  public static method021(): int { return 21; }
  public static method022(): int { return 22; }
  public static method023(): int { return 23; }
  public static method024(): int { return 24; }
  public static method025(): int { return 25; }
  public static method026(): int { return 26; }
  public static method027(): int { return 27; }
  public static method028(): int { return 28; }
  public static method029(): int { return 29; }
  public static method030(): int { return 30; }
  public static method031(): int { return 31; }
  public static method032(): int { return 32; }
  public static method033(): int { return 33; }
  public static method034(): int { return 34; }
  public static method035(): int { return 35; }
  public static method036(): int { return 36; }
  public static method037(): int { return 37; }
  public static method038(): int { return 38; }
  public static method039(): int { return 39; }
  public static method040(): int { return 40; }
  public static method041(): int { return 41; }
  public static method042(): int { return 42; }
  public static method043(): int { return 43; }
  public static method044(): int { return 44; }
  public static method045(): int { return 45; }
  public static method046(): int { return 46; }
  public static method047(): int { return 47; }
  public static method048(): int { return 48; }
  public static method049(): int { return 49; }
  public static method050(): int { return 50; }
  public static method051(): int { return 51; }
  public static method052(): int { return 52; }
  public static method053(): int { return 53; }
  public static method054(): int { return 54; }
  public static method055(): int { return 55; }
  public static method056(): int { return 56; }
  public static method057(): int { return 57; }
  public static method058(): int { return 58; }
  public static method059(): int { return 59; }
  public static method060(): int { return 60; }
  public static method061(): int { return 61; }
  public static method062(): int { return 62; }
  public static method063(): int { return 63; }
  public static method064(): int { return 64; }
  public static method065(): int { return 65; }
  public static method066(): int { return 66; }
  public static method067(): int { return 67; }
  public static method068(): int { return 68; }
  public static method069(): int { return 69; }
  public static method070(): int { return 70; }
  public static method071(): int { return 71; }
  public static method072(): int { return 72; }
  public static method073(): int { return 73; }
  public static method074(): int { return 74; }
  public static method075(): int { return 75; }
  public static method076(): int { return 76; }
  public static method077(): int { return 77; }
  public static method078(): int { return 78; }
  public static method079(): int { return 79; }
  public static method080(): int { return 80; }
  public static method081(): int { return 81; }
  public static method082(): int { return 82; }
  public static method083(): int { return 83; }
  public static method084(): int { return 84; }
  public static method085(): int { return 85; }
  public static method086(): int { return 86; }
  public static method087(): int { return 87; }
  public static method088(): int { return 88; }
  public static method089(): int { return 89; }
  public static method090(): int { return 90; }
  public static method091(): int { return 91; }
  public static method092(): int { return 92; }
  public static method093(): int { return 93; }
  public static method094(): int { return 94; }
  public static method095(): int { return 95; }
  public static method096(): int { return 96; }
  public static method097(): int { return 97; }
  public static method098(): int { return 98; }
  public static method099(): int { return 99; }
  public static method100(): int { return 100; }
}

class MixedClass038 {
  public static staticMethod(): void {
    console.info("static");
  }
  public instanceMethod(): void {
    console.info("instance");
  }
}

class MyService039 {
  public static method1(): string {
    return "1";
  }
  public static method2(): string {
    return "2";
  }
}

class Config040 {
  public static version: string = "1.0";
  public static getVersion(): string {
    return Config040.version;
  }
}

class C041 extends B041 {
  public static methodC(): string {
    return "C041";
  }
}

class B041 extends A041 {
  public static methodB(): string {
    return "B041";
  }
}

class A041 {
  public static methodA(): string {
    return "A041";
  }
}

export default function ClassGetStaticMethodsTest(): void {
  describe('ClassGetStaticMethodsTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_0100
     * @tc.name testClassGetStaticMethods001
     * @tc.desc Verify ClassGetStaticMethods case 001: Class.from<MyClass001>(), getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_0200
     * @tc.name testClassGetStaticMethods002
     * @tc.desc Verify ClassGetStaticMethods case 002: Class.from<MyClass003>(), getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass003>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_0300
     * @tc.name testClassGetStaticMethods003
     * @tc.desc Verify ClassGetStaticMethods case 003: Class.from<MyInterface004>(), getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyInterface004>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_0400
     * @tc.name testClassGetStaticMethods004
     * @tc.desc Verify ClassGetStaticMethods case 004: Class.from<AbstractClass005>(), getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass005>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_0500
     * @tc.name testClassGetStaticMethods005
     * @tc.desc Verify ClassGetStaticMethods case 005: Class.from<FinalClass006>(), getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalClass006>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_0600
     * @tc.name testClassGetStaticMethods006
     * @tc.desc Verify ClassGetStaticMethods case 006: Class.from<GenericClass007<string>>(), getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClass007<string>>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_0700
     * @tc.name testClassGetStaticMethods007
     * @tc.desc Verify ClassGetStaticMethods case 007: Class.from<NoStaticMethodClass009>(), getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NoStaticMethodClass009>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_0800
     * @tc.name testClassGetStaticMethods008
     * @tc.desc Verify ClassGetStaticMethods case 008: Class.from<MyClass008>(), getName returns "method1", getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
      let m1 = Utils.findStaticMethodByName(methods, "method1");
      let m2 = Utils.findStaticMethodByName(methods, "method2");
      expect(m1 !== undefined).assertTrue();
      expect(m2 !== undefined).assertTrue();
      expect(m1!.getName()).assertEqual("method1");
      expect(m2!.getName()).assertEqual("method2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_0900
     * @tc.name testClassGetStaticMethods009
     * @tc.desc Verify ClassGetStaticMethods case 009: Class.from<ChildClass010>(), getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass010>();
      let childMethods = childCls.getStaticMethods();
      expect(childMethods.length).assertEqual(1);
      expect(childMethods[0].getName()).assertEqual("childMethod");

      let parentCls = Class.from<ParentClass010>();
      let parentMethods = parentCls.getStaticMethods();
      expect(parentMethods.length).assertEqual(1);
      expect(parentMethods[0].getName()).assertEqual("parentMethod");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_1000
     * @tc.name testClassGetStaticMethods010
     * @tc.desc Verify ClassGetStaticMethods case 010: Class.from<MixedClass011>(), getStaticMethods result verified, getInstanceMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedClass011>();
      let staticMethods = cls.getStaticMethods();
      let instanceMethods = cls.getInstanceMethods();
      expect(staticMethods.length).assertEqual(1);
      expect(instanceMethods.length).assertEqual(1);
      expect(staticMethods[0].getName()).assertEqual("staticMethod");
      expect(instanceMethods[0].getName()).assertEqual("instanceMethod");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_1100
     * @tc.name testClassGetStaticMethods011
     * @tc.desc Verify ClassGetStaticMethods case 011: Class.from<MyClass012>(), getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass012>();
      let methods1 = cls.getStaticMethods();
      let methods2 = cls.getStaticMethods();
      expect(methods1 === methods2).assertEqual(false);
      expect(methods1.length).assertEqual(methods2.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_1200
     * @tc.name testClassGetStaticMethods012
     * @tc.desc Verify ClassGetStaticMethods case 012: Class.from<MyClass013>(), getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass013>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_1300
     * @tc.name testClassGetStaticMethods013
     * @tc.desc Verify ClassGetStaticMethods case 013: Class.from<MixedAccessClass014>(), getName returns "publicMethod", getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedAccessClass014>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      let pub = Utils.findStaticMethodByName(methods, "publicMethod");
      expect(pub !== undefined).assertTrue();
      expect(pub!.getName()).assertEqual("publicMethod");
      expect(pub!.isPublic()).assertEqual(true);

      let hasPrivate = false;
      for (let i = 0; i < methods.length; i++) {
        if (methods[i].getName() === "privateMethod") {
          hasPrivate = true;
          break;
        }
      }
      expect(hasPrivate).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_1400
     * @tc.name testClassGetStaticMethods014
     * @tc.desc Verify ClassGetStaticMethods case 014: Class.from<PrivateStaticClass015>(), getName returns "publicMethod", getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateStaticClass015>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      let pub = Utils.findStaticMethodByName(methods, "publicMethod");
      expect(pub !== undefined).assertTrue();
      expect(pub!.getName()).assertEqual("publicMethod");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_1500
     * @tc.name testClassGetStaticMethods015
     * @tc.desc Verify ClassGetStaticMethods case 015: Class.from<OverloadClass016>(), getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OverloadClass016>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(3);
      let names: Array<string> = new Array<string>();
      for (let i = 0; i < methods.length; i++) {
        names.push(methods[i].getName());
      }
      expect(names).assertContain("process");
      let processCount = 0;
      for (let i = 0; i < names.length; i++) {
        if (names[i] === "process") {
          processCount++;
        }
      }
      expect(processCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_1600
     * @tc.name testClassGetStaticMethods016
     * @tc.desc Verify ClassGetStaticMethods case 016: Class.from<MyClass017>(), getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass017>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      expect(methods[0].getName()).assertEqual("method");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_1700
     * @tc.name testClassGetStaticMethods017
     * @tc.desc Verify ClassGetStaticMethods case 017: Class.from<MyClass018>(), getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass018>();
      let methods1 = cls.getStaticMethods();
      let methods2 = cls.getStaticMethods();
      expect(methods1.length).assertEqual(1);
      expect(methods2.length).assertEqual(1);
      expect(methods1[0].getName()).assertEqual(methods2[0].getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_1800
     * @tc.name testClassGetStaticMethods018
     * @tc.desc Verify ClassGetStaticMethods case 018: Class.from<ClassWithGetter019>(), getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ClassWithGetter019>();
      let methods = cls.getStaticMethods();
      let hasGetter = false;
      for (let i = 0; i < methods.length; i++) {
        if (methods[i].isGetter()) {
          hasGetter = true;
          break;
        }
      }
      expect(hasGetter).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_1900
     * @tc.name testClassGetStaticMethods019
     * @tc.desc Verify ClassGetStaticMethods case 019: Class.from<ClassWithSetter020>(), getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ClassWithSetter020>();
      let methods = cls.getStaticMethods();
      let hasSetter = false;
      for (let i = 0; i < methods.length; i++) {
        if (methods[i].isSetter()) {
          hasSetter = true;
          break;
        }
      }
      expect(hasSetter).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_2000
     * @tc.name testClassGetStaticMethods020
     * @tc.desc Verify ClassGetStaticMethods case 020: Class.from<AsyncStaticClass021>(), getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AsyncStaticClass021>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(3);

      let asyncMethod: reflect.StaticMethod | undefined = undefined;
      let syncMethod: reflect.StaticMethod | undefined = undefined;
      for (let i = 0; i < methods.length; i++) {
        let m = methods[i];
        if (m.getName() === "asyncMethod") {
          asyncMethod = m;
        }
        if (m.getName() === "syncMethod") {
          syncMethod = m;
        }
      }
      expect(asyncMethod!.isAsync()).assertEqual(true);
      expect(syncMethod!.isAsync()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_2100
     * @tc.name testClassGetStaticMethods021
     * @tc.desc Verify ClassGetStaticMethods case 021: Class.from<GenericStaticClass022>(), getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericStaticClass022>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_2200
     * @tc.name testClassGetStaticMethods022
     * @tc.desc Verify ClassGetStaticMethods case 022: Class.from<ChildClass023>(), getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass023>();
      let childMethods = childCls.getStaticMethods();
      expect(childMethods.length).assertEqual(1);
      let childMethodNames: Array<string> = new Array<string>();
      for (let i = 0; i < childMethods.length; i++) {
        childMethodNames.push(childMethods[i].getName());
      }
      expect(childMethodNames).assertContain("childMethod");
      expect(childMethodNames.indexOf("parentMethod")).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_2300
     * @tc.name testClassGetStaticMethods023
     * @tc.desc Verify ClassGetStaticMethods case 023: Class.from<ChildClass024>(), getSuper returns expected parent Class, getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass024>();
      let superCls = childCls.getSuper();
      expect(superCls !== null).assertTrue();
      let superMethods = superCls!.getStaticMethods();
      expect(superMethods.length).assertEqual(1);
      expect(superMethods[0].getName()).assertEqual("parentMethod");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_2400
     * @tc.name testClassGetStaticMethods024
     * @tc.desc Verify ClassGetStaticMethods case 024: Class.from<ParentClass025>(), getStaticMethods result verified, owner Class verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass025>();
      let childCls = Class.from<ChildClass025>();

      let parentMethods = parentCls.getStaticMethods();
      let childMethods = childCls.getStaticMethods();

      expect(parentMethods.length).assertEqual(1);
      expect(childMethods.length).assertEqual(1);

      expect(parentMethods[0].getName()).assertEqual("process");
      expect(childMethods[0].getName()).assertEqual("process");

      expect(parentMethods[0].getOwner().getName()).assertEqual("entry.src.main.src.test.class.ClassGetStaticMethodsTest.test.ParentClass025");
      expect(childMethods[0].getOwner().getName()).assertEqual("entry.src.main.src.test.class.ClassGetStaticMethodsTest.test.ChildClass025");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_2500
     * @tc.name testClassGetStaticMethods025
     * @tc.desc Verify ClassGetStaticMethods case 025: Class.from<MyClass026>(), getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass026>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(1);
      expect(methods[0].getName()).assertEqual("myStaticMethod");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_2600
     * @tc.name testClassGetStaticMethods026
     * @tc.desc Verify ClassGetStaticMethods case 026: Class.from<MyClass027>(), getStaticMethods result verified, return type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass027>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertLarger(0);
      for (let i = 0; i < methods.length; i++) {
        let method = methods[i];
        let returnType = method.getReturnType();
        expect(returnType !== null).assertTrue();
        expect(typeof returnType.getName).assertEqual("function");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_2700
     * @tc.name testClassGetStaticMethods027
     * @tc.desc Verify ClassGetStaticMethods case 027: Class.from<MyClass028>(), getStaticMethods result verified, parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass028>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertLarger(0);
      for (let i = 0; i < methods.length; i++) {
        let method = methods[i];
        expect(method.getParametersNum()).assertLargerOrEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_2800
     * @tc.name testClassGetStaticMethods028
     * @tc.desc Verify ClassGetStaticMethods case 028: Class.from<MyClass029>(), getStaticMethods result verified, invoke behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass029>();
      let methods = cls.getStaticMethods();
      let addMethod: reflect.StaticMethod | undefined = undefined;
      for (let i = 0; i < methods.length; i++) {
        if (methods[i].getName() === "add") {
          addMethod = methods[i];
          break;
        }
      }
      expect(addMethod !== undefined).assertTrue();

      let result = addMethod!.invoke([3, 5]);
      expect(result as int).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_2900
     * @tc.name testClassGetStaticMethods029
     * @tc.desc Verify ClassGetStaticMethods case 029: Class.from<ManyStaticMethodsClass030>(), getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ManyStaticMethodsClass030>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertLarger(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_3000
     * @tc.name testClassGetStaticMethods030
     * @tc.desc Verify ClassGetStaticMethods case 030: Class.from<EmptyClass031>(), getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass031>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_3100
     * @tc.name testClassGetStaticMethods031
     * @tc.desc Verify ClassGetStaticMethods case 031: Class.from<OnlyInstanceMethodsClass032>(), getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OnlyInstanceMethodsClass032>();
      let methods = cls.getStaticMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_3200
     * @tc.name testClassGetStaticMethods032
     * @tc.desc Verify ClassGetStaticMethods case 032: Class.from<MathUtils033>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MathUtils033>();
      let result = StaticMethodInvoker033.invokeAll(cls, "add", 10, 20);
      expect(result as int).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_3300
     * @tc.name testClassGetStaticMethods033
     * @tc.desc Verify ClassGetStaticMethods case 033: Class.from<Utils034>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Utils034>();
      let methodNames = MethodNameCollector034.getStaticMethodNames(cls);
      expect(methodNames.length).assertEqual(4);
      expect(methodNames).assertContain("method1");
      expect(methodNames).assertContain("method2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_3400
     * @tc.name testClassGetStaticMethods034
     * @tc.desc Verify ClassGetStaticMethods case 034: Class.from<Service035>(), getName returns "publicApi"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Service035>();
      let publicApis = ApiFilter035.getPublicApis(cls);
      expect(publicApis.length).assertEqual(1);
      expect(publicApis[0].getName()).assertEqual("publicApi");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_3500
     * @tc.name testClassGetStaticMethods035
     * @tc.desc Verify ClassGetStaticMethods case 035: Class.from<MyService036>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyService036>();
      let isValid = SignatureValidator036.validateSignature(cls, "processData");
      expect(isValid).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_3600
     * @tc.name testClassGetStaticMethods036
     * @tc.desc Verify ClassGetStaticMethods case 036: Class.from<PerformanceTest037>(), getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PerformanceTest037>();
      let startTime = Date.now();
      let methods = cls.getStaticMethods();
      for (let i = 0; i < 1000; i++) {
        methods = cls.getStaticMethods();
      }
      expect(methods.length).assertEqual(100);
      let endTime = Date.now();
      expect(endTime >= startTime).assertTrue();
      console.info("获取1000次静态方法耗时: " + (endTime - startTime) + "ms");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_3700
     * @tc.name testClassGetStaticMethods037
     * @tc.desc Verify ClassGetStaticMethods case 037: Class.from<MixedClass038>(), getStaticMethods result verified, owner Class verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ownerFqn = "entry.src.main.src.test.class.ClassGetStaticMethodsTest.test.MixedClass038";
      let cls = Class.from<MixedClass038>();
      let staticMethods = cls.getStaticMethods();
      expect(staticMethods.length).assertEqual(1);
      expect(staticMethods[0].getName()).assertEqual("staticMethod");
      expect(staticMethods[0].getOwner().getName()).assertEqual(ownerFqn);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_3800
     * @tc.name testClassGetStaticMethods038
     * @tc.desc Verify ClassGetStaticMethods case 038: Class.from<MyService039>(), getName returns "method2", getStaticMethod resolves expected method, getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyService039>();
      let allMethods = cls.getStaticMethods();
      let method2 = cls.getStaticMethod("method2");
      expect(allMethods.length).assertEqual(2);
      expect(method2 !== undefined).assertTrue();
      expect(method2!.getName()).assertEqual("method2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_3900
     * @tc.name testClassGetStaticMethods039
     * @tc.desc Verify ClassGetStaticMethods case 039: Class.from<Config040>(), getStaticFields result verified, getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Config040>();
      let staticMethods = cls.getStaticMethods();
      let staticFields = cls.getStaticFields();

      expect(staticMethods.length).assertEqual(1);
      expect(staticFields.length).assertEqual(1);

      expect(staticMethods[0].getName()).assertEqual("getVersion");
      expect(staticFields[0].getName()).assertEqual("version");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETSTATICMETHODS_4000
     * @tc.name testClassGetStaticMethods040
     * @tc.desc Verify ClassGetStaticMethods case 040: Class.from<A041>(), getName returns "methodA", getStaticMethods result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetStaticMethods040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = Class.from<A041>();
      let clsB = Class.from<B041>();
      let clsC = Class.from<C041>();

      let methodsA = clsA.getStaticMethods();
      let methodsB = clsB.getStaticMethods();
      let methodsC = clsC.getStaticMethods();

      expect(methodsA.length).assertEqual(1);
      expect(methodsB.length).assertEqual(1);
      expect(methodsC.length).assertEqual(1);

      expect(methodsA[0].getName()).assertEqual("methodA");
      expect(methodsB[0].getName()).assertEqual("methodB");
      expect(methodsC[0].getName()).assertEqual("methodC");
    });

  });
}

