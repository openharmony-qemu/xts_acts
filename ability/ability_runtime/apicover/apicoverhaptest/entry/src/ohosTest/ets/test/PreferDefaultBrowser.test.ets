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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import bundleManager from '@ohos.bundle.bundleManager';

const HTTPS_URI = 'https://www.example.com';
const HTTP_URI = 'http://www.example.com';
const SELF_BUNDLE = 'com.example.apicoverhaptest';
const INVALID_PARAM_ERR = 401;
const BROWSER_CHECK_DELAY_MS = 1500;

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

function optionsOmit(): StartOptions {
  return {};
}

function optionsPreferAbnormal(value: ESObject): StartOptions {
  let options: StartOptions = {};
  (options as ESObject).preferDefaultBrowser = value;
  return options;
}

async function getForegroundBundleName(): Promise<string> {
  let delegator = abilityDelegatorRegistry.getAbilityDelegator();
  let top = await delegator.getCurrentTopAbility();
  let bundleName = top?.context?.abilityInfo?.bundleName;
  return bundleName !== undefined ? bundleName : '';
}

async function getBrowserCandidateBundles(): Promise<string[]> {
  let bundles: string[] = [];
  try {
    let want: Want = {
      action: 'ohos.want.action.viewData',
      entities: ['entity.system.browsable'],
      uri: HTTPS_URI
    };
    let abilities = await bundleManager.queryAbilityInfo(want,
      bundleManager.AbilityFlag.GET_ABILITY_INFO_WITH_APPLICATION);
    if (abilities !== undefined) {
      for (let i = 0; i < abilities.length; i++) {
        let name = abilities[i].bundleName;
        if (name !== undefined && name.length > 0 && bundles.indexOf(name) < 0) {
          bundles.push(name);
        }
      }
    }
  } catch (err) {
    console.info(`queryAbilityInfo browser err=${JSON.stringify(err)}`);
  }
  return bundles;
}

async function assertForegroundIsDefaultBrowser(tag: string): Promise<void> {
  if (driverGlobal !== undefined) {
    await driverGlobal.delayMs(BROWSER_CHECK_DELAY_MS);
  } else {
    await new Promise<void>((resolve) => setTimeout(resolve, BROWSER_CHECK_DELAY_MS));
  }
  let topBundle = await getForegroundBundleName();
  let browsers = await getBrowserCandidateBundles();
  console.info(`${tag} foreground=${topBundle} browsers=${JSON.stringify(browsers)}`);
  expect(topBundle.length > 0).assertTrue();
  expect(topBundle === SELF_BUNDLE).assertFalse();
  if (browsers.length > 0) {
    expect(browsers.indexOf(topBundle) >= 0).assertTrue();
  }
}

let driverGlobal: Driver | undefined = undefined;

function finishPreferCase(tag: string, prefer: boolean, err: BusinessError | undefined, done: Function,
  verifyBrowser: boolean = false): void {
  let options = optionsPrefer(prefer);
  expect(options.preferDefaultBrowser).assertEqual(prefer);
  if (err !== undefined && err.code !== 0) {
    console.info(`${tag} err code=${err.code} msg=${err.message}`);
    expect(err.code === INVALID_PARAM_ERR).assertFalse();
    done();
    return;
  }
  console.info(`${tag} success`);
  if (verifyBrowser && prefer) {
    assertForegroundIsDefaultBrowser(tag).then(() => {
      done();
    }).catch((assertErr: Error) => {
      console.info(`${tag} browser assert err=${JSON.stringify(assertErr)}`);
      expect().assertFail();
      done();
    });
    return;
  }
  done();
}

function finishPreferOmit(tag: string, err: BusinessError | undefined, done: Function): void {
  if (err === undefined || err.code === 0) {
    console.info(`${tag} success`);
    done();
    return;
  }
  console.info(`${tag} err code=${err.code} msg=${err.message}`);
  expect(err.code === INVALID_PARAM_ERR).assertFalse();
  done();
}

function finishPreferAbnormal(tag: string, err: BusinessError | undefined, done: Function): void {
  if (err === undefined || err.code === 0) {
    console.info(`${tag} expect param error but success`);
    expect().assertFail();
    done();
    return;
  }
  console.info(`${tag} err code=${err.code} msg=${err.message}`);
  expect(err.code !== 0).assertTrue();
  done();
}

function finishPreferCatch(tag: string, prefer: boolean, error: Error, done: Function): void {
  console.info(`${tag} catch ${JSON.stringify(error)}`);
  let options = optionsPrefer(prefer);
  expect(options.preferDefaultBrowser).assertEqual(prefer);
  done();
}

function finishPreferOmitCatch(tag: string, error: Error, done: Function): void {
  console.info(`${tag} catch ${JSON.stringify(error)}`);
  expect(error !== undefined).assertTrue();
  done();
}

function finishPreferAbnormalCatch(tag: string, error: Error, done: Function): void {
  console.info(`${tag} catch ${JSON.stringify(error)}`);
  expect(error !== undefined).assertTrue();
  let biz = error as BusinessError;
  if (biz !== undefined && biz.code !== undefined) {
    expect(biz.code !== 0).assertTrue();
  }
  done();
}

export default function PreferDefaultBrowserTest() {
  describe('PreferDefaultBrowserTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      try {
        driver = Driver.create();
        driverGlobal = driver;
      } catch (err) {
        console.info(`PreferDefaultBrowserTest beforeAll driver err=${JSON.stringify(err)}`);
      }
    });

    afterEach(async (done: Function) => {
      try {
        if (driver) {
          await driver.pressBack();
          await driver.delayMs(500);
        }
      } catch (err) {
        console.info(`PreferDefaultBrowserTest afterEach err=${JSON.stringify(err)}`);
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
      try {
        getContext().startAbility(httpsWant(), optionsPrefer(true), (err: BusinessError) => {
          finishPreferCase(tag, true, err, done, true);
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
      try {
        getContext().startAbility(httpsWant(), optionsPrefer(true))
          .then(() => {
            finishPreferCase(tag, true, undefined, done, true);
          })
          .catch((err: BusinessError) => {
            finishPreferCase(tag, true, err, done, true);
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
      try {
        getContext().startAbility(httpsWant(), optionsPrefer(false))
          .then(() => {
            finishPreferCase(tag, false, undefined, done);
          })
          .catch((err: BusinessError) => {
            finishPreferCase(tag, false, err, done);
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
      try {
        getContext().startAbility(httpWant(), optionsPrefer(true), (err: BusinessError) => {
          finishPreferCase(tag, true, err, done, true);
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
      try {
        getContext().startAbility(httpWant(), optionsPrefer(true))
          .then(() => {
            finishPreferCase(tag, true, undefined, done, true);
          })
          .catch((err: BusinessError) => {
            finishPreferCase(tag, true, err, done, true);
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
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0800
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0800
     * @tc.desc   startAbility callback with https uri and preferDefaultBrowser omitted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0800', Level.LEVEL0, (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0800';
      try {
        getContext().startAbility(httpsWant(), optionsOmit(), (err: BusinessError) => {
          finishPreferOmit(tag, err, done);
        });
      } catch (error) {
        finishPreferOmitCatch(tag, error, done);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0900
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0900
     * @tc.desc   startAbility callback with http uri and preferDefaultBrowser false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0900', Level.LEVEL0, (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_0900';
      try {
        getContext().startAbility(httpWant(), optionsPrefer(false), (err: BusinessError) => {
          finishPreferCase(tag, false, err, done);
        });
      } catch (error) {
        finishPreferCatch(tag, false, error, done);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_1000
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_1000
     * @tc.desc   startAbility promise with http uri and preferDefaultBrowser false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_1000', Level.LEVEL0, (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_1000';
      try {
        getContext().startAbility(httpWant(), optionsPrefer(false))
          .then(() => {
            finishPreferCase(tag, false, undefined, done);
          })
          .catch((err: BusinessError) => {
            finishPreferCase(tag, false, err, done);
          });
      } catch (error) {
        finishPreferCatch(tag, false, error, done);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_1100
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_1100
     * @tc.desc   startAbility callback with http uri and preferDefaultBrowser omitted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_1100', Level.LEVEL0, (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_1100';
      try {
        getContext().startAbility(httpWant(), optionsOmit(), (err: BusinessError) => {
          finishPreferOmit(tag, err, done);
        });
      } catch (error) {
        finishPreferOmitCatch(tag, error, done);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_1200
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_1200
     * @tc.desc   startAbility callback with https uri and preferDefaultBrowser null; must error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_1200', Level.LEVEL0, (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_1200';
      try {
        getContext().startAbility(httpsWant(), optionsPreferAbnormal(null), (err: BusinessError) => {
          finishPreferAbnormal(tag, err, done);
        });
      } catch (error) {
        finishPreferAbnormalCatch(tag, error, done);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_1300
     * @tc.number SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_1300
     * @tc.desc   startAbility callback with https uri and preferDefaultBrowser number; must error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_1300', Level.LEVEL0, (done: Function) => {
      const tag = 'SUB_Ability_AbilityRuntime_PreferDefaultBrowser_StartAbility_1300';
      try {
        getContext().startAbility(httpsWant(), optionsPreferAbnormal(1), (err: BusinessError) => {
          finishPreferAbnormal(tag, err, done);
        });
      } catch (error) {
        finishPreferAbnormalCatch(tag, error, done);
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
      try {
        getContext().startAbilityAsCaller(httpsWant(), optionsPrefer(true))
          .then(() => {
            finishPreferCase(tag, true, undefined, done);
          })
          .catch((err: BusinessError) => {
            finishPreferCase(tag, true, err, done);
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
      try {
        getContext().startAbilityWithAccount(httpsWant(), 100, optionsPrefer(true))
          .then(() => {
            finishPreferCase(tag, true, undefined, done);
          })
          .catch((err: BusinessError) => {
            finishPreferCase(tag, true, err, done);
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
        try {
          getContext().startAbilityForResultWithAccount(httpsWant(), 100, optionsPrefer(true))
            .then(() => {
              finishPreferCase(tag, true, undefined, done);
            })
            .catch((err: BusinessError) => {
              finishPreferCase(tag, true, err, done);
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
      try {
        getContext().startRecentAbility(httpsWant(), optionsPrefer(true))
          .then(() => {
            finishPreferCase(tag, true, undefined, done);
          })
          .catch((err: BusinessError) => {
            finishPreferCase(tag, true, err, done);
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
      try {
        getContext().startSelfUIAbilityInCurrentProcess(httpsWant(), '1', optionsPrefer(true))
          .then(() => {
            finishPreferCase(tag, true, undefined, done);
          })
          .catch((err: BusinessError) => {
            finishPreferCase(tag, true, err, done);
          });
      } catch (error) {
        finishPreferCatch(tag, true, error, done);
      }
    });
  });
}
