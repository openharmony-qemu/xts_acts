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
import ActsWorkerTest from './WorkerTest.test'
import WorkerAtFront from './WorkerAtFront.test';
import ActsWorkerTestContainer from './WorkerTestContainer.test';


import ActsWorkerPriTest from './WorkerPriTest.test';
import WorkerEtsTest from './Worker.test';

import workerTest1 from './Worker1.test';
import workerAddTest from './WorkerAdd.test';
import workerErrorCodeTest from './WorkerErrorCode.test';
import WorkerCoverageEtsTest from './WorkerCoverage.test';
import WorkerSendableTest from './WorkerSendableTest.test';
import WorkerConfigTest from './WorkerConfigTest.test';
import WorkerIntegrationTest from './WorkerIntegrationTest.test';
import WorkerTaskPoolGCTest from './WorkerTaskPoolGCTest.test';


import threadWorkerInheritanceTest from './inheritance/ThreadWorkerInheritanceTest.test';
import errorEventInheritanceTest from './inheritance/ErrorEventInheritanceTest.test';
import messageEventsInheritanceTest from './inheritance/MessageEventsInheritanceTest.test';
import onAllErrorsTest from './inheritance/OnAllErrorsTest.test';
import onErrorTest from './inheritance/OnErrorTest.test';
import onExitTest from './inheritance/OnExitTest.test';
import onMessageErrorTest from './inheritance/OnMessageErrorTest.test';
import onMessageTest from './inheritance/OnMessageTest.test';
import workerConcurrentTest from './worker/Worker.test';

export default function testsuite() {
  ActsWorkerTestContainer();
  ActsWorkerTest();
  WorkerAtFront();


  ActsWorkerPriTest();
  WorkerEtsTest();
  
  workerTest1();
  workerAddTest();
  workerErrorCodeTest();
  WorkerCoverageEtsTest();
  WorkerSendableTest();
  WorkerConfigTest();
  WorkerIntegrationTest();
  WorkerTaskPoolGCTest();

  threadWorkerInheritanceTest();
  errorEventInheritanceTest();
  messageEventsInheritanceTest();
  onAllErrorsTest();
  onErrorTest();
  onExitTest();
  onMessageErrorTest();
  onMessageTest();
  workerConcurrentTest();
}