/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import {
  BooleanSendable,
  NumberSendable,
  StringSendable,
  BigIntSendable,
  MixedTypeSendable
} from '../../../workers/sendable'
import Utils from '../utils'

@Concurrent
function modifyNumberInTask(instance: NumberSendable): number {
  instance.numValue_++
  return instance.numValue_
}

@Concurrent
function readNumberInTask(instance: NumberSendable): number {
  return instance.numValue_
}

export default function BuiltinsSendableBasicTypeTest(): void {
  describe('BuiltinsSendableBasicTypeTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name   testSendableBasicType0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_BASIC_TYPE_TEST_0100
     * @tc.desc   Verify boolean default value in @Sendable class is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableBasicType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new BooleanSendable()
      expect(instance.boolValue_).assertFalse()
    })

    /**
     * @tc.name   testSendableBasicType0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_BASIC_TYPE_TEST_0200
     * @tc.desc   Verify boolean value modification in @Sendable class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableBasicType0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new BooleanSendable()
      instance.boolValue_ = true
      expect(instance.boolValue_).assertTrue()
      instance.boolValue_ = false
      expect(instance.boolValue_).assertFalse()
    })

    /**
     * @tc.name   testSendableBasicType0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_BASIC_TYPE_TEST_0300
     * @tc.desc   Verify number default value in @Sendable class is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableBasicType0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new NumberSendable()
      expect(instance.numValue_).assertEqual(0)
    })

    /**
     * @tc.name   testSendableBasicType0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_BASIC_TYPE_TEST_0400
     * @tc.desc   Verify number value modification in @Sendable class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableBasicType0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new NumberSendable()
      instance.numValue_ = 42
      expect(instance.numValue_).assertEqual(42)
    })

    /**
     * @tc.name   testSendableBasicType0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_BASIC_TYPE_TEST_0500
     * @tc.desc   Verify number special values in @Sendable class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableBasicType0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new NumberSendable()
      instance.numValue_ = -1
      expect(instance.numValue_).assertEqual(-1)
      instance.numValue_ = 0
      expect(instance.numValue_).assertEqual(0)
      instance.numValue_ = 3.14
      expect(instance.numValue_).assertEqual(3.14)
    })

    /**
     * @tc.name   testSendableBasicType0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_BASIC_TYPE_TEST_0600
     * @tc.desc   Verify string default value in @Sendable class is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableBasicType0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new StringSendable()
      expect(instance.strValue_).assertEqual('')
    })

    /**
     * @tc.name   testSendableBasicType0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_BASIC_TYPE_TEST_0700
     * @tc.desc   Verify string value modification in @Sendable class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableBasicType0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new StringSendable()
      instance.strValue_ = 'hello'
      expect(instance.strValue_).assertEqual('hello')
    })

    /**
     * @tc.name   testSendableBasicType0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_BASIC_TYPE_TEST_0800
     * @tc.desc   Verify bigint default value in @Sendable class is 0n
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableBasicType0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new BigIntSendable()
      expect(instance.bigIntValue_).assertEqual(BigInt(0))
    })

    /**
     * @tc.name   testSendableBasicType0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_BASIC_TYPE_TEST_0900
     * @tc.desc   Verify bigint value modification in @Sendable class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableBasicType0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new BigIntSendable()
      instance.bigIntValue_ = BigInt(9007199254740991)
      expect(instance.bigIntValue_).assertEqual(BigInt(9007199254740991))
    })

    /**
     * @tc.name   testSendableBasicType1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_BASIC_TYPE_TEST_1000
     * @tc.desc   Verify mixed type @Sendable class has correct default values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableBasicType1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new MixedTypeSendable()
      expect(instance.boolVal_).assertFalse()
      expect(instance.numVal_).assertEqual(0)
      expect(instance.strVal_).assertEqual('')
    })

    /**
     * @tc.name   testSendableBasicType1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_BASIC_TYPE_TEST_1100
     * @tc.desc   Verify mixed type @Sendable class value modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableBasicType1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new MixedTypeSendable()
      instance.boolVal_ = true
      instance.numVal_ = 100
      instance.strVal_ = 'test'
      expect(instance.boolVal_).assertTrue()
      expect(instance.numVal_).assertEqual(100)
      expect(instance.strVal_).assertEqual('test')
    })

    /**
     * @tc.name   testSendableBasicType1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_BASIC_TYPE_TEST_1200
     * @tc.desc   Verify TaskPool modifies number Sendable by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableBasicType1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new NumberSendable()
      instance.numValue_ = 10
      const task = new taskpool.Task(modifyNumberInTask, instance)
      const result = await taskpool.execute(task) as number
      expect(result).assertEqual(11)
      expect(instance.numValue_).assertEqual(11)
    })

    /**
     * @tc.name   testSendableBasicType1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_BASIC_TYPE_TEST_1300
     * @tc.desc   Verify TaskPool reads number Sendable correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableBasicType1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new NumberSendable()
      instance.numValue_ = 42
      const task = new taskpool.Task(readNumberInTask, instance)
      const result = await taskpool.execute(task) as number
      expect(result).assertEqual(42)
    })

    /**
     * @tc.name   testSendableBasicType1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_BASIC_TYPE_TEST_1400
     * @tc.desc   Verify sequential TaskPool tasks modify number Sendable correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendableBasicType1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const instance = new NumberSendable()
      const iterations: number = 10
      for (let i = 0; i < iterations; i++) {
        const task = new taskpool.Task(modifyNumberInTask, instance)
        await taskpool.execute(task)
      }
      expect(instance.numValue_).assertEqual(iterations)
    })
  })
}
