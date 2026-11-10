'use static';

import { hilog } from '@kit.PerformanceAnalysisKit';
import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '@ohos/hypium-static/src/main/indexStatic';
import { UIAbility, Want } from '@kit.AbilityKit';
import { abilityDelegatorRegistry, Driver, ON, MouseButton, MatchPattern, UiDirection, Rect } from '@kit.TestKit';
import inspector from '@ohos.arkui.inspector';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

import CommonFunc from '../common/Common';
import Utils from '../common/Utils';

let want: Want;
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function onDidStopFlingModifierTest() {
  describe('ActsOnDidStopFlingModifierTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info('TextLineSpacingTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_onDidStopFling',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get TextLineSpacingTest state pages: ' + JSON.stringify(pages));
        if (!('TextLineSpacing' == pages.name)) {
          console.info('get TextLineSpacingTest state pages.name: ' + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push TextLineSpacingTest page error: ' + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   test_onDidStopFling
     * @tc.name     test_onDidStopFling
     * @tc.desc     test_onDidStopFling
     * @tc.level    Level.LEVEL0
     */
    it('test_onDidStopFling', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(500);
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        let dragScroll = await driver.findComponent(ON.id('Grid_onDidStopFling_grid_dragging_fling'));
        const rect = await (dragScroll?.getBounds() as Promise<Rect>);
        let top = rect.top;
        let right = rect.right;
        let left = rect.left;
        let bottom = rect.bottom;
        let height = bottom - top;
        let width = right - left;
        let centerX = (Math.round(left + width / 2)).toInt();
        let startY = (Math.round(top + height * 0.8)).toInt();
        let endY = (Math.round(top + height * 0.2)).toInt();
        await driver.swipeBetween(
          { x: centerX, y: startY, displayId: AppStorage.get<number>('displayID')?.toInt() ?? 0 },
          { x: centerX, y: endY, displayId: AppStorage.get<number>('displayID')?.toInt() ?? 0 }
        );
        await CommonFunc.sleep(2000);
        expect(JSON.parseJsonElement(inspector.getInspectorByKey('Grid_onDidStopFling_onDidStopFling'))
            .getElement('$attrs')
            .getString('content'))
            .assertEqual('第1次Fling停止');
        done();
      } catch (error) {
        console.error('[test_onDidStopFling] error:' + error);
        expect().assertFail();
        done();
      }
    })
  })
}