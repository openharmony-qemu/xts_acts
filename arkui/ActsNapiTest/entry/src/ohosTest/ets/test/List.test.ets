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
import bufferTest from './NapiBuffer.test';
import dataTest from './NapiData.test';
import stringTest from './NapiString.test';
import napiCallbackRiskLifecycleTest from './NapiCallbackRisk/NapiCallbackRiskLifecycle.test';
import napiCallbackRiskFinalizerTest from './NapiCallbackRisk/NapiCallbackRiskFinalizer.test';
import napiCallbackRiskAsyncTest from './NapiCallbackRisk/NapiCallbackRiskAsync.test';
import napiCallbackRiskJsModuleTest from './NapiCallbackRisk/NapiCallbackRiskJsModule.test';
import napiCallbackRiskNativeBindingTest from './NapiCallbackRisk/NapiCallbackRiskNativeBinding.test';

export default function testsuite() {
  bufferTest();
  dataTest();
  stringTest();
  
  napiCallbackRiskLifecycleTest();
  napiCallbackRiskFinalizerTest();
  napiCallbackRiskAsyncTest();
  napiCallbackRiskJsModuleTest();
  napiCallbackRiskNativeBindingTest();
}