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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

class MyClass001 {
  public constructor(name: string, age: int) {
  }
}

class MyClass003 {
  public constructor(name: string, age: int) {
  }
}

class MyClass004 {
  public constructor() {
  }
}

class MyClass005 {
  public constructor(value: int) {
  }
}

class MyClass006 {
  public constructor(a: int, b: string, c: boolean, d: float) {
  }
}

class MyClass007 {
  public constructor(required: int, optional?: string) {
  }
}

class MyClass008 {
  public constructor(map: Map<string, int>, arr: Array<boolean>) {
  }
}

class MyClass009 {
  public constructor(obj: MyClass009) {
  }
}

class MyClass013 {
  public constructor(
    b: byte, s: short, i: int, l: long,
    f: float, d: double, n: number, bool: boolean, ch: char
  ) {
  }
}

class MyClass014 {
  public constructor(
    p1: int, p2: int, p3: int, p4: int, p5: int,
    p6: int, p7: int, p8: int, p9: int, p10: int
  ) {
  }
}

class MyClass015 {
  public constructor(value?: int | string, flag?: boolean) {
  }
}

class MyClass017 {
  public constructor(p?: int | string | boolean) {
  }
}

final

class FinalClass018 {
  public constructor(x: boolean, y: float, z: double) {
  }
}

abstract class AbstractClass018 {
  public constructor(a: string, b: int) {
  }
}

class ChildClass019 extends ParentClass019 {
  public constructor(name: string, age: int) {
    super(name);
  }
}

class ParentClass019 {
  public constructor(name: string) {
  }
}

class MyClass020 {
  public constructor(a?: int, b?: string, c?: boolean) {
  }
}

class MyClass021 {
  public constructor(a: int, b: string, c: boolean) {
  }
}

export default function ConstructorGetParameterTypesTest(): void {
  describe('ConstructorGetParameterTypesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_0100
     * @tc.name testConstructorGetParameterTypes001
     * @tc.desc Verify ConstructorGetParameterTypes case 001: Class.from<MyClass001>(), parameter type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParameterTypes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let constructors = cls.getConstructors();
      let paramTypes = constructors[0].getParameterTypes();
      expect(paramTypes.length).assertEqual(2);
    });

    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_0200
     * @tc.name testConstructorGetParameterTypes002
     * @tc.desc Verify ConstructorGetParameterTypes case 002: Class.from<MyClass003>(), getName returns "std.core.String", parameter type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParameterTypes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass003>();
      let constructors = cls.getConstructors();
      let paramTypes = constructors[0].getParameterTypes();
      expect(paramTypes.length).assertEqual(2);
      expect(paramTypes[0].getName()).assertEqual("std.core.String");
      expect(paramTypes[1].getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_0300
     * @tc.name testConstructorGetParameterTypes003
     * @tc.desc Verify ConstructorGetParameterTypes case 003: Class.from<MyClass004>(), parameter type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParameterTypes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();
      let constructors = cls.getConstructors();
      let paramTypes = constructors[0].getParameterTypes();
      expect(paramTypes.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_0400
     * @tc.name testConstructorGetParameterTypes004
     * @tc.desc Verify ConstructorGetParameterTypes case 004: Class.from<MyClass005>(), getName returns "i32", parameter type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParameterTypes004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass005>();
      let constructors = cls.getConstructors();
      let paramTypes = constructors[0].getParameterTypes();
      expect(paramTypes.length).assertEqual(1);
      expect(paramTypes[0].getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_0500
     * @tc.name testConstructorGetParameterTypes005
     * @tc.desc Verify ConstructorGetParameterTypes case 005: Class.from<MyClass006>(), getName returns "i32", parameter type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParameterTypes005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass006>();
      let constructors = cls.getConstructors();
      let paramTypes = constructors[0].getParameterTypes();
      expect(paramTypes.length).assertEqual(4);
      expect(paramTypes[0].getName()).assertEqual("i32");
      expect(paramTypes[1].getName()).assertEqual("std.core.String");
      expect(paramTypes[2].getName()).assertEqual(Class.PRIMITIVE_BOOLEAN.getName());
      expect(paramTypes[3].getName()).assertEqual("f32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_0600
     * @tc.name testConstructorGetParameterTypes006
     * @tc.desc Verify ConstructorGetParameterTypes case 006: Class.from<MyClass007>(), getName returns "i32", parameter type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParameterTypes006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
      let constructors = cls.getConstructors();
      let paramTypes = constructors[0].getParameterTypes();
      expect(paramTypes.length).assertEqual(2);
      expect(paramTypes[0].getName()).assertEqual("i32");
      expect(paramTypes[1].getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_0700
     * @tc.name testConstructorGetParameterTypes007
     * @tc.desc Verify ConstructorGetParameterTypes case 007: Class.from<MyClass008>(), getName returns "std.core.Map", parameter type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParameterTypes007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      let constructors = cls.getConstructors();
      let paramTypes = constructors[0].getParameterTypes();
      expect(paramTypes.length).assertEqual(2);
      expect(paramTypes[0].getName()).assertEqual("std.core.Map");
      expect(paramTypes[1].getName()).assertEqual("std.core.Array");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_0800
     * @tc.name testConstructorGetParameterTypes008
     * @tc.desc Verify ConstructorGetParameterTypes case 008: Class.from<MyClass009>(), parameter type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParameterTypes008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass009>();
      let constructors = cls.getConstructors();
      let paramTypes = constructors[0].getParameterTypes();
      expect(paramTypes[0].getName()).assertEqual("entry.src.main.src.test.constructor.ConstructorGetParameterTypesTest.test.MyClass009");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_0900
     * @tc.name testConstructorGetParameterTypes009
     * @tc.desc Verify ConstructorGetParameterTypes case 009: Class.from<MyClass001>(), getName returns "std.core.String", parameter type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParameterTypes009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let constructors = cls.getConstructors();
      let paramTypes = constructors[0].getParameterTypes();
      expect(paramTypes.length).assertEqual(2);
      expect(paramTypes[0].getName()).assertEqual("std.core.String");
      expect(paramTypes[1].getName()).assertEqual(Utils.scalarParameterI32Fqn());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_1000
     * @tc.name testConstructorGetParameterTypes010
     * @tc.desc Verify ConstructorGetParameterTypes case 010: Class.from<MyClass001>(), getName returns "std.core.String", parameter type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParameterTypes010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MyClass001>().getConstructors()[0];
      let paramTypes = ctor.getParameterTypes();
      expect(paramTypes[0].getName()).assertEqual("std.core.String");
      expect(paramTypes[1].getName()).assertEqual("i32");
      for (let i = 0; i < paramTypes.length; i++) {
        expect(typeof paramTypes[i].isPrimitive()).assertEqual("boolean");
        expect(typeof paramTypes[i].isInterface()).assertEqual("boolean");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_1100
     * @tc.name testConstructorGetParameterTypes011
     * @tc.desc Verify ConstructorGetParameterTypes case 011: Class.from<MyClass001>(), parameter type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParameterTypes011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MyClass001>().getConstructors()[0];
      let paramTypes = ctor.getParameterTypes();
      expect(paramTypes.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_1200
     * @tc.name testConstructorGetParameterTypes012
     * @tc.desc Verify ConstructorGetParameterTypes case 012: Class.from<MyClass013>(), getName returns "i8", parameter type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParameterTypes012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass013>();
      let constructors = cls.getConstructors();
      let paramTypes = constructors[0].getParameterTypes();
      expect(paramTypes.length).assertEqual(9);
      expect(paramTypes[0].getName()).assertEqual("i8");
      expect(paramTypes[1].getName()).assertEqual("i16");
      expect(paramTypes[2].getName()).assertEqual("i32");
      expect(paramTypes[3].getName()).assertEqual("i64");
      expect(paramTypes[4].getName()).assertEqual("f32");
      expect(paramTypes[5].getName()).assertEqual("f64");
      expect(paramTypes[6].getName()).assertEqual(Class.PRIMITIVE_NUMBER.getName());
      expect(paramTypes[7].getName()).assertEqual(Class.PRIMITIVE_BOOLEAN.getName());
      expect(paramTypes[8].getName()).assertEqual(Class.PRIMITIVE_CHAR.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_1300
     * @tc.name testConstructorGetParameterTypes013
     * @tc.desc Verify ConstructorGetParameterTypes case 013: Class.from<MyClass014>(), getName returns "i32", parameter type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParameterTypes013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass014>();
      let constructors = cls.getConstructors();
      let paramTypes = constructors[0].getParameterTypes();
      expect(paramTypes.length).assertEqual(10);
      for (let i = 0; i < 10; i++) {
        expect(paramTypes[i].getName()).assertEqual("i32");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_1400
     * @tc.name testConstructorGetParameterTypes014
     * @tc.desc Verify ConstructorGetParameterTypes case 014: Class.from<MyClass015>(), parameter type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParameterTypes014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let constructors = Class.from<MyClass015>().getConstructors();
      expect(constructors.length).assertEqual(1);
      expect(constructors[0].getParameterTypes().length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_1500
     * @tc.name testConstructorGetParameterTypes015
     * @tc.desc Verify ConstructorGetParameterTypes case 015: Class.from<MyClass004>(), parameter type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParameterTypes015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctor = Class.from<MyClass004>().getConstructors()[0];
      let paramTypes = ctor.getParameterTypes();
      expect(paramTypes.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_1600
     * @tc.name testConstructorGetParameterTypes016
     * @tc.desc Verify ConstructorGetParameterTypes case 016: Class.from<MyClass017>(), parameter type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParameterTypes016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass017>();
      let constructors = cls.getConstructors();
      expect(constructors.length).assertEqual(1);
      expect(constructors[0].getParameterTypes().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_1700
     * @tc.name testConstructorGetParameterTypes017
     * @tc.desc Verify ConstructorGetParameterTypes case 017: Class.from<AbstractClass018>(), getName returns "std.core.String", parameter type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParameterTypes017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1 = Class.from<AbstractClass018>().getConstructors()[0];
      let c2 = Class.from<FinalClass018>().getConstructors()[0];
      let p1 = c1.getParameterTypes();
      let p2 = c2.getParameterTypes();
      expect(p1.length).assertEqual(2);
      expect(p2.length).assertEqual(3);
      expect(p1[0].getName()).assertEqual("std.core.String");
      expect(p1[1].getName()).assertEqual("i32");
      expect(p2[0].getName()).assertEqual(Class.PRIMITIVE_BOOLEAN.getName());
      expect(p2[1].getName()).assertEqual("f32");
      expect(p2[2].getName()).assertEqual("f64");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_1800
     * @tc.name testConstructorGetParameterTypes018
     * @tc.desc Verify ConstructorGetParameterTypes case 018: Class.from<ParentClass019>(), getName returns "std.core.String", parameter type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParameterTypes018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCtor = Class.from<ParentClass019>().getConstructors()[0];
      let childCtor = Class.from<ChildClass019>().getConstructors()[0];
      let parentParams = parentCtor.getParameterTypes();
      let childParams = childCtor.getParameterTypes();
      expect(parentParams.length).assertEqual(1);
      expect(childParams.length).assertEqual(2);
      expect(parentParams[0].getName()).assertEqual("std.core.String");
      expect(childParams[0].getName()).assertEqual("std.core.String");
      expect(childParams[1].getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_1900
     * @tc.name testConstructorGetParameterTypes019
     * @tc.desc Verify ConstructorGetParameterTypes case 019: Class.from<MyClass020>(), parameter type verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParameterTypes019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let constructors = Class.from<MyClass020>().getConstructors();
      expect(constructors.length).assertEqual(1);
      expect(constructors[0].getParameterTypes().length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_GETPARAMETERTYPES_2000
     * @tc.name testConstructorGetParameterTypes020
     * @tc.desc Verify ConstructorGetParameterTypes case 020: Class.from<MyClass021>(), parameter type verified, parameter count verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testConstructorGetParameterTypes020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ctorRef = Class.from<MyClass021>().getConstructors()[0];
      let paramTypes = ctorRef.getParameterTypes();
      let paramNum = ctorRef.getParametersNum();
      expect(paramTypes.length).assertEqual(paramNum);
      expect(paramNum).assertEqual(3);
    });

  });
}

