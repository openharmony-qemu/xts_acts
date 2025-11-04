/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../hypium/index"
import Utils from '../../ets/MainAbility/common/Utils'
import { AppStorage } from '@ohos.arkui.stateManagement'
import { UtilsTest, startAbility, stopApplication } from './Util.test';

export default function XComponentTestJsunit() {
  describe('XComponentTest', () => {

    beforeAll(() => {
      console.log('before startAbility')
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.acts.ace.xcomponentetstest.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
      console.log('after startAbility')
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("xclog after each called");
    });

    
    
/*
     * @tc.number   XComponentTest001_static
     * @tc.name     XComponentTest001_static
     * @tc.desc     XComponentTest001_static
     * @tc.level    Level.LEVEL0
     */
it('XComponentTest001_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.sleep(1500);
      console.info('XComponentTest001 START');

      let result: boolean = false;
      if (!AppStorage.get<Record<string, () => object>>('xcomponentContext2')) {
        console.error('xcomponentContext2 null');
        expect(result).assertEqual(true);
        done();
      } else {
        // result = AppStorage.get<Record<string, () => object>>('xcomponentContext2')?.TestOnSurfaceCreated();
        expect(result).assertEqual(true);
        done();
      }
    });

    
    
/*
     * @tc.number   XComponentTest002_static
     * @tc.name     XComponentTest002_static
     * @tc.desc     XComponentTest002_static
     * @tc.level    Level.LEVEL0
     */
it('XComponentTest002_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.sleep(1000);
      console.info('xclog XComponentTest002 START');    

      let xcomponentContext1: Record<string, () => void> = AppStorage.get<Record<string, () => void>>('xcomponentContext1') as Record<string, () => void>;
      let xcomponentId1: string = String(AppStorage.get<string>('xcomponentId1'));

      let result: boolean = false;
      if (!xcomponentContext1) {
        console.error('xcomponentContext1 null');
        result = false;
        expect(result).assertEqual(xcomponentId1);
        done();
      }
      else if (xcomponentId1 != 'xcomponentId1'){
        console.error('xcomponentId1 is undefined');
        result = false;
        expect(result).assertEqual(xcomponentId1);
        done();
      }
      else {
        // expect(xcomponentContext1.TestGetXComponentId()).assertEqual(xcomponentId1);
        done();
      }
    });

    
    
/*
     * @tc.number   XComponentTest003_static
     * @tc.name     XComponentTest003_static
     * @tc.desc     XComponentTest003_static
     * @tc.level    Level.LEVEL0
     */
it('XComponentTest003_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.sleep(1000);
      console.info('xclog XComponentTest003 START');

      let xcomponentContext2: Record<string, () => void> = AppStorage.get<Record<string, () => void>>('xcomponentContext2') as Record<string, () => void>;
      let xcomponentId2: string = String(AppStorage.get<string>('xcomponentId2'));

      let result: boolean = false;
      if (!xcomponentContext2) {
        console.error('xcomponentContext2 null');
        result = false;
        expect(result).assertEqual(xcomponentId2);
        done();
      }
      else if (xcomponentId2 != 'xcomponentId2'){
        console.error('xcomponentId2 is undefined');
        result = false;
        expect(result).assertEqual(xcomponentId2);
        done();
      }
      else {
        // expect(xcomponentContext2.TestGetXComponentId()).assertEqual(xcomponentId2);
        done();
      }
    });

    
    
/*
     * @tc.number   XComponentTest004_static
     * @tc.name     XComponentTest004_static
     * @tc.desc     XComponentTest004_static
     * @tc.level    Level.LEVEL0
     */
it('XComponentTest004_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.sleep(1000);
      console.info('xclog XComponentTest004 START');

      let xcomponentContext1: Record<string, () => number> = AppStorage.get<Record<string, () => number>>('xcomponentContext1') as Record<string, () => number>;
      let xcomponentHeight: number = Number(AppStorage.get<number>('xcomponentHeight'));
      let xcomponentWidth: number = Number(AppStorage.get<number>('xcomponentWidth'));

      let result_height: number = 0;
      let result_width: number = 0;
      let undef: number = 0;

      if (!xcomponentContext1) {
        console.error('xcomponentContext null');
        result_height = -1;
        result_width = -1;
        expect(result_height).assertEqual(xcomponentHeight);
        expect(result_width).assertEqual(xcomponentWidth);
        done();
      }
      else if ((xcomponentHeight === undef) || (xcomponentWidth === undef)){
        console.error('xcomponentHeight and xcomponentWidth are undefined');
        result_height = -1;
        result_width = -1;
        expect(result_height).assertEqual(xcomponentHeight);
        expect(result_width).assertEqual(xcomponentWidth);
        done();
      }
      else {
        //result_height = xcomponentContext1.TestGetXComponentSize_Height();
        //result_width  = xcomponentContext1.TestGetXComponentSize_Width();
        expect(result_height).assertEqual(xcomponentHeight);
        expect(result_width).assertEqual(xcomponentWidth);
        done();
      }
    });

    
    
/*
     * @tc.number   XComponentTest005_static
     * @tc.name     XComponentTest005_static
     * @tc.desc     XComponentTest005_static
     * @tc.level    Level.LEVEL0
     */
it('XComponentTest005_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.sleep(1000);
      console.info('xclog XComponentTest005 START');


      let xcomponentContext2: Record<string, () => number> = AppStorage.get<Record<string, () => number>>('xcomponentContext2') as Record<string, () => number>;
      let xcomponentHeight: number = Number(AppStorage.get<number>('xcomponentHeight'));
      let xcomponentWidth: number = Number(AppStorage.get<number>('xcomponentWidth'));

      let result_height: number = 0;
      let result_width: number = 0;
      let undef: number = 0;

      if (!xcomponentContext2) {
        console.error('xcomponentContext2 null');
        result_height = -1;
        result_width = -1;
        expect(result_height).assertEqual(xcomponentHeight);
        expect(result_width).assertEqual(xcomponentWidth);
        done();
      }
      else if ((xcomponentHeight === undef) || (xcomponentWidth === undef)) {
        console.error('xcomponentHeight and xcomponentWidth are undefined');
        result_height = -1;
        result_width = -1;
        expect(result_height).assertEqual(xcomponentHeight);
        expect(result_width).assertEqual(xcomponentWidth);
        done();
      }
      else {
        //result_height = xcomponentContext2.TestGetXComponentSize_Height();
        //result_width = xcomponentContext2.TestGetXComponentSize_Width();
        expect(result_height).assertEqual(xcomponentHeight);
        expect(result_width).assertEqual(xcomponentWidth);
        done();
      }
    });

    
    
/*
     * @tc.number   XComponentTest006_static
     * @tc.name     XComponentTest006_static
     * @tc.desc     XComponentTest006_static
     * @tc.level    Level.LEVEL0
     */
it('XComponentTest006_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.sleep(1000);
      console.info('xclog XComponentTest006 START');
      let x_value = 340;
      let y_value = 350;
      //x:300 y:430左右范围是xcomponent.context2的changelayout范围
      //x:300 y:150左右范围是xcomponent.context1的changeshape范围


      let xcomponentContext1: Record<string, () => ESObject> = AppStorage.get<Record<string, () => ESObject>>('xcomponentContext2') as Record<string, () => ESObject>;
      let insidex: number = Number(AppStorage.get<number>('index'));

      let result: boolean = false;
      let inside_x: number = 0;
      let inside_y: number = 0;
      let button_t: number = 0;
      if (!xcomponentContext1) {
        console.error('xclog xcomponentContext null')
        result = false;
      } else {
          result = true;
          await Utils.sleep(1000);
          //inside_x = xcomponentContext1.TestGetXComponent_MouseEvent().surface_X1;
          //inside_y = xcomponentContext1.TestGetXComponent_MouseEvent().surface_Y1;
          //button_t = xcomponentContext1.TestGetXComponent_MouseEvent().mousebutton;

          console.info('xclog ets touchEvent: surf_x1 is '+ inside_x + ', surf_y1 is '+ inside_y + ', button_t is ' + button_t );

      }
      expect(result).assertEqual(true);
      expect(inside_x).assertEqual(insidex);
      done();
    });

    
    
/*
     * @tc.number   XComponentTest007_static
     * @tc.name     XComponentTest007_static
     * @tc.desc     XComponentTest007_static
     * @tc.level    Level.LEVEL0
     */
it('XComponentTest007_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.sleep(1000);
      console.info('xclog XComponentTest007 START');
      //let x_value = 340;
      //let y_value = 350;
      //x:300 y:430左右范围是xcomponent.context2的changelayout范围
      //x:300 y:150左右范围是xcomponent.context1的changeshape范围


      let xcomponentContext2: Record<string, () => ESObject> = AppStorage.get<Record<string, () => ESObject>>('xcomponentContext2') as Record<string, () => ESObject>;
      let callback_: number = Number(AppStorage.get<number>('callback_'));


      let result: boolean = false;
      let callback: number = -1;
      if (!xcomponentContext2) {
        console.error('xclog xcomponentContext null')
        result = false;
      } else {
          result = true;
          await Utils.sleep(1000);
          //callback = xcomponentContext2.TestGetXComponent_RegisterMouseEventCallback().MouseCallback_;
          console.info('xclog ets touchEvent: callback is ' + callback );

      }
      
      expect(result).assertEqual(true);
      expect(callback).assertEqual(callback_);
      done();
    });

    

  
/*
     * @tc.number   XComponentTest008_static
     * @tc.name     XComponentTest008_static
     * @tc.desc     XComponentTest008_static
     * @tc.level    Level.LEVEL0
     */
it('XComponentTest008_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.sleep(1000);
      console.info('xclog XComponentTest008 START');
      //let x_value = 340;
      //let y_value = 350;
      //x:300 y:430左右范围是xcomponent.context2的changelayout范围
      //x:300 y:150左右范围是xcomponent.context1的changeshape范围

      let xcomponentContext1: Record<string, () => boolean> = AppStorage.get<Record<string, () => boolean>>('xcomponentContext1') as Record<string, () => boolean>;
      let type_: number = Number(AppStorage.get<number>('type_'));

      let result: boolean = false;
      let tilty: boolean = false;
      let tiltx: boolean = false;
      let type_t: boolean = false;
      if (!xcomponentContext1) {
        console.error('xclog xcomponentContext null')
        result = false;
      } else {
        result = true;
        await Utils.sleep(1000);
        //tilty = xcomponentContext1.TestGetXComponentpointtool_tilty();
        //type_t = xcomponentContext1.TestGetXComponentpointtool_type();
        //tiltx = xcomponentContext1.TestGetXComponentpointtool_tiltx();
        console.info('xclog ets touchEvent: surf_x is '+ tiltx + ', surf_y is '+ tilty + ', type_t is ' + type_t );
      } 
      expect(result).assertEqual(true);
      expect(type_t).assertEqual(type_);
      done();
    });

  })
}
