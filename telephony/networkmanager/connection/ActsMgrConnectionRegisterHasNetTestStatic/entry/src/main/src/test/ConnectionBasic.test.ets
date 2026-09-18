'use static'
/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import connection from '@ohos.net.connection';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import Utils from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'connectionBasicTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, `exportFail failed err: ${JSON.stringify(err)}`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, `exportTrue failed err: ${JSON.stringify(err)}`);
  }
}
const TIMEOUT = 100;


export default function ConnectionBasicTest(): void {
  describe('ConnectionBasicTest', () => {

    /**
     * @tc.name   testNetManagerConnectionNetAvailable_static_0100
     * @tc.number SUB_NetManager_Connection_NetAvailable_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetManagerConnectionNetAvailable_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetManagerConnectionNetAvailable_static_0100";
        hilog.info(domain, tag, `${caseName}---start`);
        try {
          let netConn = connection.createNetConnection();
          netConn.onNetAvailable((data: connection.NetHandle) => {
            hilog.info(domain, tag, `${caseName}success to get data: ${JSON.stringify(data)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          })
          await Utils.msSleep(200);
          ExpectTrue(true);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (error) {
          hilog.info(domain, tag,
            `${caseName} catch err ->error.code: ${JSON.stringify(error.code)}, error?.message: ${JSON.stringify(error?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetManagerConnectionNetAvailable_static_0200
     * @tc.number SUB_NetManager_Connection_NetAvailable_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetManagerConnectionNetAvailable_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetManagerConnectionNetAvailable_static_0200";
        hilog.info(domain, tag, `${caseName}---start`);
        try {
          let netConn = connection.createNetConnection();
          netConn.onNetAvailable((data: connection.NetHandle) => {
            hilog.info(domain, tag, `${caseName}success to get data: ${JSON.stringify(data)}`);
            if (data !== null) {
              ExpectTrue(data?.netId !== null)
            } else {
              ExpectFail();
            }
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          });
          netConn.register((error: BusinessError | null) => {
            hilog.error(domain, tag,
              `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
          });
          await Utils.msSleep(200);
          netConn.unregister((error: BusinessError | null) => {
            hilog.error(domain, tag,
              `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
          });
        } catch (error) {
          hilog.info(domain, tag,
            `${caseName} catch err ->error.code: ${JSON.stringify(error.code)}, error?.message: ${JSON.stringify(error?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetManagerConnectionNetCapabilitiesChange_static_0100
     * @tc.number SUB_NetManager_Connection_NetCapabilitiesChange_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetManagerConnectionNetCapabilitiesChange_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = "testNetManagerConnectionNetCapabilitiesChange_static_0100";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let netConn = connection.createNetConnection();
            netConn.onNetCapabilitiesChange((data:connection.NetCapabilityInfo)=>{
              hilog.info(domain, tag, `${caseName}success to get data: ${JSON.stringify(data)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            })
        await Utils.msSleep(200);
        ExpectTrue(true);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch(error)  {
        hilog.info(domain, tag, `${caseName} catch err ->error.code: ${JSON.stringify(error.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetManagerConnectionNetCapabilitiesChange_static_0200
     * @tc.number SUB_NetManager_Connection_NetCapabilitiesChange_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetManagerConnectionNetCapabilitiesChange_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = "testNetManagerConnectionNetCapabilitiesChange_static_0200";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let netConn = connection.createNetConnection();
            netConn.onNetCapabilitiesChange((data: connection.NetCapabilityInfo) => {
              hilog.info(domain, tag, `${caseName}success to get data: ${JSON.stringify(data)}`);
              if (data !== null) {
                ExpectTrue(data.netCap.linkUpBandwidthKbps !== null)
                ExpectTrue(data.netCap.linkDownBandwidthKbps !== null)
                if (data.netCap.networkCap !== undefined) {
                  let networkCap = data.netCap.networkCap as Array<connection.NetCap>
                  ExpectTrue(networkCap.length > 0)
                } else {
                  ExpectFail();
                }
                if (data.netCap.bearerTypes !== undefined) {
                  ExpectTrue(data.netCap.bearerTypes.length > 0)
                } else {
                  ExpectFail();
                }
              } else {
                ExpectFail();
              }
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            })
        netConn.register((error:BusinessError | null) => {
         hilog.error(domain, tag, `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        });
        await Utils.msSleep(200);
        netConn.unregister((error:BusinessError | null) => {
         hilog.error(domain, tag, `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        });
      } catch(error)  {
        hilog.info(domain, tag, `${caseName} catch err ->error.code: ${JSON.stringify(error.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetManagerConnectionNetConnectionPropertiesChange_static_0100
     * @tc.number SUB_NetManager_Connection_NetConnectionPropertiesChange_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetManagerConnectionNetConnectionPropertiesChange_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = "testNetManagerConnectionNetConnectionPropertiesChange_static_0100";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let netConn = connection.createNetConnection();
            netConn.onNetConnectionPropertiesChange((data:connection.NetConnectionPropertyInfo)=>{
              hilog.info(domain, tag, `${caseName}success to get data: ${JSON.stringify(data)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            })
        await Utils.msSleep(200);
        ExpectTrue(true);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch(error)  {
        hilog.info(domain, tag, `${caseName} catch err ->error.code: ${JSON.stringify(error.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetManagerConnectionNetConnectionPropertiesChange_static_0200
     * @tc.number SUB_NetManager_Connection_NetConnectionPropertiesChange_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetManagerConnectionNetConnectionPropertiesChange_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = "testNetManagerConnectionNetConnectionPropertiesChange_static_0200";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let netConn = connection.createNetConnection();
            netConn.onNetConnectionPropertiesChange((data:connection.NetConnectionPropertyInfo)=>{
              hilog.info(domain, tag, `${caseName}success to get data: ${JSON.stringify(data)}`);
              if (data !== null) {
                ExpectTrue(data.netHandle.netId !== null)
                ExpectTrue(data.connectionProperties.linkAddresses[0].address.address !== null)
                ExpectTrue(data.connectionProperties.linkAddresses[0].address.family !== null)
                ExpectTrue(data.connectionProperties.linkAddresses[0].address.port !== null)
                ExpectTrue(data.connectionProperties.linkAddresses[0].prefixLength !== null)
              }else{
               ExpectFail();
              }
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            })
        netConn.register((error:BusinessError | null) => {
         hilog.error(domain, tag, `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        });
        await Utils.msSleep(200);
        netConn.unregister((error:BusinessError | null) => {
         hilog.error(domain, tag, `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        });
      } catch(error)  {
        hilog.info(domain, tag, `${caseName} catch err ->error.code: ${JSON.stringify(error.code)}, error?.message: ${JSON.stringify(error?.message)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetManagerConnectionSetAppNetCallback_static_0100
     * @tc.number SUB_NetManager_Connection_SetAppNet_Callback_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetManagerConnectionSetAppNetCallback_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetManagerConnectionSetAppNetCallback_static_0100";
        hilog.info(domain, tag, `${caseName}---start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, netHandle: connection.NetHandle | undefined) => {
            hilog.info(domain, tag, `${caseName} getDefaultNet error is : ` +
              `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}` +
              "netHandle is :" + JSON.stringify(netHandle));
            if (error?.code !== 0) {
              ExpectFail();
              done();
            } else {
              if (!netHandle) {
                hilog.info(domain, tag, caseName + " getDefaultNet success but netHandle is null");
                ExpectFail();
                done();
                return;
              }
              hilog.info(domain, tag, `${caseName} getDefaultNet success ` + JSON.stringify(netHandle));
              connection.setAppNet(netHandle, (error: BusinessError | null) => {
                hilog.info(domain, tag, `${caseName} setAppNet err is  ` +
                  `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
                if (error?.code !== 0) {
                  ExpectFail();
                  done();
                } else {
                  connection.getAppNet((error: BusinessError<void> | null, data: connection.NetHandle | undefined) => {
                    hilog.info(domain, tag, `${caseName} getAppNet err is  ` +
                      `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}` +
                      "data is :" + JSON.stringify(data));
                    if (error?.code !== 0) {
                      ExpectFail();
                      done();
                    } else {
                      ExpectTrue(netHandle?.netId === data?.netId);
                      hilog.info(domain, tag, `${caseName}---End`);
                      done();
                    }
                  });
                }
              });
            }
          });
        } catch (error) {
          hilog.info(domain, tag,
            `${caseName} catch err ->error.code: ${JSON.stringify(error.code)}, error?.message: ${JSON.stringify(error?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetManagerConnectionSetAppNetPromise_static_0100
     * @tc.number SUB_NetManager_Connection_SetAppNet_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetManagerConnectionSetAppNetPromise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetManagerConnectionSetAppNetPromise_static_0100";
        hilog.info(domain, tag, `${caseName}---start`);
        try {
          connection.getDefaultNet((error: BusinessError<void> | null, netHandle: connection.NetHandle | undefined) => {
            hilog.info(domain, tag, `${caseName} getDefaultNet error is : ` +
              `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}` +
              "netHandle is :" + JSON.stringify(netHandle));
            if (error?.code !== 0) {
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              if (!netHandle) {
                hilog.info(domain, tag, caseName + " getDefaultNet success but netHandle is null");
                ExpectFail();
                done();
                return;
              }
              let setAndGetAppNet = async (netHandle: connection.NetHandle): Promise<void> => {
                try {
                  let data = await connection.setAppNet(netHandle);
                  hilog.info(domain, tag, `${caseName} setAppNet success ` + JSON.stringify(data));
                  try {
                    let data = await connection.getAppNet();
                    hilog.info(domain, tag, `${caseName} getAppNet success ` + JSON.stringify(data));
                    ExpectTrue(netHandle.netId === data.netId);
                    done();
                  } catch (error) {
                    hilog.info(domain, tag, `${caseName} getAppNet error ` +
                      `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
                    ExpectFail();
                    done();
                  }
                } catch (error) {
                  hilog.info(domain, tag, `${caseName} setAppNet err is ` +
                    `error.code: ${JSON.stringify(error?.code)}, error?.message: ${JSON.stringify(error?.message)}`);
                  ExpectFail();
                  done();
                }
              };
              setAndGetAppNet(netHandle);
            }
          });
        } catch (error) {
          hilog.info(domain, tag,
            `${caseName} catch err ->error.code: ${JSON.stringify(error.code)}, error?.message: ${JSON.stringify(error?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });
  })
}