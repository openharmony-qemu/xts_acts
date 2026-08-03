/*
 * Copyright (c) 2026 RKH Corp.
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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import {
  EmptySendableClass,
  SinglePropSendableClass,
  MultiPropSendableClass,
  NestedSendableClass,
  MethodSendableClass,
  ChildSendableClass,
  GrandChildSendableClass
} from '../../../workers/sendable'
import Utils from '../utils'

@Concurrent
function createSendableClass(): SinglePropSendableClass {
  return new SinglePropSendableClass()
}

@Concurrent
function modifySendableClass(instance: SinglePropSendableClass): number {
  instance.count_++
  return instance.count_
}

@Concurrent
function returnSendableInstance(): MethodSendableClass {
  const instance = new MethodSendableClass()
  instance.setValue(42)
  return instance
}

@Concurrent
function acceptSendableParam(instance: MethodSendableClass): number {
  return instance.getValue()
}

export default function BuiltinsSendableDecoratorTest(): void {
  describe('BuiltinsSendableDecoratorTest', (): void => {
    /**
     * @tc.name   testSendableDecorator0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_DECORATOR_TEST_0100
     * @tc.desc   Verify @Sendable class with empty properties can be instantiated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableDecorator0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance: EmptySendableClass = new EmptySendableClass()
      expect(instance).assertNotNull()
    })

    /**
     * @tc.name   testSendableDecorator0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_DECORATOR_TEST_0200
     * @tc.desc   Verify @Sendable class with single number property has correct default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableDecorator0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new SinglePropSendableClass()
      expect(instance.count_).assertEqual(0)
    })

    /**
     * @tc.name   testSendableDecorator0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_DECORATOR_TEST_0300
     * @tc.desc   Verify @Sendable class with multiple properties has correct default values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableDecorator0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new MultiPropSendableClass()
      expect(instance.num_).assertEqual(0)
      expect(instance.str_).assertEqual('')
      expect(instance.bool_).assertFalse()
    })

    /**
     * @tc.name   testSendableDecorator0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_DECORATOR_TEST_0400
     * @tc.desc   Verify @Sendable class with nested Sendable property initializes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableDecorator0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new NestedSendableClass()
      expect(instance.inner_.count_).assertEqual(0)
    })

    /**
     * @tc.name   testSendableDecorator0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_DECORATOR_TEST_0500
     * @tc.desc   Verify @Sendable class property read and write works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableDecorator0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new SinglePropSendableClass()
      instance.count_ = 100
      expect(instance.count_).assertEqual(100)
    })

    /**
     * @tc.name   testSendableDecorator0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_DECORATOR_TEST_0600
     * @tc.desc   Verify @Sendable class method call works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableDecorator0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new MethodSendableClass()
      instance.setValue(50)
      expect(instance.getValue()).assertEqual(50)
    })

    /**
     * @tc.name   testSendableDecorator0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_DECORATOR_TEST_0700
     * @tc.desc   Verify @Sendable class method increment works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableDecorator0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new MethodSendableClass()
      instance.setValue(0)
      instance.setValue(instance.getValue() + 1)
      expect(instance.getValue()).assertEqual(1)
    })

    /**
     * @tc.name   testSendableDecorator0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_DECORATOR_TEST_0800
     * @tc.desc   Verify @Sendable class inheritance from Sendable parent works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableDecorator0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new ChildSendableClass()
      expect(instance.baseValue_).assertEqual(10)
      expect(instance.childValue_).assertEqual(20)
    })

    /**
     * @tc.name   testSendableDecorator0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_DECORATOR_TEST_0900
     * @tc.desc   Verify @Sendable class multi-level inheritance works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableDecorator0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new GrandChildSendableClass()
      expect(instance.baseValue_).assertEqual(10)
      expect(instance.childValue_).assertEqual(20)
      expect(instance.grandChildValue_).assertEqual(30)
    })

    /**
     * @tc.name   testSendableDecorator1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_DECORATOR_TEST_1000
     * @tc.desc   Verify TaskPool creates @Sendable class instance correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableDecorator1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const task = new taskpool.Task(createSendableClass)
      const result = await taskpool.execute(task) as SinglePropSendableClass
      expect(result.count_).assertEqual(0)
    })

    /**
     * @tc.name   testSendableDecorator1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_DECORATOR_TEST_1100
     * @tc.desc   Verify TaskPool modifies @Sendable class instance by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableDecorator1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new SinglePropSendableClass()
      const task = new taskpool.Task(modifySendableClass, instance)
      const result = await taskpool.execute(task) as number
      expect(result).assertEqual(1)
      expect(instance.count_).assertEqual(1)
    })

    /**
     * @tc.name   testSendableDecorator1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_DECORATOR_TEST_1200
     * @tc.desc   Verify @Concurrent function returns @Sendable class instance correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableDecorator1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const task = new taskpool.Task(returnSendableInstance)
      const result = await taskpool.execute(task) as MethodSendableClass
      expect(result.getValue()).assertEqual(42)
    })

    /**
     * @tc.name   testSendableDecorator1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_DECORATOR_TEST_1300
     * @tc.desc   Verify @Concurrent function accepts @Sendable class parameter correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableDecorator1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new MethodSendableClass()
      instance.setValue(99)
      const task = new taskpool.Task(acceptSendableParam, instance)
      const result = await taskpool.execute(task) as number
      expect(result).assertEqual(99)
    })

    /**
     * @tc.name   testSendableDecorator1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_DECORATOR_TEST_1400
     * @tc.desc   Verify sequential TaskPool tasks modify @Sendable class correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendableDecorator1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const instance = new SinglePropSendableClass()
      const iterations: number = 10
      for (let i = 0; i < iterations; i++) {
        const task = new taskpool.Task(modifySendableClass, instance)
        await taskpool.execute(task)
      }
      expect(instance.count_).assertEqual(iterations)
    })

    /**
     * @tc.name   testSendableDecorator1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_DECORATOR_TEST_1500
     * @tc.desc   Verify @Sendable class instance reference passing across TaskPool tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableDecorator1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const instance = new SinglePropSendableClass()
      instance.count_ = 5
      const task1 = new taskpool.Task(modifySendableClass, instance)
      const result1 = await taskpool.execute(task1) as number
      expect(result1).assertEqual(6)
      expect(instance.count_).assertEqual(6)
      const task2 = new taskpool.Task(modifySendableClass, instance)
      const result2 = await taskpool.execute(task2) as number
      expect(result2).assertEqual(7)
      expect(instance.count_).assertEqual(7)
    })
  })
}
