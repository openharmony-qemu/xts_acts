'use static';
/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  describe,
  expect,
  it,
  beforeAll,
  Size,
  Level,
  TestType,
  afterEach,
} from "@ohos/hypium-static/src/main/indexStatic";
import mdns from '@ohos.net.mdns';
import hilog from '@ohos.hilog';
import Context from "application.Context";
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let domain: int = 0x0000;
let tag: string = 'mdnsOnAndOffTag';
let context: Context | undefined;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let radomAddress: string = "202.101.172.35";
let serviceTypeTcp = "_print._tcp";
let serviceTypeUdp = "_print._udp";
let getName: () => string = () => {
  return "test" + (Math.random() * 1000).toFixed(0) + (Math.random() * 5000).toFixed(0) +
    (Math.random() * 800).toFixed(0)
}
let localServiceInfoTypeTcp: () => mdns.LocalServiceInfo = () => {
  let localServiceInfoType: mdns.LocalServiceInfo;
  localServiceInfoType = {
    serviceType: serviceTypeTcp,
    serviceName: getName(),
    port: 8081,
    host: {
      address: radomAddress,
    },
    serviceAttribute: []
  }
  return localServiceInfoType
}
let ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, "expectInfo", `test failed`);
  }
}
let ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, ` exportFail failed err: ${JSON.stringify(err)}`);
  }
};
let removeTheService = (localServiceInfo: mdns.LocalServiceInfo) => {
  try {
    mdns.removeLocalService(context!, localServiceInfo,
      (error: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
        if (error?.code !== 0) {
          hilog.info(domain, tag, ` function removeTheService removeLocalService fail code:${JSON.stringify(error?.code)}, msg:${JSON.stringify(error?.message)}`);
        } else {
          hilog.info(domain, tag,
            ` function removeTheService removeLocalService success data is :${JSON.stringify(data)} `);
        }
      })
  } catch (err) {
    hilog.info(domain, tag, `removeLocalService catch  err is ` + JSON.stringify(err));
  }
}

function sleep(count: int): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve('ok')
    }, count)
  })
}

export default function NetworkManagerMdnsTest(): void {

  describe('NetworkManagerMdnsTest', () => {
    beforeAll(() => {
      hilog.info(domain, tag, 'NetworkManagerMdnsTest beforeAll start.');
      context = abilityDelegator.getAppContext();
      hilog.info(domain, tag, `NetworkManagerMdnsTest context : ${JSON.stringify(context)}`);
    });

    afterEach(async () => {
      await sleep(500);
    });


    /**
     * @tc.name   testTelephonyNetManagerStartSearchingMDNS_static_0100
     * @tc.number SUB_Telephony_NetManager_startSearchingMDNS_0100
     * @tc.desc   Subscribing to the Notification of Enabling the mDNS Service Listening Function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyNetManagerStartSearchingMDNS_static_0100', Size.SMALLTEST | TestType.FUNCTION | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = 'testTelephonyNetManagerStartSearchingMDNS_static_0100';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          let localServiceInfo = localServiceInfoTypeTcp();
          let discoveryService = mdns.createDiscoveryService(context!, serviceTypeTcp);
          hilog.info(domain, tag, `discoveryService 1 -> ${JSON.stringify(discoveryService)}`)
          hilog.info(domain, tag, `discoveryService 2 -> ${discoveryService instanceof mdns.DiscoveryService}`)
          discoveryService.onDiscoveryStart(() => {
            hilog.info(domain, tag, `${caseName} on discoveryStart : startSearching `);
            ExpectTrue(true);
            removeTheService(localServiceInfo);
            done();
            hilog.info(domain, tag, `${caseName}---End`);
          });
          mdns.addLocalService(context!, localServiceInfo, (err: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} addLocalService fail ${JSON.stringify(err)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag,
                `${caseName} addLocalService success, LocalServiceInfo is ` + JSON.stringify(data));
              discoveryService.startSearchingMDNS();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch err message is ` + JSON.stringify(err.message));
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testTelephonyNetManagerStartSearchingMDNS_static_0200
     * @tc.number SUB_Telephony_NetManager_startSearchingMDNS_0200
     * @tc.desc   Disable the function of listening on the MDNS service.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyNetManagerStartSearchingMDNS_static_0200', Size.SMALLTEST | TestType.FUNCTION | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName = 'testTelephonyNetManagerStartSearchingMDNS_static_0200';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          let callback: () => void = () => {
            hilog.info(domain, tag, `${caseName}  on or off discoveryStart  `);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
          let localServiceInfo = localServiceInfoTypeTcp();
          let discoveryService = mdns.createDiscoveryService(context!, serviceTypeTcp);
          discoveryService.onDiscoveryStart(callback);
          discoveryService.offDiscoveryStart(callback);
          let sleepAndDone = async (): Promise<void> => {
            try {
              await sleep(1000);
              ExpectTrue(true);
              removeTheService(localServiceInfo);
              done();
              hilog.info(domain, tag, `${caseName}---End`);
            } catch (err) {
              hilog.info(domain, tag, `${caseName} catch err is ` + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          };
          mdns.addLocalService(context!, localServiceInfo, (err: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} addLocalService fail ${JSON.stringify(err)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag,
                `${caseName} addLocalService success, LocalServiceInfo is ` + JSON.stringify(data));
              discoveryService.startSearchingMDNS();
              sleepAndDone();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch err is ` + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });


    /**
     * @tc.name   testTelephonyNetManagerStopSearchingMDNS_static_0100
     * @tc.number SUB_Telephony_NetManager_stopSearchingMDNS_0100
     * @tc.desc   Subscribe to the notification of stopping listening on the MDNS service.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyNetManagerStopSearchingMDNS_static_0100', Size.SMALLTEST | TestType.FUNCTION | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName = 'testTelephonyNetManagerStopSearchingMDNS_static_0100';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          let localServiceInfo = localServiceInfoTypeTcp();
          let discoveryService = mdns.createDiscoveryService(context!, serviceTypeTcp);
          discoveryService.onDiscoveryStop(() => {
            hilog.info(domain, tag, `${caseName} on discoveryStop : stopSearchingMDNS`);
            ExpectTrue(true);
            removeTheService(localServiceInfo);
            done();
          });
          mdns.addLocalService(context!, localServiceInfo, (err: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} addLocalService fail ${JSON.stringify(err)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} addLocalService success `);
              discoveryService.startSearchingMDNS();
              discoveryService.stopSearchingMDNS();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch err is ` + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testTelephonyNetManagerStopSearchingMDNS_static_0200
     * @tc.number SUB_Telephony_NetManager_stopSearchingMDNS_0200
     * @tc.desc   This interface is used to unsubscribe from the notification of stopping listening on the MDNS service.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyNetManagerStopSearchingMDNS_static_0200', Size.SMALLTEST | TestType.FUNCTION | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName = 'testTelephonyNetManagerStopSearchingMDNS_static_0200';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          let localServiceInfo = localServiceInfoTypeTcp();
          let discoveryService = mdns.createDiscoveryService(context!, serviceTypeTcp);
          let callback: () => void = () => {
            hilog.info(domain, tag, `${caseName}  on or off discoveryStop  `);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
          discoveryService.onDiscoveryStop(callback);
          discoveryService.offDiscoveryStop(callback);
          let sleepAndDone = async (): Promise<void> => {
            try {
              await sleep(500);
              ExpectTrue(true);
              removeTheService(localServiceInfo);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } catch (err) {
              hilog.info(domain, tag, `${caseName} catch err is ` + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          };
          mdns.addLocalService(context!, localServiceInfo, (err: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} addLocalService fail ${JSON.stringify(err)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} addLocalService success `);
              discoveryService.startSearchingMDNS();
              discoveryService.stopSearchingMDNS();
              sleepAndDone();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch err is ` + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });


    /**
     * @tc.name   testTelephonyNetManagerOnServiceFound_static_0100
     * @tc.number SUB_Telephony_NetManager_on_serviceFound_0100
     * @tc.desc   Subscribe to notifications of MDNS service discovery.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyNetManagerOnServiceFound_static_0100', Size.SMALLTEST | TestType.FUNCTION | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName = 'testTelephonyNetManagerOnServiceFound_static_0100';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          let localServiceInfo = localServiceInfoTypeTcp();
          let discoveryService = mdns.createDiscoveryService(context!, serviceTypeTcp);
          discoveryService.onServiceFound((data: mdns.LocalServiceInfo) => {
            hilog.info(domain, tag, `${caseName} on serviceFound , data is ${JSON.stringify(data)}`);
            ExpectTrue(true);
            discoveryService.stopSearchingMDNS();
            removeTheService(localServiceInfo);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          });
          mdns.addLocalService(context!, localServiceInfo, (err: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} addLocalService fail ${JSON.stringify(err)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} addLocalService success `);
              discoveryService.startSearchingMDNS();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch err is ` + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testTelephonyNetManagerOnServiceFound_static_0200
     * @tc.number SUB_Telephony_NetManager_on_serviceFound_0200
     * @tc.desc   Subscribe to notifications of MDNS service discovery.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyNetManagerOnServiceFound_static_0200', Size.SMALLTEST | TestType.FUNCTION | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName = 'testTelephonyNetManagerOnServiceFound_static_0200';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          let localServiceInfo = localServiceInfoTypeTcp();
          let discoveryService = mdns.createDiscoveryService(context!, serviceTypeUdp);
          discoveryService.onServiceFound((data: mdns.LocalServiceInfo) => {
            hilog.info(domain, tag, `${caseName} on serviceFound , data is ${JSON.stringify(data)}`);
            ExpectFail();
            done();
          });
          let sleepAndDone = async (): Promise<void> => {
            try {
              await sleep(1000);
              ExpectTrue(true);
              discoveryService.stopSearchingMDNS();
              removeTheService(localServiceInfo);
              done();
            } catch (err) {
              hilog.info(domain, tag, `${caseName} catch err is ` + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          };
          mdns.addLocalService(context!, localServiceInfo, (err: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} add LocalService fail ${JSON.stringify(err)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} add LocalService success `);
              discoveryService.startSearchingMDNS();
              sleepAndDone();
              hilog.info(domain, tag, `${caseName}---End`);
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch err is ` + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });


    /**
     * @tc.name   testTelephonyNetManagerOnServiceFound_static_0300
     * @tc.number SUB_Telephony_NetManager_on_serviceFound_0300
     * @tc.desc   Unsubscribe from notifications about MDNS service discovery.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyNetManagerOnServiceFound_static_0300', Size.SMALLTEST | TestType.FUNCTION | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName = 'testTelephonyNetManagerOnServiceFound_static_0300';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          let callback: () => void = () => {
            hilog.info(domain, tag, `${caseName}  on or off serviceFound  `);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
          let localServiceInfo = localServiceInfoTypeTcp();
          let discoveryService = mdns.createDiscoveryService(context!, serviceTypeTcp);
          discoveryService.onServiceFound(callback);
          discoveryService.offServiceFound(callback);
          let sleepAndDone = async (): Promise<void> => {
            try {
              await sleep(500);
              removeTheService(localServiceInfo);
              ExpectTrue(true);
              done();
            } catch (err) {
              hilog.info(domain, tag, `${caseName} catch err is ` + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          };
          mdns.addLocalService(context!, localServiceInfo, (err: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} addLocalService fail ${JSON.stringify(err)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} addLocalService success `);
              discoveryService.startSearchingMDNS();
              sleepAndDone();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch err is ` + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testTelephonyNetManagerOnServiceFound_static_0400
     * @tc.number SUB_Telephony_NetManager_on_serviceFound_0400
     * @tc.desc   Unsubscribe from notifications about MDNS service discovery.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyNetManagerOnServiceFound_static_0400', Size.SMALLTEST | TestType.FUNCTION | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName = 'testTelephonyNetManagerOnServiceFound_static_0400';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          let callback: () => void = () => {
            hilog.info(domain, tag, `${caseName}  on or off serviceFound  `);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
          let localServiceInfo = localServiceInfoTypeTcp();
          let discoveryService = mdns.createDiscoveryService(context!, serviceTypeTcp);
          discoveryService.onServiceFound((data: mdns.LocalServiceInfo) => {
            hilog.info(domain, tag, 'serviceFound', JSON.stringify(data));
            mdns.resolveLocalService(context!, data, (error: BusinessError | null, resolveData: mdns.LocalServiceInfo | undefined) => {
              hilog.info(domain, tag, 'serviceFound', JSON.stringify(resolveData) + JSON.stringify(error));
            });
          });
          discoveryService.offServiceFound(callback);
          let sleepAndDone = async (data: mdns.LocalServiceInfo | undefined): Promise<void> => {
            try {
              await sleep(500);
              removeTheService(localServiceInfo);
              ExpectTrue(data != null);
              done();
            } catch (err) {
              hilog.info(domain, tag, `${caseName} catch err is ` + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          };
          mdns.addLocalService(context!, localServiceInfo, (err: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} addLocalService fail ${JSON.stringify(err)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} addLocalService success `);
              discoveryService.startSearchingMDNS();
              sleepAndDone(data);
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch err is ` + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testTelephonyNetManagerOnServiceLost_static_0100
     * @tc.number SUB_Telephony_NetManager_on_serviceLost_0100
     * @tc.desc   Subscribe to the notification that the MDNS service is removed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyNetManagerOnServiceLost_static_0100', Size.SMALLTEST | TestType.FUNCTION | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName = 'testTelephonyNetManagerOnServiceLost_static_0100';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          let localServiceInfo = localServiceInfoTypeTcp();
          let discoveryService = mdns.createDiscoveryService(context!, serviceTypeTcp);
          discoveryService.onServiceLost((data: mdns.LocalServiceInfo) => {
            hilog.info(domain, tag, `${caseName} on serviceLost , data is ${JSON.stringify(data)}`);
            ExpectTrue(true);
            done();
          });
          let sleepAndStop = async (): Promise<void> => {
            try {
              await sleep(200);
              discoveryService.stopSearchingMDNS();
            } catch (err) {
              hilog.info(domain, tag, `${caseName} stopSearchingMDNS fail, ${JSON.stringify(err)}`);
            }
          };
          mdns.addLocalService(context!, localServiceInfo, (err: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} addLocalService fail ${JSON.stringify(err)}`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} addLocalService success `);
              discoveryService.startSearchingMDNS();
              sleepAndStop();
            }
          });
          await sleep(3000);
          removeTheService(localServiceInfo);
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch err is ` + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testTelephonyNetManagerOnServiceLost_static_0200
     * @tc.number SUB_Telephony_NetManager_on_serviceLost_0200
     * @tc.desc   Subscribe to the notification that the MDNS service is removed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyNetManagerOnServiceLost_static_0200', Size.SMALLTEST | TestType.FUNCTION | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName = 'testTelephonyNetManagerOnServiceLost_static_0200';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          let localServiceInfo = localServiceInfoTypeTcp();
          let discoveryService = mdns.createDiscoveryService(context!, serviceTypeUdp);
          discoveryService.onServiceLost((data: mdns.LocalServiceInfo) => {
            hilog.info(domain, tag, `${caseName} on serviceLost , data is ${JSON.stringify(data)}`);
            ExpectFail();
            done();
          });
          mdns.addLocalService(context!, localServiceInfo, (err: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} addLocalService fail ${JSON.stringify(err)}`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} addLocalService success `);
              discoveryService.startSearchingMDNS();
            }
          });
          removeTheService(localServiceInfo);
          await sleep(500);
          ExpectTrue(true);
          discoveryService.offServiceLost();
          done();
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch err is ` + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testTelephonyNetManagerOnServiceLost_static_0300
     * @tc.number SUB_Telephony_NetManager_on_serviceLost_0300
     * @tc.desc   This interface is used to unsubscribe from the notification that the MDNS service is removed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyNetManagerOnServiceLost_static_0300', Size.SMALLTEST | TestType.FUNCTION | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName = 'testTelephonyNetManagerOnServiceLost_static_0300';
        hilog.info(domain, tag, `${caseName} test start `);
        try {
          let callback: () => void = () => {
            hilog.info(domain, tag, `${caseName}  on or off serviceLost  `);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
          let localServiceInfo = localServiceInfoTypeTcp();
          let discoveryService = mdns.createDiscoveryService(context!, serviceTypeTcp);
          discoveryService.onServiceLost(callback);
          discoveryService.offServiceLost(callback);
          let sleepAndDone = async (): Promise<void> => {
            try {
              await sleep(500);
              ExpectTrue(true);
              done();
            } catch (err) {
              hilog.info(domain, tag, `${caseName} catch err is ` + JSON.stringify(err));
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          };
          mdns.addLocalService(context!, localServiceInfo, (err: BusinessError | null, data: mdns.LocalServiceInfo | undefined) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${caseName} addLocalService fail ${JSON.stringify(err)}`);
              ExpectFail();
              done();
            } else {
              hilog.info(domain, tag, `${caseName} addLocalService success `);
              discoveryService.startSearchingMDNS();
              removeTheService(localServiceInfo);
              sleepAndDone();
            }
          });
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch err is ` + JSON.stringify(err));
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

  });
}
