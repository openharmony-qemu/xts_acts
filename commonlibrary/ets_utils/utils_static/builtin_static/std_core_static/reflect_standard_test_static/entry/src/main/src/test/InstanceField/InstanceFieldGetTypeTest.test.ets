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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

class MyClass001 {
  public name: string = 'test';
}

class StaticTypes024 {
  public static STATIC_VALUE: string = 'static';
  public instanceValue: string = 'instance';
}

class ComplexTypes018 {
  public arrayOfArrays: Array<Array<int>> = [[]];
  public mapOfArrays: Map<string, Array<int>> = new Map<string, Array<int>>();
  public unionOfArrays: Array<int> = [];
}

class Node019 {
  public value: int = 0;
  public next: Node019 | null = null;
}

class MixedTypes020 {
  public intField: int = 0;
  public stringField: string = '';
}

class ConversionClass021 {
  public value: Object = {};
}

class TestClass022 {
  public data: string = '';
}

class TestClass023 {
  public value: int = 0;
}

export default function InstanceFieldGetTypeTest(): void {
  describe('InstanceFieldGetTypeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0100
     * @tc.name testGetType0100
     * @tc.desc Verify nested complex types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ComplexTypes018>();
      let fields = cls.getInstanceFields();

      for (let i = 0; i < fields.length; i++) {
        let fieldType = fields[i].getType();
        expect(fieldType !== null).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0200
     * @tc.name testGetType0200
     * @tc.desc Verify getType() on self-referencing field returns non-null type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Node019>();
      let nextField = cls.getInstanceField('next')!;
      let nextType = nextField.getType();

      expect(nextType !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0300
     * @tc.name testGetType0300
     * @tc.desc Verify using getType() for type checking
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedTypes020>();
      let fields = cls.getInstanceFields();

      for (let i = 0; i < fields.length; i++) {
        let fieldType = fields[i].getType();
        expect(fieldType !== null).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0400
     * @tc.name testGetType0400
     * @tc.desc Verify converting for Object type field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConversionClass021>();
      let field = cls.getInstanceField('value')!;
      let fieldType = field.getType();

      expect(fieldType.getName().includes('Object')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0500
     * @tc.name testGetType0500
     * @tc.desc Verify performance of repeated getType() calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass022>();
      let field = cls.getInstanceField('data')!;

      for (let i = 0; i < 100; i++) {
        let fieldType = field.getType();
        expect(fieldType !== null).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0600
     * @tc.name testGetType0600
     * @tc.desc Verify same field returns same Class object on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass023>();
      let field = cls.getInstanceField('value')!;

      let type1 = field.getType();
      let type2 = field.getType();
      let type3 = field.getType();

      expect(type1.getName()).assertEqual(type2.getName());
      expect(type2.getName()).assertEqual(type3.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0700
     * @tc.name testGetType0700
     * @tc.desc Verify StaticField also has getType()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticTypes024>();

      let staticField = cls.getStaticField('STATIC_VALUE')!;
      let staticFieldType = staticField.getType();
      expect(staticFieldType !== null).assertTrue();
      expect(staticFieldType.getName()).assertEqual('std.core.String');

      let instanceField = cls.getInstanceField('instanceValue')!;
      let instanceFieldType = instanceField.getType();
      expect(instanceFieldType !== null).assertTrue();
      expect(instanceFieldType.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0800
     * @tc.name testGetType0800
     * @tc.desc Verify field type vs owning class with getType and getOwner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass023>();
      let field = cls.getInstanceField('value')!;

      let fieldType = field.getType();
      expect(fieldType !== null).assertTrue();

      let ownerClass = field.getOwner();
      expect(ownerClass.getName().includes('TestClass023')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_0900
     * @tc.name testGetType0900
     * @tc.desc Verify primitive type name strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MixedTypes020>();
      let intField = cls.getInstanceField('intField')!;
      let strField = cls.getInstanceField('stringField')!;

      expect(intField.getType().getName()).assertEqual('i32');
      expect(strField.getType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1000
     * @tc.name testGetType1000
     * @tc.desc Verify array and union type names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ComplexTypes018>();
      let fields = cls.getInstanceFields();

      for (let i = 0; i < fields.length; i++) {
        let typeName = fields[i].getType().getName();
        expect(typeName.length > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GET_TYPE_1100
     * @tc.name testGetType1100
     * @tc.desc Verify getType returns consistent results across field instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetType1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass023>();
      let field1 = cls.getInstanceField('value')!;
      let field2 = cls.getInstanceField('value')!;
      expect(field1.getType().getName()).assertEqual(field2.getType().getName());
    });

  });
}
