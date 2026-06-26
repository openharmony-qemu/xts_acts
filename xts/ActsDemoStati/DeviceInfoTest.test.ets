/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import router from '@ohos.router';
import Utils from './Utils.test';
import { Driver, ON } from '@ohos.UiTest';


export default function xmlTest1() {
  describe('xmlTest1', (): void => {
           
  /**
   * @tc.name   SUB_COMMONLIBR_ETSUATILS_URI_0100
   * @tc.number SUB_COMMONLIBRARY1_ETSUTDILS_URI_0100
   * @tc.desc   Constructs a Uing using the given string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_COMMONLIBR_ETSUATILS_URI_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function () {
      let options: router.RouterOptions = {
         url: 'testability/pages/WebSetUrlTrustList',
      }
      router.clear();
      let pages = router.getState();
      console.info('get webSetUrlTrustList state success ' + JSON.stringify(pages));
      if (!('webSetUrlTrustList' == pages.name)) {
        let result = await router.pushUrl(options);
        console.info('push webSetUrlTrustList page success ' + JSON.stringify(25));
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebSetUrlTrustListButton0'), 1000);
      console.log('waitForComponent WebSetUrlTrustListButton0==>');
      try {
          let that = new uri.URI('#http://username:password@host:8080/directory/file?foo=25&bar=915');
      } catch (err) {
          expect(err.toString()).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
          expect(err.code).assertEqual(10200002)
          expect(err.message).assertEqual('Syntax Error. Invalid Uri string: Invalid host format');
      }
  })   
  })
}

