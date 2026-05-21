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
import Utils from '../Util.test';
import { looseReflect } from './VoidFn.test';
import { MyClass001, MyClass002, MyClass003, MyClass004, MyClass005, MyClass006, MyClass007, MyClass008, MyClass009, MyClass010, MyClass011, MyClass012, MyClass013, MyClass014, MyClass015, MyClass016, MyClass017, MyClass018, MyClass019, MyClass020, MyClass021, MyClass022, MyClass023, MyClass024, MyClass025, MyClass026, MyClass027, MyClass028, MyClass029, MyClass030, MyClass031, MyClass032, MyClass033, MyClass034, MyClass035, MyClass036, MyClass037, MyClass038, MyClass039, MyInterface039, MyClass040, ParentClass040, MyClass041, Interface2041, Interface1041, MyClass042, MyClass043, MyClass044, MyClass045, MyClass046, MyClass047, MyClass048, MyClass049, MyClass050, MyClass051, MyClass052, MyClass053, MyClass054, MyClass055, MyClass056, MyClass057, MyClass058, MyClass059, MyClass060, MyClass061, MyClass062, MyClass063, ParentClass063, MyClass064, MyClass065, MyClass066, MyClass067, EmptyClass068, MyClass069, MyInterface069, AbstractClass070, GenericClass071, MyClass072, MyClass073, MyClass074, MyClass075, MyClass076, MyClass077, MyClass078, MyClass079, MyClass080, MyClass081, MyClass082, MyClass083, LargeClass084, MyClass085, findMethod086, MyClass086, MyClass087, dynamicCall088, Calculator088, hasMethod089, MyClass089, TestClass090, ReflectionUtils090, APIClass25091, APIClass24091, MyClass093, Builder094, MyClass095, MyClass096, MyClass097, AbstractClass098, MyClass099, MinimalClass100, ComplexClass101, GrandChild102, Child102, Parent102, GrandParent102, asInstanceMethodArray } from './ClassGetInstanceMethodFixtures.test';
export default function ClassGetInstanceMethodTest001(): void {
  describe('ClassGetInstanceMethodTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0010
     * @tc.name testClassGetInstanceMethod001
     * @tc.desc Verify ClassGetInstanceMethod case 001: nameparameters parameters signature
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
        let method = cls.getInstanceMethod('test');
        expect(method !== undefined).assertTrue();
        expect(method!.getName()).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0020
     * @tc.name testClassGetInstanceMethod002
     * @tc.desc Verify ClassGetInstanceMethod case 002: name signature parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass002>();
        let method = cls.getInstanceMethod('test', [Class.from<string>()]);
        expect(method !== undefined).assertTrue();
        expect(method!.getName()).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0030
     * @tc.name testClassGetInstanceMethod003
     * @tc.desc Verify ClassGetInstanceMethod case 003: using method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass003>();
        let method = cls.getInstanceMethod('simpleMethod');
        expect(method !== null).assertTrue();
        expect(method!.getName()).assertEqual('simpleMethod');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0040
     * @tc.name testClassGetInstanceMethod004
     * @tc.desc Verify ClassGetInstanceMethod case 004: using method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();
        let method = cls.getInstanceMethod('getUserName');
        expect(method !== null).assertTrue();
        expect(method!.getName()).assertEqual('getUserName');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0050
     * @tc.name testClassGetInstanceMethod005
     * @tc.desc Verify ClassGetInstanceMethod case 005: method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass005>();
        let method1 = cls.getInstanceMethod('method123');
        let method2 = cls.getInstanceMethod('test2');
        expect(method1 !== null).assertTrue();
        expect(method2 !== null).assertTrue();
        expect(method1!.getName()).assertEqual('method123');
        expect(method2!.getName()).assertEqual('test2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0060
     * @tc.name testClassGetInstanceMethod006
     * @tc.desc Verify ClassGetInstanceMethod case 006: using method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass006>();
        let method = cls.getInstanceMethod('_internalMethod');
        expect(method !== null).assertTrue();
        expect(method!.getName()).assertEqual('_internalMethod');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0070
     * @tc.name testClassGetInstanceMethod007
     * @tc.desc Verify ClassGetInstanceMethod case 007: using gettermethod get-property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
        let method = cls.getInstanceMethod('%%get-name');
        expect(method !== null).assertTrue();
        expect(method!.isGetter()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0080
     * @tc.name testClassGetInstanceMethod008
     * @tc.desc Verify ClassGetInstanceMethod case 008: using settermethod set-property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
        let method = cls.getInstanceMethod('%%set-name');
        expect(method !== null).assertTrue();
        expect(method!.isSetter()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0090
     * @tc.name testClassGetInstanceMethod009
     * @tc.desc Verify ClassGetInstanceMethod case 009: nameparameters is empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass009>();
        let method = cls.getInstanceMethod('');
        expect(method).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0100
     * @tc.name testClassGetInstanceMethod010
     * @tc.desc Verify ClassGetInstanceMethod case 010: nameparameters is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass010>();
        let method = cls.getInstanceMethod('a');
        expect(method !== null).assertTrue();
        expect(method!.getName()).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0110
     * @tc.name testClassGetInstanceMethod011
     * @tc.desc Verify ClassGetInstanceMethod case 011: using method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass011>();
        let longName = 'thisIsAVeryLongMethodNameThatExceedsNormalLength';
        let method = cls.getInstanceMethod(longName);
        expect(method !== null).assertTrue();
        expect(method!.getName()).assertEqual(longName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0120
     * @tc.name testClassGetInstanceMethod012
     * @tc.desc Verify ClassGetInstanceMethod case 012: using Unicode method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass012>();
        let method1 = cls.getInstanceMethod('测试方法');
        let method2 = cls.getInstanceMethod('método');
        expect(method1 !== null).assertTrue();
        expect(method2 !== null).assertTrue();
        expect(method1!.getName()).assertEqual('测试方法');
        expect(method2!.getName()).assertEqual('método');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0130
     * @tc.name testClassGetInstanceMethod013
     * @tc.desc Verify ClassGetInstanceMethod case 013: nameparameters empty u200B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass013>();
        let method = cls.getInstanceMethod('test\u200B');
        expect(method).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0140
     * @tc.name testClassGetInstanceMethod014
     * @tc.desc Verify ClassGetInstanceMethod case 014: nameparameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass014>();
        let method1 = cls.getInstanceMethod('test@method');
        let method2 = cls.getInstanceMethod('test#method');
        let method3 = cls.getInstanceMethod('test method');
        expect(method1).assertEqual(undefined);
        expect(method2).assertEqual(undefined);
        expect(method3).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0150
     * @tc.name testClassGetInstanceMethod015
     * @tc.desc Verify ClassGetInstanceMethod case 015: nameparameters in XSS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass015>();
        let method = cls.getInstanceMethod('<script>alert(1)</script>');
        expect(method).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0160
     * @tc.name testClassGetInstanceMethod016
     * @tc.desc Verify ClassGetInstanceMethod case 016: name parameters is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass016>();
        try {
            let method = cls.getInstanceMethod(null as string);
            expect().assertFail();
        } catch (error) {
            expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0170
     * @tc.name testClassGetInstanceMethod017
     * @tc.desc Verify ClassGetInstanceMethod case 017: nameparameters is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass017>();
        try {
            let method = cls.getInstanceMethod(undefined as string);
            expect().assertFail();
        } catch (error) {
            expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0180
     * @tc.name testClassGetInstanceMethod018
     * @tc.desc Verify ClassGetInstanceMethod case 018: nameparameters type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass018>();
        try {
            let method = looseReflect(cls as Object).getInstanceMethod(123 as Object);
            expect().assertFail();
        } catch (error) {
            expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0190
     * @tc.name testClassGetInstanceMethod019
     * @tc.desc Verify ClassGetInstanceMethod case 019: nameparameters object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass019>();
        try {
            let method = looseReflect(cls as Object).getInstanceMethod({} as Object);
            expect().assertFail();
        } catch (error) {
            expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0200
     * @tc.name testClassGetInstanceMethod020
     * @tc.desc Verify ClassGetInstanceMethod case 020: nameparameters array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass020>();
        try {
            let badArg: Object = new Array<Object>();
            let method = looseReflect(cls as Object).getInstanceMethod(badArg);
            expect().assertFail();
        } catch (error) {
            expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0210
     * @tc.name testClassGetInstanceMethod021
     * @tc.desc Verify ClassGetInstanceMethod case 021: signature parameters type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass021>();
        let method = cls.getInstanceMethod('test', [Class.from<string>()]);
        expect(method !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0220
     * @tc.name testClassGetInstanceMethod022
     * @tc.desc Verify ClassGetInstanceMethod case 022: signature multiple parameters type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass022>();
        let signature: FixedArray<Class> = [
          Class.from<string>(),
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_BOOLEAN
        ];
        let method = cls.getInstanceMethod('test', signature);
        expect(method !== undefined).assertTrue();
        expect(method!.getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0230
     * @tc.name testClassGetInstanceMethod023
     * @tc.desc Verify ClassGetInstanceMethod case 023: signature type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass023>();
        expect(cls.getInstanceMethod('testByte', [Class.PRIMITIVE_BYTE]) !== null).assertTrue();
        expect(cls.getInstanceMethod('testShort', [Class.PRIMITIVE_SHORT]) !== null).assertTrue();
        expect(cls.getInstanceMethod('testInt', [Class.PRIMITIVE_INT]) !== null).assertTrue();
        expect(cls.getInstanceMethod('testLong', [Class.PRIMITIVE_LONG]) !== null).assertTrue();
        expect(cls.getInstanceMethod('testFloat', [Class.PRIMITIVE_FLOAT]) !== null).assertTrue();
        expect(cls.getInstanceMethod('testDouble', [Class.PRIMITIVE_DOUBLE]) !== null).assertTrue();
        expect(cls.getInstanceMethod('testBoolean', [Class.PRIMITIVE_BOOLEAN]) !== null).assertTrue();
        expect(cls.getInstanceMethod('testChar', [Class.PRIMITIVE_CHAR]) !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0240
     * @tc.name testClassGetInstanceMethod024
     * @tc.desc Verify ClassGetInstanceMethod case 024: signature object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass024>();
        expect(cls.getInstanceMethod('testString', [Class.from<string>()]) !== null).assertTrue();
        expect(cls.getInstanceMethod('testArray', [Class.from<Array<int>>()]) !== null).assertTrue();
        expect(cls.getInstanceMethod('testMap', [Class.from<Map<string, int>>()]) !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0250
     * @tc.name testClassGetInstanceMethod025
     * @tc.desc Verify ClassGetInstanceMethod case 025: signature is empty array no parameters method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass025>();
        let method = cls.getInstanceMethod('test', []);
        expect(method !== null).assertTrue();
        expect(method!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0260
     * @tc.name testClassGetInstanceMethod026
     * @tc.desc Verify ClassGetInstanceMethod case 026: signature parameters type method parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass026>();
        let signature: FixedArray<Class> = [
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT
        ];
        let method = cls.getInstanceMethod('test', signature);
        expect(method !== undefined).assertTrue();
        expect(method!.getParametersNum()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0270
     * @tc.name testClassGetInstanceMethod027
     * @tc.desc Verify ClassGetInstanceMethod case 027: signature generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass027>();
        expect(cls.getInstanceMethod('testList', [Class.from<Array<string>>()]) !== null).assertTrue();
        expect(cls.getInstanceMethod('testMap', [Class.from<Map<int, string>>()]) !== null).assertTrue();
        expect(cls.getInstanceMethod('testOptional', [Class.from<int>()]) !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0280
     * @tc.name testClassGetInstanceMethod028
     * @tc.desc Verify ClassGetInstanceMethod case 028: signature type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass028>();
        let method = cls.getInstanceMethod('test', [Class.from<int | string>()]);
        expect(method !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0290
     * @tc.name testClassGetInstanceMethod029
     * @tc.desc Verify ClassGetInstanceMethod case 029: signatureparameters is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass029>();
        try {
            let method = looseReflect(cls as Object).getInstanceMethod('test', null as Object);
            expect().assertFail();
        } catch (error) {
            expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0300
     * @tc.name testClassGetInstanceMethod030
     * @tc.desc Verify ClassGetInstanceMethod case 030: signatureparameters is undefined parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass030>();
        let method = cls.getInstanceMethod('test', undefined);
        expect(method !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0310
     * @tc.name testClassGetInstanceMethod031
     * @tc.desc Verify ClassGetInstanceMethod case 031: signaturearray Classobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass031>();
        try {
            let method = looseReflect(cls as Object).getInstanceMethod('test', ['string' as Object]);
            expect().assertFail();
        } catch (error) {
            expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0320
     * @tc.name testClassGetInstanceMethod032
     * @tc.desc Verify ClassGetInstanceMethod case 032: signatureparameters not array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass032>();
        try {
            let method = looseReflect(cls as Object).getInstanceMethod('test', Class.from<string>() as Object);
            expect().assertFail();
        } catch (error) {
            expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0330
     * @tc.name testClassGetInstanceMethod033
     * @tc.desc Verify ClassGetInstanceMethod case 033: signature parameters type not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass033>();
        let method = cls.getInstanceMethod('test', [Class.from<int>(), Class.from<string>()]);
        expect(method).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0340
     * @tc.name testClassGetInstanceMethod034
     * @tc.desc Verify ClassGetInstanceMethod case 034: signature parameters and method not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass034>();
        let method = cls.getInstanceMethod('test', [Class.from<string>(), Class.from<int>()]);
        expect(method).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0350
     * @tc.name testClassGetInstanceMethod035
     * @tc.desc Verify ClassGetInstanceMethod case 035: method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass035>();
        let method = cls.getInstanceMethod('singleMethod');
        expect(method !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0360
     * @tc.name testClassGetInstanceMethod036
     * @tc.desc Verify ClassGetInstanceMethod case 036: in multiple when signature
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass036>();
        let m1 = cls.getInstanceMethod('test', []);
        let m2 = cls.getInstanceMethod('test', [Class.from<string>()]);
        let m3 = cls.getInstanceMethod('test', [Class.from<string>(), Class.PRIMITIVE_INT]);
        expect(m1 !== undefined).assertTrue();
        expect(m2 !== undefined).assertTrue();
        expect(m3 !== undefined).assertTrue();
        expect(m1!.getParametersNum()).assertEqual(0);
        expect(m2!.getParametersNum()).assertEqual(1);
        expect(m3!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0370
     * @tc.name testClassGetInstanceMethod037
     * @tc.desc Verify ClassGetInstanceMethod case 037: in multiple when not signatureshould throw Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass037>();
        try {
            let method = cls.getInstanceMethod('test');
            expect().assertFail();
        } catch (error) {
            expect(error !== null).assertTrue();
            expect(error instanceof Error).assertEqual(true);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0380
     * @tc.name testClassGetInstanceMethod038
     * @tc.desc Verify ClassGetInstanceMethod case 038: instance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass038>();
        let method = cls.getInstanceMethod('myMethod');
        expect(method !== null).assertTrue();
        expect(Utils.classNameMatches(method!.getOwner()!.getName(), 'MyClass038')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0390
     * @tc.name testClassGetInstanceMethod039
     * @tc.desc Verify ClassGetInstanceMethod case 039: from interface inheritance publicinstance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass039>();
        let method = cls.getInstanceMethod('sayHi');
        expect(method !== null).assertTrue();
        expect(method!.getName()).assertEqual('sayHi');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0400
     * @tc.name testClassGetInstanceMethod040
     * @tc.desc Verify ClassGetInstanceMethod case 040: getInstanceMethodnot should return method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass040>();
        let parentMethod = cls.getInstanceMethod('parentMethod');
        let childMethod = cls.getInstanceMethod('childMethod');
        expect(parentMethod).assertEqual(undefined);
        expect(childMethod !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0410
     * @tc.name testClassGetInstanceMethod041
     * @tc.desc Verify ClassGetInstanceMethod case 041: multiple interface interface method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass041>();
        let m1 = cls.getInstanceMethod('method1');
        let m2 = cls.getInstanceMethod('method2');
        expect(m1 !== null).assertTrue();
        expect(m2 !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0420
     * @tc.name testClassGetInstanceMethod042
     * @tc.desc Verify ClassGetInstanceMethod case 042: publicinstance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass042>();
        let method = cls.getInstanceMethod('publicMethod');
        expect(method !== null).assertTrue();
        expect(method!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0430
     * @tc.name testClassGetInstanceMethod043
     * @tc.desc Verify ClassGetInstanceMethod case 043: method not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass043>();
        let method = cls.getInstanceMethod('privateMethod');
        expect(method).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0440
     * @tc.name testClassGetInstanceMethod044
     * @tc.desc Verify ClassGetInstanceMethod case 044: protectedmethod not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass044>();
        let method = cls.getInstanceMethod('protectedMethod');
        expect(method).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0450
     * @tc.name testClassGetInstanceMethod045
     * @tc.desc Verify ClassGetInstanceMethod case 045: internal method is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass045>();
        let method = cls.getInstanceMethod('internalMethod');
        expect(method).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0460
     * @tc.name testClassGetInstanceMethod046
     * @tc.desc Verify ClassGetInstanceMethod case 046: getInstanceMethodnot should return static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass046>();
        let method = cls.getInstanceMethod('staticMethod');
        expect(method).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0470
     * @tc.name testClassGetInstanceMethod047
     * @tc.desc Verify ClassGetInstanceMethod case 047: constructor is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass047>();
        let method = cls.getInstanceMethod('constructor');
        expect(method === undefined || method === null).assertTrue();
        expect(cls.getConstructors().length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0480
     * @tc.name testClassGetInstanceMethod048
     * @tc.desc Verify ClassGetInstanceMethod case 048: native method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass048>();
        let method = cls.getInstanceMethod('nativeMethod');
        expect(method !== null).assertTrue();
        expect(method!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0490
     * @tc.name testClassGetInstanceMethod049
     * @tc.desc Verify ClassGetInstanceMethod case 049: final method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass049>();
        let method = cls.getInstanceMethod('finalMethod');
        expect(method !== null).assertTrue();
        expect(method!.isFinal()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0500
     * @tc.name testClassGetInstanceMethod050
     * @tc.desc Verify ClassGetInstanceMethod case 050: async method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass050>();
        let method = cls.getInstanceMethod('asyncMethod');
        expect(method !== null).assertTrue();
        expect(method!.isAsync()).assertEqual(true);
        expect(method!.getReturnType().getName()).assertContain('Promise');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0510
     * @tc.name testClassGetInstanceMethod051
     * @tc.desc Verify ClassGetInstanceMethod case 051: abstractmethod
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass051>();
        let method = cls.getInstanceMethod('abstractMethod');
        expect(method !== null).assertTrue();
        expect(method!.isAbstract()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0520
     * @tc.name testClassGetInstanceMethod052
     * @tc.desc Verify ClassGetInstanceMethod case 052: success to method when return InstanceMethodobject
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass052>();
        let method = cls.getInstanceMethod('test');
        expect(method !== null).assertTrue();
        expect(method !== undefined).assertEqual(true);
        expect(method instanceof Object).assertEqual(true);
        expect(method!.getName()).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0530
     * @tc.name testClassGetInstanceMethod053
     * @tc.desc Verify ClassGetInstanceMethod case 053: return InstanceMethodobject call getName()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass053>();
        let method = cls.getInstanceMethod('myMethod');
        expect(method !== null).assertTrue();
        expect(method!.getName()).assertEqual('myMethod');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0540
     * @tc.name testClassGetInstanceMethod054
     * @tc.desc Verify ClassGetInstanceMethod case 054: return InstanceMethodobject call getOwner()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass054>();
        let method = cls.getInstanceMethod('test');
        expect(method !== null).assertTrue();
        expect(Utils.classNameMatches(method!.getOwner()!.getName(), 'MyClass054')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0550
     * @tc.name testClassGetInstanceMethod055
     * @tc.desc Verify ClassGetInstanceMethod case 055: return InstanceMethodobject call getReturnType()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass055>();
        let method = cls.getInstanceMethod('test');
        expect(method !== null).assertTrue();
        expect(method!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0560
     * @tc.name testClassGetInstanceMethod056
     * @tc.desc Verify ClassGetInstanceMethod case 056: return InstanceMethodobject call getParameterTypes()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass056>();
        let signature: FixedArray<Class> = [
          Class.from<string>(),
          Class.PRIMITIVE_INT
        ];
        let method = cls.getInstanceMethod('test', signature);
        expect(method !== undefined).assertTrue();
        expect(method!.getParametersNum()).assertEqual(2);
        expect(Utils.classNameMatches(method!.getParameterType(0)!.getName(), 'String')).assertTrue();
        expect(Utils.reflectScalarTypeNameMatches(method!.getParameterType(1)!.getName(), 'int')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0570
     * @tc.name testClassGetInstanceMethod057
     * @tc.desc Verify ClassGetInstanceMethod case 057: return InstanceMethodobject call getParametersNum()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass057>();
        let signature: FixedArray<Class> = [
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT
        ];
        let method = cls.getInstanceMethod('test', signature);
        expect(method !== undefined).assertTrue();
        expect(method!.getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0580
     * @tc.name testClassGetInstanceMethod058
     * @tc.desc Verify ClassGetInstanceMethod case 058: return InstanceMethodobject call invoke() method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass058();
        let cls = Class.from<MyClass058>();
        let method = cls.getInstanceMethod('test', [Class.from<string>()]);
        expect(method !== null).assertTrue();
        let result = method!.invoke(obj, ['World']);
        expect(result as string).assertEqual('Hello World');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0590
     * @tc.name testClassGetInstanceMethod059
     * @tc.desc Verify ClassGetInstanceMethod case 059: not in method when return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass059>();
        let method = cls.getInstanceMethod('nonExistentMethod');
        expect(method).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0600
     * @tc.name testClassGetInstanceMethod060
     * @tc.desc Verify ClassGetInstanceMethod case 060: method error when return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass060>();
        let method = cls.getInstanceMethod('myMethd');
        expect(method).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0610
     * @tc.name testClassGetInstanceMethod061
     * @tc.desc Verify ClassGetInstanceMethod case 061: method not when return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass061>();
        let method = cls.getInstanceMethod('mymethod');
        expect(method).assertEqual(undefined);

        let method2 = cls.getInstanceMethod('MYMETHOD');
        expect(method2).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0620
     * @tc.name testClassGetInstanceMethod062
     * @tc.desc Verify ClassGetInstanceMethod case 062: method not when return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass062>();
        let method = cls.getInstanceMethod('test', [Class.from<int>()]);
        expect(method).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0630
     * @tc.name testClassGetInstanceMethod063
     * @tc.desc Verify ClassGetInstanceMethod case 063: method when return undefined getInstanceMethod method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass063>();
        let method = cls.getInstanceMethod('parentMethod');
        expect(method).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0640
     * @tc.name testClassGetInstanceMethod064
     * @tc.desc Verify ClassGetInstanceMethod case 064: method when return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass064>();
        let method = cls.getInstanceMethod('privateMethod');
        expect(method).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0650
     * @tc.name testClassGetInstanceMethod065
     * @tc.desc Verify ClassGetInstanceMethod case 065: static method when return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass065>();
        let method = cls.getInstanceMethod('staticMethod');
        expect(method).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0660
     * @tc.name testClassGetInstanceMethod066
     * @tc.desc Verify ClassGetInstanceMethod case 066: verify return type is InstanceMethod
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass066>();
        let method = cls.getInstanceMethod('test');
        expect(method !== null).assertTrue();
        expect(typeof method!.getName).assertEqual('function');
        expect(typeof method!.getOwner).assertEqual('function');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0670
     * @tc.name testClassGetInstanceMethod067
     * @tc.desc Verify ClassGetInstanceMethod case 067: verify to method when return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass067>();
        let method = cls.getInstanceMethod('nonExistent');
        expect(method).assertEqual(undefined);
        expect(method === null).assertEqual(false);
        expect(method === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0680
     * @tc.name testClassGetInstanceMethod068
     * @tc.desc Verify ClassGetInstanceMethod case 068: in method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass068>();
        let method = cls.getInstanceMethod('anyMethod');
        expect(method).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0690
     * @tc.name testClassGetInstanceMethod069
     * @tc.desc Verify ClassGetInstanceMethod case 069: from interface type method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass069>();
        let method = cls.getInstanceMethod('interfaceMethod');
        expect(method !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0700
     * @tc.name testClassGetInstanceMethod070
     * @tc.desc Verify ClassGetInstanceMethod case 070: from abstract class method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass070>();
        let m1 = cls.getInstanceMethod('abstractMethod');
        let m2 = cls.getInstanceMethod('concreteMethod');
        expect(m1 !== null).assertTrue();
        expect(m2 !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0710
     * @tc.name testClassGetInstanceMethod071
     * @tc.desc Verify ClassGetInstanceMethod case 071: from generic method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClass071<int>>();
        let method = cls.getInstanceMethod('genericMethod', [Class.from<int>()]);
        expect(method !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0720
     * @tc.name testClassGetInstanceMethod072
     * @tc.desc Verify ClassGetInstanceMethod case 072: method not signature when throw Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass072>();
        try {
            let method = cls.getInstanceMethod('test');
            expect().assertFail();
        } catch (error) {
            expect(error instanceof Error).assertEqual(true);
            expect(error.message).assertContain('signature');
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0730
     * @tc.name testClassGetInstanceMethod073
     * @tc.desc Verify ClassGetInstanceMethod case 073: method multiple >2 not signature when throw Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass073>();
        try {
            let method = cls.getInstanceMethod('test');
            expect().assertFail();
        } catch (error) {
            let isErr: boolean = error instanceof Error;
            expect(isErr).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0740
     * @tc.name testClassGetInstanceMethod074
     * @tc.desc Verify ClassGetInstanceMethod case 074: verify throw Errorobject name messageproperty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass074>();
        try {
            cls.getInstanceMethod('test');
            expect().assertFail();
        } catch (error) {
            expect(error.name).assertEqual('Error');
            expect(error.message !== null).assertTrue();
            expect(typeof error.message).assertEqual('string');
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0750
     * @tc.name testClassGetInstanceMethod075
     * @tc.desc Verify ClassGetInstanceMethod case 075: nameparameters type not when error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass075>();
        try {
            let method = cls.getInstanceMethod(null as string);
            let ok: boolean = method === undefined || method === null;
            expect(ok).assertTrue();
        } catch (error) {
            expect(error !== null).assertTrue();
        }

        try {
            let method = cls.getInstanceMethod(undefined as string);
            let ok: boolean = method === undefined || method === null;
            expect(ok).assertTrue();
        } catch (error) {
            expect(error !== null).assertTrue();
        }

        try {
            let method = cls.getInstanceMethod('123');
            let ok: boolean = method === undefined || method === null;
            expect(ok).assertTrue();
        } catch (error) {
            expect(error !== null).assertTrue();
        }

        try {
            let method = cls.getInstanceMethod('true');
            let ok: boolean = method === undefined || method === null;
            expect(ok).assertTrue();
        } catch (error) {
            expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0760
     * @tc.name testClassGetInstanceMethod076
     * @tc.desc Verify ClassGetInstanceMethod case 076: signatureparameters type not when error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass076>();
        try {
            let method = looseReflect(cls as Object).getInstanceMethod('test', 'invalid' as Object);
            expect().assertFail();
        } catch (error) {
            expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0770
     * @tc.name testClassGetInstanceMethod077
     * @tc.desc Verify ClassGetInstanceMethod case 077: signaturearray Classobject when error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass077>();
        try {
            let method = looseReflect(cls as Object).getInstanceMethod('test', ['string' as Object, 123 as Object]);
            expect().assertFail();
        } catch (error) {
            expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0780
     * @tc.name testClassGetInstanceMethod078
     * @tc.desc Verify ClassGetInstanceMethod case 078: using try-catch error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass078>();
        try {
            let method = cls.getInstanceMethod('test');
            expect().assertFail();
        } catch (error) {
            let isErr: boolean = error instanceof Error;
            expect(isErr).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0790
     * @tc.name testClassGetInstanceMethod079
     * @tc.desc Verify ClassGetInstanceMethod case 079: verify catch error type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass079>();
        try {
            cls.getInstanceMethod('test');
            expect().assertFail();
        } catch (error) {
            expect(error !== null).assertTrue();
            expect(error.stack !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0800
     * @tc.name testClassGetInstanceMethod080
     * @tc.desc Verify ClassGetInstanceMethod case 080: verify finally in throw exception when
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass080>();
        let finallyExecuted = false;
        try {
            cls.getInstanceMethod('test');
            expect().assertFail();
        } catch (error) {
            let isErr: boolean = error instanceof Error;
            expect(isErr).assertTrue();
        } finally {
            finallyExecuted = true;
        }
        expect(finallyExecuted).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0810
     * @tc.name testClassGetInstanceMethod081
     * @tc.desc Verify ClassGetInstanceMethod case 081: parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass081>();
        let signature: FixedArray<Class> = [
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT,
          Class.PRIMITIVE_INT
        ];
        let method = cls.getInstanceMethod('test', signature);
        expect(method !== undefined).assertTrue();
    });
  });
}
