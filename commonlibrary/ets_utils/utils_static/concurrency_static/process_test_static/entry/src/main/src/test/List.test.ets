'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import processTest from "./Process.test";
import ProcessAdditionalTest from './ProcessTest.test';
import ProcessSupplementSecondTest from './ProcessSupplementSecondTest.test';
import ProcessInterfacetTest from './ProcessInterfacetTest.test';
import ProcessSupplementTest from './ProcessSupplementTest.test';
import stdProcessOnUnhandledPromiseRejectionTest from './StdProcessOnPromiseRejection.test';
import stdProcessOnUncaughtErrorTest from './StdProcessOnUncaughtError.test';
import ProcessUidPidTidNonNegTest from './ProcessUidPidTidNonNegTest.test';
import ProcessRealtimeValueTest from './ProcessRealtimeValueTest.test';
import ProcessTaskpoolUidEnvTest from './ProcessTaskpoolUidEnvTest.test';
import EventListenerTest from './eventListener/EventListenerTest.test';
import ProcessManagerGetEnvironmentVarTest from './processManager/ProcessManagerGetEnvironmentVarTest.test';
import ProcessManagerGetSystemConfigTest from './processManager/ProcessManagerGetSystemConfigTest.test';
import ProcessManagerGetThreadPriorityTest from './processManager/ProcessManagerGetThreadPriorityTest.test';
import ProcessManagerGetUidForNameTest from './processManager/ProcessManagerGetUidForNameTest.test';
import ProcessManagerExitTest from './processManager/ProcessManagerExitTest.test';
import ProcessManagerIsAppUidTest from './processManager/ProcessManagerIsAppUidTest.test';
import ProcessManagerKillTest from './processManager/ProcessManagerKillTest.test';
import MessageConstructorCallbackTest from './processManager/MessageConstructorCallbackTest.test';
import StdProcessGetPastCpuTimeTest from './stdProcess/StdProcessGetPastCpuTimeTest.test';
import StdProcessAbortTest from './stdProcess/StdProcessAbortTest.test';
import StdProcessGetStartRealtimeTest from './stdProcess/StdProcessGetStartRealtimeTest.test';
import StdProcessIsBitTest from './stdProcess/StdProcessIsBitTest.test';
import StdProcessIsIsolatedTest from './stdProcess/StdProcessIsIsolatedTest.test';
import RejectedObjectListenerTest from './rejectedObjectListener/RejectedObjectListenerTest.test';
import StdProcessOnTest from './stdProcess/StdProcessOnTest.test';
import StdProcessOffTest from './stdProcess/StdProcessOffTest.test';
import StdProcessPidTest from './stdProcess/StdProcessPidTest.test';
import StdProcessTidTest from './stdProcess/StdProcessTidTest.test';
import StdProcessUidTest from './stdProcess/StdProcessUidTest.test';
import StdProcessUptimeTest from './stdProcess/StdProcessUptimeTest.test';
import UncaughtErrorListenerTest from './errorListener/UncaughtErrorListenerTest.test';
export default function testsuite(): void {
  processTest();
  ProcessSupplementTest();
  ProcessInterfacetTest();
  ProcessSupplementSecondTest();
  stdProcessOnUnhandledPromiseRejectionTest();
  stdProcessOnUncaughtErrorTest();
  ProcessAdditionalTest();
  ProcessUidPidTidNonNegTest();
  ProcessRealtimeValueTest();
  ProcessTaskpoolUidEnvTest();
  EventListenerTest();
  ProcessManagerGetEnvironmentVarTest();
  ProcessManagerGetSystemConfigTest();
  ProcessManagerGetThreadPriorityTest();
  ProcessManagerGetUidForNameTest();
  ProcessManagerExitTest();
  ProcessManagerIsAppUidTest();
  ProcessManagerKillTest();
  StdProcessGetPastCpuTimeTest();
  StdProcessAbortTest();
  StdProcessGetStartRealtimeTest();
  StdProcessIsBitTest();
  MessageConstructorCallbackTest();
  StdProcessIsIsolatedTest();
  RejectedObjectListenerTest();
  StdProcessOnTest();
  StdProcessOffTest();
  StdProcessPidTest();
  StdProcessTidTest();
  StdProcessUidTest();
  StdProcessUptimeTest();
  UncaughtErrorListenerTest();

}
