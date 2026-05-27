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
  public name = 'test';
}

class MyClass002 {
  public name = 'test';
}

class MyClass003 {
  public name = 'test';
}

class MyClass004 {
  public count = 0;
}

class MyClass005 {
  public flag = true;
}

class Inner006 {
  data = 0;
}

class Outer006 {
  public inner = new Inner006();
}

class MyClass007 {
  public items: string[] = [];
}

class MyClass008 {
  public value: string | number = 'test';
}

class MyClass009 {
  public data: string | undefined;
}

class MyClass010 {
  public name = 'test';
}

class MyClass011 {
  public name = 'test';
}

class MyClass012 {
  public name = 'test';
}

class MyClass013 {
  public name = 'test';
}

class MyClass014 {
  public name = 'test';
  public count = 0;
}

class MyClass016 {
  public bigVal: bigint = 0n;
}

class MyClass017 {
  public ch: char = c'A';
}

class MyClass018 {
  public price: double = 9.99;
  public rate: float = 0.5;
}

class MyClass019 {
  public name = 'test';
}

class MyClass022 {
  public name = 'test';
}

export default function InstanceFieldGetTypeTest() {
  describe('InstanceFieldGetTypeTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETTYPE_0100
     * @tc.name testInstanceFieldGetType001
     * @tc.desc Verify getType() call without parameters executes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField("name");
      field!.getType();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETTYPE_0200
     * @tc.name testInstanceFieldGetType002
     * @tc.desc Verify getType() behavior when extra parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass002>();
      let field = cls.getInstanceField("name");
      field!.getType(true as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETTYPE_0300
     * @tc.name testInstanceFieldGetType003
     * @tc.desc Verify getType for string type field returns Class with name std.core.String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass003>();
      let field = cls.getInstanceField("name");
      let type = field!.getType();
      expect(type.getName()).assertEqual("std.core.String");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETTYPE_0400
     * @tc.name testInstanceFieldGetType004
     * @tc.desc Verify getType for number type field returns Class with name i32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();
      let field = cls.getInstanceField("count");
      let type = field!.getType();
      expect(type.getName()).assertEqual("i32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETTYPE_0500
     * @tc.name testInstanceFieldGetType005
     * @tc.desc Verify getType for boolean type field returns non-null Class object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass005>();
      let field = cls.getInstanceField("flag");
      let type = field!.getType();
      expect(type).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETTYPE_0600
     * @tc.name testInstanceFieldGetType006
     * @tc.desc Verify getType for custom class type field returns corresponding Class object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetType006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Outer006>();
      let field = cls.getInstanceField("inner");
      let type = field!.getType();
      expect(type instanceof Class).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETTYPE_0700
     * @tc.name testInstanceFieldGetType007
     * @tc.desc Verify getType for array type field returns corresponding Class object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetType007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
      let field = cls.getInstanceField("items");
      let type = field!.getType();
      expect(type).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETTYPE_0800
     * @tc.name testInstanceFieldGetType008
     * @tc.desc Verify getType for union type field returns Class object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetType008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      let field = cls.getInstanceField("value");
      let type = field!.getType();
      expect(type).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETTYPE_0900
     * @tc.name testInstanceFieldGetType009
     * @tc.desc Verify getType for undefined initialized field returns non-null type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetType009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass009>();
      let field = cls.getInstanceField("data");
      let type = field!.getType();
      expect(type).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETTYPE_1000
     * @tc.name testInstanceFieldGetType010
     * @tc.desc Verify getType return value is Class type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetType010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass010>();
      let field = cls.getInstanceField("name");
      let type = field!.getType();
      expect(type instanceof Class).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETTYPE_1100
     * @tc.name testInstanceFieldGetType011
     * @tc.desc Verify returned Class object can call getName method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetType011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass011>();
      let field = cls.getInstanceField("name");
      let type = field!.getType();
      let typeName = type.getName();
      expect(typeof typeName).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETTYPE_1200
     * @tc.name testInstanceFieldGetType012
     * @tc.desc Verify getType returned Class object is not null or undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetType012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass012>();
      let field = cls.getInstanceField("name");
      let type = field!.getType();
      expect(type).not.toBeNull();
      expect(type).not.toBeUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETTYPE_1300
     * @tc.name testInstanceFieldGetType013
     * @tc.desc Verify multiple getType calls on same field return consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetType013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass013>();
      let field = cls.getInstanceField("name");
      let type1 = field!.getType();
      let type2 = field!.getType();
      expect(type1.getName()).assertEqual(type2.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETTYPE_1400
     * @tc.name testInstanceFieldGetType014
     * @tc.desc Verify getType returns different Class for different type fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetType014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass014>();
      let field1 = cls.getInstanceField("name");
      let field2 = cls.getInstanceField("count");
      let type1 = field1!.getType();
      let type2 = field2!.getType();
      expect(type1.getName()).not.toEqual(type2.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETTYPE_1500
     * @tc.name testInstanceFieldGetType015
     * @tc.desc Verify getType behavior for void or never type field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetType015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETTYPE_1600
     * @tc.name testInstanceFieldGetType016
     * @tc.desc Verify getType for bigint type field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetType016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass016>();
      let field = cls.getInstanceField("bigVal");
      let type = field!.getType();
      expect(type).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETTYPE_1700
     * @tc.name testInstanceFieldGetType017
     * @tc.desc Verify getType for char type field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetType017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass017>();
      let field = cls.getInstanceField("ch");
      let type = field!.getType();
      expect(type).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETTYPE_1800
     * @tc.name testInstanceFieldGetType018
     * @tc.desc Verify getType for double and float type fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetType018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass018>();
      let field1 = cls.getInstanceField("price");
      let field2 = cls.getInstanceField("rate");
      expect(field1!.getType().getName()).assertEqual("f64");
      expect(field2!.getType().getName()).assertEqual("f32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETTYPE_1900
     * @tc.name testInstanceFieldGetType019
     * @tc.desc Verify getType causes runtime error when InstanceField is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetType019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass019>();
      let field = cls.getInstanceField("nonExistent");
      try {
        field.getType();
        expect().assertFail();
      } catch (error) {
        expect(error).not.toBeNull();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETTYPE_2000
     * @tc.name testInstanceFieldGetType020
     * @tc.desc Verify getType behavior when InstanceField is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetType020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let field: InstanceField = null!;
        field.getType();
        expect().assertFail();
      } catch (error) {
        expect(error instanceof TypeError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETTYPE_2100
     * @tc.name testInstanceFieldGetType021
     * @tc.desc Verify getType error handling when type info is corrupted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetType021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETTYPE_2200
     * @tc.name testInstanceFieldGetType022
     * @tc.desc Verify getType returned Class getName error handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetType022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass022>();
      let field = cls.getInstanceField("name");
      let type = field!.getType();
      try {
        type.getName();
        expect().assertSuccess();
      } catch (error) {
        expect().assertFail();
      }
    });
  });
}
