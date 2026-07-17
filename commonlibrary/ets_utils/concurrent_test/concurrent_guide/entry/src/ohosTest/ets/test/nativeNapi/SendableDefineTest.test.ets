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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';

@Sendable
class SendableObject {
  value: number = 0
  name: string = ''

  constructor(value: number, name: string) {
    this.value = value
    this.name = name
  }

  getValue(): number {
    return this.value
  }

  setValue(v: number): void {
    this.value = v
  }

  getName(): string {
    return this.name
  }

  plusOne(): number {
    this.value = this.value + 1
    return this.value
  }
}

@Sendable
class EmptyConstructorObj {
  value: number = 0
  name: string = 'default'
}

@Concurrent
function modifySendableInWorker(obj: SendableObject, newValue: number): number {
  obj.setValue(newValue)
  return obj.getValue()
}

@Concurrent
function plusOneInWorker(obj: SendableObject): number {
  return obj.plusOne()
}

@Concurrent
function readSendableValue(obj: SendableObject): number {
  return obj.getValue()
}

@Concurrent
function readSendableName(obj: SendableObject): string {
  return obj.getName()
}

export default function SendableDefineTest(): void {
  describe('SendableDefineTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   SendableDefineTest0100
     * @tc.number SUB_SENDABLE_DEFINE_TEST_0100
     * @tc.desc   Verify Sendable class definition with constructor creates valid object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableDefineTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let obj: SendableObject = new SendableObject(42, 'test')
      expect(obj !== undefined).assertTrue()
      expect(obj.value).assertEqual(42)
      expect(obj.name).assertEqual('test')
    })

    /**
     * @tc.name   SendableDefineTest0200
     * @tc.number SUB_SENDABLE_DEFINE_TEST_0200
     * @tc.desc   Verify Sendable class constructor with default empty constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableDefineTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let obj: EmptyConstructorObj = new EmptyConstructorObj()
      expect(obj.value).assertEqual(0)
      expect(obj.name).assertEqual('default')
    })

    /**
     * @tc.name   SendableDefineTest0300
     * @tc.number SUB_SENDABLE_DEFINE_TEST_0300
     * @tc.desc   Verify Sendable object getter method returns correct value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableDefineTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let obj: SendableObject = new SendableObject(100, 'getter')
      expect(obj.getValue()).assertEqual(100)
      expect(obj.getName()).assertEqual('getter')
    })

    /**
     * @tc.name   SendableDefineTest0400
     * @tc.number SUB_SENDABLE_DEFINE_TEST_0400
     * @tc.desc   Verify Sendable object setter method updates value correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableDefineTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let obj: SendableObject = new SendableObject(0, 'setter')
      obj.setValue(999)
      expect(obj.getValue()).assertEqual(999)
      obj.setValue(-1)
      expect(obj.getValue()).assertEqual(-1)
    })

    /**
     * @tc.name   SendableDefineTest0500
     * @tc.number SUB_SENDABLE_DEFINE_TEST_0500
     * @tc.desc   Verify Sendable object method plusOne increments and returns correct value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableDefineTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let obj: SendableObject = new SendableObject(10, 'plusOne')
      let result: number = obj.plusOne()
      expect(result).assertEqual(11)
      expect(obj.getValue()).assertEqual(11)
      let result2: number = obj.plusOne()
      expect(result2).assertEqual(12)
    })

    /**
     * @tc.name   SendableDefineTest0600
     * @tc.number SUB_SENDABLE_DEFINE_TEST_0600
     * @tc.desc   Verify Sendable object created in UI main thread passed to TaskPool and modified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableDefineTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let obj: SendableObject = new SendableObject(0, 'crossThread')
      let result = await taskpool.execute(new taskpool.Task(modifySendableInWorker, obj, 42))
      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   SendableDefineTest0700
     * @tc.number SUB_SENDABLE_DEFINE_TEST_0700
     * @tc.desc   Verify Sendable object reference passing across threads maintains data consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableDefineTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let obj1: SendableObject = new SendableObject(10, 'refPass')
      let r1 = await taskpool.execute(new taskpool.Task(plusOneInWorker, obj1))
      expect(r1 as number).assertEqual(11)
      let obj2: SendableObject = new SendableObject(99, 'refPass')
      let r2 = await taskpool.execute(new taskpool.Task(plusOneInWorker, obj2))
      expect(r2 as number).assertEqual(100)
      let obj3: SendableObject = new SendableObject(-1, 'refPass')
      let r3 = await taskpool.execute(new taskpool.Task(plusOneInWorker, obj3))
      expect(r3 as number).assertEqual(0)
    })

    /**
     * @tc.name   SendableDefineTest0800
     * @tc.number SUB_SENDABLE_DEFINE_TEST_0800
     * @tc.desc   Verify main thread reads Sendable object after TaskPool sub-thread modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableDefineTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let obj: SendableObject = new SendableObject(5, 'readAfterModify')
      await taskpool.execute(new taskpool.Task(modifySendableInWorker, obj, 100))
      let readResult = await taskpool.execute(new taskpool.Task(readSendableValue, obj))
      expect(readResult as number).assertEqual(100)
      let nameResult = await taskpool.execute(new taskpool.Task(readSendableName, obj))
      expect(nameResult as string).assertEqual('readAfterModify')
    })

    /**
     * @tc.name   SendableDefineTest0900
     * @tc.number SUB_SENDABLE_DEFINE_TEST_0900
     * @tc.desc   Verify Sendable object with zero-value constructor parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableDefineTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let obj: SendableObject = new SendableObject(0, '')
      expect(obj.getValue()).assertEqual(0)
      expect(obj.getName()).assertEqual('')
    })

    /**
     * @tc.name   SendableDefineTest1000
     * @tc.number SUB_SENDABLE_DEFINE_TEST_1000
     * @tc.desc   Verify Sendable object with extreme large number parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableDefineTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let obj: SendableObject = new SendableObject(Number.MAX_SAFE_INTEGER, 'maxInt')
      expect(obj.getValue()).assertEqual(Number.MAX_SAFE_INTEGER)
      expect(obj.getName()).assertEqual('maxInt')
    })

    /**
     * @tc.name   SendableDefineTest1100
     * @tc.number SUB_SENDABLE_DEFINE_TEST_1100
     * @tc.desc   Verify Sendable object with extreme small number parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableDefineTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let obj: SendableObject = new SendableObject(Number.MIN_SAFE_INTEGER, 'minInt')
      expect(obj.getValue()).assertEqual(Number.MIN_SAFE_INTEGER)
    })

    /**
     * @tc.name   SendableDefineTest1200
     * @tc.number SUB_SENDABLE_DEFINE_TEST_1200
     * @tc.desc   Verify Sendable object value property set to Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableDefineTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let obj: SendableObject = new SendableObject(0, 'maxValue')
      obj.setValue(Number.MAX_VALUE)
      expect(obj.getValue()).assertEqual(Number.MAX_VALUE)
    })

    /**
     * @tc.name   SendableDefineTest1300
     * @tc.number SUB_SENDABLE_DEFINE_TEST_1300
     * @tc.desc   Verify Sendable object value property set to Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableDefineTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let obj: SendableObject = new SendableObject(0, 'minValue')
      obj.setValue(Number.MIN_VALUE)
      expect(obj.getValue()).assertEqual(Number.MIN_VALUE)
    })

    /**
     * @tc.name   SendableDefineTest1400
     * @tc.number SUB_SENDABLE_DEFINE_TEST_1400
     * @tc.desc   Verify Sendable object with negative value parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableDefineTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let obj: SendableObject = new SendableObject(-999, 'negative')
      expect(obj.getValue()).assertEqual(-999)
      obj.setValue(-1)
      expect(obj.getValue()).assertEqual(-1)
    })

    /**
     * @tc.name   SendableDefineTest1500
     * @tc.number SUB_SENDABLE_DEFINE_TEST_1500
     * @tc.desc   Verify multiple Sendable objects created independently maintain separate state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableDefineTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let obj1: SendableObject = new SendableObject(1, 'obj1')
      let obj2: SendableObject = new SendableObject(2, 'obj2')
      let obj3: SendableObject = new SendableObject(3, 'obj3')
      obj1.setValue(10)
      expect(obj1.getValue()).assertEqual(10)
      expect(obj2.getValue()).assertEqual(2)
      expect(obj3.getValue()).assertEqual(3)
    })

    /**
     * @tc.name   SendableDefineTest1600
     * @tc.number SUB_SENDABLE_DEFINE_TEST_1600
     * @tc.desc   Verify Sendable object with floating point value parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableDefineTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let obj: SendableObject = new SendableObject(3.14159, 'float')
      expect(obj.getValue()).assertEqual(3.14159)
    })

    /**
     * @tc.name   SendableDefineTest1700
     * @tc.number SUB_SENDABLE_DEFINE_TEST_1700
     * @tc.desc   Verify Sendable object cross-thread modification with concurrent read and write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SendableDefineTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let obj1: SendableObject = new SendableObject(0, 'concurrent')
      let r1 = await taskpool.execute(new taskpool.Task(plusOneInWorker, obj1)) as number
      expect(r1).assertEqual(1)
      let obj2: SendableObject = new SendableObject(9, 'concurrent')
      let r2 = await taskpool.execute(new taskpool.Task(plusOneInWorker, obj2)) as number
      expect(r2).assertEqual(10)
    })

    /**
     * @tc.name   SendableDefineTest1800
     * @tc.number SUB_SENDABLE_DEFINE_TEST_1800
     * @tc.desc   Verify Sendable object property direct access and modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableDefineTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let obj: SendableObject = new SendableObject(0, 'directAccess')
      obj.value = 50
      obj.name = 'modified'
      expect(obj.value).assertEqual(50)
      expect(obj.name).assertEqual('modified')
    })
  })
}
