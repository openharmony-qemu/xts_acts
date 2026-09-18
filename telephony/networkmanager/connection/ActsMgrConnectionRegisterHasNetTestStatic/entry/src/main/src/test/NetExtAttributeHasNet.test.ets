'use static'
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
import { describe, expect, it, TestType, Size, Level, beforeEach } from '../../../hypium/index';
import connection from '@ohos.net.connection';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'netExtAttributeHasNetTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, `exportFail failed err: ${JSON.stringify(err)}`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, `exportTrue failed err: ${JSON.stringify(err)}`);
  }
}


export default function NetExtAttributeHasNetTest(): void {
  describe('NetExtAttributeHasNetTest', () => {

    /**
     * @tc.name   testNetworkMgrConnectionSetNetExtAttributeSync_static_0100
     * @tc.number SUB_NetworkMgr_Connection_SetNetExtAttributeSync_0100
     * @tc.desc   To test the extended network attribute function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrConnectionSetNetExtAttributeSync_static_0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrConnectionSetNetExtAttributeSync_static_0100";
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let netExtAttribute: string = 'test';
          let netHandle = connection.getDefaultNetSync();
          connection.setNetExtAttributeSync(netHandle, netExtAttribute);
          hilog.info(domain, tag, `${caseName} setNetExtAttributeSync success `);
          ExpectTrue(true);
          done();
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch err is ` +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, `${caseName} is not pc device ` +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
          ExpectTrue(err.code === 201);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      })

    /**
     * @tc.name   testNetworkMgrConnectionSetNetExtAttribute_static_0100
     * @tc.number SUB_NetworkMgr_Connection_SetNetExtAttribute_0100
     * @tc.desc   To test the extended network attribute function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkMgrConnectionSetNetExtAttribute_static_0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrConnectionSetNetExtAttribute_static_0100";
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let netExtAttribute: string = 'test';
          let netHandle = connection.getDefaultNetSync();
          try {
            await connection.setNetExtAttribute(netHandle, netExtAttribute);
            hilog.info(domain, tag, `${caseName} setNetExtAttributeSync success `);
            ExpectTrue(true);
            done();
          } catch (err) {
            hilog.info(domain, tag, `${caseName} setNetExtAttributeSync failed err is ` +
              `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
            ExpectTrue(err.code === 201);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch err is ` +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, `${caseName} is not pc device ` +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });
    /**
     * @tc.name   testNetworkMgrConnectionGetNetExtAttributeSync_static_0100
     * @tc.number SUB_NetworkMgr_Connection_GetNetExtAttributeSync_0100
     * @tc.desc   To test the extended network attribute function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionGetNetExtAttributeSync_static_0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrConnectionGetNetExtAttributeSync_static_0100";
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let netHandle = connection.getDefaultNetSync();
          let netExtAttribute: string = connection.getNetExtAttributeSync(netHandle);
          hilog.info(domain, tag, `${caseName} netExtAttribute is ->` + JSON.stringify(netExtAttribute));
          ExpectTrue(netExtAttribute === '' || netExtAttribute === 'test');
          done();
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch err is ` +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetExtAttribute_static_0100
     * @tc.number SUB_NetworkMgr_Connection_GetNetExtAttribute_0100
     * @tc.desc   To test the extended network attribute function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionGetNetExtAttribute_static_0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrConnectionGetNetExtAttribute_static_0100";
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let netHandle = connection.getDefaultNetSync();
          try {
            let netExtAttribute = await connection.getNetExtAttribute(netHandle);
            hilog.info(domain, tag, `${caseName} getNetExtAttribute success netExtAttribute is ->` + netExtAttribute);
            ExpectTrue(netExtAttribute === '' || netExtAttribute === 'test');
            done();
          } catch (err) {
            hilog.info(domain, tag, `${caseName} getNetExtAttribute failed err is ->` +
              `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
            ExpectFail();
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch err is ` +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionSetNetExtAttributeSync_static_0300
     * @tc.number SUB_NetworkMgr_Connection_SetNetExtAttributeSync_0300
     * @tc.desc   To test the extended network attribute function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionSetNetExtAttributeSync_static_0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrConnectionSetNetExtAttributeSync_static_0300";
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let netExtAttribute: string = 'test';
          let netHandle = connection.getDefaultNetSync();
          netHandle.netId = -1;
          connection.setNetExtAttributeSync(netHandle, netExtAttribute);
          hilog.info(domain, tag, `${caseName} setNetExtAttributeSync success `);
          ExpectFail();
          done();
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch err is ` +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, `${caseName} is not pc device ` +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
          ExpectTrue(err.code === 2100003 || err.code === 201);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionSetNetExtAttribute_static_0300
     * @tc.number SUB_NetworkMgr_Connection_SetNetExtAttribute_0300
     * @tc.desc   To test the extended network attribute function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionSetNetExtAttribute_static_0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrConnectionSetNetExtAttribute_static_0300";
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let netExtAttribute: string = 'test';
          let netHandle = connection.getDefaultNetSync();
          netHandle.netId = -1;
          try {
            await connection.setNetExtAttribute(netHandle, netExtAttribute);
            hilog.info(domain, tag, `${caseName} setNetExtAttributeSync success `);
            ExpectFail();
            done();
          } catch (err) {
            hilog.info(domain, tag, `${caseName} setNetExtAttributeSync failed err is ` +
              `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
            ExpectTrue(err.code === 2100003 || err.code === 201);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch err is ` +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
          ExpectTrue(err.code === 2100003 || err.code === 201);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetExtAttributeSync_static_0300
     * @tc.number SUB_NetworkMgr_Connection_GetNetExtAttributeSync_0300
     * @tc.desc   To test the extended network attribute function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionGetNetExtAttributeSync_static_0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrConnectionGetNetExtAttributeSync_static_0300";
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let netHandle = connection.getDefaultNetSync();
          netHandle.netId = -1;
          let netExtAttribute: string = connection.getNetExtAttributeSync(netHandle);
          hilog.info(domain, tag, `${caseName} netExtAttribute is ->` + JSON.stringify(netExtAttribute));
          ExpectFail();
          done();
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch err is ` +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
          ExpectTrue(err.code === 2100003);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetExtAttribute_static_0300
     * @tc.number SUB_NetworkMgr_Connection_GetNetExtAttribute_0300
     * @tc.desc   To test the extended network attribute function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionGetNetExtAttribute_static_0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrConnectionGetNetExtAttribute_static_0300";
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let netHandle = connection.getDefaultNetSync();
          netHandle.netId = -1;
          try {
            let netExtAttribute = await connection.getNetExtAttribute(netHandle);
            hilog.info(domain, tag, `${caseName} getNetExtAttribute success netExtAttribute is ->` + netExtAttribute);
            ExpectFail();
            done();
          } catch (err) {
            hilog.info(domain, tag, `${caseName} getNetExtAttribute failed err is ->` +
              `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
            ExpectTrue(err.code === 2100003);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch err is ` +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
          ExpectTrue(err.code === 2100003);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionSetNetExtAttributeSync_static_0400
     * @tc.number SUB_NetworkMgr_Connection_SetNetExtAttributeSync_0400
     * @tc.desc   To test the extended network attribute function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionSetNetExtAttributeSync_static_0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrConnectionSetNetExtAttributeSync_static_0400";
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let netExtAttribute: string = '';
          let netHandle = connection.getDefaultNetSync();
          connection.setNetExtAttributeSync(netHandle, "");
          hilog.info(domain, tag, `${caseName} setNetExtAttributeSync success `);
          ExpectTrue(true);
          done();
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch err is ` +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, `${caseName} is not pc device ` +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
          ExpectTrue(err.code === 201)
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      })

    /**
     * @tc.name   testNetworkMgrConnectionSetNetExtAttribute_static_0400
     * @tc.number SUB_NetworkMgr_Connection_SetNetExtAttribute_0400
     * @tc.desc   To test the extended network attribute function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionSetNetExtAttribute_static_0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrConnectionSetNetExtAttribute_static_0400";
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let netExtAttribute: string = '';
          let netHandle = connection.getDefaultNetSync();
          try {
            await connection.setNetExtAttribute(netHandle, netExtAttribute);
            hilog.info(domain, tag, `${caseName} setNetExtAttributeSync success `);
            ExpectTrue(true);
            done();
          } catch (err) {
            hilog.info(domain, tag, `${caseName} setNetExtAttributeSync failed err is ` +
              `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
            ExpectTrue(err.code === 201);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch err is ` +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, `${caseName} is not pc device ` +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
          ExpectTrue(err.code === 201);
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });

    /**
     * @tc.name   testNetworkMgrConnectionGetNetExtAttributeSync_static_0400
     * @tc.number SUB_NetworkMgr_Connection_GetNetExtAttributeSync_0400
     * @tc.desc   To test the extended network attribute function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionGetNetExtAttributeSync_static_0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrConnectionGetNetExtAttributeSync_static_0400";
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let netHandle = connection.getDefaultNetSync();
          let netExtAttribute: string = connection.getNetExtAttributeSync(netHandle);
          hilog.info(domain, tag, `${caseName} setNetExtAttributeSync success `);
          ExpectTrue(netExtAttribute === '');
          done();
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch err is ` +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, `${caseName} is not pc device ` +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      })

    /**
     * @tc.name   testNetworkMgrConnectionGetNetExtAttribute_static_0400
     * @tc.number SUB_NetworkMgr_Connection_GetNetExtAttribute_0400
     * @tc.desc   To test the extended network attribute function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testNetworkMgrConnectionGetNetExtAttribute_static_0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = "testNetworkMgrConnectionGetNetExtAttribute_static_0400";
        hilog.info(domain, tag, `${caseName}---Start`);
        try {
          let netHandle = connection.getDefaultNetSync();
          try {
            let netExtAttribute = await connection.getNetExtAttribute(netHandle);
            hilog.info(domain, tag, `${caseName} setNetExtAttributeSync success `);
            ExpectTrue(netExtAttribute === '');
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          } catch (err) {
            hilog.info(domain, tag, `${caseName} setNetExtAttributeSync failed err is ` +
              `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
            ExpectFail();
            hilog.info(domain, tag, `${caseName}---End`);
            done();
          }
        } catch (err) {
          hilog.info(domain, tag, `${caseName} catch err is ` +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
          hilog.info(domain, tag, `${caseName} is not pc device ` +
            `err.code: ${JSON.stringify(err?.code)}, err?.message: ${JSON.stringify(err?.message)}`);
          ExpectFail();
          hilog.info(domain, tag, `${caseName}---End`);
          done();
        }
      });
  });
}