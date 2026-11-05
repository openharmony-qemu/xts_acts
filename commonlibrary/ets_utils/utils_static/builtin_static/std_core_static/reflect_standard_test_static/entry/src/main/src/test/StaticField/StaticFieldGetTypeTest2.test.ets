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
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

class StrField {
  static val: string = '';
}

class LongField {
  static val: long = 0;
}

class IntStrField {
  static val1: int = 0;
  static val2: string = '';
}

class TwoIntField {
  static val1: int = 0;
  static val2: int = 0;
}

class IntField {
  static val: int = 0;
  static intArr: int[] = [1, 2, 3];
  static $private: int = 0;
}

class FloatField {
  static val: float = 0.0f;
}

class DoubleField {
  static val: double = 0.0;
}

class CharField {
  static val: char = c'a';
}

class UnicodeCharField {
  static val: char = c'中';
}

class BoolField {
  static val: boolean = false;
}

class CustomType053 {
  public val: int = 0;
}

class MyClass054 {
  public static customField: CustomType053 = new CustomType053();
}

class TypeA055 {
  public a: int = 0;
}

class TypeB056 {
  public b: int = 0;
}

class MyClass057 {
  public static fieldA: TypeA055 = new TypeA055();
  public static fieldB: TypeB056 = new TypeB056();
}

class CustomType060 {
  public val: int = 0;
}

class MyClass061 {
  public static cf: CustomType060 = new CustomType060();
}

class CustomType062 {
  public val: int = 0;
}

class MyClass063 {
  public static cf: CustomType062 = new CustomType062();
}

class CustomType064 {
  public val: int = 0;
}

class MyClass065 {
  public static cf: CustomType064 = new CustomType064();
}

class CustomType066 {
  public val: int = 0;
}

class MyClass067 {
  public static cf: CustomType066 = new CustomType066();
}

class MyClass068 {
  public static intArr: int[] = [1, 2, 3];
}

class MyClass070 {
  public static strArr: string[] = ['a', 'b'];
}

class MyClass082 {
  public static pub: int = 0;
  public static priv: int = 0;
  public static prot: int = 0;
}

class Parent089 {
  public static val: int = 0;
}

class MyClass103 {
  public static intF: int = 0;
  public static longF: long = 0;
}

class CustomT106 {
  public v: int = 0;
}

class MyClass107 {
  public static boolF: boolean = true;
  public static customF: CustomT106 = new CustomT106();
}

class Child_Parent089 extends Parent089 {
  public static val: string = 'override';
}

enum NewStatusEnum {
  ACTIVE, INACTIVE, PENDING
}

class NewEnumFieldClass {
  public static status: NewStatusEnum = NewStatusEnum.ACTIVE;
  public static count: int = 0;
}

class NewMultiUnionClass {
  public static multiVal: int | string | boolean = 0;
}

abstract class NewAbstractClass {
  public static absField: int = 42;
}

class NewParentGetType {
  public val: int = 0;
}

class NewChildGetType extends NewParentGetType {
  public static childVal: NewChildGetType = new NewChildGetType();
}

interface NewTestInterface {
  name: string;
}

class NewImplClass implements NewTestInterface {
  public static implVal: NewImplClass = new NewImplClass();
  public name: string = '';
}

class GetTypeReadonlyRo {
  public static readonly roVal: string = 'fixed';
}


class ByteField {
  static val: byte = 0;
}

class MyClass026 {
  public static floatNaN: float = Float.NaN;
}

class MyClass027 {
  public static floatInf: float = Float.POSITIVE_INFINITY;
}

class MyClass031 {
  public static doubleNaN: double = Double.NaN;
}

class MyClass032 {
  public static doubleMax: double = Number.MAX_VALUE;
}

class MyClass033 {
  public static doubleNegInf: double = -Double.POSITIVE_INFINITY;
}

class MyClass108 {
  public static shortF: short = 0;
  public static byteF: byte = 0;
}

class MyClass112 {
  public static _internal: int = 0;
}

class ShortField {
  static val: short = 0;
}
export default function staticFieldGetTypeTest2(): void {
  describe('StaticFieldGetTypeTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_0100
     * @tc.name testStaticFieldGetTypeAtTwo001
     * @tc.desc Verify getType().getName() returns 'i32' for IntField.val (basic int type)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField>();
      let field = cls.getStaticField('val');
      expect(field!.getType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_0200
     * @tc.name testStaticFieldGetTypeAtTwo002
     * @tc.desc Verify getType().getName() returns 'std.core.String' for StrField.val (string type)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StrField>();
      let field = cls.getStaticField('val');
      expect(field!.getType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_0300
     * @tc.name testStaticFieldGetTypeAtTwo003
     * @tc.desc Verify getType().getName() returns same type for TwoIntField.val1 and val2 (both i32)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoIntField>();
      let f1 = cls.getStaticField('val1');
      let f2 = cls.getStaticField('val2');
      expect(f1!.getType().getName()).assertEqual(f2!.getType().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_0400
     * @tc.name testStaticFieldGetTypeAtTwo004
     * @tc.desc Verify getType().getName() unchanged before and after setValue(999) on IntField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField>();
      let field = cls.getStaticField('val');
      let nameBefore = field!.getType().getName();
      field!.setValue(999);
      let nameAfter = field!.getType().getName();
      expect(nameAfter).assertEqual(nameBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_0500
     * @tc.name testStaticFieldGetTypeAtTwo005
     * @tc.desc Verify getType().getName() unchanged before and after setValue(100) on LongField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<LongField>();
      let field = cls.getStaticField('val');
      let nameBefore = field!.getType().getName();
      let v: long = 100;
      field!.setValue(v);
      let nameAfter = field!.getType().getName();
      expect(nameAfter).assertEqual(nameBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_0600
     * @tc.name testStaticFieldGetTypeAtTwo006
     * @tc.desc Verify getType().getName() returns same name after setValue on FloatField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FloatField>();
      let field = cls.getStaticField('val');
      let nameBefore = field!.getType().getName();
      field!.setValue(3.14f);
      let nameAfter = field!.getType().getName();
      expect(nameAfter).assertEqual(nameBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_0700
     * @tc.name testStaticFieldGetTypeAtTwo007
     * @tc.desc Verify getType().getName() returns same name after setValue on DoubleField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DoubleField>();
      let field = cls.getStaticField('val');
      let nameBefore = field!.getType().getName();
      field!.setValue(Number.MAX_VALUE);
      let nameAfter = field!.getType().getName();
      expect(nameAfter).assertEqual(nameBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_0800
     * @tc.name testStaticFieldGetTypeAtTwo008
     * @tc.desc Verify getType().getName() returns 'u1' after setValue(false) on BoolField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BoolField>();
      let field = cls.getStaticField('val');
      let nameBefore = field!.getType().getName();
      field!.setValue(false);
      let nameAfter = field!.getType().getName();
      expect(nameAfter).assertEqual(nameBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_0900
     * @tc.name testStaticFieldGetTypeAtTwo009
     * @tc.desc Verify getType().getName() returns same name after setValue on StrField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StrField>();
      let field = cls.getStaticField('val');
      let nameBefore = field!.getType().getName();
      field!.setValue('newValue');
      let nameAfter = field!.getType().getName();
      expect(nameAfter).assertEqual(nameBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_1000
     * @tc.name testStaticFieldGetTypeAtTwo010
     * @tc.desc Verify getType().getName() returns fully qualified class name for MyClass054.customField
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass054>();
      let field = cls.getStaticField('customField');
      expect(field!.getType().getName()).assertEqual('entry.src.main.src.test.StaticField.StaticFieldGetTypeTest2.test.CustomType053');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_1100
     * @tc.name testStaticFieldGetTypeAtTwo011
     * @tc.desc Verify getType returns different types for MyClass057.fieldA (TypeA055) and fieldB (TypeB056)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass057>();
      let f1 = cls.getStaticField('fieldA');
      let f2 = cls.getStaticField('fieldB');
      expect(f1!.getType().getName()).assertEqual('entry.src.main.src.test.StaticField.StaticFieldGetTypeTest2.test.TypeA055');
      expect(f2!.getType().getName()).assertEqual('entry.src.main.src.test.StaticField.StaticFieldGetTypeTest2.test.TypeB056');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_1200
     * @tc.name testStaticFieldGetTypeAtTwo012
     * @tc.desc Verify getType().getName() returns fully qualified class name for MyClass061.cf (custom type field)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass061>();
      let field = cls.getStaticField('cf');
      expect(field!.getType().getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldGetTypeTest2.test.CustomType060',
      );
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_1300
     * @tc.name testStaticFieldGetTypeAtTwo013
     * @tc.desc Verify getType unchanged after setValue on MyClass063.cf (CustomType062)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass063>();
      let field = cls.getStaticField('cf');
      let nameBefore = field!.getType().getName();
      let newInst: CustomType062 = new CustomType062();
      newInst.val = 99;
      field!.setValue(newInst);
      let nameAfter = field!.getType().getName();
      expect(nameAfter).assertEqual(nameBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_1400
     * @tc.name testStaticFieldGetTypeAtTwo014
     * @tc.desc Verify getType().getName() returns fully qualified type name for MyClass065.cf (CustomType064)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass065>();
      let field = cls.getStaticField('cf');
      let t = field!.getType();
      let name = t.getName();
      expect(name).assertEqual('entry.src.main.src.test.StaticField.StaticFieldGetTypeTest2.test.CustomType064');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_1500
     * @tc.name testStaticFieldGetTypeAtTwo015
     * @tc.desc Verify getType().getName() returns fully qualified name for MyClass067.cf (CustomType066)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass067>();
      let field = cls.getStaticField('cf');
      let typeName = field!.getType().getName();
      expect(typeName).assertEqual('entry.src.main.src.test.StaticField.StaticFieldGetTypeTest2.test.CustomType066');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_1600
     * @tc.name testStaticFieldGetTypeAtTwo016
     * @tc.desc Verify getType().getName() returns 'std.core.Array' for int array field MyClass068.intArr
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass068>();
      let field = cls.getStaticField('intArr');
      expect(field!.getType().getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_1700
     * @tc.name testStaticFieldGetTypeAtTwo017
     * @tc.desc Verify getType().getName() returns 'std.core.Array' for MyClass070.strArr (string array field)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass070>();
      let field = cls.getStaticField('strArr');
      let name = field!.getType().getName();
      expect(name).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_1800
     * @tc.name testStaticFieldGetTypeAtTwo018
     * @tc.desc Verify getType().getName() returns 'i32' for IntField.val after checking field itself is non-null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField>();
      let field = cls.getStaticField('val');
      expect(field).not().assertNull();
      expect(field!.getType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_1900
     * @tc.name testStaticFieldGetTypeAtTwo019
     * @tc.desc Verify getType returns same type for MyClass082 fields pub, priv, prot (all i32)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass082>();
      let pubName = cls.getStaticField('pub')!.getType().getName();
      let privName = cls.getStaticField('priv')!.getType().getName();
      let protName = cls.getStaticField('prot')!.getType().getName();
      expect(privName).assertEqual(pubName);
      expect(protName).assertEqual(pubName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_2000
     * @tc.name testStaticFieldGetTypeAtTwo020
     * @tc.desc Verify getType().getName() returns 'i32' for parent and 'std.core.String' for overridden child field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<Child_Parent089>();
      let parentCls = Class.from<Parent089>();
      let parentField = parentCls.getStaticField('val');
      let childField = childCls.getStaticField('val');
      expect(parentField!.getType().getName()).assertEqual('i32');
      expect(childField!.getType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_2100
     * @tc.name testStaticFieldGetTypeAtTwo021
     * @tc.desc Verify getType() does not change field value for IntField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField>();
      let field = cls.getStaticField('val');
      let valBefore = field!.getValue();
      field!.getType();
      let valAfter = field!.getValue();
      expect(valAfter as Object).assertEqual(valBefore as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_2200
     * @tc.name testStaticFieldGetTypeAtTwo022
     * @tc.desc Verify getType() does not change field owner for IntField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField>();
      let field = cls.getStaticField('val');
      let ownerBefore = field!.getOwner().getName();
      field!.getType();
      let ownerAfter = field!.getOwner().getName();
      expect(ownerAfter).assertEqual(ownerBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_2300
     * @tc.name testStaticFieldGetTypeAtTwo023
     * @tc.desc Verify getType() does not change field name for IntField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField>();
      let field = cls.getStaticField('val');
      let nameBefore = field!.getName();
      field!.getType();
      let nameAfter = field!.getName();
      expect(nameAfter).assertEqual(nameBefore);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_2400
     * @tc.name testStaticFieldGetTypeAtTwo024
     * @tc.desc Verify getStaticField on non-existent field "nonExistentField" returns a non-null field object without throwing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField>();
      let field = cls.getStaticField('nonExistentField');
      expect(field).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_2500
     * @tc.name testStaticFieldGetTypeAtTwo025
     * @tc.desc Verify getType().getName() returns 'i32' and 'i64' for MyClass103.intF and MyClass103.longF
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass103>();
      let intName = cls.getStaticField('intF')!.getType().getName();
      let longName = cls.getStaticField('longF')!.getType().getName();
      expect(intName).assertEqual('i32');
      expect(longName).assertEqual('i64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_2600
     * @tc.name testStaticFieldGetTypeAtTwo026
     * @tc.desc Verify getType().getName() returns different types for IntStrField.val1 ('i32') and IntStrField.val2 ('std.core.String')
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntStrField>();
      let intName = cls.getStaticField('val1')!.getType().getName();
      let strName = cls.getStaticField('val2')!.getType().getName();
      expect(intName).assertEqual('i32');
      expect(strName).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_2700
     * @tc.name testStaticFieldGetTypeAtTwo027
     * @tc.desc Verify getType().getName() returns 'u1' for MyClass107.boolF and full type for MyClass107.customF (CustomT106)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass107>();
      let boolName = cls.getStaticField('boolF')!.getType().getName();
      let customName = cls.getStaticField('customF')!.getType().getName();
      expect(boolName).assertEqual('u1');
      expect(customName).assertEqual('entry.src.main.src.test.StaticField.StaticFieldGetTypeTest2.test.CustomT106');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_2800
     * @tc.name testStaticFieldGetTypeAtTwo028
     * @tc.desc Verify getType().getName() returns 'i32' for IntField.val and 'std.core.Array' for IntField.intArr
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField>();
      let scalarName = cls.getStaticField('val')!.getType().getName();
      let arrName = cls.getStaticField('intArr')!.getType().getName();
      expect(scalarName).assertEqual('i32');
      expect(arrName).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_2900
     * @tc.name testStaticFieldGetTypeAtTwo029
     * @tc.desc Verify getType().isEnum() returns true for enum typed static field (NewEnumFieldClass.status)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NewEnumFieldClass>();
      let field = cls.getStaticField('status');
      let ft = field!.getType();
      expect(ft.isEnum()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_3000
     * @tc.name testStaticFieldGetTypeAtTwo030
     * @tc.desc Verify getType().isEnum() returns false for int static field (IntField.val)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField>();
      let field = cls.getStaticField('val');
      let ft = field!.getType();
      expect(ft.isEnum()).assertFalse();
    });

    
    
    
    
    
    
    
    
    
    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_3100
     * @tc.name testStaticFieldGetTypeAtTwo031
     * @tc.desc Verify getType() returns non-null and getName returns 'i32' for NewAbstractClass.absField (int type field)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NewAbstractClass>();
      let field = cls.getStaticField('absField');
      let ft = field!.getType();
      expect(ft.getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_3200
     * @tc.name testStaticFieldGetTypeAtTwo032
     * @tc.desc Verify getType().getDescriptor() for int static field (IntField.val) returns 'I'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField>();
      let field = cls.getStaticField('val');
      let desc: string = field!.getType().getDescriptor();
      expect(desc).assertEqual('I');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_3300
     * @tc.name testStaticFieldGetTypeAtTwo033
     * @tc.desc Verify getType().getDescriptor() for string static field (StrField.val) returns 'Lstd/core/String;'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StrField>();
      let field = cls.getStaticField('val');
      let desc: string = field!.getType().getDescriptor();
      expect(desc).assertEqual('Lstd/core/String;');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_3400
     * @tc.name testStaticFieldGetTypeAtTwo034
     * @tc.desc Verify getType().getSuper() returns defined for child class static field (NewChildGetType.childVal)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NewChildGetType>();
      let field = cls.getStaticField('childVal');
      let superType = field!.getType().getSuper();
      expect(superType).not().assertNull();
      expect(superType!.getName()).assertEqual('entry.src.main.src.test.StaticField.StaticFieldGetTypeTest2.test.NewParentGetType');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_3500
     * @tc.name testStaticFieldGetTypeAtTwo035
     * @tc.desc Verify getType().getInterfaces() returns array for interface-implementing class static field (NewImplClass.implVal)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NewImplClass>();
      let field = cls.getStaticField('implVal');
      let interfaces = field!.getType().getInterfaces();
      expect(interfaces).not().assertNull();
      expect(interfaces!.length).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_3600
     * @tc.name testStaticFieldGetTypeAtTwo036
     * @tc.desc Verify getType().getUnionConstituentTypes() for NewMultiUnionClass.multiVal returns array with length 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NewMultiUnionClass>();
      let field = cls.getStaticField('multiVal');
      let types = field!.getType().getUnionConstituentTypes()!;
      expect(types.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_3700
     * @tc.name testStaticFieldGetTypeAtTwo037
     * @tc.desc Verify getType().getName() returns std.core.String for static readonly string field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<GetTypeReadonlyRo>().getStaticField('roVal');
      expect(field!.getType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_3800
     * @tc.name testStaticFieldGetTypeAtTwo038
     * @tc.desc Verify getType().getName() returns 'u16' for Unicode non-ASCII char field (UnicodeCharField.val)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<UnicodeCharField>();
      let field = cls.getStaticField('val');
      let name = field!.getType().getName();
      expect(name).assertEqual('u16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_3900
     * @tc.name testStaticFieldGetTypeAtTwo039
     * @tc.desc Verify Unicode non-ASCII char field and ASCII char field have identical type name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let unicodeCls = Class.from<UnicodeCharField>();
      let asciiCls = Class.from<CharField>();
      let unicodeName = unicodeCls.getStaticField('val')!.getType().getName();
      let asciiName = asciiCls.getStaticField('val')!.getType().getName();
      expect(unicodeName).assertEqual(asciiName);
    });
/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_4000
     * @tc.name testStaticFieldGetTypeAtTwo040
     * @tc.desc Verify getType().getName() returns 'i16' for ShortField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ShortField>();
      let field = cls.getStaticField('val');
      expect(field!.getType().getName()).assertEqual('i16');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_4100
     * @tc.name testStaticFieldGetTypeAtTwo041
     * @tc.desc Verify getType().getName() returns 'i8' for ByteField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ByteField>();
      let field = cls.getStaticField('val');
      expect(field!.getType().getName()).assertEqual('i8');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_4200
     * @tc.name testStaticFieldGetTypeAtTwo042
     * @tc.desc Verify getType().getName() returns 'f32' for FloatField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FloatField>();
      let field = cls.getStaticField('val');
      expect(field!.getType().getName()).assertEqual('f32');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_4300
     * @tc.name testStaticFieldGetTypeAtTwo043
     * @tc.desc Verify getType().getName() returns 'f32' for MyClass026.floatNaN (float NaN field)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass026>();
      let field = cls.getStaticField('floatNaN');
      expect(field!.getType().getName()).assertEqual('f32');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_4400
     * @tc.name testStaticFieldGetTypeAtTwo044
     * @tc.desc Verify getType().getName() returns 'f32' for MyClass027.floatInf (float Infinity field)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass027>();
      let field = cls.getStaticField('floatInf');
      expect(field!.getType().getName()).assertEqual('f32');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_4500
     * @tc.name testStaticFieldGetTypeAtTwo045
     * @tc.desc Verify getType().getName() returns 'f64' for DoubleField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DoubleField>();
      let field = cls.getStaticField('val');
      expect(field!.getType().getName()).assertEqual('f64');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_4600
     * @tc.name testStaticFieldGetTypeAtTwo046
     * @tc.desc Verify getType().getName() returns 'f64' for MyClass031.doubleNaN (double NaN field)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass031>();
      let field = cls.getStaticField('doubleNaN');
      expect(field!.getType().getName()).assertEqual('f64');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_4700
     * @tc.name testStaticFieldGetTypeAtTwo047
     * @tc.desc Verify getType().getName() returns 'f64' for MyClass032.doubleMax (double MAX_VALUE field)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass032>();
      let field = cls.getStaticField('doubleMax');
      expect(field!.getType().getName()).assertEqual('f64');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_4800
     * @tc.name testStaticFieldGetTypeAtTwo048
     * @tc.desc Verify getType().getName() returns 'f64' for MyClass033.doubleNegInf (double -Infinity field)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass033>();
      let field = cls.getStaticField('doubleNegInf');
      expect(field!.getType().getName()).assertEqual('f64');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_4900
     * @tc.name testStaticFieldGetTypeAtTwo049
     * @tc.desc Verify getType().getName() returns 'i16' for MyClass108.shortF and 'i8' for MyClass108.byteF
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass108>();
      let shortName = cls.getStaticField('shortF')!.getType().getName();
      let byteName = cls.getStaticField('byteF')!.getType().getName();
      expect(shortName).assertEqual('i16');
      expect(byteName).assertEqual('i8');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_5000
     * @tc.name testStaticFieldGetTypeAtTwo050
     * @tc.desc Verify getType for MyClass112._internal (underscore field) returns 'i32'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass112>();
      let field = cls.getStaticField('_internal');
      expect(field!.getType().getName()).assertEqual('i32');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_5100
     * @tc.name testStaticFieldGetTypeAtTwo051
     * @tc.desc Verify getType().getDescriptor() for double static field (DoubleField.val) returns 'D'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DoubleField>();
      let field = cls.getStaticField('val');
      let desc: string = field!.getType().getDescriptor();
      expect(desc).assertEqual('D');
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_GETTYPE_TWO_5200
     * @tc.name testStaticFieldGetTypeAtTwo052
     * @tc.desc Verify getType().getDescriptor() for boolean static field (BoolField.val) returns 'Z'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldGetTypeAtTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BoolField>();
      let field = cls.getStaticField('val');
      let desc: string = field!.getType().getDescriptor();
      expect(desc).assertEqual('Z');
    });

  });
}

