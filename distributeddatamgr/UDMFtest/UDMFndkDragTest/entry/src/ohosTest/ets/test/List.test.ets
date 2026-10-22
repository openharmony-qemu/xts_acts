/*
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
import UDMFNdkDragTest from './Ability.test';
import EmptyTest from './Empty.test';

/**
 * Register the test suites of this HAP. The NDK drag suite is only
 * registered when the device reports the UDMF.Core system capability;
 * otherwise the placeholder suite keeps the run alive.
 */
export default function testsuite() {
  if (canIUse("SystemCapability.DistributedDataManager.UDMF.Core")){
    UDMFNdkDragTest();
  } else {
    EmptyTest()
  }
}
