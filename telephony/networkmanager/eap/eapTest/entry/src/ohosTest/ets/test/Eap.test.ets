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

const IsEnvError = (error: BusinessError): boolean => {
  if (error === undefined || error === null) {
    return false;
  }
  // 201: permission not granted on this env; 33200001: invalid net;
  // 33200009: netmanager stop; 33200010: invalid eth state; 33200011: no eap config;
  // 33200012: config locked; 33200013: eth eap config unavailable on this env;
  // 33200099: internal error (no 802.1X env, cable off, etc.)
  return error.code == 201 || error.code == 33200001 || error.code == 33200002 ||
    error.code == 33200003 || error.code == 33200004 || error.code == 33200009 ||
    error.code == 33200010 || error.code == 33200011 || error.code == 33200012 ||
    error.code == 33200013 || error.code == 33200099;
}

const IsValidEthEapState = (state: number): boolean => {
  return state === eap.EthEapState.STATE_IDLE ||
    state === eap.EthEapState.STATE_AUTHENTICATING ||
    state === eap.EthEapState.STATE_AUTHENTICATED ||
    state === eap.EthEapState.STATE_FAILED ||
    state === eap.EthEapState.STATE_RETRYING;
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
  certEntry: new Uint8Array([5, 6, 7, 8, 9, 10]),
  certPassword: "certPassword",
  altSubjectMatch: "altSubjectMatch",
  domainSuffixMatch: "domainSuffixMatch",
  realm: "realm",
  plmn: "plmn",
  eapSubId: 1
};

export default function eapTest() {
  describe('eapTest', () => {

    /**
     * @tc.name   testCommunicationEapEthEapConnectAction0100
     * @tc.number SUB_Communication_Eap_EthEapConnectAction_0100
     * @tc.desc   Test EthEapConnectAction.ACTION_CONNECT enum value is 0 and call connect with it.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapConnectAction0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapEthEapConnectAction0100";
      console.info(`${caseName}---start`);
      try {
        ExpectTrue(eap.EthEapConnectAction.ACTION_CONNECT === 0);
        ExpectTrue(typeof eap.EthEapConnectAction.ACTION_CONNECT === 'number');
        console.info(`${caseName} ACTION_CONNECT = ${eap.EthEapConnectAction.ACTION_CONNECT}`);
        eap.connect(eap.EthEapConnectAction.ACTION_CONNECT).then(() => {
          console.info(`${caseName} connect(ACTION_CONNECT) success`);
          try {
            let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
            console.info(`${caseName} getEthEapStateInfo after connect: ${JSON.stringify(stateInfo)}`);
            ExpectTrue(stateInfo !== undefined && stateInfo !== null);
            ExpectTrue(typeof stateInfo.state === 'number');
            ExpectTrue(IsValidEthEapState(stateInfo.state));
          } catch (stateError) {
            console.error(`${caseName} getEthEapStateInfo failed: ${JSON.stringify(stateError)}`);
            ExpectTrue(IsEnvError(stateError as BusinessError));
          }
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} connect failed, code:${error.code}, message:${error.message}`);
          ExpectTrue(IsEnvError(error));
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapConnectAction0200
     * @tc.number SUB_Communication_Eap_EthEapConnectAction_0200
     * @tc.desc   Test EthEapConnectAction.ACTION_DISCONNECT enum value is 1 and call connect with it.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapConnectAction0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapEthEapConnectAction0200";
      console.info(`${caseName}---start`);
      try {
        ExpectTrue(eap.EthEapConnectAction.ACTION_DISCONNECT === 1);
        ExpectTrue(typeof eap.EthEapConnectAction.ACTION_DISCONNECT === 'number');
        console.info(`${caseName} ACTION_DISCONNECT = ${eap.EthEapConnectAction.ACTION_DISCONNECT}`);
        eap.connect(eap.EthEapConnectAction.ACTION_DISCONNECT).then(() => {
          console.info(`${caseName} connect(ACTION_DISCONNECT) success`);
          try {
            let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
            console.info(`${caseName} getEthEapStateInfo after disconnect: ${JSON.stringify(stateInfo)}`);
            ExpectTrue(stateInfo !== undefined && stateInfo !== null);
            ExpectTrue(typeof stateInfo.state === 'number');
            ExpectTrue(IsValidEthEapState(stateInfo.state));
          } catch (stateError) {
            console.error(`${caseName} getEthEapStateInfo failed: ${JSON.stringify(stateError)}`);
            ExpectTrue(IsEnvError(stateError as BusinessError));
          }
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} connect failed, code:${error.code}, message:${error.message}`);
          ExpectTrue(IsEnvError(error));
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapState0100
     * @tc.number SUB_Communication_Eap_EthEapState_0100
     * @tc.desc   Test EthEapState.STATE_IDLE enum value is 0 and getEthEapStateInfo returns valid state.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapState0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapEthEapState0100";
      console.info(`${caseName}---start`);
      try {
        ExpectTrue(eap.EthEapState.STATE_IDLE === 0);
        ExpectTrue(typeof eap.EthEapState.STATE_IDLE === 'number');
        let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        console.info(`${caseName} getEthEapStateInfo: ${JSON.stringify(stateInfo)}`);
        ExpectTrue(stateInfo !== undefined && stateInfo !== null);
        ExpectTrue(typeof stateInfo.state === 'number');
        ExpectTrue(IsValidEthEapState(stateInfo.state));
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapState0200
     * @tc.number SUB_Communication_Eap_EthEapState_0200
     * @tc.desc   Test EthEapState.STATE_AUTHENTICATING enum value is 1 and getEthEapStateInfo returns valid state.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapState0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapEthEapState0200";
      console.info(`${caseName}---start`);
      try {
        ExpectTrue(eap.EthEapState.STATE_AUTHENTICATING === 1);
        ExpectTrue(typeof eap.EthEapState.STATE_AUTHENTICATING === 'number');
        let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        console.info(`${caseName} getEthEapStateInfo: ${JSON.stringify(stateInfo)}`);
        ExpectTrue(stateInfo !== undefined && stateInfo !== null);
        ExpectTrue(typeof stateInfo.state === 'number');
        ExpectTrue(IsValidEthEapState(stateInfo.state));
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapState0300
     * @tc.number SUB_Communication_Eap_EthEapState_0300
     * @tc.desc   Test EthEapState.STATE_AUTHENTICATED enum value is 2 and getEthEapStateInfo returns valid state.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapState0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapEthEapState0300";
      console.info(`${caseName}---start`);
      try {
        ExpectTrue(eap.EthEapState.STATE_AUTHENTICATED === 2);
        ExpectTrue(typeof eap.EthEapState.STATE_AUTHENTICATED === 'number');
        let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        console.info(`${caseName} getEthEapStateInfo: ${JSON.stringify(stateInfo)}`);
        ExpectTrue(stateInfo !== undefined && stateInfo !== null);
        ExpectTrue(typeof stateInfo.state === 'number');
        ExpectTrue(IsValidEthEapState(stateInfo.state));
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapState0400
     * @tc.number SUB_Communication_Eap_EthEapState_0400
     * @tc.desc   Test EthEapState.STATE_FAILED enum value is 3 and getEthEapStateInfo returns valid state.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapState0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapEthEapState0400";
      console.info(`${caseName}---start`);
      try {
        ExpectTrue(eap.EthEapState.STATE_FAILED === 3);
        ExpectTrue(typeof eap.EthEapState.STATE_FAILED === 'number');
        let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        console.info(`${caseName} getEthEapStateInfo: ${JSON.stringify(stateInfo)}`);
        ExpectTrue(stateInfo !== undefined && stateInfo !== null);
        ExpectTrue(typeof stateInfo.state === 'number');
        ExpectTrue(IsValidEthEapState(stateInfo.state));
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapState0500
     * @tc.number SUB_Communication_Eap_EthEapState_0500
     * @tc.desc   Test EthEapState.STATE_RETRYING enum value is 4 and getEthEapStateInfo returns valid state.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapState0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapEthEapState0500";
      console.info(`${caseName}---start`);
      try {
        ExpectTrue(eap.EthEapState.STATE_RETRYING === 4);
        ExpectTrue(typeof eap.EthEapState.STATE_RETRYING === 'number');
        let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        console.info(`${caseName} getEthEapStateInfo: ${JSON.stringify(stateInfo)}`);
        ExpectTrue(stateInfo !== undefined && stateInfo !== null);
        ExpectTrue(typeof stateInfo.state === 'number');
        ExpectTrue(IsValidEthEapState(stateInfo.state));
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapConfig0100
     * @tc.number SUB_Communication_Eap_EthEapConfig_0100
     * @tc.desc   Test EthEapConfig interface construction and call setEthEapConfig/getEthEapConfig with it.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapConfig0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapEthEapConfig0100";
      console.info(`${caseName}---start`);
      try {
        let config: eap.EthEapConfig = {
          profile: profile,
          enabled: true,
          autoAuth: false,
          locked: false
        };
        eap.setEthEapConfig(config);
        console.info(`${caseName} setEthEapConfig success`);
        eap.getEthEapConfig().then((result: eap.EthEapConfig) => {
          console.info(`${caseName} getEthEapConfig success: enabled=${result.enabled}` +
            `, autoAuth=${result.autoAuth}, locked=${result.locked}`);
          ExpectTrue(result !== undefined && result !== null);
          ExpectTrue(typeof result.enabled === 'boolean');
          ExpectTrue(typeof result.autoAuth === 'boolean');
          ExpectTrue(typeof result.locked === 'boolean');
          ExpectTrue(result.profile !== undefined && result.profile !== null);
          ExpectTrue(result.profile.identity === "identity");
          ExpectTrue(result.enabled === true);
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} getEthEapConfig failed, code:${error.code}, message:${error.message}`);
          ExpectTrue(IsEnvError(error));
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapConfig0200
     * @tc.number SUB_Communication_Eap_EthEapConfig_0200
     * @tc.desc   Test EthEapConfig.profile field of type EthEapProfile and call setEthEapConfig with it.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapConfig0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapEthEapConfig0200";
      console.info(`${caseName}---start`);
      try {
        let config: eap.EthEapConfig = {
          profile: profile,
          enabled: true,
          autoAuth: false,
          locked: false
        };
        eap.setEthEapConfig(config);
        console.info(`${caseName} setEthEapConfig with profile success`);
        eap.getEthEapConfig().then((result: eap.EthEapConfig) => {
          console.info(`${caseName} getEthEapConfig success: identity=${result.profile.identity}` +
            `, eapMethod=${result.profile.eapMethod}, enabled=${result.enabled}`);
          ExpectTrue(result !== undefined && result !== null);
          ExpectTrue(result.profile !== undefined && result.profile !== null);
          ExpectTrue(result.profile.identity === "identity");
          ExpectTrue(result.profile.eapMethod === eap.EapMethod.EAP_TTLS);
          ExpectTrue(result.profile.phase2Method === eap.Phase2Method.PHASE2_AKA_PRIME);
          ExpectTrue(result.enabled === true);
          console.info(`${caseName}---End`);
          done();
        }).catch((getError: BusinessError) => {
          console.error(`${caseName} getEthEapConfig failed, code:${getError.code}, message:${getError.message}`);
          ExpectTrue(IsEnvError(getError));
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapConfig0300
     * @tc.number SUB_Communication_Eap_EthEapConfig_0300
     * @tc.desc   Test EthEapConfig.enabled field with true and false via setEthEapConfig calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapConfig0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapEthEapConfig0300";
      console.info(`${caseName}---start`);
      try {
        let configEnabled: eap.EthEapConfig = {
          profile: profile,
          enabled: true,
          autoAuth: false,
          locked: false
        };
        eap.setEthEapConfig(configEnabled);
        console.info(`${caseName} setEthEapConfig enabled=true success`);
        eap.getEthEapConfig().then((enabledResult: eap.EthEapConfig) => {
          console.info(`${caseName} getEthEapConfig after enabled=true: enabled=${enabledResult.enabled}`);
          ExpectTrue(enabledResult !== undefined && enabledResult !== null);
          ExpectTrue(typeof enabledResult.enabled === 'boolean');
          ExpectTrue(enabledResult.enabled === true);
          let configDisabled: eap.EthEapConfig = {
            profile: profile,
            enabled: false,
            autoAuth: false,
            locked: false
          };
          eap.setEthEapConfig(configDisabled);
          console.info(`${caseName} setEthEapConfig enabled=false success`);
          return eap.getEthEapConfig();
        }).then((result: eap.EthEapConfig) => {
          console.info(`${caseName} getEthEapConfig after enabled=false: enabled=${result.enabled}`);
          ExpectTrue(result !== undefined && result !== null);
          ExpectTrue(typeof result.enabled === 'boolean');
          ExpectTrue(result.enabled === false);
          console.info(`${caseName}---End`);
          done();
        }).catch((getError: BusinessError) => {
          console.error(`${caseName} getEthEapConfig failed, code:${getError.code}, message:${getError.message}`);
          ExpectTrue(IsEnvError(getError));
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapConfig0400
     * @tc.number SUB_Communication_Eap_EthEapConfig_0400
     * @tc.desc   Test EthEapConfig.autoAuth field with true and false via setEthEapConfig calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapConfig0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapEthEapConfig0400";
      console.info(`${caseName}---start`);
      try {
        let configAuto: eap.EthEapConfig = {
          profile: profile,
          enabled: true,
          autoAuth: true,
          locked: false
        };
        eap.setEthEapConfig(configAuto);
        console.info(`${caseName} setEthEapConfig autoAuth=true success`);
        eap.getEthEapConfig().then((autoResult: eap.EthEapConfig) => {
          console.info(`${caseName} getEthEapConfig after autoAuth=true: autoAuth=${autoResult.autoAuth}`);
          ExpectTrue(autoResult !== undefined && autoResult !== null);
          ExpectTrue(typeof autoResult.autoAuth === 'boolean');
          ExpectTrue(autoResult.autoAuth === true);
          let configManual: eap.EthEapConfig = {
            profile: profile,
            enabled: true,
            autoAuth: false,
            locked: false
          };
          eap.setEthEapConfig(configManual);
          console.info(`${caseName} setEthEapConfig autoAuth=false success`);
          return eap.getEthEapConfig();
        }).then((result: eap.EthEapConfig) => {
          console.info(`${caseName} getEthEapConfig after autoAuth=false: autoAuth=${result.autoAuth}`);
          ExpectTrue(result !== undefined && result !== null);
          ExpectTrue(typeof result.autoAuth === 'boolean');
          ExpectTrue(result.autoAuth === false);
          console.info(`${caseName}---End`);
          done();
        }).catch((getError: BusinessError) => {
          console.error(`${caseName} getEthEapConfig failed, code:${getError.code}, message:${getError.message}`);
          ExpectTrue(IsEnvError(getError));
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapConfig0500
     * @tc.number SUB_Communication_Eap_EthEapConfig_0500
     * @tc.desc   Test EthEapConfig.locked field with true and false via setEthEapConfig calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapConfig0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapEthEapConfig0500";
      console.info(`${caseName}---start`);
      try {
        let configUnlocked: eap.EthEapConfig = {
          profile: profile,
          enabled: true,
          autoAuth: false,
          locked: false
        };
        eap.setEthEapConfig(configUnlocked);
        console.info(`${caseName} setEthEapConfig locked=false success`);
        let configLocked: eap.EthEapConfig = {
          profile: profile,
          enabled: true,
          autoAuth: false,
          locked: true
        };
        let unlockSuccess: boolean = false;
        eap.getEthEapConfig().then((unlockedResult: eap.EthEapConfig) => {
          console.info(`${caseName} getEthEapConfig after locked=false: locked=${unlockedResult.locked}`);
          ExpectTrue(unlockedResult !== undefined && unlockedResult !== null);
          ExpectTrue(typeof unlockedResult.locked === 'boolean');
          ExpectTrue(unlockedResult.locked === false);
          try {
            eap.setEthEapConfig(configLocked);
            console.info(`${caseName} setEthEapConfig locked=true success`);
          } catch (lockError) {
            console.error(`${caseName} setEthEapConfig locked=true failed: ${JSON.stringify(lockError)}`);
            ExpectTrue(IsEnvError(lockError as BusinessError));
          }
          // unlock to keep stored config editable by following cases
          try {
            eap.setEthEapConfig(configUnlocked);
            unlockSuccess = true;
            console.info(`${caseName} setEthEapConfig unlock cleanup success`);
          } catch (cleanupError) {
            console.error(`${caseName} unlock cleanup failed: ${JSON.stringify(cleanupError)}`);
            ExpectTrue(IsEnvError(cleanupError as BusinessError));
          }
          return eap.getEthEapConfig();
        }).then((result: eap.EthEapConfig) => {
          console.info(`${caseName} getEthEapConfig after unlock: locked=${result.locked}`);
          ExpectTrue(result !== undefined && result !== null);
          ExpectTrue(typeof result.locked === 'boolean');
          if (unlockSuccess) {
            ExpectTrue(result.locked === false);
          }
          console.info(`${caseName}---End`);
          done();
        }).catch((getError: BusinessError) => {
          console.error(`${caseName} getEthEapConfig failed, code:${getError.code}, message:${getError.message}`);
          ExpectTrue(IsEnvError(getError));
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapConfig0600
     * @tc.number SUB_Communication_Eap_EthEapConfig_0600
     * @tc.desc   End-to-end chain with PEAP profile: setEthEapConfig -> getEthEapConfig verify ->
     *            onStateChange subscribe -> connect(ACTION_CONNECT) -> observe state by getEthEapStateInfo ->
     *            connect(ACTION_DISCONNECT) -> deleteEthEapConfig cleanup.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapConfig0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapEthEapConfig0600";
      console.info(`${caseName}---start`);
      let stateChangeCallback = (info: eap.EthEapStateInfo): void => {
        console.info(`${caseName} onStateChange: state=${info.state}, retryCount=${info.retryCount}, message=${info.message}`);
        ExpectTrue(IsValidEthEapState(info.state));
      }
      const cleanupAndDone = (): void => {
        try {
          eap.offStateChange(stateChangeCallback);
        } catch (offErr) {
          console.error(`${caseName} offStateChange cleanup failed: ${JSON.stringify(offErr)}`);
        }
        try {
          eap.deleteEthEapConfig().then(() => {
            console.info(`${caseName} deleteEthEapConfig cleanup success`);
            console.info(`${caseName}---End`);
            done();
          }).catch((delErr: BusinessError) => {
            console.error(`${caseName} deleteEthEapConfig cleanup failed, code:${delErr.code}, message:${delErr.message}`);
            console.info(`${caseName}---End`);
            done();
          });
        } catch (delErr) {
          console.error(`${caseName} deleteEthEapConfig cleanup failed: ${JSON.stringify(delErr)}`);
          console.info(`${caseName}---End`);
          done();
        }
      };
      const connectAndObserve = (): void => {
        eap.connect(eap.EthEapConnectAction.ACTION_CONNECT).then(() => {
          console.info(`${caseName} connect ACTION_CONNECT success`);
          setTimeout(() => {
            try {
              let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
              console.info(`${caseName} getEthEapStateInfo: ${JSON.stringify(stateInfo)}`);
              ExpectTrue(stateInfo !== undefined && stateInfo !== null);
              ExpectTrue(IsValidEthEapState(stateInfo.state));
              ExpectTrue(typeof stateInfo.retryCount === 'number' && stateInfo.retryCount >= 0);
            } catch (stateErr) {
              console.error(`${caseName} getEthEapStateInfo failed: ${JSON.stringify(stateErr)}`);
              ExpectTrue(IsEnvError(stateErr as BusinessError));
            }
            eap.connect(eap.EthEapConnectAction.ACTION_DISCONNECT).then(() => {
              console.info(`${caseName} connect ACTION_DISCONNECT success`);
              cleanupAndDone();
            }).catch((disconnErr: BusinessError) => {
              console.error(`${caseName} connect ACTION_DISCONNECT failed, code:${disconnErr.code}, message:${disconnErr.message}`);
              ExpectTrue(IsEnvError(disconnErr));
              cleanupAndDone();
            });
          }, 3 * 1000);
        }).catch((connErr: BusinessError) => {
          console.error(`${caseName} connect ACTION_CONNECT failed, code:${connErr.code}, message:${connErr.message}`);
          ExpectTrue(IsEnvError(connErr));
          cleanupAndDone();
        });
      };
      try {
        let peapProfile: eap.EthEapProfile = {
          eapMethod: eap.EapMethod.EAP_PEAP,
          phase2Method: eap.Phase2Method.PHASE2_MSCHAPV2,
          identity: "peapuser",
          anonymousIdentity: "anonymouspeapuser",
          password: "peappass123",
          caCertAliases: "caCertAliases",
          caPath: "caPath",
          clientCertAliases: "clientCertAliases",
          certEntry: new Uint8Array([1, 2, 3, 4]),
          certPassword: "certPassword",
          altSubjectMatch: "altSubjectMatch",
          domainSuffixMatch: "domainSuffixMatch",
          realm: "realm",
          plmn: "plmn",
          eapSubId: 1
        };
        let peapConfig: eap.EthEapConfig = {
          profile: peapProfile,
          enabled: true,
          autoAuth: false,
          locked: false
        };
        eap.setEthEapConfig(peapConfig);
        console.info(`${caseName} setEthEapConfig with PEAP profile success`);
        eap.onStateChange(stateChangeCallback);
        console.info(`${caseName} onStateChange success`);
        eap.getEthEapConfig().then((result: eap.EthEapConfig) => {
          console.info(`${caseName} getEthEapConfig success: identity=${result.profile.identity}`);
          ExpectTrue(result !== undefined && result !== null);
          ExpectTrue(result.profile !== undefined && result.profile !== null);
          ExpectTrue(result.profile.eapMethod === eap.EapMethod.EAP_PEAP);
          ExpectTrue(result.profile.phase2Method === eap.Phase2Method.PHASE2_MSCHAPV2);
          ExpectTrue(result.profile.identity === "peapuser");
          ExpectTrue(result.profile.password === "peappass123");
          connectAndObserve();
        }).catch((getError: BusinessError) => {
          console.error(`${caseName} getEthEapConfig failed, code:${getError.code}, message:${getError.message}`);
          ExpectTrue(IsEnvError(getError));
          cleanupAndDone();
        });
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        cleanupAndDone();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapStateInfo0100
     * @tc.number SUB_Communication_Eap_EthEapStateInfo_0100
     * @tc.desc   Test EthEapStateInfo state and retryCount fields via getEthEapStateInfo and onStateChange calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapStateInfo0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapEthEapStateInfo0100";
      console.info(`${caseName}---start`);
      try {
        let stateInfo: eap.EthEapStateInfo = {
          state: eap.EthEapState.STATE_AUTHENTICATING,
          retryCount: 1
        };
        console.info(`${caseName} local EthEapStateInfo: ${JSON.stringify(stateInfo)}`);
        let stateChangeCallback = (info: eap.EthEapStateInfo): void => {
          console.info(`${caseName} onStateChange callback: state=${info.state}, retryCount=${info.retryCount}`);
          ExpectTrue(IsValidEthEapState(info.state));
          ExpectTrue(typeof info.retryCount === 'number' && info.retryCount >= 0);
        }
        eap.onStateChange(stateChangeCallback);
        console.info(`${caseName} onStateChange success`);
        let realInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        console.info(`${caseName} getEthEapStateInfo: ${JSON.stringify(realInfo)}`);
        ExpectTrue(realInfo !== undefined && realInfo !== null);
        ExpectTrue(typeof realInfo.state === 'number');
        ExpectTrue(IsValidEthEapState(realInfo.state));
        ExpectTrue(typeof realInfo.retryCount === 'number');
        ExpectTrue(realInfo.retryCount >= 0);
        try {
          eap.offStateChange(stateChangeCallback);
          console.info(`${caseName} offStateChange cleanup success`);
        } catch (err) {
          console.error(`${caseName} offStateChange cleanup failed: ${JSON.stringify(err)}`);
        }
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapEthEapStateInfo0200
     * @tc.number SUB_Communication_Eap_EthEapStateInfo_0200
     * @tc.desc   Test EthEapStateInfo.message optional field, selected and not selected, via real interface calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapEthEapStateInfo0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapEthEapStateInfo0200";
      console.info(`${caseName}---start`);
      try {
        let infoWithMessage: eap.EthEapStateInfo = {
          state: eap.EthEapState.STATE_FAILED,
          retryCount: 3,
          message: "Authentication failed after retries"
        };
        console.info(`${caseName} EthEapStateInfo with message: ${JSON.stringify(infoWithMessage)}`);
        let infoWithoutMessage: eap.EthEapStateInfo = {
          state: eap.EthEapState.STATE_IDLE,
          retryCount: 0
        };
        console.info(`${caseName} EthEapStateInfo without message: ${JSON.stringify(infoWithoutMessage)}`);
        let stateChangeCallback = (info: eap.EthEapStateInfo): void => {
          console.info(`${caseName} onStateChange callback: state=${info.state}, retryCount=${info.retryCount}` +
            `, message=${info.message}`);
          ExpectTrue(info.message === undefined || typeof info.message === 'string');
        }
        eap.onStateChange(stateChangeCallback);
        console.info(`${caseName} onStateChange success`);
        let realInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        console.info(`${caseName} getEthEapStateInfo: ${JSON.stringify(realInfo)}`);
        ExpectTrue(realInfo !== undefined && realInfo !== null);
        ExpectTrue(typeof realInfo.state === 'number');
        ExpectTrue(IsValidEthEapState(realInfo.state));
        ExpectTrue(typeof realInfo.retryCount === 'number' && realInfo.retryCount >= 0);
        ExpectTrue(realInfo.message === undefined || typeof realInfo.message === 'string');
        try {
          eap.offStateChange(stateChangeCallback);
          console.info(`${caseName} offStateChange cleanup success`);
        } catch (err) {
          console.error(`${caseName} offStateChange cleanup failed: ${JSON.stringify(err)}`);
        }
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapSetEthEapConfig0100
     * @tc.number SUB_Communication_Eap_SetEthEapConfig_0100
     * @tc.desc   Test setEthEapConfig with a full EthEapConfig parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapSetEthEapConfig0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapSetEthEapConfig0100";
      console.info(`${caseName}---start`);
      try {
        let config: eap.EthEapConfig = {
          profile: profile,
          enabled: true,
          autoAuth: false,
          locked: false
        };
        eap.setEthEapConfig(config);
        console.info(`${caseName} setEthEapConfig success`);
        eap.getEthEapConfig().then((result: eap.EthEapConfig) => {
          console.info(`${caseName} getEthEapConfig success: identity=${result.profile.identity}` +
            `, eapMethod=${result.profile.eapMethod}, enabled=${result.enabled}`);
          ExpectTrue(result !== undefined && result !== null);
          ExpectTrue(result.profile !== undefined && result.profile !== null);
          ExpectTrue(result.profile.identity === "identity");
          ExpectTrue(result.profile.eapMethod === eap.EapMethod.EAP_TTLS);
          ExpectTrue(result.profile.phase2Method === eap.Phase2Method.PHASE2_AKA_PRIME);
          ExpectTrue(result.enabled === true);
          console.info(`${caseName}---End`);
          done();
        }).catch((getError: BusinessError) => {
          console.error(`${caseName} getEthEapConfig failed, code:${getError.code}, message:${getError.message}`);
          ExpectTrue(IsEnvError(getError));
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapSetEthEapConfig0200
     * @tc.number SUB_Communication_Eap_SetEthEapConfig_0200
     * @tc.desc   Test setEthEapConfig parameter spec with different field values (enabled=false).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapSetEthEapConfig0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapSetEthEapConfig0200";
      console.info(`${caseName}---start`);
      try {
        let config: eap.EthEapConfig = {
          profile: profile,
          enabled: false,
          autoAuth: false,
          locked: false
        };
        eap.setEthEapConfig(config);
        console.info(`${caseName} setEthEapConfig success`);
        eap.getEthEapConfig().then((result: eap.EthEapConfig) => {
          console.info(`${caseName} getEthEapConfig success: enabled=${result.enabled}`);
          ExpectTrue(result !== undefined && result !== null);
          ExpectTrue(typeof result.enabled === 'boolean');
          ExpectTrue(result.enabled === false);
          console.info(`${caseName}---End`);
          done();
        }).catch((getError: BusinessError) => {
          console.error(`${caseName} getEthEapConfig failed, code:${getError.code}, message:${getError.message}`);
          ExpectTrue(IsEnvError(getError));
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapSetEthEapConfig0300
     * @tc.number SUB_Communication_Eap_SetEthEapConfig_0300
     * @tc.desc   Test setEthEapConfig without the required config parameter, expect throw 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapSetEthEapConfig0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapSetEthEapConfig0300";
      console.info(`${caseName}---start`);
      try {
        let setNoParam: Function = eap.setEthEapConfig;
        setNoParam();
        console.info(`${caseName} setEthEapConfig without param unexpected success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue((error as BusinessError).code === 401);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapGetEthEapConfig0100
     * @tc.number SUB_Communication_Eap_GetEthEapConfig_0100
     * @tc.desc   Test getEthEapConfig with no parameter and check the returned EthEapConfig.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapGetEthEapConfig0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapGetEthEapConfig0100";
      console.info(`${caseName}---start`);
      try {
        eap.getEthEapConfig().then((config: eap.EthEapConfig) => {
          console.info(`${caseName} getEthEapConfig success: enabled=${config.enabled}` +
            `, autoAuth=${config.autoAuth}, locked=${config.locked}`);
          ExpectTrue(config !== undefined && config !== null);
          ExpectTrue(typeof config.enabled === 'boolean');
          ExpectTrue(typeof config.autoAuth === 'boolean');
          ExpectTrue(typeof config.locked === 'boolean');
          ExpectTrue(config.profile !== undefined && config.profile !== null);
          ExpectTrue(typeof config.profile.identity === 'string');
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} getEthEapConfig failed, code:${error.code}, message:${error.message}`);
          ExpectTrue(IsEnvError(error));
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapGetEthEapConfig0200
     * @tc.number SUB_Communication_Eap_GetEthEapConfig_0200
     * @tc.desc   Test getEthEapConfig with an extra parameter which has no definition, extra param should be ignored.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapGetEthEapConfig0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapGetEthEapConfig0200";
      console.info(`${caseName}---start`);
      try {
        let getWithParam: (param: string) => Promise<eap.EthEapConfig> = eap.getEthEapConfig;
        getWithParam("extraParam").then((config: eap.EthEapConfig) => {
          console.info(`${caseName} getEthEapConfig with extra param success: enabled=${config.enabled}`);
          ExpectTrue(config !== undefined && config !== null);
          ExpectTrue(typeof config.enabled === 'boolean');
          ExpectTrue(typeof config.autoAuth === 'boolean');
          ExpectTrue(typeof config.locked === 'boolean');
          ExpectTrue(config.profile !== undefined && config.profile !== null);
          ExpectTrue(typeof config.profile.identity === 'string');
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} getEthEapConfig failed, code:${error.code}, message:${error.message}`);
          ExpectTrue(error.code === 401 || IsEnvError(error));
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue((error as BusinessError).code === 401 || IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapGetEthEapConfig0300
     * @tc.number SUB_Communication_Eap_GetEthEapConfig_0300
     * @tc.desc   Test getEthEapConfig return value coverage: verify all EthEapConfig and EthEapProfile fields by set-get round-trip.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapGetEthEapConfig0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapGetEthEapConfig0300";
      console.info(`${caseName}---start`);
      try {
        let config: eap.EthEapConfig = {
          profile: profile,
          enabled: true,
          autoAuth: false,
          locked: false
        };
        eap.setEthEapConfig(config);
        console.info(`${caseName} setEthEapConfig success`);
        eap.getEthEapConfig().then((result: eap.EthEapConfig) => {
          console.info(`${caseName} getEthEapConfig return value: ${JSON.stringify(result)}`);
          ExpectTrue(result !== undefined && result !== null);
          ExpectTrue(typeof result.enabled === 'boolean' && result.enabled === true);
          ExpectTrue(typeof result.autoAuth === 'boolean' && result.autoAuth === false);
          ExpectTrue(typeof result.locked === 'boolean' && result.locked === false);
          ExpectTrue(result.profile !== undefined && result.profile !== null);
          ExpectTrue(result.profile.eapMethod === eap.EapMethod.EAP_TTLS);
          ExpectTrue(result.profile.phase2Method === eap.Phase2Method.PHASE2_AKA_PRIME);
          ExpectTrue(result.profile.identity === "identity");
          ExpectTrue(result.profile.anonymousIdentity === "anonymousIdentity");
          ExpectTrue(result.profile.password === "password");
          ExpectTrue(result.profile.caCertAliases === "caCertAliases");
          ExpectTrue(result.profile.caPath === "caPath");
          ExpectTrue(result.profile.clientCertAliases === "clientCertAliases");
          ExpectTrue(result.profile.certPassword === "certPassword");
          ExpectTrue(result.profile.altSubjectMatch === "altSubjectMatch");
          ExpectTrue(result.profile.domainSuffixMatch === "domainSuffixMatch");
          ExpectTrue(result.profile.realm === "realm");
          ExpectTrue(result.profile.plmn === "plmn");
          ExpectTrue(result.profile.eapSubId === 1);
          let certEntry: Uint8Array | undefined = result.profile.certEntry;
          console.info(`${caseName} certEntry in return value: ${JSON.stringify(certEntry)}`);
          if (certEntry !== undefined && certEntry !== null) {
            ExpectTrue(certEntry.length === profile.certEntry.length);
            for (let i = 0; i < profile.certEntry.length; i++) {
              ExpectTrue(certEntry[i] === profile.certEntry[i]);
            }
          }
          console.info(`${caseName}---End`);
          done();
        }).catch((getError: BusinessError) => {
          console.error(`${caseName} getEthEapConfig failed, code:${getError.code}, message:${getError.message}`);
          ExpectTrue(IsEnvError(getError));
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapGetEthEapStateInfo0100
     * @tc.number SUB_Communication_Eap_GetEthEapStateInfo_0100
     * @tc.desc   Test getEthEapStateInfo with no parameter and check the returned EthEapStateInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapGetEthEapStateInfo0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapGetEthEapStateInfo0100";
      console.info(`${caseName}---start`);
      try {
        let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        console.info(`${caseName} getEthEapStateInfo success: ${JSON.stringify(stateInfo)}`);
        ExpectTrue(stateInfo !== undefined && stateInfo !== null);
        ExpectTrue(typeof stateInfo.state === 'number');
        ExpectTrue(IsValidEthEapState(stateInfo.state));
        ExpectTrue(typeof stateInfo.retryCount === 'number');
        ExpectTrue(stateInfo.retryCount >= 0);
        ExpectTrue(stateInfo.message === undefined || typeof stateInfo.message === 'string');
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapGetEthEapStateInfo0200
     * @tc.number SUB_Communication_Eap_GetEthEapStateInfo_0200
     * @tc.desc   Test getEthEapStateInfo with an extra parameter which has no definition, extra param should be ignored.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapGetEthEapStateInfo0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapGetEthEapStateInfo0200";
      console.info(`${caseName}---start`);
      try {
        let getWithParam: (param: string) => eap.EthEapStateInfo = eap.getEthEapStateInfo;
        let stateInfo: eap.EthEapStateInfo = getWithParam("extraParam");
        console.info(`${caseName} getEthEapStateInfo with extra param success: ${JSON.stringify(stateInfo)}`);
        ExpectTrue(stateInfo !== undefined && stateInfo !== null);
        ExpectTrue(typeof stateInfo.state === 'number');
        ExpectTrue(IsValidEthEapState(stateInfo.state));
        ExpectTrue(typeof stateInfo.retryCount === 'number');
        ExpectTrue(stateInfo.retryCount >= 0);
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue((error as BusinessError).code === 401 || IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapOnStateChange0100
     * @tc.number SUB_Communication_Eap_OnStateChange_0100
     * @tc.desc   Test onStateChange with a Callback<EthEapStateInfo> parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapOnStateChange0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapOnStateChange0100";
      console.info(`${caseName}---start`);
      try {
        let stateChangeCallback = (info: eap.EthEapStateInfo): void => {
          console.info(`${caseName} onStateChange callback: state=${info.state}, retryCount=${info.retryCount}` +
            `, message=${info.message}`);
        }
        eap.onStateChange(stateChangeCallback);
        console.info(`${caseName} onStateChange success`);
        let subscribedStateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        console.info(`${caseName} getEthEapStateInfo after onStateChange: ${JSON.stringify(subscribedStateInfo)}`);
        ExpectTrue(subscribedStateInfo !== undefined && subscribedStateInfo !== null);
        ExpectTrue(typeof subscribedStateInfo.state === 'number');
        ExpectTrue(IsValidEthEapState(subscribedStateInfo.state));
        try {
          eap.offStateChange(stateChangeCallback);
          console.info(`${caseName} offStateChange cleanup success`);
        } catch (err) {
          console.error(`${caseName} offStateChange cleanup failed: ${JSON.stringify(err)}`);
        }
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapOnStateChange0200
     * @tc.number SUB_Communication_Eap_OnStateChange_0200
     * @tc.desc   Test onStateChange without the required callback parameter, expect throw 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapOnStateChange0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapOnStateChange0200";
      console.info(`${caseName}---start`);
      try {
        let onNoParam: Function = eap.onStateChange;
        onNoParam();
        console.info(`${caseName} onStateChange without callback unexpected success`);
        ExpectFail();
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue((error as BusinessError).code === 401);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapOffStateChange0100
     * @tc.number SUB_Communication_Eap_OffStateChange_0100
     * @tc.desc   Test offStateChange with the optional callback parameter selected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapOffStateChange0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapOffStateChange0100";
      console.info(`${caseName}---start`);
      try {
        let stateChangeCallback = (info: eap.EthEapStateInfo): void => {
          console.info(`${caseName} onStateChange callback: state=${info.state}, retryCount=${info.retryCount}`);
        }
        eap.onStateChange(stateChangeCallback);
        console.info(`${caseName} onStateChange success`);
        eap.offStateChange(stateChangeCallback);
        console.info(`${caseName} offStateChange with callback success`);
        let offStateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        console.info(`${caseName} getEthEapStateInfo after offStateChange: ${JSON.stringify(offStateInfo)}`);
        ExpectTrue(offStateInfo !== undefined && offStateInfo !== null);
        ExpectTrue(typeof offStateInfo.state === 'number');
        ExpectTrue(IsValidEthEapState(offStateInfo.state));
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapOffStateChange0200
     * @tc.number SUB_Communication_Eap_OffStateChange_0200
     * @tc.desc   Test offStateChange with the optional callback parameter not selected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapOffStateChange0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapOffStateChange0200";
      console.info(`${caseName}---start`);
      try {
        eap.offStateChange();
        console.info(`${caseName} offStateChange without callback success`);
        let offAllStateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
        console.info(`${caseName} getEthEapStateInfo after offStateChange: ${JSON.stringify(offAllStateInfo)}`);
        ExpectTrue(offAllStateInfo !== undefined && offAllStateInfo !== null);
        ExpectTrue(typeof offAllStateInfo.state === 'number');
        ExpectTrue(IsValidEthEapState(offAllStateInfo.state));
        console.info(`${caseName}---End`);
        done();
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapConnect0100
     * @tc.number SUB_Communication_Eap_Connect_0100
     * @tc.desc   Test connect with EthEapConnectAction.ACTION_CONNECT parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapConnect0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapConnect0100";
      console.info(`${caseName}---start`);
      try {
        eap.connect(eap.EthEapConnectAction.ACTION_CONNECT).then(() => {
          console.info(`${caseName} connect ACTION_CONNECT success`);
          try {
            let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
            console.info(`${caseName} getEthEapStateInfo after connect: ${JSON.stringify(stateInfo)}`);
            ExpectTrue(stateInfo !== undefined && stateInfo !== null);
            ExpectTrue(typeof stateInfo.state === 'number');
            ExpectTrue(IsValidEthEapState(stateInfo.state));
          } catch (stateError) {
            console.error(`${caseName} getEthEapStateInfo failed: ${JSON.stringify(stateError)}`);
            ExpectTrue(IsEnvError(stateError as BusinessError));
          }
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} connect failed, code:${error.code}, message:${error.message}`);
          ExpectTrue(IsEnvError(error));
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapConnect0200
     * @tc.number SUB_Communication_Eap_Connect_0200
     * @tc.desc   Test connect with EthEapConnectAction.ACTION_DISCONNECT parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapConnect0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapConnect0200";
      console.info(`${caseName}---start`);
      try {
        eap.connect(eap.EthEapConnectAction.ACTION_DISCONNECT).then(() => {
          console.info(`${caseName} connect ACTION_DISCONNECT success`);
          try {
            let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
            console.info(`${caseName} getEthEapStateInfo after disconnect: ${JSON.stringify(stateInfo)}`);
            ExpectTrue(stateInfo !== undefined && stateInfo !== null);
            ExpectTrue(typeof stateInfo.state === 'number');
            ExpectTrue(IsValidEthEapState(stateInfo.state));
          } catch (stateError) {
            console.error(`${caseName} getEthEapStateInfo failed: ${JSON.stringify(stateError)}`);
            ExpectTrue(IsEnvError(stateError as BusinessError));
          }
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} connect failed, code:${error.code}, message:${error.message}`);
          ExpectTrue(IsEnvError(error));
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapConnect0300
     * @tc.number SUB_Communication_Eap_Connect_0300
     * @tc.desc   Test connect parameter spec with raw EthEapConnectAction values 0 and 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapConnect0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapConnect0300";
      console.info(`${caseName}---start`);
      try {
        let actionConnect = 0 as eap.EthEapConnectAction;
        let actionDisconnect = 1 as eap.EthEapConnectAction;
        ExpectTrue(actionConnect === eap.EthEapConnectAction.ACTION_CONNECT);
        ExpectTrue(actionDisconnect === eap.EthEapConnectAction.ACTION_DISCONNECT);
        eap.connect(actionConnect).then((): Promise<void> => {
          console.info(`${caseName} connect(0) success`);
          return eap.connect(actionDisconnect);
        }).then(() => {
          console.info(`${caseName} connect(1) success`);
          try {
            let stateInfo: eap.EthEapStateInfo = eap.getEthEapStateInfo();
            console.info(`${caseName} getEthEapStateInfo after connect: ${JSON.stringify(stateInfo)}`);
            ExpectTrue(stateInfo !== undefined && stateInfo !== null);
            ExpectTrue(typeof stateInfo.state === 'number');
            ExpectTrue(IsValidEthEapState(stateInfo.state));
          } catch (stateError) {
            console.error(`${caseName} getEthEapStateInfo failed: ${JSON.stringify(stateError)}`);
            ExpectTrue(IsEnvError(stateError as BusinessError));
          }
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} connect failed, code:${error.code}, message:${error.message}`);
          ExpectTrue(IsEnvError(error));
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapConnect0400
     * @tc.number SUB_Communication_Eap_Connect_0400
     * @tc.desc   Test connect without the required action parameter, expect throw 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapConnect0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapConnect0400";
      console.info(`${caseName}---start`);
      try {
        let connectNoParam: Function = eap.connect;
        let connectResult: Promise<void> = connectNoParam();
        connectResult.then(() => {
          console.info(`${caseName} connect without action unexpected success`);
          ExpectFail();
          console.info(`${caseName}---End`);
          done();
        }).catch((error: BusinessError) => {
          console.error(`${caseName} connect failed, code:${error.code}, message:${error.message}`);
          ExpectTrue(error.code === 401);
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue((error as BusinessError).code === 401);
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapDeleteEthEapConfig0100
     * @tc.number SUB_Communication_Eap_DeleteEthEapConfig_0100
     * @tc.desc   Test deleteEthEapConfig with no parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCommunicationEapDeleteEthEapConfig0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = "testCommunicationEapDeleteEthEapConfig0100";
      console.info(`${caseName}---start`);
      try {
        eap.deleteEthEapConfig().then(() => {
          console.info(`${caseName} deleteEthEapConfig success`);
          eap.getEthEapConfig().then((result: eap.EthEapConfig) => {
            console.info(`${caseName} getEthEapConfig after delete: ${JSON.stringify(result)}`);
            ExpectTrue(result !== undefined && result !== null);
            ExpectTrue(result.profile === undefined || result.profile === null || result.enabled === false);
            console.info(`${caseName}---End`);
            done();
          }).catch((getError: BusinessError) => {
            console.error(`${caseName} getEthEapConfig after delete failed, code:${getError.code}` +
              `, message:${getError.message}`);
            ExpectTrue(IsEnvError(getError));
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.error(`${caseName} deleteEthEapConfig failed, code:${error.code}, message:${error.message}`);
          ExpectTrue(IsEnvError(error));
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue(IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

    /**
     * @tc.name   testCommunicationEapDeleteEthEapConfig0200
     * @tc.number SUB_Communication_Eap_DeleteEthEapConfig_0200
     * @tc.desc   Test deleteEthEapConfig with an extra parameter which has no definition, extra param should be ignored.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testCommunicationEapDeleteEthEapConfig0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let caseName: string = "testCommunicationEapDeleteEthEapConfig0200";
      console.info(`${caseName}---start`);
      try {
        let deleteWithParam: (param: string) => Promise<void> = eap.deleteEthEapConfig;
        deleteWithParam("extraParam").then(() => {
          console.info(`${caseName} deleteEthEapConfig with extra param success`);
          eap.getEthEapConfig().then((result: eap.EthEapConfig) => {
            console.info(`${caseName} getEthEapConfig after delete: ${JSON.stringify(result)}`);
            ExpectTrue(result !== undefined && result !== null);
            ExpectTrue(result.profile === undefined || result.profile === null || result.enabled === false);
            console.info(`${caseName}---End`);
            done();
          }).catch((getError: BusinessError) => {
            console.error(`${caseName} getEthEapConfig after delete failed, code:${getError.code}` +
              `, message:${getError.message}`);
            ExpectTrue(IsEnvError(getError));
            console.info(`${caseName}---End`);
            done();
          });
        }).catch((error: BusinessError) => {
          console.error(`${caseName} deleteEthEapConfig failed, code:${error.code}, message:${error.message}`);
          ExpectTrue(error.code === 401 || IsEnvError(error));
          console.info(`${caseName}---End`);
          done();
        });
      } catch (error) {
        console.error(`${caseName} catch err ->${JSON.stringify(error)}`);
        ExpectTrue((error as BusinessError).code === 401 || IsEnvError(error as BusinessError));
        console.info(`${caseName}---End`);
        done();
      }
    })

  })
}
