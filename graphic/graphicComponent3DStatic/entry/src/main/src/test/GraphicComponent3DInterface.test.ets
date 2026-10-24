'use static';
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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level, Size, TestType } from '../../../hypium/index';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import { $rawfile, Resource } from '@ohos.arkui.component'

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function GraphicComponent3DInterface() {

  describe("graphicComponent3DInterface", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(async (): Promise<void> => {
      console.info('www data component3D beforeAll start');
      await UtilsTest.startAbility('com.example.component3d.static', 'EntryAbility');
    });

    beforeEach(async(): Promise<void> => {
      console.info("www data component3D beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Index2',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("www data get component3D index state pages: " + JSON.stringify(pages));
        if (pages.name !== 'Index2') {
          console.info("www data get component3D index state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await UtilsTest.msSleep(2000);
          console.info("www data push component3D index success ");
        }
      } catch (err) {
        console.error("www data push component3D index page error: " + err);
        expect().assertFail();
      }
    });

    afterAll(async(): Promise<void> => {
      AppStorage.delete('SearchAllowCutResult')
      AppStorage.delete('SearchBlockCutResult')
    })

    /**
     * @tc.name   testComponentStatic_0100
     * @tc.number SUB_GRAPHIC_testComponent_static_0100
     * @tc.desc   test component3D
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testComponentStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = "====www data testComponentStatic_0100===="
        console.info(msgStr + ' begin ');
        try {
          await UtilsTest.msSleep(2000);
          let nodeRaw = inspector.getInspectorByKey('id333');
          console.info('www data xComponent3D inspector length ', nodeRaw.length);
          expect(nodeRaw.length > 0).assertEqual(true);
          console.info('www data xComponent3D success END');
          done()
        } catch (err) {
          console.log(msgStr + " Failed in component3D " + JSON.stringify(err))
          expect().assertFail()
          done()
        }
      })

  })
}