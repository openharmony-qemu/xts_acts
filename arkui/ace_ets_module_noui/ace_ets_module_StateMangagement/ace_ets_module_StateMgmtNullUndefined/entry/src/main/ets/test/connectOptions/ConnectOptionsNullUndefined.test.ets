/**
 * Copyright (c) 2026 Kaihong Digital Industry Development Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import { ConnectOptions, ConnectOptionsCollections, PersistenceV2 } from '@kit.ArkUI';
import { assertCallCompleted, assertUnexpectedError } from '../common/NullUndefinedAssertHelper';

@ObservedV2
class ConnectSample {
  @Trace id: number = 0;
}

@ObservedV2
class ConnectItem {
  @Trace name: string = 'item';
}

export default function connectOptionsNullUndefinedTest() {
  describe('ConnectOptionsNullUndefinedTest', () => {
    beforeEach(() => {
      console.info('[ConnectOptionsNullUndefinedTest] beforeEach');
    });
    afterEach(() => {
      console.info('[ConnectOptionsNullUndefinedTest] afterEach');
    });

    /**
     * @tc.number ConnectOptions_defaultCreator_undefined_001
     * @tc.name ConnectOptions_defaultCreator_undefined_001
     * @tc.desc Test ConnectOptions.defaultCreator with undefined; null compile-fail archived
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('ConnectOptions_defaultCreator_undefined_001', Level.LEVEL2, () => {
      console.info('[ConnectOptions_defaultCreator_undefined_001] START');
      try {
        const options: ConnectOptions<ConnectSample> = {
          type: ConnectSample,
          key: 'connect_options_undefined',
          defaultCreator: undefined
        };
        expect(options.defaultCreator).assertUndefined();
        assertCallCompleted();
      } catch (err) {
        console.error('[ConnectOptions_defaultCreator_undefined_001] Error: ' +
          JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[ConnectOptions_defaultCreator_undefined_001] END');
    });

    /**
     * @tc.number ConnectOptionsCollections_defaultCreator_undefined_001
     * @tc.name ConnectOptionsCollections_defaultCreator_undefined_001
     * @tc.desc Test ConnectOptionsCollections.defaultCreator with undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('ConnectOptionsCollections_defaultCreator_undefined_001', Level.LEVEL2, () => {
      console.info('[ConnectOptionsCollections_defaultCreator_undefined_001] START');
      try {
        const options: ConnectOptionsCollections<Array<ConnectItem>, ConnectItem> = {
          type: Array<ConnectItem>,
          key: 'connect_options_collections_creator_undefined',
          defaultCreator: undefined,
          defaultSubCreator: () => new ConnectItem()
        };
        expect(options.defaultCreator).assertUndefined();
        assertCallCompleted();
      } catch (err) {
        console.error('[ConnectOptionsCollections_defaultCreator_undefined_001] Error: ' +
          JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[ConnectOptionsCollections_defaultCreator_undefined_001] END');
    });

    /**
     * @tc.number ConnectOptionsCollections_defaultSubCreator_undefined_001
     * @tc.name ConnectOptionsCollections_defaultSubCreator_undefined_001
     * @tc.desc Test ConnectOptionsCollections.defaultSubCreator with undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('ConnectOptionsCollections_defaultSubCreator_undefined_001', Level.LEVEL2, () => {
      console.info('[ConnectOptionsCollections_defaultSubCreator_undefined_001] START');
      try {
        const options: ConnectOptionsCollections<Array<ConnectItem>, ConnectItem> = {
          type: Array<ConnectItem>,
          key: 'connect_options_collections_undefined',
          defaultCreator: () => new Array<ConnectItem>(),
          defaultSubCreator: undefined
        };
        expect(options.defaultSubCreator).assertUndefined();
        assertCallCompleted();
      } catch (err) {
        console.error('[ConnectOptionsCollections_defaultSubCreator_undefined_001] Error: ' +
          JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[ConnectOptionsCollections_defaultSubCreator_undefined_001] END');
    });

    /**
     * @tc.number PersistenceV2_globalConnect_defaultCreator_undefined_001
     * @tc.name PersistenceV2_globalConnect_defaultCreator_undefined_001
     * @tc.desc Test PersistenceV2.globalConnect with options.defaultCreator undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistenceV2_globalConnect_defaultCreator_undefined_001', Level.LEVEL2, () => {
      console.info('[PersistenceV2_globalConnect_defaultCreator_undefined_001] START');
      try {
        PersistenceV2.globalConnect<ConnectSample>({
          type: ConnectSample,
          key: 'persistence_default_creator_undefined_seed',
          defaultCreator: () => new ConnectSample()
        });
        PersistenceV2.globalConnect<ConnectSample>({
          type: ConnectSample,
          key: 'persistence_default_creator_undefined_seed',
          defaultCreator: undefined
        });
        assertCallCompleted();
      } catch (err) {
        console.error('[PersistenceV2_globalConnect_defaultCreator_undefined_001] Error: ' +
          JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[PersistenceV2_globalConnect_defaultCreator_undefined_001] END');
    });

    /**
     * @tc.number PersistenceV2_globalConnect_defaultSubCreator_undefined_001
     * @tc.name PersistenceV2_globalConnect_defaultSubCreator_undefined_001
     * @tc.desc Test PersistenceV2.globalConnect with options.defaultSubCreator undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('PersistenceV2_globalConnect_defaultSubCreator_undefined_001', Level.LEVEL2, () => {
      console.info('[PersistenceV2_globalConnect_defaultSubCreator_undefined_001] START');
      try {
        PersistenceV2.globalConnect<Array<ConnectItem>, ConnectItem>({
          type: Array<ConnectItem>,
          key: 'persistence_default_sub_creator_undefined',
          defaultCreator: () => new Array<ConnectItem>(),
          defaultSubCreator: undefined
        });
        assertCallCompleted();
      } catch (err) {
        console.error('[PersistenceV2_globalConnect_defaultSubCreator_undefined_001] Error: ' +
          JSON.stringify(err));
        assertUnexpectedError();
      }
      console.info('[PersistenceV2_globalConnect_defaultSubCreator_undefined_001] END');
    });
  });
}
