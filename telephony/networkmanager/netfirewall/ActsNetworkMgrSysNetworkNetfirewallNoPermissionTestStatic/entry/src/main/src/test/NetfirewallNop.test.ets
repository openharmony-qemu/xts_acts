'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level, TestType, Size } from "@ohos/hypium-static/src/main/indexStatic";
import { BusinessError } from '@ohos.base';
import netFirewall from '@ohos.net.netFirewall';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'netfirewallNopTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, ` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

export default function NetfirewallNoP(): void {
  let ipRuleUpd: netFirewall.NetFirewallRule = {
    id: 1,
    name: "rule1",
    description: "rule1 description update",
    direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
    action:netFirewall.FirewallRuleAction.RULE_ALLOW,
    type: netFirewall.NetFirewallRuleType.RULE_IP,
    isEnabled: false,
    appUid: 20001,
    userId: 100
  };
  let policy: netFirewall.NetFirewallPolicy = {
    isOpen: true,
    inAction: netFirewall.FirewallRuleAction.RULE_DENY,
    outAction: netFirewall.FirewallRuleAction.RULE_ALLOW
  };
  let ruleParam: netFirewall.RequestParam = {
    page: 1,
    pageSize: 10,
    orderField: netFirewall.NetFirewallOrderField.ORDER_BY_RULE_NAME,
    orderType: netFirewall.NetFirewallOrderType.ORDER_ASC
  };
  let ipRule: netFirewall.NetFirewallRule = {
    name: "rule1",
    description: "rule1 description",
    direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
    action:netFirewall.FirewallRuleAction.RULE_ALLOW,
    type: netFirewall.NetFirewallRuleType.RULE_IP,
    isEnabled: true,
    appUid: 20001,
    userId: 100
  };
  describe('NetfirewallNoPTest',  () => {
    /**
     * @tc.name   testTelephonyNetfirewallNop_static_0100
     * @tc.number SUB_Telephony_Netfirewall_Nop_0100
     * @tc.desc   setNetFirewallPolicy No permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonyNetfirewallNop_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTelephonyNetfirewallNop_static_0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        netFirewall.setNetFirewallPolicy(100, policy).then(() => {
          hilog.info(domain, tag, `${caseName} set firewall policy success`);
          ExpectTrue(false);
          done();
        }).catch((err) => {
          const error = err as BusinessError;
          hilog.error(domain, tag, `${caseName} set firewall policy failed: ` + JSON.stringify(error));
          ExpectTrue(error.code === 201);
          done();
        });
      }catch (err){
        hilog.info(domain, tag, `${caseName} --test end`);
        hilog.info(domain, tag, `${caseName} catch err is ` + `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err.message)}`);
        ExpectTrue(err.code === 201);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallNop_static_0200
     * @tc.number SUB_Telephony_Netfirewall_Nop_0200
     * @tc.desc   updateNetFirewallRule No permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonyNetfirewallNop_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTelephonyNetfirewallNop_static_0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        netFirewall.updateNetFirewallRule(ipRuleUpd).then(() => {
          hilog.info(domain, tag, `${caseName} set firewall policy success`);
          ExpectTrue(false);
          done();
        }).catch((err) => {
          const error = err as BusinessError;
          hilog.error(domain, tag, `${caseName} set firewall policy failed: ` + JSON.stringify(error));
          ExpectTrue(error.code === 201);
          done();
        });
      }catch (err){
        hilog.info(domain, tag, `${caseName} --test end`);
        hilog.info(domain, tag, `${caseName} catch err is ` + `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err.message)}`);
        ExpectTrue(err.code === 201);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallNop_static_0300
     * @tc.number SUB_Telephony_Netfirewall_Nop_0300
     * @tc.desc   getNetFirewallPolicy No permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonyNetfirewallNop_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTelephonyNetfirewallNop_static_0300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try{

        netFirewall.getNetFirewallPolicy(100).then(() => {
          hilog.info(domain, tag, `${caseName} get firewall  policy success`);
          ExpectTrue(false);
          done();
        }).catch((err) => {
          const error = err as BusinessError;
          hilog.error(domain, tag, `${caseName} get firewall policy failed: ` + JSON.stringify(error));
          ExpectTrue(error.code === 201);
          done();
        });

      }catch (err){
        hilog.info(domain, tag, `${caseName} --test end`);
        hilog.info(domain, tag, `${caseName} catch err is ` + `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err.message)}`);
        ExpectTrue(err.code === 201);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallNop_static_0400
     * @tc.number SUB_Telephony_Netfirewall_Nop_0400
     * @tc.desc   removeNetFirewallRule No permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonyNetfirewallNop_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTelephonyNetfirewallNop_static_0400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        netFirewall.removeNetFirewallRule(100,1).then(() => {
          hilog.info(domain, tag, `${caseName} remove firewall  policy success`);
          ExpectTrue(false);
          done();
        }).catch((err) => {
          const error = err as BusinessError;
          hilog.error(domain, tag, `${caseName} remove firewall policy failed: ` + JSON.stringify(error));
          ExpectTrue(error.code === 201);
          done();
        });

      }catch (err){
        hilog.info(domain, tag, `${caseName} --test end`);
        hilog.info(domain, tag, `${caseName} catch err is ` + `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err.message)}`);
        ExpectTrue(err.code === 201);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallNop_static_0500
     * @tc.number SUB_Telephony_Netfirewall_Nop_0500
     * @tc.desc   getNetFirewallRules No permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonyNetfirewallNop_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTelephonyNetfirewallNop_static_0500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        netFirewall.getNetFirewallRules(100,ruleParam).then(() => {
          hilog.info(domain, tag, `${caseName} remove firewall  policy success`);
          ExpectTrue(false);
          done();
        }).catch((err) => {
          const error = err as BusinessError;
          hilog.error(domain, tag, `${caseName} remove firewall policy failed: ` + JSON.stringify(error));
          ExpectTrue(error.code === 201);
          done();
        });
      }catch (err){
        hilog.info(domain, tag, `${caseName} --test end`);
        hilog.info(domain, tag, `${caseName} catch err is ` + `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err.message)}`);
        ExpectTrue(err.code === 201);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallNop_static_0600
     * @tc.number SUB_Telephony_Netfirewall_Nop_0600
     * @tc.desc   getNetFirewallRule No permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonyNetfirewallNop_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTelephonyNetfirewallNop_static_0600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        netFirewall.getNetFirewallRule(100,1).then(() => {
          hilog.info(domain, tag, `${caseName} remove firewall  policy success`);
          ExpectTrue(false);
          done();
        }).catch((err) => {
          const error = err as BusinessError;
          hilog.error(domain, tag, `${caseName} remove firewall policy failed: ` + JSON.stringify(error));
          ExpectTrue(error.code === 201);
          done();
        });

      }catch (err){
        hilog.info(domain, tag, `${caseName} --test end`);
        hilog.info(domain, tag, `${caseName} catch err is ` + `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err.message)}`);
        ExpectTrue(err.code === 201);
        done();
      }
    })

    /**
     * @tc.name   testTelephonyNetfirewallNop_static_0700
     * @tc.number SUB_Telephony_Netfirewall_Nop_0700
     * @tc.desc   addNetFirewallRule No permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testTelephonyNetfirewallNop_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testTelephonyNetfirewallNop_static_0700';
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        netFirewall.addNetFirewallRule(ipRule).then(() => {
          hilog.info(domain, tag, `${caseName} remove firewall  policy success`);
          ExpectTrue(false);
          done();
        }).catch((err) => {
          const error = err as BusinessError;
          hilog.error(domain, tag, `${caseName} remove firewall policy failed: ` + JSON.stringify(error));
          ExpectTrue(error.code === 201);
          done();
        });

      }catch (err){
        hilog.info(domain, tag, `${caseName} --test end`);
        hilog.info(domain, tag, `${caseName} catch err is ` + `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err.message)}`);
        ExpectTrue(err.code === 201);
        done();
      }
    })
  })
}
