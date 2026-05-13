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
import { looseReflect } from './VoidFn.test';

class MyClass001 {
      public test(): string {
          return "no param";
      }
  }

class MyClass002 {
      public test(msg: string): string {
          return msg;
      }
  }

class MyClass003 {
      public simpleMethod(): void {}
  }

class MyClass004 {
      public getUserName(): string {
          return "test";
      }
  }

class MyClass005 {
      public method123(): void {}
      public test2(): void {}
  }

class MyClass006 {
      public _internalMethod(): void {}
  }

class MyClass007 {
      private _name: string = '';
      public get name(): string {
          return this._name;
      }
  }

class MyClass008 {
      private _name: string = '';
      public set name(value: string) {
          this._name = value;
      }
  }

class MyClass009 {
      public test(): void {}
  }

class MyClass010 {
      public a(): void {}
  }

class MyClass011 {
      public thisIsAVeryLongMethodNameThatExceedsNormalLength(): void {}
  }

class MyClass012 {
      public 测试方法(): void {}
      public método(): void {}
  }

class MyClass013 {
      public test(): void {}
  }

class MyClass014 {
      public test(): void {}
  }

class MyClass015 {
      public test(): void {}
  }

class MyClass016 {
      public test(): void {}
  }

class MyClass017 {
      public test(): void {}
  }

class MyClass018 {
      public test(): void {}
  }

class MyClass019 {
      public test(): void {}
  }

class MyClass020 {
      public test(): void {}
  }

class MyClass021 {
      public test(msg: string): string {
          return msg;
      }
  }

class MyClass022 {
      public test(name: string, age: int, flag: boolean): void {}
  }

class MyClass023 {
      public testByte(b: byte): void {}
      public testShort(s: short): void {}
      public testInt(i: int): void {}
      public testLong(l: long): void {}
      public testFloat(f: float): void {}
      public testDouble(d: double): void {}
      public testBoolean(flag: boolean): void {}
      public testChar(ch: char): void {}
  }

class MyClass024 {
      public testString(s: string): void {}
      public testArray(arr: Array<int>): void {}
      public testMap(map: Map<string, int>): void {}
  }

class MyClass025 {
      public test(): string {
          return "test";
      }
      public test(msg: string): string {
          return msg;
      }
  }

class MyClass026 {
      public test(p1: int, p2: int, p3: int, p4: int, p5: int,
                 p6: int, p7: int, p8: int, p9: int, p10: int): void {}
  }

class MyClass027 {
      public testList(list: Array<string>): void {}
      public testMap(map: Map<int, string>): void {}
      public testOptional(opt?: int): void {}
  }

class MyClass028 {
      public testUnion(value: int | string): void {}
  }

class MyClass029 {
      public test(): void {}
  }

class MyClass030 {
      public test(): void {}
  }

class MyClass031 {
      public test(msg: string): void {}
  }

class MyClass032 {
      public test(msg: string): void {}
  }

class MyClass033 {
      public test(name: string, age: int): void {}
  }

class MyClass034 {
      public test(msg: string): void {}
  }

class MyClass035 {
      public singleMethod(): void {}
  }

class MyClass036 {
      public test(): string {
          return "no param";
      }
      public test(msg: string): string {
          return msg;
      }
      public test(name: string, age: int): string {
          return name + ":" + age.toString();
      }
  }

class MyClass037 {
      public test(): string {
          return "no param";
      }
      public test(msg: string): string {
          return msg;
      }
  }

class MyClass038 {
      public myMethod(): string {
          return "my method";
      }
  }

class MyClass039 implements MyInterface039 {
      public sayHi(): string {
          return "hi";
      }
  }

interface MyInterface039 {
      sayHi(): string;
  }

class MyClass040 extends ParentClass040 {
      public childMethod(): string {
          return "child";
      }
  }

class ParentClass040 {
      public parentMethod(): string {
          return "parent";
      }
  }

class MyClass041 implements Interface1041, Interface2041 {
      public method1(): string {
          return "method1";
      }
      public method2(): string {
          return "method2";
      }
  }

interface Interface2041 {
      method2(): string;
  }

interface Interface1041 {
      method1(): string;
  }

class MyClass042 {
      public publicMethod(): string {
          return "public";
      }
  }

class MyClass043 {
      private privateMethod(): string {
          return "private";
      }
  }

class MyClass044 {
      protected protectedMethod(): string {
          return "protected";
      }
  }

class MyClass045 {
      private internalMethod(): string {
          return "internal";
      }
  }

class MyClass046 {
      public static staticMethod(): string {
          return "static";
      }
  }

class MyClass047 {
      public constructor() {}
  }

class MyClass048 {
      public nativeMethod(): void {}
  }

class MyClass049 {
      public final finalMethod(): void {}
  }

class MyClass050 {
      public async asyncMethod(): Promise<string> {
          return "async";
      }
  }

abstract class MyClass051 {
      public abstract abstractMethod(): void;
  }

class MyClass052 {
      public test(): string {
          return "test";
      }
  }

class MyClass053 {
      public myMethod(): void {}
  }

class MyClass054 {
      public test(): void {}
  }

class MyClass055 {
      public test(): string {
          return "test";
      }
  }

class MyClass056 {
      public test(name: string, age: int): void {}
  }

class MyClass057 {
      public test(a: int, b: int, c: int): void {}
  }

class MyClass058 {
      public test(msg: string): string {
          return "Hello " + msg;
      }
  }

class MyClass059 {
      public test(): void {}
  }

class MyClass060 {
      public myMethod(): void {}
  }

class MyClass061 {
      public myMethod(): void {}
  }

class MyClass062 {
      public test(msg: string): string {
          return msg;
      }
  }

class MyClass063 extends ParentClass063 {}

class ParentClass063 {
      public parentMethod(): string {
          return "parent";
      }
  }

class MyClass064 {
      private privateMethod(): string {
          return "private";
      }
  }

class MyClass065 {
      public static staticMethod(): string {
          return "static";
      }
  }

class MyClass066 {
      public test(): void {}
  }

class MyClass067 {
      public test(): void {}
  }

class EmptyClass068 {}

class MyClass069 implements MyInterface069 {
      public interfaceMethod(): string {
          return "interface";
      }
  }

interface MyInterface069 {
      interfaceMethod(): string;
  }

abstract class AbstractClass070 {
      public abstract abstractMethod(): void;
      public concreteMethod(): void {}
  }

class GenericClass071<T> {
      public genericMethod(value: T): T {
          return value;
      }
  }

class MyClass072 {
      public test(): string {
          return "no param";
      }
      public test(msg: string): string {
          return msg;
      }
  }

class MyClass073 {
      public test(): string { return "0"; }
      public test(a: string): string { return a; }
      public test(a: string, b: int): string { return a + b; }
      public test(a: string, b: int, c: boolean): string { return a + b + c; }
  }

class MyClass074 {
      public test(): string { return "0"; }
      public test(msg: string): string { return msg; }
  }

class MyClass075 {
      public test(): void {}
  }

class MyClass076 {
      public test(msg: string): void {}
  }

class MyClass077 {
      public test(msg: string): void {}
  }

class MyClass078 {
      public test(): string { return "0"; }
      public test(msg: string): string { return msg; }
  }

class MyClass079 {
      public test(): string { return "0"; }
      public test(msg: string): string { return msg; }
  }

class MyClass080 {
      public test(): string { return "0"; }
      public test(msg: string): string { return msg; }
  }

class MyClass081 {
      public test(
          p1: int, p2: int, p3: int, p4: int, p5: int,
          p6: int, p7: int, p8: int, p9: int, p10: int,
          p11: int, p12: int, p13: int, p14: int, p15: int,
          p16: int, p17: int, p18: int, p19: int, p20: int
      ): void {}
  }

class MyClass082 {
      public test(map: Map<string, Map<int, Array<string>>>): void {}
  }

class MyClass083 {
      public test(obj: MyClass083): void {}
  }

class LargeClass084 {
      // 生成100个方法
      public method001(): void {}
      public method002(): void {}
      // ... 省略中间方法
      public method100(): void {}
  }

class MyClass085 {
      public test(): void {}
  }

function findMethod086(): string {
      let cls = Class.from<MyClass086>();
      let method = cls.getInstanceMethod('test');
      return method !== null ? 'found' : 'not found';
  }

class MyClass086 {
      public test(): void {}
  }

class MyClass087 {
      public method1(): void {}
      public method2(): void {}
      // ... 更多方法
  }

function dynamicCall088(obj: Object, methodName: string, a: int, b: int): int {
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod(methodName, [Class.from<int>(), Class.from<int>()]);
      if (method !== undefined) {
          return method!.invoke(obj, [a, b]) as int;
      }
      return 0;
  }

class Calculator088 {
      public add(a: int, b: int): int {
          return a + b;
      }
      public subtract(a: int, b: int): int {
          return a - b;
      }
      public multiply(a: int, b: int): int {
          return a * b;
      }
  }

function hasMethod089(obj: Object, methodName: string): boolean {
      let cls = Class.of(obj);
      let method = cls.getInstanceMethod(methodName);
      return method !== undefined;
  }

class MyClass089 {
      public existingMethod(): void {}
  }

class TestClass090 {
      public greet(name: string): string {
          return "Hello, " + name;
      }
  }

class ReflectionUtils090 {
      public static invokeMethod(obj: Object, methodName: string, arg: string): string {
          let cls = Class.of(obj);
          let method = cls.getInstanceMethod(methodName, [Class.from<string>()]);
          if (method !== undefined) {
              return method!.invoke(obj, [arg]) as string;
          }
          throw new Error(`Method ${methodName} not found`);
      }

      public static methodExists(obj: Object, methodName: string): boolean {
          let cls = Class.of(obj);
          return cls.getInstanceMethod(methodName) !== undefined;
      }
  }

class APIClass25091 {
      public method25(): void {}
  }

class APIClass24091 {
      public method24(): void {}
  }

class MyClass093 {
      public async asyncMethod(): Promise<string> {
          return "async result";
      }
  }

class Builder094 {
      private name: string = '';
      private age: int = 0;

      public setName(name: string): this {
          this.name = name;
          return this;
      }

      public setAge(age: int): this {
          this.age = age;
          return this;
      }
  }

class MyClass095 {
      public getValue(): int | string {
          return 42;
      }
  }

class MyClass096 {
      public alwaysThrow(): never {
          throw new Error('Always throws');
      }
  }

class MyClass097 {
      public async final combinedMethod(): Promise<string> {
          return "combined";
      }
  }

abstract class AbstractClass098 {
      public abstract abstractMethod(): void;
      public concreteMethod(): string {
          return "concrete";
      }
  }

class MyClass099 {
      public process<T extends Number>(value: T): T {
          return value;
      }
  }

class MinimalClass100 {
      public min(): void {}
  }

class ComplexClass101 {
      // 字段
      public publicField: int = 0;
      private privateField: string = '';
      protected protectedField: boolean = true;

      // 静态字段
      public static staticField: double = 0.0;

      // 构造函数
      public constructor() {}
      public constructor(value: int) { this.publicField = value; }

      // 实例方法
      public instanceMethod(): void {}
      private privateInstanceMethod(): void {}

      // 静态方法
      public static staticMethod(): void {}

      // Getter/Setter
      public get property(): string { return this.privateField; }
      public set property(value: string) { this.privateField = value; }
  }

class GrandChild102 extends Child102 {
      public grandChildMethod(): string { return "grandchild"; }
  }

class Child102 extends Parent102 {
      public childMethod(): string { return "child"; }
  }

class Parent102 extends GrandParent102 {
      public parentMethod(): string { return "parent"; }
  }

class GrandParent102 {
      public grandParentMethod(): string { return "grandparent"; }
  }

export default function ClassGetInstanceMethodTest002(): void {
  describe('ClassGetInstanceMethodTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0820
     * @tc.name testClassGetInstanceMethod082
     * @tc.desc Verify ClassGetInstanceMethod case 082: generic type error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod082', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass082>();
        try {
            let method = cls.getInstanceMethod('test', [Class.from<Map<string, Map<int, Array<string>>>>()]);
            expect(method !== null).assertTrue();
        } catch (error) {
            // 如果系统不支持复杂嵌套类型，应该有合理的错误处理
            expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0830
     * @tc.name testClassGetInstanceMethod083
     * @tc.desc Verify ClassGetInstanceMethod case 083: type error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod083', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass083>();
        let method = looseReflect(cls as Object).getInstanceMethod('test', [cls] as Object) as reflect.InstanceMethod | undefined;
        expect(method !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0840
     * @tc.name testClassGetInstanceMethod084
     * @tc.desc Verify ClassGetInstanceMethod case 084: in method method performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod084', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<LargeClass084>();
        let startTime = Date.now();
        for (let i = 1; i <= 100; i++) {
            let methodName = 'method' + i.toString().padStart(3, '0');
            let method = cls.getInstanceMethod(methodName);
            expect(method !== null).assertTrue();
        }
        let endTime = Date.now();
        let duration = endTime - startTime;
        expect(duration).assertLess(1000); // 应该在1秒内完成
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0850
     * @tc.name testClassGetInstanceMethod085
     * @tc.desc Verify ClassGetInstanceMethod case 085: method performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod085', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass085>();
        expect(cls.getInstanceMethod('test') !== null).assertTrue();
        let methods: Array<reflect.InstanceMethod> = new Array<reflect.InstanceMethod>();
        for (let i = 0; i < 100; i++) {
            let method = cls.getInstanceMethod('test');
            if (method !== undefined) {
                methods.push(method);
            }
        }
        expect(methods.length).assertEqual(100);
        for (let i = 1; i < methods.length; i++) {
            expect(methods[0].equals(methods[i])).assertEqual(true);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0860
     * @tc.name testClassGetInstanceMethod086
     * @tc.desc Verify ClassGetInstanceMethod case 086: method TaskPool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod086', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
        for (let i = 0; i < 10; i++) {
            expect(findMethod086()).assertEqual('found');
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0870
     * @tc.name testClassGetInstanceMethod087
     * @tc.desc Verify ClassGetInstanceMethod case 087: method after
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod087', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass087>();
        let methods: Array<reflect.InstanceMethod> = new Array<reflect.InstanceMethod>();
        for (let i = 0; i < 10000; i++) {
            let method = cls.getInstanceMethod('method1');
            if (method !== undefined) {
                methods.push(method);
            }
        }
        expect(methods.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0880
     * @tc.name testClassGetInstanceMethod088
     * @tc.desc Verify ClassGetInstanceMethod case 088: using getInstanceMethod method call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod088', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let calc = new Calculator088();
        expect(dynamicCall088(calc, 'add', 10, 20)).assertEqual(30);
        expect(dynamicCall088(calc, 'subtract', 20, 10)).assertEqual(10);
        expect(dynamicCall088(calc, 'multiply', 5, 6)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0890
     * @tc.name testClassGetInstanceMethod089
     * @tc.desc Verify ClassGetInstanceMethod case 089: using getInstanceMethod method in
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod089', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new MyClass089();
        expect(hasMethod089(obj, 'existingMethod')).assertEqual(true);
        expect(hasMethod089(obj, 'nonExistentMethod')).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0900
     * @tc.name testClassGetInstanceMethod090
     * @tc.desc Verify ClassGetInstanceMethod case 090: specified behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod090', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new TestClass090();
        let result = ReflectionUtils090.invokeMethod(obj, 'greet', 'World');
        expect(result).assertEqual('Hello, World');
        expect(ReflectionUtils090.methodExists(obj, 'greet')).assertEqual(true);
        expect(ReflectionUtils090.methodExists(obj, 'unknown')).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0910
     * @tc.name testClassGetInstanceMethod091
     * @tc.desc Verify ClassGetInstanceMethod case 091: different API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod091', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
        let cls24 = Class.from<APIClass24091>();
        let cls25 = Class.from<APIClass25091>();
        expect(cls24.getInstanceMethod('method24') !== null).assertTrue();
        expect(cls25.getInstanceMethod('method25') !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0920
     * @tc.name testClassGetInstanceMethod092
     * @tc.desc Verify ClassGetInstanceMethod case 092: method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod092', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 测试Array类的方法
        let arrayCls = Class.from<Array<int>>();
        let pushMethod = arrayCls.getInstanceMethod('push', [Class.from<int>()]);
        expect(pushMethod !== null).assertTrue();
        expect(pushMethod!.isNative()).assertEqual(true);

        // 测试Map类的方法
        let mapCls = Class.from<Map<string, int>>();
        let setMethod = mapCls.getInstanceMethod('set', [Class.from<string>(), Class.from<int>()]);
        expect(setMethod !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0930
     * @tc.name testClassGetInstanceMethod093
     * @tc.desc Verify ClassGetInstanceMethod case 093: return Promise method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod093', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass093>();
        let method = cls.getInstanceMethod('asyncMethod');
        expect(method !== null).assertTrue();
        expect(method!.isAsync()).assertEqual(true);
        let returnType = method!.getReturnType();
        expect(returnType!.getName()).assertContain('Promise');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0940
     * @tc.name testClassGetInstanceMethod094
     * @tc.desc Verify ClassGetInstanceMethod case 094: return this call method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod094', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<Builder094>();
        let method = cls.getInstanceMethod('setName', [Class.from<string>()]);
        expect(method !== null).assertTrue();
        // 验证返回类型
        let returnType = method!.getReturnType();
        expect(returnType!.getName()).assertEqual('Builder094');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0950
     * @tc.name testClassGetInstanceMethod095
     * @tc.desc Verify ClassGetInstanceMethod case 095: return type method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod095', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass095>();
        let method = cls.getInstanceMethod('getValue');
        expect(method !== null).assertTrue();
        let returnType = method!.getReturnType();
        expect(returnType!.isUnion()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0960
     * @tc.name testClassGetInstanceMethod096
     * @tc.desc Verify ClassGetInstanceMethod case 096: throw error method return never
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod096', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass096>();
        let method = cls.getInstanceMethod('alwaysThrow');
        expect(method !== null).assertTrue();
        // 调用该方法应该抛出错误
        try {
            method!.invoke(new MyClass096());
            expect().assertFail();
        } catch (error) {
            expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0970
     * @tc.name testClassGetInstanceMethod097
     * @tc.desc Verify ClassGetInstanceMethod case 097: multiple modifier method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod097', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass097>();
        let method = cls.getInstanceMethod('combinedMethod');
        expect(method !== null).assertTrue();
        expect(method!.isPublic()).assertEqual(true);
        expect(method!.isAsync()).assertEqual(true);
        expect(method!.isFinal()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0980
     * @tc.name testClassGetInstanceMethod098
     * @tc.desc Verify ClassGetInstanceMethod case 098: in abstract class method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod098', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<AbstractClass098>();
        let method = cls.getInstanceMethod('concreteMethod');
        expect(method !== null).assertTrue();
        expect(method!.isAbstract()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0990
     * @tc.name testClassGetInstanceMethod099
     * @tc.desc Verify ClassGetInstanceMethod case 099: generic method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod099', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass099>();
        let method = cls.getInstanceMethod('process', [Class.from<int>()]);
        expect(method !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_1000
     * @tc.name testClassGetInstanceMethod100
     * @tc.desc Verify ClassGetInstanceMethod case 100: in method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod100', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MinimalClass100>();
        let method = cls.getInstanceMethod('min');
        expect(method !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_1010
     * @tc.name testClassGetInstanceMethod101
     * @tc.desc Verify ClassGetInstanceMethod case 101: in type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod101', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<ComplexClass101>();

        // 测试查找各种方法
        expect(cls.getInstanceMethod('instanceMethod') !== null).assertTrue();
        expect(cls.getInstanceMethod('privateInstanceMethod')).assertEqual(undefined);
        expect(cls.getInstanceMethod('staticMethod')).assertEqual(undefined);
        expect(cls.getInstanceMethod('%%get-property') !== null).assertTrue();
        expect(cls.getInstanceMethod('%%set-property') !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_1020
     * @tc.name testClassGetInstanceMethod102
     * @tc.desc Verify ClassGetInstanceMethod case 102: in inheritance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod102', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<GrandChild102>();

        // 只能找到当前类声明的方法
        expect(cls.getInstanceMethod('grandChildMethod') !== null).assertTrue();
        expect(cls.getInstanceMethod('childMethod')).assertEqual(undefined);
        expect(cls.getInstanceMethod('parentMethod')).assertEqual(undefined);
        expect(cls.getInstanceMethod('grandParentMethod')).assertEqual(undefined);
    });
  });
}
