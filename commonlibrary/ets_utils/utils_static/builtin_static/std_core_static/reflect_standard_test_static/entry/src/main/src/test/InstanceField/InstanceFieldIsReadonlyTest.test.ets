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
  public readonly name: string = 'test';
}

class MyClass002 {
  public readonly name: string = 'test';
}

class MyClass004 {
  public readonly name: string = 'test';
}

class MyClass005 {
  public readonly title: string = 'hello world';
}

class MyClass006 {
  public readonly count: int = 100;
}

class MyClass007 {
  public readonly isActive: boolean = true;
}

class MyClass008 {
  public readonly value: number = 3.14;
}

class MyClass009 {
  public readonly items: string[] = ['a', 'b', 'c'];
}

class Helper010 {
  public value: int = 0;
}

class MyClass010 {
  public readonly helper: Helper010 = new Helper010();
}

class MyClass011 {
  readonly defaultReadonly: int = 0;
}

class MyClass012 {
  public readonly id: int;
  public readonly name: string;
  constructor(id: int, name: string) {
    this.id = id;
    this.name = name;
  }
}

class MyClass013 {
  public count: int = 0;
}

class MyClass014 {
  public name: string = 'my name';
}

class MyClass015 {
  public age: int = 18;
}

class MyClass016 {
  public flag: boolean = false;
}

class MyClass017 {
  public rating: number = 4.5;
}

class MyClass018 {
  public list: int[] = [1, 2, 3];
}

class Util019 {
  public version: string = '1.0';
}

class MyClass019 {
  public util: Util019 = new Util019();
}

class MyClass020 {
  defaultField: int = 0;
}

class MyClass021 {
  public readonly name: string = 'test';
}

class MyClass022 {
  public readonly flag: boolean = true;
}

class MyClass023 {
  public counter: int = 0;
}

class MyClass024 {
  public readonly name: string = 'test';
}

class MyClass027 {
  public static readonly staticReadonly: int = 42;
}

class MyClass028 {
  public readonly id: int = 1;
  public readonly name: string = 'test';
  public count: int = 0;
  public status: boolean = true;
  public readonly flag: boolean = false;
}

class MyClass029 {
  public readonly name: string = 'test';
}

class MyClass030 {
  public readonly name: string = 'test';
}

class Parent031 {
  public parentField: string = 'parent';
}

class Child031 extends Parent031 {
  public readonly childReadonly: int = 10;
  public childField: string = 'child';
}

class Parent032 {
  public readonly parentReadonly: int = 100;
  public parentField: string = 'parent';
}

class Child032 extends Parent032 {
  public name: string = 'child';
}

class GrandParent033 {
  public readonly grandReadonly: string = 'grand';
  public grandField: int = 0;
}

class Parent033 extends GrandParent033 {
  public readonly parentReadonly: string = 'parent';
  public parentField: int = 1;
}

class Child033 extends Parent033 {
  public readonly childReadonly: string = 'child';
  public childField: int = 2;
}

class Parent034 {
  public readonly value: int = 10;
}

class Child034 extends Parent034 {
  public value: int = 20;
}

class MyClass035 {
  public readonly publicReadonlyField: int = 1;
}

class MyClass036 {
  public publicField: int = 2;
}

class MyClass037 {
  public static readonly staticReadonly: int = 100;
  public instanceField: int = 0;
}

class MyClass038 {
  public static readonly STATIC_READONLY: int = 100;
  public static STATIC_VAR: int = 200;
}

class MyClass039 {
  public readonly deferredValue: int;
  constructor(v: int) {
    this.deferredValue = v;
  }
}

interface MyInterface040 {
  readonly id: int;
  name: string;
}

interface MyInterface041 {
  readonly code: string;
}

class MyImpl041 implements MyInterface041 {
  public readonly code: string = 'IMPL';
  public readonly name: string = 'test';
  public extra: int = 0;
}

class MyClass042 {
  public readonly 'class': int = 1;
  public readonly 'interface': string = 'test';
  public readonly 'readonly': boolean = true;
}

class MyClass043 {
  public readonly '只读字段': string = '只读';
  public '可变字段': string = '可变';
}

class MyClass044 {
  public readonly myReadonlyFieldName: string = 'camelCase';
  public myMutableFieldName: string = 'mutable';
}

class MyClass045 {
  public readonly _internal: int = 0;
  public _external: int = 1;
}

class LargeClass046 {
  public readonly r0: int = 0;
  public f1: int = 1;
  public readonly r2: int = 2;
  public f3: int = 3;
  public readonly r98: int = 98;
  public f99: int = 99;
}

class EmptyClass047 {
}

class MyClass048 {
  public readonly id: int = 1;
  public name: string = 'test';
}

class MyClass049 {
  public readonly code: string = 'ABC';
  public count: int = 0;
}

export default function InstanceFieldIsReadonlyTest() {
  describe('InstanceFieldIsReadonlyTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_0100
     * @tc.name testInstanceFieldIsReadonly001
     * @tc.desc Verify isReadonly() call without parameters executes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name');
      let result = field!.isReadonly();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_0200
     * @tc.name testInstanceFieldIsReadonly002
     * @tc.desc Verify compile error when extra parameter is passed to isReadonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_0300
     * @tc.name testInstanceFieldIsReadonly003
     * @tc.desc Verify isReadonly has no parameter type test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_0400
     * @tc.name testInstanceFieldIsReadonly004
     * @tc.desc Verify isReadonly returns true for public readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();
      let field = cls.getInstanceField('name');
      console.info(field!.isReadonly());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_0500
     * @tc.name testInstanceFieldIsReadonly005
     * @tc.desc Verify isReadonly returns true for readonly string type field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass005>();
      let field = cls.getInstanceField('title');
      expect(field!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_0600
     * @tc.name testInstanceFieldIsReadonly006
     * @tc.desc Verify isReadonly returns true for readonly int type field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass006>();
      let field = cls.getInstanceField('count');
      expect(field!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_0700
     * @tc.name testInstanceFieldIsReadonly007
     * @tc.desc Verify isReadonly returns true for readonly boolean type field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
      let field = cls.getInstanceField('isActive');
      expect(field!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_0800
     * @tc.name testInstanceFieldIsReadonly008
     * @tc.desc Verify isReadonly returns true for readonly number type field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      let field = cls.getInstanceField('value');
      expect(field!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_0900
     * @tc.name testInstanceFieldIsReadonly009
     * @tc.desc Verify isReadonly returns true for readonly array type field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass009>();
      let field = cls.getInstanceField('items');
      expect(field!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_1000
     * @tc.name testInstanceFieldIsReadonly010
     * @tc.desc Verify isReadonly returns true for readonly custom class type field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass010>();
      let field = cls.getInstanceField('helper');
      expect(field!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_1100
     * @tc.name testInstanceFieldIsReadonly011
     * @tc.desc Verify isReadonly returns true for readonly field without public modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass011>();
      let field = cls.getInstanceField('defaultReadonly');
      expect(field!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_1200
     * @tc.name testInstanceFieldIsReadonly012
     * @tc.desc Verify isReadonly returns true for readonly field assigned in constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass012>();
      let field = cls.getInstanceField('id');
      expect(field!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_1300
     * @tc.name testInstanceFieldIsReadonly013
     * @tc.desc Verify isReadonly returns false for normal public field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass013>();
      let field = cls.getInstanceField('count');
      console.info(field!.isReadonly());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_1400
     * @tc.name testInstanceFieldIsReadonly014
     * @tc.desc Verify isReadonly returns false for non-readonly string field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass014>();
      let field = cls.getInstanceField('name');
      expect(field!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_1500
     * @tc.name testInstanceFieldIsReadonly015
     * @tc.desc Verify isReadonly returns false for non-readonly int field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass015>();
      let field = cls.getInstanceField('age');
      expect(field!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_1600
     * @tc.name testInstanceFieldIsReadonly016
     * @tc.desc Verify isReadonly returns false for non-readonly boolean field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass016>();
      let field = cls.getInstanceField('flag');
      expect(field!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_1700
     * @tc.name testInstanceFieldIsReadonly017
     * @tc.desc Verify isReadonly returns false for non-readonly number field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass017>();
      let field = cls.getInstanceField('rating');
      expect(field!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_1800
     * @tc.name testInstanceFieldIsReadonly018
     * @tc.desc Verify isReadonly returns false for non-readonly array field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass018>();
      let field = cls.getInstanceField('list');
      expect(field!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_1900
     * @tc.name testInstanceFieldIsReadonly019
     * @tc.desc Verify isReadonly returns false for non-readonly custom class field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass019>();
      let field = cls.getInstanceField('util');
      expect(field!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_2000
     * @tc.name testInstanceFieldIsReadonly020
     * @tc.desc Verify isReadonly returns false for field without any modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass020>();
      let field = cls.getInstanceField('defaultField');
      expect(field!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_2100
     * @tc.name testInstanceFieldIsReadonly021
     * @tc.desc Verify isReadonly return value is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass021>();
      let field = cls.getInstanceField('name');
      let result: boolean = field!.isReadonly();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_2200
     * @tc.name testInstanceFieldIsReadonly022
     * @tc.desc Verify isReadonly strictly returns true for readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass022>();
      let field = cls.getInstanceField('flag');
      expect(field!.isReadonly()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_2300
     * @tc.name testInstanceFieldIsReadonly023
     * @tc.desc Verify isReadonly strictly returns false for non-readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass023>();
      let field = cls.getInstanceField('counter');
      expect(field!.isReadonly()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_2400
     * @tc.name testInstanceFieldIsReadonly024
     * @tc.desc Verify isReadonly return value is boolean type for compile-time check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass024>();
      let field = cls.getInstanceField('name');
      let result: boolean = field!.isReadonly();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_2500
     * @tc.name testInstanceFieldIsReadonly025
     * @tc.desc Verify compile error when extra parameter is passed to isReadonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_2600
     * @tc.name testInstanceFieldIsReadonly026
     * @tc.desc Verify isReadonly runtime error when InstanceField is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      return;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_2700
     * @tc.name testInstanceFieldIsReadonly027
     * @tc.desc Verify isReadonly on static readonly field from getStaticField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass027>();
      let staticField = cls.getStaticField('staticReadonly');
      if (staticField != undefined) {
        let result = staticField.isReadonly();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_2800
     * @tc.name testInstanceFieldIsReadonly028
     * @tc.desc Verify isReadonly for mixed readonly and non-readonly fields in same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass028>();
      expect(cls.getInstanceField('id')!.isReadonly()).assertTrue();
      expect(cls.getInstanceField('name')!.isReadonly()).assertTrue();
      expect(cls.getInstanceField('count')!.isReadonly()).assertFalse();
      expect(cls.getInstanceField('status')!.isReadonly()).assertFalse();
      expect(cls.getInstanceField('flag')!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_2900
     * @tc.name testInstanceFieldIsReadonly029
     * @tc.desc Verify repeated isReadonly calls on same field return consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass029>();
      let field = cls.getInstanceField('name');
      let result1 = field!.isReadonly();
      let result2 = field!.isReadonly();
      let result3 = field!.isReadonly();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_3000
     * @tc.name testInstanceFieldIsReadonly030
     * @tc.desc Verify isReadonly consistent across multiple getInstanceField calls for same field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass030>();
      let field1 = cls.getInstanceField('name');
      let field2 = cls.getInstanceField('name');
      expect(field1!.isReadonly()).assertEqual(field2!.isReadonly());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_3100
     * @tc.name testInstanceFieldIsReadonly031
     * @tc.desc Verify isReadonly returns true for child class readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Child031>();
      let field = cls.getInstanceField('childReadonly');
      expect(field!.isReadonly()).assertTrue();
      expect(cls.getInstanceField('childField')!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_3200
     * @tc.name testInstanceFieldIsReadonly032
     * @tc.desc Verify isReadonly for parent readonly field via getSuper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Child032>();
      let superCls = cls.getSuper()!;
      let field = superCls.getInstanceField('parentReadonly');
      expect(field!.isReadonly()).assertTrue();
      expect(superCls.getInstanceField('parentField')!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_3300
     * @tc.name testInstanceFieldIsReadonly033
     * @tc.desc Verify isReadonly in multi-level inheritance chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Child033>();
      expect(cls.getInstanceField('childReadonly')!.isReadonly()).assertTrue();
      expect(cls.getInstanceField('childField')!.isReadonly()).assertFalse();
      let superCls = cls.getSuper()!;
      expect(superCls.getInstanceField('parentReadonly')!.isReadonly()).assertTrue();
      expect(superCls.getInstanceField('parentField')!.isReadonly()).assertFalse();
      let superSuperCls = superCls.getSuper()!;
      expect(superSuperCls.getInstanceField('grandReadonly')!.isReadonly()).assertTrue();
      expect(superSuperCls.getInstanceField('grandField')!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_3400
     * @tc.name testInstanceFieldIsReadonly034
     * @tc.desc Verify isReadonly for overridden field in child and parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Child034>();
      expect(cls.getInstanceField('value')!.isReadonly()).assertFalse();
      let parentCls = cls.getSuper()!;
      expect(parentCls.getInstanceField('value')!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_3500
     * @tc.name testInstanceFieldIsReadonly035
     * @tc.desc Verify isReadonly returns true for public readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass035>();
      let field = cls.getInstanceField('publicReadonlyField');
      expect(field!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_3600
     * @tc.name testInstanceFieldIsReadonly036
     * @tc.desc Verify isReadonly returns false for public field without readonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass036>();
      let field = cls.getInstanceField('publicField');
      expect(field!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_3700
     * @tc.name testInstanceFieldIsReadonly037
     * @tc.desc Verify static readonly field is not obtainable via getInstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass037>();
      let field = cls.getInstanceField('staticReadonly');
      expect(field == undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_3800
     * @tc.name testInstanceFieldIsReadonly038
     * @tc.desc Verify isReadonly for static readonly field via getStaticField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass038>();
      let staticField = cls.getStaticField('STATIC_READONLY');
      expect(staticField!.isReadonly()).assertTrue();
      let staticField2 = cls.getStaticField('STATIC_VAR');
      expect(staticField2!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_3900
     * @tc.name testInstanceFieldIsReadonly039
     * @tc.desc Verify isReadonly returns true for readonly field without initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass039>();
      let field = cls.getInstanceField('deferredValue');
      expect(field!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_4000
     * @tc.name testInstanceFieldIsReadonly040
     * @tc.desc Verify isReadonly for literal initialized interface readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_4100
     * @tc.name testInstanceFieldIsReadonly041
     * @tc.desc Verify isReadonly for class implementing interface with readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyImpl041>();
      expect(cls.getInstanceField('code')!.isReadonly()).assertTrue();
      expect(cls.getInstanceField('name')!.isReadonly()).assertTrue();
      expect(cls.getInstanceField('extra')!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_4200
     * @tc.name testInstanceFieldIsReadonly042
     * @tc.desc Verify isReadonly returns true for keyword named readonly fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass042>();
      expect(cls.getInstanceField('class')!.isReadonly()).assertTrue();
      expect(cls.getInstanceField('interface')!.isReadonly()).assertTrue();
      expect(cls.getInstanceField('readonly')!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_4300
     * @tc.name testInstanceFieldIsReadonly043
     * @tc.desc Verify isReadonly for readonly field with Unicode character name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass043>();
      expect(cls.getInstanceField('只读字段')!.isReadonly()).assertTrue();
      expect(cls.getInstanceField('可变字段')!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_4400
     * @tc.name testInstanceFieldIsReadonly044
     * @tc.desc Verify isReadonly for camelCase named readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass044>();
      expect(cls.getInstanceField('myReadonlyFieldName')!.isReadonly()).assertTrue();
      expect(cls.getInstanceField('myMutableFieldName')!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_4500
     * @tc.name testInstanceFieldIsReadonly045
     * @tc.desc Verify isReadonly for underscore prefixed readonly field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass045>();
      expect(cls.getInstanceField('_internal')!.isReadonly()).assertTrue();
      expect(cls.getInstanceField('_external')!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_4600
     * @tc.name testInstanceFieldIsReadonly046
     * @tc.desc Verify isReadonly for class with many readonly and non-readonly fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<LargeClass046>();
      expect(cls.getInstanceField('r0')!.isReadonly()).assertTrue();
      expect(cls.getInstanceField('f1')!.isReadonly()).assertFalse();
      expect(cls.getInstanceField('r98')!.isReadonly()).assertTrue();
      expect(cls.getInstanceField('f99')!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_4700
     * @tc.name testInstanceFieldIsReadonly047
     * @tc.desc Verify isReadonly runtime error for empty class undefined field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass047>();
      let field = cls.getInstanceField('anything');
      expect(field == undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_4800
     * @tc.name testInstanceFieldIsReadonly048
     * @tc.desc Verify isReadonly consistent between different Class instances for same field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<MyClass048>();
      let cls2 = Class.from<MyClass048>();
      let field1 = cls1.getInstanceField('id');
      let field2 = cls2.getInstanceField('id');
      expect(field1!.isReadonly()).assertEqual(field2!.isReadonly());
      let nameField1 = cls1.getInstanceField('name');
      let nameField2 = cls2.getInstanceField('name');
      expect(nameField1!.isReadonly()).assertEqual(nameField2!.isReadonly());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISREADONLY_4900
     * @tc.name testInstanceFieldIsReadonly049
     * @tc.desc Verify isReadonly interoperates correctly with getName when called alternately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsReadonly049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass049>();
      let readonlyField = cls.getInstanceField('code');
      let mutableField = cls.getInstanceField('count');
      expect(readonlyField!.getName()).assertEqual('code');
      expect(readonlyField!.isReadonly()).assertTrue();
      expect(mutableField!.getName()).assertEqual('count');
      expect(mutableField!.isReadonly()).assertFalse();
      expect(readonlyField!.isReadonly()).assertTrue();
      expect(mutableField!.isReadonly()).assertFalse();
    });
  });
}
