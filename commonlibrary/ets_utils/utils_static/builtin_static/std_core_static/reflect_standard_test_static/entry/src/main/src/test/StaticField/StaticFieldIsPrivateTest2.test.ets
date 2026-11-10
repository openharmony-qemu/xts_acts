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

class StrField {
  static val: string = '';
}

class NumField {
  static val: number = 0;
}

class BoolField {
  static val: boolean = false;
}

class GrandParent052 {
  public static gpVal: number = 1;
}

class TestClass068 {
  public static x: number = 0;
  public static y: string = '';
}

class TestClass091 {
  public static data: number = 0;
  public static getData(): number {
    return TestClass091.data;
  }
}

class ParentClass043 {
  public static parentSecret: number = 99;
}

class ChildClass_ParentClass043 extends ParentClass043 {
  public static childData030: string = 'child';
}

class Child_Parent052 extends GrandParent052 {
  public static cVal: number = 3;
}


class Container<T> {
  public static defaultSize: number = 10;
}

class CacheField {
  static $cache: string = '';
}

class PrivateIntField {
  private static val: int = 0;
}
export default function staticFieldIsPrivateTest2(): void {
  describe('StaticFieldIsPrivateTest2', (): void => {
    beforeAll(() => {});

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_TWO_0100
     * @tc.name testStaticFieldIsPrivateAtTwo001
     * @tc.desc Verify isPrivate returns false for NumField.val (via intermediate variable result)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPrivateAtTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumField>();
      let field = cls.getStaticField('val');
      let result: boolean = field!.isPrivate();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_TWO_0200
     * @tc.name testStaticFieldIsPrivateAtTwo002
     * @tc.desc Verify isPrivate returns false for BoolField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPrivateAtTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BoolField>();
      let field = cls.getStaticField('val');
      expect(field!.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_TWO_0300
     * @tc.name testStaticFieldIsPrivateAtTwo003
     * @tc.desc Verify getStaticField returns undefined for inherited public field parentSecret on ChildClass_ParentClass043
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPrivateAtTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ChildClass_ParentClass043>();
      let field = cls.getStaticField('parentSecret');
      expect(field).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_TWO_0400
     * @tc.name testStaticFieldIsPrivateAtTwo004
     * @tc.desc Verify isPrivate() returns false for GrandParent052.gpVal (two Class.from calls) and Child_Parent052.cVal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPrivateAtTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let gpCls = Class.from<GrandParent052>();
      let pCls = Class.from<GrandParent052>();
      let cCls = Class.from<Child_Parent052>();
      expect(gpCls.getStaticField('gpVal')!.isPrivate()).assertFalse();
      expect(pCls.getStaticField('gpVal')!.isPrivate()).assertFalse();
      expect(cCls.getStaticField('cVal')!.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_TWO_0500
     * @tc.name testStaticFieldIsPrivateAtTwo005
     * @tc.desc Verify isPrivate returns false for CacheField.$cache (public field with dollar-prefixed name)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPrivateAtTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<CacheField>();
      let field = cls.getStaticField('$cache');
      expect(field!.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_TWO_0600
     * @tc.name testStaticFieldIsPrivateAtTwo006
     * @tc.desc Verify isPrivate returns false for TestClass068.x and y (two-field class, chained assertion)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPrivateAtTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass068>();
      expect(cls.getStaticField('x')!.isPrivate()).assertFalse();
      expect(cls.getStaticField('y')!.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_TWO_0700
     * @tc.name testStaticFieldIsPrivateAtTwo007
     * @tc.desc Verify isPrivate false and isPublic true for NumField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPrivateAtTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumField>();
      let field = cls.getStaticField('val');
      expect(field!.isPrivate()).assertFalse();
      expect(field!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_TWO_0800
     * @tc.name testStaticFieldIsPrivateAtTwo008
     * @tc.desc Verify isPrivate and isProtected both return false for NumField.val (checking two access modifiers)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPrivateAtTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumField>();
      let field = cls.getStaticField('val');
      expect(field!.isPrivate()).assertFalse();
      expect(field!.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_TWO_0900
     * @tc.name testStaticFieldIsPrivateAtTwo009
     * @tc.desc Verify isPrivate returns false after calling getName on NumField.val (method chaining idempotency)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPrivateAtTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumField>();
      let field = cls.getStaticField('val');
      field!.getName();
      expect(field!.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_TWO_1000
     * @tc.name testStaticFieldIsPrivateAtTwo010
     * @tc.desc Verify isPrivate returns false after calling getType().getName() on NumField.val (method chaining)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPrivateAtTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumField>();
      let field = cls.getStaticField('val');
      field!.getType().getName();
      expect(field!.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_TWO_1100
     * @tc.name testStaticFieldIsPrivateAtTwo011
     * @tc.desc Verify isPrivate() returns false for NumField.val after multiple calls across two separate Class.from instances (NumField and StrField)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPrivateAtTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fA = Class.from<NumField>().getStaticField('val');
      let fB = Class.from<StrField>().getStaticField('val');
      expect(fA!.isPrivate()).assertFalse();
      expect(fB!.isPrivate()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_TWO_1200
     * @tc.name testStaticFieldIsPrivateAtTwo012
     * @tc.desc Verify isPublic true for NumField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPrivateAtTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumField>();
      let field = cls.getStaticField('val');
      expect(field!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_TWO_1300
     * @tc.name testStaticFieldIsPrivateAtTwo013
     * @tc.desc Verify isPrivate on nonExistent throws Error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPrivateAtTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumField>();
      let field = cls.getStaticField('nonExistent');
      try {
        field!.isPrivate();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_TWO_1400
     * @tc.name testStaticFieldIsPrivateAtTwo014
     * @tc.desc Verify isPrivate returns false for Container.defaultSize (generic Container class with number type parameter)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPrivateAtTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Container<number>>();
      let field = cls.getStaticField('defaultSize');
      expect(field!.isPrivate()).assertFalse();
    });
/**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPRIVATE_TWO_1500
     * @tc.name testStaticFieldIsPrivateAtTwo015
     * @tc.desc Verify getStaticField returns undefined for private static field PrivateIntField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsPrivateAtTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PrivateIntField>();
      let field = cls.getStaticField('val');
      expect(field).assertUndefined();
    });

  });
}
