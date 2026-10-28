'use static'
/**
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import connection from '@ohos.net.connection';
import { describe, expect, it , TestType, Size, Level, beforeEach } from "@ohos/hypium-static/src/main/indexStatic";
import { BusinessError } from '@ohos.base';
import util from './CommonUtils.test';
import hilog from '@ohos.hilog';
let isNetLost = false;
let isNetAvailable = false;
let isNetUnavailable = false;
let isNetConnectionPropertiesChange = false;
let isNetCapabilitiesChange = false;
let netCapInfo: connection.NetCapabilityInfo | undefined = undefined;
let netPropertyInfo: connection.NetConnectionPropertyInfo | undefined = undefined;
let availableNet: connection.NetHandle | undefined = undefined;
let lostNet: connection.NetHandle | undefined = undefined;
let ListenTimes : number = 0;
const NetBearTypeBEARER_CELLULAR = connection.NetBearType.BEARER_CELLULAR;
const NetBearTypeBEARER_WIFI = connection.NetBearType.BEARER_WIFI;
const NetBearTypeBEARER_BLUETOOTH = connection.NetBearType.BEARER_BLUETOOTH;
const NetBearTypeBEARER_ETHERNET = connection.NetBearType.BEARER_ETHERNET;
const NetBearTypeBEARER_VPN = connection.NetBearType.BEARER_VPN;
const NetCapNET_CAPABILITY_MMS = connection.NetCap.NET_CAPABILITY_MMS;
const NetCapNET_CAPABILITY_NOT_METERED = connection.NetCap.NET_CAPABILITY_NOT_METERED;
const NetCapNET_CAPABILITY_INTERNET = connection.NetCap.NET_CAPABILITY_INTERNET;
const NetCapNET_CAPABILITY_NOT_VPN = connection.NetCap.NET_CAPABILITY_NOT_VPN;
const NetCapNET_NET_CAPABILITY_VALIDATED = connection.NetCap.NET_CAPABILITY_VALIDATED;
const NetCapNET_CAPABILITY_PORTAL = connection.NetCap.NET_CAPABILITY_PORTAL;
const NetCapNET_CAPABILITY_CHECKING_CONNECTIVITY = connection.NetCap.NET_CAPABILITY_CHECKING_CONNECTIVITY;

const domain: int = 0x0000;
const tag: string = 'ConnectionEnhancedTestCellular';

let netConnOnEventAll = async (caseName: string, netConn: connection.NetConnection) => {
  hilog.info(domain, tag, caseName + ": ==  Subscribing to Events start  === ")
  netConn.onNetAvailable((value: connection.NetHandle) => {
    ListenTimes += 1;
    isNetAvailable = true;
    availableNet = value;
    hilog.info(domain, tag, caseName+ " === on netAvailable " + JSON.stringify(value));
  });
  netConn.onNetConnectionPropertiesChange((value: connection.NetConnectionPropertyInfo) => {
    ListenTimes += 10;
    isNetConnectionPropertiesChange = true;
    netPropertyInfo = value;
    hilog.info(domain, tag, caseName +" ===on netConnectionPropertiesChange" + JSON.stringify(value));
  });
  netConn.onNetCapabilitiesChange((value: connection.NetCapabilityInfo) => {
    ListenTimes += 100;
    isNetCapabilitiesChange = true;
    netCapInfo = value;
    hilog.info(domain, tag, caseName + " ===on netCapabilitiesChange " + JSON.stringify(value));
  });
  netConn.onNetLost((value: connection.NetHandle) => {
    ListenTimes += 1000;
    isNetLost = true;
    lostNet = value;
    hilog.info(domain, tag, caseName +" === on netLost" + JSON.stringify(value));
  });
  netConn.onNetUnavailable(() => {
    ListenTimes += 10000;
    isNetUnavailable = true;
    hilog.info(domain, tag, caseName +" ===on netUnavailable ");
  });
  hilog.info(domain, tag, caseName + ": ==  Subscribing to Events end  === ");
}

const ExpectFail: (caseName:string) => void = (caseName:string) => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, caseName+'exportFail failed err:' +JSON.stringify(err));
  }
};
const ExpectTrue: ( caseName:string, n: boolean | undefined) => void = (caseName:string, n: boolean | undefined) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, caseName+'exportFail failed err:' +JSON.stringify(err));
  }
};


export default function ConnectionEnhancedTestCellular(): void {
  describe('Telephony_NetworkManagerEnhancedCellularTest', () => {
    beforeEach(() => {
      ListenTimes = 0;
      isNetLost = false;
      isNetAvailable = false;
      isNetUnavailable = false;
      isNetConnectionPropertiesChange = false;
      isNetCapabilitiesChange = false;
      netCapInfo = undefined;
      netPropertyInfo = undefined;
      availableNet = undefined;
    })

    /**
     * @tc.name   testNetworkManagerEnhancedTestCellular_static_0100
     * @tc.number SUB_NetworkManager_Register_Enhanced_TestCellular_0100
     * @tc.desc   check netAvailable、netConnectionPropertiesChange、netCapabilitiesChange event
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkManagerEnhancedTestCellular_static_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      let caseName = 'testNetworkManagerEnhancedTestCellular_static_0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        let netConn = connection.createNetConnection();
        hilog.info(domain, tag, caseName+ " register start");
        netConnOnEventAll(caseName, netConn);
        netConn.register((error: BusinessError | null) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } else {
            hilog.info(domain, tag, caseName + " register success");
          }
        });
        await util.sleep(500);
        hilog.info(domain, tag, `${caseName}---check isNetAvailable`);
        ExpectTrue(caseName, isNetAvailable);
        hilog.info(domain, tag, `${caseName}---check isNetLost`);
        ExpectTrue(caseName, !isNetLost);
        hilog.info(domain, tag, `${caseName}---check isNetUnavailable`);
        ExpectTrue(caseName, !isNetUnavailable);
        hilog.info(domain, tag, `${caseName}---check isNetConnectionPropertiesChange`);
        ExpectTrue(caseName, isNetConnectionPropertiesChange);
        hilog.info(domain, tag, `${caseName}---check isNetCapabilitiesChange`);
        ExpectTrue(caseName, isNetCapabilitiesChange);
        hilog.info(domain, tag, `${caseName}---check netCapInfo.netHandle`);
        ExpectTrue(caseName, netCapInfo?.netHandle?.netId === availableNet?.netId);
        hilog.info(domain, tag, `${caseName}---check NetBearTypeBEARER_CELLULAR`);
        ExpectTrue(caseName, netCapInfo?.netCap.bearerTypes.includes(NetBearTypeBEARER_CELLULAR));
        hilog.info(domain, tag, `${caseName}---check NetCapNET_CAPABILITY_INTERNET`);
        ExpectTrue(caseName, netCapInfo?.netCap.networkCap?.includes(NetCapNET_CAPABILITY_INTERNET));
        hilog.info(domain, tag, `${caseName}---check NetCapNET_CAPABILITY_NOT_VPN`);
        ExpectTrue(caseName, netCapInfo?.netCap.networkCap?.includes(NetCapNET_CAPABILITY_NOT_VPN));
        hilog.info(domain, tag, `${caseName}---check NetCapNET_NET_CAPABILITY_VALIDATED`);
        ExpectTrue(caseName, netCapInfo?.netCap.networkCap?.includes(NetCapNET_NET_CAPABILITY_VALIDATED));
        hilog.info(domain, tag, `${caseName}---check netPropertyInfo.netHandle`);
        ExpectTrue(caseName, netPropertyInfo?.netHandle?.netId === availableNet?.netId);
        hilog.info(domain, tag, `${caseName}---check linkAddresses：`+ JSON.stringify(netPropertyInfo?.connectionProperties.linkAddresses));
        netPropertyInfo?.connectionProperties.linkAddresses.forEach((addr: connection.LinkAddress) => {
          ExpectTrue(caseName, util.isValidV4NetAddress(caseName, addr.address) || util.isValidIPv6Address(caseName, addr.address, false));
        })
        hilog.info(domain, tag, `${caseName}---check dnses：` + JSON.stringify(netPropertyInfo?.connectionProperties.dnses));
        netPropertyInfo?.connectionProperties.dnses.forEach((addr: connection.NetAddress) => {
          ExpectTrue(caseName, util.isValidV4NetAddress(caseName, addr) || util.isValidIPv6Address(caseName, addr, false));
        })
        hilog.info(domain, tag, `${caseName}---check route：` + JSON.stringify(netPropertyInfo?.connectionProperties.routes));
        netPropertyInfo?.connectionProperties.routes.forEach((route: connection.RouteInfo) => {
          let res: boolean = util.isValidV4NetAddress(caseName, route.destination.address) || util.isValidIPv6Address(caseName, route.destination.address, true);
          if (!res) {
            hilog.error(domain, tag, caseName + "check route.destination address：" + JSON.stringify(route.destination.address) + " failed");
            ExpectFail(caseName);
          } else {
            ExpectTrue(caseName, res);
          }
          let res1: boolean = util.isValidV4NetAddress(caseName, route.gateway) || util.isValidIPv6Address(caseName, route.gateway, true);
          if (!res1) {
            hilog.error(domain, tag, caseName + "check route.gateway address：" + JSON.stringify(route.gateway) + " failed");
            ExpectFail(caseName);
          } else {
            ExpectTrue(caseName, res1);
          }
        })

        hilog.info(domain, tag, caseName + " unregister start");
        netConn.unregister((error: BusinessError | null) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, caseName + "unregister fail: " + JSON.stringify(error));
            ExpectFail(caseName);
          } else {
            hilog.info(domain, tag, caseName + " unregister success ");
            hilog.info(domain, tag, caseName + " ListenTimes is :" + ListenTimes);
            ExpectTrue(caseName, ListenTimes === 111);
          }
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
        ExpectFail(caseName);
        hilog.info(domain, tag, `${caseName} --test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkManagerEnhancedTestCellular_static_0200
     * @tc.number SUB_NetworkManager_Register_Enhanced_TestCellular_0200
     * @tc.desc   check netAvailable、netConnectionPropertiesChange、netCapabilitiesChange event, netSpecifier focus on BEARER_CELLULAR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkManagerEnhancedTestCellular_static_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      let caseName = 'testNetworkManagerEnhancedTestCellular_static_0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        let netConn: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
          },
        },5000);
        hilog.info(domain, tag, caseName+ " register start");
        netConnOnEventAll(caseName, netConn);
        netConn.register((error: BusinessError | null) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } else {
            hilog.info(domain, tag, caseName + " register success");
          }
        });
        await util.sleep(500);
        hilog.info(domain, tag, `${caseName}---check isNetAvailable`);
        ExpectTrue(caseName, isNetAvailable);
        hilog.info(domain, tag, `${caseName}---check isNetLost`);
        ExpectTrue(caseName, !isNetLost);
        hilog.info(domain, tag, `${caseName}---check isNetUnavailable`);
        ExpectTrue(caseName, !isNetUnavailable);
        hilog.info(domain, tag, `${caseName}---check isNetConnectionPropertiesChange`);
        ExpectTrue(caseName, isNetConnectionPropertiesChange);
        hilog.info(domain, tag, `${caseName}---check isNetCapabilitiesChange`);
        ExpectTrue(caseName, isNetCapabilitiesChange);
        hilog.info(domain, tag, `${caseName}---check netCapInfo.netHandle`);
        ExpectTrue(caseName, netCapInfo?.netHandle?.netId === availableNet?.netId);
        hilog.info(domain, tag, `${caseName}---check NetBearTypeBEARER_CELLULAR`);
        ExpectTrue(caseName, netCapInfo?.netCap.bearerTypes.includes(NetBearTypeBEARER_CELLULAR));
        hilog.info(domain, tag, `${caseName}---check NetCapNET_CAPABILITY_INTERNET`);
        ExpectTrue(caseName, netCapInfo?.netCap.networkCap?.includes(NetCapNET_CAPABILITY_INTERNET));
        hilog.info(domain, tag, `${caseName}---check NetCapNET_CAPABILITY_NOT_VPN`);
        ExpectTrue(caseName, netCapInfo?.netCap.networkCap?.includes(NetCapNET_CAPABILITY_NOT_VPN));
        hilog.info(domain, tag, `${caseName}---check NetCapNET_NET_CAPABILITY_VALIDATED`);
        ExpectTrue(caseName, netCapInfo?.netCap.networkCap?.includes(NetCapNET_NET_CAPABILITY_VALIDATED));
        hilog.info(domain, tag, `${caseName}---check netPropertyInfo.netHandle`);
        ExpectTrue(caseName, netPropertyInfo?.netHandle?.netId === availableNet?.netId);
        hilog.info(domain, tag, `${caseName}---check linkAddresses：`+ JSON.stringify(netPropertyInfo?.connectionProperties.linkAddresses));
        netPropertyInfo?.connectionProperties.linkAddresses.forEach((addr: connection.LinkAddress) => {
          ExpectTrue(caseName, util.isValidV4NetAddress(caseName, addr.address) || util.isValidIPv6Address(caseName, addr.address, false));
        })
        hilog.info(domain, tag, `${caseName}---check dnses：` + JSON.stringify(netPropertyInfo?.connectionProperties.dnses));
        netPropertyInfo?.connectionProperties.dnses.forEach((addr: connection.NetAddress) => {
          ExpectTrue(caseName, util.isValidV4NetAddress(caseName, addr) || util.isValidIPv6Address(caseName, addr, false));
        })
        hilog.info(domain, tag, `${caseName}---check route：` + JSON.stringify(netPropertyInfo?.connectionProperties.routes));
        netPropertyInfo?.connectionProperties.routes.forEach((route: connection.RouteInfo) => {
          let res: boolean = util.isValidV4NetAddress(caseName, route.destination.address) || util.isValidIPv6Address(caseName, route.destination.address, true);
          if (!res) {
            hilog.info(domain, tag, caseName + "check route.destination address：" + JSON.stringify(route.destination.address) + " failed");
            ExpectFail(caseName);
          } else {
            ExpectTrue(caseName, res);
          }
          let res1: boolean = util.isValidV4NetAddress(caseName, route.gateway) || util.isValidIPv6Address(caseName, route.gateway, true);
          if (!res1) {
            hilog.error(domain, tag, caseName + "check route.gateway address：" + JSON.stringify(route.gateway) + " failed");
            ExpectFail(caseName);
          } else {
            ExpectTrue(caseName, res1);
          }
        })

        hilog.info(domain, tag, caseName + " unregister start");
        netConn.unregister((error: BusinessError | null) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, caseName + "unregister fail: " + JSON.stringify(error));
            ExpectFail(caseName);
          } else {
            hilog.info(domain, tag, caseName + " unregister success ");
            hilog.info(domain, tag, caseName + " ListenTimes is :" + ListenTimes);
            ExpectTrue(caseName, ListenTimes === 111);
          }
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
        ExpectFail(caseName);
        hilog.info(domain, tag, `${caseName} --test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkManagerEnhancedTestCellular_static_0300
     * @tc.number SUB_NetworkManager_Register_Enhanced_TestCellular_0300
     * @tc.desc   check netAvailable、netConnectionPropertiesChange、netCapabilitiesChange event, register twice, netSpecifier focus on BEARER_CELLULAR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkManagerEnhancedTestCellular_static_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      let caseName = 'testNetworkManagerEnhancedTestCellular_static_0300';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        let netConn: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
          },
        },5000);
        hilog.info(domain, tag, caseName+ " register start");
        netConnOnEventAll(caseName, netConn);
        netConn.register((error: BusinessError | null) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } else {
            hilog.info(domain, tag, caseName + " register success");
          }
        });
        // register twice
        let netConn2: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_CELLULAR]
          },
        },5000);
        hilog.info(domain, tag, caseName+ " register start");
        netConnOnEventAll(caseName, netConn2);
        netConn2.register((error: BusinessError | null) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } else {
            hilog.info(domain, tag, caseName + " register success");
          }
        });
        await util.sleep(500);
        hilog.info(domain, tag, `${caseName}---check isNetAvailable`);
        ExpectTrue(caseName, isNetAvailable);
        hilog.info(domain, tag, `${caseName}---check isNetLost`);
        ExpectTrue(caseName, !isNetLost);
        hilog.info(domain, tag, `${caseName}---check isNetUnavailable`);
        ExpectTrue(caseName, !isNetUnavailable);
        hilog.info(domain, tag, `${caseName}---check isNetConnectionPropertiesChange`);
        ExpectTrue(caseName, isNetConnectionPropertiesChange);
        hilog.info(domain, tag, `${caseName}---check isNetCapabilitiesChange`);
        ExpectTrue(caseName, isNetCapabilitiesChange);
        hilog.info(domain, tag, `${caseName}---check netCapInfo.netHandle`);
        ExpectTrue(caseName, netCapInfo?.netHandle?.netId === availableNet?.netId);
        hilog.info(domain, tag, `${caseName}---check NetBearTypeBEARER_CELLULAR`);
        ExpectTrue(caseName, netCapInfo?.netCap.bearerTypes.includes(NetBearTypeBEARER_CELLULAR));
        hilog.info(domain, tag, `${caseName}---check NetCapNET_CAPABILITY_INTERNET`);
        ExpectTrue(caseName, netCapInfo?.netCap.networkCap?.includes(NetCapNET_CAPABILITY_INTERNET));
        hilog.info(domain, tag, `${caseName}---check NetCapNET_CAPABILITY_NOT_VPN`);
        ExpectTrue(caseName, netCapInfo?.netCap.networkCap?.includes(NetCapNET_CAPABILITY_NOT_VPN));
        hilog.info(domain, tag, `${caseName}---check NetCapNET_NET_CAPABILITY_VALIDATED`);
        ExpectTrue(caseName, netCapInfo?.netCap.networkCap?.includes(NetCapNET_NET_CAPABILITY_VALIDATED));
        hilog.info(domain, tag, `${caseName}---check netPropertyInfo.netHandle`);
        ExpectTrue(caseName, netPropertyInfo?.netHandle?.netId === availableNet?.netId);
        hilog.info(domain, tag, `${caseName}---check linkAddresses：`+ JSON.stringify(netPropertyInfo?.connectionProperties.linkAddresses));
        netPropertyInfo?.connectionProperties.linkAddresses.forEach((addr: connection.LinkAddress) => {
          ExpectTrue(caseName, util.isValidV4NetAddress(caseName, addr.address) || util.isValidIPv6Address(caseName, addr.address, false));
        })
        hilog.info(domain, tag, `${caseName}---check dnses：` + JSON.stringify(netPropertyInfo?.connectionProperties.dnses));
        netPropertyInfo?.connectionProperties.dnses.forEach((addr: connection.NetAddress) => {
          ExpectTrue(caseName, util.isValidV4NetAddress(caseName, addr) || util.isValidIPv6Address(caseName, addr, false));
        })
        hilog.info(domain, tag, `${caseName}---check route：` + JSON.stringify(netPropertyInfo?.connectionProperties.routes));
        netPropertyInfo?.connectionProperties.routes.forEach((route: connection.RouteInfo) => {
          let res: boolean = util.isValidV4NetAddress(caseName, route.destination.address) || util.isValidIPv6Address(caseName, route.destination.address, true);
          if (!res) {
            hilog.info(domain, tag, caseName + "check route.destination address：" + JSON.stringify(route.destination.address) + " failed");
            ExpectFail(caseName);
          } else {
            ExpectTrue(caseName, res);
          }
          let res1: boolean = util.isValidV4NetAddress(caseName, route.gateway) || util.isValidIPv6Address(caseName, route.gateway, true);
          if (!res1) {
            hilog.error(domain, tag, caseName + "check route.gateway address：" + JSON.stringify(route.gateway) + " failed");
            ExpectFail(caseName);
          } else {
            ExpectTrue(caseName, res1);
          }
        })

        hilog.info(domain, tag, caseName + " unregister start");
        netConn.unregister((error: BusinessError | null) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, caseName + "unregister fail: " + JSON.stringify(error));
            ExpectFail(caseName);
          } else {
            hilog.info(domain, tag, caseName + " unregister success ");
            hilog.info(domain, tag, caseName + " ListenTimes is :" + ListenTimes);
            ExpectTrue(caseName, ListenTimes === 222);
          }
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
        ExpectFail(caseName);
        hilog.info(domain, tag, `${caseName} --test end`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkManagerEnhancedTestCellular_static_0400
     * @tc.number SUB_NetworkManager_Register_Enhanced_TestCellular_0400
     * @tc.desc   check netAvailable、netConnectionPropertiesChange、netCapabilitiesChange event, netSpecifier focus on BEARER_CELLULAR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkManagerEnhancedTestCellular_static_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done:() => void): Promise<void> => {
      let caseName = 'testNetworkManagerEnhancedTestCellular_static_0400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        let netConn: connection.NetConnection = connection.createNetConnection({
          netCapabilities: {
            bearerTypes: [connection.NetBearType.BEARER_WIFI]
          },
        }, 500);
        hilog.info(domain, tag, caseName+ " register start");
        netConnOnEventAll(caseName, netConn);
        netConn.register((error: BusinessError | null) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, caseName + " register fail: " + JSON.stringify(error));
            ExpectFail(caseName);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } else {
            hilog.info(domain, tag, caseName + " register success");
          }
        });
        await util.sleep(800);
        hilog.info(domain, tag, `${caseName}---check isNetAvailable`);
        ExpectTrue(caseName, !isNetAvailable);
        hilog.info(domain, tag, `${caseName}---check isNetLost`);
        ExpectTrue(caseName, !isNetLost);
        hilog.info(domain, tag, `${caseName}---check isNetUnavailable`);
        ExpectTrue(caseName, isNetUnavailable);
        hilog.info(domain, tag, `${caseName}---check isNetConnectionPropertiesChange`);
        ExpectTrue(caseName, !isNetConnectionPropertiesChange);
        hilog.info(domain, tag, `${caseName}---check isNetCapabilitiesChange`);
        ExpectTrue(caseName, !isNetCapabilitiesChange);

        hilog.info(domain, tag, caseName + " unregister start");
        netConn.unregister((error: BusinessError | null) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, caseName + "unregister fail: " + JSON.stringify(error));
            ExpectFail(caseName);
          } else {
            hilog.info(domain, tag, caseName + " unregister success ");
            hilog.info(domain, tag, caseName + " ListenTimes is :" + ListenTimes);
            ExpectTrue(caseName, ListenTimes === 10000);
          }
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName} catch err is `, JSON.stringify(err));
        ExpectFail(caseName);
        hilog.info(domain, tag, `${caseName} --test end`);
        done();
      }
    });
  })
}
