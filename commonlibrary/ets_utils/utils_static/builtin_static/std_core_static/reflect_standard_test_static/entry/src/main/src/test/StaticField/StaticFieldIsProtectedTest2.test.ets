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
import { StaticField } from '../Util.test';
class IntField {
  static val: int = 0;
}

class ProtectedReadonlyIntField {
  protected static readonly val: int = 0;
}
class AllPublicFieldsClass038 {
  public static x: int = 1;
  public static y: string = 'y';
}

class PublicDollarField072 {
  public static $special: string = '$$$';
}

class ClassWithStaticMethods107 {
  public static fieldVal: int = 10;
  public static getField(): int {
    return ClassWithStaticMethods107.fieldVal;
  }
}

class OwnerCheckClass108 {
  public static owned: int = 1;
}

class NameCheckClass109 {
  public static targetField: string = 'target';
}

export default function staticFieldIsProtectedTest2(): void {
  describe('StaticFieldIsProtectedTest2', (): void => {
    beforeAll(() => {});

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_TWO_0100
     * @tc.name testStaticFieldIsProtectedAtTwo001
     * @tc.desc Verify isProtected returns false for IntField.val (direct chained assertion, assertFalse)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsProtectedAtTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField>();
      let field = cls.getStaticField('val');
      expect(field!.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_TWO_0200
     * @tc.name testStaticFieldIsProtectedAtTwo002
     * @tc.desc Verify isProtected returns false for AllPublicFieldsClass038.x and y (all public fields)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsProtectedAtTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AllPublicFieldsClass038>();
      let fx = cls.getStaticField('x');
      let fy = cls.getStaticField('y');
      expect(fx!.isProtected()).assertFalse();
      expect(fy!.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_TWO_0300
     * @tc.name testStaticFieldIsProtectedAtTwo003
     * @tc.desc Verify getStaticField returns undefined for protected readonly field ProtectedReadonlyIntField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsProtectedAtTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ProtectedReadonlyIntField>();
      let field = cls.getStaticField('val');
      expect(field).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_TWO_0400
     * @tc.name testStaticFieldIsProtectedAtTwo004
     * @tc.desc Verify isProtected returns false for PublicDollarField072.$special
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsProtectedAtTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PublicDollarField072>();
      let field = cls.getStaticField('$special');
      expect(field!.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_TWO_0500
     * @tc.name testStaticFieldIsProtectedAtTwo005
     * @tc.desc Verify StaticField null isProtected throws NullPointerError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsProtectedAtTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let field: StaticField | null = null;
      try {
        field!.isProtected();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_TWO_0600
     * @tc.name testStaticFieldIsProtectedAtTwo006
     * @tc.desc Verify isProtected false and isPublic true for IntField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsProtectedAtTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField>();
      let field = cls.getStaticField('val');
      expect(field!.isProtected()).assertFalse();
      expect(field!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_TWO_0700
     * @tc.name testStaticFieldIsProtectedAtTwo007
     * @tc.desc Verify isProtected and isPrivate both return false for IntField.val (two-access-modifier check)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsProtectedAtTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField>();
      let field = cls.getStaticField('val');
      expect(field!.isProtected()).assertFalse();
      expect(field!.isPrivate()).assertFalse();
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_TWO_0800
     * @tc.name testStaticFieldIsProtectedAtTwo008
     * @tc.desc Verify exactly one of isProtected/isPublic/isPrivate returns true for IntField.val (true count = 1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsProtectedAtTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntField>();
      let field = cls.getStaticField('val');
      let protResult: boolean = field!.isProtected();
      let pubResult: boolean = field!.isPublic();
      let privResult: boolean = field!.isPrivate();
      let trueCount: int = (protResult ? 1 : 0) + (pubResult ? 1 : 0) + (privResult ? 1 : 0);
      expect(trueCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_TWO_0900
     * @tc.name testStaticFieldIsProtectedAtTwo009
     * @tc.desc Verify isProtected false and getOwner name matches OwnerCheckClass108 for owned field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsProtectedAtTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerCheckClass108>();
      let field = cls.getStaticField('owned');
      expect(field!.isProtected()).assertFalse();
      expect(field!.getOwner().getName().endsWith('OwnerCheckClass108')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_ISPROTECTED_TWO_1000
     * @tc.name testStaticFieldIsProtectedAtTwo010
     * @tc.desc Verify getName returns targetField and isProtected false for NameCheckClass109.targetField
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldIsProtectedAtTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NameCheckClass109>();
      let field = cls.getStaticField('targetField');
      expect(field!.getName()).assertEqual('targetField');
      expect(field!.isProtected()).assertFalse();
    });
  });
}
