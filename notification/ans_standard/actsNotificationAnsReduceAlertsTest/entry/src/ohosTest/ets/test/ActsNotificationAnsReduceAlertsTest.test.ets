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
import { Driver, ON, On, Component, Rect } from '@kit.TestKit';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';

function sleep(time: number) {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}

function getRandomNumber(min: number, max: number): number {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

/**
 * 读取组件实际矩形并打印，用于和面板窗口区域交叉校验。
 * UIExtension 承载的半模态面板中，无障碍节点树挂在宿主窗口下，
 * 节点矩形可能与实际渲染窗口存在偏移，因此点击前必须先取真实 bounds。
 */
async function getBoundsWithLog(component: Component, tag: string): Promise<Rect | null> {
  try {
    let rect: Rect = await component.getBounds();
    console.info(`${tag} getBounds: ${JSON.stringify(rect)}`);
    if (rect.right <= rect.left || rect.bottom <= rect.top) {
      console.error(`${tag} getBounds invalid: ${JSON.stringify(rect)}`);
      return null;
    }
    return rect;
  } catch (err) {
    console.error(`${tag} getBounds failed: ${JSON.stringify(err)}`);
    return null;
  }
}

/**
 * 读取 Toggle 的开关状态。部分设备/版本不支持该能力时返回 null，
 * 调用方需按“无法校验”处理，不能据此判定失败。
 */
async function getCheckedState(component: Component, tag: string): Promise<boolean | null> {
  try {
    let checked: boolean = await component.isChecked();
    console.info(`${tag} isChecked: ${checked}`);
    return checked;
  } catch (err) {
    console.info(`${tag} isChecked not supported: ${JSON.stringify(err)}`);
    return null;
  }
}

/**
 * 等待开关状态变化。开关状态刷新存在延迟，直接判定会误判为点击无效并重复点击，
 * 导致开关被切回原状态，因此这里轮询等待，只有确认未变化才返回原值。
 * 每轮都重新定位组件，避免读到节点缓存里的旧状态。
 */
async function waitCheckedChanged(driver: Driver, finder: () => Promise<Component | null>,
  before: boolean | null, tag: string, retry: number = 5,
  interval: number = 300): Promise<boolean | null> {
  let current: boolean | null = before;
  for (let i = 0; i < retry; i++) {
    await sleep(interval);
    let fresh = await finder();
    if (fresh === null) {
      continue;
    }
    current = await getCheckedState(fresh, `${tag} poll#${i}`);
    if (current === null || before === null || current !== before) {
      return current;
    }
  }
  return current;
}

/**
 * 点击 Toggle 并校验开关状态是否翻转。
 *
 * 每次尝试都重新定位组件（重新拉取窗口树），避免使用布局稳定前的过期矩形。
 * 尝试顺序（逐级降级，覆盖不同设备的布局差异）：
 *   1. Toggle 的 bounds 中心点；
 *   2. Toggle 的 bounds 内 1/4 位置偏移点（应对矩形与实际渲染的局部偏差）；
 *   3. 框架自身的 component.click()；
 *   4. 点击「静默通知」文字所在行（部分设备整行可点）。
 * 每次点击后轮询等待开关状态变化，变化即成功返回，避免重复点击把开关切回去。
 * isChecked 不可用时按“无法校验”处理，只做一次 bounds 中心点击后放行。
 */
async function clickToggleAndVerify(driver: Driver, finder: () => Promise<Component | null>,
  tag: string): Promise<boolean> {
  let component = await finder();
  if (component === null) {
    console.error(`${tag} component not found, skip click`);
    return false;
  }
  let before: boolean | null = await getCheckedState(component, tag);
  // 相对偏移比例：中心点优先，其后按 1/4 位置做上下左右重试
  let ratios: Array<Array<number>> = [
    [0, 0],
    [0, -0.25],
    [0, 0.25],
    [-0.25, 0],
    [0.25, 0]
  ];
  for (let i = 0; i < ratios.length; i++) {
    let fresh = await finder();
    if (fresh === null) {
      console.error(`${tag} component lost at attempt #${i}`);
      return false;
    }
    let rect = await getBoundsWithLog(fresh, `${tag} attempt#${i}`);
    if (rect === null) {
      console.info(`${tag} bounds unavailable, fallback to component.click()`);
      await fresh.click();
      await sleep(800);
      return true;
    }
    let width: number = rect.right - rect.left;
    let height: number = rect.bottom - rect.top;
    let x: number = Math.floor((rect.left + rect.right) / 2 + ratios[i][0] * width);
    let y: number = Math.floor((rect.top + rect.bottom) / 2 + ratios[i][1] * height);
    console.info(`${tag} try click #${i} at (${x}, ${y})`);
    await driver.click(x, y);
    let after: boolean | null = await waitCheckedChanged(driver, finder, before, tag);
    if (before === null || after === null) {
      console.info(`${tag} checked state unavailable, treat click #${i} as done`);
      return true;
    }
    if (after !== before) {
      console.info(`${tag} toggle state changed: ${before} -> ${after}`);
      return true;
    }
    console.info(`${tag} toggle state unchanged after click #${i}, retry`);
  }
  // 降级 1：框架自身点击实现
  let byApi = await finder();
  if (byApi !== null) {
    console.info(`${tag} fallback to component.click()`);
    await byApi.click();
    let state: boolean | null = await waitCheckedChanged(driver, finder, before, tag);
    if (before === null || state === null || state !== before) {
      console.info(`${tag} toggle state changed by component.click`);
      return true;
    }
  }
  // 降级 2：点击文字所在行，部分设备整行可点
  let label = await findComponentWithRetry(driver, ON.text('静默通知'), tag, 5, 300);
  if (label !== null) {
    let labelRect = await getBoundsWithLog(label, `${tag} label`);
    if (labelRect !== null) {
      let x: number = Math.floor((labelRect.left + labelRect.right) / 2);
      let y: number = Math.floor((labelRect.top + labelRect.bottom) / 2);
      console.info(`${tag} fallback click label at (${x}, ${y})`);
      await driver.click(x, y);
      // 用重新定位到的 Toggle 校验状态，不能拿 Text 节点判断
      let state: boolean | null = await waitCheckedChanged(driver, finder, before, tag);
      if (before === null || state === null || state !== before) {
        console.info(`${tag} toggle state changed by label click`);
        return true;
      }
    }
  }
  console.error(`${tag} toggle state never changed after all attempts`);
  return false;
}

/**
 * 点击「确定」并校验面板是否关闭。
 * 若点击后面板仍在，说明落点未命中按钮，重新定位后再试，覆盖不同设备的坐标偏移。
 */
async function clickConfirmAndVerify(driver: Driver, tag: string): Promise<boolean> {
  let ratios: Array<Array<number>> = [
    [0, 0],
    [0, -0.25],
    [0, 0.25],
    [-0.25, 0],
    [0.25, 0]
  ];
  for (let i = 0; i < ratios.length; i++) {
    let confirm = await findComponentWithRetry(driver, ON.text('确定'), tag, 5, 300);
    if (confirm === null) {
      console.info(`${tag} confirm button not found at attempt #${i}, sheet may be closed`);
      return true;
    }
    let rect = await getBoundsWithLog(confirm, `${tag} confirm#${i}`);
    if (rect === null) {
      console.info(`${tag} confirm bounds unavailable, fallback to component.click()`);
      await confirm.click();
    } else {
      let width: number = rect.right - rect.left;
      let height: number = rect.bottom - rect.top;
      let x: number = Math.floor((rect.left + rect.right) / 2 + ratios[i][0] * width);
      let y: number = Math.floor((rect.top + rect.bottom) / 2 + ratios[i][1] * height);
      console.info(`${tag} try confirm click #${i} at (${x}, ${y})`);
      await driver.click(x, y);
    }
    await sleep(800);
    // 面板关闭即视为点击成功
    let sheet = await driver.findComponent(ON.text('通知管理'));
    if (sheet === null) {
      console.info(`${tag} sheet closed after confirm click #${i}`);
      return true;
    }
    console.info(`${tag} sheet still open after confirm click #${i}, retry`);
  }
  console.error(`${tag} sheet still open after all confirm attempts`);
  return false;
}

/**
 * 轮询查找组件，等待面板动画和布局稳定。
 */
async function findComponentWithRetry(driver: Driver, on: On, tag: string,
  retry: number = 10, interval: number = 300): Promise<Component | null> {
  for (let i = 0; i < retry; i++) {
    let component = await driver.findComponent(on);
    if (component !== null) {
      return component;
    }
    await sleep(interval);
  }
  console.error(`${tag} findComponent retry ${retry} times still null`);
  return null;
}

/**
 * 在同一行内按空间位置匹配 Toggle：先取文字标签 bounds，
 * 再在所有 Toggle 中挑选垂直方向与该行重叠、且位于标签右侧的那个。
 * 相比 isAfter(文本) 的树序匹配，空间匹配不依赖具体设备的布局顺序。
 */
async function findToggleInSameRow(driver: Driver, labelText: string,
  tag: string, retry: number = 3, interval: number = 200): Promise<Component | null> {
  let label = await findComponentWithRetry(driver, ON.text(labelText), tag, retry, interval);
  if (label === null) {
    return null;
  }
  let labelRect = await getBoundsWithLog(label, tag);
  if (labelRect === null) {
    return null;
  }
  let rowHeight: number = labelRect.bottom - labelRect.top;
  let tolerance: number = rowHeight > 0 ? rowHeight : 40;
  let toggles: Array<Component> = [];
  try {
    toggles = await driver.findComponents(ON.type('Toggle'));
  } catch (err) {
    console.error(`${tag} findComponents(Toggle) failed: ${JSON.stringify(err)}`);
    return null;
  }
  console.info(`${tag} found ${toggles.length} Toggle(s)`);
  let best: Component | null = null;
  let bestDistance: number = Number.MAX_VALUE;
  for (let i = 0; i < toggles.length; i++) {
    let rect = await getBoundsWithLog(toggles[i], `${tag} Toggle#${i}`);
    if (rect === null) {
      continue;
    }
    let toggleCenterY: number = (rect.top + rect.bottom) / 2;
    let inSameRow: boolean = toggleCenterY >= (labelRect.top - tolerance) &&
      toggleCenterY <= (labelRect.bottom + tolerance);
    let onRightSide: boolean = rect.left >= labelRect.left;
    if (inSameRow && onRightSide) {
      let distance: number = Math.abs(toggleCenterY - (labelRect.top + labelRect.bottom) / 2);
      if (distance < bestDistance) {
        bestDistance = distance;
        best = toggles[i];
      }
    }
  }
  if (best !== null) {
    console.info(`${tag} matched Toggle in same row, distance: ${bestDistance}`);
  } else {
    console.error(`${tag} no Toggle matched same row, will fallback`);
  }
  return best;
}

let la = getContext(this) as common.UIAbilityContext;

export default function ActsNotificationAnsReduceAlertsTest() {
  let TEST_SUITE_NAME = 'SUB_NOTIFICATION_ANS_REDUCE_ALERTS_TEST ===>'

  describe('Sub_NOTIFICATION_ANS_REDUCE_ALERTS_TEST', () => {
    beforeAll(async (done: Function) => {
      notificationManager.requestEnableNotification(la).then(() => {
        console.info(TEST_SUITE_NAME + 'requestEnableNotification success');
      }).catch((err: BusinessError) => {
        console.error(TEST_SUITE_NAME +
          `requestEnableNotification failed, code is ${err.code}, message is ${err.message}`);
        expect(false).assertTrue();
        console.info(`${TEST_SUITE_NAME}` + `test case end`);
      });

      let driver: Driver = Driver.create();
      await sleep(1000);
      // 若权限已授予则不再弹窗，findComponent 返回 null，属正常场景，直接放行
      let button = await driver.findComponent(ON.text('允许'));
      console.log(TEST_SUITE_NAME + `button is ${JSON.stringify(button)}`);
      if (button !== null) {
        await button.click();
        await sleep(1500);
      } else {
        console.log(TEST_SUITE_NAME + `button is null, permission may already be enabled`)
      }
      done()

    })

    afterEach(async () => {
      await sleep(1500)
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
            title: 'SOCIAL_COMMUNICATION',
            text: 'SUB_Notification_Ans_Reduce_alerts_17000',
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(() => {
          console.info(TEST_SUITE_NAME + TAG + ' publish success');
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
      try {
        await notificationManager.openNotificationSettings(context).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + `openNotificationSettings succeeded`);
          // 打开设置页成功才执行 UI 流程与发布验证；失败(801)时直接走 .catch 结束用例，
          // 避免 done() 后僵尸代码污染下一个用例(currentRunningSpec)。
          let driver: Driver = Driver.create();
          await sleep(1500)
          let scrollBar = await driver.findComponent(ON.type('Scroll').isAfter(ON.text('通知管理')))
          console.info(TAG + `scrollToBottom scrollBar, ${JSON.stringify(scrollBar)} `);
          expect(scrollBar != null).assertTrue()
          await scrollBar.scrollToBottom()
          await sleep(1500)
          await driver.assertComponentExist(ON.text('横幅通知'));
          await sleep(1000)
          let button = await driver.findComponent(ON.text('横幅通知'));
          console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
          if (button !== null) {
            console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
            await sleep(500);
            await button.click()
            await sleep(1000)
          }
          let button2 = await driver.findComponent(ON.text('确定'));
          console.info(TEST_SUITE_NAME + TAG + `button2 is ${JSON.stringify(button2)}`);
          if (button2 !== null) {
            console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
            await sleep(500);
            await button2.click()
            await sleep(1000)
          }
          let notificationRequest: notificationManager.NotificationRequest = {
            id: getRandomNumber(1, 1000),
            notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
            content: {
              notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
              normal: {
                title: 'SOCIAL_COMMUNICATION',
                text: 'SUB_Notification_Ans_Reduce_alerts_0200',
              }
            }
          };
          try {
            await notificationManager.publish(notificationRequest).then(async () => {
              console.info(TEST_SUITE_NAME + TAG + ' publish success');
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
                  } else {
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
        }).catch((err: BusinessError) => {
          console.error(TEST_SUITE_NAME + TAG + `openNotificationSettings err: ${JSON.stringify(err.code)}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
          done()
        });
      } catch (err) {
        console.error(TEST_SUITE_NAME + TAG + `openNotificationSettings fail: ${JSON.stringify(err)}`);
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
            title: 'SOCIAL_COMMUNICATION',
            text: 'SUB_Notification_Ans_Reduce_alerts_0300',
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + ' publish success');
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
            title: 'SOCIAL_COMMUNICATION',
            text: 'SUB_Notification_Ans_Reduce_alerts_0400',
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + ' publish success');
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
              } else {
                expect().assertFail();
                done();
              }
            });
        }).catch((err: BusinessError) => {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
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
            title: 'SOCIAL_COMMUNICATION',
            text: 'SUB_Notification_Ans_Reduce_alerts_0500',
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + ' publish success');
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
            title: 'SERVICE_INFORMATION',
            text: 'SUB_Notification_Ans_Reduce_alerts_0600',
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + ' publish success');
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
            title: 'SERVICE_INFORMATION',
            text: 'SUB_Notification_Ans_Reduce_alerts_0700',
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + ' publish success');
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
            title: 'SERVICE_INFORMATION',
            text: 'SUB_Notification_Ans_Reduce_alerts_0800',
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + ' publish success');
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
            title: 'SERVICE_INFORMATION',
            text: 'SUB_Notification_Ans_Reduce_alerts_0900',
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + ' publish success');
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
            title: 'CUSTOMER_SERVICE',
            text: 'SUB_Notification_Ans_Reduce_alerts_1000',
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + ' publish success');
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
            title: 'CUSTOMER_SERVICE',
            text: 'SUB_Notification_Ans_Reduce_alerts_1100',
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + ' publish success');
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
            title: 'UNKNOWN_TYPE',
            text: 'SUB_Notification_Ans_Reduce_alerts_1200',
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + ' publish success');
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
            title: 'CONTENT_INFORMATION',
            text: 'SUB_Notification_Ans_Reduce_alerts_1300',
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + ' publish success');
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
            title: 'OTHER_TYPES',
            text: 'SUB_Notification_Ans_Reduce_alerts_1400',
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + ' publish success');
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
      let cmd = 'aa start -a TestAbility -b com.example.actsnotificationansreducealertstest';
      let user = abilityDelegatorRegistry.getArguments().parameters['-u'];
      if(user !== undefined){
        cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd)
      await sleep(3000)
      let context: common.UIAbilityContext = getContext(la) as common.UIAbilityContext;
      await notificationManager.openNotificationSettings(context).then(async () => {
        console.info(TEST_SUITE_NAME + TAG + `openNotificationSettings succeeded`);
        let driver: Driver = Driver.create();
        await sleep(1500)
        await driver.assertComponentExist(ON.text('通知管理'));
        // 半模态面板由 UIExtension 承载，无障碍节点树挂在宿主窗口下，
        // isAfter(文本) 的树序匹配可能选中其它行的 Toggle，故改为按空间位置匹配同一行的 Toggle。
        // 每次重试都重新定位，避免使用布局稳定前的过期矩形
        let findToggle: () => Promise<Component | null> = async (): Promise<Component | null> => {
          let toggle = await findToggleInSameRow(driver, '静默通知', TAG);
          if (toggle === null) {
            console.info(TEST_SUITE_NAME + TAG + ` spatial match failed, fallback to isAfter`);
            toggle = await findComponentWithRetry(driver,
              ON.type('Toggle').isAfter(ON.text('静默通知')), TAG);
          }
          return toggle;
        };
        let button = await findToggle();
        console.info(TEST_SUITE_NAME + TAG + `button is ${JSON.stringify(button)}`);
        if (button !== null) {
          await sleep(1000);
          // 按真实 bounds 点击并校验开关状态，覆盖不同设备上无障碍矩形与实际渲染的偏移
          let toggled: boolean = await clickToggleAndVerify(driver, findToggle, TAG + ' Toggle');
          console.info(TEST_SUITE_NAME + TAG + ` toggle applied: ${toggled}`);
          await sleep(800)
        }
        // 点击后校验面板仍在，若已消失说明点击落到了蒙层上
        let sheetStillOpen = await driver.findComponent(ON.text('通知管理'));
        console.info(TEST_SUITE_NAME + TAG + ` sheet still open: ${sheetStillOpen !== null}`);
        if (sheetStillOpen !== null) {
          await sleep(1000);
          let confirmed: boolean = await clickConfirmAndVerify(driver, TAG + ' Confirm');
          console.info(TEST_SUITE_NAME + TAG + ` confirm applied: ${confirmed}`);
          await sleep(500)
        } else {
          console.info(TEST_SUITE_NAME + TAG + ` sheet already closed, skip confirm`);
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
              title: 'SOCIAL_COMMUNICATION',
              text: 'SUB_Notification_Ans_Reduce_alerts_1500',
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(async () => {
            console.info(TEST_SUITE_NAME + TAG + ' publish success');
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
            title: 'SERVICE_INFORMATION',
            text: 'SUB_Notification_Ans_Reduce_alerts_1600',
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + ' publish success');
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
      await notificationManager.openNotificationSettings(context).then(async () => {
        console.info(TEST_SUITE_NAME + TAG + `openNotificationSettings succeeded`);
        let driver: Driver = Driver.create();
        await sleep(1500)
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
              title: 'SOCIAL_COMMUNICATION',
              text: 'SUB_Notification_Ans_Reduce_alerts_1700',
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(async () => {
            console.info(TEST_SUITE_NAME + TAG + ' publish success');
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
            title: 'SOCIAL_COMMUNICATION',
            text: 'SUB_Notification_Ans_Reduce_alerts_1800',
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + ' publish success');
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
            title: 'SOCIAL_COMMUNICATION',
            text: 'SUB_Notification_Ans_Reduce_alerts_1900',
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + ' publish success');
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
            title: 'SERVICE_INFORMATION',
            text: 'SUB_Notification_Ans_Reduce_alerts_2000',
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + ' publish success');
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
            title: 'SERVICE_INFORMATION',
            text: 'SUB_Notification_Ans_Reduce_alerts_2100',
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + ' publish success');
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
            title: 'SERVICE_INFORMATION',
            text: 'SUB_Notification_Ans_Reduce_alerts_2200',
          }
        }
      };
      try {
        await notificationManager.publish(notificationRequest).then(async () => {
          console.info(TEST_SUITE_NAME + TAG + ' publish success');
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