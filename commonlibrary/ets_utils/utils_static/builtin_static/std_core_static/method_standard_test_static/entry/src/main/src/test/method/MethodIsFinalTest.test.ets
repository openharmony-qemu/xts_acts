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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

class IsFinalNormalSample {
    add(value: int): int {
        return value + 1;
    }
}

class IsFinalFinalSample {
    final add(value: int): int {
        return value + 1;
    }
}

class IsFinalGetterSample {
    private _value: int = 0;
    final get value(): int {
        return this._value;
    }
}

class IsFinalSetterSample {
    private _value: int = 0;
    final set value(v: int) {
        this._value = v;
    }
}

class IsFinalParent {
    final doWork(): void {}
}

class IsFinalChild extends IsFinalParent {}

abstract class IsFinalAbstractSample {
    abstract doAbstract(): void;
}

class IsFinalPrivateMethodSample {
    private secretMethod(): void {}
}

class IsFinalMultiMethodSample {
    normalMethod(): void {}
    final finalMethod(): void {}
    static staticMethod(): void {}
}

class IsFinalCtorSample {
    constructor() {}
}

class IsFinalStaticMethodSample {
    static doSomething(): void {}
}

class IsFinalAsyncMethodSample {
    async doSomething(): Promise<void> {}
}

class IsFinalNativeMethodSample {
    native doSomething(): void;
}

interface IsFinalInterfaceForImpl {
    doSomething(): void;
}

class IsFinalImplClass implements IsFinalInterfaceForImpl {
    doSomething(): void {}
}

class IsFinalNonFinalGetter {
    private _value: int = 0;
    get value(): int {
        return this._value;
    }
}

abstract class IsFinalAbstractCombo {
    final concreteMethod(): void {}
    abstract abstractMethod(): void;
}

class IsFinalStaticCombo {
    final finalMethod(): void {}
    static staticMethod(): void {}
}

class IsFinalGrandparentNode {
    final doWork(): void {}
}

class IsFinalParentNode extends IsFinalGrandparentNode {}

class IsFinalGrandchildNode extends IsFinalParentNode {}

class IsFinalStaticAsyncSample {
    static async task(): Promise<void> {}
}

class IsFinalAsyncFinalSample {
    async fetch(): Promise<void> {}
}

class IsFinalPrivateFinalSample {
    private final work(): void {}
}

class IsFinalProtectedFinalSample {
    protected final helper(): void {}
}

class IsFinalPublicFinalSample {
    public final open(): void {}
}

class IsFinalParamSample {
    final greet(msg: string = "hi"): string {
        return msg;
    }
}

class IsFinalRestSample {
    final sum(...nums: int[]): int {
        let total: int = 0;
        for (const num of nums) {
            total += num;
        }
        return total;
    }
}

class IsFinalOptionalSample {
    final log(msg?: string): string {
        return msg === undefined ? "none" : msg;
    }
}

class IsFinalThisSample {
    final chain(): IsFinalThisSample {
        return this;
    }
}

class IsFinalGenericSample<T> {
    final getItem(item: T): T {
        return item;
    }
}

class IsFinalGenericBoxSample<T> {
    private value: T;

    constructor(value: T) {
        this.value = value;
    }

    final getValue(): T {
        return this.value;
    }
}

class IsFinalReturnPromiseSample {
    final get(): Promise<int> {
        return Promise.resolve(1);
    }
}

class IsFinalReturnVoidSample {
    final noop(): void {
    }
}

class IsFinalMixedMethodSample {
    final finalMethod(): void {}
    static staticMethod(): void {}
    async asyncMethod(): Promise<void> {}
    get value(): int {
        return 1;
    }
}

class IsFinalInterfaceParent {
    doSomething(): void {}
}

class IsFinalInterfaceChildImpl implements IsFinalInterfaceForImpl {
    final doSomething(): void {}
}

class IsFinalOverrideParent {
    doWork(): void {}
}

class IsFinalOverrideChild extends IsFinalOverrideParent {
    override doWork(): void {}

    final childFinal(): void {}
}

class IsFinalFinalOwnerSample {
    final ownFinal(): void {}

    ownMethod(): void {}
}

class IsFinalInheritedStaticParent {
    static create(): void {}
}

class IsFinalInheritedStaticChild extends IsFinalInheritedStaticParent {
}

class IsFinalHiddenStaticChild extends IsFinalInheritedStaticParent {
    static create(): void {}
}

class IsFinalPublicOpenSample {
    public open(): void {}
}

class IsFinalAccessorPairSample {
    private _count: int = 0;

    final get count(): int {
        return this._count;
    }

    final set count(v: int) {
        this._count = v;
    }
}

class IsFinalAbstractConcreteSample extends IsFinalAbstractCombo {
    abstractMethod(): void {}
}

class IsFinalOwnerSample {
    final ownerMethod(): void {}
}

class IsFinalMixinBase {
    final baseFinal(): void {}
}

class IsFinalMixinChild extends IsFinalMixinBase {
}

class IsFinalOverloadSample {
    method(value: int): void {}
    method(value: int, text: string): void {}
}

function findIsFinalMethod(classType: ClassType, name: string, wantStatic?: boolean): Method {
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

function hasIsFinalMethod(classType: ClassType, name: string): boolean {
    for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
        if (classType.getMethod(i).getName() === name) {
            return true;
        }
    }
    return false;
}

export default function MethodIsFinalTest(): void {
    describe('MethodIsFinalTest', () => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_0100
         * @tc.name testMethodIsFinal001
         * @tc.desc Verify that isFinal returns false for a normal method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalNormalSample>() as ClassType).getMethodByName("add");
            expect(method.isFinal()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_0200
         * @tc.name testMethodIsFinal002
         * @tc.desc Verify that isFinal returns true for a final method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalFinalSample>() as ClassType).getMethodByName("add");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_0300
         * @tc.name testMethodIsFinal003
         * @tc.desc Verify that isFinal returns true for a final getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalGetterSample>() as ClassType).getMethodByName("%%get-value");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_0400
         * @tc.name testMethodIsFinal004
         * @tc.desc Verify that isFinal returns true for a final setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalSetterSample>() as ClassType).getMethodByName("%%set-value");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_0500
         * @tc.name testMethodIsFinal005
         * @tc.desc Verify that isFinal returns true for inherited final method from parent class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalChild>() as ClassType).getMethodByName("doWork");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_0600
         * @tc.name testMethodIsFinal006
         * @tc.desc Verify that isFinal returns false for an abstract method (abstract cannot be final)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalAbstractSample>() as ClassType).getMethodByName("doAbstract");
            expect(method.isFinal()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_0700
         * @tc.name testMethodIsFinal007
         * @tc.desc Verify that typeof isFinal return value is 'boolean'
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalNormalSample>() as ClassType).getMethodByName("add");
            const result = method.isFinal();
            expect(typeof result).assertEqual("boolean");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_0800
         * @tc.name testMethodIsFinal008
         * @tc.desc Verify that isFinal return value is strictly true or false
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method1 = (Type.from<IsFinalNormalSample>() as ClassType).getMethodByName("add");
            const method2 = (Type.from<IsFinalFinalSample>() as ClassType).getMethodByName("add");
            const r1 = method1.isFinal();
            const r2 = method2.isFinal();
            expect(r1).assertFalse();
            expect(r2).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_0900
         * @tc.name testMethodIsFinal009
         * @tc.desc Verify that isFinal return value is strictly boolean, not truthy/falsy
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalNormalSample>() as ClassType).getMethodByName("add");
            const result = method.isFinal();
            expect(result).assertEqual(false);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_1000
         * @tc.name testMethodIsFinal010
         * @tc.desc Verify that multiple calls to isFinal on the same Method return consistent results
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalNormalSample>() as ClassType).getMethodByName("add");
            const results: boolean[] = [];
            for (let i: int = 0; i < 10; i += 1) {
                results.push(method.isFinal());
            }
            const first = results[0];
            for (const r of results) {
                expect(r).assertEqual(first);
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_1100
         * @tc.name testMethodIsFinal011
         * @tc.desc Verify that isFinal returns false for a private non-final method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalPrivateMethodSample>() as ClassType).getMethodByName("secretMethod");
            expect(typeof method.isFinal()).assertEqual("boolean");
            expect(method.isFinal()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_1200
         * @tc.name testMethodIsFinal012
         * @tc.desc Verify that isFinal returns correct values for different methods in the same class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsFinalMultiMethodSample>() as ClassType;
            const m1 = classType.getMethodByName("normalMethod");
            const m2 = classType.getMethodByName("finalMethod");
            const count = classType.getMethodsNum();
            let m3: Method | undefined = undefined;
            for (let i: long = 0; i < count; i += 1) {
                const m = classType.getMethod(i);
                if (m.getName() === "staticMethod") {
                    m3 = m;
                    break;
                }
            }
            expect(m1.isFinal()).assertFalse();
            expect(m2.isFinal()).assertTrue();
            expect(typeof m3!.isFinal()).assertEqual("boolean");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_1300
         * @tc.name testMethodIsFinal013
         * @tc.desc Verify that isFinal returns a boolean for a normal method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalNormalSample>() as ClassType).getMethodByName("add");
            let result: boolean = method.isFinal();
            expect(typeof result).assertEqual("boolean");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_1400
         * @tc.name testMethodIsFinal014
         * @tc.desc Verify that isFinal returns false for a constructor method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalCtorSample>() as ClassType).getConstructor(0);
            expect(method.isFinal()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_1500
         * @tc.name testMethodIsFinal015
         * @tc.desc Verify that isFinal returns false for a static method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsFinalStaticMethodSample>() as ClassType;
            const count = classType.getMethodsNum();
            let method: Method | undefined = undefined;
            for (let i: long = 0; i < count; i += 1) {
                const m = classType.getMethod(i);
                if (m.getName() === "doSomething") {
                    method = m;
                    break;
                }
            }
            expect(method!.isFinal()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_1600
         * @tc.name testMethodIsFinal016
         * @tc.desc Verify that isFinal returns false for an async method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalAsyncMethodSample>() as ClassType).getMethodByName("doSomething");
            expect(method.isFinal()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_1700
         * @tc.name testMethodIsFinal017
         * @tc.desc Verify that isFinal returns false for a native method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalNativeMethodSample>() as ClassType).getMethodByName("doSomething");
            expect(method.isFinal()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_1800
         * @tc.name testMethodIsFinal018
         * @tc.desc Verify that isFinal returns false for an interface method from implementing class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalImplClass>() as ClassType).getMethodByName("doSomething");
            expect(method.isFinal()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_1900
         * @tc.name testMethodIsFinal019
         * @tc.desc Verify that isFinal returns false for a non-final getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalNonFinalGetter>() as ClassType).getMethodByName("%%get-value");
            expect(method.isFinal()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_2000
         * @tc.name testMethodIsFinal020
         * @tc.desc Verify that isFinal combined with isAbstract correctly distinguishes final and abstract methods
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsFinalAbstractCombo>() as ClassType;
            const concreteMethod = classType.getMethodByName("concreteMethod");
            const abstractMethod = classType.getMethodByName("abstractMethod");
            expect(concreteMethod.isFinal()).assertTrue();
            expect(concreteMethod.isAbstract()).assertFalse();
            expect(abstractMethod.isFinal()).assertFalse();
            expect(abstractMethod.isAbstract()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_2100
         * @tc.name testMethodIsFinal021
         * @tc.desc Verify that isFinal combined with isStatic correctly distinguishes final and static methods
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsFinalStaticCombo>() as ClassType;
            const finalMethod = classType.getMethodByName("finalMethod");
            let staticMethod: Method | undefined = undefined;
            for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
                const m = classType.getMethod(i);
                if (m.getName() === "staticMethod" && m.isStatic()) {
                    staticMethod = m;
                    break;
                }
            }
            expect(finalMethod.isFinal()).assertTrue();
            expect(finalMethod.isStatic()).assertFalse();
            expect(staticMethod!.isFinal()).assertFalse();
            expect(staticMethod!.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_2200
         * @tc.name testMethodIsFinal022
         * @tc.desc Verify that isFinal returns true for final method inherited through a three-level class chain
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalGrandchildNode>() as ClassType).getMethodByName("doWork");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_2300
         * @tc.name testMethodIsFinal023
         * @tc.desc Verify non-final static async method is not final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsFinalMethod(Type.from<IsFinalStaticAsyncSample>() as ClassType, "task", true);
            expect(method.isFinal()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_2400
         * @tc.name testMethodIsFinal024
         * @tc.desc Verify async instance method without final modifier is not final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalAsyncFinalSample>() as ClassType).getMethodByName("fetch");
            expect(method.isFinal()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_2500
         * @tc.name testMethodIsFinal025
         * @tc.desc Verify private final instance method is final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsFinalMethod(Type.from<IsFinalPrivateFinalSample>() as ClassType, "work");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_2600
         * @tc.name testMethodIsFinal026
         * @tc.desc Verify protected final instance method is final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsFinalMethod(Type.from<IsFinalProtectedFinalSample>() as ClassType, "helper");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_2700
         * @tc.name testMethodIsFinal027
         * @tc.desc Verify public final instance method is final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalPublicFinalSample>() as ClassType).getMethodByName("open");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_2800
         * @tc.name testMethodIsFinal028
         * @tc.desc Verify public non-final instance method is not final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalPublicOpenSample>() as ClassType).getMethodByName("open");
            expect(method.isFinal()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_2900
         * @tc.name testMethodIsFinal029
         * @tc.desc Verify final implementation method for interface is final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalInterfaceChildImpl>() as ClassType).getMethodByName("doSomething");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_3000
         * @tc.name testMethodIsFinal030
         * @tc.desc Verify child method overriding non-final parent method remains non-final without final modifier
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalOverrideChild>() as ClassType).getMethodByName("doWork");
            expect(method.isFinal()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_3100
         * @tc.name testMethodIsFinal031
         * @tc.desc Verify child final method is final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalOverrideChild>() as ClassType).getMethodByName("childFinal");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_3200
         * @tc.name testMethodIsFinal032
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsFinalMethod(Type.from<IsFinalInheritedStaticChild>() as ClassType, "create", true);
            expect(method.isFinal()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_3300
         * @tc.name testMethodIsFinal033
         * @tc.desc Verify hidden static child method is not final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsFinalMethod(Type.from<IsFinalHiddenStaticChild>() as ClassType, "create", true);
            expect(method.isFinal()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_3400
         * @tc.name testMethodIsFinal034
         * @tc.desc Verify final method with default parameter is final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalParamSample>() as ClassType).getMethodByName("greet");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_3500
         * @tc.name testMethodIsFinal035
         * @tc.desc Verify final method with rest parameter is final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalRestSample>() as ClassType).getMethodByName("sum");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_3600
         * @tc.name testMethodIsFinal036
         * @tc.desc Verify final method with optional parameter is final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalOptionalSample>() as ClassType).getMethodByName("log");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_3700
         * @tc.name testMethodIsFinal037
         * @tc.desc Verify final method returning void is final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalReturnVoidSample>() as ClassType).getMethodByName("noop");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_3800
         * @tc.name testMethodIsFinal038
         * @tc.desc Verify final method returning Promise is final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalReturnPromiseSample>() as ClassType).getMethodByName("get");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_3900
         * @tc.name testMethodIsFinal039
         * @tc.desc Verify final method returning class instance is final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalThisSample>() as ClassType).getMethodByName("chain");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_4000
         * @tc.name testMethodIsFinal040
         * @tc.desc Verify final generic method is final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalGenericSample<string>>() as ClassType).getMethodByName("getItem");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_4100
         * @tc.name testMethodIsFinal041
         * @tc.desc Verify final method in generic class is final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalGenericBoxSample<string>>() as ClassType).getMethodByName("getValue");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_4200
         * @tc.name testMethodIsFinal042
         * @tc.desc Verify final method getName returns method name and remains final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalFinalOwnerSample>() as ClassType).getMethodByName("ownFinal");
            expect(method.getName()).assertEqual("ownFinal");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_4300
         * @tc.name testMethodIsFinal043
         * @tc.desc Verify final method owner type is declaring class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalOwnerSample>() as ClassType).getMethodByName("ownerMethod");
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodIsFinalTest.test.IsFinalOwnerSample");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_4400
         * @tc.name testMethodIsFinal044
         * @tc.desc Verify final getter in accessor pair is final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalAccessorPairSample>() as ClassType).getMethodByName("%%get-count");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_4500
         * @tc.name testMethodIsFinal045
         * @tc.desc Verify final setter in accessor pair is final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalAccessorPairSample>() as ClassType).getMethodByName("%%set-count");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_4600
         * @tc.name testMethodIsFinal046
         * @tc.desc Verify final accessor state update does not change getter isFinal flag
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const sample = new IsFinalAccessorPairSample();
            sample.count = 5;
            expect(sample.count).assertEqual(5);
            const method = (Type.from<IsFinalAccessorPairSample>() as ClassType).getMethodByName("%%get-count");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_4700
         * @tc.name testMethodIsFinal047
         * @tc.desc Verify final setter execution does not change isFinal flag
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const sample = new IsFinalAccessorPairSample();
            sample.count = 7;
            const method = (Type.from<IsFinalAccessorPairSample>() as ClassType).getMethodByName("%%set-count");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_4800
         * @tc.name testMethodIsFinal048
         * @tc.desc Verify inherited final base method is final on child type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalMixinChild>() as ClassType).getMethodByName("baseFinal");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_4900
         * @tc.name testMethodIsFinal049
         * @tc.desc Verify final method converted to string still remains final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsFinalFinalSample>() as ClassType).getMethodByName("add");
            expect(method.toString().length > 0).assertTrue();
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_5000
         * @tc.name testMethodIsFinal050
         * @tc.desc Verify class with final method and non-final methods reports each final flag correctly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsFinalMixedMethodSample>() as ClassType;
            expect(classType.getMethodByName("finalMethod").isFinal()).assertTrue();
            expect(findIsFinalMethod(classType, "staticMethod", true).isFinal()).assertFalse();
            expect(classType.getMethodByName("asyncMethod").isFinal()).assertFalse();
            expect(classType.getMethodByName("%%get-value").isFinal()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_5100
         * @tc.name testMethodIsFinal051
         * @tc.desc Verify final method exists while same class ordinary method is not final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsFinalFinalOwnerSample>() as ClassType;
            expect(classType.getMethodByName("ownFinal").isFinal()).assertTrue();
            expect(classType.getMethodByName("ownMethod").isFinal()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_5200
         * @tc.name testMethodIsFinal052
         * @tc.desc Verify non-method field does not appear as Method for final check
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const hasMethod = hasIsFinalMethod(Type.from<IsFinalGetterSample>() as ClassType, "_value");
            expect(hasMethod).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_FINAL_5300
         * @tc.name testMethodIsFinal053
         * @tc.desc Verify overloaded methods are not final by default
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsFinal053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsFinalOverloadSample>() as ClassType;
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
            expect(oneParamMethod!.isFinal()).assertFalse();
            expect(twoParamMethod!.isFinal()).assertFalse();
        });
    });
}
