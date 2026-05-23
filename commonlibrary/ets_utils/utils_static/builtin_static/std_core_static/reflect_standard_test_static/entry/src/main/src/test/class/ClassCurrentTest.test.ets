'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

class TestClass001 {
      public getCurrentClass(): Class {
          return Class.current();
      }
  }

function testGetCurrent002(): Class {
      return Class.current();
  }

class MyClass004 {
      public getClass(): Class {
          return Class.current();
      }
  }

class TestClass005 {
      public getAndVerifyType(): Class {
          let cls = Class.current();
          expect(cls instanceof Class).assertTrue();
          return cls;
      }
  }

class TestClass006 {
      public testChainCall(): string {
          return Class.current().getName();
      }
  }

class ChildClass007 extends ParentClass007 {
      public testParentCall(): string {
          let cls = this.getCurrentClass();
          return cls.getName();
      }
  }

class ParentClass007 {
      public getCurrentClass(): Class {
          return Class.of(this);
      }
  }

class ChildClass008 extends ParentClass008 {
  }

class ParentClass008 {
      public getMyClass(): Class {
          return Class.of(this);
      }
  }

class Child009 extends Parent009 {}

class Parent009 extends GrandParent009 {}

class GrandParent009 {
      public getClassInfo(): Class {
          return Class.of(this);
      }
  }

final class FinalClass010 {
      public getClass(): Class {
          return Class.of(this);
      }
  }

class ConcreteClass011 extends AbstractClass011 {
      public override method(): void {}
  }

abstract class AbstractClass011 {
      public getAbstractClass(): Class {
          return Class.from<AbstractClass011>();
      }
      public abstract method(): void;
  }

class GenericClass012<T> {
      public getValue(): Class {
          return Class.of(this);
      }
  }

class InnerClass013 {
          public getInnerClass(): Class {
              return Class.of(this);
          }
      }

class OuterClass013 {
      public getClass(): Class {
          return Class.of(this);
      }
      

  }

class TestClass014 {
      public verifySubtype(): boolean {
          let cls = Class.current();
          return cls.isSubtypeOf(cls);
      }
  }

class TestClass015 {
      public testSuperClass(): string {
          let cls = Class.current();
          let superCls = cls.getSuper();
          return superCls!.getName();
      }
  }

class ParentClass015 {}

class ChildClass015 extends ParentClass015 {}

class TestClass017 {
      public static getStaticClass(): Class {
          return Class.current();
      }
  }

class TestClass018 {
      public constructor() {
          let cls = Class.current();
          expect(Utils.classNameMatches(cls.getName(), "TestClass018")).assertTrue();
      }
  }

class TestClass019 {
      private _name: string = '';
      public get name(): string {
          let cls = Class.current();
          expect(Utils.classNameMatches(cls.getName(), "TestClass019")).assertTrue();
          return this._name;
      }
      public set name(value: string) {
          let cls = Class.current();
          expect(Utils.classNameMatches(cls.getName(), "TestClass019")).assertTrue();
          this._name = value;
      }
  }

class TestClass020 {
      public testConsistency(): boolean {
          let cls1 = Class.current();
          let cls2 = Class.current();
          return cls1 === cls2;
      }
  }

class TestClass022 {
      public testCurrent(): string {
          return Class.current().getName();
      }
  }

class TestClass023 {
      public testOf(obj: TestClass023): string {
          return Class.of(obj).getName();
      }
  }

class TestClass024 {
      public compareCurrentAndOf(): boolean {
          let currentCls = Class.current();
          let ofCls = Class.of(this);
          return currentCls === ofCls;
      }
  }

class TestClass025 {
      public static testFrom(): string {
          return Class.from<TestClass025>().getName();
      }
  }

class TestClass026 {
      public testCurrent(): Class {
          return Class.current();
      }
  }

class TestClass027 {
      public compareCurrentAndFrom(): boolean {
          let currentCls = Class.current();
          let fromCls = Class.from<TestClass027>();
          return currentCls === fromCls;
      }
  }

class TestClass028 {
      public field: int = 0;
      
      public compareAllMethods(): void {
          let currentCls = Class.current();
          
          let ofCls = Class.of(this);
          
          let fromCls = Class.from<TestClass028>();
          
          expect(currentCls === ofCls).assertTrue();
          expect(currentCls === fromCls).assertTrue();
          expect(ofCls === fromCls).assertTrue();
          
          expect(Utils.classNameMatches(currentCls.getName(), "TestClass028")).assertTrue();
          expect(Utils.classNameMatches(ofCls.getName(), "TestClass028")).assertTrue();
          expect(Utils.classNameMatches(fromCls.getName(), "TestClass028")).assertTrue();
      }
  }

class TestClass029 {
      public method1(): Class {
          return Class.current();
      }
      
      public method2(obj: TestClass029): Class {
          return Class.of(obj);
      }
      
      public static method3(): Class {
          return Class.from<TestClass029>();
      }
  }

class TestClass030 {
      public testNotPrimitive(): boolean {
          let cls = Class.current();
          expect(cls.isPrimitive()).assertFalse();
          expect(cls === Class.PRIMITIVE_INT).assertFalse();
          return true;
      }
  }

class NumberWrapper031 {
      public value: double = 0.0;
      public getClass(): Class {
          return Class.current();
      }
  }

class TestClass032 implements MyInterface032 {
      public method(): void {}
      public getClass(): Class {
          return Class.current();
      }
  }

interface MyInterface032 {
      method(): void;
  }

class TestClass033 implements Interface1033, Interface2033 {
      public getClass(): Class {
          return Class.current();
      }
  }

interface Interface2033 {}

interface Interface1033 {}

enum TestEnum034 {
      VALUE1,
      VALUE2
  }

enum TestEnum035 {
      VALUE1,
      VALUE2
  }

class UnionClass036 {
      public getClass(): Class {
          return Class.current();
      }
  }

class NormalClass037 {
      public getClass(): Class {
          return Class.current();
      }
  }

class FixedArrayClass038 {
      public getFixedArrayClass(): Class {
          return Class.from<FixedArray<int>>();
      }
      public getCurrentClass(): Class {
          return Class.current();
      }
  }

class TestClass039 {
      public performanceTest(): void {
          let startTime = Date.now();
          for (let i = 0; i < 10000; i++) {
              let cls = Class.current();
          }
          let endTime = Date.now();
          let duration = endTime - startTime;
          console.info(`Class.current 10000 calls: ${duration}ms`);
      }
  }

class TestClass040 {
      public comparePerformance(): void {
          let obj = this;
          
          let start1 = Date.now();
          for (let i = 0; i < 10000; i++) {
              let cls = Class.current();
          }
          let time1 = Date.now() - start1;
          
          let start2 = Date.now();
          for (let i = 0; i < 10000; i++) {
              let cls = Class.of(obj);
          }
          let time2 = Date.now() - start2;
          
          console.info(`current=${time1}ms of=${time2}ms`);
      }
  }

class TestClass041 {
      public testMemory(): void {
          let cls1 = Class.current();
          let cls2 = Class.current();
          let cls3 = Class.current();
          
          expect(cls1 === cls2).assertTrue();
          expect(cls2 === cls3).assertTrue();
          expect(cls1 === cls3).assertTrue();
      }
  }

class TestClass042 {
      public memoryLeakTest(): void {
          let first = Class.current();
          let last = Class.current();
          for (let i = 0; i < 10000; i++) {
              last = Class.current();
          }
          expect(last === first).assertTrue();
      }
  }

class TestClass044 {
      public testAPIVersion(): void {
          let cls = Class.current();
          expect(cls !== null).assertTrue();
      }
  }

class Module2Class045 {
      public testCrossModule(): void {
          let obj = new Module1Class045();
          let cls = obj.getClass();
          expect(Utils.classNameMatches(cls.getName(), "Module1Class045")).assertTrue();
      }
  }

export class Module1Class045 {
      public getClass(): Class {
          return Class.of(this);
      }
  }

class User046 extends Model046 {
  }

class Model046 {
      public getTableName(): string {
          let cls = Class.of(this);
          let n = cls.getName();
          const lastDot = n.lastIndexOf('.');
          const simple = lastDot >= 0 ? n.substring(lastDot + 1) : n;
          const base = Utils.stripTrailingDigits(simple);
          return base.toLowerCase() + 's';
      }
  }

class Serializable047 {
      public toJSON(): string {
          let cls = Class.current();
          let obj: Record<string, Any> = {};
          obj['className'] = cls.getName();
          return JSON.stringify(obj);
      }
  }

class Service048 extends Logger048 {
      public doSomething(): void {
          this.logInfo("doing something");
      }
  }

class Logger048 {
      public logInfo(message: string): void {
          let cls = Class.current();
          console.info(`[${cls.getName()}] ${message}`);
      }
  }

class ErrorHandler049 {
      public handleError(error: Error): void {
          let cls = Class.current();
          console.error(`Error in ${cls.getName()}: ${error.message}`);
      }
  }

class TestClass050 extends ReflectionUtils050 {
      public testMethod(msg: string): string {
          return "Hello " + msg;
      }
      
      public testDynamicCall(): string {
          return this.callMethod("testMethod", "World") as string;
      }
  }

class ReflectionUtils050 {
      public callMethod(methodName: string, ...args: Any[]): Any {
          let cls = Class.of(this);
          let method = cls.getInstanceMethod(methodName);
          if (method !== undefined) {
              if (args.length === 0) {
                  return method.invoke(this);
              }
              const buf: FixedArray<Any> = new FixedArray<Any>(args.length);
              for (let i = 0; i < args.length; i++) {
                  buf[i] = args[i];
              }
              return method.invoke(this, buf);
          }
          return undefined;
      }
  }

class TestClass051 extends FieldAccessor051 {
      public name: string = "test";
      
      public testFieldAccess(): string {
          return this.getFieldValue("name") as string;
      }
  }

class FieldAccessor051 {
      public getFieldValue(fieldName: string): Any {
          let cls = Class.of(this);
          let field = cls.getInstanceField(fieldName);
          if (field !== undefined) {
              return field.getValue(this);
          }
          return undefined;
      }
  }

class Level5052 extends Level4052 {
      public getClass(): Class {
          return Class.of(this);
      }
  }

class Level4052 extends Level3052 {}

class Level3052 extends Level2052 {}

class Level2052 extends Level1052 {}

class Level1052 {}

class L3053 extends L2053 {}

class L2053 extends L1053 {}

class L1053 extends Base053 {}

class Base053 { public getClass(): Class { return Class.of(this); } }

class TestClass054 extends BaseClass054 implements Interface1054, Interface2054 {
      public getClass(): Class {
          return Class.of(this);
      }
  }

class BaseClass054 {}

interface Interface2054 {}

interface Interface1054 {}

class TestClass055 {
      public regressionTest(): void {
          let cls = Class.current();
          expect(cls !== null).assertTrue();
          expect(cls.getName() !== "").assertTrue();
      }
  }

class TestClass056 {
      public testBackwardCompatibility(): void {
          let cls = Class.current();
          expect(Utils.classNameMatches(cls.getName(), "TestClass056")).assertTrue();
          expect(cls.getSuper() !== null).assertTrue();
      }
  }


export default function ClassCurrentTest(): void {
  describe('ClassCurrentTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_0100
     * @tc.name testClassCurrent001
     * @tc.desc Verify ClassCurrent case 001: current() static method with no arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass001();
        let cls = obj.getCurrentClass();
        expect(Utils.classNameMatches(cls.getName(), "TestClass001")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_0200
     * @tc.name testClassCurrent002
     * @tc.desc Verify ClassCurrent case 002: in call current()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = testGetCurrent002();
        expect(result !== null).assertTrue();
        expect(result.getName().length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_0400
     * @tc.name testClassCurrent004
     * @tc.desc Verify ClassCurrent case 004: in call return Class object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass004();
        let cls = obj.getClass();
        expect(cls !== null).assertTrue();
        expect(Utils.classNameMatches(cls.getName(), "MyClass004")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_0500
     * @tc.name testClassCurrent005
     * @tc.desc Verify ClassCurrent case 005: verify return Classtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass005();
        let cls = obj.getAndVerifyType();
        expect(cls !== null).assertTrue();
        expect(Utils.classNameMatches(cls.getName(), "TestClass005")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_0600
     * @tc.name testClassCurrent006
     * @tc.desc Verify ClassCurrent case 006: return Class object call method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass006();
        let name = obj.testChainCall();
        expect(Utils.classNameMatches(name, "TestClass006")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_0700
     * @tc.name testClassCurrent007
     * @tc.desc Verify ClassCurrent case 007: in method call current()return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new ChildClass007();
        expect(Utils.classNameMatches(child.testParentCall(), "ChildClass007")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_0800
     * @tc.name testClassCurrent008
     * @tc.desc Verify ClassCurrent case 008: method call current()return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new ChildClass008();
        let cls = child.getMyClass();
        expect(Utils.classNameMatches(cls.getName(), "ChildClass008")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_0900
     * @tc.name testClassCurrent009
     * @tc.desc Verify ClassCurrent case 009: inheritance current()return call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Child009();
        let cls = obj.getClassInfo();
        expect(Utils.classNameMatches(cls.getName(), "Child009")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_1000
     * @tc.name testClassCurrent010
     * @tc.desc Verify ClassCurrent case 010: final call current()return Class object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new FinalClass010();
        let cls = obj.getClass();
        expect(Utils.classNameMatches(cls.getName(), "FinalClass010")).assertTrue();
        expect(Class.from<FinalClass010>().isFinal()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_1100
     * @tc.name testClassCurrent011
     * @tc.desc Verify ClassCurrent case 011: abstract class call current()return abstract class Class object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ConcreteClass011();
        let cls = obj.getAbstractClass();
        expect(Utils.classNameMatches(cls.getName(), "AbstractClass011")).assertTrue();
        expect(Class.from<AbstractClass011>().isAbstract()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_1200
     * @tc.name testClassCurrent012
     * @tc.desc Verify ClassCurrent case 012: generic call current()return Class object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new GenericClass012<int>();
        let cls = obj.getValue();
        expect(Utils.classNameMatches(cls.getName(), "GenericClass012")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_1300
     * @tc.name testClassCurrent013
     * @tc.desc Verify ClassCurrent case 013: or call current()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer = new OuterClass013();
        let inner = new InnerClass013();
        expect(Utils.classNameMatches(outer.getClass().getName(), "OuterClass013")).assertTrue();
        expect(Utils.classNameMatches(inner.getInnerClass().getName(), "InnerClass013")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_1400
     * @tc.name testClassCurrent014
     * @tc.desc Verify ClassCurrent case 014: verify return Class object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass014();
        expect(obj.verifySubtype()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_1500
     * @tc.name testClassCurrent015
     * @tc.desc Verify ClassCurrent case 015: verify current()return Class object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass015();
        let superName = obj.testSuperClass();
        expect(superName.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_1600
     * @tc.name testClassCurrent016
     * @tc.desc Verify ClassCurrent case 016: call current() is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let globalClass = Class.current();
        expect(globalClass !== null).assertTrue();
        expect(globalClass.getName().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_1700
     * @tc.name testClassCurrent017
     * @tc.desc Verify ClassCurrent case 017: static method call current()return Class object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = TestClass017.getStaticClass();
        expect(Utils.classNameMatches(cls.getName(), "TestClass017")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_1800
     * @tc.name testClassCurrent018
     * @tc.desc Verify ClassCurrent case 018: constructor call current()return in
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass018();
        expect(obj !== null).assertTrue();
        expect(Utils.classNameMatches(Class.from<TestClass018>().getName(), "TestClass018")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_1900
     * @tc.name testClassCurrent019
     * @tc.desc Verify ClassCurrent case 019: property call current()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass019();
        obj.name = "n";
        expect(obj.name).assertEqual("n");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_2000
     * @tc.name testClassCurrent020
     * @tc.desc Verify ClassCurrent case 020: call current()return same object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass020();
        expect(obj.testConsistency()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_2100
     * @tc.name testClassCurrent021
     * @tc.desc Verify ClassCurrent case 021: scenario current() is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass020();
        expect(obj.testConsistency()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_2200
     * @tc.name testClassCurrent022
     * @tc.desc Verify ClassCurrent case 022: current()return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass022();
        expect(Utils.classNameMatches(obj.testCurrent(), "TestClass022")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_2300
     * @tc.name testClassCurrent023
     * @tc.desc Verify ClassCurrent case 023: of()return object instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass023();
        let testObj = new TestClass023();
        expect(Utils.classNameMatches(obj.testOf(testObj), "TestClass023")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_2400
     * @tc.name testClassCurrent024
     * @tc.desc Verify ClassCurrent case 024: in instance method current() of(this)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass024();
        expect(obj.compareCurrentAndOf()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_2500
     * @tc.name testClassCurrent025
     * @tc.desc Verify ClassCurrent case 025: from() in not object get Class object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Utils.classNameMatches(TestClass025.testFrom(), "TestClass025")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_2600
     * @tc.name testClassCurrent026
     * @tc.desc Verify ClassCurrent case 026: current() in method or constructor call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let fromCls = Class.from<TestClass026>();
        let obj = new TestClass026();
        let currentCls = obj.testCurrent();
        expect(fromCls === currentCls).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_2700
     * @tc.name testClassCurrent027
     * @tc.desc Verify ClassCurrent case 027: in method current() from< >()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass027();
        expect(obj.compareCurrentAndFrom()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_2800
     * @tc.name testClassCurrent028
     * @tc.desc Verify ClassCurrent case 028: scenario method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass028();
        obj.compareAllMethods();
        expect(Utils.classNameMatches(Class.from<TestClass028>().getName(), "TestClass028")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_2900
     * @tc.name testClassCurrent029
     * @tc.desc Verify ClassCurrent case 029: scenario API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass029();
        expect(Utils.classNameMatches(obj.method1().getName(), "TestClass029")).assertTrue();
        expect(Utils.classNameMatches(obj.method2(obj).getName(), "TestClass029")).assertTrue();
        expect(Utils.classNameMatches(TestClass029.method3().getName(), "TestClass029")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_3000
     * @tc.name testClassCurrent030
     * @tc.desc Verify ClassCurrent case 030: current()not return type Class object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass030();
        expect(obj.testNotPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_3100
     * @tc.name testClassCurrent031
     * @tc.desc Verify ClassCurrent case 031: in Number String current() is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        let wrapper = new NumberWrapper031();
        let cls = wrapper.getClass();
        expect(Utils.classNameMatches(cls.getName(), "NumberWrapper031")).assertTrue();
        expect(cls === Class.PRIMITIVE_NUMBER).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_3200
     * @tc.name testClassCurrent032
     * @tc.desc Verify ClassCurrent case 032: interface current()return interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: MyInterface032 = new TestClass032();
        let cls = obj.getClass();
        expect(Utils.classNameMatches(cls.getName(), "TestClass032")).assertTrue();
        expect(cls.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_3300
     * @tc.name testClassCurrent033
     * @tc.desc Verify ClassCurrent case 033: multiple interface when current()return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass033();
        let cls = obj.getClass();
        expect(Utils.classNameMatches(cls.getName(), "TestClass033")).assertTrue();
        let interfaces = cls.getInterfaces();
        expect(interfaces.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_3400
     * @tc.name testClassCurrent034
     * @tc.desc Verify ClassCurrent case 034: type current() is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.from<TestEnum034>().isEnum()).assertTrue();
        expect(Class.from<TestEnum034>().getName().length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_3500
     * @tc.name testClassCurrent035
     * @tc.desc Verify ClassCurrent case 035: using from()get Class object and current()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let enumCls = Class.from<TestEnum035>();
        expect(enumCls.isEnum()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_3600
     * @tc.name testClassCurrent036
     * @tc.desc Verify ClassCurrent case 036: getClass on union instance returns concrete UnionClass036 Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new UnionClass036();
        let cls = obj.getClass();
        expect(Utils.classNameMatches(cls.getName(), "UnionClass036")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_3700
     * @tc.name testClassCurrent037
     * @tc.desc Verify ClassCurrent case 037: Class.from union type isUnion is true not concrete class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let unionCls = Class.from<int | string>();
        expect(unionCls.isUnion()).assertTrue();
        

        let obj = new NormalClass037();
        let currentCls = obj.getClass();
        expect(currentCls.isUnion()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_3800
     * @tc.name testClassCurrent038
     * @tc.desc Verify ClassCurrent case 038: array type current() is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new FixedArrayClass038();
        let currentCls = obj.getCurrentClass();
        expect(Utils.classNameMatches(currentCls.getName(), "FixedArrayClass038")).assertTrue();
        expect(currentCls.isFixedArray()).assertFalse();
        
        let fixedArrayCls = obj.getFixedArrayClass();
        expect(fixedArrayCls.isFixedArray()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_3900
     * @tc.name testClassCurrent039
     * @tc.desc Verify ClassCurrent case 039: verify current() call performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass039();
        obj.performanceTest();
        expect(Utils.classNameMatches(Class.from<TestClass039>().getName(), "TestClass039")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_4000
     * @tc.name testClassCurrent040
     * @tc.desc Verify ClassCurrent case 040: current() and of() from() performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass040();
        obj.comparePerformance();
        expect(Utils.classNameMatches(Class.from<TestClass040>().getName(), "TestClass040")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_4100
     * @tc.name testClassCurrent041
     * @tc.desc Verify ClassCurrent case 041: current()return Class object instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass041();
        obj.testMemory();
        expect(Utils.classNameMatches(Class.from<TestClass041>().getName(), "TestClass041")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_4200
     * @tc.name testClassCurrent042
     * @tc.desc Verify ClassCurrent case 042: verify call current()not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass042();
        obj.memoryLeakTest();
        expect(Utils.classNameMatches(Class.from<TestClass042>().getName(), "TestClass042")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_4300
     * @tc.name testClassCurrent043
     * @tc.desc Verify ClassCurrent case 043: scenario current()return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass022();
        expect(Utils.classNameMatches(obj.testCurrent(), "TestClass022")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_4400
     * @tc.name testClassCurrent044
     * @tc.desc Verify ClassCurrent case 044: verify current() in API version
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass044();
        obj.testAPIVersion();
        expect(Utils.classNameMatches(Class.from<TestClass044>().getName(), "TestClass044")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_4500
     * @tc.name testClassCurrent045
     * @tc.desc Verify ClassCurrent case 045: in call current()return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m = new Module2Class045();
        m.testCrossModule();
        expect(Utils.classNameMatches(Class.from<Module1Class045>().getName(), "Module1Class045")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_4600
     * @tc.name testClassCurrent046
     * @tc.desc Verify ClassCurrent case 046: ORM via current()get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let user = new User046();
        expect(user.getTableName()).assertEqual("users");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_4700
     * @tc.name testClassCurrent047
     * @tc.desc Verify ClassCurrent case 047: when via current()get type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Serializable047();
        let json = obj.toJSON();
        expect(json.includes("Serializable047")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_4800
     * @tc.name testClassCurrent048
     * @tc.desc Verify ClassCurrent case 048: via current()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Service048();
        s.doSomething();
        expect(Utils.classNameMatches(Class.from<Service048>().getName(), "Service048")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_4900
     * @tc.name testClassCurrent049
     * @tc.desc Verify ClassCurrent case 049: error via current()get error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let h = new ErrorHandler049();
        h.handleError(new Error("e"));
        expect(Utils.classNameMatches(Class.from<ErrorHandler049>().getName(), "ErrorHandler049")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_5000
     * @tc.name testClassCurrent050
     * @tc.desc Verify ClassCurrent case 050: via current()get Class object call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass050();
        expect(obj.testDynamicCall()).assertEqual("Hello World");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_5100
     * @tc.name testClassCurrent051
     * @tc.desc Verify ClassCurrent case 051: via current()get Class object field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass051();
        expect(obj.testFieldAccess()).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_5200
     * @tc.name testClassCurrent052
     * @tc.desc Verify ClassCurrent case 052: in inheritance current() is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Level5052();
        let cls = obj.getClass();
        expect(Utils.classNameMatches(cls.getName(), "Level5052")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_5300
     * @tc.name testClassCurrent053
     * @tc.desc Verify ClassCurrent case 053: verify current() in inheritance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {




        
        let obj = new L3053();
        let cls = obj.getClass();
        expect(Utils.classNameMatches(cls.getName(), "L3053")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_5400
     * @tc.name testClassCurrent054
     * @tc.desc Verify ClassCurrent case 054: inheritance interface scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass054();
        let cls = obj.getClass();
        expect(Utils.classNameMatches(cls.getName(), "TestClass054")).assertTrue();
        expect(Utils.classNameMatches(cls.getSuper()!.getName(), "BaseClass054")).assertTrue();
        expect(cls.getInterfaces().length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_5500
     * @tc.name testClassCurrent055
     * @tc.desc Verify ClassCurrent case 055: verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass055();
        obj.regressionTest();
        expect(Utils.classNameMatches(Class.from<TestClass055>().getName(), "TestClass055")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_CURRENT_5600
     * @tc.name testClassCurrent056
     * @tc.desc Verify ClassCurrent case 056: verify API after current() is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassCurrent056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass056();
        obj.testBackwardCompatibility();
        expect(Utils.classNameMatches(Class.from<TestClass056>().getName(), "TestClass056")).assertTrue();
    });

  });
}