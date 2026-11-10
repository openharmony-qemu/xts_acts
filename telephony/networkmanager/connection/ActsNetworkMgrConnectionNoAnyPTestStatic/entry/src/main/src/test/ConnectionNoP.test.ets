'use static'
/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import {  describe, expect, it, Level, Size, TestType } from "@ohos/hypium-static/src/main/indexStatic";
import connection from '@ohos.net.connection';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'connectionNoPTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let host='syysystem';
let ip:Array<string>=['1.2.1.2','2.3.2.3'];

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, `exportFail failed err: ${JSON.stringify(err)}`);
  }
};

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, `exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

export default function ConnectionNoPTest(): void {
  describe("ConnectionNoPTest",  ()=>{
    
    /**
     * @tc.name   testNetworkManagerDNSaddCustomDNSRuleAsync_static_0300
     * @tc.number SUB_NetworkManager_DNS_addCustomDNSRule_Async_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkManagerDNSaddCustomDNSRuleAsync_static_0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done:()=> void):Promise<void>=> {
      const caseName: string = 'testNetworkManagerDNSaddCustomDNSRuleAsync_static_0300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.addCustomDnsRule(host,ip,(err,data)=>{
          if (err) {
            hilog.info(domain, tag, `${caseName} addCustomDNSRule failed, err: ${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
          } else {
            hilog.info(domain, tag, `${caseName} addCustomDNSRule success, data: ${JSON.stringify(data)}`);
            ExpectFail();
          }
          done();
          hilog.info(domain, tag, `${caseName}---End`);
        });
      }catch (err) {
        hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code === 201);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }

    });

    /**
     * @tc.name   testNetworkManagerDNSaddCustomDNSRulePromise_static_0200
     * @tc.number SUB_NetworkManager_DNS_addCustomDNSRule_Promise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkManagerDNSaddCustomDNSRulePromise_static_0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,async (done:()=> void):Promise<void>=> {
      const caseName: string = 'testNetworkManagerDNSaddCustomDNSRulePromise_static_0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        try {
          let data = await connection.addCustomDnsRule(host,ip);
          hilog.info(domain, tag, `${caseName} addCustomDNSRule success, data: ${JSON.stringify(data)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (error) {
          const err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} addCustomDNSRule failed, err: ${JSON.stringify(err)}`);
          ExpectTrue(err.code === 201);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      }catch (err) {
        hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code === 201);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }

    });

    /**
     * @tc.name   testNetworkManageeDNSremoveCustomDNSRulrAsync_static_0300
     * @tc.number SUB_NetworkManagee_DNS_removeCustomDNSRulr_Async_0300
     * @tc.desc   Test removeCustomDnsRule property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkManageeDNSremoveCustomDNSRulrAsync_static_0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkManageeDNSremoveCustomDNSRulrAsync_static_0300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.removeCustomDnsRule(host,(err,data)=>{
          if (err) {
            hilog.info(domain, tag, `${caseName} removeCustomDNSRule failed, err: ${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } else {
            hilog.info(domain, tag, `${caseName} removeCustomDNSRule success, data: ${JSON.stringify(data)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        });
      }catch (err) {
        hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code === 201);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });


    /**
     * @tc.name   testNetworkManagerDNSremoveCustomDNSRulePromise_static_0200
     * @tc.number SUB_NetworkManager_DNS_removeCustomDNSRule_Promise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkManagerDNSremoveCustomDNSRulePromise_static_0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkManagerDNSremoveCustomDNSRulePromise_static_0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        try {
          let data = await connection.removeCustomDnsRule(host);
          hilog.info(domain, tag, `${caseName} removeCustomDNSRule success, data: ${JSON.stringify(data)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (error) {
          const err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} removeCustomDNSRule failed, err: ${JSON.stringify(err)}`);
          ExpectTrue(err.code === 201);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      }catch (err) {
        hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code === 201);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });
    
    /**
     * @tc.name   testNetworkManagerDNScleraCustomDNSRuleAsync_static_0300
     * @tc.number SUB_NetworkManager_DNS_cleraCustomDNSRule_Async_0300
     * @tc.desc   Test removeCustomDnsRule property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkManagerDNScleraCustomDNSRuleAsync_static_0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,async (done:() => void): Promise<void>=> {
      const caseName: string = 'testNetworkManageeDNSremoveCustomDNSRulrAsync_static_0300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        connection.clearCustomDnsRules((err,data)=>{
          if (err) {
            hilog.info(domain, tag, `${caseName} clearCustomDnsRules failed, err: ${JSON.stringify(err)}`);
            ExpectTrue(err.code === 201);
          } else {
            hilog.info(domain, tag, `${caseName} clearCustomDnsRules success, data: ${JSON.stringify(data)}`);
            ExpectFail();
          }
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      }catch (err) {
        hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code === 201);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkManagerDNSclearCustomDNSRulesPromise_static_0200
     * @tc.number SUB_NetworkManager_DNS_clearCustomDNSRules_Promise_0200
     * @tc.desc   Test clearCustomDnsRules property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkManagerDNSclearCustomDNSRulesPromise_static_0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done:() => void): Promise<void>=> {
      const caseName: string = 'testNetworkManagerDNSclearCustomDNSRulesPromise_static_0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        try {
          let data = await connection.clearCustomDnsRules();
          hilog.info(domain, tag, `${caseName} clearCustomDnsRules success, data: ${JSON.stringify(data)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (error) {
          const err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} clearCustomDnsRules failed, err: ${JSON.stringify(err)}`);
          ExpectTrue(err.code === 201);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      }catch (err) {
        hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(err.code === 201);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });
    
    /**
      * @tc.name   testNetworkMgrConnectionGetIpNeighTableNoP_static_0100
      * @tc.number SUB_NetworkMgr_Connection_GetIpNeighTable_NoP_0100
      * @tc.desc   Test GetIpNeighTable no permission(201)
      * @tc.type   FUNCTION
      * @tc.size   SMALLTEST
      * @tc.level  LEVEL3
      */
    it("testNetworkMgrConnectionGetIpNeighTableNoP_static_0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      let caseName: string = "testNetworkMgrConnectionGetIpNeighTableNoP_static_0100";
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        try {
          let data = await connection.getIpNeighTable();
          if (data.length != 0) {
            hilog.info(domain, tag, `${caseName}ipAddress:${data[0].ipAddress}`)
            hilog.info(domain, tag, `${caseName}ifaceName:${data[0].iface}`)
            hilog.info(domain, tag, `${caseName}macAddress:${data[0].macAddress}`)
          }
          ExpectFail();
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} error  fetching ip neigh table errorCode:${error.code}`+ JSON.stringify(error));
          ExpectTrue(error.code === 201);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      }catch (err){
        hilog.info(domain, tag, `${caseName} catch err is `+JSON.stringify(err));
        ExpectTrue(err.code === 201);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /**
      * @tc.name   testNetworkMgrConnectionGetSystemNetPortStatesNoP_static_0100
      * @tc.number SUB_NetworkMgr_Connection_GetSystemNetPortStates_NoP_0100
      * @tc.desc   Test GetSystemNetPortStates no permission(201)
      * @tc.type   FUNCTION
      * @tc.size   SMALLTEST
      * @tc.level  LEVEL3
      */
    it("testNetworkMgrConnectionGetSystemNetPortStatesNoP_static_0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      let caseName: string = "testNetworkMgrConnectionGetSystemNetPortStatesNoP_static_0100";
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        try {
          let data = await connection.getSystemNetPortStates();
          if (data != undefined) {
            expect(data != undefined).assertTrue();
            hilog.info(domain, tag, `${caseName}tcpPortStatesInfo:${data.tcpPortStatesInfo}`);
            hilog.info(domain, tag, `${caseName}udpPortStatesInfo:${data.udpPortStatesInfo}`);
          }
          ExpectFail();
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} error  fetching port states info errorCode:${error.code}`+ JSON.stringify(error));
          ExpectTrue(error.code === 201);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      }catch (err){
        hilog.info(domain, tag, `${caseName} catch err is `+JSON.stringify(err));
        ExpectTrue(err.code === 201);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });
  });
}




