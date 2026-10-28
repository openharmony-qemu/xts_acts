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
import { describe, beforeAll, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import netFirewall from '@ohos.net.netFirewall';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'netfirewallTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
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

export default function netfirewallTest(): void {
  describe('netfriewallTest', () => {
    const userId: int = 100;
    let Current_Ruler_ID: int | undefined = -1;
    const ruleParam: netFirewall.RequestParam = {
      page: 1,
      pageSize: 10,
      orderField: netFirewall.NetFirewallOrderField.ORDER_BY_RULE_NAME,
      orderType: netFirewall.NetFirewallOrderType.ORDER_ASC
    };
    const ruleDirection_RULE_IN: netFirewall.NetFirewallRuleDirection = netFirewall.NetFirewallRuleDirection.RULE_IN;
    const ruleDirection_RULE_OUT: netFirewall.NetFirewallRuleDirection = netFirewall.NetFirewallRuleDirection.RULE_OUT;
    const ruleAction_RULE_ALLOW: netFirewall.FirewallRuleAction = netFirewall.FirewallRuleAction.RULE_ALLOW;
    const ruleAction_RULE_DENY: netFirewall.FirewallRuleAction = netFirewall.FirewallRuleAction.RULE_DENY
    const ruleType_RULE_IP: netFirewall.NetFirewallRuleType = netFirewall.NetFirewallRuleType.RULE_IP;
    const ruleType_RULE_DNS: netFirewall.NetFirewallRuleType = netFirewall.NetFirewallRuleType.RULE_DNS;
    const ruleType_RULE_DOMAIN: netFirewall.NetFirewallRuleType = netFirewall.NetFirewallRuleType.RULE_DOMAIN;
    const orderField_ORDER_BY_RULE_NAME: netFirewall.NetFirewallOrderField =
      netFirewall.NetFirewallOrderField.ORDER_BY_RULE_NAME;
    const orderField_ORDER_BY_RECORD_TIME: netFirewall.NetFirewallOrderField =
      netFirewall.NetFirewallOrderField.ORDER_BY_RECORD_TIME;
    const orderType_ORDER_ASC: netFirewall.NetFirewallOrderType = netFirewall.NetFirewallOrderType.ORDER_ASC;
    const orderType_ORDER_DESC: netFirewall.NetFirewallOrderType = netFirewall.NetFirewallOrderType.ORDER_DESC;

    let updateCurrentId: (caseName: string) => Promise<void> = async (caseName: string) => {
      try {
        await netFirewall.getNetFirewallRules(userId, ruleParam).then((result: netFirewall.FirewallRulePage) => {
          hilog.info(domain, tag, caseName, " get firewall rules : " + JSON.stringify(result));
          if (result.data.length === 0) {
            Current_Ruler_ID = -1
          } else {
            Current_Ruler_ID =
              result!.data[0]!.id === undefined ? -1 : result!.data[0]!.id
          }
        }, (err) => {
          const error = err as BusinessError;
          hilog.error(domain, tag, caseName, " get firewall rules failed err in : " + JSON.stringify(error.message));
        });
      } catch (err) {
        hilog.error(domain, tag, caseName, "  update CurrentId failed err in : " + `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
      }
    }

    let removedAll: (deleteNum: int) => Promise<void> = async (deleteNum: int) => {
      try {
        let i = 0
        while (i < deleteNum && Current_Ruler_ID !== -1) {
          i++;
          await netFirewall.removeNetFirewallRule(userId, Current_Ruler_ID!).then(() => {
            hilog.info(domain, tag, "removeNetFirewallRule success ");
          }).catch((err) => {
            const error = err as BusinessError;
            i = 2000
            hilog.error(domain, tag, " delete firewall rule failed: " + JSON.stringify(error.message));
          });
          await updateCurrentId("remove调用")
        }
      } catch (err) {
        hilog.error(domain, tag, " remove netfirewall catch err in "+ `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`)
      }
    }

    beforeAll(async () => {
      await updateCurrentId("beforeAll 调用的");
      await removedAll(100);
    })

    /**
     * @tc.name   testNetFirewallAddNetFirewallRule_static_0100
     * @tc.number SUB_Network_NetFirewall_AddNetFirewallRule_0100
     * @tc.desc   Add a NetFirewallRule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetFirewallAddNetFirewallRule_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetFirewallAddNetFirewallRule_static_0100';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let ipRule_01: netFirewall.NetFirewallRule = {
            name: "rule10",
            description: "rule10 description",
            direction: ruleDirection_RULE_OUT,
            action: ruleAction_RULE_ALLOW,
            type: ruleType_RULE_DOMAIN,
            isEnabled: false,
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
            domains: [
              {
                isWildcard: false,
                domain: "www.baidu.com"
              }
            ],
            dns: {
              primaryDns: "11.1.11.1",
              standbyDns: "11.0.11.2"
            }
          };
          netFirewall.addNetFirewallRule(ipRule_01).then((result: int) => {
            hilog.info(domain, tag, `${caseName} rule Id: `, result);
            ExpectTrue(true);
            done();
          }, (err) => {
            const reason = err as BusinessError;
            ExpectFail();
            done();
            hilog.error(domain, tag, `${caseName} add firewall rule failed: `, JSON.stringify(reason));
          });
        } catch (err) {
          hilog.info(domain, tag, "test end");
          hilog.info(domain, tag, `${caseName} catch err is `+ `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          done();
        }
      })

    /**
     * @tc.name   testNetFirewallAddNetFirewallRule_static_0200
     * @tc.number SUB_Network_NetFirewall_AddNetFirewallRule_0200
     * @tc.desc   Add a NetFirewallRule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetFirewallAddNetFirewallRule_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetFirewallAddNetFirewallRule_static_0200';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let ipRule_01: netFirewall.NetFirewallRule = {
            name: "rule10",
            description: "rule10 description",
            direction: ruleDirection_RULE_IN,
            action: ruleAction_RULE_DENY,
            type: ruleType_RULE_IP,
            isEnabled: true,
            appUid: 20001,
            protocol: 6,
            userId: 100,
            domains: [
              {
                isWildcard: true,
                domain: "www.baidu.com"
              }
            ]
          };
          netFirewall.addNetFirewallRule(ipRule_01).then((result: int) => {
            hilog.info(domain, tag, `${caseName} rule Id: `, result);
            ExpectTrue(true);
            done();
          }, (err) => {
            const reason = err as BusinessError;
            ExpectFail();
            done();
            hilog.error(domain, tag, `${caseName} add firewall rule failed: `, JSON.stringify(reason));
          });

        } catch (err) {
          hilog.info(domain, tag, "test end");
          hilog.info(domain, tag, `${caseName} catch err is `+ `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          done();
        }
      })

    /**
     * @tc.name   testNetFirewallAddNetFirewallRule_static_0300
     * @tc.number SUB_Network_NetFirewall_AddNetFirewallRule_0300
     * @tc.desc   Add a NetFirewallRule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetFirewallAddNetFirewallRule_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetFirewallAddNetFirewallRule_static_0300';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let ipRule_01: netFirewall.NetFirewallRule = {
            name: "rule10",
            description: "rule10 description",
            direction: ruleDirection_RULE_IN,
            action: ruleAction_RULE_DENY,
            type: netFirewall.NetFirewallRuleType.RULE_DNS,
            isEnabled: true,
            appUid: 20001,
            protocol: 6,
            userId: 100,
            localIps: [],
            remoteIps: [],
            remotePorts: [],
            localPorts: [],
            domains: [],
            dns: {
              primaryDns: "11.1.11.1",
              standbyDns: "11.0.11.2"
            }
          };
          netFirewall.addNetFirewallRule(ipRule_01).then((result: int) => {
            hilog.info(domain, tag, `${caseName} rule Id: `, result);
            ExpectTrue(result !== undefined);
            done();
          }, (err) => {
            const reason = err as BusinessError;
            ExpectFail();
            done();
            hilog.error(domain, tag, `${caseName} add firewall rule failed: `, JSON.stringify(reason));
          });
        } catch (err) {
          hilog.info(domain, tag, "test end");
          hilog.info(domain, tag, `${caseName} catch err is `+ `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          done();
        }
      })

    /**
     * @tc.name   testNetFirewallSetNetFirewallPolicy_static_0100
     * @tc.number SUB_Network_NetFirewall_setNetFirewallPolicy_0100
     * @tc.desc   Set NetFirewall Policy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetFirewallSetNetFirewallPolicy_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetFirewallSetNetFirewallPolicy_static_0100';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let policy: netFirewall.NetFirewallPolicy = {
            isOpen: true,
            inAction: ruleAction_RULE_ALLOW,
            outAction: ruleAction_RULE_ALLOW
          };
          netFirewall.setNetFirewallPolicy(userId, policy).then(() => {
            hilog.info(domain, tag, `${caseName} set firewall policy success.`);
            ExpectTrue(true);
            done();
          }).catch((err) => {
            const error = err as BusinessError;
            hilog.info(domain, tag, `${caseName} set firewall policy failed: ` + JSON.stringify(error));
            ExpectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, "test end");
          hilog.info(domain, tag, `${caseName} catch err is `+ `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          done();
        }
      })

    /**
     * @tc.name   testNetFirewallSetNetFirewallPolicy_static_0200
     * @tc.number SUB_Network_NetFirewall_setNetFirewallPolicy_0200
     * @tc.desc   Set NetFirewall Policy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetFirewallSetNetFirewallPolicy_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetFirewallSetNetFirewallPolicy_static_0200';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let policy: netFirewall.NetFirewallPolicy = {
            isOpen: false,
            inAction: netFirewall.FirewallRuleAction.RULE_ALLOW,
            outAction: netFirewall.FirewallRuleAction.RULE_ALLOW
          };
          netFirewall.setNetFirewallPolicy(userId, policy).then(() => {
            hilog.info(domain, tag, `${caseName} set firewall policy success.`);
            ExpectTrue(true);
            done();
          }).catch((err) => {
            const error = err as BusinessError;
            hilog.info(domain, tag, `${caseName} set firewall policy failed: ` + JSON.stringify(error));
            ExpectFail();
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, "test end");
          hilog.info(domain, tag, `${caseName} catch err is `+ `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          done();
        }
      })

    /**
     * @tc.name   testNetFirewallGetNetFirewallRules_static_0100
     * @tc.number SUB_Network_NetFirewall_getNetFirewallRules_0100
     * @tc.desc   Get NetFirewallRules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetFirewallGetNetFirewallRules_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetFirewallGetNetFirewallRules_static_0100';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let ruleParam: netFirewall.RequestParam = {
            page: 1,
            pageSize: 10,
            orderField: orderField_ORDER_BY_RULE_NAME,
            orderType: orderType_ORDER_ASC
          };
          netFirewall.getNetFirewallRules(userId, ruleParam).then((result: netFirewall.FirewallRulePage) => {
            hilog.info(domain, tag, `${caseName} getNetFirewallRules success :`, JSON.stringify(result));
            Current_Ruler_ID = result.data[0].id;
            ExpectTrue(result.page !== undefined);
            ExpectTrue(result.pageSize !== undefined);
            ExpectTrue(result.totalPage !== undefined);
            ExpectTrue(result.data !== undefined);
            done();
          }, (err) => {
            const error = err as BusinessError;
            hilog.error(domain, tag, "get firewall rules failed: " + JSON.stringify(error));
            ExpectFail();
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} test end`);
          hilog.info(domain, tag, `${caseName} catch err is `+ `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          done();
        }
      })

    /**
     * @tc.name   testNetFirewallGetNetFirewallRule_static_0100
     * @tc.number SUB_Network_NetFirewall_GetNetFirewallRule_0100
     * @tc.desc   testNetFirewallGetNetFirewallRule_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetFirewallGetNetFirewallRule_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetFirewallGetNetFirewallRule_static_0100';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          netFirewall.getNetFirewallRule(userId, Current_Ruler_ID!).then((rule: netFirewall.NetFirewallRule) => {
            hilog.info(domain, tag, `${caseName} result:`, JSON.stringify(rule));
            Current_Ruler_ID = rule.id;
            ExpectTrue(true);
            done();
          }).catch((err) => {
            const error = err as BusinessError;
            hilog.error(domain, tag, `${caseName} get firewall rules failed: ` + JSON.stringify(error));
            ExpectTrue(false);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, "test end");
          hilog.info(domain, tag, `${caseName} catch err is `+ `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectTrue(false);
          done();
        }
      })

    /**
     * @tc.name   testNetFirewallGetNetFirewallRule_static_0200
     * @tc.number SUB_Network_NetFirewall_getNetFirewallRule_0200
     * @tc.desc   testNetFirewallGetNetFirewallRule_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetFirewallGetNetFirewallRule_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetFirewallGetNetFirewallRule_static_0200';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let ipRule_01: netFirewall.NetFirewallRule = {
            userId: userId,
            name: "rule10",
            direction: ruleDirection_RULE_IN,
            action: ruleAction_RULE_ALLOW,
            type: ruleType_RULE_IP,
            isEnabled: true,
            description: "rule10 description",
            appUid: 20001,
            protocol: 6,
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
            domains: [
              {
                isWildcard: true,
                domain: "www.baidu.com"
              }
            ],
            dns: {
              primaryDns: "11.1.11.1",
              standbyDns: "11.0.11.2"
            }
          };
          await netFirewall.addNetFirewallRule(ipRule_01).then(async (result: int) => {
            hilog.info(domain, tag, `${caseName} rule Id: `, result);
            Current_Ruler_ID = result;
          }, (err) => {
            const reason = err as BusinessError;
            hilog.error(domain, tag, `${caseName} add firewall rule failed: `, JSON.stringify(reason));
            ExpectFail();
            done();
          });

          await netFirewall.getNetFirewallRule(userId, Current_Ruler_ID!).then((rule: netFirewall.NetFirewallRule) => {
            hilog.info(domain, tag, `${caseName} result:`, JSON.stringify(rule));
            Current_Ruler_ID = rule.id;
            ExpectTrue(rule.userId !== null);
            ExpectTrue(rule.name !== null);
            ExpectTrue(rule.direction === netFirewall.NetFirewallRuleDirection.RULE_IN);
            ExpectTrue(rule.action === netFirewall.FirewallRuleAction.RULE_ALLOW);
            ExpectTrue(rule.type === netFirewall.NetFirewallRuleType.RULE_IP);
            ExpectTrue(rule.isEnabled);
            ExpectTrue(rule.id !== null);
            ExpectTrue(rule.description !== null);
            ExpectTrue(rule.appUid !== null);
            ExpectTrue(rule.protocol !== null);
            if (rule.localIps !== undefined) {
              ExpectTrue(rule.localIps!.length !== 0);
            } else {
              ExpectFail();
            }
            if (rule.remoteIps !== undefined) {
              ExpectTrue(rule.remoteIps!.length !== 0);
            } else {
              ExpectFail();
            }
            if (rule.localPorts !== undefined) {
              ExpectTrue(rule.localPorts!.length !== 0);
            } else {
              ExpectFail();
            }
            if (rule.remotePorts !== undefined) {
              ExpectTrue(rule.remotePorts!.length !== 0);
            } else {
              ExpectFail();
            }
            if (rule.domains !== undefined) {
              ExpectTrue(rule.domains!.length === 0);
            }
            done();
          }).catch((err) => {
            const error = err as BusinessError;
            hilog.error(domain, tag, `${caseName} get firewall rules failed: ` + JSON.stringify(error));
            ExpectTrue(false);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, "test end");
          hilog.info(domain, tag, `${caseName} catch err is `+ `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectTrue(false);
          done();
        }
      })

    /**
     * @tc.name   testNetFirewallGetNetFirewallRule_static_0300
     * @tc.number SUB_Network_NetFirewall_getNetFirewallRule_0300
     * @tc.desc   testNetFirewallGetNetFirewallRule_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetFirewallGetNetFirewallRule_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetFirewallGetNetFirewallRule_static_0300';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let ipRule_01: netFirewall.NetFirewallRule = {
            userId: userId,
            name: "rule10",
            direction: ruleDirection_RULE_OUT,
            action: ruleAction_RULE_DENY,
            type: ruleType_RULE_DOMAIN,
            isEnabled: false,
            description: "rule10 description",
            appUid: 20001,
            protocol: 6,
            localIps: [],
            remoteIps: [],
            remotePorts: [],
            localPorts: [],
            domains: [],
            dns: {
              primaryDns: "11.1.11.1",
              standbyDns: "11.0.11.2"
            }
          };
          await netFirewall.addNetFirewallRule(ipRule_01).then(async (result: int) => {
            hilog.info(domain, tag, `${caseName} rule Id: `, result);
            Current_Ruler_ID = result;
          }, (err) => {
            const reason = err as BusinessError;
            hilog.error(domain, tag, `${caseName} add firewall rule failed: `, JSON.stringify(reason));
            ExpectFail();
            done();
          });

          await netFirewall.getNetFirewallRule(userId, Current_Ruler_ID!).then((rule: netFirewall.NetFirewallRule) => {
            hilog.info(domain, tag, `${caseName} result:`, JSON.stringify(rule));
            Current_Ruler_ID = rule.id;
            ExpectTrue(rule.direction === netFirewall.NetFirewallRuleDirection.RULE_OUT);
            ExpectTrue(rule.action === netFirewall.FirewallRuleAction.RULE_DENY);
            ExpectTrue(rule.type === netFirewall.NetFirewallRuleType.RULE_DOMAIN);
            ExpectTrue(rule.isEnabled === false);
            if (rule.localIps !== undefined) {
              ExpectTrue(rule.localIps!.length === 0);
            }
            if (rule.remoteIps !== undefined) {
              ExpectTrue(rule.remoteIps!.length === 0);
            }
            if (rule.localPorts !== undefined) {
              ExpectTrue(rule.localPorts!.length === 0);
            }
            if (rule.remotePorts !== undefined) {
              ExpectTrue(rule.remotePorts!.length === 0);
            }
            if (rule.domains !== undefined) {
              ExpectTrue(rule.domains!.length === 0);
            } else {
              ExpectFail();
            }
            done();
          }).catch((err) => {
            const error = err as BusinessError;
            hilog.error(domain, tag, `${caseName} get firewall rules failed: ` + JSON.stringify(error));
            ExpectTrue(false);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, "test end");
          hilog.info(domain, tag, `${caseName} catch err is `+ `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectTrue(false);
          done();
        }
      })

    /**
     * @tc.name   testNetFirewallGetNetFirewallRule_static_0400
     * @tc.number SUB_Network_NetFirewall_getNetFirewallRule_0400
     * @tc.desc   testNetFirewallGetNetFirewallRule_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNetFirewallGetNetFirewallRule_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetFirewallGetNetFirewallRule_static_0400';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let ipRule_01: netFirewall.NetFirewallRule = {
            userId: userId,
            name: "rule10",
            direction: ruleDirection_RULE_OUT,
            action: ruleAction_RULE_DENY,
            type: ruleType_RULE_DNS,
            isEnabled: false,
            description: "rule10 description",
            appUid: 20001,
            protocol: 6,
            localIps: [],
            remoteIps: [],
            remotePorts: [],
            localPorts: [],
            domains: [],
            dns: {
              primaryDns: "11.1.11.10",
              standbyDns: "11.0.11.20"
            }
          };
          await netFirewall.addNetFirewallRule(ipRule_01).then((result: int) => {
            hilog.info(domain, tag, `${caseName} rule Id: `, result);
            Current_Ruler_ID = result;
          }, (err) => {
            const reason = err as BusinessError;
            hilog.error(domain, tag, `${caseName} add firewall rule failed: `, JSON.stringify(reason));
            ExpectFail();
            done();
          });

          await netFirewall.getNetFirewallRule(userId, Current_Ruler_ID!).then((rule: netFirewall.NetFirewallRule) => {
            hilog.info(domain, tag, `${caseName} result:`, JSON.stringify(rule));
            Current_Ruler_ID = rule.id;
            ExpectTrue(rule.type === netFirewall.NetFirewallRuleType.RULE_DNS);
            if (rule.dns !== undefined) {
              ExpectTrue(rule.dns!.primaryDns !== null);
              ExpectTrue(rule.dns!.standbyDns !== null);
            } else {
              ExpectFail();
            }
            done();
          }).catch((err) => {
            const error = err as BusinessError;
            hilog.error(domain, tag, `${caseName} get firewall rules failed: ` + JSON.stringify(error));
            ExpectTrue(false);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, "test end");
          hilog.info(domain, tag, `${caseName} catch err is `+ `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectTrue(false);
          done();
        }
      })

    /**
     * @tc.name   testNetFirewallGetNetFirewallPolicy_static_0100
     * @tc.number SUB_Network_NetFirewall_getNetFirewallPolicy_0100
     * @tc.desc   Get NetFirewall Policy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetFirewallGetNetFirewallPolicy_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetFirewallGetNetFirewallPolicy_static_0100';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          netFirewall.getNetFirewallPolicy(userId).then((result: netFirewall.NetFirewallPolicy) => {
            hilog.info(domain, tag, `${caseName} getNetFirewallPolicy success`)
            hilog.info(domain, tag, 'firewall policy: ', JSON.stringify(result));
            ExpectTrue(result.isOpen !== undefined);
            ExpectTrue(result.inAction !== undefined);
            ExpectTrue(result.outAction !== undefined);
            done();
          }, (err) => {
            const reason = err as BusinessError;
            hilog.error(domain, tag, 'get firewall policy failed: ', JSON.stringify(reason));
            ExpectFail();
            done()
          })
        } catch (err) {
          hilog.info(domain, tag, `${caseName} getNetFirewallPolicy failed Error is `, err)
          ExpectFail();
          done();
        }
      })

    /**
     * @tc.name   testNetFirewallGetNetFirewallPolicy_static_0200
     * @tc.number SUB_Network_NetFirewall_getNetFirewallPolicy_0200
     * @tc.desc   Get NetFirewall Policy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetFirewallGetNetFirewallPolicy_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetFirewallGetNetFirewallPolicy_static_0200';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let policy: netFirewall.NetFirewallPolicy = {
            isOpen: true,
            inAction: ruleAction_RULE_ALLOW,
            outAction: ruleAction_RULE_ALLOW
          };
          netFirewall.setNetFirewallPolicy(userId, policy).then(() => {
            hilog.info(domain, tag, `${caseName} set firewall policy success.`);
          }).catch((err) => {
            const error = err as BusinessError;
            hilog.info(domain, tag, `${caseName} set firewall policy failed: ` + JSON.stringify(error));
            done();
          });

          netFirewall.getNetFirewallPolicy(userId).then((result: netFirewall.NetFirewallPolicy) => {
            hilog.info(domain, tag, `${caseName} getNetFirewallPolicy success`);
            hilog.info(domain, tag, 'firewall policy: ', JSON.stringify(result));
            ExpectTrue(result.isOpen);
            ExpectTrue(result.inAction === netFirewall.FirewallRuleAction.RULE_ALLOW);
            ExpectTrue(result.outAction === netFirewall.FirewallRuleAction.RULE_ALLOW);
            done();
          }, (err) => {
            const reason = err as BusinessError;
            hilog.error(domain, tag, 'get firewall policy failed: ', JSON.stringify(reason));
            ExpectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, `${caseName} getNetFirewallPolicy failed Error is `, err);
          ExpectFail();
          done();
        }
      })

    /**
     * @tc.name   testNetFirewallGetNetFirewallPolicy_static_0300
     * @tc.number SUB_Network_NetFirewall_getNetFirewallPolicy_0300
     * @tc.desc   Get NetFirewall Policy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetFirewallGetNetFirewallPolicy_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetFirewallGetNetFirewallPolicy_static_0300';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let policy: netFirewall.NetFirewallPolicy = {
            isOpen: false,
            inAction: ruleAction_RULE_DENY,
            outAction: ruleAction_RULE_DENY
          };
          await netFirewall.setNetFirewallPolicy(userId, policy).then(() => {
            hilog.info(domain, tag, `${caseName} set firewall policy success.`);
          }).catch((err) => {
            const error = err as BusinessError;
            hilog.info(domain, tag, `${caseName} set firewall policy failed: ` + JSON.stringify(error));
            done();
            return;
          });

          await netFirewall.getNetFirewallPolicy(userId).then((result: netFirewall.NetFirewallPolicy) => {
            hilog.info(domain, tag, `${caseName} getNetFirewallPolicy success`);
            hilog.info(domain, tag, 'firewall policy: ', JSON.stringify(result));
            ExpectTrue(result.isOpen === false);
            ExpectTrue(result.inAction === netFirewall.FirewallRuleAction.RULE_DENY);
            ExpectTrue(result.outAction === netFirewall.FirewallRuleAction.RULE_DENY);
            done();
          }, (err) => {
            const reason = err as BusinessError;
            hilog.error(domain, tag, 'get firewall policy failed: ', JSON.stringify(reason));
            ExpectFail();
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, `${caseName} getNetFirewallPolicy failed Error is `, err);
          ExpectFail();
          done();
        }
      })

    /**
     * @tc.name   testNetFirewallupdateNetFirewallRule_static_0100
     * @tc.number SUB_Network_NetFirewall_UpdateNetFirewallRule_0100
     * @tc.desc   testNetFirewallupdateNetFirewallRule_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetFirewallupdateNetFirewallRule_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetFirewallupdateNetFirewallRule_static_0100';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let ipRuleUpd: netFirewall.NetFirewallRule = {
            userId: userId,
            id: Current_Ruler_ID,
            name: "rule2",
            description: "rule1 description update",
            direction: ruleDirection_RULE_IN,
            action: ruleAction_RULE_ALLOW,
            type: ruleType_RULE_IP,
            isEnabled: false,
            appUid: 20001
          };
          await netFirewall.updateNetFirewallRule(ipRuleUpd).then(() => {
            hilog.info(domain, tag, `${caseName}update firewall rule success.`);
            ExpectTrue(true);
            done();
          }, (err) => {
            const reason = err as BusinessError;
            hilog.info(domain, tag, `${caseName}update firewall rule failed: `, JSON.stringify(reason));
            ExpectTrue(false);
            done();
          }).catch((error) => {
            const err = error as BusinessError;
            hilog.info(domain, tag, `${caseName} update firewall rule failed: `+ `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
            ExpectTrue(false);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, "test end ");
          hilog.info(domain, tag, `${caseName} catch err is `+ `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          done();
        }
      })

    /**
     * @tc.name   testNetFirewallRemoveNetFirewallRule_static_0100
     * @tc.number SUB_Network_NetFirewall_RemoveNetFirewallRule_0100
     * @tc.desc   Remove NetFirewall Rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNetFirewallRemoveNetFirewallRule_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const caseName: string = 'testNetFirewallRemoveNetFirewallRule_static_0100';
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          await netFirewall.removeNetFirewallRule(userId, Current_Ruler_ID!).then(() => {
            hilog.info(domain, tag, "delete firewall rule success.");
            ExpectTrue(true);
            done();
          }).catch((err) => {
            const error = err as BusinessError;
            hilog.error(domain, tag, "delete firewall rule failed: " + JSON.stringify(error));
            ExpectTrue(false);
            done();
          });
        } catch (err) {
          hilog.info(domain, tag, "test end");
          hilog.info(domain, tag, `${caseName} catch err is `+ `code:${JSON.stringify(err?.code)}, message:${JSON.stringify(err?.message)}`);
          ExpectFail();
          done();
        }
      })
  })
}

