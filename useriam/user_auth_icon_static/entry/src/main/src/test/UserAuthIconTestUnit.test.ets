/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import  hilog  from '@ohos.hilog';
import { describe, it, expect, Level, TestType, Size } from '../../../hypium/index';
import { Driver,ON, Component } from '@ohos.UiTest';
import Utils from './Utils.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let format: string = '%{public}s';

export default function UserAuthIcon() {
  describe('UserAuthIcon', (): void => {

    /**
     * @tc.name   SUB_Security_IAM_authWidget_Func_Static_0330
     * @tc.number SUB_Security_IAM_authWidget_Func_Static_0330
     * @tc.desc   abnormal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Security_IAM_authWidget_Func_Static_0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
	    hilog.info(domain, tag, format, 'SUB_Security_IAM_authWidget_Func_Static_0330 start');
      let driver = Driver.create()
	    await Utils.msSleep(5000);
	    await driver.click(211, 264)
	  
      let result = (await driver.findComponent(ON.isAfter(ON.text("result_code")))) as Component;
	    await Utils.msSleep(1000);
      let code = await (result.getText() as Promise<string>);
	    await Utils.msSleep(5000);
	    hilog.info(domain, tag, format, 'SUB_Security_IAM_authWidget_Func_Static_0330 code is ' + code);
      expect(code).assertEqual("12500006");
      done();
    })
  })
}
