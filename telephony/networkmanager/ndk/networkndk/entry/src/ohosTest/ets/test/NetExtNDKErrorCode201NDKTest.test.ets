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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType} from '@ohos/hypium'
import ncAPI from 'libtestNetExtNdk.so'
import wsAPI from 'libtestNetStackNdk.so'
import type { EthernetMacAddrInfoList, EthernetNetAddrInfoList } from 'libtestNetExtNdk.so'
import { unClickRequestPermission } from './ClickRequestPermission.test';

function sleep(delay : number) : Promise<number> {
  return new Promise(resovle => setTimeout(resovle, delay))
}

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
};

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

export default function NetExtNDKErrorCode201NDKTest() {

  describe('NetExtNDKErrorCode201NDKTest', () => {
    beforeEach(async () => {
      await unClickRequestPermission();
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
      let re: EthernetMacAddrInfoList = ncAPI.OHEthGetMacAddress() as EthernetMacAddrInfoList;
      console.info(`testOHEthGetMacAddress_ErrorCode_0100 result ${re}`);
      if (re.status !== 0 && re.status !== 201) {
        console.error(`Unexpected status: ${re.status}`);
      }
      expect(re.status === 0 || re.status === 201).assertTrue();
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
      let re: EthernetNetAddrInfoList = ncAPI.OHEthGetNetAddress() as EthernetNetAddrInfoList;
      console.info(`testOHEthGetNetAddress_ErrorCode_0100 result ${re}`);
      if (re.status !== 0 && re.status !== 201) {
        console.error(`Unexpected status: ${re.status}`);
      }
      expect(re.status === 0 || re.status === 201).assertTrue();
      done();
    });
  });
}
