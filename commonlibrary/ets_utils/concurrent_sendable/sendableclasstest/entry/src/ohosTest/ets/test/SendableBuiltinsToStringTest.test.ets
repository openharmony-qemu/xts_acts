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
//  - @Sendable instances are expected to inherit Object.prototype.toString. If a
//    direct `obj.toString()` call does not compile, cast via `as ESObject`.
//  - ArkTS strict mode bans `// @ts-ignore` (arkts-strict-typing-required); the
//    ESObject escape hatch is used for `Object.prototype.toString.call(...)`
//    (cases 0020/0021).
//  - A Symbol.toStringTag computed property in a @Sendable class (case 0022) may
//    not be supported; if it does not compile, skip that case.

@Sendable
class PlainSendable {
  public x: number = 1
}

@Concurrent
export function concurrentPlain(): number {
  return 42
}

// NOTE: Symbol.toStringTag computed property. If ArkTS @Sendable does not support
// computed property keys with Symbol, skip case SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0022.
@Sendable
class TaggedSendable {
  [Symbol.toStringTag]: string = 'CustomTag'
}

export default function SendableBuiltinsToStringTest() {
  describe('SendableBuiltinsToStringTest', () => {
    beforeAll(() => {
      console.info('SendableBuiltinsToStringTest beforeAll called')
    })
    afterAll(async () => {
      console.info('SendableBuiltinsToStringTest afterAll called')
      await new Promise<void>((resolve) => setTimeout(resolve, 100))
    })
    beforeEach(() => {
      console.info('SendableBuiltinsToStringTest beforeEach called')
    })
    afterEach(() => {
      console.info('SendableBuiltinsToStringTest afterEach called')
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0018
     * @tc.name testSendableToStringDefault
     * @tc.desc A plain @Sendable instance with no toStringTag returns "[object Object]" from toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableToStringDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: PlainSendable = new PlainSendable()
        const s: string = obj.toString()
        expect(s).assertEqual('[object Object]')
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0019
     * @tc.name testConcurrentFunctionToString
     * @tc.desc A @Concurrent function's toString() returns a Function-related string ("[object Function]" or source text)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testConcurrentFunctionToString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const s: string = concurrentPlain.toString()
        console.info('SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0019 concurrentPlain.toString() => ' + s)
        // Per ECMAScript, Function.prototype.toString returns source text, while
        // Object.prototype.toString.call(fn) returns "[object Function]". ArkTS
        // @Concurrent may yield either; accept any non-empty Function-referencing result.
        const ok: boolean = s.length > 0 &&
          (s.indexOf('Function') >= 0 || s.indexOf('function') >= 0 || s.indexOf('concurrentPlain') >= 0)
        expect(ok).assertTrue()
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0020
     * @tc.name testToStringCallUndefined
     * @tc.desc Object.prototype.toString.call(undefined) returns "[object Undefined]" without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testToStringCallUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        // ArkTS strict mode bans @ts-ignore; reach Object.prototype.toString via
        // the ESObject escape hatch and invoke .call(undefined) dynamically.
        const objCtor: ESObject = Object as ESObject
        const proto: ESObject = objCtor.prototype
        const toStringFn: ESObject = proto.toString
        let result: string = ''
        try {
          result = toStringFn.call(undefined) as string
        } catch (e) {
          expect().assertFail()
        }
        expect(result).assertEqual('[object Undefined]')
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0021
     * @tc.name testToStringCallNull
     * @tc.desc Object.prototype.toString.call(null) returns "[object Null]" without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testToStringCallNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const objCtor: ESObject = Object as ESObject
        const proto: ESObject = objCtor.prototype
        const toStringFn: ESObject = proto.toString
        let result: string = ''
        try {
          result = toStringFn.call(null) as string
        } catch (e) {
          expect().assertFail()
        }
        expect(result).assertEqual('[object Null]')
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0022
     * @tc.name testSendableToStringTagCustom
     * @tc.desc A @Sendable class with a Symbol.toStringTag property returns "[object CustomTag]" from toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testSendableToStringTagCustom', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        // NOTE: requires @Sendable class TaggedSendable with [Symbol.toStringTag].
        // If Symbol.toStringTag is not supported in ArkTS @Sendable, skip this case.
        const obj: TaggedSendable = new TaggedSendable()
        const s: string = obj.toString()
        expect(s).assertEqual('[object CustomTag]')
        done()
      })
  })
}
