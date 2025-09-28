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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import text from "@ohos.graphics.text"
import image from '@ohos.multimedia.image';
import type drawing from '@ohos.graphics.drawing';
import type common2D from '@ohos.graphics.common2D';
import Utils from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

interface FontDescData {
  fontCount: int;
  hasDesc: boolean;
  fontDesc: text.FontDescriptor;
  matchCount: int;
}

let fontDescExpectData: Array<FontDescData> = [
  {
    "fontCount": 142,
    "hasDesc": true,
    "fontDesc": {"path":"/system/fonts/NotoSansMath-Regular.ttf", "weight": text.FontWeight.W400, "postScriptName": "NotoSansMath-Regular", "fullName": "Noto Sans Math Regular", "fontFamily": "Noto Sans Math", "fontSubfamily": "Regular", "italic":0, "width":5, "monoSpace": false, "symbolic": false},
    "matchCount": 0,
  },
  {
    "fontCount": 141,
    "hasDesc": true,
    "fontDesc": {"path":"/system/fonts/NotoSansMath-Regular.ttf", "weight": text.FontWeight.W400, "postScriptName": "NotoSansMath-Regular", "fullName": "Noto Sans Math Regular", "fontFamily": "Noto Sans Math", "fontSubfamily": "Regular", "italic":0, "width":5, "monoSpace": false, "symbolic": false},
    "matchCount": 1,
  },
  {
    "fontCount": 1,
    "hasDesc": false,
    "fontDesc": {},
    "matchCount": 0,
  },
  {
    "fontCount": 0,
    "hasDesc": false,
    "fontDesc": {},
    "matchCount": 0,
  },
  {
    "fontCount": 0,
    "hasDesc": false,
    "fontDesc": {},
    "matchCount": 0,
  }
]



export default function TextGetFontDescTest() {
  describe("TextGetFontDescTest", (): void => {
    /**
     * @tc.number     testGetFontDescStatic
     * @tc.name       testGetFontDescStatic
     * @tc.desc       To test method get font desc
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      LEVEL1
     */
    it('testGetFontDescStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let typeArr: Array<text.SystemFontType> = [
            text.SystemFontType.ALL,
            text.SystemFontType.GENERIC,
            text.SystemFontType.STYLISH,
            text.SystemFontType.INSTALLED,
            text.SystemFontType.CUSTOMIZED
          ]
          let index: int = 0;
          typeArr.forEach(type => {
            text.getSystemFontFullNamesByType(type).then((data: Array<string>) => {
              hilog.info(domain, tag, 'TEXT_LOG =================== type: %{public}s ======================', JSON.stringify(type));
              for (let i =0; i < data.length; i++){
                const item = data[i];
                hilog.info(domain, tag, 'TEXT_LOG type [%{public}s] fullname [%{public}d]: %{public}s', JSON.stringify(type), i, item);
              }
              expect(data.length).assertEqual(fontDescExpectData[index].fontCount);
              done();
            });

            let fullName: string = "Noto Sans Math Regular";
            text.getFontDescriptorByFullName(fullName, type).then((data: text.FontDescriptor)=>{
              hilog.info(domain, tag, 'TEXT_LOG getFontDescriptorByFullName [%{public}s] data: %{public}s', JSON.stringify(type),
              JSON.stringify(data));
              if(fontDescExpectData[index].hasDesc){
                expect(data.path).assertEqual(fontDescExpectData[index].fontDesc.path);
                expect(data.weight).assertEqual(fontDescExpectData[index].fontDesc.weight);
                expect(data.postScriptName).assertEqual(fontDescExpectData[index].fontDesc.postScriptName);
                expect(data.fullName).assertEqual(fontDescExpectData[index].fontDesc.fullName);
                expect(data.fontFamily).assertEqual(fontDescExpectData[index].fontDesc.fontFamily);
                expect(data.fontSubfamily).assertEqual(fontDescExpectData[index].fontDesc.fontSubfamily);
                expect(data.italic).assertEqual(fontDescExpectData[index].fontDesc.italic);
                expect(data.width).assertEqual(fontDescExpectData[index].fontDesc.width);
                expect(data.monoSpace).assertEqual(fontDescExpectData[index].fontDesc.monoSpace);
                expect(data.symbolic).assertEqual(fontDescExpectData[index].fontDesc.symbolic);
              }

              text.matchFontDescriptors(data).then((arr: Array<text.FontDescriptor>) => {
                hilog.info(domain, tag, 'TEXT_LOG matchFontDescriptors [%{public}s] size: %{public}d', JSON.stringify(type), arr.length);
                expect(arr.length).assertEqual(fontDescExpectData[index].matchCount);
                done();
              });
              done();
            })
            index++;
          })
          done();
        } catch (err) {
          hilog.error(domain, tag, `Failed in getFontDesc. Cause:${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        }
      })
      
  })
}