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

class GetNameNormalSample {
    add(value: int): int {
        return value + 1;
    }
}

class GetNameCtorSample {
    constructor() {}
}

class GetNameGetterSample {
    private _value: int = 0;
    get value(): int {
        return this._value;
    }
}

class GetNameSetterSample {
    private _value: int = 0;
    set value(v: int) {
        this._value = v;
    }
}

class GetNameStaticSample {
    public static staticMethod(): string {
        return "static";
    }
}

class GetNameFinalSample {
    public final doFinal(): void {}
}

abstract class GetNameAbstractBase {
    public abstract doAbstract(): void;
}

class GetNameImplSample extends GetNameAbstractBase {
    public doAbstract(): void {}
}

class GetNameClassA {
    public process(): void {}
}

class GetNameClassB {
    public process(): void {}
}

class GetNameUnderscoreSample {
    public my_method(): void {}
}

class GetNameDigitSample {
    public method2(): void {}
}

class GetNameDollarSample {
    public $method(): void {}
}

class GetNameLongSample {
    public thisIsAVeryLongMethodNameThatTestsTheMaxLengthHandling(): void {}
}

class GetNameShortSample {
    public f(): void {}
}

class GetNameUnicodeSample {
    public 方法(): void {}
    public テスト(): void {}
}

class GetNameMultiMethodSample {
    public methodA(): void {}
    public methodB(): void {}
    public methodC(): void {}
    public methodD(): void {}
    public methodE(): void {}
}

class GetNameParamShapeSample {
    public bar(value: int): void {}
    public baz(): void {}
    public greet(name: string = "World"): void {}
    public sum(...nums: int[]): int {
        let total: int = 0;
        for (let i: int = 0; i < nums.length; i += 1) {
            total += nums[i];
        }
        return total;
    }
    public log(message?: string): void {}
    public onEvent(): void {}
    public load(): Promise<void> {
        return Promise.resolve();
    }
}

class GetNameByteShortParamSample {
    public acceptByte(value: byte): void {}
    public acceptShort(value: short): void {}
}

class GetNameCharBooleanParamSample {
    public acceptChar(value: char): void {}
    public acceptBoolean(value: boolean): void {}
}

class GetNameObjectInputSample {
}

class GetNameObjectParamSample {
    public acceptObject(value: GetNameObjectInputSample): void {}
}

class GetNameArrayParamSample {
    public acceptIntArray(value: int[]): void {}
    public acceptStringMatrix(value: string[][]): void {}
}

enum GetNameEnumParamSample {
    FIRST,
    SECOND
}

class GetNameEnumMethodSample {
    public acceptEnum(value: GetNameEnumParamSample): void {}
}

class GetNameAsyncSample {
    public async fetchData(): Promise<void> {}
    public async doTask(): Promise<void> {}
}

class GetNameAccessSample {
    private calc(): int {
        return 1;
    }
    protected helper(): void {}
    public open(): void {}
    implicit(): void {}
}

class GetNameCaseSample {
    public foo(): void {}
    public Foo(): void {}
}

abstract class GetNameAbstractDeclareSample {
    abstract foo(): void;
}

class GetNameAbstractImplementSample extends GetNameAbstractDeclareSample {
    foo(): void {}
}

class GetNameOverrideParentSample {
    foo(): void {}
}

class GetNameOverrideChildSample extends GetNameOverrideParentSample {
    foo(): void {}
}

class GetNameInheritedParentSample {
    bar(): void {}
}

class GetNameInheritedChildSample extends GetNameInheritedParentSample {
}

class GetNameGrandParentSample {
    doWork(): void {}
}

class GetNameParentSample extends GetNameGrandParentSample {
}

class GetNameGrandChildSample extends GetNameParentSample {
    doWork(): void {}
}

interface GetNameInterfaceSample {
    foo(): void;
}

class GetNameInterfaceImplSample implements GetNameInterfaceSample {
    foo(): void {}
}

class GetNameGenericSample<T> {
    identity(item: T): T {
        return item;
    }
}

class GetNameBuiltInNameSample {
    toString(): string {
        return "";
    }
    name(): string {
        return "name";
    }
    prototype(): void {}
}

class GetNameStaticInstanceSameNameSample {
    static foo(): void {}
    foo(): void {}
}

class GetNameStaticSelfSample {
    static foo(): string {
        return "foo";
    }
}

class GetNameSuperParentSample {
    foo(): string {
        return "parent";
    }
}

class GetNameSuperChildSample extends GetNameSuperParentSample {
    foo(): string {
        return super.foo();
    }
}

class GetNameOverloadSample {
    method(value: int): void {}
    method(value: int, text: string): void {}
}

function findGetNameMethod(classType: ClassType, name: string, wantStatic?: boolean): Method {
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

export default function MethodGetNameTest(): void {
    describe('MethodGetNameTest', () => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_0100
         * @tc.name testMethodGetName001
         * @tc.desc Verify that getName can be called without parameters
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetNameNormalSample>() as ClassType).getMethodByName("add");
            let name: string = method.getName();
            expect(name).assertEqual("add");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_0200
         * @tc.name testMethodGetName002
         * @tc.desc Verify that getName returns correct name for a constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const ctor = (Type.from<GetNameCtorSample>() as ClassType).getConstructor(0);
            let name: string = ctor.getName();
            expect(typeof name).assertEqual("string");
            expect(name).assertEqual("constructor");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_0300
         * @tc.name testMethodGetName003
         * @tc.desc Verify that getName returns correct name for a getter method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetNameGetterSample>() as ClassType).getMethodByName("%%get-value");
            expect(method !== undefined).assertTrue();
            let name: string = method.getName();
            expect(name).assertEqual("%%get-value");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_0400
         * @tc.name testMethodGetName004
         * @tc.desc Verify that getName returns correct name for a setter method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetNameSetterSample>() as ClassType).getMethodByName("%%set-value");
            expect(method !== undefined).assertTrue();
            let name: string = method.getName();
            expect(name).assertEqual("%%set-value");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_0500
         * @tc.name testMethodGetName005
         * @tc.desc Verify that getName returns correct name for a static method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<GetNameStaticSample>() as ClassType;
            let method: Method | undefined = undefined;
            for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
                const m = classType.getMethod(i);
                if (m.getName() == "staticMethod" && m.isStatic()) {
                    method = m;
                    break;
                }
            }
            expect(method !== undefined).assertTrue();
            let name: string = method!.getName();
            expect(name).assertEqual("staticMethod");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_0600
         * @tc.name testMethodGetName006
         * @tc.desc Verify that getName returns correct name for a final method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetNameFinalSample>() as ClassType).getMethodByName("doFinal");
            let name: string = method.getName();
            expect(name).assertEqual("doFinal");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_0700
         * @tc.name testMethodGetName007
         * @tc.desc Verify that getName returns correct name for an overridden abstract method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetNameImplSample>() as ClassType).getMethodByName("doAbstract");
            let name: string = method.getName();
            expect(name).assertEqual("doAbstract");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_0800
         * @tc.name testMethodGetName008
         * @tc.desc Verify that two different classes with same method name return equal names but different Method objects
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const methodA = (Type.from<GetNameClassA>() as ClassType).getMethodByName("process");
            const methodB = (Type.from<GetNameClassB>() as ClassType).getMethodByName("process");
            let nameA: string = methodA.getName();
            let nameB: string = methodB.getName();
            expect(nameA).assertEqual("process");
            expect(nameB).assertEqual("process");
            expect(methodA === methodB).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_0900
         * @tc.name testMethodGetName009
         * @tc.desc Verify that getName returns correct name for a method with underscore
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetNameUnderscoreSample>() as ClassType).getMethodByName("my_method");
            let name: string = method.getName();
            expect(name).assertEqual("my_method");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_1000
         * @tc.name testMethodGetName010
         * @tc.desc Verify that getName returns correct name for a method with digit suffix
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetNameDigitSample>() as ClassType).getMethodByName("method2");
            let name: string = method.getName();
            expect(name).assertEqual("method2");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_1100
         * @tc.name testMethodGetName011
         * @tc.desc Verify that getName returns correct name for a method with dollar sign
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetNameDollarSample>() as ClassType).getMethodByName("$method");
            let name: string = method.getName();
            expect(name).assertEqual("$method");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_1200
         * @tc.name testMethodGetName012
         * @tc.desc Verify that getName returns full name for a very long method name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const longName = "thisIsAVeryLongMethodNameThatTestsTheMaxLengthHandling";
            const method = (Type.from<GetNameLongSample>() as ClassType).getMethodByName(longName);
            let name: string = method.getName();
            expect(name).assertEqual(longName);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_1300
         * @tc.name testMethodGetName013
         * @tc.desc Verify that getName returns correct name for a single character method name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetNameShortSample>() as ClassType).getMethodByName("f");
            let name: string = method.getName();
            expect(name).assertEqual("f");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_1400
         * @tc.name testMethodGetName014
         * @tc.desc Verify that multiple calls to getName return consistent results
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetNameNormalSample>() as ClassType).getMethodByName("add");
            let name1: string = method.getName();
            let name2: string = method.getName();
            let name3: string = method.getName();
            expect(name1).assertEqual(name2);
            expect(name2).assertEqual(name3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_1500
         * @tc.name testMethodGetName015
         * @tc.desc Verify that getName on multiple methods each returns correct name independently
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<GetNameMultiMethodSample>() as ClassType;
            const names: string[] = ["methodA", "methodB", "methodC", "methodD", "methodE"];
            for (let i: int = 0; i < names.length; i += 1) {
                const m = classType.getMethodByName(names[i]);
                expect(m.getName()).assertEqual(names[i]);
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_1600
         * @tc.name testMethodGetName016
         * @tc.desc Verify non-existent method lookup throws TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            try {
                const classType = Type.from<GetNameNormalSample>() as ClassType;
                classType.getMethodByName("nonExistentMethod");
                expect().assertFail();
            } catch (error) {
                expect(error.name).assertEqual("TypeError");
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_1700
         * @tc.name testMethodGetName017
         * @tc.desc Verify getName preserves case-sensitive method names
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const lower = findGetNameMethod(Type.from<GetNameCaseSample>() as ClassType, "foo");
            const upper = findGetNameMethod(Type.from<GetNameCaseSample>() as ClassType, "Foo");
            expect(lower.getName()).assertEqual("foo");
            expect(upper.getName()).assertEqual("Foo");
            expect(lower.getName() === upper.getName()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_1800
         * @tc.name testMethodGetName018
         * @tc.desc Verify getName returns a method name that matches built-in property text
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetNameMethod(Type.from<GetNameBuiltInNameSample>() as ClassType, "name");
            expect(method.getName()).assertEqual("name");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_1900
         * @tc.name testMethodGetName019
         * @tc.desc Verify that getName returns correct Chinese Unicode method name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<GetNameUnicodeSample>() as ClassType;
            const chineseMethod = classType.getMethodByName("方法");
            expect(chineseMethod.getName()).assertEqual("方法");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_2000
         * @tc.name testMethodGetName020
         * @tc.desc Verify that getName returns correct Japanese Unicode method name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<GetNameUnicodeSample>() as ClassType;
            const japaneseMethod = classType.getMethodByName("テスト");
            expect(japaneseMethod.getName()).assertEqual("テスト");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_2100
         * @tc.name testMethodGetName021
         * @tc.desc Verify that getName handles method with required parameter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<GetNameParamShapeSample>() as ClassType;
            expect(classType.getMethodByName("bar").getName()).assertEqual("bar");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_2200
         * @tc.name testMethodGetName022
         * @tc.desc Verify that getName handles method without parameters
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<GetNameParamShapeSample>() as ClassType;
            expect(classType.getMethodByName("baz").getName()).assertEqual("baz");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_2300
         * @tc.name testMethodGetName023
         * @tc.desc Verify that getName handles method with default parameter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<GetNameParamShapeSample>() as ClassType;
            expect(classType.getMethodByName("greet").getName()).assertEqual("greet");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_2400
         * @tc.name testMethodGetName024
         * @tc.desc Verify that getName handles method with rest parameters
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<GetNameParamShapeSample>() as ClassType;
            expect(classType.getMethodByName("sum").getName()).assertEqual("sum");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_2500
         * @tc.name testMethodGetName025
         * @tc.desc Verify that getName handles method with optional parameter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<GetNameParamShapeSample>() as ClassType;
            expect(classType.getMethodByName("log").getName()).assertEqual("log");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_2600
         * @tc.name testMethodGetName026
         * @tc.desc Verify that getName handles callback-style method name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<GetNameParamShapeSample>() as ClassType;
            expect(classType.getMethodByName("onEvent").getName()).assertEqual("onEvent");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_2700
         * @tc.name testMethodGetName027
         * @tc.desc Verify that getName handles Promise-returning method name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<GetNameParamShapeSample>() as ClassType;
            expect(classType.getMethodByName("load").getName()).assertEqual("load");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_2800
         * @tc.name testMethodGetName028
         * @tc.desc Verify that getName handles async method name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const asyncClassType = Type.from<GetNameAsyncSample>() as ClassType;
            expect(asyncClassType.getMethodByName("fetchData").getName()).assertEqual("fetchData");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_2900
         * @tc.name testMethodGetName029
         * @tc.desc Verify that getName returns private method name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<GetNameAccessSample>() as ClassType;
            expect(classType.getMethodByName("calc").getName()).assertEqual("calc");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_3000
         * @tc.name testMethodGetName030
         * @tc.desc Verify that getName returns protected method name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<GetNameAccessSample>() as ClassType;
            expect(classType.getMethodByName("helper").getName()).assertEqual("helper");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_3100
         * @tc.name testMethodGetName031
         * @tc.desc Verify that getName returns default-access method name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<GetNameAccessSample>() as ClassType;
            expect(classType.getMethodByName("implicit").getName()).assertEqual("implicit");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_3200
         * @tc.name testMethodGetName032
         * @tc.desc Verify that getName returns interface implementation method name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const interfaceMethod = (Type.from<GetNameInterfaceImplSample>() as ClassType).getMethodByName("foo");
            expect(interfaceMethod.getName()).assertEqual("foo");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_3300
         * @tc.name testMethodGetName033
         * @tc.desc Verify that getName returns generic method name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const genericMethod = (Type.from<GetNameGenericSample<string>>() as ClassType).getMethodByName("identity");
            expect(genericMethod.getName()).assertEqual("identity");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_3400
         * @tc.name testMethodGetName034
         * @tc.desc Verify that getName returns abstract implementation method name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const abstractMethod = (Type.from<GetNameAbstractImplementSample>() as ClassType).getMethodByName("foo");
            expect(abstractMethod.getName()).assertEqual("foo");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_3500
         * @tc.name testMethodGetName035
         * @tc.desc Verify that getName returns inherited parent method name through child type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const inheritedMethod = (Type.from<GetNameInheritedChildSample>() as ClassType).getMethodByName("bar");
            expect(inheritedMethod.getName()).assertEqual("bar");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_3600
         * @tc.name testMethodGetName036
         * @tc.desc Verify that getName returns grandchild override method name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const grandChildMethod = (Type.from<GetNameGrandChildSample>() as ClassType).getMethodByName("doWork");
            expect(grandChildMethod.getName()).assertEqual("doWork");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_3700
         * @tc.name testMethodGetName037
         * @tc.desc Verify that getName returns child override method name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const overrideChildMethod = (Type.from<GetNameOverrideChildSample>() as ClassType).getMethodByName("foo");
            expect(overrideChildMethod.getName()).assertEqual("foo");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_3800
         * @tc.name testMethodGetName038
         * @tc.desc Verify static method getName returns the source name and method is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<GetNameStaticInstanceSameNameSample>() as ClassType;
            const staticMethod = findGetNameMethod(classType, "foo", true);
            expect(staticMethod.getName()).assertEqual("foo");
            expect(staticMethod.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_3900
         * @tc.name testMethodGetName039
         * @tc.desc Verify that getName returns method name when method calls super
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const superChildMethod = (Type.from<GetNameSuperChildSample>() as ClassType).getMethodByName("foo");
            expect(superChildMethod.getName()).assertEqual("foo");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_4000
         * @tc.name testMethodGetName040
         * @tc.desc Verify getName handles byte and short parameter method names
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<GetNameByteShortParamSample>() as ClassType;
            expect(classType.getMethodByName("acceptByte").getName()).assertEqual("acceptByte");
            expect(classType.getMethodByName("acceptShort").getName()).assertEqual("acceptShort");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_4100
         * @tc.name testMethodGetName041
         * @tc.desc Verify getName handles char and boolean parameter method names
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<GetNameCharBooleanParamSample>() as ClassType;
            expect(classType.getMethodByName("acceptChar").getName()).assertEqual("acceptChar");
            expect(classType.getMethodByName("acceptBoolean").getName()).assertEqual("acceptBoolean");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_4200
         * @tc.name testMethodGetName042
         * @tc.desc Verify getName handles custom object parameter method name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetNameObjectParamSample>() as ClassType).getMethodByName("acceptObject");
            expect(method.getName()).assertEqual("acceptObject");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_4300
         * @tc.name testMethodGetName043
         * @tc.desc Verify getName handles array and multidimensional array parameter method names
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<GetNameArrayParamSample>() as ClassType;
            expect(classType.getMethodByName("acceptIntArray").getName()).assertEqual("acceptIntArray");
            expect(classType.getMethodByName("acceptStringMatrix").getName()).assertEqual("acceptStringMatrix");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_4400
         * @tc.name testMethodGetName044
         * @tc.desc Verify getName handles enum parameter method name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetNameEnumMethodSample>() as ClassType).getMethodByName("acceptEnum");
            expect(method.getName()).assertEqual("acceptEnum");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_4500
         * @tc.name testMethodGetName045
         * @tc.desc Verify overloaded methods keep the same method name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetName045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<GetNameOverloadSample>() as ClassType;
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
            expect(oneParamMethod!.getName()).assertEqual(twoParamMethod!.getName());
        });
    });
}
