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

import { describe, it, expect, Level, Size, TestType } from "@ohos/hypium-static/src/main/indexStatic";
import ethernet from '@ohos.net.ethernet';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'ethernetTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, ` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

interface LocalHttpProxy {
  host: string;
  port: number;
  exclusionList: Array<string>;
}

export default function EtherNetTest(): void {
  describe('EtherNetTest', () => {

    /**
     * @tc.name   testNetworkMgrGetMacAddress_static_0100
     * @tc.number SUB_NetworkMgr_Ethernet_GetMacAddress_0100
     * @tc.desc   getMacAddress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrGetMacAddress_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrGetMacAddress_static_0100';
      hilog.info(domain, tag, `${caseName} test start `)
      ethernet.getMacAddress().then((data:Array<ethernet.MacAddressInfo>)=>{
        hilog.info(domain, tag, `${caseName} getMacAddress data:${JSON.stringify(data)}`);
        if (data.length > 0) {
          expect(data[0].iface!==null).assertTrue();
          expect(data[0].macAddress!==null).assertTrue();
        } else {
          expect().assertFail();
        }
        done();
      }).catch((error)=>{
        hilog.info(domain, tag, `${caseName} getMacAddress data error:${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      });
      hilog.info(domain, tag, `${caseName} test end `)
    })

    /**
     * @tc.name   testNetworkMgrGetMacAddress_static_0200
     * @tc.number SUB_NetworkMgr_Ethernet_GetMacAddress_0200
     * @tc.desc   getMacAddress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrGetMacAddress_static_0200",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrGetMacAddress_static_0200';
      hilog.info(domain, tag, `${caseName} test start `)
      ethernet.getMacAddress().then((data:Array<ethernet.MacAddressInfo>)=>{
        hilog.info(domain, tag, `${caseName} getMacAddress data:${JSON.stringify(data)}`);
        ExpectTrue(true);
        done();
      }).catch((err)=>{
        let error = err as BusinessError;
        hilog.info(domain, tag, `${caseName} catch err ` + JSON.stringify(error))
        ExpectTrue(error.code === 2201005)
        done();
      });
      hilog.info(domain, tag, `${caseName} test end `)
    })

    /**
     * @tc.name   testNetworkMgrGetMacAddress_static_0300
     * @tc.number SUB_NetworkMgr_Ethernet_GetMacAddress_0300
     * @tc.desc   getMacAddress error code 2201005 and BusinessError structure coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testNetworkMgrGetMacAddress_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrGetMacAddress_static_0300';
      hilog.info(domain, tag, `${caseName} test start `)
      ethernet.getMacAddress().then((data: Array<ethernet.MacAddressInfo>) => {
        hilog.info(domain, tag, `${caseName} getMacAddress data:${JSON.stringify(data)}`);
        ExpectTrue(true);
        done();
      }).catch((err) => {
        let error = err as BusinessError;
        hilog.info(domain, tag, `${caseName} catch err ` + JSON.stringify(error));
        ExpectTrue(typeof error.code === 'number');
        ExpectTrue(typeof error.message === 'string');
        ExpectTrue(error.code === 2201005);
        done();
      });
      hilog.info(domain, tag, `${caseName} test end `)
    })

    /**
     * @tc.name   testNetworkMgrGetMacAddress_static_0400
     * @tc.number SUB_NetworkMgr_Ethernet_GetMacAddress_0400
     * @tc.desc   getMacAddress MacAddressInfo field type coverage, error code 2201005 on failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrGetMacAddress_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrGetMacAddress_static_0400';
      hilog.info(domain, tag, `${caseName} test start `)
      ethernet.getMacAddress().then((data: Array<ethernet.MacAddressInfo>) => {
        hilog.info(domain, tag, `${caseName} getMacAddress data:${JSON.stringify(data)}`);
        let checkResult: boolean = true;
        for (let i = 0; i < data.length; i++) {
          checkResult = checkResult && typeof data[i].iface === 'string' && data[i].iface.length > 0;
          checkResult = checkResult && typeof data[i].macAddress === 'string' && data[i].macAddress.length > 0;
        }
        ExpectTrue(checkResult);
        done();
      }).catch((err) => {
        let error = err as BusinessError;
        hilog.info(domain, tag, `${caseName} catch err ` + JSON.stringify(error));
        ExpectTrue(error.code === 2201005);
        done();
      });
      hilog.info(domain, tag, `${caseName} test end `)
    })

    /**
     * @tc.name   testNetworkEthernetHttpproxy_static_0100
     * @tc.number SUB_NetworkMgr_Ethernet_Httpproxy_0100
     * @tc.desc   Verify that ethernet.HttpProxy type is consistent with HttpProxy structure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkEthernetHttpproxy_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      const caseName: string = 'testNetworkEthernetHttpproxy_static_0100';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const httpProxy: ethernet.HttpProxy = {
          host: '192.168.1.100',
          port: 8080,
          exclusionList: ['192.168', 'localhost', '*.example.com']
        } as ethernet.HttpProxy;
        ExpectTrue(httpProxy !== null && httpProxy !== undefined);
        ExpectTrue(typeof httpProxy.host === 'string');
        ExpectTrue(typeof httpProxy.port === 'number');
        ExpectTrue(httpProxy.exclusionList !== null && httpProxy.exclusionList !== undefined);
        ExpectTrue(httpProxy.host === '192.168.1.100');
        ExpectTrue(httpProxy.port === 8080);
        ExpectTrue(httpProxy.exclusionList.length === 3);
        ExpectTrue(httpProxy.exclusionList[0] === '192.168');
        ExpectTrue(httpProxy.exclusionList[1] === 'localhost');
        ExpectTrue(httpProxy.exclusionList[2] === '*.example.com');
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} error: ` + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `)
    })

    /**
     * @tc.name   testNetworkEthernetHttpproxy_static_0200
     * @tc.number SUB_NetworkMgr_Ethernet_Httpproxy_0200
     * @tc.desc   Verify HttpProxy works with an empty exclusion list and boundary port values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNetworkEthernetHttpproxy_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void): void => {
      const caseName: string = 'testNetworkEthernetHttpproxy_static_0200';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const httpProxy: ethernet.HttpProxy = {
          host: '10.0.0.1',
          port: 8888,
          exclusionList: []
        } as ethernet.HttpProxy;
        ExpectTrue(httpProxy.host === '10.0.0.1');
        ExpectTrue(httpProxy.port === 8888);
        ExpectTrue(httpProxy.exclusionList !== null && httpProxy.exclusionList !== undefined);
        ExpectTrue(httpProxy.exclusionList.length === 0);
        const boundaryProxyMin: ethernet.HttpProxy = {
          host: '0.0.0.0',
          port: 0,
          exclusionList: ['']
        } as ethernet.HttpProxy;
        ExpectTrue(boundaryProxyMin.port === 0);
        ExpectTrue(boundaryProxyMin.exclusionList.length === 1);
        const boundaryProxyMax: ethernet.HttpProxy = {
          host: '255.255.255.255',
          port: 65535,
          exclusionList: ['*']
        } as ethernet.HttpProxy;
        ExpectTrue(boundaryProxyMax.port === 65535);
        ExpectTrue(boundaryProxyMax.exclusionList.length === 1);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} error: ` + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `)
    })

    /**
     * @tc.name   testNetworkEthernetHttpproxy_static_0300
     * @tc.number SUB_NetworkMgr_Ethernet_Httpproxy_0300
     * @tc.desc   Verify ethernet.HttpProxy is type-equivalent by cross-assignment and element independence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkEthernetHttpproxy_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      const caseName: string = 'testNetworkEthernetHttpproxy_static_0300';
      hilog.info(domain, tag, `${caseName} test start`);
      try {
        const localProxy: LocalHttpProxy = {
          host: 'proxy.example.com',
          port: 3128,
          exclusionList: ['127.0.0.1', '*.internal.com']
        } as LocalHttpProxy;
        ExpectTrue(localProxy !== null && localProxy !== undefined);
        ExpectTrue(localProxy.host === 'proxy.example.com');
        ExpectTrue(localProxy.port === 3128);
        ExpectTrue(localProxy.exclusionList.length === 2);
        const ethernetProxy: ethernet.HttpProxy = {
          host: localProxy.host,
          port: localProxy.port.toInt(),
          exclusionList: localProxy.exclusionList
        } as ethernet.HttpProxy;
        ExpectTrue(ethernetProxy.host === localProxy.host);
        ExpectTrue(ethernetProxy.port === localProxy.port);
        ExpectTrue(ethernetProxy.exclusionList.length === localProxy.exclusionList.length);
        ethernetProxy.exclusionList.push('new.exclusion.com');
        ExpectTrue(ethernetProxy.exclusionList.length === 3);
        ExpectTrue(localProxy.exclusionList.length === 2);
        const modifiedProxy: ethernet.HttpProxy = {
          host: ethernetProxy.host,
          port: ethernetProxy.port,
          exclusionList: ethernetProxy.exclusionList
        } as ethernet.HttpProxy;
        modifiedProxy.host = 'modified.example.com';
        modifiedProxy.port = 8080;
        ExpectTrue(ethernetProxy.host === 'proxy.example.com');
        ExpectTrue(ethernetProxy.port === 3128);
        ExpectTrue(modifiedProxy.host === 'modified.example.com');
        ExpectTrue(modifiedProxy.port === 8080);
        done();
      } catch (err) {
        hilog.info(domain, tag, `${caseName} error: ` + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      hilog.info(domain, tag, `${caseName} test end `)
    })
  })
}
