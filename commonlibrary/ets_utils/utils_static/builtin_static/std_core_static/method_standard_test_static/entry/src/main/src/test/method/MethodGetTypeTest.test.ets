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

class GetTypeNormalSample {
    add(value: int): int {
        return value + 1;
    }
}

class GetTypeNoParamSample {
    greet(): string {
        return "hello";
    }
}

class GetTypeMultiParamSample {
    calc(a: int, b: int, c: int): int {
        return a + b + c;
    }
}

class GetTypeVoidSample {
    log(msg: string): void {
        console.log(msg);
    }
}

class GetTypeCtorSample {
    constructor() {}
}

class GetTypeMultiMethodSample {
    add(value: int): int {
        return value + 1;
    }
    greet(): string {
        return "hello";
    }
}

class GetTypeStringReturnSample {
    getName(): string {
        return "test";
    }
}

class GetTypeGenericSample {
    process(arr: int[]): int[] {
        return arr;
    }
}

class GetTypeStaticSample {
    static getValue(): string {
        return "static";
    }
}

class GetTypeFinalSample {
    final display(): string {
        return "final";
    }
}

abstract class GetTypeAbstractBaseSample {
    abstract compute(): int;
}

class GetTypeOverrideSample extends GetTypeAbstractBaseSample {
    compute(): int {
        return 42;
    }
}

class GetTypeGetterSample {
    get value(): int {
        return 42;
    }
}

class GetTypeSetterSample {
    set value(val: int) {}
}

class GetTypeNativeSample {
    native nativeMethod(): void;
}

class GetTypeParentSample {
    parentMethod(): string {
        return "parent";
    }
}

class GetTypeChildSample extends GetTypeParentSample {
    childMethod(): int {
        return 1;
    }
}

class GetTypeParameterMetaSample {
    collect(id: int, label?: string, ...scores: int[]): void {}
}

class GetTypePrimitiveMoreSample {
    flag(): boolean {
        return true;
    }
    longValue(): long {
        return 1;
    }
    floatValue(): float {
        return 1.0 as float;
    }
    doubleValue(): double {
        return 1.0;
    }
    explicitReturnVoid(): void {
        return;
    }
    undefinedAsVoid(): void {
        return undefined;
    }
    nullValue(): null {
        return null;
    }
}

class GetTypeUserSample {
    value: int = 1;
}

interface GetTypeConfigSample {
    getValue(): int;
}

class GetTypeConfigImplSample implements GetTypeConfigSample {
    getValue(): int {
        return 1;
    }
}

class GetTypeObjectReturnSample {
    getUser(): GetTypeUserSample {
        return new GetTypeUserSample();
    }
    getConfig(): GetTypeConfigSample {
        return new GetTypeConfigImplSample();
    }
    nullable(): string | null {
        return null;
    }
}

class GetTypeArrayReturnSample {
    names(): string[] {
        return ["a"];
    }
    scores(): int[] {
        return [1];
    }
}

class GetTypeGenericReturnSample<T> {
    identity(value: T): T {
        return value;
    }
    values(items: T[]): T[] {
        return items;
    }
}

class GetTypeGenericBoundBaseSample {
}

class GetTypeGenericBoundReturnSample<T extends GetTypeGenericBoundBaseSample> {
    getValue(value: T): T {
        return value;
    }
}

class GetTypePromiseReturnSample {
    async asyncVoid(): Promise<void> {}
    async asyncString(): Promise<string> {
        return "ok";
    }
    loadUser(): Promise<GetTypeUserSample> {
        return new Promise<GetTypeUserSample>((resolve) => { resolve(new GetTypeUserSample()); });
    }
}

class GetTypeAccessorPairSample {
    private _name: string = "";
    get name(): string {
        return this._name;
    }
    set name(value: string) {
        this._name = value;
    }
    static get version(): int {
        return 1;
    }
    static set count(value: int) {
    }
}

class GetTypePrivateProtectedSample {
    private calc(): int {
        return 1;
    }
    protected validate(): boolean {
        return true;
    }
}

class GetTypeStaticCreateSample {
    static create(): GetTypeStaticCreateSample {
        return new GetTypeStaticCreateSample();
    }
    static log(): void {}
}

enum GetTypeStatusSample {
    READY,
    DONE
}

class GetTypeEnumReturnSample {
    getStatus(): GetTypeStatusSample {
        return GetTypeStatusSample.READY;
    }
}

class GetTypeParamShapeReturnSample {
    greet(name: string = "World"): string {
        return name;
    }
    sum(...nums: int[]): int {
        let total: int = 0;
        for (let i: int = 0; i < nums.length; i += 1) {
            total += nums[i];
        }
        return total;
    }
    log(message?: string): void {}
}

class GetTypeGrandParentSample {
    greet(): string {
        return "parent";
    }
}

class GetTypeMiddleSample extends GetTypeGrandParentSample {
}

class GetTypeGrandChildSample extends GetTypeMiddleSample {
    greet(): string {
        return "child";
    }
}

abstract class GetTypeAbstractNumberBaseSample {
    abstract getValue(): int;
}

class GetTypeAbstractNumberChildSample extends GetTypeAbstractNumberBaseSample {
    getValue(): int {
        return 1;
    }
}

class GetTypeSelfReturnSample {
    step(): GetTypeSelfReturnSample {
        return this;
    }
}

class GetTypeOverloadSample {
    method(value: int): int {
        return value;
    }

    method(value: int, text: string): int {
        return value + text.length;
    }
}

function findGetTypeMethod(classType: ClassType, name: string, wantStatic?: boolean): Method {
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

export default function MethodGetTypeTest(): void {
    describe('MethodGetTypeTest', () => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_0100
         * @tc.name testMethodGetType001
         * @tc.desc Verify that getType can be called without parameters and returns non-null
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetTypeNormalSample>() as ClassType).getMethodByName("add");
            let result = method.getType();
            expect(result !== undefined).assertTrue();
            expect(result.getResultType().toString()).assertEqual("int");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_0200
         * @tc.name testMethodGetType002
         * @tc.desc Verify that getType returns MethodType for a parameterless method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetTypeNoParamSample>() as ClassType).getMethodByName("greet");
            let result = method.getType();
            expect(result !== undefined).assertTrue();
            expect(result.getResultType().toString()).assertEqual("string");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_0300
         * @tc.name testMethodGetType003
         * @tc.desc Verify that getType returns MethodType for a multi-parameter method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetTypeMultiParamSample>() as ClassType).getMethodByName("calc");
            let result = method.getType();
            expect(result !== undefined).assertTrue();
            expect(result.getResultType().toString()).assertEqual("int");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_0400
         * @tc.name testMethodGetType004
         * @tc.desc Verify that getType returns MethodType for a void return type method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetTypeVoidSample>() as ClassType).getMethodByName("log");
            let result = method.getType();
            expect(result !== undefined).assertTrue();
            expect(result.getResultType().toString()).assertEqual("void");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_0500
         * @tc.name testMethodGetType005
         * @tc.desc Verify that getType returns MethodType for a constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetTypeCtorSample>() as ClassType).getConstructor(0);
            let result = method.getType();
            expect(result !== undefined).assertTrue();
            expect(result instanceof MethodType).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_0600
         * @tc.name testMethodGetType006
         * @tc.desc Verify that multiple calls to getType on same Method return equal results
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetTypeNormalSample>() as ClassType).getMethodByName("add");
            let result1 = method.getType();
            let result2 = method.getType();
            expect(result1.equals(result2)).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_0700
         * @tc.name testMethodGetType007
         * @tc.desc Verify that getType return value is not null for different methods
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<GetTypeMultiMethodSample>() as ClassType;
            const addMethod = classType.getMethodByName("add");
            const greetMethod = classType.getMethodByName("greet");
            let addType = addMethod.getType();
            let greetType = greetMethod.getType();
            expect(addType !== undefined).assertTrue();
            expect(greetType !== undefined).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_0800
         * @tc.name testMethodGetType008
         * @tc.desc Verify that typeof getType return value is object
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetTypeNormalSample>() as ClassType).getMethodByName("add");
            let result = method.getType();
            expect(typeof result).assertEqual("object");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_0900
         * @tc.name testMethodGetType009
         * @tc.desc Verify that getType result for string return method has correct result type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetTypeStringReturnSample>() as ClassType).getMethodByName("getName");
            let methodType = method.getType();
            let resultType = methodType.getResultType();
            expect(resultType.toString()).assertEqual("string");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_1000
         * @tc.name testMethodGetType010
         * @tc.desc Verify that getType returns MethodType for method with generic-like array parameter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetTypeGenericSample>() as ClassType).getMethodByName("process");
            let methodType = method.getType();
            expect(methodType !== undefined).assertTrue();
            expect(methodType instanceof MethodType).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_1100
         * @tc.name testMethodGetType011
         * @tc.desc Verify getType returns non-undefined for a normal method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetTypeNormalSample>() as ClassType).getMethodByName("add");
            let result = method.getType();
            expect(result !== undefined).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_1200
         * @tc.name testMethodGetType012
         * @tc.desc Verify getType on static method returns MethodType
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<GetTypeStaticSample>() as ClassType;
            let staticMethod: Method | undefined = undefined;
            for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
                let m = classType.getMethod(i);
                if (m.isStatic()) {
                    staticMethod = m;
                    break;
                }
            }
            let result = staticMethod!.getType();
            expect(result !== undefined).assertTrue();
            expect(result.getResultType().toString()).assertEqual("string");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_1300
         * @tc.name testMethodGetType013
         * @tc.desc Verify getType on final method returns MethodType
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetTypeFinalSample>() as ClassType).getMethodByName("display");
            let result = method.getType();
            expect(result !== undefined).assertTrue();
            expect(result.getResultType().toString()).assertEqual("string");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_1400
         * @tc.name testMethodGetType014
         * @tc.desc Verify getType on abstract method returns MethodType
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetTypeAbstractBaseSample>() as ClassType).getMethodByName("compute");
            let result = method.getType();
            expect(result !== undefined).assertTrue();
            expect(result.getResultType().toString()).assertEqual("int");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_1500
         * @tc.name testMethodGetType015
         * @tc.desc Verify getType on overridden method returns MethodType
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetTypeOverrideSample>() as ClassType).getMethodByName("compute");
            let result = method.getType();
            expect(result !== undefined).assertTrue();
            expect(result.getResultType().toString()).assertEqual("int");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_1600
         * @tc.name testMethodGetType016
         * @tc.desc Verify getType on getter accessor returns MethodType
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetTypeGetterSample>() as ClassType).getMethodByName("%%get-value");
            let result = method.getType();
            expect(result !== undefined).assertTrue();
            expect(result.getResultType().toString()).assertEqual("int");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_1700
         * @tc.name testMethodGetType017
         * @tc.desc Verify getType on setter accessor returns MethodType
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetTypeSetterSample>() as ClassType).getMethodByName("%%set-value");
            let result = method.getType();
            expect(result !== undefined).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_1800
         * @tc.name testMethodGetType018
         * @tc.desc Verify getType on native method returns MethodType
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetTypeNativeSample>() as ClassType).getMethodByName("nativeMethod");
            let result = method.getType();
            expect(result !== undefined).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_1900
         * @tc.name testMethodGetType019
         * @tc.desc Verify method lookup failure for a non-existent method throws error before getType
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            try {
                const classType = Type.from<GetTypeNormalSample>() as ClassType;
                const method = classType.getMethodByName("nonExistentMethod");
                let result = method.getType();
                expect().assertFail();
            } catch (error) {
                expect(error.name).assertEqual("TypeError");
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_2000
         * @tc.name testMethodGetType020
         * @tc.desc Verify getType on inherited method from parent class returns MethodType
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetTypeChildSample>() as ClassType).getMethodByName("parentMethod");
            let result = method.getType();
            expect(result !== undefined).assertTrue();
            expect(result.getResultType().toString()).assertEqual("string");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_2100
         * @tc.name testMethodGetType021
         * @tc.desc Verify MethodType parameter metadata name type, optional flag, and rest flag
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetTypeParameterMetaSample>() as ClassType).getMethodByName("collect");
            const methodType = method.getType();
            expect(methodType.getParametersNum()).assertEqual(3);
            const idParam = methodType.getParameter(0);
            const labelParam = methodType.getParameter(1);
            const scoresParam = methodType.getParameter(2);
            expect(typeof idParam.getName()).assertEqual("string");
            expect(idParam.isOptional()).assertFalse();
            expect(idParam.isRest()).assertFalse();
            expect(typeof labelParam.getName()).assertEqual("string");
            expect(labelParam.isOptional()).assertTrue();
            expect(labelParam.isRest()).assertFalse();
            expect(typeof scoresParam.getName()).assertEqual("string");
            expect(scoresParam.isOptional()).assertFalse();
            expect(scoresParam.isRest()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_2200
         * @tc.name testMethodGetType022
         * @tc.desc Verify MethodType parameter getType returns expected type metadata
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<GetTypeParameterMetaSample>() as ClassType).getMethodByName("collect");
            const methodType = method.getType();
            expect(methodType.getParameter(0).getType().toString()).assertEqual("int");
            expect(methodType.getParameter(1).getType().toString()).assertEqual("string");
            expect(methodType.getParameter(2).getType().toString()).assertEqual("std.core.Array");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_2300
         * @tc.name testMethodGetType023
         * @tc.desc Verify boolean return type metadata
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypePrimitiveMoreSample>() as ClassType, "flag");
            expect(method.getType().getResultType().toString()).assertEqual("boolean");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_2400
         * @tc.name testMethodGetType024
         * @tc.desc Verify long return type metadata
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypePrimitiveMoreSample>() as ClassType, "longValue");
            expect(method.getType().getResultType().toString()).assertEqual("long");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_2500
         * @tc.name testMethodGetType025
         * @tc.desc Verify float return type metadata
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypePrimitiveMoreSample>() as ClassType, "floatValue");
            expect(method.getType().getResultType().toString()).assertEqual("float");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_2600
         * @tc.name testMethodGetType026
         * @tc.desc Verify double return type metadata
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypePrimitiveMoreSample>() as ClassType, "doubleValue");
            expect(method.getType().getResultType().toString()).assertEqual("double");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_2700
         * @tc.name testMethodGetType027
         * @tc.desc Verify explicit return statement preserves void return type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypePrimitiveMoreSample>() as ClassType, "explicitReturnVoid");
            expect(method.getType().getResultType().toString()).assertEqual("void");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_2800
         * @tc.name testMethodGetType028
         * @tc.desc Verify returning undefined from void method preserves void return type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypePrimitiveMoreSample>() as ClassType, "undefinedAsVoid");
            expect(method.getType().getResultType().toString()).assertEqual("void");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_2900
         * @tc.name testMethodGetType029
         * @tc.desc Verify null return type metadata is available
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypePrimitiveMoreSample>() as ClassType, "nullValue");
            expect(method.getType().getResultType().toString()).assertEqual("null");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_3000
         * @tc.name testMethodGetType030
         * @tc.desc Verify class return type metadata is available
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypeObjectReturnSample>() as ClassType, "getUser");
            expect(method.getType().getResultType().toString()).assertContain("GetTypeUserSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_3100
         * @tc.name testMethodGetType031
         * @tc.desc Verify interface return type metadata is available
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypeObjectReturnSample>() as ClassType, "getConfig");
            expect(method.getType().getResultType().toString()).assertContain("GetTypeConfigSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_3200
         * @tc.name testMethodGetType032
         * @tc.desc Verify nullable union return type metadata is available
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypeObjectReturnSample>() as ClassType, "nullable");
            expect(method.getType().getResultType().toString()).assertEqual("(... | ...)");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_3300
         * @tc.name testMethodGetType033
         * @tc.desc Verify string array return type metadata
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypeArrayReturnSample>() as ClassType, "names");
            expect(method.getType().getResultType().toString()).assertEqual("std.core.Array");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_3400
         * @tc.name testMethodGetType034
         * @tc.desc Verify int array return type metadata
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypeArrayReturnSample>() as ClassType, "scores");
            expect(method.getType().getResultType().toString()).assertEqual("std.core.Array");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_3500
         * @tc.name testMethodGetType035
         * @tc.desc Verify generic return type metadata is available
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypeGenericReturnSample<string>>() as ClassType, "identity");
            expect(method.getType().getResultType().toString()).assertEqual("Y");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_3600
         * @tc.name testMethodGetType036
         * @tc.desc Verify generic array return type metadata is available
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypeGenericReturnSample<string>>() as ClassType, "values");
            expect(method.getType().getResultType().toString()).assertEqual("std.core.Array");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_3700
         * @tc.name testMethodGetType037
         * @tc.desc Verify bounded generic return type metadata is available
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypeGenericBoundReturnSample<GetTypeGenericBoundBaseSample>>() as ClassType, "getValue");
            expect(method.getType().getResultType().toString()).assertContain("GetTypeGenericBoundBaseSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_3800
         * @tc.name testMethodGetType038
         * @tc.desc Verify async void Promise return type metadata is available
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypePromiseReturnSample>() as ClassType, "asyncVoid");
            expect(method.getType().getResultType().toString()).assertContain("Promise");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_3900
         * @tc.name testMethodGetType039
         * @tc.desc Verify async string Promise return type metadata is available
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypePromiseReturnSample>() as ClassType, "asyncString");
            expect(method.getType().getResultType().toString()).assertContain("Promise");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_4000
         * @tc.name testMethodGetType040
         * @tc.desc Verify Promise of class return type metadata is available
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypePromiseReturnSample>() as ClassType, "loadUser");
            expect(method.getType().getResultType().toString()).assertContain("Promise");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_4100
         * @tc.name testMethodGetType041
         * @tc.desc Verify getter string return type metadata
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypeAccessorPairSample>() as ClassType, "%%get-name");
            expect(method.getType().getResultType().toString()).assertEqual("string");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_4200
         * @tc.name testMethodGetType042
         * @tc.desc Verify setter result type metadata is available
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypeAccessorPairSample>() as ClassType, "%%set-name");
            expect(method.getType().getResultType().toString()).assertEqual("void");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_4300
         * @tc.name testMethodGetType043
         * @tc.desc Verify static getter result type metadata
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypeAccessorPairSample>() as ClassType, "%%get-version", true);
            expect(method.getType().getResultType().toString()).assertEqual("int");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_4400
         * @tc.name testMethodGetType044
         * @tc.desc Verify static setter result type metadata is available
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypeAccessorPairSample>() as ClassType, "%%set-count", true);
            expect(method.getType().getResultType().toString()).assertEqual("void");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_4500
         * @tc.name testMethodGetType045
         * @tc.desc Verify private method int return type metadata
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypePrivateProtectedSample>() as ClassType, "calc");
            expect(method.getType().getResultType().toString()).assertEqual("int");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_4600
         * @tc.name testMethodGetType046
         * @tc.desc Verify protected method boolean return type metadata
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypePrivateProtectedSample>() as ClassType, "validate");
            expect(method.getType().getResultType().toString()).assertEqual("boolean");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_4700
         * @tc.name testMethodGetType047
         * @tc.desc Verify static method class return type metadata is available
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypeStaticCreateSample>() as ClassType, "create", true);
            expect(method.getType().getResultType().toString()).assertContain("GetTypeStaticCreateSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_4800
         * @tc.name testMethodGetType048
         * @tc.desc Verify static method void return type metadata
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypeStaticCreateSample>() as ClassType, "log", true);
            expect(method.getType().getResultType().toString()).assertEqual("void");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_4900
         * @tc.name testMethodGetType049
         * @tc.desc Verify enum return type metadata is available
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypeEnumReturnSample>() as ClassType, "getStatus");
            expect(method.getType().getResultType().toString()).assertContain("GetTypeStatusSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_5000
         * @tc.name testMethodGetType050
         * @tc.desc Verify default-parameter method string return type metadata
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypeParamShapeReturnSample>() as ClassType, "greet");
            expect(method.getType().getResultType().toString()).assertEqual("string");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_5100
         * @tc.name testMethodGetType051
         * @tc.desc Verify rest-parameter method int return type metadata
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypeParamShapeReturnSample>() as ClassType, "sum");
            expect(method.getType().getResultType().toString()).assertEqual("int");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_5200
         * @tc.name testMethodGetType052
         * @tc.desc Verify optional-parameter method void return type metadata
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypeParamShapeReturnSample>() as ClassType, "log");
            expect(method.getType().getResultType().toString()).assertEqual("void");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_5300
         * @tc.name testMethodGetType053
         * @tc.desc Verify multi-level override string return type metadata
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypeGrandChildSample>() as ClassType, "greet");
            expect(method.getType().getResultType().toString()).assertEqual("string");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_5400
         * @tc.name testMethodGetType054
         * @tc.desc Verify abstract implementation int return type metadata
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypeAbstractNumberChildSample>() as ClassType, "getValue");
            expect(method.getType().getResultType().toString()).assertEqual("int");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_5500
         * @tc.name testMethodGetType055
         * @tc.desc Verify self-class return type metadata is available
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findGetTypeMethod(Type.from<GetTypeSelfReturnSample>() as ClassType, "step");
            expect(method.getType().getResultType().toString()).assertContain("GetTypeSelfReturnSample");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_TYPE_5600
         * @tc.name testMethodGetType056
         * @tc.desc Verify overloaded methods keep distinct parameter counts in type metadata
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetType056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<GetTypeOverloadSample>() as ClassType;
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
            expect(oneParamMethod!.getType().getParametersNum()).assertEqual(1);
            expect(twoParamMethod!.getType().getParametersNum()).assertEqual(2);
        });
    });
}
