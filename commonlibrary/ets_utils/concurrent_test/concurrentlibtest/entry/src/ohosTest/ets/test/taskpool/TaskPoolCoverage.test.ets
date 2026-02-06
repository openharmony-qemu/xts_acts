/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';
import assertNaN from '@ohos/hypium/src/main/module/assert/assertNaN';

// 测试函数定义
@Concurrent
function simpleFunc(arg: number): number {
  return arg * 2;
}

@Concurrent
function multiArgFunc(a: number, b: number, c: number): number {
  return a + b + c;
}

@Concurrent
function noArgFunc(): number {
  return 42;
}

@Concurrent
function send(arg: number): number {
  try {
    taskpool.Task.sendData(arg)
  } catch (error) {
  }
  return arg * 2;
}

@Concurrent
function promiseTask(arg: number): Promise<number> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(arg * 2);
    }, 100);
  });
}

export default function taskPoolCoverageTest() {
  describe('TaskPoolCoverageTest', () => {

    // Task.setTransferList - null/undefined coverage (E列: 第1个参数缺少null/undefined覆盖)
    /**
     * @tc.name   testTaskSetTransferListWithNull
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_0101
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTaskSetTransferListWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let tag = "testTaskSetTransferListWithNull"
      console.log(`${tag} test start.`)
      const task = new taskpool.Task(simpleFunc, 1);
      try {
        task.setTransferList(null);
        const result = await taskpool.execute(task);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testTaskSetTransferListWithUndefined
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_0102
     * @tc.desc   test Task.setTransferList with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskSetTransferListWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testTaskSetTransferListWithUndefined"
        console.log(`${tag} test start.`)
        const task = new taskpool.Task(simpleFunc, 1);
        try {
          task.setTransferList(undefined);
          const result = await taskpool.execute(task);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(401);
          done();
        }
      });

    // Task.setCloneList - null/undefined coverage (E列: 第1个参数缺少null/undefined覆盖)
    /**
     * @tc.name   testTaskSetCloneListWithNull
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_0103
     * @tc.desc   test Task.setCloneList with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskSetCloneListWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let tag = "testTaskSetCloneListWithNull"
      console.log(`${tag} test start.`)
      const task = new taskpool.Task(simpleFunc, 1);
      try {
        task.setCloneList(null);
        const result = await taskpool.execute(task);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testTaskSetCloneListWithUndefined
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_0104
     * @tc.desc   test Task.setCloneList with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskSetCloneListWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testTaskSetCloneListWithUndefined"
        console.log(`${tag} test start.`)
        const task = new taskpool.Task(simpleFunc, 1);
        try {
          task.setCloneList(undefined);
          const result = await taskpool.execute(task);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(401);
          done();
        }
      });

    // Task.onReceiveData - null/undefined coverage (E列: 第1个参数缺少null/undefined覆盖)
    /**
     * @tc.name   testTaskOnReceiveDataWithNull
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_0105
     * @tc.desc   test Task.onReceiveData with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskOnReceiveDataWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let tag = "testTaskOnReceiveDataWithNull"
      console.log(`${tag} test start.`)
      const task = new taskpool.Task(send, 1);
      try {
        task.onReceiveData(null);
        const result = await taskpool.execute(task);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testTaskOnReceiveDataWithUndefined
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_0106
     * @tc.desc   test Task.onReceiveData with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskOnReceiveDataWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testTaskOnReceiveDataWithUndefined"
        console.log(`${tag} test start.`)
        const task = new taskpool.Task(send, 1);
        try {
          task.onReceiveData(undefined);
          const result = await taskpool.execute(task);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(401);
          done();
        }
      });

    // TaskGroup.addDependency - null/undefined coverage (E列: 第1个参数缺少null/undefined覆盖)
    /**
     * @tc.name   testTaskGroupAddDependencyWithNull
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_0107
     * @tc.desc   test TaskGroup.addDependency with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskGroupAddDependencyWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testTaskGroupAddDependencyWithNull"
        console.log(`${tag} test start.`)
        const task1 = new taskpool.Task(simpleFunc, 1);
        try {
          task1.addDependency(null);
          await taskpool.execute(task1);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   testTaskGroupAddDependencyWithUndefined
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_0108
     * @tc.desc   test TaskGroup.addDependency with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskGroupAddDependencyWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testTaskGroupAddDependencyWithUndefined"
        console.log(`${tag} test start.`)
        const task1 = new taskpool.Task(simpleFunc, 1);
        try {
          task1.addDependency(undefined);
          await taskpool.execute(task1);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(401);
          done();
        }
      });

    // TaskGroup.removeDependency - null/undefined coverage (E列: 第1个参数缺少null/undefined覆盖)
    /**
     * @tc.name   testTaskGroupRemoveDependencyWithNull
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_0109
     * @tc.desc   test TaskGroup.removeDependency with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskGroupRemoveDependencyWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testTaskGroupRemoveDependencyWithNull"
        console.log(`${tag} test start.`)
        const task1 = new taskpool.Task(simpleFunc, 1);
        try {
          task1.removeDependency(null);
          await taskpool.execute(task1);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(10200027);
          done();
        }
      });

    /**
     * @tc.name   testTaskGroupRemoveDependencyWithUndefined
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_0110
     * @tc.desc   test TaskGroup.removeDependency with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskGroupRemoveDependencyWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testTaskGroupRemoveDependencyWithUndefined"
        console.log(`${tag} test start.`)
        const task1 = new taskpool.Task(simpleFunc, 1);
        try {
          task1.removeDependency(undefined);
          await taskpool.execute(task1);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(10200027);
          done();
        }
      });

    // TaskGroup.addTask(func) - null/undefined coverage (E列: 第1个参数缺少null/undefined覆盖)
    /**
     * @tc.name   testTaskGroupAddTaskFuncWithNull
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_0111
     * @tc.desc   test TaskGroup.addTask with null function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskGroupAddTaskFuncWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testTaskGroupAddTaskFuncWithNull"
        console.log(`${tag} test start.`)
        const group = new taskpool.TaskGroup();
        try {
          group.addTask(null);
          await taskpool.execute(group);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   testTaskGroupAddTaskFuncWithUndefined
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_0112
     * @tc.desc   test TaskGroup.addTask with undefined function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskGroupAddTaskFuncWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testTaskGroupAddTaskFuncWithUndefined"
        console.log(`${tag} test start.`)
        const group = new taskpool.TaskGroup();
        try {
          group.addTask(undefined);
          await taskpool.execute(group);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(401);
          done();
        }
      });

    // TaskGroup.addTask(task) - null/undefined coverage (E列: 第1个参数缺少null/undefined覆盖; arguments:缺少空数组覆盖；缺少非空数组覆盖；name:缺少空值""覆盖)
    /**
     * @tc.name   testTaskGroupAddTaskWithNull
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_101
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskGroupAddTaskWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let tag = "testTaskGroupAddTaskWithNull"
      console.log(`${tag} test start.`)
      const group = new taskpool.TaskGroup();
      try {
        group.addTask(null, 1);
        await taskpool.execute(group);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testTaskGroupAddTaskWithUndefined
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_102
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskGroupAddTaskWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testTaskGroupAddTaskWithUndefined"
        console.log(`${tag} test start.`)
        const group = new taskpool.TaskGroup();
        try {
          group.addTask(undefined, 1);
          await taskpool.execute(group);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   testTaskGroupAddTaskWithEmptyArguments
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_103
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskGroupAddTaskWithEmptyArguments', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const task = new taskpool.Task(simpleFunc, []);
        task.arguments = [];
        const group = new taskpool.TaskGroup();
        group.addTask(task);
        const results = await taskpool.execute(group);
        expect(results.length).assertEqual(1);
        done();
      });

    /**
     * @tc.name   testTaskGroupAddTaskWithNonEmptyArguments
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_104
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskGroupAddTaskWithNonEmptyArguments', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const task = new taskpool.Task(multiArgFunc, [1, 2, 3]);
        const group = new taskpool.TaskGroup();
        group.addTask(task);
        const results = await taskpool.execute(group);
        expect(results.length).assertEqual(1);
        expect(results[0]).assertEqual('1,2,3undefinedundefined');
        done();
      });

    /**
     * @tc.name   testTaskGroupAddTaskWithEmptyName
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_105
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTaskGroupAddTaskWithEmptyName', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const task = new taskpool.Task('', simpleFunc, 5);
        const group = new taskpool.TaskGroup();
        group.addTask(task);
        const results = await taskpool.execute(group);
        expect(results.length).assertEqual(1);
        done();
      });

    // execute(task) - null/undefined and properties coverage (E列: 第1个参数缺少null/undefined覆盖; arguments:缺少空数组覆盖；缺少非空数组覆盖；name:缺少空值""覆盖)
    /**
     * @tc.name   testExecuteTaskWithNull
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_106
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTaskWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let tag = "testExecuteTaskWithNull"
      console.log(`${tag} test start.`)
      let runner = new taskpool.SequenceRunner()
      try {
        await runner.execute(null);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testExecuteTaskWithUndefined
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_107
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTaskWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let tag = "testExecuteTaskWithUndefined"
      console.log(`${tag} test start.`)
      let runner = new taskpool.SequenceRunner()
      try {
        await runner.execute(undefined);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testExecuteTaskWithEmptyArguments
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_108
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTaskWithEmptyArguments', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let runner = new taskpool.SequenceRunner()
        const task = new taskpool.Task(simpleFunc, []);
        const result = await runner.execute(task);
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testExecuteTaskWithNonEmptyArguments
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_109
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTaskWithNonEmptyArguments', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let runner = new taskpool.SequenceRunner()
        const task = new taskpool.Task(multiArgFunc, [1, 2, 3]);
        const result = await runner.execute(task);
        expect(result).assertEqual('1,2,3undefinedundefined');
        done();
      });

    /**
     * @tc.name   testExecuteTaskWithEmptyName
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_110
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTaskWithEmptyName', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let runner = new taskpool.SequenceRunner()
      const task = new taskpool.Task('', simpleFunc, 5);
      const result = await runner.execute(task);
      expect(result).assertEqual(10);
      done();
    });


    // execute(task) - null/undefined and properties coverage (E列: 第1个参数缺少null/undefined覆盖; arguments:缺少空数组覆盖；缺少非空数组覆盖；name:缺少空值""覆盖)
    // it('testExecuteTaskWithSecondNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
    //   try {
    //     let result = await taskpool.execute(simpleFunc, null);
    //     expect(result).assertEqual(1);
    //     done();
    //   } catch (error) {
    //   } catch (error) {
    //   }
    // });
    //
    // it('testExecuteTaskWithSecondUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
    //   async (done: Function) => {
    //     try {
    //       let result = await taskpool.execute(simpleFunc, undefined);
    //       expect(result).assertEqual(1);
    //       done();
    //     } catch (error) {
    //     } catch (error) {
    //     }
    //   });
    // execute(func, ...args) - null/undefined coverage (E列: 第1个参数缺少null/undefined覆盖;第2个参数缺少null/undefined覆盖)
    /**
     * @tc.name   testExecuteVerifyTaskWithNull
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_111
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteVerifyTaskWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let tag = "testExecuteVerifyTaskWithNull"
      console.log(`${tag} test start.`)
      try {
        await taskpool.execute<Object[], null>(null);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testExecuteVerifyFuncWithUndefined
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_112
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteVerifyFuncWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testExecuteVerifyFuncWithUndefined"
        console.log(`${tag} test start.`)
        try {
          await taskpool.execute<Object[], undefined>(undefined);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   testExecuteVerifyArgsWithNull
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_113
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteVerifyArgsWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let tag = "testExecuteVerifyArgsWithNull"
      console.log(`${tag} test start.`)
      try {
        let result = await taskpool.execute<number[], number>(simpleFunc, null);
        expect(result).assertEqual(0);
        done();
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
      }
    });

    /**
     * @tc.name   testExecuteVerifyArgsWithUndefined
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_114
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteVerifyArgsWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testExecuteVerifyArgsWithUndefined"
        console.log(`${tag} test start.`)
        try {
          let result = await taskpool.execute<number[], number>(simpleFunc, undefined);
          assertNaN(result)
          done();
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          done();
        }
      });

    // execute(task, priority) - priority coverage
    /**
     * @tc.name   testExecuteTaskPriorityHIGH
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_115
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTaskPriorityHIGH', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const task = new taskpool.Task(simpleFunc, []);
      const result = await taskpool.execute(task, taskpool.Priority.HIGH);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testExecuteTaskPriorityMEDIUM
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_116
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTaskPriorityMEDIUM', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const task = new taskpool.Task(simpleFunc, [5]);
      const result = await taskpool.execute(task, taskpool.Priority.MEDIUM);
      expect(result).assertEqual(10);
      done();
    });

    /**
     * @tc.name   testExecuteTaskPriorityLOW
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_117
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTaskPriorityLOW', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const task = new taskpool.Task('', simpleFunc, 5);
      const result = await taskpool.execute(task, taskpool.Priority.LOW);
      expect(result).assertEqual(10);
      done();
    });

    /**
     * @tc.name   testExecuteTaskPriorityWithNull
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_118
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTaskPriorityWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let tag = "testExecuteTaskPriorityWithNull"
      console.log(`${tag} test start.`)
      try {
        await taskpool.execute(null, taskpool.Priority.MEDIUM);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testExecuteTaskPriorityWithUndefined
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_119
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteTaskPriorityWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testExecuteTaskPriorityWithUndefined"
        console.log(`${tag} test start.`)
        try {
          await taskpool.execute(undefined, taskpool.Priority.MEDIUM);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(401);
          done();
        }
      });
    /**
     * @tc.name   testExecuteVerifyPriorityTaskWithNull
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_120
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteVerifyPriorityTaskWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testExecuteVerifyPriorityTaskWithNull"
        console.log(`${tag} test start.`)
        try {
          await taskpool.execute<Object[], null>(null, taskpool.Priority.MEDIUM);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   testExecuteVerifyPriorityFuncWithUndefined
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_121
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteVerifyPriorityFuncWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testExecuteVerifyPriorityFuncWithUndefined"
        console.log(`${tag} test start.`)
        try {
          await taskpool.execute<Object[], undefined>(undefined, taskpool.Priority.MEDIUM);
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          expect(error.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   testExecuteVerifyPriorityArgsWithNull
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_122
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteVerifyPriorityArgsWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testExecuteVerifyPriorityArgsWithNull"
        console.log(`${tag} test start.`)
        try {
          let result = await taskpool.execute<number[], number>(simpleFunc, null, taskpool.Priority.MEDIUM);
          expect(result).assertEqual(0);
          done();
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
        }
      });

    /**
     * @tc.name   testExecuteVerifyPriorityArgsWithUndefined
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_123
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteVerifyPriorityArgsWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        let tag = "testExecuteVerifyPriorityArgsWithUndefined"
        console.log(`${tag} test start.`)
        try {
          let result = await taskpool.execute<number[], number>(simpleFunc, undefined, taskpool.Priority.MEDIUM);
          assertNaN(result)
          done();
        } catch (error) {
          console.log(`${tag} test catch: ${error.code}`)
          done();
        }
      });
    // execute(group, priority) - null/undefined and name coverage (E列: 第1个参数缺少null/undefined覆盖; name:缺少空值""覆盖)
    /**
     * @tc.name   testExecuteGroupWithNull
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_124
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteGroupWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      let tag = "testExecuteGroupWithNull"
      console.log(`${tag} test start.`)
      try {
        await taskpool.execute(null);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testExecuteGroupPriorityWithUndefined
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_125
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteGroupPriorityWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const group = new taskpool.TaskGroup('');
        group.addTask(noArgFunc);
        const results = await taskpool.execute(group, taskpool.Priority.MEDIUM);
        expect(results.length).assertEqual(1);
        done();
      });

    /**
     * @tc.name   testExecuteGroupWithEmptyName
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_126
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteGroupWithEmptyName', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const group = new taskpool.TaskGroup('');
      group.addTask(noArgFunc);
      const results = await taskpool.execute(group);
      expect(results.length).assertEqual(1);
      done();
    });

    // executeDelayed - arguments and name coverage (E列: 第2个参数属性arguments:缺少空数组覆盖；缺少非空数组覆盖；name:缺少空值""覆盖)
    /**
     * @tc.name   testExecuteDelayedWithEmptyArguments
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_127
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteDelayedWithEmptyArguments', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const task = new taskpool.Task(simpleFunc, []);
        const result = await taskpool.executeDelayed(100, task);
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testExecuteDelayedWithNonEmptyArguments
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_128
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteDelayedWithNonEmptyArguments', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const task = new taskpool.Task(multiArgFunc, [1, 2, 3]);
        const result = await taskpool.executeDelayed(100, task);
        expect(result).assertEqual('1,2,3undefinedundefined');
        done();
      });

    /**
     * @tc.name   testExecuteDelayedWithEmptyName
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_129
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteDelayedWithEmptyName', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const task = new taskpool.Task('', simpleFunc, 5);
      const result = await taskpool.executeDelayed(100, task);
      expect(result).assertEqual(10);
      done();
    });

    // executePeriodically - arguments, name and IDLE priority coverage (E列: 第2个参数属性arguments:缺少空数组覆盖；缺少非空数组覆盖；name:缺少空值""覆盖；第3个参数未覆盖枚举:['IDLE'])
    /**
     * @tc.name   testExecutePeriodicallyWithEmptyArguments
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_130
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecutePeriodicallyWithEmptyArguments', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        const task = new taskpool.Task(simpleFunc, []);
        taskpool.executePeriodically(100, task);
        setTimeout(() => {
          taskpool.cancel(task);
          done();
        }, 200);
      });

    /**
     * @tc.name   testExecutePeriodicallyWithNonEmptyArguments
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_131
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecutePeriodicallyWithNonEmptyArguments', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        const task = new taskpool.Task(multiArgFunc, [1, 2, 3]);
        taskpool.executePeriodically(100, task);
        setTimeout(() => {
          taskpool.cancel(task);

          done();
        }, 200);
      });

    /**
     * @tc.name   testExecutePeriodicallyWithEmptyName
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_132
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecutePeriodicallyWithEmptyName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const task = new taskpool.Task('', noArgFunc);
      taskpool.executePeriodically(100, task);
      setTimeout(() => {
        taskpool.cancel(task);

        done();
      }, 200);
    });

    /**
     * @tc.name   testExecutePeriodicallyWithIDLE
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_133
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecutePeriodicallyWithIDLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const task = new taskpool.Task(noArgFunc);
      taskpool.executePeriodically(100, task, taskpool.Priority.IDLE);
      setTimeout(() => {
        taskpool.cancel(task);
        done();
      }, 200);
    });
    /**
     * @tc.name   testExecuteVerifyPeriodicallyWithIDLE
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_134
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecuteVerifyPeriodicallyWithIDLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        const task = new taskpool.Task(noArgFunc);
        taskpool.executePeriodically<Object[], number>(100, task, taskpool.Priority.IDLE);
        setTimeout(() => {
          taskpool.cancel(task);
          done();
        }, 200);
      });

    // cancel(task) - null/undefined and properties coverage (E列: 第1个参数缺少null/undefined覆盖; arguments:缺少空数组覆盖；缺少非空数组覆盖；name:缺少空值""覆盖)
    /**
     * @tc.name   testCancelTaskWithNull
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_135
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCancelTaskWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      let tag = "testCancelTaskWithNull"
      console.log(`${tag} test start.`)
      try {
        taskpool.cancel(null);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error != null).assertEqual(true);
        done();
      }
    });

    /**
     * @tc.name   testCancelTaskWithUndefined
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_136
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCancelTaskWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      let tag = "testCancelTaskWithUndefined"
      console.log(`${tag} test start.`)
      try {
        taskpool.cancel(undefined);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testCancelTaskWithEmptyArguments
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_137
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCancelTaskWithEmptyArguments', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      let tag = "testCancelTaskWithEmptyArguments"
      console.log(`${tag} test start.`)
      const task = new taskpool.Task(simpleFunc, []);
      try {
        taskpool.cancel(task);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(10200015);
      }
      done();
    });

    /**
     * @tc.name   testCancelTaskWithNonEmptyArguments
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_138
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCancelTaskWithNonEmptyArguments', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      let tag = "testCancelTaskWithNonEmptyArguments"
      console.log(`${tag} test start.`)
      const task = new taskpool.Task(multiArgFunc, [1, 2, 3]);
      try {
        taskpool.cancel(task);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(10200015);
      }
      done();
    });

    /**
     * @tc.name   testCancelTaskWithEmptyName
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_139
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCancelTaskWithEmptyName', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      let tag = "testCancelTaskWithEmptyName"
      console.log(`${tag} test start.`)
      const task = new taskpool.Task('', simpleFunc, 5);
      try {
        taskpool.cancel(task);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(10200015);
      }
      done();
    });


    /**
     * @tc.name   testCancelGroupWithNull
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_140
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCancelGroupWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      let tag = "testCancelGroupWithNull"
      console.log(`${tag} test start.`)
      try {
        taskpool.cancel(null);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testCancelGroupWithUndefined
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_141
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCancelGroupWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      let tag = "testCancelGroupWithUndefined"
      console.log(`${tag} test start.`)
      try {
        taskpool.cancel(undefined);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testCancelGroupWithEmptyName
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_142
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCancelGroupWithEmptyName', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      let tag = "testCancelGroupWithEmptyName"
      console.log(`${tag} test start.`)
      const group = new taskpool.TaskGroup('');
      group.addTask(noArgFunc);
      try {
        taskpool.cancel(group);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code).assertEqual(10200018);
        done();
      }
      done();
    });


    // getTaskPoolInfo - threadInfos and taskInfos coverage (F列: threadInfos缺少空覆盖；缺少非空覆盖；taskInfos缺少非空覆盖；子属性未覆盖：['taskId', 'state', 'duration', 'name'])
    /**
     * @tc.name   testGetTaskPoolInfoThreadInfos
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_143
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testGetTaskPoolInfoThreadInfos', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const task = new taskpool.Task(simpleFunc, 1);
      await taskpool.execute(task);
      const info = taskpool.getTaskPoolInfo();
      expect(info.threadInfos.length).assertLarger(0);
      done();
    });

    /**
     * @tc.name   testGetTaskPoolInfoTaskInfos
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_144
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testGetTaskPoolInfoTaskInfos', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const task = new taskpool.Task(simpleFunc, 1);
      await taskpool.execute(task);
      const info = taskpool.getTaskPoolInfo();
      expect(info.taskInfos.length).assertLarger(0);
      if (info.taskInfos.length > 0) {
        expect(info.taskInfos[0].taskId).assertLarger(0);
      }
      done();
    });

    /**
     * @tc.name   testGetTaskPoolInfoTaskState
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_145
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testGetTaskPoolInfoTaskState', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const task = new taskpool.Task(simpleFunc, 1);
      await taskpool.execute(task);
      const info = taskpool.getTaskPoolInfo();
      if (info.taskInfos.length > 0) {
        expect(info.taskInfos[0].state !== undefined).assertTrue();
      }

      done();
    });

    /**
     * @tc.name   testGetTaskPoolInfoTaskDuration
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_146
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testGetTaskPoolInfoTaskDuration', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const task = new taskpool.Task(simpleFunc, 1);
      await taskpool.execute(task);
      const info = taskpool.getTaskPoolInfo();
      if (info.taskInfos.length > 0) {
        expect(info.taskInfos[0].duration !== undefined).assertTrue();
      }

      done();
    });

    /**
     * @tc.name   testGetTaskPoolInfoTaskName
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_147
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testGetTaskPoolInfoTaskName', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const task = new taskpool.Task(simpleFunc, 1);
      await taskpool.execute(task);
      const info = taskpool.getTaskPoolInfo();
      if (info.taskInfos.length > 0) {
        expect(info.taskInfos[0].name !== undefined).assertTrue();
      }

      done();
    });

    // terminateTask - null/undefined coverage (E列: 第1个参数缺少null/undefined覆盖)
    /**
     * @tc.name   testTerminateTaskWithNull
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_148
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTerminateTaskWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      let tag = "testTerminateTaskWithNull"
      console.log(`${tag} test start.`)
      try {
        taskpool.terminateTask(null);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code == 401).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testTerminateTaskWithUndefined
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_149
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTerminateTaskWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      let tag = "testTerminateTaskWithUndefined"
      console.log(`${tag} test start.`)
      try {
        taskpool.terminateTask(undefined);
      } catch (error) {
        console.log(`${tag} test catch: ${error.code}`)
        expect(error.code == 401).assertTrue();
        done();
      }
    });

    // isConcurrent - null/undefined coverage (E列: 第1个参数缺少null/undefined覆盖)
    /**
     * @tc.name   testIsConcurrentWithNull
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_150
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testIsConcurrentWithNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      let tag = "testIsConcurrentWithNull"
      console.log(`${tag} test start.`)
      try {
        const result = taskpool.isConcurrent(null);
        expect(result).assertFalse();
        done();
      } catch (error) {

        done();
      }
    });

    /**
     * @tc.name   testIsConcurrentWithUndefined
     * @tc.number SUB_CONCURRENCY_Param_COVERED_TEST_151
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testIsConcurrentWithUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      let tag = "testIsConcurrentWithUndefined"
      console.log(`${tag} test start.`)
      try {
        const result = taskpool.isConcurrent(undefined);
        expect(result).assertFalse();
        done();
      } catch (error) {

        done();
      }
    });

    // getTask - properties coverage (F列: 所有属性未覆盖)
    it('testGetTaskById', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const task = new taskpool.Task(simpleFunc, 1);
      const taskId = task.taskId;
      await taskpool.execute(task);
      const foundTask = taskpool.getTask(taskId);
      expect(foundTask !== undefined).assertTrue();
      if (foundTask !== undefined) {
        expect(foundTask.taskId).assertEqual(taskId);
      }
      done();
    });

    it('testGetTaskByIdAndName', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const task = new taskpool.Task("testTask", simpleFunc, 1);
      const taskId = task.taskId;
      await taskpool.execute(task);
      const foundTask = taskpool.getTask(taskId, "testTask");
      expect(foundTask !== undefined).assertTrue();
      if (foundTask !== undefined) {
        expect(foundTask.taskId).assertEqual(taskId);
        expect(foundTask.name).assertEqual("testTask");
      }
      done();
    });

    it('testGetTaskByIdNotFound', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      const foundTask = taskpool.getTask(999999);
      expect(foundTask === undefined).assertTrue();
      done();
    });

    it('testGetTaskByIdAndNameNotFound', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      const task = new taskpool.Task("testTask", simpleFunc, 1);
      const taskId = task.taskId;
      const foundTask = taskpool.getTask(taskId, "wrongName");
      expect(foundTask === undefined).assertTrue();
      done();
    });

    it('testGetTaskProperties', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: Function) => {
      const task = new taskpool.Task("testProps", simpleFunc, 1);
      const taskId = task.taskId;
      await taskpool.execute(task);
      const foundTask = taskpool.getTask(taskId);
      if (foundTask !== undefined) {
        expect(foundTask.taskId).assertEqual(taskId);
        expect(foundTask.name).assertEqual("testProps");
      }
      done();
    });

    // ========== AsyncRunner 缺失场景补充测试 ==========

    // AsyncRunner.execute - arguments 缺少非空参数测试
    /**
     * @tc.name   testAsyncRunnerExecuteWithNullTask
     * @tc.number SUB_CONCURRENCY_ASYNCRUNNER_PARAM_0101
     * @tc.desc   test AsyncRunner.execute with null task parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testAsyncRunnerExecuteWithNullTask', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        const tag = "testAsyncRunnerExecuteWithNullTask";
        console.log(`${tag} test start.`);
        const runner = new taskpool.AsyncRunner(1);
        try {
          runner.execute(null);
          expect().assertFail();
        } catch (error) {
          console.log(`${tag} catch error.code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        done();
      });

    /**
     * @tc.name   testAsyncRunnerExecuteWithUndefinedTask
     * @tc.number SUB_CONCURRENCY_ASYNCRUNNER_PARAM_0102
     * @tc.desc   test AsyncRunner.execute with undefined task parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testAsyncRunnerExecuteWithUndefinedTask', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      async (done: Function) => {
        const tag = "testAsyncRunnerExecuteWithUndefinedTask";
        console.log(`${tag} test start.`);
        const runner = new taskpool.AsyncRunner(1);
        try {
          runner.execute(undefined);
          expect().assertFail();
        } catch (error) {
          console.log(`${tag} catch error.code: ${error.code}`);
          expect(error.code).assertEqual(401);
        }
        done();
      });

    // AsyncRunner - 缺少必选参数测试（无参数）
    /**
     * @tc.name   testAsyncRunnerConstructorNoParams
     * @tc.number SUB_CONCURRENCY_ASYNCRUNNER_PARAM_0201
     * @tc.desc   test AsyncRunner constructor without required parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAsyncRunnerConstructorNoParams', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const tag = "testAsyncRunnerConstructorNoParams";
        console.log(`${tag} test start.`);
        const runner = new taskpool.AsyncRunner(1);
        const task = new taskpool.Task(simpleFunc, []);
        let result = await runner.execute(task);
        expect(result).assertEqual(0);
        console.log(`${tag} test end.`);
        done();
      });

    // AsyncRunner - name 缺少空值""测试
    /**
     * @tc.name   testAsyncRunnerConstructorWithEmptyName
     * @tc.number SUB_CONCURRENCY_ASYNCRUNNER_PARAM_0301
     * @tc.desc   test AsyncRunner constructor with empty name string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAsyncRunnerConstructorWithEmptyName', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: Function) => {
        const tag = "testAsyncRunnerConstructorWithEmptyName";
        console.log(`${tag} test start.`);
        const runner = new taskpool.AsyncRunner("", 1);
        const task = new taskpool.Task(simpleFunc, [100]);
        let result = await runner.execute(task);
        expect(result).assertEqual(200);
        console.log(`${tag} test end.`);
        done();
      });

    // AsyncRunner - 缺少null/undefined参数测试（通过返回值类型未声明场景间接测试）
    /**
     * @tc.name   testAsyncRunnerExecuteWithEmptyName
     * @tc.number SUB_CONCURRENCY_ASYNCRUNNER_RETURN_0101
     * @tc.desc   test AsyncRunner.execute with Promise task (return type not declared)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAsyncRunnerExecuteWithEmptyName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        const tag = "testAsyncRunnerExecuteWithEmptyName";
        console.log(`${tag} test start.`);
        const runner = new taskpool.AsyncRunner("", 1);
        const task = new taskpool.Task('', simpleFunc, 100);
        let result = await runner.execute(task);
        expect(result).assertEqual(200);
        done()
      });
  });
}
