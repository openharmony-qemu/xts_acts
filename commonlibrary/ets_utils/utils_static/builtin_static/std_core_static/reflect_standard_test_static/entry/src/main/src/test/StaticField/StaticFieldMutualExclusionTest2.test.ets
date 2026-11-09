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

class PublicIntField {
  public static val: int = 10;
}

class PublicStrField {
  public static val: string = 'hello';
}

class PublicBoolField {
  public static val: boolean = true;
}



class PublicReadonlyField {
  public static readonly val: int = 42;
}



export default function staticFieldMutualExclusionTest2(): void {
  describe('StaticFieldMutualExclusionTest2', (): void => {
    beforeAll(() => {});

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_MUTEX_TWO_0100
     * @tc.name testStaticFieldMutExAtTwo001
     * @tc.desc Verify isPublic=true, isPrivate=false, isProtected=false on public string field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldMutExAtTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PublicStrField>();
      let field = cls.getStaticField('val');
      let isPub: boolean = field!.isPublic();
      let isPriv: boolean = field!.isPrivate();
      let isProt: boolean = field!.isProtected();
      expect(isPub).assertTrue();
      expect(isPriv).assertFalse();
      expect(isProt).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_MUTEX_TWO_0200
     * @tc.name testStaticFieldMutExAtTwo002
     * @tc.desc Verify isPublic=true, isPrivate=false, isProtected=false on public boolean field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldMutExAtTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PublicBoolField>();
      let field = cls.getStaticField('val');
      expect(field!.isPublic()).assertTrue();
      expect(field!.isPrivate()).assertFalse();
      expect(field!.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_MUTEX_TWO_0300
     * @tc.name testStaticFieldMutExAtTwo003
     * @tc.desc Verify isPublic=true, isPrivate=false, isProtected=false and isReadonly=true on public readonly field
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldMutExAtTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PublicReadonlyField>();
      let field = cls.getStaticField('val');
      expect(field!.isPublic()).assertTrue();
      expect(field!.isPrivate()).assertFalse();
      expect(field!.isProtected()).assertFalse();
      expect(field!.isReadonly()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_MUTEX_TWO_0400
     * @tc.name testStaticFieldMutExAtTwo004
     * @tc.desc Verify isPublic=true, isPrivate=false, isProtected=false after repeated calls (consistency) on PublicIntField.val
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldMutExAtTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PublicIntField>();
      let field = cls.getStaticField('val');
      let pub1: boolean = field!.isPublic();
      let priv1: boolean = field!.isPrivate();
      let prot1: boolean = field!.isProtected();
      let pub2: boolean = field!.isPublic();
      let priv2: boolean = field!.isPrivate();
      let prot2: boolean = field!.isProtected();
      expect(pub1).assertEqual(pub2);
      expect(priv1).assertEqual(priv2);
      expect(prot1).assertEqual(prot2);
      expect(pub1).assertTrue();
      expect(priv1).assertFalse();
      expect(prot1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_MUTEX_TWO_0500
     * @tc.name testStaticFieldMutExAtTwo005
     * @tc.desc Verify isPublic=true, isPrivate=false, isProtected=false on same-name field 'val' across different classes (PublicIntField vs PublicStrField)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldMutExAtTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clsA = Class.from<PublicIntField>();
      let clsB = Class.from<PublicStrField>();
      let fA = clsA.getStaticField('val');
      let fB = clsB.getStaticField('val');
      expect(fA!.isPublic()).assertTrue();
      expect(fB!.isPublic()).assertTrue();
      expect(fA!.isPrivate()).assertFalse();
      expect(fB!.isPrivate()).assertFalse();
      expect(fA!.isProtected()).assertFalse();
      expect(fB!.isProtected()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STATICFIELD_MUTEX_TWO_0600
     * @tc.name testStaticFieldMutExAtTwo006
     * @tc.desc Verify isPublic() returns true, isReadonly() returns false, isPrivate() returns false, isProtected() returns false for PublicIntField.val (non-readonly public field)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testStaticFieldMutExAtTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PublicIntField>();
      let field = cls.getStaticField('val');
      expect(field!.isPublic()).assertTrue();
      expect(field!.isReadonly()).assertFalse();
      expect(field!.isPrivate()).assertFalse();
      expect(field!.isProtected()).assertFalse();
    });
  });
}
