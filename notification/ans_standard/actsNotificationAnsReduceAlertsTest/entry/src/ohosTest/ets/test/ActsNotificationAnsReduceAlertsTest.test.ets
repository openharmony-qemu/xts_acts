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
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
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

  describe('SUB_NOTIFICATION_ANS_REDUCE_ALERTS_TEST', () => {
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

    afterEach(async (done: Function) => {
      await sleep(1500)
      await notificationManager.cancelAll().then(() => {
        console.info(TEST_SUITE_NAME + `Succeeded in canceling all notification.`);
        done()
      }).catch((err: BusinessError) => {
        console.error(TEST_SUITE_NAME +
          `Failed to cancel all notification. Code is ${err.code}, message is ${err.message}`);
        expect(false).assertTrue();
        done()
      });
      
    })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_003
     * @tc.number Sub_Notification_Ans_Reduce_alerts_003
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Reduce_alerts_003', Level.LEVEL3, async (done: Function) => {
      let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_003'
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
            text: "Sub_Notification_Ans_Reduce_alerts_003",
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
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_005
     * @tc.number Sub_Notification_Ans_Reduce_alerts_005
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Reduce_alerts_005', Level.LEVEL2, async (done: Function) => {
      let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_005'
      let context: common.UIAbilityContext = getContext(la) as common.UIAbilityContext;
      await notificationManager.openNotificationSettings(context).then(() => {
        console.info(TEST_SUITE_NAME + TAG + `openNotificationSettings succeeded`);
      }).catch((err: BusinessError) => {
        console.error(TEST_SUITE_NAME + TAG + `openNotificationSettings err: ${JSON.stringify(err.code)}`);
        expect().assertFail();
        done();
      })
      let driver: Driver = Driver.create();
      await sleep(1500)
      await driver.assertComponentExist(ON.text('横幅通知'));
      let button = await driver.findComponent(ON.text('横幅通知'));
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
        console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
        await sleep(1000);
        await button2.click()
        await sleep(500)
      }
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
        notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "SOCIAL_COMMUNICATION",
            text: "Sub_Notification_Ans_Reduce_alerts_005",
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
              expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
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
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_007
     * @tc.number Sub_Notification_Ans_Reduce_alerts_007
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Reduce_alerts_007', Level.LEVEL0, async (done: Function) => {
      let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_007'
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
            text: "Sub_Notification_Ans_Reduce_alerts_007",
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
              expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
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
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_008
     * @tc.number Sub_Notification_Ans_Reduce_alerts_008
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Reduce_alerts_008', Level.LEVEL0, async (done: Function) => {
      let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_008'
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
            text: "Sub_Notification_Ans_Reduce_alerts_008",
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
              expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
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
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_009
     * @tc.number Sub_Notification_Ans_Reduce_alerts_009
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Reduce_alerts_009', Level.LEVEL0, async (done: Function) => {
      let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_009'
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
            text: "Sub_Notification_Ans_Reduce_alerts_009",
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
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_013
     * @tc.number Sub_Notification_Ans_Reduce_alerts_013
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Reduce_alerts_013', Level.LEVEL2, async (done: Function) => {
      let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_013'
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
        notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "SERVICE_INFORMATION",
            text: "Sub_Notification_Ans_Reduce_alerts_013",
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
              expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
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
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_015
     * @tc.number Sub_Notification_Ans_Reduce_alerts_015
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Reduce_alerts_015', Level.LEVEL0, async (done: Function) => {
      let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_015'
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
            text: "Sub_Notification_Ans_Reduce_alerts_015",
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
              expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
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
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_016
     * @tc.number Sub_Notification_Ans_Reduce_alerts_016
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Reduce_alerts_016', Level.LEVEL0, async (done: Function) => {
      let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_016'
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
            text: "Sub_Notification_Ans_Reduce_alerts_016",
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
              expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
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
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_017
     * @tc.number Sub_Notification_Ans_Reduce_alerts_017
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Reduce_alerts_017', Level.LEVEL0, async (done: Function) => {
      let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_017'
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
            text: "Sub_Notification_Ans_Reduce_alerts_017",
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
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_021
     * @tc.number Sub_Notification_Ans_Reduce_alerts_021
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Reduce_alerts_021', Level.LEVEL2, async (done: Function) => {
      let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_021'
      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1, 1000),
        notificationSlotType: notificationManager.SlotType.CUSTOMER_SERVICE,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "CUSTOMER_SERVICE",
            text: "Sub_Notification_Ans_Reduce_alerts_021",
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
              expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(1)
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
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_024
     * @tc.number Sub_Notification_Ans_Reduce_alerts_024
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Reduce_alerts_024', Level.LEVEL0, async (done: Function) => {
      let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_024'
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
            text: "Sub_Notification_Ans_Reduce_alerts_024",
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
              expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(1)
              expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(1)
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
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_030
     * @tc.number Sub_Notification_Ans_Reduce_alerts_030
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Reduce_alerts_030', Level.LEVEL2, async (done: Function) => {
      let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_030'
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
            text: "Sub_Notification_Ans_Reduce_alerts_030",
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
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_033
     * @tc.number Sub_Notification_Ans_Reduce_alerts_033
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Reduce_alerts_033', Level.LEVEL2, async (done: Function) => {
      let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_033'
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
            text: "Sub_Notification_Ans_Reduce_alerts_033",
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
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_036
     * @tc.number Sub_Notification_Ans_Reduce_alerts_036
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Reduce_alerts_036', Level.LEVEL2, async (done: Function) => {
      let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_036'
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
            text: "Sub_Notification_Ans_Reduce_alerts_036",
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
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_048
     * @tc.number Sub_Notification_Ans_Reduce_alerts_048
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    //it('Sub_Notification_Ans_Reduce_alerts_048', Level.LEVEL2, async (done: Function) => {
    //  let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_048'
    //  let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
    //  abilityDelegator.executeShellCommand("aa start -b com.huawei.hmos.settings -a com.huawei.hmos.settings.MainAbility")
    //  let driver = Driver.create();
    //  await sleep(1000);
    //  let scrollBar = await driver.findComponent(ON.type('Row'))
    //  console.info(TEST_SUITE_NAME + TAG + `scrollToBottom scrollBar, ${JSON.stringify(scrollBar)} `);
    //  expect(scrollBar != null).assertTrue()
    //  await scrollBar.scrollToBottom();
    //  await driver.assertComponentExist(ON.text('情景模式'));
    //  let button = await driver.findComponent(ON.text('情景模式'));
    //  if (button !== null) {
    //    console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
    //    await button.click()
    //    await sleep(500)
    //  } else {
    //    expect(false).assertTrue();
    //    done()
    //  }
    //  await driver.assertComponentExist(ON.text('立即开启'));
    //  let button2 = await driver.findComponent(ON.text('立即开启'));
    //  if (button2 !== null) {
    //    console.info(TEST_SUITE_NAME + TAG + `button2 is ${JSON.stringify(button2)}`);
    //    await button2.click()
    //    await sleep(500)
    //  } else {
    //    expect(false).assertTrue();
    //    done()
    //  }
    //  let notificationRequest: notificationManager.NotificationRequest = {
    //    id: getRandomNumber(1, 1000),
    //    notificationFlags: {
    //      soundEnabled: 0,
    //      vibrationEnabled: 1,
    //      bannerEnabled: 2,
    //      lockScreenEnabled: 0,
    //    } as notificationManager.NotificationFlags,
    //    notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
    //    content: {
    //      notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
    //      normal: {
    //        title: "SOCIAL_COMMUNICATION",
    //        text: "Sub_Notification_Ans_Reduce_alerts_048",
    //      }
    //    }
    //  };
    //  try {
    //    await notificationManager.publish(notificationRequest).then(async () => {
    //      console.info(TEST_SUITE_NAME + TAG + " publish success");
    //      await sleep(500)
    //      await notificationManager.getActiveNotifications()
    //        .then((data: Array<notificationManager.NotificationRequest>) => {
    //          console.info(TEST_SUITE_NAME + TAG +
    //            ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
    //          expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(2)
    //          expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(2)
    //          expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
    //          expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
    //        })
    //        .catch((err: BusinessError) => {
    //          console.error(TEST_SUITE_NAME + TAG +
    //            `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
    //          expect(false).assertTrue();
    //          done()
    //        });
    //    }).catch((err: BusinessError) => {
    //      console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
    //      expect(false).assertTrue();
    //      done()
    //    });
    //  } catch (err) {
    //    console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
    //    expect(false).assertTrue();
    //    done()
    //  }
    //  await sleep(500)
    //  await driver.assertComponentExist(ON.text('立即关闭'));
    //  let button3 = await driver.findComponent(ON.text('立即关闭'));
    //  if (button3 !== null) {
    //    console.info(TEST_SUITE_NAME + TAG + `button3 is ${JSON.stringify(button3)}`);
    //    await button3.click()
    //    await sleep(500)
    //    done()
    //  } else {
    //    expect(false).assertTrue();
    //    done()
    //  }
    //})

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_051
     * @tc.number Sub_Notification_Ans_Reduce_alerts_051
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Reduce_alerts_051', Level.LEVEL2, async (done: Function) => {
      let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_051'
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.executeShellCommand("aa start -a TestAbility -b com.example.actsnotificationansreducealertstest")
      await sleep(3000)
      let context: common.UIAbilityContext = getContext(la) as common.UIAbilityContext;
      await notificationManager.openNotificationSettings(context).then(() => {
        console.info(TEST_SUITE_NAME + TAG + `openNotificationSettings succeeded`);
      }).catch((err: BusinessError) => {
        console.error(TEST_SUITE_NAME + TAG + `openNotificationSettings err: ${JSON.stringify(err.code)}`);
        expect().assertFail();
        done();
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
            text: "Sub_Notification_Ans_Reduce_alerts_051",
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
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_052
     * @tc.number Sub_Notification_Ans_Reduce_alerts_052
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Reduce_alerts_052', Level.LEVEL2, async (done: Function) => {
      let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_052'
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
            text: "Sub_Notification_Ans_Reduce_alerts_052",
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
        expect().assertFail();
        done();
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
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_010
     * @tc.number Sub_Notification_Ans_Reduce_alerts_010
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Reduce_alerts_010', Level.LEVEL3, async (done: Function) => {
      let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_010'
      let context: common.UIAbilityContext = getContext(la) as common.UIAbilityContext;
      await notificationManager.openNotificationSettings(context).then(() => {
        console.info(TEST_SUITE_NAME + TAG + `openNotificationSettings succeeded`);
      }).catch((err: BusinessError) => {
        console.error(TEST_SUITE_NAME + TAG + `openNotificationSettings err: ${JSON.stringify(err.code)}`);
        expect().assertFail();
        done();
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
            text: "Sub_Notification_Ans_Reduce_alerts_010",
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
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_011
     * @tc.number Sub_Notification_Ans_Reduce_alerts_011
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Reduce_alerts_011', Level.LEVEL3, async (done: Function) => {
      let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_011'
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
            text: "Sub_Notification_Ans_Reduce_alerts_011",
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
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_012
     * @tc.number Sub_Notification_Ans_Reduce_alerts_012
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Reduce_alerts_012', Level.LEVEL3, async (done: Function) => {
      let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_012'
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
            text: "Sub_Notification_Ans_Reduce_alerts_012",
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
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_018
     * @tc.number Sub_Notification_Ans_Reduce_alerts_018
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Reduce_alerts_018', Level.LEVEL3, async (done: Function) => {
      let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_018'
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
            text: "Sub_Notification_Ans_Reduce_alerts_018",
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
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_019
     * @tc.number Sub_Notification_Ans_Reduce_alerts_019
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Reduce_alerts_019', Level.LEVEL3, async (done: Function) => {
      let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_019'
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
            text: "Sub_Notification_Ans_Reduce_alerts_019",
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
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_020
     * @tc.number Sub_Notification_Ans_Reduce_alerts_020
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Reduce_alerts_020', Level.LEVEL3, async (done: Function) => {
      let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_020'
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
            text: "Sub_Notification_Ans_Reduce_alerts_020",
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


  })
}
