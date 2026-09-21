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
import { sleep } from '../../testability/pages/Utils';
import { ErrorEvent, MessageEvents, worker } from '@kit.ArkTS';

import { NameNestedCounter, nameNestedInnerFunc } from './TaskGroupNameTestInner';

interface TaskGroupNameWorkerResult {
  echoName: string
  result: number
}

@Concurrent
function nameSimpleFunc(): number {
  return 100
}

@Concurrent
function nameThrowFunc(): number {
  throw new Error('name test error')
}

@Concurrent
function nameNestedTaskFunc(counter: NameNestedCounter): number {
  let innerTask = new taskpool.Task(nameNestedInnerFunc, counter)
  taskpool.execute(innerTask)
  return 9
}

export default function TaskGroupNameTest(): void {
  describe('TaskGroupNameTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      try {
        await sleep(100)
      } catch (error) {
        console.error('afterAll sleep failed');
      }
    })

    /**
     * @tc.name   TaskGroupNameTest0100
     * @tc.number SUB_TASKGROUP_NAME_TEST_0100
     * @tc.desc   Verify TaskGroup() no-arg constructor name property is a valid string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupNameTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let group = new taskpool.TaskGroup()
      expect(group.name).assertEqual('')
    })

    /**
     * @tc.name   TaskGroupNameTest0200
     * @tc.number SUB_TASKGROUP_NAME_TEST_0200
     * @tc.desc   Verify TaskGroup('myGroup') name property equals 'myGroup' (name-property readback dimension; distinct from the named-constructor dimension in TaskGroupConstructorNamedTest)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupNameTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let group = new taskpool.TaskGroup('myGroup')
      expect(group.name).assertEqual('myGroup')
    })

    /**
     * @tc.name   TaskGroupNameTest0300
     * @tc.number SUB_TASKGROUP_NAME_TEST_0300
     * @tc.desc   Verify TaskGroup('') name property equals empty string (name-property readback dimension; distinct from the named-constructor dimension in TaskGroupConstructorNamedTest)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupNameTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let group = new taskpool.TaskGroup('')
      expect(group.name).assertEqual('')
      expect(group.name.length).assertEqual(0)
    })

    /**
     * @tc.name   TaskGroupNameTest0400
     * @tc.number SUB_TASKGROUP_NAME_TEST_0400
     * @tc.desc   Verify TaskGroup('Chinese group name') name property with Chinese characters (name-property readback dimension; distinct from the named-constructor dimension in TaskGroupConstructorNamedTest)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupNameTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let group = new taskpool.TaskGroup('中文组名')
      expect(group.name).assertEqual('中文组名')
    })

    /**
     * @tc.name   TaskGroupNameTest0500
     * @tc.number SUB_TASKGROUP_NAME_TEST_0500
     * @tc.desc   Verify TaskGroup('😀🎉') name property with emoji characters (name-property readback dimension; distinct from the named-constructor dimension in TaskGroupConstructorNamedTest)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupNameTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let group = new taskpool.TaskGroup('😀🎉')
      expect(group.name).assertEqual('😀🎉')
    })

    /**
     * @tc.name   TaskGroupNameTest0600
     * @tc.number SUB_TASKGROUP_NAME_TEST_0600
     * @tc.desc   Verify TaskGroup('  group name  ') name property preserves spaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupNameTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let group = new taskpool.TaskGroup('  group name  ')
      expect(group.name).assertEqual('  group name  ')
    })

    /**
     * @tc.name   TaskGroupNameTest0700
     * @tc.number SUB_TASKGROUP_NAME_TEST_0700
     * @tc.desc   Verify TaskGroup('group-1_test.name') name property with special characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupNameTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let group = new taskpool.TaskGroup('group-1_test.name')
      expect(group.name).assertEqual('group-1_test.name')
    })

    /**
     * @tc.name   TaskGroupNameTest0800
     * @tc.number SUB_TASKGROUP_NAME_TEST_0800
     * @tc.desc   Verify TaskGroup('\\n\\t\\r') name property with escape characters (name-property readback dimension; distinct from the named-constructor dimension in TaskGroupConstructorNamedTest)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupNameTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let group = new taskpool.TaskGroup('\n\t\r')
      expect(group.name).assertEqual('\n\t\r')
    })

    /**
     * @tc.name   TaskGroupNameTest0900
     * @tc.number SUB_TASKGROUP_NAME_TEST_0900
     * @tc.desc   Verify TaskGroup(longName) name property with 1000 chars string (name-property readback dimension; distinct from the named-constructor dimension in TaskGroupConstructorNamedTest)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupNameTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let longName: string = ''
      for (let i = 0; i < 1000; i++) {
        longName += 'x'
      }
      let group = new taskpool.TaskGroup(longName)
      expect(group.name).assertEqual(longName)
      expect(group.name.length).assertEqual(1000)
    })

    /**
     * @tc.name   TaskGroupNameTest1000
     * @tc.number SUB_TASKGROUP_NAME_TEST_1000
     * @tc.desc   Verify group.name returns consistent reference across multiple reads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupNameTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let group = new taskpool.TaskGroup('test')
      let n1 = group.name
      let n2 = group.name
      expect(n1 === n2).assertTrue()
    })

    /**
     * @tc.name   TaskGroupNameTest1100
     * @tc.number SUB_TASKGROUP_NAME_TEST_1100
     * @tc.desc   Verify group.name.length matches constructor argument length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupNameTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let name1 = 'a'
      let group1 = new taskpool.TaskGroup(name1)
      expect(group1.name.length).assertEqual(1)
      let name2 = 'hello world'
      let group2 = new taskpool.TaskGroup(name2)
      expect(group2.name.length).assertEqual(11)
    })

    /**
     * @tc.name   TaskGroupNameTest1200
     * @tc.number SUB_TASKGROUP_NAME_TEST_1200
     * @tc.desc   Verify group.name.toString() returns correct string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupNameTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let group = new taskpool.TaskGroup('testName')
      expect(group.name).assertEqual('testName')
    })

    /**
     * @tc.name   TaskGroupNameTest1300
     * @tc.number SUB_TASKGROUP_NAME_TEST_1300
     * @tc.desc   Verify multiple reads of name return same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupNameTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let group = new taskpool.TaskGroup('consistent')
      let name1 = group.name
      let name2 = group.name
      let name3 = group.name
      expect(name1).assertEqual('consistent')
      expect(name2).assertEqual('consistent')
      expect(name3).assertEqual('consistent')
      expect(name1 === name2).assertTrue()
      expect(name2 === name3).assertTrue()
    })

    /**
     * @tc.name   TaskGroupNameTest1400
     * @tc.number SUB_TASKGROUP_NAME_TEST_1400
     * @tc.desc   Verify name unchanged after addTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupNameTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let group = new taskpool.TaskGroup('addTaskGroup')
      let nameBefore = group.name
      group.addTask(nameSimpleFunc)
      let nameAfter = group.name
      expect(nameAfter).assertEqual('addTaskGroup')
      expect(nameAfter).assertEqual(nameBefore)
    })

    /**
     * @tc.name   TaskGroupNameTest1500
     * @tc.number SUB_TASKGROUP_NAME_TEST_1500
     * @tc.desc   Verify name unchanged after execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupNameTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let group = new taskpool.TaskGroup('execGroup')
        group.addTask(nameSimpleFunc)
        let nameBefore = group.name
        await taskpool.execute(group)
        let nameAfter = group.name
        expect(nameAfter).assertEqual('execGroup')
        expect(nameAfter).assertEqual(nameBefore)
      } catch (error) {
        console.error('TaskGroupNameTest1500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupNameTest1600
     * @tc.number SUB_TASKGROUP_NAME_TEST_1600
     * @tc.desc   Verify name unchanged after cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupNameTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let group = new taskpool.TaskGroup('cancelGroup')
      group.addTask(nameSimpleFunc)
      let nameBefore = group.name
      let promise = taskpool.execute(group)
      try {
        taskpool.cancel(group)
      } catch (e) {
        console.info(`TaskGroupNameTest.test.ets catch error: ${JSON.stringify(e)}`)
      }
      expect(group.name).assertEqual('cancelGroup')
      expect(group.name).assertEqual(nameBefore)
      try {
        await promise
      } catch (e) {
        console.info(`TaskGroupNameTest.test.ets catch error: ${JSON.stringify(e)}`)
      }
      expect(group.name).assertEqual('cancelGroup')
      done()
    })

    /**
     * @tc.name   TaskGroupNameTest1700
     * @tc.number SUB_TASKGROUP_NAME_TEST_1700
     * @tc.desc   Verify name accessible in Promise.then callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupNameTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let capturedName: string = ''
      let group = new taskpool.TaskGroup('thenGroup')
      group.addTask(nameSimpleFunc)
      let promise = taskpool.execute(group)
      try {
        await promise
      } catch (error) {
        console.error("TaskGroupNameTest1700 failed");
        expect(false).assertFail();
      }
      capturedName = group.name
      expect(capturedName).assertEqual('thenGroup')
      done()
    })

    /**
     * @tc.name   TaskGroupNameTest1800
     * @tc.number SUB_TASKGROUP_NAME_TEST_1800
     * @tc.desc   Verify name accessible in error handling catch block
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupNameTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let errorGroupName: string = ''
      let group = new taskpool.TaskGroup('errorGroup')
      group.addTask(nameThrowFunc)
      try {
        await taskpool.execute(group)
        expect().assertFail()
      } catch (error) {
        errorGroupName = group.name
      }
      expect(errorGroupName).assertEqual('errorGroup')
      done()
    })

    /**
     * @tc.name   TaskGroupNameTest1900
     * @tc.number SUB_TASKGROUP_NAME_TEST_1900
     * @tc.desc   Verify multiple TaskGroups have independent names
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupNameTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let group1 = new taskpool.TaskGroup('g1')
        let group2 = new taskpool.TaskGroup('g2')
        let group3 = new taskpool.TaskGroup('g3')
        group1.addTask(nameSimpleFunc)
        group2.addTask(nameSimpleFunc)
        group3.addTask(nameSimpleFunc)
        let p1 = taskpool.execute(group1)
        let p2 = taskpool.execute(group2)
        let p3 = taskpool.execute(group3)
        await Promise.all([p1, p2, p3])
        expect(group1.name).assertEqual('g1')
        expect(group2.name).assertEqual('g2')
        expect(group3.name).assertEqual('g3')
      } catch (error) {
        console.error("TaskGroupNameTest1900 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupNameTest2000
     * @tc.number SUB_TASKGROUP_NAME_TEST_2000
     * @tc.desc   Verify name can be used as Map key for group management
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupNameTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let groupMap: Map<string, taskpool.TaskGroup> = new Map()
      let imageGroup = new taskpool.TaskGroup('imageProcessing')
      let dataGroup = new taskpool.TaskGroup('dataFetch')
      groupMap.set(imageGroup.name, imageGroup)
      groupMap.set(dataGroup.name, dataGroup)
      expect(groupMap.has('imageProcessing')).assertTrue()
      expect(groupMap.has('dataFetch')).assertTrue()
      let retrievedImage = groupMap.get('imageProcessing')
      expect(retrievedImage !== undefined).assertTrue()
      expect(retrievedImage!.name).assertEqual('imageProcessing')
    })

    /**
     * @tc.name   TaskGroupNameTest2100
     * @tc.number SUB_TASKGROUP_NAME_TEST_2100
     * @tc.desc   Verify reading name 10000 times (stress test)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskGroupNameTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let group = new taskpool.TaskGroup('stressName')
      let lastName: string = ''
      for (let i = 0; i < 10000; i++) {
        lastName = group.name
      }
      expect(lastName).assertEqual('stressName')
    })

    /**
     * @tc.name   TaskGroupNameTest2200
     * @tc.number SUB_TASKGROUP_NAME_TEST_2200
     * @tc.desc   Verify name + string concatenation implicit conversion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupNameTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let group = new taskpool.TaskGroup('test')
      expect(group.name + '').assertEqual('test')
      expect(group.name + 'Group').assertEqual('testGroup')
    })

    /**
     * @tc.name   TaskGroupNameTest2300
     * @tc.number SUB_TASKGROUP_NAME_TEST_2300
     * @tc.desc   Verify TaskGroup(longName) with 10000 chars name property (name-property readback dimension; distinct from the named-constructor dimension in TaskGroupConstructorNamedTest)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TaskGroupNameTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let longName: string = ''
      for (let i = 0; i < 10000; i++) {
        longName += 'a'
      }
      let group = new taskpool.TaskGroup(longName)
      expect(group.name.length).assertEqual(10000)
      expect(group.name).assertEqual(longName)
    })

    /**
     * @tc.name   TaskGroupNameTest2400
     * @tc.number SUB_TASKGROUP_NAME_TEST_2400
     * @tc.desc   Verify name accessible after multiple execute calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupNameTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let group = new taskpool.TaskGroup('multiExec')
        group.addTask(nameSimpleFunc)
        let nameBefore = group.name
        await taskpool.execute(group)
        expect(group.name).assertEqual('multiExec')
        expect(group.name).assertEqual(nameBefore)
      } catch (error) {
        console.error("TaskGroupNameTest2500 failed");
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   TaskGroupNameTest2500
     * @tc.number SUB_TASKGROUP_NAME_TEST_2500
     * @tc.desc   Verify name with single character string (name-property readback dimension; distinct from the named-constructor dimension in TaskGroupConstructorNamedTest)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupNameTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let group = new taskpool.TaskGroup('a')
      expect(group.name).assertEqual('a')
      expect(group.name.length).assertEqual(1)
    })

    /**
     * @tc.name   TaskGroupNameTest2600
     * @tc.number SUB_TASKGROUP_NAME_TEST_2600
     * @tc.desc   Verify name with space string ' ' (name-property readback dimension; distinct from the named-constructor dimension in TaskGroupConstructorNamedTest)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupNameTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let group = new taskpool.TaskGroup(' ')
      expect(group.name).assertEqual(' ')
      expect(group.name.length).assertEqual(1)
    })

    /**
     * @tc.name   TaskGroupNameTest2700
     * @tc.number SUB_TASKGROUP_NAME_TEST_2700
     * @tc.desc   Verify name with multiple spaces string '   ' (name-property readback dimension; distinct from the named-constructor dimension in TaskGroupConstructorNamedTest)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupNameTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let group = new taskpool.TaskGroup('   ')
      expect(group.name).assertEqual('   ')
      expect(group.name.length).assertEqual(3)
    })

    // ========== Property Type & Assignment Tests ==========

    /**
     * @tc.name   TaskGroupNameTest2800
     * @tc.number SUB_TASKGROUP_NAME_TEST_2800
     * @tc.desc   Verify typeof group.name is primitive 'string'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupNameTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let group = new taskpool.TaskGroup('typeCheck')
      expect(typeof group.name).assertEqual('string')
      expect(typeof group.name === 'object').assertFalse()
      expect(group.name.length).assertEqual(9)
    })

    // ========== NESTING: Task function body creates and executes new Task ==========

    /**
     * @tc.name   TaskGroupNameTest2900
     * @tc.number SUB_TASKGROUP_NAME_TEST_2900
     * @tc.desc   Verify @Concurrent function body creates and executes a new Task, shared counter equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskGroupNameTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let counter = new NameNestedCounter()
      let result: Object = new Object()
      try {
        result = await taskpool.execute(nameNestedTaskFunc, counter)
      } catch (error) {
        console.error("TaskGroupNameTest3100 failed");
        expect(false).assertFail();
      }
      expect(result as number).assertEqual(9)
      let waited: number = 0
      while (counter.count < 1 && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      expect(counter.count).assertEqual(1)
      done()
    })

    // ========== Success callback creates and executes a new Task (attr#019) ==========

    /**
     * @tc.name   TaskGroupNameTest3100
     * @tc.number SUB_TASKGROUP_NAME_TEST_3100
     * @tc.desc   Verify onExecutionSucceeded callback creates and executes a new Task, with exact nested result and completion count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupNameTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let counter = new NameNestedCounter()
      let innerPromise: Promise<Object> | null = null
      let callbackCount: number = 0
      let callbackError: boolean = false
      let outerTask = new taskpool.Task(nameSimpleFunc)
      outerTask.onExecutionSucceeded((): void => {
        try {
          callbackCount++
          let innerTask = new taskpool.Task(nameNestedInnerFunc, counter)
          innerPromise = taskpool.execute(innerTask)
        } catch (error) {
          callbackError = true
        }
      })
      try {
        await taskpool.execute(outerTask)
        let waited: number = 0
        while (innerPromise === null && waited < 5000) {
          await sleep(100)
          waited += 100
        }
        expect(callbackError).assertFalse()
        expect(callbackCount).assertEqual(1)
        expect(innerPromise !== null).assertTrue()
        if (innerPromise !== null) {
          let innerResult: Object = await innerPromise
          expect(innerResult as number).assertEqual(9)
        }
        expect(counter.count).assertEqual(1)
      } catch (error) {
        console.error('TaskGroupNameTest3100 failed')
        expect(false).assertFail()
      }
      done()
    })

    // ========== Name Serialized To Worker (attr#012, F9 worker assets) ==========

    /**
     * @tc.name   TaskGroupNameTest3000
     * @tc.number SUB_TASKGROUP_NAME_TEST_3000
     * @tc.desc   Verify group.name serialized through a Worker: host group name 'serializedW4Name' is posted to the worker thread, the worker constructs a TaskGroup with the received name and executes it, host asserts echoed name equals 'serializedW4Name' and equals the local group.name, plus exact group result 42 (attr#012 name serialization passing incl. to Worker; 15s bounded wait pending run arbitration)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskGroupNameTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const hostGroup = new taskpool.TaskGroup('serializedW4Name')
      const groupName: string = hostGroup.name
      let groupStatus: string = ''
      const groupWorker = new worker.ThreadWorker('../../workers/WorkerTaskGroupCreate.ets')
      groupWorker.onmessage = (event: MessageEvents): void => {
        groupStatus = event.data as string
      }
      groupWorker.onerror = (event: ErrorEvent): void => {
        // Fallback diagnostics: report a worker-side exception immediately via
        // the status channel instead of stalling until the 15s bounded wait.
        groupStatus = 'worker-error|' + JSON.stringify(event)
      }
      try {
        groupWorker.postMessage(JSON.stringify({ mode: 'serialize-name', name: groupName }))
        let waited: number = 0
        while (groupStatus === '' && waited < 15000) {
          await sleep(100)
          waited += 100
        }
        const parsed: TaskGroupNameWorkerResult = JSON.parse(groupStatus) as TaskGroupNameWorkerResult
        expect(parsed.echoName).assertEqual('serializedW4Name')
        expect(parsed.echoName).assertEqual(groupName)
        expect(parsed.result).assertEqual(42)
      } catch (e) {
        console.info(`TaskGroupNameTest3000 catch error: ${JSON.stringify(e)}`)
        expect().assertFail()
      } finally {
        groupWorker.terminate()
        done()
      }
    })
  })
}
