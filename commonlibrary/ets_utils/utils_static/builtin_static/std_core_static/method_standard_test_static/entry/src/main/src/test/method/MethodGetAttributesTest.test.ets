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

class AttrsNormalSample {
    add(value: int): int {
        return value + 1;
    }
}

class AttrsByteParamSample {
    acceptByte(value: byte): void {}
}

class AttrsShortParamSample {
    acceptShort(value: short): void {}
}

class AttrsCharParamSample {
    acceptChar(value: char): void {}
}

class AttrsStringParamSample {
    acceptString(value: string): void {}
}

class AttrsBooleanParamSample {
    acceptBoolean(value: boolean): void {}
}

class AttrsObjectInputSample {
}

class AttrsObjectParamSample {
    acceptObject(value: AttrsObjectInputSample): void {}
}

class AttrsStaticSample {
    static create(): AttrsStaticSample {
        return new AttrsStaticSample();
    }
}

class AttrsFinalSample {
    final doFinal(): void {}
}

abstract class AttrsAbstractSample {
    abstract doAbstract(): void;
}

class AttrsCtorSample {
    constructor() {}
}

class AttrsGetterSample {
    private _value: int = 0;
    get value(): int {
        return this._value;
    }
}

class AttrsSetterSample {
    private _value: int = 0;
    set value(v: int) {
        this._value = v;
    }
}

class AttrsNativeSample {
    native doNative(): void;
}

class AttrsPrivateSample {
    private doPrivate(): void {}
}

class AttrsProtectedSample {
    protected doProtected(): void {}
}

class AttrsPlainSample {
    plain(): void {}
}

class AttrsCombinedSample {
    protected static combined(): void {}
}

class AttrsMultiGetSample {
    add(value: int): int {
        return value + 1;
    }
}

class AttrsAsyncSample {
    async doAsync(): Promise<void> {}
}

class AttrsStaticAsyncSample {
    static async doStaticAsync(): Promise<void> {}
}

class AttrsStaticNativeSample {
    static native doStaticNative(): void;
}

class AttrsFinalGetterSample {
    private _value: int = 0;
    final get value(): int {
        return this._value;
    }
}

class AttrsFinalSetterSample {
    private _value: int = 0;
    final set value(v: int) {
        this._value = v;
    }
}

class AttrsParamShapeSample {
    noParam(): void {}
    oneParam(value: int): void {}
    multiParam(a: int, b: string, c: boolean): void {}
    defaultParam(value: int = 1): void {}
    optionalParam(value?: int): void {}
}

class AttrsGenericSample<T> {
    value(input: T): T {
        return input;
    }
}

class AttrsArrayParamSample {
    acceptArray(values: int[]): void {}
}

enum AttrsEnumSample {
    FIRST,
    SECOND
}

class AttrsEnumParamSample {
    acceptEnum(value: AttrsEnumSample): void {}
}

class AttrsLongNameSample {
    thisIsAVeryLongMethodNameForGetAttributesBoundary(): void {}
}

class AttrsSpecialNameSample {
    $attr_123(): void {}
}

class AttrsUnicodeNameSample {
    方法(): void {}

    テスト(): void {}
}

class AttrsParentDecoratedEquivalentSample {
    inheritedPlain(): void {}
}

class AttrsChildDecoratedEquivalentSample extends AttrsParentDecoratedEquivalentSample {
}

class AttrsOverrideParentSample {
    overrideTarget(): void {}
}

class AttrsOverrideChildSample extends AttrsOverrideParentSample {
    overrideTarget(): void {}
}

class AttrsStaticInstanceSameNameSample {
    static sameName(): void {}
    sameName(): void {}
}

class AttrsOverloadSample {
    method(value: int): void {}
    method(value: int, text: string): void {}
}

function findAttrsMethod(classType: ClassType, name: string, wantStatic?: boolean): Method {
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

export default function MethodGetAttributesTest(): void {
    describe('MethodGetAttributesTest', () => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_0100
         * @tc.name testMethodGetAttributes001
         * @tc.desc Verify that getAttributes can be called without parameters
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<AttrsNormalSample>() as ClassType).getMethodByName("add");
            const attrs = method.getAttributes();
            expect(typeof attrs).assertEqual("int");
            expect(attrs).assertEqual(0);
            expect(method.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_0200
         * @tc.name testMethodGetAttributes002
         * @tc.desc Verify that getAttributes returns attribute bits for a static method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<AttrsStaticSample>() as ClassType;
            let method: Method | undefined = undefined;
            for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
                const m = classType.getMethod(i);
                if (m.getName() == "create") {
                    method = m;
                    break;
                }
            }
            const attrs = method!.getAttributes();
            expect(typeof attrs).assertEqual("int");
            expect(method!.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_0300
         * @tc.name testMethodGetAttributes003
         * @tc.desc Verify that getAttributes returns attribute bits for a final method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<AttrsFinalSample>() as ClassType).getMethodByName("doFinal");
            const attrs = method.getAttributes();
            expect(typeof attrs).assertEqual("int");
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_0400
         * @tc.name testMethodGetAttributes004
         * @tc.desc Verify that getAttributes returns attribute bits for an abstract method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<AttrsAbstractSample>() as ClassType).getMethodByName("doAbstract");
            const attrs = method.getAttributes();
            expect(typeof attrs).assertEqual("int");
            expect(method.isAbstract()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_0500
         * @tc.name testMethodGetAttributes005
         * @tc.desc Verify that getAttributes returns attribute bits for a constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<AttrsCtorSample>() as ClassType).getConstructor(0);
            const attrs = method.getAttributes();
            expect(typeof attrs).assertEqual("int");
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_0600
         * @tc.name testMethodGetAttributes006
         * @tc.desc Verify that getAttributes returns attribute bits for a getter method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<AttrsGetterSample>() as ClassType).getMethodByName("%%get-value");
            const attrs = method.getAttributes();
            expect(typeof attrs).assertEqual("int");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_0700
         * @tc.name testMethodGetAttributes007
         * @tc.desc Verify that getAttributes returns attribute bits for a setter method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<AttrsSetterSample>() as ClassType).getMethodByName("%%set-value");
            const attrs = method.getAttributes();
            expect(typeof attrs).assertEqual("int");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_0800
         * @tc.name testMethodGetAttributes008
         * @tc.desc Verify that getAttributes returns attribute bits for a native method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<AttrsNativeSample>() as ClassType).getMethodByName("doNative");
            const attrs = method.getAttributes();
            expect(typeof attrs).assertEqual("int");
            expect(method.isNative()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_0900
         * @tc.name testMethodGetAttributes009
         * @tc.desc Verify getAttributes returns int for a private method and access modifier is non-public
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<AttrsPrivateSample>() as ClassType).getMethodByName("doPrivate");
            const attrs = method.getAttributes();
            expect(typeof attrs).assertEqual("int");
            expect(method.getAccessModifier()).assertLarger(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_1000
         * @tc.name testMethodGetAttributes010
         * @tc.desc Verify that getAttributes returns 0 for a plain method without special modifiers
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<AttrsPlainSample>() as ClassType).getMethodByName("plain");
            const attrs = method.getAttributes();
            expect(attrs).assertEqual(0);
            expect(method.isStatic()).assertFalse();
            expect(method.isGetter()).assertFalse();
            expect(method.isSetter()).assertFalse();
            expect(method.getAccessModifier()).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_1100
         * @tc.name testMethodGetAttributes011
         * @tc.desc Verify that getAttributes returns combined bitwise value for methods with multiple modifiers
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<AttrsCombinedSample>() as ClassType;
            let method: Method | undefined = undefined;
            for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
                const m = classType.getMethod(i);
                if (m.getName() == "combined") {
                    method = m;
                    break;
                }
            }
            const attrs = method!.getAttributes();
            expect(typeof attrs).assertEqual("int");
            expect(attrs).assertLarger(0);
            expect(method!.isStatic()).assertTrue();
            expect(method!.getAccessModifier()).assertLarger(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_1200
         * @tc.name testMethodGetAttributes012
         * @tc.desc Verify that multiple calls to getAttributes return consistent results
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<AttrsMultiGetSample>() as ClassType).getMethodByName("add");
            const attrs1 = method.getAttributes();
            const attrs2 = method.getAttributes();
            const attrs3 = method.getAttributes();
            expect(attrs1).assertEqual(attrs2);
            expect(attrs2).assertEqual(attrs3);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_1300
         * @tc.name testMethodGetAttributes013
         * @tc.desc Verify that getAttributes does not throw Error
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<AttrsNormalSample>() as ClassType).getMethodByName("add");
            const attrs = method.getAttributes();
            expect(attrs !== undefined).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_1400
         * @tc.name testMethodGetAttributes014
         * @tc.desc Verify that getAttributes exposes static bit mask values based on public method baseline
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const publicMethod = (Type.from<AttrsPlainSample>() as ClassType).getMethodByName("plain");
            const staticClassType = Type.from<AttrsStaticSample>() as ClassType;
            let staticMethod: Method | undefined = undefined;
            for (let i: long = 0; i < staticClassType.getMethodsNum(); i += 1) {
                const method = staticClassType.getMethod(i);
                if (method.getName() === "create") {
                    staticMethod = method;
                    break;
                }
            }
            const protectedMethod = (Type.from<AttrsProtectedSample>() as ClassType).getMethodByName("doProtected");
            const combinedClassType = Type.from<AttrsCombinedSample>() as ClassType;
            let combinedMethod: Method | undefined = undefined;
            for (let i: long = 0; i < combinedClassType.getMethodsNum(); i += 1) {
                const method = combinedClassType.getMethod(i);
                if (method.getName() === "combined") {
                    combinedMethod = method;
                    break;
                }
            }
            const publicAttrs: int = publicMethod.getAttributes();
            const staticAttrs: int = staticMethod!.getAttributes();
            const protectedAttrs: int = protectedMethod.getAttributes();
            const combinedAttrs: int = combinedMethod!.getAttributes();
            expect(publicAttrs).assertEqual(0);
            expect(staticAttrs).assertLarger(0);
            expect(protectedAttrs).assertEqual(0);
            expect(combinedAttrs).assertEqual(staticAttrs | protectedAttrs);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_1500
         * @tc.name testMethodGetAttributes015
         * @tc.desc Verify async method attributes are stable and method is async
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findAttrsMethod(Type.from<AttrsAsyncSample>() as ClassType, "doAsync");
            expect(typeof method.getAttributes()).assertEqual("int");
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_1600
         * @tc.name testMethodGetAttributes016
         * @tc.desc Verify static async method exposes both static and async metadata
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findAttrsMethod(Type.from<AttrsStaticAsyncSample>() as ClassType, "doStaticAsync", true);
            expect(typeof method.getAttributes()).assertEqual("int");
            expect(method.isStatic()).assertTrue();
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_1700
         * @tc.name testMethodGetAttributes017
         * @tc.desc Verify static native method exposes both static and native metadata
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findAttrsMethod(Type.from<AttrsStaticNativeSample>() as ClassType, "doStaticNative", true);
            expect(typeof method.getAttributes()).assertEqual("int");
            expect(method.isStatic()).assertTrue();
            expect(method.isNative()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_1800
         * @tc.name testMethodGetAttributes018
         * @tc.desc Verify final getter exposes getter and final metadata
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findAttrsMethod(Type.from<AttrsFinalGetterSample>() as ClassType, "%%get-value");
            expect(typeof method.getAttributes()).assertEqual("int");
            expect(method.isGetter()).assertTrue();
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_1900
         * @tc.name testMethodGetAttributes019
         * @tc.desc Verify final setter exposes setter and final metadata
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findAttrsMethod(Type.from<AttrsFinalSetterSample>() as ClassType, "%%set-value");
            expect(typeof method.getAttributes()).assertEqual("int");
            expect(method.isSetter()).assertTrue();
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_2000
         * @tc.name testMethodGetAttributes020
         * @tc.desc Verify method found by iteration has same attributes as getMethodByName result
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<AttrsNormalSample>() as ClassType;
            const direct = classType.getMethodByName("add");
            const iterated = findAttrsMethod(classType, "add");
            expect(iterated.getAttributes()).assertEqual(direct.getAttributes());
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_2100
         * @tc.name testMethodGetAttributes021
         * @tc.desc Verify inherited method keeps parent attributes
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const parentMethod = findAttrsMethod(Type.from<AttrsParentDecoratedEquivalentSample>() as ClassType, "inheritedPlain");
            const childMethod = findAttrsMethod(Type.from<AttrsChildDecoratedEquivalentSample>() as ClassType, "inheritedPlain");
            expect(childMethod.getAttributes()).assertEqual(parentMethod.getAttributes());
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_2200
         * @tc.name testMethodGetAttributes022
         * @tc.desc Verify override method attributes match plain override baseline
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const parentMethod = findAttrsMethod(Type.from<AttrsOverrideParentSample>() as ClassType, "overrideTarget");
            const childMethod = findAttrsMethod(Type.from<AttrsOverrideChildSample>() as ClassType, "overrideTarget");
            expect(childMethod.getAttributes()).assertEqual(parentMethod.getAttributes());
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_2300
         * @tc.name testMethodGetAttributes023
         * @tc.desc Verify no-parameter method without modifiers has empty attribute bits
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findAttrsMethod(Type.from<AttrsParamShapeSample>() as ClassType, "noParam");
            expect(method.getAttributes()).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_2400
         * @tc.name testMethodGetAttributes024
         * @tc.desc Verify one-parameter method without modifiers has empty attribute bits
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findAttrsMethod(Type.from<AttrsParamShapeSample>() as ClassType, "oneParam");
            expect(method.getAttributes()).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_2500
         * @tc.name testMethodGetAttributes025
         * @tc.desc Verify multi-parameter method without modifiers has empty attribute bits
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findAttrsMethod(Type.from<AttrsParamShapeSample>() as ClassType, "multiParam");
            expect(method.getAttributes()).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_2600
         * @tc.name testMethodGetAttributes026
         * @tc.desc Verify default parameter method without modifiers has empty attribute bits
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findAttrsMethod(Type.from<AttrsParamShapeSample>() as ClassType, "defaultParam");
            expect(method.getAttributes()).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_2700
         * @tc.name testMethodGetAttributes027
         * @tc.desc Verify optional parameter method without modifiers has empty attribute bits
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findAttrsMethod(Type.from<AttrsParamShapeSample>() as ClassType, "optionalParam");
            expect(method.getAttributes()).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_2800
         * @tc.name testMethodGetAttributes028
         * @tc.desc Verify generic method without modifiers has empty attribute bits
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findAttrsMethod(Type.from<AttrsGenericSample<string>>() as ClassType, "value");
            expect(method.getAttributes()).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_2900
         * @tc.name testMethodGetAttributes029
         * @tc.desc Verify array parameter method without modifiers has empty attribute bits
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findAttrsMethod(Type.from<AttrsArrayParamSample>() as ClassType, "acceptArray");
            expect(method.getAttributes()).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_3000
         * @tc.name testMethodGetAttributes030
         * @tc.desc Verify enum parameter method without modifiers has empty attribute bits
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findAttrsMethod(Type.from<AttrsEnumParamSample>() as ClassType, "acceptEnum");
            expect(method.getAttributes()).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_3100
         * @tc.name testMethodGetAttributes031
         * @tc.desc Verify long method name without modifiers has empty attribute bits
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findAttrsMethod(Type.from<AttrsLongNameSample>() as ClassType,
                "thisIsAVeryLongMethodNameForGetAttributesBoundary");
            expect(method.getAttributes()).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_3200
         * @tc.name testMethodGetAttributes032
         * @tc.desc Verify special method name without modifiers has empty attribute bits
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findAttrsMethod(Type.from<AttrsSpecialNameSample>() as ClassType, "$attr_123");
            expect(method.getAttributes()).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_3300
         * @tc.name testMethodGetAttributes033
         * @tc.desc Verify repeated calls return stable value across a larger loop
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findAttrsMethod(Type.from<AttrsStaticSample>() as ClassType, "create", true);
            const first = method.getAttributes();
            for (let i: int = 0; i < 20; i += 1) {
                expect(method.getAttributes()).assertEqual(first);
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_3400
         * @tc.name testMethodGetAttributes034
         * @tc.desc Verify constructor attributes remain stable across repeated calls
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<AttrsCtorSample>() as ClassType).getConstructor(0);
            const first = method.getAttributes();
            expect(method.getAttributes()).assertEqual(first);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_3500
         * @tc.name testMethodGetAttributes035
         * @tc.desc Verify Unicode method names keep stable attribute bits
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const publicMethod = findAttrsMethod(Type.from<AttrsPlainSample>() as ClassType, "plain");
            const classType = Type.from<AttrsUnicodeNameSample>() as ClassType;
            const chineseMethod = findAttrsMethod(classType, "方法");
            const japaneseMethod = findAttrsMethod(classType, "テスト");
            expect(chineseMethod.getAttributes()).assertEqual(publicMethod.getAttributes());
            expect(japaneseMethod.getAttributes()).assertEqual(publicMethod.getAttributes());
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_3600
         * @tc.name testMethodGetAttributes036
         * @tc.desc Verify public methods with byte and short parameters keep stable attribute bits
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const publicMethod = findAttrsMethod(Type.from<AttrsPlainSample>() as ClassType, "plain");
            const byteMethod = findAttrsMethod(Type.from<AttrsByteParamSample>() as ClassType, "acceptByte");
            const shortMethod = findAttrsMethod(Type.from<AttrsShortParamSample>() as ClassType, "acceptShort");
            expect(byteMethod.getAttributes()).assertEqual(publicMethod.getAttributes());
            expect(shortMethod.getAttributes()).assertEqual(publicMethod.getAttributes());
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_3700
         * @tc.name testMethodGetAttributes037
         * @tc.desc Verify public methods with char and string parameters keep stable attribute bits
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const publicMethod = findAttrsMethod(Type.from<AttrsPlainSample>() as ClassType, "plain");
            const charMethod = findAttrsMethod(Type.from<AttrsCharParamSample>() as ClassType, "acceptChar");
            const stringMethod = findAttrsMethod(Type.from<AttrsStringParamSample>() as ClassType, "acceptString");
            expect(charMethod.getAttributes()).assertEqual(publicMethod.getAttributes());
            expect(stringMethod.getAttributes()).assertEqual(publicMethod.getAttributes());
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_3800
         * @tc.name testMethodGetAttributes038
         * @tc.desc Verify public method with custom object parameter keeps stable attribute bits
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const publicMethod = findAttrsMethod(Type.from<AttrsPlainSample>() as ClassType, "plain");
            const objectMethod = findAttrsMethod(Type.from<AttrsObjectParamSample>() as ClassType, "acceptObject");
            expect(objectMethod.getAttributes()).assertEqual(publicMethod.getAttributes());
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_3900
         * @tc.name testMethodGetAttributes039
         * @tc.desc Verify public method with boolean parameter keeps stable attribute bits
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const publicMethod = findAttrsMethod(Type.from<AttrsPlainSample>() as ClassType, "plain");
            const booleanMethod = findAttrsMethod(Type.from<AttrsBooleanParamSample>() as ClassType, "acceptBoolean");
            expect(booleanMethod.getAttributes()).assertEqual(publicMethod.getAttributes());
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_ATTRIBUTES_4000
         * @tc.name testMethodGetAttributes040
         * @tc.desc Verify overloaded methods keep stable attribute bits
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodGetAttributes040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<AttrsOverloadSample>() as ClassType;
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
            expect(oneParamMethod!.getAttributes()).assertEqual(twoParamMethod!.getAttributes());
        });
    });
}
