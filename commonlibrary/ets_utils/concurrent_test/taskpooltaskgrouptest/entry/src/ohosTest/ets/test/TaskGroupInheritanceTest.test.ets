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

class MyTaskGroup extends taskpool.TaskGroup {
  taskCount_: number = 0

  addTaskAndCount(func: Function, ...args: Object[]): void {
    this.taskCount_++
    this.addTask(func, ...args)
  }

  getTaskCount(): number {
    return this.taskCount_
  }
}

class NamedTaskGroup extends taskpool.TaskGroup {
  groupName_: string = ''

  constructor(name: string) {
    super()
    this.groupName_ = name
  }

  getGroupName(): string {
    return this.groupName_
  }
}

class ValidatedTaskGroup extends taskpool.TaskGroup {
  maxTasks_: number = 3
}

class AggregatingTaskGroup extends taskpool.TaskGroup {
  expectedCount_: number = 0

  addTaskAndCount(func: Function, ...args: Object[]): void {
    this.expectedCount_++
    this.addTask(func, ...args)
  }

  getExpectedCount(): number {
    return this.expectedCount_
  }
}

class PriorityTaskGroup extends taskpool.TaskGroup {
  priority_: taskpool.Priority = taskpool.Priority.MEDIUM

  setPriority(p: taskpool.Priority): void {
    this.priority_ = p
  }

  getPriority(): taskpool.Priority {
    return this.priority_
  }
}

class CountingTaskGroup extends taskpool.TaskGroup {
  taskCount_: number = 0

  addTaskWithCount(func: Function, ...args: Object[]): void {
    this.taskCount_++
    this.addTask(func, ...args)
  }

  getTaskCount(): number {
    return this.taskCount_
  }
}

export default function TaskGroupInheritanceTest(): void {
  // TaskPool TaskGroup.execute() returns Object[]. Each element is typed as
  // Object, so we use String() conversion for value comparison rather than
  // direct numeric equality (expect(results[0] as number).assertEqual(3)),
  // which is less robust across ArkTS runtime type variations.
  describe('TaskGroupInheritanceTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {});
    afterEach((): void => {});
    afterAll((): void => {})

    /**
     * @tc.name   TaskGroupInheritanceTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_0100
     * @tc.desc   Verify TaskGroup constructor with no arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let group = new taskpool.TaskGroup()
      group.addTask(addTask, 1.0, 2.0)

      let results = await taskpool.execute(group) as Object[]

      expect(results.length).assertEqual(1)
      // TaskGroup.execute returns Object[]; each element is an opaque Object.
      // ArkTS does not allow direct 'as number' narrowing on Object[] elements
      // (Object → number is not a permitted assertion in strict ArkTS), so we
      // compare via String() conversion as a pragmatic workaround.
      expect(String(results[0])).assertEqual(String(3))
    })

    /**
     * @tc.name   TaskGroupInheritanceTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_0200
     * @tc.desc   Verify TaskGroup constructor with multiply task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let group = new taskpool.TaskGroup()
      group.addTask(multiplyTask, 3.0, 4.0)
      let results = await taskpool.execute(group) as Object[]

      expect(results.length).assertEqual(1)
      expect(String(results[0])).assertEqual(String(12))
    })

    /**
     * @tc.name   TaskGroupInheritanceTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_0300
     * @tc.desc   Verify TaskGroup addTask method adds tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let group = new taskpool.TaskGroup()
      group.addTask(addTask, 10.0, 20.0)
      group.addTask(multiplyTask, 3.0, 4.0)

      let results = await taskpool.execute(group) as Object[]

      expect(results.length).assertEqual(2)
      expect(String(results[0])).assertEqual(String(30))
      expect(String(results[1])).assertEqual(String(12))
    })

    /**
     * @tc.name   TaskGroupInheritanceTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_0400
     * @tc.desc   Verify custom TaskGroup subclass with task counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let group = new MyTaskGroup()
      group.addTaskAndCount(addTask, 1.0, 2.0)
      group.addTaskAndCount(multiplyTask, 3.0, 4.0)
      group.addTaskAndCount(squareTask, 5.0)

      expect(group.getTaskCount()).assertEqual(3)

      let results = await taskpool.execute(group) as Object[]

      expect(results.length).assertEqual(3)
      expect(String(results[0])).assertEqual(String(3))
      expect(String(results[1])).assertEqual(String(12))
      expect(String(results[2])).assertEqual(String(25))
    })

    /**
     * @tc.name   TaskGroupInheritanceTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_0500
     * @tc.desc   Verify custom TaskGroup subclass with name property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupInheritanceTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let group = new NamedTaskGroup('test_group')
      group.addTask(addTask, 1.0, 2.0)

      expect(group.getGroupName()).assertEqual('test_group')

      let results = await taskpool.execute(group) as Object[]

      expect(results.length).assertEqual(1)
      expect(String(results[0])).assertEqual(String(3))
    })

    /**
     * @tc.name   TaskGroupInheritanceTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_0600
     * @tc.desc   Verify custom TaskGroup subclass instances with independent counters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let group1 = new MyTaskGroup()
      group1.addTaskAndCount(addTask, 1.0, 2.0)
      expect(group1.taskCount_).assertEqual(1)

      let group2 = new MyTaskGroup()
      group2.addTaskAndCount(addTask, 5.0, 6.0)
      group2.addTaskAndCount(multiplyTask, 2.0, 3.0)
      expect(group2.taskCount_).assertEqual(2)

      let results = await taskpool.execute(group2) as Object[]
      expect(results.length).assertEqual(2)
      expect(String(results[0])).assertEqual(String(11))
      expect(String(results[1])).assertEqual(String(6))
    })

    /**
     * @tc.name   TaskGroupInheritanceTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_0700
     * @tc.desc   Verify custom TaskGroup subclass executes tasks correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupInheritanceTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let group = new ValidatedTaskGroup()
      expect(group.maxTasks_).assertEqual(3)
      group.addTask(addTask, 1.0, 2.0)
      group.addTask(multiplyTask, 3.0, 4.0)
      group.addTask(squareTask, 5.0)

      let results = await taskpool.execute(group) as Object[]

      expect(results.length).assertEqual(3)
      expect(String(results[0])).assertEqual(String(3))
      expect(String(results[1])).assertEqual(String(12))
      expect(String(results[2])).assertEqual(String(25))
    })

    /**
     * @tc.name   TaskGroupInheritanceTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_0800
     * @tc.desc   Verify TaskGroup with multiple tasks of same function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let group = new taskpool.TaskGroup()
      group.addTask(addTask, 1.0, 2.0)
      group.addTask(addTask, 10.0, 20.0)
      group.addTask(addTask, 100.0, 200.0)

      let results = await taskpool.execute(group) as Object[]

      expect(results.length).assertEqual(3)
      expect(String(results[0])).assertEqual(String(3))
      expect(String(results[1])).assertEqual(String(30))
      expect(String(results[2])).assertEqual(String(300))
    })

    /**
     * @tc.name   TaskGroupInheritanceTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_0900
     * @tc.desc   Verify custom TaskGroup subclass with result aggregation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupInheritanceTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let group = new AggregatingTaskGroup()
      group.addTaskAndCount(addTask, 1.0, 2.0)
      group.addTaskAndCount(multiplyTask, 3.0, 4.0)

      expect(group.getExpectedCount()).assertEqual(2)

      let results = await taskpool.execute(group) as Object[]

      expect(results.length).assertEqual(group.getExpectedCount())
    })

    /**
     * @tc.name   TaskGroupInheritanceTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_1000
     * @tc.desc   Verify TaskGroup with single-argument task function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let group = new taskpool.TaskGroup()
      group.addTask(squareTask, 7.0)
      let results = await taskpool.execute(group) as Object[]

      expect(results.length).assertEqual(1)
      expect(String(results[0])).assertEqual(String(49))
    })

    /**
     * @tc.name   TaskGroupInheritanceTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_1100
     * @tc.desc   Verify TaskGroup addTask with Task object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(addTask, 5.0, 6.0)
      let group = new taskpool.TaskGroup()
      group.addTask(task)

      let results = await taskpool.execute(group) as Object[]

      expect(results.length).assertEqual(1)
      expect(String(results[0])).assertEqual(String(11))
    })

    /**
     * @tc.name   TaskGroupInheritanceTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_1200
     * @tc.desc   Verify custom TaskGroup subclass with priority property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupInheritanceTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let group = new PriorityTaskGroup()
      group.setPriority(taskpool.Priority.HIGH)
      group.addTask(addTask, 1.0, 2.0)

      expect(group.getPriority()).assertEqual(taskpool.Priority.HIGH)

      let results = await taskpool.execute(group) as Object[]
      expect(String(results[0])).assertEqual(String(3))
    })

    /**
     * @tc.name   TaskGroupInheritanceTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_1300
     * @tc.desc   Verify multiple TaskGroups execute concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let group1 = new taskpool.TaskGroup()
      group1.addTask(addTask, 1.0, 2.0)
      group1.addTask(multiplyTask, 3.0, 4.0)

      let group2 = new taskpool.TaskGroup()
      group2.addTask(addTask, 10.0, 20.0)
      group2.addTask(squareTask, 5.0)

      let results = await Promise.all([
        taskpool.execute(group1),
        taskpool.execute(group2)
      ]) as Object[][]

      expect(results[0].length).assertEqual(2)
      expect(String(results[0][0])).assertEqual(String(3))
      expect(String(results[0][1])).assertEqual(String(12))

      expect(results[1].length).assertEqual(2)
      expect(String(results[1][0])).assertEqual(String(30))
      expect(String(results[1][1])).assertEqual(String(25))
    })

    /**
     * @tc.name   TaskGroupInheritanceTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_1400
     * @tc.desc   Verify multiple TaskGroups execute concurrently with different task combinations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let group1 = new taskpool.TaskGroup()
      group1.addTask(addTask, 10.0, 20.0)
      group1.addTask(multiplyTask, 3.0, 4.0)

      let group2 = new taskpool.TaskGroup()
      group2.addTask(squareTask, 5.0)
      group2.addTask(addTask, 100.0, 200.0)

      let p1 = taskpool.execute(group1)
      let p2 = taskpool.execute(group2)
      let allResults = await Promise.all([p1, p2])

      let results1 = allResults[0] as Object[]
      let results2 = allResults[1] as Object[]

      expect(results1.length).assertEqual(2)
      expect(results2.length).assertEqual(2)
      expect(String(results1[0])).assertEqual(String(30))
      expect(String(results1[1])).assertEqual(String(12))
      expect(String(results2[0])).assertEqual(String(25))
      expect(String(results2[1])).assertEqual(String(300))
    })

    /**
     * @tc.name   TaskGroupInheritanceTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_1500
     * @tc.desc   Verify TaskGroup with 10 tasks all complete and sum correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupInheritanceTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let group = new taskpool.TaskGroup()

      for (let i = 0; i < 10; i++) {
        group.addTask(addTask, i * 1.0, 1.0)
      }

      let results = await taskpool.execute(group) as Object[]

      expect(results.length).assertEqual(10)
      for (let i = 0; i < 10; i++) {
        expect(String(results[i])).assertEqual(String(i + 1))
      }
    })

    /**
     * @tc.name   TaskGroupInheritanceTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_1600
     * @tc.desc   Verify custom TaskGroup subclass dispatches multiple different functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupInheritanceTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let group = new MyTaskGroup()
      group.addTaskAndCount(addTask, 3.0, 4.0)
      group.addTaskAndCount(multiplyTask, 5.0, 6.0)
      group.addTaskAndCount(squareTask, 7.0)

      expect(group.getTaskCount()).assertEqual(3)

      let results = await taskpool.execute(group) as Object[]

      expect(results.length).assertEqual(3)
      expect(String(results[0])).assertEqual(String(7))
      expect(String(results[1])).assertEqual(String(30))
      expect(String(results[2])).assertEqual(String(49))
    })

    /**
     * @tc.name   TaskGroupInheritanceTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_1700
     * @tc.desc   Verify addTask throws when adding an already executed Task to TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(addTask, 1.0, 2.0)
      await taskpool.execute(task)

      let group = new taskpool.TaskGroup()
      let caught = false
      try {
        group.addTask(task)
        expect().assertFail()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   TaskGroupInheritanceTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_1800
     * @tc.desc   Verify TaskGroup subclass wraps addTask with counting behavior.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupInheritanceTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let group = new CountingTaskGroup()
      group.addTaskWithCount(addTask, 1.0, 2.0)
      group.addTaskWithCount(multiplyTask, 3.0, 4.0)

      expect(group.getTaskCount()).assertEqual(2)

      let results = await taskpool.execute(group) as Object[]

      expect(results.length).assertEqual(2)
      expect(String(results[0])).assertEqual(String(3))
      expect(String(results[1])).assertEqual(String(12))
    })

    /**
     * @tc.name   TaskGroupInheritanceTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_1900
     * @tc.desc   Verify custom TaskGroup subclass instances pass instanceof check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myGroup = new MyTaskGroup()
      let namedGroup = new NamedTaskGroup('grp')
      let countingGroup = new CountingTaskGroup()

      expect(myGroup instanceof taskpool.TaskGroup).assertTrue()
      expect(namedGroup instanceof taskpool.TaskGroup).assertTrue()
      expect(countingGroup instanceof taskpool.TaskGroup).assertTrue()

      // Verify constructor points to the subclass, not the base class
      expect(myGroup.constructor === MyTaskGroup).assertTrue()
      expect(namedGroup.constructor === NamedTaskGroup).assertTrue()
    })

    /**
     * @tc.name   TaskGroupInheritanceTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_2000
     * @tc.desc   Verify system TaskGroup name property with constructor argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let group = new taskpool.TaskGroup('my_named_group')
      group.addTask(addTask, 1.0, 2.0)

      expect(group.name).assertEqual('my_named_group')

      let results = await taskpool.execute(group) as Object[]
      expect(results.length).assertEqual(1)
      expect(String(results[0])).assertEqual(String(3))
    })

    /**
     * @tc.name   TaskGroupInheritanceTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_2100
     * @tc.desc   Verify system TaskGroup name property defaults to empty when no argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupInheritanceTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let group = new taskpool.TaskGroup()
      // Default name is empty string when no name argument is provided
      expect(group.name).assertEqual('')
    })

    /**
     * @tc.name   TaskGroupInheritanceTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_2200
     * @tc.desc   Verify multiple custom TaskGroup subclass instances execute concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let group1 = new MyTaskGroup()
      group1.addTaskAndCount(addTask, 1.0, 2.0)
      group1.addTaskAndCount(multiplyTask, 3.0, 4.0)

      let group2 = new CountingTaskGroup()
      group2.addTaskWithCount(squareTask, 5.0)
      group2.addTaskWithCount(addTask, 10.0, 20.0)

      let p1 = taskpool.execute(group1)
      let p2 = taskpool.execute(group2)
      let allResults = await Promise.all([p1, p2])

      let results1 = allResults[0] as Object[]
      let results2 = allResults[1] as Object[]

      expect(group1.getTaskCount()).assertEqual(2)
      expect(group2.getTaskCount()).assertEqual(2)
      expect(results1.length).assertEqual(2)
      expect(results2.length).assertEqual(2)
      expect(String(results1[0])).assertEqual(String(3))
      expect(String(results1[1])).assertEqual(String(12))
      expect(String(results2[0])).assertEqual(String(25))
      expect(String(results2[1])).assertEqual(String(30))
    })

    /**
     * @tc.name   TaskGroupInheritanceTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASK_GROUP_INHERITANCE_TEST_2300
     * @tc.desc   Verify custom TaskGroup subclass accepts Task object via inherited addTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupInheritanceTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(addTask, 7.0, 8.0)
      let group = new MyTaskGroup()
      group.addTask(task)

      let results = await taskpool.execute(group) as Object[]

      expect(results.length).assertEqual(1)
      expect(String(results[0])).assertEqual(String(15))
    })
  })
}
