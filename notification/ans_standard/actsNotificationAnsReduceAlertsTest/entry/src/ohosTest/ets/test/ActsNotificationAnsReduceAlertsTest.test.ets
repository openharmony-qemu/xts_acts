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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import notificationManager from '@ohos.notificationManager';
import base, { BusinessError } from '@ohos.base';
import { Driver, ON } from '@kit.TestKit';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';

function sleep(time: number) {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}

function getRandomNumber(min: number, max: number): number {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

let la = getContext(this) as common.UIAbilityContext;

export default function ActsNotificationAnsReduceAlertsTest() {
  let TEST_SUITE_NAME = 'SUB_NOTIFICATION_ANS_REDUCE_ALERTS_TEST ===>'

  describe('Sub_NOTIFICATION_ANS_REDUCE_ALERTS_TEST', () => {
    beforeAll(async (done: Function) => {
      notificationManager.requestEnableNotification(la).then(() => {
        console.info(TEST_SUITE_NAME + "requestEnableNotification success");
      }).catch((err: BusinessError) => {
        console.error(TEST_SUITE_NAME +
          `requestEnableNotification failed, code is ${err.code}, message is ${err.message}`);
        expect(false).assertTrue();
        console.info(`${TEST_SUITE_NAME}` + `test case end`);
        done();
      });

      let driver: Driver = Driver.create();
      await sleep(1000);
      await driver.assertComponentExist(ON.text('允许'));
      let button = await driver.findComponent(ON.text('允许'));
      console.log(TEST_SUITE_NAME + `button is ${JSON.stringify(button)}`);
      if (button !== null) {
        await button.click();
        await sleep(1500);
        done()
      } else {
        console.log(TEST_SUITE_NAME + `button is null`)
        expect(false).assertTrue();
        done()
      }

    })

    afterEach(async () => {
      await sleep(1000)
    })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_0100
     * @tc.number SUB_Notification_Ans_Reduce_alerts_0100
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Notification_Ans_Reduce_alerts_0100', Level.LEVEL3, async (done: Function) => {
      let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_0100'
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
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
            text: "SUB_Notification_Ans_Reduce_alerts_17000",
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(() => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          expect(false).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(401);
          done()
        });
      } catch (err) {
        console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        done()
      }

    })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_0200
     * @tc.number SUB_Notification_Ans_Reduce_alerts_0200
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Reduce_alerts_0200', Level.LEVEL2, async (done: Function) => {
      let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_0200'
      let context: common.UIAbilityContext = getContext(la) as common.UIAbilityContext;
      await notificationManager.openNotificationSettings(context).then(() => {
        console.info(TEST_SUITE_NAME + TAG + `openNotificationSettings succeeded`);
      }).catch((err: BusinessError) => {
        console.error(TEST_SUITE_NAME + TAG + `openNotificationSettings err: ${JSON.stringify(err.code)}`);
        if (err?.code === 801) {
          console.error(TEST_SUITE_NAME + TAG + `openNotificationSettings11 err: ${JSON.stringify(err.code)}`);
          expect(err.code).assertEqual(801);
          console.error(TEST_SUITE_NAME + TAG + `openNotificationSettings111 err: ${JSON.stringify(err.code)}`);
          done();
        }else{
          console.error(TEST_SUITE_NAME + TAG + `openNotificationSettings112 err`);
          expect().assertFail();
          done();
        }
        console.error(TEST_SUITE_NAME + TAG + `openNotificationSettings1133 err`);
      })
      console.error(TEST_SUITE_NAME + TAG + `openNotificationSettings11444 err`);
      let driver: Driver = Driver.create();
      await sleep(1500)
      let scrollBar = await driver.findComponent(ON.type('Scroll').isAfter(ON.text('通知管理')))
      console.info(TAG + `scrollToBottom scrollBar, ${JSON.stringify(scrollBar)} `);
      if(scrollBar != null){
        await scrollBar.scrollToBottom()
      }
      await sleep(1500)
      await driver.assertComponentExist(ON.text('横幅通知'));
      await sleep(1500)
      let button = await driver.findComponent(ON.text('横幅通知'));
      console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
      if (button !== null) {
        console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
        await sleep(1000);
        await button.click()
        await sleep(1500)
      }
      let button2 = await driver.findComponent(ON.text('确定'));
      console.info(TEST_SUITE_NAME + TAG + `button2 is ${JSON.stringify(button2)}`);
      if (button2 !== null) {
        console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
        await sleep(1000);
        await button2.click()
        await sleep(1500)
      }
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
        notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "SOCIAL_COMMUNICATION",
            text: "SUB_Notification_Ans_Reduce_alerts_0200",
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          await sleep(500)
          await notificationManager.getActiveNotifications()
            .then((data: Array<notificationManager.NotificationRequest>) => {
              console.info(TEST_SUITE_NAME + TAG +
                ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
              expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
              done()
            })
            .catch((err: BusinessError) => {
              console.error(TEST_SUITE_NAME + TAG +
                `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
              if (err?.code === 801) {
                expect(err.code).assertEqual(801);
                done();
              }else{
                expect().assertFail();
                done();
              }
            });
        }).catch((err: BusinessError) => {
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
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_0300
     * @tc.number SUB_Notification_Ans_Reduce_alerts_0300
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_Reduce_alerts_0300', Level.LEVEL0, async (done: Function) => {
      let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_0300'
      await notificationManager.cancelAll()
      await sleep(1000)
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
        notificationFlags: {
          soundEnabled: 0,
          vibrationEnabled: 0,
          bannerEnabled: 0,
          lockScreenEnabled: 0,
        } as notificationManager.NotificationFlags,
        notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "SOCIAL_COMMUNICATION",
            text: "SUB_Notification_Ans_Reduce_alerts_0300",
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          await sleep(500)
          await notificationManager.getActiveNotifications()
            .then((data: Array<notificationManager.NotificationRequest>) => {
              console.info(TEST_SUITE_NAME + TAG +
                ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data?.[0]?.notificationFlags?.lockScreenEnabled)}`);
                  let lsed = data?.[0]?.notificationFlags?.lockScreenEnabled
                  console.info(TEST_SUITE_NAME + TAG +
                    ` Scceeded in getting active notifications, data is ${JSON.stringify(typeof lsed)}`);
              expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
              done()
            }).catch((err: BusinessError) => {
              console.error(TEST_SUITE_NAME + TAG +
                `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
              if (err?.code === 801) {
                expect(err.code).assertEqual(801);
                done();
              }else{
                expect().assertFail();
                done();
              }
            });
        }).catch((err: BusinessError) => {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          }else{
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done()
      }

    })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_0400
     * @tc.number SUB_Notification_Ans_Reduce_alerts_0400
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_Reduce_alerts_0400', Level.LEVEL0, async (done: Function) => {
      let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_0400'
      await notificationManager.cancelAll()
      await sleep(1000)
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
        notificationFlags: {
          soundEnabled: 1,
          vibrationEnabled: 1,
          bannerEnabled: 1,
          lockScreenEnabled: 1,
        } as notificationManager.NotificationFlags,
        notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "SOCIAL_COMMUNICATION",
            text: "SUB_Notification_Ans_Reduce_alerts_0400",
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          await sleep(1000)
          await notificationManager.getActiveNotifications()
            .then((data: Array<notificationManager.NotificationRequest>) => {
              console.info(TEST_SUITE_NAME + TAG +
                ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
              expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
              done()
            })
            .catch((err: BusinessError) => {
              console.error(TEST_SUITE_NAME + TAG +
                `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
              if (err?.code === 801) {
                expect(err.code).assertEqual(801);
                done();
              }else{
                expect().assertFail();
                done();
              }
            });
        }).catch((err: BusinessError) => {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          }else{
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done()
      }

    })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_0500
     * @tc.number SUB_Notification_Ans_Reduce_alerts_0500
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_Reduce_alerts_0500', Level.LEVEL0, async (done: Function) => {
      let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_0500'
      await notificationManager.cancelAll()
      await sleep(1000)
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
        notificationFlags: {
          soundEnabled: 2,
          vibrationEnabled: 2,
          bannerEnabled: 2,
          lockScreenEnabled: 2,
        } as notificationManager.NotificationFlags,
        notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "SOCIAL_COMMUNICATION",
            text: "SUB_Notification_Ans_Reduce_alerts_0500",
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          await sleep(1000)
          await notificationManager.getActiveNotifications()
            .then((data: Array<notificationManager.NotificationRequest>) => {
              console.info(TEST_SUITE_NAME + TAG +
                ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
              expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
              done()
            })
            .catch((err: BusinessError) => {
              console.error(TEST_SUITE_NAME + TAG +
                `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
              if (err?.code === 801) {
                expect(err.code).assertEqual(801);
                done();
              }else{
                expect().assertFail();
                done();
              }
            });
        }).catch((err: BusinessError) => {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          }else{
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done()
      }

    })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_0600
     * @tc.number SUB_Notification_Ans_Reduce_alerts_0600
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Reduce_alerts_0600', Level.LEVEL2, async (done: Function) => {
      let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_0600'
      await notificationManager.cancelAll()
      await sleep(1000)
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
        notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "SERVICE_INFORMATION",
            text: "SUB_Notification_Ans_Reduce_alerts_0600",
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          await sleep(500)
          await notificationManager.getActiveNotifications()
            .then((data: Array<notificationManager.NotificationRequest>) => {
              console.info(TEST_SUITE_NAME + TAG +
                ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
              expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
              done()
            })
            .catch((err: BusinessError) => {
              console.error(TEST_SUITE_NAME + TAG +
                `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
              if (err?.code === 801) {
                expect(err.code).assertEqual(801);
                done();
              }else{
                expect().assertFail();
                done();
              }
            });
        }).catch((err: BusinessError) => {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          }else{
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done()
      }

    })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_0700
     * @tc.number SUB_Notification_Ans_Reduce_alerts_0700
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_Reduce_alerts_0700', Level.LEVEL0, async (done: Function) => {
      let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_0700'
      await notificationManager.cancelAll()
      await sleep(1000)
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
        notificationFlags: {
          soundEnabled: 0,
          vibrationEnabled: 0,
          bannerEnabled: 0,
          lockScreenEnabled: 0,
        } as notificationManager.NotificationFlags,
        notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "SERVICE_INFORMATION",
            text: "SUB_Notification_Ans_Reduce_alerts_0700",
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          await sleep(500)
          await notificationManager.getActiveNotifications()
            .then((data: Array<notificationManager.NotificationRequest>) => {
              console.info(TEST_SUITE_NAME + TAG +
                ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
              expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
              done()
            })
            .catch((err: BusinessError) => {
              console.error(TEST_SUITE_NAME + TAG +
                `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err?.code === 801) {
                  expect(err.code).assertEqual(801);
                  done();
                }else{
                  expect().assertFail();
                  done();
                }
            });
        }).catch((err: BusinessError) => {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          }else{
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done()
      }

    })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_0800
     * @tc.number SUB_Notification_Ans_Reduce_alerts_0800
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_Reduce_alerts_0800', Level.LEVEL0, async (done: Function) => {
      let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_0800'
      await notificationManager.cancelAll()
      await sleep(1000)
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
        notificationFlags: {
          soundEnabled: 1,
          vibrationEnabled: 1,
          bannerEnabled: 1,
          lockScreenEnabled: 1,
        } as notificationManager.NotificationFlags,
        notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "SERVICE_INFORMATION",
            text: "SUB_Notification_Ans_Reduce_alerts_0800",
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          await sleep(1000)
          await notificationManager.getActiveNotifications()
            .then((data: Array<notificationManager.NotificationRequest>) => {
              console.info(TEST_SUITE_NAME + TAG +
                ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
              expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
              done()
            })
            .catch((err: BusinessError) => {
              console.error(TEST_SUITE_NAME + TAG +
                `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err?.code === 801) {
                  expect(err.code).assertEqual(801);
                  done();
                }else{
                  expect().assertFail();
                  done();
                }
            });
        }).catch((err: BusinessError) => {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          }else{
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done()
      }

    })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_0900
     * @tc.number SUB_Notification_Ans_Reduce_alerts_0900
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_Reduce_alerts_0900', Level.LEVEL0, async (done: Function) => {
      let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_0900'
      await notificationManager.cancelAll()
      await sleep(1000)
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
        notificationFlags: {
          soundEnabled: 2,
          vibrationEnabled: 2,
          bannerEnabled: 2,
          lockScreenEnabled: 2,
        } as notificationManager.NotificationFlags,
        notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "SERVICE_INFORMATION",
            text: "SUB_Notification_Ans_Reduce_alerts_0900",
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          await sleep(1000)
          await notificationManager.getActiveNotifications()
            .then((data: Array<notificationManager.NotificationRequest>) => {
              console.info(TEST_SUITE_NAME + TAG +
                ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
              expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
              done()
            })
            .catch((err: BusinessError) => {
              console.error(TEST_SUITE_NAME + TAG +
                `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err?.code === 801) {
                  expect(err.code).assertEqual(801);
                  done();
                }else{
                  expect().assertFail();
                  done();
                }
            });
        }).catch((err: BusinessError) => {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          }else{
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done()
      }

    })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_1000
     * @tc.number SUB_Notification_Ans_Reduce_alerts_1000
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Reduce_alerts_1000', Level.LEVEL2, async (done: Function) => {
      let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_1000'
      await notificationManager.cancelAll()
      await sleep(1000)
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
        notificationSlotType: notificationManager.SlotType.CUSTOMER_SERVICE,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "CUSTOMER_SERVICE",
            text: "SUB_Notification_Ans_Reduce_alerts_1000",
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          await sleep(500)
          await notificationManager.getActiveNotifications()
            .then((data: Array<notificationManager.NotificationRequest>) => {
              console.info(TEST_SUITE_NAME + TAG +
                ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
              expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
              done()
            })
            .catch((err: BusinessError) => {
              console.error(TEST_SUITE_NAME + TAG +
                `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err?.code === 801) {
                  expect(err.code).assertEqual(801);
                  done();
                }else{
                  expect().assertFail();
                  done();
                }
            });
        }).catch((err: BusinessError) => {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          }else{
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done()
      }

    })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_1100
     * @tc.number SUB_Notification_Ans_Reduce_alerts_1100
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_Reduce_alerts_1100', Level.LEVEL0, async (done: Function) => {
      let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_1100'
      await notificationManager.cancelAll()
      await sleep(1000)
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
        notificationFlags: {
          soundEnabled: 1,
          vibrationEnabled: 1,
          bannerEnabled: 1,
          lockScreenEnabled: 1,
        } as notificationManager.NotificationFlags,
        notificationSlotType: notificationManager.SlotType.CUSTOMER_SERVICE,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "CUSTOMER_SERVICE",
            text: "SUB_Notification_Ans_Reduce_alerts_1100",
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          await sleep(500)
          await notificationManager.getActiveNotifications()
            .then((data: Array<notificationManager.NotificationRequest>) => {
              console.info(TEST_SUITE_NAME + TAG +
                ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
              expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
              done()
            })
            .catch((err: BusinessError) => {
              console.error(TEST_SUITE_NAME + TAG +
                `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err?.code === 801) {
                  expect(err.code).assertEqual(801);
                  done();
                }else{
                  expect().assertFail();
                  done();
                }
            });
        }).catch((err: BusinessError) => {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          }else{
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done()
      }

    })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_1200
     * @tc.number SUB_Notification_Ans_Reduce_alerts_1200
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Reduce_alerts_1200', Level.LEVEL2, async (done: Function) => {
      let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_1200'
      await notificationManager.cancelAll()
      await sleep(1000)
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
        notificationFlags: {
          soundEnabled: 1,
          vibrationEnabled: 1,
          bannerEnabled: 1,
          lockScreenEnabled: 1,
        } as notificationManager.NotificationFlags,
        notificationSlotType: notificationManager.SlotType.UNKNOWN_TYPE,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "UNKNOWN_TYPE",
            text: "SUB_Notification_Ans_Reduce_alerts_1200",
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          await sleep(500)
          await notificationManager.getActiveNotifications()
            .then((data: Array<notificationManager.NotificationRequest>) => {
              console.info(TEST_SUITE_NAME + TAG +
                ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
              expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
              done()
            })
            .catch((err: BusinessError) => {
              console.error(TEST_SUITE_NAME + TAG +
                `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err?.code === 801) {
                  expect(err.code).assertEqual(801);
                  done();
                }else{
                  expect().assertFail();
                  done();
                }
            });
        }).catch((err: BusinessError) => {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          }else{
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done()
      }

    })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_1300
     * @tc.number SUB_Notification_Ans_Reduce_alerts_1300
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Reduce_alerts_1300', Level.LEVEL2, async (done: Function) => {
      let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_1300'
      await notificationManager.cancelAll()
      await sleep(1000)
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
        notificationFlags: {
          soundEnabled: 1,
          vibrationEnabled: 1,
          bannerEnabled: 1,
          lockScreenEnabled: 1,
        } as notificationManager.NotificationFlags,
        notificationSlotType: notificationManager.SlotType.CONTENT_INFORMATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "CONTENT_INFORMATION",
            text: "SUB_Notification_Ans_Reduce_alerts_1300",
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          await sleep(500)
          await notificationManager.getActiveNotifications()
            .then((data: Array<notificationManager.NotificationRequest>) => {
              console.info(TEST_SUITE_NAME + TAG +
                ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
              expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
              done()
            })
            .catch((err: BusinessError) => {
              console.error(TEST_SUITE_NAME + TAG +
                `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err?.code === 801) {
                  expect(err.code).assertEqual(801);
                  done();
                }else{
                  expect().assertFail();
                  done();
                }
            });
        }).catch((err: BusinessError) => {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          }else{
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done()
      }

    })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_1400
     * @tc.number SUB_Notification_Ans_Reduce_alerts_1400
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Reduce_alerts_1400', Level.LEVEL2, async (done: Function) => {
      let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_1400'
      await notificationManager.cancelAll()
      await sleep(1000)
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
        notificationFlags: {
          soundEnabled: 1,
          vibrationEnabled: 1,
          bannerEnabled: 1,
          lockScreenEnabled: 1,
        } as notificationManager.NotificationFlags,
        notificationSlotType: notificationManager.SlotType.OTHER_TYPES,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "OTHER_TYPES",
            text: "SUB_Notification_Ans_Reduce_alerts_1400",
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          await sleep(500)
          await notificationManager.getActiveNotifications()
            .then((data: Array<notificationManager.NotificationRequest>) => {
              console.info(TEST_SUITE_NAME + TAG +
                ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
              expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
              done()
            })
            .catch((err: BusinessError) => {
              console.error(TEST_SUITE_NAME + TAG +
                `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                if (err?.code === 801) {
                  expect(err.code).assertEqual(801);
                  done();
                }else{
                  expect().assertFail();
                  done();
                }
            });
        }).catch((err: BusinessError) => {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          }else{
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done()
      }

    })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_1500
     * @tc.number SUB_Notification_Ans_Reduce_alerts_1500
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Reduce_alerts_1500', Level.LEVEL2, async (done: Function) => {
      let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_1500'
      await notificationManager.cancelAll()
      await sleep(1000)
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      let cmd = "aa start -a TestAbility -b com.example.actsnotificationansreducealertstest";
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd)
      await sleep(3000)
      let context: common.UIAbilityContext = getContext(la) as common.UIAbilityContext;
      await notificationManager.openNotificationSettings(context).then(() => {
        console.info(TEST_SUITE_NAME + TAG + `openNotificationSettings succeeded`);
      }).catch((err: BusinessError) => {
        console.error(TEST_SUITE_NAME + TAG + `openNotificationSettings err: ${JSON.stringify(err.code)}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        }else{
          expect().assertFail();
         done();
        }
      })
      let driver: Driver = Driver.create();
      await sleep(1500)
      await driver.assertComponentExist(ON.text('通知管理'));
      let button = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('静默通知')));
      console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
      if (button !== null) {
        console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
        await sleep(1000);
        await button.click()
        await sleep(500)
      }
      let button2 = await driver.findComponent(ON.text('确定'));
      console.info(TEST_SUITE_NAME + TAG + `button2 is ${JSON.stringify(button2)}`);
      if (button2 !== null) {
        console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button2)}`);
        await sleep(1000);
        await button2.click()
        await sleep(500)
      }
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
        notificationFlags: {
          soundEnabled: 0,
          vibrationEnabled: 1,
          bannerEnabled: 2,
          lockScreenEnabled: 0,
        } as notificationManager.NotificationFlags,
        notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "SOCIAL_COMMUNICATION",
            text: "SUB_Notification_Ans_Reduce_alerts_1500",
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          await sleep(500)
          await notificationManager.getActiveNotifications()
            .then((data: Array<notificationManager.NotificationRequest>) => {
              console.info(TEST_SUITE_NAME + TAG +
                ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
              expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
              done()
            })
            .catch((err: BusinessError) => {
              console.error(TEST_SUITE_NAME + TAG +
                `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
              expect(false).assertTrue();
              done()
            });
        }).catch((err: BusinessError) => {
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
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_1600
     * @tc.number SUB_Notification_Ans_Reduce_alerts_1600
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_Reduce_alerts_1600', Level.LEVEL2, async (done: Function) => {
      let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_1600'
      await notificationManager.cancelAll()
      await sleep(1000)
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
        notificationFlags: {
          soundEnabled: 2,
          vibrationEnabled: 0,
          bannerEnabled: 1,
          lockScreenEnabled: 2,
        } as notificationManager.NotificationFlags,
        notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "SERVICE_INFORMATION",
            text: "SUB_Notification_Ans_Reduce_alerts_1600",
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          await sleep(500)
          await notificationManager.getActiveNotifications()
            .then((data: Array<notificationManager.NotificationRequest>) => {
              console.info(TEST_SUITE_NAME + TAG +
                ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
              expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
            })
            .catch((err: BusinessError) => {
              console.error(TEST_SUITE_NAME + TAG +
                `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
              expect(false).assertTrue();
              done()
            });
        }).catch((err: BusinessError) => {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        });
      } catch (err) {
        console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done()
      }
      let context: common.UIAbilityContext = getContext(la) as common.UIAbilityContext;
      await notificationManager.openNotificationSettings(context).then(() => {
        console.info(TEST_SUITE_NAME + TAG + `openNotificationSettings succeeded`);
      }).catch((err: BusinessError) => {
        console.error(TEST_SUITE_NAME + TAG + `openNotificationSettings err: ${JSON.stringify(err.code)}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        }else{
          expect().assertFail();
         done();
        }
      })
      let driver: Driver = Driver.create();
      await driver.assertComponentExist(ON.text('通知管理'));
      let button = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('静默通知')));
      console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
      if (button !== null) {
        console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
        await sleep(1000);
        await button.click()
        await sleep(500)
      }
      let button2 = await driver.findComponent(ON.text('确定'));
      console.info(TEST_SUITE_NAME + TAG + `button2 is ${JSON.stringify(button2)}`);
      if (button2 !== null) {
        console.info(TEST_SUITE_NAME + TAG + `button2 is ${JSON.stringify(button2)}`);
        await sleep(1000);
        await button2.click()
        await sleep(500)
        done()
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_1700
     * @tc.number SUB_Notification_Ans_Reduce_alerts_1700
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Notification_Ans_Reduce_alerts_1700', Level.LEVEL3, async (done: Function) => {
      let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_1700'
      await notificationManager.cancelAll()
      await sleep(1000)
      let context: common.UIAbilityContext = getContext(la) as common.UIAbilityContext;
      await notificationManager.openNotificationSettings(context).then(() => {
        console.info(TEST_SUITE_NAME + TAG + `openNotificationSettings succeeded`);
      }).catch((err: BusinessError) => {
        console.error(TEST_SUITE_NAME + TAG + `openNotificationSettings err: ${JSON.stringify(err.code)}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        }else{
          expect().assertFail();
         done();
        }
      })
      let driver: Driver = Driver.create();
      await sleep(1500)
      await driver.assertComponentExist(ON.text('通知管理'));
      let button2 = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('静默通知')));
      console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button2)}`);
      if (button2 !== null) {
        console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button2)}`);
        await sleep(1000);
        await button2.click()
        await sleep(500)
      }
      let button6 = await driver.findComponent(ON.text('确定'));
      console.info(TEST_SUITE_NAME + TAG + `button6 is ${JSON.stringify(button6)}`);
      if (button6 !== null) {
        console.info(TEST_SUITE_NAME + TAG + `button6 is ${JSON.stringify(button6)}`);
        await sleep(1000);
        await button6.click()
        await sleep(500)
      }
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
        notificationFlags: {
          soundEnabled: 0,
          vibrationEnabled: 0,
          bannerEnabled: 0,
          lockScreenEnabled: 0,
        } as notificationManager.NotificationFlags,
        notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "SOCIAL_COMMUNICATION",
            text: "SUB_Notification_Ans_Reduce_alerts_1700",
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          await sleep(500)
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
            .catch((err: BusinessError) => {
              console.error(TEST_SUITE_NAME + TAG +
                `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
              expect(false).assertTrue();
              done()
            });
        }).catch((err: BusinessError) => {
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
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_1800
     * @tc.number SUB_Notification_Ans_Reduce_alerts_1800
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Notification_Ans_Reduce_alerts_1800', Level.LEVEL3, async (done: Function) => {
      let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_1800'
      await notificationManager.cancelAll()
      await sleep(1000)
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
        notificationFlags: {
          soundEnabled: 1,
          vibrationEnabled: 1,
          bannerEnabled: 1,
          lockScreenEnabled: 1,
        } as notificationManager.NotificationFlags,
        notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "SOCIAL_COMMUNICATION",
            text: "SUB_Notification_Ans_Reduce_alerts_1800",
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          await sleep(1000)
          await notificationManager.getActiveNotifications()
            .then((data: Array<notificationManager.NotificationRequest>) => {
              console.info(TEST_SUITE_NAME + TAG +
                ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
              expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
              done()
            })
            .catch((err: BusinessError) => {
              console.error(TEST_SUITE_NAME + TAG +
                `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
              expect(false).assertTrue();
              done()
            });
        }).catch((err: BusinessError) => {
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
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_1900
     * @tc.number SUB_Notification_Ans_Reduce_alerts_1900
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Notification_Ans_Reduce_alerts_1900', Level.LEVEL3, async (done: Function) => {
      let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_1900'
      await notificationManager.cancelAll()
      await sleep(1000)
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
        notificationFlags: {
          soundEnabled: 2,
          vibrationEnabled: 2,
          bannerEnabled: 2,
          lockScreenEnabled: 2,
        } as notificationManager.NotificationFlags,
        notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "SOCIAL_COMMUNICATION",
            text: "SUB_Notification_Ans_Reduce_alerts_1900",
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          await sleep(1000)
          await notificationManager.getActiveNotifications()
            .then((data: Array<notificationManager.NotificationRequest>) => {
              console.info(TEST_SUITE_NAME + TAG +
                ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
              expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
              done()
            })
            .catch((err: BusinessError) => {
              console.error(TEST_SUITE_NAME + TAG +
                `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
              expect(false).assertTrue();
              done()
            });
        }).catch((err: BusinessError) => {
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
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_2000
     * @tc.number SUB_Notification_Ans_Reduce_alerts_2000
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Notification_Ans_Reduce_alerts_2000', Level.LEVEL3, async (done: Function) => {
      let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_2000'
      await notificationManager.cancelAll()
      await sleep(1000)
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
        notificationFlags: {
          soundEnabled: 0,
          vibrationEnabled: 0,
          bannerEnabled: 0,
          lockScreenEnabled: 0,
        } as notificationManager.NotificationFlags,
        notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "SERVICE_INFORMATION",
            text: "SUB_Notification_Ans_Reduce_alerts_2000",
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          await sleep(1000)
          await notificationManager.getActiveNotifications()
            .then((data: Array<notificationManager.NotificationRequest>) => {
              console.info(TEST_SUITE_NAME + TAG +
                ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
              expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
              done()
            })
            .catch((err: BusinessError) => {
              console.error(TEST_SUITE_NAME + TAG +
                `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
              expect(false).assertTrue();
              done()
            });
        }).catch((err: BusinessError) => {
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
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_2100
     * @tc.number SUB_Notification_Ans_Reduce_alerts_2100
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Notification_Ans_Reduce_alerts_2100', Level.LEVEL3, async (done: Function) => {
      let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_2100'
      await notificationManager.cancelAll()
      await sleep(1000)
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
        notificationFlags: {
          soundEnabled: 1,
          vibrationEnabled: 1,
          bannerEnabled: 1,
          lockScreenEnabled: 1,
        } as notificationManager.NotificationFlags,
        notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "SERVICE_INFORMATION",
            text: "SUB_Notification_Ans_Reduce_alerts_2100",
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          await sleep(1000)
          await notificationManager.getActiveNotifications()
            .then((data: Array<notificationManager.NotificationRequest>) => {
              console.info(TEST_SUITE_NAME + TAG +
                ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
              expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
              done()
            })
            .catch((err: BusinessError) => {
              console.error(TEST_SUITE_NAME + TAG +
                `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
              expect(false).assertTrue();
              done()
            });
        }).catch((err: BusinessError) => {
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
     * @tc.name   SUB_Notification_Ans_Reduce_alerts_2200
     * @tc.number SUB_Notification_Ans_Reduce_alerts_2200
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Notification_Ans_Reduce_alerts_2200', Level.LEVEL3, async (done: Function) => {
      let TAG: string = 'SUB_Notification_Ans_Reduce_alerts_2200'
      await notificationManager.cancelAll()
      await sleep(1000)
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
        notificationFlags: {
          soundEnabled: 2,
          vibrationEnabled: 2,
          bannerEnabled: 2,
          lockScreenEnabled: 2,
        } as notificationManager.NotificationFlags,
        notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "SERVICE_INFORMATION",
            text: "SUB_Notification_Ans_Reduce_alerts_2200",
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          await sleep(1000)
          await notificationManager.getActiveNotifications()
            .then((data: Array<notificationManager.NotificationRequest>) => {
              console.info(TEST_SUITE_NAME + TAG +
                ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
              expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
              done()
            })
            .catch((err: BusinessError) => {
              console.error(TEST_SUITE_NAME + TAG +
                `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
              expect(false).assertTrue();
              done()
            });
        }).catch((err: BusinessError) => {
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
