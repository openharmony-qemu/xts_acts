'use static';
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

import TaskAddDependencyTest from "./task/TaskAddDependencyTest.test"
import TaskConstructorExpandTest from "./task/TaskConstructorExpandTest.test"
import TaskConstructorTest from "./task/TaskConstructorTest.test"
import TaskIsCanceledTest from "./task/TaskIsCanceledTest.test"
import TaskIsDoneTest from "./task/TaskIsDoneTest.test"
import TaskOnEnqueuedTest from "./task/TaskOnEnqueuedTest.test"
import TaskOnExecutionFailedTest from "./task/TaskOnExecutionFailedTest.test"
import TaskOnExecutionSucceededTest from "./task/TaskOnExecutionSucceededTest.test"
import TaskOnReceiveDataTest from "./task/TaskOnReceiveDataTest.test"
import TaskPropertyTest from "./task/TaskPropertyTest.test"
import TaskRemoveDependencyTest from "./task/TaskRemoveDependencyTest.test"
import TaskSendDataTest from "./task/TaskSendDataTest.test"
import TaskOnStartExecutionTest from "./task/TaskOnStartExecutionTest.test"

import TaskpoolExecuteFuncTest from "./taskpoolExecute/TaskpoolExecuteFuncTest.test";
import TaskpoolExecuteFuncArgTest from "./taskpoolExecute/TaskpoolExecuteFuncArgTest.test";
import TaskpoolExecuteTaskTest from "./taskpoolExecute/TaskpoolExecuteTaskTest.test";
import TaskpoolConfigsTest from "./configsProp/TaskpoolConfigsTest.test";
import TaskpoolPriorityTest from "./priorityProp/TaskpoolPriorityTest.test";
import TaskpoolStateTest from "./state/TaskpoolStateTest.test";
import TaskpoolExecuteDelayedTest from "./taskpoolExecute/TaskpoolExecuteDelayedTest.test";
import TaskpoolExecutePeriodicallyTest from "./taskpoolExecute/TaskpoolExecutePeriodicallyTest.test";

export default function testsuite(): void {
  TaskOnReceiveDataTest()
  TaskConstructorTest()
  TaskConstructorExpandTest()
  TaskOnExecutionSucceededTest()
  TaskIsDoneTest()
  TaskOnEnqueuedTest()
  TaskOnExecutionFailedTest()
  TaskRemoveDependencyTest()
  TaskSendDataTest()
  TaskAddDependencyTest()
  TaskIsCanceledTest()
  TaskPropertyTest()
  TaskOnStartExecutionTest()


  TaskpoolConfigsTest() 
  TaskpoolPriorityTest()
  TaskpoolStateTest()


  TaskpoolExecuteFuncTest()
  TaskpoolExecuteFuncArgTest()
  TaskpoolExecuteTaskTest()


  TaskpoolExecuteDelayedTest()
  TaskpoolExecutePeriodicallyTest()
}
