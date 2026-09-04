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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function PersistentStoragePersistProps() {
  describe('PersistentStoragePersistProps', () => {
    beforeEach(async (done: Function) => {
      console.info("PersistentStoragePersistProps beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/persistentStorage/PersistentStoragePersistProps",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get PersistentStoragePersistProps state pages: " + JSON.stringify(pages));
        if (!("PersistentStoragePersistProps" == pages.name)) {
          console.info("get PersistentStoragePersistProps pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push PersistentStoragePersistProps page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PersistentStoragePersistProps page error: " + err);
      }
      console.info("PersistentStoragePersistProps beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("PersistentStoragePersistProps afterEach called");
    });

    /**
     * @tc.name   PersistentStoragePersistProps_0100
     * @tc.number SUB_ARKUI_PERSISTENTSTORAGE_PERSISTPROPS_PARAM_0100
     * @tc.desc   Test PersistProps with empty array parameter, verify no keys added and no crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PersistentStoragePersistProps_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[PersistentStoragePersistProps_0100] START');
      await CommonFunc.sleep(1000);
      let keysBefore: Array<string> = PersistentStorage.keys();
      console.info("[PersistentStoragePersistProps_0100] keysBefore: " + JSON.stringify(keysBefore));

      PersistentStorage.PersistProps([]);

      let keysAfter: Array<string> = PersistentStorage.keys();
      console.info("[PersistentStoragePersistProps_0100] keysAfter: " + JSON.stringify(keysAfter));
      expect(keysAfter.length).assertEqual(keysBefore.length);

      console.info('[PersistentStoragePersistProps_0100] END');
      done();
    });

  })
}
