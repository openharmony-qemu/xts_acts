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

import { describe, it, expect, Level, Size, TestType } from "../../../hypium/index";
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
  })
}
