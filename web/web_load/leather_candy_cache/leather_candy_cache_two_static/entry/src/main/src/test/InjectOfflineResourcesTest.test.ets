import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext: common.UIAbilityContext;

export default function InjectOfflineResourcesTest() {

  describe('injectOfflineResourcesTest', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log("App start")
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void => {
          testAbilityContext = abilitys.context
          console.log("onAbilityCreate end")
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.leathercandycachetwotest.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    beforeEach(async () => {
      await Utils.msSleep(500);
      console.info("injectOfflineResourcesTest beforeEach start");
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_INJECTOFFLINERESOURCES_STATIC_0100
    * @tc.name       : testInjectOfflineResourcesStatic001
    * @tc.desc       : test injectOfflineResources
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testInjectOfflineResourcesStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testInjectOfflineResources001", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testInjectOfflineResources001", true, 20001, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('injectOfflineResourcesTestButton', 10, '');
        await Utils.msSleep(500);
        done();
      })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_INJECTOFFLINERESOURCES_STATIC_0200
    * @tc.name       : testInjectOfflineResourcesStatic002
    * @tc.desc       : test injectOfflineResources
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testInjectOfflineResourcesStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testInjectOfflineResources002", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testInjectOfflineResources002", 401, 20002, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('injectOfflineResourcesTestButton', 10, '');
        await Utils.msSleep(500);
        done();
      })
    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_OFFLINERESOURCETYPE_STATIC_0100
    * @tc.name       : testOfflineResourceTypeStatic001
    * @tc.desc       : test OfflineResourceType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOfflineResourceTypeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testOfflineResourceType001", 10)
        await Utils.msSleep(2000);
        let num: int = 3
        Utils.registerEvent("testMODULE_JS", Type.of(num) + ' ' + num, 20003, done);
        num = 2
        Utils.registerEvent("testCLASSIC_JS", Type.of(num) + ' ' + num, 20004, done);
        num = 1
        Utils.registerEvent("testCSS", Type.of(num) + ' ' + num, 20005, done);
        num = 0
        Utils.registerEvent("testIMAGE", Type.of(num) + ' ' + num, 20006, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('injectOfflineResourcesTestButton', 10, '');
        await Utils.msSleep(500);
        done();
      })
  })
}