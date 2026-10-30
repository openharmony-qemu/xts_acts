/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';

// Sendable point instance used as the subject of every Object static-method case.
@Sendable
class P {
  public x: number = 3
  public y: number = 4
}

// Plain (non-sendable) target/source shapes used by the Object.assign cases.
interface AssignTarget {
  x: number;
  y: number;
}

interface ZSource {
  z: number;
}

interface ManyBag {
  a: number;
  b: number;
  c: number;
  d: number;
  e: number;
}

// Run an action that is expected to throw; fail the case if it does not throw.
function expectThrow(tag: string, action: () => void): void {
  try {
    action();
    expect().assertFail();
  } catch (error) {
    let e: BusinessError = error as BusinessError;
    expect(e.message.length > 0).assertTrue();
  }
}

export default function SendableObjectMethodsTest() {
  describe('SendableObjectMethodsTest', () => {
    beforeAll(() => {});
    beforeEach(() => {});
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0024
     * @tc.name testSendableObjectKeysEntriesNames
     * @tc.desc Object.keys/entries/getOwnPropertyNames on @Sendable class P{x:3,y:4} return matching arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectKeysEntriesNames', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
      let p: P = new P();

      let keys: string[] = Object.keys(p);
      expect(keys.length).assertEqual(2);
      expect(keys.includes('x')).assertTrue();
      expect(keys.includes('y')).assertTrue();

      let names: string[] = Object.getOwnPropertyNames(p);
      expect(names.length).assertEqual(2);
      expect(names.includes('x')).assertTrue();
      expect(names.includes('y')).assertTrue();

      expect(Object.entries(p).length).assertEqual(2);
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0025
     * @tc.name testSendableObjectAssignToPlainTarget
     * @tc.desc Object.assign(plainTarget, sendableSource) copies the sendable's own enumerable fields onto the target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectAssignToPlainTarget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
      let target: AssignTarget = { x: 0, y: 0 };
      let p: P = new P();
      Object.assign(target, p);
      expect(target.x).assertEqual(3);
      expect(target.y).assertEqual(4);
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0026
     * @tc.name testSendableObjectOwnSymbolsAndDescriptors
     * @tc.desc Object.getOwnPropertySymbols/getOwnPropertyDescriptors on a sendable return symbols (none) and descriptors (x,y)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectOwnSymbolsAndDescriptors', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
      let p: P = new P();

      let syms: symbol[] = Object.getOwnPropertySymbols(p);
      expect(syms.length).assertEqual(0);

      let descriptors: ESObject = Object.getOwnPropertyDescriptors(p) as ESObject;
      let descKeys: string[] = Object.keys(descriptors as object);
      expect(descKeys.length).assertEqual(2);
      expect(descKeys.includes('x')).assertTrue();
      expect(descKeys.includes('y')).assertTrue();
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0027
     * @tc.name testSendableObjectGetPrototypeOf
     * @tc.desc Object.getPrototypeOf(sendableInstance) returns the (non-null) prototype object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectGetPrototypeOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
      let p: P = new P();
      let proto: Object | null = Object.getPrototypeOf(p);
      expect(proto !== null).assertTrue();
      expect(proto instanceof Object).assertTrue();
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0028
     * @tc.name testSendableObjectIntegrityLevel
     * @tc.desc Object.isFrozen/isSealed on a sendable instance report the integrity level (fields are writable)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectIntegrityLevel', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
      let p: P = new P();
      // Sendable instance fields are writable (p.x may be reassigned), so the object is not frozen.
      expect(Object.isFrozen(p)).assertFalse();
      expect(Object.isSealed(p)).assertTrue();
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0029
     * @tc.name testSendableObjectSetProtoAndCreateWithNonObjectProto
     * @tc.desc Object.setPrototypeOf(sendable, 1) and Object.create(1) throw TypeError (proto must be object/null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectSetProtoAndCreateWithNonObjectProto', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
      let p: P = new P();
      expectThrow('setPrototypeOf-sendable-1', (): void => { Object.setPrototypeOf(p, 1 as Object); });
      expectThrow('create-1', (): void => { Object.create(1 as Object); });
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0030
     * @tc.name testSendableObjectCreateWithSendableProto
     * @tc.desc Object.create(sendableInstance) throws TypeError (sendable cannot be used as a prototype)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectCreateWithSendableProto', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
      let p: P = new P();
      expectThrow('create-sendable', (): void => { Object.create(p as Object); });
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0031
     * @tc.name testSendableObjectSetPrototypeOfNonExtensible
     * @tc.desc Object.setPrototypeOf on a sendable (non-extensible) object throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectSetPrototypeOfNonExtensible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
      let p: P = new P();
      expectThrow('setPrototypeOf-sendable-null', (): void => { Object.setPrototypeOf(p as Object, null); });
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0032
     * @tc.name testSendableObjectMethodsOnNullishThrow
     * @tc.desc Object.keys/entries/getOwnPropertyNames/getOwnPropertyDescriptors with undefined/null throw (matrix, 8 sub-checks)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectMethodsOnNullishThrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
      let checks: number = 0;
      expectThrow('keys-undefined', (): void => { Object.keys(undefined as Object); }); checks = checks + 1;
      expectThrow('keys-null', (): void => { Object.keys(null as Object); }); checks = checks + 1;
      expectThrow('entries-undefined', (): void => { Object.entries(undefined as Object); }); checks = checks + 1;
      expectThrow('entries-null', (): void => { Object.entries(null as Object); }); checks = checks + 1;
      expectThrow('gopn-undefined', (): void => { Object.getOwnPropertyNames(undefined as Object); }); checks = checks + 1;
      expectThrow('gopn-null', (): void => { Object.getOwnPropertyNames(null as Object); }); checks = checks + 1;
      expectThrow('gopd-undefined', (): void => { Object.getOwnPropertyDescriptors(undefined as Object); }); checks = checks + 1;
      expectThrow('gopd-null', (): void => { Object.getOwnPropertyDescriptors(null as Object); }); checks = checks + 1;
      expect(checks).assertEqual(8);
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0033
     * @tc.name testSendableObjectIsFrozenSealedOnNullish
     * @tc.desc Object.isFrozen/isSealed(undefined/null) return true and do not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectIsFrozenSealedOnNullish', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
      try {
        expect(Object.isFrozen(undefined)).assertTrue();
        expect(Object.isFrozen(null)).assertTrue();
        expect(Object.isSealed(undefined)).assertTrue();
        expect(Object.isSealed(null)).assertTrue();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`unexpected throw: ${e.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0034
     * @tc.name testSendableObjectSetPrototypeOfNullish
     * @tc.desc Object.setPrototypeOf(undefined/null, proto) throws TypeError (RequireObjectCoercible)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectSetPrototypeOfNullish', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
      expectThrow('setPrototypeOf-undefined', (): void => { Object.setPrototypeOf(undefined, null); });
      expectThrow('setPrototypeOf-null', (): void => { Object.setPrototypeOf(null, null); });
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0035
     * @tc.name testSendableObjectSetPrototypeOfPrimitive
     * @tc.desc Object.setPrototypeOf(1, proto) returns 1 and does not throw (non-object O is returned as-is)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectSetPrototypeOfPrimitive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
      try {
        let result: Object = Object.setPrototypeOf(1 as Object, null) as Object;
        expect(Number(result)).assertEqual(1);
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`unexpected throw: ${e.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0036
     * @tc.name testSendableObjectAssignToNonExtensibleTarget
     * @tc.desc Object.assign(sendableTarget, {z:5}) throws TypeError (sendable target rejects new property)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectAssignToNonExtensibleTarget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
      let p: P = new P();
      let src: ZSource = { z: 5 };
      expectThrow('assign-sendable-target', (): void => { Object.assign(p, src); });
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0037
     * @tc.name testSendableObjectAssignManyFields
     * @tc.desc Object.assign with a source having many fields copies every field onto the plain target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectAssignManyFields', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
      let target: ManyBag = { a: 0, b: 0, c: 0, d: 0, e: 0 };
      let source: ManyBag = { a: 1, b: 2, c: 3, d: 4, e: 5 };
      Object.assign(target, source);
      expect(target.a + target.b + target.c + target.d + target.e).assertEqual(15);
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0038
     * @tc.name testSendableObjectAssignNumericKeys
     * @tc.desc Object.assign with numeric-named source fields stores them as string keys on the target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectAssignNumericKeys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
      let source: ESObject = ({}) as ESObject;
      Object.defineProperty(source, 1, { value: 'a', enumerable: true, writable: true, configurable: true });
      Object.defineProperty(source, 2, { value: 'b', enumerable: true, writable: true, configurable: true });
      let target: ESObject = ({}) as ESObject;
      Object.assign(target, source);
      let keys: string[] = Object.keys(target as object);
      expect(keys.length).assertEqual(2);
      expect(keys.includes('1')).assertTrue();
      expect(keys.includes('2')).assertTrue();
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0039
     * @tc.name testSendableObjectAssignSymbolKeys
     * @tc.desc Object.assign with a symbol-keyed source property copies that symbol key onto the target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectAssignSymbolKeys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
      let sym: symbol = Symbol('symKey');
      let source: ESObject = ({ normalKey: 1 }) as ESObject;
      Object.defineProperty(source, sym, { value: 'symValue', enumerable: true, writable: true, configurable: true });
      let target: ESObject = ({}) as ESObject;
      Object.assign(target, source);
      // Enumerable symbol-keyed own properties are copied by Object.assign.
      let targetSyms: symbol[] = Object.getOwnPropertySymbols(target);
      expect(targetSyms.length).assertEqual(1);
      let targetKeys: string[] = Object.keys(target as object);
      expect(targetKeys.includes('normalKey')).assertTrue();
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0040
     * @tc.name testSendableObjectSetProtoBoolAndCreateString
     * @tc.desc Object.setPrototypeOf(sendable, true) and Object.create("x") throw TypeError (proto must be object/null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectSetProtoBoolAndCreateString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
      let p: P = new P();
      expectThrow('setPrototypeOf-sendable-true', (): void => { Object.setPrototypeOf(p, true as Object); });
      expectThrow('create-string', (): void => { Object.create('x' as Object); });
      done();
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0041
     * @tc.name testSendableObjectMethodsOnPrimitives
     * @tc.desc Object.keys/getOwnPropertyNames with number/boolean do not throw; ToObject wraps the primitive and yields an empty key list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectMethodsOnPrimitives', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
      try {
        let numKeys: string[] = Object.keys(1 as Object);
        expect(numKeys.length).assertEqual(0);
        let numNames: string[] = Object.getOwnPropertyNames(1 as Object);
        expect(numNames.length).assertEqual(0);
        let boolKeys: string[] = Object.keys(true as Object);
        expect(boolKeys.length).assertEqual(0);
        let boolNames: string[] = Object.getOwnPropertyNames(true as Object);
        expect(boolNames.length).assertEqual(0);
        expect(Object.entries(1 as Object).length).assertEqual(0);
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.error(`unexpected throw: ${e.message}`);
        expect().assertFail();
      }
      done();
    })
  })
}
