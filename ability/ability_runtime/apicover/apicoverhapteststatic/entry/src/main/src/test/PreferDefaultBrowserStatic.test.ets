'use static'
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import StartOptions from '@ohos.app.ability.StartOptions';

const HTTPS_URI: string = 'https://www.example.com';
const HTTP_URI: string = 'http://www.example.com';
const SELF_BUNDLE: string = 'com.example.apicoverhaptest.static';
const INVALID_PARAM_ERR: number = 401;

function httpsWant(): Want {
  return { uri: HTTPS_URI };
}

function httpWant(): Want {
  return { uri: HTTP_URI };
}

function optionsPrefer(prefer: boolean): StartOptions {
  return { preferDefaultBrowser: prefer };
}

function optionsOmit(): StartOptions {
  return {};
}

function requireContext(): common.UIAbilityContext {
  return AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
}

function finishPreferCase(tag: string, prefer: boolean, err: Error | undefined,
  done: () => void): void {
  let options: StartOptions = optionsPrefer(prefer);
  expect(options.preferDefaultBrowser).assertEqual(prefer);
  if (err === undefined || err.code === 0) {
    hilog.info(0x0000, tag, 'success');
    done();
    return;
  }
  hilog.info(0x0000, tag, `err code=${err.code} msg=${err.message}`);
  expect(err.code === INVALID_PARAM_ERR).assertFalse();
  done();
}

function finishPreferLoose(tag: string, err: Error | undefined, done: () => void): void {
  if (err === undefined || err.code === 0) {
    hilog.info(0x0000, tag, 'success');
    done();
    return;
  }
  hilog.info(0x0000, tag, `err code=${err.code} msg=${err.message}`);
  expect(true).assertTrue();
  done();
}

function finishPreferCatch(tag: string, prefer: boolean, error: Object, done: () => void): void {
  hilog.info(0x0000, tag, `catch ${JSON.stringify(error)}`);
  let options: StartOptions = optionsPrefer(prefer);
  expect(options.preferDefaultBrowser).assertEqual(prefer);
  done();
}

function finishPreferLooseCatch(tag: string, error: Object, done: () => void): void {
  hilog.info(0x0000, tag, `catch ${JSON.stringify(error)}`);
  expect(true).assertTrue();
  done();
}

export default function PreferDefaultBrowserStaticTest(): void {
  describe('PreferDefaultBrowserStaticTest', () => {
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0100
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0100
     * @tc.desc   startAbility callback https prefer true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const tag: string = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0100';
        let preferFlag: boolean = true;
        expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
        try {
          requireContext().startAbility(httpsWant(), optionsPrefer(true), (err: BusinessError | null) => {
            finishPreferCase(tag, true, err === null ? undefined : err, done);
          });
        } catch (error) {
          finishPreferCatch(tag, true, error, done);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0200
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0200
     * @tc.desc   startAbility promise https prefer true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const tag: string = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0200';
        let preferFlag: boolean = true;
        expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
        try {
          requireContext().startAbility(httpsWant(), optionsPrefer(true))
            .then((): void => {
              finishPreferCase(tag, true, undefined, done);
            })
            .catch((err: Error): void => {
              finishPreferCase(tag, true, err, done);
            });
        } catch (error) {
          finishPreferCatch(tag, true, error, done);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0300
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0300
     * @tc.desc   startAbility callback https prefer false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const tag: string = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0300';
        let preferFlag: boolean = false;
        expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
        try {
          requireContext().startAbility(httpsWant(), optionsPrefer(false), (err: BusinessError | null) => {
            finishPreferCase(tag, false, err === null ? undefined : err, done);
          });
        } catch (error) {
          finishPreferCatch(tag, false, error, done);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0400
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0400
     * @tc.desc   startAbility promise https prefer false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const tag: string = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0400';
        let preferFlag: boolean = false;
        expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
        try {
          requireContext().startAbility(httpsWant(), optionsPrefer(false))
            .then((): void => {
              finishPreferCase(tag, false, undefined, done);
            })
            .catch((err: Error): void => {
              finishPreferCase(tag, false, err, done);
            });
        } catch (error) {
          finishPreferCatch(tag, false, error, done);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0500
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0500
     * @tc.desc   startAbility callback http prefer true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const tag: string = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0500';
        let preferFlag: boolean = true;
        expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
        try {
          requireContext().startAbility(httpWant(), optionsPrefer(true), (err: BusinessError | null) => {
            finishPreferCase(tag, true, err === null ? undefined : err, done);
          });
        } catch (error) {
          finishPreferCatch(tag, true, error, done);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0600
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0600
     * @tc.desc   startAbility promise http prefer true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const tag: string = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0600';
        let preferFlag: boolean = true;
        expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
        try {
          requireContext().startAbility(httpWant(), optionsPrefer(true))
            .then((): void => {
              finishPreferCase(tag, true, undefined, done);
            })
            .catch((err: Error): void => {
              finishPreferCase(tag, true, err, done);
            });
        } catch (error) {
          finishPreferCatch(tag, true, error, done);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0700
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0700
     * @tc.desc   startAbility callback non-http prefer true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const tag: string = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0700';
        let preferFlag: boolean = true;
        expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
        try {
          let want: Want = {
            bundleName: SELF_BUNDLE,
            abilityName: 'EntryAbility2'
          };
          requireContext().startAbility(want, optionsPrefer(true), (err: BusinessError | null) => {
            finishPreferCase(tag, true, err === null ? undefined : err, done);
          });
        } catch (error) {
          finishPreferCatch(tag, true, error, done);
        }
      });


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0800
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0800
     * @tc.desc   startAbility callback https prefer omitted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const tag: string = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0800';
        try {
          requireContext().startAbility(httpsWant(), optionsOmit(), (err: BusinessError | null) => {
            finishPreferLoose(tag, err === null ? undefined : err, done);
          });
        } catch (error) {
          finishPreferLooseCatch(tag, error, done);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0900
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0900
     * @tc.desc   startAbility callback http prefer false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const tag: string = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_0900';
        let preferFlag: boolean = false;
        expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
        try {
          requireContext().startAbility(httpWant(), optionsPrefer(false), (err: BusinessError | null) => {
            finishPreferCase(tag, false, err === null ? undefined : err, done);
          });
        } catch (error) {
          finishPreferCatch(tag, false, error, done);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_1000
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_1000
     * @tc.desc   startAbility promise http prefer false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const tag: string = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_1000';
        let preferFlag: boolean = false;
        expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
        try {
          requireContext().startAbility(httpWant(), optionsPrefer(false))
            .then((): void => {
              finishPreferCase(tag, false, undefined, done);
            })
            .catch((err: Error): void => {
              finishPreferCase(tag, false, err, done);
            });
        } catch (error) {
          finishPreferCatch(tag, false, error, done);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_1100
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_1100
     * @tc.desc   startAbility callback http prefer omitted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const tag: string = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_StartAbility_1100';
        try {
          requireContext().startAbility(httpWant(), optionsOmit(), (err: BusinessError | null) => {
            finishPreferLoose(tag, err === null ? undefined : err, done);
          });
        } catch (error) {
          finishPreferLooseCatch(tag, error, done);
        }
      });


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_AsCaller_0100
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_AsCaller_0100
     * @tc.desc   startAbilityAsCaller callback https prefer true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_AsCaller_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const tag: string = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_AsCaller_0100';
        let preferFlag: boolean = true;
        expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
        try {
          requireContext().startAbilityAsCaller(httpsWant(), optionsPrefer(true), (err: BusinessError | null): void => {
            finishPreferCase(tag, true, err === null ? undefined : err, done);
          });
        } catch (error) {
          finishPreferCatch(tag, true, error, done);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_AsCaller_0200
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_AsCaller_0200
     * @tc.desc   startAbilityAsCaller promise https prefer true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_AsCaller_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const tag: string = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_AsCaller_0200';
        let preferFlag: boolean = true;
        expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
        try {
          requireContext().startAbilityAsCaller(httpsWant(), optionsPrefer(true))
            .then((): void => {
              finishPreferCase(tag, true, undefined, done);
            })
            .catch((err: Error): void => {
              finishPreferCase(tag, true, err, done);
            });
        } catch (error) {
          finishPreferCatch(tag, true, error, done);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_WithAccount_0100
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_WithAccount_0100
     * @tc.desc   startAbilityWithAccount callback https prefer true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_WithAccount_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const tag: string = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_WithAccount_0100';
        let preferFlag: boolean = true;
        expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
        try {
          requireContext().startAbilityWithAccount(httpsWant(), 100, optionsPrefer(true), (err: BusinessError | null): void => {
            finishPreferCase(tag, true, err === null ? undefined : err, done);
          });
        } catch (error) {
          finishPreferCatch(tag, true, error, done);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_WithAccount_0200
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_WithAccount_0200
     * @tc.desc   startAbilityWithAccount promise https prefer true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_WithAccount_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const tag: string = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_WithAccount_0200';
        let preferFlag: boolean = true;
        expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
        try {
          requireContext().startAbilityWithAccount(httpsWant(), 100, optionsPrefer(true))
            .then((): void => {
              finishPreferCase(tag, true, undefined, done);
            })
            .catch((err: Error): void => {
              finishPreferCase(tag, true, err, done);
            });
        } catch (error) {
          finishPreferCatch(tag, true, error, done);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_ForResult_0100
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_ForResult_0100
     * @tc.desc   startAbilityForResult callback https prefer true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_ForResult_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const tag: string = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_ForResult_0100';
        let preferFlag: boolean = true;
        expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
        try {
          requireContext().startAbilityForResult(httpsWant(), optionsPrefer(true), (err: BusinessError | null): void => {
            finishPreferCase(tag, true, err === null ? undefined : err, done);
          });
        } catch (error) {
          finishPreferCatch(tag, true, error, done);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_ForResult_0200
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_ForResult_0200
     * @tc.desc   startAbilityForResult promise https prefer true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_ForResult_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const tag: string = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_ForResult_0200';
        let preferFlag: boolean = true;
        expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
        try {
          requireContext().startAbilityForResult(httpsWant(), optionsPrefer(true))
            .then((): void => {
              finishPreferCase(tag, true, undefined, done);
            })
            .catch((err: Error): void => {
              finishPreferCase(tag, true, err, done);
            });
        } catch (error) {
          finishPreferCatch(tag, true, error, done);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_ForResultWithAccount_0100
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_ForResultWithAccount_0100
     * @tc.desc   startAbilityForResultWithAccount callback https prefer true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_ForResultWithAccount_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const tag: string = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_ForResultWithAccount_0100';
        let preferFlag: boolean = true;
        expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
        try {
          requireContext().startAbilityForResultWithAccount(httpsWant(), 100, optionsPrefer(true), (err: BusinessError | null): void => {
            finishPreferCase(tag, true, err === null ? undefined : err, done);
          });
        } catch (error) {
          finishPreferCatch(tag, true, error, done);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_ForResultWithAccount_0200
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_ForResultWithAccount_0200
     * @tc.desc   startAbilityForResultWithAccount promise https prefer true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_ForResultWithAccount_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const tag: string = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_ForResultWithAccount_0200';
        let preferFlag: boolean = true;
        expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
        try {
          requireContext().startAbilityForResultWithAccount(httpsWant(), 100, optionsPrefer(true))
            .then((): void => {
              finishPreferCase(tag, true, undefined, done);
            })
            .catch((err: Error): void => {
              finishPreferCase(tag, true, err, done);
            });
        } catch (error) {
          finishPreferCatch(tag, true, error, done);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_Recent_0100
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_Recent_0100
     * @tc.desc   startRecentAbility callback https prefer true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_Recent_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const tag: string = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_Recent_0100';
        let preferFlag: boolean = true;
        expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
        try {
          requireContext().startRecentAbility(httpsWant(), optionsPrefer(true), (err: BusinessError | null): void => {
            finishPreferCase(tag, true, err === null ? undefined : err, done);
          });
        } catch (error) {
          finishPreferCatch(tag, true, error, done);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_Recent_0200
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_Recent_0200
     * @tc.desc   startRecentAbility promise https prefer true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_Recent_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const tag: string = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_Recent_0200';
        let preferFlag: boolean = true;
        expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
        try {
          requireContext().startRecentAbility(httpsWant(), optionsPrefer(true))
            .then((): void => {
              finishPreferCase(tag, true, undefined, done);
            })
            .catch((err: Error): void => {
              finishPreferCase(tag, true, err, done);
            });
        } catch (error) {
          finishPreferCatch(tag, true, error, done);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_SelfUIAbility_0100
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_SelfUIAbility_0100
     * @tc.desc   startSelfUIAbilityInCurrentProcess https prefer true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_SelfUIAbility_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        const tag: string = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Static_SelfUIAbility_0100';
        let preferFlag: boolean = true;
        expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
        try {
          requireContext().startSelfUIAbilityInCurrentProcess(httpsWant(), '1', optionsPrefer(true))
            .then((): void => {
              finishPreferCase(tag, true, undefined, done);
            })
            .catch((err: Error): void => {
              finishPreferCase(tag, true, err, done);
            });
        } catch (error) {
          finishPreferCatch(tag, true, error, done);
        }
      });

  });
}
