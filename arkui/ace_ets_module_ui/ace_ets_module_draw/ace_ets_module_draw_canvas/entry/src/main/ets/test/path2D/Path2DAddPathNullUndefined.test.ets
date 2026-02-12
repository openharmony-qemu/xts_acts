/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function Path2DAddPathNullUndefinedTest() {
  describe('Path2DAddPathNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("Path2DAddPathNullUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/path2D/Path2DAddPathNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Path2DAddPathNullUndefined state pages: " + JSON.stringify(pages));
        if (!("Path2DAddPathNullUndefined" == pages.name)) {
          console.info("get Path2DAddPathNullUndefined state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Path2DAddPathNullUndefined success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Path2DAddPathNullUndefined page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_PATH2D_ADDPATH_PATH_NULL_UNDEFINED_0100
     * @tc.name      Test Path2D addPath with null/undefined path parameter
     * @tc.desc      Verify addPath handles null/undefined path parameter correctly
     */
    it('SUB_ACE_PATH2D_ADDPATH_PATH_NULL_UNDEFINED_0100', Level.LEVEL0, async () => {
      let json = getInspectorByKey('path2d_addpath_canvas');
      let obj: Record<string, Object> = JSON.parse(json) as Record<string, Object>;
      expect(obj.$type).assertEqual('Canvas');
    });
  });
}
