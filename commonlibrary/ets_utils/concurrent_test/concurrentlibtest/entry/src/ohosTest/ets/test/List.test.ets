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


import arkTSUtilsTest from './arkTSUtils/ArkTSUtils.test';
import TaskPoolTest from './taskpool/TaskPool.test';
import TaskPoolErrorCodeTest from './taskpool/TaskpoolErrorCode.test';
import TaskPoolCoverageTest from './taskpool/TaskPoolCoverage.test';
import workerTest from './worker/Worker.test';
import workerAddTest from './worker/WorkerAdd.test';
import workerErrorCodeTest from './worker/WorkerErrorCode.test';
import WorkerCoverageTest from './worker/WorkerCoverage.test';
import concurrencyReturnCoveredTest from './returnCovered/concurrencyReturnCoveredTest.test';
import concurrencyCoveredSupplement from './returnCovered/concurrencyCoveredSupplement.test';
import utilsCoverageTest from './arkTSUtils/UtilsCoverageTest.test';
import containerSerializeTest from './serialize/containerSerialize.test';

import threadWorkerInheritanceTest from './inheritance/ThreadWorkerInheritanceTest.test';
import errorEventInheritanceTest from './inheritance/ErrorEventInheritanceTest.test';
import messageEventsInheritanceTest from './inheritance/MessageEventsInheritanceTest.test';
import onAllErrorsTest from './inheritance/OnAllErrorsTest.test';
import onErrorTest from './inheritance/OnErrorTest.test';
import onExitTest from './inheritance/OnExitTest.test';
import onMessageErrorTest from './inheritance/OnMessageErrorTest.test';
import onMessageTest from './inheritance/OnMessageTest.test';

export default function testsuite() {
  arkTSUtilsTest();
  TaskPoolTest();
  TaskPoolErrorCodeTest();
  TaskPoolCoverageTest();
  workerTest();
  workerAddTest();
  workerErrorCodeTest();
  WorkerCoverageTest();
  concurrencyReturnCoveredTest();
  concurrencyCoveredSupplement();
  utilsCoverageTest();
  containerSerializeTest();

  threadWorkerInheritanceTest();
  errorEventInheritanceTest();
  messageEventsInheritanceTest();
  onAllErrorsTest();
  onErrorTest();
  onExitTest();
  onMessageErrorTest();
  onMessageTest();
}