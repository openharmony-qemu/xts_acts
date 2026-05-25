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
import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import hiAppEvent from '@ohos.hiviewdfx.hiAppEvent'
import { BusinessError } from '@ohos.base'
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'configureWriteTest'; //日志标识字符串,作为tag标识当前runner类下的测试行为


export default function configureWriteTest() {
  describe('configureWriteTest', (): void => {
    hilog.info(domain, tag, 'describe start');

    /**
     * @tc.name   HiAppEventSub32
     * @tc.number DFX_DFT_HiAppEvent_Sub_3200
     * @tc.desc   HiAppEvent write interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('HiAppEventSub32', Level.LEVEL3, ():void => {
      hilog.info(domain, tag, 'testHiAppEventSub32 start')
      try{
        hiAppEvent.configure({
          disable: true
        });
        hiAppEvent.write({
          domain: "test_domain",
          name: "test_event",
          eventType: hiAppEvent.EventType.FAULT,
          params: {
            "int_data": 100,
            "str_data": "strValue"
          } as Record<string, int|string|boolean|(int|string|boolean)[]>
        }, (err: BusinessError<void> | null) => {
          if (err) {
            hilog.error(domain, tag, `HiAppEventSub32 > code: ${err.code}, message: ${err.message}`);
            expect(err?.code == 11100001).assertTrue()
            return;
          }
          hilog.info(domain, tag, `success to write event`);
        });
        setTimeout(() => {
          hiAppEvent.configure({
            disable: false
          });
        }, 500)

      } catch (err) {
        hilog.error(domain, tag, `HiAppEventSub32 delay > error code: ${err.code}, error msg: ${err.message}`)
        expect(false).assertTrue()
        hilog.info(domain, tag, 'HiAppEventSub32 end')
      }
    })

  })
  hilog.info(domain, tag, 'configureWriteTest end');
}