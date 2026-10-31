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
import { describe, it, expect, beforeAll, beforeEach, Level, Size, TestType } from "@ohos/hypium-static/src/main/indexStatic";
import mdns from '@ohos.net.mdns';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import Context from "application.Context";
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'mdnsTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

let context: Context | undefined;
const ExpectTrue: (n: boolean, caseName: string) => void = (n: boolean, caseName: string) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, "expectInfo: " + `${caseName} testNetworkMgr failed`);
  }
}
let address: string = "202.101.172.35";
const getName:()=>string=()=>{
  return "test"+ (Math.random()*10000).toFixed(0)
}
export default function mdnsTest(): void {
  describe('mdnsTest', () => {
    beforeAll(() => {
      hilog.info(domain, tag, 'NetworkManagerMdnsTest beforeAll start');
      hilog.info(domain, tag, 'NetworkManagerMdnsTest beforeAll end');
    });
    beforeEach(() => {
      hilog.info(domain, tag, 'NetworkManagerMdnsTest beforeEach start');
      context = abilityDelegator.getAppContext();
      hilog.info(domain, tag, `NetworkManagerMdnsTest context : ${JSON.stringify(context)}`);
      hilog.info(domain, tag, 'NetworkManagerMdnsTest beforeEach end');
    });
    /**
     * @tc.name   testNetworkMgrAddLocalService_static_0200
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_0200
     * @tc.desc   Add an mDNS service callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_0200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_0200";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
        }
        mdns.addLocalService(context!, localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          hilog.info(domain, tag, `${caseName}: callback : ${JSON.stringify(error)}  | ${JSON.stringify(data)}`);
          if (error) {
            ExpectTrue(error?.code === 401, caseName);
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
     * @tc.name   testNetworkMgrAddLocalService_static_0300
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_0300
     * @tc.desc   Add an mDNS service callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_0300",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_0300";
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
        mdns.addLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          hilog.info(domain, tag, `${caseName}: callback : ${JSON.stringify(error)}  | ${JSON.stringify(data)}`);
          if (error?.code !== 0) {
            ExpectTrue(false, caseName);
            done();
          } else {
            ExpectTrue(data !== null, caseName);
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
     * @tc.name   testNetworkMgrAddLocalService_static_0400
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_0400
     * @tc.desc   Add an mDNS service callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_0400",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_0400";
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
        mdns.addLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          hilog.info(domain, tag, `${caseName}: callback : ${JSON.stringify(error)}  | ${JSON.stringify(data)}`);
          if (error?.code !== 0) {
            ExpectTrue(false, caseName);
            done();
          } else {
            ExpectTrue(data !== null, caseName);
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
     * @tc.name   testNetworkMgrAddLocalService_static_0500
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_0500
     * @tc.desc   Add an mDNS service callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_0500",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_0500";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 10005568,
          host: {
            address: address,
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        mdns.addLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          hilog.info(domain, tag, `${caseName}: callback : ${JSON.stringify(error)}  | ${data}`);
          if (error) {
            ExpectTrue(error?.code === 401, caseName);
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
     * @tc.name   testNetworkMgrAddLocalService_static_0700
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_0700
     * @tc.desc   Add an mDNS service callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_0700",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_0700";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        mdns.addLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          hilog.info(domain, tag, `${caseName}: callback : ${JSON.stringify(error)}  | ${JSON.stringify(data)}`);
          if (error?.code !== 0) {
            ExpectTrue(false, caseName);
            done();
          } else {
            ExpectTrue(data !== null, caseName);
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
     * @tc.name   testNetworkMgrAddLocalService_static_0900
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_0900
     * @tc.desc   Add an mDNS service callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_0900",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_0900";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address
          },
          serviceAttribute: []
        }
        mdns.addLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          hilog.info(domain, tag, `${caseName}: callback : ${JSON.stringify(error)}  | ${JSON.stringify(data)}`);
          if (error) {
            ExpectTrue(error?.code === 401, caseName);
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
     * @tc.name   testNetworkMgrAddLocalService_static_1000
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_1000
     * @tc.desc   Add an mDNS service callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_1000",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_1000";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "...",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address
          },
          serviceAttribute: []
        }
        mdns.addLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          hilog.info(domain, tag, `${caseName}: callback : ${JSON.stringify(error)}  | ${JSON.stringify(data)}`);
          if (error) {
            ExpectTrue(error?.code === 401, caseName);
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
     * @tc.name   testNetworkMgrAddLocalService_static_1100
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_1100
     * @tc.desc   Add an mDNS service callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_1100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_1100";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: "",
          port: 8081,
          host: {
            address: address
          },
          serviceAttribute: []
        }
        mdns.addLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          hilog.info(domain, tag, `${caseName}: callback : ${JSON.stringify(error)}  | ${JSON.stringify(data)}`);
          if (error) {
            ExpectTrue(error?.code === 401, caseName);
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
     * @tc.name   testNetworkMgrAddLocalService_static_1200
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_1200
     * @tc.desc   Add an mDNS service callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_1200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_1200";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address
          },
          serviceAttribute: []
        }
        mdns.addLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          hilog.info(domain, tag, `${caseName}: fail ${JSON.stringify(error)}`);
          mdns.addLocalService(context!,  localServiceInfo, (error1: BusinessError | null, data1: mdns.LocalServiceInfo | undefined) => {
            if (error1?.code !== 0) {
              hilog.info(domain, tag, `${caseName}: fail ${JSON.stringify(error1)}`);
              ExpectTrue(error1?.code === 2204007, caseName);
              done();
            } else {
              hilog.info(domain, tag, `${caseName}: success ${JSON.stringify(data)}, ${JSON.stringify(data1)}`);
              ExpectTrue(false, caseName);
              done();
            }
          });
        });
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrAddLocalService_static_1400
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_1400
     * @tc.desc   Add an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_1400",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_1400";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
        }
        try {
          let data = await mdns.addLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName}: suscess :  ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName}: fail :  ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 401, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrAddLocalService_static_1500
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_1500
     * @tc.desc   Add an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_1500",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_1500";
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
        try {
          let res = await mdns.addLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName}: suscess :  ${JSON.stringify(res)}`);
          ExpectTrue(true, caseName);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName}: fail :  ${JSON.stringify(error)}`);
          ExpectTrue(false, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrAddLocalService_static_1600
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_1600
     * @tc.desc   Add an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_1600",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_1600";
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
          let data = await mdns.addLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName}: suscess :  ${JSON.stringify(data)}`);
          ExpectTrue(data !== null, caseName);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName}: fail :  ${JSON.stringify(error)}`);
          ExpectTrue(false, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrAddLocalService_static_1700
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_1700
     * @tc.desc   Add an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_1700",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_1700";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 10018568,
          host: {
            address: address,
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        try {
          let data = await mdns.addLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName}: suscess :  ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName}: fail :  ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 401, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });

    /**
     * @tc.name   testNetworkMgrAddLocalService_static_1900
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_1900
     * @tc.desc   Add an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_1900",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_1900";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        try {
          let data = await mdns.addLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName}: suscess :  ${JSON.stringify(data)}`);
          ExpectTrue(data !== null, caseName);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName}: fail :  ${JSON.stringify(error)}`);
          ExpectTrue(false, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrAddLocalService_static_2100
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_2100
     * @tc.desc   Add an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_2100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_2100";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address
          },
          serviceAttribute: []
        }
        try {
          let data = await mdns.addLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName}: suscess :  ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName}: fail :  ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 401, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrAddLocalService_static_2200
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_2200
     * @tc.desc   Add an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_2200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_2200";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "...",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address
          },
          serviceAttribute: []
        }
        try {
          let data = await mdns.addLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName}: suscess :  ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName}: fail :  ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 401, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrAddLocalService_static_2300
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_2300
     * @tc.desc   Add an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_2300",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_2300";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: "",
          port: 8081,
          host: {
            address: address
          },
          serviceAttribute: []
        }
        try {
          let data = await mdns.addLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName}: suscess :  ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName}: fail :  ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 401, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrAddLocalService_static_2400
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_2400
     * @tc.desc   Add an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_2400",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_2400";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address
          },
          serviceAttribute: []
        }
        try {
          let data = await mdns.addLocalService(context!,  localServiceInfo);
          try {
            let data = await mdns.addLocalService(context!,  localServiceInfo);
            hilog.info(domain, tag, `${caseName}: suscess :  ${JSON.stringify(data)}`);
            ExpectTrue(false, caseName);
            done();
          } catch (error) {
            hilog.info(domain, tag, `${caseName}: fail1 :  ${JSON.stringify(error)}`);
            ExpectTrue(error.code === 2204007, caseName);
            done();
          }
        } catch (error) {
          hilog.info(domain, tag, `${caseName}: fail2 :  ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 401, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrAddLocalService_static_2500
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_2500
     * @tc.desc   Add an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_2500",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_2500";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
            family: 2
          },
        }
        try {
          let data = await mdns.addLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName}: suscess :  ${JSON.stringify(data)}`);
          ExpectTrue(true, caseName);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName}: fail :  ${JSON.stringify(error)}`);
          ExpectTrue(false, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });

    /**
     * @tc.name   testNetworkMgrAddLocalService_static_2700
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_2700
     * @tc.desc   Add an mDNS service callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_2700",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_2700";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
            family: 2
          },
        }
        mdns.addLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName}: callback : ${JSON.stringify(error)}  `);
            ExpectTrue(false, caseName);
            done();
          } else {
            hilog.info(domain, tag, `${caseName}: suscess : ${JSON.stringify(data)}`);
            ExpectTrue(true, caseName);
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
     * @tc.name   testNetworkMgrAddLocalService_static_3300
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_3300
     * @tc.desc   Add an mDNS service callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_3300",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_3300";
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
            key: "111", value: []
          }]
        }
        mdns.addLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          hilog.info(domain, tag, `${caseName}: callback : ${JSON.stringify(error)}  | ${JSON.stringify(data)}`);
          if (error?.code !== 0) {
            ExpectTrue(false, caseName);
            done();
          } else {
            ExpectTrue(data !== null, caseName);
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
     * @tc.name   testNetworkMgrAddLocalService_static_3400
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_3400
     * @tc.desc   Add an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_3400",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_3400";
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
            key: "111", value: []
          }]
        }
        try {
          let data = await mdns.addLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName}: suscess :  ${JSON.stringify(data)}`);
          ExpectTrue(data !== null, caseName);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName}: fail :  ${JSON.stringify(error)}`);
          ExpectTrue(false, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });

    /**
     * @tc.name   testNetworkMgrAddLocalService_static_3500
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_3500
     * @tc.desc   Add an mDNS service callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_3500",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_3500";
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
        mdns.addLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          hilog.info(domain, tag, `${caseName}: callback : ${JSON.stringify(error)}  | ${JSON.stringify(data)}`);
          if (error?.code !== 0) {
            ExpectTrue(false, caseName);
            done();
          } else {
            if (data !== null && data !== undefined) {
              ExpectTrue(data.serviceType !== null, caseName);
              ExpectTrue(data.serviceName !== null, caseName);
              ExpectTrue(data.port !== null, caseName);
              ExpectTrue(data.host!.address !== null, caseName);
              ExpectTrue(data.host!.family !== null, caseName);
              ExpectTrue(data.host!.port !== null, caseName);
              if (data.serviceAttribute !== undefined) {
                ExpectTrue(data.serviceAttribute!.length !== 0,caseName);
              } else {
                ExpectTrue(false,caseName);
              }
            } else {
               ExpectTrue(false,caseName);
            }
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
     * @tc.name   testNetworkMgrAddLocalService_static_3600
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_3600
     * @tc.desc   Add an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_3600",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_3600";
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
          let data = await mdns.addLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName}: suscess :  ${JSON.stringify(data)}`);
          if (data !== null) {
            ExpectTrue(data.serviceType !== null, caseName);
            ExpectTrue(data.serviceName !== null, caseName);
            ExpectTrue(data.port !== null, caseName);
            ExpectTrue(data.host?.address !== null, caseName);
            ExpectTrue(data.host?.family !== null, caseName);
            ExpectTrue(data.host?.port !== null, caseName);
            if (data.serviceAttribute !== undefined) {
              ExpectTrue(data.serviceAttribute!.length !== 0,caseName);
            } else {
              ExpectTrue(false, caseName);
            }
          } else {
            ExpectTrue(false, caseName);
          }
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName}: fail :  ${JSON.stringify(error)}`);
          ExpectTrue(false, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });

    /**
     * @tc.name   testNetworkMgrRemoveLocalService_static_0100
     * @tc.number SUB_NetworkMgr_Mdns_RemoveLocalService_0100
     * @tc.desc   Remove an mDNS service callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrRemoveLocalService_static_0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrRemoveLocalService_static_0100";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
        }
        mdns.removeLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error) {
            hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(error?.code === 401, caseName);
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
     * @tc.name   testNetworkMgrRemoveLocalService_static_0200
     * @tc.number SUB_NetworkMgr_Mdns_RemoveLocalService_0200
     * @tc.desc   Remove an mDNS service callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrRemoveLocalService_static_0200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrRemoveLocalService_static_0200";
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
        mdns.removeLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error) {
            hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(error?.code === 401, caseName);
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
     * @tc.name   testNetworkMgrRemoveLocalService_static_0300
     * @tc.number SUB_NetworkMgr_Mdns_RemoveLocalService_0300
     * @tc.desc   Remove an mDNS service callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrRemoveLocalService_static_0300",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrRemoveLocalService_static_0300";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._udp",
          serviceName: getName(),
          port: 600000,
          host: {
            address: address,
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        mdns.removeLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error) {
            hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(error?.code === 401, caseName);
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
     * @tc.name   testNetworkMgrRemoveLocalService_static_0400
     * @tc.number SUB_NetworkMgr_Mdns_RemoveLocalService_0400
     * @tc.desc   Remove an mDNS service callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrRemoveLocalService_static_0400",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrRemoveLocalService_static_0400";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: "...",
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        mdns.removeLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error) {
            hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(error?.code === 401, caseName);
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
     * @tc.name   testNetworkMgrRemoveLocalService_static_0500
     * @tc.number SUB_NetworkMgr_Mdns_RemoveLocalService_0500
     * @tc.desc   Remove an mDNS service callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrRemoveLocalService_static_0500",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrRemoveLocalService_static_0500";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        mdns.removeLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error) {
            hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(error?.code === 401, caseName);
            done();
          } else {
            hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
            ExpectTrue(true, caseName);
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
     * @tc.name   testNetworkMgrRemoveLocalService_static_0600
     * @tc.number SUB_NetworkMgr_Mdns_RemoveLocalService_0600
     * @tc.desc   Remove an mDNS service callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrRemoveLocalService_static_0600",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrRemoveLocalService_static_0600";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "...",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        mdns.removeLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error) {
            hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(error?.code === 401, caseName);
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
     * @tc.name   testNetworkMgrRemoveLocalService_static_0800
     * @tc.number SUB_NetworkMgr_Mdns_RemoveLocalService_0800
     * @tc.desc   Remove an mDNS service callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrRemoveLocalService_static_0800",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrRemoveLocalService_static_0800";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        mdns.addLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} fail1 ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
          } else {
            mdns.removeLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, `${caseName} fail2 ${JSON.stringify(error)}`);
                ExpectTrue(false, caseName);
                done();
              } else {
                hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
                ExpectTrue(true, caseName);
                done();
              }
            });
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
     * @tc.name   testNetworkMgrRemoveLocalService_static_0900
     * @tc.number SUB_NetworkMgr_Mdns_RemoveLocalService_0900
     * @tc.desc   Remove an mDNS service callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrRemoveLocalService_static_0900",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrRemoveLocalService_static_0900";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._udp",
          serviceName: getName(),
          port: 8082,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        mdns.addLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} fail1 ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
          } else {
            mdns.removeLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, `${caseName} fail2 ${JSON.stringify(error)}`);
                ExpectTrue(false, caseName);
                done();
              } else {
                hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
                ExpectTrue(true, caseName);
                done();
              }
            });
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
     * @tc.name   testNetworkMgrRemoveLocalService_static_1000
     * @tc.number SUB_NetworkMgr_Mdns_RemoveLocalService_1000
     * @tc.desc   Remove an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrRemoveLocalService_static_1000",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrRemoveLocalService_static_1000";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
        }
        try {
          let data = await mdns.removeLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(true, caseName);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 401, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrRemoveLocalService_static_1100
     * @tc.number SUB_NetworkMgr_Mdns_RemoveLocalService_1100
     * @tc.desc   Remove an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrRemoveLocalService_static_1100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrRemoveLocalService_static_1100";
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
        try {
          let data = await mdns.removeLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
          ExpectTrue(true, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrRemoveLocalService_static_1200
     * @tc.number SUB_NetworkMgr_Mdns_RemoveLocalService_1200
     * @tc.desc   Remove an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrRemoveLocalService_static_1200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrRemoveLocalService_static_1200";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._udp",
          serviceName: getName(),
          port: 600000,
          host: {
            address: address,
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        try {
          let data = await mdns.removeLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 401, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrRemoveLocalService_static_1300
     * @tc.number SUB_NetworkMgr_Mdns_RemoveLocalService_1300
     * @tc.desc   Remove an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrRemoveLocalService_static_1300",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrRemoveLocalService_static_1300";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: "...",
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        try {
          let data = await mdns.removeLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 401, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrRemoveLocalService_static_1400
     * @tc.number SUB_NetworkMgr_Mdns_RemoveLocalService_1400
     * @tc.desc   Remove an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrRemoveLocalService_static_1400",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrRemoveLocalService_static_1400";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        try {
          let data = await mdns.removeLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(true, caseName);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 401, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrRemoveLocalService_static_1500
     * @tc.number SUB_NetworkMgr_Mdns_RemoveLocalService_1500
     * @tc.desc   Remove an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrRemoveLocalService_static_1500",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrRemoveLocalService_static_1500";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "...",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        try {
          let data = await mdns.removeLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 401, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrRemoveLocalService_static_1600
     * @tc.number SUB_NetworkMgr_Mdns_RemoveLocalService_1600
     * @tc.desc   Remove an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrRemoveLocalService_static_1600",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrRemoveLocalService_static_1600";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: "",
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        try {
          let data = await mdns.removeLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        } catch (error) {
          const err = error as BusinessError;
          hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(err?.code)}`);
          ExpectTrue(err.code === 2204002, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrRemoveLocalService_static_1700
     * @tc.number SUB_NetworkMgr_Mdns_RemoveLocalService_1700
     * @tc.desc   Remove an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrRemoveLocalService_static_1700",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrRemoveLocalService_static_1700";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        let removeAndDone = async (): Promise<void> => {
          try {
            let data = await mdns.removeLocalService(context!,  localServiceInfo);
            hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
            ExpectTrue(true, caseName);
            done();
          } catch (error) {
            const err = error as BusinessError;
            hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(err)}`);
            ExpectTrue(false, caseName);
            done();
          }
        };
        mdns.addLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} fail1 ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
          } else {
            removeAndDone();
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
     * @tc.name   testNetworkMgrRemoveLocalService_static_1800
     * @tc.number SUB_NetworkMgr_Mdns_RemoveLocalService_1800
     * @tc.desc   Remove an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrRemoveLocalService_static_1800",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrRemoveLocalService_static_1800";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._udp",
          serviceName: getName(),
          port: 8082,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        let removeAndDone = async (): Promise<void> => {
          try {
            let data = await mdns.removeLocalService(context!,  localServiceInfo);
            hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
            ExpectTrue(true, caseName);
            done();
          } catch (error) {
            const err = error as BusinessError;
            hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(err)}`);
            ExpectTrue(false, caseName);
            done();
          }
        };
        mdns.addLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} fail1 ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
          } else {
            removeAndDone();
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
     * @tc.name   testNetworkMgrRemoveLocalService_static_2100
     * @tc.number SUB_NetworkMgr_Mdns_RemoveLocalService_2100
     * @tc.desc   Remove an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrRemoveLocalService_static_2100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrRemoveLocalService_static_2100";
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
            key: "111", value: []
          }]
        }
        try {
          let data = await mdns.addLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName}: success :  ${JSON.stringify(data)}`);
          hilog.info(domain, tag, `${caseName}: success :  ${JSON.stringify(data.serviceAttribute)}`);
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName}: fail :  ${JSON.stringify(error)}`);
        }
        try {
          let data = await mdns.removeLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(data !== null, caseName);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
          ExpectTrue(false, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });

    /**
     * @tc.name   testNetworkMgrRemoveLocalService_static_2200
     * @tc.number SUB_NetworkMgr_Mdns_RemoveLocalService_2200
     * @tc.desc   Remove an mDNS service callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrRemoveLocalService_static_2200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrRemoveLocalService_static_2200";
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
            key: "111", value: []
          }]
        }
        try {
          let data = await mdns.addLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName}: success :  ${JSON.stringify(data)}`);
          hilog.info(domain, tag, `${caseName}: success :  ${JSON.stringify(data.serviceAttribute)}`);
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName}: fail :  ${JSON.stringify(error)}`);
        }
        mdns.removeLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
          } else {
            hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
            ExpectTrue(data !== null, caseName);
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
     * @tc.name   testNetworkMgrRemoveLocalService_static_2700
     * @tc.number SUB_NetworkMgr_Mdns_RemoveLocalService_2700
     * @tc.desc   Remove an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrRemoveLocalService_static_2700",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrRemoveLocalService_static_2700";
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
        try {
          let data = await mdns.addLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName}: success :  ${JSON.stringify(data)}`);
          hilog.info(domain, tag, `${caseName}: success :  ${JSON.stringify(data.serviceAttribute)}`);
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName}: fail :  ${JSON.stringify(error)}`);
        }
        try {
          let data = await mdns.removeLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
          if (data !== null) {
            ExpectTrue(data.serviceType !== null, caseName);
            ExpectTrue(data.serviceName !== null, caseName);
            ExpectTrue(data.port !== null, caseName);
            ExpectTrue(data.host?.address !== null, caseName);
            ExpectTrue(data.host?.family !== null, caseName);
            ExpectTrue(data.host?.port !== null, caseName);
            if (data.serviceAttribute !== undefined) {
              ExpectTrue(data.serviceAttribute!.length !== 0,caseName);
            } else {
              ExpectTrue(false,caseName);
            }
          } else {
            ExpectTrue(false, caseName);
          }
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
          ExpectTrue(false, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });

    /**
     * @tc.name   testNetworkMgrRemoveLocalService_static_2800
     * @tc.number SUB_NetworkMgr_Mdns_RemoveLocalService_2800
     * @tc.desc   Remove an mDNS service callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrRemoveLocalService_static_2800",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrRemoveLocalService_static_2800";
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
        try {
          let data = await mdns.addLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName}: success :  ${JSON.stringify(data)}`);
          hilog.info(domain, tag, `${caseName}: success :  ${JSON.stringify(data.serviceAttribute)}`);
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName}: fail :  ${JSON.stringify(error)}`);
        }
        mdns.removeLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
          } else {
          hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
          if (data !== null && data !== undefined) {
            ExpectTrue(data.serviceType !== null, caseName);
            ExpectTrue(data.serviceName !== null, caseName);
            ExpectTrue(data.port !== null, caseName);
            ExpectTrue(data.host?.address !== null, caseName);
            ExpectTrue(data.host?.family !== null, caseName);
            ExpectTrue(data.host?.port !== null, caseName);
            if (data.serviceAttribute !== undefined) {
              ExpectTrue(data.serviceAttribute!.length !== 0,caseName);
            } else {
              ExpectTrue(false,caseName);
            }
          } else {
            ExpectTrue(false, caseName);
          }
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
     * @tc.name   testNetworkMgrCreateDiscoveryService_static_0200
     * @tc.number SUB_NetworkMgr_Mdns_CreateDiscoveryService_0200
     * @tc.desc   Return a DiscoveryService object callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrCreateDiscoveryService_static_0200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrCreateDiscoveryService_static_0200";
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
        mdns.addLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          hilog.info(domain, tag, `${caseName}: callback : ${JSON.stringify(error)}  | ${JSON.stringify(data)}`);
          if (error?.code !== 0) {
            ExpectTrue(false, caseName);
            done();
          } else {
            hilog.info(domain, tag, `${caseName} add success`)
            let serviceType = "_print._tcp";
            let discoveryService: Object = mdns.createDiscoveryService(context!,  serviceType);
            hilog.info(domain, tag, `${caseName} result :${JSON.stringify(discoveryService)}`);
            ExpectTrue(true, caseName);
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
     * @tc.name   testNetworkMgrCreateDiscoveryService_static_0300
     * @tc.number SUB_NetworkMgr_Mdns_CreateDiscoveryService_0300
     * @tc.desc   Return a DiscoveryService object callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrCreateDiscoveryService_static_0300",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrCreateDiscoveryService_static_0300";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let serviceType = "_print._udp";
        let discoveryService: Object = mdns.createDiscoveryService(context!,  serviceType);
        hilog.info(domain, tag, `${caseName} result :${JSON.stringify(discoveryService)}`);
        ExpectTrue(true, caseName);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });

    /**
     * @tc.name   testNetworkMgrResolveLocalService_static_0100
     * @tc.number SUB_NetworkMgr_Mdns_ResolveLocalService_0100
     * @tc.desc   Parsing an mDNS service callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrResolveLocalService_static_0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrResolveLocalService_static_0100";
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
        mdns.addLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
          } else {
            mdns.resolveLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
                ExpectTrue(false, caseName);
                done();
              } else {
                hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
                ExpectTrue(true, caseName);
                done();
              }
            });
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
     * @tc.name   testNetworkMgrResolveLocalService_static_0200
     * @tc.number SUB_NetworkMgr_Mdns_ResolveLocalService_0200
     * @tc.desc   Parsing an mDNS service callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrResolveLocalService_static_0200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrResolveLocalService_static_0200";
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
        mdns.resolveLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error) {
            hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(error?.code === 2204006, caseName);
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
     * @tc.name   testNetworkMgrResolveLocalService_static_0300
     * @tc.number SUB_NetworkMgr_Mdns_ResolveLocalService_0300
     * @tc.desc   Parsing an mDNS service callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrResolveLocalService_static_0300",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrResolveLocalService_static_0300";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._udp",
          serviceName: getName(),
        }
        mdns.resolveLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error) {
            hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(error?.code === 2204006, caseName);
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
     * @tc.name   testNetworkMgrResolveLocalService_static_0500
     * @tc.number SUB_NetworkMgr_Mdns_ResolveLocalService_0500
     * @tc.desc   Parsing an mDNS service callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrResolveLocalService_static_0500",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrResolveLocalService_static_0500";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8082,
          host: {
            address: "",
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        mdns.resolveLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error) {
            hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(error?.code === 2204006, caseName);
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
     * @tc.name   testNetworkMgrResolveLocalService_static_0600
     * @tc.number SUB_NetworkMgr_Mdns_ResolveLocalService_0600
     * @tc.desc   Parsing an mDNS service callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrResolveLocalService_static_0600",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrResolveLocalService_static_0600";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "000",
          serviceName: getName(),
          port: 8082,
          host: {
            address: address,
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        mdns.resolveLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error) {
            hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(error?.code === 401, caseName);
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
     * @tc.name   testNetworkMgrResolveLocalService_static_0700
     * @tc.number SUB_NetworkMgr_Mdns_ResolveLocalService_0700
     * @tc.desc   Parsing an mDNS service callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrResolveLocalService_static_0700",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrResolveLocalService_static_0700";
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
        mdns.addLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} fail1 ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
          } else {
            mdns.resolveLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
              if (error?.code !== 0) {
                hilog.info(domain, tag, `${caseName} fail2 ${JSON.stringify(error)}`);
                ExpectTrue(false, caseName);
                done();
              } else {
                hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
                ExpectTrue(true, caseName);
                done();
              }
            });
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
     * @tc.name   testNetworkMgrResolveLocalService_static_0800
     * @tc.number SUB_NetworkMgr_Mdns_ResolveLocalService_0800
     * @tc.desc   Parsing an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrResolveLocalService_static_0800",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrResolveLocalService_static_0800";
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
        let resolveAndDone = async (): Promise<void> => {
          try {
            let data = await mdns.resolveLocalService(context!,  localServiceInfo);
            hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
            ExpectTrue(true, caseName);
            done();
          } catch (err) {
            const error = err as BusinessError;
            hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
          }
        };
        mdns.addLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
          } else {
            resolveAndDone();
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
     * @tc.name   testNetworkMgrResolveLocalService_static_0900
     * @tc.number SUB_NetworkMgr_Mdns_ResolveLocalService_0900
     * @tc.desc   Parsing an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrResolveLocalService_static_0900",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrResolveLocalService_static_0900";
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
          let data = await mdns.resolveLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 2204006, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrResolveLocalService_static_1000
     * @tc.number SUB_NetworkMgr_Mdns_ResolveLocalService_1000
     * @tc.desc   Parsing an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrResolveLocalService_static_1000",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrResolveLocalService_static_1000";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._udp",
          serviceName: getName(),
        }
        try {
          let data = await mdns.resolveLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 2204006, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrResolveLocalService_static_1100
     * @tc.number SUB_NetworkMgr_Mdns_ResolveLocalService_1100
     * @tc.desc   Parsing an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrResolveLocalService_static_1100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrResolveLocalService_static_1100";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 12345678,
          host: {
            address: address,
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        try {
          let data = await mdns.resolveLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 2204006, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrResolveLocalService_static_1200
     * @tc.number SUB_NetworkMgr_Mdns_ResolveLocalService_1200
     * @tc.desc   Parsing an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrResolveLocalService_static_1200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrResolveLocalService_static_1200";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8082,
          host: {
            address: "",
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        try {
          let data = await mdns.resolveLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 2204006, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrResolveLocalService_static_1300
     * @tc.number SUB_NetworkMgr_Mdns_ResolveLocalService_1300
     * @tc.desc   Parsing an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrResolveLocalService_static_1300",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrResolveLocalService_static_1300";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "000",
          serviceName: getName(),
          port: 8082,
          host: {
            address: address,
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        try {
          let data = await mdns.resolveLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 401, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrResolveLocalService_static_1400
     * @tc.number SUB_NetworkMgr_Mdns_ResolveLocalService_1400
     * @tc.desc   Parsing an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrResolveLocalService_static_1400",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrResolveLocalService_static_1400";
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
        let resolveAndDone = async (): Promise<void> => {
          try {
            let data = await mdns.resolveLocalService(context!,  localServiceInfo);
            hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
            ExpectTrue(true, caseName);
            done();
          } catch (err) {
            const error = err as BusinessError;
            hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
          }
        };
        mdns.addLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(false, caseName);
            done();
          } else {
            resolveAndDone();
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
     * @tc.name   testNetworkMgrResolveLocalService_static_1700
     * @tc.number SUB_NetworkMgr_Mdns_ResolveLocalService_1700
     * @tc.desc   Parsing an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrResolveLocalService_static_1700",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrResolveLocalService_static_1700";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._udp",
          serviceName: "",
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        try {
          let data = await mdns.resolveLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 401, caseName);
          done();
        }
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
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrResolveLocalService_static_1800",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
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
          serviceAttribute: []
        }
        try {
          let data = await mdns.resolveLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 2204006, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });

    /**
     * @tc.name   testNetworkMgrResolveLocalService_static_1900
     * @tc.number SUB_NetworkMgr_Mdns_ResolveLocalService_1900
     * @tc.desc   Parsing an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrResolveLocalService_static_1900",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrResolveLocalService_static_1900";
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
            key: "111", value: []
          }]
        }
        try {
          let data = await mdns.resolveLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName} success ${JSON.stringify(data)}`);
          ExpectTrue(false, caseName);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
          ExpectTrue(error.code === 2204006, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });

    /**
     * @tc.name   testNetworkMgrResolveLocalService_static_2200
     * @tc.number SUB_NetworkMgr_Mdns_ResolveLocalService_2200
     * @tc.desc   Parsing an mDNS service callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrResolveLocalService_static_2200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrResolveLocalService_static_2200";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._udp",
          serviceName: "",
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        mdns.resolveLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error) {
            hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(error?.code === 401, caseName);
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
     * @tc.name   testNetworkMgrResolveLocalService_static_2300
     * @tc.number SUB_NetworkMgr_Mdns_ResolveLocalService_2300
     * @tc.desc   Parsing an mDNS service callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrResolveLocalService_static_2300",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrResolveLocalService_static_2300";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._udp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: []
        }
        mdns.resolveLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error) {
            hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(error?.code === 2204006, caseName);
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
     * @tc.name   testNetworkMgrResolveLocalService_static_2400
     * @tc.number SUB_NetworkMgr_Mdns_ResolveLocalService_2400
     * @tc.desc   Parsing an mDNS service callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrResolveLocalService_static_2400",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrResolveLocalService_static_2400";
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
            key: "111", value: []
          }]
        }
        mdns.resolveLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error) {
            hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(error?.code === 2204006, caseName);
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
     * @tc.name   testNetworkMgrStartSearchingMDNS_static_0100
     * @tc.number SUB_NetworkMgr_Mdns_StartSearchingMDNS_0100
     * @tc.desc   Start searching for mDNS services within the local area network callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrStartSearchingMDNS_static_0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrStartSearchingMDNS_static_0100";
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
        try {
          let data = await mdns.addLocalService(context!,  localServiceInfo);
          let serviceType = "_print._tcp";
          let discoveryService = mdns.createDiscoveryService(context!,  serviceType);
          discoveryService.onDiscoveryStart((data: mdns.DiscoveryEventInfo) => {
            hilog.info(domain, tag, `${caseName} result: ${JSON.stringify(data)}`);
            ExpectTrue(data !== undefined, caseName);
            ExpectTrue(data.serviceInfo !== undefined, caseName);
            ExpectTrue(data.serviceInfo.serviceType !== undefined, caseName);
            ExpectTrue(typeof data.serviceInfo.serviceType === 'string', caseName);
            ExpectTrue(data.serviceInfo.serviceType === serviceType, caseName);
            ExpectTrue(data.serviceInfo.serviceName !== undefined, caseName);
            ExpectTrue(typeof data.serviceInfo.serviceName === 'string', caseName);
            done();
          });
          discoveryService.startSearchingMDNS();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName} catch error: ${JSON.stringify(error)}`);
          ExpectTrue(false, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrStartSearchingMDNS_static_0200
     * @tc.number SUB_NetworkMgr_Mdns_StartSearchingMDNS_0200
     * @tc.desc   Start searching for mDNS services within the local area network callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrStartSearchingMDNS_static_0200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrStartSearchingMDNS_static_0200";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let serviceType = "_print._udp";
        let discoveryService = mdns.createDiscoveryService(context!,  serviceType);
        discoveryService.onDiscoveryStart((data: mdns.DiscoveryEventInfo) => {
          hilog.info(domain, tag, `${caseName} result: ${JSON.stringify(data)}`);
          ExpectTrue(data !== undefined, caseName);
          ExpectTrue(data.serviceInfo !== undefined, caseName);
          ExpectTrue(data.serviceInfo.serviceType !== undefined, caseName);
          ExpectTrue(typeof data.serviceInfo.serviceType === 'string', caseName);
          ExpectTrue(data.serviceInfo.serviceType === serviceType, caseName);
          ExpectTrue(data.serviceInfo.serviceName !== undefined, caseName);
          ExpectTrue(typeof data.serviceInfo.serviceName === 'string', caseName);
          done();
        });
        discoveryService.startSearchingMDNS();
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
    /**
     * @tc.name   testNetworkMgrStartSearchingMDNS_static_0300
     * @tc.number SUB_NetworkMgr_Mdns_StartSearchingMDNS_0300
     * @tc.desc   Start searching for mDNS services within the local area network callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrStartSearchingMDNS_static_0300",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrStartSearchingMDNS_static_0300";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let serviceType = "111";
        let discoveryService = mdns.createDiscoveryService(context!,  serviceType);
        hilog.info(domain, tag, `${caseName} discoveryService: ${JSON.stringify(discoveryService)}`);
        discoveryService.onDiscoveryStart((data: mdns.DiscoveryEventInfo) => {
            hilog.info(domain, tag, `${caseName} result: ${JSON.stringify(data)}`);
            ExpectTrue(data !== undefined, caseName);
            ExpectTrue(data.serviceInfo !== undefined, caseName);
            ExpectTrue(data.serviceInfo.serviceType !== undefined, caseName);
            ExpectTrue(typeof data.serviceInfo.serviceType === 'string', caseName);
            ExpectTrue(data.serviceInfo.serviceType === serviceType, caseName);
            ExpectTrue(data.serviceInfo.serviceName !== undefined, caseName);
            ExpectTrue(typeof data.serviceInfo.serviceName === 'string', caseName);
            done();
        });
        discoveryService.startSearchingMDNS();
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(err.code === 401, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });

    /**
     * @tc.name   testNetworkMgrDiscoveryStopOn_static_0100
     * @tc.number SUB_NetworkMgr_Mdns_DiscoveryStopOn_0100
     * @tc.desc   Subscribe to notifications for removing mDNS services callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrDiscoveryStopOn_static_0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrDiscoveryStopOn_static_0100";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let serviceType = "_print._tcp";
        let discoveryService = mdns.createDiscoveryService(context!,  serviceType);
        discoveryService.startSearchingMDNS();
        discoveryService.onDiscoveryStop((data: mdns.DiscoveryEventInfo) => {
          hilog.info(domain, tag, `${caseName} start: ${JSON.stringify(data)}`);
          ExpectTrue(data !== undefined, caseName);
          ExpectTrue(data.serviceInfo !== undefined, caseName);
          ExpectTrue(data.serviceInfo.serviceType !== undefined, caseName);
          ExpectTrue(typeof data.serviceInfo.serviceType === 'string', caseName);
          ExpectTrue(data.serviceInfo.serviceType === serviceType, caseName);
          ExpectTrue(data.serviceInfo.serviceName !== undefined, caseName);
          ExpectTrue(typeof data.serviceInfo.serviceName === 'string', caseName);
          done();
        });
        discoveryService.stopSearchingMDNS();
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });

    /**
     * @tc.name   testNetworkMgrAddLocalService_static_2600
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_2600
     * @tc.desc   Add an mDNS service Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_2600",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_2600";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
            family: 888
          },
        }
        try {
          let data = await mdns.addLocalService(context!,  localServiceInfo);
          hilog.info(domain, tag, `${caseName}: suscess :  ${JSON.stringify(data)}`);
          ExpectTrue(data !== null, caseName);
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, `${caseName}: fail :  ${JSON.stringify(error)}`);
          ExpectTrue(false, caseName);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });

    /**
     * @tc.name   testNetworkMgrAddLocalService_static_2800
     * @tc.number SUB_NetworkMgr_Mdns_AddLocalService_2800
     * @tc.desc   Add an mDNS service callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrAddLocalService_static_2800",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrAddLocalService_static_2800";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 8081,
          host: {
            address: address,
            family: 888
          },
        }
        mdns.addLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error?.code !== 0) {
            hilog.info(domain, tag, `${caseName}: callback : ${JSON.stringify(error)}  `);
            ExpectTrue(false, caseName);
            done();
          } else {
            hilog.info(domain, tag, `${caseName}: callback : ${JSON.stringify(data)}`);
            ExpectTrue(data !== null, caseName);
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
     * @tc.name   testNetworkMgrResolveLocalService_static_0400
     * @tc.number SUB_NetworkMgr_Mdns_ResolveLocalService_0400
     * @tc.desc   Parsing an mDNS service callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrResolveLocalService_static_0400",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrResolveLocalService_static_0400";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: getName(),
          port: 12345678,
          host: {
            address: address,
          },
          serviceAttribute: [{
            key: "111", value: [1]
          }]
        }
        mdns.resolveLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error) {
            hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error)}`);
            ExpectTrue(error?.code===2204006, caseName);
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
     * @tc.name   testNetworkMgrCreateDiscoveryService_static_0100
     * @tc.number SUB_NetworkMgr_Mdns_CreateDiscoveryService_0100
     * @tc.desc   Return a DiscoveryService object callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrCreateDiscoveryService_static_0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrCreateDiscoveryService_static_0100";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let serviceType = "";
        let discoveryService: Object = mdns.createDiscoveryService(context!,  serviceType);
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
     * @tc.name   testNetworkMgrCreateDiscoveryService_static_0400
     * @tc.number SUB_NetworkMgr_Mdns_CreateDiscoveryService_0400
     * @tc.desc   Return a DiscoveryService object callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrCreateDiscoveryService_static_0400",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrCreateDiscoveryService_static_0400";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let serviceType = "668";
        let discoveryService: Object = mdns.createDiscoveryService(context!,  serviceType);
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
     * @tc.name   testNetworkMgrCreateDiscoveryService_static_0700
     * @tc.number SUB_NetworkMgr_Mdns_CreateDiscoveryService_0700
     * @tc.desc   Return a DiscoveryService object callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrCreateDiscoveryService_static_0700",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrCreateDiscoveryService_static_0700";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let discoveryService: Object = mdns.createDiscoveryService(context!,  "");
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
     * @tc.name   testNetworkMgrCreateDiscoveryService_static_0800
     * @tc.number SUB_NetworkMgr_Mdns_CreateDiscoveryService_0800
     * @tc.desc   Verify the properties and methods of the returned DiscoveryService object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrCreateDiscoveryService_static_0800",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrCreateDiscoveryService_static_0800";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let serviceType = "_print._tcp";
        let discoveryService = mdns.createDiscoveryService(context!,  serviceType);
        hilog.info(domain, tag, `${caseName} result :${JSON.stringify(discoveryService)}`);
        ExpectTrue(discoveryService !== undefined, caseName);
        ExpectTrue(discoveryService !== null, caseName);
        ExpectTrue(typeof discoveryService === 'object', caseName);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });

    /**
     * @tc.name   testNetworkMgrRemoveLocalService_static_0700
     * @tc.number SUB_NetworkMgr_Mdns_RemoveLocalService_0700
     * @tc.desc   Remove an mDNS service callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrRemoveLocalService_static_0700",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrRemoveLocalService_static_0700";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let localServiceInfo: mdns.LocalServiceInfo = {
          serviceType: "_print._tcp",
          serviceName: "",
          port: 8081,
          host: {
            address: address,
          },
          serviceAttribute: []
        }

        mdns.removeLocalService(context!,  localServiceInfo, (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
          if (error) {
            hilog.info(domain, tag, `${caseName} fail ${JSON.stringify(error?.code)}`);
            ExpectTrue(error?.code === 401, caseName);
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
     * @tc.name   testNetworkMgrDiscoveryStartOn_static_0100
     * @tc.number SUB_NetworkMgr_Mdns_DiscoveryStartOn_0100
     * @tc.desc   Subscription to enable notifications for listening to mDNS services callBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrDiscoveryStartOn_static_0100",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3 ,async (done: () => void): Promise<void> => {
      const caseName: string = "testNetworkMgrDiscoveryStartOn_static_0100";
      hilog.info(domain, tag, `${caseName} test start `);
      try {
        let serviceType = "_print._tcp";
        let discoveryService = mdns.createDiscoveryService(context!,  serviceType);
        discoveryService.onDiscoveryStart((data: mdns.DiscoveryEventInfo) => {
          hilog.info(domain, tag, `${caseName} result: ${JSON.stringify(data)}`);
          hilog.info(domain, tag, `${caseName} serviceInfo: ${JSON.stringify(data.serviceInfo)}`);
          ExpectTrue(data !== undefined, caseName);
          ExpectTrue(data.serviceInfo !== undefined, caseName);
          ExpectTrue(data.serviceInfo.serviceType !== undefined, caseName);
          ExpectTrue(typeof data.serviceInfo.serviceType === 'string', caseName);
          ExpectTrue(data.serviceInfo.serviceType === serviceType, caseName);
          ExpectTrue(data.serviceInfo.serviceName !== undefined, caseName);
          ExpectTrue(typeof data.serviceInfo.serviceName === 'string', caseName);
          done();
        });
        discoveryService.startSearchingMDNS();
      } catch (err) {
        hilog.info(domain, tag, `${caseName}: err is catch ${err}`);
        ExpectTrue(false, caseName);
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `);
    });
  });
}
