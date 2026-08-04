/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON, On } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { expect, Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import { BusinessError } from '@kit.BasicServicesKit';
import { XtsTestServer } from 'library';
import { Context } from '@kit.AbilityKit';

interface CaptureParams {
  xpath?: string | null | undefined;
  nodeid?: string | null | undefined;
}

interface CaptureCommand {
  method: string;
  params: CaptureParams;
}

interface AiCommandResponse {
  code: number;
  message?: string;
  data?: string;
}

interface GetFullDomParams {
  wants: string[];
}

interface GetFullDomCommand {
  method: string;
  params: GetFullDomParams;
}

export interface HtmlAttributes {
  lang?: string;
  charset?: string;
  content?: string;
  name?: string;
  class?: string;
  id?: string;
  style?: string;
  placeholder?: string;
  type?: string;
  value?: string;
}

export interface TreeNode {
  attributes?: HtmlAttributes;
  children_nodes: TreeNode[];
  id?: string;
  tag?: string;
  visible?: string;
  xpath?: string;
  text?: string;
}

export interface PageRoot {
  children_nodes: TreeNode[];
  title?: string;
  url?: string;
}

let driver: Driver = Driver.create();

@Entry
@Component
struct ScreenCaptureNew {
  @State foundNodeId: string | undefined = undefined;
  @State str: string = ""
  @State text: string = ''
  controller: webView.WebviewController = new webView.WebviewController();
  mServer: XtsTestServer = new XtsTestServer(this.getUIContext().getHostContext() as Context, false);
  @State isPageEnd: boolean = false;
  @State isReceive: number = -1;
  @State resultText?: string = "";
  @State resultImage?: string = "";

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 160000,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(160000)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("ScreenCaptureNew").key('ScreenCaptureNew').onClick(async (event: ClickEvent) => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "testScreenCaptureXpath001": {
              // xpath为空字符串
              let commandObj: CaptureCommand = {
                method: 'screenCapture',
                params: { xpath: "" }
              };
              let resultRaw: string = await this.controller.executeAIPageCommand(JSON.stringify(commandObj)) as string;
              let responseObj = JSON.parse(resultRaw) as AiCommandResponse;
              console.info("screenCaptureNew xpath 空字符串 " + resultRaw)
              this.resultImage = responseObj.data ?? "";
              this.resultText = "code: " + responseObj.code;
              expect(responseObj.code).assertEqual(10);
              await Utils.sleep(1000);

              // xpath为null
              commandObj = {
                method: 'screenCapture',
                params: { xpath: null }
              };
              resultRaw = await this.controller.executeAIPageCommand(JSON.stringify(commandObj)) as string;
              responseObj = JSON.parse(resultRaw) as AiCommandResponse;
              console.info("screenCaptureNew xpath null " + resultRaw)
              this.resultImage = responseObj.data ?? "";
              this.resultText = "code: " + responseObj.code;
              expect(responseObj.code).assertEqual(10);
              await Utils.sleep(1000);

              // xpath为undefined
              commandObj = {
                method: 'screenCapture',
                params: { xpath: undefined }
              };
              resultRaw = await this.controller.executeAIPageCommand(JSON.stringify(commandObj)) as string;
              responseObj = JSON.parse(resultRaw) as AiCommandResponse;
              console.info("screenCaptureNew xpath undefined " + resultRaw)
              this.resultImage = responseObj.data ?? "";
              this.resultText = "code: " + responseObj.code;
              expect(responseObj.code).assertEqual(10);
              await Utils.sleep(1000);

              // xpath为getDom返回的有效值
              commandObj = {
                method: 'screenCapture',
                params: { xpath: "/html/body/div[2]/div/div[2]/div[2]/div/a/img" }
              };
              resultRaw = await this.controller.executeAIPageCommand(JSON.stringify(commandObj)) as string;
              responseObj = JSON.parse(resultRaw) as AiCommandResponse;
              console.info("screenCaptureNew xpath 正确的值 " + resultRaw)
              this.resultImage = responseObj.data ?? "";
              this.resultText = "code: " + responseObj.code;
              expect(responseObj.code).assertEqual(10);
              await Utils.sleep(1000);

              // xpath为随机字符串
              commandObj = {
                method: 'screenCapture',
                params: { xpath: "AAAAAAAAAAA" }
              };
              resultRaw = await this.controller.executeAIPageCommand(JSON.stringify(commandObj)) as string;
              responseObj = JSON.parse(resultRaw) as AiCommandResponse;
              console.info("screenCaptureNew xpath 错误的值 " + resultRaw)
              this.resultImage = "";
              this.resultText = resultRaw;
              expect(responseObj.code).assertEqual(352);
              expect(responseObj.message).assertEqual("element not found");
              await Utils.sleep(1000);

              Utils.emitEvent(true, 160003);

              break;
            }
            case "testScreenCaptureNodeid001": {
              // nodeid空字符串
              let commandObj: CaptureCommand = {
                method: 'screenCapture',
                params: { nodeid: "" }
              };
              let resultRaw: string = await this.controller.executeAIPageCommand(JSON.stringify(commandObj)) as string;
              let responseObj = JSON.parse(resultRaw) as AiCommandResponse;
              console.info("screenCaptureNew nodeid 空字符串 " + resultRaw)
              this.resultImage = responseObj.data ?? "";
              this.resultText = "code: " + responseObj.code;
              expect(responseObj.code).assertEqual(10);
              await Utils.sleep(1000);

              // nodeid为null
              commandObj = {
                method: 'screenCapture',
                params: { nodeid: null }
              };
              resultRaw = await this.controller.executeAIPageCommand(JSON.stringify(commandObj)) as string;
              responseObj = JSON.parse(resultRaw) as AiCommandResponse;
              console.info("screenCaptureNew nodeid null " + resultRaw)
              this.resultImage = responseObj.data ?? "";
              this.resultText = "code: " + responseObj.code;
              expect(responseObj.code).assertEqual(10);
              await Utils.sleep(1000);

              // nodeid为undefined
              commandObj = {
                method: 'screenCapture',
                params: { nodeid: undefined }
              };
              resultRaw = await this.controller.executeAIPageCommand(JSON.stringify(commandObj)) as string;
              responseObj = JSON.parse(resultRaw) as AiCommandResponse;
              console.info("screenCaptureNew nodeid undefined " + resultRaw)
              this.resultImage = responseObj.data ?? "";
              this.resultText = "code: " + responseObj.code;
              expect(responseObj.code).assertEqual(10);
              await Utils.sleep(1000);

              // 获取nodeid
              let nodeid: string = await this.getNodeId("index-form");
              console.info("screenCaptureNew nodeid 获取的id值 " + nodeid)

              // nodeid为getDom返回的有效id值
              commandObj = {
                method: 'screenCapture',
                params: { nodeid: nodeid }
              };
              resultRaw = await this.controller.executeAIPageCommand(JSON.stringify(commandObj)) as string;
              responseObj = JSON.parse(resultRaw) as AiCommandResponse;
              console.info("screenCaptureNew nodeid 正确的值 " + resultRaw)
              this.resultImage = responseObj.data ?? "";
              this.resultText = "code: " + responseObj.code;
              expect(responseObj.code).assertEqual(10);
              await Utils.sleep(1000);

              // nodeid为错误格式的值
              commandObj = {
                method: 'screenCapture',
                params: { nodeid: "HXCDL" }
              };
              resultRaw = await this.controller.executeAIPageCommand(JSON.stringify(commandObj)) as string;
              responseObj = JSON.parse(resultRaw) as AiCommandResponse;
              console.info("screenCaptureNew nodeid 格式不正确 " + resultRaw)
              this.resultImage = "";
              this.resultText = resultRaw;
              expect(responseObj.code).assertEqual(392);
              expect(responseObj.message).assertEqual("invalid param: nodeid");
              await Utils.sleep(1000);

              let nodeidSplit: string[] = nodeid.split("|");
              let frameToken: string = nodeidSplit[0];
              let documentToken: string = nodeidSplit[1];
              let id: string = nodeidSplit[2];

              let errorFrameToken: string = frameToken.replace(frameToken.substring(0, 5), "TESTS");
              let errorDocumentToken: string = documentToken.replace(documentToken.substring(0, 5), "TESTS");
              let errorId: string = id + "00000";
              // nodeid格式正确，frameToken不匹配
              commandObj = {
                method: 'screenCapture',
                params: { nodeid: errorFrameToken + "|" + documentToken + "|" + id }
              };
              resultRaw = await this.controller.executeAIPageCommand(JSON.stringify(commandObj)) as string;
              responseObj = JSON.parse(resultRaw) as AiCommandResponse;
              console.info("screenCaptureNew nodeid 第一个|前不正确 " + resultRaw)
              this.resultImage = "";
              this.resultText = resultRaw;
              expect(responseObj.code).assertEqual(392);
              expect(responseObj.message).assertEqual("invalid param: nodeid, frameToken not match");
              await Utils.sleep(1000);

              // nodeid格式正确，documentToken不匹配
              commandObj = {
                method: 'screenCapture',
                params: { nodeid: frameToken + "|" + errorDocumentToken + "|" + id }
              };
              resultRaw = await this.controller.executeAIPageCommand(JSON.stringify(commandObj)) as string;
              responseObj = JSON.parse(resultRaw) as AiCommandResponse;
              console.info("screenCaptureNew nodeid 第二个|前不正确 " + resultRaw)
              this.resultImage = "";
              this.resultText = resultRaw;
              expect(responseObj.code).assertEqual(392);
              expect(responseObj.message).assertEqual("invalid param: nodeid, documentToken not match");
              await Utils.sleep(1000);

              // nodeid格式正确，id不匹配
              commandObj = {
                method: 'screenCapture',
                params: { nodeid: frameToken + "|" + documentToken + "|" + errorId }
              };
              resultRaw = await this.controller.executeAIPageCommand(JSON.stringify(commandObj)) as string;
              responseObj = JSON.parse(resultRaw) as AiCommandResponse;
              console.info("screenCaptureNew nodeid id不正确 " + resultRaw)
              this.resultImage = "";
              this.resultText = resultRaw;
              expect(responseObj.code).assertEqual(392);
              expect(responseObj.message).assertEqual("invalid param: nodeid, domNodeId not found");
              await Utils.sleep(1000);

              Utils.emitEvent(true, 160004)
              break;
            }
            case "testScreenCaptureAll001": {
              // nodeid无效值，xpath有效值
              let commandObj: CaptureCommand = {
                method: 'screenCapture',
                params: { xpath: "/html/body/div[2]/div/div[2]/div[2]/div/a/img", nodeid: "xxsssss" }
              };
              let resultRaw: string = await this.controller.executeAIPageCommand(JSON.stringify(commandObj)) as string;
              let responseObj = JSON.parse(resultRaw) as AiCommandResponse;
              console.info("screenCaptureNew all nodeid无效值 xpath正确 " + resultRaw)
              this.resultImage =  "";
              this.resultText = resultRaw;
              expect(responseObj.code).assertEqual(392);
              expect(responseObj.message).assertEqual("invalid param: nodeid");
              await Utils.sleep(1000);

              // nodeid空字符串，xpath有效值
              commandObj = {
                method: 'screenCapture',
                params: { xpath: "/html/body/div[2]/div/div[2]/div[2]/div/a/img", nodeid: "" }
              };
              resultRaw = await this.controller.executeAIPageCommand(JSON.stringify(commandObj)) as string;
              responseObj = JSON.parse(resultRaw) as AiCommandResponse;
              console.info("screenCaptureNew all xpath正确 nodeid空字符串 " + resultRaw)
              this.resultImage = responseObj.data ?? "";
              this.resultText = "code: " + responseObj.code;
              expect(responseObj.code).assertEqual(10);
              await Utils.sleep(1000);

              // nodeid有效值，xpath空字符串
              let nodeid: string = await this.getNodeId("index-form");
              commandObj = {
                method: 'screenCapture',
                params: { xpath: "", nodeid: nodeid }
              };
              resultRaw = await this.controller.executeAIPageCommand(JSON.stringify(commandObj)) as string;
              responseObj = JSON.parse(resultRaw) as AiCommandResponse;
              console.info("screenCaptureNew all nodeid正确 xpath空字符串 " + resultRaw)
              this.resultImage = responseObj.data ?? "";
              this.resultText = "code: " + responseObj.code;
              expect(responseObj.code).assertEqual(10);
              await Utils.sleep(1000);

              // nodeid有效值，xpath有效值但和nodeid指定的元素不同
              commandObj = {
                method: 'screenCapture',
                params: { xpath: "/html/body/div[2]/div/div[2]/div[2]/div/a/img", nodeid: nodeid }
              };
              resultRaw = await this.controller.executeAIPageCommand(JSON.stringify(commandObj)) as string;
              responseObj = JSON.parse(resultRaw) as AiCommandResponse;
              console.info("screenCaptureNew all 都正确 " + resultRaw)
              this.resultImage = responseObj.data ?? "";
              this.resultText = "code: " + responseObj.code;
              expect(responseObj.code).assertEqual(10);
              await Utils.sleep(1000);

              // nodeid空字符串，xpath空字符串
              commandObj = {
                method: 'screenCapture',
                params: { xpath: "", nodeid: "" }
              };
              resultRaw = await this.controller.executeAIPageCommand(JSON.stringify(commandObj)) as string;
              responseObj = JSON.parse(resultRaw) as AiCommandResponse;
              console.info("screenCaptureNew all 空字符串 " + resultRaw)
              this.resultImage = responseObj.data ?? "";
              this.resultText = "code: " + responseObj.code;
              expect(responseObj.code).assertEqual(10);
              await Utils.sleep(1000);
              Utils.emitEvent(true, 160004)
              break;
            }
          }
        })
          .fontSize(12)
          .layoutWeight(1)
        Column() {
          Image(`data:image/png;base64,${this.resultImage}`)
            .height(100)
            .width(100)
            .objectFit(ImageFit.Contain)

          Text(this.resultText)
            .fontSize(12)

        }.layoutWeight(1)
      }.height('30%')

      Web({ src: "https://www.baidu.com", controller: this.controller })
        .onPageEnd((event: OnPageEndEvent) => {
          this.isPageEnd = true;
        }).height('70%')

    }
  }

  async getNodeId(text: string): Promise<string> {
    let foundNodeId: string = "";
    let commandObj: GetFullDomCommand = {
      method: "getFullDom",
      params: { wants: ['id', 'xpath', 'visible'] }
    }
    let resultRaw: string = await this.controller.executeAIPageCommand(JSON.stringify(commandObj)) as string;
    console.info("screenCaptureNew getNodeId " + resultRaw)
    let sanitizedResult = resultRaw.replace(/\u0000/g, '').replace(/\r\n/g, '\n');
    const page: PageRoot = JSON.parse(sanitizedResult) as PageRoot;
    let result: TreeNode | null = null;
    console.info("screenCaptureNew getNodeId text " + text)
    for (const node of page.children_nodes) {
      result = this.findByAttributesId(node, text);
      if (result !== null) {
        break;
      }
    }
    console.info("screenCaptureNew getNodeId result " + result)
    if (result !== null) {
      foundNodeId = result.id ?? "";
    }
    return foundNodeId;
  }

  findNodeByText(nodes: TreeNode[], targetText: string, parent: TreeNode | null): TreeNode | null {
    for (const node of nodes) {
      if (node.text === targetText) {
        if (node.id !== undefined && node.id !== "" && node.xpath !== undefined && node.xpath !== '') {
          return node;
        }
        return parent;
      }
      if (node.children_nodes.length > 0) {
        const found: TreeNode | null = this.findNodeByText(node.children_nodes, targetText, node);
        if (found !== null) {
          return found;
        }
      }
    }
    return null;
  }

  findByAttributesId(node: TreeNode, value: string): TreeNode | null {
    if (node.attributes?.id === value) {
      return node;
    }
    for (const child of node.children_nodes) {
      const found = this.findByAttributesId(child, value);
      if (found !== null) {
        return found;
      }
    }
    return null;
  }
}
