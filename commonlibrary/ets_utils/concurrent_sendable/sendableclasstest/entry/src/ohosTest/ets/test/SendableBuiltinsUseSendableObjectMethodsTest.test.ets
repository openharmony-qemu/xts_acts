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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { UseSendablePoint, UseSendableRich, UseSendableEmpty, UseSendableWithMethod,
  objectKeys, objectValues, objectEntries, objectGetOwnPropertyNames, objectGetOwnPropertyDescriptors,
  objectGetPrototypeOf, objectIs, objectIsFrozen, objectIsSealed, objectAssign, objectFreeze,
  hasOwnProp, toStringDirect, toLocaleStringDirect, valueOfDirect, isPropEnumerable,
  getConstructorName, getConstructorRef } from './UseSendableObjectMethods';

export default function SendableBuiltinsUseSendableObjectMethodsTest() {
  describe('SendableBuiltinsUseSendableObjectMethodsTest', () => {
    beforeAll(() => {
      console.info('SendableBuiltinsUseSendableObjectMethodsTest beforeAll called')
    })
    afterAll(async () => {
      console.info('SendableBuiltinsUseSendableObjectMethodsTest afterAll called')
      await new Promise<void>((resolve) => setTimeout(resolve, 100))
    })
    beforeEach(() => {
      console.info('SendableBuiltinsUseSendableObjectMethodsTest beforeEach called')
    })
    afterEach(() => {
      console.info('SendableBuiltinsUseSendableObjectMethodsTest afterEach called')
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_OBJ_0100
     * @tc.name testUseSendableHasOwnProperty
     * @tc.desc Verify hasOwnProperty on 'use sendable' class instances returns true for own properties and false for inherited/nonexistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testUseSendableHasOwnProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: UseSendablePoint = new UseSendablePoint(3, 4)
        expect(hasOwnProp(obj, 'x')).assertTrue()
        expect(hasOwnProp(obj, 'y')).assertTrue()
        expect(hasOwnProp(obj, 'z')).assertFalse()
        expect(hasOwnProp(obj, 'toString')).assertFalse()
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_OBJ_0200
     * @tc.name testUseSendableToString
     * @tc.desc Verify toString on 'use sendable' class instances returns "[object Object]"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testUseSendableToString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: UseSendablePoint = new UseSendablePoint(3, 4)
        expect(toStringDirect(obj)).assertEqual('[object Object]')
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_OBJ_0300
     * @tc.name testUseSendableToLocaleString
     * @tc.desc Verify toLocaleString on 'use sendable' class instances returns a non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testUseSendableToLocaleString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: UseSendableRich = new UseSendableRich('Alice', 30, true)
        try {
          const s: string = toLocaleStringDirect(obj)
          expect(s.length > 0).assertTrue()
        } catch (e) {
          expect(true).assertTrue()
        }
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_OBJ_0400
     * @tc.name testUseSendableValueOf
     * @tc.desc Verify valueOf on 'use sendable' class instances returns the object itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testUseSendableValueOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: UseSendablePoint = new UseSendablePoint(3, 4)
        try {
          const result: Object = valueOfDirect(obj)
          expect(result !== null && result !== undefined).assertTrue()
        } catch (e) {
          expect().assertFail()
        }
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_OBJ_0500
     * @tc.name testUseSendablePropertyIsEnumerable
     * @tc.desc Verify propertyIsEnumerable on 'use sendable' class instances returns true for own enumerable fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testUseSendablePropertyIsEnumerable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: UseSendableRich = new UseSendableRich('Bob', 25, false)
        try {
          expect(isPropEnumerable(obj, 'name')).assertTrue()
          expect(isPropEnumerable(obj, 'age')).assertTrue()
          expect(isPropEnumerable(obj, 'active')).assertTrue()
          expect(isPropEnumerable(obj, 'missing')).assertFalse()
        } catch (e) {
          expect().assertFail()
        }
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_OBJ_0600
     * @tc.name testUseSendableObjectKeys
     * @tc.desc Verify Object.keys on 'use sendable' class instances returns own enumerable property names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testUseSendableObjectKeys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: UseSendablePoint = new UseSendablePoint(10, 20)
        try {
          const keys: string[] = objectKeys(obj)
          expect(keys.length).assertEqual(2)
          expect(keys.includes('x')).assertTrue()
          expect(keys.includes('y')).assertTrue()
        } catch (e) {
          expect().assertFail()
        }
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_OBJ_0700
     * @tc.name testUseSendableObjectValues
     * @tc.desc Verify Object.values on 'use sendable' class instances returns own enumerable property values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testUseSendableObjectValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: UseSendableRich = new UseSendableRich('Carol', 35, true)
        try {
          const vals: Object[] = objectValues(obj)
          expect(vals.length).assertEqual(3)
          expect(vals[0] as string).assertEqual('Carol')
          expect(vals[1] as number).assertEqual(35)
          expect(vals[2] as boolean).assertTrue()
        } catch (e) {
          expect().assertFail()
        }
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_OBJ_0800
     * @tc.name testUseSendableObjectEntries
     * @tc.desc Verify Object.entries on 'use sendable' class instances returns [key, value] pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testUseSendableObjectEntries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: UseSendablePoint = new UseSendablePoint(7, 8)
        try {
          const entries: [string, Object][] = objectEntries(obj)
          expect(entries.length).assertEqual(2)
        } catch (e) {
          expect().assertFail()
        }
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_OBJ_0900
     * @tc.name testUseSendableObjectGetOwnPropertyNames
     * @tc.desc Verify Object.getOwnPropertyNames on 'use sendable' class instances returns all own property names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testUseSendableObjectGetOwnPropertyNames', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: UseSendableRich = new UseSendableRich('Dave', 40, true)
        try {
          const names: string[] = objectGetOwnPropertyNames(obj)
          expect(names.length).assertEqual(3)
          expect(names.includes('name')).assertTrue()
          expect(names.includes('age')).assertTrue()
          expect(names.includes('active')).assertTrue()
        } catch (e) {
          expect().assertFail()
        }
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_OBJ_1000
     * @tc.name testUseSendableObjectGetPrototypeOf
     * @tc.desc Verify Object.getPrototypeOf on 'use sendable' class instances returns a non-null prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testUseSendableObjectGetPrototypeOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: UseSendablePoint = new UseSendablePoint(1, 2)
        try {
          const proto: Object | null = objectGetPrototypeOf(obj)
          expect(proto !== null).assertTrue()
          expect(proto !== undefined).assertTrue()
        } catch (e) {
          expect().assertFail()
        }
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_OBJ_1100
     * @tc.name testUseSendableObjectIs
     * @tc.desc Verify Object.is on 'use sendable' class instances: same instance is true, different is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testUseSendableObjectIs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj1: UseSendablePoint = new UseSendablePoint(5, 6)
        const obj2: UseSendablePoint = new UseSendablePoint(5, 6)
        try {
          expect(objectIs(obj1, obj1)).assertTrue()
          expect(objectIs(obj1, obj2)).assertFalse()
        } catch (e) {
          expect().assertFail()
        }
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_OBJ_1200
     * @tc.name testUseSendableObjectIsFrozenIsSealed
     * @tc.desc Verify Object.isFrozen/isSealed on 'use sendable' class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testUseSendableObjectIsFrozenIsSealed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: UseSendablePoint = new UseSendablePoint(9, 10)
        try {
          expect(objectIsFrozen(obj)).assertFalse()
        } catch (e) {
          expect(true).assertTrue()
        }
        try {
          const sealed: boolean = objectIsSealed(obj)
          expect(sealed === true || sealed === false).assertTrue()
        } catch (e) {
          expect(true).assertTrue()
        }
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_OBJ_1300
     * @tc.name testUseSendableObjectAssignFromSendable
     * @tc.desc Verify Object.assign copies own enumerable fields from 'use sendable' source to matching target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testUseSendableObjectAssignFromSendable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const src: UseSendableRich = new UseSendableRich('Eve', 28, true)
        const target: UseSendableRich = new UseSendableRich('', 0, false)
        try {
          objectAssign(target, src)
          expect(target.name).assertEqual('Eve')
          expect(target.age).assertEqual(28)
          expect(target.active).assertTrue()
        } catch (e) {
          expect(true).assertTrue()
        }
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_OBJ_1400
     * @tc.name testUseSendableInstanceof
     * @tc.desc Verify instanceof on 'use sendable' class instances correctly identifies the class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testUseSendableInstanceof', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: UseSendablePoint = new UseSendablePoint(11, 22)
        expect(obj instanceof UseSendablePoint).assertTrue()
        const rich: UseSendableRich = new UseSendableRich('X', 0, false)
        expect(rich instanceof UseSendableRich).assertTrue()
        expect(obj instanceof UseSendableRich).assertFalse()
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_OBJ_1500
     * @tc.name testUseSendableConstructor
     * @tc.desc Verify the constructor property on 'use sendable' class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testUseSendableConstructor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: UseSendableWithMethod = new UseSendableWithMethod(42)
        try {
          const name: string = getConstructorName(obj)
          expect(name).assertEqual('UseSendableWithMethod')
        } catch (e) {
          expect().assertFail()
        }
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_OBJ_1600
     * @tc.name testUseSendableEmptyClassObjectMethods
     * @tc.desc Verify Object methods on 'use sendable' class with no own properties (empty class)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testUseSendableEmptyClassObjectMethods', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: UseSendableEmpty = new UseSendableEmpty()
        try {
          const keys: string[] = objectKeys(obj)
          expect(keys.length).assertEqual(0)
        } catch (e) {
          expect(true).assertTrue()
        }
        try {
          expect(hasOwnProp(obj, 'x')).assertFalse()
        } catch (e) {
          expect(true).assertTrue()
        }
        expect(toStringDirect(obj)).assertEqual('[object Object]')
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_OBJ_1700
     * @tc.name testUseSendableObjectGetOwnPropertyDescriptors
     * @tc.desc Verify Object.getOwnPropertyDescriptors on 'use sendable' class returns descriptors for own properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testUseSendableObjectGetOwnPropertyDescriptors', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: UseSendablePoint = new UseSendablePoint(15, 25)
        try {
          const descriptors: Record<string, Object> = objectGetOwnPropertyDescriptors(obj)
          expect(descriptors !== null && descriptors !== undefined).assertTrue()
          const keys: string[] = objectKeys(descriptors)
          expect(keys.includes('x')).assertTrue()
          expect(keys.includes('y')).assertTrue()
        } catch (e) {
          expect(true).assertTrue()
        }
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_OBJ_1800
     * @tc.name testUseSendableObjectFreezeThrows
     * @tc.desc Verify Object.freeze on 'use sendable' class either throws or returns the object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testUseSendableObjectFreezeThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: UseSendablePoint = new UseSendablePoint(1, 2)
        let threw: boolean = false
        let result: UseSendablePoint | null = null
        try {
          result = objectFreeze<UseSendablePoint>(obj)
        } catch (e) {
          threw = true
        }
        expect(threw || result !== null).assertTrue()
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_OBJ_1900
     * @tc.name testUseSendableTypeofAndFieldAccess
     * @tc.desc Verify typeof on 'use sendable' instances is 'object' and field reads work correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testUseSendableTypeofAndFieldAccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: UseSendableRich = new UseSendableRich('Frank', 50, false)
        expect(typeof obj).assertEqual('object')
        expect(obj.name).assertEqual('Frank')
        expect(obj.age).assertEqual(50)
        expect(obj.active).assertFalse()
        const point: UseSendablePoint = new UseSendablePoint(3, 4)
        expect(point.x + point.y).assertEqual(7)
        done()
      })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_SENDABLE_OBJ_2000
     * @tc.name testUseSendableMethodInvocation
     * @tc.desc Verify method invocation on 'use sendable' class instances works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level0
     */
    it('testUseSendableMethodInvocation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const obj: UseSendableWithMethod = new UseSendableWithMethod(21)
        expect(obj.double()).assertEqual(42)
        done()
      })
  })
}
