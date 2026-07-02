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
import testNetManager from 'libentry.so';
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

function getBaseRule(): testNetManager.RuleConfig {
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
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterNoPCreateRedirector0100
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_NoP_CreateRedirector_0100
     * @tc.desc   No permission_create traffic redirector instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testNetworkMgrNetfirewallTrafficFilterNoPCreateRedirector0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterNoPCreateRedirector0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: testNetManager.CreateRedirectInfo = testNetManager.CreateRedirector(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 201);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterNoPQueryProcess0100
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_NoP_QueryProcess_0100
     * @tc.desc   No permission_query corresponding process UID and PID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testNetworkMgrNetfirewallTrafficFilterNoPQueryProcess0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterNoPQueryProcess0500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const connectionInfo:testNetManager.ConnectionInfo = {
          srcIp: { family: 0, addr: ['192.168.1.1'] },
          srcPort: 8080,
          dstIp: { family: 0, addr: ['192.168.2.1'] },
          dstPort: 9090,
          protocol: 6 
        };

        const result: testNetManager.ProcessInfo = testNetManager.QueryProcess(connectionInfo);
        hilog.info(domain, tag, `${caseName} query process ret: ${JSON.stringify(result.ret)}`);
        ExpectTrue(result.ret === 201);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })

  })
}
