'use static';
/**
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

import { describe, expect, it, Level, Size, TestType } from "@ohos/hypium-static/src/main/indexStatic";
import connection from '@ohos.net.connection';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'connectionCallbackTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let host='syysystem';
let host1='sytuingm';
let host2='awsyssy';
let ip:Array<string>=['1.2.1.2','2.3.2.3'];
let ip1:Array<string>=['1.2.3.4','2.4.2.5'];
let ip2:Array<string>=['1.2.3.3','2.3.2.6'];
let host_null='';
const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
};

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

export default function ConnectionCallbackTest():void {
  describe("ConnectionCallbackTest", () => {

    
    /**
     * @tc.name   testNetworkManagerDNSAddCustomDNSRuleAsync_static_0100
     * @tc.number SUB_NetworkManager_DNS_addCustomDNSRule_Async_0100
     * @tc.desc   Test addCustomDNSRule property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkManagerDNSAddCustomDNSRuleAsync_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      const caseName: string = 'testNetworkManagerDNSAddCustomDNSRuleAsync_static_0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        connection.addCustomDnsRule(host,ip,(err: BusinessError | null) => {
          if (err?.code !== 0) {
            hilog.info(domain, tag, `${caseName} addCustomDNSRule failed, err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
            ExpectFail();
          } else {
            hilog.info(domain, tag, `${caseName} addCustomDNSRule successed`);
            ExpectTrue(true);
          }
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      }catch (err){
        hilog.info(domain, tag, `${caseName} --test end`);
        hilog.info(domain, tag, `${caseName} catch err is `,JSON.stringify(err.message));
        ExpectTrue(false);
        done();
      }
    });

    /**
     * @tc.name   testNetworkManagerDNSAddCustomDNSRuleAsync_static_0200
     * @tc.number SUB_NetworkManager_DNS_addCustomDNSRule_Async_0200
     * @tc.desc   Test addCustomDNSRule property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkManagerDNSAddCustomDNSRuleAsync_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      const caseName: string = 'testNetworkManagerDNSAddCustomDNSRuleAsync_static_0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        connection.addCustomDnsRule(host_null,ip,(err: BusinessError | null) => {
          if (err?.code !== 0) {
            hilog.info(domain, tag, `${caseName} addCustomDNSRule successed, err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
            ExpectTrue(err?.code === 401);
          } else {
            hilog.info(domain, tag, `${caseName} addCustomDNSRule failed`);
            ExpectFail();
          }
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      }catch (err){
        hilog.info(domain, tag, `${caseName} --test end`);
        hilog.info(domain, tag, `${caseName} catch err is `,JSON.stringify(err.message));
        ExpectTrue(false);
        done();
      }
    });


    /**
     * @tc.name   testNetworkManagerDNSRemoveCustomDNSRuleAsync_static_0100
     * @tc.number SUB_NetworkManager_DNS_removeCustomDNSRule_Async_0100
     * @tc.desc   Test removeCustomDNSRule property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkManagerDNSRemoveCustomDNSRuleAsync_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      const caseName: string = 'testNetworkManagerDNSRemoveCustomDNSRuleAsync_static_0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        await connection.addCustomDnsRule(host,ip);
        connection.removeCustomDnsRule(host,(err: BusinessError | null) => {
          if (err?.code !== 0) {
            hilog.info(domain, tag, `${caseName} removeCustomDNSRule failed, err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
            ExpectFail();
          } else {
            hilog.info(domain, tag, `${caseName} removeCustomDNSRule successed`);
            ExpectTrue(true);
          }
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      }catch (err){
        hilog.info(domain, tag, `${caseName} --test end`);
        hilog.info(domain, tag, `${caseName} catch err is `,JSON.stringify(err.message));
        ExpectTrue(false);
        done();
      }
    });

    /**
     * @tc.name   testNetworkManagerDNSRemoveCustomDNSRuleAsync_static_0200
     * @tc.number SUB_NetworkManager_DNS_removeCustomDNSRule_Async_0200
     * @tc.desc   Test removeCustomDNSRule property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkManagerDNSRemoveCustomDNSRuleAsync_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      const caseName: string = 'testNetworkManagerDNSRemoveCustomDNSRuleAsync_static_0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        connection.removeCustomDnsRule(host_null,(err: BusinessError | null) => {
          if (err?.code !== 0) {
            hilog.info(domain, tag, `${caseName} removeCustomDNSRule failed, err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
            ExpectTrue(err?.code === 401);
          } else {
            hilog.info(domain, tag, `${caseName} removeCustomDNSRule failed`);
            ExpectFail();
          }
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      }catch (err){
        hilog.info(domain, tag, `${caseName} --test end`);
        hilog.info(domain, tag, `${caseName} catch err is `,JSON.stringify(err.message));
        ExpectTrue(err.code === 401);
        done();
      }
    });

    /**
     * @tc.name   testNetworkManagerDNSClearCustomDNSRuleAsync_static_0100
     * @tc.number SUB_NetworkManager_DNS_clearCustomDNSRule_Async_0100
     * @tc.desc   Test removeCustomDNSRule property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkManagerDNSClearCustomDNSRuleAsync_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      const caseName: string = 'testNetworkManagerDNSClearCustomDNSRuleAsync_static_0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        await connection.addCustomDnsRule(host1,ip1);
        await connection.addCustomDnsRule(host2,ip2);
        connection.clearCustomDnsRules((err: BusinessError | null) => {
          if (err?.code !== 0) {
            hilog.info(domain, tag, `${caseName} clearCustomDnsRules failed, err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
            ExpectFail();
          } else {
            hilog.info(domain, tag, `${caseName} clearCustomDnsRules successed`);
            ExpectTrue(true);
          }
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        })
      }catch (err){
        hilog.info(domain, tag, `${caseName} --test end`);
        hilog.info(domain, tag, `${caseName} catch err is `,JSON.stringify(err.message));
        ExpectFail();
        done();
      }
    });
  })
};
