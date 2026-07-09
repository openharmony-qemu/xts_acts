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
import image from '@ohos.multimedia.image';
import { JsProxyObject } from '../../test/Interfaces';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import { BusinessError } from '@ohos.base';
import web_webview from '@ohos.web.webview';
import { resourceConfigs } from './Resource';


const fullDomFunction0000: string = '{"method":"getFullDom","params":{"wants":["tag","text","content","rect","visible","hover","mouseover","mouseenter","title","aria-label","role","url","xpath","isInViewport",{"attributes":["id","class","href","src","role","aria-label","contenteditable","data-action","onclick","onmouseover","onmouseenter"]}]}}';
const fullDomFunction0001: string = '{"method":"getFullDom","params":{"wants":["id"]}}';
const fullDomFunction0002: string = '{"method":"getFullDom","params":{"wants":["tag"]}}';
const fullDomFunction0003: string = '{"method":"getFullDom","params":{"wants":["text"]}}';
const fullDomFunction0004: string = '{"method":"getFullDom","params":{"wants":["role"]}}';
const fullDomFunction0005: string = '{"method":"getFullDom","params":{"wants":["tag","text","content","rect","visible","hover","mouseover","mouseenter","title","aria-label","role","url","xpath","isInViewport"]}}';
const fullDomFunction0006: string = '{"method":"getFullDom","params":{"wants":["mouseenter", "invalidAttr", "mouseover"]}}';
const fullDomFunction0007: string = '{"method":"getFullDom","params":{"wants":[]}}';
const fullDomFunction0008: string = '{"method":"getFullDom","params":{"wants":"id"}}';
const fullDomFunction0009: string = '{"method":"getFullDom","params":{"wants":null}}';
const fullDomFunction0010: string = '{"method":"getFullDom"}';
const fullDomFunction0011: string = '{"method":"wrongMethod","params":{"wants":id}}';

const liteDomFunction0000: string = '{"method":"getLiteDom","params":{"rules":{"tags":["button","a","input","select","iframe","textarea"]},"wants":{"properties":["id","tag","text","xpath","rect","visible","clickable","scrollable","inputable","url","value","options","isInViewport"],"attributes":["id","class","href","src","aria-label","role"]}}}';
const liteDomFunction0001: string = '{"method":"getLiteDom","params":{"rules":{"tags":["button"]},"wants":["id"]}}';
const liteDomFunction0002: string = '{"method":"getLiteDom","params":{"rules":{"tags":["button"]},"wants":["tag"]}}';
const liteDomFunction0003: string = '{"method":"getLiteDom","params":{"rules":{"tags":["button"]},"wants":["text"]}}';
const liteDomFunction0004: string = '{"method":"getLiteDom","params":{"rules":{"tags":["a"]},"wants":["role"]}}';
const liteDomFunction0005: string = '{"method":"getLiteDom","params":{"rules":{"tags":[]},"wants":["rect"]}}';
const liteDomFunction0006: string = '{"method":"getLiteDom","params":{"rules":{"tags":[]},"wants":["bounds"]}}';
const liteDomFunction0007: string = '{"method":"getLiteDom","params":{"rules":{"tags":[]},"wants":["visible"]}}';
const liteDomFunction0008: string = '{"method":"getLiteDom","params":{"rules":{"tags":[]},"wants":["isInViewport"]}}';
const liteDomFunction0009: string = '{"method":"getLiteDom","params":{"rules":{"tags":[]},"wants":["clickable"]}}';
const liteDomFunction0010: string = '{"method":"getLiteDom","params":{"rules":{"tags":["button","a","input","select","iframe","textarea"]},"wants":["role"]}}';
const liteDomFunction0011: string = '{"method":"getLiteDom","params":{"rules":{"tags":["button","a","input","select","iframe","textarea"],"isInViewport": false},"wants":["role"]}}';
const liteDomFunction0012: string = '{"method":"getLiteDom","params":{"rules":{"tags":["button","a","input","select","iframe","textarea"],"isInViewport": true},"wants":["role"]}}';
const liteDomFunction0013: string = '{"method":"getLiteDom","params":{"rules":{"tags":["a"]},"wants":["title"]}}';
const liteDomFunction0014: string = '{"method":"getLiteDom","params":{"rules":{"tags":["a"]},"wants":["aria-label"]}}';
const liteDomFunction0015: string = '{"method":"getLiteDom","params":{"rules":{"tags":["button"]},"wants":["aria-label"]}}';
const liteDomFunction0016: string = '{"method":"getLiteDom","params":{"rules":{"tags":["button","a","input","select","iframe","textarea"],"visible": false},"wants":["role"]}}';
const liteDomFunction0017: string = '{"method":"getLiteDom","params":{"rules":{"tags":["button","a","input","select","iframe","textarea"],"visible": true},"wants":["text"]}}';
const liteDomFunction0018: string = '{"method":"getLiteDom","params":{"rules":{"tags":[],"attributes":{"class":"hidden"}},"wants":["id", "tag"]}}';
const liteDomFunction0019: string = '{"method":"getLiteDom","params":{"rules":{"tags":[],"role":["link", "searchbox"]},"wants":["id", "tag"]}}';
const liteDomFunction0020: string = '{"method":"getLiteDom","params":{"rules":{"tags":["unsupported_tag"]},"wants":["id", "tag"]}}';
const liteDomFunction0021: string = '{"method":"getLiteDom","params":{"rules":{"tags":["button"]},"wants":["<script>alert(1)</script>"]}}';
const liteDomFunction0022: string = '{"method":"getLiteDom","params":{"rules":{"tags":["tag_nonExist"]},"wants":["id", "tag"]}}';
const liteDomFunction0023: string = '{"method":"getLiteDom","params":{"rules":{"tags":["tag_nonExist"]},"wants":["id", "tag"]}';
const liteDomFunction0024: string = '{"method":"","params":{"rules":{"tags":["button"]},"wants":["id", "tag"]}}';
const liteDomFunction0025: string = '{"method":"getLiteDom"}';

@Entry
@Component
struct ExecuteAIPageCommandTest {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerNull: webView.WebviewController = new webView.WebviewController();
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ''
  @State javaScriptAccess: boolean = true;
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 148188,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    webView.WebviewController.initializeWebEngine()
  }

  onPageHide() {
    events_emitter.off(148188)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }
  build() {
    Column() {
      Row() {
        Button('ExecuteAIPageCommandTest click').key('ExecuteAIPageCommandTestButton').onClick(async () => {
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'testExecuteAIPageCommand001': {
              let msg = 'testExecuteAIPageCommand001'
              try {
              let result: string = await this.controller.executeAIPageCommand(fullDomFunction0001);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148111)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148111)
              }
              break;
            }
            case 'testExecuteAIPageCommand002': {
              let msg = 'testExecuteAIPageCommand002'
              try {
                await this.controller.executeAIPageCommand(undefined);
                Utils.emitEvent(true, 148112)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148112)
              }
              break;
            }
            case 'testExecuteAIPageCommand003': {
              let msg = 'testExecuteAIPageCommand003'
              try {
                await this.controller.executeAIPageCommand(null);
                Utils.emitEvent(true, 148113)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148113)
              }
              break;
            }
            case 'testExecuteAIPageCommand004': {
              let msg = 'testExecuteAIPageCommand004'
              try {
                let result: string = await this.controller.executeAIPageCommand(fullDomFunction0002);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148114)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148114)
              }
              break;
            }
            case 'testExecuteAIPageCommand005': {
              let msg = 'testExecuteAIPageCommand005'
              try {
                let result: string = await this.controller.executeAIPageCommand(fullDomFunction0003);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148115)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148115)
              }
              break;
            }
            case 'testExecuteAIPageCommand006': {
              let msg = 'testExecuteAIPageCommand006'
              try {
                let result: string = await this.controller.executeAIPageCommand(fullDomFunction0004);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148116)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148116)
              }
              break;
            }
            case 'testExecuteAIPageCommand007': {
              let msg = 'testExecuteAIPageCommand007'
              try {
                let result: string = await this.controller.executeAIPageCommand(fullDomFunction0005);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148117)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148117)
              }
              break;
            }
            case 'testExecuteAIPageCommand008': {
              let msg = 'testExecuteAIPageCommand008'
              try {
                let result: string = await this.controller.executeAIPageCommand(fullDomFunction0000);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148118)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148118)
              }
              break;
            }
            case 'testExecuteAIPageCommand009': {
              let msg = 'testExecuteAIPageCommand009'
              try {
                let result: string = await this.controller.executeAIPageCommand(fullDomFunction0006);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148119)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148119)
              }
              break;
            }
            case 'testExecuteAIPageCommand010': {
              let msg = 'testExecuteAIPageCommand010'
              try {
                let result: string = await this.controller.executeAIPageCommand(fullDomFunction0007);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148120)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148120)
              }
              break;
            }
            case 'testExecuteAIPageCommand011': {
              let msg = 'testExecuteAIPageCommand011'
              try {
                let result: string = await this.controller.executeAIPageCommand(fullDomFunction0008);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148121)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148121)
              }
              break;
            }
            case 'testExecuteAIPageCommand012': {
              let msg = 'testExecuteAIPageCommand012'
              try {
                let result: string = await this.controller.executeAIPageCommand(fullDomFunction0009);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148122)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148122)
              }
              break;
            }
            case 'testExecuteAIPageCommand013': {
              let msg = 'testExecuteAIPageCommand013'
              try {
                let result: string = await this.controller.executeAIPageCommand(fullDomFunction0010);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148123)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148123)
              }
              break;
            }
            case 'testExecuteAIPageCommand014': {
              let msg = 'testExecuteAIPageCommand014'
              try {
                await this.controller.executeAIPageCommand(fullDomFunction0011);
                Utils.emitEvent(true, 148124)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148124)
              }
              break;
            }
            case 'testExecuteAIPageCommand015': {
              let msg = 'testExecuteAIPageCommand015'
              try {
                await this.controller.executeAIPageCommand('');
                Utils.emitEvent(true, 148125)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148125)
              }
              break;
            }
            case 'testExecuteAIPageCommand016': {
              let msg = 'testExecuteAIPageCommand016'
              try {
                await this.controller.executeAIPageCommand('not valid json');
                Utils.emitEvent(true, 148126)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148126)
              }
              break;
            }
            case 'testExecuteAIPageCommand018': {
              let msg = 'testExecuteAIPageCommand018'
              try {
                let result: string = await this.controller.executeAIPageCommand('{}');
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148128)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148128)
              }
              break;
            }
            case 'testExecuteAIPageCommand019': {
              let msg = 'testExecuteAIPageCommand019'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0001);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148129)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148129)
              }
              break;
            }
            case 'testExecuteAIPageCommand020': {
              let msg = 'testExecuteAIPageCommand020'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0000);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148130)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148130)
              }
              break;
            }
            case 'testExecuteAIPageCommand021': {
              let msg = 'testExecuteAIPageCommand021'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0002);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148131)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148131)
              }
              break;
            }
            case 'testExecuteAIPageCommand022': {
              let msg = 'testExecuteAIPageCommand022'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0003);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148132)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148132)
              }
              break;
            }
            case 'testExecuteAIPageCommand023': {
              let msg = 'testExecuteAIPageCommand023'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0004);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148133)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148133)
              }
              break;
            }
            case 'testExecuteAIPageCommand024': {
              let msg = 'testExecuteAIPageCommand024'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0005);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148134)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148134)
              }
              break;
            }
            case 'testExecuteAIPageCommand025': {
              let msg = 'testExecuteAIPageCommand025'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0006);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148135)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148135)
              }
              break;
            }
            case 'testExecuteAIPageCommand026': {
              let msg = 'testExecuteAIPageCommand026'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0007);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148136)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148136)
              }
              break;
            }
            case 'testExecuteAIPageCommand027': {
              let msg = 'testExecuteAIPageCommand027'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0008);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148137)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148137)
              }
              break;
            }
            case 'testExecuteAIPageCommand028': {
              let msg = 'testExecuteAIPageCommand028'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0009);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148138)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148138)
              }
              break;
            }
            case 'testExecuteAIPageCommand029': {
              let msg = 'testExecuteAIPageCommand029'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0010);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148139)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148139)
              }
              break;
            }
            case 'testExecuteAIPageCommand030': {
              let msg = 'testExecuteAIPageCommand030'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0011);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148140)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148140)
              }
              break;
            }
            case 'testExecuteAIPageCommand031': {
              let msg = 'testExecuteAIPageCommand031'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0012);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148141)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148141)
              }
              break;
            }
            case 'testExecuteAIPageCommand032': {
              let msg = 'testExecuteAIPageCommand032'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0013);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148142)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148142)
              }
              break;
            }
            case 'testExecuteAIPageCommand033': {
              let msg = 'testExecuteAIPageCommand033'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0014);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148143)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148143)
              }
              break;
            }
            case 'testExecuteAIPageCommand034': {
              let msg = 'testExecuteAIPageCommand034'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0015);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148144)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148144)
              }
              break;
            }
            case 'testExecuteAIPageCommand035': {
              let msg = 'testExecuteAIPageCommand035'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0016);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148145)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148145)
              }
              break;
            }
            case 'testExecuteAIPageCommand036': {
              let msg = 'testExecuteAIPageCommand036'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0017);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148146)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148146)
              }
              break;
            }
            case 'testExecuteAIPageCommand037': {
              let msg = 'testExecuteAIPageCommand037'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0018);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148147)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148147)
              }
              break;
            }
            case 'testExecuteAIPageCommand038': {
              let msg = 'testExecuteAIPageCommand038'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0019);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148148)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148148)
              }
              break;
            }
            case 'testExecuteAIPageCommand039': {
              let msg = 'testExecuteAIPageCommand039'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0020);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148149)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148149)
              }
              break;
            }
            case 'testExecuteAIPageCommand040': {
              let msg = 'testExecuteAIPageCommand040'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0021);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148150)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148150)
              }
              break;
            }
            case 'testExecuteAIPageCommand041': {
              let msg = 'testExecuteAIPageCommand041'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0022);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148151)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148151)
              }
              break;
            }
            case 'testExecuteAIPageCommand042': {
              let msg = 'testExecuteAIPageCommand042'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0023);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148152)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148152)
              }
              break;
            }
            case 'testExecuteAIPageCommand043': {
              let msg = 'testExecuteAIPageCommand043'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0024);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148153)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148153)
              }
              break;
            }
            case 'testExecuteAIPageCommand044': {
              let msg = 'testExecuteAIPageCommand044'
              try {
                let result: string = await this.controller.executeAIPageCommand(liteDomFunction0025);
                console.info(`executeAIPageCommand result: ${result}`);
                Utils.emitEvent(true, 148154)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148154)
              }
              break;
            }
            case 'testExecuteAIPageCommand045': {
              let msg = 'testExecuteAIPageCommand045'
              try {
                await this.controller.executeAIPageCommand(' ');
                Utils.emitEvent(true, 148155)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148155)
              }
              break;
            }
            case 'testExecuteAIPageCommand046': {
              let msg = 'testExecuteAIPageCommand046'
              try {
                await this.controller.executeAIPageCommand('[]');
                Utils.emitEvent(true, 148156)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148156)
              }
              break;
            }
            case 'testExecuteAIPageCommand047': {
              let msg = 'testExecuteAIPageCommand047'
              try {
                await this.controller.executeAIPageCommand('123');
                Utils.emitEvent(true, 148157)
              } catch (error) {
                console.error(msg + 'executeAIPageCommand error: ' + error.code + ' message ' + error.message);
                Utils.emitEvent(error.code, 148157)
              }
              break;
            }
          }
        })
      }
      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
    }
  }
}