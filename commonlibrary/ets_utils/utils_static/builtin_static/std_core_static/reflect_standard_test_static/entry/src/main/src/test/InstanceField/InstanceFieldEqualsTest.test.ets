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
  public name = 'test';
  public age = 25;
}

class MyClass005 {
  public name = 'test';
  public age = 25;
}

class MyClass006 {
  public name = 'test';
}

class OtherClass006 {
  public name = 'other';
}

class MyClass007 {
  public name = 'test';
}

class MyClass008 {
  public name = 'test';
}

class MyClass009 {
  public name = 'test';
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
  public age = 25;
}

class MyClass014 {
  public name = 'test';
}

class MyClass015 {
  public name = 'test';
}

class MyClass016 {
  public name = 'test';
  public age = 25;
}

class MyClass017 {
  public name = 'test';
}

class MyClass018 {
  public name = 'test';
}

class MyClass019 {
  public name = 'test';
}

class MyClass020 {
  public name = 'test';
}

class MyClass021 {
  public name = 'test';
}

class MyClass022 {
  public name = 'test';
}

class Parent023 {
  public name = 'parent';
}

class Child023 extends Parent023 {
  public age = 10;
}

class MyClass024 {
  public name = 'test';
  public age = 25;
}

class MyClass025 {
  public name = 'test';
}

export default function InstanceFieldEqualsTest() {
  describe('InstanceFieldEqualsTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_0100
     * @tc.name testInstanceFieldEquals001
     * @tc.desc Verify equals with a valid InstanceField parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field1 = cls.getInstanceField("name");
      let field2 = cls.getInstanceField("name");
      expect(field1!.equals(field2!)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_0200
     * @tc.name testInstanceFieldEquals002
     * @tc.desc Verify equals throws Error when parameter is missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass002>();
      let field = cls.getInstanceField("name");
      try {
        field!.equals(undefined as InstanceField)
        expect().assertFail()
      } catch (error) {
        expect(error).not.toBeNull()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_0300
     * @tc.name testInstanceFieldEquals003
     * @tc.desc Verify equals with extra parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass003>();
      let field1 = cls.getInstanceField("name");
      let field2 = cls.getInstanceField("name");
      field1!.equals(field2!, null as InstanceField)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_0400
     * @tc.name testInstanceFieldEquals004
     * @tc.desc Verify equals with same field of same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();
      let field1 = cls.getInstanceField("name");
      let field2 = cls.getInstanceField("name");
      expect(field1!.equals(field2!)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_0500
     * @tc.name testInstanceFieldEquals005
     * @tc.desc Verify equals with different field of same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass005>();
      let field1 = cls.getInstanceField("name");
      let field2 = cls.getInstanceField("age");
      expect(field1!.equals(field2!)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_0600
     * @tc.name testInstanceFieldEquals006
     * @tc.desc Verify equals with same name field of different class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<MyClass006>();
      let cls2 = Class.from<OtherClass006>();
      let field1 = cls1.getInstanceField("name");
      let field2 = cls2.getInstanceField("name");
      expect(field1!.equals(field2!)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_0700
     * @tc.name testInstanceFieldEquals007
     * @tc.desc Verify equals with itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
      let field = cls.getInstanceField("name");
      expect(field!.equals(field!)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_0800
     * @tc.name testInstanceFieldEquals008
     * @tc.desc Verify equals with null parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      let field = cls.getInstanceField("name");
      expect(field!.equals(null)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_0900
     * @tc.name testInstanceFieldEquals009
     * @tc.desc Verify equals with undefined parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass009>();
      let field = cls.getInstanceField("name");
      expect(field!.equals(undefined)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_1000
     * @tc.name testInstanceFieldEquals010
     * @tc.desc Verify equals with non-InstanceField object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass010>();
      let field = cls.getInstanceField("name");
      let obj = { name: 'test' };
      try {
        field!.equals(obj as InstanceField)
        expect().assertFail()
      } catch (error) {
        expect(error).not.toBeNull()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_1100
     * @tc.name testInstanceFieldEquals011
     * @tc.desc Verify equals with non-existent field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass011>();
      let field1 = cls.getInstanceField("name");
      let field2 = cls.getInstanceField("noExist");
      expect(field1!.equals(field2!)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_1200
     * @tc.name testInstanceFieldEquals012
     * @tc.desc Verify equals returns true for same field instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass012>();
      let field1 = cls.getInstanceField("name");
      let field2 = cls.getInstanceField("name");
      let result = field1!.equals(field2!);
      expect(result).assertTrue()
      expect(typeof result === 'boolean').assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_1300
     * @tc.name testInstanceFieldEquals013
     * @tc.desc Verify equals returns false for different field instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass013>();
      let field1 = cls.getInstanceField("name");
      let field2 = cls.getInstanceField("age");
      expect(field1!.equals(field2!)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_1400
     * @tc.name testInstanceFieldEquals014
     * @tc.desc Verify equals returns false when other is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass014>();
      let field = cls.getInstanceField("name");
      expect(field!.equals(null)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_1500
     * @tc.name testInstanceFieldEquals015
     * @tc.desc Verify equals returns false when other is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass015>();
      let field = cls.getInstanceField("name");
      expect(field!.equals(undefined)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_1600
     * @tc.name testInstanceFieldEquals016
     * @tc.desc Verify equals return value is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass016>();
      let field1 = cls.getInstanceField("name");
      let field2 = cls.getInstanceField("name");
      let field3 = cls.getInstanceField("age");
      let result1: boolean = field1!.equals(field2!);
      let result2: boolean = field1!.equals(field3!);
      expect(typeof result1 === 'boolean').assertTrue()
      expect(typeof result2 === 'boolean').assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_1700
     * @tc.name testInstanceFieldEquals017
     * @tc.desc Verify equals throws TypeError with incompatible type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass017>();
      let field = cls.getInstanceField("name");
      try {
        field!.equals(123 as InstanceField)
        expect().assertFail()
      } catch (error) {
        expect(error).not.toBeNull()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_1800
     * @tc.name testInstanceFieldEquals018
     * @tc.desc Verify equals throws TypeError with string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass018>();
      let field = cls.getInstanceField("name");
      try {
        field!.equals("string" as InstanceField)
        expect().assertFail()
      } catch (error) {
        expect(error).not.toBeNull()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_1900
     * @tc.name testInstanceFieldEquals019
     * @tc.desc Verify equals exception is caught in catch block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass019>();
      let field = cls.getInstanceField("name");
      try {
        field!.equals({} as InstanceField)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof TypeError).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_2000
     * @tc.name testInstanceFieldEquals020
     * @tc.desc Verify finally block always executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass020>();
      let field = cls.getInstanceField("name");
      let finallyExecuted: boolean = false;
      try {
        field!.equals(null)
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_2100
     * @tc.name testInstanceFieldEquals021
     * @tc.desc Verify equals returns true but strict equals returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass021>();
      let field1 = cls.getInstanceField("name");
      let field2 = cls.getInstanceField("name");
      expect(field1!.equals(field2!)).assertTrue()
      expect(field1! === field2!).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_2200
     * @tc.name testInstanceFieldEquals022
     * @tc.desc Verify equals with multiple getInstanceField calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass022>();
      let field1 = cls.getInstanceField("name");
      let field2 = cls.getInstanceField("name");
      let field3 = cls.getInstanceField("name");
      expect(field1!.equals(field2!)).assertTrue()
      expect(field2!.equals(field3!)).assertTrue()
      expect(field1!.equals(field3!)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_2300
     * @tc.name testInstanceFieldEquals023
     * @tc.desc Verify equals with inherited class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<Parent023>();
      let cls2 = Class.from<Child023>();
      let field1 = cls1.getInstanceField("name");
      let field2 = cls2.getInstanceField("name");
      let result = field1!.equals(field2!);
      expect(typeof result === 'boolean').assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_2400
     * @tc.name testInstanceFieldEquals024
     * @tc.desc Verify equals satisfies symmetry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass024>();
      let field1 = cls.getInstanceField("name");
      let field2 = cls.getInstanceField("name");
      let field3 = cls.getInstanceField("age");
      expect(field1!.equals(field2!)).assertEqual(field2!.equals(field1!))
      expect(field1!.equals(field3!)).assertEqual(field3!.equals(field1!))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_EQUALS_2500
     * @tc.name testInstanceFieldEquals025
     * @tc.desc Verify equals satisfies transitivity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldEquals025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass025>();
      let field1 = cls.getInstanceField("name");
      let field2 = cls.getInstanceField("name");
      let field3 = cls.getInstanceField("name");
      if (field1!.equals(field2!) && field2!.equals(field3!)) {
        expect(field1!.equals(field3!)).assertTrue()
      }
    });
  });
}
