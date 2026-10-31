'use static';
/**
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

import EmptyTest from './Empty.test';
import connection from '@ohos.net.connection';
import TCPSocketTest from './TCPSocket.test';
import TLSSocketServerTest from './TlsSocketServer.test';
import UDPSocket from './UDPSocket.test';
import TLSSocket from './TLSSocket.test';
import TLSSocketsTest from './TLSSockets.test';
import MulticastSocket from './MulticastSocket.test';
import TCPSocketServerTest from './TCPSocketServer.test';
import tlsSocketConnectionTest from './TlsSocketConnection.test';
import TLSSocketConnectionsTest from './TLSSocketConnections.test';
import TCPSocketConnectionTest from './TCPSocketConnection.test';
import SocketGetLocalAddressTest from './SocketGetLocalAddress.test';
import TLSSocketUpgradeTest from './TLSSocketUpgrade.test';
import TlsSkipRemoteValidationTest from './TlsSkipRemoteValidation.test';
import socketErrorCodeTest from './SocketErrorCode.test';
import localSocketTest from './LocalSocketTest.test';
import TCPSocketAsyncConnectTest from './TCPSocketAsyncConnect.test';
import { canIUse } from '@internal.full.global';

let netHandle = connection.getDefaultNetSync();

export default function testsuite(): void {
    if (netHandle.netId != 0 && canIUse("SystemCapability.Communication.NetStack")) {
        TLSSocketServerTest();
        socketErrorCodeTest();
        localSocketTest();
        UDPSocket();
        TLSSocket();
        TLSSocketsTest();
        TCPSocketTest();
        TCPSocketConnectionTest();
        MulticastSocket();
        TCPSocketServerTest();
        tlsSocketConnectionTest();
        TLSSocketConnectionsTest();
        SocketGetLocalAddressTest();
        TLSSocketUpgradeTest();
        TlsSkipRemoteValidationTest();
        TCPSocketAsyncConnectTest();
    } else {
        EmptyTest();
    }
}
