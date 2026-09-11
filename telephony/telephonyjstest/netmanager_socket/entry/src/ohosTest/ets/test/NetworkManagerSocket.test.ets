/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, beforeAll, afterAll, Level, Size, TestType } from '@ohos/hypium';
import socket from '@ohos.net.socket';
import { BusinessError } from '@ohos.base';

let sendData = "hello!";
let instance = undefined;



let options: socket.TLSConnectOptions = {
  ALPNProtocols: ["http/1.1"],
  address: {
    address: "www.example.com",
    port: 443,
    family: 1
  },
  secureOptions: {
    key: "key",
    cert: "cert",
    ca: ["ca"],
    password: "123456",
    protocols: [socket.Protocol.TLSv12, socket.Protocol.TLSv13],
    useRemoteCipherPrefer: true,
    signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
    cipherSuite: "AES256-SHA256"
  },
}

export default function networkManagerSocketTest() {

  describe("Telephony_NetworkManager_SocketTest", () => {
    beforeAll(async () => {
      const caseName = 'Telephony_NetworkManager_ActsNetworkManagerSocketTest';
      console.log(`${caseName} + beforeAll start`);
      console.log(`${caseName} + beforeAll end`);
    });
    afterAll(async () => {
      const caseName = 'Telephony_NetworkManager_ActsNetworkManagerSocketTest';
      console.log(`${caseName} + afterAll start`);
      console.log(`${caseName} + afterAll end`);
    });
    /**
     * @tc.name   Telephony_NetworkManager_constructTLSSocketInstance_0100
     * @tc.number Telephony_NetworkManager_constructTLSSocketInstance_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_constructTLSSocketInstance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_NetworkManager_constructTLSSocketInstance_0100';
        console.log(`${caseName} + start`);
        let tlsInstance = socket.constructTLSSocketInstance();
        console.log(`${caseName} + , TLS Socket instance created, isNull=` + (tlsInstance == null));
        expect(tlsInstance != null).assertEqual(true);
        console.log(`${caseName} + end`);
        done();
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_NetworkManager_connect_Async_0100
     * @tc.number Telephony_NetworkManager_connect_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_connect_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_NetworkManager_connect_Async_0100';
        console.log(`${caseName} + start`);
        let instance = socket.constructTLSSocketInstance();
        instance.connect(options, (err) => {
          console.log(`${caseName} + ALPNProtocols=` + JSON.stringify(options.ALPNProtocols));
          expect(options.ALPNProtocols != undefined).assertEqual(true);
          console.log(`${caseName} + address=` + JSON.stringify(options.address));
          expect(options.address != undefined).assertEqual(true);
          console.log(`${caseName} + secureOptions=` + JSON.stringify(options.secureOptions));
          expect(options.secureOptions != undefined).assertEqual(true);
          console.log(`${caseName} + secureOptions.key=` + JSON.stringify(options.secureOptions.key));
          expect(options.secureOptions.key != undefined).assertEqual(true);
          console.log(`${caseName} + secureOptions.cert=` + JSON.stringify(options.secureOptions.cert));
          expect(options.secureOptions.cert != undefined).assertEqual(true);
          console.log(`${caseName} + secureOptions.ca=` + JSON.stringify(options.secureOptions.ca));
          expect(options.secureOptions.ca != undefined).assertEqual(true);
          console.log(`${caseName} + secureOptions.password=` + JSON.stringify(options.secureOptions.password));
          expect(options.secureOptions.password != undefined).assertEqual(true);
          console.log(`${caseName} + secureOptions.protocols=` + JSON.stringify(options.secureOptions.protocols));
          expect(options.secureOptions.protocols != undefined).assertEqual(true);
          console.log(`${caseName} + secureOptions.useRemoteCipherPrefer=` + JSON.stringify(options.secureOptions.useRemoteCipherPrefer));
          expect(options.secureOptions.useRemoteCipherPrefer != undefined).assertEqual(true);
          console.log(`${caseName} + secureOptions.signatureAlgorithms=` + JSON.stringify(options.secureOptions.signatureAlgorithms));
          expect(options.secureOptions.signatureAlgorithms != undefined).assertEqual(true);
          console.log(`${caseName} + secureOptions.cipherSuite=` + JSON.stringify(options.secureOptions.cipherSuite));
          expect(options.secureOptions.cipherSuite != undefined).assertEqual(true);
          console.log(`${caseName} + end, err=` + JSON.stringify(err));
          if (err == undefined) {
            expect().assertFail();
            done();
          } else {
            console.log(`${caseName} + err.code=` + err.code);
            expect(err != undefined).assertEqual(true);
            expect(err.code).assertEqual(2303600);
            done();
          }
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_NetworkManager_connect_Promise_0100
     * @tc.number Telephony_NetworkManager_connect_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_connect_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_NetworkManager_connect_Promise_0100';
        console.log(`${caseName} + start`);
        let instance = socket.constructTLSSocketInstance();
        instance.connect(options).then(() => {
          console.log(`${caseName} + end, success`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} + end, err=` + JSON.stringify(err));
          console.log(`${caseName} + err.code=` + err.code);
          expect(err != undefined).assertEqual(true);
          expect(err.code).assertEqual(2303600);
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_NetworkManager_close_Async_0100
     * @tc.number Telephony_NetworkManager_close_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_close_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_NetworkManager_close_Async_0100';
        console.log(`${caseName} + start`);
        let instance = socket.constructTLSSocketInstance();
        instance.close((err: BusinessError) => {
          console.log(`${caseName} + end, err=` + JSON.stringify(err));
          console.log(`${caseName} + err.code=` + err.code);
          expect(err != undefined).assertEqual(true);
          expect(err.code).assertEqual(2303600);
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_NetworkManager_close_Promise_0100
     * @tc.number Telephony_NetworkManager_close_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_close_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_NetworkManager_close_Promise_0100';
        console.log(`${caseName} + start`);
        let instance = socket.constructTLSSocketInstance();
        instance.close().then(() => {
          console.log(`${caseName} + end, success`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} + end, err=` + JSON.stringify(err));
          console.log(`${caseName} + err.code=` + err.code);
          expect(err != undefined).assertEqual(true);
          expect(err.code).assertEqual(2303600);
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_NetworkManager_getCertificate_Async_0100
     * @tc.number Telephony_NetworkManager_getCertificate_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_getCertificate_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_NetworkManager_getCertificate_Async_0100';
        console.log(`${caseName} + start`);
        let instance = socket.constructTLSSocketInstance();
        instance.getCertificate((err: BusinessError, data) => {
          console.log(`${caseName} + end, err=` + JSON.stringify(err));
          console.log(`${caseName} + err.code=` + err.code);
          expect(err != undefined).assertEqual(true);
          expect(err.code).assertEqual(2303600);
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_NetworkManager_getCertificate_Promise_0100
     * @tc.number Telephony_NetworkManager_getCertificate_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_getCertificate_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_NetworkManager_getCertificate_Promise_0100';
        console.log(`${caseName} + start`);
        let instance = socket.constructTLSSocketInstance();
        instance.getCertificate().then((data) => {
          console.log(`${caseName} + end, success`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} + end, err=` + JSON.stringify(err));
          console.log(`${caseName} + err.code=` + err.code);
          expect(err != undefined).assertEqual(true);
          expect(err.code).assertEqual(2303600);
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_NetworkManager_getRemoteCertificate_Async_0100
     * @tc.number Telephony_NetworkManager_getRemoteCertificate_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_getRemoteCertificate_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_NetworkManager_getRemoteCertificate_Async_0100';
        console.log(`${caseName} + start`);
        let instance = socket.constructTLSSocketInstance();
        instance.getRemoteCertificate((err: BusinessError, data) => {
          console.log(`${caseName} + end, err=` + JSON.stringify(err));
          console.log(`${caseName} + err.code=` + err.code);
          expect(err != undefined).assertEqual(true);
          expect(err.code).assertEqual(2303600);
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_NetworkManager_getRemoteCertificate_Promise_0100
     * @tc.number Telephony_NetworkManager_getRemoteCertificate_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_getRemoteCertificate_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_NetworkManager_getRemoteCertificate_Promise_0100';
        console.log(`${caseName} + start`);
        let instance = socket.constructTLSSocketInstance();
        instance.getRemoteCertificate().then((data) => {
          console.log(`${caseName} + end, success`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} + end, err=` + JSON.stringify(err));
          console.log(`${caseName} + err.code=` + err.code);
          expect(err != undefined).assertEqual(true);
          expect(err.code).assertEqual(2303600);
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_NetworkManager_getProtocol_Async_0100
     * @tc.number Telephony_NetworkManager_getProtocol_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_getProtocol_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_NetworkManager_getProtocol_Async_0100';
        console.log(`${caseName} + start`);
        let instance = socket.constructTLSSocketInstance();
        instance.getProtocol((err: BusinessError, data) => {
          console.log(`${caseName} + end, err=` + JSON.stringify(err));
          console.log(`${caseName} + err.code=` + err.code);
          expect(err != undefined).assertEqual(true);
          expect(err.code).assertEqual(2303600);
          if (data !== undefined) {
            expect(typeof data).assertEqual('string');
          }
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_NetworkManager_getProtocol_Promise_0100
     * @tc.number Telephony_NetworkManager_getProtocol_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_getProtocol_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_NetworkManager_getProtocol_Promise_0100';
        console.log(`${caseName} + start`);
        let instance = socket.constructTLSSocketInstance();
        instance.getProtocol().then((data) => {
          console.log(`${caseName} + end, success, data=` + JSON.stringify(data));
          expect(data != undefined).assertEqual(true);
          expect(typeof data).assertEqual('string');
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} + end, err=` + JSON.stringify(err));
          console.log(`${caseName} + err.code=` + err.code);
          expect(err != undefined).assertEqual(true);
          expect(err.code).assertEqual(2303600);
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_NetworkManager_getCipherSuites_Async_0100
     * @tc.number Telephony_NetworkManager_getCipherSuites_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_getCipherSuites_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_NetworkManager_getCipherSuites_Async_0100';
        console.log(`${caseName} + start`);
        let instance = socket.constructTLSSocketInstance();
        instance.getCipherSuite((err: BusinessError, data) => {
          console.log(`${caseName} + end, err=` + JSON.stringify(err));
          console.log(`${caseName} + err.code=` + err.code);
          expect(err != undefined).assertEqual(true);
          expect(err.code).assertEqual(2303600);
          // 接口 AsyncCallback<Array<string>> 声明 data 为 Array<string> 类型，未声明 undefined，移除对 undefined 的断言
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_NetworkManager_getCipherSuites_Promise_0100
     * @tc.number Telephony_NetworkManager_getCipherSuites_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_getCipherSuites_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_NetworkManager_getCipherSuites_Promise_0100';
        console.log(`${caseName} + start`);
        let instance = socket.constructTLSSocketInstance();
        instance.getCipherSuite().then((data) => {
          console.log(`${caseName} + end, success`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} + end, err=` + JSON.stringify(err));
          console.log(`${caseName} + err.code=` + err.code);
          expect(err != undefined).assertEqual(true);
          expect(err.code).assertEqual(2303600);
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_NetworkManager_getSignatureAlgorithms_Async_0100
     * @tc.number Telephony_NetworkManager_getSignatureAlgorithms_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_getSignatureAlgorithms_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_NetworkManager_getSignatureAlgorithms_Async_0100';
        console.log(`${caseName} + start`);
        let instance = socket.constructTLSSocketInstance();
        instance.getSignatureAlgorithms((err: BusinessError, data) => {
          console.log(`${caseName} + end, err=` + JSON.stringify(err));
          console.log(`${caseName} + err.code=` + err.code);
          expect(err != undefined).assertEqual(true);
          expect(err.code).assertEqual(2303600);
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_NetworkManager_getSignatureAlgorithms_Promise_0100
     * @tc.number Telephony_NetworkManager_getSignatureAlgorithms_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_getSignatureAlgorithms_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_NetworkManager_getSignatureAlgorithms_Promise_0100';
        console.log(`${caseName} + start`);
        let instance = socket.constructTLSSocketInstance();
        instance.getSignatureAlgorithms().then((data) => {
          console.log(`${caseName} + end, success`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} + end, err=` + JSON.stringify(err));
          console.log(`${caseName} + err.code=` + err.code);
          expect(err != undefined).assertEqual(true);
          expect(err.code).assertEqual(2303600);
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_NetworkManager_send_Async_0100
     * @tc.number Telephony_NetworkManager_send_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_send_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_NetworkManager_send_Async_0100';
        console.log(`${caseName} + start`);
        let instance = socket.constructTLSSocketInstance();
        instance.send(sendData, (err: BusinessError) => {
          console.log(`${caseName} + end, err=` + JSON.stringify(err));
          console.log(`${caseName} + err.code=` + err.code);
          expect(err != undefined).assertEqual(true);
          expect(err.code).assertEqual(2303600);
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_NetworkManager_send_Promise_0100
     * @tc.number Telephony_NetworkManager_send_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_NetworkManager_send_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_NetworkManager_send_Promise_0100';
        console.log(`${caseName} + start`);
        let instance = socket.constructTLSSocketInstance();
        instance.send(sendData).then(() => {
          console.log(`${caseName} + end, success`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${caseName} + end, err=` + JSON.stringify(err));
          console.log(`${caseName} + err.code=` + err.code);
          expect(err != undefined).assertEqual(true);
          expect(err.code).assertEqual(2303600);
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_TLSSocket_on_message_0100
     * @tc.number Telephony_TLSSocket_on_message_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_TLSSocket_on_message_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_TLSSocket_on_message_0100';
        console.log(`${caseName} + start`);
        let tls = socket.constructTLSSocketInstance();
        expect(tls != null).assertEqual(true);
        tls.on('message', (value: socket.SocketMessageInfo) => {
          console.log(`${caseName} + , message: ` + JSON.stringify(value.message));
          console.log(`${caseName} + , remoteInfo: ` + JSON.stringify(value.remoteInfo));
        });
        console.log(`${caseName} + end`);
        done();
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_TLSSocket_off_message_0100
     * @tc.number Telephony_TLSSocket_off_message_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_TLSSocket_off_message_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_TLSSocket_off_message_0100';
        console.log(`${caseName} + start`);
        let tls = socket.constructTLSSocketInstance();
        expect(tls != null).assertEqual(true);
        let callback = (value: socket.SocketMessageInfo) => {
          console.log(`${caseName} + , message: ` + JSON.stringify(value.message));
          console.log(`${caseName} + , remoteInfo: ` + JSON.stringify(value.remoteInfo));
        };
        tls.on('message', callback);
        tls.off('message', callback);
        console.log(`${caseName} + end`);
        done();
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_TLSSocket_off_message_0200
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_OffMessage_0200
     * @tc.desc   Function test - off('message') without callback parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_TLSSocket_off_message_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_TLSSocket_off_message_0200';
        console.log(`${caseName} + start`);
        let tls = socket.constructTLSSocketInstance();
        expect(tls != null).assertEqual(true);
        let callback = (value: socket.SocketMessageInfo) => {
          console.log(`${caseName} + , message: ` + JSON.stringify(value.message));
          console.log(`${caseName} + , remoteInfo: ` + JSON.stringify(value.remoteInfo));
        };
        tls.on('message', callback);
        tls.off('message');
        console.log(`${caseName} + end`);
        done();
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_TLSSocket_on_connect_on_close_0100
     * @tc.number Telephony_TLSSocket_on_connect_on_close_0100
     * @tc.desc   Function test - connect to real server to trigger events
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_TLSSocket_on_connect_on_close_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_TLSSocket_on_connect_on_close_0100';
        console.log(`${caseName} + start`);
        let tls = socket.constructTLSSocketInstance();
        expect(tls != null).assertEqual(true);
        tls.on('connect', () => {
          console.log(`${caseName} + , on connect success`);
          tls.close((err: BusinessError) => {
            console.log(`${caseName} + , close callback, err=` + JSON.stringify(err));
          });
        });
        tls.on('close', () => {
          console.log(`${caseName} + , on close success`);
          console.log(`${caseName} + end`);
          done();
        });
        tls.connect(options, (err: BusinessError) => {
          console.log(`${caseName} + , connect callback, err=` + JSON.stringify(err));
          if (err == undefined) {
            console.log(`${caseName} + connect success`);
          } else {
            console.log(`${caseName} + , connect error code=` + err.code);
            expect(err.code).assertEqual(2303600);
            console.log(`${caseName} + end`);
            done();
          }
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_TLSSocket_off_connect_off_close_0100
     * @tc.number Telephony_TLSSocket_off_connect_off_close_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_TLSSocket_off_connect_off_close_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_TLSSocket_off_connect_off_close_0100';
        console.log(`${caseName} + start`);
        let tls = socket.constructTLSSocketInstance();
        expect(tls != null).assertEqual(true);
        let callback1 = () => {
          console.log(`${caseName} + , on connect success`);
        };
        tls.on('connect', callback1);
        tls.off('connect', callback1);
        tls.off('connect');
        let callback2 = () => {
          console.log(`${caseName} + , on close success`);
        };
        tls.on('close', callback2);
        tls.off('close', callback2);
        console.log(`${caseName} + end`);
        done();
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_TLSSocket_off_close_all_0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_OffCloseAll_0100
     * @tc.desc   Function test - off('close') without callback removes all listeners
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_TLSSocket_off_close_all_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_TLSSocket_off_close_all_0100';
        console.log(`${caseName} + start`);
        let tls = socket.constructTLSSocketInstance();
        expect(tls != null).assertEqual(true);
        let cb1Called = false;
        let cb2Called = false;
        let cb3Called = false;
        let cb1 = () => {
          cb1Called = true;
          console.log(`${caseName} + , cb1 fired`);
        };
        let cb2 = () => {
          cb2Called = true;
          console.log(`${caseName} + , cb2 fired`);
        };
        let cb3 = () => {
          cb3Called = true;
          console.log(`${caseName} + , cb3 fired`);
        };
        tls.on('close', cb1);
        tls.on('close', cb2);
        tls.on('close', cb3);
        tls.off('close');
        tls.on('close', () => {
          console.log(`${caseName} + , new close listener fired`);
          console.log(`${caseName} + end`);
          done();
        });
        tls.on('connect', () => {
          console.log(`${caseName} + , on connect success`);
          tls.close((err: BusinessError) => {
            console.log(`${caseName} + , close callback, err=` + JSON.stringify(err));
            if (err == undefined) {
              expect(cb1Called).assertEqual(false);
              expect(cb2Called).assertEqual(false);
              expect(cb3Called).assertEqual(false);
            }
          });
        });
        tls.connect(options, (err: BusinessError) => {
          if (err == undefined) {
            console.log(`${caseName} + connect success`);
          } else {
            console.log(`${caseName} + connect err=` + JSON.stringify(err));
            console.log(`${caseName} + err.code=` + err.code);
            expect(err.code).assertEqual(2303600);
            console.log(`${caseName} + end`);
            done();
          }
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_TLSSocket_on_error_0100
     * @tc.number Telephony_TLSSocket_on_error_0100
     * @tc.desc   Function test - trigger error event by connecting to invalid address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_TLSSocket_on_error_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_TLSSocket_on_error_0100';
        console.log(`${caseName} + start`);
        let tls = socket.constructTLSSocketInstance();
        expect(tls != null).assertEqual(true);
        tls.on('error', (err: BusinessError) => {
          console.log(`${caseName} + , on error, err:` + JSON.stringify(err));
          console.log(`${caseName} + , on error code=` + err.code);
        });
        let badOptions: socket.TLSConnectOptions = {
          address: {
            address: "0.0.0.0",
            port: 1,
            family: 1
          },
          secureOptions: {
            protocols: [socket.Protocol.TLSv12, socket.Protocol.TLSv13],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256"
          }
        };
        tls.connect(badOptions, (err: BusinessError) => {
          console.log(`${caseName} + , connect callback, err=` + JSON.stringify(err));
          console.log(`${caseName} + , connect error code=` + err.code);
          expect(err.code).assertEqual(2303600);
          console.log(`${caseName} + end`);
          done();
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_TLSSocket_off_error_0100
     * @tc.number Telephony_TLSSocket_off_error_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_TLSSocket_off_error_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_TLSSocket_off_error_0100';
        console.log(`${caseName} + start`);
        let tls = socket.constructTLSSocketInstance();
        expect(tls != null).assertEqual(true);
        let callbackCalled = false;
        let callback = (err: BusinessError) => {
          callbackCalled = true;
          console.log(`${caseName} + , on error, err:` + JSON.stringify(err));
        };
        tls.on('error', callback);
        tls.off('error', callback);
        console.log(`${caseName} + , off done`);
        let badOptions: socket.TLSConnectOptions = {
          address: {
            address: "0.0.0.0",
            port: 1,
            family: 1
          },
          secureOptions: {
            protocols: [socket.Protocol.TLSv12, socket.Protocol.TLSv13],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256"
          }
        };
        tls.connect(badOptions, (err: BusinessError) => {
          console.log(`${caseName} + , connect callback, err=` + JSON.stringify(err));
          if (err != undefined) {
            console.log(`${caseName} + err.code=` + err.code);
            expect(err.code).assertEqual(2303600);

            expect(callbackCalled).assertEqual(false);
            console.log(`${caseName} + end`);
            done();
          }
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_TLSSocket_off_error_all_0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_OffErrorAll_0100
     * @tc.desc   Function test - off('error') without callback removes all listeners
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_TLSSocket_off_error_all_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_TLSSocket_off_error_all_0100';
        console.log(`${caseName} + start`);
        let tls = socket.constructTLSSocketInstance();
        expect(tls != null).assertEqual(true);
        let cb1Called = false;
        let cb2Called = false;
        let cb1 = (err: BusinessError) => {
          cb1Called = true;
          console.log(`${caseName} + , cb1 fired, err=` + err.code);
        };
        let cb2 = (err: BusinessError) => {
          cb2Called = true;
          console.log(`${caseName} + , cb2 fired, err=` + err.code);
        };
        tls.on('error', cb1);
        tls.on('error', cb2);
        tls.off('error');
        console.log(`${caseName} + , off('error') done`);
        let badOptions: socket.TLSConnectOptions = {
          address: {
            address: "0.0.0.0",
            port: 1,
            family: 1
          },
          secureOptions: {
            protocols: [socket.Protocol.TLSv12, socket.Protocol.TLSv13],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256"
          }
        };
        tls.connect(badOptions, (err: BusinessError) => {
          console.log(`${caseName} + , connect callback, err=` + JSON.stringify(err));
          if (err != undefined) {
            console.log(`${caseName} + err.code=` + err.code);
            expect(err.code).assertEqual(2303600);
            expect(cb1Called).assertEqual(false);
            expect(cb2Called).assertEqual(false);
            console.log(`${caseName} + end`);
            done();
          }
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_TLSSocket_on_error_multi_callback_0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_OnErrorMultiCallback_0100
     * @tc.desc   Function test - multiple callbacks on on('error') event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_TLSSocket_on_error_multi_callback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_TLSSocket_on_error_multi_callback_0100';
        console.log(`${caseName} + start`);
        let tls = socket.constructTLSSocketInstance();
        expect(tls != null).assertEqual(true);
        let cbCount = 0;
        tls.on('error', (err: BusinessError) => {
          cbCount++;
          console.log(`${caseName} + , cb1 fired, err=` + err.code + ', count=' + cbCount);
        });
        tls.on('error', (err: BusinessError) => {
          cbCount++;
          console.log(`${caseName} + , cb2 fired, err=` + err.code + ', count=' + cbCount);
        });
        tls.on('error', (err: BusinessError) => {
          cbCount++;
          console.log(`${caseName} + , cb3 fired, err=` + err.code + ', count=' + cbCount);
          expect(cbCount).assertEqual(3);
        });
        let badOptions: socket.TLSConnectOptions = {
          address: {
            address: "0.0.0.0",
            port: 1,
            family: 1
          },
          secureOptions: {
            protocols: [socket.Protocol.TLSv12, socket.Protocol.TLSv13],
            useRemoteCipherPrefer: true,
            signatureAlgorithms: "rsa_pss_rsae_sha256:ECDSA+SHA256",
            cipherSuite: "AES256-SHA256"
          }
        };
        tls.connect(badOptions, (err: BusinessError) => {
          console.log(`${caseName} + , connect callback, err=` + JSON.stringify(err));
          if (err != undefined) {
            console.log(`${caseName} + err.code=` + err.code);
            expect(err.code).assertEqual(2303600);
            console.log(`${caseName} + end`);
            done();
          }
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_TLSSocket_on_connect_multi_callback_0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_OnConnectMultiCallback_0100
     * @tc.desc   Function test - multiple callbacks on on('connect') event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_TLSSocket_on_connect_multi_callback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_TLSSocket_on_connect_multi_callback_0100';
        console.log(`${caseName} + start`);
        let tls = socket.constructTLSSocketInstance();
        expect(tls != null).assertEqual(true);
        let cb1Called = false;
        let cb2Called = false;
        let cb3Called = false;
        tls.on('connect', () => {
          cb1Called = true;
          console.log(`${caseName} + , cb1 fired`);
        });
        tls.on('connect', () => {
          cb2Called = true;
          console.log(`${caseName} + , cb2 fired`);
        });
        tls.on('connect', () => {
          cb3Called = true;
          console.log(`${caseName} + , cb3 fired`);
        });
        tls.on('close', () => {
          console.log(`${caseName} + , on close success`);
          expect(cb1Called).assertEqual(true);
          expect(cb2Called).assertEqual(true);
          expect(cb3Called).assertEqual(true);
          console.log(`${caseName} + end`);
          done();
        });
        tls.connect(options, (err: BusinessError) => {
          if (err == undefined) {
            console.log(`${caseName} + connect success`);
          } else {
            console.log(`${caseName} + connect err=` + JSON.stringify(err));
            console.log(`${caseName} + err.code=` + err.code);
            expect(err.code).assertEqual(2303600);
            console.log(`${caseName} + end`);
            done();
          }
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   Telephony_TLSSocket_on_close_multi_callback_0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocket_OnCloseMultiCallback_0100
     * @tc.desc   Function test - multiple callbacks on on('close') event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_TLSSocket_on_close_multi_callback_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const caseName = 'Telephony_TLSSocket_on_close_multi_callback_0100';
        console.log(`${caseName} + start`);
        let tls = socket.constructTLSSocketInstance();
        expect(tls != null).assertEqual(true);
        let cbCount = 0;
        tls.on('close', () => {
          cbCount++;
          console.log(`${caseName} + , cb1 fired, count=` + cbCount);
        });
        tls.on('close', () => {
          cbCount++;
          console.log(`${caseName} + , cb2 fired, count=` + cbCount);
        });
        tls.on('close', () => {
          cbCount++;
          console.log(`${caseName} + , cb3 fired, count=` + cbCount);
          expect(cbCount).assertEqual(3);
        });
        tls.on('connect', () => {
          console.log(`${caseName} + , on connect success`);
          tls.close((err: BusinessError) => {
            console.log(`${caseName} + , close callback, err=` + JSON.stringify(err));
            if (err == undefined) {
              expect(cbCount).assertEqual(3);
              console.log(`${caseName} + end`);
              done();
            } else {
              console.log(`${caseName} + , close err code=` + err.code);
              expect(err.code).assertEqual(2303600);
              console.log(`${caseName} + end`);
              done();
            }
          });
        });
        tls.connect(options, (err: BusinessError) => {
          if (err == undefined) {
            console.log(`${caseName} + connect success`);
          } else {
            console.log(`${caseName} + connect err=` + JSON.stringify(err));
            console.log(`${caseName} + err.code=` + err.code);
            expect(err.code).assertEqual(2303600);
            console.log(`${caseName} + end`);
            done();
          }
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });
  })
}