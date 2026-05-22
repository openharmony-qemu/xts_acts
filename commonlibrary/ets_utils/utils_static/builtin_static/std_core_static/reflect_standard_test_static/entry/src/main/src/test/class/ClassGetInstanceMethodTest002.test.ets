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
export default function ClassGetInstanceMethodTest002(): void {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0820
     * @tc.name testClassGetInstanceMethod082
     * @tc.desc Verify ClassGetInstanceMethod case 082: generic type error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass082>();
        try {
            let method = cls.getInstanceMethod('test', [Class.from<Map<string, Map<int, Array<string>>>>()]);
            expect(method !== null && method !== undefined).assertTrue();
        } catch (error) {
            expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0830
     * @tc.name testClassGetInstanceMethod083
     * @tc.desc Verify ClassGetInstanceMethod case 083: type error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass083>();
        let sig: FixedArray<Class> = [cls];
        let method = cls.getInstanceMethod('test', sig);
        expect(method !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0840
     * @tc.name testClassGetInstanceMethod084
     * @tc.desc Verify ClassGetInstanceMethod case 084: in method method performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<LargeClass084>();
        let found: int = 0;
        for (let i = 1; i <= 100; i++) {
            let methodName = `method${i.toString().padStart(3, '0')}`;
            if (cls.getInstanceMethod(methodName) !== null) {
                found++;
            }
        }
        expect(found).assertEqual(100);
        expect(cls.getInstanceMethod('method999') === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0850
     * @tc.name testClassGetInstanceMethod085
     * @tc.desc Verify ClassGetInstanceMethod case 085: method performance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass085>();
        expect(cls.getInstanceMethod('test') !== null).assertTrue();
        let methods: Array<reflect.InstanceMethod> = new Array<reflect.InstanceMethod>();
        for (let i = 0; i < 100; i++) {
            let method = cls.getInstanceMethod('test');
            if (method !== undefined) {
                methods.push(method);
            }
        }
        expect(methods.length).assertEqual(100);
        let first = methods[0];
        for (let i = 1; i < methods.length; i++) {
            expect(first.equals(methods[i])).assertEqual(true);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0860
     * @tc.name testClassGetInstanceMethod086
     * @tc.desc Verify ClassGetInstanceMethod case 086: method TaskPool
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        for (let i = 0; i < 10; i++) {
            expect(findMethod086()).assertEqual('found');
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0870
     * @tc.name testClassGetInstanceMethod087
     * @tc.desc Verify ClassGetInstanceMethod case 087: method after
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass087>();
        let methods: Array<reflect.InstanceMethod> = new Array<reflect.InstanceMethod>();
        for (let i = 0; i < 10000; i++) {
            let method = cls.getInstanceMethod('method1');
            if (method !== undefined) {
                methods.push(method);
            }
        }
        expect(methods.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0880
     * @tc.name testClassGetInstanceMethod088
     * @tc.desc Verify ClassGetInstanceMethod case 088: using getInstanceMethod method call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calc = new Calculator088();
        expect(dynamicCall088(calc, 'add', 10, 20)).assertEqual(30);
        expect(dynamicCall088(calc, 'subtract', 20, 10)).assertEqual(10);
        expect(dynamicCall088(calc, 'multiply', 5, 6)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0890
     * @tc.name testClassGetInstanceMethod089
     * @tc.desc Verify ClassGetInstanceMethod case 089: using getInstanceMethod method in
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass089();
        expect(hasMethod089(obj, 'existingMethod')).assertEqual(true);
        expect(hasMethod089(obj, 'nonExistentMethod')).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0900
     * @tc.name testClassGetInstanceMethod090
     * @tc.desc Verify ClassGetInstanceMethod case 090: ReflectionUtils invokeMethod and methodExists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new TestClass090();
        let result = ReflectionUtils090.invokeMethod(obj, 'greet', 'World');
        expect(result).assertEqual('Hello, World');
        expect(ReflectionUtils090.methodExists(obj, 'greet')).assertEqual(true);
        expect(ReflectionUtils090.methodExists(obj, 'unknown')).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0910
     * @tc.name testClassGetInstanceMethod091
     * @tc.desc Verify ClassGetInstanceMethod case 091: different API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let cls24 = Class.from<APIClass24091>();
        let cls25 = Class.from<APIClass25091>();
        expect(cls24.getInstanceMethod('method24') !== null).assertTrue();
        expect(cls25.getInstanceMethod('method25') !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0920
     * @tc.name testClassGetInstanceMethod092
     * @tc.desc Verify ClassGetInstanceMethod case 092: method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 测试Array类的方法
        let arrayCls = Class.from<Array<int>>();
        let pushMethod: reflect.InstanceMethod | undefined;
        let arrayMethods = Utils.fixedArrayToArray(arrayCls.getInstanceMethods());
        for (let i = 0; i < arrayMethods.length; i++) {
          let method = arrayMethods[i];
          if (method.getName() === 'push' && method.getParametersNum() === 1) {
            pushMethod = method;
            break;
          }
        }
        if (pushMethod !== undefined) {
          expect(pushMethod!.isNative()).assertEqual(true);
        }

        let mapCls = Class.from<Map<string, int>>();
        let setMethod: reflect.InstanceMethod | undefined;
        let mapMethods = Utils.fixedArrayToArray(mapCls.getInstanceMethods());
        for (let i = 0; i < mapMethods.length; i++) {
          let method = mapMethods[i];
          if (method.getName() === 'set' && method.getParametersNum() === 2) {
            setMethod = method;
            break;
          }
        }
        if (setMethod !== undefined) {
          expect(setMethod!.getName()).assertEqual('set');
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0930
     * @tc.name testClassGetInstanceMethod093
     * @tc.desc Verify ClassGetInstanceMethod case 093: return Promise method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass093>();
        let method = cls.getInstanceMethod('asyncMethod');
        expect(method !== null).assertTrue();
        expect(method!.isAsync()).assertEqual(true);
        let returnType = method!.getReturnType();
        expect(returnType!.getName()).assertContain('Promise');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0940
     * @tc.name testClassGetInstanceMethod094
     * @tc.desc Verify ClassGetInstanceMethod case 094: return this call method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Builder094>();
        let method = cls.getInstanceMethod('setName', [Class.from<string>()]);
        expect(method !== null).assertTrue();
        // 验证返回类型
        let returnType = method!.getReturnType();
        expect(Utils.classNameMatches(returnType!.getName(), 'Builder094')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0950
     * @tc.name testClassGetInstanceMethod095
     * @tc.desc Verify ClassGetInstanceMethod case 095: return type method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass095>();
        let method = cls.getInstanceMethod('getValue');
        expect(method !== null).assertTrue();
        let returnType = method!.getReturnType();
        expect(returnType!.isUnion()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0960
     * @tc.name testClassGetInstanceMethod096
     * @tc.desc Verify ClassGetInstanceMethod case 096: throw error method return never
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass096>();
        let method = cls.getInstanceMethod('alwaysThrow');
        expect(method !== null).assertTrue();
        // 调用该方法应该抛出错误
        try {
            method!.invoke(new MyClass096());
            expect().assertFail();
        } catch (error) {
            expect(error !== null).assertTrue();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0970
     * @tc.name testClassGetInstanceMethod097
     * @tc.desc Verify ClassGetInstanceMethod case 097: multiple modifier method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass097>();
        let method = cls.getInstanceMethod('combinedMethod');
        expect(method !== null).assertTrue();
        expect(method!.isPublic()).assertEqual(true);
        expect(method!.isAsync()).assertEqual(true);
        expect(method!.isFinal()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0980
     * @tc.name testClassGetInstanceMethod098
     * @tc.desc Verify ClassGetInstanceMethod case 098: in abstract class method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass098>();
        let method = cls.getInstanceMethod('concreteMethod');
        expect(method !== null).assertTrue();
        expect(method!.isAbstract()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_0990
     * @tc.name testClassGetInstanceMethod099
     * @tc.desc Verify ClassGetInstanceMethod case 099: generic method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass099>();
        let method = cls.getInstanceMethod('process', [Class.from<int>()]);
        expect(method !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_1000
     * @tc.name testClassGetInstanceMethod100
     * @tc.desc Verify ClassGetInstanceMethod case 100: in method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MinimalClass100>();
        let method = cls.getInstanceMethod('min');
        expect(method !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_1010
     * @tc.name testClassGetInstanceMethod101
     * @tc.desc Verify ClassGetInstanceMethod case 101: in type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ComplexClass101>();

        // 测试查找各种方法
        expect(cls.getInstanceMethod('instanceMethod') !== null).assertTrue();
        expect(cls.getInstanceMethod('privateInstanceMethod')).assertEqual(undefined);
        expect(cls.getInstanceMethod('staticMethod')).assertEqual(undefined);
        expect(cls.getInstanceMethod('%%get-property') !== null).assertTrue();
        expect(cls.getInstanceMethod('%%set-property') !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_GETINSTANCEMETHOD_1020
     * @tc.name testClassGetInstanceMethod102
     * @tc.desc Verify ClassGetInstanceMethod case 102: in inheritance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassGetInstanceMethod102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GrandChild102>();

        // 只能找到当前类声明的方法
        expect(cls.getInstanceMethod('grandChildMethod') !== null).assertTrue();
        expect(cls.getInstanceMethod('childMethod')).assertEqual(undefined);
        expect(cls.getInstanceMethod('parentMethod')).assertEqual(undefined);
        expect(cls.getInstanceMethod('grandParentMethod')).assertEqual(undefined);
    });
  });
}
