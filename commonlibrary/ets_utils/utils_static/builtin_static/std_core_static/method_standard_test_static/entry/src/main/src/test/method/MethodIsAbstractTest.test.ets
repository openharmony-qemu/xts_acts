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

class IsAbstractConcreteSample {
    add(value: int): int {
        return value + 1;
    }
}

abstract class IsAbstractAbstractSample {
    abstract doWork(): void;
}

interface IsAbstractIWorker {
    doWork(): void;
}

class IsAbstractWorkerImpl implements IsAbstractIWorker {
    doWork(): void {}
}

abstract class IsAbstractBase {
    abstract process(): void;
}

class IsAbstractDerived extends IsAbstractBase {
    process(): void {}
}

abstract class IsAbstractAbsClass {
    abstract compute(): int;
}

abstract class IsAbstractAbsWithConcrete {
    concreteMethod(): string {
        return "hello";
    }
}

class IsAbstractChildA extends IsAbstractBase {
    process(): void {}
}

class IsAbstractChildB extends IsAbstractBase {
    process(): void {}
}

class IsAbstractOverloadSample {
    method(value: int): void {}
    method(value: int, text: string): void {}
}

class IsAbstractConstructorSample {
    value: int = 0;
    constructor() {}
}

class IsAbstractStaticMethodSample {
    static doWork(): void {}
}

class IsAbstractFinalMethodSample {
    final process(): void {}
}

class IsAbstractGetterSetterSample {
    private _data: int = 0;
    get data(): int {
        return this._data;
    }
    set data(val: int) {
        this._data = val;
    }
}

class IsAbstractNativeMethodSample {
    native doNative(): void;
}

abstract class IsAbstractInterfaceBase implements IsAbstractIWorker {
    abstract doWork(): void;
}

class IsAbstractCombinedSample {
    static getInfo(): string {
        return "info";
    }
    doWork(): string {
        return "work";
    }
}

abstract class IsAbstractGrandBase {
    abstract doGrandWork(): void;
}
abstract class IsAbstractMidBase extends IsAbstractGrandBase {
    doGrandWork(): void {}
}
class IsAbstractLeafClass extends IsAbstractMidBase {}

abstract class IsAbstractCtorBase {
    constructor() {}
    abstract work(): void;
}

class IsAbstractPrivateProtectedConcrete {
    private secret(): string {
        return "secret";
    }
    protected helper(): string {
        return "helper";
    }
}

abstract class IsAbstractProtectedBase {
    protected abstract protectedWork(): void;
    public abstract publicWork(): void;
}

abstract class IsAbstractProtectedChild extends IsAbstractProtectedBase {
}

class IsAbstractProtectedImpl extends IsAbstractProtectedBase {
    protectedWork(): void {}
    publicWork(): void {}
}

abstract class IsAbstractChainGrand {
    abstract chainWork(): void;
}

abstract class IsAbstractChainParent extends IsAbstractChainGrand {
}

class IsAbstractChainChild extends IsAbstractChainParent {
    chainWork(): void {}
}

abstract class IsAbstractParamBase {
    abstract optionalWork(value?: string): void;
    abstract restWork(...values: int[]): int;
}

class IsAbstractParamImpl extends IsAbstractParamBase {
    optionalWork(value?: string): void {}
    restWork(...values: int[]): int {
        return values.length;
    }
}

class IsAbstractRestConcrete {
    restWork(...values: int[]): int {
        return values.length;
    }
}

abstract class IsAbstractGenericBase<T> {
    abstract getItem(): T;
    concreteItem(value: T): T {
        return value;
    }
}

class IsAbstractGenericImpl extends IsAbstractGenericBase<string> {
    getItem(): string {
        return "item";
    }
}

class IsAbstractAsyncConcrete {
    async task(): Promise<void> {}
}

class IsAbstractStaticAccessorConcrete {
    private static _value: int = 1;
    static get value(): int {
        return IsAbstractStaticAccessorConcrete._value;
    }
    static set value(v: int) {
        IsAbstractStaticAccessorConcrete._value = v;
    }
}

interface IsAbstractMultiInterfaceA {
    run(): void;
}

interface IsAbstractMultiInterfaceB {
    run(): void;
}

class IsAbstractMultiInterfaceImpl implements IsAbstractMultiInterfaceA, IsAbstractMultiInterfaceB {
    run(): void {}
}

class IsAbstractSuperParent {
    run(): string {
        return "parent";
    }
}

class IsAbstractSuperChild extends IsAbstractSuperParent {
    run(): string {
        return super.run();
    }
}

abstract class IsAbstractConcreteOnlyClass {
    first(): int {
        return 1;
    }
    second(): string {
        return "two";
    }
}

function findIsAbstractMethod(classType: ClassType, name: string, wantStatic?: boolean): Method {
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

export default function MethodIsAbstractTest(): void {
    describe('MethodIsAbstractTest', () => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_0100
         * @tc.name testMethodIsAbstract001
         * @tc.desc Verify that isAbstract returns boolean for an interface method acquired through implementing class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsAbstractWorkerImpl>() as ClassType).getMethodByName("doWork");
            let result: boolean = method.isAbstract();
            expect(typeof result).assertEqual("boolean");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_0200
         * @tc.name testMethodIsAbstract002
         * @tc.desc Verify that isAbstract returns true for an abstract method in abstract class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsAbstractAbsClass>() as ClassType).getMethodByName("compute");
            expect(method.isAbstract()).assertEqual(true);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_0300
         * @tc.name testMethodIsAbstract003
         * @tc.desc Verify that isAbstract returns false for a concrete method in an abstract class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsAbstractAbsWithConcrete>() as ClassType).getMethodByName("concreteMethod");
            expect(method.isAbstract()).assertEqual(false);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_0400
         * @tc.name testMethodIsAbstract004
         * @tc.desc Verify that isAbstract returns only true or false for different method types
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const absMethod = (Type.from<IsAbstractAbstractSample>() as ClassType).getMethodByName("doWork");
            const concreteMethod = (Type.from<IsAbstractConcreteSample>() as ClassType).getMethodByName("add");
            expect(absMethod.isAbstract()).assertEqual(true);
            expect(concreteMethod.isAbstract()).assertEqual(false);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_0500
         * @tc.name testMethodIsAbstract005
         * @tc.desc Verify that isAbstract return value is strictly boolean
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsAbstractConcreteSample>() as ClassType).getMethodByName("add");
            let result: boolean = method.isAbstract();
            expect(result).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_0600
         * @tc.name testMethodIsAbstract006
         * @tc.desc Verify that isAbstract returns false for the same abstract method implemented in different subclasses
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const methodA = (Type.from<IsAbstractChildA>() as ClassType).getMethodByName("process");
            const methodB = (Type.from<IsAbstractChildB>() as ClassType).getMethodByName("process");
            expect(methodA.isAbstract()).assertEqual(false);
            expect(methodB.isAbstract()).assertEqual(false);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_0700
         * @tc.name testMethodIsAbstract007
         * @tc.desc Verify that isAbstract returns false for a concrete method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsAbstractConcreteSample>() as ClassType).getMethodByName("add");
            let result = method.isAbstract();
            expect(result).assertEqual(false);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_0800
         * @tc.name testMethodIsAbstract008
         * @tc.desc Verify that isAbstract can still be called after getMethodByName error handling
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            try {
                (Type.from<IsAbstractConcreteSample>() as ClassType).getMethodByName("nonExistMethod");
                expect().assertFail();
            } catch (error) {
                expect(error.name).assertEqual("TypeError");
                const method = (Type.from<IsAbstractConcreteSample>() as ClassType).getMethodByName("add");
                let result: boolean = method.isAbstract();
                expect(result).assertFalse();
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_0900
         * @tc.name testMethodIsAbstract009
         * @tc.desc Verify that isAbstract returns false for a concrete method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsAbstractConcreteSample>() as ClassType).getMethodByName("add");
            let result = method.isAbstract();
            expect(result).assertEqual(false);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_1000
         * @tc.name testMethodIsAbstract010
         * @tc.desc Verify that isAbstract returns false for a constructor method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsAbstractConstructorSample>() as ClassType).getConstructor(0);
            expect(method.isAbstract()).assertEqual(false);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_1100
         * @tc.name testMethodIsAbstract011
         * @tc.desc Verify that isAbstract returns false for a static method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsAbstractStaticMethodSample>() as ClassType;
            const count = classType.getMethodsNum();
            let method: Method | undefined = undefined;
            for (let i: long = 0; i < count; i += 1) {
                const m = classType.getMethod(i);
                if (m.getName() === "doWork") {
                    method = m;
                    break;
                }
            }
            expect(method!.isAbstract()).assertEqual(false);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_1200
         * @tc.name testMethodIsAbstract012
         * @tc.desc Verify that isAbstract returns false for a final method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsAbstractFinalMethodSample>() as ClassType).getMethodByName("process");
            expect(method.isAbstract()).assertEqual(false);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_1300
         * @tc.name testMethodIsAbstract013
         * @tc.desc Verify that isAbstract returns false for a getter accessor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsAbstractGetterSetterSample>() as ClassType).getMethodByName("%%get-data");
            expect(method.isAbstract()).assertEqual(false);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_1400
         * @tc.name testMethodIsAbstract014
         * @tc.desc Verify that isAbstract returns false for a native method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsAbstractNativeMethodSample>() as ClassType).getMethodByName("doNative");
            expect(method.isAbstract()).assertEqual(false);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_1500
         * @tc.name testMethodIsAbstract015
         * @tc.desc Verify that isAbstract returns true for an interface method accessed through an abstract implementing class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
         it('testMethodIsAbstract015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsAbstractInterfaceBase>() as ClassType;
            const count = classType.getMethodsNum();
            let method: Method | undefined = undefined;
            for (let i: long = 0; i < count; i += 1) {
                const m = classType.getMethod(i);
                if (m.getName() === "doWork" && m.isAbstract()) {
                    method = m;
                    break;
                }
            }
            expect(method!.isAbstract()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_1600
         * @tc.name testMethodIsAbstract016
         * @tc.desc Verify isAbstract combined with isStatic and getName on the same method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsAbstractCombinedSample>() as ClassType;
            const count = classType.getMethodsNum();
            let method: Method | undefined = undefined;
            for (let i: long = 0; i < count; i += 1) {
                const m = classType.getMethod(i);
                if (m.getName() === "getInfo") {
                    method = m;
                    break;
                }
            }
            expect(method!.isAbstract()).assertEqual(false);
            expect(method!.isStatic()).assertEqual(true);
            expect(method!.getName()).assertEqual("getInfo");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_1700
         * @tc.name testMethodIsAbstract017
         * @tc.desc Verify that isAbstract returns false for an inherited method in a subclass that does not override it
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsAbstractLeafClass>() as ClassType).getMethodByName("doGrandWork");
            expect(method.isAbstract()).assertEqual(false);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_1800
         * @tc.name testMethodIsAbstract018
         * @tc.desc Verify abstract class constructor is not abstract
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsAbstractCtorBase>() as ClassType).getConstructor(0);
            expect(method.isAbstract()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_1900
         * @tc.name testMethodIsAbstract019
         * @tc.desc Verify private concrete method is not abstract
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAbstractMethod(Type.from<IsAbstractPrivateProtectedConcrete>() as ClassType, "secret");
            expect(method.isAbstract()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_2000
         * @tc.name testMethodIsAbstract020
         * @tc.desc Verify protected concrete method is not abstract
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAbstractMethod(Type.from<IsAbstractPrivateProtectedConcrete>() as ClassType, "helper");
            expect(method.isAbstract()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_2100
         * @tc.name testMethodIsAbstract021
         * @tc.desc Verify protected abstract method is abstract
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAbstractMethod(Type.from<IsAbstractProtectedBase>() as ClassType, "protectedWork");
            expect(method.isAbstract()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_2200
         * @tc.name testMethodIsAbstract022
         * @tc.desc Verify public abstract method is abstract
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAbstractMethod(Type.from<IsAbstractProtectedBase>() as ClassType, "publicWork");
            expect(method.isAbstract()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_2300
         * @tc.name testMethodIsAbstract023
         * @tc.desc Verify inherited abstract method remains abstract in abstract child
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAbstractMethod(Type.from<IsAbstractProtectedChild>() as ClassType, "publicWork");
            expect(method.isAbstract()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_2400
         * @tc.name testMethodIsAbstract024
         * @tc.desc Verify implemented protected abstract method is not abstract
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAbstractMethod(Type.from<IsAbstractProtectedImpl>() as ClassType, "protectedWork");
            expect(method.isAbstract()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_2500
         * @tc.name testMethodIsAbstract025
         * @tc.desc Verify multi-level abstract chain final implementation is not abstract
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAbstractMethod(Type.from<IsAbstractChainChild>() as ClassType, "chainWork");
            expect(method.isAbstract()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_2600
         * @tc.name testMethodIsAbstract026
         * @tc.desc Verify abstract optional-parameter method is abstract
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAbstractMethod(Type.from<IsAbstractParamBase>() as ClassType, "optionalWork");
            expect(method.isAbstract()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_2700
         * @tc.name testMethodIsAbstract027
         * @tc.desc Verify abstract rest-parameter method is abstract
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAbstractMethod(Type.from<IsAbstractParamBase>() as ClassType, "restWork");
            expect(method.isAbstract()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_2800
         * @tc.name testMethodIsAbstract028
         * @tc.desc Verify implemented optional-parameter method is not abstract
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAbstractMethod(Type.from<IsAbstractParamImpl>() as ClassType, "optionalWork");
            expect(method.isAbstract()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_2900
         * @tc.name testMethodIsAbstract029
         * @tc.desc Verify concrete rest-parameter method is not abstract
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAbstractMethod(Type.from<IsAbstractRestConcrete>() as ClassType, "restWork");
            expect(method.isAbstract()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_3000
         * @tc.name testMethodIsAbstract030
         * @tc.desc Verify generic abstract class method is abstract
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAbstractMethod(Type.from<IsAbstractGenericBase<string>>() as ClassType, "getItem");
            expect(method.isAbstract()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_3100
         * @tc.name testMethodIsAbstract031
         * @tc.desc Verify generic concrete class method is not abstract
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAbstractMethod(Type.from<IsAbstractGenericImpl>() as ClassType, "getItem");
            expect(method.isAbstract()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_3200
         * @tc.name testMethodIsAbstract032
         * @tc.desc Verify concrete generic method inside abstract class is not abstract
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAbstractMethod(Type.from<IsAbstractGenericBase<string>>() as ClassType, "concreteItem");
            expect(method.isAbstract()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_3300
         * @tc.name testMethodIsAbstract033
         * @tc.desc Verify async concrete method is not abstract
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAbstractMethod(Type.from<IsAbstractAsyncConcrete>() as ClassType, "task");
            expect(method.isAbstract()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_3400
         * @tc.name testMethodIsAbstract034
         * @tc.desc Verify static getter is not abstract
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAbstractMethod(Type.from<IsAbstractStaticAccessorConcrete>() as ClassType, "%%get-value", true);
            expect(method.isAbstract()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_3500
         * @tc.name testMethodIsAbstract035
         * @tc.desc Verify static setter is not abstract
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAbstractMethod(Type.from<IsAbstractStaticAccessorConcrete>() as ClassType, "%%set-value", true);
            expect(method.isAbstract()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_3600
         * @tc.name testMethodIsAbstract036
         * @tc.desc Verify multi-interface implementation method is not abstract
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAbstractMethod(Type.from<IsAbstractMultiInterfaceImpl>() as ClassType, "run");
            expect(method.isAbstract()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_3700
         * @tc.name testMethodIsAbstract037
         * @tc.desc Verify method that calls super is not abstract
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAbstractMethod(Type.from<IsAbstractSuperChild>() as ClassType, "run");
            expect(method.isAbstract()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_3800
         * @tc.name testMethodIsAbstract038
         * @tc.desc Verify abstract class with only concrete methods has non-abstract method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAbstractMethod(Type.from<IsAbstractConcreteOnlyClass>() as ClassType, "first");
            expect(method.isAbstract()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_3900
         * @tc.name testMethodIsAbstract039
         * @tc.desc Verify isAbstract result is stable across repeated calls
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAbstractMethod(Type.from<IsAbstractParamBase>() as ClassType, "optionalWork");
            expect(method.isAbstract()).assertTrue();
            expect(method.isAbstract()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_4000
         * @tc.name testMethodIsAbstract040
         * @tc.desc Verify isAbstract does not affect getName on abstract method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAbstractMethod(Type.from<IsAbstractProtectedBase>() as ClassType, "publicWork");
            expect(method.isAbstract()).assertTrue();
            expect(method.getName()).assertEqual("publicWork");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ABSTRACT_4100
         * @tc.name testMethodIsAbstract041
         * @tc.desc Verify overloaded methods are not abstract
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAbstract041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsAbstractOverloadSample>() as ClassType;
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
            expect(oneParamMethod!.isAbstract()).assertFalse();
            expect(twoParamMethod!.isAbstract()).assertFalse();
        });
    });
}
