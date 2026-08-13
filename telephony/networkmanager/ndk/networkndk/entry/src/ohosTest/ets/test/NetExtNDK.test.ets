/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import ncAPI from 'libtestNetExtNdk.so'
import { clickRequestPermission, unClickRequestPermission } from './ClickRequestPermission.test'
import type {
  EthernetMacAddressInfo,
  EthernetMacAddrInfoList,
  EthernetNetAddr,
  EthernetNetAddrInfo,
  EthernetNetAddrInfoList
} from 'libtestNetExtNdk.so'



export default function NetExtNDKTest() {

  describe('NetExtNDKTest', () => {
    beforeEach(async () => {
      await clickRequestPermission();
    });

    /**
     * @tc.number : SUB_NETWORK_OHEthGetNetAddress_0100
     * @tc.name   ：testOHEthGetNetAddress_0100
     * @tc.desc   ：GetNetAddress.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEthGetNetAddress_0100', 0, async (done: Function) => {
      console.info(`testOHEthGetNetAddress_0100 start`);
      let re: EthernetNetAddrInfoList = ncAPI.OHEthGetNetAddress() as EthernetNetAddrInfoList;
      console.info(`testOHEthGetNetAddress_0100 result ${re}`);
      expect(re.status === 0 || re.status === 201).assertTrue();
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_OHEthGetMacAddress_0100
     * @tc.name   ：testOHEthGetMacAddress_0100
     * @tc.desc   ：GetMacAddress.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEthGetMacAddress_0100', 0, async (done: Function) => {
      console.info(`testOHEthGetMacAddress_0100 start`);
      let re: EthernetMacAddrInfoList = ncAPI.OHEthGetMacAddress() as EthernetMacAddrInfoList;
      console.info(`testOHEthGetMacAddress_0100 result ${re}`);
      expect(re.status === 0 || re.status === 201).assertTrue();
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_ETHERNET_OHEthGetMacAddress_NetAddress_0100
     * @tc.name   : testOHEthGetMacAddress_NetAddress_0100
     * @tc.desc   : Test OH_Ethernet_GetMacAddress and OH_Ethernet_GetNetAddress together.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEthGetMacAddress_NetAddress_0100', 0, async (done: Function) => {
      console.info(`testOHEthGetMacAddress_NetAddress_0100 start`);
      let reMac: EthernetMacAddrInfoList = ncAPI.OHEthGetMacAddress();
      console.info(`testOHEthGetMacAddress_NetAddress_0100 mac result ${reMac}`);
      let reNet: EthernetNetAddrInfoList = ncAPI.OHEthGetNetAddress();
      console.info(`testOHEthGetMacAddress_NetAddress_0100 net result ${reNet}`);
      expect(reMac.status === 0 || reMac.status === 201).assertTrue();
      expect(reNet.status).assertEqual(0);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_ETHERNET_OHEthGetNetAddress_MacAddress_0100
     * @tc.name   : testOHEthGetNetAddress_MacAddress_0100
     * @tc.desc   : Test OH_Ethernet_GetNetAddress and OH_Ethernet_GetMacAddress together in reverse order.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEthGetNetAddress_MacAddress_0100', 0, async (done: Function) => {
      console.info(`testOHEthGetNetAddress_MacAddress_0100 start`);
      let reNet: EthernetNetAddrInfoList = ncAPI.OHEthGetNetAddress()
      console.info(`testOHEthGetNetAddress_MacAddress_0100 net result ${reNet}`);
      let reMac: EthernetMacAddrInfoList = ncAPI.OHEthGetMacAddress()
      console.info(`testOHEthGetNetAddress_MacAddress_0100 mac result ${reMac}`);
      expect(reNet.status).assertEqual(0);
      expect(reMac.status === 0 || reMac.status === 201).assertTrue();
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_ETHERNET_OHEthGetAllInterfaceInfo_0100
     * @tc.name   : testOHEthGetAllInterfaceInfo_0100
     * @tc.desc   : Test OH_Ethernet_GetMacAddress and OH_Ethernet_GetNetAddress in sequence.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEthGetAllInterfaceInfo_0100', 0, async (done: Function) => {
      console.info(`testOHEthGetAllInterfaceInfo_0100 start`);
      let re1: EthernetNetAddrInfoList = ncAPI.OHEthGetNetAddress() as EthernetNetAddrInfoList;
      let re2: EthernetMacAddrInfoList = ncAPI.OHEthGetMacAddress() as EthernetMacAddrInfoList;
      let re3: EthernetNetAddrInfoList = ncAPI.OHEthGetNetAddress() as EthernetNetAddrInfoList;
      let re4: EthernetMacAddrInfoList = ncAPI.OHEthGetMacAddress() as EthernetMacAddrInfoList;
      console.info(`testOHEthGetAllInterfaceInfo_0100 result re1.status=${re1.status}, re2.status=${re2.status}, re3.status=${re3.status}, re4.status=${re4.status}`);
      expect(re1.status).assertEqual(0);
      console.info(`OHEthGetMacAddress status: re2=${re2.status}, re4=${re4.status}`);
      if (re2.status !== 0 && re2.status !== 201) {
        console.error(`Unexpected status for OHEthGetMacAddress: ${re2.status}`);
      }
      expect(re2.status === 0 || re2.status === 201).assertTrue();
      if (re3.status !== 0 && re3.status !== 201) {
        console.error(`Unexpected status for second OHEthGetNetAddress: ${re3.status}`);
      }
      expect(re3.status === 0 || re3.status === 201).assertTrue();
      if (re4.status !== 0 && re4.status !== 201) {
        console.error(`Unexpected status for OHEthGetMacAddress: ${re4.status}`);
      }
      expect(re4.status === 0 || re4.status === 201).assertTrue();
      done();
    });



    /**
     * @tc.number : SUB_NETWORK_OHEthGetMacAddress_ErrorCode_0200
     * @tc.name   : testOHEthGetMacAddress_ErrorCode_0200
     * @tc.desc   : Test OH_Ethernet_GetMacAddress error code 2200001
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHEthGetMacAddress_ErrorCode_0200', 0, async (done: Function) => {
      console.info(`testOHEthGetMacAddress_ErrorCode_0200 start`);
      let re: EthernetMacAddrInfoList = ncAPI.OHEthGetMacAddress() as EthernetMacAddrInfoList;
      console.info(`testOHEthGetMacAddress_ErrorCode_0200 result ${re}`);
      expect(re.status === 2200001).assertTrue();
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_OHEthGetNetAddress_ErrorCode_0200
     * @tc.name   : testOHEthGetNetAddress_ErrorCode_0200
     * @tc.desc   : Test OH_Ethernet_GetNetAddress error code 2200001
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHEthGetNetAddress_ErrorCode_0200', 0, async (done: Function) => {
      console.info(`testOHEthGetNetAddress_ErrorCode_0200 start`);
      let re: EthernetNetAddrInfoList = ncAPI.OHEthGetNetAddress() as EthernetNetAddrInfoList;
      console.info(`testOHEthGetNetAddress_ErrorCode_0200 result ${re}`);
      expect(re.status === 2200001).assertTrue();
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_OHEthGetMacAddress_ErrorCode_0300
     * @tc.name   : testOHEthGetMacAddress_ErrorCode_0300
     * @tc.desc   : Test OH_Ethernet_GetMacAddress error code 2200002
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHEthGetMacAddress_ErrorCode_0300', 0, async (done: Function) => {
      console.info(`testOHEthGetMacAddress_ErrorCode_0300 start`);
      let re: EthernetMacAddrInfoList = ncAPI.OHEthGetMacAddress() as EthernetMacAddrInfoList;
      console.info(`testOHEthGetMacAddress_ErrorCode_0300 result ${re}`);
      expect(re.status === 2200002).assertTrue();
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_OHEthGetNetAddress_ErrorCode_0300
     * @tc.name   : testOHEthGetNetAddress_ErrorCode_0300
     * @tc.desc   : Test OH_Ethernet_GetNetAddress error code 2200002
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHEthGetNetAddress_ErrorCode_0300', 0, async (done: Function) => {
      console.info(`testOHEthGetNetAddress_ErrorCode_0300 start`);
      let re: EthernetNetAddrInfoList = ncAPI.OHEthGetNetAddress() as EthernetNetAddrInfoList;
      console.info(`testOHEthGetNetAddress_ErrorCode_0300 result ${re}`);
      expect(re.status === 2200002).assertTrue();
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_OHEthGetMacAddress_ErrorCode_0400
     * @tc.name   : testOHEthGetMacAddress_ErrorCode_0400
     * @tc.desc   : Test OH_Ethernet_GetMacAddress error code 2201005
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHEthGetMacAddress_ErrorCode_0400', 0, async (done: Function) => {
      console.info(`testOHEthGetMacAddress_ErrorCode_0400 start`);
      let re: EthernetMacAddrInfoList = ncAPI.OHEthGetMacAddress() as EthernetMacAddrInfoList;
      console.info(`testOHEthGetMacAddress_ErrorCode_0400 result ${re}`);
      expect(re.status === 2201005).assertTrue();
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_OHEthGetNetAddress_ErrorCode_0400
     * @tc.name   : testOHEthGetNetAddress_ErrorCode_0400
     * @tc.desc   : Test OH_Ethernet_GetNetAddress error code 2201005
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testOHEthGetNetAddress_ErrorCode_0400', 0, async (done: Function) => {
      console.info(`testOHEthGetNetAddress_ErrorCode_0400 start`);
      let re: EthernetNetAddrInfoList = ncAPI.OHEthGetNetAddress() as EthernetNetAddrInfoList;
      console.info(`testOHEthGetNetAddress_ErrorCode_0400 result ${re}`);
      expect(re.status === 2201005).assertTrue();
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_OHEthGetMacAddress_0100
     * @tc.name   : testOHEthGetMacAddress_0200
     * @tc.desc   : Test OH_Ethernet_GetMacAddress with all fields assertion
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEthGetMacAddress_0200', 0, async (done: Function) => {
      console.info(`testOHEthGetMacAddress_0200 start`);
      let result: EthernetMacAddrInfoList = ncAPI.OHEthGetMacAddress() as EthernetMacAddrInfoList;
      console.info(`testOHEthGetMacAddress_0200 result ${JSON.stringify(result)}`);
      expect(result !== null && result !== undefined).assertTrue();
      expect(result.status === 0 || result.status === 201).assertTrue();
      expect(result.macInfoListSize).assertInstanceOf('Number');
      expect(result.macInfoListSize >= 0).assertTrue();
      expect(result.macInfoListSize <= 32).assertTrue();
      if (result.status === 0) {
        expect(result.macInfoListSize).assertLarger(0);
      }
      expect(result.macInfoList).assertInstanceOf('Array');
      expect(result.macInfoList.length).assertEqual(result.macInfoListSize);
      for (let i = 0; i < result.macInfoListSize; i++) {
        expect(result.macInfoList[i] !== null && result.macInfoList[i] !== undefined).assertTrue();
      }
      for (let i = 0; i < result.macInfoListSize; i++) {
        let macInfo: EthernetMacAddressInfo = result.macInfoList[i];
        expect(macInfo !== null && macInfo !== undefined).assertTrue();
        console.info(`Ethernet_MacAddressInfo[${i}]: ifaceName=${macInfo.ifaceName}, macAddr=${macInfo.macAddr}`);
        expect(macInfo.ifaceName).assertInstanceOf('String');
        expect(macInfo.ifaceName.length).assertLarger(0);
        expect(macInfo.ifaceName.length <= 256).assertTrue();
        expect(macInfo.macAddr).assertInstanceOf('String');
        expect(macInfo.macAddr.length).assertLarger(0);
        expect(macInfo.macAddr.length <= 256).assertTrue();
        let macRegex: RegExp = /^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$/;
        expect(macRegex.test(macInfo.macAddr)).assertTrue();
      }

      done();
    });

    /**
     * @tc.number : SUB_NETWORK_OHEthGetNetAddress_0100
     * @tc.name   : testOHEthGetNetAddress_0200
     * @tc.desc   : Test OH_Ethernet_GetNetAddress with all fields assertion
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('testOHEthGetNetAddress_0200', 0, async (done: Function) => {
      console.info(`testOHEthGetNetAddress_0200 start`);
      let result: EthernetNetAddrInfoList = ncAPI.OHEthGetNetAddress() as EthernetNetAddrInfoList;
      console.info(`testOHEthGetNetAddress_0200 result ${JSON.stringify(result)}`);
      expect(result !== null && result !== undefined).assertTrue();
      expect(result.status === 0 || result.status === 201).assertTrue();
      expect(result.netAddrListSize).assertInstanceOf('Number');
      expect(result.netAddrListSize).assertLarger(0);
      expect(result.netAddrList).assertInstanceOf('Array');
      expect(result.netAddrList.length).assertEqual(result.netAddrListSize);
      for (let i = 0; i < result.netAddrListSize; i++) {
        let netAddrInfo: EthernetNetAddrInfo = result.netAddrList[i];
        expect(netAddrInfo !== null && netAddrInfo !== undefined).assertTrue();
        expect(netAddrInfo.ifaceName).assertInstanceOf('String');
        expect(netAddrInfo.ifaceName.length).assertLarger(0);
        console.info(`Ethernet_NetAddrInfo[${i}].ifaceName: ${netAddrInfo.ifaceName}`);
        expect(netAddrInfo.netAddrInfoSize).assertInstanceOf('Number');
        expect(netAddrInfo.netAddrInfoSize).assertLarger(0);
        expect(netAddrInfo.netAddrInfo).assertInstanceOf('Array');
        expect(netAddrInfo.netAddrInfo.length).assertEqual(netAddrInfo.netAddrInfoSize);
        for (let j = 0; j < netAddrInfo.netAddrInfoSize; j++) {
          let netAddr: EthernetNetAddr = netAddrInfo.netAddrInfo[j];
          expect(netAddr !== null && netAddr !== undefined).assertTrue();
          expect(netAddr.family).assertInstanceOf('Number');
          console.info(`Ethernet_NetAddr[${i}][${j}].family: ${netAddr.family}`);
          expect(netAddr.prefixlen).assertInstanceOf('Number');
          console.info(`Ethernet_NetAddr[${i}][${j}].prefixlen: ${netAddr.prefixlen}`);
          expect(netAddr.port).assertInstanceOf('Number');
          console.info(`Ethernet_NetAddr[${i}][${j}].port: ${netAddr.port}`);
          expect(netAddr.address).assertInstanceOf('String');
          expect(netAddr.address.length).assertLarger(0);
          console.info(`Ethernet_NetAddr[${i}][${j}].address: ${netAddr.address}`);
        }
      }

      done();
    });

    /**
     * @tc.number : SUB_NETWORK_OHEthGetMacAddress_Structure_0100
     * @tc.name   : testOHEthGetMacAddress_Structure_0100
     * @tc.desc   : Test Ethernet_MacAddressInfo and Ethernet_MacAddrInfoList structure
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testOHEthGetMacAddress_Structure_0100', 0, async (done: Function) => {
      console.info(`testOHEthGetMacAddress_Structure_0100 start`);
      let result: EthernetMacAddrInfoList = ncAPI.OHEthGetMacAddress() as EthernetMacAddrInfoList;
      expect(result.macInfoListSize >= 0).assertTrue();
      expect(result.macInfoListSize <= 32).assertTrue();
      if (result.macInfoListSize > 0) {
        let firstMacInfo: EthernetMacAddressInfo = result.macInfoList[0];
        expect(firstMacInfo.ifaceName.length <= 256).assertTrue();
        expect(firstMacInfo.macAddr.length <= 256).assertTrue();
      }

      console.info(`testOHEthGetMacAddress_Structure_0100 passed`);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_OHEthGetNetAddress_Structure_0100
     * @tc.name   : testOHEthGetNetAddress_Structure_0100
     * @tc.desc   : Test Ethernet_NetAddr, Ethernet_NetAddrInfo and Ethernet_NetAddrList structure
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testOHEthGetNetAddress_Structure_0100', 0, async (done: Function) => {
      console.info(`testOHEthGetNetAddress_Structure_0100 start`);
      let result: EthernetNetAddrInfoList = ncAPI.OHEthGetNetAddress() as EthernetNetAddrInfoList;
      expect(result.netAddrListSize >= 0).assertTrue();
      expect(result.netAddrListSize <= 32).assertTrue();
      if (result.netAddrListSize > 0) {
        let firstNetAddrInfo: EthernetNetAddrInfo = result.netAddrList[0];
        expect(firstNetAddrInfo.ifaceName.length <= 256).assertTrue();
        expect(firstNetAddrInfo.netAddrInfoSize >= 0).assertTrue();
        expect(firstNetAddrInfo.netAddrInfoSize <= 32).assertTrue();
        if (firstNetAddrInfo.netAddrInfoSize > 0) {
          let firstNetAddr: EthernetNetAddr = firstNetAddrInfo.netAddrInfo[0];
          expect(firstNetAddr.address.length <= 256).assertTrue();
        }
      }

      console.info(`testOHEthGetNetAddress_Structure_0100 passed`);
      done();
    });

    /**
     * @tc.number : SUB_NETWORK_OHEthGetAllFields_Combined_0100
     * @tc.name   : testOHEthGetAllFields_Combined_0100
     * @tc.desc   : Test all fields from both OH_Ethernet_GetMacAddress and OH_Ethernet_GetNetAddress
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testOHEthGetAllFields_Combined_0100', 0, async (done: Function) => {
      console.info(`testOHEthGetAllFields_Combined_0100 start`);
      let macResult: EthernetMacAddrInfoList = ncAPI.OHEthGetMacAddress() as EthernetMacAddrInfoList;
      console.info(`MAC Address Result: ${JSON.stringify(macResult)}`);
      expect(macResult.status === 0 || macResult.status === 201).assertTrue();
      expect(macResult.macInfoListSize).assertLarger(0);

      for (let i = 0; i < macResult.macInfoListSize; i++) {
        console.info(`MAC Info [${i}]: ifaceName=${macResult.macInfoList[i].ifaceName}, macAddr=${macResult.macInfoList[i].macAddr}`);
        expect(macResult.macInfoList[i].ifaceName).assertInstanceOf('String');
        expect(macResult.macInfoList[i].macAddr).assertInstanceOf('String');
      }
      let netResult: EthernetNetAddrInfoList = ncAPI.OHEthGetNetAddress() as EthernetNetAddrInfoList;
      console.info(`Net Address Result: ${JSON.stringify(netResult)}`);
      if (netResult.status !== 0 && netResult.status !== 201) {
        console.error(`Unexpected status for OHEthGetNetAddress: ${netResult.status}`);
      }
      expect(netResult.status === 0 || netResult.status === 201).assertTrue();
      expect(netResult.netAddrListSize).assertLarger(0);

      for (let i = 0; i < netResult.netAddrListSize; i++) {
        console.info(`Net Addr Info [${i}]: ifaceName=${netResult.netAddrList[i].ifaceName}`);
        expect(netResult.netAddrList[i].ifaceName).assertInstanceOf('String');
        expect(netResult.netAddrList[i].netAddrInfoSize).assertLarger(0);

        for (let j = 0; j < netResult.netAddrList[i].netAddrInfoSize; j++) {
          let netAddr: EthernetNetAddr = netResult.netAddrList[i].netAddrInfo[j];
          console.info(`  Net Addr [${j}]: family=${netAddr.family}, prefixlen=${netAddr.prefixlen}, port=${netAddr.port}, address=${netAddr.address}`);
          expect(netAddr.family).assertInstanceOf('Number');
          expect(netAddr.prefixlen).assertInstanceOf('Number');
          expect(netAddr.port).assertInstanceOf('Number');
          expect(netAddr.address).assertInstanceOf('String');
        }
      }

      console.info(`testOHEthGetAllFields_Combined_0100 passed`);
      done();
    });

  });
}
