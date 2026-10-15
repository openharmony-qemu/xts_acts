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
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

class ValField {
  public static val: int = 1;
}

class CountField {
  public static count: int = 0;
}

class ZeroValField {
  public static val: int = 0;
}

class FalseFlagField {
  public static flag: boolean = false;
}

class TrueFlagField {
  public static flag: boolean = true;
}

class BigValField {
  public static bigVal: long = 1;
}

class ZeroDoubleField {
  public static val: double = 0.0;
}

class A008 {
  public static val: int = 42;
}

class A011 {
  public static count: int = 10;
}

class Parent033 {
  public static family: string = 'core';
}

class Parent034 {
  public static tag: int = 1;
}

class A042 {
  public static x: int = 1;
  public static y: int = 2;
}

class A080 {
  public static readonly NAME: string = 'fixed';
}

class A081 {
  public static readonly ENABLED: boolean = true;
}

class A082 {
  public static readonly PI: double = 3.14;
}

class A083 {
  public static readonly MAX_ID: bigint = 999n;
}

class A097 {
  public static text: string = '';
}

class Child_Parent033 extends Parent033 {
  public static own: int = 1;
}

class SecretField {
  public static secret: string = 'hidden';
}

class TitleField {
  public static title: string = 'hello';
}

class NameField {
  public static name: string = 'test';
}

class Count42Field {
  public static count: int = 42;
}

class PiField {
  public static pi: double = 3.14;
}

class HelloNameField {
  public static name: string = 'hello';
}

class OldNameField {
  public static name: string = 'old';
}

class Fixture003 {
  public static userName: string = 'alice';
}

class Fixture022 {
  public static a: int = 1;
  public static b: int = 2;
}

class Fixture023 {
  public static a: int = 1;
  public static b: string = 's';
}

class Fixture038 {
  public static readonly CONST: int = 100;
}

class Fixture041 {
  public static mutable: int = 0;
}

class Fixture085 {
  public static protVal: int = 99;
}

class Fixture088 {
  public static zero: int = 0;
}

class Fixture089 {
  public static neg: int = -1;
}

let pc034 = Class.from<Parent034>();

export default function staticFieldOverviewTest2(): void {
  describe('StaticFieldOverviewTest2', (): void => {
    beforeAll(() => {});

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_0100
     * @tc.name testStaticFieldOverviewAtTwo001
     * @tc.desc Verify isReadonly() returns false for ValField.val (non-readonly public int field, via intermediate variable)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValField>();
      let f = cls.getStaticField('val');
      let r: boolean = f!.isReadonly();
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_0200
     * @tc.name testStaticFieldOverviewAtTwo002
     * @tc.desc Verify isPublic returns true for ValField.val (integer field)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValField>();
      let f = cls.getStaticField('val');
      let r: boolean = f!.isPublic();
      expect(r).assertTrue();
    });

    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_0300
     * @tc.name testStaticFieldOverviewAtTwo003
     * @tc.desc Verify getType() returns non-null type for ValField.val (public int field)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValField>();
      let f = cls.getStaticField('val');
      let t = f!.getType();
      expect(t.getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_0400
     * @tc.name testStaticFieldOverviewAtTwo004
     * @tc.desc Verify getOwner() returns non-null owner for ValField.val (public int field)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValField>();
      let f = cls.getStaticField('val');
      let o = f!.getOwner();
      expect(o.getName()).assertEqual('entry.src.main.src.test.StaticField.StaticFieldOverviewTest2.test.ValField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_0500
     * @tc.name testStaticFieldOverviewAtTwo005
     * @tc.desc Verify getName returns "val" for ValField.val static field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValField>();
      let f = cls.getStaticField('val');
      let n: string = f!.getName();
      expect(n).assertEqual('val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_0600
     * @tc.name testStaticFieldOverviewAtTwo006
     * @tc.desc Verify getValue() on A008.val static field returns expected default value 42
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<A008>();
      let f = cls.getStaticField('val');
      let v = f!.getValue() as Object;
      expect(v).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_0700
     * @tc.name testStaticFieldOverviewAtTwo007
     * @tc.desc Verify equals returns true for two getStaticField("val") calls on ValField (same logical field)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValField>();
      let f1 = cls.getStaticField('val');
      let f2 = cls.getStaticField('val');
      let r: boolean = f1!.equals(f2!);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_0800
     * @tc.name testStaticFieldOverviewAtTwo008
     * @tc.desc Verify setValue(99) on ZeroValField.val then getValue returns 99
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ZeroValField>();
      let f = cls.getStaticField('val');
      f!.setValue(99);
      expect(f!.getValue() as Object).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_0900
     * @tc.name testStaticFieldOverviewAtTwo009
     * @tc.desc Verify getStaticField returns non-null for A011.count
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<A011>();
      let f = cls.getStaticField('count');
      expect(f).not().assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_1000
     * @tc.name testStaticFieldOverviewAtTwo010
     * @tc.desc Verify getStaticField returns undefined for non-existent field nonexistent on CountField
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CountField>();
      let f = cls.getStaticField('nonexistent');
      expect(f).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_1100
     * @tc.name testStaticFieldOverviewAtTwo011
     * @tc.desc Verify equals returns false for Child_Parent033.own vs Parent034.tag
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cc = Class.from<Child_Parent033>();
      let fParent034033 = pc034.getStaticField('tag');
      let fChild = cc.getStaticField('own');
      let r: boolean = fChild!.equals(fParent034033!);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_1200
     * @tc.name testStaticFieldOverviewAtTwo012
     * @tc.desc Verify equals returns true after setValue(999) on ZeroValField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ZeroValField>();
      let f1 = cls.getStaticField('val');
      f1!.setValue(999);
      let f2 = cls.getStaticField('val');
      let r: boolean = f1!.equals(f2!);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_1300
     * @tc.name testStaticFieldOverviewAtTwo013
     * @tc.desc Verify symmetric equals: A042.x.equals(A042.y) equals A042.y.equals(A042.x)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<A042>();
      let fx = cls.getStaticField('x');
      let fy = cls.getStaticField('y');
      let r1: boolean = fx!.equals(fy!);
      let r2: boolean = fy!.equals(fx!);
      expect(r1).assertFalse();
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_1400
     * @tc.name testStaticFieldOverviewAtTwo014
     * @tc.desc Verify setValue("new") on A080.NAME readonly string field throws TypeError (cannot modify readonly field)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<A080>();
      let f = cls.getStaticField('NAME');
      try {
        f!.setValue('new');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_1500
     * @tc.name testStaticFieldOverviewAtTwo015
     * @tc.desc Verify setValue(false) on A081.ENABLED readonly boolean field throws TypeError (cannot modify readonly field)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<A081>();
      let f = cls.getStaticField('ENABLED');
      try {
        f!.setValue(false);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_1600
     * @tc.name testStaticFieldOverviewAtTwo016
     * @tc.desc Verify setValue(2.71) on A082.PI readonly double field throws TypeError (cannot modify readonly field)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<A082>();
      let f = cls.getStaticField('PI');
      try {
        f!.setValue(2.71);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_1700
     * @tc.name testStaticFieldOverviewAtTwo017
     * @tc.desc Verify setValue(1000) on A083.MAX_ID readonly bigint field throws TypeError (cannot modify readonly field)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<A083>();
      let f = cls.getStaticField('MAX_ID');
      try {
        f!.setValue(1000);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_1800
     * @tc.name testStaticFieldOverviewAtTwo018
     * @tc.desc Verify setValue(42) on ZeroValField.val then getValue returns 42 (int field setValue and getValue roundtrip)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ZeroValField>();
      let f = cls.getStaticField('val');
      f!.setValue(42);
      let v = f!.getValue() as Object;
      expect(v).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_1900
     * @tc.name testStaticFieldOverviewAtTwo019
     * @tc.desc Verify setValue(3.14) on ZeroDoubleField.val then getValue returns 3.14 (double field setValue and getValue roundtrip)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ZeroDoubleField>();
      let f = cls.getStaticField('val');
      f!.setValue(3.14);
      let v = f!.getValue() as Object;
      expect(v).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_2000
     * @tc.name testStaticFieldOverviewAtTwo020
     * @tc.desc Verify setValue(10) then setValue(20) then getValue returns 20 on ZeroValField.val (consecutive overwrite)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ZeroValField>();
      let f = cls.getStaticField('val');
      f!.setValue(10);
      f!.setValue(20);
      expect(f!.getValue() as Object).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_2100
     * @tc.name testStaticFieldOverviewAtTwo021
     * @tc.desc Verify setValue(true) then setValue(false) on TrueFlagField.flag then getValue returns false (boolean field toggle)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TrueFlagField>();
      let f = cls.getStaticField('flag');
      f!.setValue(true);
      f!.setValue(false);
      expect(f!.getValue() as Object).assertEqual(false);
      f!.setValue(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_2200
     * @tc.name testStaticFieldOverviewAtTwo022
     * @tc.desc Verify setValue with 1000-character string then getValue roundtrip on A097.text
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<A097>();
      let f = cls.getStaticField('text');
      let longStr: string = 'a'.repeat(1000);
      f!.setValue(longStr);
      expect(f!.getValue() as Object).assertEqual(longStr);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_2300
     * @tc.name testStaticFieldOverviewAtTwo023
     * @tc.desc Verify getName() returns 'userName' for Fixture003.userName static field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Fixture003>();
      let field = cls.getStaticField('userName');
      expect(field!.getName()).assertEqual('userName');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_2400
     * @tc.name testStaticFieldOverviewAtTwo024
     * @tc.desc Verify getType().getName() returns 'std.core.String' for TitleField.title static field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TitleField>();
      let field = cls.getStaticField('title');
      let typeName: string = field!.getType().getName();
      expect(typeName).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_2500
     * @tc.name testStaticFieldOverviewAtTwo025
     * @tc.desc Verify getName() returns 'title' after calling getType() on TitleField.title static field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TitleField>();
      let field = cls.getStaticField('title');
      field!.getType().getName();
      let name: string = field!.getName();
      expect(name).assertEqual('title');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_2600
     * @tc.name testStaticFieldOverviewAtTwo026
     * @tc.desc Verify getType().getName() returns 'std.core.String' for NameField.name static field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NameField>();
      let field = cls.getStaticField('name');
      expect(field!.getType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_2700
     * @tc.name testStaticFieldOverviewAtTwo027
     * @tc.desc Verify getType().getName() returns 'i32' for CountField.count int static field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CountField>();
      let field = cls.getStaticField('count');
      expect(field!.getType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_2800
     * @tc.name testStaticFieldOverviewAtTwo028
     * @tc.desc Verify fA.getType().getName() equals fB.getType().getName() for Fixture022
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Fixture022>();
      let fA = cls.getStaticField('a');
      let fB = cls.getStaticField('b');
      expect(fA!.getType().getName()).assertEqual('i32');
      expect(fB!.getType().getName()).assertEqual('i32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_2900
     * @tc.name testStaticFieldOverviewAtTwo029
     * @tc.desc Verify fA.getType().getName() not equals fB.getType().getName() for Fixture023
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Fixture023>();
      let fA = cls.getStaticField('a');
      let fB = cls.getStaticField('b');
      expect(fA!.getType().getName()).not().assertEqual(fB!.getType().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_3000
     * @tc.name testStaticFieldOverviewAtTwo030
     * @tc.desc Verify getOwner().getName() returns full class path for NameField.name static field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NameField>();
      let field = cls.getStaticField('name');
      expect(field!.getOwner().getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldOverviewTest2.test.NameField',
      );
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_3100
     * @tc.name testStaticFieldOverviewAtTwo031
     * @tc.desc Verify two fields in same class share same owner
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Fixture023>();
      let fA = cls.getStaticField('a');
      let fB = cls.getStaticField('b');
      expect(fA!.getOwner().getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldOverviewTest2.test.Fixture023',
      );
      expect(fB!.getOwner().getName()).assertEqual(
        'entry.src.main.src.test.StaticField.StaticFieldOverviewTest2.test.Fixture023',
      );
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_3200
     * @tc.name testStaticFieldOverviewAtTwo032
     * @tc.desc Verify isReadonly() returns false for Fixture041.mutable non-readonly static field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Fixture041>();
      let field = cls.getStaticField('mutable');
      expect(field!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_3300
     * @tc.name testStaticFieldOverviewAtTwo033
     * @tc.desc Verify isReadonly() returns true for Fixture038.CONST (direct one-liner assertion)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Fixture038>();
      let field = cls.getStaticField('CONST');
      expect(field!.isReadonly()).assertTrue();
    });

    
    
    
    
    
    
    
    
    
    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_3400
     * @tc.name testStaticFieldOverviewAtTwo034
     * @tc.desc Verify getValue() returns 42 for Count42Field.count int static field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Count42Field>();
      let field = cls.getStaticField('count');
      let val = field!.getValue();
      expect(val as Object).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_3500
     * @tc.name testStaticFieldOverviewAtTwo035
     * @tc.desc Verify getValue() returns 'hello' for HelloNameField.name string static field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<HelloNameField>();
      let field = cls.getStaticField('name');
      let val = field!.getValue();
      expect(val as Object).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_3600
     * @tc.name testStaticFieldOverviewAtTwo036
     * @tc.desc Verify getValue() returns true for TrueFlagField.flag boolean static field (declared initial value)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TrueFlagField>();
      let field = cls.getStaticField('flag');
      let val = field!.getValue();
      expect(val as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_3700
     * @tc.name testStaticFieldOverviewAtTwo037
     * @tc.desc Verify getValue() returns 3.14 for PiField.pi double static field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PiField>();
      let field = cls.getStaticField('pi');
      expect(field!.getValue() as Object).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_3800
     * @tc.name testStaticFieldOverviewAtTwo038
     * @tc.desc Verify getValue() returns false for FalseFlagField.flag boolean static field (declared initial value)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FalseFlagField>();
      let field = cls.getStaticField('flag');
      expect(field!.getValue() as Object).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_3900
     * @tc.name testStaticFieldOverviewAtTwo039
     * @tc.desc Verify getValue() returns 1 for BigValField.bigVal long static field (declared initial value)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BigValField>();
      let field = cls.getStaticField('bigVal');
      expect(field!.getValue() as Object).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_4000
     * @tc.name testStaticFieldOverviewAtTwo040
     * @tc.desc Verify getValue() returns 'hidden' for SecretField.secret static field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SecretField>();
      let field = cls.getStaticField('secret');
      expect(field!.getValue() as Object).assertEqual('hidden');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_4100
     * @tc.name testStaticFieldOverviewAtTwo041
     * @tc.desc Verify getValue() returns 99 for Fixture085.protVal static field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Fixture085>();
      let field = cls.getStaticField('protVal');
      expect(field!.getValue() as Object).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_4200
     * @tc.name testStaticFieldOverviewAtTwo042
     * @tc.desc Verify getValue() returns 0 for Fixture088.zero int static field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Fixture088>();
      let field = cls.getStaticField('zero');
      expect(field!.getValue() as Object).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_4300
     * @tc.name testStaticFieldOverviewAtTwo043
     * @tc.desc Verify getValue returns -1 for Fixture089
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Fixture089>();
      let field = cls.getStaticField('neg');
      expect(field!.getValue() as Object).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_4400
     * @tc.name testStaticFieldOverviewAtTwo044
     * @tc.desc Verify equals() returns false when comparing Fixture023.a and Fixture023.b different fields
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Fixture023>();
      let fA = cls.getStaticField('a');
      let fB = cls.getStaticField('b');
      expect(fA!.equals(fB!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_4500
     * @tc.name testStaticFieldOverviewAtTwo045
     * @tc.desc Verify equals() returns true while === returns false for two references to CountField.count
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CountField>();
      let f1 = cls.getStaticField('count');
      let f2 = cls.getStaticField('count');
      let eqResult: boolean = f1!.equals(f2!);
      let refResult: boolean = f1! === f2!;
      expect(eqResult).assertTrue();
      expect(refResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_4600
     * @tc.name testStaticFieldOverviewAtTwo046
     * @tc.desc Verify setValue('new') then getValue() returns 'new' for OldNameField.name string static field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OldNameField>();
      let field = cls.getStaticField('name');
      field!.setValue('new');
      expect(field!.getValue() as Object).assertEqual('new');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_4700
     * @tc.name testStaticFieldOverviewAtTwo047
     * @tc.desc Verify setValue(5) then setValue(8) results in getValue() returning 8 for CountField.count
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CountField>();
      let field = cls.getStaticField('count');
      field!.setValue(5);
      field!.setValue(8);
      expect(field!.getValue() as Object).assertEqual(8);
      CountField.count = 0;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_4800
     * @tc.name testStaticFieldOverviewAtTwo048
     * @tc.desc Verify consecutive getValue() calls both return 42 for Count42Field.count int static field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Count42Field>();
      let field = cls.getStaticField('count');
      let firstReadValue = field!.getValue() as int;
      let secondReadValue = field!.getValue() as int;
      expect(firstReadValue).assertEqual(42);
      expect(secondReadValue).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_OVERVIEW_TWO_4900
     * @tc.name testStaticFieldOverviewAtTwo049
     * @tc.desc Verify after setValue(100) getName() returns 'count' for CountField.count
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldOverviewAtTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CountField>();
      let field = cls.getStaticField('count');
      field!.setValue(100);
      expect(field!.getName()).assertEqual('count');
      CountField.count = 0;
    });
  });
}
