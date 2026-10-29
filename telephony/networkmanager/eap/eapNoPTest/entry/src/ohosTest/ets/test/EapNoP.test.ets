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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';

import { BusinessError } from '@kit.BasicServicesKit';
import eap from '@ohos.net.eap';
import connection from '@ohos.net.connection';

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info(`exportFail failed err: ${JSON.stringify(err)}`);
  }
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(`exportTrue failed err: ${JSON.stringify(err)}`);
  }
}
let netType = 1;
let eapCode = 1;
let eapType = 25;
let eapDataCallback = (eapData: eap.EapData): void =>{
  console.log("eapData callback result: "+ JSON.stringify(eapData));
}
let profile: eap.EthEapProfile = {
  eapMethod: eap.EapMethod.EAP_TTLS,
  phase2Method: eap.Phase2Method.PHASE2_AKA_PRIME,
  identity: "identity",
  anonymousIdentity: "anonymousIdentity",
  password: "password",
  caCertAliases: "caCertAliases",
  caPath: "caPath",
  clientCertAliases: "clientCertAliases",
  certEntry: new Uint8Array([5,6,7,8,9,10]),
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
  certEntry: new Uint8Array([5,6,7,8,9,10]),
  certPassword: "certPassword",
  altSubjectMatch: "altSubjectMatch",
  domainSuffixMatch: "domainSuffixMatch",
  realm: "realm",
  plmn: "plmn",
  eapSubId: 9999999
};


let netId = 100;

export default function eapNoPTest() {
  describe('eapNoPTest', () => {

    /**
     * @tc.name   testCommunicationEapRegCustomEapHandlerNop0100
     * @tc.number SUB_Communication_Eap_RegCustomEapHandler_Nop_0100
     * @tc.desc   test whether the interface permission takes effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapRegCustomEapHandlerNop0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapRegCustomEapHandlerNop0100";
      console.info(`${caseName}---start`);
      try {
        eap.regCustomEapHandler(netType, eapCode, eapType, eapDataCallback);
        console.info(`${caseName } regCustomEapHandler success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 201);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapUnregCustomEapHandlerNop0200
     * @tc.number SUB_Communication_Eap_UnregCustomEapHandler_Nop_0200
     * @tc.desc   test whether the interface permission takes effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapUnregCustomEapHandlerNop0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapUnregCustomEapHandlerNop0200";
      console.info(`${caseName}---start`);
      try {
        eap.unregCustomEapHandler(netType, eapCode, eapType, eapDataCallback);
        console.info(`${caseName } unregCustomEapHandler success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 201);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapStartEthEapNop0300
     * @tc.number SUB_Communication_Eap_StartEthEap_Nop_0300
     * @tc.desc   test whether the interface permission takes effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapStartEthEapNop0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapStartEthEapNop0300";
      console.info(`${caseName}---start`);
      try {
        eap.startEthEap(netId, profile);
        console.info(`${caseName } startEthEap success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 201);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapLogOffEthEapNop0400
     * @tc.number SUB_Communication_Eap_LogOffEthEap_Nop_0400
     * @tc.desc   test whether the interface permission takes effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapLogOffEthEapNop0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapLogOffEthEapNop0400";
      console.info(`${caseName}---start`);
      try {
        eap.startEthEap(netId, profile);
        console.info(`${caseName } startEthEap success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 201);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapReplyCustomEapDataNop0500
     * @tc.number SUB_Communication_Eap_ReplyCustomEapData_Nop_0500
     * @tc.desc   test whether the interface permission takes effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapReplyCustomEapDataNop0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapReplyCustomEapDataNop0500";
      console.info(`${caseName}---start`);
      try {
        let eapData:eap.EapData= {
          msgId: 1,
          eapBuffer: new Uint8Array([1, 2, 3, 4, 5]),
          bufferLen: 5,
        };
        eap.replyCustomEapData(1, eapData );
        console.info(`${caseName } replyCustomEapData success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 201);
        console.info(`${caseName}---End`);
        done();
      }
    })
    
    /**
     * @tc.name   testCommunicationEapLogOffEthEapErrorCode0600
     * @tc.number SUB_Communication_Eap_LogOffEthEap_ErrorCode_0600
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapLogOffEthEapErrorCode0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapLogOffEthEapErrorCode0600";
      console.info(`${caseName}---start`);
      try {
        eap.logOffEthEap(1);
        console.info(`${caseName } logOffEthEap success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 201);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapStartEthEapErrorCode0700
     * @tc.number SUB_Communication_Eap_StartEthEap_ErrorCode_0700
     * @tc.desc   verification parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapStartEthEapErrorCode0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapStartEthEapErrorCode0700";
      console.info(`${caseName}---start`);
      try {
        eap.startEthEap(1, validProfile);
        console.info(`${caseName } startEthEap success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 201);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapConnectNop0100
     * @tc.number SUB_Communication_Eap_Connect_Nop_0100
     * @tc.desc   test whether the connect interface permission takes effect (ACTION_CONNECT)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapConnectNop0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapConnectNop0100";
      console.info(`${caseName}---start`);
      try {
        eap.connect(eap.EthEapConnectAction.ACTION_CONNECT).then(() => {
          console.info(`${caseName} connect success`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} connect failed, code:${error.code}, message:${error.message}`);
          ExpectTrue(error.code == 201);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 201);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapConnectNop0200
     * @tc.number SUB_Communication_Eap_Connect_Nop_0200
     * @tc.desc   test whether the connect interface permission takes effect (ACTION_DISCONNECT)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapConnectNop0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapConnectNop0200";
      console.info(`${caseName}---start`);
      try {
        eap.connect(eap.EthEapConnectAction.ACTION_DISCONNECT).then(() => {
          console.info(`${caseName} connect success`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} connect failed, code:${error.code}, message:${error.message}`);
          ExpectTrue(error.code == 201);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 201);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapDeleteEthEapConfigNop0100
     * @tc.number SUB_Communication_Eap_DeleteEthEapConfig_Nop_0100
     * @tc.desc   test whether the deleteEthEapConfig interface permission takes effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapDeleteEthEapConfigNop0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapDeleteEthEapConfigNop0100";
      console.info(`${caseName}---start`);
      try {
        eap.deleteEthEapConfig().then(() => {
          console.info(`${caseName} deleteEthEapConfig success`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} deleteEthEapConfig failed, code:${error.code}, message:${error.message}`);
          ExpectTrue(error.code == 201);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 201);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapGetEthEapConfigNop0100
     * @tc.number SUB_Communication_Eap_GetEthEapConfig_Nop_0100
     * @tc.desc   test whether the getEthEapConfig interface permission takes effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapGetEthEapConfigNop0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapGetEthEapConfigNop0100";
      console.info(`${caseName}---start`);
      try {
        eap.getEthEapConfig().then((config: eap.EthEapConfig) => {
          console.info(`${caseName} getEthEapConfig success: enabled=${config.enabled}`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} getEthEapConfig failed, code:${error.code}, message:${error.message}`);
          ExpectTrue(error.code == 201);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 201);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapGetEthEapStateInfoNop0100
     * @tc.number SUB_Communication_Eap_GetEthEapStateInfo_Nop_0100
     * @tc.desc   test whether the getEthEapStateInfo interface permission takes effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapGetEthEapStateInfoNop0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapGetEthEapStateInfoNop0100";
      console.info(`${caseName}---start`);
      try {
        let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        console.info(`${caseName} getEthEapStateInfo success: ${JSON.stringify(stateInfo)}`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 201);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapOnStateChangeNop0100
     * @tc.number SUB_Communication_Eap_OnStateChange_Nop_0100
     * @tc.desc   test whether the onStateChange interface permission takes effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapOnStateChangeNop0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapOnStateChangeNop0100";
      console.info(`${caseName}---start`);
      try {
        let stateChangeCallback = (info: eap.EthEapStateInfo): void => {
          console.info(`${caseName} onStateChange callback: ${JSON.stringify(info)}`);
        }
        eap.onStateChange(stateChangeCallback);
        console.info(`${caseName} onStateChange success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 201);
        try {
          eap.offStateChange();
          console.info(`${caseName} offStateChange cleanup success`);
        } catch (err) {
          console.error(`${caseName} offStateChange cleanup failed: ${JSON.stringify(err)}`);
        }
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapOffStateChangeNop0100
     * @tc.number SUB_Communication_Eap_OffStateChange_Nop_0100
     * @tc.desc   test whether the offStateChange interface permission takes effect (with callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapOffStateChangeNop0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapOffStateChangeNop0100";
      console.info(`${caseName}---start`);
      try {
        eap.offStateChange();
        console.info(`${caseName} offStateChange cleanup before onStateChange`);
      } catch (err) {
        console.error(`${caseName} cleanup catch err ->${JSON.stringify(err)}`);
      }
      try {
        let stateChangeCallback = (info: eap.EthEapStateInfo): void => {
          console.info(`${caseName} onStateChange callback: ${JSON.stringify(info)}`);
        }
        eap.onStateChange(stateChangeCallback);
        console.info(`${caseName} onStateChange success`);
        eap.offStateChange(stateChangeCallback);
        console.info(`${caseName} offStateChange success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 201);
        try {
          eap.offStateChange();
          console.info(`${caseName} offStateChange cleanup success`);
        } catch (err) {
          console.error(`${caseName} offStateChange cleanup failed: ${JSON.stringify(err)}`);
        }
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapOffStateChangeNop0200
     * @tc.number SUB_Communication_Eap_OffStateChange_Nop_0200
     * @tc.desc   test whether the offStateChange interface permission takes effect (optional callback not selected)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapOffStateChangeNop0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapOffStateChangeNop0200";
      console.info(`${caseName}---start`);
      try {
        eap.offStateChange();
        console.info(`${caseName} offStateChange cleanup before onStateChange`);
      } catch (err) {
        console.error(`${caseName} cleanup catch err ->${JSON.stringify(err)}`);
      }
      try {
        let stateChangeCallback = (info: eap.EthEapStateInfo): void => {
          console.info(`${caseName} onStateChange callback: ${JSON.stringify(info)}`);
        }
        eap.onStateChange(stateChangeCallback);
        console.info(`${caseName} onStateChange success`);
        eap.offStateChange();
        console.info(`${caseName} offStateChange success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 201);
        try {
          eap.offStateChange();
          console.info(`${caseName} offStateChange cleanup success`);
        } catch (err) {
          console.error(`${caseName} offStateChange cleanup failed: ${JSON.stringify(err)}`);
        }
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapSetEthEapConfigNop0100
     * @tc.number SUB_Communication_Eap_SetEthEapConfig_Nop_0100
     * @tc.desc   test whether the setEthEapConfig interface permission takes effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapSetEthEapConfigNop0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapSetEthEapConfigNop0100";
      console.info(`${caseName}---start`);
      try {
        let config: eap.EthEapConfig = {
          profile: profile,
          enabled: true,
          autoAuth: true,
          locked: false
        };
        eap.setEthEapConfig(config);
        console.info(`${caseName} setEthEapConfig success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(error.code == 201);
        console.info(`${caseName}---End`);
        done();
      }
    })
    

  })
}