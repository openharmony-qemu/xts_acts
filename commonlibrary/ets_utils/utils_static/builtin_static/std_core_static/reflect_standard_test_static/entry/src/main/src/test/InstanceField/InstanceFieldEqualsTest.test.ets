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
  public name: string = 'test';
}

class MyClass004 {
  public name: string = 'test';
  public age: int = 25;
}
class OtherClass006 {
  public name: string = 'other';
}
class Parent023 {
  public name: string = 'parent';
}
class Child023 extends Parent023 {
  public age: int = 10;
}

export default function InstanceFieldEqualsTest(): void {
  let runTests: () => void = (): void => {
        // FILTER: bit0=FUNCTION bit17=MEDIUMTEST bit26=LEVEL2
    const FILTER: int = 0B1 | (0B1 << 17) | (0B1 << 26)
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0100
     * @tc.name testEquals001
     * @tc.desc Verify equals returns true for same field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals001', FILTER, (): void => {
      let cls = Class.from<MyClass001>();
      let field1 = cls.getInstanceField("name");
      let field2 = cls.getInstanceField("name");
      expect(field1!.equals(field2!)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0200
     * @tc.name testEquals004
     * @tc.desc Verify same field same class returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals004', FILTER, (): void => {
      let cls = Class.from<MyClass004>();
      let field1 = cls.getInstanceField("name");
      let field2 = cls.getInstanceField("name");
      expect(field1!.equals(field2!)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0300
     * @tc.name testEquals005
     * @tc.desc Verify different fields same class returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals005', FILTER, (): void => {
      let cls = Class.from<MyClass004>();
      let field1 = cls.getInstanceField("name");
      let field2 = cls.getInstanceField("age");
      expect(field1!.equals(field2!)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0400
     * @tc.name testEquals006
     * @tc.desc Verify different classes same field name returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals006', FILTER, (): void => {
      let cls1 = Class.from<MyClass001>();
      let cls2 = Class.from<OtherClass006>();
      let field1 = cls1.getInstanceField("name");
      let field2 = cls2.getInstanceField("name");
      expect(field1!.equals(field2!)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0500
     * @tc.name testEquals007
     * @tc.desc Verify InstanceField equals itself returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals007', FILTER, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField("name");
      expect(field!.equals(field!)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0600
     * @tc.name testEquals011
     * @tc.desc Verify non-existent field returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals011', FILTER, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField("noExist");
      expect(field === undefined).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0700
     * @tc.name testEquals012
     * @tc.desc Verify equals return value and type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals012', FILTER, (): void => {
      let cls = Class.from<MyClass001>();
      let field1 = cls.getInstanceField("name");
      let field2 = cls.getInstanceField("name");
      let result = field1!.equals(field2!);
      expect(result).assertTrue()
      expect(typeof result === 'boolean').assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0800
     * @tc.name testEquals016
     * @tc.desc Verify equals returns boolean for both match and mismatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals016', FILTER, (): void => {
      let cls = Class.from<MyClass004>();
      let field1 = cls.getInstanceField("name");
      let field2 = cls.getInstanceField("name");
      let field3 = cls.getInstanceField("age");
      let result1: boolean = field1!.equals(field2!);
      let result2: boolean = field1!.equals(field3!);
      expect(typeof result1 === 'boolean').assertTrue()
      expect(typeof result2 === 'boolean').assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_0900
     * @tc.name testEquals020
     * @tc.desc Verify equals completes with same field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals020', FILTER, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField("name");
      let finallyExecuted: boolean = false;
      let result: boolean = false;
      try {
        let other = cls.getInstanceField("name");
        result = field!.equals(other!)
      } finally {
        finallyExecuted = true;
      }
      expect(result).assertTrue()
      expect(finallyExecuted).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_1000
     * @tc.name testEquals021
     * @tc.desc Verify equals true while === false for different references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals021', FILTER, (): void => {
      let cls = Class.from<MyClass001>();
      let field1 = cls.getInstanceField("name");
      let field2 = cls.getInstanceField("name");
      expect(field1!.equals(field2!)).assertTrue()
      expect(field1! === field2!).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_1100
     * @tc.name testEquals022
     * @tc.desc Verify mutual equals for multiple getInstanceField calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals022', FILTER, (): void => {
      let cls = Class.from<MyClass001>();
      let field1 = cls.getInstanceField("name");
      let field2 = cls.getInstanceField("name");
      let field3 = cls.getInstanceField("name");
      expect(field1!.equals(field2!)).assertTrue()
      expect(field2!.equals(field3!)).assertTrue()
      expect(field1!.equals(field3!)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_1200
     * @tc.name testEquals023
     * @tc.desc Verify parent field compared with child field returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals023', FILTER, (): void => {
      let cls1 = Class.from<Parent023>();
      let cls2 = Class.from<Child023>();
      let field1 = cls1.getInstanceField("name");
      let field2 = cls2.getInstanceField("age");
      expect(field1 !== undefined).assertTrue();
      expect(field2 !== undefined).assertTrue();
      expect(field1!.equals(field2!)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_1300
     * @tc.name testEquals024
     * @tc.desc Verify symmetry a.equals(b) === b.equals(a)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals024', FILTER, (): void => {
      let cls = Class.from<MyClass004>();
      let field1 = cls.getInstanceField("name");
      let field2 = cls.getInstanceField("name");
      let field3 = cls.getInstanceField("age");
      expect(field1!.equals(field2!)).assertEqual(field2!.equals(field1!))
      expect(field1!.equals(field3!)).assertEqual(field3!.equals(field1!))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_1400
     * @tc.name testEquals025
     * @tc.desc Verify transitivity a.equals(b) && b.equals(c) => a.equals(c)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals025', FILTER, (): void => {
      let cls = Class.from<MyClass001>();
      let field1 = cls.getInstanceField("name");
      let field2 = cls.getInstanceField("name");
      let field3 = cls.getInstanceField("name");
      let ab = field1!.equals(field2!);
      let bc = field2!.equals(field3!);
      let ac = field1!.equals(field3!);
      expect(ab).assertTrue()
      expect(bc).assertTrue()
      expect(ac).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_1500
     * @tc.name testEquals026
     * @tc.desc Verify equals returns false for fields from unrelated classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals026', FILTER, (): void => {
      let cls1 = Class.from<MyClass001>();
      let cls2 = Class.from<Parent023>();
      let field1 = cls1.getInstanceField("name");
      let field2 = cls2.getInstanceField("name");
      expect(field1!.equals(field2!)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_EQUALS_1600
     * @tc.name testEquals027
     * @tc.desc Verify equals on same field returns consistent boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEquals027', FILTER, (): void => {
      let cls = Class.from<MyClass001>();
      let field1 = cls.getInstanceField("name");
      let field2 = cls.getInstanceField("name");
      let result = field1!.equals(field2!);
      expect(typeof result === 'boolean').assertTrue()
      expect(result).assertTrue()
    });
  };
  describe('InstanceFieldEqualsTest', runTests);
}
