/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import nearLinkErrCode201Test from './nearLinkErrCode201.test';
import nearLinkErrCodeCreate201Test from './nearLinkCreateErrCode201.test';
import manager from '@ohos.nearlink.manager';

let support: boolean = false;
try {
  support = manager.isNearLinkSupported();
  console.info('[Nearlin_List] isNearLinkSupported result:' + support);
} catch (error) {
  console.error('[Nearlin_List] isNearLinkSupported get error:' + JSON.stringify(error.code));
}

try {
  let state: manager.NearlinkState = manager.NearlinkState.STATE_OFF;
  state = manager.getState();
  console.info('get sle state result:' + JSON.stringify(state));
} catch (error) {
  console.info('nearlink api getState get error:' + JSON.stringify(error));
  if (error.code == 801) {
    console.info('nearlink api is not support');
  }
}

export default function testsuite() {
  nearLinkErrCode201Test();
  if(support){
    //以下测试套都依赖create对象，若不支持的设备，在create时已返801，导致无法执行后续用例，故不支持设备不执行以下测试套。
    nearLinkErrCodeCreate201Test();
  }
}