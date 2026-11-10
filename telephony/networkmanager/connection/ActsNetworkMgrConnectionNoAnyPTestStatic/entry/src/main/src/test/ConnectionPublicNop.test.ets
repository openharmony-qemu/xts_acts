'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import connection from '@ohos.net.connection';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'connectionTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const PERMISSION_DENIED_CODE = 201;
const PARAMETER_ERROR_CODE = 401;

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

export default function ConnectionPublicNopTest(): void {
  describe("ConnectionPublicNopTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   testNetMgrConnectionGetDefaultNetNop_0100
     * @tc.number SUB_NetMgr_Connection_GetDefaultNet_Nop_0100
     * @tc.desc   Using the getDefaultNet (callback) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetMgrConnectionGetDefaultNetNop_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetDefaultNetNop_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getDefaultNet((error: BusinessError<void>|null, data: connection.NetHandle| undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectTrue(error?.code === 201);
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +' getDefaultNet success ');
            ExpectFail();
          }
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code === 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /**
     * @tc.name   testNetMgrConnectionGetDefaultNetNop_0200
     * @tc.number SUB_NetMgr_Connection_GetDefaultNet_Nop_0200
     * @tc.desc   Using the GetDefaultNet (promise) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testNetMgrConnectionGetDefaultNetNop_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetDefaultNetNop_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        try {
          let data = await connection.getDefaultNet();
          hilog.info(domain, tag, '%{public}s', caseName +' getDefaultNet success ');
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        } catch (error) {
          let err = error as BusinessError;
          hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(err));
          ExpectTrue(err.code === 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }
      }catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code === 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /**
     * @tc.name   testNetMgrConnectionGetDefaultNetSyncNop_0300
     * @tc.number SUB_NetMgr_Connection_GetDefaultNetSync_Nop_0300
     * @tc.desc   Using the getDefaultNetSync method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code === 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /**
     * @tc.name   testNetMgrConnectionGetAllNetsNop_0100
     * @tc.number SUB_NetMgr_Connection_GetAllNets_Nop_0100
     * @tc.desc   Using the GetAllNets (callback) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testNetMgrConnectionGetAllNetsNop_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetAllNetsNop_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.getAllNets((error: BusinessError<void>|null, data: connection.NetHandle[]| undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectTrue(error?.code === 201);
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +' getAllNets success ');
            ExpectFail();
          }
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code === 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /**
     * @tc.name   testNetMgrConnectionGetAllNetsNop_0200
     * @tc.number SUB_NetMgr_Connection_GetAllNets_Nop_0200
     * @tc.desc   Using the GetAllNets (promise) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testNetMgrConnectionGetAllNetsNop_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetAllNetsNop_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        try {
          let data = await connection.getAllNets();
          hilog.info(domain, tag, '%{public}s', caseName +' getAllNets success ');
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        } catch (error) {
          let err = error as BusinessError;
          ExpectTrue(err.code === 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }
      }catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code === 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /**
     * @tc.name   testNetMgrConnectionGetAllNetsSyncNop_0300
     * @tc.number SUB_NetMgr_Connection_GetAllNetsSync_Nop_0300
     * @tc.desc   Using the getAllNetsSync method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code === 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /**
     * @tc.name   testNetMgrConnectionHasDefaultNetNoP_0100
     * @tc.number SUB_NetMgr_Connection_HasDefaultNet_Nop_0100
     * @tc.desc   Using the hasDefaultNet (callback) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testNetMgrConnectionHasDefaultNetNoP_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionHasDefaultNetNoP_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        connection.hasDefaultNet((error: BusinessError<void>|null, data: boolean| undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  hasDefaultNet error is '+JSON.stringify(error));
            ExpectTrue(error?.code === 201);
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +' hasDefaultNet success ');
            ExpectFail();
          }
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code === 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /**
     * @tc.name   testNetMgrConnectionHasDefaultNetNop_0200
     * @tc.number SUB_NetMgr_Connection_HasDefaultNet_Nop_0200
     * @tc.desc   Using the HasDefaultNet (promise) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testNetMgrConnectionHasDefaultNetNop_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionHasDefaultNetNop_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        try {
          let data = await connection.hasDefaultNet();
          hilog.info(domain, tag, '%{public}s', caseName +' hasDefaultNet success ');
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        } catch (error) {
          let err = error as BusinessError;
          ExpectTrue(err.code === 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }
      }catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code === 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /**
     * @tc.name   testNetMgrConnectionHasDefaultNetSyncNop_0300
     * @tc.number SUB_NetMgr_Connection_HasDefaultNetSync_Nop_0300
     * @tc.desc   Using the hasDefaultNetSync method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code === 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })
    /**
     * @tc.name   testNetMgrConnectionGetConnectionProperties_0100
     * @tc.number SUB_NetMgr_Connection_GetConnectionProperties_Nop_0100
     * @tc.desc   Using the getConnectionProperties (callback) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testNetMgrConnectionGetConnectionProperties_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetConnectionProperties_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        connection.getConnectionProperties(netHandle, (error: BusinessError<void>|null, data: connection.ConnectionProperties| undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectTrue(error?.code === 201);
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +' getConnectionPropertiesSync success ');
            ExpectFail();
          }
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code === 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /**
     * @tc.name   testNetMgrConnectionGetConnectionPropertiesNop_0200
     * @tc.number SUB_NetMgr_Connection_GetConnectionProperties_Nop_0200
     * @tc.desc   Using the GetConnectionProperties (promise) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testNetMgrConnectionGetConnectionPropertiesNop_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetConnectionPropertiesNop_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        try {
          let data = await connection.getConnectionProperties(netHandle);
          hilog.info(domain, tag, '%{public}s', caseName +' getConnectionPropertiesSync success ');
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        } catch (error) {
          let err = error as BusinessError;
          ExpectTrue(err.code === 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }
      }catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code === 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })
    /**
     * @tc.name   testNetMgrConnectionGetConnectionPropertiesSyncNop_0300
     * @tc.number SUB_NetMgr_Connection_GetConnectionPropertiesSync_Nop_0300
     * @tc.desc   Using the GetConnectionPropertiesSync method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code === 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /**
     * @tc.name   testNetMgrConnectionGetNetCapabilities_0100
     * @tc.number SUB_NetMgr_Connection_GetNetCapabilities_Nop_0100
     * @tc.desc   Using the GetNetCapabilities (callback) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testNetMgrConnectionGetNetCapabilities_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetNetCapabilities_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        connection.getNetCapabilities(netHandle, (error: BusinessError<void>|null, data: connection.NetCapabilities| undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, '%{public}s', caseName +'  get error is '+JSON.stringify(error));
            ExpectTrue(error?.code === 201);
          }else{
            hilog.info(domain, tag, '%{public}s', caseName +' getNetCapabilities success ');
            ExpectFail();
          }
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      }catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code === 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /**
     * @tc.name   testNetMgrConnectionGetNetCapabilitiesNop_0200
     * @tc.number SUB_NetMgr_Connection_GetNetCapabilities_Nop_0200
     * @tc.desc   Using the GetNetCapabilities (promise) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testNetMgrConnectionGetNetCapabilitiesNop_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testNetMgrConnectionGetNetCapabilitiesNop_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try{
        let netHandle: connection.NetHandle = connection.getDefaultNetSync();
        try {
          let data = await connection.getNetCapabilities(netHandle);
          hilog.info(domain, tag, '%{public}s', caseName +' getNetCapabilities success ');
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        } catch (error) {
          let err = error as BusinessError;
          ExpectTrue(err.code === 201);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }
      }catch (err) {
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code === 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /**
     * @tc.name   testNetMgrConnectionGetNetCapabilitiesSyncNop_0300
     * @tc.number SUB_NetMgr_Connection_GetNetCapabilitiesSync_Nop_0300
     * @tc.desc   Using the GetNetCapabilitiesSync method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
        hilog.info(domain, tag, '%{public}s', caseName+ ' catch error in '+ JSON.stringify(err))
        ExpectTrue((err as BusinessError).code === 201);
        hilog.info(domain, tag, '%{public}s', caseName+ '--test end');
        done();
      }
    })

    /**
     * @tc.name   testNetworkMgrConnectionReportNetConnectedNop_static_0300
     * @tc.number SUB_NetworkMgr_Connection_ReportNetConnectedNop_0300
     * @tc.desc   Using the addCustomDnsRule (callback) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrConnectionReportNetConnectedNop_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=> void):Promise<void>=> {
      const caseName:string = 'testNetworkMgrConnectionReportNetConnectedNop_static_0300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"], (error: BusinessError | null) => {
          hilog.info(domain, tag, `${caseName} error:${JSON.stringify(error)}`);
          if (error?.code !== 0) {
            ExpectTrue(error?.code === PERMISSION_DENIED_CODE);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } else {
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testNetworkMgrConnectionReportNetConnectedNop_static_0400
     * @tc.number SUB_NetworkMgr_Connection_ReportNetConnectedNop_0400
     * @tc.desc   Using the addCustomDnsRule (then) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrConnectionReportNetConnectedNop_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=> void):Promise<void>=> {
      const caseName:string = 'testNetworkMgrConnectionReportNetConnectedNop_static_0400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        try {
          await connection.addCustomDnsRule("192.168.1.1", ["255.255.255.0", "127.0.0.1"]);
          hilog.info(domain, tag, `${caseName} success`);
          ExpectFail();
          done();
        } catch (err) {
          let error = err as BusinessError;
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} error: ${JSON.stringify(error)}`);
            ExpectTrue(error.code === PERMISSION_DENIED_CODE);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } else {
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName} failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testNetworkMgrConnectionReportNetConnectedNop_static_0500
     * @tc.number SUB_NetworkMgr_Connection_ReportNetConnectedNop_0500
     * @tc.desc   Using the removeCustomDnsRule (callback) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testNetworkMgrConnectionReportNetConnectedNop_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName:string = 'testNetworkMgrConnectionReportNetConnectedNop_static_0500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
          connection.removeCustomDnsRule("192.168.1.1", (error: BusinessError | null) => {
            hilog.error(domain, tag, `${caseName} error: ${JSON.stringify(error)}`);
            if (error?.code !== 0) {
              hilog.info(domain, tag, 'removeCustomDnsRule fail');
              ExpectTrue(error?.code === PERMISSION_DENIED_CODE);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, 'removeCustomDnsRule success');
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
        }
    })

    /**
     * @tc.name   testNetworkMgrConnectionReportNetConnectedNop_static_0600
     * @tc.number SUB_NetworkMgr_Connection_ReportNetConnectedNop_0600
     * @tc.desc   Using the removeCustomDnsRule (then) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testNetworkMgrConnectionReportNetConnectedNop_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName:string = 'testNetworkMgrConnectionReportNetConnectedNop_static_0600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
          try {
            await connection.removeCustomDnsRule("192.168.1.1");
            hilog.info(domain, tag, '--------removeCustomDnsRule-------');
            ExpectFail();
            done();
          } catch (err) {
            let error = err as BusinessError;
            hilog.error(domain, tag, ` error: ${JSON.stringify(error)}`);
            if (error.code === PERMISSION_DENIED_CODE) {
              expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              expect(error.code).assertEqual(PARAMETER_ERROR_CODE);
              hilog.info(domain, tag,   `${caseName}---End`);
              done();
            }
          }
      } catch (err) {
        hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testNetworkMgrConnectionReportNetConnectedNop_static_0700
     * @tc.number SUB_NetworkMgr_Connection_ReportNetConnectedNop_0700
     * @tc.desc   Using the removeCustomDnsRule (then) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testNetworkMgrConnectionReportNetConnectedNop_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const caseName:string = 'testNetworkMgrConnectionReportNetConnectedNop_static_0700';
      hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
      try {
          connection.clearCustomDnsRules((error: BusinessError | null) => {
            hilog.info(domain, tag, '%{public}s', '--------removeCustomDnsRule-------');
            if (error?.code === PERMISSION_DENIED_CODE) {
              ExpectTrue(error?.code === PERMISSION_DENIED_CODE);
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            } else {
              ExpectTrue(error?.code === PARAMETER_ERROR_CODE);
              hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
              done();
            }
          })
      } catch (err) {
        hilog.info(domain, tag, '%{public}s', `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testConnectionSetPacFileUrlNoP0100
     * @tc.number SUB_Network_Connection_setPacFileUrlNoP_0100
     * @tc.desc   Calling setPacFileURL without SET-PAC_URL permission returns error code 201.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectionSetPacFileUrlNoP0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionSetPacFileUrlNoP0100';
      console.info(`${caseName}---Start`);
      try{
        connection.setPacFileUrl('a/b.pac');
        console.info(`${caseName} setPacFileUrl success`);
        ExpectFail();
        done();
      } catch (err) {
        console.info(`${caseName} catch err is ${JSON.stringify(err)} `);
        ExpectTrue(err.code === 201);
        done();
      }
    });

    /**
     * @tc.name   testTelephonyConnectionGetAddressesByNameNop_static_0200
     * @tc.number SUB_Telephony_Connection_getAddressesByNameNop_0200
     * @tc.desc   AddressesByName Permission denied
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonyConnectionGetAddressesByNameNop_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTelephonyConnectionGetAddressesByNameNop_static_0200';
      hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
      try{
        try {
          let data = await connection.getAddressesByName("www.baidu.com");
          hilog.info(domain, tag, '%{public}s', `${caseName} Succeeded to get data:${JSON.stringify(data)}`)
          ExpectFail();
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, '%{public}s', `${caseName} Failed to get addresses. Code:${error.code}, message:${error.message}`);
          ExpectTrue(error.code === 201);
          hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
          done();
        }
      }catch (err){
        hilog.info(domain, tag, '%{public}s', `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyConnectionSetPacNop_static_0100
     * @tc.number SUB_Telephony_Connection_SetPacNop_0100
     * @tc.desc   set PacUrl No Permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTelephonyConnectionSetPacNop_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTelephonyConnectionSetPacNop_static_0100';
      hilog.info(domain, tag, '%{public}s', `${caseName}---Start`);
      try{
        connection.setPacUrl("a/b")
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', 'setPacUrl success!');
        done();
      }catch (err){
        hilog.info(domain, tag, '%{public}s', `${caseName} catch err is ${JSON.stringify(err)}`);
        ExpectTrue(err.code === 201);
        hilog.info(domain, tag, '%{public}s', `${caseName} --test end`);
        done();
      }
    })

    /**
     * @tc.name   testNetworkMgrConnectionTraceRoute_static_2000
     * @tc.number SUB_NetworkMgr_Connection_TraceRoute_2000
     * @tc.desc   Test the error code is 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionTraceRoute_static_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionTraceRoute_static_2000";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        let destination = "www.baidu.com";
        let option: connection.TraceRouteOptions = {
          maxJumpNumber: 10,
          packetsType: connection.PacketsType.NETCONN_PACKETS_ICMP,
        };
        try {
          let TraceRouteInfo = await connection.queryTraceRoute(destination, option);
          hilog.info(domain, tag, `${caseName} TraceRouteInfo: ${JSON.stringify(TraceRouteInfo)}`);
          hilog.info(domain, tag, `${caseName} TraceRouteInfo rtt: ${JSON.stringify(TraceRouteInfo[0].rtt)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (err) {
          let error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} queryTraceRoute: err-> ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 201);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionQueryProbeResult_static_1800
     * @tc.number SUB_NetworkMgr_Connection_QueryProbeResult_1800
     * @tc.desc   Test the error code is 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionQueryProbeResult_static_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      const caseName: string = "testNetworkMgrConnectionQueryProbeResult_static_1800";
      hilog.info(domain, tag, `${caseName} test Start`);
      try {
        let destination = "www.baidu.com";
        let duration = 6;
        try {
          let ProbeResultInfo = await connection.queryProbeResult(destination, duration);
          hilog.info(domain, tag, `${caseName} ProbeResultInfo: ${JSON.stringify(ProbeResultInfo)}`);
          hilog.info(domain, tag, `${caseName} lossRate: ${JSON.stringify(ProbeResultInfo.lossRate)}, rtt: ${JSON.stringify(ProbeResultInfo.rtt)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (err) {
          let error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} ProbeResultInfo: err-> ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 201);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch: err->${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionReportNetConnectedNop_static_0100
     * @tc.number SUB_NetworkMgr_Connection_ReportNetConnectedNop_0100
     * @tc.desc   Using the setAppNet (callback) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrConnectionReportNetConnectedNop_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testNetworkMgrConnectionReportNetConnectedNop_static_0100';
      hilog.info(domain, tag, `--------${caseName}----before----`);
      try {
        connection.getDefaultNet((error: BusinessError | null, data: connection.NetHandle | undefined) => {
          if (error?.code !== 0) {
            hilog.error(domain, tag, `Failed to get getDefaultNet default net. Code:${error?.code}, message:${error?.message}`);
            if (error?.code === PERMISSION_DENIED_CODE) {
              hilog.error(domain, tag, `Failed to if(error.code === PERMISSION_DENIED_CODE) 201:` + error?.code);
              if (data !== undefined) {
                connection.setAppNet(data, (error: BusinessError | null) => {
                  if (error?.code !== 0) {
                    hilog.error(domain, tag, `Failed setAppNet to get getDefaultNet default net. Code:${error?.code}, message:${error?.message}`);
                  } else {
                    hilog.info(domain, tag, `Succeeded to get ${caseName}`);
                  }
                });
              }
              if (error?.code === PERMISSION_DENIED_CODE) {
                ExpectTrue(error?.code === PERMISSION_DENIED_CODE);
                done();
              } else {
                ExpectTrue(error?.code === PARAMETER_ERROR_CODE);
                done();
              }
            } else {
              hilog.error(domain, tag, `Failed to if(error.code === PERMISSION_DENIED_CODE) 401:`);
              ExpectTrue(error?.code === PARAMETER_ERROR_CODE);
              done();
            }
          } else {
            expect(data).assertUndefined()
            done();
            hilog.info(domain, tag, `Succeeded to get data ` + JSON.stringify(data));
          }
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} error:` + JSON.stringify(error));
        ExpectFail();
        done()
      }
      hilog.info(domain, tag, `--------${caseName}----after----`);
    })

    /**
     * @tc.name   testNetworkMgrConnectionReportNetConnectedNop_static_0200
     * @tc.number SUB_NetworkMgr_Connection_ReportNetConnectedNop_0200
     * @tc.desc   Using the setAppNet (then) method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrConnectionReportNetConnectedNop_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName = 'testNetworkMgrConnectionReportNetConnectedNop_static_0200';
      hilog.info(domain, tag, `--------${caseName}----before----`);
      try {
        connection.getDefaultNet((error: BusinessError | null, data: connection.NetHandle | undefined) => {
          if (error?.code !== 0) {
            hilog.error(domain, tag, `Failed to get getDefaultNet default net. Code:${error?.code}, message:${error?.message}`);
            if (error?.code === PERMISSION_DENIED_CODE) {
              hilog.error(domain, tag, `Failed to if(error.code === PERMISSION_DENIED_CODE) 201:` + error?.code);
              if (data !== undefined) {
                connection.setAppNet(data).catch((error) => {
                  hilog.error(domain, tag, `Failed setAppNet to get getDefaultNet default net. Code:${error?.code}, message:${error?.message}`);
                  ExpectFail();
                  done();
                });
              }
              if (error?.code === PERMISSION_DENIED_CODE) {
                ExpectTrue(error?.code === PERMISSION_DENIED_CODE);
                done();
              } else {
                ExpectTrue(error?.code === PARAMETER_ERROR_CODE);
                done();
              }
            } else {
              hilog.error(domain, tag, `Failed to if(error.code === PERMISSION_DENIED_CODE) 401:`);
              ExpectTrue(error?.code === PARAMETER_ERROR_CODE);
              done();
            }
          } else {
            expect(data).assertUndefined()
            done();
            hilog.info(domain, tag, `Succeeded to get data ` + JSON.stringify(data));
          }
        });
      } catch (error) {
        hilog.info(domain, tag, `${caseName} error:` + JSON.stringify(error));
        ExpectFail();
        done()
      }
      hilog.info(domain, tag, `--------${caseName}----after----`);
    })
  })
}