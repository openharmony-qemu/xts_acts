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



import TaskPoolSendableNameSpaceTest from './TaskPoolSendableNameSpace.test';

import TaskPoolSendableTest from './TaskPoolSendable.test'

import taskpoolTest from './Taskpool.test';
import taskpoolTestState from './TaskpoolTestState.test';
import taskpoolTestContainer from './TaskpoolTestContainer.test';

import TaskPoolTest1 from './TaskPool1.test';
import TaskPoolErrorCodeTest from './TaskpoolErrorCode.test';
import TaskPoolCoverageTest from './TaskPoolCoverage.test';

import TaskPoolTest2 from './TaskPoolTest.test.ets'
import TaskPoolIntegrationTest from './TaskPoolIntegrationTest.test';
import TaskPoolSendableTest2 from './TaskPoolSendableTest.test';

import abilityTest from './Ability.test';
import cancelTest from './Cancel.test';

export default function testsuite() {

  
  
  TaskPoolSendableNameSpaceTest();
    
  TaskPoolSendableTest();
  
  taskpoolTestContainer();
  taskpoolTestState();
  taskpoolTest();
  
  TaskPoolTest1();
  TaskPoolErrorCodeTest();
  TaskPoolCoverageTest();
  TaskPoolTest2();
  
  TaskPoolIntegrationTest();
  TaskPoolSendableTest2();

  abilityTest();
  cancelTest();
}