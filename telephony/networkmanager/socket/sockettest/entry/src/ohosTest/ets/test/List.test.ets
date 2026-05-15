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
import socketErrorCodeTest from './socketErrorCode.test';
import localSocketTest from './localSocketTest.test';
import TCPSocketAsyncConnectTest from './TCPSocketAsyncConnect.test';
import connection from '@ohos.net.connection';
import EmptyTest from './Empty.test';

let netHandle = connection.getDefaultNetSync();

export default function testsuite() {
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