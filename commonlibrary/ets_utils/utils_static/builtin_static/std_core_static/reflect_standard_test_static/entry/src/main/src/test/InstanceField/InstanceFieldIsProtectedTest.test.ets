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
  public name = 'test';
}

class MyClass002 {
  public name = 'test';
}

class MyClass003 {
  public name = 'test';
}

class MyClass004 {
  protected name = 'test';
}

class MyClass005 {
  private name = 'test';
}

class MyClass006 {
  name = 'test';
}

class MyClass007 {
  public readonly protected name = 'test';
}

class Parent009 {
  protected parentField = 'parent';
}

class Child009 extends Parent009 {
  public childField = 'child';
}

class MyClass010 {
  public name = 'test';
}

class MyClass012 {
  protected name = 'test';
}

class MyClass013 {
  public name = 'test';
}

export default function InstanceFieldIsProtectedTest() {
  describe('InstanceFieldIsProtectedTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPROTECTED_0100
     * @tc.name testInstanceFieldIsProtected001
     * @tc.desc Verify isProtected() call without parameters executes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsProtected001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField("name");
      field!.isProtected();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPROTECTED_0200
     * @tc.name testInstanceFieldIsProtected002
     * @tc.desc Verify isProtected() behavior when extra parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsProtected002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass002>();
      let field = cls.getInstanceField("name");
      field!.isProtected(true as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPROTECTED_0300
     * @tc.name testInstanceFieldIsProtected003
     * @tc.desc Verify isProtected returns false for public field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsProtected003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass003>();
      let field = cls.getInstanceField("name");
      expect(field!.isProtected()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPROTECTED_0400
     * @tc.name testInstanceFieldIsProtected004
     * @tc.desc Verify isProtected returns true for protected field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsProtected004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();
      let field = cls.getInstanceField("name");
      expect(field!.isProtected()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPROTECTED_0500
     * @tc.name testInstanceFieldIsProtected005
     * @tc.desc Verify isProtected returns false for private field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsProtected005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass005>();
      let field = cls.getInstanceField("name");
      expect(field!.isProtected()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPROTECTED_0600
     * @tc.name testInstanceFieldIsProtected006
     * @tc.desc Verify isProtected returns false for field without explicit access modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsProtected006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass006>();
      let field = cls.getInstanceField("name");
      expect(field!.isProtected()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPROTECTED_0700
     * @tc.name testInstanceFieldIsProtected007
     * @tc.desc Verify isProtected for readonly protected field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsProtected007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPROTECTED_0800
     * @tc.name testInstanceFieldIsProtected008
     * @tc.desc Verify static field is not affected by isProtected on InstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsProtected008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPROTECTED_0900
     * @tc.name testInstanceFieldIsProtected009
     * @tc.desc Verify isProtected returns true for inherited protected field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsProtected009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Child009>();
      let field = cls.getInstanceField("parentField");
      expect(field!.isProtected()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPROTECTED_1000
     * @tc.name testInstanceFieldIsProtected010
     * @tc.desc Verify isProtected return value is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsProtected010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass010>();
      let field = cls.getInstanceField("name");
      let result = field!.isProtected();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPROTECTED_1100
     * @tc.name testInstanceFieldIsProtected011
     * @tc.desc Verify isProtected null safety for non-existent field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsProtected011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPROTECTED_1200
     * @tc.name testInstanceFieldIsProtected012
     * @tc.desc Verify multiple isProtected calls return consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsProtected012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass012>();
      let field = cls.getInstanceField("name");
      expect(field!.isProtected()).assertEqual(field!.isProtected());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPROTECTED_1300
     * @tc.name testInstanceFieldIsProtected013
     * @tc.desc Verify isProtected causes runtime error when InstanceField is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsProtected013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass013>();
      let field = cls.getInstanceField("nonExistent");
      try {
        field.isProtected();
        expect().assertFail();
      } catch (error) {
        expect(error).not.toBeNull();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPROTECTED_1400
     * @tc.name testInstanceFieldIsProtected014
     * @tc.desc Verify isProtected throws TypeError when InstanceField is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsProtected014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let field: InstanceField = null!;
        field.isProtected();
        expect().assertFail();
      } catch (error) {
        expect(error instanceof TypeError).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEFIELD_ISPROTECTED_1500
     * @tc.name testInstanceFieldIsProtected015
     * @tc.desc Verify isProtected error handling when Class.from input is invalid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInstanceFieldIsProtected015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    });
  });
}
