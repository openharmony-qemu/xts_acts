'use static';
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
import { describe, it, expect, TestType, Size, Level, beforeAll, afterEach, beforeEach } from "@ohos/hypium-binary/src/main/indexStatic"
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

export default function ActsNotificationAnsReduceAlertsTest(){
  let TEST_SUITE_NAME: string = 'ActsNotificationAnsReduceAlertsTest ===>'

  describe('ActsNotificationAnsReduceAlertsTest', () => {
    beforeAll(async (): Promise<void> => {
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(2000)
      let cmd = `aa start -a EntryAbility -b ${JSON.stringify(bundle)}`;
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd)
      await Utils.msSleep(2000)
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext
      await Utils.msSleep(2000)
      notificationManager.requestEnableNotification(testAbilityContext, (err: BusinessError<void> | null) => {
        console.info(`${TEST_SUITE_NAME} requestEnableNotification about is ${testAbilityContext}`)
        console.info(`${TEST_SUITE_NAME} come in requestEnableNotification`);
        if (err) {
          console.info(`${TEST_SUITE_NAME} requestEnableNotification err: ${err?.code}`)
        } else {
          console.info(`${TEST_SUITE_NAME} requestEnableNotification success`)
        }
      })
      await Utils.msSleep(1000)
      let driver = Driver.create()
      await Utils.msSleep(1000)
      console.info(`${TEST_SUITE_NAME} driver is ${JSON.stringify(driver)}`)
      let button = await driver.findComponent(ON.text('允许'));
      console.info(`${TEST_SUITE_NAME} button is ${JSON.stringify(button)}`)
      if (button !== null) {
        await button.click()
        console.info(`${TEST_SUITE_NAME} ===>====>button is click`)
        await Utils.msSleep(1000)
      } else {
        console.info(`${TEST_SUITE_NAME} null button`)
      }
    })

    afterEach(async () => {
      await Utils.msSleep(2000)
      await notificationManager.cancelAll().then(() => {
        console.info(TEST_SUITE_NAME + `Succeeded in canceling all notification.`);
      }).catch((err: Error):void => {
        console.error(TEST_SUITE_NAME +
          `Failed to cancel all notification. Code is ${err.code}, message is ${err.message}`);
      });
    })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_static_0100
     * @tc.number SUB_Notification_Ans_Reduce_alerts_static_0100
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Notification_Ans_Reduce_alerts_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let testAbilityContext: common.UIAbilityContext= AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
        let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_static_0100'
        await notificationManager.openNotificationSettings(testAbilityContext).then(() => {
          console.info(TEST_SUITE_NAME + TAG + `openNotificationSettings succeeded`);
        }).catch((err: Error):void => {
          console.error(TEST_SUITE_NAME + TAG + `openNotificationSettings err: ${JSON.stringify(err.code)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect().assertFail();
            done();
          }
        })
        await Utils.msSleep(1000)
        let driver: Driver = Driver.create();
        await Utils.msSleep(1500)
        await driver.assertComponentExist(ON.text('通知管理'));
        await Utils.msSleep(1500)
        let scrollBarOne = await driver.findComponent(ON.type('Scroll').isAfter(ON.text('通知管理')));
        console.info(TAG + `scrollToBottom Scroll, ${JSON.stringify(scrollBarOne)} `);
        await scrollBarOne?.scrollToBottom()
        await Utils.msSleep(500)
        let button = await driver.findComponent(ON.text('横幅通知'));
        console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
        if (button !== null) {
          console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
          await Utils.msSleep(1500);
          await button.click()
          await Utils.msSleep(1500)
        }
        let button2 = await driver.findComponent(ON.text('确定'));
        console.info(TEST_SUITE_NAME + TAG + `button2 is ${JSON.stringify(button2)}`);
        if (button2 !== null) {
          console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
          await Utils.msSleep(1500);
          await button2.click()
          await Utils.msSleep(1500)
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
              text: "SUB_Notification_Ans_Reduce_alerts_static_0100",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(async () => {
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
              .catch((err: Error):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err.code === 801) {
                  expect(err.code).assertEqual(801)
                  done();
                } else {
                  expect().assertFail();
                  done();
                }
              });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            if (err.code === 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect().assertFail();
            done();
          }
        }

      })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_static_0200
     * @tc.number SUB_Notification_Ans_Reduce_alerts_static_0200
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Reduce_alerts_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'SUB_Notification_Ans_Reduce_alerts_static_0200'
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "SOCIAL_COMMUNICATION",
              text: "SUB_Notification_Ans_Reduce_alerts_static_0200",
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
            }).catch((err: Error):void => {
              console.error(TEST_SUITE_NAME + TAG + `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
              if (err.code === 801) {
                expect(err.code).assertEqual(801)
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            if (err.code === 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        }catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect().assertFail();
            done();
          }
        }

      })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_static_0300
     * @tc.number SUB_Notification_Ans_Reduce_alerts_static_0300
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_Reduce_alerts_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_static_0300'
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
              .then((data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
                done()
              })
              .catch((err: Error):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err.code === 801) {
                  expect(err.code).assertEqual(801)
                  done();
                } else {
                  expect().assertFail();
                  done();
                }
              });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            if (err.code === 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect().assertFail();
            done();
          }
        }

      })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_static_0400
     * @tc.number SUB_Notification_Ans_Reduce_alerts_static_0400
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_Reduce_alerts_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_static_0400'

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
              text: "SUB_Notification_Ans_Reduce_alerts_static_0400",
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
              .catch((err: Error):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err.code === 801) {
                  expect(err.code).assertEqual(801)
                  done();
                } else {
                  expect().assertFail();
                  done();
                }
              });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            if (err.code === 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect().assertFail();
            done();
          }
        }

      })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_static_0500
     * @tc.number SUB_Notification_Ans_Reduce_alerts_static_0500
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_Reduce_alerts_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_static_0500'

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
              text: "SUB_Notification_Ans_Reduce_alerts_static_0500",
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
              .catch((err: Error):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err.code === 801) {
                  expect(err.code).assertEqual(801)
                  done();
                } else {
                  expect().assertFail();
                  done();
                }
              });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            if (err.code === 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }

      })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_static_0600
     * @tc.number SUB_Notification_Ans_Reduce_alerts_static_0600
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Reduce_alerts_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG:string = 'SUB_Notification_Ans_Reduce_alerts_static_0600'
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "SERVICE_INFORMATION",
              text: "SUB_Notification_Ans_Reduce_alerts_static_0600",
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
            }).catch((err: Error):void => {
              console.error(TEST_SUITE_NAME + TAG + `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
              if (err.code === 801) {
                expect(err.code).assertEqual(801)
                done();
              } else {
                expect(false).assertTrue();
                done();
              }
            });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            if (err.code === 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        }catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }

      })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_static_0700
     * @tc.number SUB_Notification_Ans_Reduce_alerts_static_0700
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_Reduce_alerts_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_static_0700'
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
              text: "SUB_Notification_Ans_Reduce_alerts_static_0700",
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
              .catch((err: Error):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err.code === 801) {
                  expect(err.code).assertEqual(801)
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            if (err.code === 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }

      })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_static_0800
     * @tc.number SUB_Notification_Ans_Reduce_alerts_static_0800
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_Reduce_alerts_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_static_0800'

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
              text: "SUB_Notification_Ans_Reduce_alerts_static_0800",
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
              .catch((err: Error):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err.code === 801) {
                  expect(err.code).assertEqual(801)
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            if (err.code === 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }

      })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_static_0900
     * @tc.number SUB_Notification_Ans_Reduce_alerts_static_0900
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_Reduce_alerts_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_static_0900'

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
              text: "SUB_Notification_Ans_Reduce_alerts_static_0900",
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
              .catch((err: Error):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err.code === 801) {
                  expect(err.code).assertEqual(801)
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            if (err.code === 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }

      })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_static_1000
     * @tc.number SUB_Notification_Ans_Reduce_alerts_static_1000
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_Reduce_alerts_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_static_1000'

        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2,
          notificationSlotType: notificationManager.SlotType.CUSTOMER_SERVICE,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "CUSTOMER_SERVICE",
              text: "SUB_Notification_Ans_Reduce_alerts_static_1000",
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
              .catch((err: Error):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err.code === 801) {
                  expect(err.code).assertEqual(801)
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            if (err.code === 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }

      })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_static_1100
     * @tc.number SUB_Notification_Ans_Reduce_alerts_static_1100
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_Reduce_alerts_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_static_1100'

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
              text: "SUB_Notification_Ans_Reduce_alerts_static_1100",
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
              .catch((err: Error):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err.code === 801) {
                  expect(err.code).assertEqual(801)
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            if (err.code === 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }

      })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_static_1200
     * @tc.number SUB_Notification_Ans_Reduce_alerts_static_1200
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_Reduce_alerts_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_static_1200'

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
              text: "SUB_Notification_Ans_Reduce_alerts_static_1200",
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
              .catch((err: Error):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err.code === 801) {
                  expect(err.code).assertEqual(801)
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            if (err.code === 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }

      })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_static_1300
     * @tc.number SUB_Notification_Ans_Reduce_alerts_static_1300
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_Reduce_alerts_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_static_1300'

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
              text: "SUB_Notification_Ans_Reduce_alerts_static_1300",
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
              .catch((err: Error):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err.code === 801) {
                  expect(err.code).assertEqual(801)
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            if (err.code === 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }

      })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_static_1400
     * @tc.number SUB_Notification_Ans_Reduce_alerts_static_1400
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_Reduce_alerts_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_static_1400'

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
              text: "SUB_Notification_Ans_Reduce_alerts_static_1400",
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
              .catch((err: Error):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err.code === 801) {
                  expect(err.code).assertEqual(801)
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            if (err.code === 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }

      })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_static_1600
     * @tc.number SUB_Notification_Ans_Reduce_alerts_static_1600
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Reduce_alerts_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_static_1600'
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        let cmd = "aa start -a EntryAbility -b com.example.actsnotificationansreducealertstest.static";
        let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
        if(user !== undefined){
            cmd += ' -u ' + user;
        }
        abilityDelegator.executeShellCommand(cmd)
        await Utils.msSleep(1500)
        testAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext
        await notificationManager.openNotificationSettings(testAbilityContext).then(() => {
          console.info(TEST_SUITE_NAME + TAG + `openNotificationSettings succeeded`);
        }).catch((err: Error):void => {
          console.error(TEST_SUITE_NAME + TAG + `openNotificationSettings err: ${JSON.stringify(err.code)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        })
        let driver: Driver = Driver.create();
        await Utils.msSleep(1500)
        await driver.assertComponentExist(ON.text('通知管理'));
        await Utils.msSleep(1500)
        let button = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('静默通知')));
        console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
        if (button !== null) {
          console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
          await Utils.msSleep(1000);
          await button.click()
          await Utils.msSleep(1500)
        }
        let button2 = await driver.findComponent(ON.text('确定'));
        console.info(TEST_SUITE_NAME + TAG + `button2 is ${JSON.stringify(button2)}`);
        if (button2 !== null) {
          console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button2)}`);
          await Utils.msSleep(1000);
          await button2.click()
          await Utils.msSleep(1500)
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
              text: "SUB_Notification_Ans_Reduce_alerts_static_1600",
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
              .catch((err: Error):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err.code === 801) {
                  expect(err.code).assertEqual(801)
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            if (err.code === 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_static_1700
     * @tc.number SUB_Notification_Ans_Reduce_alerts_static_1700
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Reduce_alerts_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_static_1700'
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
              text: "SUB_Notification_Ans_Reduce_alerts_static_1700",
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
              .catch((err: Error):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err.code === 801) {
                  expect(err.code).assertEqual(801)
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            if (err.code === 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
        testAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext
        await notificationManager.openNotificationSettings(testAbilityContext).then(() => {
          console.info(TEST_SUITE_NAME + TAG + `openNotificationSettings succeeded`);
        }).catch((err: Error):void => {
          console.error(TEST_SUITE_NAME + TAG + `openNotificationSettings err: ${JSON.stringify(err.code)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
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
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_static_1800
     * @tc.number SUB_Notification_Ans_Reduce_alerts_static_1800
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Notification_Ans_Reduce_alerts_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_static_1800'
        testAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext
        await notificationManager.openNotificationSettings(testAbilityContext).then(() => {
          console.info(TEST_SUITE_NAME + TAG + `openNotificationSettings succeeded`);
        }).catch((err: Error):void => {
          console.error(TEST_SUITE_NAME + TAG + `openNotificationSettings err: ${JSON.stringify(err.code)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        })
        let driver: Driver = Driver.create();
        await Utils.msSleep(1500)
        await driver.assertComponentExist(ON.text('横幅通知'));
        await Utils.msSleep(1500)
        //let scrollBarOne = await driver.findComponent(ON.type('Scroll').isAfter(ON.text('通知管理')));
        //console.info(TAG + `scrollToBottom Scroll, ${JSON.stringify(scrollBarOne)} `);
        //await scrollBarOne?.scrollToBottom()
        //await Utils.msSleep(500)
        let button = await driver.findComponent(ON.text('横幅通知'));
        console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
        if (button !== null) {
          console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
          await Utils.msSleep(1000);
          await button.click()
          await Utils.msSleep(500)
        }
        // let button2 = await driver.findComponent(ON.text('锁屏通知'));
        // console.info(TEST_SUITE_NAME + TAG + `button2 is ${JSON.stringify(button2)}`);
        // if (button2 !== null) {
        //   console.info(TEST_SUITE_NAME + TAG + `button2 is ${JSON.stringify(button2)}`);
        //   await Utils.msSleep(1000);
        //   await button2.click()
        //   await Utils.msSleep(500)
        // }
        //let scrollBar: Component = await driver.findComponent(ON.text('桌面角标')) as Component
        //console.info(TEST_SUITE_NAME + TAG + `scrollToBottom scrollBar, ${JSON.stringify(scrollBar)} `);
        //expect(scrollBar != null).assertTrue()
        //await scrollBar.scrollToBottom()
        //await Utils.msSleep(1000)
        // let button3 = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('振动')));
        // console.info(TEST_SUITE_NAME + TAG + `button3 is ${JSON.stringify(button3)}`);
        // if (button3 !== null) {
        //   console.info(TEST_SUITE_NAME + TAG + `button3 is ${JSON.stringify(button3)}`);
        //   await Utils.msSleep(1000);
        //   await button3.click()
        //   await Utils.msSleep(500)
        // }
        // let button4 = await driver.findComponent(ON.text('昂扬'));
        // console.info(TEST_SUITE_NAME + TAG + `button4 is ${JSON.stringify(button4)}`);
        // if (button4 !== null) {
        //   console.info(TEST_SUITE_NAME + TAG + `button4 is ${JSON.stringify(button4)}`);
        //   await Utils.msSleep(1000);
        //   await button4.click()
        //   await Utils.msSleep(500)
        // }
        // let button5 = await driver.findComponent(ON.text('无铃声'));
        // console.info(TEST_SUITE_NAME + TAG + `button5 is ${JSON.stringify(button5)}`);
        // if (button5 !== null) {
        //   console.info(TEST_SUITE_NAME + TAG + `button5 is ${JSON.stringify(button5)}`);
        //   await Utils.msSleep(1000);
        //   await button5.click()
        //   await Utils.msSleep(500)
        // }
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
              text: "SUB_Notification_Ans_Reduce_alerts_static_1800",
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
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
                done()
              })
              .catch((err: Error):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err.code === 801) {
                  expect(err.code).assertEqual(801)
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            if (err.code === 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_static_1900
     * @tc.number SUB_Notification_Ans_Reduce_alerts_static_1900
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Notification_Ans_Reduce_alerts_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_static_1900'
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
              text: "SUB_Notification_Ans_Reduce_alerts_static_1900",
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
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
                done()
              })
              .catch((err: Error):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err.code === 801) {
                  expect(err.code).assertEqual(801)
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            if (err.code === 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_static_2000
     * @tc.number SUB_Notification_Ans_Reduce_alerts_static_2000
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Notification_Ans_Reduce_alerts_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_static_2000'
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
              text: "SUB_Notification_Ans_Reduce_alerts_static_2000",
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
              .catch((err: Error):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err.code === 801) {
                  expect(err.code).assertEqual(801)
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            if (err.code === 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_static_2100
     * @tc.number SUB_Notification_Ans_Reduce_alerts_static_2100
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Notification_Ans_Reduce_alerts_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_static_2100'
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
              text: "SUB_Notification_Ans_Reduce_alerts_static_2100",
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
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
                done()
              })
              .catch((err: Error):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err.code === 801) {
                  expect(err.code).assertEqual(801)
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            if (err.code === 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_static_2200
     * @tc.number SUB_Notification_Ans_Reduce_alerts_static_2200
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Notification_Ans_Reduce_alerts_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_static_2200'
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
              text: "SUB_Notification_Ans_Reduce_alerts_static_2200",
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
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
                done()
              })
              .catch((err: Error):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err.code === 801) {
                  expect(err.code).assertEqual(801)
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            if (err.code === 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_static_2300
     * @tc.number SUB_Notification_Ans_Reduce_alerts_static_2300
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Notification_Ans_Reduce_alerts_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_static_2300'
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
              text: "SUB_Notification_Ans_Reduce_alerts_static_2300",
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
              .catch((err: Error):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err.code === 801) {
                  expect(err.code).assertEqual(801)
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            if (err.code === 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err.code === 801) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

  })
}