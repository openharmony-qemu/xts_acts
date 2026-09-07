'use static';
/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, expect, it, TestType, Level, Size } from "../../../hypium/index"
import jsLeakWatcher from '@ohos.hiviewdfx.jsLeakWatcher';
import { BusinessError } from '@ohos.base'
import { common} from '@kit.AbilityKit';
import Utils from './Util.test';
import { FrameNode, typeNode, UIContext, XComponentController, XComponentType, XComponentOptions, NodeController, NodeContainer } from '@kit.ArkUI';

export default function JsLeakWatcherStaticTest():void {
  describe('JsLeakWatcherStaticTest', (): void => {
    /**
     * @tc.name   testJsLeakWatcher01
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_0100
     * @tc.desc   验证enable接口传入true和false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testJsLeakWatcher01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0100 start");
      try {
        let res =  jsLeakWatcher.dump("")
        expect(res.length === 0).assertTrue();
        jsLeakWatcher.enable(true);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0100 enable success')
        jsLeakWatcher.enable(false);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0100 enable false success')
        done();
      } catch (err) {
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0100 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0100 end");
    })

    /**
     * @tc.name   testJsLeakWatcher02
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_0200
     * @tc.desc   验证watch接口正常传参
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testJsLeakWatcher02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0200 start");
      try {
        jsLeakWatcher.enable(true);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0200 enable success')
        let obj: Object = new Object();
        jsLeakWatcher.watch(obj, 'test_watch')
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0200 watch success')
        done();
      } catch (err) {
        console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0200 fail!");
        expect(false).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0200 end");
    })
    
    
    /**
     * @tc.name   testJsLeakWatcher06
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_0600
     * @tc.desc   验证dump接口传入异常路径值返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testJsLeakWatcher06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0600 start");
      try {
        jsLeakWatcher.enable(true);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0600 enable success')
        let obj: Object = new Object();
        jsLeakWatcher.watch(obj, 'test_watch')
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0600 watch success')
        jsLeakWatcher.check();
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0600 check success')
        let path:string = '/data/local/tmp'
        jsLeakWatcher.dump(path);
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_0600 dump unpath')
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_0600 > err code: ${err.code}, err msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_0600 end");
    })

    /**
     * @tc.name   testJsLeakWatcher37
     * @tc.number SUB_DFX_DFR_jsLeakWatcher_Interface_3700
     * @tc.desc   验证watch接口第2个参数传入""值返回错误码401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testJsLeakWatcher37', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_3700 start");
      try {
        let obj: Object = new Object();
        jsLeakWatcher.watch(obj, "")
        console.log('SUB_DFX_DFR_jsLeakWatcher_Interface_3700 watch empty')
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_jsLeakWatcher_Interface_3700 > err code: ${err.code}, err msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("SUB_DFX_DFR_jsLeakWatcher_Interface_3700 end");
    })
  })
}
