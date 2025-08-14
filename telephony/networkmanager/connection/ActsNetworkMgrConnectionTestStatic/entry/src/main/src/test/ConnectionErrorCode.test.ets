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

import { describe, expect, it, Level, Size, TestType } from '../../../hypium';
import connection from '@ohos.net.connection';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'ConnectionPublicStaticTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为

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

export default function ConnectionErrorCodeTest() {
  describe('ConnectionPublicStaticTest', () => {

    /*
     * @tc.number : SUB_Telephony_Connection_getAddressesByName_ErrCo_0100
     * @tc.name   : testConnectionGetAddressesByNameErrCo_static_0100
     * @tc.desc   : AddressesByName  Parameter error
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testConnectionGetAddressesByNameErrCo_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetAddressesByNameErrCo_static_0100';
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        connection.getAddressesByName("xxx", (error: BusinessError<void>|null, data: Array<connection.NetAddress>|undefined) => {
          if (error?.code) {
            hilog.error(domain, tag, `${caseName} Failed to get addresses. Code:${error?.code}, message:${error?.message}`);
            expect(true).assertEqual(error?.code === 401);
          }else {
            hilog.info(domain, tag, `${caseName} success to get addressta: ` + JSON.stringify(data));
            ExpectTrue(true);
          }
          done();
        });
      }catch (err){
        hilog.error(domain, tag, `${caseName} --test end`);
        hilog.error(domain, tag, `${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(false);
        done();
      }
    })

    /*
     * @tc.number : SUB_Telephony_Connection_getAddressesByName_ErrCo_0200
     * @tc.name   : testConnectionGetAddressesByNameErrCo_static_0200
     * @tc.desc   : AddressesByName  Parameter error
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testConnectionGetAddressesByNameErrCo_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetAddressesByNameErrCo_static_0200';
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        connection.getAddressesByName("xxx").then((data: connection.NetAddress[])=>{
          hilog.info(domain, tag, `${caseName} success to get addressta: ` + JSON.stringify(data));
          ExpectTrue(true);
          done();
        })
          .catch((error: Error)=>{
            let err = error as BusinessError;
            hilog.error(domain, tag, `${caseName} Failed to get addresses. Code:${err?.code}, message:${err?.message}`);
            expect(true).assertEqual(err?.code === 401);
            done();
          })
      } catch (err) {
        hilog.error(domain, tag, `${caseName} --test end`);
        hilog.error(domain, tag, `${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(false);
        done();
      }
    })

    /*
     * @tc.number : SUB_Telephony_Connection_getAddressesByName_ErrCo_0400
     * @tc.name   : testConnectionGetAddressesByNameErrCo_static_0400
     * @tc.desc   : AddressesByName  Cannot connect to service
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testConnectionGetAddressesByNameErrCo_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetAddressesByNameErrCo_static_0400';
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        connection.getAddressesByName("www.dsfhkashdfasdfasdfsdf.com/sef/", (error: BusinessError<void>|null, data: Array<connection.NetAddress>|undefined) => {
          if (error?.code) {
            hilog.error(domain, tag, `${caseName} Failed to get addresses. Code:${error?.code}, message:${error?.message}`);
            expect(true).assertEqual(error?.code === 2100002);
          } else {
            hilog.info(domain, tag, `${caseName} success to get addressta: ` + JSON.stringify(data));
            ExpectTrue(true);
          }
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} --test end`);
        hilog.error(domain, tag, `${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(false);
        done();
      }
    })

    /*
     * @tc.number : SUB_Telephony_Connection_getAddressesByName_ErrCo_0500
     * @tc.name   : testConnectionGetAddressesByNameErrCo_static_0500
     * @tc.desc   : AddressesByName  Cannot connect to service
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testConnectionGetAddressesByNameErrCo_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetAddressesByNameErrCo_static_0500';
      hilog.info(domain, tag, `${caseName}---Start`);
      try{
        connection.getAddressesByName('as').then((data: connection.NetAddress[])=>{
          hilog.info(domain, tag, `${caseName} success to get addressta: ` + JSON.stringify(data));
          ExpectTrue(true);
          done();
        })
          .catch((error: Error)=>{
            let err = error as BusinessError;
            hilog.error(domain, tag, `${caseName} Failed to get addresses. Code:${err?.code}, message:${err?.message}`);
            expect(true).assertEqual(err?.code === 2100002);
            done();
          })
      }catch (err){
        hilog.error(domain, tag, `${caseName} --test end`);
        hilog.error(domain, tag, `${caseName} catch err is `,JSON.stringify(err));
        ExpectTrue(false);
        done();
      }
    })

    /*
     * @tc.number : SUB_Connection_GetAddressByName_ErrCo_0600
     * @tc.name   : testConnectionGetAddressByNameErrC_static_0600
     * @tc.desc   : getAddressByName Invalid parameter value
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testConnectionGetAddressByNameErrC_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetAddressByNameErrC_static_0600';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "";
          netHandle.getAddressByName(host, (error: BusinessError<void>|null, data: connection.NetAddress|undefined) => {
            if (error?.code) {
              hilog.error(domain, tag, `${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
              expect(true).assertEqual(error?.code === 2100001);
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_Connection_GetAddressByName_ErrC_0700
     * @tc.name   : testConnectionGetAddressByNameErrC_static_0700
     * @tc.desc   : getAddressByName Invalid parameter value
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testConnectionGetAddressByNameErrC_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testConnectionGetAddressByNameErrC_static_0700';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "";
          netHandle.getAddressByName(host,(error: BusinessError<void>|null, data: connection.NetAddress|undefined)=>{
            if(error?.code){
              hilog.error(domain, tag, `${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
              expect(true).assertEqual(error?.code === 2100001)
              done();
            } else {
              hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          })
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetHandle_GetAddressesByName_ErrCo_0800
     * @tc.name   : testNetHandleGetAddressesByNameErrCo_static_0800
     * @tc.desc   : getAddressesByName Invalid parameter value
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetHandleGetAddressesByNameErrCo_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetHandleGetAddressesByNameErrCo_static_0800';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "";
          netHandle.getAddressesByName(host, (error: BusinessError<void>|null, data: Array<connection.NetAddress>|undefined) => {
            if (error?.code) {
              hilog.error(domain, tag, `${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
              expect(true).assertEqual(error?.code === 2100001);
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });

    /*
     * @tc.number : SUB_NetHandle_GetAddressesByName_ErrCo_0900
     * @tc.name   : testNetHandleGetAddressesByNameErrCo_static_0900
     * @tc.desc   : getAddressesByName Invalid parameter value
     * @tc.level  : Level 3
     * @tc.type   : Function
     * @tc.size   : MediumTest
     */
    it("testNetHandleGetAddressesByNameErrCo_static_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const caseName: string = 'testNetHandleGetAddressesByNameErrCo_static_0900';
      hilog.info(domain, tag, `${caseName}---Start`);
      try {
        await connection.getDefaultNet().then((netHandle: connection.NetHandle) => {
          let host: string = "";
          netHandle.getAddressesByName(host, (error: BusinessError<void>|null, data: Array<connection.NetAddress>|undefined) => {
            if (error?.code) {
              hilog.error(domain, tag, `${caseName} Failed to get addresses. error:${JSON.stringify(error)}`);
              expect(true).assertEqual(error?.code === 2100001);
              hilog.error(domain, tag, `${caseName}---End`);
              done();
            } else {
              hilog.info(domain, tag, `${caseName} data: ${JSON.stringify(data)}`);
              ExpectTrue(true);
              hilog.info(domain, tag, `${caseName}---End`);
              done();
            }
          });
        });
      } catch (err) {
        hilog.error(domain, tag, `${caseName} test failed err: ${JSON.stringify(err)}`);
        ExpectTrue(false);
        hilog.error(domain, tag, `${caseName}---End`);
        done();
      }
    });
  });
}
