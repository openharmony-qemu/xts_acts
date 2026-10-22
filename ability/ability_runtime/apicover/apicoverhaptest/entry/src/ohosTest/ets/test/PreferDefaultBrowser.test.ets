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

import { describe, beforeAll, afterEach, it, expect, Level } from '@ohos/hypium-dynamic';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import StartOptions from '@ohos.app.ability.StartOptions';
import { BusinessError } from '@ohos.base';
import { Driver } from '@ohos.UiTest';

const HTTPS_URI = 'https://www.example.com';
const HTTP_URI = 'http://www.example.com';
const SELF_BUNDLE = 'com.example.apicoverhaptest';
const INVALID_PARAM_ERR = 401;

function getContext(): common.UIAbilityContext {
  return AppStorage.get<common.UIAbilityContext>('abilityContext')!;
}

function httpsWant(): Want {
  return { uri: HTTPS_URI };
}

function httpWant(): Want {
  return { uri: HTTP_URI };
}

function optionsPrefer(prefer: boolean): StartOptions {
  return { preferDefaultBrowser: prefer };
}

function finishPreferCase(tag: string, prefer: boolean, err: BusinessError | undefined, done: Function): void {
  let options = optionsPrefer(prefer);
  expect(options.preferDefaultBrowser).assertEqual(prefer);
  if (err === undefined || err.code === 0) {
    console.info(`${tag} success`);
    done();
    return;
  }
  console.info(`${tag} err code=${err.code} msg=${err.message}`);
  expect(err.code === INVALID_PARAM_ERR).assertFalse();
  done();
}

function finishPreferCatch(tag: string, prefer: boolean, error: Error, done: Function): void {
  console.info(`${tag} catch ${JSON.stringify(error)}`);
  let options = optionsPrefer(prefer);
  expect(options.preferDefaultBrowser).assertEqual(prefer);
  done();
}

export default function PreferDefaultBrowserTest() {
  describe('PreferDefaultBrowserTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      try {
        driver = Driver.create();
      } catch (err) {
        console.info(`preferDefaultBrowserTest beforeAll driver err=${JSON.stringify(err)}`);
      }
    });

    afterEach(async (done: Function) => {
      try {
        if (driver) {
          await driver.pressBack();
          await driver.delayMs(500);
        }
      } catch (err) {
        console.info(`preferDefaultBrowserTest afterEach err=${JSON.stringify(err)}`);
      }
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0100
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0100
     * @tc.desc   startAbility callback with https uri and preferDefaultBrowser true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0100', Level.LEVEL0, (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0100';
      let preferFlag: boolean = true;
      expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
      try {
        getContext().startAbility(httpsWant(), optionsPrefer(true), (err: BusinessError) => {
          finishPreferCase(tag, true, err, done);
        });
      } catch (error) {
        finishPreferCatch(tag, true, error, done);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0200
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0200
     * @tc.desc   startAbility promise with https uri and preferDefaultBrowser true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0200', Level.LEVEL0, (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0200';
      let preferFlag: boolean = true;
      expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
      try {
        getContext().startAbility(httpsWant(), optionsPrefer(true))
          .then(() => {
            finishPreferCase(tag, true, undefined, done);
          })
          .catch((err: BusinessError) => {
            finishPreferCase(tag, true, err, done);
            done();
          });
      } catch (error) {
        finishPreferCatch(tag, true, error, done);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0300
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0300
     * @tc.desc   startAbility callback with https uri and preferDefaultBrowser false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0300', Level.LEVEL0, (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0300';
      let preferFlag: boolean = false;
      expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
      try {
        getContext().startAbility(httpsWant(), optionsPrefer(false), (err: BusinessError) => {
          finishPreferCase(tag, false, err, done);
        });
      } catch (error) {
        finishPreferCatch(tag, false, error, done);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0400
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0400
     * @tc.desc   startAbility promise with https uri and preferDefaultBrowser false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0400', Level.LEVEL0, (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0400';
      let preferFlag: boolean = false;
      expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
      try {
        getContext().startAbility(httpsWant(), optionsPrefer(false))
          .then(() => {
            finishPreferCase(tag, false, undefined, done);
          })
          .catch((err: BusinessError) => {
            finishPreferCase(tag, false, err, done);
            done();
          });
      } catch (error) {
        finishPreferCatch(tag, false, error, done);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0500
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0500
     * @tc.desc   startAbility callback with http uri and preferDefaultBrowser true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0500', Level.LEVEL0, (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0500';
      let preferFlag: boolean = true;
      expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
      try {
        getContext().startAbility(httpWant(), optionsPrefer(true), (err: BusinessError) => {
          finishPreferCase(tag, true, err, done);
        });
      } catch (error) {
        finishPreferCatch(tag, true, error, done);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0600
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0600
     * @tc.desc   startAbility promise with http uri and preferDefaultBrowser true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0600', Level.LEVEL0, (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0600';
      let preferFlag: boolean = true;
      expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
      try {
        getContext().startAbility(httpWant(), optionsPrefer(true))
          .then(() => {
            finishPreferCase(tag, true, undefined, done);
          })
          .catch((err: BusinessError) => {
            finishPreferCase(tag, true, err, done);
            done();
          });
      } catch (error) {
        finishPreferCatch(tag, true, error, done);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0700
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0700
     * @tc.desc   startAbility callback with non-http want and preferDefaultBrowser true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0700', Level.LEVEL0, (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0700';
      let preferFlag: boolean = true;
      expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
      let want: Want = {
        bundleName: SELF_BUNDLE,
        abilityName: 'SecondAbility'
      };
      try {
        getContext().startAbility(want, optionsPrefer(true), (err: BusinessError) => {
          finishPreferCase(tag, true, err, done);
        });
      } catch (error) {
        finishPreferCatch(tag, true, error, done);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_AsCaller_0100
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_AsCaller_0100
     * @tc.desc   startAbilityAsCaller callback with https uri and preferDefaultBrowser true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_AsCaller_0100', Level.LEVEL0, (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_AsCaller_0100';
      let preferFlag: boolean = true;
      expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
      try {
        getContext().startAbilityAsCaller(httpsWant(), optionsPrefer(true), (err: BusinessError) => {
          finishPreferCase(tag, true, err, done);
        });
      } catch (error) {
        finishPreferCatch(tag, true, error, done);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_AsCaller_0200
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_AsCaller_0200
     * @tc.desc   startAbilityAsCaller promise with https uri and preferDefaultBrowser true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_AsCaller_0200', Level.LEVEL0, (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_AsCaller_0200';
      let preferFlag: boolean = true;
      expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
      try {
        getContext().startAbilityAsCaller(httpsWant(), optionsPrefer(true))
          .then(() => {
            finishPreferCase(tag, true, undefined, done);
          })
          .catch((err: BusinessError) => {
            finishPreferCase(tag, true, err, done);
            done();
          });
      } catch (error) {
        finishPreferCatch(tag, true, error, done);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_WithAccount_0100
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_WithAccount_0100
     * @tc.desc   startAbilityWithAccount callback with https uri and preferDefaultBrowser true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_WithAccount_0100', Level.LEVEL0, (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_WithAccount_0100';
      let preferFlag: boolean = true;
      expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
      try {
        getContext().startAbilityWithAccount(httpsWant(), 100, optionsPrefer(true), (err: BusinessError) => {
          finishPreferCase(tag, true, err, done);
        });
      } catch (error) {
        finishPreferCatch(tag, true, error, done);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_WithAccount_0200
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_WithAccount_0200
     * @tc.desc   startAbilityWithAccount promise with https uri and preferDefaultBrowser true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_WithAccount_0200', Level.LEVEL0, (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_WithAccount_0200';
      let preferFlag: boolean = true;
      expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
      try {
        getContext().startAbilityWithAccount(httpsWant(), 100, optionsPrefer(true))
          .then(() => {
            finishPreferCase(tag, true, undefined, done);
          })
          .catch((err: BusinessError) => {
            finishPreferCase(tag, true, err, done);
            done();
          });
      } catch (error) {
        finishPreferCatch(tag, true, error, done);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_ForResult_0100
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_ForResult_0100
     * @tc.desc   startAbilityForResult callback with https uri and preferDefaultBrowser true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_ForResult_0100', Level.LEVEL0, (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_ForResult_0100';
      let preferFlag: boolean = true;
      expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
      let finished = false;
      let finish = (err?: BusinessError): void => {
        if (finished) {
          return;
        }
        finished = true;
        finishPreferCase(tag, true, err, done);
      };
      try {
        if (driver) {
          setTimeout(async () => {
            try {
              await driver.pressBack();
            } catch (backErr) {
              console.info(`${tag} pressBack err=${JSON.stringify(backErr)}`);
            }
          }, 2000);
        }
        getContext().startAbilityForResult(httpsWant(), optionsPrefer(true),
          (err: BusinessError, _data) => {
            finish(err);
          });
      } catch (error) {
        finishPreferCatch(tag, true, error, done);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_ForResult_0200
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_ForResult_0200
     * @tc.desc   startAbilityForResult promise with https uri and preferDefaultBrowser true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_ForResult_0200', Level.LEVEL0, (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_ForResult_0200';
      let preferFlag: boolean = true;
      expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
      let finished = false;
      let finish = (err?: BusinessError): void => {
        if (finished) {
          return;
        }
        finished = true;
        finishPreferCase(tag, true, err, done);
      };
      try {
        if (driver) {
          setTimeout(async () => {
            try {
              await driver.pressBack();
            } catch (backErr) {
              console.info(`${tag} pressBack err=${JSON.stringify(backErr)}`);
            }
          }, 2000);
        }
        getContext().startAbilityForResult(httpsWant(), optionsPrefer(true))
          .then((_data) => {
            finish(undefined);
          })
          .catch((err: BusinessError) => {
            finish(err);
            done();
          });
      } catch (error) {
        finishPreferCatch(tag, true, error, done);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_ForResultWithAccount_0100
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_ForResultWithAccount_0100
     * @tc.desc   startAbilityForResultWithAccount callback with https and preferDefaultBrowser true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_ForResultWithAccount_0100', Level.LEVEL0,
      (done: Function) => {
        const tag = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_ForResultWithAccount_0100';
      let preferFlag: boolean = true;
      expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
        try {
          getContext().startAbilityForResultWithAccount(httpsWant(), 100, optionsPrefer(true),
            (err: BusinessError) => {
              finishPreferCase(tag, true, err, done);
            });
        } catch (error) {
          finishPreferCatch(tag, true, error, done);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_ForResultWithAccount_0200
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_ForResultWithAccount_0200
     * @tc.desc   startAbilityForResultWithAccount promise with https and preferDefaultBrowser true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_ForResultWithAccount_0200', Level.LEVEL0,
      (done: Function) => {
        const tag = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_ForResultWithAccount_0200';
      let preferFlag: boolean = true;
      expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
        try {
          getContext().startAbilityForResultWithAccount(httpsWant(), 100, optionsPrefer(true))
            .then(() => {
              finishPreferCase(tag, true, undefined, done);
            })
            .catch((err: BusinessError) => {
              finishPreferCase(tag, true, err, done);
              done();
            });
        } catch (error) {
          finishPreferCatch(tag, true, error, done);
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Recent_0100
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Recent_0100
     * @tc.desc   startRecentAbility callback with https uri and preferDefaultBrowser true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Recent_0100', Level.LEVEL0, (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Recent_0100';
      let preferFlag: boolean = true;
      expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
      try {
        getContext().startRecentAbility(httpsWant(), optionsPrefer(true), (err: BusinessError) => {
          finishPreferCase(tag, true, err, done);
        });
      } catch (error) {
        finishPreferCatch(tag, true, error, done);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Recent_0200
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Recent_0200
     * @tc.desc   startRecentAbility promise with https uri and preferDefaultBrowser true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Recent_0200', Level.LEVEL0, (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_Recent_0200';
      let preferFlag: boolean = true;
      expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
      try {
        getContext().startRecentAbility(httpsWant(), optionsPrefer(true))
          .then(() => {
            finishPreferCase(tag, true, undefined, done);
          })
          .catch((err: BusinessError) => {
            finishPreferCase(tag, true, err, done);
            done();
          });
      } catch (error) {
        finishPreferCatch(tag, true, error, done);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_SelfUIAbility_0100
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_SelfUIAbility_0100
     * @tc.desc   startSelfUIAbilityInCurrentProcess with https uri and preferDefaultBrowser true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_SelfUIAbility_0100', Level.LEVEL0, (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_SelfUIAbility_0100';
      let preferFlag: boolean = true;
      expect(optionsPrefer(preferFlag).preferDefaultBrowser).assertEqual(preferFlag);
      try {
        getContext().startSelfUIAbilityInCurrentProcess(httpsWant(), '1', optionsPrefer(true))
          .then(() => {
            finishPreferCase(tag, true, undefined, done);
          })
          .catch((err: BusinessError) => {
            finishPreferCase(tag, true, err, done);
            done();
          });
      } catch (error) {
        finishPreferCatch(tag, true, error, done);
      }
    });
  });
}
