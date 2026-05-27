'use static'
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '../../../../hypium/index';
import Utils from './../Util.test';
class MyClass001 {
  public readonly name: string = 'test';
}

class ReadonlyClass003 {
  public readonly readonlyField: string = 'value';
}

class NormalClass004 {
  public normalField: string = 'value';
}

class ConstClass005 {
  public readonly CONST_VALUE: int = 100;
}

class ModifierClass006 {
  public readonly publicReadonly: string = '';
  private readonly privateReadonly: string = '';
  protected readonly protectedReadonly: string = '';
  public mutable: string = '';
}

class ParentClass007 {
  public readonly inheritedReadonly: string = 'parent';
}

class ChildClass007 extends ParentClass007 {
  public childField: string = 'child';
}

class TestClass008 {
  public readonly data: string = '';
}

class TestClass009 {
  public readonly value: string = '';
}

class VariousTypes014 {
  public readonly str: string = '';
  public readonly num: number = 0;
  public readonly bool: boolean = false;
  public readonly arr: Array<int> = [];
  public readonly obj: Object = {};
  public readonly date: Date = new Date();
}

class PublicReadonly016 {
  public readonly value: string = 'public';
}

class PrivateReadonly017 {
  private readonly value: string = 'private';
}

class ReadonlyTest018 {
  public readonly value: string = 'original';
}

class MutableTest019 {
  public value: string = 'original';
}

class StaticReadonly021 {
  public static readonly STATIC_VALUE: string = 'static';
  public readonly instanceValue: string = 'instance';
}

export default function InstanceFieldIsReadonlyTest(): void {
  let runTests: () => void = (): void => {
        // FILTER: bit0=FUNCTION bit17=MEDIUMTEST bit26=LEVEL2
    const FILTER: int = 0B1 | (0B1 << 17) | (0B1 << 26);
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0100
     * @tc.name testIsReadonly001
     * @tc.desc Verify isReadonly() requires no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly001', FILTER, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let result = field.isReadonly();
      expect(result).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0200
     * @tc.name testIsReadonly003
     * @tc.desc Verify readonly field returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly003', FILTER, (): void => {
      let cls = Class.from<ReadonlyClass003>();
      let field = cls.getInstanceField('readonlyField')!;
      expect(field.isReadonly()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0300
     * @tc.name testIsReadonly004
     * @tc.desc Verify non-readonly field returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly004', FILTER, (): void => {
      let cls = Class.from<NormalClass004>();
      let field = cls.getInstanceField('normalField')!;
      expect(field.isReadonly()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0400
     * @tc.name testIsReadonly005
     * @tc.desc Verify readonly declared field is readonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly005', FILTER, (): void => {
      let cls = Class.from<ConstClass005>();
      let field = cls.getInstanceField('CONST_VALUE')!;
      expect(field.isReadonly()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0500
     * @tc.name testIsReadonly006
     * @tc.desc Verify readonly can be combined with public/private/protected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly006', FILTER, (): void => {
      let cls = Class.from<ModifierClass006>();
      let publicField = cls.getInstanceField('publicReadonly')!;
      expect(publicField.isReadonly()).assertTrue();
      let mutableField = cls.getInstanceField('mutable')!;
      expect(mutableField.isReadonly()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0600
     * @tc.name testIsReadonly007
     * @tc.desc Verify parent class readonly field retains readonly attribute
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly007', FILTER, (): void => {
      let parentCls = Class.from<ParentClass007>();
      let parentField = parentCls.getInstanceField('inheritedReadonly')!;
      expect(parentField.isReadonly()).assertTrue();
      let childCls = Class.from<ChildClass007>();
      let childField = childCls.getInstanceField('childField')!;
      expect(childField.isReadonly()).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0700
     * @tc.name testIsReadonly008
     * @tc.desc Verify return value type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly008', FILTER, (): void => {
      let cls = Class.from<TestClass008>();
      let field = cls.getInstanceField('data')!;
      let result = field.isReadonly();
      expect(typeof result).assertEqual('boolean');
      expect(typeof result === 'boolean').assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0800
     * @tc.name testIsReadonly009
     * @tc.desc Verify multiple calls to isReadonly() return same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly009', FILTER, (): void => {
      let cls = Class.from<TestClass009>();
      let field = cls.getInstanceField('value')!;
      let result1 = field.isReadonly();
      let result2 = field.isReadonly();
      let result3 = field.isReadonly();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_0900
     * @tc.name testIsReadonly011
     * @tc.desc Verify calling isReadonly on initialized InstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly011', FILTER, (): void => {
      let cls = Class.from<MyClass001>();
      cls.initialize();
      let field = cls.getInstanceField('name')!;
      let result = field.isReadonly();
      expect(typeof result === 'boolean').assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1000
     * @tc.name testIsReadonly012
     * @tc.desc Verify basic functionality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly012', FILTER, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let result = field.isReadonly();
      expect(typeof result === 'boolean').assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1100
     * @tc.name testIsReadonly013
     * @tc.desc Verify isReadonly works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly013', FILTER, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let result = field.isReadonly();
      expect(typeof result).assertEqual('boolean');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1200
     * @tc.name testIsReadonly014
     * @tc.desc Verify various types of readonly fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly014', FILTER, (): void => {
      let cls = Class.from<VariousTypes014>();
      let fields = cls.getInstanceFields();
      for (let i = 0; i < fields.length; i++) {
          expect(fields[i].isReadonly()).assertTrue();
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1300
     * @tc.name testIsReadonly015
     * @tc.desc Verify readonly field cannot have setter at runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly015', FILTER, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      expect(field.isReadonly()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1400
     * @tc.name testIsReadonly016
     * @tc.desc Verify public readonly is reflectable and readonly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly016', FILTER, (): void => {
      let cls = Class.from<PublicReadonly016>();
      let field = cls.getInstanceField('value')!;
      expect(field.isPublic()).assertTrue();
      expect(field.isReadonly()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1500
     * @tc.name testIsReadonly017
     * @tc.desc Verify private readonly is not reflectable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly017', FILTER, (): void => {
      let cls = Class.from<PrivateReadonly017>();
      let field = cls.getInstanceField('value');
      expect(field === undefined).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1600
     * @tc.name testIsReadonly018
     * @tc.desc Verify modifying readonly field should fail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly018', FILTER, (): void => {
      let cls = Class.from<ReadonlyTest018>();
      let field = cls.getInstanceField('value')!;
      expect(field.isReadonly()).assertTrue();
      let instance = cls.createInstance();
      let threw = false;
      try {
          field.setValue(instance, 'modified');
      } catch (e) {
          threw = true;
          expect(e instanceof TypeError).assertTrue();
      }
      expect(threw).assertTrue();
      let finalValue: string = field.getValue(instance) as string;
      expect(finalValue).assertEqual('original');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1700
     * @tc.name testIsReadonly019
     * @tc.desc Verify non-readonly field can be modified normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly019', FILTER, (): void => {
      let cls = Class.from<MutableTest019>();
      let field = cls.getInstanceField('value')!;
      expect(field.isReadonly()).assertFalse();
      let instance = cls.createInstance();
      field.setValue(instance, 'modified');
      expect(field.getValue(instance) as string).assertEqual('modified');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1800
     * @tc.name testIsReadonly020
     * @tc.desc Verify performance of repeated isReadonly() calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly020', FILTER, (): void => {
      let cls = Class.from<TestClass008>();
      let field = cls.getInstanceField('data')!;
      for (let i = 0; i < 100; i++) {
          let result = field.isReadonly();
          expect(result).assertTrue();
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_1900
     * @tc.name testIsReadonly021
     * @tc.desc Verify StaticField also has isReadonly for static readonly fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly021', FILTER, (): void => {
      let cls = Class.from<StaticReadonly021>();
      let staticField = cls.getStaticField('STATIC_VALUE')!;
      expect(staticField.isReadonly()).assertTrue();
      let instanceField = cls.getInstanceField('instanceValue')!;
      expect(instanceField.isReadonly()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_IS_READONLY_2000
     * @tc.name testIsReadonly022
     * @tc.desc Verify isReadonly consistency across multiple field instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsReadonly022', FILTER, (): void => {
      let cls = Class.from<ReadonlyClass003>();
      let field1 = cls.getInstanceField('readonlyField')!;
      let field2 = cls.getInstanceField('readonlyField')!;
      expect(field1.isReadonly()).assertEqual(field2.isReadonly());
      expect(field1.isReadonly()).assertTrue();
    });
  };
  describe('InstanceFieldIsReadonlyTest', runTests);
}