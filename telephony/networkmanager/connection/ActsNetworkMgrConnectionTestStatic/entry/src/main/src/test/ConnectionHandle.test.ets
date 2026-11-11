'use static'
/**
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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


import { describe, it, expect, TestType, Size, Level  } from '@ohos/hypium-static/src/main/indexStatic'
import { BusinessError } from '@ohos.base';
import connection from '@ohos.net.connection';
import sharing from '@ohos.net.sharing';
import hilog from '@ohos.hilog';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'connectionHandleTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, `exportFail failed err: ${JSON.stringify(err)}`);
  }
};

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, `exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

export default function ConnectionHandleTest(): void {

  describe('ConnectionHandleTest',()=>{
    
    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressByName_static_2000
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_2000
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName_static_2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_2000';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        try {
          let netHandle = await connection.getDefaultNet();
          let host: string = "www.baidu.com";
          netHandle.getAddressByName(host, (error: BusinessError | null, data: connection.NetAddress | undefined) => {
            if (error?.code !== 0) {
              hilog.error(domain, tag, `${caseName} getAddressByName failed. error:${JSON.stringify(error?.code)}`, JSON.stringify(error?.message));
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
              ExpectTrue(data !== undefined);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        } catch (error) {
          hilog.error(domain, tag, `${caseName} Failed to get getDefaultNet. error : ${JSON.stringify(error?.code)}`, JSON.stringify(error?.message));
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err?.code)}`, JSON.stringify(err?.message));
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressByName_static_2100
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressByName_2100
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressByName_static_2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressByName_static_2100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        try {
          let netHandle = await connection.getDefaultNet();
          let host: string = "www.baidu.com";
          try {
            let data = await netHandle.getAddressByName(host);
            hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data !== undefined );
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (err) {
            hilog.error(domain, tag, `${caseName} getAddressByName failed. error:${JSON.stringify(err?.code)}`, JSON.stringify(err?.message));
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (error) {
          hilog.error(domain, tag, `${caseName} Failed to get getDefaultNet. error : ${JSON.stringify(error?.code)}`, JSON.stringify(error?.message));
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err?.code)}`, JSON.stringify(err?.message));
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressesByName_static_2000
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_2000
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName_static_2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_2000';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        try {
          let netHandle = await connection.getDefaultNet();
          let host: string = "www.baidu.com";
          netHandle.getAddressesByName(host, (error: BusinessError | null, data: connection.NetAddress [] | undefined) => {
            if (error?.code !== 0) {
              hilog.error(domain, tag, `${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
              ExpectFail();
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            } else {
              if (data !== undefined) {
                hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
                ExpectTrue(data?.length >= 0);
              } else {
                hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
                ExpectFail();
              }
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        } catch (error) {
          hilog.info(domain, tag, `${caseName} test failed error: ${JSON.stringify(error)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrConnectionNetHandleGetAddressesByName_static_2100
     * @tc.number SUB_NetworkMgr_Connection_NetHandle_GetAddressesByName_2100
     * @tc.desc   Use the corresponding network to resolve the host name and obtain all IP addresses.Using callback as an asynchronous method.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrConnectionNetHandleGetAddressesByName_static_2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrConnectionNetHandleGetAddressesByName_static_2100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        try {
          let netHandle = await connection.getDefaultNet();
          let host: string = "www.baidu.com";
          try {
            let data = await netHandle.getAddressesByName(host);
            hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
            ExpectTrue(data.length >= 0);
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (err) {
            hilog.error(domain, tag, `${caseName} Failed to get addresses. error:${JSON.stringify(err)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.error(domain, tag, `${caseName} err. error:${JSON.stringify(err)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      } catch (err) {
        hilog.info(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /**
     * @tc.name   testNetworkMgrSharingNetHandle_static_0100
     * @tc.number SUB_NetworkMgr_Sharing_NetHandle_0100
     * @tc.desc   Use getDefaultNet to get the network and assign it to sharing.NetHandle, then check the netId is greater than 100.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testNetworkMgrSharingNetHandle_static_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (done:() => void): Promise<void> => {
      const caseName: string = 'testNetworkMgrSharingNetHandle_static_0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        try {
          let netHandle = await connection.getDefaultNet();
          let sharingNetHandle: sharing.NetHandle = netHandle;
          hilog.info(domain, tag, `${caseName} sharingNetHandle netId: ${sharingNetHandle.netId}`);
          ExpectTrue(sharingNetHandle.netId > 100);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        } catch (error) {
          hilog.error(domain, tag, `${caseName} Failed to get getDefaultNet. error : ${JSON.stringify(error?.code)}`, JSON.stringify(error?.message));
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err?.code)}`, JSON.stringify(err?.message));
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    });
  })
}