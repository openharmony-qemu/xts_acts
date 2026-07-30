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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

class MyClass001 {}

class MyClass002 {}

class MyClass003 {
  public name: string = "test"
}

class GenericClass004<T> {
  public value: T | undefined = undefined
}

interface MyInterface005 {
  name: string
}

class ChildClass008 extends ParentClass008 {
  public childField: string = "child"
}

class ParentClass008 {
  public parentField: string = "parent"
}

class FinalClass009 {
  public value: int = 100
}

abstract class AbstractClass010 {
  public abstract method(): void
}

enum TestEnum011 {
  VALUE1,
  VALUE2,
  VALUE3
}

class TestClass014 {}

class TestClass015 {}

class TestClass017 {
  public getMyClassLinker(): RuntimeLinker {
    let cls = Class.current()
    return cls.getLinker()
  }
}

class MyClass018 {}

class MyClass019 {}

class MyClass020 {}

class Class2021 {}

class Class1021 {}

class MyClass022 {}

class MyClass023 {}

class MyClass024 {}

class MyClass025 {}

class UninitializedClass029 {
  public static value: int
}

class EmptyClass030 {}

class PrivateOnlyClass031 {
  private privateField: int = 0
  private privateMethod(): void {}
}

class Child032 extends Parent032 {
  public c: int = 3
}

class Parent032 extends GrandParent032 {
  public b: int = 2
}

class GrandParent032 {
  public a: int = 1
}

class MyClass033 {}

class DynamicClass034 {
  public index: int = 0
}

function getLinkerConcurrently035(): boolean {
  let cls = Class.from<TestClass035>()
  let linker = cls.getLinker()
  return linker !== null
}

class TestClass035 {
  public value: int = 0
}

class MyClass036 {}

class MyClass037 {
  public name: string = "test"
}

class MyClass038 {
  public method1(): string { return "method1" }
  public method2(): string { return "method2" }
}

class MyHandler039 implements reflect.InvocationHandler {
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

interface MyInterface039 {
  name: string
  age: int
}

class Target039 implements MyInterface039 {
  name: string = 'test'
  age: int = 10
  public sayHi(): string {
    return 'hi'
  }
}

interface ProxyTarget039 {
  sayHi(): string
}

class MyClass040 {}

class MyClass041 {}

export default function ClassGetLinkerTest(): void {
  describe('ClassGetLinkerTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_0100
     * @tc.name testClassGetLinker001
     * @tc.desc Verify ClassGetLinker case 001: Class.from<MyClass001>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>()
      let linker = cls.getLinker()
      expect(linker !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_0200
     * @tc.name testClassGetLinker002
     * @tc.desc Verify ClassGetLinker case 002: Class.from<MyClass002>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass002>()
      expect(cls.getLinker() !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_0300
     * @tc.name testClassGetLinker003
     * @tc.desc Verify ClassGetLinker case 003: Class.from<MyClass003>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass003>()
      let linker = cls.getLinker()
      expect(linker !== null).assertTrue()
      expect(typeof linker).assertEqual("object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_0400
     * @tc.name testClassGetLinker004
     * @tc.desc Verify ClassGetLinker case 004: Class.from<GenericClass004<int>>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClass004<int>>()
      let linker = cls.getLinker()
      expect(linker !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_0500
     * @tc.name testClassGetLinker005
     * @tc.desc Verify ClassGetLinker case 005: Class.from<MyInterface005>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyInterface005>()
      let linker = cls.getLinker()
      expect(linker !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_0600
     * @tc.name testClassGetLinker006
     * @tc.desc Verify ClassGetLinker case 006: Class.from<Map<int, string>>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mapCls = Class.from<Map<int, string>>()
      let mapLinker = mapCls.getLinker()
      expect(mapLinker !== null).assertTrue()

      let setCls = Class.from<Set<int>>()
      let setLinker = setCls.getLinker()
      expect(setLinker !== null).assertTrue()

      let arrCls = Class.from<Array<int>>()
      let arrLinker = arrCls.getLinker()
      expect(arrLinker !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_0700
     * @tc.name testClassGetLinker007
     * @tc.desc Verify ClassGetLinker case 007: getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boolLinker = Class.PRIMITIVE_BOOLEAN.getLinker()
      expect(boolLinker !== null).assertTrue()

      let intLinker = Class.PRIMITIVE_INT.getLinker()
      expect(intLinker !== null).assertTrue()

      let doubleLinker = Class.PRIMITIVE_DOUBLE.getLinker()
      expect(doubleLinker !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_0800
     * @tc.name testClassGetLinker008
     * @tc.desc Verify ClassGetLinker case 008: Class.from<ParentClass008>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass008>()
      let parentLinker = parentCls.getLinker()

      let childCls = Class.from<ChildClass008>()
      let childLinker = childCls.getLinker()

      expect(parentLinker !== null).assertTrue()
      expect(childLinker !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_0900
     * @tc.name testClassGetLinker009
     * @tc.desc Verify ClassGetLinker case 009: Class.from<FinalClass009>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalClass009>()
      let linker = cls.getLinker()
      expect(linker !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_1000
     * @tc.name testClassGetLinker010
     * @tc.desc Verify ClassGetLinker case 010: Class.from<AbstractClass010>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass010>()
      let linker = cls.getLinker()
      expect(linker !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_1100
     * @tc.name testClassGetLinker011
     * @tc.desc Verify ClassGetLinker case 011: Class.from<TestEnum011>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestEnum011>()
      let linker = cls.getLinker()
      expect(linker !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_1200
     * @tc.name testClassGetLinker012
     * @tc.desc Verify ClassGetLinker case 012: Class.from<int | string | boolean>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<int | string | boolean>()
      let linker = cls.getLinker()
      expect(linker !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_1300
     * @tc.name testClassGetLinker013
     * @tc.desc Verify ClassGetLinker case 013: Class.of(instance), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<int> = [1, 2, 3]
      let cls = Class.of(arr)
      let linker = cls.getLinker()
      expect(linker !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_1400
     * @tc.name testClassGetLinker014
     * @tc.desc Verify ClassGetLinker case 014: Class.from<TestClass014>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass014>()
      let linker = cls.getLinker()
      expect(linker !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_1500
     * @tc.name testClassGetLinker015
     * @tc.desc Verify ClassGetLinker case 015: Class.of(instance), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass015()
      let cls = Class.of(obj)
      let linker = cls.getLinker()
      expect(linker !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_1600
     * @tc.name testClassGetLinker016
     * @tc.desc Verify ClassGetLinker case 016: getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Any = new Map<int, string>()
      let cls = Class.ofAny(obj)!
      let linker = cls.getLinker()
      expect(linker !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_1700
     * @tc.name testClassGetLinker017
     * @tc.desc Verify ClassGetLinker case 017: behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass017()
      let linker = obj.getMyClassLinker()
      expect(linker !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_1800
     * @tc.name testClassGetLinker018
     * @tc.desc Verify ClassGetLinker case 018: Class.from<MyClass018>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass018>()
      let linker = cls.getLinker()
      expect(linker !== null).assertTrue()
      expect(linker !== undefined).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_1900
     * @tc.name testClassGetLinker019
     * @tc.desc Verify ClassGetLinker case 019: Class.from<MyClass019>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass019>()
      let linker = cls.getLinker()
      expect(typeof linker).assertEqual("object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_2000
     * @tc.name testClassGetLinker020
     * @tc.desc Verify ClassGetLinker case 020: Class.from<MyClass020>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass020>()
      let linker1 = cls.getLinker()
      let linker2 = cls.getLinker()
      expect(linker1 === linker2).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_2100
     * @tc.name testClassGetLinker021
     * @tc.desc Verify ClassGetLinker case 021: Class.from<Class1021>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<Class1021>()
      let cls2 = Class.from<Class2021>()
      let linker1 = cls1.getLinker()
      let linker2 = cls2.getLinker()
      expect(linker1 !== null).assertTrue()
      expect(linker2 !== null).assertTrue()
      expect(typeof linker1).assertEqual("object")
      expect(typeof linker2).assertEqual("object")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_2200
     * @tc.name testClassGetLinker022
     * @tc.desc Verify ClassGetLinker case 022: Class.from<MyClass022>(), getName returns "std.core.Map", getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass022>()
      let linker = cls.getLinker()
      let loadedClass = linker.loadClass('std.core.Map')
      expect(loadedClass !== null).assertTrue()
      expect(loadedClass!.getName()).assertEqual("std.core.Map")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_2300
     * @tc.name testClassGetLinker023
     * @tc.desc Verify ClassGetLinker case 023: Class.from<MyClass023>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass023>()
      let linker = cls.getLinker()

      let mapClass = linker.loadClass('std.core.Map')
      expect(mapClass !== null).assertTrue()

      let setClass = linker.loadClass('std.core.Set')
      expect(setClass !== null).assertTrue()

      let arrayClass = linker.loadClass('std.core.Array')
      expect(arrayClass !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_2400
     * @tc.name testClassGetLinker024
     * @tc.desc Verify ClassGetLinker case 024: Class.from<MyClass024>(), getName returns "std.core.Map", getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass024>()
      let linker = cls.getLinker()
      expect(linker !== null).assertTrue()
      let mapClass = linker.loadClass('std.core.Map')
      expect(mapClass !== null).assertTrue()
      expect(mapClass!.getName()).assertEqual("std.core.Map")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_2500
     * @tc.name testClassGetLinker025
     * @tc.desc Verify ClassGetLinker case 025: invalid call throws Error, Class.from<MyClass025>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass025>()
      let linker = cls.getLinker()
      try {
        linker.loadClass('non.existent.Class')
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('LinkerClassNotFoundError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_2600
     * @tc.name testClassGetLinker026
     * @tc.desc Verify ClassGetLinker case 026: getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = Class.PRIMITIVE_VOID.getLinker()
      expect(linker !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_2700
     * @tc.name testClassGetLinker027
     * @tc.desc Verify ClassGetLinker case 027: Class.from<MyClass001>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>()
      expect(cls.getLinker() !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_2800
     * @tc.name testClassGetLinker028
     * @tc.desc Verify ClassGetLinker case 028: Class.of(instance), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.of(null)
      let linker = cls.getLinker()
      expect(linker !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_2900
     * @tc.name testClassGetLinker029
     * @tc.desc Verify ClassGetLinker case 029: Class.from<UninitializedClass029>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<UninitializedClass029>()
      let linker = cls.getLinker()
      expect(linker !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_3000
     * @tc.name testClassGetLinker030
     * @tc.desc Verify ClassGetLinker case 030: Class.from<EmptyClass030>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass030>()
      let linker = cls.getLinker()
      expect(linker !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_3100
     * @tc.name testClassGetLinker031
     * @tc.desc Verify ClassGetLinker case 031: Class.from<PrivateOnlyClass031>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateOnlyClass031>()
      let linker = cls.getLinker()
      expect(linker !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_3200
     * @tc.name testClassGetLinker032
     * @tc.desc Verify ClassGetLinker case 032: Class.from<Child032>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Child032>()
      let linker = cls.getLinker()
      expect(linker !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_3300
     * @tc.name testClassGetLinker033
     * @tc.desc Verify ClassGetLinker case 033: Class.from<MyClass033>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass033>()

      let linker: RuntimeLinker | null = null;
      for (let i = 0; i < 1000; i++) {
        linker = cls.getLinker();
      }
      expect(linker !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_3400
     * @tc.name testClassGetLinker034
     * @tc.desc Verify ClassGetLinker case 034: Class.from<DynamicClass034>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 100; i++) {
        let cls = Class.from<DynamicClass034>()
        let linker = cls.getLinker()
        expect(linker !== null).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_3500
     * @tc.name testClassGetLinker035
     * @tc.desc Verify ClassGetLinker case 035: behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let k = 0; k < 10; k++) {
        expect(getLinkerConcurrently035()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_3600
     * @tc.name testClassGetLinker036
     * @tc.desc Verify ClassGetLinker case 036: Class.from<MyClass036>(), getLinker() returns non-null linker, getDescriptor() result verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass036>()
      let linker = cls.getLinker()
      let descriptor = cls.getDescriptor()
      expect(linker !== null).assertTrue()
      expect(descriptor !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_3700
     * @tc.name testClassGetLinker037
     * @tc.desc Verify ClassGetLinker case 037: Class.from<MyClass037>(), createInstance succeeds, getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass037>()
      let linker = cls.getLinker()
      let instance = cls.createInstance() as MyClass037
      expect(linker !== null).assertTrue()
      expect(instance.name).assertEqual("test")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_3800
     * @tc.name testClassGetLinker038
     * @tc.desc Verify ClassGetLinker case 038: Class.from<MyClass038>(), getInstanceMethods result verified, getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass038>()
      let linker = cls.getLinker()
      let methods = cls.getInstanceMethods()
      expect(linker !== null).assertTrue()
      expect(methods.length).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_3900
     * @tc.name testClassGetLinker039
     * @tc.desc Verify ClassGetLinker case 039: Class.from<Target039>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let linker = Class.from<Target039>().getLinker()
      let handler = new MyHandler039(new Target039())
      let interfaces = [Class.from<ProxyTarget039>()] as FixedArray<Class>
      let proxyObj = reflect.Proxy.create(linker, interfaces, handler)

      expect(linker !== null).assertTrue()
      expect(proxyObj !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_4000
     * @tc.name testClassGetLinker040
     * @tc.desc Verify ClassGetLinker case 040: Class.from<MyClass040>(), getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass040>()
      let linker = cls.getLinker()
      expect(linker !== null).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETLINKER_4100
     * @tc.name testClassGetLinker041
     * @tc.desc Verify ClassGetLinker case 041: Class.from<MyClass041>(), getName returns "std.core.Map", getLinker() returns non-null linker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassGetLinker041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clazz = Class.from<MyClass041>()
      let linker = clazz.getLinker()
      console.info(linker !== undefined)
      let cls = linker!.loadClass('std.core.Map')
      console.info(cls!.getName())

      expect(linker !== undefined).assertTrue()
      expect(cls !== null).assertTrue()
      expect(cls!.getName()).assertEqual("std.core.Map")
    });

  });
}

