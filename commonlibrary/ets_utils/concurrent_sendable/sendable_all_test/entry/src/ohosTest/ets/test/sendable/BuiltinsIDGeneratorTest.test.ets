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
import { collections } from '@kit.ArkTS'
import { ArkTSUtils } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class IDGenerator {
  private counter_: number = 0
  private prefix_: string = ''
  private lock_: ArkTSUtils.locks.AsyncLock

  private generatedIds_: collections.Array<string>


  constructor(prefix: string, lock_: ArkTSUtils.locks.AsyncLock, generatedIds_: collections.Array<string>) {
    this.lock_ = lock_
    this.generatedIds_ = generatedIds_

    this.prefix_ = prefix
  }

  async nextId(): Promise<string> {
    return await this.lock_.lockAsync((): string => {
      this.counter_++
      const id: string = `${this.prefix_}_${this.counter_}`
      this.generatedIds_.push(id)
      return id
    })
  }

  async nextBatch(count: number): Promise<string[]> {
    return await this.lock_.lockAsync((): string[] => {
      const ids: string[] = []
      for (let i = 0; i < count; i++) {
        this.counter_++
        const id: string = `${this.prefix_}_${this.counter_}`
        ids.push(id)
        this.generatedIds_.push(id)
      }
      return ids
    })
  }

  getCounter(): number {
    return this.counter_
  }

  getGeneratedIds(): collections.Array<string> {
    return this.generatedIds_
  }

  getPrefix(): string {
    return this.prefix_
  }
}

@Concurrent
async function generateIdTask(generator: IDGenerator): Promise<void> {
  await generator.nextId()
}

export default function BuiltinsIDGeneratorTest(): void {
  describe('BuiltinsIDGeneratorTest', (): void => {
    let generator: IDGenerator = new IDGenerator('test', new ArkTSUtils.locks.AsyncLock(), new collections.Array<string>())

    beforeEach((): void => {
      generator = new IDGenerator('test', new ArkTSUtils.locks.AsyncLock(), new collections.Array<string>())
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   BuiltinsIDGeneratorTest0100
     * @tc.number SUB_BUILTINS_ID_GENERATOR_TEST_0100
     * @tc.desc   Verify basic ID generation with prefix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsIDGeneratorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const id: string = await generator.nextId()

      expect(id).assertEqual('test_1')
      expect(generator.getCounter()).assertEqual(1)
    })

    /**
     * @tc.name   BuiltinsIDGeneratorTest0200
     * @tc.number SUB_BUILTINS_ID_GENERATOR_TEST_0200
     * @tc.desc   Verify sequential ID generation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsIDGeneratorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const id1: string = await generator.nextId()
      const id2: string = await generator.nextId()
      const id3: string = await generator.nextId()

      expect(id1).assertEqual('test_1')
      expect(id2).assertEqual('test_2')
      expect(id3).assertEqual('test_3')
      expect(generator.getCounter()).assertEqual(3)
    })

    /**
     * @tc.name   BuiltinsIDGeneratorTest0300
     * @tc.number SUB_BUILTINS_ID_GENERATOR_TEST_0300
     * @tc.desc   Verify batch ID generation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsIDGeneratorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const ids: string[] = await generator.nextBatch(5)

      expect(ids.length).assertEqual(5)
      expect(ids[0]).assertEqual('test_1')
      expect(ids[4]).assertEqual('test_5')
      expect(generator.getCounter()).assertEqual(5)
    })

    /**
     * @tc.name   BuiltinsIDGeneratorTest0400
     * @tc.number SUB_BUILTINS_ID_GENERATOR_TEST_0400
     * @tc.desc   Verify generated IDs are stored in history
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsIDGeneratorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await generator.nextId()
      await generator.nextId()

      const history: collections.Array<string> = generator.getGeneratedIds()
      expect(history.length).assertEqual(2)
      expect(history[0]).assertEqual('test_1')
      expect(history[1]).assertEqual('test_2')
    })

    /**
     * @tc.name   BuiltinsIDGeneratorTest0500
     * @tc.number SUB_BUILTINS_ID_GENERATOR_TEST_0500
     * @tc.desc   Verify concurrent ID generation produces unique IDs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsIDGeneratorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(generateIdTask, generator))
      }
      const promises: Promise<Object>[] = tasks.map((t: taskpool.Task): Promise<Object> => taskpool.execute(t))
      await Promise.all(promises)

      expect(generator.getCounter()).assertEqual(10)
    })

    /**
     * @tc.name   BuiltinsIDGeneratorTest0600
     * @tc.number SUB_BUILTINS_ID_GENERATOR_TEST_0600
     * @tc.desc   Verify ID prefix is correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsIDGeneratorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      expect(generator.getPrefix()).assertEqual('test')

      const customGenerator: IDGenerator = new IDGenerator('order', new ArkTSUtils.locks.AsyncLock(), new collections.Array<string>())
      const id: string = await customGenerator.nextId()
      expect(id).assertEqual('order_1')
    })

    /**
     * @tc.name   BuiltinsIDGeneratorTest0700
     * @tc.number SUB_BUILTINS_ID_GENERATOR_TEST_0700
     * @tc.desc   Verify small concurrency 3 ID generation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsIDGeneratorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 3; i++) {
        tasks.push(new taskpool.Task(generateIdTask, generator))
      }
      const promises: Promise<Object>[] = tasks.map((t: taskpool.Task): Promise<Object> => taskpool.execute(t))
      await Promise.all(promises)

      expect(generator.getCounter()).assertEqual(3)
    })

    /**
     * @tc.name   BuiltinsIDGeneratorTest0800
     * @tc.number SUB_BUILTINS_ID_GENERATOR_TEST_0800
     * @tc.desc   Verify small concurrency 5 ID generation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsIDGeneratorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(generateIdTask, generator))
      }
      const promises: Promise<Object>[] = tasks.map((t: taskpool.Task): Promise<Object> => taskpool.execute(t))
      await Promise.all(promises)

      expect(generator.getCounter()).assertEqual(5)
    })

    /**
     * @tc.name   BuiltinsIDGeneratorTest0900
     * @tc.number SUB_BUILTINS_ID_GENERATOR_TEST_0900
     * @tc.desc   Verify small concurrency 10 ID generation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsIDGeneratorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(generateIdTask, generator))
      }
      const promises: Promise<Object>[] = tasks.map((t: taskpool.Task): Promise<Object> => taskpool.execute(t))
      await Promise.all(promises)

      expect(generator.getCounter()).assertEqual(10)
    })

    /**
     * @tc.name   BuiltinsIDGeneratorTest1000
     * @tc.number SUB_BUILTINS_ID_GENERATOR_TEST_1000
     * @tc.desc   Verify batch generation with mixed single and batch calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsIDGeneratorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      await generator.nextId()
      const batch: string[] = await generator.nextBatch(3)
      await generator.nextId()

      expect(generator.getCounter()).assertEqual(5)
      expect(batch[0]).assertEqual('test_2')
      expect(batch[2]).assertEqual('test_4')
    })
  })
}
