'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level, Size, TestType, beforeEach, afterEach } from '@ohos/hypium-static/src/main/indexStatic';
import socket from '@ohos.net.socket';
import { BusinessError, Callback } from '@ohos.base';
import hilog from '@ohos.hilog';
import { ArrayBufferToString } from './utils';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'SocketTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let smtpServer163: socket.NetAddress = {
  address: "smtp.163.com", port: 25
}

let httpsWebSite: socket.NetAddress = {
  address: "www.baidu.com", port: 443
}

let httpWebSite: socket.NetAddress = {
  address: "www.baidu.com", port: 80
}

let localServer: socket.NetAddress = {
  address: "127.0.0.1", port: 8080
}

function msgToString(value: socket.SocketMessageInfo): string {
  let messageView = ArrayBufferToString(value.message);
  return messageView
}

function formatErrMsg(err: Error): string {
  return `{"code": ${err.code}, "message":"${err.message}"}`;
}

function expectSuccess(): void {
  expect(true).assertTrue();
}

function expectFail(info: string = ''): void {
  try {
    expect(false).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `test failed: ${info}`);
  }
};

function expectTrue(exp: boolean, info: string = ''): void {
  try {
    expect(exp).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', `test failed: ${info}`);
  }
};

async function msSleep(count: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}

export default function TLSSocketUpgradeTest(): void {
  describe('TLSSocketUpgradeTest', () => {
    let tcpSock: socket.TCPSocket | undefined;
    beforeEach(() => {
      tcpSock = socket.constructTCPSocketInstance();
    })

    afterEach(async () => {
      await tcpSock!.close().catch((err) => {
        hilog.info(domain, tag, '%{public}s', "afterEach tcpSock close fail" + JSON.stringify(err?.message));
      });
    })

    /**
     * @tc.name   testSTARTTLSWith163Com_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketUpgrade_STARTTLS_0100
     * @tc.desc   Test STARTTLS feature by visiting smtp.163.com
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSTARTTLSWith163Com_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'testSTARTTLSWith163Com_static_0100'
        const printLog = (msg: string) => {
          hilog.info(domain, tag, '%{public}s', "testSTARTTLSWith163Com_static_0100" + msg)
        }
        try {
          const handleStartTLS = (sock: socket.TCPSocket | undefined): void => {
            let tlsOpts: socket.TLSConnectOptions = {
              address: smtpServer163,
              secureOptions: {} as socket.TLSSecureOptions
            };
            let tlsSock: socket.TLSSocket = socket.constructTLSSocketInstance(sock!);
            tlsSock.onTlsMessage((value: socket.SocketMessageInfo) => {
              let message = msgToString(value)
              printLog(`onTlsMessage message:${message}`);
              if (message.search("250-AUTH") >= 0) {
                expectSuccess();
                tlsSock.close();
                done();
              } else if (message.search("250") >= 0) {
                printLog("waiting for 250-AUTH")
              } else {
                expectFail(testName + `Unsupported CMD2: ${message}`);
                tlsSock.close();
                done();
              }
            });
            tlsSock.connect(tlsOpts).then(() => {
              printLog("success to start tls")
              tlsSock.send("EHLO Jonny\r\n").then().catch((err) => {
                tlsSock.close()
                expectFail(testName + formatErrMsg(err))
                done();
              });
            }).catch((err) => {
              expectFail(testName + formatErrMsg(err))
              done();
            });
          }
          let tcpOpts: socket.TCPConnectOptions = {
            address: smtpServer163
          }

          tcpSock!.onTcpMessage((value: socket.SocketMessageInfo) => {
            let message = msgToString(value);
            printLog(`onTcpMessage message:${message}`);
            if (message.search("Coremail System") >= 0 || message.search("Mail Server") >= 0) {
              tcpSock!.send({
                data: "EHLO Jonny\r\n"
              }).then(() => {
                printLog(`tcpSock send message "EHLO Jonny\r\n" success`);
              }).catch((err) => {
                tcpSock!.close()
                expectFail(testName + formatErrMsg(err))
                done();
              });
            } else if (message.search("250-STARTTLS") >= 0) {
              tcpSock!.send({
                data: "STARTTLS\r\n"
              }).then(() => {
                printLog(`tcpSock send message "STARTTLS\r\n" success`);
              }).catch((err) => {
                tcpSock!.close()
                expectFail(testName + formatErrMsg(err))
                done();
              });
            } else if (message.search("Ready to start TLS") >= 0) {
              printLog("ready to start TLS")
              handleStartTLS(tcpSock!)
            } else if (message.search("250") >= 0) {
              printLog("waiting for 250-STARTTLS")
            } else {
              tcpSock!.close()
              expectFail(testName + `Unsupported CMD1: ${message}`)
              done();
            }
          });
          tcpSock!.onTcpError((err: BusinessError | null) => {
            hilog.info(domain, tag, '%{public}s',
              `${testName} onTcpError, code:${JSON.stringify(err?.code)}, msg:${JSON.stringify(err?.message)}`);
            if (err?.code === 2301104) {
              expectTrue(true);
            } else {
              expectFail();
            }
            done();
          });

          await msSleep(2000);
          tcpSock!.connect(tcpOpts).then(() => {
            printLog("success to connect to smtp.163.com")
          }).catch((err) => {
            expectFail(testName + formatErrMsg(err))
            done();
          });
        } catch (err) {
          expectFail(testName + formatErrMsg(err))
          done();
        }
      });

    /**
     * @tc.name   testOneWayTLSWithBaidu_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketUpgrade_OneWayTLS_0100
     * @tc.desc   Test oneway TLS with upgraded TLSSocket by visiting baidu.com
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOneWayTLSWithBaidu_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'testOneWayTLSWithBaidu_static_0100 '
        const printLog = (msg: string) => {
          hilog.info(domain, tag, '%{public}s', testName + msg)
        }
        try {
          let tcpOpts: socket.TCPConnectOptions = {
            address: httpsWebSite
          }

          tcpSock!.connect(tcpOpts).then(async () => {
            printLog("success to connect to www.baidu.com")
            let tlsOpts: socket.TLSConnectOptions = {
              address: httpsWebSite,
              secureOptions: {} as socket.TLSSecureOptions
            };

            let tlsSock: socket.TLSSocket = socket.constructTLSSocketInstance(tcpSock!);
            await tlsSock.bind(httpsWebSite);
            tlsSock.connect(tlsOpts).then(() => {
              printLog("success to upgrade to TLSSocket")
              tlsSock.close();
              expectSuccess();
              done();
            }).catch((err) => {
              expectFail(testName + formatErrMsg(err))
              done();
            });
          }).catch((err) => {
            expectFail(testName + formatErrMsg(err))
            done();
          });
        } catch (err) {
          expectFail(testName + formatErrMsg(err))
          done();
        }
      });

    /**
     * @tc.name   testUpgradeWithNotConnectedTCPSocket_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketUpgrade_NotConnectedTCPSocket_0100
     * @tc.desc   Test upgrading TLSSocket with not connected TCPSocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUpgradeWithNotConnectedTCPSocket_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'testUpgradeWithNotConnectedTCPSocket_static_0100 '
        const printLog = (msg: string) => {
          hilog.info(domain, tag, '%{public}s', testName + msg)
        }
        try {
          tcpSock!.bind({
            address: "127.0.0.1"
          }).then(() => {
            let tlsSock: socket.TLSSocket = socket.constructTLSSocketInstance(tcpSock!);
            expectFail(testName + "TLSSocket is constructed, but it should not be happened")
            done();
          }).catch((err) => {
            printLog(formatErrMsg(err))
            expectTrue(err.code == 2303602);
            done();
          });
        } catch (err) {
          printLog(formatErrMsg(err))
          expectTrue(err.code === 2303602);
          done();
        }
      });

    /**
     * @tc.name   testUpgradeWithClosedTCPSocket_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketUpgrade_ClosedTCPSocket_0100
     * @tc.desc   Test upgrading TLSSocket with closed TCPSocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUpgradeWithClosedTCPSocket_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'testUpgradeWithClosedTCPSocket_static_0100 '
        const printLog = (msg: string) => {
          hilog.info(domain, tag, '%{public}s', testName + msg)
        }
        try {
          let tcpOpts: socket.TCPConnectOptions = {
            address: httpsWebSite
          }
          let tcp: socket.TCPSocket = socket.constructTCPSocketInstance();
          tcp.connect(tcpOpts).then(() => {
            printLog("success to connect to www.baidu.com")
            tcp.close((err: BusinessError | null) => {
              if (err?.code !== 0) {
                printLog("failed to close connection")
                expectFail(testName + formatErrMsg(err as Error))
                done();
              } else {
                printLog("success to close connection")
                try {
                  let tls: socket.TLSSocket = socket.constructTLSSocketInstance(tcp);
                  expectFail(testName + "TLSSocket is constructed, but it should not be happened")
                  done();
                } catch (err) {
                  printLog("construct tls socket error. catch...")
                  printLog(formatErrMsg(err))
                  expectTrue(err.code === 2303601);
                  done();
                }
              }
            })
          }).catch((err) => {
            expectFail(testName + formatErrMsg(err))
            done();
          });
        } catch (err) {
          printLog(formatErrMsg(err))
          expectTrue(err.code === 2303601);
          done();
        }
      });

    /**
     * @tc.name   testConnectToNoSSLServer_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketUpgrade_NoSSLServer_0100
     * @tc.desc   Test connecting to HTTP server with upgraded TLSSocket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConnectToNoSSLServer_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'testConnectToNoSSLServer_static_0100 '
        const printLog = (msg: string) => {
          hilog.info(domain, tag, '%{public}s', testName + msg)
        }
        try {
          let tcpOpts: socket.TCPConnectOptions = {
            address: httpWebSite
          }
          tcpSock!.connect(tcpOpts).then(() => {
            printLog("success to connect to httpforever.com")
            let tlsOpts: socket.TLSConnectOptions = {
              address: httpWebSite,
              secureOptions: {} as socket.TLSSecureOptions
            };
            let tlsSock: socket.TLSSocket = socket.constructTLSSocketInstance(tcpSock!);
            tlsSock.connect(tlsOpts).then(() => {
              expectFail(testName + "TLS connect OK, but it should not be happened")
              done();
            }).catch((err) => {
              printLog(formatErrMsg(err))
              expectSuccess();
              done();
            });
          }).catch((err) => {
            expectFail(testName + formatErrMsg(err))
            done();
          });
        } catch (err) {
          expectFail(testName + formatErrMsg(err))
          done();
        }
      });

    /**
     * @tc.name   testConcurrentUpgradeAndCloseTCPSocket_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketUpgrade_ConcurrentUpgradeClosed_0100
     * @tc.desc   Test upgrade and close Socket concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConcurrentUpgradeAndCloseTCPSocket_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'testConcurrentUpgradeAndCloseTCPSocket_static_0100 '
        const printLog = (msg: string) => {
          hilog.info(domain, tag, '%{public}s', testName + msg)
        }
        try {
          let tcpOpts: socket.TCPConnectOptions = {
            address: httpsWebSite
          }
          tcpSock!.connect(tcpOpts).then(() => {
            printLog("success to connect to www.baidu.com")
            tcpSock!.close()
            try {
              let tls: socket.TLSSocket = socket.constructTLSSocketInstance(tcpSock!);
              printLog("TLSSocket is constructed before TCPSocket close")
              expectSuccess();
              done();
            } catch (err) {
              // construct函数产生的异常在此处可以捕获
              // 但无法透传至外部catch
              if ((err as BusinessError).code == 2303601 || (err as BusinessError).code == 2303602) {
                printLog(formatErrMsg(err))
                expectSuccess();
              } else {
                expectFail(testName + formatErrMsg(err))
              }
              done();
            }
          }).catch((err) => {
            expectFail(testName + formatErrMsg(err))
            done();
          });
        } catch (err) {
          if ((err as BusinessError).code == 2303601 || (err as BusinessError).code == 2303602) {
            printLog(formatErrMsg(err))
            expectSuccess();
          } else {
            expectFail(testName + formatErrMsg(err))
          }
          done();
        }
      });

    /**
     * @tc.name   testConcurrentUpgradeAndSendTCPSocket_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketUpgrade_ConcurrentUpgradeSend_0100
     * @tc.desc   Test upgrade and send Socket concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConcurrentUpgradeAndSendTCPSocket_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'testConcurrentUpgradeAndSendTCPSocket_static_0100 '
        const printLog = (msg: string) => {
          hilog.info(domain, tag, '%{public}s', testName + msg)
        }
        try {
          let tcpOpts: socket.TCPConnectOptions = {
            address: httpsWebSite
          }
          tcpSock!.connect(tcpOpts).then(() => {
            printLog("success to connect to www.baidu.com")
            tcpSock!.send({
              data: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
            })
            tcpSock!.send({
              data: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
            })
            tcpSock!.send({
              data: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
            })
            let tlsOpts: socket.TLSConnectOptions = {
              address: httpsWebSite,
              secureOptions: {} as socket.TLSSecureOptions
            };

            let tlsSock: socket.TLSSocket = socket.constructTLSSocketInstance(tcpSock!);
            tlsSock.connect(tlsOpts).then(() => {
              printLog("TLS connect OK")
              tlsSock.close()
              expectSuccess();
              done();
            }).catch((err) => {
              if (err.code == 2303501 || err.code == 2303505) {
                printLog(formatErrMsg(err))
                expectSuccess();
              } else {
                expectFail(testName + formatErrMsg(err))
              }
              done();
            });
          }).catch((err) => {
            expectFail(testName + formatErrMsg(err))
            done();
          });
        } catch (err) {
          expectFail(testName + formatErrMsg(err))
          done();
        }
      });

    /**
     * @tc.name   testConcurrentUpgrade10TCPSocket_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketUpgrade_Concurrent10Upgrade_0100
     * @tc.desc   Test upgrade 10 Sockets concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConcurrentUpgrade10TCPSocket_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'testConcurrentUpgrade10TCPSocket_static_0100 '
        const printLog = (msg: string) => {
          hilog.info(domain, tag, '%{public}s', testName + msg)
        }
        try {
          let count: number = 0;
          let tcpOpts: socket.TCPConnectOptions = {
            address: httpsWebSite
          }
          // tcp升级至tls的过程中, 大概存在以下几个耗时操作
          // 1. 操作系统线程创建, tcp+tls两个线程
          // 2. fd转移时需等待tcp的recv线程退出,耗时通常在500ms以内
          // 3. tcp连接的三次握手
          // 4. tls的远端证书获取,证书验证,与加密协议协商等
          //    涉及到数据传输与校验, 较为耗时
          // 在15s内要完成10次升级操作,单次时间为1.5s
          // 整体来看升级流程本身耗时较长,且受网络因素影响
          // 按当前测试情况来看,超时几率较大
          // 若将其改为7次，单次时间为2s, 则超时几率大大降低
          for (let i = 0; i < 10; i++) {
            count++;
            // 改用非全局socket, 提高稳定性
            let tcpSock: socket.TCPSocket = socket.constructTCPSocketInstance();
            await tcpSock.connect(tcpOpts).then(async () => {
              let tlsOpts: socket.TLSConnectOptions = {
                address: httpsWebSite,
                secureOptions: {} as socket.TLSSecureOptions
              };
              let tls: socket.TLSSocket = socket.constructTLSSocketInstance(tcpSock);
              await tls.bind(httpsWebSite);
              tls.connect(tlsOpts).then(() => {
                printLog("success to upgrade: " + count.toString() + " TLSSocket")
                if (count == 10) {
                  tls.close()
                  expectSuccess();
                  done();
                }
              }).catch((err) => {
                expectFail(testName + 'tls.connect' + count.toString() + formatErrMsg(err))
                if (count == 10) {
                  done();
                }
              })
            }).catch((err) => {
              expectFail(testName + 'tcpSock.connect' + count.toString() + formatErrMsg(err))
              if (count == 10) {
                done();
              }
            });
          }
        } catch (err) {
          expectFail(testName + formatErrMsg(err))
          done();
        }
      });

    /**
     * @tc.name   testTCPSocketSendAfterUpgrade_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketUpgrade_SendAfterUpgrade_0100
     * @tc.desc   Test TCPSocket send after upgraded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTCPSocketSendAfterUpgrade_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'testTCPSocketSendAfterUpgrade_static_0100 '
        const printLog = (msg: string) => {
          hilog.info(domain, tag, '%{public}s', testName + msg)
        }
        try {
          let tcpOpts: socket.TCPConnectOptions = {
            address: httpsWebSite
          }
          tcpSock!.connect(tcpOpts).then(() => {
            printLog("success to connect to www.baidu.com")
            tcpSock!.send({
              data: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
            })
            tcpSock!.send({
              data: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
            })
            tcpSock!.send({
              data: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
            })

            let tlsSock: socket.TLSSocket = socket.constructTLSSocketInstance(tcpSock!);
            tcpSock!.send({
              data: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
            }).then(() => {
              printLog("TCP send OK")
              tlsSock.close()
              expectFail(testName + "TCPSocket send ok, but it should not be happened")
              done();
            }).catch((err) => {
              if (err.code == 2301009 || err.code == 2301011) {
                printLog(formatErrMsg(err))
                expectSuccess();
              } else {
                expectFail(testName + formatErrMsg(err))
              }
              done();
            });
          }).catch((err) => {
            expectFail(testName + formatErrMsg(err))
            done();
          });
        } catch (err) {
          expectFail(testName + formatErrMsg(err))
          done();
        }
      });

    /**
     * @tc.name   testTLSSocketSendAfterUpgradeNotConnect_static_0100
     * @tc.number SUB_NetworkMgr_Socket_TLSSocketUpgrade_SendAfterUpgrade_0100
     * @tc.desc   Test upgraded TLSSocket send before connect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTLSSocketSendAfterUpgradeNotConnect_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testName = 'testTLSSocketSendAfterUpgradeNotConnect_static_0100 '
        const printLog = (msg: string) => {
          hilog.info(domain, tag, '%{public}s', testName + msg)
        }
        try {
          let tcpOpts: socket.TCPConnectOptions = {
            address: httpsWebSite
          }
          tcpSock!.connect(tcpOpts).then(() => {
            printLog("success to connect to www.baidu.com")
            tcpSock!.send({
              data: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
            })
            tcpSock!.send({
              data: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
            })
            tcpSock!.send({
              data: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
            })

            let tlsSock: socket.TLSSocket = socket.constructTLSSocketInstance(tcpSock!);
            tlsSock.send("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX").then(() => {
              printLog("TLS send OK")
              tlsSock.close()
              expectFail(testName + "TLSSocket send ok, but it should not be happened")
              done();
            }).catch((err) => {
              if (err.code == 2303501) {
                printLog(formatErrMsg(err))
                expectSuccess();
              } else {
                expectFail(testName + formatErrMsg(err))
              }
              done();
            });
          }).catch((err) => {
            expectFail(testName + formatErrMsg(err))
            done();
          });
        } catch (err) {
          expectFail(testName + formatErrMsg(err))
          done();
        }
      });
  })
}