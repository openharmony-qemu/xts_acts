
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

import advertisingTest from './KitNearlinkAdvertising.test';
import scanTest from './KitNearlinkScan.test';
import remoteDeviceTest from './KitNearlinkRemoteDevice.test';
import constant from './KitNearlinkConstant.test';
import nearLinkManagerTest from './KitNearlinkManager.test';
import sSapTest from './KitNearlinkSsap.test';
import dataTransferTest from './KitNearlinkDataTransfer.test';
import nearlinkswitchoffCreateTest from './KitSwitchOffCreate.test';
import nearlinkswitchoffNormalTest from './KitSwitchOffNormal.test';
import nearlinkswitchoffCsdmTest from './KitSwitchOffCsdm.test';
import cdsmTest from './KitNearlinkCdsm.test';
import manager from '@ohos.nearlink.manager';
let support: boolean = false;
try {
  support = manager.isNearLinkSupported();
  console.info('[Nearlin_List] isNearLinkSupported result:' + support);
} catch (error) {
  console.error('[Nearlin_List] isNearLinkSupported get error:' + JSON.stringify(error.code));
}
export default function testsuite() {
  advertisingTest();
  scanTest();
  constant();
  nearLinkManagerTest();
  nearlinkswitchoffNormalTest();
  cdsmTest();
  nearlinkswitchoffCsdmTest();
  if (support) {
    //以下测试套都依赖create对象，若不支持的设备，在create时已返801，导致无法执行后续用例，故不支持设备不执行以下测试套。
    sSapTest();
    dataTransferTest();
    remoteDeviceTest();
    nearlinkswitchoffCreateTest();
  }
}
