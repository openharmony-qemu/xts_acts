/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic'
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';

export default function firstDayOfWeekTest() {
  describe('FirstDayOfWeekTest', () => {
    beforeEach(async (done: Function) => {
      console.info('FirstDayOfWeekTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/calendarPicker/firstDayOfWeek',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get FirstDayOfWeekTest state pages:' + JSON.stringify(pages));
        if (!('firstDayOfWeek' == pages.name)) {
          console.info('get FirstDayOfWeekTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push FirstDayOfWeekTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push FirstDayOfWeekTest page error:' + err);
      }
      console.info('FirstDayOfWeekTest beforeEach end');
      done();
    });

    /**
     * @tc.name   FirstDayOfWeekTest_001
     * @tc.number FirstDayOfWeekTest_001
     * @tc.desc   Test firstDayOfWeek property with CalendarFirstDayOfWeek.LOCAL test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FirstDayOfWeekTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[FirstDayOfWeekTest_001] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('firstDayOfWeek001');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[FirstDayOfWeekTest_001] firstDayOfWeek:' + obj.$attrs.firstDayOfWeek);
      expect(obj.$attrs.firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.LOCAL');
      console.info('[FirstDayOfWeekTest_001] END');
      done();
    });

    /**
     * @tc.name   FirstDayOfWeekTest_002
     * @tc.number FirstDayOfWeekTest_002
     * @tc.desc   Test firstDayOfWeek property with CalendarFirstDayOfWeek.MON test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FirstDayOfWeekTest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[FirstDayOfWeekTest_002] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('firstDayOfWeek002');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[FirstDayOfWeekTest_002] firstDayOfWeek:' + obj.$attrs.firstDayOfWeek);
      expect(obj.$attrs.firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.MON');
      console.info('[FirstDayOfWeekTest_002] END');
      done();
    });

    /**
     * @tc.name   FirstDayOfWeekTest_003
     * @tc.number FirstDayOfWeekTest_003
     * @tc.desc   Test firstDayOfWeek property with CalendarFirstDayOfWeek.TUE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FirstDayOfWeekTest_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[FirstDayOfWeekTest_003] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('firstDayOfWeek003');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[FirstDayOfWeekTest_003] firstDayOfWeek:' + obj.$attrs.firstDayOfWeek);
      expect(obj.$attrs.firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.TUE');
      console.info('[FirstDayOfWeekTest_003] END');
      done();
    });

    /**
     * @tc.name   FirstDayOfWeekTest_004
     * @tc.number FirstDayOfWeekTest_004
     * @tc.desc   Test firstDayOfWeek property with CalendarFirstDayOfWeek.WED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FirstDayOfWeekTest_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[FirstDayOfWeekTest_004] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('firstDayOfWeek004');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[FirstDayOfWeekTest_004] firstDayOfWeek:' + obj.$attrs.firstDayOfWeek);
      expect(obj.$attrs.firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.WED');
      console.info('[FirstDayOfWeekTest_004] END');
      done();
    });

    /**
     * @tc.name   FirstDayOfWeekTest_005
     * @tc.number FirstDayOfWeekTest_005
     * @tc.desc   Test firstDayOfWeek property with CalendarFirstDayOfWeek.THU test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FirstDayOfWeekTest_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[FirstDayOfWeekTest_005] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('firstDayOfWeek005');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[FirstDayOfWeekTest_005] firstDayOfWeek:' + obj.$attrs.firstDayOfWeek);
      expect(obj.$attrs.firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.THU');
      console.info('[FirstDayOfWeekTest_005] END');
      done();
    });

    /**
     * @tc.name   FirstDayOfWeekTest_006
     * @tc.number FirstDayOfWeekTest_006
     * @tc.desc   Test firstDayOfWeek property with CalendarFirstDayOfWeek.FRI test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FirstDayOfWeekTest_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[FirstDayOfWeekTest_006] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('firstDayOfWeek006');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[FirstDayOfWeekTest_006] firstDayOfWeek:' + obj.$attrs.firstDayOfWeek);
      expect(obj.$attrs.firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.FRI');
      console.info('[FirstDayOfWeekTest_006] END');
      done();
    });

    /**
     * @tc.name   FirstDayOfWeekTest_007
     * @tc.number FirstDayOfWeekTest_007
     * @tc.desc   Test firstDayOfWeek property with CalendarFirstDayOfWeek.SAT test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FirstDayOfWeekTest_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[FirstDayOfWeekTest_007] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('firstDayOfWeek007');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[FirstDayOfWeekTest_007] firstDayOfWeek:' + obj.$attrs.firstDayOfWeek);
      expect(obj.$attrs.firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.SAT');
      console.info('[FirstDayOfWeekTest_007] END');
      done();
    });

    /**
     * @tc.name   FirstDayOfWeekTest_008
     * @tc.number FirstDayOfWeekTest_008
     * @tc.desc   Test firstDayOfWeek property with CalendarFirstDayOfWeek.SUN test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FirstDayOfWeekTest_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('[FirstDayOfWeekTest_008] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('firstDayOfWeek008');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[FirstDayOfWeekTest_008] firstDayOfWeek:' + obj.$attrs.firstDayOfWeek);
      expect(obj.$attrs.firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.SUN');
      console.info('[FirstDayOfWeekTest_008] END');
      done();
    });
  })
}
