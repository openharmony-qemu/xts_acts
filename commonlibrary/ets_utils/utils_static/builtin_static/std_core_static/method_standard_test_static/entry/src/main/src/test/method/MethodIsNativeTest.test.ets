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

class IsNativeNormalSample {
    add(value: int): int {
        return value + 1;
    }
}

class IsNativeCtorClassSample {
    value: int = 0;
    constructor(val: int) {
        this.value = val;
    }
}

class IsNativeEmptyClassSample {
    emptyMethod(): void {}
}

class IsNativeNativeSample {
    native doNative(): void;
}

class IsNativeStaticCls {
    static getValue(): int {
        return 99;
    }
}

class IsNativeStaticNativeCls {
    static native staticNativeFunc(): void;
}

class IsNativeFinalCls {
    final getStr(): string {
        return "str";
    }
}

class IsNativeMixedCls {
    normalOp(): int {
        return 5;
    }
    native doNativeOp(): void;
}

class IsNativeParentCls {
    parentMethod(): string {
        return "parent";
    }
}

class IsNativeChildCls extends IsNativeParentCls {
    childMethod(): string {
        return "child";
    }
}

class IsNativeReturnSample {
    bar(): string {
        return "";
    }
}

class IsNativeAsyncSample {
    async fetch(): Promise<string> {
        return "ok";
    }
}

class IsNativeStaticAsyncSample {
    static async load(): Promise<string> {
        return "ok";
    }
}

class IsNativeAccessorSample {
    private _data: string = "";

    get data(): string {
        return this._data;
    }

    set data(value: string) {
        this._data = value;
    }
}

class IsNativePrivateProtectedSample {
    private work(): void {}

    protected helper(): void {}
}

abstract class IsNativeAbstractSample {
    abstract run(): void;

    concrete(): void {}
}

class IsNativeOverloadSample {
    method(value: int): void {}
    method(value: int, text: string): void {}
}

class IsNativeInterfaceImpl {
    work(): void {}
}

class IsNativeAsyncFinalSample {
    async asyncUser(): Promise<void> {}

    final finalUser(): void {}
}

class IsNativeParamSample {
    withDefault(value: string = "ok"): string {
        return value;
    }

    withRest(...values: int[]): int {
        return values.length;
    }

    returnsThis(): IsNativeParamSample {
        return this;
    }

    returnsPromise(): Promise<int> {
        return Promise.resolve(1);
    }

    toString(): string {
        return "user";
    }
}

class IsNativeGetterSetterCombo {
    private _value: int = 0;

    get value(): int {
        return this._value;
    }

    set value(v: int) {
        this._value = v;
    }
}

class IsNativeOwnerSample {
    ownerMethod(): void {}
}

class IsNativeNativeLoopSample {
    native firstNative(): void;

    native secondNative(): void;
}

function findIsNativeMethod(classType: ClassType, name: string, wantStatic?: boolean): Method {
    for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
        const method = classType.getMethod(i);
        if (method.getName() === name) {
            if (wantStatic === undefined || method.isStatic() === wantStatic) {
                return method;
            }
        }
    }
    expect().assertFail();
    throw new Error(`Missing method: ${name}`);
}

export default function MethodIsNativeTest(): void {
    describe('MethodIsNativeTest', () => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_0100
         * @tc.name testMethodIsNative001
         * @tc.desc Verify that isNative can be called without parameters and returns boolean
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeNormalSample>() as ClassType).getMethodByName("add");
            const result: boolean = method.isNative();
            expect(typeof result).assertEqual("boolean");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_0200
         * @tc.name testMethodIsNative002
         * @tc.desc Verify that isNative returns false for a normal user-defined method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeNormalSample>() as ClassType).getMethodByName("add");
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_0300
         * @tc.name testMethodIsNative003
         * @tc.desc Verify that isNative returns true for a native user-defined method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeNativeSample>() as ClassType).getMethodByName("doNative");
            expect(method.isNative()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_0400
         * @tc.name testMethodIsNative004
         * @tc.desc Verify that isNative works correctly for constructors
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const ctor = (Type.from<IsNativeCtorClassSample>() as ClassType).getConstructor(0);
            const isNativeResult = ctor.isNative();
            expect(typeof isNativeResult).assertEqual("boolean");
            expect(isNativeResult).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_0500
         * @tc.name testMethodIsNative005
         * @tc.desc Verify that isNative returns false for a method with empty body
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeEmptyClassSample>() as ClassType).getMethodByName("emptyMethod");
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_0600
         * @tc.name testMethodIsNative006
         * @tc.desc Verify that isNative does not throw Error on normal call
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeNormalSample>() as ClassType).getMethodByName("add");
            const result = method.isNative();
            expect(typeof result).assertEqual("boolean");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_0700
         * @tc.name testMethodIsNative007
         * @tc.desc Verify that isNative returns false and boolean for a normal method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeNormalSample>() as ClassType).getMethodByName("add");
            let result: boolean = method.isNative();
            expect(typeof result).assertEqual("boolean");
            expect(result).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_0800
         * @tc.name testMethodIsNative008
         * @tc.desc Verify isNative returns false for a static method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsNativeStaticCls>() as ClassType;
            let method: Method | undefined = undefined;
            for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
                const m = classType.getMethod(i);
                if (m.getName() === "getValue" && m.isStatic()) {
                    method = m;
                    break;
                }
            }
            expect(method!.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_0900
         * @tc.name testMethodIsNative009
         * @tc.desc Verify isNative returns true for a static native method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsNativeStaticNativeCls>() as ClassType;
            let method: Method | undefined = undefined;
            for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
                const m = classType.getMethod(i);
                if (m.getName() === "staticNativeFunc" && m.isStatic()) {
                    method = m;
                    break;
                }
            }
            expect(method!.isNative()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_1000
         * @tc.name testMethodIsNative010
         * @tc.desc Verify isNative returns false for a final method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeFinalCls>() as ClassType).getMethodByName("getStr");
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_1100
         * @tc.name testMethodIsNative011
         * @tc.desc Verify isNative distinguishes native from non-native in the same class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const clazz = (Type.from<IsNativeMixedCls>() as ClassType);
            const normal = clazz.getMethodByName("normalOp");
            const nativeMethod = clazz.getMethodByName("doNativeOp");
            expect(normal.isNative()).assertFalse();
            expect(nativeMethod.isNative()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_1200
         * @tc.name testMethodIsNative012
         * @tc.desc Verify isNative returns expected values for normal and native methods
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const normalMethod = (Type.from<IsNativeNormalSample>() as ClassType).getMethodByName("add");
            const nativeMethod = (Type.from<IsNativeNativeSample>() as ClassType).getMethodByName("doNative");
            expect(normalMethod.isNative()).assertFalse();
            expect(nativeMethod.isNative()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_1300
         * @tc.name testMethodIsNative013
         * @tc.desc Verify isNative used as condition in ternary expression returns expected value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const normalMethod = (Type.from<IsNativeNormalSample>() as ClassType).getMethodByName("add");
            const nativeMethod = (Type.from<IsNativeNativeSample>() as ClassType).getMethodByName("doNative");
            const normalTernary: boolean = normalMethod.isNative() ? true : false;
            expect(normalTernary).assertFalse();
            const nativeTernary: boolean = nativeMethod.isNative() ? true : false;
            expect(nativeTernary).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_1400
         * @tc.name testMethodIsNative014
         * @tc.desc Verify isNative result maps to expected string labels
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const normalMethod = (Type.from<IsNativeNormalSample>() as ClassType).getMethodByName("add");
            const nativeMethod = (Type.from<IsNativeNativeSample>() as ClassType).getMethodByName("doNative");
            const normalStr: string = normalMethod.isNative() ? "true" : "false";
            const nativeStr: string = nativeMethod.isNative() ? "true" : "false";
            expect(normalStr).assertEqual("false");
            expect(nativeStr).assertEqual("true");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_1500
         * @tc.name testMethodIsNative015
         * @tc.desc Verify isNative called multiple times in a loop returns consistent results
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeNormalSample>() as ClassType).getMethodByName("add");
            for (let i: int = 0; i < 5; i += 1) {
                const current: boolean = method.isNative();
                expect(current).assertFalse();
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_1600
         * @tc.name testMethodIsNative016
         * @tc.desc Verify isNative combined with isStatic classifies static and instance methods correctly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsNativeStaticCls>() as ClassType;
            let staticMethod: Method | undefined = undefined;
            for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
                const m = classType.getMethod(i);
                if (m.getName() === "getValue" && m.isStatic()) {
                    staticMethod = m;
                    break;
                }
            }
            const normalMethod = (Type.from<IsNativeNormalSample>() as ClassType).getMethodByName("add");
            expect(staticMethod!.isStatic()).assertTrue();
            expect(staticMethod!.isNative()).assertFalse();
            expect(normalMethod.isStatic()).assertFalse();
            expect(normalMethod.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_1700
         * @tc.name testMethodIsNative017
         * @tc.desc Verify isNative combined with getName correctly identifies the queried method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeNormalSample>() as ClassType).getMethodByName("add");
            expect(method.isNative()).assertFalse();
            const name: string = method.getName();
            expect(name).assertEqual("add");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_1800
         * @tc.name testMethodIsNative018
         * @tc.desc Verify isNative returns false for an inherited method from parent class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const parentMethod = (Type.from<IsNativeChildCls>() as ClassType).getMethodByName("parentMethod");
            expect(parentMethod.isNative()).assertFalse();
            const childOwnMethod = (Type.from<IsNativeChildCls>() as ClassType).getMethodByName("childMethod");
            expect(childOwnMethod.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_1900
         * @tc.name testMethodIsNative019
         * @tc.desc Verify user method returning string is not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeReturnSample>() as ClassType).getMethodByName("bar");
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_2000
         * @tc.name testMethodIsNative020
         * @tc.desc Verify async instance user method is not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeAsyncSample>() as ClassType).getMethodByName("fetch");
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_2100
         * @tc.name testMethodIsNative021
         * @tc.desc Verify static async user method is not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsNativeMethod(Type.from<IsNativeStaticAsyncSample>() as ClassType, "load", true);
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_2200
         * @tc.name testMethodIsNative022
         * @tc.desc Verify user getter is not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeAccessorSample>() as ClassType).getMethodByName("%%get-data");
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_2300
         * @tc.name testMethodIsNative023
         * @tc.desc Verify user setter is not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeAccessorSample>() as ClassType).getMethodByName("%%set-data");
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_2400
         * @tc.name testMethodIsNative024
         * @tc.desc Verify private user method is not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsNativeMethod(Type.from<IsNativePrivateProtectedSample>() as ClassType, "work");
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_2500
         * @tc.name testMethodIsNative025
         * @tc.desc Verify protected user method is not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsNativeMethod(Type.from<IsNativePrivateProtectedSample>() as ClassType, "helper");
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_2600
         * @tc.name testMethodIsNative026
         * @tc.desc Verify abstract user method is not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeAbstractSample>() as ClassType).getMethodByName("run");
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_2700
         * @tc.name testMethodIsNative027
         * @tc.desc Verify concrete method in abstract class is not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeAbstractSample>() as ClassType).getMethodByName("concrete");
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_2800
         * @tc.name testMethodIsNative028
         * @tc.desc Verify interface implementation user method is not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeInterfaceImpl>() as ClassType).getMethodByName("work");
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_2900
         * @tc.name testMethodIsNative029
         * @tc.desc Verify async user method is async and not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeAsyncFinalSample>() as ClassType).getMethodByName("asyncUser");
            expect(method.isAsync()).assertTrue();
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_3000
         * @tc.name testMethodIsNative030
         * @tc.desc Verify final user method is final and not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeAsyncFinalSample>() as ClassType).getMethodByName("finalUser");
            expect(method.isFinal()).assertTrue();
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_3100
         * @tc.name testMethodIsNative031
         * @tc.desc Verify getter is getter and not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeGetterSetterCombo>() as ClassType).getMethodByName("%%get-value");
            expect(method.isGetter()).assertTrue();
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_3200
         * @tc.name testMethodIsNative032
         * @tc.desc Verify setter is setter and not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeGetterSetterCombo>() as ClassType).getMethodByName("%%set-value");
            expect(method.isSetter()).assertTrue();
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_3300
         * @tc.name testMethodIsNative033
         * @tc.desc Verify constructor is constructor and not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeCtorClassSample>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_3400
         * @tc.name testMethodIsNative034
         * @tc.desc Verify abstract method is abstract and not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeAbstractSample>() as ClassType).getMethodByName("run");
            expect(method.isAbstract()).assertTrue();
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_3500
         * @tc.name testMethodIsNative035
         * @tc.desc Verify user method with default parameter is not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeParamSample>() as ClassType).getMethodByName("withDefault");
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_3600
         * @tc.name testMethodIsNative036
         * @tc.desc Verify user method with rest parameter is not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeParamSample>() as ClassType).getMethodByName("withRest");
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_3700
         * @tc.name testMethodIsNative037
         * @tc.desc Verify user method returning this is not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeParamSample>() as ClassType).getMethodByName("returnsThis");
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_3800
         * @tc.name testMethodIsNative038
         * @tc.desc Verify user method returning Promise is not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeParamSample>() as ClassType).getMethodByName("returnsPromise");
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_3900
         * @tc.name testMethodIsNative039
         * @tc.desc Verify user toString method mimicking native name is not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeParamSample>() as ClassType).getMethodByName("toString");
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_4000
         * @tc.name testMethodIsNative040
         * @tc.desc Verify user method owner type and isNative are stable
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeOwnerSample>() as ClassType).getMethodByName("ownerMethod");
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodIsNativeTest.test.IsNativeOwnerSample");
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_4100
         * @tc.name testMethodIsNative041
         * @tc.desc Verify native method repeated calls return true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeNativeSample>() as ClassType).getMethodByName("doNative");
            expect(method.isNative()).assertTrue();
            expect(method.isNative()).assertTrue();
            expect(method.isNative()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_4200
         * @tc.name testMethodIsNative042
         * @tc.desc Verify multiple native Method objects return true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsNativeNativeLoopSample>() as ClassType;
            expect(classType.getMethodByName("firstNative").isNative()).assertTrue();
            expect(classType.getMethodByName("secondNative").isNative()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_4300
         * @tc.name testMethodIsNative043
         * @tc.desc Verify native and user methods in same class are distinguished repeatedly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsNativeMixedCls>() as ClassType;
            expect(classType.getMethodByName("normalOp").isNative()).assertFalse();
            expect(classType.getMethodByName("doNativeOp").isNative()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_4400
         * @tc.name testMethodIsNative044
         * @tc.desc Verify static native method is static and native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsNativeMethod(Type.from<IsNativeStaticNativeCls>() as ClassType, "staticNativeFunc", true);
            expect(method.isStatic()).assertTrue();
            expect(method.isNative()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_4500
         * @tc.name testMethodIsNative045
         * @tc.desc Verify static user method is static and not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsNativeMethod(Type.from<IsNativeStaticCls>() as ClassType, "getValue", true);
            expect(method.isStatic()).assertTrue();
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_4600
         * @tc.name testMethodIsNative046
         * @tc.desc Verify inherited user parent method remains not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeChildCls>() as ClassType).getMethodByName("parentMethod");
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_4700
         * @tc.name testMethodIsNative047
         * @tc.desc Verify child own user method remains not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeChildCls>() as ClassType).getMethodByName("childMethod");
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_4800
         * @tc.name testMethodIsNative048
         * @tc.desc Verify empty user method remains not native across repeated checks
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeEmptyClassSample>() as ClassType).getMethodByName("emptyMethod");
            expect(method.isNative()).assertFalse();
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_4900
         * @tc.name testMethodIsNative049
         * @tc.desc Verify method name lookup does not affect native flag
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeParamSample>() as ClassType).getMethodByName("withDefault");
            expect(method.getName()).assertEqual("withDefault");
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_5000
         * @tc.name testMethodIsNative050
         * @tc.desc Verify native method name lookup does not affect native flag
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeNativeSample>() as ClassType).getMethodByName("doNative");
            expect(method.getName()).assertEqual("doNative");
            expect(method.isNative()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_5100
         * @tc.name testMethodIsNative051
         * @tc.desc Verify user getter remains getter and not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeAccessorSample>() as ClassType).getMethodByName("%%get-data");
            expect(method.isGetter()).assertTrue();
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_5200
         * @tc.name testMethodIsNative052
         * @tc.desc Verify user setter remains setter and not native after property use
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const sample = new IsNativeGetterSetterCombo();
            sample.value = 5;
            const method = (Type.from<IsNativeGetterSetterCombo>() as ClassType).getMethodByName("%%set-value");
            expect(method.isSetter()).assertTrue();
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_5300
         * @tc.name testMethodIsNative053
         * @tc.desc Verify multiple user Method objects stay not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsNativeParamSample>() as ClassType;
            expect(classType.getMethodByName("withDefault").isNative()).assertFalse();
            expect(classType.getMethodByName("withRest").isNative()).assertFalse();
            expect(classType.getMethodByName("returnsThis").isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_5400
         * @tc.name testMethodIsNative054
         * @tc.desc Verify user toString method keeps its name and remains not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsNativeParamSample>() as ClassType).getMethodByName("toString");
            expect(method.getName()).assertEqual("toString");
            expect(method.isNative()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_NATIVE_5500
         * @tc.name testMethodIsNative055
         * @tc.desc Verify overloaded methods are not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsNative055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsNativeOverloadSample>() as ClassType;
            let oneParamMethod: Method | undefined = undefined;
            let twoParamMethod: Method | undefined = undefined;
            for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
                const method = classType.getMethod(i);
                if (method.getName() === "method") {
                    const parameterCount = method.getType().getParametersNum();
                    if (parameterCount === 1) {
                        oneParamMethod = method;
                    } else if (parameterCount === 2) {
                        twoParamMethod = method;
                    }
                }
            }
            expect(oneParamMethod !== undefined).assertTrue();
            expect(twoParamMethod !== undefined).assertTrue();
            expect(oneParamMethod!.isNative()).assertFalse();
            expect(twoParamMethod!.isNative()).assertFalse();
        });
    });
}
