import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { notificationExtensionSubscription, notificationManager } from '@kit.NotificationKit';
import { abilityAccessCtrl, UIAbility } from '@kit.AbilityKit';
import { common } from '@kit.AbilityKit';
import Base, { BusinessError } from '@ohos.base';
import { abilityDelegatorRegistry } from '@kit.TestKit';
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
let commonTag: string = "OpenSubscriptionSettings"
let bundleName:string = "com.example.actsNotificationAnsThreePartyWatchThirdParty"
export default function actsNotificationAnsThreePartyOpenSubscriptionSettingsTest() {
  let uiAbilityContext: common.UIAbilityContext | undefined =
    AppStorage.get<common.UIAbilityContext>('uiAbilityContext');
  describe('actsNotificationAnsThreePartyOpenSubscriptionSettingsTest', () => {
    beforeAll(() => {
      let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      try {
        atManager.requestPermissionsFromUser(uiAbilityContext, ['ohos.permission.ACCESS_BLUETOOTH'],
          (err, data) => {
          });
      } catch (err) {
      }
    })
    /**
      * @tc.number    Sub_Notification_Ans_ThreePartyWatch_1005
      * @tc.name      Sub_Notification_Ans_ThreePartyWatch_1005
      * @tc.desc      【openSubscriptionSeetings】参数正确，正常拉起半模态弹窗
      * @tc.size      LargeTest
      * @tc.type      Function
      * @tc.level     Level 0
    */
    it('Sub_Notification_Ans_ThreePartyWatch_1005', Level.LEVEL0, async (done: Function) => {
      let TAG = commonTag + "Sub_Notification_Ans_ThreePartyWatch_1005 ";
      let count : number = 0
        try {
        console.info(TAG + "Open popup");
        await notificationExtensionSubscription.openSubscriptionSettings(
          (await delegator.getCurrentTopAbility()).context
        );
        count++;
        console.info(TAG + "Wait for popup to load");
        await sleep(100);
        const driver = Driver.create();
        console.info(TAG + 'Find "确定" button');
        const button = await driver.findComponent(ON.text('确定'));
        if (button !== null) {
          console.info(TAG + "Button found, ready to click");
          await button.click();
          console.info(TAG + "Button click successful");
        } else {
          console.info(TAG + "Button not found, skip clicking");
        }
        await sleep(500);
        expect(count == 1).assertTrue();
        console.info(TAG + "Test passed");
        done();
      } catch (error) {
        console.error(TAG + "Error: " + error.message);
        if(err.code == 201){
          expect(err.code).assertEqual(201);
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
      })

    /**
      * @tc.number    Sub_Notification_Ans_ThreePartyWatch_1023
      * @tc.name      Sub_Notification_Ans_ThreePartyWatch_1023
      * @tc.desc      【isUserGranted】获取用户授权状态
      * @tc.size      LargeTest
      * @tc.type      功能测试
      * @tc.level     Level 1
     */
    it('Sub_Notification_Ans_ThreePartyWatch_1023', Level.LEVEL1, async (done: Function) => {
      const TAG = commonTag + "Sub_Notification_Ans_ThreePartyWatch_1005 ";
      let driver: Driver | null = null;
      try {
        console.info(TAG + "【isUserGranted】");
        const Granted = await notificationExtensionSubscription.isUserGranted();
        console.info(TAG + "Granted is---------" + Granted);
        expect(Granted).assertFalse();
        await notificationExtensionSubscription.openSubscriptionSettings(
          (await delegator.getCurrentTopAbility()).context
        );
        console.info(TAG + "Wait for popup to load");
        await sleep(100);
        driver = Driver.create();
        // 1. 点击开关按钮
        console.info(TAG + 'Find "允许获取本机通知开关" button');
        const switchButton = await driver.findComponent(ON.id('GrantSwitchView_Toggle_appSwitch'));
        if (switchButton !== null) {
          console.info(TAG + "Switch button found, ready to click");
          await switchButton.click();
          console.info(TAG + "Switch button click successful");
          await sleep(500); // 等待操作响应
        } else {
          console.info(TAG + "Switch button not found");
          throw new Error("Switch button not found");
        }
        // 2. 点击允许按钮
        await sleep(100);
        console.info(TAG + 'Find "允许" button');
        await driver.assertComponentExist(ON.text('允许'));
        const allowButton = await driver.findComponent(ON.text('允许'));
        if (allowButton !== null) {
          console.info(TAG + '"允许" button found, ready to click');
          await allowButton.click();
          console.info(TAG + '"允许" button click successful');
          await sleep(500);
        } else {
          console.error(TAG + '"允许" button not found');
          throw new Error('"允许" button not found');
        }
        // 3. 点击确定按钮
        await sleep(100);
        console.info(TAG + 'Find "确定" button');
        await driver.assertComponentExist(ON.text('确定'));
        const confirmButton = await driver.findComponent(ON.text('确定'));
        if (confirmButton !== null) {
          console.info(TAG + '"确定" button found, ready to click');
          await confirmButton.click();
          console.info(TAG + '"确定" button click successful');
          await sleep(500);
        } else {
          console.error(TAG + '"确定" button not found');
          throw new Error('"确定" button not found');
        }
        // 4. 验证授权状态
        await sleep(100);
        console.info(TAG + "【isUserGranted】");
        const Granted2 = await notificationExtensionSubscription.isUserGranted();
        console.info(TAG + "Granted is---------" + Granted2);
        expect(Granted2).assertTrue();
        console.info(TAG + "Test passed");
        done();
      } catch (error) {
        console.error(TAG + "Error: " + error.message);
        console.error(TAG + "Test failed");
        if(err.code == 201){
          expect(err.code).assertEqual(201);
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
    });
    /**
      * @tc.number    Sub_Notification_Ans_ThreePartyWatch_1001
      * @tc.name      Sub_Notification_Ans_ThreePartyWatch_1001
      * @tc.desc      【openSubscriptionSeetings】已经拉起了通知弹窗，再次请求接口，报错1600018
      * @tc.size      大型测试
      * @tc.type      功能测试
      * @tc.level     Level 2
      */
    it('Sub_Notification_Ans_ThreePartyWatch_1001', Level.LEVEL2, async (done: Function) => {
      let TAG = commonTag + "Sub_Notification_Ans_ThreePartyWatch_1001 ";

      try {
        const ability: UIAbility = await delegator.getCurrentTopAbility();
        let context: common.UIAbilityContext = ability.context;
        // 步骤2：验证第一次调用应该成功
        await notificationExtensionSubscription.openSubscriptionSettings(context)
          .then(async () => {
            hilog.info(0x000, TAG, 'First call succeeded, window opened');
            // 步骤3：立即再次调用
            await notificationExtensionSubscription.openSubscriptionSettings(context)
              .then(() => {
                hilog.error(0x000, TAG, 'Second call should fail but succeeded');
                expect().assertFail();
                done();
              })
              .catch(async (err: Base.BusinessError) => {
                expect(err.code).assertEqual(1600018);
                hilog.info(0x000, TAG, 'Got expected error: ' + err.code);
                await sleep(100);
                const driver = Driver.create();
                console.info(TAG + 'Find "确定" button');
                const button = await driver.findComponent(ON.text('确定'));
                if (button !== null) {
                  console.info(TAG + "Button found, ready to click");
                  await button.click();
                  console.info(TAG + "Button click successful");
                } else {
                  console.info(TAG + "Button not found, skip clicking");
                }
                await sleep(500);

                done();
              });
          })
          .catch((firstError: Base.BusinessError) => {
            hilog.info(0x000, TAG, `First call failed ${firstError}`);
            if(err.code == 201){
              expect(err.code).assertEqual(201);
              done()
            } else {
              expect().assertFail();
              done();
            }
          });
      } catch (error) {
        hilog.error(0x000, TAG, 'Test case error: ' + JSON.stringify(error));
        done();
      }
    });
  })
}

function sleep(ms: number) {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}
function log(arg0: string) {
  throw new Error('Function not implemented.');
}

function succeed(arg0: string) {
  throw new Error('Function not implemented.');
}

function exit(arg0: string) {
  throw new Error('Function not implemented.');
}