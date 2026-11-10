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
import { describe, it, expect, Level, TestType, Size, beforeAll, afterAll } from "@ohos/hypium-static/src/main/indexStatic";
import { BusinessError } from '@ohos.base';
import netFirewall from '@ohos.net.netFirewall';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'netfirewallErrorCodeTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为


export default function NetfirewallErrorCode01(): void {
  describe('NetfirewallErrorCodeTest01', () => {
    const UID: int = 100;
    let CURRENT_ID: int | undefined = -1;
    let ipRule: netFirewall.NetFirewallRule = {
      name: "rule01",
      description: "rule01 description",
      direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
      action: netFirewall.FirewallRuleAction.RULE_ALLOW,
      type: netFirewall.NetFirewallRuleType.RULE_IP,
      isEnabled: true,
      appUid: 20001,
      protocol: 6,
      userId: 100,
      localIps: [
        {
          family: 1,
          type: 1,
          address: "10.10.1.1",
          mask: 24
        }, {
        family: 1,
        type: 2,
        startIp: "10.20.1.1",
        endIp: "10.20.1.10"
      }],
      remoteIps: [
        {
          family: 1,
          type: 1,
          address: "20.10.1.1",
          mask: 24
        }, {
        family: 1,
        type: 2,
        startIp: "20.20.1.1",
        endIp: "20.20.1.10"
      }],
      remotePorts: [
        {
          startPort: 443,
          endPort: 443
        }],
      localPorts: [
        {
          startPort: 1000,
          endPort: 1000
        }, {
        startPort: 2000,
        endPort: 2001
      }],
    };
    let ipRulers: netFirewall.NetFirewallIpParams [] = []
    const ruleParam: netFirewall.RequestParam = {
      page: 1,
      pageSize: 10,
      orderField: netFirewall.NetFirewallOrderField.ORDER_BY_RULE_NAME,
      orderType: netFirewall.NetFirewallOrderType.ORDER_ASC
    };
    let portRulers: netFirewall.NetFirewallPortParams [] = []
    let domainRulers: netFirewall.NetFirewallDomainParams [] = []

    const ExpectTrue: (n: boolean) => void = (n: boolean) => {
      try {
        expect(n).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, ` exportTrue failed err: ${JSON.stringify(err)}`);
      }
    };
    const getName: () => string = () => {
      return "ruler" + (Math.random() * 1000000).toFixed(0) + (Math.random() * 10000).toFixed(0)
    }
    const getDomainName: () => string = () => {
      return "www.baidu" + (Math.random() * 1000).toFixed(0) + (Math.random() * 10000).toFixed(0) + ".com"
    }

    let updateCurrentId: (caseName: string) => Promise<void> = async (caseName: string) => {
      try {
        await netFirewall.getNetFirewallRules(UID, ruleParam).then((result: netFirewall.FirewallRulePage) => {
          hilog.info(domain, tag, caseName, " get firewall rules : " + JSON.stringify(result));
          if (result.data.length === 0) {
            CURRENT_ID = -1
          } else {
            CURRENT_ID =
              result.data[0].id === undefined ? -1 : result.data[0].id
          }
        }, (err) => {
          const error = err as BusinessError;
          hilog.error(domain, tag, caseName, " get firewall rules failed err in : " + JSON.stringify(error?.message));
        });
      } catch (err) {
        hilog.error(domain, tag, caseName, "  update CurrentId failed err in : " + JSON.stringify(err));
      }
    }

    let removedAll: (deleteNum: int) => Promise<void> = async (deleteNum: int) => {
      try {
        let i = 0
        while (i < deleteNum && CURRENT_ID !== -1) {
          i++;
          await netFirewall.removeNetFirewallRule(UID, CURRENT_ID!).then(() => {
            hilog.info(domain, tag, " removeNetFirewallRule success ");
          }).catch((err) => {
            const error = err as BusinessError;
            i = 2000
            hilog.error(domain, tag, " delete firewall rule failed: " + JSON.stringify(error?.message));
          });
          await updateCurrentId("remove调用")
        }
      } catch (err) {
        hilog.error(domain, tag, " remove netfirewall catch err in ", JSON.stringify(err))
      }
    }

    let getIpRule: () => netFirewall.NetFirewallRule = () => {
      return {
        name: getName(),
        description: "ip Rule description",
        direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
        action: netFirewall.FirewallRuleAction.RULE_ALLOW,
        type: netFirewall.NetFirewallRuleType.RULE_IP,
        isEnabled: true,
        appUid: 20001,
        localIps: [
          {
            family: 1,
            type: 1,
            address: "10.10.1.1",
            mask: 24
          }, {
          family: 1,
          type: 2,
          startIp: "10.20.1.1",
          endIp: "10.20.1.10"
        }],
        remoteIps: [
          {
            family: 1,
            type: 1,
            address: "20.10.1.1",
            mask: 24
          }, {
          family: 1,
          type: 2,
          startIp: "20.20.1.1",
          endIp: "20.20.1.10"
        }],
        protocol: 6,
        localPorts: [
          {
            startPort: 1000,
            endPort: 1000
          }, {
          startPort: 2000,
          endPort: 2001
        }],
        remotePorts: [
          {
            startPort: 443,
            endPort: 443
          }],
        userId: 100
      };
    }
    let getMoreIPRule: (ipNumber: int) => netFirewall.NetFirewallRule = (ipNumber: int) => {
      let resultIpRulers: netFirewall.NetFirewallRule = {
        name: getName(),
        description: "ip Rule description",
        direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
        action: netFirewall.FirewallRuleAction.RULE_ALLOW,
        type: netFirewall.NetFirewallRuleType.RULE_IP,
        isEnabled: true,
        appUid: 20001,
        userId: 100
      }
      for (let i: int = 0; i < ipNumber; i++) {
        ipRulers.push({
          family: 1,
          type: 1,
          address: "10.10.1.1"
        })
      }
      resultIpRulers.localIps = ipRulers
      return resultIpRulers
    }
    let getMorePortRule: () => netFirewall.NetFirewallRule = () => {
      let resultIpRulers: netFirewall.NetFirewallRule = {
        name: getName(),
        description: "ip Rule description",
        direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
        action: netFirewall.FirewallRuleAction.RULE_ALLOW,
        type: netFirewall.NetFirewallRuleType.RULE_IP,
        isEnabled: true,
        appUid: 20001,
        userId: 100
      }
      for (let i: int = 0; i < 20; i++) {
        portRulers.push(
          {
            startPort: 1000,
            endPort: 1000
          })
      }
      resultIpRulers.localPorts = portRulers
      return resultIpRulers
    }
    let getMoreDnsRule: () => netFirewall.NetFirewallRule = () => {
      let resultRulers: netFirewall.NetFirewallRule = {
        name: getName(),
        description: "ip Rule description",
        direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
        action: netFirewall.FirewallRuleAction.RULE_ALLOW,
        type: netFirewall.NetFirewallRuleType.RULE_DNS,
        isEnabled: true,
        appUid: 20001,
        userId: 100
      }
      resultRulers.dns = {
        primaryDns: '1.1.1.1'
      }
      return resultRulers
    }
    let getMoreDomainRuler: () => netFirewall.NetFirewallRule = () => {
      let resultIpRulers: netFirewall.NetFirewallRule = {
        name: getName(),
        description: "ip Rule description",
        direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
        action: netFirewall.FirewallRuleAction.RULE_ALLOW,
        type: netFirewall.NetFirewallRuleType.RULE_DOMAIN,
        isEnabled: true,
        appUid: 20001,
        userId: 100
      }
      for (let i: int = 0; i < 100; i++) {
        domainRulers.push(
          {
            isWildcard: false,
            domain: getDomainName()
          })
      }
      resultIpRulers.domains = domainRulers;
      return resultIpRulers
    }

    let getUpdateIPRule: (ipNumber: int) => netFirewall.NetFirewallRule = (ipNumber: int) => {
      let resultIpRulers: netFirewall.NetFirewallRule = {
        name: getName(),
        description: "ip Rule description",
        direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
        action: netFirewall.FirewallRuleAction.RULE_ALLOW,
        type: netFirewall.NetFirewallRuleType.RULE_IP,
        isEnabled: true,
        appUid: 20001,
        userId: 100,
        id: CURRENT_ID
      }
      for (let i: int = 0; i < ipNumber; i++) {
        ipRulers.push({
          family: 1,
          type: 1,
          address: "10.10.1.1"
        })
      }
      resultIpRulers.localIps = ipRulers
      return resultIpRulers
    }
    let getUpdatePortRule: (portNumber: int) => netFirewall.NetFirewallRule = (portNumber: int) => {
      let resultIpRulers: netFirewall.NetFirewallRule = {
        name: getName(),
        description: "ip Rule description",
        direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
        action: netFirewall.FirewallRuleAction.RULE_ALLOW,
        type: netFirewall.NetFirewallRuleType.RULE_IP,
        isEnabled: true,
        appUid: 20001,
        userId: 100,
        id: CURRENT_ID
      }
      for (let i: int = 0; i < portNumber; i++) {
        portRulers.push(
          {
            startPort: 1000,
            endPort: 1000
          })
      }
      resultIpRulers.localPorts = portRulers
      return resultIpRulers
    }
    let getUpdateDomainRuler: (domainNumber: int) => netFirewall.NetFirewallRule = (domainNumber: int) => {
      let resultIpRulers: netFirewall.NetFirewallRule = {
        name: getName(),
        description: "ip Rule description",
        direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
        action: netFirewall.FirewallRuleAction.RULE_ALLOW,
        type: netFirewall.NetFirewallRuleType.RULE_DOMAIN,
        isEnabled: true,
        appUid: 20001,
        userId: 100,
        id: CURRENT_ID
      }
      for (let i: int = 0; i < domainNumber; i++) {
        domainRulers.push(
          {
            isWildcard: false,
            domain: getDomainName()
          })
      }
      resultIpRulers.domains = domainRulers;
      return resultIpRulers
    }
    let getUpdateDnsRule: () => netFirewall.NetFirewallRule = () => {
      let resultIpRulers: netFirewall.NetFirewallRule = {
        name: getName(),
        description: "ip Rule description",
        direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
        action: netFirewall.FirewallRuleAction.RULE_ALLOW,
        type: netFirewall.NetFirewallRuleType.RULE_DNS,
        isEnabled: true,
        appUid: 20001,
        userId: 100,
        id: CURRENT_ID
      }

      resultIpRulers.dns = {
        primaryDns: '1.1.1.1'
      }
      return resultIpRulers
    }


    beforeAll(async () => {
      await updateCurrentId("beforeAll 调用的");
      await removedAll(100);
    })
    afterAll(async () => {
      await updateCurrentId("afterAll 调用的");
      await removedAll(700);
    })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo_static_0100
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_0100
     * @tc.desc   removeNetFirewallRule The specified rule does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTelephonyNetfirewallErrCo_static_0100';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          netFirewall.removeNetFirewallRule(100, 999999).then(() => {
            hilog.info(domain, tag, `${caseName} delete firewall rule success.`);
            ExpectTrue(false);
            done();
          }).catch((err) => {
            const error = err as BusinessError;
            hilog.error(domain, tag, `${caseName} delete firewall rule failed: ` + JSON.stringify(error));
            ExpectTrue(error?.code === 29400006);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} --test end`);
          hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
          ExpectTrue(err?.code === 29400006);
          done();
        }
      })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo_static_0200
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_0200
     * @tc.desc   updateNetFirewallRule The specified rule does not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTelephonyNetfirewallErrCo_static_0200';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let ipRuleUpd: netFirewall.NetFirewallRule = {
            userId: 100,
            id: 9999999,
            name: "rule2",
            description: "rule1 description update",
            direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
            action: netFirewall.FirewallRuleAction.RULE_DENY,
            type: netFirewall.NetFirewallRuleType.RULE_IP,
            isEnabled: false,
            appUid: 20001
          };
          await netFirewall.updateNetFirewallRule(ipRuleUpd).then(() => {
            hilog.info(domain, tag, `${caseName}update firewall rule success.`);
            ExpectTrue(false);
            done();
          }, (error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, `${caseName}update firewall rule failed: `, JSON.stringify(err));
            ExpectTrue(err?.code === 29400006);
            done();
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, `${caseName} update firewall rule failed: `, JSON.stringify(err));
            ExpectTrue(false);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} --test end`);
          hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
          ExpectTrue(err?.code === 29400006);
          done();
        }
      })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo_static_0300
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_0300
     * @tc.desc   removeNetFirewallRule The specified user does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTelephonyNetfirewallErrCo_static_0300';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          netFirewall.removeNetFirewallRule(205, 999999).then(() => {
            hilog.info(domain, tag, `${caseName} delete firewall rule success.`);
            ExpectTrue(false);
            done();
          }).catch((err) => {
            const error = err as BusinessError;
            hilog.error(domain, tag, `${caseName} delete firewall rule failed: ` + JSON.stringify(error));
            ExpectTrue(error?.code === 29400000);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} --test end`);
          hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
          ExpectTrue(err?.code === 29400000);
          done();
        }
      })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo_static_0400
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_0400
     * @tc.desc   getNetFirewallRule The specified rule does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTelephonyNetfirewallErrCo_static_0400';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          netFirewall.getNetFirewallRule(UID, 999999).then((rule: netFirewall.NetFirewallRule) => {
            hilog.info(domain, tag, `${caseName} result:`, JSON.stringify(rule));
            ExpectTrue(false);
            done();
          }).catch((err) => {
            const error = err as BusinessError;
            hilog.error(domain, tag, ` ${caseName} get firewall rules failed: ` + JSON.stringify(error));
            ExpectTrue(error?.code === 29400006);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} --test end`);
          hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
          ExpectTrue(err?.code === 29400006);
          done();
        }
      })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo_static_0700
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_0700
     * @tc.desc   getNetFirewallRules The specified user does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTelephonyNetfirewallErrCo_static_0700';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let ruleParam: netFirewall.RequestParam = {
            page: 1,
            pageSize: 10,
            orderField: netFirewall.NetFirewallOrderField.ORDER_BY_RULE_NAME,
            orderType: netFirewall.NetFirewallOrderType.ORDER_DESC
          };
          netFirewall.getNetFirewallRules(555, ruleParam).then((result: netFirewall.FirewallRulePage) => {
            hilog.info(domain, tag, `${caseName} result:`, JSON.stringify(result));
            ExpectTrue(false);
            done();
          }, (err) => {
            const error = err as BusinessError;
            hilog.error(domain, tag, `${caseName} get firewall rules failed: ` + JSON.stringify(error));
            ExpectTrue(error?.code === 29400000);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} --test end`);
          hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
          ExpectTrue(err?.code === 29400000);
          done();
        }
      })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo_static_0900
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_0900
     * @tc.desc   getNetFirewallRule The specified user does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTelephonyNetfirewallErrCo_static_0900';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          netFirewall.getNetFirewallRule(500, 5).then((rule: netFirewall.NetFirewallRule) => {
            hilog.info(domain, tag, `${caseName} result:`, JSON.stringify(rule));
            ExpectTrue(false);
            done();
          }).catch((err) => {
            const error = err as BusinessError;
            hilog.error(domain, tag, ` ${caseName} get firewall rules failed: ` + JSON.stringify(error));
            ExpectTrue(error?.code === 29400000);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} --test end`);
          hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
          ExpectTrue(err?.code === 29400000);
          done();
        }
      })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo_static_1900
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_1900
     * @tc.desc   setNetFirewallPolicy The specified user does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo_static_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTelephonyNetfirewallErrCo_static_1900';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let policy: netFirewall.NetFirewallPolicy = {
            isOpen: true,
            inAction: netFirewall.FirewallRuleAction.RULE_DENY,
            outAction: netFirewall.FirewallRuleAction.RULE_DENY
          };
          netFirewall.setNetFirewallPolicy(500, policy).then(() => {
            hilog.info(domain, tag, `${caseName} set firewall policy success.`);
            ExpectTrue(false);
            done();
          }).catch((err) => {
            const error = err as BusinessError;
            hilog.error(domain, tag, `${caseName} set firewall policy failed: ` + JSON.stringify(error));
            ExpectTrue(error?.code === 29400000)
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} --test end`);
          hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
          ExpectTrue(err?.code === 29400000);
          done();
        }
      })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo_static_2000
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_2000
     * @tc.desc   updateNetFirewallRule The specified user does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo_static_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTelephonyNetfirewallErrCo_static_2000';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let ipRuleUpd: netFirewall.NetFirewallRule = {
            userId: 555,
            id: 1,
            name: "rule2",
            description: "rule1 description update",
            direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
            action: netFirewall.FirewallRuleAction.RULE_ALLOW,
            type: netFirewall.NetFirewallRuleType.RULE_IP,
            isEnabled: false,
            appUid: 20001,
            domains: [
              {
                isWildcard: true,
                domain: "www.baidu.com"
              }]
          };
          await netFirewall.updateNetFirewallRule(ipRuleUpd).then(() => {
            hilog.info(domain, tag, `${caseName}update firewall rule success.`);
            ExpectTrue(false);
            done();
          }, (error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, `${caseName}update firewall rule failed: `, JSON.stringify(err));
            ExpectTrue(err?.code === 29400000);
            done();
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, `${caseName} update firewall rule failed: `, JSON.stringify(err));
            ExpectTrue(false);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} --test end`);
          hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
          ExpectTrue(err?.code === 29400000);
          done();
        }
      })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo_static_2300
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_2300
     * @tc.desc   addNetFirewallRule The specified user does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo_static_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTelephonyNetfirewallErrCo_static_2300';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let ipRule: netFirewall.NetFirewallRule = {
            name: "rule1",
            description: "rule1 description",
            direction: netFirewall.NetFirewallRuleDirection.RULE_IN,
            action: netFirewall.FirewallRuleAction.RULE_ALLOW,
            type: netFirewall.NetFirewallRuleType.RULE_IP,
            isEnabled: false,
            appUid: 20001,
            userId: 500
          };
          netFirewall.addNetFirewallRule(ipRule).then((result: int) => {
            hilog.info(domain, tag, `${caseName} rule Id: `, result);
            ExpectTrue(false);
            done();
          }, (error) => {
            const err = error as BusinessError;
            hilog.error(domain, tag, `${caseName} add firewall rule failed: `, JSON.stringify(err));
            ExpectTrue(err?.code === 29400000);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} --test end`);
          hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
          ExpectTrue(err?.code === 29400000);
          done();
        }
      })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo_static_2400
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_2400
     * @tc.desc   getNetFirewallPolicy 	The specified user does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo_static_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTelephonyNetfirewallErrCo_static_2400';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          netFirewall.getNetFirewallPolicy(500).then((result: netFirewall.NetFirewallPolicy) => {
            hilog.info(domain, tag, `${caseName} firewall policy: `, JSON.stringify(result));
            ExpectTrue(false);
            done();
          }, (err) => {
            const error = err as BusinessError;
            hilog.error(domain, tag, `${caseName} get firewall policy failed: `, JSON.stringify(error));
            ExpectTrue(error?.code === 29400000);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} --test end`);
          hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
          ExpectTrue(err?.code === 29400000);
          done();
        }
      })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo_static_2500
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_2500
     * @tc.desc   addNetFirewallRule The specified user does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo_static_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTelephonyNetfirewallErrCo_static_2500';
        hilog.info(domain, tag, `${caseName}---Start`);
        let i: int = 0;
        try {
          while (i < 100) {
            i++;
            await netFirewall.addNetFirewallRule(getMorePortRule()).catch((err: Error) => {
              hilog.info(domain, tag, `${caseName} err in`, JSON.stringify(err))
              ExpectTrue(err?.code === 29400003)
              i = 2000;
              done();
              return
            });
          }
        } catch (err) {
          hilog.info(domain, tag, `${caseName} --test end`);
          hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
          ExpectTrue(err?.code === 29400003);
          done();
        }
      })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo_static_2600
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_2600
     * @tc.desc   addNetFirewallRule The number of IP address rules in the firewall rule exceeds the maximum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo_static_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTelephonyNetfirewallErrCo_static_2600';
        hilog.info(domain, tag, `${caseName}---Start`);
        let i: int = 0;
        try {
          while (i < 5) {
            i++;
            await netFirewall.addNetFirewallRule(getMoreIPRule(20)).catch((error) => {
              const err = error as BusinessError;
              hilog.info(domain, tag, `${caseName}  err in `, JSON.stringify(err))
              ExpectTrue(err?.code === 29400002)
              i = 2000;
              done();
            });
          }
        } catch (err) {
          hilog.info(domain, tag, `${caseName} --test end`);
          hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
          ExpectTrue(err?.code === 29400002);
          done();
        }
      })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo_static_2700
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_2700
     * @tc.desc   addNetFirewallRule The number of domain rules in the firewall rule exceeds the maximum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo_static_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTelephonyNetfirewallErrCo_static_2700';
        hilog.info(domain, tag, `${caseName}---Start`);
        let i: int = 0;
        try {
          while (i < 1001) {
            i++;
            await netFirewall.addNetFirewallRule(getMoreDomainRuler()).then(() => {
              hilog.info(domain, tag, `${caseName} add rule success`, i)
            }).catch(async (error) => {
              const err = error as BusinessError;
              hilog.info(domain, tag, `${caseName} err in `, JSON.stringify(err))
              ExpectTrue(err?.code === 29400004)
              i = 2000;
              done();
              return
            });
          }
        } catch (err) {
          hilog.info(domain, tag, `${caseName} --test end`);
          hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
          ExpectTrue(err?.code === 29400004);
          done();
        }
      })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo_static_3300
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_3300
     * @tc.desc   updateNetFirewallRule The number of domain rules in the firewall rule exceeds the maximum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo_static_3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTelephonyNetfirewallErrCo_static_3300';
        hilog.info(domain, tag, `${caseName}---Start`);
        let i: int = 0;
        try {
          while (i < 600) {
            i++
            updateCurrentId(caseName);
            await netFirewall.updateNetFirewallRule(getUpdateDomainRuler(500)).catch((error) => {
              const err = error as BusinessError;
              hilog.info(domain, tag, `${caseName} err in `, JSON.stringify(err))
              ExpectTrue(err?.code === 29400004)
              i = 2000;
              done();
            });
          }
        } catch (err) {
          hilog.info(domain, tag, `${caseName} --test end`);
          hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
          ExpectTrue(err?.code === 29400004);
          done();
        }
      })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo_static_2800
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_2800
     * @tc.desc   updateNetFirewallRule The number of IP address rules in the firewall rule exceeds the maximum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo_static_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTelephonyNetfirewallErrCo_static_2800';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          await netFirewall.updateNetFirewallRule(getUpdateIPRule(100)).then(() => {
            hilog.info(domain, tag, `${caseName} update ruler success `)
            ExpectTrue(false);
            done();
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, `${caseName} update ruler failed`, JSON.stringify(err))
            ExpectTrue(err?.code === 29400002)
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, `${caseName} --test end`);
          hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
          ExpectTrue(err?.code === 29400002);
          done();
        }
      })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo_static_2900
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_2900
     * @tc.desc   updateNetFirewallRule The number of port rules in the firewall rule exceeds the maximum.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo_static_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTelephonyNetfirewallErrCo_static_2900';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          await netFirewall.updateNetFirewallRule(getUpdatePortRule(110)).then(() => {
            hilog.info(domain, tag, `${caseName} update ruler success `)
            ExpectTrue(false);
            done();
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, `${caseName} update ruler failed`, JSON.stringify(err))
            ExpectTrue(err?.code === 29400003)
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, `${caseName} --test end`);
          hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
          ExpectTrue(err?.code === 29400003);
          done();
        }
      })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo_static_3000
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_3000
     * @tc.desc   addNetFirewallRule The dns rule is duplication.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo_static_3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTelephonyNetfirewallErrCo_static_3000';
        hilog.info(domain, tag, `${caseName}---Start`);
        let i: int = 0;
        try {
          while (i < 5) {
            i++;
            await netFirewall.addNetFirewallRule(getMoreDnsRule()).then(() => {
            }).catch((err: Error) => {
              hilog.info(domain, tag, `${caseName} err in `, JSON.stringify(err))
              ExpectTrue(err?.code === 29400007)
              i = 2000;
              done();
              return
            });
          }
        } catch (err) {
          hilog.info(domain, tag, `${caseName} --test end`);
          hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
          ExpectTrue(err?.code === 29400007);
          done();
        }
      })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo_static_3200
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_3200
     * @tc.desc   updateNetFirewallRule The dns rule is duplication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo_static_3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTelephonyNetfirewallErrCo_static_3200';
        hilog.info(domain, tag, `${caseName}---Start`);
        let i: int = 0;
        try {
          while (i < 1000) {
            i++;
            updateCurrentId(caseName);
            await netFirewall.updateNetFirewallRule(getUpdateDnsRule()).catch((err: Error) => {
              hilog.info(domain, tag, `${caseName} err in`, JSON.stringify(err))
              ExpectTrue(err?.code === 29400007)
              i = 2000
              done();
            });
          }
        } catch (err) {
          hilog.info(domain, tag, `${caseName} --test end`);
          hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
          ExpectTrue(err?.code === 29400007);
          done();
        }
      })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo_static_3100
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_3100
     * @tc.desc   addNetFirewallRule The number of firewall rules exceeds the maximum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo_static_3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTelephonyNetfirewallErrCo_static_3100';
        hilog.info(domain, tag, `${caseName}---Start`);
        let i: int = 0;
        try {
          while (i < 1001) {
            i++;
            await netFirewall.addNetFirewallRule(getIpRule())
              .catch((error) => {
                const err = error as BusinessError;
                hilog.info(domain, tag, `${caseName} err in `, JSON.stringify(err))
                ExpectTrue(err?.code === 29400001)
                done();
                i = 2000;
              });
          }
        } catch (err) {
          hilog.info(domain, tag, `${caseName} --test end`);
          hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
          ExpectTrue(err?.code === 29400001);
          done();
        }
      })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo_static_3800
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_3800
     * @tc.desc   updateNetFirewallRule The specified user does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo_static_3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTelephonyNetfirewallErrCo_static_3800';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let ipRuleUpd: netFirewall.NetFirewallRule = {
            userId: 555,
            id: 1,
            name: "rule2",
            description: "rule1 description update",
            direction: netFirewall.NetFirewallRuleDirection.RULE_OUT,
            action: netFirewall.FirewallRuleAction.RULE_ALLOW,
            type: netFirewall.NetFirewallRuleType.RULE_DOMAIN,
            isEnabled: true,
            appUid: 20001,
            localIps: [
              {
                family: 1,
                type: 1,
                address: "",
                mask: 24
              }, {
              family: 1,
              type: 2,
              startIp: "",
              endIp: ""
            }],
            remoteIps: [
              {
                family: 1,
                type: 1,
                address: "",
                mask: 24
              }, {
              family: 1,
              type: 2,
              startIp: "",
              endIp: ""
            }],
            localPorts: [
              {
                startPort: 1000,
                endPort: 1000
              }, {
              startPort: 2000,
              endPort: 2001
            }],
            remotePorts: [
              {
                startPort: 443,
                endPort: 443
              }],
            domains: [
              {
                isWildcard: false,
                domain: ""
              }
            ],
            dns: {
              primaryDns: "",
              standbyDns: "",
            }
          };
          await netFirewall.updateNetFirewallRule(ipRuleUpd).then(() => {
            hilog.info(domain, tag, `${caseName}update firewall rule success.`);
            ExpectTrue(false);
            done();
          }, (error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, `${caseName}update firewall rule failed: `, JSON.stringify(err));
            ExpectTrue(err?.code === 2100001);
            done();
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, `${caseName} update firewall rule failed: `, JSON.stringify(err));
            ExpectTrue(false);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} --test end`);
          hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
          ExpectTrue(err?.code === 2100001);
          done();
        }
      })

    /**
     * @tc.name   testTelephonyNetfirewallErrCo_static_3900
     * @tc.number SUB_Telephony_Netfirewall_ErrCo_3900
     * @tc.desc   updateNetFirewallRule The specified user does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testTelephonyNetfirewallErrCo_static_3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testTelephonyNetfirewallErrCo_static_3900';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let ipRuleUpd: netFirewall.NetFirewallRule = {
            userId: 555,
            id: 1,
            name: "rule2",
            description: "rule1 description update",
            direction: netFirewall.NetFirewallRuleDirection.RULE_OUT,
            action: netFirewall.FirewallRuleAction.RULE_ALLOW,
            type: netFirewall.NetFirewallRuleType.RULE_DNS,
            isEnabled: true,
            appUid: 20001,
            localIps: [],
            remoteIps: [],
            localPorts: [],
            remotePorts: [],
            domains: [],
            dns: {
              primaryDns: "4.4.4.4",
              standbyDns: "8.8.8.8",
            },
          };
          await netFirewall.updateNetFirewallRule(ipRuleUpd).then(() => {
            hilog.info(domain, tag, `${caseName}update firewall rule success.`);
            ExpectTrue(false);
            done();
          }, (error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, `${caseName}update firewall rule failed: `, JSON.stringify(err));
            ExpectTrue(err?.code === 29400000);
            done();
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, `${caseName} update firewall rule failed: `, JSON.stringify(err));
            ExpectTrue(false);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} --test end`);
          hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
          ExpectTrue(err?.code === 29400000);
          done();
        }
      })

  })
}

