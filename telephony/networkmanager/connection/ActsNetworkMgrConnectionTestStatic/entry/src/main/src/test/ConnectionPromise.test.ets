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

import { describe, expect, it, Level, Size, TestType } from "../../../hypium/index";
import connection from '@ohos.net.connection';
import { BusinessError} from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'connectionPromiseTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

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

export default function ConnectionPromiseTest(): void {
  describe("ConnectionPromiseTest", ()=>{
    /**
     * @tc.name   testNetworkManagerDNSAddCustomDNSRulePromise_static_0100
     * @tc.number SUB_NetworkManager_DNS_addCustomDNSRule_Promise_0100
     * @tc.desc   Test addCustomDNSRule property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkManagerDNSAddCustomDNSRulePromise_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      let caseName = "testNetworkManagerDNSAddCustomDNSRulePromise_static_0100";
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        try {
          await connection.addCustomDnsRule(host,ip);
          hilog.info(domain, tag, `${caseName} addCustomDNSRule success`);
          ExpectTrue(true);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (err) {
          hilog.info(domain, tag, `${caseName} addCustomDNSRule failed, code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      }catch (err){
        hilog.info(domain, tag, `${caseName} catch err is `,JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, `${caseName} --test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkManagerConnectionAddCustomDNSRulePromise_static_0300
     * @tc.number SUB_NetworkManager_Connection_addCustomDNSRule_Promise_0300
     * @tc.desc   Test addCustomDNSRule property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkManagerConnectionAddCustomDNSRulePromise_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      let caseName = "testNetworkManagerConnectionAddCustomDNSRulePromise_static_0300";
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        try {
          let data = await connection.addCustomDnsRule(host_null,ip);
          hilog.info(domain, tag, `${caseName} addCustomDNSRule failed, data: ${JSON.stringify(data)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (err) {
          hilog.info(domain, tag, `${caseName} addCustomDNSRule failed, code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectTrue(err.code === 401);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      }catch (err){
        hilog.info(domain, tag, `${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code === 401);
        hilog.info(domain, tag, `${caseName} --test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkManagerConnectionRemoveCustomDNSRulePromise_static_0100
     * @tc.number SUB_NetworkManager_Connection_removeCustomDNSRule_Promise_0100
     * @tc.desc   Test removeCustomDNSRule property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkManagerConnectionRemoveCustomDNSRulePromise_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      let caseName = "testNetworkManagerConnectionRemoveCustomDNSRulePromise_static_0100";
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        await connection.addCustomDnsRule(host1,ip1);
        try {
          await connection.removeCustomDnsRule(host);
          hilog.info(domain, tag, `${caseName} removeCustomDNSRule success`);
          ExpectTrue(true);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (err) {
          hilog.info(domain, tag, `${caseName} removeCustomDNSRule failed, code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      }catch (err){
        hilog.info(domain, tag, `${caseName} catch err is `,JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, `${caseName} --test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkManagerConnectionRemoveCustomDNSRulePromise_static_0300
     * @tc.number SUB_NetworkManager_Connection_removeCustomDNSRule_Promise_0300
     * @tc.desc   Test removeCustomDNSRule property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkManagerConnectionRemoveCustomDNSRulePromise_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      let caseName = "testNetworkManagerConnectionRemoveCustomDNSRulePromise_static_0300";
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        await connection.addCustomDnsRule(host1,ip1);
        try {
          await connection.removeCustomDnsRule(host_null);
          hilog.info(domain, tag, `${caseName} removeCustomDNSRule failed`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (err) {
          hilog.info(domain, tag, `${caseName} removeCustomDNSRule succeed, code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectTrue(err.code === 401);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      }catch (err){
        hilog.info(domain, tag, `${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(err.code === 401);
        hilog.info(domain, tag, `${caseName} --test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkManagerConnectionClearCustomDNSRulePromise_static_0100
     * @tc.number SUB_NetworkManager_Connection_clearCustomDNSRule_Promise_0100
     * @tc.desc   Test clearCustomDnsRules property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkManagerConnectionClearCustomDNSRulePromise_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      let caseName = "testNetworkManagerConnectionClearCustomDNSRulePromise_static_0100";
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        await connection.addCustomDnsRule(host1,ip1);
        await connection.addCustomDnsRule(host2,ip2);
        try {
          await connection.clearCustomDnsRules();
          hilog.info(domain, tag, `${caseName} clearCustomDnsRules success`);
          ExpectTrue(true);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (err) {
          hilog.info(domain, tag, `${caseName} clearCustomDnsRules failed, code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      }catch (err){
        hilog.info(domain, tag, `${caseName} catch err is `,JSON.stringify(err));
        ExpectFail();
        hilog.info(domain, tag, `${caseName} --test end`);
        done();
      }
    });
  })
};
