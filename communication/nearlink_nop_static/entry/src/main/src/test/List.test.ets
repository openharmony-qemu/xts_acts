'use static'
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

import nearLinkErrCode201Test from './NearLinkErrCode201.test';
import nearLinkErrCodeCreate201Test from './NearLinkCreateErrCode201.test';
import manager from '@ohos.nearlink.manager';
import hilog from '@ohos.hilog';

let support: boolean = false;
try {
  support = manager.isNearLinkSupported();
  hilog.info(0x0000, 'testTag', '%{public}s', '[Nearlin_List] isNearLinkSupported result:' + support);
} catch (error) {
  hilog.error(0x0000, 'testTag', '%{public}s', '[Nearlin_List] isNearLinkSupported get error:' + JSON.stringify(error.code));
}

try {
  let state: manager.NearlinkState = manager.NearlinkState.STATE_OFF;
  state = manager.getState();
  hilog.info(0x0000, 'testTag', '%{public}s', 'get sle state result:' + JSON.stringify(state));
} catch (error) {
  hilog.info(0x0000, 'testTag', '%{public}s', 'nearlink api getState get error:' + JSON.stringify(error));
  if (error.code === 801) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'nearlink api is not support');
  }
}

export default function testsuite(): void {
  nearLinkErrCode201Test();
  if (support){
    //以下测试套都依赖create对象，若不支持的设备，在create时已返801，导致无法执行后续用例，故不支持设备不执行以下测试套。
    nearLinkErrCodeCreate201Test();
  }
}
