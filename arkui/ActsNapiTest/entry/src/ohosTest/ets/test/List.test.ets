/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import napiCovThreadSafeTest from './NapiCovThreadSafe.test';
import napiCovStrongRefTest from './NapiCovStrongRef.test';
import napiCovStringTest from './NapiCovString.test';
import napiCovSerializationTest from './NapiCovSerialization.test';
import napiCovSendableTest from './NapiCovSendable.test';
import napiCovPropertyTest from './NapiCovProperty.test';
import napiCovPromiseAsyncTest from './NapiCovPromiseAsync.test';
import napiCovPrimitiveTest from './NapiCovPrimitive.test';
import napiCovObjectTest from './NapiCovObject.test';
import napiCovModuleLoadTest from './NapiCovModuleLoad.test';
import napiCovLifeCycleTest from './NapiCovLifeCycle.test';
import napiCovFunctionTest from './NapiCovFunction.test';
import napiCovFastObjTest from './NapiCovFastObj.test';
import napiCovErrorTest from './NapiCovError.test';
import napiCovEnvLifeCycleTest from './NapiCovEnvLifeCycle.test';
import napiCovDateBigIntTest from './NapiCovDateBigInt.test';
import napiCovCustomAsyncTest from './NapiCovCustomAsync.test';
import napiCovCriticalSectionTest from './NapiCovCriticalSection.test';
import napiCovClassWrapTest from './NapiCovClassWrap.test';
import napiCovCallSiteInfoTest from './NapiCovCallSiteInfo.test';
import napiCovBufferTest from './NapiCovBuffer.test';
import napiCovBasicNumTest from './NapiCovBasicNum.test';
import napiCovArrayBufferTest from './NapiCovArrayBuffer.test';
import napiCovArrayTest from './NapiCovArray.test';
import napiCovArkRuntimeTest from './NapiCovArkRuntime.test';
import napiCovArkContextTest from './NapiCovArkContext.test';
import napiCovAsyncTest from './NapiCovAsync.test';
import napiCovSpecDiffV8Test from './NapiCovSpecDiffV8.test';
import napiCoverAddBatch1StablePart1Test from './NapiCoverAdd/batch1/NapiCoverAddBatch1StablePart1.test';
import napiCoverAddBatch1StablePart2Test from './NapiCoverAdd/batch1/NapiCoverAddBatch1StablePart2.test';
import napiCoverAddBatch2LifecycleTest from './NapiCoverAdd/batch2/NapiCoverAddBatch2Lifecycle.test';
import napiCoverAddBatch3RuntimeSendableTest from './NapiCoverAdd/batch3/NapiCoverAddBatch3RuntimeSendable.test';
import napiCoverAddBatch4StressProbeTest from './NapiCoverAdd/batch4/NapiCoverAddBatch4StressProbe.test';
import bufferTest from './NapiBuffer.test';
import dataTest from './NapiData.test';
import stringTest from './NapiString.test';
import complexScenariosTest from './napiComplexScenarios.test';
import napiCallbackRiskLifecycleTest from './NapiCallbackRisk/NapiCallbackRiskLifecycle.test';
import napiCallbackRiskFinalizerTest from './NapiCallbackRisk/NapiCallbackRiskFinalizer.test';
import napiCallbackRiskAsyncTest from './NapiCallbackRisk/NapiCallbackRiskAsync.test';
import napiCallbackRiskJsModuleTest from './NapiCallbackRisk/NapiCallbackRiskJsModule.test';
import napiCallbackRiskNativeBindingTest from './NapiCallbackRisk/NapiCallbackRiskNativeBinding.test';
import napiSpecDiffBatch1StableTest from './NapiSpecDiff/batch1/NapiSpecDiffBatch1Stable.test';
import napiSpecDiffBatch2LifecycleTest from './NapiSpecDiff/batch2/NapiSpecDiffBatch2Lifecycle.test';
import napiSpecDiffBatch3RuntimeSendableTest from './NapiSpecDiff/batch3/NapiSpecDiffBatch3RuntimeSendable.test';
import napiSpecDiffBatch4StressProbeTest from './NapiSpecDiff/batch4/NapiSpecDiffBatch4StressProbe.test';
import napiCoverageSampleTest from './NapiCoverageSample/NapiCoverageSample.test';
import mallocCoverageSampleTest from './MallocCoverageSample/MallocCoverageSample.test';

export default function testsuite() {
  napiCovThreadSafeTest();
  napiCovStrongRefTest();
  napiCovStringTest();
  napiCovSerializationTest();
  napiCovSendableTest();
  napiCovPropertyTest();
  napiCovPromiseAsyncTest();
  napiCovPrimitiveTest();
  napiCovObjectTest();
  napiCovModuleLoadTest();
  napiCovLifeCycleTest();
  napiCovFunctionTest();
  napiCovFastObjTest();
  napiCovErrorTest();
  napiCovEnvLifeCycleTest();
  napiCovDateBigIntTest();
  napiCovCustomAsyncTest();
  napiCovCriticalSectionTest();
  napiCovClassWrapTest();
  napiCovCallSiteInfoTest();
  napiCovBufferTest();
  napiCovBasicNumTest();
  napiCovArrayBufferTest();
  napiCovArrayTest();
  napiCovArkRuntimeTest();
  napiCovArkContextTest();
  napiCovAsyncTest();
  napiCovSpecDiffV8Test();
  bufferTest();
  dataTest();
  stringTest();
  complexScenariosTest();
  napiCallbackRiskLifecycleTest();
  napiCallbackRiskFinalizerTest();
  napiCallbackRiskAsyncTest();
  napiCallbackRiskJsModuleTest();
  napiCallbackRiskNativeBindingTest();
  napiSpecDiffBatch1StableTest();
  napiSpecDiffBatch2LifecycleTest();
  napiSpecDiffBatch3RuntimeSendableTest();
  napiSpecDiffBatch4StressProbeTest();
  napiCoverAddBatch1StablePart1Test();
  napiCoverAddBatch1StablePart2Test();
  napiCoverAddBatch2LifecycleTest();
  napiCoverAddBatch3RuntimeSendableTest();
  napiCoverAddBatch4StressProbeTest();
  napiCoverageSampleTest();
  mallocCoverageSampleTest();
}
