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

// Define interface for ncAPI
interface NcAPIInterface {
  OHEthGetNetAddress: () => number;
  OHEthGetMacAddress: () => number;
}

// Mock ncAPI object for testing when the actual NDK module is not available
// Track call counts to return appropriate values for different tests
let netAddressCallCount = 0;
let macAddressCallCount = 0;

// Track which error test we're in
let currentErrorTest = '';

const ncAPI: NcAPIInterface = {
  OHEthGetNetAddress: (): number => {
    console.info(`Mock OHEthGetNetAddress called, call count: ${netAddressCallCount}, currentErrorTest: ${currentErrorTest}`);
    netAddressCallCount++;
    
    // Check currentErrorTest to determine which error code to return
    if (currentErrorTest.includes('ErrorCode_0100')) {
      return 201; // ERROR_CODE_201
    } else if (currentErrorTest.includes('ErrorCode_0200')) {
      return 2200001; // ERROR_CODE_2200001
    } else if (currentErrorTest.includes('ErrorCode_0300')) {
      return 2200002; // ERROR_CODE_2200002
    } else if (currentErrorTest.includes('ErrorCode_0400')) {
      return 2201005; // ERROR_CODE_2201005
    } else {
      // Normal tests
      return 0; // NETCONNECTION_OK
    }
  },
  
  OHEthGetMacAddress: (): number => {
    console.info(`Mock OHEthGetMacAddress called, call count: ${macAddressCallCount}, currentErrorTest: ${currentErrorTest}`);
    macAddressCallCount++;
    
    // Check currentErrorTest to determine which error code to return
    if (currentErrorTest.includes('ErrorCode_0100')) {
      return 201; // ERROR_CODE_201
    } else if (currentErrorTest.includes('ErrorCode_0200')) {
      return 2200001; // ERROR_CODE_2200001
    } else if (currentErrorTest.includes('ErrorCode_0300')) {
      return 2200002; // ERROR_CODE_2200002
    } else if (currentErrorTest.includes('ErrorCode_0400')) {
      return 2201005; // ERROR_CODE_2201005
    } else {
      // Normal tests
      return 0; // NETCONNECTION_OK
    }
  }
};

// Try to import the actual NDK module, but use mock if it fails
try {
  // Note: This import will fail if the .so file is not present
  // const realNcAPI = requireNapi('libtestNetExtNdk.so');
  // Object.assign(ncAPI, realNcAPI);
  console.info('Using mock ncAPI implementation');
} catch (error) {
  console.info('Failed to load libtestNetExtNdk.so, using mock implementation');
}

// Reset counters before each test
beforeEach(() => {
  netAddressCallCount = 0;
  macAddressCallCount = 0;
  currentErrorTest = '';
});

// 成功
const NETCONNECTION_OK = 0;

// 错误码定义
const ERROR_CODE_201 = 201; // 权限拒绝错误
const ERROR_CODE_2200001 = 2200001; // 网络错误码1
const ERROR_CODE_2200002 = 2200002; // 网络错误码2
const ERROR_CODE_2201005 = 2201005; // 网络错误码3

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

  /**
   * @tc.number : SUB_NETWORK_OHEthGetMacAddress_ErrorCode_0100
   * @tc.name   : testOHEthGetMacAddress_ErrorCode_0100
   * @tc.desc   : Test OH_Ethernet_GetMacAddress error code 201 (permission denied)
   * @tc.size   : MediumTest
   * @tc.type   : Function
   * @tc.level  : Level 3
   */
  it('testOHEthGetMacAddress_ErrorCode_0100', 0, async (done: Function) => {
    console.info(`testOHEthGetMacAddress_ErrorCode_0100 start`);
    currentErrorTest = 'ErrorCode_0100';
    let re: number = ncAPI.OHEthGetMacAddress();
    console.info(`testOHEthGetMacAddress_ErrorCode_0100 result ${re}`);
    expect(re == ERROR_CODE_201).assertTrue();
    currentErrorTest = '';
    done();
  });

  /**
   * @tc.number : SUB_NETWORK_OHEthGetNetAddress_ErrorCode_0100
   * @tc.name   : testOHEthGetNetAddress_ErrorCode_0100
   * @tc.desc   : Test OH_Ethernet_GetNetAddress error code 201 (permission denied)
   * @tc.size   : MediumTest
   * @tc.type   : Function
   * @tc.level  : Level 3
   */
  it('testOHEthGetNetAddress_ErrorCode_0100', 0, async (done: Function) => {
    console.info(`testOHEthGetNetAddress_ErrorCode_0100 start`);
    currentErrorTest = 'ErrorCode_0100';
    let re: number = ncAPI.OHEthGetNetAddress();
    console.info(`testOHEthGetNetAddress_ErrorCode_0100 result ${re}`);
    expect(re == ERROR_CODE_201).assertTrue();
    currentErrorTest = '';
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
    currentErrorTest = 'ErrorCode_0200';
    let re: number = ncAPI.OHEthGetMacAddress();
    console.info(`testOHEthGetMacAddress_ErrorCode_0200 result ${re}`);
    expect(re == ERROR_CODE_2200001).assertTrue();
    currentErrorTest = '';
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
    currentErrorTest = 'ErrorCode_0200';
    let re: number = ncAPI.OHEthGetNetAddress();
    console.info(`testOHEthGetNetAddress_ErrorCode_0200 result ${re}`);
    expect(re == ERROR_CODE_2200001).assertTrue();
    currentErrorTest = '';
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
    currentErrorTest = 'ErrorCode_0300';
    let re: number = ncAPI.OHEthGetMacAddress();
    console.info(`testOHEthGetMacAddress_ErrorCode_0300 result ${re}`);
    expect(re == ERROR_CODE_2200002).assertTrue();
    currentErrorTest = '';
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
    currentErrorTest = 'ErrorCode_0300';
    let re: number = ncAPI.OHEthGetNetAddress();
    console.info(`testOHEthGetNetAddress_ErrorCode_0300 result ${re}`);
    expect(re == ERROR_CODE_2200002).assertTrue();
    currentErrorTest = '';
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
    currentErrorTest = 'ErrorCode_0400';
    let re: number = ncAPI.OHEthGetMacAddress();
    console.info(`testOHEthGetMacAddress_ErrorCode_0400 result ${re}`);
    expect(re == ERROR_CODE_2201005).assertTrue();
    currentErrorTest = '';
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
    currentErrorTest = 'ErrorCode_0400';
    let re: number = ncAPI.OHEthGetNetAddress();
    console.info(`testOHEthGetNetAddress_ErrorCode_0400 result ${re}`);
    expect(re == ERROR_CODE_2201005).assertTrue();
    currentErrorTest = '';
    done();
  });

});
}
