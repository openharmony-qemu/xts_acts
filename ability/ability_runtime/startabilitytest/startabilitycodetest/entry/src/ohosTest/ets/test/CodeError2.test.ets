import { describe, it, expect, beforeAll, Level } from '@ohos/hypium-dynamic';
import { BusinessError, commonEventManager, systemParameterEnhance } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import { Driver, MatchPattern, ON } from '@kit.TestKit';


async function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, time)
  });
}

let context: common.UIAbilityContext;
let mpEnable: string
let isServiceEnable: string
export default function codeError2() {
  describe('codeErrorTest2', () => {
    beforeAll(async () => {
      context = AppStorage.get<common.UIAbilityContext>("testAbilityContext") as common.UIAbilityContext;
      mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
      try {
        console.info('codeError2 beforeAll mpEnable')
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
      }catch (e) {
        console.error('codeError2 beforeAll mpEnable')
        mpEnable = 'fail'
      }
      try {
        console.info('codeError2 beforeAll isServiceEnable')
        isServiceEnable = systemParameterEnhance.getSync('const.abilityms.enable_uiservice');
      }catch (e) {
        console.error('codeError2 beforeAll isServiceEnable')
        isServiceEnable = 'fail'
      }

    })
    /**
     * @tc.name   UIExtension_startUIServiceExtensionAbility_801
     * @tc.number UIExtension_startUIServiceExtensionAbility_801
     * @tc.desc   UIExtension_startUIServiceExtensionAbility_801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UIExtension_startUIServiceExtensionAbility_801', Level.LEVEL0, (done: Function) => {
      let tag = 'UIExtension_startUIServiceExtensionAbility_801';
      console.info(`${tag}-is begin`)
      if(mpEnable != 'true' || isServiceEnable != 'false'){
        done()
        return
      }

      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [tag]
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          context.startAbility({
            bundleName: 'com.example.myapplication1',
            abilityName: 'EntryAbility'
          }, (err) => {
            if (err) {
              console.error(`${tag}-error: `, JSON.stringify(err))
            }
          })
          await sleep(3000)
          try {
            let driver = Driver.create();
            let allowed = await driver.waitForComponent(ON.text('想要打开', MatchPattern.CONTAINS), 1000)
            console.log(`${tag}-is need to click ` + JSON.stringify(allowed));
            if (allowed) {
              let buttons = await driver.findComponents(ON.id('advanced_dialog_button_1'))
              console.info(`${tag}-find advanced_dialog_button_1 count=${buttons ? buttons.length : 0}`)
              if (buttons && buttons.length > 0) {
                await buttons[buttons.length - 1].click()
                console.info(`${tag}-click advanced_dialog_button_1 success`)
              } else {
                console.warn(`${tag}-弹窗按钮 advanced_dialog_button_1 未找到，无法点中授权弹窗`)
              }
              await sleep(2000)
            } else {
              console.warn(`${tag}-未发现授权弹窗(想要打开)，可能弹窗未弹出或未找到`)
            }
            let button = await driver.findComponent(ON.text('startUIServiceExtensionAbility 801'));
            if (button) {
              await button.click()
              console.info(`${tag}-click target button startUIServiceExtensionAbility 801 success`)
            } else {
              console.warn(`${tag}-目标按钮 startUIServiceExtensionAbility 801 未找到，无法点击触发用例`)
            }
          } catch (e) {
            console.error(`${tag}-driver error`, JSON.stringify(e))
            console.error(`${tag}-driver error detail`, (e as Error)?.message)
          }
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.code}`);
        try {
          expect(data.code).assertEqual(801)
        } catch (e) {
          console.error(`${tag}-UIExtensionContext-except error`, JSON.stringify(e))
        }
        commonEventManager.unsubscribe(subscriber);
        done()
      };
    })

    /**
     * @tc.name   UIExtension_startUIServiceExtensionAbility_16000001
     * @tc.number UIExtension_startUIServiceExtensionAbility_16000001
     * @tc.desc   UIExtension_startUIServiceExtensionAbility_16000001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UIExtension_startUIServiceExtensionAbility_16000001', Level.LEVEL0, (done: Function) => {
      let tag = 'UIExtension_startUIServiceExtensionAbility_16000001';
      console.info(`${tag}-is begin`)
      if(mpEnable != 'true' || isServiceEnable !='true'){
        done()
        return
      }

      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [tag]
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          context.startAbility({
            bundleName: 'com.example.myapplication1',
            abilityName: 'EntryAbility'
          }, (err) => {
            if (err) {
              console.error(`${tag}-error: `, JSON.stringify(err))
            }
          })
          await sleep(2000)
          try {
            let driver = Driver.create();
            let allowed = await driver.waitForComponent(ON.text('想要打开', MatchPattern.CONTAINS), 1000)
            console.log(`${tag}-is need to click ` + JSON.stringify(allowed));
            if (allowed) {
              let buttons = await driver.findComponents(ON.id('advanced_dialog_button_1'))
              console.info(`${tag}-find advanced_dialog_button_1 count=${buttons ? buttons.length : 0}`)
              if (buttons && buttons.length > 0) {
                await buttons[buttons.length - 1].click()
                console.info(`${tag}-click advanced_dialog_button_1 success`)
              } else {
                console.warn(`${tag}-弹窗按钮 advanced_dialog_button_1 未找到，无法点中授权弹窗`)
              }
            } else {
              console.warn(`${tag}-未发现授权弹窗(想要打开)，可能弹窗未弹出或未找到`)
            }
            await sleep(2000)
            let button = await driver.findComponent(ON.text('startUIServiceExtensionAbility 16000001'));
            if (button) {
              await button.click()
              console.info(`${tag}-click target button startUIServiceExtensionAbility 16000001 success`)
            } else {
              console.warn(`${tag}-目标按钮 startUIServiceExtensionAbility 16000001 未找到，无法点击触发用例`)
            }
          } catch (e) {
            console.error(`${tag}-driver error`, JSON.stringify(e))
            console.error(`${tag}-driver error detail`, (e as Error)?.message)
          }
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.code}`);

        try {
          expect(data.code).assertEqual(16000001)
        } catch (e) {
          console.error(`${tag}-UIExtensionContext-except error`, JSON.stringify(e))
        }
        commonEventManager.unsubscribe(subscriber);
        done()
      };
    })

    /**
     * @tc.name   UIExtension_startUIServiceExtensionAbility_16000002
     * @tc.number UIExtension_startUIServiceExtensionAbility_16000002
     * @tc.desc   UIExtension_startUIServiceExtensionAbility_16000002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UIExtension_startUIServiceExtensionAbility_16000002', Level.LEVEL0, (done: Function) => {
      let tag = 'UIExtension_startUIServiceExtensionAbility_16000002';
      console.info(`${tag}-is begin`)
      if(mpEnable != 'true' || isServiceEnable !='true'){
        done()
        return
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [tag]
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          context.startAbility({
            bundleName: 'com.example.myapplication1',
            abilityName: 'EntryAbility'
          }, (err) => {
            if (err) {
              console.error(`${tag}-error: `, JSON.stringify(err))
            }
          })
          await sleep(3000)
          try {
            let driver = Driver.create();
            let allowed = await driver.waitForComponent(ON.text('想要打开', MatchPattern.CONTAINS), 1000)
            console.log(`${tag}-is need to click ` + JSON.stringify(allowed));
            if (allowed) {
              let buttons = await driver.findComponents(ON.id('advanced_dialog_button_1'))
              console.info(`${tag}-find advanced_dialog_button_1 count=${buttons ? buttons.length : 0}`)
              if (buttons && buttons.length > 0) {
                await buttons[buttons.length - 1].click()
                console.info(`${tag}-click advanced_dialog_button_1 success`)
              } else {
                console.warn(`${tag}-弹窗按钮 advanced_dialog_button_1 未找到，无法点中授权弹窗`)
              }
              await sleep(2000)
            } else {
              console.warn(`${tag}-未发现授权弹窗(想要打开)，可能弹窗未弹出或未找到`)
            }
            let button = await driver.findComponent(ON.text('startUIServiceExtensionAbility 16000002'));
            if (button) {
              await button.click()
              console.info(`${tag}-click target button startUIServiceExtensionAbility 16000002 success`)
            } else {
              console.warn(`${tag}-目标按钮 startUIServiceExtensionAbility 16000002 未找到，无法点击触发用例`)
            }
          } catch (e) {
            console.error(`${tag}-driver error`, JSON.stringify(e))
            console.error(`${tag}-driver error detail`, (e as Error)?.message)
          }
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.code}`);
        try {
          expect(data.code).assertEqual(16000002)
        } catch (e) {
          console.error(`${tag}-UIExtensionContext-except error`, JSON.stringify(e))
        }
        commonEventManager.unsubscribe(subscriber);
        done()
      };
    })

    /**
     * @tc.name   UIExtension_connectUIServiceExtensionAbility_16000001
     * @tc.number UIExtension_connectUIServiceExtensionAbility_16000001
     * @tc.desc   UIExtension_connectUIServiceExtensionAbility_16000001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UIExtension_connectUIServiceExtensionAbility_16000001', Level.LEVEL0, (done: Function) => {
      let tag = 'UIExtension_connectUIServiceExtensionAbility_16000001';
      console.info(`${tag}-is begin`)
      if(mpEnable != 'true' || isServiceEnable !='true'){
        done()
        return
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [tag]
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          context.startAbility({
            bundleName: 'com.example.myapplication1',
            abilityName: 'EntryAbility'
          }, (err) => {
            if (err) {
              console.error(`${tag}-error: `, JSON.stringify(err))
            }
          })
          await sleep(3000)
          try {
            let driver = Driver.create();
            let allowed = await driver.waitForComponent(ON.text('想要打开', MatchPattern.CONTAINS), 1000)
            console.log(`${tag}-is need to click ` + JSON.stringify(allowed));
            if (allowed) {
              let buttons = await driver.findComponents(ON.id('advanced_dialog_button_1'))
              console.info(`${tag}-find advanced_dialog_button_1 count=${buttons ? buttons.length : 0}`)
              if (buttons && buttons.length > 0) {
                await buttons[buttons.length - 1].click()
                console.info(`${tag}-click advanced_dialog_button_1 success`)
              } else {
                console.warn(`${tag}-弹窗按钮 advanced_dialog_button_1 未找到，无法点中授权弹窗`)
              }
              await sleep(2000)
            } else {
              console.warn(`${tag}-未发现授权弹窗(想要打开)，可能弹窗未弹出或未找到`)
            }
            let button = await driver.findComponent(ON.text('connectUIServiceExtensionAbility 16000001'));
            if (button) {
              await button.click()
              console.info(`${tag}-click target button connectUIServiceExtensionAbility 16000001 success`)
            } else {
              console.warn(`${tag}-目标按钮 connectUIServiceExtensionAbility 16000001 未找到，无法点击触发用例`)
            }
          } catch (e) {
            console.error(`${tag}-driver error`, JSON.stringify(e))
            console.error(`${tag}-driver error detail`, (e as Error)?.message)
          }
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
        });
      let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.code}`);
        try {
          expect(data.code).assertEqual(16000001)
        } catch (e) {
          console.error(`${tag}-UIExtensionContext-except error`, JSON.stringify(e))
        }
        commonEventManager.unsubscribe(subscriber);
        done()
      };
    })

    /**
     * @tc.name   UIExtension_connectServiceExtensionAbility_16000002
     * @tc.number UIExtension_connectServiceExtensionAbility_16000002
     * @tc.desc   UIExtension_connectServiceExtensionAbility_16000002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UIExtension_connectServiceExtensionAbility_16000002', Level.LEVEL0, (done: Function) => {
      let tag = 'UIExtension_connectUIServiceExtensionAbility_16000002';
      console.info(`${tag}-is begin`)
      if(mpEnable != 'true' || isServiceEnable !='true'){
        done()
        return
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [tag]
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          context.startAbility({
            bundleName: 'com.example.myapplication1',
            abilityName: 'EntryAbility'
          }, (err) => {
            if (err) {
              console.error(`${tag}-error: `, JSON.stringify(err))
            }
          })
          await sleep(3000)
          try {
            let driver = Driver.create();
            let allowed = await driver.waitForComponent(ON.text('想要打开', MatchPattern.CONTAINS), 1000)
            console.log(`${tag}-is need to click ` + JSON.stringify(allowed));
            if (allowed) {
              let buttons = await driver.findComponents(ON.id('advanced_dialog_button_1'))
              console.info(`${tag}-find advanced_dialog_button_1 count=${buttons ? buttons.length : 0}`)
              if (buttons && buttons.length > 0) {
                await buttons[buttons.length - 1].click()
                console.info(`${tag}-click advanced_dialog_button_1 success`)
              } else {
                console.warn(`${tag}-弹窗按钮 advanced_dialog_button_1 未找到，无法点中授权弹窗`)
              }
              await sleep(2000)
            } else {
              console.warn(`${tag}-未发现授权弹窗(想要打开)，可能弹窗未弹出或未找到`)
            }
            let button = await driver.findComponent(ON.text('connectServiceExtensionAbility 16000002'));
            if (button) {
              await button.click()
              console.info(`${tag}-click target button connectServiceExtensionAbility 16000002 success`)
            } else {
              console.warn(`${tag}-目标按钮 connectServiceExtensionAbility 16000002 未找到，无法点击触发用例`)
            }
          } catch (e) {
            console.error(`${tag}-driver error`, JSON.stringify(e))
            console.error(`${tag}-driver error detail`, (e as Error)?.message)
          }
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
        });
      let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.code}`);
        try {
          expect(data.code).assertEqual(16000002)
        } catch (e) {
          console.error(`${tag}-UIExtensionContext-except error`, JSON.stringify(e))
        }
        commonEventManager.unsubscribe(subscriber);
        done()
      };
    })

  })
}