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
import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";

import { BusinessError } from '@kit.BasicServicesKit';
import eap from '@ohos.net.eap';
import connection from '@ohos.net.connection';
import hilog from '@ohos.hilog';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'eapErrorCodeTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

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
let validNetType: int = 1;
let validEapCode: int = 1;
let validEapType: int = 25;
let errorNetType: int = 9;
let errorEapCode: int = 9;
let errorEapType: int = 400;
let eapDataCallback = (eapData: eap.EapData): void =>{
  hilog.info(domain, tag, "eapData callback result: "+ JSON.stringify(eapData));
}

let certEntryArr = new Uint8Array(6);
certEntryArr[0] = 5;
certEntryArr[1] = 6;
certEntryArr[2] = 7;
certEntryArr[3] = 8;
certEntryArr[4] = 9;
certEntryArr[5] = 10;

let validProfile: eap.EthEapProfile = {
  eapMethod: eap.EapMethod.EAP_TTLS,
  phase2Method: eap.Phase2Method.PHASE2_AKA_PRIME,
  identity: "identity",
  anonymousIdentity: "anonymousIdentity",
  password: "password",
  caCertAliases: "caCertAliases",
  caPath: "caPath",
  clientCertAliases: "clientCertAliases",
  certEntry: certEntryArr,
  certPassword: "certPassword",
  altSubjectMatch: "altSubjectMatch",
  domainSuffixMatch: "domainSuffixMatch",
  realm: "realm",
  plmn: "plmn",
  eapSubId: 9999999
};


export default function EapErrorCodeTest(): void {
  describe('EapErrorCodeTest', ()=> {

    /**
     * @tc.name   testCommunicationEapRegCustomEapHandlerErrorCode_static_0100
     * @tc.number SUB_Communication_Eap_RegCustomEapHandlerErrorCode_0100
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapRegCustomEapHandlerErrorCode_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapRegCustomEapHandlerErrorCode_static_0100";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        eap.regCustomEapHandler(errorNetType, validEapCode, validEapType, (eapData: eap.EapData): void =>{
          hilog.info(domain, tag, "eapData callback result: "+ JSON.stringify(eapData));
        });
        hilog.info(domain, tag, `${caseName} regCustomEapHandler success`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(error.code === 33200006);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapRegCustomEapHandlerErrorCode_static_0200
     * @tc.number SUB_Communication_Eap_RegCustomEapHandlerErrorCode_0200
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapRegCustomEapHandlerErrorCode_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapRegCustomEapHandlerErrorCode_static_0200";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        eap.regCustomEapHandler(validNetType, errorEapCode, validEapType, eapDataCallback);
        hilog.info(domain, tag, `${caseName} regCustomEapHandler success`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(error.code === 33200007);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapRegCustomEapHandlerErrorCode_static_0300
     * @tc.number SUB_Communication_Eap_RegCustomEapHandlerErrorCode_0300
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapRegCustomEapHandlerErrorCode_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapRegCustomEapHandlerErrorCode_static_0300";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        eap.regCustomEapHandler(validNetType, validEapCode, errorEapType, eapDataCallback);
        hilog.info(domain, tag, `${caseName} regCustomEapHandler success`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(error.code === 33200008);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapUnregCustomEapHandlerErrorCode_static_0100
     * @tc.number SUB_Communication_Eap_UnregCustomEapHandlerErrorCode_0100
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapUnregCustomEapHandlerErrorCode_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapUnregCustomEapHandlerErrorCode_static_0100";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        eap.unregCustomEapHandler(errorNetType, validEapCode, validEapType, eapDataCallback);
        hilog.info(domain, tag, `${caseName} unregCustomEapHandler success`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(error.code === 33200006);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapUnregCustomEapHandlerErrorCode_static_0200
     * @tc.number SUB_Communication_Eap_UnregCustomEapHandlerErrorCode_0200
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapUnregCustomEapHandlerErrorCode_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapUnregCustomEapHandlerErrorCode_static_0200";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        eap.unregCustomEapHandler(validNetType, errorEapCode, validEapType, eapDataCallback);
        hilog.info(domain, tag, `${caseName} unregCustomEapHandler success`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(error.code === 33200007);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapUnregCustomEapHandlerErrorCode_static_0300
     * @tc.number SUB_Communication_Eap_UnregCustomEapHandlerErrorCode_0300
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapUnregCustomEapHandlerErrorCode_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapUnregCustomEapHandlerErrorCode_static_0300";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        eap.unregCustomEapHandler(validNetType, validEapCode, errorEapType, eapDataCallback);
        hilog.info(domain, tag, `${caseName} unregCustomEapHandler success`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(error.code === 33200008);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapUnregCustomEapHandlerErrorCode_static_0400
     * @tc.number SUB_Communication_Eap_UnregCustomEapHandlerErrorCode_0400
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapUnregCustomEapHandlerErrorCode_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapUnregCustomEapHandlerErrorCode_static_0400";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        eap.regCustomEapHandler(validNetType, validEapCode, validEapType, eapDataCallback);
        eap.unregCustomEapHandler(2, validEapCode, validEapType, eapDataCallback);
        hilog.info(domain, tag, `${caseName} unregCustomEapHandler success`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(error.code === 33200099);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapReplyCustomEapDataErrorCode_static_0200
     * @tc.number SUB_Communication_Eap_ReplyCustomEapDataErrorCode_0200
     * @tc.desc   test verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapReplyCustomEapDataErrorCode_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapReplyCustomEapDataErrorCode_static_0200";
      hilog.info(domain, tag, `${caseName}---start`);
      let eapBuffer = new Uint8Array(5);
      eapBuffer[0] = 1;
      eapBuffer[1] = 2;
      eapBuffer[2] = 3;
      eapBuffer[3] = 4;
      eapBuffer[4] = 5;
      try {
        let eapData:eap.EapData= {
          msgId: 1,
          eapBuffer: eapBuffer,
          bufferLen: 5,
        };
        eap.replyCustomEapData(eap.CustomResult.RESULT_NEXT, eapData);
        hilog.info(domain, tag, `${caseName} replyCustomEapData success`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(error.code === 33200099);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapStartEthEapErrorCode_static_0100
     * @tc.number SUB_Communication_Eap_StartEthEapErrorCode_0100
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapStartEthEapErrorCode_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapStartEthEapErrorCode_static_0100";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let validNetId = connection.getDefaultNetSync().netId;
        hilog.info(domain, tag, `${caseName} getDefaultNetSync success, validNetId:${validNetId}`);
        let errorNetId = validNetId+ 10000;
        eap.startEthEap(errorNetId, validProfile);
        hilog.info(domain, tag, `${caseName} startEthEap success`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(error.code === 33200001);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapLogOffEthEapErrorCode_static_0100
     * @tc.number SUB_Communication_Eap_LogOffEthEapErrorCode_0100
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapLogOffEthEapErrorCode_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapLogOffEthEapErrorCode_static_0100";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let validNetId = connection.getDefaultNetSync().netId;
        hilog.info(domain, tag, `${caseName} getDefaultNetSync success, validNetId:${validNetId}`);
        let errorNetId = validNetId+ 10000;
        eap.logOffEthEap(errorNetId);
        hilog.info(domain, tag, `${caseName} logOffEthEap success`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->code:${JSON.stringify(error?.code)}, message:${JSON.stringify(error?.message)}`);
        ExpectTrue(error.code === 33200001);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })
  })
}