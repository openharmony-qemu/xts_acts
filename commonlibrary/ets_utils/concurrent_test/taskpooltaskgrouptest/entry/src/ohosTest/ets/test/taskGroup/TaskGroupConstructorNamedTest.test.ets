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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
import taskpool from '@ohos.taskpool';
import { ArkTSUtils } from '@kit.ArkTS';
import { sleep } from '../../testability/pages/Utils';
import { ConstructorNamedNestedCounter, constructorNamedNestedInnerFunc } from './TaskGroupConstructorNamedTestInner';

@Concurrent
function constructorNamedAddFunc(arg: number): number {
  return arg * 2
}

@Concurrent
function constructorNamedSimpleFunc(): number {
  return 100
}

@Sendable
class ConstructorNamedCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

@Concurrent
async function constructorNamedCounterFunc(counter: ConstructorNamedCounter): Promise<number> {
  await counter.lock.lockAsync((): void => {
    counter.count++
  })
  return 100
}

@Concurrent
function constructorNamedNestedGroupFunc(counter: ConstructorNamedNestedCounter): string {
  let innerGroup = new taskpool.TaskGroup('nested')
  innerGroup.addTask(constructorNamedNestedInnerFunc, counter)
  taskpool.execute(innerGroup)
  return innerGroup.name
}

@Concurrent
function constructorNamedSendDataFunc(value: number): number {
  taskpool.Task.sendData(value * 10)
  return value
}

export default function TaskGroupConstructorNamedTest(): void {
  describe('TaskGroupConstructorNamedTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest0100
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_0100
     * @tc.desc   Verify constructor('myGroup') creates TaskGroup with matching name (TaskGroup named-constructor dimension; distinct from the name-property readback dimension in TaskGroupNameTest)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorNamedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let taskGroup = new taskpool.TaskGroup('myGroup')
      expect(taskGroup.name).assertEqual('myGroup')
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest0200
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_0200
     * @tc.desc   Verify constructor('') with empty string creates TaskGroup (TaskGroup named-constructor dimension; distinct from the name-property readback dimension in TaskGroupNameTest)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorNamedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let taskGroup = new taskpool.TaskGroup('')
      expect(taskGroup.name).assertEqual('')
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest0300
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_0300
     * @tc.desc   Verify constructor('Chinese group name') with unicode characters creates TaskGroup (TaskGroup named-constructor dimension; distinct from the name-property readback dimension in TaskGroupNameTest)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorNamedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup = new taskpool.TaskGroup('中文组名')
      expect(taskGroup.name).assertEqual('中文组名')
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest0400
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_0400
     * @tc.desc   Verify constructor('😀🎉') with emoji characters creates TaskGroup (TaskGroup named-constructor dimension; distinct from the name-property readback dimension in TaskGroupNameTest)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorNamedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup = new taskpool.TaskGroup('😀🎉')
      expect(taskGroup.name).assertEqual('😀🎉')
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest0500
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_0500
     * @tc.desc   Verify constructor('group_123') with alphanumeric and underscore creates TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorNamedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup = new taskpool.TaskGroup('group_123')
      expect(taskGroup.name).assertEqual('group_123')
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest0600
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_0600
     * @tc.desc   Verify constructor('group-name') with hyphen creates TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorNamedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup = new taskpool.TaskGroup('group-name')
      expect(taskGroup.name).assertEqual('group-name')
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest0700
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_0700
     * @tc.desc   Verify constructor('group.name') with dot creates TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorNamedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup = new taskpool.TaskGroup('group.name')
      expect(taskGroup.name).assertEqual('group.name')
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest0800
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_0800
     * @tc.desc   Verify constructor('a') with single character creates TaskGroup (TaskGroup named-constructor dimension; distinct from the name-property readback dimension in TaskGroupNameTest)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorNamedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup = new taskpool.TaskGroup('a')
      expect(taskGroup.name).assertEqual('a')
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest0900
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_0900
     * @tc.desc   Verify constructor(' ') with space string creates TaskGroup (TaskGroup named-constructor dimension; distinct from the name-property readback dimension in TaskGroupNameTest)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorNamedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup = new taskpool.TaskGroup(' ')
      expect(taskGroup.name).assertEqual(' ')
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest1000
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_1000
     * @tc.desc   Verify constructor('   ') with multiple spaces creates TaskGroup (TaskGroup named-constructor dimension; distinct from the name-property readback dimension in TaskGroupNameTest)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorNamedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup = new taskpool.TaskGroup('   ')
      expect(taskGroup.name).assertEqual('   ')
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest1100
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_1100
     * @tc.desc   Verify constructor(long_string) with 1000+ chars creates TaskGroup (TaskGroup named-constructor dimension; distinct from the name-property readback dimension in TaskGroupNameTest)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorNamedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let longName: string = ''
      for (let i = 0; i < 1000; i++) {
        longName += 'x'
      }
      let taskGroup = new taskpool.TaskGroup(longName)
      expect(taskGroup.name).assertEqual(longName)
      expect(taskGroup.name.length).assertEqual(1000)
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest1200
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_1200
     * @tc.desc   Verify constructor('\\n\\t\\r') with escape chars creates TaskGroup (TaskGroup named-constructor dimension; distinct from the name-property readback dimension in TaskGroupNameTest)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorNamedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let taskGroup = new taskpool.TaskGroup('\n\t\r')
      expect(taskGroup.name).assertEqual('\n\t\r')
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest1300
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_1300
     * @tc.desc   Verify same name creates different TaskGroup instances independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorNamedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let group1 = new taskpool.TaskGroup('same')
      let group2 = new taskpool.TaskGroup('same')
      expect(group1.name).assertEqual('same')
      expect(group2.name).assertEqual('same')
      expect(group1 !== group2).assertTrue()
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest1400
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_1400
     * @tc.desc   Verify constructor('testGroup') then addTask and execute returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorNamedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let taskGroup = new taskpool.TaskGroup('testGroup')
        taskGroup.addTask(constructorNamedAddFunc, 10)
        let results = await taskpool.execute(taskGroup)
        expect(results.length).assertEqual(1)
        expect(results[0] as number).assertEqual(20)
      } catch (error) {
        console.error("TaskGroupConstructorNamedTest1400 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest1500
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_1500
     * @tc.desc   Verify multiple named TaskGroups execute concurrently with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupConstructorNamedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let group1 = new taskpool.TaskGroup('group1')
        group1.addTask(constructorNamedSimpleFunc)
        let group2 = new taskpool.TaskGroup('group2')
        group2.addTask(constructorNamedSimpleFunc)
        let group3 = new taskpool.TaskGroup('group3')
        group3.addTask(constructorNamedSimpleFunc)
        let p1 = taskpool.execute(group1)
        let p2 = taskpool.execute(group2)
        let p3 = taskpool.execute(group3)
        let allResults = await Promise.all([p1, p2, p3])
        expect(allResults.length).assertEqual(3)
      } catch (error) {
        console.error("TaskGroupConstructorNamedTest1500 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest1600
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_1600
     * @tc.desc   Verify constructor with multiple business semantic names creates correct TaskGroups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupConstructorNamedTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let imageGroup = new taskpool.TaskGroup('imageProcessing')
      let dataGroup = new taskpool.TaskGroup('dataFetch')
      expect(imageGroup.name).assertEqual('imageProcessing')
      expect(dataGroup.name).assertEqual('dataFetch')
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest1700
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_1700
     * @tc.desc   Verify named TaskGroup with Sendable shared counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupConstructorNamedTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let counter = new ConstructorNamedCounter()
        let taskGroup = new taskpool.TaskGroup('counterGroup')
        taskGroup.addTask(constructorNamedCounterFunc, counter)
        await taskpool.execute(taskGroup)
        expect(counter.count).assertEqual(1)
      } catch (error) {
        console.error("TaskGroupConstructorNamedTest1700 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest1800
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_1800
     * @tc.desc   Verify 5 named TaskGroups execute one after another (sequential awaits) with the Sendable shared counter reaching exactly 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupConstructorNamedTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let counter = new ConstructorNamedCounter()
        let g0 = new taskpool.TaskGroup('c0')
        g0.addTask(constructorNamedCounterFunc, counter)
        await taskpool.execute(g0)
        let g1 = new taskpool.TaskGroup('c1')
        g1.addTask(constructorNamedCounterFunc, counter)
        await taskpool.execute(g1)
        let g2 = new taskpool.TaskGroup('c2')
        g2.addTask(constructorNamedCounterFunc, counter)
        await taskpool.execute(g2)
        let g3 = new taskpool.TaskGroup('c3')
        g3.addTask(constructorNamedCounterFunc, counter)
        await taskpool.execute(g3)
        let g4 = new taskpool.TaskGroup('c4')
        g4.addTask(constructorNamedCounterFunc, counter)
        await taskpool.execute(g4)
        expect(counter.count).assertEqual(5)
      } catch (error) {
        console.error("TaskGroupConstructorNamedTest1800 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest1900
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_1900
     * @tc.desc   Verify constructor with 10000 chars long name creates TaskGroup (TaskGroup named-constructor dimension; distinct from the name-property readback dimension in TaskGroupNameTest)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TaskGroupConstructorNamedTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let longName: string = ''
      for (let i = 0; i < 10000; i++) {
        longName += 'a'
      }
      let taskGroup = new taskpool.TaskGroup(longName)
      expect(taskGroup.name.length).assertEqual(10000)
    })

    // ========== Constructor Parameter Negative Tests ==========

    /**
     * @tc.name   TaskGroupConstructorNamedTest2000
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_2000
     * @tc.desc   Verify constructor(null) throws error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorNamedTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let threw = false
      let group: taskpool.TaskGroup | null = null
      try {
        group = new taskpool.TaskGroup(null!)
      } catch (error) {
        threw = true
        expect(error.code).assertEqual(401)
      }
      expect(threw).assertTrue()
      expect(group === null).assertTrue()
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest2100
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_2100
     * @tc.desc   Verify constructor(undefined) throws error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorNamedTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let threw = false
      let group: taskpool.TaskGroup | null = null
      let undefBox: Object[] = []
      try {
        group = new taskpool.TaskGroup(undefBox[9] as string)
      } catch (error) {
        threw = true
        expect(error.code).assertEqual(401)
      }
      expect(threw).assertTrue()
      expect(group === null).assertTrue()
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest2200
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_2200
     * @tc.desc   Verify constructor(number) throws error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorNamedTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let badName: Object = 123
      let threw = false
      let group: taskpool.TaskGroup | null = null
      try {
        group = new taskpool.TaskGroup(badName as string)
      } catch (error) {
        threw = true
        expect(error.code).assertEqual(401)
      }
      expect(threw).assertTrue()
      expect(group === null).assertTrue()
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest2300
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_2300
     * @tc.desc   Verify constructor(object) throws error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorNamedTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let badName: Object = new Object()
      let threw = false
      let group: taskpool.TaskGroup | null = null
      try {
        group = new taskpool.TaskGroup(badName as string)
      } catch (error) {
        threw = true
        expect(error.code).assertEqual(401)
      }
      expect(threw).assertTrue()
      expect(group === null).assertTrue()
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest2400
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_2400
     * @tc.desc   Verify assigning group.name takes effect immediately (named-constructor dimension; SDK declares name as writable string property, single expected outcome with exact assertion)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorNamedTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let group = new taskpool.TaskGroup('beforeRename')
      group.name = 'afterRename'
      expect(group.name).assertEqual('afterRename')
    })

    // ========== Scale: massive named instances ==========

    /**
     * @tc.name   TaskGroupConstructorNamedTest2500
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_2500
     * @tc.desc   Verify creating 10000 named TaskGroup instances succeeds with correct names
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorNamedTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let groups: taskpool.TaskGroup[] = []
      for (let i = 0; i < 10000; i++) {
        groups.push(new taskpool.TaskGroup('n' + i))
      }
      expect(groups.length).assertEqual(10000)
      expect(groups[0].name).assertEqual('n0')
      expect(groups[9999].name).assertEqual('n9999')
    })

    // ========== NESTING: named TaskGroup construction ==========

    /**
     * @tc.name   TaskGroupConstructorNamedTest2600
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_2600
     * @tc.desc   Verify @Concurrent function body constructs TaskGroup('nested'), addTask and executes, shared counter equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorNamedTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let counter = new ConstructorNamedNestedCounter()
      let groupName: Object = ''
      try {
        groupName = await taskpool.execute(constructorNamedNestedGroupFunc, counter)
      } catch (error) {
        console.error("TaskGroupConstructorNamedTest2600 failed");
        expect(false).assertFail();
      }
      expect(groupName as string).assertEqual('nested')
      let waited: number = 0
      while (counter.count < 1 && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      expect(counter.count).assertEqual(1)
      done()
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest2700
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_2700
     * @tc.desc   Verify onExecutionSucceeded callback constructs TaskGroup('inner') and executes, inner result correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorNamedTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let innerName: string = ''
      let outerTask = new taskpool.Task(constructorNamedSimpleFunc)
      let innerPromise: Promise<Object> | null = null
      const onSucc: () => void = (): void => {
        let innerGroup = new taskpool.TaskGroup('inner')
        innerName = innerGroup.name
        innerGroup.addTask(constructorNamedAddFunc, 5)
        innerPromise = taskpool.execute(innerGroup)
      }
      outerTask.onExecutionSucceeded(onSucc)
      try {
        await taskpool.execute(outerTask)
      } catch (error) {
        console.error("TaskGroupConstructorNamedTest2700 failed");
        expect(false).assertFail();
      }
      let waited: number = 0
      while (innerPromise === null && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      expect(innerName).assertEqual('inner')
      expect(innerPromise !== null).assertTrue()
      try {
        if (innerPromise !== null) {
          let innerResults: Object = await innerPromise
          expect((innerResults as number[])[0]).assertEqual(10)
        }
      } catch (error) {
        console.error("TaskGroupConstructorNamedTest2700 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest2800
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_2800
     * @tc.desc   Verify onReceiveData callback creates and executes TaskGroup('dataGroup') with correct data accumulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorNamedTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let receivedData: number = 0
      let innerResult: number = 0
      let task = new taskpool.Task(constructorNamedSendDataFunc, 5)
      task.onReceiveData((data: number): void => {
        receivedData = data
        let innerGroup = new taskpool.TaskGroup('dataGroup')
        innerGroup.addTask(constructorNamedAddFunc, 11)
        taskpool.execute(innerGroup).then((res: Object): void => {
          innerResult = (res as number[])[0]
        }, (e: Object): void => {
          console.info('TaskGroupConstructorNamedTest2800 catch: ' + String(e))
        })
      })
      try {
        await taskpool.execute(task)
      } catch (error) {
        console.error("TaskGroupConstructorNamedTest2800 failed");
        expect(false).assertFail();
      }
      let waited: number = 0
      while ((receivedData !== 50 || innerResult !== 22) && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      expect(receivedData).assertEqual(50)
      expect(innerResult).assertEqual(22)
      done()
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest2900
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_2900
     * @tc.desc   Verify execute(group).then creates and executes TaskGroup('thenInner') with correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorNamedTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let thenRan: boolean = false
      let innerPromise: Promise<Object> | null = null
      let outerGroup = new taskpool.TaskGroup('thenOuter')
      outerGroup.addTask(constructorNamedSimpleFunc)
      taskpool.execute(outerGroup).then((res: Object): void => {
        thenRan = true
        let innerGroup = new taskpool.TaskGroup('thenInner')
        innerGroup.addTask(constructorNamedAddFunc, 21)
        innerPromise = taskpool.execute(innerGroup)
      }, (e: Object): void => {
        console.info('TaskGroupConstructorNamedTest2900 catch: ' + String(e))
      })
      let waited: number = 0
      while (innerPromise === null && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      expect(thenRan).assertTrue()
      expect(innerPromise !== null).assertTrue()
      try {
        if (innerPromise !== null) {
          let innerResults: Object = await innerPromise
          expect((innerResults as number[])[0]).assertEqual(42)
        }
      } catch (error) {
        console.error("TaskGroupConstructorNamedTest2900 failed");
        expect(false).assertFail();
      }
      done()
    })

    // ========== NESTING: concurrent in-worker named construction with shared counter ==========

    /**
     * @tc.name   TaskGroupConstructorNamedTest3000
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_3000
     * @tc.desc   Verify 3 concurrent tasks each construct named TaskGroup in worker, shared counter equals 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorNamedTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let counter = new ConstructorNamedNestedCounter()
      let p1 = taskpool.execute(constructorNamedNestedGroupFunc, counter)
      let p2 = taskpool.execute(constructorNamedNestedGroupFunc, counter)
      let p3 = taskpool.execute(constructorNamedNestedGroupFunc, counter)
      let results: Object[] = []
      try {
        results = await Promise.all([p1, p2, p3])
      } catch (error) {
        console.error("TaskGroupConstructorNamedTest3000 failed");
        expect(false).assertFail();
      }
      expect(results.length).assertEqual(3)
      for (let i = 0; i < results.length; i++) {
        expect(results[i] as string).assertEqual('nested')
      }
      let waited: number = 0
      while (counter.count < 3 && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      expect(counter.count).assertEqual(3)
      done()
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest3100
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_3100
     * @tc.desc   Verify 5 concurrent tasks each construct named TaskGroup in worker, shared counter equals 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorNamedTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let counter = new ConstructorNamedNestedCounter()
      let promises: Promise<Object>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(taskpool.execute(constructorNamedNestedGroupFunc, counter))
      }
      let results: Object[] = []
      try {
        results = await Promise.all(promises)
      } catch (error) {
        console.error("TaskGroupConstructorNamedTest3100 failed");
        expect(false).assertFail();
      }
      expect(results.length).assertEqual(5)
      for (let i = 0; i < results.length; i++) {
        expect(results[i] as string).assertEqual('nested')
      }
      let waited: number = 0
      while (counter.count < 5 && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      expect(counter.count).assertEqual(5)
      done()
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest3200
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_3200
     * @tc.desc   Verify 10 concurrent tasks each construct named TaskGroup in worker, shared counter equals 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorNamedTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let counter = new ConstructorNamedNestedCounter()
      let promises: Promise<Object>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(taskpool.execute(constructorNamedNestedGroupFunc, counter))
      }
      let results: Object[] = []
      try {
        results = await Promise.all(promises)
      } catch (error) {
        console.error("TaskGroupConstructorNamedTest3200 failed");
        expect(false).assertFail();
      }
      expect(results.length).assertEqual(10)
      for (let i = 0; i < results.length; i++) {
        expect(results[i] as string).assertEqual('nested')
      }
      let waited: number = 0
      while (counter.count < 10 && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      expect(counter.count).assertEqual(10)
      done()
    })

    // ========== Stress: oversized name tiers ==========

    /**
     * @tc.name   TaskGroupConstructorNamedTest3300
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_3300
     * @tc.desc   Verify constructor with 100KB name creates TaskGroup with full length preserved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorNamedTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let longName: string = 'a'.repeat(100000)
      let taskGroup = new taskpool.TaskGroup(longName)
      expect(taskGroup.name.length).assertEqual(100000)
      expect(taskGroup.name).assertEqual(longName)
    })

    /**
     * @tc.name   TaskGroupConstructorNamedTest3400
     * @tc.number SUB_TASKGROUP_CONSTRUCTORNAMED_TEST_3400
     * @tc.desc   Verify constructor with 1MB name creates TaskGroup with full length preserved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupConstructorNamedTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let longName: string = 'a'.repeat(1000000)
      let taskGroup = new taskpool.TaskGroup(longName)
      expect(taskGroup.name.length).assertEqual(1000000)
      expect(taskGroup.name).assertEqual(longName)
    })
  })
}
