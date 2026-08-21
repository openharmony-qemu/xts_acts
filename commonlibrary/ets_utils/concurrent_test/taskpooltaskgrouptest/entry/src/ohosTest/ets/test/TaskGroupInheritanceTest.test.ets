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

function addTask(a: number, b: number): number {
  'use concurrent'
  return a + b
}

function multiplyTask(a: number, b: number): number {
  'use concurrent'
  return a * b
}

function squareTask(n: number): number {
  'use concurrent'
  return n * n
}

function one(): number {
  'use concurrent'
  return 1
}

class MyTaskGroup extends taskpool.TaskGroup {
  customMethod(): string {
    return 'custom'
  }
}

class NamedTaskGroup extends taskpool.TaskGroup {
  constructor(name: string) {
    super(name)
  }
}

class TaggedTaskGroup extends taskpool.TaskGroup {
  tag: string = 'TaggedTaskGroup'

  constructor(name?: string) {
    super(name)
  }
}

class CountingTaskGroup extends taskpool.TaskGroup {
  taskCount_: number = 0

  // Runtime evidence (2026-08-19): overriding addTask is shadowed by the
  // native instance method and spread calls fail with "cannot Callspread",
  // so counting is done by a wrapper method with explicit-arity forwarding.
  // Only up to two extra args are forwarded (sufficient for the test cases).
  addCountedTask(func: Function, ...args: Object[]): void {
    this.taskCount_++
    if (args.length === 0) {
      this.addTask(func)
    } else if (args.length === 1) {
      this.addTask(func, args[0])
    } else {
      this.addTask(func, args[0], args[1])
    }
  }

  getTaskCount(): number {
    return this.taskCount_
  }
}

class CustomPropTaskGroup extends taskpool.TaskGroup {
  description: string = 'custom task group'
  priority: number = 1

  getDesc(): string {
    return this.description
  }
}

class TrackingTaskGroup extends taskpool.TaskGroup {
  taskNames_: string[] = []

  // Spread through super.addTask triggers "cannot Callspread" at runtime
  // (2026-08-19); forward with explicit arities instead.
  // Only up to two extra args are forwarded (sufficient for the test cases).
  addNamedTask(name: string, func: Function, ...args: Object[]): void {
    this.taskNames_.push(name)
    if (args.length === 0) {
      this.addTask(func)
    } else if (args.length === 1) {
      this.addTask(func, args[0])
    } else {
      this.addTask(func, args[0], args[1])
    }
  }

  getTaskNames(): string[] {
    return this.taskNames_
  }
}

export default function TaskGroupInheritanceTest(): void {
  describe('TaskGroupInheritanceTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {});
    afterEach((): void => {});
    afterAll((): void => {})

    /**
     * @tc.name   TaskGroupInheritanceTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_0100
     * @tc.desc   Verify TaskGroup subclass instance passes instanceof checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myGroup = new MyTaskGroup()

      expect(myGroup instanceof MyTaskGroup).assertTrue()
      expect(myGroup instanceof taskpool.TaskGroup).assertTrue()
    })

    /**
     * @tc.name   TaskGroupInheritanceTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_0200
     * @tc.desc   Verify TaskGroup subclass no-arg constructor creates group with default name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myGroup = new MyTaskGroup()

      expect(myGroup.name).assertEqual('')
    })

    /**
     * @tc.name   TaskGroupInheritanceTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_0300
     * @tc.desc   Verify TaskGroup subclass with name constructor inherits name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myGroup = new NamedTaskGroup('my_group')

      expect(myGroup.name).assertEqual('my_group')
    })

    /**
     * @tc.name   TaskGroupInheritanceTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_0400
     * @tc.desc   Verify TaskGroup subclass super() call passes name and keeps own property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myGroup = new TaggedTaskGroup('test')

      expect(myGroup.name).assertEqual('test')
      expect(myGroup.tag).assertEqual('TaggedTaskGroup')
    })

    /**
     * @tc.name   TaskGroupInheritanceTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_0500
     * @tc.desc   Verify TaskGroup subclass inherits addTask(func) overload and registers tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let myGroup = new MyTaskGroup()

      expect(myGroup.name).assertEqual('')

      let registered: boolean = false
      try {
        myGroup.addTask(addTask, 1.0, 2.0)
        myGroup.addTask(multiplyTask, 3.0, 4.0)
        registered = true
      } catch (e) {
        expect().assertFail()
      done()
      }
      expect(registered).assertTrue()

      let results = await taskpool.execute(myGroup) as Object[]

      expect(results.length).assertEqual(2)
      expect(String(results[0])).assertEqual(String(3))
      expect(String(results[1])).assertEqual(String(12))
      done()
    })

    /**
     * @tc.name   TaskGroupInheritanceTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_0600
     * @tc.desc   Verify TaskGroup subclass inherits addTask(Task) and executes the task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task = new taskpool.Task(addTask, 5.0, 6.0)
      let myGroup = new MyTaskGroup()
      myGroup.addTask(task)

      try {
        let results = await taskpool.execute(myGroup) as Object[]
      } catch (cleanupError) {
        console.warn(`async await failed: ${cleanupError}`)
      }

      expect(results.length).assertEqual(1)
      expect(String(results[0])).assertEqual(String(11))
      done()
    })

    /**
     * @tc.name   TaskGroupInheritanceTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_0700
     * @tc.desc   Verify TaskGroup subclass extends addTask behavior with a counting wrapper method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupInheritanceTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let myGroup = new CountingTaskGroup()
      myGroup.addCountedTask(one)
      myGroup.addCountedTask(one)

      expect(myGroup.getTaskCount()).assertEqual(2)

      try {
        let results = await taskpool.execute(myGroup) as Object[]
      } catch (error) {
        console.error(`async await failed: ${error}`)
        expect().assertFail()
      }
      expect(results.length).assertEqual(2)
      expect(String(results[0])).assertEqual(String(1))
      expect(String(results[1])).assertEqual(String(1))
      done()
    })

    /**
     * @tc.name   TaskGroupInheritanceTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_0800
     * @tc.desc   Verify TaskGroup subclass accesses inherited name property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myGroup = new NamedTaskGroup('group_name')

      expect(myGroup.name).assertEqual('group_name')
    })

    /**
     * @tc.name   TaskGroupInheritanceTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_0900
     * @tc.desc   Verify TaskGroup subclass custom properties are accessible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupInheritanceTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myGroup = new CustomPropTaskGroup()

      expect(myGroup.getDesc()).assertEqual('custom task group')
      expect(myGroup.priority).assertEqual(1)
    })

    /**
     * @tc.name   TaskGroupInheritanceTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_1000
     * @tc.desc   Verify TaskGroup subclass new methods add and track named tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupInheritanceTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let myGroup = new TrackingTaskGroup()
      myGroup.addNamedTask('task1', one)
      myGroup.addNamedTask('task2', one)

      expect(myGroup.getTaskNames().length).assertEqual(2)

      try {
        let results = await taskpool.execute(myGroup) as Object[]
      } catch (error) {
        console.error(`async await failed: ${error}`)
        expect().assertFail()
      }
      expect(results.length).assertEqual(2)
      done()
    })

    /**
     * @tc.name   TaskGroupInheritanceTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_1100
     * @tc.desc   Verify inherited TaskGroup executes three tasks with correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let myGroup = new MyTaskGroup()
        myGroup.addTask(addTask, 1.0, 2.0)
        myGroup.addTask(multiplyTask, 3.0, 4.0)
        myGroup.addTask(squareTask, 5.0)

        let results = await taskpool.execute(myGroup) as Object[]

        expect(results.length).assertEqual(3)
        expect(String(results[0])).assertEqual(String(3))
        expect(String(results[1])).assertEqual(String(12))
        expect(String(results[2])).assertEqual(String(25))
        done()
      } catch (error) {
        console.error(`TaskGroupInheritanceTest1100 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   TaskGroupInheritanceTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_1200
     * @tc.desc   Verify multiple TaskGroup subclasses execute concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let group1 = new MyTaskGroup()
        group1.addTask(addTask, 1.0, 2.0)
        group1.addTask(multiplyTask, 3.0, 4.0)

        let group2 = new MyTaskGroup()
        group2.addTask(squareTask, 5.0)
        group2.addTask(addTask, 10.0, 20.0)

        let results = await Promise.all([
          taskpool.execute(group1),
          taskpool.execute(group2)
        ]) as Object[][]

        expect(results[0].length).assertEqual(2)
        expect(String(results[0][0])).assertEqual(String(3))
        expect(String(results[0][1])).assertEqual(String(12))
        expect(results[1].length).assertEqual(2)
        expect(String(results[1][0])).assertEqual(String(25))
        expect(String(results[1][1])).assertEqual(String(30))
        done()
      } catch (error) {
        console.error(`TaskGroupInheritanceTest1200 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })

    /**
     * @tc.name   TaskGroupInheritanceTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_1300
     * @tc.desc   Verify adding an already executed Task to TaskGroup subclass throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let task = new taskpool.Task(addTask, 1.0, 2.0)
        await taskpool.execute(task)

        let myGroup = new MyTaskGroup()
        let caught: boolean = false
        try {
          myGroup.addTask(task)
          expect().assertFail()
        done()
        } catch (e) {
          caught = true
        }
        expect(caught).assertTrue()
        done()
      } catch (error) {
        console.error(`TaskGroupInheritanceTest1300 failed: ${error}`)
        expect().assertFail()
      done()
      }
    })
  })
}
