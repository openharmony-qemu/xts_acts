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

class IsStaticInstanceSample {
    add(value: int): int {
        return value + 1;
    }
}

class IsStaticStaticSample {
    public static staticAdd(value: int): int {
        return value + 1;
    }
}

class IsStaticCtorSample {
    constructor() {}
}

class IsStaticGetterSetterSample {
    private _value: int = 0;
    get value(): int {
        return this._value;
    }
    set value(v: int) {
        this._value = v;
    }
}

class IsStaticProtectedSample {
    protected protectedMethod(): void {}
}

class IsStaticMultiMethodSample {
    public instanceMethod(): void {}
    public static staticMethod(): void {}
    public anotherInstance(): int {
        return 1;
    }
    public static anotherStatic(): int {
        return 2;
    }
}

class IsStaticClassA {
    public process(): void {}
}

class IsStaticClassB {
    public static process(): void {}
}

class IsStaticAsyncSample {
    public static async asyncMethod(): Promise<void> {}
}

class IsStaticNativeMethodSample {
    native doNative(): void;
}

abstract class IsStaticAbstractMethodSample {
    abstract doAbstract(): void;
}

class IsStaticAbstractMethodImpl extends IsStaticAbstractMethodSample {
    doAbstract(): void {}
}

class IsStaticGetterInstanceSample {
    private _val: int = 0;
    get val(): int {
        return this._val;
    }
    set val(v: int) {
        this._val = v;
    }
}

class IsStaticGetterStaticSample {
    private static _val: int = 0;
    public static get val(): int {
        return IsStaticGetterStaticSample._val;
    }
    public static set val(v: int) {
        IsStaticGetterStaticSample._val = v;
    }
}

class IsStaticFinalCombinedSample {
    final doFinal(): void {}
    static doStatic(): void {}
}

abstract class IsStaticAbstractCombinedBase {
    abstract doAbstract(): void;
}

class IsStaticAbstractCombinedImpl extends IsStaticAbstractCombinedBase {
    doAbstract(): void {}
    static doStaticConcrete(): void {}
}

class IsStaticNamedCombinedSample {
    static myStaticMethod(): void {}
    instanceMethod(): void {}
}

class IsStaticInheritParent {
    static parentMethod(): void {}
}

class IsStaticInheritChild extends IsStaticInheritParent {
    static childMethod(): void {}
}

class IsStaticBoolCheckSample {
    static staticOne(): void {}
    static staticTwo(): int {
        return 2;
    }
    instanceOne(): void {}
    instanceTwo(): int {
        return 0;
    }
}

class IsStaticStaticGetterSetterSample {
    private static _prop: string = "";
    static get prop(): string {
        return IsStaticStaticGetterSetterSample._prop;
    }
    static set prop(v: string) {
        IsStaticStaticGetterSetterSample._prop = v;
    }
}

class IsStaticParamReturnSample {
    static bar(x: int): void {}
    static greet(): string {
        return "";
    }
    empty(): void {}
}

class IsStaticAsyncInstanceSample {
    async load(): Promise<void> {}
}

class IsStaticAccessModifierSample {
    private static secret(): void {}
    private work(): void {}
    protected static helper(): void {}
    protected doTask(): void {}
    public static openStatic(): void {}
    public open(): void {}
    static implicitStatic(): void {}
    implicit(): void {}
}

abstract class IsStaticAbstractClassSample {
    static foo(): void {}
    bar(): void {}
    abstract run(): void;
}

interface IsStaticInterfaceSample {
    work(): void;
}

class IsStaticInterfaceImpl implements IsStaticInterfaceSample {
    work(): void {}
}

class IsStaticInstanceParent {
    greet(): string {
        return "parent";
    }
}

class IsStaticInstanceChild extends IsStaticInstanceParent {}

class IsStaticHiddenParent {
    static foo(): string {
        return "parent";
    }
    work(): string {
        return "parent";
    }
}

class IsStaticHiddenChild extends IsStaticHiddenParent {
    static foo(): string {
        return "child";
    }
    work(): string {
        return "child";
    }
}

class IsStaticLevelOne {
    static level(): int {
        return 1;
    }
}

class IsStaticLevelTwo extends IsStaticLevelOne {
    static level(): int {
        return 2;
    }
}

class IsStaticLevelThree extends IsStaticLevelTwo {
    static level(): int {
        return 3;
    }
}

class IsStaticComputedNameSample {
    static myStatic(): void {}
    static deleteStatic(): void {}
    static method_with_special_name(): void {}
    static unicodeStatic(): void {}
    static longStaticMethodNameABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ(): void {}
    static prototypeLike(): void {}
    static constructorLike(): void {}
}

class IsStaticComputedInstanceNameSample {
    myMethod(): void {}
    deleteInstance(): void {}
}

class IsStaticOverloadSample {
    static test(x: int | string): int | string {
        return x;
    }
    item(x: int | string): int | string {
        return x;
    }
}

class IsStaticPathSample {
    static route(): void {}
}

class IsStaticNameOwnerSample {
    static sameName(): void {}
    sameNameInstance(): void {}
}

class IsStaticAsyncComboSample {
    static async load(): Promise<string> {
        return "loaded";
    }
}

class IsStaticParamShapeSample {
    static greet(msg: string = "hi"): string {
        return msg;
    }
    static sum(...nums: int[]): int {
        return nums.length;
    }
    static update(point: IsStaticPoint): int {
        return point.x + point.y;
    }
    greetInst(msg: string = "hi"): string {
        return msg;
    }
}

class IsStaticPoint {
    x: int = 0;
    y: int = 0;
}

class IsStaticReturnShapeSample {
    static create(): IsStaticReturnShapeSample {
        return new IsStaticReturnShapeSample();
    }
    static log(): void {}
    static loadData(): Promise<string> {
        return Promise.resolve("data");
    }
}

class IsStaticMutationStableSample {
    static stable(): void {}
    instanceStable(): void {}
}

class IsStaticExpressionLikeSample {
    static m(): void {}
}

class IsStaticNamedExpressionLikeSample {
    static n(): void {}
}

class IsStaticMixinLikeSample {
    static mixed(): void {}
}

class IsStaticReadonlyWriteonlySample {
    private static _readOnly: int = 1;
    private static _writeOnly: int = 0;
    static get readOnly(): int {
        return IsStaticReadonlyWriteonlySample._readOnly;
    }
    static set writeOnly(v: int) {
        IsStaticReadonlyWriteonlySample._writeOnly = v;
    }
}

class IsStaticComprehensiveSample {
    private static _value: int = 0;
    static staticOne(): void {}
    instanceOne(): void {}
    static get value(): int {
        return IsStaticComprehensiveSample._value;
    }
    static set value(v: int) {
        IsStaticComprehensiveSample._value = v;
    }
    static empty(): void {}
    emptyInst(): void {}
    static getCount(): int {
        return IsStaticComprehensiveSample._value;
    }
    static handleData(data: Object): void {}
    static old(): void {}
}

function findIsStaticMethod(classType: ClassType, name: string, wantStatic?: boolean): Method {
    const count = classType.getMethodsNum();
    for (let i: long = 0; i < count; i += 1) {
        const method = classType.getMethod(i);
        if (method.getName() === name && (wantStatic === undefined || method.isStatic() === wantStatic)) {
            return method;
        }
    }
    expect().assertFail();
    return classType.getMethod(0);
}

export default function MethodIsStaticTest(): void {
    describe('MethodIsStaticTest', () => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_0100
         * @tc.name testMethodIsStatic001
         * @tc.desc Verify that isStatic can be called without parameters and returns boolean
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticInstanceSample>() as ClassType).getMethodByName("add");
            let result = method.isStatic();
            expect(result).assertFalse();
            expect(typeof result === "boolean").assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_0200
         * @tc.name testMethodIsStatic002
         * @tc.desc Verify that isStatic returns strict boolean true for static method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */

        it('testMethodIsStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsStaticStaticSample>() as ClassType;
            const count = classType.getMethodsNum();
            let method: Method | undefined = undefined;
            for (let i: long = 0; i < count; i += 1) {
                const m = classType.getMethod(i);
                if (m.getName() === "staticAdd") {
                    method = m;
                    break;
                }
            }
            let result = method!.isStatic();
            expect(result).assertTrue();
            expect(typeof result === "boolean").assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_0300
         * @tc.name testMethodIsStatic003
         * @tc.desc Verify that multiple calls to isStatic on same instance method return consistent results
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticInstanceSample>() as ClassType).getMethodByName("add");
            const first = method.isStatic();
            const second = method.isStatic();
            const third = method.isStatic();
            expect(first).assertFalse();
            expect(second).assertFalse();
            expect(third).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_0400
         * @tc.name testMethodIsStatic004
         * @tc.desc Verify that different classes with same method name but different static nature return different results
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const methodA = (Type.from<IsStaticClassA>() as ClassType).getMethodByName("process");
            const classTypeB = Type.from<IsStaticClassB>() as ClassType;
            const countB = classTypeB.getMethodsNum();
            let methodB: Method | undefined = undefined;
            for (let i: long = 0; i < countB; i += 1) {
                const m = classTypeB.getMethod(i);
                if (m.getName() === "process") {
                    methodB = m;
                    break;
                }
            }
            expect(methodA.isStatic()).assertEqual(false);
            expect(methodB!.isStatic()).assertEqual(true);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_0500
         * @tc.name testMethodIsStatic005
         * @tc.desc Verify that isStatic returns true for static async method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsStaticAsyncSample>() as ClassType;
            const count = classType.getMethodsNum();
            let method: Method | undefined = undefined;
            for (let i: long = 0; i < count; i += 1) {
                const m = classType.getMethod(i);
                if (m.getName() === "asyncMethod") {
                    method = m;
                    break;
                }
            }
            expect(method!.isStatic()).assertEqual(true);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_0600
         * @tc.name testMethodIsStatic006
         * @tc.desc Verify that isStatic returns false for a constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const ctor = (Type.from<IsStaticCtorSample>() as ClassType).getConstructor(0);
            expect(ctor.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_0700
         * @tc.name testMethodIsStatic007
         * @tc.desc Verify that setter isStatic returns false
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticGetterSetterSample>() as ClassType).getMethodByName("%%set-value");
            let result = method.isStatic();
            expect(result).assertEqual(false);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_0800
         * @tc.name testMethodIsStatic008
         * @tc.desc Verify that static method isStatic returns true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsStaticStaticSample>() as ClassType;
            const count = classType.getMethodsNum();
            let method: Method | undefined = undefined;
            for (let i: long = 0; i < count; i += 1) {
                const m = classType.getMethod(i);
                if (m.getName() === "staticAdd") {
                    method = m;
                    break;
                }
            }
            let isStaticResult = method!.isStatic();
            expect(isStaticResult).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_0900
         * @tc.name testMethodIsStatic009
         * @tc.desc Verify that isStatic returns false for a protected instance method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticProtectedSample>() as ClassType).getMethodByName("protectedMethod");
            let result: boolean = method.isStatic();
            expect(typeof result).assertEqual("boolean");
            expect(result).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_1000
         * @tc.name testMethodIsStatic010
         * @tc.desc Verify that isStatic returns correctly for instance and static methods with re-check
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsStaticMultiMethodSample>() as ClassType;
            const instanceMethod = classType.getMethodByName("instanceMethod");
            let staticMethod: Method | undefined = undefined;
            for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
                const method = classType.getMethod(i);
                if (method.getName() === "staticMethod") {
                    staticMethod = method;
                    break;
                }
            }
            expect(instanceMethod.isStatic()).assertFalse();
            expect(staticMethod!.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_1100
         * @tc.name testMethodIsStatic011
         * @tc.desc Verify that isStatic returns false for a native method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticNativeMethodSample>() as ClassType).getMethodByName("doNative");
            expect(method.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_1200
         * @tc.name testMethodIsStatic012
         * @tc.desc Verify that isStatic returns false for an abstract method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticAbstractMethodSample>() as ClassType).getMethodByName("doAbstract");
            expect(method.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_1300
         * @tc.name testMethodIsStatic013
         * @tc.desc Verify that isStatic returns false for both instance getter and setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const cls = Type.from<IsStaticGetterInstanceSample>() as ClassType;
            const getter = cls.getMethodByName("%%get-val");
            const setter = cls.getMethodByName("%%set-val");
            expect(getter.isStatic()).assertFalse();
            expect(setter.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_1400
         * @tc.name testMethodIsStatic014
         * @tc.desc Verify that isStatic returns true for both static getter and setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const cls = Type.from<IsStaticGetterStaticSample>() as ClassType;
            const count = cls.getMethodsNum();
            let getter: Method | undefined = undefined;
            let setter: Method | undefined = undefined;
            for (let i: long = 0; i < count; i += 1) {
                const m = cls.getMethod(i);
                const name = m.getName();
                if (name === "%%get-val") {
                    getter = m;
                } else if (name === "%%set-val") {
                    setter = m;
                }
            }
            expect(getter!.isStatic()).assertTrue();
            expect(setter!.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_1500
         * @tc.name testMethodIsStatic015
         * @tc.desc Verify that isStatic and isFinal return consistent values for same method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const cls = Type.from<IsStaticFinalCombinedSample>() as ClassType;
            const finalMethod = cls.getMethodByName("doFinal");
            const count = cls.getMethodsNum();
            let staticMethod: Method | undefined = undefined;
            for (let i: long = 0; i < count; i += 1) {
                const m = cls.getMethod(i);
                if (m.getName() === "doStatic") {
                    staticMethod = m;
                    break;
                }
            }
            expect(finalMethod.isFinal()).assertTrue();
            expect(finalMethod.isStatic()).assertFalse();
            expect(staticMethod!.isStatic()).assertTrue();
            expect(staticMethod!.isFinal()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_1600
         * @tc.name testMethodIsStatic016
         * @tc.desc Verify that isStatic and isAbstract return consistent values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const cls = Type.from<IsStaticAbstractCombinedImpl>() as ClassType;
            const concreteMethod = cls.getMethodByName("doAbstract");
            const count = cls.getMethodsNum();
            let staticMethod: Method | undefined = undefined;
            for (let i: long = 0; i < count; i += 1) {
                const m = cls.getMethod(i);
                if (m.getName() === "doStaticConcrete") {
                    staticMethod = m;
                    break;
                }
            }
            expect(concreteMethod.isAbstract()).assertFalse();
            expect(concreteMethod.isStatic()).assertFalse();
            expect(staticMethod!.isStatic()).assertTrue();
            expect(staticMethod!.isAbstract()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_1700
         * @tc.name testMethodIsStatic017
         * @tc.desc Verify that isStatic and getName return consistent values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const cls = Type.from<IsStaticNamedCombinedSample>() as ClassType;
            const count = cls.getMethodsNum();
            let staticMethod: Method | undefined = undefined;
            for (let i: long = 0; i < count; i += 1) {
                const m = cls.getMethod(i);
                if (m.getName() === "myStaticMethod") {
                    staticMethod = m;
                    break;
                }
            }
            const instanceMethod = cls.getMethodByName("instanceMethod");
            expect(staticMethod!.isStatic()).assertTrue();
            expect(staticMethod!.getName()).assertEqual("myStaticMethod");
            expect(instanceMethod.isStatic()).assertFalse();
            expect(instanceMethod.getName()).assertEqual("instanceMethod");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_1800
         * @tc.name testMethodIsStatic018
         * @tc.desc Verify that getMethodByName with nonexistent method throws TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            try {
                (Type.from<IsStaticInstanceSample>() as ClassType).getMethodByName("nonexistentMethod");
                expect().assertFail();
            } catch (error) {
                expect(error.name).assertEqual("TypeError");
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_1900
         * @tc.name testMethodIsStatic019
         * @tc.desc Verify that isStatic returns true for inherited static method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const parentCls = Type.from<IsStaticInheritParent>() as ClassType;
            const childCls = Type.from<IsStaticInheritChild>() as ClassType;
            const parentCount = parentCls.getMethodsNum();
            let parentMethod: Method | undefined = undefined;
            for (let i: long = 0; i < parentCount; i += 1) {
                const m = parentCls.getMethod(i);
                if (m.getName() === "parentMethod") {
                    parentMethod = m;
                    break;
                }
            }
            const childCount = childCls.getMethodsNum();
            let childMethod: Method | undefined = undefined;
            for (let i: long = 0; i < childCount; i += 1) {
                const m = childCls.getMethod(i);
                if (m.getName() === "parentMethod") {
                    childMethod = m;
                    break;
                }
            }
            expect(parentMethod!.isStatic()).assertTrue();
            expect(childMethod!.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_2000
         * @tc.name testMethodIsStatic020
         * @tc.desc Verify that isStatic returns boolean type consistently for all method types
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const cls = Type.from<IsStaticBoolCheckSample>() as ClassType;
            const count = cls.getMethodsNum();
            let allBoolean: boolean = true;
            for (let i: long = 0; i < count; i += 1) {
                const method = cls.getMethod(i);
                const result = method.isStatic();
                if (typeof result !== "boolean") {
                    allBoolean = false;
                    break;
                }
            }
            expect(allBoolean).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_2100
         * @tc.name testMethodIsStatic021
         * @tc.desc Verify static method with parameter is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticParamReturnSample>() as ClassType, "bar", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_2200
         * @tc.name testMethodIsStatic022
         * @tc.desc Verify static method with string return value is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticParamReturnSample>() as ClassType, "greet", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_2300
         * @tc.name testMethodIsStatic023
         * @tc.desc Verify no-parameter instance method is not static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticParamReturnSample>() as ClassType).getMethodByName("empty");
            expect(method.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_2400
         * @tc.name testMethodIsStatic024
         * @tc.desc Verify instance async method is not static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticAsyncInstanceSample>() as ClassType).getMethodByName("load");
            expect(method.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_2500
         * @tc.name testMethodIsStatic025
         * @tc.desc Verify private static method is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticAccessModifierSample>() as ClassType, "secret", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_2600
         * @tc.name testMethodIsStatic026
         * @tc.desc Verify private instance method is not static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticAccessModifierSample>() as ClassType).getMethodByName("work");
            expect(method.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_2700
         * @tc.name testMethodIsStatic027
         * @tc.desc Verify protected static method is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticAccessModifierSample>() as ClassType, "helper", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_2800
         * @tc.name testMethodIsStatic028
         * @tc.desc Verify protected instance method is not static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticAccessModifierSample>() as ClassType).getMethodByName("doTask");
            expect(method.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_2900
         * @tc.name testMethodIsStatic029
         * @tc.desc Verify explicit public static method is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticAccessModifierSample>() as ClassType, "openStatic", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_3000
         * @tc.name testMethodIsStatic030
         * @tc.desc Verify explicit public instance method is not static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticAccessModifierSample>() as ClassType).getMethodByName("open");
            expect(method.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_3100
         * @tc.name testMethodIsStatic031
         * @tc.desc Verify default access static method is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticAccessModifierSample>() as ClassType, "implicitStatic", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_3200
         * @tc.name testMethodIsStatic032
         * @tc.desc Verify default access instance method is not static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticAccessModifierSample>() as ClassType).getMethodByName("implicit");
            expect(method.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_3300
         * @tc.name testMethodIsStatic033
         * @tc.desc Verify static method declared in abstract class is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticAbstractClassSample>() as ClassType, "foo", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_3400
         * @tc.name testMethodIsStatic034
         * @tc.desc Verify instance method declared in abstract class is not static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticAbstractClassSample>() as ClassType).getMethodByName("bar");
            expect(method.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_3500
         * @tc.name testMethodIsStatic035
         * @tc.desc Verify abstract instance method is not static because ArkTS does not support abstract static methods
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticAbstractClassSample>() as ClassType).getMethodByName("run");
            expect(method.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_3600
         * @tc.name testMethodIsStatic036
         * @tc.desc Verify interface implementation method is not static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticInterfaceImpl>() as ClassType).getMethodByName("work");
            expect(method.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_3700
         * @tc.name testMethodIsStatic037
         * @tc.desc Verify inherited instance method remains non-static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticInstanceChild>() as ClassType).getMethodByName("greet");
            expect(method.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_3800
         * @tc.name testMethodIsStatic038
         * @tc.desc Verify child static method hiding parent static method is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticHiddenChild>() as ClassType, "foo", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_3900
         * @tc.name testMethodIsStatic039
         * @tc.desc Verify child instance method overriding parent instance method is not static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticHiddenChild>() as ClassType).getMethodByName("work");
            expect(method.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_4000
         * @tc.name testMethodIsStatic040
         * @tc.desc Verify multi-level static hiding method is static at grandchild level
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticLevelThree>() as ClassType, "level", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_4100
         * @tc.name testMethodIsStatic041
         * @tc.desc Verify computed static method name is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticComputedNameSample>() as ClassType, "myStatic", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_4200
         * @tc.name testMethodIsStatic042
         * @tc.desc Verify computed instance method name is not static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticComputedInstanceNameSample>() as ClassType).getMethodByName("myMethod");
            expect(method.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_4300
         * @tc.name testMethodIsStatic043
         * @tc.desc Verify static overload implementation method is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticOverloadSample>() as ClassType, "test", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_4400
         * @tc.name testMethodIsStatic044
         * @tc.desc Verify instance overload implementation method is not static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticOverloadSample>() as ClassType).getMethodByName("item");
            expect(method.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_4500
         * @tc.name testMethodIsStatic045
         * @tc.desc Verify static method remains static when obtained repeatedly from class type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsStaticPathSample>() as ClassType;
            expect(findIsStaticMethod(classType, "route", true).isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_4600
         * @tc.name testMethodIsStatic046
         * @tc.desc Verify static method name and static flag are consistent
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticNameOwnerSample>() as ClassType, "sameName", true);
            expect(method.getName()).assertEqual("sameName");
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_4700
         * @tc.name testMethodIsStatic047
         * @tc.desc Verify static method owner type is available while method remains static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticNameOwnerSample>() as ClassType, "sameName", true);
            expect(method.getOwnerType() !== undefined).assertTrue();
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_4800
         * @tc.name testMethodIsStatic048
         * @tc.desc Verify static getter is both getter and static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticGetterStaticSample>() as ClassType, "%%get-val", true);
            expect(method.isGetter()).assertTrue();
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_4900
         * @tc.name testMethodIsStatic049
         * @tc.desc Verify static setter is both setter and static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticGetterStaticSample>() as ClassType, "%%set-val", true);
            expect(method.isSetter()).assertTrue();
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_5000
         * @tc.name testMethodIsStatic050
         * @tc.desc Verify constructor is constructor but not static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticCtorSample>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
            expect(method.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_5100
         * @tc.name testMethodIsStatic051
         * @tc.desc Verify abstract instance method is abstract and not static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticAbstractClassSample>() as ClassType).getMethodByName("run");
            expect(method.isAbstract()).assertTrue();
            expect(method.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_5200
         * @tc.name testMethodIsStatic052
         * @tc.desc Verify static async method is both async and static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticAsyncComboSample>() as ClassType, "load", true);
            expect(method.isAsync()).assertTrue();
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_5300
         * @tc.name testMethodIsStatic053
         * @tc.desc Verify static final is unsupported by checking static method is not final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticFinalCombinedSample>() as ClassType, "doStatic", true);
            expect(method.isStatic()).assertTrue();
            expect(method.isFinal()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_5400
         * @tc.name testMethodIsStatic054
         * @tc.desc Verify reserved-word-like static computed name is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticComputedNameSample>() as ClassType, "deleteStatic", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_5500
         * @tc.name testMethodIsStatic055
         * @tc.desc Verify reserved-word-like instance computed name is not static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticComputedInstanceNameSample>() as ClassType).getMethodByName("deleteInstance");
            expect(method.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_5600
         * @tc.name testMethodIsStatic056
         * @tc.desc Verify long static method name is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticComputedNameSample>() as ClassType, "longStaticMethodNameABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_5700
         * @tc.name testMethodIsStatic057
         * @tc.desc Verify special-character-like static computed name is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticComputedNameSample>() as ClassType, "method_with_special_name", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_5800
         * @tc.name testMethodIsStatic058
         * @tc.desc Verify Unicode static computed name is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticComputedNameSample>() as ClassType, "unicodeStatic", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_5900
         * @tc.name testMethodIsStatic059
         * @tc.desc Verify static method with default parameter is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticParamShapeSample>() as ClassType, "greet", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_6000
         * @tc.name testMethodIsStatic060
         * @tc.desc Verify static method with rest parameter is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticParamShapeSample>() as ClassType, "sum", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_6100
         * @tc.name testMethodIsStatic061
         * @tc.desc Verify static method with object-shaped parameter is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticParamShapeSample>() as ClassType, "update", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_6200
         * @tc.name testMethodIsStatic062
         * @tc.desc Verify instance method with default parameter is not static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticParamShapeSample>() as ClassType).getMethodByName("greetInst");
            expect(method.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_6300
         * @tc.name testMethodIsStatic063
         * @tc.desc Verify static method returning class type is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticReturnShapeSample>() as ClassType, "create", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_6400
         * @tc.name testMethodIsStatic064
         * @tc.desc Verify static void method is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticReturnShapeSample>() as ClassType, "log", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_6500
         * @tc.name testMethodIsStatic065
         * @tc.desc Verify static Promise-returning method is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticReturnShapeSample>() as ClassType, "loadData", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_6600
         * @tc.name testMethodIsStatic066
         * @tc.desc Verify pre-acquired static Method remains static across stable metadata checks
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticMutationStableSample>() as ClassType, "stable", true);
            expect(method.isStatic()).assertTrue();
            expect(method.getName()).assertEqual("stable");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_6700
         * @tc.name testMethodIsStatic067
         * @tc.desc Verify pre-acquired instance Method remains non-static across stable metadata checks
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticMutationStableSample>() as ClassType).getMethodByName("instanceStable");
            expect(method.isStatic()).assertFalse();
            expect(method.getName()).assertEqual("instanceStable");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_6800
         * @tc.name testMethodIsStatic068
         * @tc.desc Verify static method m is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticExpressionLikeSample>() as ClassType, "m", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_6900
         * @tc.name testMethodIsStatic069
         * @tc.desc Verify static method n is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticNamedExpressionLikeSample>() as ClassType, "n", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_7000
         * @tc.name testMethodIsStatic070
         * @tc.desc Verify class-owned static method is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticMixinLikeSample>() as ClassType, "mixed", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_7100
         * @tc.name testMethodIsStatic071
         * @tc.desc Verify prototype-like static method name is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticComputedNameSample>() as ClassType, "prototypeLike", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_7200
         * @tc.name testMethodIsStatic072
         * @tc.desc Verify constructor-like static method name is static and not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticComputedNameSample>() as ClassType, "constructorLike", true);
            expect(method.isConstructor()).assertFalse();
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_7300
         * @tc.name testMethodIsStatic073
         * @tc.desc Verify read-only static getter is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticReadonlyWriteonlySample>() as ClassType, "%%get-readOnly", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_7400
         * @tc.name testMethodIsStatic074
         * @tc.desc Verify write-only static setter is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticReadonlyWriteonlySample>() as ClassType, "%%set-writeOnly", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_7500
         * @tc.name testMethodIsStatic075
         * @tc.desc Verify mixed class static method is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticComprehensiveSample>() as ClassType, "staticOne", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_7600
         * @tc.name testMethodIsStatic076
         * @tc.desc Verify mixed class instance method is not static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticComprehensiveSample>() as ClassType).getMethodByName("instanceOne");
            expect(method.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_7700
         * @tc.name testMethodIsStatic077
         * @tc.desc Verify static getter in comprehensive class is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticComprehensiveSample>() as ClassType, "%%get-value", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_7800
         * @tc.name testMethodIsStatic078
         * @tc.desc Verify static setter in comprehensive class is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticComprehensiveSample>() as ClassType, "%%set-value", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_7900
         * @tc.name testMethodIsStatic079
         * @tc.desc Verify empty static method body is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticComprehensiveSample>() as ClassType, "empty", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_8000
         * @tc.name testMethodIsStatic080
         * @tc.desc Verify empty instance method body is not static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsStaticComprehensiveSample>() as ClassType).getMethodByName("emptyInst");
            expect(method.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_8100
         * @tc.name testMethodIsStatic081
         * @tc.desc Verify static method referencing static state through class name is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticComprehensiveSample>() as ClassType, "getCount", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_8200
         * @tc.name testMethodIsStatic082
         * @tc.desc Verify static method with broad Object parameter is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticComprehensiveSample>() as ClassType, "handleData", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_8300
         * @tc.name testMethodIsStatic083
         * @tc.desc Verify ordinary static method is reported as static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticComprehensiveSample>() as ClassType, "old", true);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_8400
         * @tc.name testMethodIsStatic084
         * @tc.desc Verify repeated static calls remain true for five calls
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsStaticMethod(Type.from<IsStaticComprehensiveSample>() as ClassType, "staticOne", true);
            expect(method.isStatic()).assertTrue();
            expect(method.isStatic()).assertTrue();
            expect(method.isStatic()).assertTrue();
            expect(method.isStatic()).assertTrue();
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_STATIC_8500
         * @tc.name testMethodIsStatic085
         * @tc.desc Verify concurrent async tasks can observe static method as static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsStatic085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            const method = findIsStaticMethod(Type.from<IsStaticComprehensiveSample>() as ClassType, "staticOne", true);
            const results = await Promise.all([Promise.resolve(method.isStatic()), Promise.resolve(method.isStatic())]);
            expect(results[0]).assertTrue();
            expect(results[1]).assertTrue();
        });
    });
}
