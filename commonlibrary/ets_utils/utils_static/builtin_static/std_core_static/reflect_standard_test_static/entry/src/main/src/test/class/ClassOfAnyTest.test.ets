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

class MyClass {}

class MyClass004 {
    public name: string = 'test'
  }

interface MyInterface014 {
    name: string
    age: int
  }

enum TestEnum016 {
    CLASS,
    METHOD
  }

function myFunc017() {}

interface MyInterface021 {
    name: string
  }

class Target021 implements MyInterface021 {
  name: string = 't'
}

class MyHandler021 implements reflect.InvocationHandler {
  target: Object
  public constructor(other: Object) {
    this.target = other
  }
  public get(proxy: reflect.Proxy, method: reflect.InstanceMethod): Any {
    return method.invoke(this.target)
  }
  public set(proxy: reflect.Proxy, method: reflect.InstanceMethod, value: Any): void {
    method.invoke(this.target, [value])
  }
  public invoke(proxy: reflect.Proxy, method: reflect.InstanceMethod, args: FixedArray<Any>): Any {
    return method.invoke(this.target, args)
  }
}

class TestClass022 {
    public value: int = 100
  }

class MyCustomClass023 {
    public data: string = 'data'
  }

class DerivedClass024 extends BaseClass024 {
    public derivedValue: int = 20
  }

class BaseClass024 {
    public baseValue: int = 10
  }

class ClassB031 {}

class ClassA031 {}

class Node034 {
    public next: Node034 | null = null
  }

function getClassFromObject040(obj: Object): Class {
    return Class.of(obj)
  }

function getClassFromAny040(obj: Any): Class | undefined {
    return Class.ofAny(obj)
  }

class GenericClass043<T> {
    public value: T | null = null
    public constructor(value: T) {
      this.value = value
    }
  }

class Parent046 {}

class Child046 extends Parent046 {}

class Child045 extends Parent045 {
    public childValue: int = 20
  }

class Parent045 {
    public parentValue: int = 10
  }

class ImplementClass047 implements MyInterface047 {
    public test(): void {}
  }

interface MyInterface047 {
    test(): void
  }

class MultiImpl048 implements Interface1048, Interface2048 {}

interface Interface2048 {}

interface Interface1048 {}

class LargeClass053 {
    public field1: int = 1
    public field2: int = 2
    public field1000: int = 1000
  }

class Level3054 {
    public value: int = 100
  }

class Level2054 {
    public level3: Level3054 = new Level3054()
  }

class Level1054 {
    public level2: Level2054 = new Level2054()
  }

class PersonAny014 {
    public name: string = 'Alice'
    public age: int = 30
  }

export default function ClassOfAnyTest(): void {
  describe('ClassOfAnyTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_0100
     * @tc.name testClassOfAny001
     * @tc.desc Verify ClassOfAny case 001: parameters obj
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new MyClass()
        let cls = Class.ofAny(obj)
        expect(cls !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_0200
     * @tc.name testClassOfAny002
     * @tc.desc Verify ClassOfAny case 002: ofAny() requires a value argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.ofAny(undefined as Any);
      expect(cls).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_0300
     * @tc.name testClassOfAny003
     * @tc.desc Verify ClassOfAny case 003: parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1: Any = new MyClass()
        let o2: Any = new MyClass004()
        expect(Utils.classNameMatches(Class.ofAny(o1)!.getName(), 'MyClass')).assertTrue();
        expect(Utils.classNameMatches(Class.ofAny(o2)!.getName(), 'MyClass004')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_0400
     * @tc.name testClassOfAny004
     * @tc.desc Verify ClassOfAny case 004: instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new MyClass004()
        let cls = Class.ofAny(obj)
        expect(Utils.classNameMatches(cls!.getName(), 'MyClass004')).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_0500
     * @tc.name testClassOfAny005
     * @tc.desc Verify ClassOfAny case 005: Mapinstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new Map<int, string>()
        let cls = Class.ofAny(obj)
        expect(cls!.getName()).assertEqual('std.core.Map')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_0600
     * @tc.name testClassOfAny006
     * @tc.desc Verify ClassOfAny case 006: Arrayinstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new Array<int>()
        let cls = Class.ofAny(obj)
        expect(cls!.getName()).assertEqual('std.core.Array')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_0700
     * @tc.name testClassOfAny007
     * @tc.desc Verify ClassOfAny case 007: Setinstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new Set<string>()
        let cls = Class.ofAny(obj)
        expect(cls!.getName()).assertEqual('std.core.Set')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_0800
     * @tc.name testClassOfAny008
     * @tc.desc Verify ClassOfAny case 008: stringobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = 'hello'
        let cls = Class.ofAny(obj)
        expect(cls !== undefined && cls !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_0900
     * @tc.name testClassOfAny009
     * @tc.desc Verify ClassOfAny case 009: numberobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = 123
        let cls = Class.ofAny(obj)
        expect(cls !== undefined && cls !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_1000
     * @tc.name testClassOfAny010
     * @tc.desc Verify ClassOfAny case 010: booleanobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = true
        let cls = Class.ofAny(obj)
        expect(cls !== undefined && cls !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_1100
     * @tc.name testClassOfAny011
     * @tc.desc Verify ClassOfAny case 011: null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = null
        let cls = Class.ofAny(obj)
        expect(cls !== undefined && cls !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_1200
     * @tc.name testClassOfAny012
     * @tc.desc Verify ClassOfAny case 012: undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = undefined
        let cls = Class.ofAny(obj)
        expect(cls).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_1300
     * @tc.name testClassOfAny013
     * @tc.desc Verify ClassOfAny case 013: empty object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new Object() as Any
        let cls = Class.ofAny(obj)
        expect(cls !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_1400
     * @tc.name testClassOfAny014
     * @tc.desc Verify ClassOfAny case 014: property object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new PersonAny014() as Any;
        let cls = Class.ofAny(obj);
        expect(cls !== undefined && cls !== null).assertTrue();
        expect(Utils.classNameMatches(cls!.getName(), 'PersonAny014')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_1500
     * @tc.name testClassOfAny015
     * @tc.desc Verify ClassOfAny case 015: FixedArrayinstance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new FixedArray<int>(3)
        let cls = Class.ofAny(obj)
        expect(cls !== null).assertTrue()
        expect(cls!.isFixedArray()).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_1600
     * @tc.name testClassOfAny016
     * @tc.desc Verify ClassOfAny case 016: specified behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = TestEnum016.CLASS
        let cls = Class.ofAny(obj)
        expect(cls !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_1700
     * @tc.name testClassOfAny017
     * @tc.desc Verify ClassOfAny case 017: specified behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = myFunc017
        let cls = Class.ofAny(obj)
        expect(cls !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_1800
     * @tc.name testClassOfAny018
     * @tc.desc Verify ClassOfAny case 018: specified behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrowFunc = () => {}
        let obj: Any = arrowFunc
        let cls = Class.ofAny(obj)
        expect(cls !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_1900
     * @tc.name testClassOfAny019
     * @tc.desc Verify ClassOfAny case 019: async
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let asyncFunc = async (): Promise<void> => {}
        let obj: Any = asyncFunc
        let cls = Class.ofAny(obj)
        expect(cls !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_2000
     * @tc.name testClassOfAny020
     * @tc.desc Verify ClassOfAny case 020: Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsObj: Any = new MyClass()
        let cls = Class.ofAny(clsObj)
        expect(cls !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_2100
     * @tc.name testClassOfAny021
     * @tc.desc Verify ClassOfAny case 021: object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = Class.from<Target021>().getLinker()
        let handler = new MyHandler021(new Target021())
        let interfaces = [Class.from<MyInterface021>()] as FixedArray<Class>
        let proxyObj = reflect.Proxy.create(linker, interfaces, handler)
        let cls = Class.ofAny(proxyObj)
        expect(cls !== null).assertTrue()
        expect(reflect.Proxy.isProxyClass(cls!)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_2200
     * @tc.name testClassOfAny022
     * @tc.desc Verify ClassOfAny case 022: call return Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new TestClass022()
        let cls = Class.ofAny(obj)
        expect(cls !== null).assertTrue()
        expect(Utils.classNameMatches(cls!.getName(), 'TestClass022')).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_2300
     * @tc.name testClassOfAny023
     * @tc.desc Verify ClassOfAny case 023: return Classobject getName()method return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new MyCustomClass023()
        let cls = Class.ofAny(obj)
        expect(Utils.classNameMatches(cls!.getName(), 'MyCustomClass023')).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_2400
     * @tc.name testClassOfAny024
     * @tc.desc Verify ClassOfAny case 024: return Classobject call Classmethod
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new DerivedClass024()
        let cls = Class.ofAny(obj)
        let superCls = cls!.getSuper()
        expect(superCls !== null).assertTrue()
        expect(Utils.classNameMatches(superCls!.getName(), 'BaseClass024')).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_2500
     * @tc.name testClassOfAny025
     * @tc.desc Verify ClassOfAny case 025: object not instance when return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Class.ofAny(undefined as Any)).assertUndefined()

        let obj4: Any = new MyClass()
        let cls4 = Class.ofAny(obj4)
        expect(cls4 !== undefined && cls4 !== null).assertTrue()
        expect(Utils.classNameMatches(cls4!.getName(), 'MyClass')).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_2600
     * @tc.name testClassOfAny026
     * @tc.desc Verify ClassOfAny case 026: return Class or undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new Map<int, string>()
        let result: Class | undefined = Class.ofAny(obj)
        if (result !== undefined) {
          expect(result.getName()).assertEqual('std.core.Map')
        } else {
          expect().assertFail()
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_2700
     * @tc.name testClassOfAny027
     * @tc.desc Verify ClassOfAny case 027: MyClass instance returns Class with valid metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new MyClass()
        let cls = Class.ofAny(obj)
        if (cls !== undefined) {
          expect(typeof cls).assertEqual('object')
          expect(cls.getName().length).assertLarger(0)
        } else {
          expect().assertFail()
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_2800
     * @tc.name testClassOfAny028
     * @tc.desc Verify ClassOfAny case 028: using instanceofverify return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new Array<string>()
        let cls = Class.ofAny(obj)
        if (cls !== undefined) {
          expect(cls.getSuper() !== undefined && cls.getSuper() !== null).assertTrue()
          expect(cls.getName().length).assertLarger(0)
        } else {
          expect().assertFail()
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_2900
     * @tc.name testClassOfAny029
     * @tc.desc Verify ClassOfAny case 029: return Classobject method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new MyClass()
        let cls = Class.ofAny(obj)
        if (cls !== undefined) {
          expect(cls.getName().length).assertLarger(0)
          expect(cls.getSuper() !== undefined && cls.getSuper() !== null).assertTrue()
          expect(cls.isSubtypeOf(cls)).assertTrue()
          expect(cls.getInterfaces() !== undefined && cls.getInterfaces() !== null).assertTrue()
        } else {
          expect().assertFail()
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_3000
     * @tc.name testClassOfAny030
     * @tc.desc Verify ClassOfAny case 030: object call ofAnyreturn same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new MyClass()
        let cls1 = Class.ofAny(obj)
        let cls2 = Class.ofAny(obj)
        expect(cls1 !== null).assertTrue()
        expect(cls2 !== null).assertTrue()
        expect(cls1!.getName()).assertEqual(cls2!.getName())
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_3100
     * @tc.name testClassOfAny031
     * @tc.desc Verify ClassOfAny case 031: different type object return different Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1: Any = new ClassA031()
        let obj2: Any = new ClassB031()
        let cls1 = Class.ofAny(obj1)
        let cls2 = Class.ofAny(obj2)
        expect(cls1!.getName() !== cls2!.getName()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_3200
     * @tc.name testClassOfAny032
     * @tc.desc Verify ClassOfAny case 032: not object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
          let obj: Any = (123 as Object) as Any
          let cls = Class.ofAny(obj)
          expect(cls !== undefined && cls !== null).assertTrue()
        } catch (error) {
          expect(error !== undefined && error !== null).assertTrue()
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_3300
     * @tc.name testClassOfAny033
     * @tc.desc Verify ClassOfAny case 033: not when error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
          let obj: Any = new LargeClass053();
          let cls = Class.ofAny(obj);
          expect(cls !== undefined && cls !== null).assertTrue();
        } catch (error) {
          expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_3400
     * @tc.name testClassOfAny034
     * @tc.desc Verify ClassOfAny case 034: object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let node1 = new Node034()
        let node2 = new Node034()
        node1.next = node2
        node2.next = node1
        let obj: Any = node1
        let cls = Class.ofAny(obj)
        expect(cls !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_3500
     * @tc.name testClassOfAny035
     * @tc.desc Verify ClassOfAny case 035: get object Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new MyClass()
        obj = null as Any
        let cls = Class.ofAny(obj)
        expect(cls !== undefined && cls !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_3600
     * @tc.name testClassOfAny036
     * @tc.desc Verify ClassOfAny case 036: ofAny static method via call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let obj: Any = new MyClass()
        let cls = Class.ofAny(obj)
        expect(cls !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_3700
     * @tc.name testClassOfAny037
     * @tc.desc Verify ClassOfAny case 037: not via instance call static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new MyClass()
        let obj: Any = instance
        expect(Utils.classNameMatches(Class.ofAny(obj)!.getName(), "MyClass")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_3800
     * @tc.name testClassOfAny038
     * @tc.desc Verify ClassOfAny case 038: ofAny Anytype of Object null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let anyObj: Any = new MyClass()
        let cls1 = Class.ofAny(anyObj)
        expect(cls1 !== null).assertTrue()

        let obj: Object = new MyClass()
        let cls2 = Class.of(obj)
        expect(cls2 !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_3900
     * @tc.name testClassOfAny039
     * @tc.desc Verify ClassOfAny case 039: ofAnyreturn Class undefined ofreturn Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let nullObj: Any = null
        let result1 = Class.ofAny(nullObj)
        expect(result1 !== undefined && result1 !== null).assertTrue()

        let result2 = Class.of(null)
        expect(result2 !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_4000
     * @tc.name testClassOfAny040
     * @tc.desc Verify ClassOfAny case 040: different scenario method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {



        let testObj: Any = new MyClass()
        let cls1 = getClassFromAny040(testObj)
        let cls2 = getClassFromObject040(testObj as Object)
        expect(cls1 !== null).assertTrue()
        expect(cls2 !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_4100
     * @tc.name testClassOfAny041
     * @tc.desc Verify ClassOfAny case 041: ofAny in runtime get Class from in compile when get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let obj: Any = new Map<int, string>()
        let cls1 = Class.ofAny(obj)
        expect(cls1!.getName()).assertEqual('std.core.Map')

        let cls2 = Class.from<Map<int, string>>()
        expect(cls2.getName()).assertEqual('std.core.Map')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_4200
     * @tc.name testClassOfAny042
     * @tc.desc Verify ClassOfAny case 042: fromnot object instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<MyClass>()

        let obj: Any = new MyClass()
        let cls2 = Class.ofAny(obj)

        expect(cls.getName()).assertEqual(cls2!.getName())
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_4300
     * @tc.name testClassOfAny043
     * @tc.desc Verify ClassOfAny case 043: get generic instance Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new GenericClass043<int>(100)
        let cls = Class.ofAny(obj)
        expect(cls !== null).assertTrue()
        expect(cls!.getName()).assertContain('GenericClass043')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_4400
     * @tc.name testClassOfAny044
     * @tc.desc Verify ClassOfAny case 044: different generic parameters instance return same Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1: Any = new GenericClass043<int>(100)
        let obj2: Any = new GenericClass043<string>('test')
        let cls1 = Class.ofAny(obj1)
        let cls2 = Class.ofAny(obj2)
        expect(cls1!.getName()).assertEqual(cls2!.getName())
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_4500
     * @tc.name testClassOfAny045
     * @tc.desc Verify ClassOfAny case 045: get instance Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new Child045()
        let cls = Class.ofAny(obj)
        expect(Utils.classNameMatches(cls!.getName(), 'Child045')).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_4600
     * @tc.name testClassOfAny046
     * @tc.desc Verify ClassOfAny case 046: instance when get type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentRef: Parent046 = new Child046()
        let obj: Any = parentRef
        let cls = Class.ofAny(obj)
        expect(Utils.classNameMatches(cls!.getName(), 'Child046')).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_4700
     * @tc.name testClassOfAny047
     * @tc.desc Verify ClassOfAny case 047: get interface Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new ImplementClass047()
        let cls = Class.ofAny(obj)
        expect(Utils.classNameMatches(cls!.getName(), 'ImplementClass047')).assertTrue()
        let interfaces = cls!.getInterfaces()
        expect(interfaces.length).assertLarger(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_4800
     * @tc.name testClassOfAny048
     * @tc.desc Verify ClassOfAny case 048: multiple interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new MultiImpl048()
        let cls = Class.ofAny(obj)
        let interfaces = cls!.getInterfaces()
        expect(interfaces.length).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_4900
     * @tc.name testClassOfAny049
     * @tc.desc Verify ClassOfAny case 049: type in different Class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let unionVar: int | string = 100
        let obj1: Any = unionVar
        let cls1 = Class.ofAny(obj1)

        unionVar = 'test'
        let obj2: Any = unionVar
        let cls2 = Class.ofAny(obj2)

        expect(cls1 !== cls2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_5000
     * @tc.name testClassOfAny050
     * @tc.desc Verify ClassOfAny case 050: is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let anyObj: Any = new MyClass()
        let cls = Class.ofAny(anyObj)
        expect(cls !== undefined && cls !== null).assertTrue()
        expect(Utils.classNameMatches(cls!.getName(), 'MyClass')).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_5100
     * @tc.name testClassOfAny051
     * @tc.desc Verify ClassOfAny case 051: object call ofAny
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let objects: Array<Any> = []
        for (let i = 0; i < 1000; i++) {
          objects.push(new MyClass())
        }

        let startTime = Date.now()
        for (let obj of objects) {
          let cls = Class.ofAny(obj)
          expect(cls !== null).assertTrue()
        }
        let endTime = Date.now()

        console.info(`ofAny perf: ${endTime - startTime}ms`)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_5200
     * @tc.name testClassOfAny052
     * @tc.desc Verify ClassOfAny case 052: call object performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new MyClass()

        let cls1 = Class.ofAny(obj)

        for (let i = 0; i < 100; i++) {
          let cls = Class.ofAny(obj)
          expect(cls!.getName()).assertEqual(cls1!.getName())
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_5300
     * @tc.name testClassOfAny053
     * @tc.desc Verify ClassOfAny case 053: property object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new LargeClass053()
        let cls = Class.ofAny(obj)
        expect(cls !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_5400
     * @tc.name testClassOfAny054
     * @tc.desc Verify ClassOfAny case 054: object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new Level1054()
        let cls = Class.ofAny(obj)
        expect(Utils.classNameMatches(cls!.getName(), 'Level1054')).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_OFANY_5500
     * @tc.name testClassOfAny055
     * @tc.desc Verify ClassOfAny case 055: call ofAny
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassOfAny055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new MyClass()
        for (let i = 0; i < 10; i++) {
          let cls = Class.ofAny(obj)
          expect(cls !== null).assertTrue()
        }
    });

  });
}
