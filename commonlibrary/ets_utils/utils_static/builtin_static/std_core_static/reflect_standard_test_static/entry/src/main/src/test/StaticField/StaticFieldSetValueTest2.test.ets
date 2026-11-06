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

class ZeroNumField {
  public static val: number = 0;
}

class ZeroDoubleField {
  public static val: double = 0.0;
}

class FalseBoolField {
  public static val: boolean = false;
}

class ZeroLongField {
  public static val: long = 0;
}

class EmptyStrField {
  public static val: string = '';
}

class OneDoubleField {
  public static val: double = 1.0;
}

class IV0006 {
  public static val: number = 999;
}

class BVFalse028 {
  public static val: boolean = true;
}

class BV0029 {
  public static val: long = 999;
}

class NullVal034 {
  public static val: Object | null = new Object();
}

class ROInt049 {
  public static readonly val: number = 42;
}

class RODouble052 {
  public static readonly val: double = 3.14;
}

class ROBigint053 {
  public static readonly val: long = 100;
}

class NewSetFloatField {
  public static val: float = 0.0f;
}

class NewSetCharField {
  public static val: char = c'a';
}

class ValField {
  public static val: int = 0;
}

class NumField {
  public static num: int = 0;
}

class ShortField {
  public static s: short = 0;
}

class ByteField {
  public static b: byte = 0;
}

class EmptyMsgField {
  public static msg: string = '';
}

class FalseFlagField {
  public static flag: boolean = false;
}

class TrueFlagField {
  public static flag: boolean = true;
}

class InitMsgField {
  public static msg: string = 'init';
}

class ParentNameField {
  public static name: string = 'parent_name';
}

class CountField {
  public static count: int = 0;
}

class SetValIntA003 {
  public static num: int = 999;
}

class SetValIntC005 {
  public static num: int = 100;
}

class SyncStrClass039 {
  public static title: string = 'original';
}

class SyncDoubleClass041 {
  public static ratio: double = 1.0;
}

class SyncMultiClass042 {
  public static step: int = 0;
}

class SyncLongClass044 {
  public static bigVal: long = 0;
}

class ParentSyncB046 {
  public static parentField: string = 'old';
}

class NullableToggleClass053 {
  public static nullable: string | null = null;
}

class ChildOverrideB extends ParentNameField {
  public static name: string = 'child_name';
}

class ERD4004 {
  public static readonly ratio: double = 1.5;
}

class ERD10010 {
  public static readonly code: int = 77;
}

class DummyForInt019 {}

class EIT9020 {
  public static num: int = 55;
}

class EST1021 {
  public static msg: string = 'hello';
}

class EST6027 {
  public static msg: string = 'original';
}

class EGT6039 {
  public static big: long = 777;
}

class EDT5045 {
  public static val: double = 3.14;
}

class ECT1_Target053 {
  public static obj: ECT1_Target053 | null = null;
}

class ECT2_Target054 {
  public static instance: ECT2_Target054 | null = null;
}

class ECT3_Target055 {
  public static ref: ECT3_Target055 | null = null;
}

class ECT4_Target056 {
  public static val: ECT4_Target056 | null = null;
}

class ENN4061 {
  public static num: int = 25;
}

class EER1062 {
  public static readonly locked: string = 'protected_value';
}

class EER2063 {
  public static count: int = 100;
}

class EER3064 {
  public static name: string = 'original_name';
}

class EER4065 {
  public static score: int = 85;
}

class EER5066 {
  public static readonly key: int = 1;
}

class EIA1_Parent067 {
  public static readonly parentVal: int = 10;
}

class EIA2_Parent068 {
  public static readonly inherited: string = 'readonly_val';
}

class EIA5_GrandParent071 {
  public static readonly root: int = 1;
}

class EIA7_Parent073 {
  public static label: string = 'original';
}

class EIA9_Parent075 {
  public static value: int = 10;
}

class EIA10_GrandParent076 {
  public static data: int = 1;
}

class ECX3085 {
  public static msg: string = '';
}

class Box087 {
  public val: int;
}

class ECX6088 {
  public static num: int = 42;
}

class EIA2_Child extends EIA2_Parent068 {
}

class EIA4_Parent070 {
  public static value: int = 0;
}

class EIA4_Child extends EIA4_Parent070 {
  public static readonly childReadonly: int = 5;
}

class EIA5_Parent extends EIA5_GrandParent071 {
}

class EIA5_GrandChild extends EIA5_Parent {
}

class EIA6_Parent072 {
  public static num: int = 0;
}

class EIA6_Child extends EIA6_Parent072 {
}

class EIA10_Parent extends EIA10_GrandParent076 {
}

class EIA10_Child extends EIA10_Parent {
}

class DoubleBoundaryField {
  public static val: double = 0.0;
}

class LongStrField {
  public static val: string = '';
}

class RadixField {
  public static val: int = 0;
}

class InstanceFieldClass {
  public instanceVal: int = 42;
}

export default function staticFieldSetValueTest2(): void {
describe('StaticFieldSetValueTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0010
     * @tc.name testStaticFieldSetValueAtTwo001
     * @tc.desc Verify setValue(42.0) on number field then getValue returns 42.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroNumField>().getStaticField('val');
      field!.setValue(42.0);
      expect(field!.getValue() as Object).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0020
     * @tc.name testStaticFieldSetValueAtTwo002
     * @tc.desc Verify setValue("arkts") on string field then getValue returns "arkts"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EmptyStrField>().getStaticField('val');
      field!.setValue('arkts');
      expect(field!.getValue() as Object).assertEqual('arkts');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0030
     * @tc.name testStaticFieldSetValueAtTwo003
     * @tc.desc Verify setValue(true) on boolean field then getValue returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<FalseBoolField>().getStaticField('val');
      field!.setValue(true);
      expect(field!.getValue() as Object).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0040
     * @tc.name testStaticFieldSetValueAtTwo004
     * @tc.desc Verify setValue(3.14) on double field then getValue returns 3.14
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroDoubleField>().getStaticField('val');
      field!.setValue(3.14);
      expect(field!.getValue() as Object).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0050
     * @tc.name testStaticFieldSetValueAtTwo005
     * @tc.desc Verify setValue(999) on long field then getValue returns 999
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroLongField>().getStaticField('val');
      let v: long = 999;
      field!.setValue(v);
      expect(field!.getValue() as Object).assertEqual(v as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0060
     * @tc.name testStaticFieldSetValueAtTwo006
     * @tc.desc Verify setValue(0.0) on number field then getValue returns 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<IV0006>().getStaticField('val');
      field!.setValue(0.0);
      expect(field!.getValue() as Object).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0070
     * @tc.name testStaticFieldSetValueAtTwo007
     * @tc.desc Verify setValue(-1.0) on number field then getValue returns -1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroNumField>().getStaticField('val');
      field!.setValue(-1.0);
      expect(field!.getValue() as Object).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0080
     * @tc.name testStaticFieldSetValueAtTwo008
     * @tc.desc Verify setValue(-1.0) on ZeroNumField.val then direct field access returns -1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroNumField>().getStaticField('val');
      field!.setValue(-1.0);
      expect(ZeroNumField.val).assertEqual(-1.0);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0090
     * @tc.name testStaticFieldSetValueAtTwo009
     * @tc.desc Verify setValue(-0.0) on OneDoubleField.val correctly stores negative zero and getValue returns -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<OneDoubleField>().getStaticField('val');
      field!.setValue(-0.0);
      let result: number = field!.getValue() as number;
      let isNegZero: boolean = (result === 0.0) && ((1.0 / result) === -Double.POSITIVE_INFINITY);
      expect(isNegZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0100
     * @tc.name testStaticFieldSetValueAtTwo010
     * @tc.desc Verify setValue(Number.MAX_VALUE) on ZeroDoubleField.val double field then getValue returns Number.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroDoubleField>().getStaticField('val');
      field!.setValue(Number.MAX_VALUE);
      expect(field!.getValue() as Object).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0110
     * @tc.name testStaticFieldSetValueAtTwo011
     * @tc.desc Verify setValue(Number.MIN_VALUE) on OneDoubleField.val double field then getValue returns Number.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<OneDoubleField>().getStaticField('val');
      field!.setValue(Number.MIN_VALUE);
      expect(field!.getValue() as Object).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0120
     * @tc.name testStaticFieldSetValueAtTwo012
     * @tc.desc Verify setValue(Double.NaN) on ZeroDoubleField.val double field then getValue returns NaN (isNaN assertTrue)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroDoubleField>().getStaticField('val');
      field!.setValue(Double.NaN);
      let result = field!.getValue();
      expect(isNaN(result as number)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0130
     * @tc.name testStaticFieldSetValueAtTwo013
     * @tc.desc Verify setValue(Double.POSITIVE_INFINITY) on ZeroDoubleField.val double field then getValue returns Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroDoubleField>().getStaticField('val');
      field!.setValue(Double.POSITIVE_INFINITY);
      expect(field!.getValue() as Object).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0140
     * @tc.name testStaticFieldSetValueAtTwo014
     * @tc.desc Verify setValue(-Double.POSITIVE_INFINITY) on ZeroDoubleField.val double field then getValue returns -Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroDoubleField>().getStaticField('val');
      field!.setValue(-Double.POSITIVE_INFINITY);
      expect(field!.getValue() as Object).assertEqual(-Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0150
     * @tc.name testStaticFieldSetValueAtTwo015
     * @tc.desc Verify setValue("") on EmptyStrField.val stores empty string and getValue returns ""
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EmptyStrField>().getStaticField('val');
      field!.setValue('');
      expect(field!.getValue() as Object).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0160
     * @tc.name testStaticFieldSetValueAtTwo016
     * @tc.desc Verify setValue with Chinese character on EmptyStrField.val string field then getValue returns the same character
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EmptyStrField>().getStaticField('val');
      field!.setValue('中');
      expect(field!.getValue() as Object).assertEqual('中');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0170
     * @tc.name testStaticFieldSetValueAtTwo017
     * @tc.desc Verify setValue("$field") on EmptyStrField.val stores dollar-sign string and getValue returns "$field"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EmptyStrField>().getStaticField('val');
      field!.setValue('$field');
      expect(field!.getValue() as Object).assertEqual('$field');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0180
     * @tc.name testStaticFieldSetValueAtTwo018
     * @tc.desc Verify setValue(zero-width space U+200B) on EmptyStrField.val string field then getValue returns same
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EmptyStrField>().getStaticField('val');
      field!.setValue('​');
      expect(field!.getValue() as Object).assertEqual('​');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0190
     * @tc.name testStaticFieldSetValueAtTwo019
     * @tc.desc Verify setValue(false) on boolean field then getValue returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<BVFalse028>().getStaticField('val');
      field!.setValue(false);
      expect(field!.getValue() as Object).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0200
     * @tc.name testStaticFieldSetValueAtTwo020
     * @tc.desc Verify setValue(0) on BV0029.val long field then getValue returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<BV0029>().getStaticField('val');
      let v: long = 0;
      field!.setValue(v);
      expect(field!.getValue() as Object).assertEqual(v as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0210
     * @tc.name testStaticFieldSetValueAtTwo021
     * @tc.desc Verify setValue(-1) on ZeroLongField.val long field then getValue returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroLongField>().getStaticField('val');
      let v: long = -1;
      field!.setValue(v);
      expect(field!.getValue() as Object).assertEqual(v as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0220
     * @tc.name testStaticFieldSetValueAtTwo022
     * @tc.desc Verify setValue(9223372036854775807) on ZeroLongField.val long field then getValue returns 9223372036854775807
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroLongField>().getStaticField('val');
      field!.setValue(9223372036854775807);
      expect(field!.getValue() as Object).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0230
     * @tc.name testStaticFieldSetValueAtTwo023
     * @tc.desc Verify setValue(-9223372036854775808) on ZeroLongField.val long field then getValue returns -9223372036854775808
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroLongField>().getStaticField('val');
      field!.setValue(-9223372036854775808);
      expect(field!.getValue() as Object).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0240
     * @tc.name testStaticFieldSetValueAtTwo024
     * @tc.desc Verify setValue(null) on NullVal034.val Object|null field then getValue returns null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<NullVal034>().getStaticField('val');
      field!.setValue(null);
      expect(field!.getValue() as Object | null).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0250
     * @tc.name testStaticFieldSetValueAtTwo025
     * @tc.desc Verify setValue("not_a_number") on ZeroNumField.val number field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroNumField>().getStaticField('val');
      try {
        field!.setValue('not_a_number');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0260
     * @tc.name testStaticFieldSetValueAtTwo026
     * @tc.desc Verify setValue(true) on ZeroNumField.val number field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroNumField>().getStaticField('val');
      try {
        field!.setValue(true);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0270
     * @tc.name testStaticFieldSetValueAtTwo027
     * @tc.desc Verify setValue(1) on ZeroNumField.val number field throws TypeError (int literal not allowed)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroNumField>().getStaticField('val');
      try {
        field!.setValue(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0280
     * @tc.name testStaticFieldSetValueAtTwo028
     * @tc.desc Verify setValue(Double.NaN) on ZeroNumField.val number field then getValue returns NaN (isNaN assertTrue)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroNumField>().getStaticField('val');
      field!.setValue(Double.NaN);
      expect(isNaN(field!.getValue() as number)).assertTrue();
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0290
     * @tc.name testStaticFieldSetValueAtTwo029
     * @tc.desc Verify setValue(42) on EmptyStrField.val string field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EmptyStrField>().getStaticField('val');
      try {
        field!.setValue(42);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0300
     * @tc.name testStaticFieldSetValueAtTwo030
     * @tc.desc Verify setValue(false) on EmptyStrField.val string field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EmptyStrField>().getStaticField('val');
      try {
        field!.setValue(false);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0310
     * @tc.name testStaticFieldSetValueAtTwo031
     * @tc.desc Verify setValue(0) on FalseBoolField.val boolean field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<FalseBoolField>().getStaticField('val');
      try {
        field!.setValue(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0320
     * @tc.name testStaticFieldSetValueAtTwo032
     * @tc.desc Verify setValue("true") on FalseBoolField.val boolean field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<FalseBoolField>().getStaticField('val');
      try {
        field!.setValue('true');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0330
     * @tc.name testStaticFieldSetValueAtTwo033
     * @tc.desc Verify setValue(null) on ZeroNumField.val number field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroNumField>().getStaticField('val');
      try {
        field!.setValue(null);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0340
     * @tc.name testStaticFieldSetValueAtTwo034
     * @tc.desc Verify setValue(new Object()) on ZeroNumField.val number field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroNumField>().getStaticField('val');
      try {
        field!.setValue(new Object());
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0350
     * @tc.name testStaticFieldSetValueAtTwo035
     * @tc.desc Verify setValue(100) on ROInt049.val readonly int field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ROInt049>().getStaticField('val');
      try {
        field!.setValue(100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0360
     * @tc.name testStaticFieldSetValueAtTwo036
     * @tc.desc Verify setValue(2.71) on RODouble052.val readonly double field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<RODouble052>().getStaticField('val');
      try {
        field!.setValue(2.71);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0370
     * @tc.name testStaticFieldSetValueAtTwo037
     * @tc.desc Verify setValue(200) on ROBigint053.val readonly long field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ROBigint053>().getStaticField('val');
      try {
        field!.setValue(200);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0380
     * @tc.name testStaticFieldSetValueAtTwo038
     * @tc.desc Verify setValue(2147483648) on number field then getValue returns same (int32 MAX+1 overflow)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroNumField>().getStaticField('val');
      let ov: number = 2147483647 + 1;
      field!.setValue(ov);
      let result = field!.getValue();
      expect(result as Object).assertEqual(ov as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0390
     * @tc.name testStaticFieldSetValueAtTwo039
     * @tc.desc Verify setValue(-2147483649) on number field then getValue returns same (int32 MIN-1 underflow)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroNumField>().getStaticField('val');
      let uv: number = -2147483648 - 1;
      field!.setValue(uv);
      let result = field!.getValue();
      expect(result as Object).assertEqual(uv as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0400
     * @tc.name testStaticFieldSetValueAtTwo040
     * @tc.desc Verify setValue(9007199254740991.0) on ZeroNumField.val number field then getValue returns 9007199254740991.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroNumField>().getStaticField('val');
      field!.setValue(9007199254740991.0);
      let result = field!.getValue();
      expect(result as Object).assertEqual(9007199254740991.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0410
     * @tc.name testStaticFieldSetValueAtTwo041
     * @tc.desc Verify setValue(Number.MAX_VALUE) on ZeroNumField.val number static field stores and getValue returns Number.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroNumField>().getStaticField('val');
      field!.setValue(Number.MAX_VALUE);
      let result = field!.getValue();
      expect(result as Object).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0420
     * @tc.name testStaticFieldSetValueAtTwo042
     * @tc.desc Verify setValue with long MAX+1 expression 9223372036854775807 + 1 (wraps to Long.MIN) on ZeroLongField.val then getValue returns the wrapped value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroLongField>().getStaticField('val');
      let ovBig: long = 9223372036854775807 + 1;
      field!.setValue(ovBig);
      let result = field!.getValue();
      expect(result as Object).assertEqual(ovBig as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0430
     * @tc.name testStaticFieldSetValueAtTwo043
     * @tc.desc Verify setValue(-9223372036854775809) on ZeroLongField.val long field then getValue returns same (MIN-1 underflow)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroLongField>().getStaticField('val');
      let uvBig: long = -9223372036854775808 - 1;
      field!.setValue(uvBig);
      let result = field!.getValue();
      expect(result as Object).assertEqual(uvBig as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0440
     * @tc.name testStaticFieldSetValueAtTwo044
     * @tc.desc Verify setValue(2.71f) on NewSetFloatField.val float field then getValue returns 2.71f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<NewSetFloatField>().getStaticField('val');
      field!.setValue(2.71f);
      expect(field!.getValue() as Object).assertEqual(2.71f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0450
     * @tc.name testStaticFieldSetValueAtTwo045
     * @tc.desc Verify setValue(c'X') on NewSetCharField.val char field then getValue returns c'X'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<NewSetCharField>().getStaticField('val');
      field!.setValue(c'X');
      expect(field!.getValue() as Object).assertEqual(c'X');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0460
     * @tc.name testStaticFieldSetValueAtTwo046
     * @tc.desc Verify setValue(42) on CountField.count then getValue returns 42
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<CountField>().getStaticField('count');
      field!.setValue(42);
      expect(Class.from<CountField>().getStaticField('count')!.getValue() as Object).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0470
     * @tc.name testStaticFieldSetValueAtTwo047
     * @tc.desc Verify setValue(1) then setValue(2) on CountField.count, getValue returns 2 (last write wins)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<CountField>().getStaticField('count');
      field!.setValue(1);
      field!.setValue(2);
      expect(Class.from<CountField>().getStaticField('count')!.getValue() as Object).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0480
     * @tc.name testStaticFieldSetValueAtTwo048
     * @tc.desc Verify setValue(0) on SetValIntA003.num int field then getValue returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<SetValIntA003>().getStaticField('num');
      field!.setValue(0);
      expect(field!.getValue() as int).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0490
     * @tc.name testStaticFieldSetValueAtTwo049
     * @tc.desc Verify setValue(-1) on SetValIntC005.num int field then getValue returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<SetValIntC005>().getStaticField('num');
      field!.setValue(-1);
      expect(field!.getValue() as int).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0500
     * @tc.name testStaticFieldSetValueAtTwo050
     * @tc.desc Verify setValue(2147483647) on NumField.num int field then getValue returns 2147483647 (INT32_MAX)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<NumField>().getStaticField('num');
      field!.setValue(2147483647);
      expect(field!.getValue() as int).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0510
     * @tc.name testStaticFieldSetValueAtTwo051
     * @tc.desc Verify setValue(-2147483648) on NumField.num then getValue returns -2147483648 (INT32_MIN)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<NumField>().getStaticField('num');
      field!.setValue(-2147483648);
      expect(field!.getValue() as int).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0520
     * @tc.name testStaticFieldSetValueAtTwo052
     * @tc.desc Verify setValue(0xFF) on NumField.num int field then getValue returns 255 (hex literal)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<NumField>().getStaticField('num');
      field!.setValue(0xFF);
      expect(field!.getValue() as int).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0530
     * @tc.name testStaticFieldSetValueAtTwo053
     * @tc.desc Verify setValue("😀🔥" emoji) on EmptyMsgField.msg string field then getValue returns "😀🔥"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EmptyMsgField>().getStaticField('msg');
      field!.setValue('😀🔥');
      expect(field!.getValue() as string).assertEqual('😀🔥');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0540
     * @tc.name testStaticFieldSetValueAtTwo054
     * @tc.desc Verify getValue returns line1\nline2 for EmptyMsgField
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EmptyMsgField>().getStaticField('msg');
      field!.setValue('line1\nline2');
      expect(field!.getValue() as string).assertEqual('line1\nline2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0550
     * @tc.name testStaticFieldSetValueAtTwo055
     * @tc.desc Verify setValue(true) on FalseFlagField.flag boolean field then assertTrue
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<FalseFlagField>().getStaticField('flag');
      field!.setValue(true);
      expect(field!.getValue() as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0560
     * @tc.name testStaticFieldSetValueAtTwo056
     * @tc.desc Verify setValue(false) on TrueFlagField.flag boolean field then assertFalse
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<TrueFlagField>().getStaticField('flag');
      field!.setValue(false);
      expect(field!.getValue() as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0570
     * @tc.name testStaticFieldSetValueAtTwo057
     * @tc.desc Verify setValue(true) then setValue(false) on TrueFlagField.flag, getValue returns false (last write wins)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<TrueFlagField>().getStaticField('flag');
      field!.setValue(true);
      field!.setValue(false);
      expect(field!.getValue() as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0580
     * @tc.name testStaticFieldSetValueAtTwo058
     * @tc.desc Verify setValue(127) on ByteField.b byte field then getValue returns 127 (byte MAX boundary)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ByteField>().getStaticField('b');
      let v: byte = 127;
      field!.setValue(v);
      expect(field!.getValue() as byte).assertEqual(v);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0590
     * @tc.name testStaticFieldSetValueAtTwo059
     * @tc.desc Verify setValue(-128) on ByteField.b byte field then getValue returns -128 (byte MIN boundary)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ByteField>().getStaticField('b');
      let v: byte = -128;
      field!.setValue(v);
      expect(field!.getValue() as byte).assertEqual(v);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0600
     * @tc.name testStaticFieldSetValueAtTwo060
     * @tc.desc Verify setValue(32767) on ShortField.s short field then getValue returns 32767 (short MAX boundary)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ShortField>().getStaticField('s');
      let v: short = 32767;
      field!.setValue(v);
      expect(field!.getValue() as short).assertEqual(v);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0610
     * @tc.name testStaticFieldSetValueAtTwo061
     * @tc.desc Verify setValue(-32768) on ShortField.s short field then getValue returns -32768 (short MIN boundary)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ShortField>().getStaticField('s');
      let v: short = -32768;
      field!.setValue(v);
      expect(field!.getValue() as short).assertEqual(v);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0620
     * @tc.name testStaticFieldSetValueAtTwo062
     * @tc.desc Verify setValue(1) then setValue(2) then setValue(3) on ValField.val, getValue returns 3 (last write wins, triple write)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ValField>().getStaticField('val');
      field!.setValue(1);
      field!.setValue(2);
      field!.setValue(3);
      expect(field!.getValue() as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0630
     * @tc.name testStaticFieldSetValueAtTwo063
     * @tc.desc Verify setValue("first") then setValue("second") on InitMsgField.msg, getValue returns "second"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<InitMsgField>().getStaticField('msg');
      field!.setValue('first');
      field!.setValue('second');
      expect(field!.getValue() as string).assertEqual('second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0640
     * @tc.name testStaticFieldSetValueAtTwo064
     * @tc.desc Verify setValue(99) on CountField.count int field then direct access CountField.count returns 99
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<CountField>().getStaticField('count');
      field!.setValue(99);
      expect(CountField.count).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0650
     * @tc.name testStaticFieldSetValueAtTwo065
     * @tc.desc Verify setValue("updated") on SyncStrClass039.title string field then direct access returns "updated"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<SyncStrClass039>().getStaticField('title');
      field!.setValue('updated');
      expect(SyncStrClass039.title).assertEqual('updated');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0660
     * @tc.name testStaticFieldSetValueAtTwo066
     * @tc.desc Verify setValue(true) on FalseFlagField.flag boolean field then direct access returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<FalseFlagField>().getStaticField('flag');
      field!.setValue(true);
      expect(FalseFlagField.flag).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0670
     * @tc.name testStaticFieldSetValueAtTwo067
     * @tc.desc Verify setValue(2.5) on SyncDoubleClass041.ratio double field then direct access returns 2.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<SyncDoubleClass041>().getStaticField('ratio');
      field!.setValue(2.5);
      expect(SyncDoubleClass041.ratio).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0680
     * @tc.name testStaticFieldSetValueAtTwo068
     * @tc.desc Verify setValue(5) then setValue(10) on SyncMultiClass042.step, SyncMultiClass042.step direct access returns 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<SyncMultiClass042>().getStaticField('step');
      field!.setValue(5);
      field!.setValue(10);
      expect(SyncMultiClass042.step).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0690
     * @tc.name testStaticFieldSetValueAtTwo069
     * @tc.desc Verify setValue(999) on SyncLongClass044.bigVal long field then direct access returns 999
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<SyncLongClass044>().getStaticField('bigVal');
      let v: long = 999;
      field!.setValue(v);
      expect(SyncLongClass044.bigVal).assertEqual(v);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0700
     * @tc.name testStaticFieldSetValueAtTwo070
     * @tc.desc Verify setValue("written") on ParentSyncB046.parentField string field then getValue returns "written"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ParentSyncB046>().getStaticField('parentField');
      field!.setValue('written');
      expect(field!.getValue() as string).assertEqual('written');
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0710
     * @tc.name testStaticFieldSetValueAtTwo071
     * @tc.desc Verify setValue on ChildOverrideB.name does not affect parent class ParentNameField.name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentField = Class.from<ParentNameField>().getStaticField('name');
      parentField!.setValue('parent_name');
      let childField = Class.from<ChildOverrideB>().getStaticField('name');
      childField!.setValue('child_updated');
      expect(ParentNameField.name).assertEqual('parent_name');
    });

    
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0720
     * @tc.name testStaticFieldSetValueAtTwo072
     * @tc.desc Verify setValue(null) then setValue("restored") on NullableToggleClass053.nullable, getValue returns "restored"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<NullableToggleClass053>().getStaticField('nullable');
      field!.setValue(null);
      field!.setValue('restored');
      expect(field!.getValue() as string).assertEqual('restored');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0730
     * @tc.name testStaticFieldSetValueAtTwo073
     * @tc.desc Verify setValue does not change field name (getName unchanged after setValue)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ValField>().getStaticField('val');
      let nameBefore: string = field!.getName();
      field!.setValue(100);
      expect(field!.getName()).assertEqual(nameBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0740
     * @tc.name testStaticFieldSetValueAtTwo074
     * @tc.desc Verify setValue does not change field type (getType unchanged after setValue)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ValField>().getStaticField('val');
      let typeBefore: string = field!.getType().getName();
      field!.setValue(200);
      expect(field!.getType().getName()).assertEqual(typeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0750
     * @tc.name testStaticFieldSetValueAtTwo075
     * @tc.desc Verify setValue does not change field owner (getOwner unchanged after setValue)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ValField>().getStaticField('val');
      let ownerBefore: string = field!.getOwner().getName();
      field!.setValue(300);
      expect(field!.getOwner().getName()).assertEqual(ownerBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0760
     * @tc.name testStaticFieldSetValueAtTwo076
     * @tc.desc Verify setValue does not change readonly status (isReadonly unchanged after setValue)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ValField>().getStaticField('val');
      let roBefore: boolean = field!.isReadonly();
      field!.setValue(400);
      expect(field!.isReadonly()).assertEqual(roBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0770
     * @tc.name testStaticFieldSetValueAtTwo077
     * @tc.desc Verify setValue does not change public status (isPublic unchanged after setValue)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ValField>().getStaticField('val');
      let pubBefore: boolean = field!.isPublic();
      field!.setValue(500);
      expect(field!.isPublic()).assertEqual(pubBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0780
     * @tc.name testStaticFieldSetValueAtTwo078
     * @tc.desc Verify setValue does not change private status (isPrivate unchanged after setValue)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ValField>().getStaticField('val');
      let privBefore: boolean = field!.isPrivate();
      field!.setValue(600);
      expect(field!.isPrivate()).assertEqual(privBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0790
     * @tc.name testStaticFieldSetValueAtTwo079
     * @tc.desc Verify setValue does not change protected status (isProtected unchanged after setValue)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ValField>().getStaticField('val');
      let protBefore: boolean = field!.isProtected();
      field!.setValue(700);
      expect(field!.isProtected()).assertEqual(protBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0800
     * @tc.name testStaticFieldSetValueAtTwo080
     * @tc.desc Verify setValue(9007199254740991.0) on ZeroDoubleField.val double field then getValue returns 9007199254740991.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroDoubleField>().getStaticField('val');
      field!.setValue(9007199254740991.0);
      let result: double = field!.getValue() as double;
      expect(result as Object).assertEqual(9007199254740991.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0810
     * @tc.name testStaticFieldSetValueAtTwo081
     * @tc.desc Verify setValue(9007199254740991+2.0) on ZeroDoubleField.val double field, getValue returns same (precision beyond integer range)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ZeroDoubleField>().getStaticField('val');
      field!.setValue(9007199254740991 + 2.0);
      let result: double = field!.getValue() as double;
      expect(result).assertEqual(9007199254740991.0 + 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0820
     * @tc.name testStaticFieldSetValueAtTwo082
     * @tc.desc Verify setValue on public static readonly double field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ERD4004>().getStaticField('ratio');
      try {
        field!.setValue(3.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0830
     * @tc.name testStaticFieldSetValueAtTwo083
     * @tc.desc Verify setValue(88) on ERD10010.code readonly int field throws TypeError and getValue still returns original 77
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ERD10010>().getStaticField('code');
      try {
        field!.setValue(88);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(field!.getValue() as int).assertEqual(77);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0840
     * @tc.name testStaticFieldSetValueAtTwo084
     * @tc.desc Verify setValue(99) on NumField.num then getValue returns 99
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<NumField>().getStaticField('num');
      field!.setValue(99);
      expect(field!.getValue() as Object).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0850
     * @tc.name testStaticFieldSetValueAtTwo085
     * @tc.desc Verify setValue(3.14) on NumField.num int field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<NumField>().getStaticField('num');
      try {
        field!.setValue(3.14);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0860
     * @tc.name testStaticFieldSetValueAtTwo086
     * @tc.desc Verify setValue(Double.NaN) on NumField.num int field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<NumField>().getStaticField('num');
      try {
        field!.setValue(Double.NaN);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0870
     * @tc.name testStaticFieldSetValueAtTwo087
     * @tc.desc Verify setValue(Double.POSITIVE_INFINITY) on NumField.num int field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<NumField>().getStaticField('num');
      try {
        field!.setValue(Double.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0880
     * @tc.name testStaticFieldSetValueAtTwo088
     * @tc.desc Verify setValue(DummyForInt019 object) on NumField.num int field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: DummyForInt019 = new DummyForInt019();
      let field = Class.from<NumField>().getStaticField('num');
      try {
        field!.setValue(obj);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0890
     * @tc.name testStaticFieldSetValueAtTwo089
     * @tc.desc Verify setValue("bad") on EIT9020.num int field throws TypeError and getValue still returns original 55
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EIT9020>().getStaticField('num');
      try {
        field!.setValue('bad');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(field!.getValue() as int).assertEqual(55);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0900
     * @tc.name testStaticFieldSetValueAtTwo090
     * @tc.desc Verify setValue(123) on EST1021.msg string field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EST1021>().getStaticField('msg');
      try {
        field!.setValue(123);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0910
     * @tc.name testStaticFieldSetValueAtTwo091
     * @tc.desc Verify setValue(999) on EST6027.msg string field throws TypeError and getValue still returns original "original"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EST6027>().getStaticField('msg');
      try {
        field!.setValue(999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(field!.getValue() as string).assertEqual('original');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0920
     * @tc.name testStaticFieldSetValueAtTwo092
     * @tc.desc Verify setValue(0.5) on TrueFlagField.flag boolean field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<TrueFlagField>().getStaticField('flag');
      try {
        field!.setValue(0.5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0930
     * @tc.name testStaticFieldSetValueAtTwo093
     * @tc.desc Verify setValue(0) on TrueFlagField.flag boolean field throws TypeError and getValue still returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<TrueFlagField>().getStaticField('flag');
      field!.setValue(true);
      try {
        field!.setValue(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(field!.getValue() as boolean).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0940
     * @tc.name testStaticFieldSetValueAtTwo094
     * @tc.desc Verify setValue("invalid") on EGT6039.big long field throws TypeError and getValue still returns original 777
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EGT6039>().getStaticField('big');
      try {
        field!.setValue('invalid');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(field!.getValue() as long).assertEqual(777);
      }
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0950
     * @tc.name testStaticFieldSetValueAtTwo095
     * @tc.desc Verify setValue("bad") on EDT5045.val double field throws TypeError and getValue still returns original 3.14
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EDT5045>().getStaticField('val');
      try {
        field!.setValue('bad');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(field!.getValue() as double).assertEqual(3.14);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0960
     * @tc.name testStaticFieldSetValueAtTwo096
     * @tc.desc Verify setValue(500) on ShortField.s short field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ShortField>().getStaticField('s');
      try {
        field!.setValue(500);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0970
     * @tc.name testStaticFieldSetValueAtTwo097
     * @tc.desc Verify setValue(null) on ENN4061.num int field throws TypeError and getValue still returns original 25
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<ENN4061>().getStaticField('num');
      try {
        field!.setValue(null);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(field!.getValue() as int).assertEqual(25);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0980
     * @tc.name testStaticFieldSetValueAtTwo098
     * @tc.desc Verify setValue("hacked") on EER1062.locked readonly string field throws TypeError and field value unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EER1062>().getStaticField('locked');
      try {
        field!.setValue('hacked');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(EER1062.locked).assertEqual('protected_value');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_0990
     * @tc.name testStaticFieldSetValueAtTwo099
     * @tc.desc Verify setValue("not_an_int") on EER2063.count int field throws TypeError and field value unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EER2063>().getStaticField('count');
      try {
        field!.setValue('not_an_int');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(EER2063.count).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1000
     * @tc.name testStaticFieldSetValueAtTwo100
     * @tc.desc Verify setValue(null) on EER3064.name string field throws TypeError and field value unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EER3064>().getStaticField('name');
      try {
        field!.setValue(null);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(EER3064.name).assertEqual('original_name');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1010
     * @tc.name testStaticFieldSetValueAtTwo101
     * @tc.desc Verify setValue(string) on EER4065.score int static field throws TypeError and getValue() returns original value unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EER4065>().getStaticField('score');
      try {
        field!.setValue('invalid');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(field!.getValue() as int).assertEqual(85);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1020
     * @tc.name testStaticFieldSetValueAtTwo102
     * @tc.desc Verify setValue(2) on EER5066.key readonly int field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EER5066>().getStaticField('key');
      try {
        field!.setValue(2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1030
     * @tc.name testStaticFieldSetValueAtTwo103
     * @tc.desc Verify setValue(20) on EIA1_Parent067.parentVal readonly int field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EIA1_Parent067>().getStaticField('parentVal');
      try {
        field!.setValue(20);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1040
     * @tc.name testStaticFieldSetValueAtTwo104
     * @tc.desc Verify setValue("modified") on EIA2_Child.inherited readonly field throws NullPointerError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EIA2_Child>().getStaticField('inherited');
      try {
        field!.setValue('modified');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1050
     * @tc.name testStaticFieldSetValueAtTwo105
     * @tc.desc Verify setValue(10) on EIA4_Child.childReadonly readonly int field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EIA4_Child>().getStaticField('childReadonly');
      try {
        field!.setValue(10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1060
     * @tc.name testStaticFieldSetValueAtTwo106
     * @tc.desc Verify setValue(99) on EIA5_GrandChild.root readonly inherited field throws NullPointerError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EIA5_GrandChild>().getStaticField('root');
      try {
        field!.setValue(99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1070
     * @tc.name testStaticFieldSetValueAtTwo107
     * @tc.desc Verify setValue("bad") on EIA6_Child.num inherited int field throws NullPointerError (non-readonly inherited from parent)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EIA6_Child>().getStaticField('num');
      try {
        field!.setValue('bad');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1080
     * @tc.name testStaticFieldSetValueAtTwo108
     * @tc.desc Verify setValue(999) on EIA7_Parent073.label string field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EIA7_Parent073>().getStaticField('label');
      try {
        field!.setValue(999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1090
     * @tc.name testStaticFieldSetValueAtTwo109
     * @tc.desc Verify setValue("not_int") on EIA9_Parent075.value int field throws TypeError and field value unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EIA9_Parent075>().getStaticField('value');
      try {
        field!.setValue('not_int');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(EIA9_Parent075.value).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1100
     * @tc.name testStaticFieldSetValueAtTwo110
     * @tc.desc Verify setValue("corrupt") on EIA10_Child.data inherited field throws NullPointerError and grandparent value unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<EIA10_Child>().getStaticField('data');
      try {
        field!.setValue('corrupt');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
        expect(EIA10_GrandParent076.data).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1110
     * @tc.name testStaticFieldSetValueAtTwo111
     * @tc.desc Verify setValue(-Infinity) on NumField.num int field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<NumField>().getStaticField('num');
      try {
        field!.setValue(-Double.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1120
     * @tc.name testStaticFieldSetValueAtTwo112
     * @tc.desc Verify setValue(Double.MAX_VALUE) on NumField.num int field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<NumField>().getStaticField('num');
      try {
        field!.setValue(Double.MAX_VALUE);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1130
     * @tc.name testStaticFieldSetValueAtTwo113
     * @tc.desc Verify setValue(non-empty array [1,2,3]) on NumField.num int field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3];
      let field = Class.from<NumField>().getStaticField('num');
      try {
        field!.setValue(arr);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1140
     * @tc.name testStaticFieldSetValueAtTwo114
     * @tc.desc Verify setValue(empty array []) on NumField.num int field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [];
      let field = Class.from<NumField>().getStaticField('num');
      try {
        field!.setValue(arr);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1150
     * @tc.name testStaticFieldSetValueAtTwo115
     * @tc.desc Verify setValue(Map) on ECX3085.msg string field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>();
      let field = Class.from<ECX3085>().getStaticField('msg');
      try {
        field!.setValue(m);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1160
     * @tc.name testStaticFieldSetValueAtTwo116
     * @tc.desc Verify setValue(Set) on NumField.num int field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      let field = Class.from<NumField>().getStaticField('num');
      try {
        field!.setValue(s);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1170
     * @tc.name testStaticFieldSetValueAtTwo117
     * @tc.desc Verify setValue(Box087 object) on NumField.num int field throws TypeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: Box087 = { val: 1 };
      let field = Class.from<NumField>().getStaticField('num');
      try {
        field!.setValue(b);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1180
     * @tc.name testStaticFieldSetValueAtTwo118
     * @tc.desc Verify setValue(int array) on ECX6088.num int field throws TypeError and getValue returns original
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2];
      let field = Class.from<ECX6088>().getStaticField('num');
      try {
        field!.setValue(arr);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(field!.getValue() as int).assertEqual(42);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1190
     * @tc.name testStaticFieldSetValueAtTwo119
     * @tc.desc Verify setValue(Double.MIN_VALUE) on DoubleBoundaryField.val then getValue returns Double.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<DoubleBoundaryField>().getStaticField('val');
      field!.setValue(Double.MIN_VALUE);
      let result = field!.getValue() as Object;
      expect(result).assertEqual(Double.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1200
     * @tc.name testStaticFieldSetValueAtTwo120
     * @tc.desc Verify setValue(Double.NEGATIVE_INFINITY) on DoubleBoundaryField.val then getValue returns -Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<DoubleBoundaryField>().getStaticField('val');
      field!.setValue(Double.NEGATIVE_INFINITY);
      let result = field!.getValue() as Object;
      expect(result).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1210
     * @tc.name testStaticFieldSetValueAtTwo121
     * @tc.desc Verify setValue(Double.POSITIVE_INFINITY) on DoubleBoundaryField.val then getValue returns Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<DoubleBoundaryField>().getStaticField('val');
      field!.setValue(Double.POSITIVE_INFINITY);
      let result = field!.getValue() as Object;
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1220
     * @tc.name testStaticFieldSetValueAtTwo122
     * @tc.desc Verify setValue(Double.NaN) on DoubleBoundaryField.val then getValue returns NaN (isNaN assertTrue)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<DoubleBoundaryField>().getStaticField('val');
      field!.setValue(Double.NaN);
      let result = field!.getValue() as Object;
      expect(isNaN(result as double)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1230
     * @tc.name testStaticFieldSetValueAtTwo123
     * @tc.desc Verify setValue Double.MAX_VALUE then setValue Double.MIN_VALUE, getValue returns Double.MIN_VALUE (last write wins)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<DoubleBoundaryField>().getStaticField('val');
      field!.setValue(Double.MAX_VALUE);
      field!.setValue(Double.MIN_VALUE);
      let result = field!.getValue() as Object;
      expect(result).assertEqual(Double.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1240
     * @tc.name testStaticFieldSetValueAtTwo124
     * @tc.desc Verify setValue(Double.MAX_VALUE) then getValue returns Double.MAX_VALUE on DoubleBoundaryField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<DoubleBoundaryField>().getStaticField('val');
      field!.setValue(Double.MAX_VALUE);
      let result = field!.getValue() as Object;
      expect(result).assertEqual(Double.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1250
     * @tc.name testStaticFieldSetValueAtTwo125
     * @tc.desc Verify setValue('x'.repeat(5000)) on LongStrField.val then getValue length equals 5000 and content matches
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<LongStrField>().getStaticField('val');
      let longStr: string = 'x'.repeat(5000);
      field!.setValue(longStr);
      let result = field!.getValue() as string;
      expect(result.length).assertEqual(5000);
      expect(result).assertEqual(longStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1260
     * @tc.name testStaticFieldSetValueAtTwo126
     * @tc.desc Verify setValue('abc'.repeat(3334)) on LongStrField.val (10002 chars) then getValue length equals 10002
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<LongStrField>().getStaticField('val');
      let longStr: string = 'abc'.repeat(3334);
      field!.setValue(longStr);
      let result = field!.getValue() as string;
      expect(result.length).assertEqual(10002);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1270
     * @tc.name testStaticFieldSetValueAtTwo127
     * @tc.desc Verify setValue with 10000-char Chinese string on LongStrField.val then getValue length equals 10000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<LongStrField>().getStaticField('val');
      let longStr: string = '你好'.repeat(5000);
      field!.setValue(longStr);
      let firstRead = field!.getValue() as string;
      expect(firstRead.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1280
     * @tc.name testStaticFieldSetValueAtTwo128
     * @tc.desc Verify setValue('') on LongStrField.val after a long string write then getValue returns ''
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<LongStrField>().getStaticField('val');
      let longStr: string = '你好'.repeat(5000);
      field!.setValue(longStr);
      field!.setValue('');
      let secondRead = field!.getValue() as string;
      expect(secondRead).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1290
     * @tc.name testStaticFieldSetValueAtTwo129
     * @tc.desc Verify setValue('abc123'.repeat(3334)) on LongStrField.val (20004 chars) then getValue length equals 20004
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<LongStrField>().getStaticField('val');
      let longStr: string = 'abc123'.repeat(3334);
      field!.setValue(longStr);
      let result = field!.getValue() as string;
      expect(result.length).assertEqual(20004);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1300
     * @tc.name testStaticFieldSetValueAtTwo130
     * @tc.desc Verify setValue(0b1010) on RadixField.val then getValue returns 10 (decimal)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<RadixField>().getStaticField('val');
      field!.setValue(0b1010);
      expect(field!.getValue() as Object).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1310
     * @tc.name testStaticFieldSetValueAtTwo131
     * @tc.desc Verify setValue(0b1111111111111111111111111111111) on RadixField.val then getValue returns 2147483647 (INT32_MAX)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<RadixField>().getStaticField('val');
      field!.setValue(0b1111111111111111111111111111111);
      expect(field!.getValue() as Object).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1320
     * @tc.name testStaticFieldSetValueAtTwo132
     * @tc.desc Verify setValue on non-existent field name throws NullPointerError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<NumField>().getStaticField('nonExistentField');
      try {
        field!.setValue(123);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_SETVALUE_TWO_1330
     * @tc.name testStaticFieldSetValueAtTwo133
     * @tc.desc Verify setValue on instance field (non-static) throws NullPointerError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldSetValueAtTwo133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field = Class.from<InstanceFieldClass>().getStaticField('instanceVal');
      try {
        field!.setValue(123);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

  });
}
