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
import connection from '@ohos.net.connection';
import ConnectionRegisterTest from "./ConnectionResgister.test";
import ConnectionGetAddressesByNameWithOptionsTest from "./ConnectionGetAddressesByNameWithOptions.test";
import ConnectionBasicTest from "./ConnectionBasic.test";
import ConnectionEnhancedTestCellularTest from "./ConnectionEnhancedTestCellular.test";
import ConnectionEnhancedTestWifiTest from "./ConnectionEnhancedTestWifi.test";
import NetExtAttributeHasNet from "./NetExtAttributeHasNet.test";
import EmptyTest from './Empty.test';

let netHandle = connection.getDefaultNetSync();

export default function testsuite(): void {
  if(netHandle.netId !== 0){
    NetExtAttributeHasNet();
    ConnectionRegisterTest();
    ConnectionBasicTest();
    let NetCapabilities: connection.NetCapabilities = connection.getNetCapabilitiesSync(netHandle);
    // wifi test
    if (NetCapabilities.bearerTypes[0] === connection.NetBearType.BEARER_WIFI) {
      ConnectionEnhancedTestWifiTest();
    }
    // cellular test
    else if (NetCapabilities.bearerTypes[0] === connection.NetBearType.BEARER_CELLULAR) {
      ConnectionEnhancedTestCellularTest();
      ConnectionGetAddressesByNameWithOptionsTest();
    }
  } else {
    EmptyTest();
  }
}