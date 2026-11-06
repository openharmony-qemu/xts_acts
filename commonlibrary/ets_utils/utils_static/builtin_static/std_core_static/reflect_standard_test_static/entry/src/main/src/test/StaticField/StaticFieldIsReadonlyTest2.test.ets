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

class IntField {
  static val: int = 0;
}

class StrField {
  static val: string = '';
}

class ReadonlyBoolField {
  static readonly val: boolean = false;
}

class ReadonlyStrField {
  static readonly val: string = '';
}

class ReadonlyIntField {
  static readonly val: int = 0;
}

class ParentClass045 {
  public static readonly hiddenKey: string = 'secret';
  public static getKeyField(): string {
    return ParentClass045.hiddenKey;
  }
}

class TestClass060 {
  public static readonly $metadata: string = 'meta';
}

class TestClass075 {
  public static readonly constant: int = 1;
  public static mutable: int = 2;
}

class TestClass088 {
  public static readonly initializedConst: string = 'ready';
  public static isReady: boolean = false;
}

class TestClass089 {
  public static readonly VALUE: int = 42;
}

class GenericBox<T> {
  public static readonly capacity: int = 10;
  public item: T | null = null;
}

class GenericStore<T> {
  public static itemCount: int = 0;
  public data: T | null = null;
}

class NewRoComboClass {
  public static readonly roVal: int = 42;
  public static rwVal: int = 100;
}

export default function staticFieldIsReadonlyTest2(): void {
  describe('StaticFieldIsReadonlyTest2', (): void => {
    beforeAll(() => {});

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_TWO_0100
     * @tc.name testStaticFieldIsReadonlyAtTwo001
     * @tc.desc Verify isReadonly returns true for ReadonlyBoolField.val (via intermediate variable)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsReadonlyAtTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyBoolField>();
      let field = cls.getStaticField('val');
      let result = field!.isReadonly();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_TWO_0200
     * @tc.name testStaticFieldIsReadonlyAtTwo002
     * @tc.desc Verify isReadonly returns true for ReadonlyStrField.val (chained assertion without intermediate variable)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsReadonlyAtTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyStrField>();
      let field = cls.getStaticField('val');
      expect(field!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_TWO_0300
     * @tc.name testStaticFieldIsReadonlyAtTwo003
     * @tc.desc Verify isReadonly returns false for IntField.val (non-readonly, chained assertion)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsReadonlyAtTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField>();
      let field = cls.getStaticField('val');
      expect(field!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_TWO_0400
     * @tc.name testStaticFieldIsReadonlyAtTwo004
     * @tc.desc Verify isReadonly returns false for StrField.val (non-readonly, via intermediate variable)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsReadonlyAtTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StrField>();
      let field = cls.getStaticField('val');
      let result = field!.isReadonly();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_TWO_0500
     * @tc.name testStaticFieldIsReadonlyAtTwo005
     * @tc.desc Verify isReadonly returns true for TestClass060.$metadata (readonly field with dollar-prefixed name)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsReadonlyAtTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass060>();
      let field = cls.getStaticField('$metadata');
      expect(field!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_TWO_0600
     * @tc.name testStaticFieldIsReadonlyAtTwo006
     * @tc.desc Verify isReadonly returns true for constant and false for mutable in TestClass075 (comparing readonly vs non-readonly in same class)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsReadonlyAtTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass075>();
      let f1 = cls.getStaticField('constant');
      let f2 = cls.getStaticField('mutable');
      expect(f1!.isReadonly()).assertTrue();
      expect(f2!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_TWO_0700
     * @tc.name testStaticFieldIsReadonlyAtTwo007
     * @tc.desc Verify isReadonly returns false and unchanged after getName call on StrField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsReadonlyAtTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StrField>();
      let field = cls.getStaticField('val');
      let before = field!.isReadonly();
      field!.getName();
      let after = field!.isReadonly();
      expect(before).assertFalse();
      expect(after).assertFalse();
    });

    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_TWO_0800
     * @tc.name testStaticFieldIsReadonlyAtTwo008
     * @tc.desc Verify isReadonly returns true for GenericBox.capacity (generic class with type parameter T, readonly field)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsReadonlyAtTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericBox<string>>();
      let field = cls.getStaticField('capacity');
      expect(field!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_TWO_0900
     * @tc.name testStaticFieldIsReadonlyAtTwo009
     * @tc.desc Verify isReadonly returns false for GenericStore.itemCount (generic class, non-readonly field)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsReadonlyAtTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericStore<int>>();
      let field = cls.getStaticField('itemCount');
      expect(field!.isReadonly()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_TWO_1000
     * @tc.name testStaticFieldIsReadonlyAtTwo010
     * @tc.desc Verify isReadonly returns true for TestClass088.initializedConst after mutating unrelated field isReady
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsReadonlyAtTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      TestClass088.isReady = true;
      let cls = Class.from<TestClass088>();
      let field = cls.getStaticField('initializedConst');
      expect(field!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_TWO_1100
     * @tc.name testStaticFieldIsReadonlyAtTwo011
     * @tc.desc Verify isReadonly does not alter TestClass089.VALUE field value (value unchanged before/after isReadonly call)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsReadonlyAtTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass089>();
      let field = cls.getStaticField('VALUE');
      let valBefore = TestClass089.VALUE;
      field!.isReadonly();
      let valAfter = TestClass089.VALUE;
      expect(valBefore).assertEqual(42);
      expect(valAfter).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_TWO_1200
     * @tc.name testStaticFieldIsReadonlyAtTwo012
     * @tc.desc Verify setValue and getValue on non-readonly StrField.val works, isReadonly still false after setValue
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsReadonlyAtTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StrField>();
      let field = cls.getStaticField('val');
      let initial: Object = field!.getValue()! as Object;
      field!.setValue('Hello');
      expect(field!.isReadonly()).assertFalse();
      let value: Object = field!.getValue()! as Object;
      expect(value).assertEqual('Hello');
      field!.setValue(initial as string);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_TWO_1300
     * @tc.name testStaticFieldIsReadonlyAtTwo013
     * @tc.desc Verify setValue on readonly field throws and isReadonly remains true after attempt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsReadonlyAtTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NewRoComboClass>();
      let field = cls.getStaticField('roVal');
      expect(field!.isReadonly()).assertTrue();
      try {
        field!.setValue(999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(field!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_TWO_1400
     * @tc.name testStaticFieldIsReadonlyAtTwo014
     * @tc.desc Verify isReadonly and isPublic both return true for public readonly field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsReadonlyAtTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyIntField>();
      let field = cls.getStaticField('val');
      expect(field!.isReadonly()).assertTrue();
      expect(field!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_TWO_1500
     * @tc.name testStaticFieldIsReadonlyAtTwo015
     * @tc.desc Verify getType and isReadonly chain on readonly string field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsReadonlyAtTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyStrField>();
      let field = cls.getStaticField('val');
      expect(field!.getType().getName()).assertEqual('std.core.String');
      expect(field!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_TWO_1600
     * @tc.name testStaticFieldIsReadonlyAtTwo016
     * @tc.desc Verify isReadonly unchanged after multiple getValue calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsReadonlyAtTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyIntField>();
      let field = cls.getStaticField('val');
      let ro1: boolean = field!.isReadonly();
      field!.getValue();
      let ro2: boolean = field!.isReadonly();
      field!.getValue();
      expect(ro1).assertTrue();
      expect(ro2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_TWO_1700
     * @tc.name testStaticFieldIsReadonlyAtTwo017
     * @tc.desc Verify equals returns true for same readonly field obtained twice
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsReadonlyAtTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyStrField>();
      let f1 = cls.getStaticField('val');
      let f2 = cls.getStaticField('val');
      expect(f1!.isReadonly()).assertTrue();
      expect(f1!.equals(f2!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISREADONLY_TWO_1800
     * @tc.name testStaticFieldIsReadonlyAtTwo018
     * @tc.desc Verify getOwner returns ReadonlyStrField and isReadonly true on readonly field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsReadonlyAtTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ReadonlyStrField>();
      let field = cls.getStaticField('val');
      let owner = field!.getOwner();
      expect(owner.getName().endsWith('ReadonlyStrField')).assertTrue();
      expect(field!.isReadonly()).assertTrue();
    });

  });
}
