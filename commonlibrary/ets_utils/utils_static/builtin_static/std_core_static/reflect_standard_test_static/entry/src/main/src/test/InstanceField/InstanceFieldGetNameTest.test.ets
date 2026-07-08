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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

class MyClass001 {
  public name: string = 'test';
}

class UnicodeField005 {
  public 名字: string = '中文';
  public имя: string = 'Russian';
  public 名前: string = 'Japanese';
}

class TestClass008 {
  public value: int = 0;
}

class TestClass009 {
  public validField: string = '';
}

class LongName015 {
  public veryLongFieldName: string = '';
}

class ShortName016 {
  public a: string = '';
  public b: int = 0;
}

class NumberStart017 {
  public field1x: string = '';
  public field2x: string = '';
}

class TestClass018 {
  public targetField: string = 'target';
  public otherField: string = 'other';
}

class GroupedFields019 {
  public user_id: int = 0;
  public user_name: string = '';
  public user_age: int = 0;
  public post_id: int = 1;
  public post_title: string = '';
}

class TestClass020 {
  public camelCase: string = '';
  public PascalCase: string = '';
  public snake_case: string = '';
}

class TestClass022 {
  public field1: string = '';
  public field2: int = 0;
  public field1_duplicate: string = '';
}

class TestClass023 {
  public data: string = '';
}

class TestClass025 {
  public fieldA: string = 'valueA';
  public fieldB: string = 'valueB';
  public fieldC: string = 'valueC';
}

class StaticTest024 {
  public static STATIC_VALUE: string = 'static';
  public instanceValue: string = 'instance';
}

export default function InstanceFieldGetNameTest(): void {
  describe('InstanceFieldGetNameTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0100
     * @tc.name testGetName0100
     * @tc.desc Verify calling getName on initialized InstanceField
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      cls.initialize();
      let field = cls.getInstanceField('name')!;
      let fieldName = field.getName();
      expect(fieldName).assertEqual('name');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0200
     * @tc.name testGetName0200
     * @tc.desc Verify getName returns correct field name without explicit initialize
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let fieldName = field.getName();
      expect(fieldName).assertEqual('name');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0300
     * @tc.name testGetName0300
     * @tc.desc Verify getName returns string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field = cls.getInstanceField('name')!;
      let fieldName = field.getName();
      expect(typeof fieldName).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0400
     * @tc.name testGetName0400
     * @tc.desc Verify very long field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<LongName015>();
      let fields = cls.getInstanceFields();

      expect(fields.length).assertEqual(1);
      expect(fields[0].getName()).assertEqual('veryLongFieldName');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0500
     * @tc.name testGetName0500
     * @tc.desc Verify shortest field name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ShortName016>();
      expect(cls.getInstanceField('a')!.getName()).assertEqual('a');
      expect(cls.getInstanceField('b')!.getName()).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0600
     * @tc.name testGetName0600
     * @tc.desc Verify field names length is greater than zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumberStart017>();
      let fields = cls.getInstanceFields();

      expect(fields.length).assertEqual(2);
      for (let i = 0; i < fields.length; i++) {
        let name = fields[i].getName();
        expect(name.length > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0700
     * @tc.name testGetName0700
     * @tc.desc Verify using getName() to find specific field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass018>();
      let fields = cls.getInstanceFields();

      let targetField: string | undefined = undefined;
      for (let j = 0; j < fields.length; j++) {
        if (fields[j].getName() === 'targetField') {
          targetField = fields[j].getName();
          break;
        }
      }
      expect(targetField !== undefined).assertTrue();
      expect(targetField!).assertEqual('targetField');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0800
     * @tc.name testGetName0800
     * @tc.desc Verify grouping fields by name prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GroupedFields019>();
      let fields = cls.getInstanceFields();

      let userCount: int = 0;
      let postCount: int = 0;
      for (let j = 0; j < fields.length; j++) {
        if (fields[j].getName().startsWith('user_')) {
          userCount++;
        }
        if (fields[j].getName().startsWith('post_')) {
          postCount++;
        }
      }

      expect(userCount).assertEqual(3);
      expect(postCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_0900
     * @tc.name testGetName0900
     * @tc.desc Verify field name matches naming conventions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass020>();
      let fields = cls.getInstanceFields();

      for (let i = 0; i < fields.length; i++) {
        let name = fields[i].getName();

        let isValid: boolean = true;
        for (let k = 0; k < name.length; k++) {
          let ch: string = name[k];
          if (!((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z') || (ch >= '0' && ch <= '9') || ch === '_')) {
            isValid = false;
            break;
          }
        }
        expect(isValid).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_1000
     * @tc.name testGetName1000
     * @tc.desc Verify getName() and getOwner() combined usage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass008>();
      let field = cls.getInstanceField('value')!;

      let ownerName = field.getOwner().getName();
      let fieldName = field.getName();
      expect(fieldName).assertEqual('value');
      expect(ownerName.includes('TestClass008')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_1100
     * @tc.name testGetName1100
     * @tc.desc Verify field name uniqueness within same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass022>();
      let fields = cls.getInstanceFields();

      let fieldNames: Array<string> = [];
      for (let j = 0; j < fields.length; j++) {
        fieldNames.push(fields[j].getName());
      }
      let uniqueNames = new Set<string>(fieldNames);

      expect(fieldNames.length).assertEqual(uniqueNames.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_1200
     * @tc.name testGetName1200
     * @tc.desc Verify getName() returns consistent value on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass023>();
      let field = cls.getInstanceField('data')!;

      for (let i = 0; i < 100; i++) {
        let name = field.getName();
        expect(name).assertEqual('data');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_1300
     * @tc.name testGetName1300
     * @tc.desc Verify StaticField and InstanceField both have getName()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticTest024>();

      let staticField = cls.getStaticField('STATIC_VALUE')!;
      expect(staticField.getName()).assertEqual('STATIC_VALUE');

      let instanceField = cls.getInstanceField('instanceValue')!;
      expect(instanceField.getName()).assertEqual('instanceValue');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_1400
     * @tc.name testGetName1400
     * @tc.desc Verify collecting all field information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass025>();
      let fields = cls.getInstanceFields();

      expect(fields.length).assertEqual(3);
      for (let i = 0; i < fields.length; i++) {
        let field = fields[i];
        expect(field.getName().length > 0).assertTrue();
        expect(field.getType() !== null).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_1500
     * @tc.name testGetName1500
     * @tc.desc Verify Unicode field names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<UnicodeField005>();
      let fields = cls.getInstanceFields();

      expect(fields.length).assertEqual(3);
      let found = 0;
      for (let i = 0; i < fields.length; i++) {
        let name = fields[i].getName();
        if (name === '名字' || name === 'имя' || name === '名前') {
          found++;
        }
      }
      expect(found).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_1600
     * @tc.name testGetName1600
     * @tc.desc Verify getName with getOwner returns qualified name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass009>();
      let field = cls.getInstanceField('validField')!;
      let name = field.getName();
      let ownerName = field.getOwner().getName();
      expect(name).assertEqual('validField');
      expect(ownerName.includes('TestClass009')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_NAME_1700
     * @tc.name testGetName1700
     * @tc.desc Verify getName consistency across multiple InstanceField instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetName1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let field1 = cls.getInstanceField('name')!;
      let field2 = cls.getInstanceField('name')!;
      expect(field1.getName()).assertEqual(field2.getName());
    });

  });
}
