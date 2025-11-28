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
      let count : number =0
        try{
          const ability: UIAbility = await delegator.getCurrentTopAbility();
          let context :common.UIAbilityContext= ability.context;
          await notificationExtensionSubscription.openSubscriptionSettings(context).then(async ()=>{
            console.info(TAG+"openSubscriptionSettings success ");
            count++
            await sleep(1000)
            expect(count).assertEqual(1)           
            done();
          }).catch((err: Base.BusinessError) => {
            console.error(TAG+"openSubscriptionSettings: " + JSON.stringify(err));
            expect().assertFail();
            done();
          });
        }catch(error){
          hilog.info(0x000, `${TAG}`, TAG+ "openSubscriptionSettings catch: " + JSON.stringify(error));
          hilog.info(0x000, `${TAG}`,  TAG+ ' test case end');
          expect().assertFail();
          done();
        }
      })

  })
}

function sleep(ms: number) {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}
