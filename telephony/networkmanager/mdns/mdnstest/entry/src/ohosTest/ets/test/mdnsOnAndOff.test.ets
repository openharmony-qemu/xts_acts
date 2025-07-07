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

import { describe, expect, it, beforeAll, Size, Level, TestType, beforeEach, afterEach } from '@ohos/hypium';
import mdns from '@ohos.net.mdns';

let context = AppStorage.get('context') as Context;
let address: string = "202.101.172.35";
let getName:()=>string=()=>{
  return "test"+ (Math.random()*1000).toFixed(0)+(Math.random()*5000).toFixed(0)+(Math.random()*8000).toFixed(0)
}
let localServiceInfoTypeTcp:()=> mdns.LocalServiceInfo =()=> {
  let localServiceInfoType : mdns.LocalServiceInfo;
  localServiceInfoType = {
    serviceType: serviceTypeTcp,
    serviceName: getName(),
    port: 8081,
    host: {
      address: address,
    },
    serviceAttribute: []
  }
  return localServiceInfoType
}
let ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}
let ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(` exportFail failed err: ${JSON.stringify(err)}`);
  }
};
let serviceTypeTcp= "_print._tcp";
let serviceTypeUdp= "_print._udp";


function sleep (time:number):Promise<string>{
  return new Promise<string>((resolve)=>{
    setTimeout(()=>{
      resolve('ok')},time)
  });
}

export default function NetworkManagerMdnsTest() {

  describe('NetworkManagerMdnsTest',  () => {
    beforeAll(async () => {
      console.log('NetworkManagerMdnsTest beforeAll start.');
      if(context == undefined){
        context = getContext() as Context
      }
      console.log("context====", JSON.stringify(context))
    });

    afterEach(async ()=>{
      await sleep(500);
    });


    /**
     * @tc.number:SUB_Telephony_NetManager_startSearchingMDNS_0100
     * @tc.name  : testTelephonyNetManagerStartSearchingMDNS0100
     * @tc.desc  : Subscribing to the Notification of Enabling the mDNS Service Listening Function
     * @tc.size  : SMALLTEST
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyNetManagerStartSearchingMDNS0100', Size.SMALLTEST | TestType.FUNCTION | Level.LEVEL3 , async (done: Function) => {
      let caseName = 'testTelephonyNetManagerStartSearchingMDNS0100';
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo = localServiceInfoTypeTcp();
        let discoveryService = mdns.createDiscoveryService(context , serviceTypeTcp);
        discoveryService.on("discoveryStart", ()=>{
          console.log(`${caseName} on discoveryStart : startSearching `);
          ExpectTrue(true);
          discoveryService.off("discoveryStart");
          discoveryService.stopSearchingMDNS();
          mdns.removeLocalService(context , localServiceInfo, (err, data: mdns.LocalServiceInfo) => {
            if (err) {
              console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.log(`${caseName} removeLocalService success data is :${JSON.stringify(data)} `);
              done();
              console.info(`${caseName}---End`);
            }
          });
        });
        mdns.addLocalService(context , localServiceInfo, async (err, data) => {
          if (err) {
            console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} addLocalService success, LocalServiceInfo is `+JSON.stringify(data));
            discoveryService.startSearchingMDNS();
          }
        });
      }catch (err) {
        console.info(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number SUB_Telephony_NetManager_stopSearchingMDNS_0100
     * @tc.name  : testTelephonyNetManagerStopSearchingMDNS0100
     * @tc.desc Function test
     * @tc.size  : SMALLTEST
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyNetManagerStopSearchingMDNS0100', Size.SMALLTEST | TestType.FUNCTION| Level.LEVEL3 , async  (done: Function) => {
      let caseName = 'testTelephonyNetManagerStopSearchingMDNS0100';
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo = localServiceInfoTypeTcp();
        let discoveryService = mdns.createDiscoveryService(context , serviceTypeTcp);
        discoveryService.on("discoveryStop", ()=>{
          console.log(`${caseName} on discoveryStop : stopSearchingMDNS`);
          ExpectTrue(true);
          mdns.removeLocalService(context , localServiceInfo, (err, data) => {
            if (err) {
              console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.log(`${caseName} removeLocalService success data is :${JSON.stringify(data)} `);
              discoveryService.off("discoveryStop");
              console.info(`${caseName}---End`);
              done();
            }
          });
        });
        mdns.addLocalService(context , localServiceInfo, async (err, data) => {
          if (err) {
            console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} addLocalService success `);
            discoveryService.startSearchingMDNS();
            discoveryService.stopSearchingMDNS();
          }
        });
      }catch (err) {
        console.info(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number SUB_Telephony_NetManager_on_serviceFound_0100
     * @tc.name testTelephonyNetManagerOnServiceFound0100
     * @tc.desc Function test
     * @tc.size  : SMALLTEST
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyNetManagerOnServiceFound0100', Size.SMALLTEST | TestType.FUNCTION| Level.LEVEL3 , async  (done: Function) => {
      let caseName = 'testTelephonyNetManagerOnServiceFound0100';
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo = localServiceInfoTypeTcp();
        let discoveryService = mdns.createDiscoveryService(context , serviceTypeTcp);
        discoveryService.on("serviceFound", (data: mdns.LocalServiceInfo)=>{
          console.log(`${caseName} on serviceFound , data is ${JSON.stringify(data)}`);
          ExpectTrue(true);
          discoveryService.stopSearchingMDNS();
          mdns.removeLocalService(context , localServiceInfo, (err, data) => {
            if (err) {
              console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
              ExpectFail();
              console.info(`${caseName}---End`);
              done();
            } else {
              console.log(`${caseName} removeLocalService success data is :${JSON.stringify(data)} `);
              done();
              console.info(`${caseName}---End`);
            }
          });
        });
        mdns.addLocalService(context , localServiceInfo, async (err, data) => {
          if (err) {
            console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} addLocalService success `);
            discoveryService.startSearchingMDNS();
          }
        });
      }catch (err) {
        console.info(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }


    });

    /**
     * @tc.number SUB_Telephony_NetManager_on_serviceFound_0200
     * @tc.name testTelephonyNetManagerOnServiceFound0200
     * @tc.desc Function test
     * @tc.size  : SMALLTEST
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyNetManagerOnServiceFound0200', Size.SMALLTEST | TestType.FUNCTION| Level.LEVEL3 , async  (done: Function) => {
      let caseName = 'testTelephonyNetManagerOnServiceFound0200';
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo = localServiceInfoTypeTcp();
        let discoveryService = mdns.createDiscoveryService(context , serviceTypeUdp);
        discoveryService.on("serviceFound", (data: mdns.LocalServiceInfo)=>{
          console.log(`${caseName} on serviceFound , data is ${JSON.stringify(data)}`);
          ExpectFail();
          done();
        });
        mdns.addLocalService(context , localServiceInfo, async (err, data) => {
          if (err) {
            console.log(`${caseName} add LocalService fail ${JSON.stringify(err)}`);
            ExpectFail();
            console.info(`${caseName}---End`);
            done();
          } else {
            console.log(`${caseName} add LocalService success `);
            discoveryService.startSearchingMDNS();
            await sleep(1000);
            ExpectTrue(true);
            discoveryService.stopSearchingMDNS();
            mdns.removeLocalService(context , localServiceInfo, (err, data) => {
              if (err) {
                console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                ExpectFail();
                console.info(`${caseName}---End`);
                done();
              } else {
                console.log(`${caseName} removeLocalService success data is :${JSON.stringify(data)} `);
                done();
                console.info(`${caseName}---End`);
              }
            });
          }
        });
      }catch (err) {
        console.info(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number SUB_Telephony_NetManager_on_serviceLost_0100
     * @tc.name testTelephonyNetManagerOnServiceLost0100
     * @tc.desc Function test
     * @tc.size  : SMALLTEST
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyNetManagerOnServiceLost0100', Size.SMALLTEST | TestType.FUNCTION| Level.LEVEL3 , async  (done: Function) => {
      let caseName = 'testTelephonyNetManagerOnServiceLost0100';
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo = localServiceInfoTypeTcp();
        let discoveryService = mdns.createDiscoveryService(context , serviceTypeTcp);
        discoveryService.on("serviceLost", (data: mdns.LocalServiceInfo)=>{
          console.log(`${caseName} on serviceLost , data is ${JSON.stringify(data)}`);
          ExpectTrue(true);
          done();
        });
        mdns.addLocalService(context , localServiceInfo, async (err, data) => {
          if (err) {
            console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addLocalService success `);
            discoveryService.startSearchingMDNS();
            mdns.removeLocalService(context , localServiceInfo, (err, data) => {
              if (err) {
                console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                ExpectFail();
              } else {
                console.log(`${caseName} removeLocalService success data is :${JSON.stringify(data)} `);
              }
            });
          }
        });
      }catch (err) {
        console.info(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number SUB_Telephony_NetManager_on_serviceLost_0200
     * @tc.name testTelephonyNetManagerOnServiceLost0200
     * @tc.desc Function test
     * @tc.size  : SMALLTEST
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('testTelephonyNetManagerOnServiceLost0200', Size.SMALLTEST | TestType.FUNCTION| Level.LEVEL3 , async  (done: Function) => {
      let caseName = 'testTelephonyNetManagerOnServiceLost0200';
      console.info(`${caseName} test start `);
      try {
        let localServiceInfo = localServiceInfoTypeTcp();
        let discoveryService = mdns.createDiscoveryService(context , serviceTypeUdp);
        discoveryService.on("serviceLost", (data: mdns.LocalServiceInfo)=>{
          console.log(`${caseName} on serviceLost , data is ${JSON.stringify(data)}`);
          ExpectFail();
          done();
        });
        mdns.addLocalService(context , localServiceInfo, async (err, data) => {
          if (err) {
            console.log(`${caseName} addLocalService fail ${JSON.stringify(err)}`);
            ExpectFail();
            done();
          } else {
            console.log(`${caseName} addLocalService success `);
            discoveryService.startSearchingMDNS();
            mdns.removeLocalService(context , localServiceInfo, async (err, data) => {
              if (err) {
                console.log(`${caseName} removeLocalService fail ${JSON.stringify(err)}`);
                ExpectFail();
                done();
              } else {
                console.log(`${caseName} removeLocalService success data is :${JSON.stringify(data)} `);
                await sleep(1000);
                ExpectTrue(true);
                done();
              }
            });
          }
        });
      }catch (err) {
        console.info(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.number SUB_Telephony_NetManager_MdnsError_0100
     * @tc.name Test MdnsError enum
     * @tc.desc  Function test
     * @tc.size  : SMALLTEST
     * @tc.type  : Function
     * @tc.level : level 3
     */
    it('SUB_Telephony_NetManager_MdnsError_0100', Size.SMALLTEST | TestType.FUNCTION| Level.LEVEL3 , async  (done: Function) => {
      let caseName = 'SUB_Telephony_NetManager_MdnsError_0100';
      console.info(`${caseName} test start `);
      try {
        ExpectTrue(mdns.MdnsError.INTERNAL_ERROR == 0);
        ExpectTrue(mdns.MdnsError.ALREADY_ACTIVE == 1);
        ExpectTrue(mdns.MdnsError.MAX_LIMIT == 2);
        console.info(caseName + "test finish!");
        done();
      }catch (err) {
        console.info(`${caseName} catch err is `+JSON.stringify(err));
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      }
    });

  });
}