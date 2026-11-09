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
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

class IntStrField {
  static val1: int = 0;
  static val2: string = '';
}

class IntField {
  static val: int = 0;
}

class StrField {
  static val: string = '';
}

class ClassAlpha010 {
  static x: string = 'alpha';
}

class ClassBeta011 {
  static x: string = 'beta';
}

class InterleavedGetClass053 {
  static primary: string = 'p';
  static secondary: string = 's';
}

class MultiFieldClass065 {
  static fA: int = 1;
  static fB: int = 2;
  static fC: int = 3;
}

class TwoIntField {
  static val1: int = 0;
  static val2: int = 1;
}

class ValField {
  public static val: int = 42;
}

class DollarFields020 {
  public static $meta: string = 'meta';
}

class GrandParentFieldA {
  public static gpVal: int = 1;
}

class ParentFieldA extends GrandParentFieldA {
  public static parentVal: int = 2;
}

class ChildFieldA extends ParentFieldA {
  public static childVal: int = 3;
}

class GrandParentSameName {
  public static key: string = 'grand';
}

class ParentSameName extends GrandParentSameName {
  public static key: string = 'parent';
}

class ChildSameName extends ParentSameName {
  public static key: string = 'child';
}

class NonNullClass135 {
  static exists: string = 'yes';
}



class CrossModClassC {
  public static mutableVal: int = 99;
  public static readonly fixedVal: int = 100;
}

class LargeNegIntClass131 {
  static largeNeg: int = -999999999;
}

class MaxIntFields014 {
  public static maxVal: int = 2147483647;
}

class MaxSafeIntClass130 {
  static safeMax: long = 9007199254740991;
}

class MinIntFields015 {
  public static minVal: int = -2147483648;
}

class NaNFieldClass048 {
  static nanVal: double = Double.NaN;
}

class NegZeroDoubleClass133 {
  static nz: double = -0.0;
}

class SameValDiffClass129 {
  static firstVal: int = 42;
  static secondVal: int = 42;
}

class UnderscoreFieldClass040 {
  static _hidden: int = -1;
}

class UnicodeFieldClass042 {
  static unicodeField: string = 'unicode_value';
}
export default function staticFieldEqualsTest2(): void {
  describe('StaticFieldEqualsTest2', (): void => {
    beforeAll(() => {});

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_0100
     * @tc.name testStaticFieldEqualsAtTwo001
     * @tc.desc Verify equals accepts one StaticField argument and returns true for IntField.val self-comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField>();
      let field = cls.getStaticField('val');
      let result: boolean = field!.equals(field!);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_0200
     * @tc.name testStaticFieldEqualsAtTwo002
     * @tc.desc Verify equals returns true for StrField.val self-comparison (same getStaticField result, same object reference)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StrField>();
      let field = cls.getStaticField('val');
      expect(field!.equals(field!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_0300
     * @tc.name testStaticFieldEqualsAtTwo003
     * @tc.desc Verify equals returns true for two separate getStaticField() results of same StrField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StrField>();
      let f1 = cls.getStaticField('val');
      let f2 = cls.getStaticField('val');
      expect(f1!.equals(f2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_0400
     * @tc.name testStaticFieldEqualsAtTwo004
     * @tc.desc Verify two getStaticField() results for same StrField.val are different object references (!==)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StrField>();
      let f1 = cls.getStaticField('val');
      let f2 = cls.getStaticField('val');
      expect(f1!).not().assertEqual(f2!);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_0500
     * @tc.name testStaticFieldEqualsAtTwo005
     * @tc.desc Verify void equals() calls do not affect subsequent equals result (f1.equals(f3) still true)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StrField>();
      let f1 = cls.getStaticField('val');
      let f2 = cls.getStaticField('val');
      let f3 = cls.getStaticField('val');
      f1!.equals(f2!);
      f2!.equals(f3!);
      expect(f1!.equals(f3!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_0600
     * @tc.name testStaticFieldEqualsAtTwo006
     * @tc.desc Verify equals returns false for IntStrField.val1 (int) vs val2 (string) - cross-type comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntStrField>();
      let fName = cls.getStaticField('val1');
      let fAge = cls.getStaticField('val2');
      expect(fName!.equals(fAge!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_0700
     * @tc.name testStaticFieldEqualsAtTwo007
     * @tc.desc Verify equals returns false for same-name field 'x' from different classes (ClassAlpha010 vs ClassBeta011)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = Class.from<ClassAlpha010>();
      let clsB = Class.from<ClassBeta011>();
      let fA = clsA.getStaticField('x');
      let fB = clsB.getStaticField('x');
      expect(fA!.equals(fB!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_0800
     * @tc.name testStaticFieldEqualsAtTwo008
     * @tc.desc Verify equals returns true for StrField.val across three separate getStaticField results (r12 && r23 && r13 all true)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StrField>();
      let f1 = cls.getStaticField('val');
      let f2 = cls.getStaticField('val');
      let f3 = cls.getStaticField('val');
      let r12: boolean = f1!.equals(f2!);
      let r23: boolean = f2!.equals(f3!);
      let r13: boolean = f1!.equals(f3!);
      expect(r12).assertTrue();
      expect(r23).assertTrue();
      expect(r13).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_0900
     * @tc.name testStaticFieldEqualsAtTwo009
     * @tc.desc Verify equals returns true for same primary field after interleaved getStaticField for different field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<InterleavedGetClass053>();
      let f1 = cls.getStaticField('primary');
      cls.getStaticField('secondary');
      let f2 = cls.getStaticField('primary');
      expect(f1!.equals(f2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_1000
     * @tc.name testStaticFieldEqualsAtTwo010
     * @tc.desc Verify equals returns true after setValue(999) then re-getStaticField on IntField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField>();
      let field = cls.getStaticField('val');
      field!.setValue(999);
      let fieldAfter = cls.getStaticField('val');
      expect(field!.equals(fieldAfter!)).assertTrue();
      field!.setValue(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_1100
     * @tc.name testStaticFieldEqualsAtTwo011
     * @tc.desc Verify equals returns true for IntField.val after chained setValue(10/20/30) then re-getStaticField
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField>();
      let fOrig = cls.getStaticField('val');
      fOrig!.setValue(10);
      fOrig!.setValue(20);
      fOrig!.setValue(30);
      let fLatest = cls.getStaticField('val');
      expect(fOrig!.equals(fLatest!)).assertTrue();
      fOrig!.setValue(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_1200
     * @tc.name testStaticFieldEqualsAtTwo012
     * @tc.desc Verify TwoIntField.val1 and val2 are both non-null (=== null returns false for each)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoIntField>();
      let fFirst = cls.getStaticField('val1');
      let fSecond = cls.getStaticField('val2');
      let r1: boolean = fFirst! === null;
      let r2: boolean = fSecond! === null;
      expect(r1).assertFalse();
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_1300
     * @tc.name testStaticFieldEqualsAtTwo013
     * @tc.desc Verify different fields in same class return false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiFieldClass065>();
      let fa = cls.getStaticField('fA');
      let fb = cls.getStaticField('fB');
      let fc = cls.getStaticField('fC');
      expect(fa!.equals(fb!)).assertFalse();
      expect(fb!.equals(fc!)).assertFalse();
      expect(fa!.equals(fc!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_1400
     * @tc.name testStaticFieldEqualsAtTwo014
     * @tc.desc Verify equals true for StrField.val via alias variable comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StrField>();
      let f1 = cls.getStaticField('val');
      let fAlias = f1;
      expect(fAlias!.equals(f1!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_1500
     * @tc.name testStaticFieldEqualsAtTwo015
     * @tc.desc Verify equals returns true across sequential repeated calls on ValField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValField>();
      let a = cls.getStaticField('val');
      let b = cls.getStaticField('val');
      let c = cls.getStaticField('val');
      expect(a!.equals(b!)).assertTrue();
      expect(b!.equals(c!)).assertTrue();
      expect(a!.equals(c!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_1600
     * @tc.name testStaticFieldEqualsAtTwo016
     * @tc.desc Verify equals returns true for dollar-named static field (DollarFields020.$meta) self-comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<DollarFields020>();
      let f1 = cls.getStaticField('$meta');
      let f2 = cls.getStaticField('$meta');
      expect(f1!.equals(f2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_1700
     * @tc.name testStaticFieldEqualsAtTwo017
     * @tc.desc Verify equals returns false for TwoIntField.val1 vs val2 AND references are different (!==)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoIntField>();
      let fa = cls.getStaticField('val1');
      let fb = cls.getStaticField('val2');
      expect(fa!.equals(fb!)).assertFalse();
      expect(fa!).not().assertEqual(fb!);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_1800
     * @tc.name testStaticFieldEqualsAtTwo018
     * @tc.desc Verify equals: a.val1==b.val1(true), b.val1!=c.val2(false), thus a.val1!=c.val2(false) in TwoIntField
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoIntField>();
      let a = cls.getStaticField('val1');
      let b = cls.getStaticField('val1');
      let c = cls.getStaticField('val2');
      let ab: boolean = a!.equals(b!);
      let bc: boolean = b!.equals(c!);
      let ac: boolean = a!.equals(c!);
      expect(ab).assertTrue();
      expect(bc).assertFalse();
      expect(ac).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_1900
     * @tc.name testStaticFieldEqualsAtTwo019
     * @tc.desc Verify transitive equals on ValField.val across four getStaticField handles a,b,c,d all return true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValField>();
      let a = cls.getStaticField('val');
      let b = cls.getStaticField('val');
      let c = cls.getStaticField('val');
      let d = cls.getStaticField('val');
      expect(a!.equals(b!)).assertTrue();
      expect(b!.equals(c!)).assertTrue();
      expect(c!.equals(d!)).assertTrue();
      expect(a!.equals(d!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_2000
     * @tc.name testStaticFieldEqualsAtTwo020
     * @tc.desc Verify equals results unaffected by calling getName() between two equals calls on ValField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValField>();
      let f1 = cls.getStaticField('val');
      let f2 = cls.getStaticField('val');
      let before: boolean = f1!.equals(f2!);
      f1!.getName();
      let after: boolean = f1!.equals(f2!);
      expect(before).assertEqual(after);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_2100
     * @tc.name testStaticFieldEqualsAtTwo021
     * @tc.desc Verify multi-pair consistency: same-field (val1==val1, val2==val2) both true, cross-field (val1!=val2) false for TwoIntField
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoIntField>();
      let a1 = cls.getStaticField('val1');
      let a2 = cls.getStaticField('val1');
      let b1 = cls.getStaticField('val2');
      let b2 = cls.getStaticField('val2');
      let rAA: boolean = a1!.equals(a2!);
      let rBB: boolean = b1!.equals(b2!);
      let rAB: boolean = a1!.equals(b1!);
      expect(rAA).assertTrue();
      expect(rBB).assertTrue();
      expect(rAB).assertFalse();
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_2200
     * @tc.name testStaticFieldEqualsAtTwo022
     * @tc.desc Verify getName() result consistent before and after calling equals() on ValField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValField>();
      let f1 = cls.getStaticField('val');
      let f2 = cls.getStaticField('val');
      let nameBefore: string = f1!.getName();
      f1!.equals(f2!);
      let nameAfter: string = f1!.getName();
      expect(nameBefore).assertEqual(nameAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_2300
     * @tc.name testStaticFieldEqualsAtTwo023
     * @tc.desc Verify getType() result consistent before and after calling equals() on ValField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValField>();
      let f1 = cls.getStaticField('val');
      let f2 = cls.getStaticField('val');
      let typeBefore: string = f1!.getType().getName();
      f1!.equals(f2!);
      let typeAfter: string = f1!.getType().getName();
      expect(typeBefore).assertEqual(typeAfter);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_2400
     * @tc.name testStaticFieldEqualsAtTwo024
     * @tc.desc Verify isReadonly() result consistent before and after calling equals() on ValField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValField>();
      let f1 = cls.getStaticField('val');
      let f2 = cls.getStaticField('val');
      let roBefore: boolean = f1!.isReadonly();
      f1!.equals(f2!);
      let roAfter: boolean = f1!.isReadonly();
      expect(roBefore).assertEqual(roAfter);
    });

    
    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_2500
     * @tc.name testStaticFieldEqualsAtTwo025
     * @tc.desc Verify when equals returns true, getName() matches between f1 and f2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValField>();
      let f1 = cls.getStaticField('val');
      let f2 = cls.getStaticField('val');
      if (f1!.equals(f2!)) {
        expect(f1!.getName()).assertEqual(f2!.getName());
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_2600
     * @tc.name testStaticFieldEqualsAtTwo026
     * @tc.desc Verify when equals returns true, getType().getName() matches between f1 and f2 on ValField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValField>();
      let f1 = cls.getStaticField('val');
      let f2 = cls.getStaticField('val');
      if (f1!.equals(f2!)) {
        expect(f1!.getType().getName()).assertEqual(f2!.getType().getName());
      } else {
        expect().assertFail();
      }
    });

    
    
    
    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_2700
     * @tc.name testStaticFieldEqualsAtTwo027
     * @tc.desc Verify equals true on IntField.val and getValue matches between f1 and f2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField>();
      let f1 = cls.getStaticField('val');
      let f2 = cls.getStaticField('val');
      expect(f1!.equals(f2!)).assertTrue();
      expect(f1!.getValue() as Object).assertEqual(f2!.getValue() as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_2800
     * @tc.name testStaticFieldEqualsAtTwo028
     * @tc.desc Verify equals true on IntField.val, setValue(99) on f1 propagates to f2.getValue() confirming same field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField>();
      let f1 = cls.getStaticField('val');
      let f2 = cls.getStaticField('val');
      expect(f1!.equals(f2!)).assertTrue();
      f1!.setValue(99);
      expect(f2!.getValue() as Object).assertEqual(99);
      f1!.setValue(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_2900
     * @tc.name testStaticFieldEqualsAtTwo029
     * @tc.desc Verify equals returns false for different fields before getValue (TwoIntField.val1 vs val2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoIntField>();
      let fa = cls.getStaticField('val1');
      let fb = cls.getStaticField('val2');
      expect(fa!.equals(fb!)).assertFalse();
      let va: int = fa!.getValue() as int;
      let vb: int = fb!.getValue() as int;
      expect(va).not().assertEqual(vb);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_3000
     * @tc.name testStaticFieldEqualsAtTwo030
     * @tc.desc Verify equals true for IntField.val after direct field assignment (IntField.val=77), both getStaticField handles reflect new value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField>();
      let f1 = cls.getStaticField('val');
      let f2 = cls.getStaticField('val');
      expect(f1!.equals(f2!)).assertTrue();
      IntField.val = 77;
      expect(f1!.getValue() as Object).assertEqual(77);
      expect(f2!.getValue() as Object).assertEqual(77);
      IntField.val = 0;
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_3100
     * @tc.name testStaticFieldEqualsAtTwo031
     * @tc.desc Verify equals returns true and its negation (!eq) returns false for ValField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValField>();
      let f1 = cls.getStaticField('val');
      let f2 = cls.getStaticField('val');
      let eq: boolean = f1!.equals(f2!);
      expect(!eq).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_3200
     * @tc.name testStaticFieldEqualsAtTwo032
     * @tc.desc Verify equals returns false and its negation (!eq) returns true for different fields (TwoIntField.val1 vs val2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoIntField>();
      let fx = cls.getStaticField('val1');
      let fy = cls.getStaticField('val2');
      let eq: boolean = fx!.equals(fy!);
      expect(!eq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_3300
     * @tc.name testStaticFieldEqualsAtTwo033
     * @tc.desc Verify equals result used in if-condition returns true for ValField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValField>();
      let f1 = cls.getStaticField('val');
      let f2 = cls.getStaticField('val');
      let matched: boolean = false;
      if (f1!.equals(f2!)) {
        matched = true;
      }
      expect(matched).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_3400
     * @tc.name testStaticFieldEqualsAtTwo034
     * @tc.desc Verify equals=true and !==true both hold for same ValField.val (value equal but reference different)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValField>();
      let f1 = cls.getStaticField('val');
      let f2 = cls.getStaticField('val');
      let eq: boolean = f1!.equals(f2!);
      let neq: boolean = f1! !== f2!;
      expect(eq).assertTrue();
      expect(neq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_3500
     * @tc.name testStaticFieldEqualsAtTwo035
     * @tc.desc Verify equals returns consistent results for multiple calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValField>();
      let f1 = cls.getStaticField('val');
      let f2 = cls.getStaticField('val');
      let results: boolean[] = [f1!.equals(f2!), f1!.equals(f2!), f1!.equals(f2!)];
      expect(results[0]).assertEqual(results[1]);
      expect(results[1]).assertEqual(results[2]);
      expect(results[0]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_3600
     * @tc.name testStaticFieldEqualsAtTwo036
     * @tc.desc Verify equals chain: a==b, b==c both true, but c!=d (different field) for TwoIntField
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoIntField>();
      let a = cls.getStaticField('val1');
      let b = cls.getStaticField('val1');
      let c = cls.getStaticField('val1');
      let d = cls.getStaticField('val2');
      expect(a!.equals(b!)).assertTrue();
      expect(b!.equals(c!)).assertTrue();
      expect(c!.equals(d!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_3700
     * @tc.name testStaticFieldEqualsAtTwo037
     * @tc.desc Verify equals false between ParentFieldA.parentVal and ChildFieldA.childVal (different fields in inheritance chain)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsP = Class.from<ParentFieldA>();
      let clsC = Class.from<ChildFieldA>();
      let fP = clsP.getStaticField('parentVal');
      let fC = clsC.getStaticField('childVal');
      expect(fP!.equals(fC!)).assertFalse();
      expect(fC!.equals(fP!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_3800
     * @tc.name testStaticFieldEqualsAtTwo038
     * @tc.desc Verify equals returns false for same-name field 'key' across three levels: GrandParentSameName -> ParentSameName -> ChildSameName
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsGP = Class.from<GrandParentSameName>();
      let clsP = Class.from<ParentSameName>();
      let clsC = Class.from<ChildSameName>();
      let fGP = clsGP.getStaticField('key');
      let fP = clsP.getStaticField('key');
      let fC = clsC.getStaticField('key');
      expect(fGP!.equals(fP!)).assertFalse();
      expect(fGP!.equals(fC!)).assertFalse();
      expect(fP!.equals(fC!)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_3900
     * @tc.name testStaticFieldEqualsAtTwo039
     * @tc.desc Verify equals symmetry: fGP.equals(fC) returns same as fC.equals(fGP) for cross-level fields in inheritance chain
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsGP = Class.from<GrandParentFieldA>();
      let clsC = Class.from<ChildFieldA>();
      let fGP = clsGP.getStaticField('gpVal');
      let fC = clsC.getStaticField('childVal');
      let r1: boolean = fGP!.equals(fC!);
      let r2: boolean = fC!.equals(fGP!);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_4000
     * @tc.name testStaticFieldEqualsAtTwo040
     * @tc.desc Verify equals consistency across repeated calls (r1&&r2&&r3 all true) for ChildFieldA.childVal self-comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ChildFieldA>();
      let f1 = cls.getStaticField('childVal');
      let f2 = cls.getStaticField('childVal');
      let r1: boolean = f1!.equals(f2!);
      let r2: boolean = f1!.equals(f2!);
      let r3: boolean = f1!.equals(f2!);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_4100
     * @tc.name testStaticFieldEqualsAtTwo041
     * @tc.desc P1-07: Verify equals symmetry for same field: f1.equals(f2) result equals f2.equals(f1) result via assertEqual
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField>();
      let f1 = cls.getStaticField('val');
      let f2 = cls.getStaticField('val');
      let r1: boolean = f1!.equals(f2!);
      let r2: boolean = f2!.equals(f1!);
      expect(r1).assertTrue();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_4200
     * @tc.name testStaticFieldEqualsAtTwo042
     * @tc.desc P1-09: Verify cross-field symmetry: f1.equals(f2) and f2.equals(f1) both return false and results match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntStrField>();
      let f1 = cls.getStaticField('val1');
      let f2 = cls.getStaticField('val2');
      let r1: boolean = f1!.equals(f2!);
      let r2: boolean = f2!.equals(f1!);
      expect(r1).assertEqual(r2);
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_4300
     * @tc.name testStaticFieldEqualsAtTwo043
     * @tc.desc P1-50: Verify getStaticField returns a defined field and self-equals returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NonNullClass135>();
      let field = cls.getStaticField('exists');
      expect(field!).not().assertUndefined();
      expect(field!.equals(field!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_4400
     * @tc.name testStaticFieldEqualsAtTwo044
     * @tc.desc P1-68: Verify equals symmetry for same-field instances: fA.equals(fB) result matches fB.equals(fA)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValField>();
      let fA = cls.getStaticField('val');
      let fB = cls.getStaticField('val');
      expect(fA!.equals(fB!)).assertTrue();
      expect(fA!.equals(fB!)).assertEqual(fB!.equals(fA!));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_4500
     * @tc.name testStaticFieldEqualsAtTwo045
     * @tc.desc P2-01: Verify equals returns true for same field obtained via two getStaticField handles
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ValField>();
      let f1 = cls.getStaticField('val');
      let f2 = cls.getStaticField('val');
      let result: boolean = f1!.equals(f2!);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_4600
     * @tc.name testStaticFieldEqualsAtTwo046
     * @tc.desc P2-12: Verify equals returns true for same field obtained via two independent Class.from() calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<ValField>();
      let cls2 = Class.from<ValField>();
      let f1 = cls1.getStaticField('val');
      let f2 = cls2.getStaticField('val');
      expect(f1!.equals(f2!)).assertTrue();
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_4700
     * @tc.name testStaticFieldEqualsAtTwo047
     * @tc.desc Verify equals returns false for mutable vs readonly field in CrossModClassC
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CrossModClassC>();
      let fMut = cls.getStaticField('mutableVal');
      let fFix = cls.getStaticField('fixedVal');
      expect(fMut!.equals(fFix!)).assertFalse();
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_4800
     * @tc.name testStaticFieldEqualsAtTwo048
     * @tc.desc Verify equals returns true for underscore-prefixed field name '_hidden' (UnderscoreFieldClass040) via two getStaticField results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<UnderscoreFieldClass040>();
      let f1 = cls.getStaticField('_hidden');
      let f2 = cls.getStaticField('_hidden');
      expect(f1!.equals(f2!)).assertTrue();
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_4900
     * @tc.name testStaticFieldEqualsAtTwo049
     * @tc.desc Verify equals returns true for Unicode-named static field (UnicodeFieldClass042.unicodeField) self-comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<UnicodeFieldClass042>();
      let f1 = cls.getStaticField('unicodeField');
      let f2 = cls.getStaticField('unicodeField');
      expect(f1!.equals(f2!)).assertTrue();
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_5000
     * @tc.name testStaticFieldEqualsAtTwo050
     * @tc.desc Verify equals returns true for Double.NaN static field (NaNFieldClass048.nanVal) self-comparison via two getStaticField results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NaNFieldClass048>();
      let f1 = cls.getStaticField('nanVal');
      let f2 = cls.getStaticField('nanVal');
      expect(f1!.equals(f2!)).assertTrue();
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_5100
     * @tc.name testStaticFieldEqualsAtTwo051
     * @tc.desc Verify equals returns true for MaxIntFields014.maxVal (int32 MAX_VALUE) self-comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MaxIntFields014>();
      let f1 = cls.getStaticField('maxVal');
      let f2 = cls.getStaticField('maxVal');
      expect(f1!.equals(f2!)).assertTrue();
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_5200
     * @tc.name testStaticFieldEqualsAtTwo052
     * @tc.desc Verify equals returns true for MinIntFields015.minVal (int32 MIN_VALUE) self-comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MinIntFields015>();
      let f1 = cls.getStaticField('minVal');
      let f2 = cls.getStaticField('minVal');
      expect(f1!.equals(f2!)).assertTrue();
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_5300
     * @tc.name testStaticFieldEqualsAtTwo053
     * @tc.desc P1-62: Verify equals returns false for different fields with identical underlying values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SameValDiffClass129>();
      let f1 = cls.getStaticField('firstVal');
      let f2 = cls.getStaticField('secondVal');
      expect(f1!.equals(f2!)).assertFalse();
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_5400
     * @tc.name testStaticFieldEqualsAtTwo054
     * @tc.desc P1-65: Verify equals returns true for int field with MAX_SAFE_INTEGER boundary value self-comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MaxSafeIntClass130>();
      let f1 = cls.getStaticField('safeMax');
      let f2 = cls.getStaticField('safeMax');
      expect(f1!.equals(f2!)).assertTrue();
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_5500
     * @tc.name testStaticFieldEqualsAtTwo055
     * @tc.desc P1-66: Verify equals returns true for int field with large negative boundary value self-comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<LargeNegIntClass131>();
      let f1 = cls.getStaticField('largeNeg');
      let f2 = cls.getStaticField('largeNeg');
      expect(f1!.equals(f2!)).assertTrue();
    });

/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_EQUALS_TWO_5600
     * @tc.name testStaticFieldEqualsAtTwo056
     * @tc.desc P2-80: Verify equals returns true for double -0.0 field self-comparison
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldEqualsAtTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NegZeroDoubleClass133>();
      let f1 = cls.getStaticField('nz');
      let f2 = cls.getStaticField('nz');
      expect(f1!.equals(f2!)).assertTrue();
    });

  });
}
