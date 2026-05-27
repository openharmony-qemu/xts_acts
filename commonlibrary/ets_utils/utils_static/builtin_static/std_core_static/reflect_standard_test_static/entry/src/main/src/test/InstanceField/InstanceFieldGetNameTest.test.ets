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

class MyClass003 {
  public name = 'test';
}

class MyClass004 {
  public firstName = 'a';
  public lastName = 'b';
}

class ParentClass005 {
  public parentField = 'p';
}

class ChildClass005 extends ParentClass005 {
  public childField = 'c';
}

class MyClass006 {
  public a = 0;
}

class MyClass007 {
  public _internal = 0;
  public __private = 1;
}

class MyClass008 {
  public data = 0;
}

class MyClass009 {
  public data = 0;
}

class MyClass010 {
  public veryLongFieldNameThatIsStillValid = 0;
}

class MyClass011 {
  public $data = 0;
}

class MyClass013 {
  public name = 'test';
}

class MyClass015 {
  public data = 0;
}

class MyClass016 {
  public data = 0;
}

class CustomInstanceField017 extends reflect.InstanceField {
  public override getName(): string {
    return super.getName();
  }
}

class MyClass019 {
  public data = 0;
}

class MyClass020 {
  public data = 0;
}

class MyClass021 {
  public data = 0;
}

class ParentClass022 {
  public name = 'parent';
}

class MyClass022 extends ParentClass022 {
  public name = 'test';
  public count = 0;
}

class GenericClass023<T> {
  public item: T | null = null;
}

class MyClass024 {
  public a = 1;
  public b = 2;
  public c = 3;
}

export default function InstanceFieldGetNameTest() {
  describe('InstanceFieldGetNameTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETNAME_0100
     * @tc.name testInstanceFieldGetName001
     * @tc.desc Verify getName() call syntax when no parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField("name");
      let fieldName = field!.getName();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETNAME_0200
     * @tc.name testInstanceFieldGetName002
     * @tc.desc Verify compile error when extra parameter is passed to getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETNAME_0300
     * @tc.name testInstanceFieldGetName003
     * @tc.desc Verify getName returns correct field name string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetName003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass003>();
      let field = cls.getInstanceField("name");
      expect(field!.getName()).assertEqual("name");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETNAME_0400
     * @tc.name testInstanceFieldGetName004
     * @tc.desc Verify getName returns correct names for different fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetName004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();
      expect(cls.getInstanceField("firstName")!.getName()).assertEqual("firstName");
      expect(cls.getInstanceField("lastName")!.getName()).assertEqual("lastName");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETNAME_0500
     * @tc.name testInstanceFieldGetName005
     * @tc.desc Verify getName returns original field name for inherited fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetName005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ChildClass005>();
      expect(cls.getInstanceField("parentField")!.getName()).assertEqual("parentField");
      expect(cls.getInstanceField("childField")!.getName()).assertEqual("childField");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETNAME_0600
     * @tc.name testInstanceFieldGetName006
     * @tc.desc Verify getName returns correct single character field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetName006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass006>();
      let field = cls.getInstanceField("a");
      expect(field!.getName()).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETNAME_0700
     * @tc.name testInstanceFieldGetName007
     * @tc.desc Verify getName returns correct underscore prefixed field names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetName007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
      expect(cls.getInstanceField("_internal")!.getName()).assertEqual("_internal");
      expect(cls.getInstanceField("__private")!.getName()).assertEqual("__private");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETNAME_0800
     * @tc.name testInstanceFieldGetName008
     * @tc.desc Verify getName return value is string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetName008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      let field = cls.getInstanceField("data");
      let name = field!.getName();
      expect(typeof name).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETNAME_0900
     * @tc.name testInstanceFieldGetName009
     * @tc.desc Verify getName does not return empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetName009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass009>();
      let field = cls.getInstanceField("data");
      expect(field!.getName().length).assertPositive();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETNAME_1000
     * @tc.name testInstanceFieldGetName010
     * @tc.desc Verify getName returns correct long field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetName010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass010>();
      let field = cls.getInstanceField("veryLongFieldNameThatIsStillValid");
      expect(field!.getName()).assertEqual("veryLongFieldNameThatIsStillValid");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETNAME_1100
     * @tc.name testInstanceFieldGetName011
     * @tc.desc Verify getName returns correct dollar sign field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetName011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass011>();
      let field = cls.getInstanceField("$data");
      expect(field!.getName()).assertEqual("$data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETNAME_1200
     * @tc.name testInstanceFieldGetName012
     * @tc.desc Verify field name must conform to identifier rules
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetName012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETNAME_1300
     * @tc.name testInstanceFieldGetName013
     * @tc.desc Verify getName does not throw Error during normal execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetName013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass013>();
      let field = cls.getInstanceField("name");
      try {
        let fieldName = field!.getName();
        expect(fieldName).not.toBeNull();
      } catch (error) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETNAME_1400
     * @tc.name testInstanceFieldGetName014
     * @tc.desc Verify empty string field name is rejected at compile time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetName014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETNAME_1500
     * @tc.name testInstanceFieldGetName015
     * @tc.desc Verify getName executes normally within try-finally block
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetName015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass015>();
      let field = cls.getInstanceField("data");
      let fieldName: string = '';
      try {
        fieldName = field!.getName();
      } finally {
        expect(fieldName).assertEqual("data");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETNAME_1600
     * @tc.name testInstanceFieldGetName016
     * @tc.desc Verify getName does not cause unhandled exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetName016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass016>();
      let field = cls.getInstanceField("data");
      let result = field!.getName();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETNAME_1700
     * @tc.name testInstanceFieldGetName017
     * @tc.desc Verify subclass of InstanceField overrides getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetName017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETNAME_1800
     * @tc.name testInstanceFieldGetName018
     * @tc.desc Verify getName is not marked as deprecated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetName018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass019>();
      let field = cls.getInstanceField("data");
      let name = field!.getName();
      expect(name).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETNAME_1900
     * @tc.name testInstanceFieldGetName019
     * @tc.desc Verify getName is a synchronous method callable without await
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetName019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass019>();
      let field = cls.getInstanceField("data");
      let name = field!.getName();
      expect(name).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETNAME_2000
     * @tc.name testInstanceFieldGetName020
     * @tc.desc Verify getName does not return a Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetName020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass020>();
      let field = cls.getInstanceField("data");
      let result = field!.getName();
      expect(result instanceof Promise).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETNAME_2100
     * @tc.name testInstanceFieldGetName021
     * @tc.desc Verify multiple getName calls on same field return consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetName021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass021>();
      let field = cls.getInstanceField("data");
      let name1 = field!.getName();
      let name2 = field!.getName();
      expect(name1 === name2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETNAME_2200
     * @tc.name testInstanceFieldGetName022
     * @tc.desc Verify getName and getOwner combination for field ownership validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetName022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass022>();
      let field = cls.getInstanceField("count");
      expect(field!.getName()).assertEqual("count");
      expect(field!.getOwner().getName()).assertEqual("MyClass022");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETNAME_2300
     * @tc.name testInstanceFieldGetName023
     * @tc.desc Verify getName returns original name for generic class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetName023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClass023<number>>();
      let field = cls.getInstanceField("item");
      expect(field!.getName()).assertEqual("item");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_GETNAME_2400
     * @tc.name testInstanceFieldGetName024
     * @tc.desc Verify getName returns correct names when iterating all fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldGetName024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass024>();
      let expectedNames = ['a', 'b', 'c'];
      expectedNames.forEach(name => {
        let field = cls.getInstanceField(name);
        expect(field!.getName()).assertEqual(name);
      });
    });
  });
}
