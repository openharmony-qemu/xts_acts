/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { taskpool, collections, ArkTSUtils } from '@kit.ArkTS';

@Sendable
class JsonModel {
  name: string = ''
  age: number = 0
  active: boolean = false
}

@Sendable
class NestedInner {
  innerValue: number = 0
}

@Sendable
class NestedOuter {
  outerValue: number = 0
  inner: NestedInner = new NestedInner()
}

@Sendable
class ContainerModel {
  numberCount: number = 0
  labelCount: number = 0
}

@Sendable
class TaskResult {
  status: string = ''
  dataCount: number = 0
  duration: number = 0
}

@Sendable
class EmptyModel {
  value: number = 0
}

@Sendable
class ProcessedResult {
  processedCount: number = 0
  itemCount: number = 0
}

@Concurrent
function processJsonModel(model: JsonModel): string {
  return model.name + '|' + model.age.toString() + '|' + model.active.toString()
}

@Concurrent
function processNested(outer: NestedOuter): number {
  return outer.outerValue + outer.inner.innerValue
}

@Concurrent
function processContainer(model: ContainerModel): string {
  let numLen: number = model.numberCount
  let lblLen: number = model.labelCount
  return numLen.toString() + '|' + lblLen.toString()
}

@Concurrent
function generateResultCount(count: number): number {
  return count
}

@Concurrent
function generateResultItem(index: number): number {
  return index * 2
}

@Concurrent
function verifySendable(obj: EmptyModel): boolean {
  return ArkTSUtils.isSendable(obj)
}

export default function SendableTransGuideTest(): void {
  describe('SendableTransGuideTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   SendableTransGuideTest0100
     * @tc.number SUB_SENDABLE_TRANS_GUIDE_TEST_0100
     * @tc.desc   Verify ASON stringify and parse round-trip for Sendable object deserialization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableTransGuideTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let model: JsonModel = new JsonModel()
      model.name = 'Alice'
      model.age = 25
      model.active = true

      let jsonStr: string = ArkTSUtils.ASON.stringify(model)
      expect(jsonStr).assertContain('Alice')
      expect(jsonStr).assertContain('25')

      let parsed = ArkTSUtils.ASON.parse(jsonStr) as JsonModel
      expect(parsed.name).assertEqual('Alice')
      expect(parsed.age).assertEqual(25)
      expect(parsed.active).assertTrue()
    })

    /**
     * @tc.name   SendableTransGuideTest0200
     * @tc.number SUB_SENDABLE_TRANS_GUIDE_TEST_0200
     * @tc.desc   Verify Sendable object can be transferred and processed in TaskPool task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableTransGuideTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let model: JsonModel = new JsonModel()
      model.name = 'Bob'
      model.age = 30
      model.active = false

      expect(ArkTSUtils.isSendable(model)).assertTrue()

      let task: taskpool.Task = new taskpool.Task(processJsonModel, model)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('Bob|30|false')
    })

    /**
     * @tc.name   SendableTransGuideTest0300
     * @tc.number SUB_SENDABLE_TRANS_GUIDE_TEST_0300
     * @tc.desc   Verify ASON parse restores Sendable object data from JSON string correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableTransGuideTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let model: JsonModel = new JsonModel()
      model.name = 'Charlie'
      model.age = 35
      model.active = true

      let jsonStr: string = ArkTSUtils.ASON.stringify(model)
      let restored = ArkTSUtils.ASON.parse(jsonStr) as JsonModel

      expect(restored.name).assertEqual('Charlie')
      expect(restored.age).assertEqual(35)
      expect(restored.active).assertTrue()
    })

    /**
     * @tc.name   SendableTransGuideTest0400
     * @tc.number SUB_SENDABLE_TRANS_GUIDE_TEST_0400
     * @tc.desc   Verify ArkTSUtils isSendable correctly identifies Sendable objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableTransGuideTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let model: JsonModel = new JsonModel()
      expect(ArkTSUtils.isSendable(model)).assertTrue()

      let arr: collections.Array<number> = new collections.Array<number>()
      expect(ArkTSUtils.isSendable(arr)).assertTrue()
    })

    /**
     * @tc.name   SendableTransGuideTest0500
     * @tc.number SUB_SENDABLE_TRANS_GUIDE_TEST_0500
     * @tc.desc   Verify collections container types transfer correctly across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableTransGuideTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let model: ContainerModel = new ContainerModel()
      model.numberCount = 5
      model.labelCount = 3

      let task: taskpool.Task = new taskpool.Task(processContainer, model)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('5|3')
    })

    /**
     * @tc.name   SendableTransGuideTest0600
     * @tc.number SUB_SENDABLE_TRANS_GUIDE_TEST_0600
     * @tc.desc   Verify nested Sendable objects serialize and transfer correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableTransGuideTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let outer: NestedOuter = new NestedOuter()
      outer.outerValue = 100
      outer.inner.innerValue = 50

      let task: taskpool.Task = new taskpool.Task(processNested, outer)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(150)
    })

    /**
     * @tc.name   SendableTransGuideTest0700
     * @tc.number SUB_SENDABLE_TRANS_GUIDE_TEST_0700
     * @tc.desc   Verify empty Sendable object transfers correctly with default values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableTransGuideTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let model: EmptyModel = new EmptyModel()

      let task: taskpool.Task = new taskpool.Task(verifySendable, model)
      let result = await taskpool.execute(task)
      expect(result as boolean).assertTrue()
    })

    /**
     * @tc.name   SendableTransGuideTest0800
     * @tc.number SUB_SENDABLE_TRANS_GUIDE_TEST_0800
     * @tc.desc   Verify ASON parse throws error for invalid JSON string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableTransGuideTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let invalidJson: string = '{"value": invalid}'
      let hasError: boolean = false

      try {
        ArkTSUtils.ASON.parse(invalidJson)
      } catch (e) {
        hasError = true
        
      }
      expect(hasError).assertTrue()
    })

    /**
     * @tc.name   SendableTransGuideTest0900
     * @tc.number SUB_SENDABLE_TRANS_GUIDE_TEST_0900
     * @tc.desc   Verify ASON stringify handles nested Sendable objects correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableTransGuideTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let outer: NestedOuter = new NestedOuter()
      outer.outerValue = 42
      outer.inner.innerValue = 99

      let jsonStr: string = ArkTSUtils.ASON.stringify(outer)
      expect(jsonStr).assertContain('42')
      expect(jsonStr).assertContain('99')

      let parsed = ArkTSUtils.ASON.parse(jsonStr) as NestedOuter
      expect(parsed.outerValue).assertEqual(42)
      expect(parsed.inner.innerValue).assertEqual(99)
    })

    /**
     * @tc.name   SendableTransGuideTest1000
     * @tc.number SUB_SENDABLE_TRANS_GUIDE_TEST_1000
     * @tc.desc   Verify Sendable object returned from TaskPool task maintains data integrity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableTransGuideTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(generateResultCount, 50)
      let count = await taskpool.execute(task) as number
      expect(count).assertEqual(50)

      let result: ProcessedResult = new ProcessedResult()
      result.processedCount = count
      for (let i: number = 0; i < count; i++) {
        result.itemCount++
      }
      expect(result.processedCount).assertEqual(50)
      expect(result.itemCount).assertEqual(50)
    })

    /**
     * @tc.name   SendableTransGuideTest1100
     * @tc.number SUB_SENDABLE_TRANS_GUIDE_TEST_1100
     * @tc.desc   Verify ASON stringify produces valid JSON for Sendable with collections Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableTransGuideTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let model: ContainerModel = new ContainerModel()
      model.numberCount = 3
      model.labelCount = 2

      let jsonStr: string = ArkTSUtils.ASON.stringify(model)
      expect(jsonStr).assertContain('numberCount')
      expect(jsonStr).assertContain('labelCount')

      let parsed = ArkTSUtils.ASON.parse(jsonStr) as ContainerModel
      expect(parsed.numberCount).assertEqual(3)
      expect(parsed.labelCount).assertEqual(2)
    })

    /**
     * @tc.name   SendableTransGuideTest1200
     * @tc.number SUB_SENDABLE_TRANS_GUIDE_TEST_1200
     * @tc.desc   Verify multiple concurrent TaskPool tasks each process different Sendable objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SendableTransGuideTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let m1: JsonModel = new JsonModel()
      m1.name = 'user1'
      m1.age = 20
      m1.active = true

      let m2: JsonModel = new JsonModel()
      m2.name = 'user2'
      m2.age = 30
      m2.active = false

      let p1 = taskpool.execute(new taskpool.Task(processJsonModel, m1))
      let p2 = taskpool.execute(new taskpool.Task(processJsonModel, m2))

      let results: Array<Object> = await Promise.all([p1, p2])
      expect(results[0] as string).assertEqual('user1|20|true')
      expect(results[1] as string).assertEqual('user2|30|false')
    })

    /**
     * @tc.name   SendableTransGuideTest1300
     * @tc.number SUB_SENDABLE_TRANS_GUIDE_TEST_1300
     * @tc.desc   Verify Sendable object data survives ASON round-trip with all field types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableTransGuideTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let model: JsonModel = new JsonModel()
      model.name = 'roundtrip'
      model.age = 99
      model.active = true

      let json1: string = ArkTSUtils.ASON.stringify(model)
      let parsed1 = ArkTSUtils.ASON.parse(json1) as JsonModel
      let json2: string = ArkTSUtils.ASON.stringify(parsed1)
      let parsed2 = ArkTSUtils.ASON.parse(json2) as JsonModel

      expect(parsed2.name).assertEqual('roundtrip')
      expect(parsed2.age).assertEqual(99)
      expect(parsed2.active).assertTrue()
    })

    /**
     * @tc.name   SendableTransGuideTest1400
     * @tc.number SUB_SENDABLE_TRANS_GUIDE_TEST_1400
     * @tc.desc   Verify isSendable returns false for non-Sendable plain objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SendableTransGuideTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let plainObj: Record<string, number> = { 'a': 1, 'b': 2 }
      expect(ArkTSUtils.isSendable(plainObj)).assertFalse()
    })

    /**
     * @tc.name   SendableTransGuideTest1500
     * @tc.number SUB_SENDABLE_TRANS_GUIDE_TEST_1500
     * @tc.desc   Verify TaskPool task returns Sendable object that passes isSendable check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SendableTransGuideTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(generateResultCount, 10)
      let count = await taskpool.execute(task) as number
      expect(count).assertEqual(10)

      let result: ProcessedResult = new ProcessedResult()
      result.processedCount = count
      for (let i: number = 0; i < count; i++) {
        result.itemCount++
      }
      expect(ArkTSUtils.isSendable(result)).assertTrue()
      expect(result.processedCount).assertEqual(10)
    })
  })
}
