'use static';
/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, it, expect, beforeAll, TestType, Size, Level } from "../../../hypium/index";
import mdns from '@ohos.net.mdns';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import Context from "application.Context";
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'noHaveInternetTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let context: Context | undefined;
const ExpectTrue: (n: boolean, caseName: string) => void = (n: boolean, caseName: string) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, "expectInfo: " + `${caseName} testNetworkMgr failed`);
  }
}
const address: string = "202.101.172.38";
const getName: () =>string = () => {
  return "test"+ (Math.random()*100000).toFixed(0);
}
export default function NoHaveInternetTest(): void {
  describe('NoInternetTest', () => {
    beforeAll(() => {
      context = abilityDelegator.getAppContext();
      hilog.info(domain, tag, `context : ${JSON.stringify(context)}`);
    });
    /**
     * @tc.name   testNetworkMgrAddLocalService_static_2900
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_2900
     * @tc.desc   Add an mDNS service callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrAddLocalService_static_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_2900";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        mdns.addLocalService(context!, localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          hilog.info(domain, tag, `${caseName}: callback : ${JSON.stringify(error)}  | ${JSON.stringify(data)}`);
          if (error?.code !== 0) {
            ExpectTrue(error?.code===2204009, caseName);
            done();
          } else {
            ExpectTrue(false, caseName);
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrAddLocalService_static_3000
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_3000
     * @tc.desc   Add an mDNS service callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_3000";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        mdns.addLocalService(context!, localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          hilog.info(domain, tag, `${caseName}: callback : ${JSON.stringify(error)}  | ${JSON.stringify(data)}`);
          if (error?.code !== 0) {
            ExpectTrue(error?.code===2204009, caseName);
            done();
          } else {
            ExpectTrue(false, caseName);
            done();
          }
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });

    /**
     * @tc.name   testNetworkMgrCreateDiscoveryService_static_0500
     * @tc.number SUB_NetworkMgr_Mdns_CreateDiscoveryService_0500
     * @tc.desc   Return a DiscoveryService object callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrCreateDiscoveryService_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrCreateDiscoveryService_static_0500";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let serviceType = "_print._tcp";
        let discoveryService: Object = mdns.createDiscoveryService(context!, serviceType);
        hilog.info(domain, tag, `${caseName} result :${JSON.stringify(discoveryService)}`);
        ExpectTrue(discoveryService !== null, caseName);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrResolveLocalService_static_1700
     * @tc.number SUB_NetworkMgr_Mdns_ResolveLocalService_1700
     * @tc.desc   Parsing an mDNS service callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrResolveLocalService_static_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrResolveLocalService_static_1700";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        mdns.resolveLocalService(context!, localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, `${caseName} falil ${JSON.stringify(error)}`);
                ExpectTrue(error?.code===2204009, caseName);
                done();
              } else {
                hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
                ExpectTrue(false, caseName);
                done();
              }
            });
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });

    /**
     * @tc.name   testNetworkMgrResolveLocalService_static_1800
     * @tc.number SUB_NetworkMgr_Mdns_ResolveLocalService_1800
     * @tc.desc   Parsing an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrResolveLocalService_static_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrResolveLocalService_static_1800";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._udp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        try {
          let data = await mdns.resolveLocalService(context!, localServiceInfo);
          hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        } catch (err) {
          const error = err as BusinessError
          hilog.info(domain, tag, `${caseName} falil ${JSON.stringify(error)}`);
          ExpectTrue(error.code===2204009, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
  });
}
