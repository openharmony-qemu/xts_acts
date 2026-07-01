/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import trafficFilterSdk from 'libentry.so'
import hilog from '@ohos.hilog';

let domain: number = 0x0000;
let tag: string = 'TrafficFilterTag';

export enum IPMatchType {
  IP_MATCH_ANY = 0,
  IP_MATCH_SINGLE = 1,
  IP_MATCH_CIDR = 2,
  IP_MATCH_RANGE = 3,
  IP_MATCH_MULTI = 4
}


export enum IPFamily {
  IP_FAMILY_UNSPEC = 0,
  IP_FAMILY_V4 = 1,
  IP_FAMILY_V6 = 2
}

export enum PortMatchType {
  PORT_MATCH_ANY = 0,
  PORT_MATCH_SINGLE = 1,
  PORT_MATCH_RANGE = 2,
  PORT_MATCH_MULTI = 3
}

export enum HookPoint {
  HOOK_INPUT = 0,
  HOOK_OUTPUT = 1,
  HOOK_FORWARD = 2,
  HOOK_PREROUTING = 3,
  HOOK_POSTROUTING = 4
}

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, ` exportFail failed err: ${JSON.stringify(err)}`);
  }
};
const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, ` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

function getBaseRule(): trafficFilterSdk.RuleConfig {
  return {
    priority: 1,
    hookPoint: HookPoint.HOOK_OUTPUT,
    protocol: 6, // TCP
    srcIp: { type: IPMatchType.IP_MATCH_ANY, invert: false },
    srcPort: { type: PortMatchType.PORT_MATCH_ANY, invert: false },
    dstIp: { type: IPMatchType.IP_MATCH_ANY, invert: false },
    dstPort: {
      type: PortMatchType.PORT_MATCH_SINGLE,
      invert: false,
      value: 8080
    },
    inInterface: { enabled: false, invert: false, isPrefix: false, ifName: '' },
    outInterface: { enabled: false, invert: false, isPrefix: false, ifName: '' },
    uidStart: 0xFFFFFFFF,
    uidEnd: 0xFFFFFFFF,
    proxyIp: {
      family: IPFamily.IP_FAMILY_V4,
      addr: ['192.168.1.0']
    },
    proxyPort: 3128
  };
}

export default function TrafficFilterTest() {
  describe('TrafficFilterTest', () => {

    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterCreateRedirector0100
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_CreateRedirector_0100
     * @tc.desc   Create redirector instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrNetfirewallTrafficFilterCreateRedirector0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterCreateRedirector0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} success to get ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 0 && info !== null);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterCreateRedirector0200
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_CreateRedirector_0200
     * @tc.desc   Create redirector instance_duplicate group_id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterCreateRedirector0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterCreateRedirector0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} first create ret: ${JSON.stringify(info.ret)}`);
        const info2: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} second create ret: ${JSON.stringify(info2.ret)}`);
        ExpectTrue(info2.ret === 29410104);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        trafficFilterSdk.DestroyRedirector(info2.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterCreateRedirector0300
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_CreateRedirector_0300
     * @tc.desc   Create redirector instance_group_id boundary value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterCreateRedirector0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterCreateRedirector0300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(1, 500);
        hilog.info(domain, tag, `${caseName} success to get ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 0 && info !== null);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterCreateRedirector0400
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_CreateRedirector_0400
     * @tc.desc   Create redirector instance_group_id boundary value 65535
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterCreateRedirector0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterCreateRedirector0400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(65535, 500);
        hilog.info(domain, tag, `${caseName} success to get ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 0 && info !== null);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterCreateRedirector0500
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_CreateRedirector_0500
     * @tc.desc   Create redirector instance_group_id exceeds max value 65536
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterCreateRedirector0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterCreateRedirector0500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(65536, 500);
        hilog.info(domain, tag, `${caseName} ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 29410101);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterCreateRedirector0600
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_CreateRedirector_0600
     * @tc.desc   Create redirector instance_group_id less than minimum 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterCreateRedirector0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterCreateRedirector0600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(0, 500);
        hilog.info(domain, tag, `${caseName} ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 29410101);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterCreateRedirector0700
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_CreateRedirector_0700
     * @tc.desc   Create redirector instance_priority boundary value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterCreateRedirector0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterCreateRedirector0700';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 1);
        hilog.info(domain, tag, `${caseName} success to get ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 0 && info !== null);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterCreateRedirector0800
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_CreateRedirector_0800
     * @tc.desc   Create redirector instance_priority boundary value 10000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterCreateRedirector0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterCreateRedirector0800';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 10000);
        hilog.info(domain, tag, `${caseName} success to get ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 0 && info !== null);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterCreateRedirector0900
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_CreateRedirector_0900
     * @tc.desc   Create redirector instance_priority exceeds max value 10001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterCreateRedirector0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterCreateRedirector0900';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 10001);
        hilog.info(domain, tag, `${caseName} ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 29410101);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterCreateRedirector1000
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_CreateRedirector_1000
     * @tc.desc   Create redirector instance_priority less than minimum 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterCreateRedirector1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterCreateRedirector1000';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 0);
        hilog.info(domain, tag, `${caseName} ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 29410101);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterCreateRedirector1100
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_CreateRedirector_1100
     * @tc.desc   Create redirector instance_create multiple instances with different group_id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterCreateRedirector1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterCreateRedirector1100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info1: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} first create ret: ${JSON.stringify(info1.ret)}`);
        const info2: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(101, 500);
        hilog.info(domain, tag, `${caseName} second create ret: ${JSON.stringify(info2.ret)}`);
        ExpectTrue(info1.ret === 0 && info1 !== null && info2.ret === 0 && info2 !== null);
        trafficFilterSdk.DestroyRedirector(info2.redirector);
        trafficFilterSdk.DestroyRedirector(info1.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })



    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterDestroyRedirector0100
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_DestroyRedirector_0100
     * @tc.desc   Destroy redirector instance_valid redirector instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrNetfirewallTrafficFilterDestroyRedirector0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterDestroyRedirector0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        const ret: number = trafficFilterSdk.DestroyRedirector(info.redirector);
        hilog.info(domain, tag, `${caseName} destroy ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterDestroyRedirector0200
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_DestroyRedirector_0200
     * @tc.desc   Destroy redirector instance_invalid redirector instance (already destroyed)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterDestroyRedirector0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterDestroyRedirector0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const ret = trafficFilterSdk.DestroyRedirector(101);
        ExpectTrue(ret === 29410102);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })



    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule0100
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_0100
     * @tc.desc   Add redirect rule to redirector instance_valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule0200
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_0200
     * @tc.desc   Add redirect rule to redirector instance_redirector is NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        const ret: number = trafficFilterSdk.AddRedirectRule(null, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule0300
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_0300
     * @tc.desc   Add redirect rule to redirector instance_rule is NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule0300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, null);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule0500
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_0500
     * @tc.desc   Add redirect rule to redirector instance_set priority boundary value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule0500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.priority = 1;
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule0600
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_0600
     * @tc.desc   Add redirect rule to redirector instance_set priority boundary value 10000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule0600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.priority = 10000;
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule0700
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_0700
     * @tc.desc   Add redirect rule to redirector instance_set priority less than minimum 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule0700';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.priority = 0;
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule0800
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_0800
     * @tc.desc   Add redirect rule to redirector instance_set priority greater than max value 10001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule0800';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.priority = 10001;
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule0900
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_0900
     * @tc.desc   Add redirect rule to redirector instance_set Hook Point value to INPUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule0900';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.hookPoint = HookPoint.HOOK_INPUT;
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule1000
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_1000
     * @tc.desc   Add redirect rule to redirector instance_set Hook Point value to OUTINPUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule1000';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.hookPoint = HookPoint.HOOK_OUTPUT;
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule1100
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_1100
     * @tc.desc   Add redirect rule to redirector instance_set Hook Point value to FORWARD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule1100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.hookPoint = HookPoint.HOOK_FORWARD;
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule1200
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_1200
     * @tc.desc   Add redirect rule to redirector instance_set Hook Point value to PREOUTING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule1200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.hookPoint = HookPoint.HOOK_PREROUTING;
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule1300
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_1300
     * @tc.desc   Add redirect rule to redirector instance_set Hook Point value to POSTROUTING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule1300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.hookPoint = HookPoint.HOOK_POSTROUTING;
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule1400
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_1400
     * @tc.desc   Add redirect rule to redirector instance_source address single IP, valid IP address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule1400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcIp = { type: IPMatchType.IP_MATCH_SINGLE, invert: false, value: {family:IPFamily.IP_FAMILY_V4,addr:['192.168.1.0']} };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule1600
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_1600
     * @tc.desc   Add redirect rule to redirector instance_source address CIDR type, valid IP address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule1600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcIp = { type: IPMatchType.IP_MATCH_CIDR, invert: false, value: { base: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.1.0'] }, prefixLen: 30 } };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule1800
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_1800
     * @tc.desc   Add redirect rule to redirector instance_source address CIDR type, IPv4 prefixLen value 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule1800';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcIp = { type: IPMatchType.IP_MATCH_CIDR, invert: false, value: { base: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.1.0'] }, prefixLen: 30 } };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })

    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule1900
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_1900
     * @tc.desc   Add redirect rule to redirector instance_source address CIDR type, IPv4 prefixLen exceeds max 33
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule1900';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcIp = { type: IPMatchType.IP_MATCH_CIDR, invert: false, value: { base: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.1.0'] }, prefixLen: 33 } };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2000
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_2000
     * @tc.desc   Add redirect rule to redirector instance_source address CIDR type, IPv6 prefixLen value 64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2000';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcIp = { type: IPMatchType.IP_MATCH_CIDR, invert: false, value: { base: { family: IPFamily.IP_FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e7'] }, prefixLen: 64  } };
        rule.proxyIp = {family: IPFamily.IP_FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e9']};
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2100
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_2100
     * @tc.desc   Add redirect rule to redirector instance_source address CIDR type, IPv6 prefixLen exceeds max 129
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcIp = { type: IPMatchType.IP_MATCH_CIDR, invert: false, value: { base: { family: IPFamily.IP_FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e7'] }, prefixLen: 129 } };
        rule.proxyIp = {family: IPFamily.IP_FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e9']};
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2200
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_2200
     * @tc.desc   Add redirect rule to redirector instance_source address RANGE type, normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcIp = {
          type: IPMatchType.IP_MATCH_RANGE,
          invert: false,
          value:  { start: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.1.1'] }, end: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.1.10'] } }
        };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2400
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_2400
     * @tc.desc   Add redirect rule to redirector instance_source address RANGE type, startIp and endIp family inconsistent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcIp = {
          type: IPMatchType.IP_MATCH_RANGE,
          invert: false,
          value: { start: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.1.1'] }, end: { family: IPFamily.IP_FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e8'] } }
        };
        rule.proxyIp = {family: IPFamily.IP_FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e9']};
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2500
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_2500
     * @tc.desc   Add redirect rule to redirector instance_source address MULTI type, set single address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcIp = { type: IPMatchType.IP_MATCH_MULTI, invert: false, value: { ips: [{ family: IPFamily.IP_FAMILY_V4, addr: ['192.168.1.1'] }] } };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2600
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_2600
     * @tc.desc   Add redirect rule to redirector instance_source address MULTI type, set multiple addresses
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcIp = {
          type: IPMatchType.IP_MATCH_MULTI,
          invert: false,
          value: { ips: [
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.1']},
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.2']},
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.3']},
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.4']},
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.5']},
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.6']},
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.7']},
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.8']},
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.9']}
          ] }
        };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2700
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_2700
     * @tc.desc   Add redirect rule to redirector instance_source address MULTI type, set address count exceeds max 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2700';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcIp = {
          type: IPMatchType.IP_MATCH_MULTI,
          invert: false,
          value: { ips: [
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.1']},
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.2']},
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.3']},
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.4']},
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.5']},
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.6']},
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.7']},
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.8']},
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.9']},
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.10']},
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.11']},
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.13']},
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.14']},
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.15']},
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.16']},
            {family: IPFamily.IP_FAMILY_V4,addr:['192.168.1.17']},
          ] }
        };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2800
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_2800
     * @tc.desc   Add redirect rule to redirector instance_source address type is ANY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2800';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcIp = { type: IPMatchType.IP_MATCH_ANY, invert: false };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2900
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_2900
     * @tc.desc   Add redirect rule to redirector instance_source address type is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule2900';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcIp = { type: 100, invert: false };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3000
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_3000
     * @tc.desc   Add redirect rule to redirector instance_source port SINGLE type, valid port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3000';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcPort = { type: PortMatchType.PORT_MATCH_SINGLE, invert: false, value: 8080 };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3200
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_3200
     * @tc.desc   Add redirect rule to redirector instance_source port RANGE type, set port range startPort < endPort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcPort = {
          type: PortMatchType.PORT_MATCH_RANGE,
          invert: false,
          value: { startPort: 1000, endPort: 2000 }
        };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3300
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_3300
     * @tc.desc   Add redirect rule to redirector instance_source port RANGE type, set port range startPort > endPort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcPort = {
          type: PortMatchType.PORT_MATCH_RANGE,
          invert: false,
          value: { startPort: 2000, endPort: 1000 }
        };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3400
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_3400
     * @tc.desc   Add redirect rule to redirector instance_source port MULTI type, set single port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcPort = { type: PortMatchType.PORT_MATCH_MULTI, invert: false, value: { ports: [8080] } };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3500
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_3500
     * @tc.desc   Add redirect rule to redirector instance_source port MULTI type, set multiple ports
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcPort = { type: PortMatchType.PORT_MATCH_MULTI, invert: false, value: { ports: [8080,8081,8082,8083,8084] } };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3600
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_3600
     * @tc.desc   Add redirect rule to redirector instance_source port MULTI type, set port count exceeds max 64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcPort = { type: PortMatchType.PORT_MATCH_MULTI, invert: false, value: { ports: [8080,8081,8082,8083,8084,8085,8086,8087,8088,8089,8090,8091,8092,8093,8094,8095,8096,8097,8098,8099,8100,8101,8102,8103,8104,8105,8106,8107,8108,8109,8110,8111,8112,8113,8114,8115,8116,8117,8118,8119,8120,8121,8122,8123,8124,8125,8126,8127,8128,8129,8130,8131,8132,8133,8134,8135,8136,8137,8138,8139,8140,8141,8142,8143,8144] } };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3700
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_3700
     * @tc.desc   Add redirect rule to redirector instance_source port type is ANY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3700';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcPort = { type: PortMatchType.PORT_MATCH_ANY, invert: false };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3800
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_3800
     * @tc.desc   Add redirect rule to redirector instance_destination address single IP, valid IP address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3800';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.dstIp = { type: IPMatchType.IP_MATCH_SINGLE, invert: false, value: {family: IPFamily.IP_FAMILY_V4, addr: ['192.168.2.1']} };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3900
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_3900
     * @tc.desc   Add redirect rule to redirector instance_destination address single IP, invalid IP address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule3900';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.dstIp = { type: IPMatchType.IP_MATCH_SINGLE, invert: false, value: {family: IPFamily.IP_FAMILY_V4, addr: ['invalid']} };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule4000
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_4000
     * @tc.desc   Add redirect rule to redirector instance_destination address CIDR type, valid IP address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule4000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule4000';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.dstIp = { type: IPMatchType.IP_MATCH_CIDR, invert: false, value: {base: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.2.0'] }, prefixLen: 30 } };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule4200
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_4200
     * @tc.desc   Add redirect rule to redirector instance_destination address CIDR type, IPv4 prefixLen value 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule4200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.dstIp = { type: IPMatchType.IP_MATCH_CIDR, invert: false, value: { base: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.2.0'] }, prefixLen: 30 } };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule4300
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_4300
     * @tc.desc   Add redirect rule to redirector instance_destination address CIDR type, IPv4 prefixLen exceeds max 33
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule4300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.dstIp = { type: IPMatchType.IP_MATCH_CIDR, invert: false, value: {base: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.2.0'] }, prefixLen: 33 } };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule4400
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_4400
     * @tc.desc   Add redirect rule to redirector instance_destination address CIDR type, IPv6 prefixLen value 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule4400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule4400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.dstIp = { type: IPMatchType.IP_MATCH_CIDR, invert: false, value: {base: { family: IPFamily.IP_FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e8'] }, prefixLen: 100 } };
        rule.proxyIp = {family: IPFamily.IP_FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e9']};
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule4500
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_4500
     * @tc.desc   Add redirect rule to redirector instance_destination address CIDR type, IPv6 prefixLen exceeds max 129
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule4500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.dstIp = { type: IPMatchType.IP_MATCH_CIDR, invert: false, value: {base: { family: IPFamily.IP_FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e8'] }, prefixLen: 129 } };
        rule.proxyIp = {family: IPFamily.IP_FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e9']};
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule4600
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_4600
     * @tc.desc   Add redirect rule to redirector instance_destination address RANGE type, normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule4600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.dstIp = {
          type: IPMatchType.IP_MATCH_RANGE,
          invert: false,
          value: { start: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.2.1'] }, end: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.2.10'] } }
        };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule4800
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_4800
     * @tc.desc   Add redirect rule to redirector instance_destination address RANGE type, startIp and endIp family inconsistent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule4800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule4800';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.dstIp = {
          type: IPMatchType.IP_MATCH_RANGE,
          invert: false,
          value: { start: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.2.1'] }, end: { family: IPFamily.IP_FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e8'] } }
        };
        rule.proxyIp = {family: IPFamily.IP_FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e9']};
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule4900
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_4900
     * @tc.desc   Add redirect rule to redirector instance_destination address MULTI type, set single address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule4900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule4900';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.dstIp = { type: IPMatchType.IP_MATCH_MULTI, invert: false, value: { ips: [{ family: IPFamily.IP_FAMILY_V4, addr: ['192.168.2.1']}] } };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5000
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_5000
     * @tc.desc   Add redirect rule to redirector instance_destination address MULTI type, set multiple addresses
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5000';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.dstIp = {
          type: IPMatchType.IP_MATCH_MULTI, invert: false,
          value: { ips: [
            {family:IPFamily.IP_FAMILY_V4,addr:['192.168.1.1']},
            {family:IPFamily.IP_FAMILY_V4,addr:['192.168.1.2']},
            {family:IPFamily.IP_FAMILY_V4,addr:['192.168.1.3']},
            {family:IPFamily.IP_FAMILY_V4,addr:['192.168.1.4']},
            {family:IPFamily.IP_FAMILY_V4,addr:['192.168.1.5']},
          ]},
        };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5100
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_5100
     * @tc.desc   Add redirect rule to redirector instance_destination address MULTI type, set address count exceeds max 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.dstIp = {
          type: IPMatchType.IP_MATCH_MULTI, invert: false,
          value: { ips: [
            {family:IPFamily.IP_FAMILY_V4,addr:['192.168.1.1']},
            {family:IPFamily.IP_FAMILY_V4,addr:['192.168.1.2']},
            {family:IPFamily.IP_FAMILY_V4,addr:['192.168.1.3']},
            {family:IPFamily.IP_FAMILY_V4,addr:['192.168.1.4']},
            {family:IPFamily.IP_FAMILY_V4,addr:['192.168.1.5']},
            {family:IPFamily.IP_FAMILY_V4,addr:['192.168.1.6']},
            {family:IPFamily.IP_FAMILY_V4,addr:['192.168.1.7']},
            {family:IPFamily.IP_FAMILY_V4,addr:['192.168.1.8']},
            {family:IPFamily.IP_FAMILY_V4,addr:['192.168.1.9']},
            {family:IPFamily.IP_FAMILY_V4,addr:['192.168.1.10']},
            {family:IPFamily.IP_FAMILY_V4,addr:['192.168.1.11']},
            {family:IPFamily.IP_FAMILY_V4,addr:['192.168.1.12']},
            {family:IPFamily.IP_FAMILY_V4,addr:['192.168.1.13']},
            {family:IPFamily.IP_FAMILY_V4,addr:['192.168.1.14']},
            {family:IPFamily.IP_FAMILY_V4,addr:['192.168.1.15']},
            {family:IPFamily.IP_FAMILY_V4,addr:['192.168.1.16']},
            {family:IPFamily.IP_FAMILY_V4,addr:['192.168.1.17']},
          ]}
        };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5200
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_5200
     * @tc.desc   Add redirect rule to redirector instance_destination address type is ANY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.dstIp = { type: IPMatchType.IP_MATCH_ANY, invert: false };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5300
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_5300
     * @tc.desc   Add redirect rule to redirector instance_destination address type is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.dstIp = { type: 100, invert: false };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5400
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_5400
     * @tc.desc   Add redirect rule to redirector instance_destination port SINGLE type, valid port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.dstPort = { type: PortMatchType.PORT_MATCH_SINGLE, invert: false, value: 9090 };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5600
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_5600
     * @tc.desc   Add redirect rule to redirector instance_destination port RANGE type, set port range startPort < endPort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.dstPort = {
          type: PortMatchType.PORT_MATCH_RANGE,
          invert: false,
          value: { startPort: 1000, endPort: 2000 }
        };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5700
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_5700
     * @tc.desc   Add redirect rule to redirector instance_destination port RANGE type, set port range startPort > endPort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5700';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.dstPort = {
          type: PortMatchType.PORT_MATCH_RANGE,
          invert: false,
          value: { startPort: 2000, endPort: 1000 }
        };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5800
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_5800
     * @tc.desc   Add redirect rule to redirector instance_destination port MULTI type, set single port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5800';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.dstPort = { type: PortMatchType.PORT_MATCH_MULTI, invert: false, value: { ports: [9090] } };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5900
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_5900
     * @tc.desc   Add redirect rule to redirector instance_destination port MULTI type, set multiple ports
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule5900';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.dstPort = { type: PortMatchType.PORT_MATCH_MULTI, invert: false, value: { ports: [8080,8081,8082,8083,8084,8085,8086] } };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6000
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_6000
     * @tc.desc   Add redirect rule to redirector instance_destination port MULTI type, set port count exceeds max 64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6000';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.dstPort = { type: PortMatchType.PORT_MATCH_MULTI, invert: false, value: { ports: [8080,8081,8082,8083,8084,8085,8086,8087,8088,8089,8090,8091,8092,8093,8094,8095,8096,8097,8098,8099,8100,8101,8102,8103,8104,8105,8106,8107,8108,8109,8110,8111,8112,8113,8114,8115,8116,8117,8118,8119,8120,8121,8122,8123,8124,8125,8126,8127,8128,8129,8130,8131,8132,8133,8134,8135,8136,8137,8138,8139,8140,8141,8142,8143,8144] } };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6100
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_6100
     * @tc.desc   Add redirect rule to redirector instance_destination port type is ANY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.dstPort = { type: PortMatchType.PORT_MATCH_ANY, invert: false };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6200
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_6200
     * @tc.desc   Add redirect rule to redirector instance_srcIp and dstIp family is IPV4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcIp = { type: IPMatchType.IP_MATCH_SINGLE, invert: false, value: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.1.1'] } };
        rule.dstIp = { type: IPMatchType.IP_MATCH_SINGLE, invert: false, value: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.2.1'] } };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6300
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_6300
     * @tc.desc   Add redirect rule to redirector instance_srcIp and dstIp family is IPV6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcIp = { type: IPMatchType.IP_MATCH_SINGLE, invert: false, value: { family: IPFamily.IP_FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e7'] } };
        rule.dstIp = { type: IPMatchType.IP_MATCH_SINGLE, invert: false, value: { family: IPFamily.IP_FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e8'] } };
        rule.proxyIp = {family: IPFamily.IP_FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e9']};
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6400
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_6400
     * @tc.desc   Add redirect rule to redirector instance_srcIp and dstIp family inconsistent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcIp = { type: IPMatchType.IP_MATCH_SINGLE, invert: false, value: { family: IPFamily.IP_FAMILY_V4, addr: ['fe80::22b1:da93:1050:36e7'] } };
        rule.dstIp = { type: IPMatchType.IP_MATCH_SINGLE, invert: false, value: { family: IPFamily.IP_FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e8'] } };
        rule.proxyIp = {family: IPFamily.IP_FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e9']};
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6500
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_6500
     * @tc.desc   Add redirect rule to redirector instance_inInterface enabled, set interfaceName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.inInterface = { enabled: true, ifName: 'eho', invert: false, isPrefix: false };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6600
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_6600
     * @tc.desc   Add redirect rule to redirector instance_inInterface enabled, set interfaceName empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.inInterface = { enabled: true, ifName: '', invert: false, isPrefix: false };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6700
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_6700
     * @tc.desc   Add redirect rule to redirector instance_set uidStart and uidEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6700';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.uidStart = 100;
        rule.uidEnd = 200;
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6800
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_6800
     * @tc.desc   Add redirect rule to redirector instance_set uidStart > uidEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6800';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.uidStart = 200;
        rule.uidEnd = 100;
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6900
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_6900
     * @tc.desc   Add redirect rule to redirector instance_only set uidStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule6900';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.uidStart = 100;
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7000
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_7000
     * @tc.desc   Add redirect rule to redirector instance_only set uidEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7000';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.uidEnd = 100;
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7100
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_7100
     * @tc.desc   Add redirect rule to redirector instance_Hook Point is OUTPUT, set UID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.hookPoint = 1;
        rule.uidStart = 100;
        rule.uidEnd = 200;
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7200
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_7200
     * @tc.desc   Add redirect rule to redirector instance_Hook Point is PREROUTING, set UID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.hookPoint = 3;
        rule.uidStart = 100;
        rule.uidEnd = 200;
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7300
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_7300
     * @tc.desc   Add redirect rule to redirector instance_proxyIp family inconsistent with srcIp and dstIp family
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcIp = { type: IPMatchType.IP_MATCH_SINGLE, invert: false, value: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.1.1'] } };
        rule.dstIp = { type: IPMatchType.IP_MATCH_SINGLE, invert: false, value: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.2.1'] } };
        rule.proxyIp = {family: IPFamily.IP_FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e9']};
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7400
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_7400
     * @tc.desc   Add redirect rule to redirector instance_proxyIp family consistent with srcIp and dstIp family
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcIp = { type: IPMatchType.IP_MATCH_SINGLE, invert: false, value: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.1.1'] } };
        rule.dstIp = { type: IPMatchType.IP_MATCH_SINGLE, invert: false, value: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.2.1'] } };
        rule.proxyIp = { family: IPFamily.IP_FAMILY_V4, addr: ['10.0.0.1'] };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7500
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_7500
     * @tc.desc   Add redirect rule to redirector instance_proxyIp family not set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcIp = { type: IPMatchType.IP_MATCH_SINGLE, invert: false, value: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.1.1'] } };
        rule.dstIp = { type: IPMatchType.IP_MATCH_SINGLE, invert: false, value: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.2.1'] } };
        rule.proxyIp = { family: IPFamily.IP_FAMILY_UNSPEC, addr: ['10.0.0.1'] };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7600
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_7600
     * @tc.desc   Add redirect rule to redirector instance_protocol is not TCP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.protocol = 0;
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7700
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_7700
     * @tc.desc   Add redirect rule to redirector instance_single IP + single port + IPv4 + PREROUTING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7700';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcIp = { type: IPMatchType.IP_MATCH_SINGLE, invert: false, value: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.1.1'] } };
        rule.srcPort = { type: PortMatchType.PORT_MATCH_SINGLE, invert: false, value: 8080 };
        rule.hookPoint = HookPoint.HOOK_PREROUTING;
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7800
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_7800
     * @tc.desc   Add redirect rule to redirector instance_multiple source IPs + multiple source ports + IPv6 + OUTPUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7800';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcIp = {
          type: IPMatchType.IP_MATCH_MULTI,
          invert: false,
          value: { ips: [{ family: IPFamily.IP_FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e7'] }, { family: IPFamily.IP_FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e8'] }] }
        };
        rule.srcPort = {
          type: PortMatchType.PORT_MATCH_MULTI,
          invert: false,
          value: { ports: [8080, 8081] }
        };
        rule.proxyIp = {family: IPFamily.IP_FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e9']};

        rule.hookPoint = HookPoint.HOOK_OUTPUT;
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7900
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_7900
     * @tc.desc   Add redirect rule to redirector instance_CIDR + port range + PREROUTING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule7900';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcIp = {
          type: IPMatchType.IP_MATCH_CIDR,
          invert: false,
          value: { base: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.1.0'] }, prefixLen: 24 }
        };
        rule.srcPort = {
          type: PortMatchType.PORT_MATCH_RANGE,
          invert: false,
          value: { startPort: 1000, endPort: 2000 }
        };
        rule.hookPoint = HookPoint.HOOK_PREROUTING;
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })

    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule8000
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_8000
     * @tc.desc   Add redirect rule to redirector instance_IP range + multiple ports + OUTPUT + UID match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule8000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule8000';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcIp = {
          type: IPMatchType.IP_MATCH_RANGE,
          invert: false,
          value: { start: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.1.1'] }, end: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.1.10'] } }
        };
        rule.srcPort = {
          type: PortMatchType.PORT_MATCH_MULTI,
          invert: false,
          value: { ports: [8080, 8081] }
        };
        rule.hookPoint = HookPoint.HOOK_OUTPUT;
        rule.uidStart = 100;
        rule.uidEnd = 200;
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule8100
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_8100
     * @tc.desc   Add redirect rule to redirector instance_add multiple rules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule8100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule8100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        let rule1 = getBaseRule();
        rule1.priority = 1;
        let rule2 = getBaseRule();
        rule2.priority = 2;
        let rule3 = getBaseRule();
        rule3.priority = 3;
        const ret1: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule1);
        hilog.info(domain, tag, `${caseName} add rule1 ret: ${JSON.stringify(ret1)}`);
        const ret2: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule2);
        hilog.info(domain, tag, `${caseName} add rule2 ret: ${JSON.stringify(ret2)}`);
        const ret3: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule3);
        hilog.info(domain, tag, `${caseName} add rule3 ret: ${JSON.stringify(ret3)}`);
        ExpectTrue(ret1 === 0 && ret2 === 0 && ret3 === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule8200
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_8200
     * @tc.desc   Add redirect rule to redirector instance_IP invert match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule8200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule8200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcIp = { type: IPMatchType.IP_MATCH_SINGLE, invert: true, value: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.1.1'] } };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddRedirectRule8300
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddRedirectRule_8300
     * @tc.desc   Add redirect rule to redirector instance_port invert match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddRedirectRule8300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddRedirectRule8300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        rule.srcPort = { type: PortMatchType.PORT_MATCH_SINGLE, invert: true, value: 8080 };
        const ret: number = trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterClearRedirectRule0100
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_ClearRedirectRule_0100
     * @tc.desc   Clear redirect rules of redirector instance_valid redirector instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrNetfirewallTrafficFilterClearRedirectRule0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterClearRedirectRule0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: trafficFilterSdk.RuleConfig = getBaseRule();
        trafficFilterSdk.AddRedirectRule(info.redirector, rule);
        const ret: number = trafficFilterSdk.ClearRedirectRule(info.redirector);
        hilog.info(domain, tag, `${caseName} clear rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterClearRedirectRule0200
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_ClearRedirectRule_0200
     * @tc.desc   Clear redirect rules of redirector instance_invalid redirector instance (already destroyed)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterClearRedirectRule0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterClearRedirectRule0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: trafficFilterSdk.CreateRedirectInfo = trafficFilterSdk.CreateRedirector(100, 500);
        trafficFilterSdk.DestroyRedirector(info.redirector);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        const ret: number = trafficFilterSdk.ClearRedirectRule(info.redirector);
        hilog.info(domain, tag, `${caseName} clear rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410102);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterClearRedirectRule0300
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_ClearRedirectRule_0300
     * @tc.desc   Clear redirect rules of redirector instance_redirector is NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterClearRedirectRule0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterClearRedirectRule0300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const ret: number = trafficFilterSdk.ClearRedirectRule(null);
        hilog.info(domain, tag, `${caseName} clear rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterQueryProcess0100
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_QueryProcess_0100
     * @tc.desc   query corresponding process UID and PID_connection_info is NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrNetfirewallTrafficFilterQueryProcess0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterQueryProcess0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const result: trafficFilterSdk.ProcessInfo = trafficFilterSdk.QueryProcess(null);
        hilog.info(domain, tag, `${caseName} query process ret: ${JSON.stringify(result.ret)}`);
        ExpectTrue(result.ret === 29410101);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterQueryProcess0200
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_QueryProcess_0200
     * @tc.desc   query corresponding process UID and PID_query TCP protocol process info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterQueryProcess0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterQueryProcess0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const connectionInfo:trafficFilterSdk.ConnectionInfo = {
          srcIp: { family: IPFamily.IP_FAMILY_V4, addr: ['192.168.43.9'] },
          srcPort: 0,
          dstIp: { family: 0, addr: ['0.0.0.0'] },
          dstPort: 0,
          protocol: 6
        };
        const result: trafficFilterSdk.ProcessInfo = trafficFilterSdk.QueryProcess(connectionInfo);
        hilog.info(domain, tag, `${caseName} query process ret: ${JSON.stringify(result)}`);
        ExpectTrue(result.ret === 0);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterQueryProcess0300
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_QueryProcess_0300
     * @tc.desc   query corresponding process UID and PID_query UDP protocol process info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterQueryProcess0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterQueryProcess0300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const connectionInfo:trafficFilterSdk.ConnectionInfo = {
          srcIp: { family: IPFamily.IP_FAMILY_V6, addr: ['240e:45c:ce10:1956:a1c3:8a3d:389:d338'] },
          srcPort: 0,
          dstIp: { family: 0, addr: ['0.0.0.0'] },
          dstPort: 0,
          protocol: 17
        };
        const result: trafficFilterSdk.ProcessInfo = trafficFilterSdk.QueryProcess(connectionInfo);
        hilog.info(domain, tag, `${caseName} query process ret: ${JSON.stringify(result.ret)}`);
        ExpectTrue(result.ret === 0);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterQueryProcess0400
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_QueryProcess_0400
     * @tc.desc   query corresponding process UID and PID_query non-TCP/UDP protocol process info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterQueryProcess0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterQueryProcess0400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const connectionInfo:trafficFilterSdk.ConnectionInfo = {
          srcIp: { family: IPFamily.IP_FAMILY_V4, addr: ['127.0.0.1'] },
          srcPort: 8080,
          dstIp: { family: IPFamily.IP_FAMILY_V4, addr: ['127.0.0.1'] },
          dstPort: 8080,
          protocol: 6
        };
        const result: trafficFilterSdk.ProcessInfo = trafficFilterSdk.QueryProcess(connectionInfo);
        hilog.info(domain, tag, `${caseName} query process ret: ${JSON.stringify(result.ret)}`);
        ExpectTrue(result.ret === 29410102);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })

  })
}
