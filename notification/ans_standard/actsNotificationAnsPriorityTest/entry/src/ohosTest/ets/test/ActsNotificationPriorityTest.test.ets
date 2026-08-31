import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import notificationManager from '@ohos.notificationManager';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@kit.TestKit';
import image from '@ohos.multimedia.image';

let context: common.UIAbilityContext;
let TAG: string = 'Notification';
function sleep(time: number) {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}
export default function actsNotificationPriorityTest() {
  describe('actsNotificationPriorityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      context = AppStorage.get<common.UIAbilityContext>("abilityContext") as common.UIAbilityContext
      notificationManager.requestEnableNotification(context).then(() => {
        console.info(`requestEnableNotification succeeded`);
      }).catch((err: BusinessError) => {
        console.info(`requestEnableNotification err: ` + JSON.stringify(err));
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      });
      await sleep(1000)
      let driver = Driver.create();
      let button = await driver.findComponent(ON.text('允许'));
      console.info(`button is ${JSON.stringify(button)}`);
      if (button !== null) {
        await sleep(1000);
        await button.click();
        await sleep(1000);
      } else {
        console.info(`null button`);
        expect(button).assertContain('允许')
      }
    })
    
    /**
     * @tc.name   Sub_Notification_Ans_Priority_Notification_0100
     * @tc.number Sub_Notification_Ans_Priority_Notification_0100
     * @tc.desc   test priorityNotificationType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Priority_Notification_0100', Level.LEVEL2, async  (done : Function) => {
      let TAG = "Sub_Notification_Ans_Priority_Notification_0100"
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: {
          height: 4, width: 6
        }
      };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let notificationRequest: notificationManager.NotificationRequest = {
        id: 7,
        overlayIcon: pixelMap,
        priorityNotificationType: 'OTHER' as notificationManager.PriorityNotificationType,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "test",
            text: "test",
          }
        },
        notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION
      };

      await notificationManager.publish(notificationRequest).then(() => {
        console.info(`${TAG} publish success`);
      }).catch((err: BusinessError):void => {
        console.error(`${TAG} publish failed, code is ${err.code}, message is ${err.message}`);
        expect(false).assertTrue()
        done()
      });
      await notificationManager.getActiveNotifications()
        .then((data: Array<notificationManager.NotificationRequest>) => {
          console.info(`${TAG} getActiveNotifications Promise success :${JSON.stringify(data)}`)
          expect(data[0].priorityNotificationType).assertEqual("OTHER")
          done()
        })
        .catch((err: BusinessError): void => {
          console.info(`${TAG} getActiveNotifications Promise err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_5000
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_5000
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_5000', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Slot_CreateSlot_5000"
      let count = 0
      try {
        notificationManager.addSlot(undefined, (err) => {
          if (err) {
            console.info(TAG + `addSlot SOCIAL_COMMUNICATION err: + ${err.code}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(TAG + `addSlot SOCIAL_COMMUNICATION success`);
            count++
            expect(count).assertEqual(1)
          }
        })
      }catch (err) {
        console.info(`${TAG} addSlot_2 AsyncCallback err: ${err.code}`)
        done()
      }

    })

    /**
     * @tc.name   Sub_Notification_Emitter_Capabilities_5100
     * @tc.number Sub_Notification_Emitter_Capabilities_5100
     * @tc.desc   【getNotificationStatisticsByBundle】参数bundles下的bundleName正确，uid不填写，返回正确的包名和uid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Emitter_Capabilities_5100', Level.LEVEL0, async (done: Function) => {
      let TAG: string = 'Sub_Notification_Emitter_Capabilities_5100';
      let count = 0
      try {
        notificationManager.getSlot(undefined, (err) => {
          if (err) {
            console.info(TAG + `addSlot SOCIAL_COMMUNICATION err: + ${err.code}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(TAG + `addSlot SOCIAL_COMMUNICATION success`);
            count++
            expect(count).assertEqual(1)
          }
        })
      }catch (err) {
        console.info(`${TAG} addSlot_2 AsyncCallback err: ${err.code}`)
        done()
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_5200
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_5200
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_5200', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Slot_CreateSlot_5200"
      let count = 0
      try {
        await notificationManager.addSlot(undefined).then(() => {
          console.info(`${TAG} addSlot_21 success`)
          count++
          expect(count).assertEqual(1)
        }).catch((err: BusinessError) => {
          console.info(`${TAG} addSlot_21 err: ${err}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        })
      }catch (err) {
        console.info(`${TAG} addSlot_2 AsyncCallback err: ${err.code}`)
        done()
      }

    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_5300
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_5300
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_5300', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Slot_CreateSlot_5300"
      let count = 0
      try {
        await notificationManager.addSlot(null).then(() => {
          console.info(`${TAG} addSlot_21 success`)
          count++
          expect(count).assertEqual(1)
        }).catch((err: BusinessError) => {
          console.info(`${TAG} addSlot_21 err: ${err}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        })
      }catch (err) {
        console.info(`${TAG} addSlot_2 AsyncCallback err: ${err.code}`)
        done()
      }

    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_5400
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_5400
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_5400', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Slot_CreateSlot_5400"
      let count = 0
      try {
        notification.getSlot(null, (err:Base.BusinessError) => {
          if (err) {
            console.info(TAG + `addSlot SOCIAL_COMMUNICATION err: + ${err.code}`);
            expect(err.code).assertEqual(401)
            done()
          } else {
            console.info(TAG + `addSlot SOCIAL_COMMUNICATION success`);
            count++
            expect(count).assertEqual(1)
            done()
          }
        })
      }catch (err) {
        console.info(`${TAG} addSlot_2 AsyncCallback err: ${err.code}`)
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_5500
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_5500
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_5500', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Slot_CreateSlot_5500"
      let count = 0
      try {
        notificationManager.getSlot(15, (err) => {
          if (err) {
            console.info(TAG + `addSlot SOCIAL_COMMUNICATION err: + ${err.code}`);
            expect(err.code).assertEqual(401)
            done()
          } else {
            console.info(TAG + `addSlot SOCIAL_COMMUNICATION success`);
            count++
            expect(count).assertEqual(1)
            done()
          }
        })
      }catch (err) {
        console.info(`${TAG} addSlot_2 AsyncCallback err: ${err.code}`)
        expect(err.code).assertEqual(401)
        done()
      }

    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_5600
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_5600
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_5600', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Slot_CreateSlot_5600"
      let count = 0
      try {
        notificationManager.getSlot(undefined, (err) => {
          if (err) {
            console.info(TAG + `addSlot SOCIAL_COMMUNICATION err: + ${err.code}`);
            expect(err.code).assertEqual(401)
            done()
          } else {
            console.info(TAG + `addSlot SOCIAL_COMMUNICATION success`);
            count++
            expect(count).assertEqual(1)
          }
        })
      }catch (err) {
        console.info(`${TAG} addSlot_2 AsyncCallback err: ${err.code}`)
        expect(err.code).assertEqual(401)
        done()
      }

    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_5700
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_5700
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_5700', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Slot_CreateSlot_5700"
      let count = 0
      try {
        await notificationManager.getSlot(15).then((data) => {
          console.info(`${TAG} getSlot_43 Promise `)
          expect(data).assertEqual(null)
          done()
        }).catch((err: BusinessError) => {
          console.info(`${TAG} getSlot_43 Promise errCode: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        })
      }catch (err) {
        console.info(`${TAG} addSlot_2 AsyncCallback err: ${err.code}`)
        expect(err.code).assertEqual(401)
        done()
      }

    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_5800
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_5800
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_5800', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Slot_CreateSlot_5800"
      let count = 0
      try {
        await notificationManager.getSlot(null).then((data) => {
          console.info(`${TAG} getSlot_43 Promise `)
          expect(data).assertEqual(null)
          done()
        }).catch((err: BusinessError) => {
          console.info(`${TAG} getSlot_43 Promise errCode: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        })
      }catch (err) {
        console.info(`${TAG} addSlot_2 AsyncCallback err: ${err.code}`)
        expect(err.code).assertEqual(401)
        done()
      }

    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_5900
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_5900
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_5900', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Slot_CreateSlot_5900"
      let count = 0
      try {
        await notificationManager.getSlot(undefined).then((data) => {
          console.info(`${TAG} getSlot_43 Promise `)
          expect(data).assertEqual(null)
          done()
        }).catch((err: BusinessError) => {
          console.info(`${TAG} getSlot_43 Promise errCode: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        })
      }catch (err) {
        console.info(`${TAG} addSlot_2 AsyncCallback err: ${err.code}`)
        expect(err.code).assertEqual(401)
        done()
      }

    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_6000
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_6000
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_6000', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Slot_CreateSlot_6000"
      let count = 0
      try {
        let removeSlotCallback = (err: BusinessError): void => {
          if (err) {
            console.error(TAG + `Failed to remove slot. Code is ${err.code}, message is ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(TAG + `Succeeded in removing slot.`);
            count++
            expect(count).assertEqual(1)
            done()
          }
        }
        notificationManager.removeSlot(15, removeSlotCallback);
      }catch (err) {
        console.info(`${TAG} removeSlot AsyncCallback err: ${err.code}`)
        expect(err.code).assertEqual(401)
        done()
      }

    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_6100
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_6100
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_6100', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Slot_CreateSlot_6100"
      let count = 0
      try {
        await notificationManager.removeSlot(15).then(() => {
          count++
          expect(count).assertEqual(1)
          console.info(TAG + `Succeeded in removing slot.`);
          done()
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to remove slot. Code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue()
          done()
        });
      }catch (err) {
        console.info(`${TAG} removeSlot AsyncCallback err: ${err.code}`)
        expect(err.code).assertEqual(401)
        done()
      }

    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_6200
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_6200
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_6200', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Slot_CreateSlot_6200"
      let count = 0
      try {
        await notificationManager.removeSlot(null).then(() => {
          count++
          expect(count).assertEqual(1)
          console.info(TAG + `Succeeded in removing slot.`);
          done()
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to remove slot. Code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue()
          done()
        });
      }catch (err) {
        console.info(`${TAG} removeSlot AsyncCallback err: ${err.code}`)
        expect(err.code).assertEqual(401)
        done()
      }

    })
    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_6300
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_6300
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_6300', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Slot_CreateSlot_6300"
      let count = 0
      try {
        await notificationManager.removeSlot(undefined).then(() => {
          count++
          expect(count).assertEqual(1)
          console.info(TAG + `Succeeded in removing slot.`);
          done()
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to remove slot. Code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue()
          done()
        });
      }catch (err) {
        console.info(`${TAG} removeSlot AsyncCallback err: ${err.code}`)
        expect(err.code).assertEqual(401)
        done()
      }

    })

    /**
     * @tc.name   Sub_Notification_Ans_Notification_Supplement_0100
     * @tc.number Sub_Notification_Ans_Notification_Supplement_0100
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Notification_Supplement_0100', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Notification_Supplement_0100"
      let count = 0
      try {
        notificationManager.isNotificationEnabled(1,(err, data) => {
          if (err) {
            console.info(`${TAG} isNotificationEnabled AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} isNotificationEnabled AsyncCallback success`)
            expect(data).assertTrue();
            done()
          }
        });
      }catch (err) {
        console.info(`${TAG} removeSlot AsyncCallback err: ${err.code}`)
        expect(err.code).assertEqual(401)
        done()
      }

    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_6400
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_6400
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_6400', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Slot_CreateSlot_6400"
      let count = 0
      try {
        notification.getSlot(undefined, (err:Base.BusinessError) => {
          if (err) {
            console.info(TAG + `getSlot SOCIAL_COMMUNICATION err: + ${err.code}`);
            expect(err.code).assertEqual(401)
            done()
          } else {
            console.info(TAG + `getSlot SOCIAL_COMMUNICATION success`);
            count++
            expect(count).assertEqual(1)
            done()
          }
        })
      }catch (err) {
        console.info(`${TAG} getSlot AsyncCallback err: ${err.code}`)
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_6500
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_6500
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_6500', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Slot_CreateSlot_6500"
      let count = 0
      try {
        notification.addSlot(null, (err:Base.BusinessError) => {
          if (err) {
            console.info(TAG + `getSlot SOCIAL_COMMUNICATION err: + ${err.code}`);
            expect(err.code).assertEqual(401)
            done()
          } else {
            console.info(TAG + `getSlot SOCIAL_COMMUNICATION success`);
            count++
            expect(count).assertEqual(1)
            done()
          }
        })
      }catch (err) {
        console.info(`${TAG} getSlot AsyncCallback err: ${err.code}`)
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_6600
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_6600
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_6600', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Slot_CreateSlot_6600"
      let count = 0
      try {
        notification.addSlot(undefined, (err:Base.BusinessError) => {
          if (err) {
            console.info(TAG + `getSlot SOCIAL_COMMUNICATION err: + ${err.code}`);
            expect(err.code).assertEqual(401)
            done()
          } else {
            console.info(TAG + `getSlot SOCIAL_COMMUNICATION success`);
            count++
            expect(count).assertEqual(1)
            done()
          }
        })
      }catch (err) {
        console.info(`${TAG} getSlot AsyncCallback err: ${err.code}`)
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_6700
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_6700
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_6700', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Slot_CreateSlot_6700"
      let count = 0
      try {
        notification.addSlot(undefined).then(() => {
          count++
          expect(count).assertEqual(1)
          console.info(TAG + `Succeeded in addSlot slot.`);
          done()
        }).catch((err: Base.BusinessError) => {
          console.error(TAG + `Failed to addSlot. Code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue()
          done()
        });
      }catch (err) {
        console.info(`${TAG} addSlot AsyncCallback err: ${err.code}`)
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_6800
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_6800
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_6800', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Slot_CreateSlot_6800"
      let count = 0
      try {
        notification.addSlot(null).then(() => {
          count++
          expect(count).assertEqual(1)
          console.info(TAG + `Succeeded in addSlot slot.`);
          done()
        }).catch((err: Base.BusinessError) => {
          console.error(TAG + `Failed to addSlot. Code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue()
          done()
        });
      }catch (err) {
        console.info(`${TAG} addSlot AsyncCallback err: ${err.code}`)
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_6900
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_6900
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_6900', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Slot_CreateSlot_6900"
      let count = 0
      try {
        notification.getSlot(null).then(() => {
          count++
          expect(count).assertEqual(1)
          console.info(TAG + `Succeeded in addSlot slot.`);
          done()
        }).catch((err: Base.BusinessError) => {
          console.error(TAG + `Failed to addSlot. Code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue()
          done()
        });
      }catch (err) {
        console.info(`${TAG} addSlot AsyncCallback err: ${err.code}`)
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_7000
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_7000
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_7000', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Slot_CreateSlot_7000"
      let count = 0
      try {
        notification.getSlot(undefined).then(() => {
          count++
          expect(count).assertEqual(1)
          console.info(TAG + `Succeeded in addSlot slot.`);
          done()
        }).catch((err: Base.BusinessError) => {
          console.error(TAG + `Failed to addSlot. Code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue()
          done()
        });
      }catch (err) {
        console.info(`${TAG} addSlot AsyncCallback err: ${err.code}`)
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_7100
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_7100
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_7100', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Slot_CreateSlot_7100"
      let count = 0
      try {
        notification.removeSlot(null).then(() => {
          count++
          expect(count).assertEqual(1)
          console.info(TAG + `Succeeded in addSlot slot.`);
          done()
        }).catch((err: Base.BusinessError) => {
          console.error(TAG + `Failed to addSlot. Code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue()
          done()
        });
      }catch (err) {
        console.info(`${TAG} addSlot AsyncCallback err: ${err.code}`)
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_7200
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_7200
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_7200', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Slot_CreateSlot_7200"
      let count = 0
      try {
        notification.removeSlot(undefined).then(() => {
          count++
          expect(count).assertEqual(1)
          console.info(TAG + `Succeeded in addSlot slot.`);
          done()
        }).catch((err: Base.BusinessError) => {
          console.error(TAG + `Failed to addSlot. Code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue()
          done()
        });
      }catch (err) {
        console.info(`${TAG} addSlot AsyncCallback err: ${err.code}`)
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_7300
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_7300
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_7300', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Slot_CreateSlot_7300"
      let count = 0
      try {
        notification.removeSlot(undefined, (err:Base.BusinessError) => {
          if (err) {
            console.info(TAG + `getSlot SOCIAL_COMMUNICATION err: + ${err.code}`);
            expect(err.code).assertEqual(401)
            done()
          } else {
            console.info(TAG + `getSlot SOCIAL_COMMUNICATION success`);
            count++
            expect(count).assertEqual(1)
            done()
          }
        })
      }catch (err) {
        console.info(`${TAG} getSlot AsyncCallback err: ${err.code}`)
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_7400
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_7400
     * @tc.desc   Options填写非法枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_7400', Level.LEVEL0, async (done: Function) => {
      let TAG ="Sub_Notification_Ans_Slot_CreateSlot_7400"
      let count = 0
      try {
        notification.removeSlot(null, (err:Base.BusinessError) => {
          if (err) {
            console.info(TAG + `getSlot SOCIAL_COMMUNICATION err: + ${err.code}`);
            expect(err.code).assertEqual(401)
            done()
          } else {
            console.info(TAG + `getSlot SOCIAL_COMMUNICATION success`);
            count++
            expect(count).assertEqual(1)
            done()
          }
        })
      }catch (err) {
        console.info(`${TAG} getSlot AsyncCallback err: ${err.code}`)
        expect(err.code).assertEqual(401)
        done()
      }
    })
  })
}