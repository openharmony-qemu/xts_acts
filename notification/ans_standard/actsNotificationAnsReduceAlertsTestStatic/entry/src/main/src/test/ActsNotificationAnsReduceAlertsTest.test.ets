/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll, afterEach, beforeEach } from "../../../hypium/index"
import notificationManager from '@ohos.notificationManager'
import { Driver, ON, Component } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base'
import Utils from './Util.test';
import hilog from '@ohos.hilog';
import { AppStorage } from '@ohos.arkui.stateManagement'

function getRandomNumber(min: number, max: number): number {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}
let TAG = 'lallala'
let testAbilityContext: common.UIAbilityContext
let bundle: string = 'com.example.actsnotificationansreducealertstest.static'

export default function ActsNotificationAnsReduceAlertsTest() {
  let TEST_SUITE_NAME: string = 'ActsNotificationAnsReduceAlertsTest ===>'

  describe('ActsNotificationAnsReduceAlertsTest', () => {
    beforeAll(async() => {
      console.info(TAG+'%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility({
        abilityName: "EntryAbility",
        bundleName: "com.example.actsnotificationansreducealertstest.static"
      }).then(async (): Promise<void> => {
        console.info(TAG+'startAbility success');
        await Utils.msSleep(2000);
        testAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
        await Utils.msSleep(1000);
        notificationManager.requestEnableNotification(testAbilityContext).then(() => {
          console.info(TAG+`requestEnableNotification Promise success!`)
        }).catch((error: Error) => {
          let err = error as BusinessError
          console.info(TAG+`requestEnableNotification Promise err: ${err.code}, errMes: ${err.message}`)
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        })
        await Utils.msSleep(1000)
        let driver = Driver.create();
        let button = await driver.findComponent(ON.text('允许'));
        console.info(`${TAG} button is ${JSON.stringify(button)}`);
        if (button !== null) {
          await Utils.msSleep(1000)
          await button.click();
          await Utils.msSleep(1000)
        } else {
          console.info(`${TAG} null button`);
          expect(button).assertContain('允许')
        }
      })
    });

    afterEach(async () => {
      await notificationManager.cancelAll().then(() => {
        console.info(TEST_SUITE_NAME + `Succeeded in canceling all notification.`);
      }).catch((err: BusinessError):void => {
        console.error(TEST_SUITE_NAME +
          `Failed to cancel all notification. Code is ${err.code}, message is ${err.message}`);
      });
      await Utils.msSleep(1500)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_003
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_003
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let testAbilityContext: common.UIAbilityContext= AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_003'
        await notificationManager.openNotificationSettings(testAbilityContext).then(() => {
          console.info(TEST_SUITE_NAME + TAG + `openNotificationSettings succeeded`);
        }).catch((err: BusinessError):void => {
          console.error(TEST_SUITE_NAME + TAG + `openNotificationSettings err: ${JSON.stringify(err.code)}`);
          expect().assertFail();
          done();
        })
        await Utils.msSleep(1000)
        let driver: Driver = Driver.create();
        await Utils.msSleep(1500)
        await driver.assertComponentExist(ON.text('通知管理'));
        let button = await driver.findComponent(ON.text('横幅通知'));
        console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
        if (button !== null) {
          console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
          await Utils.msSleep(1000);
          await button.click()
          await Utils.msSleep(500)
        }
        let button2 = await driver.findComponent(ON.text('确定'));
        console.info(TEST_SUITE_NAME + TAG + `button2 is ${JSON.stringify(button2)}`);
        if (button2 !== null) {
          console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
          await Utils.msSleep(1000);
          await button2.click()
          await Utils.msSleep(500)
        }
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationFlags: {
            soundEnabled: undefined,
            vibrationEnabled: undefined,
            bannerEnabled: undefined,
            lockScreenEnabled: undefined,
          } as notificationManager.NotificationFlags,
          notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "SOCIAL_COMMUNICATION",
              text: "Sub_Notification_Ans_Reduce_alerts_static_003",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(async () => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(1000)
            await notificationManager.getActiveNotifications()
              .then(async(data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
                done()
              })
              .catch(async(err: BusinessError):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: BusinessError):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }

      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_005
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_005
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Sub_Notification_Ans_Reduce_alerts_static_005'
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "SOCIAL_COMMUNICATION",
              text: "Sub_Notification_Ans_Reduce_alerts_static_005",
            }
          }
        };
        try{
          await notificationManager.publish(notificationRequest).then(async() => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(500)
            await notificationManager.getActiveNotifications().then(async(data: Array<notificationManager.NotificationRequest>) => {
              console.info(TEST_SUITE_NAME + TAG + ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
              expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
              done()
            }).catch(async(err: BusinessError):void => {
              console.error(TEST_SUITE_NAME + TAG + `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
              expect(false).assertTrue();
              done()
            });
          }).catch((err: BusinessError):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        }catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }

      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_007
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_007
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_007'
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationFlags: {
            soundEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
            vibrationEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
            bannerEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
            lockScreenEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
          } as notificationManager.NotificationFlags,
          notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "SOCIAL_COMMUNICATION",
              text: "Sub_Notification_Ans_Reduce_alerts_007",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(async() => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(1000)
            await notificationManager.getActiveNotifications()
              .then(async(data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
                done()
              })
              .catch((err: BusinessError):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: BusinessError):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }

      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_008
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_008
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_008'

        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationFlags: {
            soundEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            vibrationEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            bannerEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            lockScreenEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
          } as notificationManager.NotificationFlags,
          notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "SOCIAL_COMMUNICATION",
              text: "Sub_Notification_Ans_Reduce_alerts_static_008",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(async() => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(1000)
            await notificationManager.getActiveNotifications()
              .then(async(data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
                done()
              })
              .catch((err: BusinessError):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: BusinessError):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }

      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_009
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_009
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_009'

        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationFlags: {
            soundEnabled: notificationManager.NotificationFlagStatus.TYPE_CLOSE,
            vibrationEnabled: notificationManager.NotificationFlagStatus.TYPE_CLOSE,
            bannerEnabled: notificationManager.NotificationFlagStatus.TYPE_CLOSE,
            lockScreenEnabled: notificationManager.NotificationFlagStatus.TYPE_CLOSE,
          } as notificationManager.NotificationFlags,
          notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "SOCIAL_COMMUNICATION",
              text: "Sub_Notification_Ans_Reduce_alerts_static_009",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(async() => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(1000)
            await notificationManager.getActiveNotifications()
              .then((data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(2)
                done()
              })
              .catch((err: BusinessError):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: BusinessError):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }

      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_013
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_013
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'Sub_Notification_Ans_Reduce_alerts_static_013'
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "SERVICE_INFORMATION",
              text: "Sub_Notification_Ans_Reduce_alerts_static_013",
            }
          }
        };
        try{
          await notificationManager.publish(notificationRequest).then(async() => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(500)
            await notificationManager.getActiveNotifications().then((data: Array<notificationManager.NotificationRequest>) => {
              console.info(TEST_SUITE_NAME + TAG + ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
              expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
              done()
            }).catch((err: BusinessError):void => {
              console.error(TEST_SUITE_NAME + TAG + `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
              expect(false).assertTrue();
              done()
            });
          }).catch((err: BusinessError):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        }catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }

      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_015
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_015
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_015'
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationFlags: {
            soundEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
            vibrationEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
            bannerEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
            lockScreenEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
          } as notificationManager.NotificationFlags,
          notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "SERVICE_INFORMATION",
              text: "Sub_Notification_Ans_Reduce_alerts_static_015",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(async() => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(1000)
            await notificationManager.getActiveNotifications()
              .then((data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
                done()
              })
              .catch((err: BusinessError):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: BusinessError):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }

      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_016
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_016
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_016'

        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationFlags: {
            soundEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            vibrationEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            bannerEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            lockScreenEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
          } as notificationManager.NotificationFlags,
          notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "SERVICE_INFORMATION",
              text: "Sub_Notification_Ans_Reduce_alerts_static_016",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(async() => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(1000)
            await notificationManager.getActiveNotifications()
              .then((data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
                done()
              })
              .catch((err: BusinessError):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: BusinessError):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }

      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_017
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_017
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_017'

        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationFlags: {
            soundEnabled: notificationManager.NotificationFlagStatus.TYPE_CLOSE,
            vibrationEnabled: notificationManager.NotificationFlagStatus.TYPE_CLOSE,
            bannerEnabled: notificationManager.NotificationFlagStatus.TYPE_CLOSE,
            lockScreenEnabled: notificationManager.NotificationFlagStatus.TYPE_CLOSE,
          } as notificationManager.NotificationFlags,
          notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "SERVICE_INFORMATION",
              text: "Sub_Notification_Ans_Reduce_alerts_static_017",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(async() => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(1000)
            await notificationManager.getActiveNotifications()
              .then((data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(2)
                done()
              })
              .catch((err: BusinessError):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: BusinessError):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }

      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_021
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_021
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_021'

        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationSlotType: notificationManager.SlotType.CUSTOMER_SERVICE,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "CUSTOMER_SERVICE",
              text: "Sub_Notification_Ans_Reduce_alerts_static_021",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(async() => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(1000)
            await notificationManager.getActiveNotifications()
              .then((data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(2)
                done()
              })
              .catch((err: BusinessError):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: BusinessError):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }

      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_024
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_024
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_024'

        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationFlags: {
            soundEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            vibrationEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            bannerEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            lockScreenEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
          } as notificationManager.NotificationFlags,
          notificationSlotType: notificationManager.SlotType.CUSTOMER_SERVICE,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "CUSTOMER_SERVICE",
              text: "Sub_Notification_Ans_Reduce_alerts_static_024",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(async() => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(1000)
            await notificationManager.getActiveNotifications()
              .then((data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(2)
                done()
              })
              .catch((err: BusinessError):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: BusinessError):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }

      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_030
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_030
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_030'

        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationFlags: {
            soundEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            vibrationEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            bannerEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            lockScreenEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
          } as notificationManager.NotificationFlags,
          notificationSlotType: notificationManager.SlotType.UNKNOWN_TYPE,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "UNKNOWN_TYPE",
              text: "Sub_Notification_Ans_Reduce_alerts_static_030",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(async() => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(1000)
            await notificationManager.getActiveNotifications()
              .then((data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(2)
                done()
              })
              .catch((err: BusinessError):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: BusinessError):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }

      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_033
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_033
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_033'

        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationFlags: {
            soundEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            vibrationEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            bannerEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            lockScreenEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
          } as notificationManager.NotificationFlags,
          notificationSlotType: notificationManager.SlotType.CONTENT_INFORMATION,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "CONTENT_INFORMATION",
              text: "Sub_Notification_Ans_Reduce_alerts_static_033",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(async() => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(1000)
            await notificationManager.getActiveNotifications()
              .then((data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(2)
                done()
              })
              .catch((err: BusinessError):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: BusinessError):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }

      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_036
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_036
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_036'

        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationFlags: {
            soundEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            vibrationEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            bannerEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            lockScreenEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
          } as notificationManager.NotificationFlags,
          notificationSlotType: notificationManager.SlotType.OTHER_TYPES,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "OTHER_TYPES",
              text: "Sub_Notification_Ans_Reduce_alerts_static_036",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(async() => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(1000)
            await notificationManager.getActiveNotifications()
              .then((data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(2)
                done()
              })
              .catch((err: BusinessError):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: BusinessError):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }

      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_049
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_049
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_049'
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.executeShellCommand("aa start -b com.huawei.hmos.settings -a com.huawei.hmos.settings.MainAbility")
        let driver = Driver.create();
        await Utils.msSleep(1000);
        let scrollBar: Component = await driver.findComponent(ON.type('Row')) as Component
        console.info(TEST_SUITE_NAME + TAG + `scrollToBottom scrollBar, ${JSON.stringify(scrollBar)} `);
        expect(scrollBar != null).assertTrue()
        await scrollBar.scrollToBottom();
        await driver.assertComponentExist(ON.text('情景模式'));
        let button = await driver.findComponent(ON.text('情景模式'));
        if (button !== null) {
          console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
          await button.click()
          await Utils.msSleep(500)
        } else {
          expect(false).assertTrue();
          done()
        }
        await driver.assertComponentExist(ON.text('立即开启'));
        let button2 = await driver.findComponent(ON.text('立即开启'));
        if (button2 !== null) {
          console.info(TEST_SUITE_NAME + TAG + `button2 is ${JSON.stringify(button2)}`);
          await button2.click()
          await Utils.msSleep(500)
        } else {
          expect(false).assertTrue();
          done()
        }
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationFlags: {
            soundEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            vibrationEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
            bannerEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
            lockScreenEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
          } as notificationManager.NotificationFlags,
          notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "SERVICE_INFORMATION",
              text: "Sub_Notification_Ans_Reduce_alerts_static_049",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(async () => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(500)
            await notificationManager.getActiveNotifications()
              .then((data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
              })
              .catch((err: BusinessError):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: BusinessError):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }
        await Utils.msSleep(500)
        await driver.assertComponentExist(ON.text('立即关闭'));
        let button3 = await driver.findComponent(ON.text('立即关闭'));
        if (button3 !== null) {
          console.info(TEST_SUITE_NAME + TAG + `button3 is ${JSON.stringify(button3)}`);
          await button3.click()
          await Utils.msSleep(500)
          done()
        } else {
          expect(false).assertTrue();
          done()
        }
      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_051
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_051
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_051'
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.actsnotificationansreducealertstest.static")
        await Utils.msSleep(1500)
        testAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext
        await notificationManager.openNotificationSettings(testAbilityContext).then(() => {
          console.info(TEST_SUITE_NAME + TAG + `openNotificationSettings succeeded`);
        }).catch((err: BusinessError):void => {
          console.error(TEST_SUITE_NAME + TAG + `openNotificationSettings err: ${JSON.stringify(err.code)}`);
          expect().assertFail();
          done();
        })
        let driver: Driver = Driver.create();
        await Utils.msSleep(1500)
        await driver.assertComponentExist(ON.text('通知管理'));
        let button = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('静默通知')));
        console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
        if (button !== null) {
          console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
          await Utils.msSleep(1000);
          await button.click()
          await Utils.msSleep(500)
        }
        let button2 = await driver.findComponent(ON.text('确定'));
        console.info(TEST_SUITE_NAME + TAG + `button2 is ${JSON.stringify(button2)}`);
        if (button2 !== null) {
          console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button2)}`);
          await Utils.msSleep(1000);
          await button2.click()
          await Utils.msSleep(500)
        }
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationFlags: {
            soundEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
            vibrationEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            bannerEnabled: notificationManager.NotificationFlagStatus.TYPE_CLOSE,
            lockScreenEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
          } as notificationManager.NotificationFlags,
          notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "SOCIAL_COMMUNICATION",
              text: "Sub_Notification_Ans_Reduce_alerts_static_051",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(async () => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(500)
            await notificationManager.getActiveNotifications()
              .then((data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(2)
                done()
              })
              .catch((err: BusinessError):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: BusinessError):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }
      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_052
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_052
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_052'
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationFlags: {
            soundEnabled: notificationManager.NotificationFlagStatus.TYPE_CLOSE,
            vibrationEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
            bannerEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            lockScreenEnabled: notificationManager.NotificationFlagStatus.TYPE_CLOSE,
          } as notificationManager.NotificationFlags,
          notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "SERVICE_INFORMATION",
              text: "Sub_Notification_Ans_Reduce_alerts_static_052",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(async () => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(500)
            await notificationManager.getActiveNotifications()
              .then((data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(2)
              })
              .catch((err: BusinessError):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: BusinessError):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }
        testAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext
        await notificationManager.openNotificationSettings(testAbilityContext).then(() => {
          console.info(TEST_SUITE_NAME + TAG + `openNotificationSettings succeeded`);
        }).catch((err: BusinessError):void => {
          console.error(TEST_SUITE_NAME + TAG + `openNotificationSettings err: ${JSON.stringify(err.code)}`);
          expect().assertFail();
          done();
        })
        let driver: Driver = Driver.create();
        await Utils.msSleep(1500)
        await driver.assertComponentExist(ON.text('通知管理'));
        let button = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('静默通知')));
        console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
        if (button !== null) {
          console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
          await Utils.msSleep(1000);
          await button.click()
          await Utils.msSleep(500)
        }
        let button2 = await driver.findComponent(ON.text('确定'));
        console.info(TEST_SUITE_NAME + TAG + `button2 is ${JSON.stringify(button2)}`);
        if (button2 !== null) {
          console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button2)}`);
          await Utils.msSleep(1000);
          await button2.click()
          await Utils.msSleep(500)
          done()
        }
      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_010
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_010
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_010'
        testAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext
        await notificationManager.openNotificationSettings(testAbilityContext).then(() => {
          console.info(TEST_SUITE_NAME + TAG + `openNotificationSettings succeeded`);
        }).catch((err: BusinessError):void => {
          console.error(TEST_SUITE_NAME + TAG + `openNotificationSettings err: ${JSON.stringify(err.code)}`);
          expect().assertFail();
          done();
        })
        let driver: Driver = Driver.create();
        await Utils.msSleep(1500)
        await driver.assertComponentExist(ON.text('横幅通知'));
        let button = await driver.findComponent(ON.text('横幅通知'));
        console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
        if (button !== null) {
          console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
          await Utils.msSleep(1000);
          await button.click()
          await Utils.msSleep(500)
        }
        let button2 = await driver.findComponent(ON.text('锁屏通知'));
        console.info(TEST_SUITE_NAME + TAG + `button2 is ${JSON.stringify(button2)}`);
        if (button2 !== null) {
          console.info(TEST_SUITE_NAME + TAG + `button2 is ${JSON.stringify(button2)}`);
          await Utils.msSleep(1000);
          await button2.click()
          await Utils.msSleep(500)
        }
        let scrollBar: Component = await driver.findComponent(ON.text('桌面角标')) as Component
        console.info(TEST_SUITE_NAME + TAG + `scrollToBottom scrollBar, ${JSON.stringify(scrollBar)} `);
        expect(scrollBar != null).assertTrue()
        await scrollBar.scrollToBottom()
        await Utils.msSleep(1000)
        let button3 = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('振动')));
        console.info(TEST_SUITE_NAME + TAG + `button3 is ${JSON.stringify(button3)}`);
        if (button3 !== null) {
          console.info(TEST_SUITE_NAME + TAG + `button3 is ${JSON.stringify(button3)}`);
          await Utils.msSleep(1000);
          await button3.click()
          await Utils.msSleep(500)
        }
        let button4 = await driver.findComponent(ON.text('昂扬'));
        console.info(TEST_SUITE_NAME + TAG + `button4 is ${JSON.stringify(button4)}`);
        if (button4 !== null) {
          console.info(TEST_SUITE_NAME + TAG + `button4 is ${JSON.stringify(button4)}`);
          await Utils.msSleep(1000);
          await button4.click()
          await Utils.msSleep(500)
        }
        let button5 = await driver.findComponent(ON.text('无铃声'));
        console.info(TEST_SUITE_NAME + TAG + `button5 is ${JSON.stringify(button5)}`);
        if (button5 !== null) {
          console.info(TEST_SUITE_NAME + TAG + `button5 is ${JSON.stringify(button5)}`);
          await Utils.msSleep(1000);
          await button5.click()
          await Utils.msSleep(500)
        }
        let button6 = await driver.findComponent(ON.text('确定'));
        console.info(TEST_SUITE_NAME + TAG + `button6 is ${JSON.stringify(button6)}`);
        if (button6 !== null) {
          console.info(TEST_SUITE_NAME + TAG + `button6 is ${JSON.stringify(button6)}`);
          await Utils.msSleep(1000);
          await button6.click()
          await Utils.msSleep(500)
        }
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationFlags: {
            soundEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
            vibrationEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
            bannerEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
            lockScreenEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
          } as notificationManager.NotificationFlags,
          notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "SOCIAL_COMMUNICATION",
              text: "Sub_Notification_Ans_Reduce_alerts_static_010",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(async () => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(500)
            await notificationManager.getActiveNotifications()
              .then((data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(2)
                done()
              })
              .catch((err: BusinessError):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: BusinessError):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }
      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_011
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_011
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_011'
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationFlags: {
            soundEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            vibrationEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            bannerEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            lockScreenEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
          } as notificationManager.NotificationFlags,
          notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "SOCIAL_COMMUNICATION",
              text: "Sub_Notification_Ans_Reduce_alerts_static_011",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(async () => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(500)
            await notificationManager.getActiveNotifications()
              .then((data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(2)
                done()
              })
              .catch((err: BusinessError):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: BusinessError):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }
      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_012
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_012
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_012'
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationFlags: {
            soundEnabled: notificationManager.NotificationFlagStatus.TYPE_CLOSE,
            vibrationEnabled: notificationManager.NotificationFlagStatus.TYPE_CLOSE,
            bannerEnabled: notificationManager.NotificationFlagStatus.TYPE_CLOSE,
            lockScreenEnabled: notificationManager.NotificationFlagStatus.TYPE_CLOSE,
          } as notificationManager.NotificationFlags,
          notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "SOCIAL_COMMUNICATION",
              text: "Sub_Notification_Ans_Reduce_alerts_static_012",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(async () => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(500)
            await notificationManager.getActiveNotifications()
              .then((data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(2)
                done()
              })
              .catch((err: BusinessError):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: BusinessError):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }
      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_018
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_018
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_018'
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationFlags: {
            soundEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
            vibrationEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
            bannerEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
            lockScreenEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
          } as notificationManager.NotificationFlags,
          notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "SERVICE_INFORMATION",
              text: "Sub_Notification_Ans_Reduce_alerts_static_018",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(async () => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(500)
            await notificationManager.getActiveNotifications()
              .then((data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(2)
                done()
              })
              .catch((err: BusinessError):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: BusinessError):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }
      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_019
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_019
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_019'
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationFlags: {
            soundEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            vibrationEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            bannerEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            lockScreenEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
          } as notificationManager.NotificationFlags,
          notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "SERVICE_INFORMATION",
              text: "Sub_Notification_Ans_Reduce_alerts_static_019",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(async () => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(500)
            await notificationManager.getActiveNotifications()
              .then((data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(2)
                done()
              })
              .catch((err: BusinessError):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: BusinessError):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }
      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_020
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_020
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_020'
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationFlags: {
            soundEnabled: notificationManager.NotificationFlagStatus.TYPE_CLOSE,
            vibrationEnabled: notificationManager.NotificationFlagStatus.TYPE_CLOSE,
            bannerEnabled: notificationManager.NotificationFlagStatus.TYPE_CLOSE,
            lockScreenEnabled: notificationManager.NotificationFlagStatus.TYPE_CLOSE,
          } as notificationManager.NotificationFlags,
          notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "SERVICE_INFORMATION",
              text: "Sub_Notification_Ans_Reduce_alerts_static_020",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(async () => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(500)
            await notificationManager.getActiveNotifications()
              .then((data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(2)
                done()
              })
              .catch((err: BusinessError):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: BusinessError):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }
      })

  })
}