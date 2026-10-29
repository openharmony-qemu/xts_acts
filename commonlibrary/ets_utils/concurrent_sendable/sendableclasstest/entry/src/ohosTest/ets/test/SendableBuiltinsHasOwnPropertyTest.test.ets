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

// NOTE (ArkTS strict mode):
//  - @Sendable instances are expected to inherit Object.prototype.hasOwnProperty.
//    If a direct `obj.hasOwnProperty(...)` call does not compile (the property is
//    not exposed on the @Sendable type), cast via `as ESObject`, e.g.
//    `(obj as ESObject).hasOwnProperty("x")`.
//  - ArkTS strict mode bans `// @ts-ignore` (arkts-strict-typing-required); the
//    dynamic `ESObject` escape hatch is used instead for `.call(...)` invocations
//    (cases 0013/0014).
//  - Empty-string and Unicode property names in @Sendable class declarations
//    (cases 0015/0016) may be rejected by the compiler; if so, skip those cases.

@Sendable
class HasOwnX {
  public x: number = 1
}

@Sendable
class HasOwnProtoMember {
  public x: number = 1
  // A method lives on the class prototype, not as an own property of instances,
  // so hasOwnProperty("inheritedFromProto") must be false.
  public inheritedFromProto(): number {
    return this.x
  }
}

// NOTE: empty-string property name. If ArkTS @Sendable rejects this declaration,
// skip case SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0015.
@Sendable
class EmptyProp {
  '': number = 1
}

// NOTE: Unicode property name. If ArkTS @Sendable rejects this declaration,
// skip case SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0016.
@Sendable
class UnicodeProp {
  '🔑emoji': number = 1
}

export default function SendableBuiltinsHasOwnPropertyTest() {
  describe('SendableBuiltinsHasOwnPropertyTest', () => {
    beforeAll(() => {
      console.info('SendableBuiltinsHasOwnPropertyTest beforeAll called')
    })
    afterAll(async () => {
      console.info('SendableBuiltinsHasOwnPropertyTest afterAll called')
      await new Promise<void>((resolve) => setTimeout(resolve, 100))
    })
    beforeEach(() => {
      console.info('SendableBuiltinsHasOwnPropertyTest beforeEach called')
    })
    afterEach(() => {
      console.info('SendableBuiltinsHasOwnPropertyTest afterEach called')
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0010
     * @tc.name testHasOwnPropertyOwnProperty
     * @tc.desc hasOwnProperty returns true for an own property declared on a @Sendable class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testHasOwnPropertyOwnProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: HasOwnX = new HasOwnX()
        const result: boolean = obj.hasOwnProperty('x')
        expect(result).assertTrue()
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0011
     * @tc.name testHasOwnPropertyNotExists
     * @tc.desc hasOwnProperty returns false for a property name that does not exist on the @Sendable instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testHasOwnPropertyNotExists', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: HasOwnX = new HasOwnX()
        const result: boolean = obj.hasOwnProperty('notExist')
        expect(result).assertFalse()
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0012
     * @tc.name testHasOwnPropertyProtoChain
     * @tc.desc hasOwnProperty returns false for a property that lives on the prototype chain (a method), not as an own property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testHasOwnPropertyProtoChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: HasOwnProtoMember = new HasOwnProtoMember()
        // inheritedFromProto is a method declared on the class prototype.
        const result: boolean = obj.hasOwnProperty('inheritedFromProto')
        expect(result).assertFalse()
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0013
     * @tc.name testHasOwnPropertyCallUndefined
     * @tc.desc hasOwnProperty.call(undefined, "x") throws TypeError because undefined is not object-coercible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testHasOwnPropertyCallUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: HasOwnX = new HasOwnX()
        // ArkTS strict mode bans @ts-ignore; reach the unbound method reference via
        // the ESObject escape hatch and invoke .call(undefined, "x") dynamically.
        const unbound: ESObject = obj.hasOwnProperty
        let threw: boolean = false
        try {
          unbound.call(undefined, 'x')
        } catch (e) {
          threw = true
        }
        expect(threw).assertTrue()
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0014
     * @tc.name testHasOwnPropertyCallNull
     * @tc.desc hasOwnProperty.call(null, "x") throws TypeError because null is not object-coercible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testHasOwnPropertyCallNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: HasOwnX = new HasOwnX()
        const unbound: ESObject = obj.hasOwnProperty
        let threw: boolean = false
        try {
          unbound.call(null, 'x')
        } catch (e) {
          threw = true
        }
        expect(threw).assertTrue()
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0015
     * @tc.name testHasOwnPropertyEmptyString
     * @tc.desc hasOwnProperty("") returns true when the @Sendable instance has an empty-string own property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testHasOwnPropertyEmptyString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        // NOTE: requires @Sendable class EmptyProp with an empty-string property.
        // If that declaration does not compile, skip this case.
        const obj: EmptyProp = new EmptyProp()
        const result: boolean = obj.hasOwnProperty('')
        expect(result).assertTrue()
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0016
     * @tc.name testHasOwnPropertyUnicodeName
     * @tc.desc hasOwnProperty("🔑emoji") returns true when the @Sendable instance has a Unicode own property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testHasOwnPropertyUnicodeName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        // NOTE: requires @Sendable class UnicodeProp with a Unicode property name.
        // If that declaration does not compile, skip this case.
        const obj: UnicodeProp = new UnicodeProp()
        const result: boolean = obj.hasOwnProperty('🔑emoji')
        expect(result).assertTrue()
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0017
     * @tc.name testHasOwnPropertyLongName
     * @tc.desc hasOwnProperty returns false for a 256-character property name that does not exist on the @Sendable instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testHasOwnPropertyLongName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: HasOwnX = new HasOwnX()
        let longName: string = ''
        for (let i = 0; i < 256; i++) {
          longName = longName + 'p'
        }
        expect(longName.length).assertEqual(256)
        const result: boolean = obj.hasOwnProperty(longName)
        expect(result).assertFalse()
        done()
      })
  })
}
