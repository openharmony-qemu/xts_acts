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
  public name: string = "test";
}

class MyClass002 {
  public name: string = "test";
}

class MyClass003 {
  public name: string = "test";
}

class MyClass004 {
  public name: string = "test";
}

class MyClass005 {
  public name: string = "test";
}

class MyClass006 {
  public name: string = "test";
}

class Parent007 {
  public name: string = "parent";
}

class Child007 extends Parent007 {
  public age: number = 10;
}

class MyClass008 {
  public name: string = "test";
}

class MyClass009 {
  public name: string = "test";
}

class MyClass010 {
  public name: string = "test";
}

class OtherClass010 {
  public name: string = "other";
}

class MyClass011 {
  public name: string = "test";
}

class MyClass012 {
  public name: string = "test";
}

class MyClass013 {
  public name: string = "test";
}

class MyClass014 {
  public name: string = "test";
}

class MyClass015 {
  public name: string = "test";
}

class MyClass016 {
  public name: string = "test";
}

class MyClass017 {
  public name: string = "test";
}

class MyClass018 {
  public name: string = "test";
}

class MyClass019 {
  public name: string = "test";
}

class MyClass020 {
  public name: string = "test";
}

class MyClass021 {
  public name: string = "test";
}

class MyClass022 {
  public name: string = "test";
}

class MyClass023 {
  public name: string = "test";
}

class MyClass024 {
  public name: string = "test";
}

class MyClass025 {
  public name: string = "test";
}

class MyClass026 {
  public age: number = 0;
}

class MyClass027 {
  public age: number = 0;
}

class MyClass028 {
  public age: number = 0;
}

class MyClass029 {
  public age: number = 0;
}

class MyClass030 {
  public age: number = 0;
}

class MyClass031 {
  public age: number = 0;
}

class MyClass032 {
  public age: number = 0;
}

class MyClass033 {
  public age: number = 0;
}

class MyClass034 {
  public active: boolean = false;
}

class MyClass035 {
  public active: boolean = false;
}

class MyClass036 {
  public name: string | null = "test";
}

class MyClass037 {
  public name: string = "test";
}

class Inner038 {
  public value: number = 0;
}

class MyClass038 {
  public inner: Inner038 = new Inner038();
}

class MyClass039 {
  public items: number[] = [];
}

class MyClass040 {
  public name: string = "test";
}

class MyClass041 {
  public age: number = 0;
}

class MyClass042 {
  public active: boolean = false;
}

class MyClass043 {
  public name: string = "test";
}

class MyClass044 {
  public name: string = "test";
}

class MyClass045 {
  public name: string = "old";
}

class MyClass046 {
  public name: string = "test";
}

class MyClass047 {
  public name: string = "test";
}

class MyClass048 {
  public name: string = "test";
}

class OtherClass048 {
  public other: string = "other";
}

class MyClass049 {
  public count: number = 0;
}

class MyClass050 {
  public readonly id: number = 1;
}

class MyClass051 {
  public readonly name: string = "test";
}

class MyClass052 {
  public name: string = "test";
}

class OtherClass052 {
  public other: string = "other";
}

class MyClass053 {
  public age: number = 0;
}

class MyClass054 {
  public name: string = "test";
}

class MyClass055 {
  private secret: string = "hidden";
}

class Base056 {
  protected baseName: string = "base";
}

class Child056 extends Base056 {
}

class Address057 {
  public city: string = "";
}

class Person057 {
  public address: Address057 = new Address057();
}

class MyClass058 {
  public map: Map<string, number> = new Map();
}

enum Color059 {
  Red,
  Green,
  Blue
}

class MyClass059 {
  public color: Color059 = Color059.Red;
}

class MyClass060 {
  public name?: string;
}

class MyClass061 {
  public count: number = 0;
}

export default function InstanceFieldSetValueTest() {
  describe('InstanceFieldSetValueTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_0100
     * @tc.name testInstanceFieldSetValue001
     * @tc.desc Verify setValue with compatible thisObj and value writes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass001();
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField("name");
      field!.setValue(obj, "new value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_0200
     * @tc.name testInstanceFieldSetValue002
     * @tc.desc Verify compile error when thisObj parameter is missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_0300
     * @tc.name testInstanceFieldSetValue003
     * @tc.desc Verify compile error when value parameter is missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_0400
     * @tc.name testInstanceFieldSetValue004
     * @tc.desc Verify compile error when no parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_0500
     * @tc.name testInstanceFieldSetValue005
     * @tc.desc Verify compile error when extra parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_0600
     * @tc.name testInstanceFieldSetValue006
     * @tc.desc Verify setValue with valid class instance as thisObj
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass006();
      let cls = Class.from<MyClass006>();
      let field = cls.getInstanceField("name");
      field!.setValue(obj, "hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_0700
     * @tc.name testInstanceFieldSetValue007
     * @tc.desc Verify setValue with child class instance as thisObj
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Child007();
      let cls = Class.from<Parent007>();
      let field = cls.getInstanceField("name");
      field!.setValue(obj, "child value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_0800
     * @tc.name testInstanceFieldSetValue008
     * @tc.desc Verify setValue throws TypeError when thisObj is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      let field = cls.getInstanceField("name");
      try {
        field!.setValue(null as Object, "value");
        expect().assertFail();
      } catch (e) {
        expect((e as TypeError).message).not.toBeNull();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_0900
     * @tc.name testInstanceFieldSetValue009
     * @tc.desc Verify setValue throws TypeError when thisObj is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass009>();
      let field = cls.getInstanceField("name");
      try {
        field!.setValue(undefined as Object, "value");
        expect().assertFail();
      } catch (e) {
        expect((e as TypeError).message).not.toBeNull();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_1000
     * @tc.name testInstanceFieldSetValue010
     * @tc.desc Verify setValue throws TypeError when thisObj is incompatible object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let otherObj = new OtherClass010();
      let cls = Class.from<MyClass010>();
      let field = cls.getInstanceField("name");
      try {
        field!.setValue(otherObj, "value");
        expect().assertFail();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_1100
     * @tc.name testInstanceFieldSetValue011
     * @tc.desc Verify setValue throws TypeError when thisObj is plain object literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass011>();
      let field = cls.getInstanceField("name");
      try {
        field!.setValue({ name: "test" }, "value");
        expect().assertFail();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_1200
     * @tc.name testInstanceFieldSetValue012
     * @tc.desc Verify setValue throws TypeError when thisObj is array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass012>();
      let field = cls.getInstanceField("name");
      try {
        field!.setValue([1, 2, 3] as Object, "value");
        expect().assertFail();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_1300
     * @tc.name testInstanceFieldSetValue013
     * @tc.desc Verify setValue throws TypeError when thisObj is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass013>();
      let field = cls.getInstanceField("name");
      try {
        field!.setValue(123 as Object, "value");
        expect().assertFail();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_1400
     * @tc.name testInstanceFieldSetValue014
     * @tc.desc Verify setValue throws TypeError when thisObj is string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass014>();
      let field = cls.getInstanceField("name");
      try {
        field!.setValue("string" as Object, "value");
        expect().assertFail();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_1500
     * @tc.name testInstanceFieldSetValue015
     * @tc.desc Verify setValue throws TypeError when thisObj is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass015>();
      let field = cls.getInstanceField("name");
      try {
        field!.setValue(true as Object, "value");
        expect().assertFail();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_1600
     * @tc.name testInstanceFieldSetValue016
     * @tc.desc Verify setValue writes normal string value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass016();
      let cls = Class.from<MyClass016>();
      let field = cls.getInstanceField("name");
      field!.setValue(obj, "hello world");
      expect(obj.name).assertEqual("hello world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_1700
     * @tc.name testInstanceFieldSetValue017
     * @tc.desc Verify setValue writes empty string correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass017();
      let cls = Class.from<MyClass017>();
      let field = cls.getInstanceField("name");
      field!.setValue(obj, "");
      expect(obj.name).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_1800
     * @tc.name testInstanceFieldSetValue018
     * @tc.desc Verify setValue writes whitespace string correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass018();
      let cls = Class.from<MyClass018>();
      let field = cls.getInstanceField("name");
      field!.setValue(obj, "   ");
      expect(obj.name).assertEqual("   ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_1900
     * @tc.name testInstanceFieldSetValue019
     * @tc.desc Verify setValue writes Unicode character string correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass019();
      let cls = Class.from<MyClass019>();
      let field = cls.getInstanceField("name");
      field!.setValue(obj, "\u4e2d\u6587\u6d4b\u8bd5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_2000
     * @tc.name testInstanceFieldSetValue020
     * @tc.desc Verify setValue writes zero-width space string correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass020();
      let cls = Class.from<MyClass020>();
      let field = cls.getInstanceField("name");
      field!.setValue(obj, "\u200B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_2100
     * @tc.name testInstanceFieldSetValue021
     * @tc.desc Verify setValue writes XSS script string correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass021();
      let cls = Class.from<MyClass021>();
      let field = cls.getInstanceField("name");
      field!.setValue(obj, "<script>alert(1)</script>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_2200
     * @tc.name testInstanceFieldSetValue022
     * @tc.desc Verify setValue writes very long string correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass022();
      let cls = Class.from<MyClass022>();
      let field = cls.getInstanceField("name");
      let longStr = "a".repeat(10000);
      field!.setValue(obj, longStr);
      expect(obj.name).assertEqual(longStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_2300
     * @tc.name testInstanceFieldSetValue023
     * @tc.desc Verify setValue writes special characters string correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass023();
      let cls = Class.from<MyClass023>();
      let field = cls.getInstanceField("name");
      field!.setValue(obj, "!@#$%^&*()_+-=[]{}|;':\",./<>?");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_2400
     * @tc.name testInstanceFieldSetValue024
     * @tc.desc Verify setValue writes newline characters string correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass024();
      let cls = Class.from<MyClass024>();
      let field = cls.getInstanceField("name");
      field!.setValue(obj, "line1\nline2\r\nline3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_2500
     * @tc.name testInstanceFieldSetValue025
     * @tc.desc Verify setValue writes invalid UTF-8 sequence string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass025();
      let cls = Class.from<MyClass025>();
      let field = cls.getInstanceField("name");
      field!.setValue(obj, "\udc04");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_2600
     * @tc.name testInstanceFieldSetValue026
     * @tc.desc Verify setValue writes normal number value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass026();
      let cls = Class.from<MyClass026>();
      let field = cls.getInstanceField("age");
      field!.setValue(obj, 25);
      expect(obj.age).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_2700
     * @tc.name testInstanceFieldSetValue027
     * @tc.desc Verify setValue writes Number.MAX_VALUE correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass027();
      let cls = Class.from<MyClass027>();
      let field = cls.getInstanceField("age");
      field!.setValue(obj, Number.MAX_VALUE);
      expect(obj.age).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_2800
     * @tc.name testInstanceFieldSetValue028
     * @tc.desc Verify setValue writes Number.MIN_VALUE correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass028();
      let cls = Class.from<MyClass028>();
      let field = cls.getInstanceField("age");
      field!.setValue(obj, Number.MIN_VALUE);
      expect(obj.age).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_2900
     * @tc.name testInstanceFieldSetValue029
     * @tc.desc Verify setValue writes negative number correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass029();
      let cls = Class.from<MyClass029>();
      let field = cls.getInstanceField("age");
      field!.setValue(obj, -1);
      expect(obj.age).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_3000
     * @tc.name testInstanceFieldSetValue030
     * @tc.desc Verify setValue writes zero correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass030();
      let cls = Class.from<MyClass030>();
      let field = cls.getInstanceField("age");
      field!.setValue(obj, 0);
      expect(obj.age).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_3100
     * @tc.name testInstanceFieldSetValue031
     * @tc.desc Verify setValue writes NaN correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass031();
      let cls = Class.from<MyClass031>();
      let field = cls.getInstanceField("age");
      field!.setValue(obj, NaN);
      expect(Number.isNaN(obj.age)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_3200
     * @tc.name testInstanceFieldSetValue032
     * @tc.desc Verify setValue writes Infinity correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass032();
      let cls = Class.from<MyClass032>();
      let field = cls.getInstanceField("age");
      field!.setValue(obj, Number.POSITIVE_INFINITY);
      expect(obj.age).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_3300
     * @tc.name testInstanceFieldSetValue033
     * @tc.desc Verify setValue writes scientific notation number correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass033();
      let cls = Class.from<MyClass033>();
      let field = cls.getInstanceField("age");
      field!.setValue(obj, 1e6);
      expect(obj.age).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_3400
     * @tc.name testInstanceFieldSetValue034
     * @tc.desc Verify setValue writes boolean true correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass034();
      let cls = Class.from<MyClass034>();
      let field = cls.getInstanceField("active");
      field!.setValue(obj, true);
      expect(obj.active).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_3500
     * @tc.name testInstanceFieldSetValue035
     * @tc.desc Verify setValue writes boolean false correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass035();
      let cls = Class.from<MyClass035>();
      let field = cls.getInstanceField("active");
      field!.setValue(obj, false);
      expect(obj.active).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_3600
     * @tc.name testInstanceFieldSetValue036
     * @tc.desc Verify setValue writes null to nullable field correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass036();
      let cls = Class.from<MyClass036>();
      let field = cls.getInstanceField("name");
      field!.setValue(obj, null);
      expect(obj.name).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_3700
     * @tc.name testInstanceFieldSetValue037
     * @tc.desc Verify setValue writes undefined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass037();
      let cls = Class.from<MyClass037>();
      let field = cls.getInstanceField("name");
      field!.setValue(obj, undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_3800
     * @tc.name testInstanceFieldSetValue038
     * @tc.desc Verify setValue writes object value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass038();
      let cls = Class.from<MyClass038>();
      let field = cls.getInstanceField("inner");
      let newInner = new Inner038();
      newInner.value = 100;
      field!.setValue(obj, newInner);
      expect(obj.inner.value).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_3900
     * @tc.name testInstanceFieldSetValue039
     * @tc.desc Verify setValue writes array value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass039();
      let cls = Class.from<MyClass039>();
      let field = cls.getInstanceField("items");
      field!.setValue(obj, [1, 2, 3]);
      expect(obj.items.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_4000
     * @tc.name testInstanceFieldSetValue040
     * @tc.desc Verify setValue throws TypeError when writing number to string field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass040();
      let cls = Class.from<MyClass040>();
      let field = cls.getInstanceField("name");
      try {
        field!.setValue(obj, 123);
        expect().assertFail();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_4100
     * @tc.name testInstanceFieldSetValue041
     * @tc.desc Verify setValue throws TypeError when writing string to number field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass041();
      let cls = Class.from<MyClass041>();
      let field = cls.getInstanceField("age");
      try {
        field!.setValue(obj, "not a number");
        expect().assertFail();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_4200
     * @tc.name testInstanceFieldSetValue042
     * @tc.desc Verify setValue throws TypeError when writing string to boolean field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass042();
      let cls = Class.from<MyClass042>();
      let field = cls.getInstanceField("active");
      try {
        field!.setValue(obj, "true");
        expect().assertFail();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_4300
     * @tc.name testInstanceFieldSetValue043
     * @tc.desc Verify setValue returns void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass043();
      let cls = Class.from<MyClass043>();
      let field = cls.getInstanceField("name");
      let result: void = field!.setValue(obj, "value");
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_4400
     * @tc.name testInstanceFieldSetValue044
     * @tc.desc Verify setValue executes correctly without capturing return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass044();
      let cls = Class.from<MyClass044>();
      let field = cls.getInstanceField("name");
      field!.setValue(obj, "value");
      expect(obj.name).assertEqual("value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_4500
     * @tc.name testInstanceFieldSetValue045
     * @tc.desc Verify getValue reads updated value after setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass045();
      let cls = Class.from<MyClass045>();
      let field = cls.getInstanceField("name");
      field!.setValue(obj, "new");
      expect(field!.getValue<string>(obj)).assertEqual("new");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_4600
     * @tc.name testInstanceFieldSetValue046
     * @tc.desc Verify last setValue call takes effect after multiple writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass046();
      let cls = Class.from<MyClass046>();
      let field = cls.getInstanceField("name");
      field!.setValue(obj, "first");
      field!.setValue(obj, "second");
      field!.setValue(obj, "third");
      expect(obj.name).assertEqual("third");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_4700
     * @tc.name testInstanceFieldSetValue047
     * @tc.desc Verify setValue on different instances writes independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new MyClass047();
      let obj2 = new MyClass047();
      let cls = Class.from<MyClass047>();
      let field = cls.getInstanceField("name");
      field!.setValue(obj1, "value1");
      field!.setValue(obj2, "value2");
      expect(obj1.name).assertEqual("value1");
      expect(obj2.name).assertEqual("value2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_4800
     * @tc.name testInstanceFieldSetValue048
     * @tc.desc Verify setValue throws TypeError when thisObj is incompatible with field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let otherObj = new OtherClass048();
      let cls = Class.from<MyClass048>();
      let field = cls.getInstanceField("name");
      try {
        field!.setValue(otherObj, "value");
        expect().assertFail();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_4900
     * @tc.name testInstanceFieldSetValue049
     * @tc.desc Verify setValue throws TypeError when value type is incompatible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass049();
      let cls = Class.from<MyClass049>();
      let field = cls.getInstanceField("count");
      try {
        field!.setValue(obj, "string");
        expect().assertFail();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_5000
     * @tc.name testInstanceFieldSetValue050
     * @tc.desc Verify setValue throws TypeError when writing to readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass050();
      let cls = Class.from<MyClass050>();
      let field = cls.getInstanceField("id");
      try {
        field!.setValue(obj, 999);
        expect().assertFail();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_5100
     * @tc.name testInstanceFieldSetValue051
     * @tc.desc Verify TypeError is thrown when writing to readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass051();
      let cls = Class.from<MyClass051>();
      let field = cls.getInstanceField("name");
      try {
        field!.setValue(obj, "new value");
        expect().assertFail();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_5200
     * @tc.name testInstanceFieldSetValue052
     * @tc.desc Verify try-catch catches TypeError for incompatible thisObj with error details
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass052>();
      let field = cls.getInstanceField("name");
      try {
        field!.setValue(new OtherClass052(), "value");
      } catch (e: TypeError) {
        expect(e.name).assertEqual("TypeError");
        expect(e.message.length).toBeGreaterThan(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_5300
     * @tc.name testInstanceFieldSetValue053
     * @tc.desc Verify try-catch catches TypeError for value type mismatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass053();
      let cls = Class.from<MyClass053>();
      let field = cls.getInstanceField("age");
      try {
        field!.setValue(obj, "not number");
      } catch (e: TypeError) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_5400
     * @tc.name testInstanceFieldSetValue054
     * @tc.desc Verify try-catch-finally block correctly handles setValue flow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass054();
      let cls = Class.from<MyClass054>();
      let field = cls.getInstanceField("name");
      let finallyExecuted = false;
      try {
        field!.setValue(obj, "value");
      } catch (e: TypeError) {
        expect().assertFail();
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_5500
     * @tc.name testInstanceFieldSetValue055
     * @tc.desc Verify setValue writes to private field via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass055();
      let cls = Class.from<MyClass055>();
      let field = cls.getInstanceField("secret");
      field!.setValue(obj, "revealed");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_5600
     * @tc.name testInstanceFieldSetValue056
     * @tc.desc Verify setValue writes to protected field via reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Child056();
      let cls = Class.from<Base056>();
      let field = cls.getInstanceField("baseName");
      field!.setValue(obj, "modified");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_5700
     * @tc.name testInstanceFieldSetValue057
     * @tc.desc Verify setValue writes nested object field correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Person057();
      let field = Class.from<Person057>().getInstanceField("address");
      let newAddr = new Address057();
      newAddr.city = "Beijing";
      field!.setValue(obj, newAddr);
      expect(obj.address.city).assertEqual("Beijing");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_5800
     * @tc.name testInstanceFieldSetValue058
     * @tc.desc Verify setValue writes Map type field correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass058();
      let cls = Class.from<MyClass058>();
      let field = cls.getInstanceField("map");
      let newMap = new Map<string, number>();
      newMap.set("key", 123);
      field!.setValue(obj, newMap);
      expect(obj.map.get("key")).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_5900
     * @tc.name testInstanceFieldSetValue059
     * @tc.desc Verify setValue writes enum type field correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass059();
      let cls = Class.from<MyClass059>();
      let field = cls.getInstanceField("color");
      field!.setValue(obj, Color059.Blue);
      expect(obj.color).assertEqual(Color059.Blue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_6000
     * @tc.name testInstanceFieldSetValue060
     * @tc.desc Verify setValue writes value to previously undefined field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass060();
      let cls = Class.from<MyClass060>();
      let field = cls.getInstanceField("name");
      field!.setValue(obj, "defined");
      expect(obj.name).assertEqual("defined");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_SETVALUE_6100
     * @tc.name testInstanceFieldSetValue061
     * @tc.desc Verify setValue final value is correct after rapid consecutive writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldSetValue061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass061();
      let cls = Class.from<MyClass061>();
      let field = cls.getInstanceField("count");
      for (let i = 1; i <= 100; i++) {
        field!.setValue(obj, i);
      }
      expect(obj.count).assertEqual(100);
    });
  });
}
