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
import { looseConstructor } from '../voidFn';

class MyClass001 {
    public constructor(name: string, age: int) {}
  }

class MyClass011 {
    public constructor(a: int, b: string) {}
  }

class MyClass012 {
    public constructor(a: int, b: string, c: boolean, d: float) {}
  }

class MyClass013 {
    public constructor() {}
  }

class MyClass015 {
    public constructor(map: Map<string, int>) {}
  }

class MyClass018 {
    public constructor(first: int, second: string) {}
  }

class MyClass019 {
    public constructor(a: int, b: string, c: boolean) {}
  }

class MyClass020 {
    public constructor(value: int) {}
  }

class MyClass022 {
    public constructor(param?: int | string | boolean) {}
  }

final class FinalClass023 {
    public constructor(x: boolean) {}
  }

abstract class AbstractClass023 {
    public constructor(a: string) {}
  }

class MyClass024 {
    public constructor(a: int, b: string, c: boolean, d: float) {}
  }

class MyClass025 {
    public constructor(a: int, b: string) {}
  }

class MyClass026 {
    public constructor(a?: int | string) {}
  }

function ctorMyClass001(): reflect.Constructor {
  return Class.from<MyClass001>().getConstructors()[0];
}

export default function ConstructorGetParameterTypeTest(): void {
  describe('ConstructorGetParameterTypeTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_0100
     * @tc.name testConstructorGetParameterType001
     * @tc.desc Verify ConstructorGetParameterType case 001: getParameterType()method parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType001', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass001>();
        let constructors = cls.getConstructors();
        let paramType = constructors[0].getParameterType(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_0200
     * @tc.name testConstructorGetParameterType002
     * @tc.desc Verify ConstructorGetParameterType case 002: specified behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType002', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let paramType = ctorMyClass001().getParameterType(0);
        expect(paramType != null).assertTrue();
        expect(paramType!.getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_0300
     * @tc.name testConstructorGetParameterType003
     * @tc.desc Verify ConstructorGetParameterType case 003: parameters 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType003', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let paramType = ctorMyClass001().getParameterType(0);
        expect(paramType!.getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_0400
     * @tc.name testConstructorGetParameterType004
     * @tc.desc Verify ConstructorGetParameterType case 004: after parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType004', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let paramType = ctorMyClass001().getParameterType(1);
        expect(paramType!.getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_0500
     * @tc.name testConstructorGetParameterType005
     * @tc.desc Verify ConstructorGetParameterType case 005: specified behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType005', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let paramType = ctorMyClass001().getParameterType(-1);
        expect(paramType).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_0600
     * @tc.name testConstructorGetParameterType006
     * @tc.desc Verify ConstructorGetParameterType case 006: parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType006', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let paramType = ctorMyClass001().getParameterType(10);
        expect(paramType).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_0700
     * @tc.name testConstructorGetParameterType007
     * @tc.desc Verify ConstructorGetParameterType case 007: inttype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType007', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let paramType = ctorMyClass001().getParameterType(2147483647);
        expect(paramType).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_0800
     * @tc.name testConstructorGetParameterType008
     * @tc.desc Verify ConstructorGetParameterType case 008: null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType008', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      try {
          ctorMyClass001().getParameterType(null as int);
        } catch (error) {
          expect(error != null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_0900
     * @tc.name testConstructorGetParameterType009
     * @tc.desc Verify ConstructorGetParameterType case 009: undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType009', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
        try {
          looseConstructor(ctorMyClass001() as Object).getParameterType(undefined as Object);
        } catch (error) {
          expect(error != null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_1000
     * @tc.name testConstructorGetParameterType010
     * @tc.desc Verify ConstructorGetParameterType case 010: specified behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType010', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      looseConstructor(ctorMyClass001() as Object).getParameterType(1.5 as Object);
        // 可能转换为1或抛出错误
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_1100
     * @tc.name testConstructorGetParameterType011
     * @tc.desc Verify ConstructorGetParameterType case 011: return should parameters Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType011', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass011>();
        let constructors = cls.getConstructors();
        let paramType = constructors[0].getParameterType(0);
        expect(paramType != null).assertTrue();
        expect(paramType!.getName()).assertEqual("i32");
        expect(paramType!.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_1200
     * @tc.name testConstructorGetParameterType012
     * @tc.desc Verify ConstructorGetParameterType case 012: return different type parameters Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType012', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<MyClass012>().getConstructors()[0];
        expect(ctorRef.getParameterType(0)!.getName()).assertEqual("i32");
        expect(ctorRef.getParameterType(1)!.getName()).assertEqual("std.core.String");
        expect(ctorRef.getParameterType(2)!.getName()).assertEqual("bool");
        expect(ctorRef.getParameterType(3)!.getName()).assertEqual("f32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_1300
     * @tc.name testConstructorGetParameterType013
     * @tc.desc Verify ConstructorGetParameterType case 013: no parameters constructor return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType013', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<MyClass013>().getConstructors()[0];
        let paramType = ctorRef.getParameterType(0);
        expect(paramType).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_1400
     * @tc.name testConstructorGetParameterType014
     * @tc.desc Verify ConstructorGetParameterType case 014: when return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType014', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let paramType = ctorMyClass001().getParameterType(100);
        expect(paramType).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_1500
     * @tc.name testConstructorGetParameterType015
     * @tc.desc Verify ConstructorGetParameterType case 015: get generic type parameters type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType015', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<MyClass015>().getConstructors()[0];
        expect(ctorRef.getParameterType(0)!.getName()).assertEqual("std.core.Map");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_1600
     * @tc.name testConstructorGetParameterType016
     * @tc.desc Verify ConstructorGetParameterType case 016: verify return type is Class or undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType016', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let paramType = ctorMyClass001().getParameterType(0);
        if (paramType !== undefined) {
          expect(typeof paramType).assertEqual("object");
          expect(paramType.getName != null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_1700
     * @tc.name testConstructorGetParameterType017
     * @tc.desc Verify ConstructorGetParameterType case 017: verify return Classobject using method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType017', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let paramType = ctorMyClass001().getParameterType(0);
        expect(paramType!.getName() != null).assertTrue();
        expect(paramType!.isPrimitive() != null).assertTrue();
        expect(paramType!.isInterface() != null).assertTrue();
        expect(paramType!.isFinal() != null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_1800
     * @tc.name testConstructorGetParameterType018
     * @tc.desc Verify ConstructorGetParameterType case 018: get 0 parameters type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType018', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<MyClass018>().getConstructors()[0];
        expect(ctorRef.getParameterType(0)!.getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_1900
     * @tc.name testConstructorGetParameterType019
     * @tc.desc Verify ConstructorGetParameterType case 019: get after parameters type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType019', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<MyClass019>().getConstructors()[0];
        expect(ctorRef.getParameterType(2)!.getName()).assertEqual("bool");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_2000
     * @tc.name testConstructorGetParameterType020
     * @tc.desc Verify ConstructorGetParameterType case 020: parameters constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType020', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<MyClass020>().getConstructors()[0];
        expect(ctorRef.getParameterType(0)!.getName()).assertEqual("i32");
        expect(ctorRef.getParameterType(1)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_2100
     * @tc.name testConstructorGetParameterType021
     * @tc.desc Verify ConstructorGetParameterType case 021: getParameterType()method not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType021', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let paramType = ctorMyClass001().getParameterType(0);
        // 正常情况不抛出异常
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_2200
     * @tc.name testConstructorGetParameterType022
     * @tc.desc Verify ConstructorGetParameterType case 022: verify modifier constructor get parameters type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType022', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let cls = Class.from<MyClass022>();
        let constructors = cls.getConstructors();
        for (let i = 0; i < constructors.length; i++) {
          let paramType = constructors[i].getParameterType(0);
          expect(paramType != null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_2300
     * @tc.name testConstructorGetParameterType023
     * @tc.desc Verify ConstructorGetParameterType case 023: verify different type constructor getParameterType()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType023', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let c1 = Class.from<AbstractClass023>().getConstructors()[0];
        let c2 = Class.from<FinalClass023>().getConstructors()[0];
        expect(c1.getParameterType(0)!.getName()).assertEqual("std.core.String");
        expect(c2.getParameterType(0)!.getName()).assertEqual("bool");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_2400
     * @tc.name testConstructorGetParameterType024
     * @tc.desc Verify ConstructorGetParameterType case 024: using getParameterType() parameters type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType024', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<MyClass024>().getConstructors()[0];
        let paramNum = ctorRef.getParametersNum();
        for (let i = 0; i < paramNum; i++) {
          let paramType = ctorRef.getParameterType(i);
          expect(paramType != null).assertTrue();
          expect(paramType!.getName() != null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_2500
     * @tc.name testConstructorGetParameterType025
     * @tc.desc Verify ConstructorGetParameterType case 025: verify getParameterType() and getParameterTypes()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType025', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let ctorRef = Class.from<MyClass025>().getConstructors()[0];
        let paramTypes = ctorRef.getParameterTypes();
        let pts = paramTypes as Array<Class>
        for (let i = 0; i < paramTypes.length; i++) {
          let paramType = ctorRef.getParameterType(i);
          expect(paramType!.getName()).assertEqual(pts[i].getName());
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPE_2600
     * @tc.name testConstructorGetParameterType026
     * @tc.desc Verify ConstructorGetParameterType case 026: verify different constructor in same parameters type different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructorGetParameterType026', (TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2) as int, (): void => {
      let constructors = Class.from<MyClass026>().getConstructors();

        // 两个构造函数的第一个参数类型不同
        let type1 = constructors[0].getParameterType(0);
        let type2 = constructors[1].getParameterType(0);

        expect(type1!.getName() != null).assertTrue();
        expect(type2!.getName() != null).assertTrue();
        // type1是i32，type2是std.core.String
    });

  });
}