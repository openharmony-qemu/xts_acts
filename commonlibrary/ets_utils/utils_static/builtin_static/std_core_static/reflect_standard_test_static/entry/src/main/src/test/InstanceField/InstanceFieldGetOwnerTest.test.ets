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

class Child020 extends Parent {
      public childData: string = 'child';
  }

class ChildClass005 extends ParentClass {
      public childField: string = 'child';
  }

class InnerClass013 {
          public innerField: string = 'inner';
      }

class MyClass001 {
      public name: string = 'test';
  }

class MyClass1014 {
      public field: string = '';
  }

class MyClass2014 {
      public field: string = '';
  }

class OuterClass013 {
      public outerField: string = 'outer';
      
      class InnerClass {
          public innerField: string = 'inner';
      }
  }

class OwnerClass004 {
      public field1: string = '';
      public field2: int = 0;
  }

class Parent020 {
      public parentData: string = 'parent';
  }

class ParentClass005 {
      public parentField: string = 'parent';
  }

class StaticTest019 {
      public static STATIC_VALUE: string = 'static';
      public instanceValue: string = 'instance';
  }

class TestClass003 {
      public value: int = 0;
  }

class TestClass007 {
      public value: int = 42;
  }

class TestClass008 {
      public myField: string = '';
  }

class TestClass015 {
      public data: string = 'test';
  }

class TestClass016 {
      public field1: string = '';
      public field2: int = 0;
      public field3: boolean = false;
  }

class TestClass017 {
      public data: string = '';
  }

class TestClass018 {
      public value: int = 0;
  }

class ExpgetOwnerClass021 {
      public data: string = 'default';
  }

class ExpgetOwnerClass022 {
      public data: string = 'default';
  }

class ExpgetOwnerClass023 {
      public data: string = 'default';
  }

class ExpgetOwnerClass024 {
      public data: string = 'default';
  }

class ExpgetOwnerClass025 {
      public data: string = 'default';
  }

class ExpgetOwnerClass026 {
      public data: string = 'default';
  }

class ExpgetOwnerClass027 {
      public data: string = 'default';
  }

class ExpgetOwnerClass028 {
      public data: string = 'default';
  }

class ExpgetOwnerClass029 {
      public data: string = 'default';
  }

class ExpgetOwnerClass030 {
      public data: string = 'default';
  }

class ExpgetOwnerClass031 {
      public data: string = 'default';
  }

class ExpgetOwnerClass032 {
      public data: string = 'default';
  }

class ExpgetOwnerClass033 {
      public data: string = 'default';
  }

class ExpgetOwnerClass034 {
      public data: string = 'default';
  }

class ExpgetOwnerClass035 {
      public data: string = 'default';
  }

class ExpgetOwnerClass036 {
      public data: string = 'default';
  }

class ExpgetOwnerClass037 {
      public data: string = 'default';
  }

class ExpgetOwnerClass038 {
      public data: string = 'default';
  }

class ExpgetOwnerClass039 {
      public data: string = 'default';
  }

class ExpgetOwnerClass040 {
      public data: string = 'default';
  }

class ExpgetOwnerClass041 {
      public data: string = 'default';
  }

class ExpgetOwnerClass042 {
      public data: string = 'default';
  }

class ExpgetOwnerClass043 {
      public data: string = 'default';
  }

class ExpgetOwnerClass044 {
      public data: string = 'default';
  }

class ExpgetOwnerClass045 {
      public data: string = 'default';
  }

class ExpgetOwnerClass046 {
      public data: string = 'default';
  }

class ExpgetOwnerClass047 {
      public data: string = 'default';
  }

class ExpgetOwnerClass048 {
      public data: string = 'default';
  }

class ExpgetOwnerClass049 {
      public data: string = 'default';
  }

class ExpgetOwnerClass050 {
      public data: string = 'default';
  }

class ExpgetOwnerClass051 {
      public data: string = 'default';
  }

class ExpgetOwnerClass052 {
      public data: string = 'default';
  }

class ExpgetOwnerClass053 {
      public data: string = 'default';
  }

class ExpgetOwnerClass054 {
      public data: string = 'default';
  }

class ExpgetOwnerClass055 {
      public data: string = 'default';
  }

class ExpgetOwnerClass056 {
      public data: string = 'default';
  }

class ExpgetOwnerClass057 {
      public data: string = 'default';
  }

class ExpgetOwnerClass058 {
      public data: string = 'default';
  }

class ExpgetOwnerClass059 {
      public data: string = 'default';
  }

class ExpgetOwnerClass060 {
      public data: string = 'default';
  }

class ExpgetOwnerClass061 {
      public data: string = 'default';
  }

class ExpgetOwnerClass062 {
      public data: string = 'default';
  }

class ExpgetOwnerClass063 {
      public data: string = 'default';
  }

class ExpgetOwnerClass064 {
      public data: string = 'default';
  }

class ExpgetOwnerClass065 {
      public data: string = 'default';
  }

class ExpgetOwnerClass066 {
      public data: string = 'default';
  }

class ExpgetOwnerClass067 {
      public data: string = 'default';
  }

class ExpgetOwnerClass068 {
      public data: string = 'default';
  }

class ExpgetOwnerClass069 {
      public data: string = 'default';
  }

class ExpgetOwnerClass070 {
      public data: string = 'default';
  }

class ExpgetOwnerClass071 {
      public data: string = 'default';
  }

class ExpgetOwnerClass072 {
      public data: string = 'default';
  }

class ExpgetOwnerClass073 {
      public data: string = 'default';
  }

class ExpgetOwnerClass074 {
      public data: string = 'default';
  }

class ExpgetOwnerClass075 {
      public data: string = 'default';
  }

class ExpgetOwnerClass076 {
      public data: string = 'default';
  }

class ExpgetOwnerClass077 {
      public data: string = 'default';
  }

class ExpgetOwnerClass078 {
      public data: string = 'default';
  }

class ExpgetOwnerClass079 {
      public data: string = 'default';
  }

class ExpgetOwnerClass080 {
      public data: string = 'default';
  }

class ExpgetOwnerClass081 {
      public data: string = 'default';
  }

class ExpgetOwnerClass082 {
      public data: string = 'default';
  }

class ExpgetOwnerClass083 {
      public data: string = 'default';
  }

class ExpgetOwnerClass084 {
      public data: string = 'default';
  }

class ExpgetOwnerClass085 {
      public data: string = 'default';
  }

class ExpgetOwnerClass086 {
      public data: string = 'default';
  }

class ExpgetOwnerClass087 {
      public data: string = 'default';
  }

class ExpgetOwnerClass088 {
      public data: string = 'default';
  }

class ExpgetOwnerClass089 {
      public data: string = 'default';
  }

class ExpgetOwnerClass090 {
      public data: string = 'default';
  }

class ExpgetOwnerClass091 {
      public data: string = 'default';
  }

class ExpgetOwnerClass092 {
      public data: string = 'default';
  }

class ExpgetOwnerClass093 {
      public data: string = 'default';
  }

class ExpgetOwnerClass094 {
      public data: string = 'default';
  }

class ExpgetOwnerClass095 {
      public data: string = 'default';
  }

class ExpgetOwnerClass096 {
      public data: string = 'default';
  }

class ExpgetOwnerClass097 {
      public data: string = 'default';
  }

class ExpgetOwnerClass098 {
      public data: string = 'default';
  }

class ExpgetOwnerClass099 {
      public data: string = 'default';
  }

class ExpgetOwnerClass100 {
      public data: string = 'default';
  }


interface MyInterface {
    interfaceField: string;
}

class ImplClass implements MyInterface {
    public interfaceField: string = '';
}


export default function InstanceFieldGetOwnerTest() {
  describe('InstanceFieldGetOwnerTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0100
     * @tc.name testGetOwner001
     * @tc.desc Verify getOwner functionality test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      import { reflect } from '@kit.ArkTS';

        let cls = Class.from<MyClass001>();
        let field = cls.getInstanceField('name')!;
        let owner = field.getOwner();
        expect(owner).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0200
     * @tc.name testGetOwner002
     * @tc.desc Verify GetOwner functionality test 001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('name')!;
        // Test scenario
        try {
            let owner = field.getOwner('invalid');
            expect().assertFail();
        } catch (e) {
            expect(e).not.toBeNull();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0300
     * @tc.name testGetOwner003
     * @tc.desc Verify GetOwner functionality test 002
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass003>();
        let field = cls.getInstanceField('value')!;
        let owner = field.getOwner();

        expect(owner instanceof reflect.Class).assertTrue();
        expect(owner.getName()).assertEqual('TestClass003');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0400
     * @tc.name testGetOwner004
     * @tc.desc Verify GetOwner functionality test 003
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<OwnerClass004>();
        let fields = cls.getInstanceFields();

        for (let i = 0; i < fields.length; i++) {
            let owner = fields[i].getOwner();
            expect(owner.getName()).assertEqual('OwnerClass004');
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0500
     * @tc.name testGetOwner005
     * @tc.desc Verify GetOwner functionality test 004
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass005>();

        // Test scenario
        let childField = childCls.getInstanceField('childField')!;
        expect(childField.getOwner().getName()).assertEqual('ChildClass005');

        // Test scenario
        let parentCls = childCls.getSuper()!;
        let parentField = parentCls.getInstanceField('parentField')!;
        expect(parentField.getOwner().getName()).assertEqual('ParentClass005');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0600
     * @tc.name testGetOwner006
     * @tc.desc Verify GetOwner functionality test 005
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        let cls = Class.from<ImplClass>();
        let field = cls.getInstanceField('interfaceField')!;
        let owner = field.getOwner();

        expect(owner).not.toBeNull();
        expect(owner.getName()).assertEqual('ImplClass');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0700
     * @tc.name testGetOwner007
     * @tc.desc Verify GetOwner functionality test 006
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass007>();
        let field = cls.getInstanceField('value')!;
        let owner = field.getOwner();

        // Test scenario
        expect(owner.getName()).not.toBeNull();
        expect(owner.getInstanceFields()).not.toBeNull();
        expect(owner.isInterface()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0800
     * @tc.name testGetOwner008
     * @tc.desc Verify GetOwner functionality test 007
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass008>();
        let field = cls.getInstanceField('myField')!;

        expect(field.getName()).assertEqual('myField'); //     ?
        expect(field.getOwner().getName()).assertEqual('TestClass008'); //
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0900
     * @tc.name testGetOwner009
     * @tc.desc Verify GetOwner functionality test 008
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let field = cls.getInstanceField('name')!;
        try {
            let owner = field.getOwner('extra');
            expect().assertFail();
        } catch (e) {
            expect(e instanceof Error).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_1000
     * @tc.name testGetOwner010
     * @tc.desc Verify GetOwner functionality test 009
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls = Class.from<MyClass>();
        cls.initialize();
        let field = cls.getInstanceField('name')!;
        let owner = field.getOwner();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_1100
     * @tc.name testGetOwner011
     * @tc.desc Verify GetOwner functionality test 010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        // Test scenario
        let field = cls.getInstanceField('name')!;
        let owner = field.getOwner(); //           ?
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_1200
     * @tc.name testGetOwner012
     * @tc.desc Verify GetOwner functionality test 011
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        // Test scenario
        let field = cls.getInstanceField('name')!;
        let owner = field.getOwner(); //
        expect(owner).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_1300
     * @tc.name testGetOwner013
     * @tc.desc Verify GetOwner functionality test 012
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      s.getInstanceField('outerField')!;
        expect(outerField.getOwner().getName()).assertEqual('OuterClass013');

        let innerCls = Class.from<OuterClass013.InnerClass013>();
        let innerField = innerCls.getInstanceField('innerField')!;
        expect(innerField.getOwner().getName()).toContain('InnerClass013');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_1400
     * @tc.name testGetOwner014
     * @tc.desc Verify GetOwner functionality test 013
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Test scenario

        let cls1 = Class.from<MyClass1014>();
        let field1 = cls1.getInstanceField('field')!;

        let cls2 = Class.from<MyClass2014>();
        let field2 = cls2.getInstanceField('field')!;

        // Test scenario
        expect(field1.getOwner().getName()).not.toEqual(field2.getOwner().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_1500
     * @tc.name testGetOwner015
     * @tc.desc Verify GetOwner functionality test 014
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass015>();
        let field = cls.getInstanceField('data')!;

        console.info(`    ? ${field.getName()}`);
        console.info(`     : ${field.getOwner().getName()}`);
        console.info(`      : ${field.getType().getName()}`);
        console.info(`      : ${field.isReadonly()}`);
        console.info(`   public: ${field.isPublic()}`);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_1600
     * @tc.name testGetOwner016
     * @tc.desc Verify GetOwner functionality test 015
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass016>();
        let fields = cls.getInstanceFields();

        for (let i = 0; i < fields.length; i++) {
            let field = fields[i];
            let owner = field.getOwner();
            console.info(`    ${field.getName()}     ?${owner.getName()}`);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_1700
     * @tc.name testGetOwner017
     * @tc.desc Verify GetOwner functionality test 016
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass017>();
        let field = cls.getInstanceField('data')!;

        // Test scenario
        for (let i = 0; i < 1000; i++) {
            let owner = field.getOwner();
            expect(owner).not.toBeNull();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_1800
     * @tc.name testGetOwner018
     * @tc.desc Verify GetOwner functionality test 017
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TestClass018>();
        let field = cls.getInstanceField('value')!;

        let owner1 = field.getOwner();
        let owner2 = field.getOwner();
        let owner3 = field.getOwner();

        // Test scenario
        expect(owner1.getName()).assertEqual(owner2.getName());
        expect(owner2.getName()).assertEqual(owner3.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_1900
     * @tc.name testGetOwner019
     * @tc.desc Verify GetOwner functionality test 018
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StaticTest019>();

        // Test scenario
        let staticField = cls.getStaticField('STATIC_VALUE')!;
        let staticOwner = staticField.getOwner();
        expect(staticOwner.getName()).assertEqual('StaticTest019');

        // Test scenario
        let instanceField = cls.getInstanceField('instanceValue')!;
        let instanceOwner = instanceField.getOwner();
        expect(instanceOwner.getName()).assertEqual('StaticTest019');

        // Test scenario
        expect(staticOwner.getName()).assertEqual(instanceOwner.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_2000
     * @tc.name testGetOwner020
     * @tc.desc Verify GetOwner functionality test 019
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<Child020>();
        let childFields = childCls.getInstanceFields();

        for (let i = 0; i < childFields.length; i++) {
            let field = childFields[i];
            let owner = field.getOwner();
            console.info(`    ${field.getName()}        ${owner.getName()}   );
        }

        // Test scenario

        let parentCls = childCls.getSuper()!;
        let parentFields = parentCls.getInstanceFields();

        for (let i = 0; i < parentFields.length; i++) {
            let field = parentFields[i];
            let owner = field.getOwner();
            console.info(`    ${field.getName()}        ${owner.getName()}   );
        }

        // Test scenario
    });
    // === Expanded Test Cases ===

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0210
     * @tc.name testGetOwner021
     * @tc.desc Verify getOwner expanded test 21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass021>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0220
     * @tc.name testGetOwner022
     * @tc.desc Verify getOwner expanded test 22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass022>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0230
     * @tc.name testGetOwner023
     * @tc.desc Verify getOwner expanded test 23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass023>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0240
     * @tc.name testGetOwner024
     * @tc.desc Verify getOwner expanded test 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass024>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0250
     * @tc.name testGetOwner025
     * @tc.desc Verify getOwner expanded test 25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass025>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0260
     * @tc.name testGetOwner026
     * @tc.desc Verify getOwner expanded test 26
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass026>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0270
     * @tc.name testGetOwner027
     * @tc.desc Verify getOwner expanded test 27
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass027>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0280
     * @tc.name testGetOwner028
     * @tc.desc Verify getOwner expanded test 28
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass028>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0290
     * @tc.name testGetOwner029
     * @tc.desc Verify getOwner expanded test 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass029>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0300
     * @tc.name testGetOwner030
     * @tc.desc Verify getOwner expanded test 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass030>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0310
     * @tc.name testGetOwner031
     * @tc.desc Verify getOwner expanded test 31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass031>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0320
     * @tc.name testGetOwner032
     * @tc.desc Verify getOwner expanded test 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass032>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0330
     * @tc.name testGetOwner033
     * @tc.desc Verify getOwner expanded test 33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass033>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0340
     * @tc.name testGetOwner034
     * @tc.desc Verify getOwner expanded test 34
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass034>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0350
     * @tc.name testGetOwner035
     * @tc.desc Verify getOwner expanded test 35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass035>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0360
     * @tc.name testGetOwner036
     * @tc.desc Verify getOwner expanded test 36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass036>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0370
     * @tc.name testGetOwner037
     * @tc.desc Verify getOwner expanded test 37
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass037>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0380
     * @tc.name testGetOwner038
     * @tc.desc Verify getOwner expanded test 38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass038>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0390
     * @tc.name testGetOwner039
     * @tc.desc Verify getOwner expanded test 39
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass039>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0400
     * @tc.name testGetOwner040
     * @tc.desc Verify getOwner expanded test 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass040>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0410
     * @tc.name testGetOwner041
     * @tc.desc Verify getOwner expanded test 41
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass041>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0420
     * @tc.name testGetOwner042
     * @tc.desc Verify getOwner expanded test 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass042>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0430
     * @tc.name testGetOwner043
     * @tc.desc Verify getOwner expanded test 43
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass043>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0440
     * @tc.name testGetOwner044
     * @tc.desc Verify getOwner expanded test 44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass044>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0450
     * @tc.name testGetOwner045
     * @tc.desc Verify getOwner expanded test 45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass045>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0460
     * @tc.name testGetOwner046
     * @tc.desc Verify getOwner expanded test 46
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass046>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0470
     * @tc.name testGetOwner047
     * @tc.desc Verify getOwner expanded test 47
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass047>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0480
     * @tc.name testGetOwner048
     * @tc.desc Verify getOwner expanded test 48
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass048>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0490
     * @tc.name testGetOwner049
     * @tc.desc Verify getOwner expanded test 49
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass049>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0500
     * @tc.name testGetOwner050
     * @tc.desc Verify getOwner expanded test 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass050>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0510
     * @tc.name testGetOwner051
     * @tc.desc Verify getOwner expanded test 51
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass051>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0520
     * @tc.name testGetOwner052
     * @tc.desc Verify getOwner expanded test 52
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass052>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0530
     * @tc.name testGetOwner053
     * @tc.desc Verify getOwner expanded test 53
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass053>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0540
     * @tc.name testGetOwner054
     * @tc.desc Verify getOwner expanded test 54
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass054>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0550
     * @tc.name testGetOwner055
     * @tc.desc Verify getOwner expanded test 55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass055>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0560
     * @tc.name testGetOwner056
     * @tc.desc Verify getOwner expanded test 56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass056>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0570
     * @tc.name testGetOwner057
     * @tc.desc Verify getOwner expanded test 57
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass057>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0580
     * @tc.name testGetOwner058
     * @tc.desc Verify getOwner expanded test 58
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass058>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0590
     * @tc.name testGetOwner059
     * @tc.desc Verify getOwner expanded test 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass059>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0600
     * @tc.name testGetOwner060
     * @tc.desc Verify getOwner expanded test 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass060>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0610
     * @tc.name testGetOwner061
     * @tc.desc Verify getOwner expanded test 61
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass061>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0620
     * @tc.name testGetOwner062
     * @tc.desc Verify getOwner expanded test 62
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass062>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0630
     * @tc.name testGetOwner063
     * @tc.desc Verify getOwner expanded test 63
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass063>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0640
     * @tc.name testGetOwner064
     * @tc.desc Verify getOwner expanded test 64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass064>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0650
     * @tc.name testGetOwner065
     * @tc.desc Verify getOwner expanded test 65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass065>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0660
     * @tc.name testGetOwner066
     * @tc.desc Verify getOwner expanded test 66
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass066>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0670
     * @tc.name testGetOwner067
     * @tc.desc Verify getOwner expanded test 67
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass067>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0680
     * @tc.name testGetOwner068
     * @tc.desc Verify getOwner expanded test 68
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass068>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0690
     * @tc.name testGetOwner069
     * @tc.desc Verify getOwner expanded test 69
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass069>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0700
     * @tc.name testGetOwner070
     * @tc.desc Verify getOwner expanded test 70
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass070>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0710
     * @tc.name testGetOwner071
     * @tc.desc Verify getOwner expanded test 71
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass071>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0720
     * @tc.name testGetOwner072
     * @tc.desc Verify getOwner expanded test 72
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass072>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0730
     * @tc.name testGetOwner073
     * @tc.desc Verify getOwner expanded test 73
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass073>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0740
     * @tc.name testGetOwner074
     * @tc.desc Verify getOwner expanded test 74
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass074>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0750
     * @tc.name testGetOwner075
     * @tc.desc Verify getOwner expanded test 75
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass075>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0760
     * @tc.name testGetOwner076
     * @tc.desc Verify getOwner expanded test 76
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass076>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0770
     * @tc.name testGetOwner077
     * @tc.desc Verify getOwner expanded test 77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass077>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0780
     * @tc.name testGetOwner078
     * @tc.desc Verify getOwner expanded test 78
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass078>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0790
     * @tc.name testGetOwner079
     * @tc.desc Verify getOwner expanded test 79
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass079>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0800
     * @tc.name testGetOwner080
     * @tc.desc Verify getOwner expanded test 80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass080>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0810
     * @tc.name testGetOwner081
     * @tc.desc Verify getOwner expanded test 81
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass081>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0820
     * @tc.name testGetOwner082
     * @tc.desc Verify getOwner expanded test 82
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass082>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0830
     * @tc.name testGetOwner083
     * @tc.desc Verify getOwner expanded test 83
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass083>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0840
     * @tc.name testGetOwner084
     * @tc.desc Verify getOwner expanded test 84
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass084>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0850
     * @tc.name testGetOwner085
     * @tc.desc Verify getOwner expanded test 85
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass085>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0860
     * @tc.name testGetOwner086
     * @tc.desc Verify getOwner expanded test 86
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass086>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0870
     * @tc.name testGetOwner087
     * @tc.desc Verify getOwner expanded test 87
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass087>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0880
     * @tc.name testGetOwner088
     * @tc.desc Verify getOwner expanded test 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass088>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0890
     * @tc.name testGetOwner089
     * @tc.desc Verify getOwner expanded test 89
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass089>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0900
     * @tc.name testGetOwner090
     * @tc.desc Verify getOwner expanded test 90
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass090>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0910
     * @tc.name testGetOwner091
     * @tc.desc Verify getOwner expanded test 91
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass091>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0920
     * @tc.name testGetOwner092
     * @tc.desc Verify getOwner expanded test 92
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass092>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GETOWNER_0930
     * @tc.name testGetOwner093
     * @tc.desc Verify getOwner expanded test 93
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetOwner093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ExpgetOwnerClass093>();
        let instance = cls.createInstance();
        let field = cls.getInstanceField('data')!;
        let result = field.getOwner();
        expect(result).not.toBeNull();
    });
