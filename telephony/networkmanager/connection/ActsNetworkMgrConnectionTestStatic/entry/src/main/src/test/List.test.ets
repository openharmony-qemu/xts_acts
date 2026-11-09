'use static';
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
import ConnectionTest from "./Connection.test";
import ConnectionPublicTest from "./ConnectionPublic.test";
import ConnectionUnMeteredTest from "./ConnectionUnMetered.test";
import ConnectionCallbackTest from "./ConnectionCallback.test";
import ConnectionPromiseTest from "./ConnectionPromise.test";
import ConnectionErrorCodeTest from "./ConnectionErrorCode.test";
import ConnectionHandleTest from "./ConnectionHandle.test";
import ConnectionUnicodeTest from "./ConnectionUnicode.test";
import ConnectionAsciiTest from "./ConnectionAscii.test";

import EmptyTest from './Empty.test';
import connection from '@ohos.net.connection';
import RefreshGlobalHttpProxy from './RefreshGlobalHttpProxy.test';

let isDefaultNet: boolean = connection.hasDefaultNetSync();
let isDefaultNetMetered: boolean = connection.isDefaultNetMeteredSync();

export default function testsuite(): void {
    if(isDefaultNet){
        ConnectionTest();
        ConnectionCallbackTest();
        ConnectionPromiseTest();
        ConnectionErrorCodeTest();
        ConnectionHandleTest();
        ConnectionUnicodeTest();
        ConnectionAsciiTest();
        RefreshGlobalHttpProxy();
        ConnectionPublicTest();
        if(!isDefaultNetMetered){
            ConnectionUnMeteredTest();
        }
    }else{
        EmptyTest();
    }

}
