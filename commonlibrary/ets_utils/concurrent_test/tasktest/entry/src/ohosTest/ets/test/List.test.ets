/**
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


import taskTimeoutTest from './TaskTimeout.test';
import taskTimeout2Test from './TaskTimeout2.test';
import TaskListeningTest from './TaskListening.test';

import TaskGroupTest from './TaskGroupTest.test.ets'
import TaskDispatchQueueTest from './TaskDispatchQueueTest.test';
import TaskStateMachineTest from './TaskStateMachineTest.test';
import TaskQueueCoordTest from './TaskQueueCoordTest.test';

export default function testsuite() {
 
  taskTimeoutTest();
  taskTimeout2Test();
  TaskListeningTest();
  TaskGroupTest();
  TaskQueueCoordTest();
  TaskStateMachineTest();
  TaskDispatchQueueTest();
}