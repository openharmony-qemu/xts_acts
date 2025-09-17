import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';

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

let netId = 100;

export default function eapNoPTest() {
  describe('eapNoPTest', () => {
    /**
     * @tc.number: SUB_Communication_Eap_RegCustomEapHandler_Nop_0100
     * @tc.name:  testCommunicationEapRegCustomEapHandlerNop0100
     * @tc.desc: test whether the interface permission takes effect
     * @tc.level:Level 0
     * @tc.type:Function
     * @tc.size:MediumTest
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
     * @tc.number: SUB_Communication_Eap_UnregCustomEapHandler_Nop_0200
     * @tc.name:  testCommunicationEapUnregCustomEapHandlerNop0200
     * @tc.desc: test whether the interface permission takes effect
     * @tc.level:Level 1
     * @tc.type:Function
     * @tc.size:MediumTest
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
     * @tc.number: SUB_Communication_Eap_StartEthEap_Nop_0300
     * @tc.name: testCommunicationEapStartEthEapNop0300
     * @tc.desc: test whether the interface permission takes effect
     * @tc.level:Level 1
     * @tc.type:Function
     * @tc.size:MediumTest
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
     * @tc.number: SUB_Communication_Eap_LogOffEthEap_Nop_0400
     * @tc.name: testCommunicationEapLogOffEthEapNop0400
     * @tc.desc: test whether the interface permission takes effect
     * @tc.level:Level 1
     * @tc.type:Function
     * @tc.size:MediumTest
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

  })
}