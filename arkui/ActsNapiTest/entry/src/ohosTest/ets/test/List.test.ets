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

import napiCovThreadSafeTest from './napiCovThreadSafe.test';
import napiCovStrongRefTest from './napiCovStrongRef.test';
import napiCovStringTest from './napiCovString.test';
import napiCovSerializationTest from './napiCovSerialization.test';
import napiCovSendableTest from './napiCovSendable.test';
import napiCovPropertyTest from './napiCovProperty.test';
import napiCovPromiseAsyncTest from './napiCovPromiseAsync.test';
import napiCovPrimitiveTest from './napiCovPrimitive.test';
import napiCovObjectTest from './napiCovObject.test';
import napiCovModuleLoadTest from './napiCovModuleLoad.test';
import napiCovLifeCycleTest from './napiCovLifeCycle.test';
import napiCovFunctionTest from './napiCovFunction.test';
import napiCovFastObjTest from './napiCovFastObj.test';
import napiCovErrorTest from './napiCovError.test';
import napiCovEnvLifeCycleTest from './napiCovEnvLifeCycle.test';
import napiCovDateBigIntTest from './napiCovDateBigInt.test';
import napiCovCustomAsyncTest from './napiCovCustomAsync.test';
import napiCovCriticalSectionTest from './napiCovCriticalSection.test';
import napiCovClassWrapTest from './napiCovClassWrap.test';
import napiCovCallSiteInfoTest from './napiCovCallSiteInfo.test';
import napiCovBufferTest from './napiCovBuffer.test';
import napiCovBasicNumTest from './napiCovBasicNum.test';
import napiCovArrayBufferTest from './napiCovArrayBuffer.test';
import napiCovArrayTest from './napiCovArray.test';
import napiCovArkRuntimeTest from './napiCovArkRuntime.test';
import napiCovArkContextTest from './napiCovArkContext.test';
import napiCovAsyncTest from './NapiCovAsync.test';
import napiCovSpecDiffV8Test from './napiCovSpecDiffV8.test';

export default function testsuite() {
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
}
