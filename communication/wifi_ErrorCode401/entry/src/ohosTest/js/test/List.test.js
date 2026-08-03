/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import actsWifiErrorCode401Test from './ActWifiErrorCode401.test.js'
import wifiManager from '@ohos.wifiManager';

let iswifisupport = true;
try {
  iswifisupport = wifiManager.isWlanSupported();
  console.info('[WIFI_List] isWlanSupported result:' + iswifisupport);
} catch (error) {
  console.error('[WIFI_List] isWlanSupported get error:' + JSON.stringify(error.code) + JSON.stringify(error.message));
}
export default function testsuite() {
  if(iswifisupport){
    actsWifiErrorCode401Test()
  }
}

