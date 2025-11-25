/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import AbilityDelegatorRegistry from "@ohos.app.ability.abilityDelegatorRegistry";
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import { Driver, ON } from '@ohos.UiTest';

let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
let deviceSupport = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable');
let driver = Driver.create();
const START_ABILITY_TIMEOUT_TWO_THOUSAND = 2000;
const START_ABILITY_TIMEOUT_THOUSAND = 1000;

export default function BackgroundPromise() {
  describe("BackgroundPromise", () => {
    beforeEach(async (done: Function) => {
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.startAbility({
        abilityName: "MainAbility",
        bundleName: "com.example.crossplatformpromise",
        moduleName: "entry_test",
      });
      setTimeout(() => {
        done();
      }, 200);
    });

    /**
     * @tc.name   ACTS_DO_ABILITY_BACKGROUND_PROMISE_0001
     * @tc.number ACTS_DO_ABILITY_BACKGROUND_PROMISE_0001
     * @tc.desc   Test the api: doAbilityBackground, swith the ability to background.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_DO_ABILITY_BACKGROUND_PROMISE_0001", Level.LEVEL0, async (done: Function) => {
      abilityDelegator.printSync(
        "ACTS_DO_ABILITY_BACKGROUND_PROMISE_0001 start"
      );
      if (deviceSupport === 'false') {
        done();
        return;
      }
      abilityDelegator.startAbility({
          abilityName: "Main4Ability",
          bundleName: "com.example.crossplatformpromise",
          moduleName: "entry_test",
        }, async () => {
          await driver.waitForComponent(ON.text('EntryMain4'), START_ABILITY_TIMEOUT_TWO_THOUSAND);
          abilityDelegator.getCurrentTopAbility((err: BusinessError, ability1: UIAbility) => {
              abilityDelegator.printSync(
                "ACTS_DO_ABILITY_BACKGROUND_PROMISE_0001 Main4Ability: " +
                ability1.context.abilityInfo.name
              );
              abilityDelegator.startAbility({
                abilityName: "Main3Ability",
                bundleName: "com.example.crossplatformpromise",
                moduleName: "entry_test",
              }, async () => {
                await driver.waitForComponent(ON.text('EntryMain3'), START_ABILITY_TIMEOUT_TWO_THOUSAND);
                abilityDelegator.getCurrentTopAbility(
                  (err: BusinessError, ability2: UIAbility) => {
                    abilityDelegator.printSync(
                      "ACTS_DO_ABILITY_BACKGROUND_PROMISE_0001 Main3Ability: " +
                      ability2.context.abilityInfo.name
                    );
                    abilityDelegator
                      .doAbilityBackground(ability2)
                      .then(() => {
                        setTimeout(() => {
                          try {
                            let stateNum =
                              abilityDelegator.getAbilityState(ability2);
                            abilityDelegator.printSync(
                              "ACTS_DO_ABILITY_BACKGROUND_PROMISE_0001 getAbilityState stateNum :" +
                                stateNum
                            );
                            expect(stateNum).assertEqual(3);
                            abilityDelegator.printSync(
                              "ACTS_DO_ABILITY_BACKGROUND_PROMISE_0001 pass"
                            );
                          } catch (error) {
                            abilityDelegator.printSync(
                              "ACTS_DO_ABILITY_BACKGROUND_PROMISE_0001 catch error:" +
                                error
                            );
                          }
                          done();
                        }, START_ABILITY_TIMEOUT_THOUSAND);
                      })
                      .catch((error: BusinessError) => {
                        abilityDelegator.printSync(
                          "ACTS_DO_ABILITY_BACKGROUND_PROMISE_0001 error error:" +
                            error
                        );
                      });
                    }
                  );
              });
            });
        });
    });

    /**
     * @tc.name   ACTS_DO_ABILITY_BACKGROUND_PROMISE_ERROR_0002
     * @tc.number ACTS_DO_ABILITY_BACKGROUND_PROMISE_ERROR_0002
     * @tc.desc   Test the api: doAbilityBackground, swith the wrong ability to background.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it(
      "ACTS_DO_ABILITY_BACKGROUND_PROMISE_ERROR_0002",
      0,
      async (done: Function) => {
        abilityDelegator.printSync(
          "ACTS_DO_ABILITY_BACKGROUND_PROMISE_ERROR_0002 start"
        );
        if (deviceSupport === 'false') {
          done();
          return;
        }
        abilityDelegator.getCurrentTopAbility((err: BusinessError, ability1: UIAbility) => {
          abilityDelegator.printSync(
            "ACTS_DO_ABILITY_BACKGROUND_PROMISE_ERROR_0002 Main4Ability: " +
            ability1.context.abilityInfo.name
          );
          abilityDelegator.startAbility({
            abilityName: "Main3Ability",
            bundleName: "com.example.crossplatformpromise",
            moduleName: "entry_test",
          }, async () => {
            abilityDelegator.printSync(
              "ACTS_DO_ABILITY_BACKGROUND_PROMISE_ERROR_0002 startAbility"
            );
            await driver.waitForComponent(ON.text('EntryMain3'), START_ABILITY_TIMEOUT_TWO_THOUSAND);
            abilityDelegator.getCurrentTopAbility(
              (err: BusinessError, ability2: UIAbility) => {
                try {
                  abilityDelegator
                    .doAbilityBackground(undefined)
                    .then(() => {
                      abilityDelegator.printSync(
                        "ACTS_DO_ABILITY_BACKGROUND_PROMISE_ERROR_0002 fail"
                      );
                      expect().assertFail();
                      done();
                    })
                    .catch((error: BusinessError) => {
                      abilityDelegator.printSync(
                        "ACTS_DO_ABILITY_BACKGROUND_PROMISE_ERROR_0002 catch error:" +
                          error
                      );
                    });
                } catch {
                  abilityDelegator.printSync(
                    "ACTS_DO_ABILITY_BACKGROUND_PROMISE_ERROR_0002 doAbilityForeground meet an error: ability is wrong"
                  );
                  abilityDelegator.getCurrentTopAbility(
                    (err: BusinessError, ability2: UIAbility) => {
                      abilityDelegator.printSync(
                        "ACTS_DO_ABILITY_BACKGROUND_PROMISE_ERROR_0002 Main3Ability : " +
                        ability2.context.abilityInfo.name
                      );
                      let stateNum =
                        abilityDelegator.getAbilityState(ability1);
                      abilityDelegator.printSync(
                        "ACTS_DO_ABILITY_BACKGROUND_PROMISE_ERROR_0002 getAbilityState: " +
                          stateNum
                      );
                      expect(stateNum).assertEqual(3);
                      expect(ability2.context.abilityInfo.name).assertEqual(
                        "Main3Ability"
                      );
                      abilityDelegator.printSync(
                        "ACTS_DO_ABILITY_BACKGROUND_PROMISE_ERROR_0002 pass."
                      );
                      done();
                    }
                  );
                }
              }
            );
          });
          });
      }
    );

    /**
     * @tc.name   ACTS_DO_ABILITY_BACKGROUND_PROMISE_0004
     * @tc.number ACTS_DO_ABILITY_BACKGROUND_PROMISE_0004
     * @tc.desc   Test the api: doAbilityBackground, swith the ability which is background to background.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_DO_ABILITY_BACKGROUND_PROMISE_0004", Level.LEVEL0, async (done: Function) => {

      abilityDelegator.printSync(
        "ACTS_DO_ABILITY_BACKGROUND_PROMISE_0004 start"
      );
      if (deviceSupport === 'false') {
        done();
        return;
      }
      abilityDelegator.startAbility({
        abilityName: "Main4Ability",
        bundleName: "com.example.crossplatformpromise",
        moduleName: "entry_test",
      }, async () => {
        await driver.waitForComponent(ON.text('EntryMain4'), START_ABILITY_TIMEOUT_TWO_THOUSAND);
        abilityDelegator.getCurrentTopAbility((err: BusinessError, ability1: UIAbility) => {
            abilityDelegator.printSync(
              "ACTS_DO_ABILITY_BACKGROUND_PROMISE_0004 Main4Ability: " +
              ability1.context.abilityInfo.name
            );
            abilityDelegator.startAbility({
              abilityName: "Main3Ability",
              bundleName: "com.example.crossplatformpromise",
              moduleName: "entry_test",
            }, async () => {
              await driver.waitForComponent(ON.text('EntryMain3'), START_ABILITY_TIMEOUT_TWO_THOUSAND);
              abilityDelegator.getCurrentTopAbility(
                (err: BusinessError, ability2: UIAbility) => {
                  abilityDelegator.printSync(
                    "ACTS_DO_ABILITY_BACKGROUND_PROMISE_0004 Main3Ability: " +
                    ability2.context.abilityInfo.name
                  );
                  abilityDelegator
                    .doAbilityBackground(ability1)
                    .then(() => {
                      setTimeout(() => {
                        abilityDelegator.getCurrentTopAbility(
                          (err: BusinessError, ability3: UIAbility) => {
                            try {
                              abilityDelegator.printSync(
                                "ACTS_DO_ABILITY_BACKGROUND_PROMISE_0004 Main3Ability: " +
                                ability3.context.abilityInfo.name
                              );
                              let stateNum =
                                abilityDelegator.getAbilityState(ability3);
                              abilityDelegator.printSync(
                                "ACTS_DO_ABILITY_BACKGROUND_PROMISE_0004 getAbilityState stateNum :" +
                                  stateNum
                              );
                              expect(
                                ability3.context.abilityInfo.name
                              ).assertEqual("Main3Ability");
                              expect(stateNum).assertEqual(2);
                              abilityDelegator.printSync(
                                "ACTS_DO_ABILITY_BACKGROUND_PROMISE_0004 pass"
                              );
                            } catch {
                              abilityDelegator.printSync(
                                "ACTS_DO_ABILITY_BACKGROUND_PROMISE_0004 fail"
                              );
                            }
                            done();
                          }
                        );
                      }, START_ABILITY_TIMEOUT_THOUSAND);
                    })
                    .catch((error: BusinessError) => {
                      abilityDelegator.printSync(
                        "ACTS_DO_ABILITY_BACKGROUND_PROMISE_0004 catch error:" +
                          error
                      );
                    });
                }
                );
            });
          });
      });
    });

    /**
     * @tc.name   ACTS_DO_ABILITY_BACKGROUND_PROMISE_ERROR_0005
     * @tc.number ACTS_DO_ABILITY_BACKGROUND_PROMISE_ERROR_0005
     * @tc.desc   Test the api: doAbilityBackground, swith the wrong ability to background.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it(
      "ACTS_DO_ABILITY_BACKGROUND_PROMISE_ERROR_0005",
      0,
      async (done: Function) => {
        abilityDelegator.printSync(
          "ACTS_DO_ABILITY_BACKGROUND_PROMISE_ERROR_0005 start"
        );
        if (deviceSupport === 'false') {
          done();
          return;
        }
        abilityDelegator.getCurrentTopAbility((err: BusinessError, ability1: UIAbility) => {
          abilityDelegator.printSync(
            "ACTS_DO_ABILITY_BACKGROUND_PROMISE_ERROR_0005 Main4Ability: " +
            ability1.context.abilityInfo.name
          );
          abilityDelegator.startAbility({
            abilityName: "Main3Ability",
            bundleName: "com.example.crossplatformpromise",
            moduleName: "entry_test",
          }, async () => {
            abilityDelegator.printSync(
              "ACTS_DO_ABILITY_BACKGROUND_PROMISE_ERROR_0005 startAbility"
            );
            await driver.waitForComponent(ON.text('EntryMain3'), START_ABILITY_TIMEOUT_TWO_THOUSAND);
            abilityDelegator.getCurrentTopAbility(
              (err: BusinessError, ability2: UIAbility) => {
                ability2.context.terminateSelf(() => {
                  setTimeout(() => {
                    try {
                      abilityDelegator
                        .doAbilityBackground(ability2)
                        .then(() => {
                        });
                    } catch (error) {
                      expect(error.message).assertContain(
                        "Parse"
                      );
                      abilityDelegator.printSync(
                        "ACTS_DO_ABILITY_BACKGROUND_PROMISE_ERROR_0005 doAbilityBackground meet an error: " +
                          error
                      );
                    }
                    done();
                  }, START_ABILITY_TIMEOUT_THOUSAND);
                });
              }
            );
          });
        });
      }
    );
  });
}
