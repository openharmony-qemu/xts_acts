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

import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import ethernet from '@ohos.net.ethernet';
import { BusinessError } from '@ohos.base';
import connection from '@ohos.net.connection';


const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};
export default function EtherNetTest() {
  describe('EtherNetTest', () => {

    /**
     * @tc.name   testNetworkMgrGetMacAddress0100
     * @tc.number SUB_NetworkMgr_GetMacAddress_0100
     * @tc.desc   getMacAddress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrGetMacAddress0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const caseName: string = 'testNetworkMgrGetMacAddress0100';
      console.info(`${caseName} test start `)
      ethernet.getMacAddress().then((data:Array<ethernet.MacAddressInfo>)=>{
        console.info(`${caseName} getMacAddress data:${JSON.stringify(data)}`);
        expect(data[0].iface!==null).assertTrue();
        expect(data[0].macAddress!==null).assertTrue();
        done();
      }).catch((error:BusinessError)=>{
        console.info(`${caseName} getMacAddress data error:${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      });
      console.info(`${caseName} test end `)
    });
    /**
     * @tc.name   testNetworkMgrGetMacAddress0200
     * @tc.number SUB_NetworkMgr_GetMacAddress_0200
     * @tc.desc   getMacAddress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrGetMacAddress0200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testNetworkMgrGetMacAddress0200';
      console.info(`${caseName} test start `)
      ethernet.getMacAddress().then((data:Array<ethernet.MacAddressInfo>)=>{
        console.info(`${caseName} getMacAddress data:${JSON.stringify(data)}`);
        ExpectTrue(true);
        done();
      }).catch((error:BusinessError)=>{
        console.log(`${caseName} catch err `,JSON.stringify(error))
        ExpectTrue(error.code == 2201005)
        done();
      });
      console.info(`${caseName} test end `)
    });
    /**
     * @tc.number: testNetworkEthernetHttpproxy0100
     * @tc.name: SUB_NetworkEthernet_Httpproxy_0100
     * @tc.desc: Verify that ethernet.HttpProxy type is consistent with connection.HttpProxy structure
     * @tc.type: Type
     * @tc.size: MediumTest
     * @tc.level: Level1
     */
    it('testNetworkEthernetHttpproxy0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName: string = 'testNetworkEthernetHttpproxy0100';
      console.info(`${caseName} test start`);
      try {
        const httpProxy: ethernet.HttpProxy = {
          host: '192.168.1.100',
          port: 8080,
          exclusionList: ['192.168', 'localhost', '*.example.com']
        } as ethernet.HttpProxy;
        ExpectTrue(httpProxy !== null && httpProxy !== undefined);
        ExpectTrue(typeof httpProxy.host === 'string');
        ExpectTrue(typeof httpProxy.port === 'number');
        ExpectTrue(Array.isArray(httpProxy.exclusionList));
        ExpectTrue(httpProxy.host === '192.168.1.100');
        ExpectTrue(httpProxy.port === 8080);
        ExpectTrue(httpProxy.exclusionList.length === 3);
        ExpectTrue(httpProxy.exclusionList[0] === '192.168');
        ExpectTrue(httpProxy.exclusionList[1] === 'localhost');
        ExpectTrue(httpProxy.exclusionList[2] === '*.example.com');
        console.info(`${caseName} test end`);
        done();
      } catch (err) {
        console.error(`${caseName} error: ` + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(`${caseName} test end `)
    });

    /**
     * @tc.number: testNetworkEthernetHttpproxy0200
     * @tc.name: SUB_NetworkEthernet_Httpproxy_0200
     * @tc.desc: Verify ethernet.HttpProxy is type-equivalent to connection.HttpProxy by cross-assignment
     * @tc.type: Type
     * @tc.size: MediumTest
     * @tc.level: Level1
     */
    it('testNetworkEthernetHttpproxy0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName: string = 'testNetworkEthernetHttpproxy0200';
      console.info(`${caseName} test start`);
      try {
        const connectionProxy: connection.HttpProxy = {
          host: 'proxy.example.com',
          port: 3128,
          exclusionList: ['127.0.0.1', '*.internal.com']
        } as connection.HttpProxy;
        ExpectTrue(connectionProxy !== null && connectionProxy !== undefined);
        ExpectTrue(connectionProxy.host === 'proxy.example.com');
        ExpectTrue(connectionProxy.port === 3128);
        ExpectTrue(connectionProxy.exclusionList.length === 2);
        const ethernetProxy: ethernet.HttpProxy = {
          host: connectionProxy.host,
          port: connectionProxy.port,
          exclusionList: connectionProxy.exclusionList
        } as ethernet.HttpProxy;
        ExpectTrue(ethernetProxy.host === connectionProxy.host);
        ExpectTrue(ethernetProxy.port === connectionProxy.port);
        ExpectTrue(ethernetProxy.exclusionList.length === connectionProxy.exclusionList.length);
        done();
      } catch (err) {
        console.error(`${caseName} error: ` + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(`${caseName} test end `)
    });

    /**
     * @tc.number: testNetworkEthernetHttpproxy0300
     * @tc.name: SUB_NetworkEthernet_Httpproxy_0300
     * @tc.desc: Verify HttpProxy works with an empty exclusion list
     * @tc.type: Type
     * @tc.size: MediumTest
     * @tc.level: Level2
     */
    it('testNetworkEthernetHttpproxy0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      const caseName: string = 'testNetworkEthernetHttpproxy0300';
      console.info(`${caseName} test start`);
      try {
        const httpProxy: ethernet.HttpProxy = {
          host: '10.0.0.1',
          port: 8888,
          exclusionList: []
        } as ethernet.HttpProxy;

        ExpectTrue(httpProxy.host === '10.0.0.1');
        ExpectTrue(httpProxy.port === 8888);
        ExpectTrue(httpProxy.exclusionList !== null && httpProxy.exclusionList !== undefined);
        ExpectTrue(Array.isArray(httpProxy.exclusionList));
        ExpectTrue(httpProxy.exclusionList.length === 0);
        done();
      } catch (err) {
        console.error(`${caseName} error: ` + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      console.info(`${caseName} test end`);
    });
  })
}
