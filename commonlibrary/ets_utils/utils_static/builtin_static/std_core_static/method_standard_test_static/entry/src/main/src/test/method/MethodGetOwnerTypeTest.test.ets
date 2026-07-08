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

class OwnerNormalSample {
    add(value: int): int {
        return value + 1;
    }
}

class OwnerByteShortParamSample {
    acceptByte(value: byte): void {}
    acceptShort(value: short): void {}
}

class OwnerCharBooleanParamSample {
    acceptChar(value: char): void {}
    acceptBoolean(value: boolean): void {}
}

class OwnerArrayParamShapeSample {
    acceptIntArray(value: int[]): void {}
    acceptStringMatrix(value: string[][]): void {}
}

class OwnerObjectInputSample {
}

class OwnerObjectParamSample {
    acceptObject(value: OwnerObjectInputSample): void {}
}

enum OwnerEnumParamSample {
    FIRST,
    SECOND
}

class OwnerEnumMethodSample {
    acceptEnum(value: OwnerEnumParamSample): void {}
}

class OwnerUnicodeNameSample {
    方法(): void {}
    テスト(): void {}
}

class OwnerStaticMethodSample {
    public static staticMethod(): void {}
}

class OwnerCtorSample {
    constructor() {}
}

class OwnerParentClass {
    greet(): void {}
}

class OwnerChildClass extends OwnerParentClass {
    greet(): void {}
}

class OwnerMultiMethodSample {
    methodA(): void {}
    methodB(): void {}
}

abstract class OwnerAbstractBase {
    abstract doWork(): void;
}

class OwnerConcreteDoWork extends OwnerAbstractBase {
    doWork(): void {}
}

class OwnerGetterSetterSample {
    private _val: int = 42;
    get val(): int {
        return this._val;
    }
    set val(v: int) {
        this._val = v;
    }
}

class OwnerParentOnly {
    inheritedMethod(): void {}
}

class OwnerChildInherit extends OwnerParentOnly {
}

interface OwnerTestInterface {
    interfaceMethod(): void;
}

class OwnerInterfaceImpl implements OwnerTestInterface {
    interfaceMethod(): void {}
}

class OwnerAsyncSample {
    async task(): Promise<void> {}
}

class OwnerAccessSample {
    private calc(): int {
        return 1;
    }
    protected helper(): void {}
    public open(): void {}
    implicit(): void {}
}

class OwnerStaticAccessSample {
    private static secret(): void {}
    protected static helper(): void {}
    public static create(): OwnerStaticAccessSample {
        return new OwnerStaticAccessSample();
    }
}

abstract class OwnerAbstractConcreteSample {
    concrete(): void {}
    static init(): void {}
    constructor() {}
}

class OwnerGrandParentSample {
    foo(): void {}
}

class OwnerMiddleInheritSample extends OwnerGrandParentSample {
}

class OwnerGrandChildInheritSample extends OwnerMiddleInheritSample {
}

class OwnerGrandParentOverrideSample {
    foo(): void {}
}

class OwnerMiddleOverrideSample extends OwnerGrandParentOverrideSample {
    foo(): void {}
}

class OwnerGrandChildFromMiddleSample extends OwnerMiddleOverrideSample {
}

class OwnerGenericSample<T> {
    getItem(value: T): T {
        return value;
    }
}

class OwnerGenericBoundBase {
}

class OwnerGenericBoundSample<T extends OwnerGenericBoundBase> {
    find(value: T): T {
        return value;
    }
}

class OwnerParamShapeSample {
    defaultParam(value: int = 1): void {}
    restParam(...values: int[]): int {
        return values.length;
    }
    optionalParam(value?: string): void {}
}

class OwnerThisReturnSample {
    step(): OwnerThisReturnSample {
        return this;
    }
}

class OwnerStaticInstanceSameNameSample {
    static x(): void {}
    x(): void {}
}

class OwnerStaticParentSample {
    static greet(): void {}
}

class OwnerStaticChildInheritSample extends OwnerStaticParentSample {
}

class OwnerStaticChildOverrideSample extends OwnerStaticParentSample {
    static greet(): void {}
}

class OwnerSuperCallParentSample {
    method(): string {
        return "parent";
    }
}

class OwnerSuperCallChildSample extends OwnerSuperCallParentSample {
    method(): string {
        return super.method();
    }
}

interface OwnerMultiInterfaceA {
    method(): void;
}

interface OwnerMultiInterfaceB {
    method(): void;
}

class OwnerMultiInterfaceImpl implements OwnerMultiInterfaceA, OwnerMultiInterfaceB {
    method(): void {}
}

class OwnerToStringSample {
    toString(): string {
        return "OwnerToStringSample";
    }
}

class OwnerOverloadSample {
    method(value: int): void {}
    method(value: int, text: string): void {}
}

function findOwnerMethod(classType: ClassType, name: string, wantStatic?: boolean): Method {
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

export default function MethodGetOwnerTypeTest(): void {
    describe('MethodGetOwnerTypeTest', () => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_0100
         * @tc.name testMethodGetOwnerType001
         * @tc.desc Verify that getOwnerType can be called without parameters and returns non-null Type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<OwnerNormalSample>() as ClassType).getMethodByName("add");
            let ownerType: Type = method.getOwnerType();
            expect(ownerType !== null && ownerType !== undefined).assertTrue();
            expect(typeof ownerType).assertEqual("object");
            expect(ownerType.getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerNormalSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_0200
         * @tc.name testMethodGetOwnerType002
         * @tc.desc Verify that getOwnerType returns the child class Type for an overridden method in a child class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<OwnerChildClass>() as ClassType).getMethodByName("greet");
            let ownerType: Type = method.getOwnerType();
            expect(ownerType.getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerChildClass");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_0300
         * @tc.name testMethodGetOwnerType003
         * @tc.desc Verify that multiple methods in the same class return ownerType pointing to the same class Type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<OwnerMultiMethodSample>() as ClassType;
            const methodA = classType.getMethodByName("methodA");
            const methodB = classType.getMethodByName("methodB");
            let ownerA: Type = methodA.getOwnerType();
            let ownerB: Type = methodB.getOwnerType();
            expect(ownerA.equals(ownerB)).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_0400
         * @tc.name testMethodGetOwnerType004
         * @tc.desc Verify that multiple calls to getOwnerType return equivalent Type objects
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<OwnerNormalSample>() as ClassType).getMethodByName("add");
            let owner1: Type = method.getOwnerType();
            let owner2: Type = method.getOwnerType();
            expect(owner1.equals(owner2)).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_0500
         * @tc.name testMethodGetOwnerType005
         * @tc.desc Verify that different classes with the same method name return different ownerType
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const methodA = (Type.from<OwnerChildClass>() as ClassType).getMethodByName("greet");
            const methodB = (Type.from<OwnerParentClass>() as ClassType).getMethodByName("greet");
            let ownerA: Type = methodA.getOwnerType();
            let ownerB: Type = methodB.getOwnerType();
            expect(ownerA.getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerChildClass");
            expect(ownerB.getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerParentClass");
            expect(ownerA.equals(ownerB)).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_0600
         * @tc.name testMethodGetOwnerType006
         * @tc.desc Verify that getOwnerType on a constructor returns the declaring class Type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<OwnerCtorSample>() as ClassType).getConstructor(0);
            let ownerType: Type = method.getOwnerType();
            let ownerClass: ClassType = ownerType as ClassType;
            expect(ownerClass.getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerCtorSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_0700
         * @tc.name testMethodGetOwnerType007
         * @tc.desc Verify that getOwnerType on a static method returns the declaring class Type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<OwnerStaticMethodSample>() as ClassType;
            let method: Method | undefined = undefined;
            for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
                const m = classType.getMethod(i);
                if (m.getName() == "staticMethod" && m.isStatic()) {
                    method = m;
                    break;
                }
            }
            let ownerType: Type = method!.getOwnerType();
            let name: string = ownerType.getName();
            expect(name).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerStaticMethodSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_0800
         * @tc.name testMethodGetOwnerType008
         * @tc.desc Verify that getOwnerType on an abstract method implementation returns the implementing class Type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<OwnerConcreteDoWork>() as ClassType).getMethodByName("doWork");
            let ownerType: Type = method.getOwnerType();
            let name: string = ownerType.getName();
            expect(ownerType.getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerConcreteDoWork");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_0900
         * @tc.name testMethodGetOwnerType009
         * @tc.desc Verify that getOwnerType on a getter accessor returns the declaring class Type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<OwnerGetterSetterSample>() as ClassType;
            let method: Method | undefined = undefined;
            for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
                const m = classType.getMethod(i);
                const name: string = m.getName();
                if (name === "%%get-val") {
                    method = m;
                    break;
                }
            }
            let ownerType: Type = method!.getOwnerType();
            expect(ownerType.getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerGetterSetterSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_1000
         * @tc.name testMethodGetOwnerType010
         * @tc.desc Verify that getOwnerType on an inherited method (no override) returns the parent class Type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<OwnerChildInherit>() as ClassType).getMethodByName("inheritedMethod");
            let ownerType: Type = method.getOwnerType();
            let name: string = ownerType.getName();
            expect(name).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerParentOnly");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_1100
         * @tc.name testMethodGetOwnerType011
         * @tc.desc Verify that getOwnerType on an interface implementing class method returns the implementing class Type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<OwnerInterfaceImpl>() as ClassType).getMethodByName("interfaceMethod");
            let ownerType: Type = method.getOwnerType();
            let name: string = ownerType.getName();
            expect(name).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerInterfaceImpl");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_1200
         * @tc.name testMethodGetOwnerType012
         * @tc.desc Verify getOwnerType returns before a simulated error is caught
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let caught: boolean = false;
            try {
                const method = (Type.from<OwnerNormalSample>() as ClassType).getMethodByName("add");
                let ownerType: Type = method.getOwnerType();
                expect(ownerType !== undefined).assertTrue();
                throw new Error("simulated error after getOwnerType");
            } catch (e) {
                caught = e.name === 'Error' && e.message === 'simulated error after getOwnerType'
                expect(caught).assertTrue();
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_1300
         * @tc.name testMethodGetOwnerType013
         * @tc.desc Verify async method owner type is declaring class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findOwnerMethod(Type.from<OwnerAsyncSample>() as ClassType, "task");
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerAsyncSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_1400
         * @tc.name testMethodGetOwnerType014
         * @tc.desc Verify private method owner type is declaring class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findOwnerMethod(Type.from<OwnerAccessSample>() as ClassType, "calc");
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerAccessSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_1500
         * @tc.name testMethodGetOwnerType015
         * @tc.desc Verify protected method owner type is declaring class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findOwnerMethod(Type.from<OwnerAccessSample>() as ClassType, "helper");
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerAccessSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_1600
         * @tc.name testMethodGetOwnerType016
         * @tc.desc Verify public method owner type is declaring class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findOwnerMethod(Type.from<OwnerAccessSample>() as ClassType, "open");
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerAccessSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_1700
         * @tc.name testMethodGetOwnerType017
         * @tc.desc Verify default public method owner type is declaring class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findOwnerMethod(Type.from<OwnerAccessSample>() as ClassType, "implicit");
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerAccessSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_1800
         * @tc.name testMethodGetOwnerType018
         * @tc.desc Verify private static method owner type is declaring class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findOwnerMethod(Type.from<OwnerStaticAccessSample>() as ClassType, "secret", true);
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerStaticAccessSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_1900
         * @tc.name testMethodGetOwnerType019
         * @tc.desc Verify protected static method owner type is declaring class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findOwnerMethod(Type.from<OwnerStaticAccessSample>() as ClassType, "helper", true);
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerStaticAccessSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_2000
         * @tc.name testMethodGetOwnerType020
         * @tc.desc Verify public static method owner type is declaring class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findOwnerMethod(Type.from<OwnerStaticAccessSample>() as ClassType, "create", true);
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerStaticAccessSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_2100
         * @tc.name testMethodGetOwnerType021
         * @tc.desc Verify abstract class concrete method owner type is abstract class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findOwnerMethod(Type.from<OwnerAbstractConcreteSample>() as ClassType, "concrete");
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerAbstractConcreteSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_2200
         * @tc.name testMethodGetOwnerType022
         * @tc.desc Verify abstract class static method owner type is abstract class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findOwnerMethod(Type.from<OwnerAbstractConcreteSample>() as ClassType, "init", true);
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerAbstractConcreteSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_2300
         * @tc.name testMethodGetOwnerType023
         * @tc.desc Verify abstract class constructor owner type is abstract class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<OwnerAbstractConcreteSample>() as ClassType).getConstructor(0);
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerAbstractConcreteSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_2400
         * @tc.name testMethodGetOwnerType024
         * @tc.desc Verify multi-level inherited method owner type is grandparent class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findOwnerMethod(Type.from<OwnerGrandChildInheritSample>() as ClassType, "foo");
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerGrandParentSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_2500
         * @tc.name testMethodGetOwnerType025
         * @tc.desc Verify multi-level inherited override owner type is middle class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findOwnerMethod(Type.from<OwnerGrandChildFromMiddleSample>() as ClassType, "foo");
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerMiddleOverrideSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_2600
         * @tc.name testMethodGetOwnerType026
         * @tc.desc Verify generic class method owner type is generic class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findOwnerMethod(Type.from<OwnerGenericSample<string>>() as ClassType, "getItem");
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerGenericSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_2700
         * @tc.name testMethodGetOwnerType027
         * @tc.desc Verify bounded generic class method owner type is declaring class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findOwnerMethod(Type.from<OwnerGenericBoundSample<OwnerGenericBoundBase>>() as ClassType, "find");
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerGenericBoundSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_2800
         * @tc.name testMethodGetOwnerType028
         * @tc.desc Verify default-parameter method owner type is declaring class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findOwnerMethod(Type.from<OwnerParamShapeSample>() as ClassType, "defaultParam");
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerParamShapeSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_2900
         * @tc.name testMethodGetOwnerType029
         * @tc.desc Verify rest-parameter method owner type is declaring class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findOwnerMethod(Type.from<OwnerParamShapeSample>() as ClassType, "restParam");
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerParamShapeSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_3000
         * @tc.name testMethodGetOwnerType030
         * @tc.desc Verify optional-parameter method owner type is declaring class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findOwnerMethod(Type.from<OwnerParamShapeSample>() as ClassType, "optionalParam");
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerParamShapeSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_3100
         * @tc.name testMethodGetOwnerType031
         * @tc.desc Verify method returning this-type equivalent owner type is declaring class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findOwnerMethod(Type.from<OwnerThisReturnSample>() as ClassType, "step");
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerThisReturnSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_3200
         * @tc.name testMethodGetOwnerType032
         * @tc.desc Verify inherited static method owner type remains parent class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findOwnerMethod(Type.from<OwnerStaticChildInheritSample>() as ClassType, "greet", true);
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerStaticParentSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_3300
         * @tc.name testMethodGetOwnerType033
         * @tc.desc Verify overridden static method owner type is child class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findOwnerMethod(Type.from<OwnerStaticChildOverrideSample>() as ClassType, "greet", true);
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerStaticChildOverrideSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_3400
         * @tc.name testMethodGetOwnerType034
         * @tc.desc Verify super call inside method does not affect owner type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findOwnerMethod(Type.from<OwnerSuperCallChildSample>() as ClassType, "method");
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerSuperCallChildSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_3500
         * @tc.name testMethodGetOwnerType035
         * @tc.desc Verify multi-interface implementation method owner type is implementation class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findOwnerMethod(Type.from<OwnerMultiInterfaceImpl>() as ClassType, "method");
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerMultiInterfaceImpl");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_3600
         * @tc.name testMethodGetOwnerType036
         * @tc.desc Verify toString override method owner type is declaring class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findOwnerMethod(Type.from<OwnerToStringSample>() as ClassType, "toString");
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerToStringSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_3700
         * @tc.name testMethodGetOwnerType037
         * @tc.desc Verify Unicode method names return declaring owner type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<OwnerUnicodeNameSample>() as ClassType;
            const chineseMethod = findOwnerMethod(classType, "方法");
            const japaneseMethod = findOwnerMethod(classType, "テスト");
            expect(chineseMethod.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerUnicodeNameSample");
            expect(japaneseMethod.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerUnicodeNameSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_3800
         * @tc.name testMethodGetOwnerType038
         * @tc.desc Verify byte and short parameter methods return declaring owner type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<OwnerByteShortParamSample>() as ClassType;
            expect(findOwnerMethod(classType, "acceptByte").getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerByteShortParamSample");
            expect(findOwnerMethod(classType, "acceptShort").getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerByteShortParamSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_3900
         * @tc.name testMethodGetOwnerType039
         * @tc.desc Verify char and boolean parameter methods return declaring owner type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<OwnerCharBooleanParamSample>() as ClassType;
            expect(findOwnerMethod(classType, "acceptChar").getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerCharBooleanParamSample");
            expect(findOwnerMethod(classType, "acceptBoolean").getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerCharBooleanParamSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_4000
         * @tc.name testMethodGetOwnerType040
         * @tc.desc Verify array and multidimensional array parameter methods return declaring owner type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<OwnerArrayParamShapeSample>() as ClassType;
            expect(findOwnerMethod(classType, "acceptIntArray").getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerArrayParamShapeSample");
            expect(findOwnerMethod(classType, "acceptStringMatrix").getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerArrayParamShapeSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_4100
         * @tc.name testMethodGetOwnerType041
         * @tc.desc Verify enum and custom object parameter methods return declaring owner type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const enumMethod = findOwnerMethod(Type.from<OwnerEnumMethodSample>() as ClassType, "acceptEnum");
            const objectMethod = findOwnerMethod(Type.from<OwnerObjectParamSample>() as ClassType, "acceptObject");
            expect(enumMethod.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerEnumMethodSample");
            expect(objectMethod.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodGetOwnerTypeTest.test.OwnerObjectParamSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_OWNER_TYPE_4200
         * @tc.name testMethodGetOwnerType042
         * @tc.desc Verify overloaded methods return the same owner type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetOwnerType042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<OwnerOverloadSample>() as ClassType;
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
            expect(oneParamMethod!.getOwnerType().getName()).assertEqual(twoParamMethod!.getOwnerType().getName());
        });
    });
}
