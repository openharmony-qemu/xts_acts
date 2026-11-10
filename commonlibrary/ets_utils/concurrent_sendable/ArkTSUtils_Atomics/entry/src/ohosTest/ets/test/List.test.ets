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
import ArkTSUtilsAtomicsConcurrentTest from './ArkTSUtilsAtomicsConcurrentTest.test';
import ArkTSUtilsAtomicsEntryTest from './ArkTSUtilsAtomicsEntryTest.test';
import ArkTSUtilsAtomicsParameterTest from './ArkTSUtilsAtomicsParameterTest.test';
import ArkTSUtilsAtomicsWaitNotifyParameterTest from './ArkTSUtilsAtomicsWaitNotifyParameterTest.test';
import ArkTSUtilsTypedArrayAtomicsTest from './ArkTSUtilsTypedArrayAtomicsTest.test';
import ArkTSUtilsAtomicsAddTest from './ArkTSUtilsAtomics/ArkTSUtilsAtomicsAddTest.test';
import ArkTSUtilsAtomicsAndTest from './ArkTSUtilsAtomics/ArkTSUtilsAtomicsAndTest.test';
import ArkTSUtilsAtomicsApiSecondTest from './ArkTSUtilsAtomics/ArkTSUtilsAtomicsApiSecondTest.test';
import ArkTSUtilsAtomicsApiTest from './ArkTSUtilsAtomics/ArkTSUtilsAtomicsApiTest.test';
import ArkTSUtilsAtomicsApiThirdlyTest from './ArkTSUtilsAtomics/ArkTSUtilsAtomicsApiThirdlyTest.test';
import ArkTSUtilsAtomicsCombTest from './ArkTSUtilsAtomics/ArkTSUtilsAtomicsCombTest.test';
import ArkTSUtilsAtomicsCompareExchangeTest from './ArkTSUtilsAtomics/ArkTSUtilsAtomicsCompareExchangeTest.test';
import ArkTSUtilsAtomicsExchangeTest from './ArkTSUtilsAtomics/ArkTSUtilsAtomicsExchangeTest.test';
import ArkTSUtilsAtomicsFunctionTest from './ArkTSUtilsAtomics/ArkTSUtilsAtomicsFunctionTest.test';
import ArkTSUtilsAtomicsIsLockFreeTest from './ArkTSUtilsAtomics/ArkTSUtilsAtomicsIsLockFreeTest.test';
import ArkTSUtilsAtomicsLoadTest from './ArkTSUtilsAtomics/ArkTSUtilsAtomicsLoadTest.test';
import ArkTSUtilsAtomicsMultithreadTest from './ArkTSUtilsAtomics/ArkTSUtilsAtomicsMultithreadTest.test';
import ArkTSUtilsAtomicsOrTest from './ArkTSUtilsAtomics/ArkTSUtilsAtomicsOrTest.test';
import ArkTSUtilsAtomicsStoreTest from './ArkTSUtilsAtomics/ArkTSUtilsAtomicsStoreTest.test';
import ArkTSUtilsAtomicsSubTest from './ArkTSUtilsAtomics/ArkTSUtilsAtomicsSubTest.test';
import ArkTSUtilsAtomicsWaitTest from './ArkTSUtilsAtomics/ArkTSUtilsAtomicsWaitTest.test';
import ArkTSUtilsAtomicsXorTest from './ArkTSUtilsAtomics/ArkTSUtilsAtomicsXorTest.test';
import ArkTSUtilsAtomicsSupplementTest from './ArkTSUtilsAtomics/ArkTSUtilsAtomicsSupplementTest.test';

export default function testsuite(): void {
    ArkTSUtilsAtomicsSupplementTest();
}
