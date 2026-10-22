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
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError, Callback } from '@ohos.base';
import eap from '@ohos.net.eap';
import connection from '@ohos.net.connection';
import hilog from '@ohos.hilog';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'eapNoPTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

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
let netType: int = 1;
let eapCode: int = 1;
let eapType: int = 25;
let eapDataCallback: Callback<eap.EapData> = (eapData: eap.EapData) =>{
  hilog.info(domain, tag, "eapData callback result: "+ JSON.stringify(eapData));
}
let certEntryArr = new Uint8Array(6);
certEntryArr[0] = 5;
certEntryArr[1] = 6;
certEntryArr[2] = 7;
certEntryArr[3] = 8;
certEntryArr[4] = 9;
certEntryArr[5] = 10;
let profile: eap.EthEapProfile = {
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
  eapSubId: 1
};

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


let netId = 100;

export default function eapNoPTest(): void {
  describe('eapNoPTest', (): void => {

    /**
     * @tc.name   testCommunicationEapRegCustomEapHandlerNop_static_0100
     * @tc.number SUB_Communication_Eap_RegCustomEapHandlerNop_0100
     * @tc.desc   test whether the interface permission takes effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapRegCustomEapHandlerNop_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapRegCustomEapHandlerNop_static_0100";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        eap.regCustomEapHandler(netType, eapCode, eapType, (eapData: eap.EapData): void =>{
          hilog.info(domain, tag, "eapData callback result: "+ JSON.stringify(eapData));
        });
        hilog.info(domain, tag, `${caseName } regCustomEapHandler success`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code === 201);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapUnregCustomEapHandlerNop_static_0200
     * @tc.number SUB_Communication_Eap_UnregCustomEapHandlerNop_0200
     * @tc.desc   test whether the interface permission takes effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapUnregCustomEapHandlerNop_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapUnregCustomEapHandlerNop_static_0200";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        eap.unregCustomEapHandler(netType, eapCode, eapType, (eapData: eap.EapData) =>{
          hilog.info(domain, tag, "eapData callback result: "+ JSON.stringify(eapData));
        });
        hilog.info(domain, tag, `${caseName } unregCustomEapHandler success`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code === 201);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapStartEthEapNop_static_0300
     * @tc.number SUB_Communication_Eap_StartEthEapNop_0300
     * @tc.desc   test whether the interface permission takes effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapStartEthEapNop_static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapStartEthEapNop_static_0300";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        eap.startEthEap(netId, profile);
        hilog.info(domain, tag, `${caseName } startEthEap success`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code === 201);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapLogOffEthEapNop_static_0400
     * @tc.number SUB_Communication_Eap_LogOffEthEapNop_0400
     * @tc.desc   test whether the interface permission takes effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapLogOffEthEapNop_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapLogOffEthEapNop_static_0400";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        eap.startEthEap(netId, profile);
        hilog.info(domain, tag, `${caseName } startEthEap success`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code === 201);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapReplyCustomEapDataNop_static_0500
     * @tc.number SUB_Communication_Eap_ReplyCustomEapDataNop_0500
     * @tc.desc   test whether the interface permission takes effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapReplyCustomEapDataNop_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapReplyCustomEapDataNop_static_0500";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        let eapBuffer = new Uint8Array(5);
        eapBuffer[0] = 1;
        eapBuffer[1] = 2;
        eapBuffer[2] = 3;
        eapBuffer[3] = 4;
        eapBuffer[4] = 5;
        let eapData:eap.EapData= {
          msgId: 1,
          eapBuffer: eapBuffer,
          bufferLen: 5,
        };
        eap.replyCustomEapData(eap.CustomResult.RESULT_NEXT, eapData );
        hilog.info(domain, tag, `${caseName } replyCustomEapData success`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code === 201);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapLogOffEthEapErrorCode_static_0600
     * @tc.number SUB_Communication_Eap_LogOffEthEapErrorCode_0600
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapLogOffEthEapErrorCode_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapLogOffEthEapErrorCode_static_0600";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        eap.logOffEthEap(1);
        hilog.info(domain, tag, `${caseName } logOffEthEap success`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code === 201);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapStartEthEapErrorCode_static_0700
     * @tc.number SUB_Communication_Eap_StartEthEapErrorCode_0700
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapStartEthEapErrorCode_static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = "testCommunicationEapStartEthEapErrorCode_static_0700";
      hilog.info(domain, tag, `${caseName}---start`);
      try {
        eap.startEthEap(1, validProfile);
        hilog.info(domain, tag, `${caseName } startEthEap success`);
        ExpectFail();
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      } catch (error) {
        hilog.info(domain, tag, `${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code === 201);
        hilog.info(domain, tag, `${caseName}---End`);
        done();
      }
    })

  })
}