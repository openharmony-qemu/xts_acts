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

import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function GridItemNodeTest() {
  describe('GridItemNodeTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info('griditemNodeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GridItem/griditemNode',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info('get griditemNode state pages: ' + JSON.stringify(pages));
        if (!('griditemNode' == pages.name)) {
          console.info('get griditemNode pages.name: ' + JSON.stringify(pages.name));
          router.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push griditemNode page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('griditemNode beforeEach end');
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('griditemNode after each called');
    })


    
    /**
     * @tc.number   gridItemNode0100_static_01
     * @tc.name     gridItemNode0100_static_01
     * @tc.desc     gridItemNode0100_static_01
     * @tc.level    Level.LEVEL0
     */
it('gridItemNode0100_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {

      let tagName = 'gridItemNode0100_static_01';
      console.info('[' + tagName + '] START============================');
      let strJsonNew = inspector.getInspectorByKey('key_ gridItem_001');
      console.info('[' + tagName + '] Search is: ' +
      JSON.stringify(JSON.parseJsonElement(strJsonNew).getString('$type')));
      expect(JSON.parseJsonElement(strJsonNew).getString('$type')).assertEqual('GridItem');
      console.info('[' + tagName + '] END ===========================');
      done();
    });

  })
}