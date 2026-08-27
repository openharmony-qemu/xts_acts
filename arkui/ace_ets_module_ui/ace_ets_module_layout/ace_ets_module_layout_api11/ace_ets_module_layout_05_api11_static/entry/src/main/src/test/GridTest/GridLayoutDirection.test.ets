'use static';
/**
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
import { describe, beforeEach, afterEach, afterAll, it, expect,Level } from "../../../../hypium/index"
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import GlobalContext from '../../../ets/MainAbility/common/GlobalContext'
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import { GridDirection } from '@ohos.arkui.component'
import router from '@ohos.router';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function GridLayoutDirection() {
  describe('GridLayoutDirection', () => {

    beforeEach(async (): Promise<void> => {
      console.info("GridLayoutDirection beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridLayoutDirection',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get GridLayoutDirection state pages: " + JSON.stringify(pages));
        if (!("GridLayoutDirection" == pages.name)) {
          console.info("get GridLayoutDirection state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push GridLayoutDirection page error: " + err);
      }
    });

    
    
    

/**
     * @tc.number   GridLayoutDirection_static_001
     * @tc.name     GridLayoutDirection_static_001
     * @tc.desc     GridLayoutDirection_static_001
     * @tc.level    Level.LEVEL0
     */
it('GridLayoutDirection_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GridLayoutDirection_static_001] START');
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridLayoutDirectionTest await err: ' + JSON.stringify(err));
      }
      AppStorage.get<MessageManager<number | GridDirection>>('messageManager')?.notify({name:'layoutDirection', value: GridDirection.ColumnReverse });
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridLayoutDirectionTest await err: ' + JSON.stringify(err));
      }
      let GridItem00 = CommonFunc.getComponentRect('GridItem00');
      let GridItem01 = CommonFunc.getComponentRect('GridItem01');
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridLayoutDirectionTest await err: ' + JSON.stringify(err));
      }

	  expect(Math.abs(Math.round(GridItem00.top - GridItem01.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();

      console.info('[GridLayoutDirection_static_001] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridLayoutDirection_static_002
     * @tc.name     GridLayoutDirection_static_002
     * @tc.desc     GridLayoutDirection_static_002
     * @tc.level    Level.LEVEL0
     */
it('GridLayoutDirection_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GridLayoutDirection_static_002] START');
            try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('GridLayoutDirectionTest await err: ' + JSON.stringify(err));
      }
     AppStorage.get<MessageManager<number | GridDirection>>('messageManager')?.notify({name:'layoutDirection', value: GridDirection.Column });
            try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('GridLayoutDirectionTest await err: ' + JSON.stringify(err));
      }
      let GridItem00 = CommonFunc.getComponentRect('GridItem00');
      let GridItem01 = CommonFunc.getComponentRect('GridItem01');
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridLayoutDirectionTest await err: ' + JSON.stringify(err));
      }

	  expect(Math.abs(Math.round(GridItem01.top - GridItem00.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();

      console.info('[GridLayoutDirection_static_002] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridLayoutDirection_static_003
     * @tc.name     GridLayoutDirection_static_003
     * @tc.desc     GridLayoutDirection_static_003
     * @tc.level    Level.LEVEL0
     */
it('GridLayoutDirection_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GridLayoutDirection_static_003] START');
            try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('GridLayoutDirectionTest await err: ' + JSON.stringify(err));
      }
     AppStorage.get<MessageManager<number | GridDirection>>('messageManager')?.notify({name:'layoutDirection', value: GridDirection.RowReverse });
            try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('GridLayoutDirectionTest await err: ' + JSON.stringify(err));
      }
      let GridItem00 = CommonFunc.getComponentRect('GridItem00');
      let GridItem01 = CommonFunc.getComponentRect('GridItem01');
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridLayoutDirectionTest await err: ' + JSON.stringify(err));
      }

	  expect(Math.abs(Math.round(GridItem00.left - GridItem01.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();

      console.info('[GridLayoutDirection_static_003] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridLayoutDirection_static_004
     * @tc.name     GridLayoutDirection_static_004
     * @tc.desc     GridLayoutDirection_static_004
     * @tc.level    Level.LEVEL0
     */
it('GridLayoutDirection_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GridLayoutDirection_static_004] START');
            try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('GridLayoutDirectionTest await err: ' + JSON.stringify(err));
      }
     AppStorage.get<MessageManager<number | GridDirection>>('messageManager')?.notify({name:'layoutDirection', value: GridDirection.Row });
            try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('GridLayoutDirectionTest await err: ' + JSON.stringify(err));
      }
      let GridItem00 = CommonFunc.getComponentRect('GridItem00');
      let GridItem01 = CommonFunc.getComponentRect('GridItem01');
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridLayoutDirectionTest await err: ' + JSON.stringify(err));
      }

	  expect(Math.abs(Math.round(GridItem01.left - GridItem00.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();

      console.info('[GridLayoutDirection_static_004] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridLayoutDirection_static_005
     * @tc.name     GridLayoutDirection_static_005
     * @tc.desc     GridLayoutDirection_static_005
     * @tc.level    Level.LEVEL0
     */
it('GridLayoutDirection_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GridLayoutDirection_static_005] START');
            try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('GridLayoutDirectionTest await err: ' + JSON.stringify(err));
      }
      AppStorage.get<MessageManager<number | GridDirection>>('messageManager')?.notify({name:'gridPadding', value: 50 });
            try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('GridLayoutDirectionTest await err: ' + JSON.stringify(err));
      }
      let GridLayoutDirKey = CommonFunc.getComponentRect('GridLayoutDirKey');
      let GridItem00 = CommonFunc.getComponentRect('GridItem00');
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridLayoutDirectionTest await err: ' + JSON.stringify(err));
      }

      expect(Math.abs(Math.round(GridItem00.top - GridLayoutDirKey.top) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();

      console.info('[GridLayoutDirection_static_005] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridLayoutDirection_static_006
     * @tc.name     GridLayoutDirection_static_006
     * @tc.desc     GridLayoutDirection_static_006
     * @tc.level    Level.LEVEL0
     */
it('GridLayoutDirection_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GridLayoutDirection_static_006] START');
            try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('GridLayoutDirectionTest await err: ' + JSON.stringify(err));
      }
      AppStorage.get<MessageManager<number | GridDirection>>('messageManager')?.notify({name:'gridMargin', value: 50 });
            try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('GridLayoutDirectionTest await err: ' + JSON.stringify(err));
      }
      let GridLayoutDirKey = CommonFunc.getComponentRect('GridLayoutDirKey');
      let ColumnKey = CommonFunc.getComponentRect('ColumnKey');
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridLayoutDirectionTest await err: ' + JSON.stringify(err));
      }

      expect(Math.abs(Math.round(GridLayoutDirKey.top - ColumnKey.top) - Math.round(UIContext.resolveUIContext()!.vp2px(50))) <= 1).assertTrue();

      console.info('[GridLayoutDirection_static_006] END');
      done();
    });


  })
}
