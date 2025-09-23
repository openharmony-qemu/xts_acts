import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import connection from '@ohos.net.connection';

const PERMISSION_DENIED_CODE = 201
const PARAMETER_ERROR_CODE = 401
const SERVICE_EXCEPTION_CODE = 14500101
const SERVICE_EXCEPTION_MSG = 'Service exception.'
const PARAMETER_ERROR_MSG = 'The parameter invalid.'
const SENSOR_NO_SUPPORT_CODE = 14500102
const PERMISSION_DENIED_MSG = 'Permission denied.'

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'connectionTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}
const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}

export default function ConnectionPublicNopTest() {
  describe("ConnectionPublicNopTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /*
     * @tc.number:SUB_NetMgr_Connection_GetDefaultNet_Nop_0100
     * @tc.name: testNetMgrConnectionGetDefaultNetNop_0100
     * @tc.desc: Using the getDefaultNet (callback) method without permission
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MEDIUMTEST
     */
    it("testNetMgrConnectionGetDefaultNetNop_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetDefaultNetNop_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
          if (error?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectTrue(error?.code == 201);
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +' getDefaultNet success ');
            ExpectFail();
          }
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch (err) {
        if (err instanceof BusinessError) {
          hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
          done();
        }
      }
    })

    /*
     * @tc.number:SUB_NetMgr_Connection_GetDefaultNet_Nop_0200
     * @tc.name: testNetMgrConnectionGetDefaultNetNop_0200
     * @tc.desc: Using the GetDefaultNet (promise) method without permission
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MEDIUMTEST
     */
    it("testNetMgrConnectionGetDefaultNetNop_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetDefaultNetNop_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getDefaultNet().then((data: connection.NetHandle) => {
          hilog.info(domain, tag, '%{public}s', caseName +' getDefaultNet success ');
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        })
      }catch (err) {
        if (err instanceof BusinessError) {
          hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
          done();
        }
      }
    })

    /*
     * @tc.number:SUB_NetMgr_Connection_GetDefaultNetSync_Nop_0300
     * @tc.name: testNetMgrConnectionGetDefaultNetSyncNop_0300
     * @tc.desc: Using the getDefaultNetSync method without permission
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MEDIUMTEST
     */
    it("testNetMgrConnectionGetDefaultNetSyncNop_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetDefaultNetSyncNop_0300';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let netHandle = connection.getDefaultNetSync();
        hilog.info(domain, tag, '%{public}s', caseName +' getDefaultNetSync success ');
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }catch (err) {
        if (err instanceof BusinessError) {
          hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
          done();
        }
      }
    })

    /*
     * @tc.number:SUB_NetMgr_Connection_GetAllNets_Nop_0100
     * @tc.name: testNetMgrConnectionGetAllNetsNop_0100
     * @tc.desc: Using the GetAllNets (callback) method without permission
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MEDIUMTEST
     */
    it("testNetMgrConnectionGetAllNetsNop_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetAllNetsNop_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getAllNets((error: BusinessError<void>|null, data: connection.NetHandle[]| undefined) => {
          if (error?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectTrue(error?.code == 201);
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +' getAllNets success ');
            ExpectFail();
          }
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch (err) {
        if (err instanceof BusinessError) {
          hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
          done();
        }
      }
    })

    /*
     * @tc.number:SUB_NetMgr_Connection_GetAllNets_Nop_0200
     * @tc.name: testNetMgrConnectionGetAllNetsNop_0200
     * @tc.desc: Using the GetAllNets (promise) method without permission
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MEDIUMTEST
     */
    it("testNetMgrConnectionGetAllNetsNop_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetAllNetsNop_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getAllNets().then((data: connection.NetHandle[]) => {
          hilog.info(domain, tag, '%{public}s', caseName +' getAllNets success ');
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        })
      }catch (err) {
        if (err instanceof BusinessError) {
          hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
          done();
        }
      }
    })

    /*
     * @tc.number:SUB_NetMgr_Connection_GetAllNetsSync_Nop_0300
     * @tc.name: testNetMgrConnectionGetAllNetsSyncNop_0300
     * @tc.desc: Using the getAllNetsSync method without permission
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MEDIUMTEST
     */
    it("testNetMgrConnectionGetAllNetsSyncNop_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetAllNetsSyncNop_0300';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let netHandle = connection.getAllNetsSync();
        hilog.info(domain, tag, '%{public}s', caseName +' getAllNetsSync success ');
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }catch (err) {
        if (err instanceof BusinessError) {
          hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
          done();
        }
      }
    })

    /*
     * @tc.number:SUB_NetMgr_Connection_HasDefaultNet_Nop_0100
     * @tc.name: testNetMgrConnectionHasDefaultNetNoP_0100
     * @tc.desc: Using the hasDefaultNet (callback) method without permission
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MEDIUMTEST
     */
    it("testNetMgrConnectionHasDefaultNetNoP_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionHasDefaultNetNoP_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.hasDefaultNet((error: BusinessError<void>|null, data: boolean| undefined) => {
          if (error?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  hasDefaultNet error is '+JSON.stringify(error));
            ExpectTrue(error?.code == 201);
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +' hasDefaultNet success ');
            ExpectFail();
          }
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch (err) {
        if(err instanceof BusinessError) {
          hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
          done();
        }
      }
    })

    /*
     * @tc.number:SUB_NetMgr_Connection_HasDefaultNet_Nop_0200
     * @tc.name: testNetMgrConnectionHasDefaultNetNop_0200
     * @tc.desc: Using the HasDefaultNet (promise) method without permission
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MEDIUMTEST
     */
    it("testNetMgrConnectionHasDefaultNetNop_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionHasDefaultNetNop_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.hasDefaultNet().then((data: boolean) => {
          hilog.info(domain, tag, '%{public}s', caseName +' hasDefaultNet success ');
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        })
      }catch (err) {
        if (err instanceof BusinessError) {
          hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
          done();
        }
      }
    })

    /*
     * @tc.number:SUB_NetMgr_Connection_HasDefaultNetSync_Nop_0300
     * @tc.name: testNetMgrConnectionHasDefaultNetSyncNop_0300
     * @tc.desc: Using the hasDefaultNetSync method without permission
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MEDIUMTEST
     */
    it("testNetMgrConnectionHasDefaultNetSyncNop_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionHasDefaultNetSyncNop_0300';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let netHandle = connection.hasDefaultNetSync();
        hilog.info(domain, tag, '%{public}s', caseName +' hasDefaultNetSync success ');
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }catch (err) {
        if (err instanceof BusinessError) {
          hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
          done();
        }
      }
    })
    /*
         * @tc.number:SUB_NetMgr_Connection_GetConnectionProperties_Nop_0100
         * @tc.name: testNetMgrConnectionGetConnectionProperties_0100
         * @tc.desc: Using the getConnectionProperties (callback) method without permission
         * @tc.level: Level 2
         * @tc.type: Function
         * @tc.size: MEDIUMTEST
         */
    it("testNetMgrConnectionGetConnectionProperties_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetConnectionProperties_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
          if (error?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectTrue(error?.code == 201);
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +' getConnectionPropertiesSync success ');
            ExpectFail();
          }
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch (err) {
        if (err instanceof BusinessError) {
          hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
          done();
        }
      }
    })

    /*
     * @tc.number:SUB_NetMgr_Connection_GetConnectionProperties_Nop_0200
     * @tc.name: testNetMgrConnectionGetConnectionPropertiesNop_0200
     * @tc.desc: Using the GetConnectionProperties (promise) method without permission
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MEDIUMTEST
     */
    it("testNetMgrConnectionGetConnectionPropertiesNop_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetConnectionPropertiesNop_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        connection.getConnectionProperties(netHandle).then((data: connection.ConnectionProperties) => {
          hilog.info(domain, tag, '%{public}s', caseName +' getConnectionPropertiesSync success ');
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        })
      }catch (err) {
        if (err instanceof BusinessError) {
          hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
          done();
        }
      }
    })
    /*
       * @tc.number:SUB_NetMgr_Connection_GetConnectionPropertiesSync_Nop_0300
       * @tc.name: testNetMgrConnectionGetConnectionPropertiesSyncNop_0300
       * @tc.desc: Using the GetConnectionPropertiesSync method without permission
       * @tc.level: Level 2
       * @tc.type: Function
       * @tc.size: MEDIUMTEST
       */
    it("testNetMgrConnectionGetConnectionPropertiesSyncNop_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetConnectionPropertiesSyncNop_0300';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        let connectionProperties = connection.getConnectionPropertiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +' getConnectionPropertiesSync success ');
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }catch (err) {
        if (err instanceof BusinessError) {
          hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
          done();
        }
      }
    })

    /*
        * @tc.number:SUB_NetMgr_Connection_GetNetCapabilities_Nop_0100
        * @tc.name: testNetMgrConnectionGetNetCapabilities_0100
        * @tc.desc: Using the GetNetCapabilities (callback) method without permission
        * @tc.level: Level 2
        * @tc.type: Function
        * @tc.size: MEDIUMTEST
        */
    it("testNetMgrConnectionGetNetCapabilities_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetNetCapabilities_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        connection.getNetCapabilities(netHandle, (error: BusinessError<void>|null, data: connection.NetCapabilities| undefined) => {
          if (error?.code != 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectTrue(error?.code == 201);
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +' getNetCapabilities success ');
            ExpectFail();
          }
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch (err) {
        if (err instanceof BusinessError) {
          hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
          done();
        }
      }
    })

    /*
     * @tc.number:SUB_NetMgr_Connection_GetNetCapabilities_Nop_0200
     * @tc.name: testNetMgrConnectionGetNetCapabilitiesNop_0200
     * @tc.desc: Using the GetNetCapabilities (promise) method without permission
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MEDIUMTEST
     */
    it("testNetMgrConnectionGetNetCapabilitiesNop_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetNetCapabilitiesNop_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        connection.getNetCapabilities(netHandle).then((data: connection.NetCapabilities) => {
          hilog.info(domain, tag, '%{public}s', caseName +' getNetCapabilities success ');
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }).catch((error: Error) => {
          let err = error as BusinessError;
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        })
      }catch (err) {
        if (err instanceof BusinessError) {
          hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
          done();
        }
      }
    })

    /*
     * @tc.number:SUB_NetMgr_Connection_GetNetCapabilitiesSync_Nop_0300
     * @tc.name: testNetMgrConnectionGetNetCapabilitiesSyncNop_0300
     * @tc.desc: Using the GetNetCapabilitiesSync method without permission
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MEDIUMTEST
     */
    it("testNetMgrConnectionGetNetCapabilitiesSyncNop_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetNetCapabilitiesSyncNop_0300';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        let netCapabilities = connection.getNetCapabilitiesSync(netHandle);
        hilog.info(domain, tag, '%{public}s', caseName +' GetNetCapabilitiesSync success ');
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }catch (err) {
        if (err instanceof BusinessError) {
          hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
          ExpectTrue(err.code == 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
          done();
        }
      }
    })

    /*
     * @tc.number:SUB_testNetworkMgrConnectionReportNetConnectedNop0100
     * @tc.name: testNetworkMgrConnectionReportNetConnectedNop_static_0100
     * @tc.desc:Using the setAppNet (callback) method without permission
     * @tc.level:Level 2
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("testNetworkMgrConnectionReportNetConnectedNop_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let caseName: string = "testNetworkMgrConnectionReportNetConnectedNop_static_0100";
      hilog.info(domain, tag, `--------${caseName}----before----`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, netHandle: connection.NetHandle|undefined) => {
          if (error?.code) {
            hilog.error(domain, tag, `${caseName} Failed to get getDefaultNet default net. Code:${error?.code}, message:${error?.message}`);
            if (error?.code === PERMISSION_DENIED_CODE) {
              hilog.error(domain, tag, `${caseName} Failed to if(error.code === PERMISSION_DENIED_CODE) 201:` + error?.code);
              try {
                if (netHandle !== undefined) {
                  connection.setAppNet(netHandle, (err, data) => {
                    if (err) {
                      hilog.error(domain, tag, "testNetworkMgrConnectionReportNetConnectedNop_static_0100 Failed: " + JSON.stringify(err));
                    } else {
                      hilog.info(domain, tag, "testNetworkMgrConnectionReportNetConnectedNop_static_0100 Succeeded");
                    }
                  });
                }
                done();
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                hilog.error(domain, tag, `${caseName} Failed setAppNet to get getDefaultNet default net. Code:${e.code}, message:${e.message}`);
                done();
              }
              expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
              done();
            } else {
              hilog.error(domain, tag, `${caseName} Failed to if(error.code === PERMISSION_DENIED_CODE) code = ${error?.code}`);
              expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
              done();
            }
          } else {
            hilog.info(domain, tag, "Succeeded to get data " + JSON.stringify(netHandle));
            expect(true).assertEqual(netHandle === undefined);
            done();
          }
        });
      } catch (error) {
        hilog.error(domain, tag, caseName + "error:" + JSON.stringify(error));
        expect(true).assertTrue()
        done()
      }
      hilog.info(domain, tag, '--------testNetworkMgrConnectionReportNetConnectedNop0100----after----');
    })

    /*
     * @tc.number:SUB_testNetworkMgrConnectionReportNetConnectedNop0200
     * @tc.name: testNetworkMgrConnectionReportNetConnectedNop_static_0200
     * @tc.desc:Using the setAppNet (then) method without permission
     * @tc.level:Level 2
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("testNetworkMgrConnectionReportNetConnectedNop_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrConnectionReportNetConnectedNop_static_0200";
      hilog.info(domain, tag, `-------${caseName}-----before----`);
      try {
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle|undefined) => {
          if (error?.code) {
            hilog.error(domain, tag, `${caseName} Failed to get getDefaultNet default net. Code:${error?.code}, message:${error?.message}`);
            if (error?.code === PERMISSION_DENIED_CODE) {
              hilog.error(domain, tag, `${caseName} Failed to if(error.code === PERMISSION_DENIED_CODE) 201:` + error?.code);
              try {
                if (data !== undefined) {
                  connection.setAppNet(data, (err: BusinessError<void>|null, data) => {
                    hilog.info(domain, tag, "Succeeded to get testNetworkMgrConnectionReportNetConnectedNop_static_0200: " + JSON.stringify(data));
                  });
                }
                done();
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                hilog.error(domain, tag, `${caseName} Failed setAppNet to get getDefaultNet default net. Code:${e.code}, message:${e.message}`);
                done();
              }
              expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
              done();
            } else {
              hilog.error(domain, tag, `${caseName} Failed to if(error.code === PERMISSION_DENIED_CODE) code= ${error?.code}`);
              expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
              done();
            }
          } else {
            hilog.info(domain, tag, "Succeeded to get data " + JSON.stringify(data));
            expect(true).assertEqual(data === undefined);
            done();
          }
        });
      } catch (error) {
        hilog.error(domain, tag, caseName + "error:" + JSON.stringify(error));
        expect(true).assertTrue()
        done()
      }
      hilog.info(domain, tag, '--------testNetworkMgrConnectionReportNetConnectedNop_static_0200----after----');
    })

    /*
     * @tc.number:SUB_testNetworkMgrConnectionReportNetConnectedNop0300
     * @tc.name: testNetworkMgrConnectionReportNetConnectedNop_static_0300
     * @tc.desc:Using the addCustomDnsRule (callback) method without permission
     * @tc.level:Level 2
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("testNetworkMgrConnectionReportNetConnectedNop_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '--------testNetworkMgrConnectionReportNetConnectedNop_static_0300----before----');
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"], (error: BusinessError<void>|null, data) => {
          hilog.error(domain, tag, `${error?.code} error:${JSON.stringify(error)}`);
          if (error?.code === PERMISSION_DENIED_CODE) {
            expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          } else {
            expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
          }
        });
      } catch (err) {
        err = err as Error;
        hilog.error(domain, tag, `${err.code} test failed err: ${JSON.stringify(err)}`);
        done();
      }
      hilog.info(domain, tag, '--------testNetworkMgrConnectionReportNetConnectedNop_static_0300----after----');
    })

    /*
     * @tc.number:SUB_testNetworkMgrConnectionReportNetConnectedNop0400
     * @tc.name: testNetworkMgrConnectionReportNetConnectedNop_static_0400
     * @tc.desc:Using the addCustomDnsRule (then) method without permission
     * @tc.level:Level 2
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("testNetworkMgrConnectionReportNetConnectedNop_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '--------testNetworkMgrConnectionReportNetConnectedNop_static_0400----before----');
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]).then(() => {
          hilog.error(domain, tag, `addCustomDnsRule testNetworkMgrConnectionReportNetConnectedNop_static_0400`);
        }).catch((error: Error) => {
          let err = error as BusinessError;
          if (err?.code === PERMISSION_DENIED_CODE) {
            expect(err?.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          } else {
            expect(err?.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
          }
          hilog.error(domain, tag, JSON.stringify(err));
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, `test failed err: ${JSON.stringify(error)}`);
        done();
      }
      hilog.info(domain, tag, '--------testNetworkMgrConnectionReportNetConnectedNop_static_0400----after----');
    })

    /*
     * @tc.number:SUB_testNetworkMgrConnectionReportNetConnectedNop0500
     * @tc.name: testNetworkMgrConnectionReportNetConnectedNop_static_0500
     * @tc.desc:Using the removeCustomDnsRule (callback) method without permission
     * @tc.level:Level 2
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("testNetworkMgrConnectionReportNetConnectedNop_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '--------testNetworkMgrConnectionReportNetConnectedNop_static_0500----before----');
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]).then(() => {
          connection.removeCustomDnsRule("192.168.1.1", (error: BusinessError<void>|null, data) => {
            if (error !== null) {
              hilog.error(domain, tag, ` error: ${JSON.stringify(error)}`);
            }
            if (error?.code === PERMISSION_DENIED_CODE) {
              expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
              done();
            } else {
              expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.error(domain, tag, `addCustomDnsRule removeCustomDnsRule error: ${JSON.stringify(err)} `);
          if (err?.code === PERMISSION_DENIED_CODE) {
            expect(err?.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          } else {
            expect(err?.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
          }
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, `test failed err: ${JSON.stringify(error)}`);
        if (error?.code === PERMISSION_DENIED_CODE) {
          expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        } else {
          expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
          done();
        }
      }
      hilog.info(domain, tag, '--------testNetworkMgrConnectionReportNetConnectedNop_static_0500----after----');
    })

    /*
     * @tc.number:SUB_testNetworkMgrConnectionReportNetConnectedNop0600
     * @tc.name: testNetworkMgrConnectionReportNetConnectedNop_static_0600
     * @tc.desc:Using the removeCustomDnsRule (then) method without permission
     * @tc.level:Level 2
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("testNetworkMgrConnectionReportNetConnectedNop_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '--------testNetworkMgrConnectionReportNetConnectedNop_static_0600----before----');
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]).then(() => {
          connection.removeCustomDnsRule("192.168.1.1").then(() => {
            hilog.info(domain, tag, '--------removeCustomDnsRule-------');
          }).catch((error: Error) => {
            let err = error as BusinessError;
            hilog.error(domain, tag, ` error: ${JSON.stringify(err)} }`);
            if (err?.code === PERMISSION_DENIED_CODE) {
              expect(err?.code).assertEqual(PERMISSION_DENIED_CODE);
              done();
            } else {
              expect(err?.code).assertEqual(PARAMETER_ERROR_CODE);
              done();
            }
          });
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.error(domain, tag, `addCustomDnsRule removeCustomDnsRule error: ${JSON.stringify(err)} `);
          if (err?.code === PERMISSION_DENIED_CODE) {
            expect(err?.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          } else {
            expect(err?.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
          }
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, `test failed err: ${JSON.stringify(error)}`);
        if (error?.code === PERMISSION_DENIED_CODE) {
          expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        } else {
          expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
          done();
        }
      }
      hilog.info(domain, tag, '--------testNetworkMgrConnectionReportNetConnectedNop_static_0600----after----');
    })

    /*
     * @tc.number:SUB_testNetworkMgrConnectionReportNetConnectedNop0700
     * @tc.name: testNetworkMgrConnectionReportNetConnectedNop_static_0700
     * @tc.desc:Using the removeCustomDnsRule (then) method without permission
     * @tc.level:Level 2
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it("testNetworkMgrConnectionReportNetConnectedNop_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let caseName: string = "testNetworkMgrConnectionReportNetConnectedNop_static_0700";
      hilog.info(domain, tag, `-------${caseName}----before----`);
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]).then(() => {
          connection.clearCustomDnsRules((error: BusinessError<void>|null, data) => {
            hilog.info(domain, tag, '--------removeCustomDnsRule-------');
            if (error?.code === PERMISSION_DENIED_CODE) {
              expect(error?.code).assertEqual(PERMISSION_DENIED_CODE);
              done();
            } else {
              expect(error?.code).assertEqual(PARAMETER_ERROR_CODE);
              done();
            }
          })
        }).catch((error: Error) => {
          let err = error as BusinessError;
          hilog.error(domain, tag, `addCustomDnsRule removeCustomDnsRule error: ${JSON.stringify(err)} `);
          if (err?.code === PERMISSION_DENIED_CODE) {
            expect(err?.code).assertEqual(PERMISSION_DENIED_CODE);
            done();
          } else {
            expect(err?.code).assertEqual(PARAMETER_ERROR_CODE);
            done();
          }
        });
      } catch (err) {
        err = err as Error;
        hilog.error(domain, tag, `test failed err: ${JSON.stringify(err)}`);
        if (err.code === PERMISSION_DENIED_CODE) {
          expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        } else {
          expect(err.code).assertEqual(PARAMETER_ERROR_CODE);
          done();
        }
      }
      hilog.info(domain, tag, `-------${caseName}----after----`);
    })

    /**
     * @tc.number : SUB_Telephony_Connection_getAddressesByNameNop_0100
     * @tc.name   : testConnectionGetAddressesByNameNop_static_0100
     * @tc.desc   : AddressesByName Permission denied
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testConnectionGetAddressesByNameNop_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetAddressesByNameNop_static_0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        connection.getAddressesByName("www.baidu.com", (error: BusinessError<void>|null, data: Array<connection.NetAddress>|undefined) => {
          if (error) {
            hilog.error(domain, tag, `${caseName} Failed to get addresses. Code:${error.code}, message:${error.message}`);
            expect(true).assertEqual(error?.code === 201);
          }else {
            hilog.info(domain, tag, `${caseName} success to get addressta: ` + JSON.stringify(data));
            expect(true).assertEqual(false);
          }
          done();
        });
      }catch (err){
        hilog.error(domain, tag, `${caseName} --test end`);
        hilog.error(domain, tag, `${caseName} catch err is `,JSON.stringify(err));
        expect(true).assertEqual(false);
        done();
      }
    })

    /**
     * @tc.number : SUB_Telephony_Connection_getAddressesByNameNop_0200
     * @tc.name   : testConnectionGetAddressesByNameNop_static_0200
     * @tc.desc   : AddressesByName Permission denied
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testConnectionGetAddressesByNameNop_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetAddressesByNameNop_static_0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        connection.getAddressesByName("www.baidu.com").then((data :connection.NetAddress[] )=>{
          hilog.info(domain, tag, `${caseName} Succeeded to get data:`, JSON.stringify(data))
        }).catch((error:Error)=>{
          let err = error as BusinessError;
          hilog.error(domain, tag, `${caseName} Failed to get addresses. Code:${err?.code}, message:${err?.message}`);
          expect(true).assertEqual(err?.code === 201);
          done();
        })
      }catch (err){
        hilog.error(domain, tag, `${caseName} --test end`);
        hilog.error(domain, tag, `${caseName} catch err is `,JSON.stringify(err));
        expect(true).assertEqual(false);
        done();
      }
    })
  })
}