/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/




import taskpoolTest from './taskpoolCore/Taskpool.test';
import taskpoolTestState from './taskpoolCore/TaskpoolTestState.test';

import TaskPoolTest1 from './taskpoolCore/TaskPool1.test';
import TaskPoolErrorCodeTest from './taskpoolCore/TaskpoolErrorCode.test';
import TaskPoolCoverageTest from './taskpoolCore/TaskPoolCoverage.test';

import TaskPoolTest2 from './taskpoolCore/TaskPoolTest.test.ets'

import abilityTest from './taskpoolCore/Ability.test';
import cancelTest from './Cancel.test';

import TaskPoolDynamicLoadTest from './taskpoolIntegration/TaskPoolDynamicLoadTest.test';
import TaskPoolSharedLoadTest from './taskpoolIntegration/TaskPoolSharedLoadTest.test';
import taskpoolTestTask from './taskpoolCore/TaskpoolTestTask.test';
import TaskpoolConfigsTest from './taskTimeout/TaskpoolConfigsTest.test';
import TaskpoolPriorityTest from './taskpoolExecute/TaskpoolPriorityTest.test';
import ExecuteFuncTest from './taskpoolExecute/ExecuteFuncTest.test';
import ExecuteGenericsTaskConfigsTest from './taskTimeout/ExecuteGenericsTaskConfigsTest.test';
import ExecuteTaskConfigsTest from './taskTimeout/ExecuteTaskConfigsTest.test';
import ExecuteTaskGroupConfigsTest from './taskTimeout/ExecuteTaskGroupConfigsTest.test';
import ExecuteTaskGroupTest from './taskpoolExecute/ExecuteTaskGroupTest.test';
import ExecuteTaskTest from './taskpoolExecute/ExecuteTaskTest.test';
import ExecutePeriodicallyGenericTest from './taskpoolExecute/ExecutePeriodicallyGenericTest.test';
import ExecutePeriodicallyTaskTest from './taskpoolExecute/ExecutePeriodicallyTaskTest.test';

import TaskTimeoutTest from './taskTimeout/TaskTimeout.test';
import TaskTimeout2Test from './taskTimeout/TaskTimeout2.test';


export default function testsuite() {

  taskpoolTestState();
  taskpoolTest();
  TaskPoolTest1();
  cancelTest();
  
  
  TaskPoolCoverageTest();
  TaskPoolErrorCodeTest();
  TaskPoolTest2();

  abilityTest();
  TaskPoolDynamicLoadTest();
  TaskPoolSharedLoadTest();
  taskpoolTestTask();
  // Migrated taskpool.rar suites (self-cleaning: each periodic suite cancels its own tasks in afterAll).
  TaskpoolConfigsTest();
  TaskpoolPriorityTest();
  ExecuteFuncTest();
  ExecuteGenericsTaskConfigsTest();
  ExecuteTaskConfigsTest();
  ExecuteTaskGroupConfigsTest();
  ExecuteTaskGroupTest();
  ExecuteTaskTest();
  ExecutePeriodicallyGenericTest();
  ExecutePeriodicallyTaskTest();
  TaskTimeoutTest();
  TaskTimeout2Test();

}
