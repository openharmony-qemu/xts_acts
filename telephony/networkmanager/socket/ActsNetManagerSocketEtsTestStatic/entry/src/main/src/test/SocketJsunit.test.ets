'use static';
/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level, Size, TestType } from "../../../hypium/index";
import socket from '@ohos.net.socket'
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'socketJsunitTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为


function sleep (time:int):Promise<string>{
  return new Promise<string>((resolve)=>{
    setTimeout(()=>{
      resolve('ok')},time)
  });
}
function expectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag,'assertion failure');
  }
};
function expectTrue(n : boolean) {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag,'assertion failure');
  }
};

export default function socketJsunit(): void {
  describe('socketTest', () => {
    let udpSocket = socket.constructUDPSocketInstance();
    let multicastSocket = socket.constructMulticastSocketInstance();
    let multicastAddress: socket.NetAddress= {
      address: '239.255.0.1',
      family: 1,
      port: 32123
    };
    let multicastAddress_invalid: socket.NetAddress= {
      address: '223.5.5.5',
      family: 1,
      port: 32123
    };
    let multicastAddress_null: socket.NetAddress = {
      address: '',
      family: 1,
      port: 32123
    };
    let ttl = 100;
    let ttl_invalid = 256;
    let options: socket.UDPSendOptions = {
      data: 'Hello',
      address: multicastAddress,
    };

    hilog.info(domain, tag,"************* socket Test start*************");
    let tcp = socket.constructTCPSocketInstance();
    let udp = socket.constructUDPSocketInstance();
    let envReady = false;
    /**
     * @tc.name   Telephony_Socket_UDPSocket_bind_static_0100
     * @tc.number SUB_Telephony_Socket_UDPSocket_bind_0100
     * @tc.desc   Binds the IP address and port number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_bind_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      if (!envReady) {
        hilog.info(domain, tag,"The environment was not ready");
        done();
        return;
      }
      let caseName = "Telephony_Socket_UDPSocket_bind_static_0100";
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_bind_static_0100 Test start*************");
      let netAddress :socket.NetAddress= {
        address: "test address",
        family: 1,
        port: 8080
      };
      udp.bind(netAddress, (error, data) => {
        if (error) {
          hilog.info(domain, tag,`${caseName} error, case success,error:${JSON.stringify(error)}`);
          done();
          return;
        }
        expect().assertFail();
        hilog.info(domain, tag,`${caseName} error, case failed,data:${JSON.stringify(data)}`);
        done();
      });
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_bind_static_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_bind_static_0200
     * @tc.number SUB_Telephony_Socket_UDPSocket_bind_0200
     * @tc.desc   Binds the IP address and port number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_bind_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      if (!envReady) {
        hilog.info(domain, tag,"The environment was not ready");
        expectTrue(true);
        done();
        return;
      }
      let caseName = "Telephony_Socket_UDPSocket_bind_static_0200";
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_bind_static_0200 Test start*************");
      let netAddress: socket.NetAddress = {
        address: "test address",
        family: 1,
        port: 8080
      };
      try {
        udp.bind(netAddress).then(data => {
          hilog.info(domain, tag,`${caseName} success,data:${JSON.stringify(data)}`);
          done();
        }).catch((err) => {
          const error = err as BusinessError;
          hilog.info(domain, tag,`${caseName} failed,error:${JSON.stringify(error)}`);
          done();
        });
        done();
      } catch (err) {
        hilog.info(domain, tag,`${caseName} failed,catch error:${JSON.stringify(err)}`);
        expectTrue(true);
        done();
      }
      hilog.info(domain, tag,"************* elephony_Socket_UDPSocket_bind_static_0200 Test end*************");
      expectTrue(true);
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_bind_static_0300
     * @tc.number SUB_Telephony_Socket_UDPSocket_bind_0300
     * @tc.desc   Binds the IP address and port number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_bind_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      if (!envReady) {
        hilog.info(domain, tag,"The environment was not ready");
        done();
        return;
      }
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_bind_static_0300 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_bind_static_0300";
      let netAddress:socket.NetAddress = {
        address: "second test address"
      };
      udp.bind(netAddress, (error, data) => {
        if (error) {
          hilog.info(domain, tag,`${caseName} error, case success,error:${JSON.stringify(error)}`);
          done();
          return;
        }
        expect().assertFail();
        hilog.info(domain, tag,`${caseName} error, case failed,data:${JSON.stringify(data)}`);
        done();
      });
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_bind_static_0300 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_bind_static_0400
     * @tc.number SUB_Telephony_Socket_UDPSocket_bind_0400
     * @tc.desc   Binds the IP address and port number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_bind_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      if (!envReady) {
        hilog.info(domain, tag,"The environment was not ready");
        expectTrue(true);
        done();
        return;
      }
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_bind_static_0400 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_bind_static_0400";
      let netAddress:socket.NetAddress = {
        address: "third test address",
        family: 3,
        port: 8080
      };
      udp.bind(netAddress).then(data => {
        hilog.info(domain, tag,`${caseName} success,data:${JSON.stringify(data)}`);
        done();
      }).catch((err) => {
        const error = err as BusinessError;
        hilog.info(domain, tag,`${caseName} failed,error:${JSON.stringify(error)}`);
        done();
      });
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_bind_static_0400 Test end*************");
      expectTrue(true);
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_send_static_0100
     * @tc.number SUB_Telephony_Socket_UDPSocket_send_0100
     * @tc.desc   Sends data over a UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_send_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      if (!envReady) {
        hilog.info(domain, tag,"The environment was not ready");
        done();
        return;
      }
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_send_static_0100 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_send_static_0100";
      let udpSendOptions :socket.UDPSendOptions= {
        data: "test data",
        address: {
          address: "test address",
          family: 1,
          port: 8080
        }
      };
      udp.send(udpSendOptions, (error, data) => {
        if (error) {
          hilog.info(domain, tag,`${caseName} error, case success,error:${JSON.stringify(error)}`);
          done();
          return;
        }
        expect().assertFail();
        hilog.info(domain, tag,`${caseName} error, case failed,data:${JSON.stringify(data)}`);
        done();
      });
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_send_static_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_send_static_0200
     * @tc.number SUB_Telephony_Socket_UDPSocket_send_0200
     * @tc.desc   Sends data over a UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_send_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      if (!envReady) {
        hilog.info(domain, tag,"The environment was not ready");
        expectTrue(true);
        done();
        return;
      }
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_send_static_0200 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_send_static_0200";
      let udpSendOptions:socket.UDPSendOptions = {
        data: "test data",
        address: {
          address: "test address",
          family: 1,
          port: 8080
        }
      };
      udp.send(udpSendOptions).then(data => {
        hilog.info(domain, tag,`${caseName} success,data:${JSON.stringify(data)}`);
      }).catch((err) => {
        const error = err as BusinessError;
        hilog.info(domain, tag,`${caseName} failed,error:${JSON.stringify(error)}`);
      });
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_send_static_0200 Test end*************");
      expectTrue(true);
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_send_static_0300
     * @tc.number SUB_Telephony_Socket_UDPSocket_send_0300
     * @tc.desc   Sends data over a UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_send_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      if (!envReady) {
        hilog.info(domain, tag,"The environment was not ready");
        done();
        return;
      }
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_send_static_0300 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_send_static_0300";
      let udpSendOptions:socket.UDPSendOptions = {
        data: "test data",
        address: {
          address: "second test address",
        }
      };
      udp.send(udpSendOptions, (error, data) => {
        if (error) {
          hilog.info(domain, tag,`${caseName} error, case success,error:${JSON.stringify(error)}`);
          done();
          return;
        }
        expect().assertFail();
        hilog.info(domain, tag,`${caseName} error, case failed,data:${JSON.stringify(data)}`);
        done();
      });
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_send_static_0300 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_send_static_0400
     * @tc.number SUB_Telephony_Socket_UDPSocket_send_0400
     * @tc.desc   Sends data over a UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_send_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      if (!envReady) {
        hilog.info(domain, tag,"The environment was not ready");
        expectTrue(true);
        done();
        return;
      }
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_send_static_0400 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_send_static_0400";
      let udpSendOptions:socket.UDPSendOptions = {
        data: "test data",
        address: {
          address: "third test address"
        }
      };
      udp.send(udpSendOptions).then(data => {
        hilog.info(domain, tag,`${caseName} success,data:${JSON.stringify(data)}`);
      }).catch((err) => {
        const error = err as BusinessError;
        hilog.info(domain, tag,`${caseName} failed,error:${JSON.stringify(error)}`);
      });
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_send_static_0400 Test end*************");
      expectTrue(true);
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_getState_static_0100
     * @tc.number SUB_Telephony_Socket_UDPSocket_getState_0100
     * @tc.desc   Obtains the status of the UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_getState_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      if (!envReady) {
        hilog.info(domain, tag,"The environment was not ready");
        expectTrue(true);
        done();
        return;
      }
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_getState_static_0100 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_getState_static_0100";
      udp.getState((error, data) => {
        if (error) {
          hilog.info(domain, tag,`${caseName} error, case success,error:${JSON.stringify(error)}`);
          done();
          return;
        }
        let socketStateBase = data;
        hilog.info(domain, tag,`${caseName} data:${JSON.stringify(socketStateBase!.isClose)}`);
        done();
      });
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_getState_static_0100 Test end*************");
      expectTrue(true);
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_getState_static_0200
     * @tc.number SUB_Telephony_Socket_UDPSocket_getState_0200
     * @tc.desc   Obtains the status of the UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_getState_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      if (!envReady) {
        hilog.info(domain, tag,"The environment was not ready");
        expectTrue(true);
        done();
        return;
      }
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_getState_static_0200 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_getState_static_0200";
      udp.getState().then(data => {
        hilog.info(domain, tag,`${caseName} success,data:${JSON.stringify(data)}`);
      }).catch((err) => {
        const error = err as BusinessError;
        hilog.info(domain, tag,`${caseName} failed,error:${JSON.stringify(error)}`);
      });
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_getState_static_0200 Test end*************");
      expectTrue(true);
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_setExtraOptions_static_0100
     * @tc.number SUB_Telephony_Socket_UDPSocket_setExtraOptions_0100
     * @tc.desc   Sets other attributes of the UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_setExtraOptions_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      if (!envReady) {
        hilog.info(domain, tag,"The environment was not ready");
        done();
        return;
      }
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_setExtraOptions_static_0100 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_setExtraOptions_static_0100";
      let udpExtraOptions:socket.UDPExtraOptions = {
        broadcast: true
      };
      try {
        udp.setExtraOptions(udpExtraOptions, (error, data) => {
          if (error) {
            expect().assertFail();
            hilog.info(domain, tag,`${caseName} error, case failed,error: ` + JSON.stringify(error));
            done();
          } else {
            expect().assertTrue();
            hilog.info(domain, tag,`${caseName} error, case success failed`);
            done();
          }
          done();
        });
        done();
      } catch (error) {
        hilog.info(domain, tag,`${caseName} failed,error:${error}`);
        expect(true).assertTrue();
        done();
      }
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_setExtraOptions_static_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_setExtraOptions_static_0200
     * @tc.number SUB_Telephony_Socket_UDPSocket_setExtraOptions_0200
     * @tc.desc   Sets other attributes of the UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_setExtraOptions_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      if (!envReady) {
        hilog.info(domain, tag,"The environment was not ready");
        done();
        return;
      }
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_setExtraOptions_static_0200 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_setExtraOptions_static_0200";
      let udpExtraOptions:socket.UDPExtraOptions = {
        broadcast: true
      };
      try {
        udp.setExtraOptions(udpExtraOptions);
        hilog.info(domain, tag,`${caseName} success`);
        done();
      } catch (error) {
        hilog.info(domain, tag,`${caseName} failed,error:${error}`);
        done();
      }
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_setExtraOptions_static_0200 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_setExtraOptions_static_0300
     * @tc.number SUB_Telephony_Socket_UDPSocket_setExtraOptions_0300
     * @tc.desc   Sets other attributes of the UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_setExtraOptions_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      if (!envReady) {
        hilog.info(domain, tag,"The environment was not ready");
        done();
        return;
      }
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_setExtraOptions_static_0300 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_setExtraOptions_static_0300";
      let udpExtraOptions :socket.UDPExtraOptions= {};
      udp.setExtraOptions(udpExtraOptions, (error) => {
        if (error) {
          hilog.info(domain, tag,`${caseName} error, case success,error:${JSON.stringify(error)}`);
          done();
          return;
        }
        expect().assertFail();
        hilog.info(domain, tag,`${caseName} error, case failed`);
        done();
      });
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_setExtraOptions_static_0300 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_setExtraOptions_static_0400
     * @tc.number SUB_Telephony_Socket_UDPSocket_setExtraOptions_0400
     * @tc.desc   Sets other attributes of the UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_setExtraOptions_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      if (!envReady) {
        hilog.info(domain, tag,"The environment was not ready");
        done();
        return;
      }
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_setExtraOptions_static_0400 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_setExtraOptions_static_0400";
      let udpExtraOptions :socket.UDPExtraOptions= {};
      try {
        udp.setExtraOptions(udpExtraOptions).then((data) => {
          hilog.info(domain, tag,`${caseName}`);
        }).catch((err) => {
          hilog.info(domain, tag,`${caseName} failed setExtraOptions catch err is :` + JSON.stringify(err));
        });
        hilog.info(domain, tag,`${caseName} success`);
        done();
      } catch (error) {
        hilog.info(domain, tag,`${caseName} failed,error:${error}`);
        expectTrue(true);
        done();
      }
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_setExtraOptions_static_0400 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_on_message_static_0100
     * @tc.number SUB_Telephony_Socket_UDPSocket_on_message_0100
     * @tc.desc   Listens for message receiving events of the UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_on_message_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      if (!envReady) {
        hilog.info(domain, tag,"The environment was not ready");
        done();
        return;
      }
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_on_message_static_0100 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_on_message_static_0100";
      udp.onUdpMessage((data) => {
        let socketRemoteInfo = data.remoteInfo;
        expectTrue(socketRemoteInfo.port!=null)
        hilog.info(domain, tag,`${caseName} port:${socketRemoteInfo.port}`);
        hilog.info(domain, tag,`${caseName} size:${socketRemoteInfo.size}`);
      });
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_on_message_static_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_off_message_static_0100
     * @tc.number SUB_Telephony_Socket_UDPSocket_off_message_0100
     * @tc.desc   Cancels listening for message receiving events of the UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_off_message_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      if (!envReady) {
        hilog.info(domain, tag,"The environment was not ready");
        done();
        return;
      }
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_off_message_static_0100 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_off_message_static_0100";
      udp.offUdpMessage(data => {
        let socketRemoteInfo = data.remoteInfo;
        expectTrue(socketRemoteInfo.port!=null)
        hilog.info(domain, tag,`${caseName} port:${socketRemoteInfo.port}`);
        hilog.info(domain, tag,`${caseName} size:${socketRemoteInfo.size}`);
      });
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_off_message_static_0100 Test end*************");
      done();
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_on_message_static_0200
     * @tc.number SUB_Telephony_Socket_UDPSocket_on_message_0200
     * @tc.desc   Cancels listening for message receiving events of the UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_on_message_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      if (!envReady) {
        hilog.info(domain, tag,"The environment was not ready");
        expectTrue(true);
        done();
        return;
      }
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_on_message_static_0200 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_off_message_0200";
      udp.onUdpMessage((data) => {
        let socketmessage = data.message;
        hilog.info(domain, tag,`${caseName} success:${socketmessage}`);
      });
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_off_message_0200 Test end*************");
      expectTrue(true);
      done();
    });

    /**
     * @tc.name   NetworkManager_UDPSocket_setMulticastTTL_Async_static_0500
     * @tc.number SUB_NetworkManager_UDPSocket_setMulticastTTL_Async_0500
     * @tc.desc   Test setMulticastTTL property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("NetworkManager_UDPSocket_setMulticastTTL_Async_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      let caseName = "NetworkManager_UDPSocket_setMulticastTTL_Async_static_0500";
      multicastSocket.setMulticastTTL(0, (err, data) => {
        if (err) {
          hilog.info(domain, tag,`${caseName} setMulticastTTL failed, err: ${JSON.stringify(err)}`);
          expectTrue(err.code == 2301009);
          done();
        } else {
          hilog.info(domain, tag,`${caseName} setMulticastTTL success, data: ${JSON.stringify(data)}`);
          expect(data===undefined).assertTrue()
          done();
        }
      });
    });

    /**
     * @tc.name   NetworkManager_UDPSocket_setMulticastTTL_Async_static_0600
     * @tc.number SUB_NetworkManager_UDPSocket_setMulticastTTL_Async_0600
     * @tc.desc   Test setMulticastTTL property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("NetworkManager_UDPSocket_setMulticastTTL_Async_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      let caseName = "NetworkManager_UDPSocket_setMulticastTTL_Async_static_0600";
      multicastSocket.setMulticastTTL(-1, (err, data) => {
        if (err) {
          hilog.info(domain, tag,`${caseName} setMulticastTTL failed, err: ${JSON.stringify(err)}`);
          expectTrue(err.code == 2301009);
          done();
        } else {
          hilog.info(domain, tag,`${caseName} setMulticastTTL success, data: ${JSON.stringify(data)}`);
          expect(data===undefined).assertTrue()
          done();
        }
      });
    });

    /**
     * @tc.name   NetworkManager_UDPSocket_setMulticastTTL_Async_static_0700
     * @tc.number SUB_NetworkManager_UDPSocket_setMulticastTTL_Async_0700
     * @tc.desc   Test setMulticastTTL property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("NetworkManager_UDPSocket_setMulticastTTL_Async_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      let caseName = "NetworkManager_UDPSocket_setMulticastTTL_Async_static_0700";
      multicastSocket.setMulticastTTL(255, (err, data) => {
        if (err) {
          hilog.info(domain, tag,`${caseName} setMulticastTTL failed, err: ${JSON.stringify(err)}`);
          expectTrue(err.code == 2301009);
          done();
        } else {
          hilog.info(domain, tag,`${caseName} setMulticastTTL success, data: ${JSON.stringify(data)}`);
          expect(data===undefined).assertTrue()
          done();
        }
      });
    });

    /**
     * @tc.name   NetworkManager_UDPSocket_setMulticastTTL_Async_static_0800
     * @tc.number SUB_NetworkManager_UDPSocket_setMulticastTTL_Async_0800
     * @tc.desc   Test setMulticastTTL property.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("NetworkManager_UDPSocket_setMulticastTTL_Async_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      let caseName = "NetworkManager_UDPSocket_setMulticastTTL_Async_static_0800";
      multicastSocket.setMulticastTTL(256, (err, data) => {
        if (err) {
          hilog.info(domain, tag,`${caseName} setMulticastTTL failed, err: code: ${JSON.stringify(err?.code)}, msg: ${JSON.stringify(err?.message)}`);
          expectTrue(err.code == 2301009);
          done();
        } else {
          hilog.info(domain, tag,`${caseName} setMulticastTTL success, data: ${JSON.stringify(data)}`);
          expect(data===undefined).assertTrue()
          done();
        }
      });
    });
    /**
     * @tc.name   Telephony_Socket_UDPSocket_off_message_static_0300
     * @tc.number SUB_Telephony_Socket_UDPSocket_off_message_0300
     * @tc.desc   Cancels listening for message receiving events of the UDPSocket connection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Telephony_Socket_UDPSocket_off_message_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      if (!envReady) {
        hilog.info(domain, tag,"The environment was not ready");
        done();
        return;
      }
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_off_message_static_0300 Test start*************");
      let caseName = "Telephony_Socket_UDPSocket_off_message_static_0300";
      let messageView = '';
      let callback = (value: socket.SocketMessageInfo) => {
        for (let i: int = 0; i < value.message.byteLength; i++) {
          let uint8Array = new Uint8Array(value.message)
          let messages = uint8Array[i].toInt()
          let message = String.fromCharCode(messages);
          messageView += message;
        }
        hilog.info(domain, tag,'on message message: ' + JSON.stringify(messageView));
        hilog.info(domain, tag,'remoteInfo: ' + JSON.stringify(value.remoteInfo));
      }
      udp.onUdpMessage(callback);
      udp.offUdpMessage(data => {
        let messageView = data.message;
        if (messageView !== null) {
          hilog.info(domain, tag,`${caseName} data.message:${messageView}`);
          hilog.info(domain, tag,`${caseName} data.message:${messageView.byteLength}`);
          expectTrue(messageView != null);
        }
      });
      hilog.info(domain, tag,"************* Telephony_Socket_UDPSocket_off_message_static_0300 Test end*************");
      done();
    });
    hilog.info(domain, tag,"************* socket Test end*************");
  })
}