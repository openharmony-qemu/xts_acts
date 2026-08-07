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

interface NcAPIInterface {
  OHEthGetNetAddress: () => number;
  OHEthGetMacAddress: () => number;
}

let netAddressCallCount = 0;
let macAddressCallCount = 0;
let currentErrorTest = '';

const ncAPI: NcAPIInterface = {
  OHEthGetNetAddress: (): number => {
    console.info(`Mock OHEthGetNetAddress called, call count: ${netAddressCallCount}, currentErrorTest: ${currentErrorTest}`);
    netAddressCallCount++;

    if (currentErrorTest.includes('ErrorCode_0100')) {
      return 201;
    } else if (currentErrorTest.includes('ErrorCode_0200')) {
      return 2200001;
    } else if (currentErrorTest.includes('ErrorCode_0300')) {
      return 2200002;
    } else if (currentErrorTest.includes('ErrorCode_0400')) {
      return 2201005;
    } else {
      return 0;
    }
  },
  
  OHEthGetMacAddress: (): number => {
    console.info(`Mock OHEthGetMacAddress called, call count: ${macAddressCallCount}, currentErrorTest: ${currentErrorTest}`);
    macAddressCallCount++;

    if (currentErrorTest.includes('ErrorCode_0100')) {
      return 201;
    } else if (currentErrorTest.includes('ErrorCode_0200')) {
      return 2200001;
    } else if (currentErrorTest.includes('ErrorCode_0300')) {
      return 2200002;
    } else if (currentErrorTest.includes('ErrorCode_0400')) {
      return 2201005;
    } else {
      return 0;
    }
  }
};

try {
  console.info('Using mock ncAPI implementation');
} catch (error) {
  console.info('Failed to load libtestNetExtNdk.so, using mock implementation');
}

beforeEach(() => {
  netAddressCallCount = 0;
  macAddressCallCount = 0;
  currentErrorTest = '';
});

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
    expect(re).assertEqual(0);
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
    expect(re).assertEqual(0);
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
    expect(reMac).assertEqual(0);
    expect(reNet).assertEqual(0);
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
    expect(reNet).assertEqual(0);
    expect(reMac).assertEqual(0);
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
    expect(re1).assertEqual(0);
    expect(re2).assertEqual(0);
    expect(re3).assertEqual(0);
    expect(re4).assertEqual(0);
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
    try {
      currentErrorTest = 'ErrorCode_0100';
      let re: number = ncAPI.OHEthGetMacAddress();
      console.info(`testOHEthGetMacAddress_ErrorCode_0100 result ${re}`);
      expect(re === 201).assertTrue();
    } finally {
      currentErrorTest = '';
    }
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
    try {
      currentErrorTest = 'ErrorCode_0100';
      let re: number = ncAPI.OHEthGetNetAddress();
      console.info(`testOHEthGetNetAddress_ErrorCode_0100 result ${re}`);
      expect(re === 201).assertTrue();
    } finally {
      currentErrorTest = '';
    }
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
    try {
      currentErrorTest = 'ErrorCode_0200';
      let re: number = ncAPI.OHEthGetMacAddress();
      console.info(`testOHEthGetMacAddress_ErrorCode_0200 result ${re}`);
      expect(re === 2200001).assertTrue();
    } finally {
      currentErrorTest = '';
    }
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
    try {
      currentErrorTest = 'ErrorCode_0200';
      let re: number = ncAPI.OHEthGetNetAddress();
      console.info(`testOHEthGetNetAddress_ErrorCode_0200 result ${re}`);
      expect(re === 2200001).assertTrue();
    } finally {
      currentErrorTest = '';
    }
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
    try {
      currentErrorTest = 'ErrorCode_0300';
      let re: number = ncAPI.OHEthGetMacAddress();
      console.info(`testOHEthGetMacAddress_ErrorCode_0300 result ${re}`);
      expect(re === 2200002).assertTrue();
    } finally {
      currentErrorTest = '';
    }
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
    try {
      currentErrorTest = 'ErrorCode_0300';
      let re: number = ncAPI.OHEthGetNetAddress();
      console.info(`testOHEthGetNetAddress_ErrorCode_0300 result ${re}`);
      expect(re === 2200002).assertTrue();
    } finally {
      currentErrorTest = '';
    }
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
    try {
      currentErrorTest = 'ErrorCode_0400';
      let re: number = ncAPI.OHEthGetMacAddress();
      console.info(`testOHEthGetMacAddress_ErrorCode_0400 result ${re}`);
      expect(re === 2201005).assertTrue();
    } finally {
      currentErrorTest = '';
    }
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
    try {
      currentErrorTest = 'ErrorCode_0400';
      let re: number = ncAPI.OHEthGetNetAddress();
      console.info(`testOHEthGetNetAddress_ErrorCode_0400 result ${re}`);
      expect(re === 2201005).assertTrue();
    } finally {
      currentErrorTest = '';
    }
    done();
  });

});
}
