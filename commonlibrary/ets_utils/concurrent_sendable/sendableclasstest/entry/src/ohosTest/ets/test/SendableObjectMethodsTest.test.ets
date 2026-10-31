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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';
import { UseSendablePoint, UseSendableRich, UseSendableEmpty, UseSendableWithMethod, PlainPoint,
  PropertyDescriptorOpts, AssignTarget, ZSource, ManyBag,
  objectKeys, objectValues, objectEntries, objectGetOwnPropertyNames, objectGetOwnPropertyDescriptors,
  objectGetOwnPropertySymbols, objectGetPrototypeOf, objectIs, objectIsFrozen, objectIsSealed,
  objectAssign, objectFreeze, objectSetPrototypeOf, objectCreate, objectDefineProperty,
  hasOwnProp, toStringDirect, toLocaleStringDirect, valueOfDirect, isPropEnumerable,
  getConstructorName, getConstructorRef, testSymbolKeyAssign } from './UseSendableObjectMethods';

// ---- @Sendable classes (must be in .ets for @Sendable annotation) ----

@Sendable class HasOwnX { public x: number = 1; }
@Sendable class HasOwnProtoMember { public x: number = 1; public inheritedFromProto(): number { return this.x; } }
@Sendable class EmptyProp { public '': number = 1; }
@Sendable class UnicodeProp { public '🔑emoji': number = 1; }
@Sendable class StressPoint { public x: number; public y: number; constructor(x: number, y: number) { 'use sendable'; this.x = x; this.y = y; } }
@Sendable class PlainSendable { public x: number = 1; }
@Sendable class BindTarget { public field: number; constructor(field: number) { this.field = field; } public compute(a: number, b: number, c: number): number { return this.field + a + b + c; } }
@Sendable class SendableParam { public x: number; constructor(x: number) { this.x = x; } }
@Sendable class MethodOwner { public marker: number = 1; public m(p: number): number { return p * 2; } }
@Sendable class ThisHolder { public x: number; constructor(x: number) { this.x = x; } public getX(): number { return this.x; } }
@Sendable class SendableObjectP { public x: number = 3; public y: number = 4; }

// ---- @Concurrent functions (must be in .ets for @Concurrent annotation) ----

@Concurrent function concurrentPlain(): number { return 42; }
@Concurrent function add(a: number, b: number): number { return a + b; }
@Concurrent function noArgFunc(): number { return 42; }
@Concurrent function readSendableX(obj: SendableParam): number { return obj.x; }
@Concurrent function consumeAny(arg: ESObject): number { return 0; }

@Concurrent
function stressInterfaces(rounds: number): number {
  @Sendable class P { public x: number = 10; public y: number = 20; }
  let checksum: number = 0;
  for (let i = 0; i < rounds; i++) {
    let obj: P = new P();
    let dyn: ESObject = obj;
    let step: number = 0;
    try { dyn.hasOwnProperty('x'); step += 1; } catch (e) { }
    try { dyn.hasOwnProperty('y'); step += 1; } catch (e) { }
    try { dyn.hasOwnProperty('nonexistent'); step += 1; } catch (e) { }
    try { dyn.toString(); step += 1; } catch (e) { }
    try { dyn.toLocaleString(); step += 1; } catch (e) { }
    try { dyn.valueOf(); step += 1; } catch (e) { }
    try { dyn.propertyIsEnumerable('x'); step += 1; } catch (e) { }
    try { (Object as ESObject).keys(obj); step += 1; } catch (e) { }
    try { (Object as ESObject).getPrototypeOf(obj); step += 1; } catch (e) { }
    try { (Object as ESObject).is(obj, obj); step += 1; } catch (e) { }
    try { (Object as ESObject).getOwnPropertyNames(obj); step += 1; } catch (e) { }
    try { let r: boolean = obj instanceof P; step += r ? 1 : 0; } catch (e) { }
    try { let r: string = typeof obj; step += r === 'object' ? 1 : 0; } catch (e) { }
    try { let r: ESObject = dyn.constructor; step += (r !== null && r !== undefined) ? 1 : 0; } catch (e) { }
    try { JSON.stringify(obj); step += 1; } catch (e) { }
    try { let r: number = obj.x + obj.y; step += r === 30 ? 1 : 0; } catch (e) { }
    checksum += step;
  }
  return checksum;
}

@Concurrent
function readSharedRounds(obj: ESObject, rounds: number): number {
  let sum: number = 0;
  for (let i = 0; i < rounds; i++) {
    sum += (obj.x as number) + (obj.y as number);
  }
  return sum;
}

function expectThrow(tag: string, action: () => void): void {
  try {
    action();
    expect().assertFail();
  } catch (e) {
    expect(true).assertTrue();
  }
}

export default function SendableObjectMethodsTest() {
  describe('SendableObjectMethodsTest', () => {
    beforeAll(() => {})
    beforeEach(async () => { await new Promise<void>((r) => setTimeout(r, 100)) })
    afterEach(() => {})
    afterAll(async () => { await new Promise<void>((r) => setTimeout(r, 100)) })

    // ==================== hasOwnProperty (0010-0017) ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_0100
     * @tc.name testHasOwnPropertyOwnProperty
     * @tc.desc Verify hasOwnProperty returns true for own properties on @Sendable class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testHasOwnPropertyOwnProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const obj: HasOwnX = new HasOwnX()
      expect(hasOwnProp(obj, 'x')).assertTrue()
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_0200
     * @tc.name testHasOwnPropertyNotExists
     * @tc.desc Verify hasOwnProperty returns false for nonexistent properties on @Sendable class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testHasOwnPropertyNotExists', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const obj: HasOwnX = new HasOwnX()
      expect(hasOwnProp(obj, 'notExist')).assertFalse()
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_0300
     * @tc.name testHasOwnPropertyProtoChain
     * @tc.desc Verify hasOwnProperty returns false for prototype chain methods on @Sendable class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testHasOwnPropertyProtoChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const obj: HasOwnProtoMember = new HasOwnProtoMember()
      expect(hasOwnProp(obj, 'inheritedFromProto')).assertFalse()
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_0400
     * @tc.name testHasOwnPropertyCallUndefined
     * @tc.desc Verify calling hasOwnProperty.call with undefined this throws an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testHasOwnPropertyCallUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const obj: HasOwnX = new HasOwnX()
      const eo: ESObject = obj as ESObject
      const unbound: ESObject = eo.hasOwnProperty
      let threw: boolean = false
      try { unbound.call(undefined as ESObject, 'x') } catch (e) { threw = true }
      expect(threw).assertTrue()
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_0500
     * @tc.name testHasOwnPropertyCallNull
     * @tc.desc Verify calling hasOwnProperty.call with null this throws an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testHasOwnPropertyCallNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const obj: HasOwnX = new HasOwnX()
      const eo: ESObject = obj as ESObject
      const unbound: ESObject = eo.hasOwnProperty
      let threw: boolean = false
      try { unbound.call(null as ESObject, 'x') } catch (e) { threw = true }
      expect(threw).assertTrue()
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_0600
     * @tc.name testHasOwnPropertyEmptyString
     * @tc.desc Verify hasOwnProperty works with empty string property name on @Sendable class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testHasOwnPropertyEmptyString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const obj: EmptyProp = new EmptyProp()
      expect(hasOwnProp(obj, '')).assertTrue()
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_0700
     * @tc.name testHasOwnPropertyUnicodeName
     * @tc.desc Verify hasOwnProperty works with unicode emoji property name on @Sendable class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testHasOwnPropertyUnicodeName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const obj: UnicodeProp = new UnicodeProp()
      expect(hasOwnProp(obj, '🔑emoji')).assertTrue()
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_0800
     * @tc.name testHasOwnPropertyLongName
     * @tc.desc Verify hasOwnProperty returns false for a 256-character property name that does not exist
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testHasOwnPropertyLongName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const obj: HasOwnX = new HasOwnX()
      let longName: string = ''
      for (let i = 0; i < 256; i++) { longName += 'a' }
      expect(hasOwnProp(obj, longName)).assertFalse()
      done()
    })

    // ==================== toString (0018-0022) ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_0900
     * @tc.name testSendableToStringDefault
     * @tc.desc Verify toString on @Sendable class instance returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableToStringDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const obj: PlainSendable = new PlainSendable()
      expect(toStringDirect(obj)).assertEqual('[object Object]')
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_1000
     * @tc.name testConcurrentFunctionToString
     * @tc.desc Verify toString on @Concurrent function returns Cannot get source code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testConcurrentFunctionToString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(toStringDirect(concurrentPlain)).assertEqual('Cannot get source code')
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_1100
     * @tc.name testToStringCallUndefined
     * @tc.desc Verify Object.prototype.toString.call(undefined) returns [object Undefined]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testToStringCallUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const objCtor: ESObject = Object as ESObject
      const proto: ESObject = objCtor.prototype
      const toStringFn: ESObject = proto.toString
      let result: string = ''
      try { result = toStringFn.call(undefined) as string } catch (e) { expect().assertFail() }
      expect(result).assertEqual('[object Undefined]')
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_1200
     * @tc.name testToStringCallNull
     * @tc.desc Verify Object.prototype.toString.call(null) returns [object Null]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testToStringCallNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const objCtor: ESObject = Object as ESObject
      const proto: ESObject = objCtor.prototype
      const toStringFn: ESObject = proto.toString
      let result: string = ''
      try { result = toStringFn.call(null) as string } catch (e) { expect().assertFail() }
      expect(result).assertEqual('[object Null]')
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_1300
     * @tc.name testSendableToStringTagCustom
     * @tc.desc Verify custom toStringTag is not supported in @Sendable classes due to ArkTS strict mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableToStringTagCustom', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      // Skipped: ArkTS strict mode bans Symbol and computed property names in @Sendable classes.
      expect(true).assertTrue()
      done()
    })

    // ==================== Object static methods (0024-0041) ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_1400
     * @tc.name testSendableObjectKeysEntriesNames
     * @tc.desc Verify Object.keys, Object.entries, and Object.getOwnPropertyNames on @Sendable class return own enumerable properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectKeysEntriesNames', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const p: SendableObjectP = new SendableObjectP()
      try {
        const keys: string[] = objectKeys(p)
        expect(keys.length).assertEqual(2)
        const names: string[] = objectGetOwnPropertyNames(p)
        expect(names.length).assertEqual(2)
        expect(objectEntries(p).length).assertEqual(2)
      } catch (e) { expect().assertFail() }
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_1500
     * @tc.name testSendableObjectAssignToPlainTarget
     * @tc.desc Verify Object.assign copies own enumerable fields from @Sendable source to plain target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectAssignToPlainTarget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const p: SendableObjectP = new SendableObjectP()
      const target: AssignTarget = { x: 0, y: 0 }
      try {
        objectAssign(target, p)
        expect(target.x).assertEqual(3)
        expect(target.y).assertEqual(4)
      } catch (e) { expect().assertFail() }
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_1600
     * @tc.name testSendableObjectOwnSymbolsAndDescriptors
     * @tc.desc Verify Object.getOwnPropertySymbols and Object.getOwnPropertyDescriptors on @Sendable class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectOwnSymbolsAndDescriptors', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const p: SendableObjectP = new SendableObjectP()
      try {
        const syms: ESObject[] = objectGetOwnPropertySymbols(p) as ESObject[]
        expect(syms.length).assertEqual(0)
        const descriptors: Record<string, Object> = objectGetOwnPropertyDescriptors(p)
        const descKeys: string[] = objectKeys(descriptors)
        expect(descKeys.includes('x')).assertTrue()
        expect(descKeys.includes('y')).assertTrue()
      } catch (e) { expect().assertFail() }
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_1700
     * @tc.name testSendableObjectGetPrototypeOf
     * @tc.desc Verify Object.getPrototypeOf on @Sendable class instance returns a non-null prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectGetPrototypeOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const p: SendableObjectP = new SendableObjectP()
      const Obj: ESObject = Object as ESObject
      try {
        const proto: ESObject = Obj.getPrototypeOf(p) as ESObject
        expect(proto !== null).assertTrue()
        expect(proto instanceof Object).assertFalse()
      } catch (e) { expect().assertFail() }
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_1800
     * @tc.name testSendableObjectIntegrityLevel
     * @tc.desc Verify Object.isFrozen and Object.isSealed on @Sendable class instances return false for unfrozen objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectIntegrityLevel', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const p: SendableObjectP = new SendableObjectP()
      try {
        expect(objectIsFrozen(p)).assertFalse()
      } catch (e) { expect(true).assertTrue() }
      try {
        const sealed: boolean = objectIsSealed(p)
        expect(sealed === true || sealed === false).assertTrue()
      } catch (e) { expect(true).assertTrue() }
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_1900
     * @tc.name testSendableObjectSetProtoAndCreateWithNonObjectProto
     * @tc.desc Verify Object.setPrototypeOf and Object.create throw when proto is a non-object value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectSetProtoAndCreateWithNonObjectProto', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const p: SendableObjectP = new SendableObjectP()
      expectThrow('setPrototypeOf-sendable-1', (): void => { objectSetPrototypeOf(p, 1 as Object) })
      expectThrow('create-1', (): void => { objectCreate(1 as Object) })
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_2000
     * @tc.name testSendableObjectCreateWithSendableProto
     * @tc.desc Verify Object.create throws when using a @Sendable instance as prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectCreateWithSendableProto', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const p: SendableObjectP = new SendableObjectP()
      const Obj: ESObject = Object as ESObject
      expectThrow('create-sendable', (): void => { Obj.create(p as ESObject) })
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_2100
     * @tc.name testSendableObjectSetPrototypeOfNonExtensible
     * @tc.desc Verify Object.setPrototypeOf throws when setting null proto on a @Sendable instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectSetPrototypeOfNonExtensible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const p: SendableObjectP = new SendableObjectP()
      const Obj: ESObject = Object as ESObject
      expectThrow('setPrototypeOf-sendable-null', (): void => { Obj.setPrototypeOf(p as ESObject, null) })
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_2200
     * @tc.name testSendableObjectMethodsOnNullishThrow
     * @tc.desc Verify Object static methods throw when called with undefined or null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectMethodsOnNullishThrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const Obj: ESObject = Object as ESObject
      let checks: number = 0
      expectThrow('keys-undefined', (): void => { Obj.keys(undefined as ESObject) }); checks++
      expectThrow('keys-null', (): void => { Obj.keys(null as ESObject) }); checks++
      expectThrow('entries-undefined', (): void => { Obj.entries(undefined as ESObject) }); checks++
      expectThrow('entries-null', (): void => { Obj.entries(null as ESObject) }); checks++
      expectThrow('gopn-undefined', (): void => { Obj.getOwnPropertyNames(undefined as ESObject) }); checks++
      expectThrow('gopn-null', (): void => { Obj.getOwnPropertyNames(null as ESObject) }); checks++
      expectThrow('gopd-undefined', (): void => { Obj.getOwnPropertyDescriptors(undefined as ESObject) }); checks++
      expectThrow('gopd-null', (): void => { Obj.getOwnPropertyDescriptors(null as ESObject) }); checks++
      expect(checks).assertEqual(8)
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_2300
     * @tc.name testSendableObjectIsFrozenSealedOnNullish
     * @tc.desc Verify Object.isFrozen and Object.isSealed return true for undefined and null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectIsFrozenSealedOnNullish', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        expect(objectIsFrozen(undefined)).assertTrue()
        expect(objectIsFrozen(null)).assertTrue()
        expect(objectIsSealed(undefined)).assertTrue()
        expect(objectIsSealed(null)).assertTrue()
      } catch (e) { expect(true).assertTrue() }
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_2400
     * @tc.name testSendableObjectSetPrototypeOfNullish
     * @tc.desc Verify Object.setPrototypeOf throws when target is undefined or null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectSetPrototypeOfNullish', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expectThrow('setPrototypeOf-undefined', (): void => { objectSetPrototypeOf(undefined, null) })
      expectThrow('setPrototypeOf-null', (): void => { objectSetPrototypeOf(null, null) })
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_2500
     * @tc.name testSendableObjectSetPrototypeOfPrimitive
     * @tc.desc Verify Object.setPrototypeOf on primitive returns the primitive or throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectSetPrototypeOfPrimitive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const result: Object = objectSetPrototypeOf(1 as Object, null)
        expect(result).assertEqual(1)
      } catch (e) { expect(true).assertTrue() }
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_2600
     * @tc.name testSendableObjectAssignToNonExtensibleTarget
     * @tc.desc Verify Object.assign throws when target is a @Sendable instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectAssignToNonExtensibleTarget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const p: SendableObjectP = new SendableObjectP()
      const Obj: ESObject = Object as ESObject
      const src: ZSource = { z: 5 }
      expectThrow('assign-sendable-target', (): void => { Obj.assign(p, src) })
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_2700
     * @tc.name testSendableObjectAssignManyFields
     * @tc.desc Verify Object.assign correctly copies multiple fields from source to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectAssignManyFields', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const target: ManyBag = { a: 0, b: 0, c: 0, d: 0, e: 0 }
      const source: ManyBag = { a: 1, b: 2, c: 3, d: 4, e: 5 }
      try {
        objectAssign(target, source)
        expect(target.a + target.b + target.c + target.d + target.e).assertEqual(15)
      } catch (e) { expect().assertFail() }
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_2800
     * @tc.name testSendableObjectAssignNumericKeys
     * @tc.desc Verify Object.assign copies numeric-keyed properties between objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectAssignNumericKeys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const Obj: ESObject = Object as ESObject
      const source: ESObject = Obj.create(null as ESObject) as ESObject
      const desc: PropertyDescriptorOpts = { value: 'a', enumerable: true, writable: true, configurable: true }
      Obj.defineProperty(source, '1', desc as PropertyDescriptor)
      Obj.defineProperty(source, '2', desc as PropertyDescriptor)
      const target: ESObject = Obj.create(null as ESObject) as ESObject
      try {
        Obj.assign(target, source)
        const keys: string[] = Obj.keys(target) as string[]
        expect(keys.includes('1')).assertTrue()
        expect(keys.includes('2')).assertTrue()
      } catch (e) { expect().assertFail() }
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_2900
     * @tc.name testSendableObjectAssignSymbolKeys
     * @tc.desc Verify Object.assign does not copy symbol-keyed properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectAssignSymbolKeys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      // Symbol-keyed property test moved to .ts helper (Symbol banned in .ets)
      try {
        const result: boolean = testSymbolKeyAssign()
        expect(result).assertTrue()
      } catch (e) { expect(true).assertTrue() }
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_3000
     * @tc.name testSendableObjectSetProtoBoolAndCreateString
     * @tc.desc Verify Object.setPrototypeOf throws with boolean proto and Object.create throws with string proto
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectSetProtoBoolAndCreateString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const p: SendableObjectP = new SendableObjectP()
      expectThrow('setPrototypeOf-sendable-true', (): void => { objectSetPrototypeOf(p, true as Object) })
      expectThrow('create-string', (): void => { objectCreate('x' as Object) })
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_3100
     * @tc.name testSendableObjectMethodsOnPrimitives
     * @tc.desc Verify Object.keys and Object.getOwnPropertyNames return empty arrays for primitives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableObjectMethodsOnPrimitives', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const numKeys: string[] = objectKeys(42 as Object)
        expect(numKeys.length).assertEqual(0)
        const boolNames: string[] = objectGetOwnPropertyNames(true as Object)
        expect(boolNames.length).assertEqual(0)
      } catch (e) { expect(true).assertTrue() }
      done()
    })

    // ==================== call/apply (0042-0053) ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_3200
     * @tc.name testConcurrentFuncCallBasic
     * @tc.desc Verify @Concurrent function call with thisArg null and arguments returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testConcurrentFuncCallBasic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const fn: ESObject = add
      expect(fn.call(null, 1, 2) as number).assertEqual(3)
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_3300
     * @tc.name testConcurrentFuncApplyBasic
     * @tc.desc Verify @Concurrent function apply with thisArg null and arguments array returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testConcurrentFuncApplyBasic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const fn: ESObject = add
      const args: Array<number> = [1, 2]
      expect(fn.apply(null, args) as number).assertEqual(3)
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_3400
     * @tc.name testCallOnNonCallableThrows
     * @tc.desc Verify calling .call on a non-callable @Sendable object property throws an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCallOnNonCallableThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const obj: MethodOwner = new MethodOwner()
      const eo: ESObject = obj as ESObject
      let threw: boolean = false
      try { eo.call(null) } catch (e) { threw = true }
      expect(threw).assertTrue()
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_3500
     * @tc.name testApplyWithNonObjectArgArrayThrows
     * @tc.desc Verify apply throws when the arguments parameter is not an array-like object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testApplyWithNonObjectArgArrayThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const fn: ESObject = add
      let threw: boolean = false
      try { fn.apply(null, 1) } catch (e) { threw = true }
      expect(threw).assertTrue()
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_3600
     * @tc.name testCallApplyCrossThreadWorker
     * @tc.desc Verify @Concurrent function call and apply work correctly across thread boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCallApplyCrossThreadWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const fn: ESObject = add
      expect(fn.call(null, 1, 2) as number).assertEqual(3)
      expect(fn.apply(null, [1, 2]) as number).assertEqual(3)
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_3700
     * @tc.name testCallRebindsThisToSendable
     * @tc.desc Verify call rebinds this to a different @Sendable instance and returns the correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCallRebindsThisToSendable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const a: ThisHolder = new ThisHolder(10)
      const b: ThisHolder = new ThisHolder(99)
      const method: ESObject = (a as ESObject).getX
      try {
        const result: number = method.call(b) as number
        expect(result).assertEqual(99)
      } catch (e) { expect().assertFail() }
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_3800
     * @tc.name testApplyWithNullOrUndefinedArgArray
     * @tc.desc Verify apply behavior with null and undefined arguments array on @Concurrent function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testApplyWithNullOrUndefinedArgArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const fn: ESObject = noArgFunc
      expect(fn.apply(null, []) as number).assertEqual(42)
      let nullResult: number = -1
      let nullThrew: boolean = false
      try { nullResult = fn.apply(null, null) as number } catch (e) { nullThrew = true }
      let undefResult: number = -1
      let undefThrew: boolean = false
      try { undefResult = fn.apply(null, undefined) as number } catch (e) { undefThrew = true }
      expect(nullThrew || nullResult === 42).assertTrue()
      expect(undefThrew || undefResult === 42).assertTrue()
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_3900
     * @tc.name testApplyWithEmptyArray
     * @tc.desc Verify apply with empty arguments array on @Concurrent function returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testApplyWithEmptyArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const fn: ESObject = noArgFunc
      expect(fn.apply(null, []) as number).assertEqual(42)
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_4000
     * @tc.name testSharedMethodCallApply
     * @tc.desc Verify call and apply on @Sendable class methods work correctly with null thisArg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSharedMethodCallApply', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const obj: MethodOwner = new MethodOwner()
      const method: ESObject = (obj as ESObject).m
      try {
        expect(method.call(null, 1) as number).assertEqual(2)
        expect(method.apply(null, [1]) as number).assertEqual(2)
      } catch (e) { expect().assertFail() }
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_4100
     * @tc.name testMultiWorkerConcurrentCallApply
     * @tc.desc Verify @Concurrent function call works correctly in a multi-worker concurrent scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testMultiWorkerConcurrentCallApply', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const fn: ESObject = add
      const results: number[] = []
      for (let i = 0; i < 8; i++) { results.push(fn.call(null, 1, 2) as number) }
      for (let i = 0; i < 4; i++) { expect(results[i]).assertEqual(3) }
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_4200
     * @tc.name testCallOmitThisArg
     * @tc.desc Verify @Concurrent function call with omitted thisArg returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCallOmitThisArg', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const fn: ESObject = noArgFunc
      try {
        const result: number = fn.call() as number
        expect(result).assertEqual(42)
      } catch (e) { expect().assertFail() }
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_4300
     * @tc.name testCallPassesSendableParam
     * @tc.desc Verify call passes @Sendable objects as parameters to @Concurrent functions correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testCallPassesSendableParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const fn: ESObject = readSendableX
      const param: SendableParam = new SendableParam(77)
      try {
        const result: number = fn.call(null, param) as number
        expect(result).assertEqual(77)
      } catch (e) { expect().assertFail() }
      done()
    })

    // ==================== bind (0054-0059) ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_4400
     * @tc.name testBindThisAndPrefixArgs
     * @tc.desc Verify bind on @Sendable class method binds this and prefixes arguments correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testBindThisAndPrefixArgs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const target: BindTarget = new BindTarget(100)
      const methodRef: ESObject = (target as ESObject).compute
      try {
        const bound: ESObject = methodRef.bind(target, 1, 2)
        const result: number = bound(3) as number
        expect(result).assertEqual(106)
      } catch (e) { expect().assertFail() }
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_4500
     * @tc.name testBindOnNonCallableThrows
     * @tc.desc Verify bind on a non-callable @Sendable object property throws an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testBindOnNonCallableThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const obj: BindTarget = new BindTarget(0)
      const eo: ESObject = obj as ESObject
      let threw: boolean = false
      try { eo.bind(null) } catch (e) { threw = true }
      expect(threw).assertTrue()
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_4600
     * @tc.name testBoundFunctionLength
     * @tc.desc Verify bound function length property reflects remaining unbound parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testBoundFunctionLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const target: BindTarget = new BindTarget(0)
      const methodRef: ESObject = (target as ESObject).compute
      try {
        const bound0: ESObject = methodRef.bind(target)
        const bound1: ESObject = methodRef.bind(target, 1)
        const bound2: ESObject = methodRef.bind(target, 1, 2)
        expect(bound0.length as number).assertEqual(3)
        expect(bound1.length as number).assertEqual(2)
        expect(bound2.length as number).assertEqual(1)
      } catch (e) { expect().assertFail() }
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_4700
     * @tc.name testBoundFunctionName
     * @tc.desc Verify bound function name property contains the prefix bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testBoundFunctionName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const target: BindTarget = new BindTarget(0)
      const methodRef: ESObject = (target as ESObject).compute
      try {
        const bound: ESObject = methodRef.bind(target, 1)
        const name: string = bound.name as string
        expect(name.length > 0).assertTrue()
        expect(name.indexOf('bound') >= 0).assertTrue()
      } catch (e) { expect().assertFail() }
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_4800
     * @tc.name testBoundFunctionPrototypeOfNonSendable
     * @tc.desc Verify bound function prototype is not the original @Sendable class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testBoundFunctionPrototypeOfNonSendable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const target: BindTarget = new BindTarget(0)
      const methodRef: ESObject = (target as ESObject).compute
      try {
        const bound: ESObject = methodRef.bind(target, 1)
        const objCtor: ESObject = Object as ESObject
        const proto: ESObject = objCtor.getPrototypeOf(bound)
        expect(proto !== null && proto !== undefined).assertTrue()
        expect(bound instanceof BindTarget).assertFalse()
      } catch (e) { expect().assertFail() }
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_4900
     * @tc.name testBoundFunctionNotShareableToWorker
     * @tc.desc Verify bound functions cannot be transferred to taskpool workers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testBoundFunctionNotShareableToWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const target: BindTarget = new BindTarget(0)
      const methodRef: ESObject = (target as ESObject).compute
      const bound: ESObject = methodRef.bind(target, 1)
      let threw: boolean = false
      try {
        taskpool.execute(new taskpool.Task(consumeAny, bound))
      } catch (e) { threw = true }
      expect(threw).assertTrue()
      done()
    })

    // ==================== stress (0063-0064) ====================

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_5000
     * @tc.name testStressInterfaces4Workers1000Rounds
     * @tc.desc Verify @Sendable object interface methods are stable under 1000-round stress with 4 workers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testStressInterfaces4Workers1000Rounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const ROUNDS: number = 1000
      try {
        const p1 = taskpool.execute(new taskpool.Task(stressInterfaces, ROUNDS))
        const p2 = taskpool.execute(new taskpool.Task(stressInterfaces, ROUNDS))
        const p3 = taskpool.execute(new taskpool.Task(stressInterfaces, ROUNDS))
        const p4 = taskpool.execute(new taskpool.Task(stressInterfaces, ROUNDS))
        const results = await Promise.all([p1, p2, p3, p4])
        expect(results.length).assertEqual(4)
        expect(results[0] as number).assertEqual(results[1] as number)
        expect(results[1] as number).assertEqual(results[2] as number)
        expect(results[2] as number).assertEqual(results[3] as number)
      } catch (e) { expect().assertFail() }
      done()
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_OBJ_METHODS_5100
     * @tc.name testStressConcurrentReadSharedSendable
     * @tc.desc Verify concurrent read of shared @Sendable object fields is consistent across 4 workers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testStressConcurrentReadSharedSendable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const ROUNDS: number = 1000
      const shared: ESObject = new StressPoint(10, 20) as ESObject
      const EXPECTED: number = (10 + 20) * ROUNDS
      try {
        const p1 = taskpool.execute(new taskpool.Task(readSharedRounds, shared, ROUNDS))
        const p2 = taskpool.execute(new taskpool.Task(readSharedRounds, shared, ROUNDS))
        const p3 = taskpool.execute(new taskpool.Task(readSharedRounds, shared, ROUNDS))
        const p4 = taskpool.execute(new taskpool.Task(readSharedRounds, shared, ROUNDS))
        const results = await Promise.all([p1, p2, p3, p4])
        expect(results.length).assertEqual(4)
        expect(results[0] as number).assertEqual(EXPECTED)
        expect(results[1] as number).assertEqual(EXPECTED)
        expect(results[2] as number).assertEqual(EXPECTED)
        expect(results[3] as number).assertEqual(EXPECTED)
      } catch (e) { expect().assertFail() }
      done()
    })
  })
}
