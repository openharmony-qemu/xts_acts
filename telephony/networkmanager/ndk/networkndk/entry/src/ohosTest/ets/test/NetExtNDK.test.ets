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

// 成功
const NETCONNECTION_OK = 0;

export default function NetExtNDKTest() {

describe('NetExtNDKTest', () => {

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
    let re: number = ncAPI.OHEthGetNetAddress()
    console.info(`testOHEthGetNetAddress_0100 result ${re}`);
    expect(re).assertEqual(NETCONNECTION_OK);
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
    let re: number = ncAPI.OHEthGetMacAddress()
    console.info(`testOHEthGetMacAddress_0100 result ${re}`);
    expect(re).assertEqual(NETCONNECTION_OK);
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
    let reMac: number = ncAPI.OHEthGetMacAddress()
    console.info(`testOHEthGetMacAddress_NetAddress_0100 mac result ${reMac}`);
    let reNet: number = ncAPI.OHEthGetNetAddress()
    console.info(`testOHEthGetMacAddress_NetAddress_0100 net result ${reNet}`);
    expect(reMac).assertEqual(NETCONNECTION_OK);
    expect(reNet).assertEqual(NETCONNECTION_OK);
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
    let reNet: number = ncAPI.OHEthGetNetAddress()
    console.info(`testOHEthGetNetAddress_MacAddress_0100 net result ${reNet}`);
    let reMac: number = ncAPI.OHEthGetMacAddress()
    console.info(`testOHEthGetNetAddress_MacAddress_0100 mac result ${reMac}`);
    expect(reNet).assertEqual(NETCONNECTION_OK);
    expect(reMac).assertEqual(NETCONNECTION_OK);
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
    let re1: number = ncAPI.OHEthGetNetAddress()
    let re2: number = ncAPI.OHEthGetMacAddress()
    let re3: number = ncAPI.OHEthGetNetAddress()
    let re4: number = ncAPI.OHEthGetMacAddress()
    console.info(`testOHEthGetAllInterfaceInfo_0100 result ${re1}, ${re2}, ${re3}, ${re4}`);
    expect(re1).assertEqual(NETCONNECTION_OK);
    expect(re2).assertEqual(NETCONNECTION_OK);
    expect(re3).assertEqual(NETCONNECTION_OK);
    expect(re4).assertEqual(NETCONNECTION_OK);
    done();
  });

});
}
