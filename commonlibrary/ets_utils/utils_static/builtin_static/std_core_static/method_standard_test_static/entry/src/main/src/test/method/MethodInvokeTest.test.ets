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

class InvokeNormalSample {
    add(value: int): int {
        return value + 1;
    }
}

class InvokeValueSample {
    getValue(): int {
        return 42;
    }
}

class InvokeParent {
    greet(): string {
        return "hello";
    }
}

class InvokeChild extends InvokeParent {}

class InvokeStaticSample {
    public static staticMethod(): int {
        return 100;
    }
}

class InvokeOtherClass {}

class InvokeCalculator {
    sum(a: int, b: int, c: int): int {
        return a + b + c;
    }
    divide(a: double, b: double): double {
        return a / b;
    }
}

class InvokeOverloadSample {
    compute(value: int): int {
        return value + 1;
    }

    compute(value: int, extra: int): int {
        return value + extra;
    }
}

class InvokeGreeter {
    greet(name: string): string {
        return "Hello, " + name;
    }
}

class InvokeDefaultSample {
    getDefault(): int {
        return 0;
    }
}

class InvokePoint {
    x: int = 0;
    y: int = 0;
    constructor(x: int, y: int) {
        this.x = x;
        this.y = y;
    }
}

class InvokeFactory {
    createPoint(x: int, y: int): InvokePoint {
        return new InvokePoint(x, y);
    }
    create(): InvokePoint {
        return new InvokePoint(0, 0);
    }
}

class InvokeCounter {
    count: int = 0;
    increment(): void {
        this.count += 1;
    }
    next(): int {
        this.count += 1;
        return this.count;
    }
}

class InvokeValidator {
    isPositive(value: int): boolean {
        return value > 0;
    }
}

class InvokeItem {
    value: int = 0;
    constructor(v: int) {
        this.value = v;
    }
}

class InvokeReturnSample {
    getZero(): int {
        return 0;
    }
    getEmpty(): string {
        return "";
    }
    getFalse(): boolean {
        return false;
    }
    getNegative(): int {
        return -1;
    }
    getMaxInt(): int {
        return 2147483647;
    }
    getMinInt(): int {
        return -2147483648;
    }
    getNull(): InvokeItem | null {
        return null;
    }
    doNothing(): void {
        return;
    }
}

class InvokeTextFlagSample {
    getText(): string {
        return "test";
    }
    getFlag(): boolean {
        return true;
    }
}

class InvokeWrongClass {}

class InvokeProtectedSample {
    protected protectedMethod(): string {
        return "protected";
    }
}

class InvokeThrowSample {
    throwMethod(): int {
        throw new Error("internal error");
    }
}

class InvokeCustomError extends Error {
    constructor(message: string) {
        super(message);
    }
}

class InvokeCustomErrorSample {
    customErrorMethod(): void {
        throw new InvokeCustomError("custom error");
    }
}

class InvokeFinalSample {
    final getValue(): int {
        return 99;
    }
}

abstract class InvokeAbstractBase {
    abstract compute(): int;
}

class InvokeConcreteSample extends InvokeAbstractBase {
    compute(): int {
        return 77;
    }
}

class InvokeAccessorSample {
    private _value: int = 42;
    get value(): int {
        return this._value;
    }
    set value(v: int) {
        this._value = v;
    }
}

class InvokeNativeSample {
    native doNative(): int;
}

class InvokeArgObject {
    value: int = 0;
    constructor(value: int) {
        this.value = value;
    }
}

class InvokeCustomArg {
    label: string = "custom";
}

class InvokeArgSample {
    echo(value: string): string {
        return value;
    }
    boolValue(value: boolean): boolean {
        return value;
    }
    nullable(value: string): string {
        return value;
    }
    optional(value?: string): string {
        if (value === undefined) {
            return "undefined";
        }
        return value;
    }
    objectValue(value: InvokeArgObject): int {
        return value.value;
    }
    arrayValue(value: string[]): int {
        return value.length;
    }
    customValue(value: InvokeCustomArg): string {
        return value.label;
    }
    callbackValue(callback: () => string): string {
        return callback();
    }
    promiseValue(value: Promise<int>): Promise<int> {
        return value;
    }
}

class InvokeThisSample {
    name: string = "owner";
    count: int = 0;
    getName(): string {
        return this.name;
    }
    chain(): InvokeThisSample {
        return this;
    }
    increment(): void {
        this.count += 1;
    }
}

class InvokePrivateStaticSample {
    private secret(): string {
        return "secret";
    }
    private static staticSecret(): int {
        return 7;
    }
    protected static staticHelper(): string {
        return "helper";
    }
}

class InvokeAsyncSample {
    async fetch(): Promise<string> {
        return "data";
    }
}

class InvokeParamShapeSample {
    greet(message: string = "Hi"): string {
        return message;
    }
    join(...values: string[]): string {
        let result: string = "";
        for (let i: int = 0; i < values.length; i += 1) {
            if (i > 0) {
                result += ",";
            }
            result += values[i];
        }
        return result;
    }
    parse(text?: string): string {
        if (text === undefined) {
            return "none";
        }
        return text;
    }
    mustHave(value?: string): string {
        if (value === undefined) {
            throw new Error("missing");
        }
        return value;
    }
    combo(a: int, b: int = 10, ...rest: string[]): string {
        return `${a}:${b}:${rest.length}`;
    }
}

class InvokeSuperParentSample {
    greet(): string {
        return "parent";
    }
}

class InvokeSuperChildSample extends InvokeSuperParentSample {
    greet(): string {
        return super.greet() + ":child";
    }
}

class InvokeRecursiveSample {
    fib(value: int): int {
        if (value <= 1) {
            return value;
        }
        return this.fib(value - 1) + this.fib(value - 2);
    }
}

interface InvokeInterfaceSample {
    doWork(): string;
}

class InvokeInterfaceImplSample implements InvokeInterfaceSample {
    doWork(): string {
        return "impl";
    }
}

class InvokeStaticStateSample {
    static count: int = 0;
    static increment(): int {
        InvokeStaticStateSample.count += 1;
        return InvokeStaticStateSample.count;
    }
}

class InvokeStaticParentSample {
    static greet(): string {
        return "parentStatic";
    }
}

class InvokeStaticChildInheritSample extends InvokeStaticParentSample {
}

class InvokeStaticChildOverrideSample extends InvokeStaticParentSample {
    static greet(): string {
        return "childStatic";
    }
}

class InvokeStateThenThrowSample {
    value: int = 0;
    update(): void {
        this.value = 1;
        throw new Error("updated");
    }
}

class InvokeGetterThrowSample {
    get value(): int {
        throw new Error("getter fail");
    }
}

class InvokeReceiverIsolationSample {
    value: int = 0;
    constructor(value: int) {
        this.value = value;
    }
    add(delta: int): int {
        this.value += delta;
        return this.value;
    }
}

class InvokeSetterStateSample {
    value: int = 0;
    set data(v: int) {
        this.value = v;
    }
    get data(): int {
        return this.value;
    }
}

class InvokeCtorMultiArgSample {
    x: int = 0;
    y: string = "";
    constructor(x: int, y: string) {
        this.x = x;
        this.y = y;
    }
}

class InvokeStaticReceiverSample {
    static echo(value: string): string {
        return value;
    }
}

class InvokeAsyncRejectSample {
    async fail(): Promise<string> {
        throw new Error("async fail");
    }
}

class InvokeReturnIdentitySample {
    getSelf(): InvokeReturnIdentitySample {
        return this;
    }
    getArray(): int[] {
        return [1, 2, 3];
    }
    getFloat(): float {
        return 1.5 as float;
    }
    getDouble(): double {
        return 2.25;
    }
    getLong(): long {
        return 123456789;
    }
}

class InvokeStringEdgeSample {
    repeat(value: string, count: int): string {
        let result: string = "";
        for (let i: int = 0; i < count; i += 1) {
            result += value;
        }
        return result;
    }
    unicode(): string {
        return "方法";
    }
}

class InvokeBooleanBranchSample {
    choose(flag: boolean): string {
        return flag ? "yes" : "no";
    }
}

class InvokeMixedNumericSample {
    addLong(a: long, b: long): long {
        return a + b;
    }
    addDouble(a: double, b: double): double {
        return a + b;
    }
}

function findInvokeMethod(classType: ClassType, name: string, wantStatic?: boolean): Method {
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

export default function MethodInvokeTest(): void {
    describe('MethodInvokeTest', () => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_0100
         * @tc.name testMethodInvoke001
         * @tc.desc Verify that invoke can be called with two required parameters: recv and args
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeNormalSample>() as ClassType).getMethodByName("add");
            const args: FixedArray<int> = [1];
            const result = method.invoke(new InvokeNormalSample(), args);
            expect(result as int).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_0200
         * @tc.name testMethodInvoke002
         * @tc.desc Verify that invoke with child class instance as recv returns correct result
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeParent>() as ClassType).getMethodByName("greet");
            const args: FixedArray<never> = [];
            const result = method.invoke(new InvokeChild(), args);
            expect(result as string).assertEqual("hello");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_0300
         * @tc.name testMethodInvoke003
         * @tc.desc Verify that invoke with null recv for static method returns correct result
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<InvokeStaticSample>() as ClassType;
            let method: Method | undefined = undefined;
            for (let i: int = 0; i < classType.getMethodsNum(); i += 1) {
                const m = classType.getMethod(i);
                if (m.getName() == "staticMethod" && m.isStatic()) {
                    method = m;
                    break;
                }
            }
            const result = method!.invoke(null, [] as FixedArray<never>);
            expect(result as int).assertEqual(100);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_0400
         * @tc.name testMethodInvoke004
         * @tc.desc Verify that invoke with null recv for constructor returns non-null instance
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<InvokeOtherClass>() as ClassType;
            const ctor = classType.getConstructor(0);
            const result = ctor.invoke(null, [] as FixedArray<never>);
            expect(result !== null && result !== undefined).assertTrue();
            expect(result instanceof InvokeOtherClass).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_0500
         * @tc.name testMethodInvoke005
         * @tc.desc Verify that invoke with null recv for instance method throws Error
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeNormalSample>() as ClassType).getMethodByName("add");
            const args: FixedArray<int> = [1];
            try {
                method.invoke(null, args);
                expect().assertFail();
            } catch (error) {
                expect(error.name).assertEqual("Error");
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_0600
         * @tc.name testMethodInvoke006
         * @tc.desc Verify that invoke with string recv throws Error
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeNormalSample>() as ClassType).getMethodByName("add");
            const args: FixedArray<int> = [1];
            try {
                method.invoke("string_value", args);
                expect().assertFail();
            } catch (error) {
                expect(error.name).assertEqual("Error");
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_0700
         * @tc.name testMethodInvoke007
         * @tc.desc Verify that invoke with number recv throws Error
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeNormalSample>() as ClassType).getMethodByName("add");
            const args: FixedArray<int> = [1];
            try {
                method.invoke(42, args);
                expect().assertFail();
            } catch (error) {
                expect(error.name).assertEqual("Error");
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_0800
         * @tc.name testMethodInvoke008
         * @tc.desc Verify that invoke with FixedArray containing multiple parameters returns correct result
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeCalculator>() as ClassType).getMethodByName("sum");
            const args: FixedArray<int> = [1, 2, 3];
            const result = method.invoke(new InvokeCalculator(), args);
            expect(result as int).assertEqual(6);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_0900
         * @tc.name testMethodInvoke009
         * @tc.desc Verify that invoke with FixedArray containing string parameter returns correct result
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeGreeter>() as ClassType).getMethodByName("greet");
            const args: FixedArray<string> = ["World"];
            const result = method.invoke(new InvokeGreeter(), args);
            expect(result as string).assertEqual("Hello, World");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_1000
         * @tc.name testMethodInvoke010
         * @tc.desc Verify that invoke with empty FixedArray for no-param method returns correct result
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeDefaultSample>() as ClassType).getMethodByName("getDefault");
            const args: FixedArray<never> = [];
            const result = method.invoke(new InvokeDefaultSample(), args);
            expect(result as int).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_1100
         * @tc.name testMethodInvoke011
         * @tc.desc Verify that invoke with too few args expects exception
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeCalculator>() as ClassType).getMethodByName("sum");
            const args: FixedArray<int> = [1];
            try {
                method.invoke(new InvokeCalculator(), args);
                expect().assertFail();
            } catch (error) {
                expect(error.name).assertEqual("Error");
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_1200
         * @tc.name testMethodInvoke012
         * @tc.desc Verify that invoke with too many args expects exception
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeNormalSample>() as ClassType).getMethodByName("add");
            const args: FixedArray<int> = [1, 2];
            try {
                method.invoke(new InvokeNormalSample(), args);
                expect().assertFail();
            } catch (error) {
                expect(error.name).assertEqual("Error");
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_1300
         * @tc.name testMethodInvoke013
         * @tc.desc Verify that invoke with wrong argument type throws Error without relying on message
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeNormalSample>() as ClassType).getMethodByName("add");
            const args: FixedArray<string> = ["not_int"];
            try {
                method.invoke(new InvokeNormalSample(), args);
                expect().assertFail();
            } catch (error) {
                expect(error.name).assertEqual("Error");
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_1400
         * @tc.name testMethodInvoke014
         * @tc.desc Verify that invoke with null element in args expects exception
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeNormalSample>() as ClassType).getMethodByName("add");
            const args: FixedArray<null> = [null];
            try {
                method.invoke(new InvokeNormalSample(), args);
                expect().assertFail();
            } catch (error) {
                expect(error.name).assertEqual("Error");
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_1500
         * @tc.name testMethodInvoke015
         * @tc.desc Verify that invoke returns correct string value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeGreeter>() as ClassType).getMethodByName("greet");
            const args: FixedArray<string> = ["Test"];
            const result = method.invoke(new InvokeGreeter(), args);
            expect(typeof result).assertEqual("string");
            expect(result as string).assertEqual("Hello, Test");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_1600
         * @tc.name testMethodInvoke016
         * @tc.desc Verify that invoke returns correct object value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeFactory>() as ClassType).getMethodByName("createPoint");
            const args: FixedArray<int> = [10, 20];
            const result = method.invoke(new InvokeFactory(), args);
            expect(result !== null && result !== undefined).assertTrue();
            expect(result instanceof InvokePoint).assertTrue();
            expect((result as InvokePoint).x).assertEqual(10);
            expect((result as InvokePoint).y).assertEqual(20);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_1700
         * @tc.name testMethodInvoke017
         * @tc.desc Verify that invoke returns undefined for a void method contract
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeCounter>() as ClassType).getMethodByName("increment");
            const args: FixedArray<never> = [];
            const result = method.invoke(new InvokeCounter(), args) as undefined;
            expect(result).assertUndefined();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_1800
         * @tc.name testMethodInvoke018
         * @tc.desc Verify that invoke returns correct boolean value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeValidator>() as ClassType).getMethodByName("isPositive");
            const args: FixedArray<int> = [5];
            const result = method.invoke(new InvokeValidator(), args);
            expect(typeof result).assertEqual("boolean");
            expect(result as boolean).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_1900
         * @tc.name testMethodInvoke019
         * @tc.desc Verify that invoke returns correct double value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeCalculator>() as ClassType).getMethodByName("divide");
            const args: FixedArray<int> = [10, 3];
            const result = method.invoke(new InvokeCalculator(), args);
            let resultValue: double = result as double;
            expect(resultValue).assertLarger(3.33);
            expect(resultValue).assertLess(3.34);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_2000
         * @tc.name testMethodInvoke020
         * @tc.desc Verify that typeof result is int for int return type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeValueSample>() as ClassType).getMethodByName("getValue");
            const result = method.invoke(new InvokeValueSample(), [] as FixedArray<never>);
            expect(typeof result).assertEqual("int");
            expect(result as int).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_2100
         * @tc.name testMethodInvoke021
         * @tc.desc Verify that typeof result is string for string return type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeTextFlagSample>() as ClassType).getMethodByName("getText");
            const result = method.invoke(new InvokeTextFlagSample(), [] as FixedArray<never>);
            expect(typeof result).assertEqual("string");
            expect(result as string).assertEqual("test");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_2200
         * @tc.name testMethodInvoke022
         * @tc.desc Verify that typeof result is boolean for boolean return type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeTextFlagSample>() as ClassType).getMethodByName("getFlag");
            const result = method.invoke(new InvokeTextFlagSample(), [] as FixedArray<never>);
            expect(typeof result).assertEqual("boolean");
            expect(result as boolean).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_2300
         * @tc.name testMethodInvoke023
         * @tc.desc Verify that instanceof check works on returned object from invoke
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeFactory>() as ClassType).getMethodByName("create");
            const result = method.invoke(new InvokeFactory(), [] as FixedArray<never>);
            expect(result instanceof InvokePoint).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_2400
         * @tc.name testMethodInvoke024
         * @tc.desc Verify that invoke returns null for method that returns null
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeReturnSample>() as ClassType).getMethodByName("getNull");
            const result = method.invoke(new InvokeReturnSample(), [] as FixedArray<never>) as null;
            expect(result).assertNull();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_2500
         * @tc.name testMethodInvoke025
         * @tc.desc Verify that invoke returns 0 for method that returns zero
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeReturnSample>() as ClassType).getMethodByName("getZero");
            const result = method.invoke(new InvokeReturnSample(), [] as FixedArray<never>);
            expect(result as int).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_2600
         * @tc.name testMethodInvoke026
         * @tc.desc Verify that invoke returns empty string for method that returns empty string
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeReturnSample>() as ClassType).getMethodByName("getEmpty");
            const result = method.invoke(new InvokeReturnSample(), [] as FixedArray<never>);
            expect(result as string).assertEqual("");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_2700
         * @tc.name testMethodInvoke027
         * @tc.desc Verify that invoke returns false for method that returns false
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeReturnSample>() as ClassType).getMethodByName("getFalse");
            const result = method.invoke(new InvokeReturnSample(), [] as FixedArray<never>);
            expect(result as boolean).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_2800
         * @tc.name testMethodInvoke028
         * @tc.desc Verify that invoke returns negative number for method that returns negative
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeReturnSample>() as ClassType).getMethodByName("getNegative");
            const result = method.invoke(new InvokeReturnSample(), [] as FixedArray<never>);
            expect(result as int).assertEqual(-1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_2900
         * @tc.name testMethodInvoke029
         * @tc.desc Verify that invoke returns new instance for constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<InvokeItem>() as ClassType;
            const ctor = classType.getConstructor(0);
            const result = ctor.invoke(null, [99] as FixedArray<int>);
            expect(result !== null && result !== undefined).assertTrue();
            expect(result instanceof InvokeItem).assertTrue();
            expect((result as InvokeItem).value).assertEqual(99);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_3000
         * @tc.name testMethodInvoke030
         * @tc.desc Verify that invoke returns int maximum value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeReturnSample>() as ClassType).getMethodByName("getMaxInt");
            const result = method.invoke(new InvokeReturnSample(), [] as FixedArray<never>);
            expect(result as int).assertEqual(2147483647);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_3100
         * @tc.name testMethodInvoke031
         * @tc.desc Verify that invoke returns int minimum value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeReturnSample>() as ClassType).getMethodByName("getMinInt");
            const result = method.invoke(new InvokeReturnSample(), [] as FixedArray<never>);
            expect(result as int).assertEqual(-2147483648);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_3200
         * @tc.name testMethodInvoke032
         * @tc.desc Verify that multiple invoke calls return independent values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const counter = new InvokeCounter();
            const method = (Type.from<InvokeCounter>() as ClassType).getMethodByName("next");
            const result1 = method.invoke(counter, [] as FixedArray<never>);
            const result2 = method.invoke(counter, [] as FixedArray<never>);
            expect(result1 as int).assertEqual(1);
            expect(result2 as int).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_3300
         * @tc.name testMethodInvoke033
         * @tc.desc Verify that invoke on protected method returns correct result
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<InvokeProtectedSample>() as ClassType;
            const method = classType.getMethodByName("protectedMethod");
            const result = method.invoke(new InvokeProtectedSample(), [] as FixedArray<never>);
            expect(result as string).assertEqual("protected");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_3400
         * @tc.name testMethodInvoke034
         * @tc.desc Verify that invoke with wrong recv class throws Error
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeNormalSample>() as ClassType).getMethodByName("add");
            try {
                method.invoke(new InvokeWrongClass(), [1] as FixedArray<int>);
                expect().assertFail();
            } catch (error) {
                expect(error.name).assertEqual("Error");
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_3500
         * @tc.name testMethodInvoke035
         * @tc.desc Verify that invoke propagates internal Error from target method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeThrowSample>() as ClassType).getMethodByName("throwMethod");
            try {
                method.invoke(new InvokeThrowSample(), [] as FixedArray<never>);
                expect().assertFail();
            } catch (error) {
                expect(error.name).assertEqual("Error");
                expect(error.message).assertEqual("internal error");
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_3600
         * @tc.name testMethodInvoke036
         * @tc.desc Verify that invoke propagates custom error message from target method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeCustomErrorSample>() as ClassType).getMethodByName("customErrorMethod");
            try {
                method.invoke(new InvokeCustomErrorSample(), [] as FixedArray<never>);
                expect().assertFail();
            } catch (error) {
                expect(error.name).assertEqual("Error");
                expect(error.message).assertEqual("custom error");
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_3700
         * @tc.name testMethodInvoke037
         * @tc.desc Verify invoke on final method returns correct result
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeFinalSample>() as ClassType).getMethodByName("getValue");
            const result = method.invoke(new InvokeFinalSample(), [] as FixedArray<never>);
            expect(result as int).assertEqual(99);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_3800
         * @tc.name testMethodInvoke038
         * @tc.desc Verify invoke on abstract method implementation returns correct result
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeAbstractBase>() as ClassType).getMethodByName("compute");
            const result = method.invoke(new InvokeConcreteSample(), [] as FixedArray<never>);
            expect(result as int).assertEqual(77);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_3900
         * @tc.name testMethodInvoke039
         * @tc.desc Verify invoke on getter returns the property value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeAccessorSample>() as ClassType).getMethodByName("%%get-value");
            const result = method.invoke(new InvokeAccessorSample(), [] as FixedArray<never>);
            expect(result as int).assertEqual(42);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_4000
         * @tc.name testMethodInvoke040
         * @tc.desc Verify invoke on setter returns undefined
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeAccessorSample>() as ClassType).getMethodByName("%%set-value");
            const result = method.invoke(new InvokeAccessorSample(), [100] as FixedArray<int>) as undefined;
            expect(result).assertUndefined();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_4100
         * @tc.name testMethodInvoke041
         * @tc.desc Verify invoke on native method throws LinkerUnresolvedMethodError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<InvokeNativeSample>() as ClassType).getMethodByName("doNative");
            try {
                method.invoke(new InvokeNativeSample(), [] as FixedArray<never>);
                expect().assertFail();
            } catch (error) {
                expect(error.name).assertEqual("LinkerUnresolvedMethodError");
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_4200
         * @tc.name testMethodInvoke042
         * @tc.desc Verify invoke loop on getter and setter in same object returns consistent values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const obj = new InvokeAccessorSample();
            const getter = (Type.from<InvokeAccessorSample>() as ClassType).getMethodByName("%%get-value");
            const setter = (Type.from<InvokeAccessorSample>() as ClassType).getMethodByName("%%set-value");
            for (let i: int = 0; i < 5; i += 1) {
                setter.invoke(obj, [i] as FixedArray<int>);
                const v = getter.invoke(obj, [] as FixedArray<never>);
                expect(v as int).assertEqual(i);
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_4300
         * @tc.name testMethodInvoke043
         * @tc.desc Verify invoke passes string argument directly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeArgSample>() as ClassType, "echo");
            const result = method.invoke(new InvokeArgSample(), ["hello"] as FixedArray<string>);
            expect(result as string).assertEqual("hello");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_4400
         * @tc.name testMethodInvoke044
         * @tc.desc Verify invoke passes boolean argument directly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeArgSample>() as ClassType, "boolValue");
            const result = method.invoke(new InvokeArgSample(), [true] as FixedArray<boolean>);
            expect(result as boolean).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_4500
         * @tc.name testMethodInvoke045
         * @tc.desc Verify invoke passes undefined argument to optional parameter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeArgSample>() as ClassType, "optional");
            const result = method.invoke(new InvokeArgSample(), [undefined] as FixedArray<string | undefined>);
            expect(result as string).assertEqual("undefined");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_4600
         * @tc.name testMethodInvoke046
         * @tc.desc Verify invoke passes custom object argument
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeArgSample>() as ClassType, "objectValue");
            const result = method.invoke(new InvokeArgSample(), [new InvokeArgObject(9)] as FixedArray<InvokeArgObject>);
            expect(result as int).assertEqual(9);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_4700
         * @tc.name testMethodInvoke047
         * @tc.desc Verify invoke passes string array argument
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeArgSample>() as ClassType, "arrayValue");
            const result = method.invoke(new InvokeArgSample(), [["a", "b"]] as FixedArray<string[]>);
            expect(result as int).assertEqual(2);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_4800
         * @tc.name testMethodInvoke048
         * @tc.desc Verify invoke passes custom class instance argument
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeArgSample>() as ClassType, "customValue");
            const result = method.invoke(new InvokeArgSample(), [new InvokeCustomArg()] as FixedArray<InvokeCustomArg>);
            expect(result as string).assertEqual("custom");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_4900
         * @tc.name testMethodInvoke049
         * @tc.desc Verify invoke passes Promise argument through target method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeArgSample>() as ClassType, "promiseValue");
            const promise = new Promise<int>((resolve) => { resolve(5); });
            const result = method.invoke(new InvokeArgSample(), [promise] as FixedArray<Promise<int>>);
            expect(result !== undefined).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_5000
         * @tc.name testMethodInvoke050
         * @tc.desc Verify invoke returns this instance from chain method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const sample = new InvokeThisSample();
            sample.count = 10;
            const method = findInvokeMethod(Type.from<InvokeThisSample>() as ClassType, "chain");
            const result = method.invoke(sample, [] as FixedArray<never>) as InvokeThisSample;
            expect(result.count).assertEqual(10);
            expect(result.getName()).assertEqual("owner");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_5100
         * @tc.name testMethodInvoke051
         * @tc.desc Verify invoke uses receiver as this context
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeThisSample>() as ClassType, "getName");
            const result = method.invoke(new InvokeThisSample(), [] as FixedArray<never>);
            expect(result as string).assertEqual("owner");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_5200
         * @tc.name testMethodInvoke052
         * @tc.desc Verify invoke can call private instance method through reflection
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokePrivateStaticSample>() as ClassType, "secret");
            const result = method.invoke(new InvokePrivateStaticSample(), [] as FixedArray<never>);
            expect(result as string).assertEqual("secret");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_5300
         * @tc.name testMethodInvoke053
         * @tc.desc Verify invoke can call private static method through reflection
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokePrivateStaticSample>() as ClassType, "staticSecret", true);
            const result = method.invoke(null, [] as FixedArray<never>);
            expect(result as int).assertEqual(7);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_5400
         * @tc.name testMethodInvoke054
         * @tc.desc Verify invoke can call protected static method through reflection
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokePrivateStaticSample>() as ClassType, "staticHelper", true);
            const result = method.invoke(null, [] as FixedArray<never>);
            expect(result as string).assertEqual("helper");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_5500
         * @tc.name testMethodInvoke055
         * @tc.desc Verify async method invoke returns Promise and awaited value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            const method = findInvokeMethod(Type.from<InvokeAsyncSample>() as ClassType, "fetch");
            const result = method.invoke(new InvokeAsyncSample(), [] as FixedArray<never>) as Promise<string>;
            const value = await result;
            expect(value).assertEqual("data");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_5600
         * @tc.name testMethodInvoke056
         * @tc.desc Verify default parameter method accepts explicit argument
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeParamShapeSample>() as ClassType, "greet");
            const result = method.invoke(new InvokeParamShapeSample(), ["Hi"] as FixedArray<string>);
            expect(result as string).assertEqual("Hi");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_5700
         * @tc.name testMethodInvoke057
         * @tc.desc Verify rest parameters receive multiple arguments
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeParamShapeSample>() as ClassType, "join");
            const result = method.invoke(new InvokeParamShapeSample(), [["a", "b"]] as FixedArray<string[]>);
            expect(result as string).assertEqual("a,b");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_5800
         * @tc.name testMethodInvoke058
         * @tc.desc Verify optional parameter accepts undefined fallback value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeParamShapeSample>() as ClassType, "parse");
            const result = method.invoke(new InvokeParamShapeSample(), [undefined] as FixedArray<string | undefined>);
            expect(result as string).assertEqual("none");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_5900
         * @tc.name testMethodInvoke059
         * @tc.desc Verify method detects missing required argument passed as undefined
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeParamShapeSample>() as ClassType, "mustHave");
            try {
                method.invoke(new InvokeParamShapeSample(), [undefined] as FixedArray<string | undefined>);
                expect().assertFail();
            } catch (error) {
                expect(error.message).assertEqual("missing");
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_6000
         * @tc.name testMethodInvoke060
         * @tc.desc Verify method with default and rest parameters handles mixed arguments
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeParamShapeSample>() as ClassType, "combo");
            const result = method.invoke(new InvokeParamShapeSample(), [1, 10, ["a", "b"]] as FixedArray<int | string[]>);
            expect(result as string).assertEqual("1:10:2");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_6100
         * @tc.name testMethodInvoke061
         * @tc.desc Verify method with super call invokes normally
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeSuperChildSample>() as ClassType, "greet");
            const result = method.invoke(new InvokeSuperChildSample(), [] as FixedArray<never>);
            expect(result as string).assertEqual("parent:child");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_6200
         * @tc.name testMethodInvoke062
         * @tc.desc Verify recursive method invoke calculates expected value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeRecursiveSample>() as ClassType, "fib");
            const result = method.invoke(new InvokeRecursiveSample(), [6] as FixedArray<int>);
            expect(result as int).assertEqual(8);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_6300
         * @tc.name testMethodInvoke063
         * @tc.desc Verify interface implementation method invokes normally
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeInterfaceImplSample>() as ClassType, "doWork");
            const result = method.invoke(new InvokeInterfaceImplSample(), [] as FixedArray<never>);
            expect(result as string).assertEqual("impl");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_6400
         * @tc.name testMethodInvoke064
         * @tc.desc Verify static method invoke mutates static state
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            InvokeStaticStateSample.count = 0;
            const method = findInvokeMethod(Type.from<InvokeStaticStateSample>() as ClassType, "increment", true);
            const result = method.invoke(null, [] as FixedArray<never>);
            expect(result as int).assertEqual(1);
            expect(InvokeStaticStateSample.count).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_6500
         * @tc.name testMethodInvoke065
         * @tc.desc Verify inherited static method invokes parent implementation
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeStaticChildInheritSample>() as ClassType, "greet", true);
            const result = method.invoke(null, [] as FixedArray<never>);
            expect(result as string).assertEqual("parentStatic");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_6600
         * @tc.name testMethodInvoke066
         * @tc.desc Verify overridden static method invokes child implementation
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeStaticChildOverrideSample>() as ClassType, "greet", true);
            const result = method.invoke(null, [] as FixedArray<never>);
            expect(result as string).assertEqual("childStatic");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_6700
         * @tc.name testMethodInvoke067
         * @tc.desc Verify state mutation before thrown error is preserved
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const sample = new InvokeStateThenThrowSample();
            const method = findInvokeMethod(Type.from<InvokeStateThenThrowSample>() as ClassType, "update");
            try {
                method.invoke(sample, [] as FixedArray<never>);
                expect().assertFail();
            } catch (error) {
                expect(error.message).assertEqual("updated");
                expect(sample.value).assertEqual(1);
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_6800
         * @tc.name testMethodInvoke068
         * @tc.desc Verify getter exception propagates through invoke
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeGetterThrowSample>() as ClassType, "%%get-value");
            try {
                method.invoke(new InvokeGetterThrowSample(), [] as FixedArray<never>);
                expect().assertFail();
            } catch (error) {
                expect(error.message).assertEqual("getter fail");
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_6900
         * @tc.name testMethodInvoke069
         * @tc.desc Verify invoke mutates only the receiver instance used for the call
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const first = new InvokeReceiverIsolationSample(1);
            const second = new InvokeReceiverIsolationSample(10);
            const method = findInvokeMethod(Type.from<InvokeReceiverIsolationSample>() as ClassType, "add");
            const result = method.invoke(first, [5] as FixedArray<int>);
            expect(result as int).assertEqual(6);
            expect(first.value).assertEqual(6);
            expect(second.value).assertEqual(10);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_7000
         * @tc.name testMethodInvoke070
         * @tc.desc Verify setter invoke updates receiver state observable by getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const sample = new InvokeSetterStateSample();
            const setter = findInvokeMethod(Type.from<InvokeSetterStateSample>() as ClassType, "%%set-data");
            const getter = findInvokeMethod(Type.from<InvokeSetterStateSample>() as ClassType, "%%get-data");
            setter.invoke(sample, [88] as FixedArray<int>);
            const result = getter.invoke(sample, [] as FixedArray<never>);
            expect(result as int).assertEqual(88);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_7100
         * @tc.name testMethodInvoke071
         * @tc.desc Verify constructor invoke with multiple arguments initializes fields
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const ctor = (Type.from<InvokeCtorMultiArgSample>() as ClassType).getConstructor(0);
            const result = ctor.invoke(null, [7, "seven"] as FixedArray<int | string>);
            expect(result instanceof InvokeCtorMultiArgSample).assertTrue();
            expect((result as InvokeCtorMultiArgSample).x).assertEqual(7);
            expect((result as InvokeCtorMultiArgSample).y).assertEqual("seven");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_7200
         * @tc.name testMethodInvoke072
         * @tc.desc Verify constructor invoke with too few arguments throws Error
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const ctor = (Type.from<InvokeCtorMultiArgSample>() as ClassType).getConstructor(0);
            try {
                ctor.invoke(null, [7] as FixedArray<int>);
                expect().assertFail();
            } catch (error) {
                expect(error.name).assertEqual("Error");
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_7300
         * @tc.name testMethodInvoke073
         * @tc.desc Verify static method invoke uses null receiver and explicit arguments
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeStaticReceiverSample>() as ClassType, "echo", true);
            const result = method.invoke(null, ["ok"] as FixedArray<string>);
            expect(result as string).assertEqual("ok");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_7400
         * @tc.name testMethodInvoke074
         * @tc.desc Verify async rejected Promise from invoked method propagates rejection
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            const method = findInvokeMethod(Type.from<InvokeAsyncRejectSample>() as ClassType, "fail");
            try {
                const result = method.invoke(new InvokeAsyncRejectSample(), [] as FixedArray<never>) as Promise<string>;
                await result;
                expect().assertFail();
            } catch (error) {
                expect(error.message).assertEqual("async fail");
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_7500
         * @tc.name testMethodInvoke075
         * @tc.desc Verify method returning this returns an object whose methods can be invoked
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const sample = new InvokeReturnIdentitySample();
            const method = findInvokeMethod(Type.from<InvokeReturnIdentitySample>() as ClassType, "getSelf");
            const result = method.invoke(sample, [] as FixedArray<never>) as InvokeReturnIdentitySample;
            expect(result.getArray().length).assertEqual(3);
            expect(result.getFloat() > 1.4 as float).assertTrue();
            expect(result.getDouble() > 2.2).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_7600
         * @tc.name testMethodInvoke076
         * @tc.desc Verify method returning int array returns expected array values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeReturnIdentitySample>() as ClassType, "getArray");
            const result = method.invoke(new InvokeReturnIdentitySample(), [] as FixedArray<never>) as int[];
            expect(result.length).assertEqual(3);
            expect(result[0]).assertEqual(1);
            expect(result[2]).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_7700
         * @tc.name testMethodInvoke077
         * @tc.desc Verify method returning float value returns expected numeric value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeReturnIdentitySample>() as ClassType, "getFloat");
            const result = method.invoke(new InvokeReturnIdentitySample(), [] as FixedArray<never>);
            expect((result as float) > 1.4 as float).assertTrue();
            expect((result as float) < 1.6 as float).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_7800
         * @tc.name testMethodInvoke078
         * @tc.desc Verify method returning double value returns expected numeric value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeReturnIdentitySample>() as ClassType, "getDouble");
            const result = method.invoke(new InvokeReturnIdentitySample(), [] as FixedArray<never>);
            expect((result as double) > 2.2).assertTrue();
            expect((result as double) < 2.3).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_7900
         * @tc.name testMethodInvoke079
         * @tc.desc Verify method returning long value returns expected value
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeReturnIdentitySample>() as ClassType, "getLong");
            const result = method.invoke(new InvokeReturnIdentitySample(), [] as FixedArray<never>);
            expect(result as long).assertEqual(123456789);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_8000
         * @tc.name testMethodInvoke080
         * @tc.desc Verify string repeat method handles repeated string arguments
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeStringEdgeSample>() as ClassType, "repeat");
            const result = method.invoke(new InvokeStringEdgeSample(), ["ab", 3] as FixedArray<string | int>);
            expect(result as string).assertEqual("ababab");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_8100
         * @tc.name testMethodInvoke081
         * @tc.desc Verify invoked method can return Unicode string
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeStringEdgeSample>() as ClassType, "unicode");
            const result = method.invoke(new InvokeStringEdgeSample(), [] as FixedArray<never>);
            expect(result as string).assertEqual("方法");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_8200
         * @tc.name testMethodInvoke082
         * @tc.desc Verify boolean false branch argument is passed correctly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeBooleanBranchSample>() as ClassType, "choose");
            const result = method.invoke(new InvokeBooleanBranchSample(), [false] as FixedArray<boolean>);
            expect(result as string).assertEqual("no");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_8300
         * @tc.name testMethodInvoke083
         * @tc.desc Verify boolean true branch argument is passed correctly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeBooleanBranchSample>() as ClassType, "choose");
            const result = method.invoke(new InvokeBooleanBranchSample(), [true] as FixedArray<boolean>);
            expect(result as string).assertEqual("yes");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_8400
         * @tc.name testMethodInvoke084
         * @tc.desc Verify long parameters are passed and returned correctly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeMixedNumericSample>() as ClassType, "addLong");
            const result = method.invoke(new InvokeMixedNumericSample(), [1, 2] as FixedArray<long>);
            expect(result as long).assertEqual(3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_8500
         * @tc.name testMethodInvoke085
         * @tc.desc Verify double parameters are passed and returned correctly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findInvokeMethod(Type.from<InvokeMixedNumericSample>() as ClassType, "addDouble");
            const result = method.invoke(new InvokeMixedNumericSample(), [1.25, 2.5] as FixedArray<double>);
            expect((result as double) > 3.7).assertTrue();
            expect((result as double) < 3.8).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_8600
         * @tc.name testMethodInvoke086
         * @tc.desc Verify repeated invoke on same Method with different receivers stays independent
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const first = new InvokeReceiverIsolationSample(0);
            const second = new InvokeReceiverIsolationSample(100);
            const method = findInvokeMethod(Type.from<InvokeReceiverIsolationSample>() as ClassType, "add");
            expect(method.invoke(first, [1] as FixedArray<int>) as int).assertEqual(1);
            expect(method.invoke(second, [1] as FixedArray<int>) as int).assertEqual(101);
            expect(first.value).assertEqual(1);
            expect(second.value).assertEqual(101);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_INVOKE_8700
         * @tc.name testMethodInvoke087
         * @tc.desc Verify overloaded methods can be invoked by signature and return different results
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodInvoke087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<InvokeOverloadSample>() as ClassType;
            let oneParamMethod: Method | undefined = undefined;
            let twoParamMethod: Method | undefined = undefined;
            for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
                const method = classType.getMethod(i);
                if (method.getName() === "compute") {
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
            expect(oneParamMethod!.invoke(new InvokeOverloadSample(), [1] as FixedArray<int>) as int).assertEqual(2);
            expect(twoParamMethod!.invoke(new InvokeOverloadSample(), [1, 2] as FixedArray<int>) as int).assertEqual(3);
        });
    });
}
