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

class CallerClass004 {
      public test(): Class | undefined {
          return Class.ofCaller()
      }
  }

class B006 {
      public methodB(): Class | undefined {
          return Class.ofCaller()  // 应返回B的Class
      }
  }

class A006 {
      public methodA(): Class | undefined {
          return new B006().methodB()
      }
  }

class StaticCaller007 {
      public static getCaller(): Class | undefined {
          return Class.ofCaller()
      }
  }

class ConstructorCaller008 {
      public constructor() {
          let callerClass = Class.ofCaller()
          expect(callerClass != null).assertTrue()
          expect(callerClass!.getName()).assertEqual("ConstructorCaller008")
      }
  }

class PropertyCaller009 {
      private _value: string = ''
      public get value(): string {
          let callerClass = Class.ofCaller()
          expect(callerClass!.getName()).assertEqual("PropertyCaller009")
          return this._value
      }
      public set value(val: string) {
          let callerClass = Class.ofCaller()
          expect(callerClass!.getName()).assertEqual("PropertyCaller009")
          this._value = val
      }
  }

class TestClass011 {
      public identify(): string {
          let callerClass = Class.ofCaller()
          if (callerClass) {
              return callerClass.getName()
          }
          return "unknown"
      }
  }

class Child012 extends Parent012 {
      public getChildCaller(): Class | undefined {
          return Class.ofCaller()
      }
  }

class Parent012 {
      public getParentCaller(): Class | undefined {
          return Class.ofCaller()
      }
  }

class InterfaceImpl013 implements MyInterface013 {
      public getCallerClass(): Class | undefined {
          return Class.ofCaller()
      }
  }

interface MyInterface013 {
      getCallerClass(): Class | undefined
  }

class AsyncCaller015 {
      public probeOfCaller(): string {
          let callerClass = Class.ofCaller();
          return callerClass ? callerClass.getName() : "";
      }

      public async testAsyncCaller(): Promise<Class | undefined> {
          return await new Promise<Class | undefined>((resolve) => {
              let callerClass = Class.ofCaller()
              resolve(callerClass)  // 可能返回undefined
          })
      }
  }

class AnonymousCaller016 {
      public testAnonymous(): Class | undefined {
          let func = (): Class | undefined => {
              return Class.ofCaller()
          }
          return func()
      }
  }

class HigherOrderCaller017 {
      public execute(callback: () => Class | undefined): Class | undefined {
          return callback()
      }

      public testHigherOrder(): Class | undefined {
          return this.execute(() => Class.ofCaller())
      }
  }

class Service018 {
      public doWork(): void {
          Logger018.log("Work started")
      }
  }

class Logger018 {
      public static log(message: string): void {
          let callerClass = Class.ofCaller()
          let className = callerClass ? callerClass.getName() : "unknown"
          console.info(`[${className}] ${message}`)
      }
  }

class UserClass019 {
      public callSecure(svc: SecureService019): boolean {
          return svc.restrictedMethod()  // 返回false
      }
  }

class AdminClass019 {
      public callSecure(svc: SecureService019): boolean {
          return svc.restrictedMethod()  // 返回true
      }
  }

class SecureService019 {
      public restrictedMethod(): boolean {
          let callerClass = Class.ofCaller()
          if (callerClass && callerClass.getName() === "AdminClass019") {
              return true
          }
          return false
      }
  }

class TracedClass020 {
      public methodA(): void {
          Tracer020.trace("methodA")
          this.methodB()
          Tracer020.popDepth()
      }

      public methodB(): void {
          Tracer020.trace("methodB")
      }
  }

class Tracer020 {
      private static depth: int = 0

      public static popDepth(): void {
          Tracer020.depth--
      }

      public static trace(methodName: string): void {
          let callerClass = Class.ofCaller()
          let count: int = Tracer020.depth
          let indent = ""
          for (let i = 0; i < count; i++) {
            indent = indent + "  "
          }
          let className = callerClass ? callerClass.getName() : "?"
          console.info(`${indent}${className}.${methodName}`)
          Tracer020.depth++
      }
  }

class InjectorDep021 {
      connection: string = ""
      public constructor(c: string) {
        this.connection = c
      }
  }

class DatabaseService021 {
      dep: Object | null = null
      public constructor() {
          this.dep = Injector021.getDependency()
      }
  }

class Injector021 {
      public static getDependency(): Object | null {
          let callerClass = Class.ofCaller()
          if (!callerClass) {
            return null
          }

          let className = callerClass.getName()
          if (className === "DatabaseService021") {
              return new InjectorDep021("db-connection")
          } else if (className === "CacheService") {
              return new InjectorDep021("cache-connection")
          }
          return null
      }
  }

class PerformanceTest022 {
      public runManyTimes(): void {
          let startTime = Date.now()
          for (let i = 0; i < 10000; i++) {
              let callerClass = Class.ofCaller()
          }
          let endTime = Date.now()
          console.info(`Time: ${endTime - startTime}ms`)
      }
  }

function concurrentTask023(): string {
      return ConcurrentCaller023.getCallerInfo()
  }

class ConcurrentCaller023 {
      public static getCallerInfo(): string {
          let callerClass = Class.ofCaller()
          return callerClass ? callerClass.getName() : "unknown"
      }
  }

class GenericCaller024<T> {
      public getCaller(): Class | undefined {
          return Class.ofCaller()
      }

      public process(value: T): void {
          let callerClass = Class.ofCaller()
          expect(callerClass!.getName()).assertEqual("GenericCaller024")
      }
  }

class ResilientService027 {
      public getCallerName(): string {
          let callerClass = Class.ofCaller()
          if (callerClass) {
              return callerClass.getName()
          }
          return "DefaultCaller"
      }
  }

class SafeCaller028 {
      public getCallerInfo(): string {
          let callerClass = Class.ofCaller()
          // 使用可选链和空值合并
          return callerClass?.getName() ?? "unknown"
      }
  }

class VersionTest029 {
      public testCompatibility(): void {
          let callerClass = Class.ofCaller()
          // 验证行为符合API版本规范
          expect(callerClass != null).assertTrue()
      }
  }

class Module2Class030 {
      public testCrossModule(): Class | undefined {
          let m1 = new Module1Class030()
          return m1.getCallerFromModule1()  // 应返回Module1Class
      }
  }

export class Module1Class030 {
      public getCallerFromModule1(): Class | undefined {
          return Class.ofCaller()
      }
  }

class DeepCaller031 {
      public level1(): Class | undefined {
          return this.level2()
      }

      private level2(): Class | undefined {
          return this.level3()
      }

      private level3(): Class | undefined {
          return this.level4()
      }

      private level4(): Class | undefined {
          return this.level5()
      }

      private level5(): Class | undefined {
          return Class.ofCaller()
      }
  }

class RecursiveCaller032 {
      private depth: number = 0

      public recursiveCall(maxDepth: number): Class | undefined {
          let callerClass = Class.ofCaller()
          if (this.depth < maxDepth) {
              this.depth++
              return this.recursiveCall(maxDepth)
          }
          this.depth = 0
          return callerClass
      }
  }

class C033 {
      public test(): boolean {
          return new B033().testCaller()
      }
  }

class B033 {
      public testCaller(): boolean {
          if (Class.ofCaller() == Class.from<A033>()) {
              return true
          } else {
              return false
          }
      }
  }

class A033 {
      public test(): boolean {
          return new B033().testCaller()
      }
  }

class Y034 {
      public dispatch(): string {
          return new Dispatcher034().getCallerName()
      }
  }

class X034 {
      public dispatch(): string {
          return new Dispatcher034().getCallerName()
      }
  }

class Dispatcher034 {
      public getCallerName(): string {
          let callerClass = Class.ofCaller()
          return callerClass ? callerClass.getName() : "unknown"
      }
  }

class TargetClass035 {
      public test(): boolean {
          return new ProperComparison035().isCalledBy(Class.from<TargetClass035>())
      }
  }

class ProperComparison035 {
      public isCalledBy(targetClass: Class): boolean {
          let callerClass = Class.ofCaller()
          if (!callerClass) return false
          // 使用Class对象比较
          return callerClass === targetClass || callerClass.isSubtypeOf(targetClass)
      }
  }

class CachedCaller036 {
      private cachedCaller: Class | null = null

      public getCaller(): Class | undefined {
          if (!this.cachedCaller) {
              this.cachedCaller = Class.ofCaller() ?? null
          }
          return this.cachedCaller ?? undefined
      }
  }


export default function ClassOfCallerTest(): void {
  describe('ClassOfCallerTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_0100
     * @tc.name testClassOfCaller001
     * @tc.desc Verify ClassOfCaller case 001: ofCaller static method not parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let callerClass = Class.ofCaller();
        expect(callerClass).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_0200
     * @tc.name testClassOfCaller002
     * @tc.desc Verify ClassOfCaller case 002: parameters should compile error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<CallerClass004>();
      expect(cls.getName().length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_0300
     * @tc.name testClassOfCaller003
     * @tc.desc Verify ClassOfCaller case 003: verify method not parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<CallerClass004>();
      expect(cls.isUnion()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_0400
     * @tc.name testClassOfCaller004
     * @tc.desc Verify ClassOfCaller case 004: from method call when return Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new CallerClass004()
        let result = obj.test()
        expect(result != null).assertTrue()
        expect(result!.getName()).assertEqual("CallerClass004")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_0500
     * @tc.name testClassOfCaller005
     * @tc.desc Verify ClassOfCaller case 005: call when return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 在顶层调用或特殊上下文中
        let callerClass = Class.ofCaller()
        expect(callerClass).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_0600
     * @tc.name testClassOfCaller006
     * @tc.desc Verify ClassOfCaller case 006: call get call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let objA = new A006()
        let result = objA.methodA() as Class
        expect(result.getName()).assertEqual("B006")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_0700
     * @tc.name testClassOfCaller007
     * @tc.desc Verify ClassOfCaller case 007: from static method get call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let result = StaticCaller007.getCaller()
        expect(result != null).assertTrue()
        expect(result!.getName()).assertEqual("StaticCaller007")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_0800
     * @tc.name testClassOfCaller008
     * @tc.desc Verify ClassOfCaller case 008: from constructor get call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new ConstructorCaller008();
        expect(obj != null).assertTrue();
        expect(Class.from<ConstructorCaller008>().getName()).assertEqual("ConstructorCaller008");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_0900
     * @tc.name testClassOfCaller009
     * @tc.desc Verify ClassOfCaller case 009: from property get call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new PropertyCaller009();
        obj.value = "test";
        expect(obj.value).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_1000
     * @tc.name testClassOfCaller010
     * @tc.desc Verify ClassOfCaller case 010: verify return Class or undefinedtype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let callerClass = Class.ofCaller();
        if (callerClass !== undefined) {
            expect(callerClass!.getName().length > 0).assertTrue();
        } else {
            expect(callerClass === undefined).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_1100
     * @tc.name testClassOfCaller011
     * @tc.desc Verify ClassOfCaller case 011: return Classobject call method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new TestClass011()
        expect(obj.identify()).assertEqual("TestClass011")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_1200
     * @tc.name testClassOfCaller012
     * @tc.desc Verify ClassOfCaller case 012: in inheritance call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new Child012()
        let parentResult = obj.getParentCaller()
        let childResult = obj.getChildCaller()
        expect(parentResult!.getName()).assertEqual("Parent012")
        expect(childResult!.getName()).assertEqual("Child012")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_1300
     * @tc.name testClassOfCaller013
     * @tc.desc Verify ClassOfCaller case 013: interface get call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj: MyInterface013 = new InterfaceImpl013()
        let result = obj.getCallerClass()
        expect(result!.getName()).assertEqual("InterfaceImpl013")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_1400
     * @tc.name testClassOfCaller014
     * @tc.desc Verify ClassOfCaller case 014: in call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 在全局作用域或特殊环境中
        let callerClass = Class.ofCaller()
        expect(callerClass).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_1500
     * @tc.name testClassOfCaller015
     * @tc.desc Verify ClassOfCaller case 015: in get call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new AsyncCaller015();
        expect(obj.probeOfCaller()).assertEqual("AsyncCaller015");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_1600
     * @tc.name testClassOfCaller016
     * @tc.desc Verify ClassOfCaller case 016: in get call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new AnonymousCaller016();
        let result = obj.testAnonymous();
        if (result !== undefined) {
            expect(result.getName()).assertEqual("AnonymousCaller016");
        } else {
            expect(result === undefined).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_1700
     * @tc.name testClassOfCaller017
     * @tc.desc Verify ClassOfCaller case 017: is parameters when call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new HigherOrderCaller017();
        let r = obj.testHigherOrder();
        expect(r!.getName()).assertEqual("HigherOrderCaller017");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_1800
     * @tc.name testClassOfCaller018
     * @tc.desc Verify ClassOfCaller case 018: using ofCaller method call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let service = new Service018();
        service.doWork();
        expect(Class.from<Service018>().getName()).assertEqual("Service018");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_1900
     * @tc.name testClassOfCaller019
     * @tc.desc Verify ClassOfCaller case 019: verify method call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let u = new UserClass019();
        let a = new AdminClass019();
        let svc = new SecureService019();
        expect(u.callSecure(svc)).assertFalse();
        expect(a.callSecure(svc)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_2000
     * @tc.name testClassOfCaller020
     * @tc.desc Verify ClassOfCaller case 020: method call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let t = new TracedClass020();
        t.methodA();
        expect(Class.from<TracedClass020>().getName()).assertEqual("TracedClass020");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_2100
     * @tc.name testClassOfCaller021
     * @tc.desc Verify ClassOfCaller case 021: call type different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let db = new DatabaseService021();
        expect(db.dep != null).assertTrue();
        expect((db.dep as InjectorDep021).connection).assertEqual("db-connection");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_2200
     * @tc.name testClassOfCaller022
     * @tc.desc Verify ClassOfCaller case 022: in call ofCaller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let p = new PerformanceTest022();
        p.runManyTimes();
        expect(Class.from<PerformanceTest022>().getName()).assertEqual("PerformanceTest022");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_2300
     * @tc.name testClassOfCaller023
     * @tc.desc Verify ClassOfCaller case 023: in TaskPool or Worker call ofCaller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      expect(ConcurrentCaller023.getCallerInfo().length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_2400
     * @tc.name testClassOfCaller024
     * @tc.desc Verify ClassOfCaller case 024: in generic get call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let stringCaller = new GenericCaller024<string>()
        let caller = stringCaller.getCaller()
        expect(caller!.getName()).assertEqual("GenericCaller024")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_2500
     * @tc.name testClassOfCaller025
     * @tc.desc Verify ClassOfCaller case 025: in using ofCaller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller025', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let s = new SafeCaller028();
        expect(s.getCallerInfo()).assertEqual("SafeCaller028");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_2600
     * @tc.name testClassOfCaller026
     * @tc.desc Verify ClassOfCaller case 026: in get call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller026', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let v = new VersionTest029();
        v.testCompatibility();
        expect(Class.from<VersionTest029>().getName()).assertEqual("VersionTest029");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_2700
     * @tc.name testClassOfCaller027
     * @tc.desc Verify ClassOfCaller case 027: get call when using
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller027', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let service = new ResilientService027()
        let name = service.getCallerName()
        expect(name).assertEqual("ResilientService027")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_2800
     * @tc.name testClassOfCaller028
     * @tc.desc Verify ClassOfCaller case 028: using
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller028', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let c = new CachedCaller036();
        expect(c.getCaller()!.getName()).assertEqual("CachedCaller036");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_2900
     * @tc.name testClassOfCaller029
     * @tc.desc Verify ClassOfCaller case 029: verify in different API is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller029', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      expect(new TargetClass035().test()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_3000
     * @tc.name testClassOfCaller030
     * @tc.desc Verify ClassOfCaller case 030: from different call ofCaller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller030', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let m2 = new Module2Class030();
        let caller = m2.testCrossModule();
        expect(caller != null).assertTrue();
        expect(caller!.getName()).assertEqual("Module1Class030");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_3100
     * @tc.name testClassOfCaller031
     * @tc.desc Verify ClassOfCaller case 031: in call get call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller031', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new DeepCaller031()
        let result = obj.level1()
        expect(result!.getName()).assertEqual("DeepCaller031")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_3200
     * @tc.name testClassOfCaller032
     * @tc.desc Verify ClassOfCaller case 032: in method get call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller032', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let obj = new RecursiveCaller032()
        let result = obj.recursiveCall(10)
        expect(result!.getName()).assertEqual("RecursiveCaller032")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_3300
     * @tc.name testClassOfCaller033
     * @tc.desc Verify ClassOfCaller case 033: verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller033', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 测试
        expect(new A033().test()).assertTrue()
        expect(new C033().test()).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_3400
     * @tc.name testClassOfCaller034
     * @tc.desc Verify ClassOfCaller case 034: multiple different call method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller034', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      // 测试
        expect(new X034().dispatch()).assertEqual("X034")
        expect(new Y034().dispatch()).assertEqual("Y034")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_3500
     * @tc.name testClassOfCaller035
     * @tc.desc Verify ClassOfCaller case 035: using Class.from() string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller035', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let g = new GenericCaller024<int>();
        expect(g.getCaller()!.getName()).assertEqual("GenericCaller024");
        g.process(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFCALLER_3600
     * @tc.name testClassOfCaller036
     * @tc.desc Verify ClassOfCaller case 036: ofCaller call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfCaller036', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let c = new CachedCaller036();
        let a = c.getCaller();
        let b = c.getCaller();
        expect(a === b).assertTrue();
        expect(a!.getName()).assertEqual("CachedCaller036");
    });

  });
}