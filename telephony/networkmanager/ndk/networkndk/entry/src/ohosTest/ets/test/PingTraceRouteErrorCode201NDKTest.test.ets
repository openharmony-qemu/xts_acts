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
import ncAPI from 'libtestNetConnectNdk.so'
import wsAPI from 'libtestNetStackNdk.so'
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

export default function PingTraceRouteErrorCode201NDKTest() {

  describe('PingTraceRouteErrorCode201NDKTest', () => {

    beforeAll(async (done : Function) => {
      console.info('beforealltest start');
      done()
    });
    beforeEach(() => {
      console.info('beforeEachtest start');
    });
    afterEach(() => {
      console.info('afterEachtest start');
    });
    afterAll(() => {
      console.info('afterAlltest start');
    });

    /**
     * @tc.name   testNetworkManagerTraceRouteErrorCode201_0100
     * @tc.number SUB_NetworkManager_TraceRoute_ErrorCode201_0100
     * @tc.desc   Test TraceRoute Error Code 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testNetworkManagerTraceRouteErrorCode201_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testNetworkManagerTraceRouteErrorCode201_0100';
      console.info(`${caseName}---Start`);
      const pac: string = "www.example.com";
      try{
        let re: number = ncAPI.OHQueryTraceRoute(pac)
        console.log(`${caseName} --test result is `, re);
        expect(re == 201).assertTrue();
        done();
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   testOHNetStackCreateAndVerifySortedCertChain_errorCode201
     * @tc.number SUB_NetworkManager_OHNetStackCreateAndVerifySortedCertChain_ErrorCode201
     * @tc.desc   Test OHNetStackCreateAndVerifySortedCertChain returns Error Code 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testOHNetStackCreateAndVerifySortedCertChain_errorCode201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testOHNetStackCreateAndVerifySortedCertChain_errorCode201';
      console.info(`${caseName}---Start`);
      try{
        let re: number = wsAPI.OHNetStackCreateAndVerifySortedCertChain("ERROR_201");
        console.log(`${caseName} --test result is `, re);
        expect(re).assertEqual(201);
        done();
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testOHNetStackFreeCertChain_errorCode201
     * @tc.number SUB_NetworkManager_OHNetStackFreeCertChain_ErrorCode201
     * @tc.desc   Test OHNetStackFreeCertChain returns Error Code 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testOHNetStackFreeCertChain_errorCode201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      const caseName: string = 'testOHNetStackFreeCertChain_errorCode201';
      console.info(`${caseName}---Start`);
      try{
        let re: number = wsAPI.OHNetStackFreeCertChain("ERROR_201");
        console.log(`${caseName} --test result is `, re);
        expect(re).assertEqual(201);
        done();
      }catch (err){
        console.log(`${caseName} --test end`);
        console.log(`${caseName} catch err is `,JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });
  });
}
