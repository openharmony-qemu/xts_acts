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
}

class MyClass005 {
  public name = 'test';
}

class MyClass006 {
  public age = 25;
}

class MyClass007 {
  public active = true;
}

class MyClass008 {
  public config = { key: 'value' };
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
}

class MyClass014 {
  public name = 'test';
}

class OtherClass014 {
  public other = 'other';
}

class MyClass015 {
  public name = 'test';
}

class MyClass016 {
  public name = 'test';
}

class MyClass017 {
  public name = 'test';
}

class MyClass018 {
  public age = 25;
}

class MyClass019 {
  public active = true;
}

class MyClass020 {
  public config = { key: 'value' };
}

class MyClass021 {
  public name: string;
}

class MyClass022 {
  public name = '';
}

class MyClass023 {
  public name: string | null = null;
}

class MyClass024 {
  public name: string | undefined = undefined;
}

class MyClass025 {
  public count = 0;
}

class MyClass026 {
  public active = false;
}

class MyClass027 {
  public name = 'test';
  public age = 25;
}

class MyClass028 {
  public name = 'test';
}

class MyClass029 {
  public name = 'test';
}

class MyClass030 {
  public name = 'test';
}

class MyClass031 {
  public name = 'test';
}

class OtherClass031 {
  public other = 'other';
}

class MyClass032 {
  public name = 'test';
}

class MyClass033 {
  public name = 'test';
}

class MyClass034 {
  public name = 'test';
}

class MyClass035 {
  public name = 'test';
}

class MyClass036 {
  public name = 'test';
}

class Parent037 {
  public name = 'parent';
}

class Child037 extends Parent037 {
  public age = 10;
}

class Parent038 {
  public name = 'parent';
}

class Child038 extends Parent038 {
  public age = 10;
}

class MyClass039 {
  public name = 'test';
}

class MyClass040 {
  public name = 'test';
}

class MyClass041 {
  'data-value' = 'special';
}

export default function InstanceFieldGetValueTest() {
  describe('InstanceFieldGetValueTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_0100
     * @tc.name testInstanceFieldGetValue001
     * @tc.desc Verify getValue with a valid target object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass001();
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField("name");
      let value = field!.getValue(obj);
      expect(value).assertEqual("test")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_0200
     * @tc.name testInstanceFieldGetValue002
     * @tc.desc Verify getValue throws Error when parameter is missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass002>();
      let field = cls.getInstanceField("name");
      try {
        field!.getValue(undefined as Object)
        expect().assertFail()
      } catch (error) {
        expect(error).not.toBeNull()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_0300
     * @tc.name testInstanceFieldGetValue003
     * @tc.desc Verify getValue with extra parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass003();
      let cls = Class.from<MyClass003>();
      let field = cls.getInstanceField("name");
      field!.getValue(obj, null as Object) as string
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_0400
     * @tc.name testInstanceFieldGetValue004
     * @tc.desc Verify getValue with correct type instance object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass004();
      let cls = Class.from<MyClass004>();
      let field = cls.getInstanceField("name");
      let value = field!.getValue(obj) as string;
      expect(value).assertEqual("test")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_0500
     * @tc.name testInstanceFieldGetValue005
     * @tc.desc Verify getValue reads string type property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass005();
      let cls = Class.from<MyClass005>();
      let field = cls.getInstanceField("name");
      let value = field!.getValue(obj) as string;
      expect(value).assertEqual("test")
      expect(typeof value === 'string').assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_0600
     * @tc.name testInstanceFieldGetValue006
     * @tc.desc Verify getValue reads number type property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass006();
      let cls = Class.from<MyClass006>();
      let field = cls.getInstanceField("age");
      let value = field!.getValue(obj) as number;
      expect(value).assertEqual(25)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_0700
     * @tc.name testInstanceFieldGetValue007
     * @tc.desc Verify getValue reads boolean type property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass007();
      let cls = Class.from<MyClass007>();
      let field = cls.getInstanceField("active");
      let value = field!.getValue(obj) as boolean;
      expect(value).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_0800
     * @tc.name testInstanceFieldGetValue008
     * @tc.desc Verify getValue reads object type property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass008();
      let cls = Class.from<MyClass008>();
      let field = cls.getInstanceField("config");
      let value = field!.getValue(obj) as Object;
      expect(value).not.toBeNull()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_0900
     * @tc.name testInstanceFieldGetValue009
     * @tc.desc Verify getValue throws TypeError when thisObj is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass009>();
      let field = cls.getInstanceField("name");
      try {
        field!.getValue(null as Object)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof TypeError).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_1000
     * @tc.name testInstanceFieldGetValue010
     * @tc.desc Verify getValue throws TypeError when thisObj is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass010>();
      let field = cls.getInstanceField("name");
      try {
        field!.getValue(undefined as Object)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof TypeError).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_1100
     * @tc.name testInstanceFieldGetValue011
     * @tc.desc Verify getValue throws TypeError when thisObj is number primitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass011>();
      let field = cls.getInstanceField("name");
      try {
        field!.getValue(123 as Object)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof TypeError).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_1200
     * @tc.name testInstanceFieldGetValue012
     * @tc.desc Verify getValue throws TypeError when thisObj is string primitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass012>();
      let field = cls.getInstanceField("name");
      try {
        field!.getValue("string" as Object)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof TypeError).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_1300
     * @tc.name testInstanceFieldGetValue013
     * @tc.desc Verify getValue throws TypeError when thisObj is boolean primitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass013>();
      let field = cls.getInstanceField("name");
      try {
        field!.getValue(true as Object)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof TypeError).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_1400
     * @tc.name testInstanceFieldGetValue014
     * @tc.desc Verify getValue throws TypeError when thisObj is incompatible object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new OtherClass014();
      let cls = Class.from<MyClass014>();
      let field = cls.getInstanceField("name");
      try {
        field!.getValue(obj as Object)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof TypeError).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_1500
     * @tc.name testInstanceFieldGetValue015
     * @tc.desc Verify getValue error when thisObj is empty object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass015>();
      let field = cls.getInstanceField("name");
      try {
        field!.getValue({} as Object)
        expect().assertFail()
      } catch (error) {
        expect(error).not.toBeNull()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_1600
     * @tc.name testInstanceFieldGetValue016
     * @tc.desc Verify getValue throws TypeError when thisObj is array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass016>();
      let field = cls.getInstanceField("name");
      try {
        field!.getValue([1, 2, 3] as Object)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof TypeError).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_1700
     * @tc.name testInstanceFieldGetValue017
     * @tc.desc Verify getValue returns correct string type value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass017();
      let cls = Class.from<MyClass017>();
      let field = cls.getInstanceField("name");
      let value = field!.getValue(obj) as string;
      expect(value).assertEqual("test")
      expect(typeof value === 'string').assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_1800
     * @tc.name testInstanceFieldGetValue018
     * @tc.desc Verify getValue returns correct number type value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass018();
      let cls = Class.from<MyClass018>();
      let field = cls.getInstanceField("age");
      let value = field!.getValue(obj) as number;
      expect(value).assertEqual(25)
      expect(typeof value === 'number').assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_1900
     * @tc.name testInstanceFieldGetValue019
     * @tc.desc Verify getValue returns correct boolean type value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass019();
      let cls = Class.from<MyClass019>();
      let field = cls.getInstanceField("active");
      let value = field!.getValue(obj) as boolean;
      expect(value).assertTrue()
      expect(typeof value === 'boolean').assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_2000
     * @tc.name testInstanceFieldGetValue020
     * @tc.desc Verify getValue returns correct object type value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass020();
      let cls = Class.from<MyClass020>();
      let field = cls.getInstanceField("config");
      let value = field!.getValue(obj) as Object;
      expect(value).not.toBeNull()
      expect(typeof value === 'object').assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_2100
     * @tc.name testInstanceFieldGetValue021
     * @tc.desc Verify getValue returns undefined for uninitialized property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass021();
      let cls = Class.from<MyClass021>();
      let field = cls.getInstanceField("name");
      let value = field!.getValue(obj);
      expect(value).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_2200
     * @tc.name testInstanceFieldGetValue022
     * @tc.desc Verify getValue returns empty string for empty string property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass022();
      let cls = Class.from<MyClass022>();
      let field = cls.getInstanceField("name");
      let value = field!.getValue(obj) as string;
      expect(value).assertEqual("")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_2300
     * @tc.name testInstanceFieldGetValue023
     * @tc.desc Verify getValue returns null for null property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass023();
      let cls = Class.from<MyClass023>();
      let field = cls.getInstanceField("name");
      let value = field!.getValue(obj);
      expect(value).assertNull()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_2400
     * @tc.name testInstanceFieldGetValue024
     * @tc.desc Verify getValue returns undefined for undefined property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass024();
      let cls = Class.from<MyClass024>();
      let field = cls.getInstanceField("name");
      let value = field!.getValue(obj);
      expect(value).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_2500
     * @tc.name testInstanceFieldGetValue025
     * @tc.desc Verify getValue returns 0 for zero value property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass025();
      let cls = Class.from<MyClass025>();
      let field = cls.getInstanceField("count");
      let value = field!.getValue(obj) as number;
      expect(value).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_2600
     * @tc.name testInstanceFieldGetValue026
     * @tc.desc Verify getValue returns false for false property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass026();
      let cls = Class.from<MyClass026>();
      let field = cls.getInstanceField("active");
      let value = field!.getValue(obj) as boolean;
      expect(value).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_2700
     * @tc.name testInstanceFieldGetValue027
     * @tc.desc Verify getValue returns Any type assignable to various types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass027();
      let cls = Class.from<MyClass027>();
      let field1 = cls.getInstanceField("name");
      let field2 = cls.getInstanceField("age");
      let value1: string = field1!.getValue(obj) as string;
      let value2: number = field2!.getValue(obj) as number;
      expect(value1).assertEqual("test")
      expect(value2).assertEqual(25)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_2800
     * @tc.name testInstanceFieldGetValue028
     * @tc.desc Verify getValue throws TypeError when thisObj is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass028>();
      let field = cls.getInstanceField("name");
      try {
        field!.getValue(null as Object)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof TypeError).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_2900
     * @tc.name testInstanceFieldGetValue029
     * @tc.desc Verify getValue throws TypeError when thisObj is undefined with error name check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass029>();
      let field = cls.getInstanceField("name");
      try {
        field!.getValue(undefined as Object)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof TypeError).assertTrue()
        expect(error.name).assertEqual("TypeError")
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_3000
     * @tc.name testInstanceFieldGetValue030
     * @tc.desc Verify getValue throws TypeError when thisObj is number primitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass030>();
      let field = cls.getInstanceField("name");
      try {
        field!.getValue(123 as Object)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof TypeError).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_3100
     * @tc.name testInstanceFieldGetValue031
     * @tc.desc Verify getValue throws TypeError when thisObj is incompatible class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new OtherClass031();
      let cls = Class.from<MyClass031>();
      let field = cls.getInstanceField("name");
      try {
        field!.getValue(obj as Object)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof TypeError).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_3200
     * @tc.name testInstanceFieldGetValue032
     * @tc.desc Verify getValue throws TypeError when thisObj is array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass032>();
      let field = cls.getInstanceField("name");
      try {
        field!.getValue([1, 2, 3] as Object)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof TypeError).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_3300
     * @tc.name testInstanceFieldGetValue033
     * @tc.desc Verify TypeError is caught correctly in catch block with message check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass033>();
      let field = cls.getInstanceField("name");
      try {
        field!.getValue(null as Object)
        expect().assertFail()
      } catch (error) {
        expect(error instanceof TypeError).assertTrue()
        expect(error.message).not.toBeNull()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_3400
     * @tc.name testInstanceFieldGetValue034
     * @tc.desc Verify finally block executes regardless of exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass034>();
      let field = cls.getInstanceField("name");
      let finallyExecuted: boolean = false;
      let caught: boolean = false;
      try {
        field!.getValue(null as Object)
      } catch (error) {
        caught = true;
      } finally {
        finallyExecuted = true;
      }
      expect(caught).assertTrue()
      expect(finallyExecuted).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_3500
     * @tc.name testInstanceFieldGetValue035
     * @tc.desc Verify finally block executes when no exception occurs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass035();
      let cls = Class.from<MyClass035>();
      let field = cls.getInstanceField("name");
      let finallyExecuted: boolean = false;
      try {
        field!.getValue(obj)
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_3600
     * @tc.name testInstanceFieldGetValue036
     * @tc.desc Verify getValue returns new value after property modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass036();
      let cls = Class.from<MyClass036>();
      let field = cls.getInstanceField("name");
      let oldValue = field!.getValue(obj) as string;
      obj.name = 'modified';
      let newValue = field!.getValue(obj) as string;
      expect(oldValue).assertEqual("test")
      expect(newValue).assertEqual("modified")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_3700
     * @tc.name testInstanceFieldGetValue037
     * @tc.desc Verify getValue reads parent class field via child class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Child037();
      let cls = Class.from<Parent037>();
      let field = cls.getInstanceField("name");
      let value = field!.getValue(obj) as string;
      expect(value).assertEqual("parent")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_3800
     * @tc.name testInstanceFieldGetValue038
     * @tc.desc Verify getValue reads child class specific field via child instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Child038();
      let cls = Class.from<Child038>();
      let field = cls.getInstanceField("age");
      let value = field!.getValue(obj) as number;
      expect(value).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_3900
     * @tc.name testInstanceFieldGetValue039
     * @tc.desc Verify getValue returns undefined for non-existent field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass039();
      let cls = Class.from<MyClass039>();
      let field = cls.getInstanceField("noExist");
      if (field !== undefined) {
        let value = field!.getValue(obj);
        expect(value).assertUndefined()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETVALUE_4000
     * @tc.name testInstanceFieldGetValue040
     * @tc.desc Verify multiple getValue calls on same field return consistent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetValue040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass040();
      let cls = Class.from<MyClass040>();
      let field = cls.getInstanceField("name");
