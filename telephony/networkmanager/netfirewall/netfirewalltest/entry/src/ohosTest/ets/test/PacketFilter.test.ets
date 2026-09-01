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
import packetFilterSdk from 'libpacket.so'
import hilog from '@ohos.hilog';

let domain: number = 0x0000;
let tag: string = 'PacketFilterTest';

export enum IPType {
  IP_ANY = 0,
  IP_SINGLE = 1,
  IP_CIDR = 2,
  IP_RANGE = 3,
  IP_MULTI = 4
}


export enum IPFamilyType {
  FAMILY_UNSPEC = 0,
  FAMILY_V4 = 1,
  FAMILY_V6 = 2
}

export enum PortType {
  PORT_ANY = 0,
  PORT_SINGLE = 1,
  PORT_RANGE = 2,
  PORT_MULTI = 3
}

export enum HookPointType {
  INPUT = 0,
  OUTPUT = 1,
  FORWARD = 2,
  PREROUTING = 3,
  POSTROUTING = 4
}

export enum PacketCopyMode {
  COPY_MODE_META = 0,
  COPY_MODE_HEADER = 1,
  COPY_MODE_FULL = 2,
  COPY_MODE_MAXLEN = 3
}

enum FlagMask {
  TCP_FLAG_SYN = 0x01,
  TCP_FLAG_ACK = 0x02,
  TCP_FLAG_FIN = 0x04,
  TCP_FLAG_RST = 0x08,
  TCP_FLAG_PSH = 0x10,
  TCP_FLAG_URG = 0x20,
  TCP_FLAG_ALL = 0x3F,
  TCP_FLAG_NONE = 0x00
}

enum StateMask {
  CT_STATE_ANY = 0x00,
  CT_STATE_NEW = 0x01,
  CT_STATE_ESTABLISHED = 0x02,
  CT_STATE_RELATED = 0x04,
  CT_STATE_INVALID = 0x08,
  CT_STATE_UNTRACKED = 0x10,
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

function getBaseRule(): packetFilterSdk.Rule {
  return {
    priority: 1,
    hookPoint: HookPointType.OUTPUT,
    protocol: 6,
    srcIp: { type: IPType.IP_ANY, invert: false },
    srcPort: { type: PortType.PORT_ANY, invert: false },
    dstIp: { type: IPType.IP_ANY, invert: false },
    dstPort: { type: PortType.PORT_ANY, invert: false },
    inInterface: { enabled: false, invert: false, isPrefix: false, ifName: '' },
    outInterface: { enabled: false, invert: false, isPrefix: false, ifName: '' },
    macMatch:{
      enable: false,
      invert: false,
      srcMac: ["00:00:00:00:00:00"]
    },
    tcpFlagsMatch:{
      enable: true,
      flagMask: FlagMask.TCP_FLAG_SYN,
      flagComp: 0
    },
    conntrackMatch:{
      enable: false,
      stateMask: StateMask.CT_STATE_ANY
    }
  };
}

export default function PacketFilterTest() {
  describe('PacketFilterTest', () => {

    /**
     * @tc.name   testNetworkMgrNetfirewallCreatePacketController0100
     * @tc.number SUB_NetworkMgr_netfirewall_CreatePacketController_0100
     * @tc.desc   Create packet controller instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrNetfirewallCreatePacketController0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallCreatePacketController0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create packet controller ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallCreatePacketController0200
     * @tc.number SUB_NetworkMgr_netfirewall_CreatePacketController_0200
     * @tc.desc   Create packet controller instance_duplicate group_id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallCreatePacketController0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallCreatePacketController0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} first create packet controller ret: ${JSON.stringify(info.ret)}`);
        const info2: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} second create packet controller ret: ${JSON.stringify(info2.ret)}`);
        ExpectTrue(info2.ret === 29410104);
        packetFilterSdk.destroyPacketController(info.id);
        packetFilterSdk.destroyPacketController(info2.id);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallCreatePacketController0300
     * @tc.number SUB_NetworkMgr_netfirewall_CreatePacketController_0300
     * @tc.desc   Create packet controller instance_group_id boundary value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallCreatePacketController0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallCreatePacketController0300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(1, 500, 65535, 1024);
        hilog.info(domain, tag, `${caseName} create packet controller ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 0 && info !== null);
        packetFilterSdk.destroyPacketController(info.id);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallCreatePacketController0400
     * @tc.number SUB_NetworkMgr_netfirewall_CreatePacketController_0400
     * @tc.desc   Create packet controller instance_group_id boundary value 65535
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallCreatePacketController0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallCreatePacketController0400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(65535, 500);
        hilog.info(domain, tag, `${caseName} create packet controller ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 0 && info !== null);
        packetFilterSdk.destroyPacketController(info.id);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallCreatePacketController0500
     * @tc.number SUB_NetworkMgr_netfirewall_CreatePacketController_0500
     * @tc.desc   Create packet controller instance_group_id exceeds max value 65536
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallCreatePacketController0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallCreatePacketController0500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(65536, 500);
        hilog.info(domain, tag, `${caseName} create packet controller ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 29410101);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallCreatePacketController0600
     * @tc.number SUB_NetworkMgr_netfirewall_CreatePacketController_0600
     * @tc.desc   Create packet controller instance_group_id less than minimum 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallCreatePacketController0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallCreatePacketController0600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(0, 500);
        hilog.info(domain, tag, `${caseName} create packet controller ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 29410101);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallCreatePacketController0700
     * @tc.number SUB_NetworkMgr_netfirewall_CreatePacketController_0700
     * @tc.desc   Create packet controller instance_priority boundary value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallCreatePacketController0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallCreatePacketController0700';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 1);
        hilog.info(domain, tag, `${caseName} create packet controller ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 0 && info !== null);
        packetFilterSdk.destroyPacketController(info.id);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallCreatePacketController0800
     * @tc.number SUB_NetworkMgr_netfirewall_CreatePacketController_0800
     * @tc.desc   Create packet controller instance_priority boundary value 10000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallCreatePacketController0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallCreatePacketController0800';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 10000);
        hilog.info(domain, tag, `${caseName} create packet controller ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 0 && info !== null);
        packetFilterSdk.destroyPacketController(info.id);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallCreatePacketController0900
     * @tc.number SUB_NetworkMgr_netfirewall_CreatePacketController_0900
     * @tc.desc   Create packet controller instance_priority exceeds max value 10001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallCreatePacketController0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallCreatePacketController0900';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 10001);
        hilog.info(domain, tag, `${caseName} create packet controller ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 29410101);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallCreatePacketController1000
     * @tc.number SUB_NetworkMgr_netfirewall_CreatePacketController_1000
     * @tc.desc   Create packet controller instance_priority less than minimum 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallCreatePacketController1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallCreatePacketController1000';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 0);
        hilog.info(domain, tag, `${caseName} create packet controller ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 29410101);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallCreatePacketController1100
     * @tc.number SUB_NetworkMgr_netfirewall_CreatePacketController_1100
     * @tc.desc   Create packet controller instance_create multiple instances with different group_id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallCreatePacketController1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallCreatePacketController1100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info1: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} first create packet controller ret: ${JSON.stringify(info1.ret)}`);
        const info2: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(101, 500);
        hilog.info(domain, tag, `${caseName} second create packet controller ret: ${JSON.stringify(info2.ret)}`);
        ExpectTrue(info1.ret === 0 && info1 !== null && info2.ret === 0 && info2 !== null);
        packetFilterSdk.destroyPacketController(info2.id);
        packetFilterSdk.destroyPacketController(info1.id);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallCreatePacketController1200
     * @tc.number SUB_NetworkMgr_netfirewall_CreatePacketController_1200
     * @tc.desc   Create packet controller instance_packetCopyLen valid value 1024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallCreatePacketController1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallCreatePacketController1200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500, 1024);
        hilog.info(domain, tag, `${caseName} create packet controller ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 0 && info !== null);
        packetFilterSdk.destroyPacketController(info.id);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallCreatePacketController1300
     * @tc.number SUB_NetworkMgr_netfirewall_CreatePacketController_1300
     * @tc.desc   Create packet controller instance_packetCopyLen invalid value 65536
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallCreatePacketController1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallCreatePacketController1300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500, 65536);
        hilog.info(domain, tag, `${caseName} create packet controller ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 29410101);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallCreatePacketController1400
     * @tc.number SUB_NetworkMgr_netfirewall_CreatePacketController_1400
     * @tc.desc   Create packet controller instance_nfqueueMaxlen valid value 2048
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallCreatePacketController1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallCreatePacketController1400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500, 1024, 2048);
        hilog.info(domain, tag, `${caseName} create packet controller ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 0 && info !== null);
        packetFilterSdk.destroyPacketController(info.id);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallCreatePacketController1500
     * @tc.number SUB_NetworkMgr_netfirewall_CreatePacketController_1500
     * @tc.desc   Create packet controller instance_nfqueueMaxlen valid value 65535
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallCreatePacketController1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallCreatePacketController1500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500, 1024, 65535);
        hilog.info(domain, tag, `${caseName} create packet controller ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })

    /**
     * @tc.name   testNetworkMgrNetfirewallCreatePacketController1800
     * @tc.number SUB_NetworkMgr_netfirewall_CreatePacketController_1800
     * @tc.desc   Create packet controller instance_packetCopyMode valid value COPY_MODE_META
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallCreatePacketController1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallCreatePacketController1800';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500, 1024, 1024, 0, PacketCopyMode.COPY_MODE_META);
        hilog.info(domain, tag, `${caseName} create packet controller ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 0 && info !== null);
        packetFilterSdk.destroyPacketController(info.id);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })

    /**
     * @tc.name   testNetworkMgrNetfirewallCreatePacketController1900
     * @tc.number SUB_NetworkMgr_netfirewall_CreatePacketController_1900
     * @tc.desc   Create packet controller instance_packetCopyMode valid value COPY_MODE_HEADER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallCreatePacketController1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallCreatePacketController1900';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500, 1024, 1024, 0, PacketCopyMode.COPY_MODE_HEADER);
        hilog.info(domain, tag, `${caseName} create packet controller ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 0 && info !== null);
        packetFilterSdk.destroyPacketController(info.id);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallCreatePacketController2000
     * @tc.number SUB_NetworkMgr_netfirewall_CreatePacketController_2000
     * @tc.desc   Create packet controller instance_packetCopyMode valid value COPY_MODE_FULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallCreatePacketController2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallCreatePacketController2000';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500, 1024, 1024, 0, PacketCopyMode.COPY_MODE_FULL);
        hilog.info(domain, tag, `${caseName} create packet controller ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 0 && info !== null);
        packetFilterSdk.destroyPacketController(info.id);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })

    /**
     * @tc.name   testNetworkMgrNetfirewallCreatePacketController2100
     * @tc.number SUB_NetworkMgr_netfirewall_CreatePacketController_2100
     * @tc.desc   Create packet controller instance_packetCopyMode valid value COPY_MODE_MAXLEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallCreatePacketController2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallCreatePacketController2100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500, 1024, 1024, 0, PacketCopyMode.COPY_MODE_MAXLEN);
        hilog.info(domain, tag, `${caseName} create packet controller ret: ${JSON.stringify(info.ret)}`);
        ExpectTrue(info.ret === 0 && info !== null);
        packetFilterSdk.destroyPacketController(info.id);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallDestroyPacketController0100
     * @tc.number SUB_NetworkMgr_netfirewall_DestroyPacketController_0100
     * @tc.desc   Destroy packet controller instance_valid redirector instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrNetfirewallDestroyPacketController0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallDestroyPacketController0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create packet controller ret: ${JSON.stringify(info.ret)}`);
        const ret: number = packetFilterSdk.destroyPacketController(info.id);
        hilog.info(domain, tag, `${caseName} destroy packet controller ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallDestroyPacketController0200
     * @tc.number SUB_NetworkMgr_netfirewall_DestroyPacketController_0200
     * @tc.desc   Destroy packet controller instance_invalid redirector instance (already destroyed)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallDestroyPacketController0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallDestroyPacketController0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const ret = packetFilterSdk.destroyPacketController(101);
        ExpectTrue(ret === 29410101);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })



    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule0100
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_0100
     * @tc.desc   Add packet rule to redirector instance_valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} creat packet ret: ${JSON.stringify(info.id)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        hilog.info(domain, tag, `${caseName} add packet rule data: ${JSON.stringify(rule)}`);
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add packet rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule0200
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_0200
     * @tc.desc   Add packet rule to redirector instance_redirector is NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        let rule: packetFilterSdk.Rule = getBaseRule();
        const ret: number = packetFilterSdk.addPacketRule(null, rule);
        hilog.info(domain, tag, `${caseName} add packet rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule0400
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_0400
     * @tc.desc   Add packet rule to redirector instance_set priority boundary value 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule0400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.priority = 1;
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule0500
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_0500
     * @tc.desc   Add packet rule to redirector instance_set priority boundary value 10000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule0500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.priority = 10000;
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule0600
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_0600
     * @tc.desc   Add packet rule to redirector instance_set priority less than minimum 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule0600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.priority = 0;
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule0700
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_0700
     * @tc.desc   Add packet rule to redirector instance_set priority greater than max value 10001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule0700';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.priority = 10001;
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule0800
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_0800
     * @tc.desc   Add packet rule to redirector instance_set Hook Point value to INPUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule0800';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.hookPoint = HookPointType.INPUT;
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule0900
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_0900
     * @tc.desc   Add packet rule to redirector instance_set Hook Point value to OUTPUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule0900';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule1000
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_1000
     * @tc.desc   Add packet rule to redirector instance_set Hook Point value to FORWARD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule1000';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.hookPoint = HookPointType.FORWARD;
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule1100
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_1100
     * @tc.desc   Add packet rule to redirector instance_set Hook Point value to PREOUTING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule1100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.hookPoint = HookPointType.PREROUTING;
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule1200
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_1200
     * @tc.desc   Add packet rule to redirector instance_set Hook Point value to POSTROUTING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule1200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.hookPoint = HookPointType.POSTROUTING;
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule1300
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_1300
     * @tc.desc   Add packet rule to redirector instance_source address single IP, valid IP address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule1300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcIp = { type: IPType.IP_SINGLE, invert: false, value: {family:IPFamilyType.FAMILY_V4,addr:['192.168.1.0']} };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule1400
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_1400
     * @tc.desc   Add packet rule to redirector instance_source address CIDR type, valid IP address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule1400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcIp = { type: IPType.IP_CIDR, invert: false, value: { base: { family: IPFamilyType.FAMILY_V4, addr: ['192.168.1.0'] }, prefixLen: 30 } };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule1500
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_1500
     * @tc.desc   Add packet rule to redirector instance_source address CIDR type, IPv4 prefixLen value 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule1500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcIp = { type: IPType.IP_CIDR, invert: false, value: { base: { family: IPFamilyType.FAMILY_V4, addr: ['192.168.1.0'] }, prefixLen: 30 } };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })

    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule1600
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_1600
     * @tc.desc   Add packet rule to redirector instance_source address CIDR type, IPv4 prefixLen exceeds max 33
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule1600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcIp = { type: IPType.IP_CIDR, invert: false, value: { base: { family: IPFamilyType.FAMILY_V4, addr: ['192.168.1.0'] }, prefixLen: 33 } };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule1700
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_1700
     * @tc.desc   Add packet rule to redirector instance_source address CIDR type, IPv6 prefixLen value 64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule1700';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcIp = { type: IPType.IP_CIDR, invert: false, value: { base: { family: IPFamilyType.FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e7'] }, prefixLen: 64  } };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule1800
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_1800
     * @tc.desc   Add packet rule to redirector instance_source address CIDR type, IPv6 prefixLen exceeds max 129
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule1800';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcIp = { type: IPType.IP_CIDR, invert: false, value: { base: { family: IPFamilyType.FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e7'] }, prefixLen: 129 } };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule1900
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_1900
     * @tc.desc   Add packet rule to redirector instance_source address RANGE type, normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule1900';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcIp = {
          type: IPType.IP_RANGE,
          invert: false,
          value:  { start: { family: IPFamilyType.FAMILY_V4, addr: ['192.168.1.1'] }, end: { family: IPFamilyType.FAMILY_V4, addr: ['192.168.1.10'] } }
        };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule2000
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_2000
     * @tc.desc   Add packet rule to redirector instance_source address RANGE type, startIp and endIp family inconsistent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule2000';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcIp = {
          type: IPType.IP_RANGE,
          invert: false,
          value: { start: { family: IPFamilyType.FAMILY_V4, addr: ['192.168.1.1'] }, end: { family: IPFamilyType.FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e8'] } }
        };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule2100
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_2100
     * @tc.desc   Add packet rule to redirector instance_source address MULTI type, set single address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule2100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcIp = { type: IPType.IP_MULTI, invert: false, value: { ips: [{ family: IPFamilyType.FAMILY_V4, addr: ['192.168.1.1'] }] } };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule2200
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_2200
     * @tc.desc   Add packet rule to redirector instance_source address MULTI type, set multiple addresses
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule2200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcIp = {
          type: IPType.IP_MULTI,
          invert: false,
          value: { ips: [
            {family: IPFamilyType.FAMILY_V4,addr:['192.168.1.1']},
            {family: IPFamilyType.FAMILY_V4,addr:['192.168.1.2']},
            {family: IPFamilyType.FAMILY_V4,addr:['192.168.1.3']},
            {family: IPFamilyType.FAMILY_V4,addr:['192.168.1.4']},
            {family: IPFamilyType.FAMILY_V4,addr:['192.168.1.5']},
            {family: IPFamilyType.FAMILY_V4,addr:['192.168.1.6']},
            {family: IPFamilyType.FAMILY_V4,addr:['192.168.1.7']},
            {family: IPFamilyType.FAMILY_V4,addr:['192.168.1.8']},
            {family: IPFamilyType.FAMILY_V4,addr:['192.168.1.9']}
          ] }
        };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule2400
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_2400
     * @tc.desc   Add packet rule to redirector instance_source address type is ANY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule2400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcIp = { type: IPType.IP_ANY, invert: false };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule2500
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_2500
     * @tc.desc   Add packet rule to redirector instance_source address type is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule2500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcIp = { type: 100, invert: false };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule2600
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_2600
     * @tc.desc   Add packet rule to redirector instance_source port SINGLE type, valid port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule2600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcPort = { type: PortType.PORT_SINGLE, invert: false, value: 8080 };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule2700
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_2700
     * @tc.desc   Add packet rule to redirector instance_source port RANGE type, set port range startPort < endPort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule2700';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcPort = {
          type: PortType.PORT_RANGE,
          invert: false,
          value: { startPort: 1000, endPort: 2000 }
        };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule2900
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_2900
     * @tc.desc   Add packet rule to redirector instance_source port MULTI type, set single port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule2900';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcPort = { type: PortType.PORT_MULTI, invert: false, value: { ports: [8080] } };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule3000
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_3000
     * @tc.desc   Add packet rule to redirector instance_source port MULTI type, set multiple ports
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule3000';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcPort = { type: PortType.PORT_MULTI, invert: false, value: { ports: [8080,8081,8082,8083,8084] } };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule3200
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_3200
     * @tc.desc   Add packet rule to redirector instance_source port type is ANY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule3200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcPort = { type: PortType.PORT_ANY, invert: false };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule3300
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_3300
     * @tc.desc   Add packet rule to redirector instance_destination address single IP, valid IP address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule3300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.dstIp = { type: IPType.IP_SINGLE, invert: false, value: {family: IPFamilyType.FAMILY_V4, addr: ['192.168.2.1']} };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule3500
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_3500
     * @tc.desc   Add packet rule to redirector instance_destination address CIDR type, valid IP address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule3500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.dstIp = { type: IPType.IP_CIDR, invert: false, value: {base: { family: IPFamilyType.FAMILY_V4, addr: ['192.168.2.0'] }, prefixLen: 30 } };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule3600
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_3600
     * @tc.desc   Add packet rule to redirector instance_destination address CIDR type, IPv4 prefixLen value 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule3600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.dstIp = { type: IPType.IP_CIDR, invert: false, value: { base: { family: IPFamilyType.FAMILY_V4, addr: ['192.168.2.0'] }, prefixLen: 30 } };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule3700
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_3700
     * @tc.desc   Add packet rule to redirector instance_destination address CIDR type, IPv4 prefixLen exceeds max 33
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule3700';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.dstIp = { type: IPType.IP_CIDR, invert: false, value: {base: { family: IPFamilyType.FAMILY_V4, addr: ['192.168.2.0'] }, prefixLen: 33 } };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule3800
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_3800
     * @tc.desc   Add packet rule to redirector instance_destination address CIDR type, IPv6 prefixLen value 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule3800';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.dstIp = { type: IPType.IP_CIDR, invert: false, value: {base: { family: IPFamilyType.FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e8'] }, prefixLen: 100 } };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule3900
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_3900
     * @tc.desc   Add packet rule to redirector instance_destination address CIDR type, IPv6 prefixLen exceeds max 129
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule3900';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.dstIp = { type: IPType.IP_CIDR, invert: false, value: {base: { family: IPFamilyType.FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e8'] }, prefixLen: 129 } };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule4000
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_4000
     * @tc.desc   Add packet rule to redirector instance_destination address RANGE type, normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule4000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule4000';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.dstIp = {
          type: IPType.IP_RANGE,
          invert: false,
          value: { start: { family: IPFamilyType.FAMILY_V4, addr: ['192.168.2.1'] }, end: { family: IPFamilyType.FAMILY_V4, addr: ['192.168.2.10'] } }
        };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule4100
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_4100
     * @tc.desc   Add packet rule to redirector instance_destination address RANGE type, startIp and endIp family inconsistent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule4100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule4100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.dstIp = {
          type: IPType.IP_RANGE,
          invert: false,
          value: { start: { family: IPFamilyType.FAMILY_V4, addr: ['192.168.2.1'] }, end: { family: IPFamilyType.FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e8'] } }
        };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule4200
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_4200
     * @tc.desc   Add packet rule to redirector instance_destination address MULTI type, set single address
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule4200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.dstIp = { type: IPType.IP_MULTI, invert: false, value: { ips: [{ family: IPFamilyType.FAMILY_V4, addr: ['192.168.2.1']}] } };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule4300
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_4300
     * @tc.desc   Add packet rule to redirector instance_destination address MULTI type, set multiple addresses
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule4300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.dstIp = {
          type: IPType.IP_MULTI, invert: false,
          value: { ips: [
            {family:IPFamilyType.FAMILY_V4,addr:['192.168.1.1']},
            {family:IPFamilyType.FAMILY_V4,addr:['192.168.1.2']},
            {family:IPFamilyType.FAMILY_V4,addr:['192.168.1.3']},
            {family:IPFamilyType.FAMILY_V4,addr:['192.168.1.4']},
            {family:IPFamilyType.FAMILY_V4,addr:['192.168.1.5']},
          ]},
        };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule4500
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_4500
     * @tc.desc   Add packet rule to redirector instance_destination address type is ANY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule4500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.dstIp = { type: IPType.IP_ANY, invert: false };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule4600
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_4600
     * @tc.desc   Add packet rule to redirector instance_destination address type is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule4600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.dstIp = { type: 100, invert: false };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule4700
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_4700
     * @tc.desc   Add packet rule to redirector instance_destination port SINGLE type, valid port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule4700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule4700';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.dstPort = { type: PortType.PORT_SINGLE, invert: false, value: 9090 };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule4800
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_4800
     * @tc.desc   Add packet rule to redirector instance_destination port RANGE type, set port range startPort < endPort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule4800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule4800';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.dstPort = {
          type: PortType.PORT_RANGE,
          invert: false,
          value: { startPort: 1000, endPort: 2000 }
        };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule5000
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_5000
     * @tc.desc   Add packet rule to redirector instance_destination port MULTI type, set single port
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule5000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule5000';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.dstPort = { type: PortType.PORT_MULTI, invert: false, value: { ports: [9090] } };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule5100
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_5100
     * @tc.desc   Add packet rule to redirector instance_destination port MULTI type, set multiple ports
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule5100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule5100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.dstPort = { type: PortType.PORT_MULTI, invert: false, value: { ports: [8080,8081,8082,8083,8084,8085,8086] } };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule5300
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_5300
     * @tc.desc   Add packet rule to redirector instance_destination port type is ANY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule5300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule5300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.dstPort = { type: PortType.PORT_ANY, invert: false };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule5400
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_5400
     * @tc.desc   Add packet rule to redirector instance_srcIp and dstIp family is IPV4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule5400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule5400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcIp = { type: IPType.IP_SINGLE, invert: false, value: { family: IPFamilyType.FAMILY_V4, addr: ['192.168.1.1'] } };
        rule.dstIp = { type: IPType.IP_SINGLE, invert: false, value: { family: IPFamilyType.FAMILY_V4, addr: ['192.168.2.1'] } };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule5500
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_5500
     * @tc.desc   Add packet rule to redirector instance_srcIp and dstIp family is IPV6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule5500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule5500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcIp = { type: IPType.IP_SINGLE, invert: false, value: { family: IPFamilyType.FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e7'] } };
        rule.dstIp = { type: IPType.IP_SINGLE, invert: false, value: { family: IPFamilyType.FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e8'] } };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule5700
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_5700
     * @tc.desc   Add packet rule to redirector instance_inInterface enabled, set interfaceName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule5700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule5700';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.inInterface = { enabled: true, ifName: 'eho', invert: false, isPrefix: false };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule5800
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_5800
     * @tc.desc   Add packet rule to redirector instance_inInterface enabled, set interfaceName empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule5800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule5800';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.inInterface = { enabled: true, ifName: '', invert: false, isPrefix: false };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule5900
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_5900
     * @tc.desc   Add packet rule to redirector instance_set uidStart and uidEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule5900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule5900';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.uidStart = 100;
        rule.uidEnd = 200;
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule6000
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_6000
     * @tc.desc   Add packet rule to redirector instance_set uidStart > uidEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule6000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule6000';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.uidStart = 200;
        rule.uidEnd = 100;
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule6300
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_6300
     * @tc.desc   Add packet rule to redirector instance_protocol is not TCP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule6300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule6300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.protocol = 1;
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule6400
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_6400
     * @tc.desc   Add packet rule to redirector instance_single IP + single port + IPv4 + INPUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule6400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule6400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcIp = { type: IPType.IP_SINGLE, invert: false, value: { family: IPFamilyType.FAMILY_V4, addr: ['192.168.1.1'] } };
        rule.srcPort = { type: PortType.PORT_SINGLE, invert: false, value: 8080 };
        rule.hookPoint = HookPointType.INPUT;
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule6500
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_6500
     * @tc.desc   Add packet rule to redirector instance_multiple source IPs + multiple source ports + IPv6 + OUTPUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule6500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule6500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcIp = {
          type: IPType.IP_MULTI,
          invert: false,
          value: { ips: [{ family: IPFamilyType.FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e7'] }, { family: IPFamilyType.FAMILY_V6, addr: ['fe80::22b1:da93:1050:36e8'] }] }
        };
        rule.srcPort = {
          type: PortType.PORT_MULTI,
          invert: false,
          value: { ports: [8080, 8081] }
        };
        rule.hookPoint = HookPointType.OUTPUT;
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule6600
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_6600
     * @tc.desc   Add packet rule to redirector instance_CIDR + port range + INPUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule6600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule6600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcIp = {
          type: IPType.IP_CIDR,
          invert: false,
          value: { base: { family: IPFamilyType.FAMILY_V4, addr: ['192.168.1.0'] }, prefixLen: 24 }
        };
        rule.srcPort = {
          type: PortType.PORT_RANGE,
          invert: false,
          value: { startPort: 1000, endPort: 2000 }
        };
        rule.hookPoint = HookPointType.INPUT;
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })

    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule6700
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_6700
     * @tc.desc   Add packet rule to redirector instance_IP range + multiple ports + OUTPUT + UID match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule6700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule6700';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcIp = {
          type: IPType.IP_RANGE,
          invert: false,
          value: { start: { family: IPFamilyType.FAMILY_V4, addr: ['192.168.1.1'] }, end: { family: IPFamilyType.FAMILY_V4, addr: ['192.168.1.10'] } }
        };
        rule.srcPort = {
          type: PortType.PORT_MULTI,
          invert: false,
          value: { ports: [8080, 8081] }
        };
        rule.hookPoint = HookPointType.OUTPUT;
        rule.uidStart = 100;
        rule.uidEnd = 200;
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule6800
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_6800
     * @tc.desc   Add packet rule to redirector instance_add multiple rules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule6800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule6800';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        let rule1 = getBaseRule();
        rule1.priority = 1;
        let rule2 = getBaseRule();
        rule2.priority = 2;
        let rule3 = getBaseRule();
        rule3.priority = 3;
        const ret1: number = packetFilterSdk.addPacketRule(info.id, rule1);
        hilog.info(domain, tag, `${caseName} add rule1 ret: ${JSON.stringify(ret1)}`);
        const ret2: number = packetFilterSdk.addPacketRule(info.id, rule2);
        hilog.info(domain, tag, `${caseName} add rule2 ret: ${JSON.stringify(ret2)}`);
        const ret3: number = packetFilterSdk.addPacketRule(info.id, rule3);
        hilog.info(domain, tag, `${caseName} add rule3 ret: ${JSON.stringify(ret3)}`);
        ExpectTrue(ret1 === 0 && ret2 === 0 && ret3 === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule6900
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_6900
     * @tc.desc   Add packet rule to redirector instance_IP invert match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule6900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule6900';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcIp = { type: IPType.IP_SINGLE, invert: true, value: { family: IPFamilyType.FAMILY_V4, addr: ['192.168.1.1'] } };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule7000
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_7000
     * @tc.desc   Add packet rule to redirector instance_port invert match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule7000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule7000';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.srcPort = { type: PortType.PORT_SINGLE, invert: true, value: 8080 };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule7100
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_7100
     * @tc.desc   Add packet rule to redirector instance_mac match enable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule7100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule7100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.macMatch = { enable: true, invert: false, srcMac: ["00:11:22:33:44:55"] };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule7200
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_7200
     * @tc.desc   Add packet rule to redirector instance_tcp flags match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule7200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule7200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.tcpFlagsMatch = { enable: true, flagMask: FlagMask.TCP_FLAG_SYN, flagComp: 0 };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule7300
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_7300
     * @tc.desc   Add packet rule to redirector instance_conntrack match enable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule7300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule7300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.conntrackMatch = { enable: true, stateMask: StateMask.CT_STATE_NEW };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule7400
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_7400
     * @tc.desc   Add packet rule to redirector instance_mac match disable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule7400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule7400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.macMatch = { enable: false, invert: false, srcMac: ["00:11:22:33:44:55"] };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule7500
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_7500
     * @tc.desc   Add packet rule to redirector instance_mac match invert
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule7500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule7500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.macMatch = { enable: true, invert: true, srcMac: ["00:11:22:33:44:55"] };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule7600
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_7600
     * @tc.desc   Add packet rule to redirector instance_mac match multi srcMac
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule7600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule7600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.macMatch = { enable: true, invert: false, srcMac: ["00:11:22:33:44:55", "AA:BB:CC:DD:EE:FF"] };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule7700
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_7700
     * @tc.desc   Add packet rule to redirector instance_mac match empty srcMac
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule7700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule7700';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.macMatch = { enable: true, invert: false, srcMac: [] };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule7800
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_7800
     * @tc.desc   Add packet rule to redirector instance_tcp flags match disable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule7800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule7800';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.tcpFlagsMatch = { enable: false, flagMask: FlagMask.TCP_FLAG_SYN, flagComp: 0 };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule7900
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_7900
     * @tc.desc   Add packet rule to redirector instance_tcp flags match ALL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule7900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule7900';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.tcpFlagsMatch = { enable: true, flagMask: FlagMask.TCP_FLAG_ALL, flagComp: 0 };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule8000
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_8000
     * @tc.desc   Add packet rule to redirector instance_tcp flags match NONE enable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule8000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule8000';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.tcpFlagsMatch = { enable: true, flagMask: FlagMask.TCP_FLAG_NONE, flagComp: 0 };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule8100
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_8100
     * @tc.desc   Add packet rule to redirector instance_tcp flags match flagComp non-zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule8100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule8100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.tcpFlagsMatch = { enable: true, flagMask: FlagMask.TCP_FLAG_SYN, flagComp: FlagMask.TCP_FLAG_SYN };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule8200
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_8200
     * @tc.desc   Add packet rule to redirector instance_conntrack match disable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule8200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule8200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.conntrackMatch = { enable: false, stateMask: StateMask.CT_STATE_NEW };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule8300
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_8300
     * @tc.desc   Add packet rule to redirector instance_conntrack match state ESTABLISHED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule8300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule8300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.conntrackMatch = { enable: true, stateMask: StateMask.CT_STATE_ESTABLISHED };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule8400
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_8400
     * @tc.desc   Add packet rule to redirector instance_conntrack match state INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule8400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule8400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.conntrackMatch = { enable: true, stateMask: StateMask.CT_STATE_INVALID };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallTrafficFilterAddPacketRule8500
     * @tc.number SUB_NetworkMgr_netfirewall_TrafficFilter_AddPacketRule_8500
     * @tc.desc   Add packet rule to redirector instance_conntrack match state CT_STATE_NEW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallTrafficFilterAddPacketRule8500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallTrafficFilterAddPacketRule8500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        rule.conntrackMatch = { enable: true, stateMask: StateMask.CT_STATE_NEW };
        const ret: number = packetFilterSdk.addPacketRule(info.id, rule);
        hilog.info(domain, tag, `${caseName} add rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();

      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallClearPacketRule0100
     * @tc.number SUB_NetworkMgr_netfirewall_ClearPacketRule_0100
     * @tc.desc   Clear packet rules of redirector instance_valid redirector instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrNetfirewallClearPacketRule0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallClearPacketRule0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        let rule: packetFilterSdk.Rule = getBaseRule();
        packetFilterSdk.addPacketRule(info.id, rule);
        const ret: number = packetFilterSdk.clearPacketRule(info.id);
        hilog.info(domain, tag, `${caseName} clear rule ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallClearPacketRule0200
     * @tc.number SUB_NetworkMgr_netfirewall_ClearPacketRule_0200
     * @tc.desc   Clear packet rules of redirector instance_invalid redirector instance (already destroyed)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallClearPacketRule0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallClearPacketRule0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        packetFilterSdk.destroyPacketController(info.id);
        hilog.info(domain, tag, `${caseName} create ret: ${JSON.stringify(info.ret)}`);
        const ret: number = packetFilterSdk.clearPacketRule(info.id);
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
     * @tc.name   testNetworkMgrNetfirewallClearPacketRule0300
     * @tc.number SUB_NetworkMgr_netfirewall_ClearPacketRule_0300
     * @tc.desc   Clear packet rules of redirector instance_redirector is NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallClearPacketRule0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallClearPacketRule0300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const ret: number = packetFilterSdk.clearPacketRule(null);
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
     * @tc.name   testNetworkMgrNetfirewallRegisterPacketCallback0100
     * @tc.number SUB_NetworkMgr_netfirewall_RegisterPacketCallback_0100
     * @tc.desc   Register packet callback to redirector instance_valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrNetfirewallRegisterPacketCallback0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallRegisterPacketCallback0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create packet controller ret: ${JSON.stringify(info.ret)}`);
        const callback = (packet: packetFilterSdk.Packet, user_data: string): packetFilterSdk.packetCallback => {
          hilog.info(domain, tag, `${caseName} callback packet: ${JSON.stringify(packet)}, user_data: ${user_data}`);
          return packetFilterSdk.packetCallback.Accept;
        };
        const ret: number = packetFilterSdk.registerPacketCallback(info.id, 'test_data', callback);
        hilog.info(domain, tag, `${caseName} register packet callback ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        const ret2: number = packetFilterSdk.unregisterPacketCallback(info.id);
        hilog.info(domain, tag, `${caseName} unregister packet callback ret: ${JSON.stringify(ret2)}`);
        packetFilterSdk.destroyPacketController(info.id);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallRegisterPacketCallback0200
     * @tc.number SUB_NetworkMgr_netfirewall_RegisterPacketCallback_0200
     * @tc.desc   Register packet callback to redirector instance_invalid redirector instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallRegisterPacketCallback0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallRegisterPacketCallback0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const callback = (packet: packetFilterSdk.Packet, user_data: string): packetFilterSdk.packetCallback => {
          return packetFilterSdk.packetCallback.Accept;
        };
        const ret: number = packetFilterSdk.registerPacketCallback(101, 'test_data', callback);
        hilog.info(domain, tag, `${caseName} register packet callback ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallRegisterPacketCallback0300
     * @tc.number SUB_NetworkMgr_netfirewall_RegisterPacketCallback_0300
     * @tc.desc   Register packet callback to redirector instance_redirector is NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallRegisterPacketCallback0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallRegisterPacketCallback0300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const callback = (packet: packetFilterSdk.Packet, user_data: string): packetFilterSdk.packetCallback => {
          return packetFilterSdk.packetCallback.Accept;
        };
        const ret: number = packetFilterSdk.registerPacketCallback(null, 'test_data', callback);
        hilog.info(domain, tag, `${caseName} register packet callback ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallUnregisterPacketCallback0100
     * @tc.number SUB_NetworkMgr_netfirewall_UnregisterPacketCallback_0100
     * @tc.desc   Unregister packet callback from redirector instance_valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrNetfirewallUnregisterPacketCallback0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallUnregisterPacketCallback0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const info: packetFilterSdk.createPacketInfo = packetFilterSdk.createPacketController(100, 500);
        hilog.info(domain, tag, `${caseName} create packet controller ret: ${JSON.stringify(info.ret)}`);
        const callback = (packet: packetFilterSdk.Packet, user_data: string): packetFilterSdk.packetCallback => {
          return packetFilterSdk.packetCallback.Accept;
        };
        packetFilterSdk.registerPacketCallback(info.id, 'test_data', callback);
        const ret: number = packetFilterSdk.unregisterPacketCallback(info.id);
        hilog.info(domain, tag, `${caseName} unregister packet callback ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 0);
        packetFilterSdk.destroyPacketController(info.id);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallUnregisterPacketCallback0200
     * @tc.number SUB_NetworkMgr_netfirewall_UnregisterPacketCallback_0200
     * @tc.desc   Unregister packet callback from redirector instance_invalid redirector instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallUnregisterPacketCallback0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallUnregisterPacketCallback0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const ret: number = packetFilterSdk.unregisterPacketCallback(101);
        hilog.info(domain, tag, `${caseName} unregister packet callback ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


    /**
     * @tc.name   testNetworkMgrNetfirewallUnregisterPacketCallback0300
     * @tc.number SUB_NetworkMgr_netfirewall_UnregisterPacketCallback_0300
     * @tc.desc   Unregister packet callback from redirector instance_redirector is NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrNetfirewallUnregisterPacketCallback0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkMgrNetfirewallUnregisterPacketCallback0300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        const ret: number = packetFilterSdk.unregisterPacketCallback(null);
        hilog.info(domain, tag, `${caseName} unregister packet callback ret: ${JSON.stringify(ret)}`);
        ExpectTrue(ret === 29410101);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err -> ${JSON.stringify(err)}`);
        ExpectFail();
        done();
      }
    })


  })
}
