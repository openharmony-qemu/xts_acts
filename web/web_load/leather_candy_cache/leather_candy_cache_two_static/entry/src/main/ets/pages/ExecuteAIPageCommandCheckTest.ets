'use static';
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

import {
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { BusinessError, Callback, RecordData } from '@ohos.base';
import Utils from '../../src/test/Util.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';

interface AIPageCommandRunner {
  executeAIPageCommand(command: string): Promise<string> | string;
}

interface CommandResult {
  code: number;
  message?: string;
  error?: string;
  renderedCount?: number;
}

interface LiteDomNode {
  id?: string;
  attributes?: Object;
}

interface LiteDomResult {
  code?: number;
  nodes?: LiteDomNode[];
}

interface OverlayInfo {
  exists?: boolean;
  childCount?: number;
}

const getUrlHistoryCommand001: string = '{"method":"getUrlHistory","params":{}}';

const navigateCommand001: string = '{"method":"navigate","params":{}}';
const navigateCommand002: string = '{"method":"navigate","params":{"url":""}}';
const navigateCommand003: string = '{"method":"navigate","params":{"url":"ftp://example.com"}}';
const navigateCommand004: string = '{"method":"navigate","params":{"url":"about:blank"}}';

const goBackCommand001: string = '{"method":"goBack","params":{}}';
const goForwardCommand001: string = '{"method":"goForward","params":{}}';

const addPageAnnotationCommand001: string = '{"method":"addPageAnnotation"}';
const addPageAnnotationCommand002: string = '{"method":"addPageAnnotation","params":{}}';
const addPageAnnotationCommand003: string = '{"method":"addPageAnnotation","params":{"elementList":[]}}';
const addPageAnnotationCommand004: string = '{"method":"addPageAnnotation","params":{"elementList":"notarray"}}';
const addPageAnnotationCommand005: string = '{"method":"addPageAnnotation","params":{"elementList":[""]}}';
const addPageAnnotationCommand006: string = '{"method":"addPageAnnotation","params":{"elementList":[123]}}';
const addPageAnnotationCommand007: string = '{"method":"addPageAnnotation","params":{"elementList":["frameToken|documentToken|1"]}}';

const removePageAnnotationCommand001: string = '{"method":"removePageAnnotation"}';
const removePageAnnotationCommand002: string = '{"method":"removePageAnnotation","params":{"elementList":["frameToken|documentToken|1"]}}';

const getLiteDomCommand001: string = '{"method":"getLiteDom","params":{"rules":{"attributes":["data-case"]},"wants":["id",{"attributes":["data-case"]}]}}';

const screenCaptureCommand001: string = '{"method":"screenCapture","params":{"clip":{"x":0,"y":0}}}';
const screenCaptureCommand002: string = '{"method":"screenCapture","params":{"clip":{"x":0,"y":0,"width":360,"height":640,"scale":1}}}';

@Entry
@Component
struct ExecuteAIPageCommandCheckTest {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerNull: webView.WebviewController = new webView.WebviewController();
  controllerAnnotation: webView.WebviewController = new webView.WebviewController();
  controllerNavTarget: webView.WebviewController = new webView.WebviewController();
  controllerScreenCapture: webView.WebviewController = new webView.WebviewController();
  controllerBackForward: webView.WebviewController = new webView.WebviewController();
  @State str: string = ''

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

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.str = strValue;
      }
    }
  }

  private sleep(ms: number): Promise<void> {
    return new Promise<void>((resolve: (value: void | PromiseLike<void>) => void, reject: (reason: Error) => void) => {
      setTimeout(() => { resolve(); }, ms);
    });
  }

  private parseCode(res: string): number {
    let code: number = -1;
    try {
      const elem = JSON.parseJsonElement(res);
      const codeElem = elem.tryGetElement("code");
      if (codeElem !== undefined) {
        const codeDbl = codeElem.tryAsDouble();
        if (codeDbl !== undefined) {
          code = codeDbl as number;
        }
      }
    } catch (e) {
      console.error('parseCode error: ' + JSON.stringify(e));
    }
    return code;
  }

  private async runCommand(msg: string, runner: AIPageCommandRunner, command: string, eventId: Long,
    expectedError?: number): Promise<void> {
    let res: string = '';
    let errorCode: number = -1;
    for (let i = 0; i < 5; i++) {
      try {
        const result: Promise<string> | string = runner.executeAIPageCommand(command);
        res = typeof result === 'string' ? result : await result;
        console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
        if (res && res.includes('code')) { break; }
      } catch (error) {
        console.error(msg + ' error: ' + error.code + ' message ' + error.message);
        errorCode = expectedError !== undefined ? expectedError : error.code; res = '';
      }
      if (i < 4) { await this.sleep(500); }
    }
    if (res && res.includes('code')) {
      Utils.emitEvent(this.parseCode(res), eventId);
    } else if (errorCode !== -1) {
      Utils.emitEvent(errorCode, eventId);
    } else {
      Utils.emitEvent(-1, eventId);
    }
  }

  private async runCaptureCommand(msg: string, runner: AIPageCommandRunner, command: string,
    eventId: Long): Promise<void> {
    let res: string = '';
    let errorCode: number = -1;
    for (let i = 0; i < 5; i++) {
      try {
        const result: Promise<string> | string = runner.executeAIPageCommand(command);
        res = typeof result === 'string' ? result : await result;
        console.info(msg + ' retry ' + (i + 1) + '/5 result length: ' + res.length);
        if (res && (res.includes('data:image/png;base64') || res.includes('code'))) { break; }
      } catch (error) {
        console.error(msg + ' error: ' + error.code + ' message ' + error.message);
        errorCode = error.code; res = '';
      }
      if (i < 4) { await this.sleep(500); }
    }
    if (res && res.includes('data:image/png;base64')) {
      Utils.emitEvent(0, eventId);
    } else if (res && res.includes('code')) {
      Utils.emitEvent(this.parseCode(res), eventId);
    } else if (errorCode !== -1) {
      Utils.emitEvent(errorCode, eventId);
    } else {
      Utils.emitEvent(-1, eventId);
    }
  }

  private async executeRaw(msg: string, runner: AIPageCommandRunner, command: string): Promise<string> {
    let res: string = '';
    for (let i = 0; i < 5; i++) {
      try {
        const result: Promise<string> | string = runner.executeAIPageCommand(command);
        res = typeof result === 'string' ? result : await result;
        console.info(msg + ' retry ' + (i + 1) + '/5 result: ' + res);
        if (res && res.length > 0) { break; }
      } catch (error) {
        console.error(msg + ' error: ' + error.code + ' message ' + error.message);
        res = '';
      }
      if (i < 4) { await this.sleep(500); }
    }
    return res;
  }

  private extractIdsByCase(raw: string, caseName: string): string[] {
    const ids: string[] = [];
    try {
      const elem = JSON.parseJsonElement(raw);
      const nodesElem = elem.tryGetElement("nodes");
      if (nodesElem === undefined) {
        return ids;
      }
      if (nodesElem.tryAsArray()) {
        const nodesArr = nodesElem.tryAsArray() as Array<jsonx.JsonElement>;
        const marker: string = '"data-case":"' + caseName + '"';
        for (let i = 0; i < nodesArr.length; i++) {
          const nodeElem = nodesArr[i];
          const idElem = nodeElem.tryGetElement("id");
          let nodeId: string = '';
          if (idElem !== undefined) {
            const idStr = idElem.tryAsString();
            if (idStr !== undefined) {
              nodeId = idStr;
            }
          }
          if (nodeId.length > 0) {
            const serialized: string = JSON.stringifyJsonElement(nodeElem);
            if (serialized.indexOf(marker) >= 0) {
              ids.push(nodeId);
            }
          }
        }
      }
    } catch (error) {
      console.error('extractIdsByCase error: ' + JSON.stringify(error));
    }
    return ids;
  }

  private buildAddCommandByIds(ids: string[]): string {
    const quoted: string[] = [];
    for (let i = 0; i < ids.length; i++) {
      quoted.push(JSON.stringify(ids[i]));
    }
    return '{"method":"addPageAnnotation","params":{"elementList":[' + quoted.join(',') + ']}}';
  }

  private async checkOverlayAnnotated(controller: webView.WebviewController): Promise<boolean> {
    try {
      const script: string = 'JSON.stringify(window.__annotationTest ? window.__annotationTest.overlayInfo() : {exists:false})';
      const raw: string = await controller.runJavaScript(script);
      return raw.indexOf('"exists":true') >= 0;
    } catch (error) {
      console.error('checkOverlayAnnotated error: ' + JSON.stringify(error));
      return false;
    }
  }

  private async waitForGuidePage(page: string, controller: webView.WebviewController,
    timeoutMs: number = 3000): Promise<boolean> {
    const script: string = 'JSON.stringify(window.__guidePage || "")';
    const startTime: number = new Date().getTime();
    while (new Date().getTime() - startTime < timeoutMs) {
      try {
        const raw: string = await controller.runJavaScript(script);
        if (raw.indexOf('"' + page + '"') >= 0) {
          return true;
        }
      } catch (e) {
      }
      await this.sleep(100);
    }
    return false;
  }

  private async loadGuidePageAndWait(page: string): Promise<boolean> {
    const pageUrl: string = 'resource://rawfile/guide_page_' + page.toLowerCase() + '.html';
    try {
      this.controllerBackForward.loadUrl(pageUrl);
    } catch (e) {
      console.error('loadGuidePageAndWait ' + page + ' error: ' + JSON.stringify(e));
      return false;
    }
    return await this.waitForGuidePage(page, this.controllerBackForward);
  }

  private async prepareBackForwardHistory(): Promise<boolean> {
    const loadedA: boolean = await this.loadGuidePageAndWait('A');
    if (!loadedA) {
      return false;
    }
    try {
      this.controllerBackForward.clearHistory();
    } catch (e) {
      console.error('prepareBackForwardHistory clearHistory error: ' + JSON.stringify(e));
    }
    return await this.loadGuidePageAndWait('B') && await this.loadGuidePageAndWait('C');
  }

  private async backNavigateAndWait(targetPage: string): Promise<boolean> {
    try {
      this.controllerBackForward.backward();
    } catch (e) {
      console.error('backNavigateAndWait backward error: ' + JSON.stringify(e));
      return false;
    }
    return await this.waitForGuidePage(targetPage, this.controllerBackForward);
  }

  build() {
    Column() {
      Row() {
        Button('ExecuteAIPageCommandCheckTest').key('CheckTestButton').onClick((e: ClickEvent) => {
          (async () => {
          console.info('key==>' + this.str)
          const runner: AIPageCommandRunner = this.controller as AIPageCommandRunner;
          const runnerNull: AIPageCommandRunner = this.controllerNull as AIPageCommandRunner;
          const runnerAnnotation: AIPageCommandRunner = this.controllerAnnotation as AIPageCommandRunner;
          const runnerNavTarget: AIPageCommandRunner = this.controllerNavTarget as AIPageCommandRunner;
          const runnerScreenCapture: AIPageCommandRunner = this.controllerScreenCapture as AIPageCommandRunner;
          const runnerBackForward: AIPageCommandRunner = this.controllerBackForward as AIPageCommandRunner;
          switch (this.str) {
            case 'testGetUrlHistory001': {
              await this.runCommand('testGetUrlHistory001', runner, getUrlHistoryCommand001, 148500);
              break;
            }
            case 'testGetUrlHistory002': {
              await this.runCommand('testGetUrlHistory002', runnerNull, getUrlHistoryCommand001, 148501, 132);
              break;
            }

            case 'testNavigate001': {
              await this.runCommand('testNavigate001', runner, navigateCommand001, 148502);
              break;
            }
            case 'testNavigate002': {
              await this.runCommand('testNavigate002', runner, navigateCommand002, 148503);
              break;
            }
            case 'testNavigate003': {
              await this.runCommand('testNavigate003', runner, navigateCommand003, 148504);
              break;
            }
            case 'testNavigate004': {
              await this.runCommand('testNavigate004', runner, navigateCommand004, 148505);
              break;
            }
            case 'testNavigate005': {
              await this.runCommand('testNavigate005', runnerNull, navigateCommand004, 148506, 132);
              break;
            }
            case 'testGoBack001': {
              const prepared: boolean = await this.prepareBackForwardHistory();
              if (!prepared) {
                Utils.emitEvent(-1, 148507);
                break;
              }
              await this.runCommand('testGoBack001', runnerBackForward, goBackCommand001, 148507);
              break;
            }
            case 'testGoBack002': {
              await this.runCommand('testGoBack002', runner, goBackCommand001, 148508);
              break;
            }
            case 'testGoBack003': {
              await this.runCommand('testGoBack003', runnerNull, goBackCommand001, 148509, 132);
              break;
            }

            case 'testGoForward001': {
              const prepared: boolean = await this.prepareBackForwardHistory();
              if (!prepared) {
                Utils.emitEvent(-1, 148510);
                break;
              }
              const backed: boolean = await this.backNavigateAndWait('B') && await this.backNavigateAndWait('A');
              if (!backed) {
                Utils.emitEvent(-1, 148510);
                break;
              }
              await this.runCommand('testGoForward001', runnerBackForward, goForwardCommand001, 148510);
              break;
            }
            case 'testGoForward002': {
              await this.runCommand('testGoForward002', runner, goForwardCommand001, 148511);
              break;
            }
            case 'testGoForward003': {
              await this.runCommand('testGoForward003', runnerNull, goForwardCommand001, 148512, 132);
              break;
            }

            case 'testAddPageAnnotation001': {
              await this.runCommand('testAddPageAnnotation001', runner, addPageAnnotationCommand001, 148513);
              break;
            }
            case 'testAddPageAnnotation002': {
              await this.runCommand('testAddPageAnnotation002', runner, addPageAnnotationCommand002, 148514);
              break;
            }
            case 'testAddPageAnnotation003': {
              await this.runCommand('testAddPageAnnotation003', runner, addPageAnnotationCommand003, 148515);
              break;
            }
            case 'testAddPageAnnotation004': {
              await this.runCommand('testAddPageAnnotation004', runner, addPageAnnotationCommand004, 148516);
              break;
            }
            case 'testAddPageAnnotation005': {
              await this.runCommand('testAddPageAnnotation005', runner, addPageAnnotationCommand005, 148517);
              break;
            }
            case 'testAddPageAnnotation006': {
              await this.runCommand('testAddPageAnnotation006', runner, addPageAnnotationCommand006, 148518);
              break;
            }
            case 'testAddPageAnnotation007': {
              // 1. getLiteDom 获取 annotation_fixture.html 真实元素 ID
              const liteDomRaw: string = await this.executeRaw('testAddPageAnnotation007-getIds', runnerAnnotation, getLiteDomCommand001);
              const elementIds: string[] = this.extractIdsByCase(liteDomRaw, 'basic-button');
              if (elementIds.length === 0) {
                Utils.emitEvent(-1, 148519);
                break;
              }
              // 2. addPageAnnotation 用真实 ID 添加标注层，校验返回 code=10
              const addCommand: string = this.buildAddCommandByIds(elementIds);
              await this.runCommand('testAddPageAnnotation007', runnerAnnotation, addCommand, 148519);
              break;
            }
            case 'testAddPageAnnotation008': {
              // 1. getLiteDom 获取 annotation_fixture.html 多个真实元素 ID
              const liteDomRaw: string = await this.executeRaw('testAddPageAnnotation008-getIds', runnerAnnotation, getLiteDomCommand001);
              const targetCases: string[] = ['basic-button', 'secondary-button', 'basic-link', 'role-button'];
              const elementIds: string[] = [];
              for (let i = 0; i < targetCases.length; i++) {
                const caseIds: string[] = this.extractIdsByCase(liteDomRaw, targetCases[i]);
                for (let j = 0; j < caseIds.length; j++) {
                  elementIds.push(caseIds[j]);
                }
              }
              if (elementIds.length === 0) {
                Utils.emitEvent(-1, 148520);
                break;
              }
              // 2. addPageAnnotation 用真实 ID 添加标注层，校验返回 code=10
              const addCommand: string = this.buildAddCommandByIds(elementIds);
              await this.runCommand('testAddPageAnnotation008', runnerAnnotation, addCommand, 148520);
              break;
            }
            case 'testAddPageAnnotation009': {
              await this.runCommand('testAddPageAnnotation009', runnerNull, addPageAnnotationCommand007, 148521, 132);
              break;
            }

            case 'testRemovePageAnnotation001': {
              // 0. 先清理可能残留的标注层，保证初始状态干净
              await this.executeRaw('testRemovePageAnnotation001-clear', runnerAnnotation, removePageAnnotationCommand001);
              // 0.1 准备页面：确保元素可见，滚动到顶部（参考 error.txt resetFixture 的 prepareVisible + scrollTop）
              try {
                await this.controllerAnnotation.runJavaScript('window.__annotationTest && window.__annotationTest.prepareVisible && window.__annotationTest.prepareVisible()');
                await this.controllerAnnotation.runJavaScript('window.__annotationTest && window.__annotationTest.scrollTop && window.__annotationTest.scrollTop()');
              } catch (e) {
                console.error('testRemovePageAnnotation001 prepare page error: ' + JSON.stringify(e));
              }
              await this.sleep(200);
              // 1. getLiteDom 获取当前 annotation_fixture.html 页面真实元素 ID
              const liteDomRaw: string = await this.executeRaw('testRemovePageAnnotation001-getIds', runnerAnnotation, getLiteDomCommand001);
              console.info('testRemovePageAnnotation001 liteDomRaw=' + liteDomRaw);
              const elementIds: string[] = this.extractIdsByCase(liteDomRaw, 'basic-button');
              console.info('testRemovePageAnnotation001 elementIds=' + JSON.stringify(elementIds));
              if (elementIds.length === 0) {
                Utils.emitEvent(-1, 148522);
                break;
              }
              // 2. addPageAnnotation 用真实元素 ID 添加绑定的当前页面的标注层
              const addCommand: string = this.buildAddCommandByIds(elementIds);
              const addRaw: string = await this.executeRaw('testRemovePageAnnotation001-add', runnerAnnotation, addCommand);
              console.info('testRemovePageAnnotation001 addRaw=' + addRaw);
              let addCode: number = -1;
              let addRenderedCount: number = 0;
              try {
                const addElem = JSON.parseJsonElement(addRaw);
                const addCodeElem = addElem.tryGetElement("code");
                if (addCodeElem !== undefined) {
                  const addCodeDbl = addCodeElem.tryAsDouble();
                  if (addCodeDbl !== undefined) {
                    addCode = addCodeDbl as number;
                  }
                }
                const addRcElem = addElem.tryGetElement("renderedCount");
                if (addRcElem !== undefined) {
                  const addRcDbl = addRcElem.tryAsDouble();
                  if (addRcDbl !== undefined) {
                    addRenderedCount = addRcDbl as number;
                  }
                }
              } catch (e) {
                console.error('testRemovePageAnnotation001 parse add result error: ' + JSON.stringify(e));
              }
              console.info('testRemovePageAnnotation001 addCode=' + addCode + ' renderedCount=' + addRenderedCount);
              if (addCode !== 10 || addRenderedCount <= 0) {
                Utils.emitEvent(addCode, 148522);
                break;
              }
              // 3. 判断是否标注，确保当前页面被标注
              const annotated: boolean = await this.checkOverlayAnnotated(this.controllerAnnotation);
              console.info('testRemovePageAnnotation001 overlay annotated=' + annotated);
              if (!annotated) {
                Utils.emitEvent(3, 148522);
                break;
              }
              // 4. removePageAnnotation 清理当前页面的标注层，返回 code=10
              await this.runCommand('testRemovePageAnnotation001', runnerAnnotation, removePageAnnotationCommand001, 148522);
              break;
            }
            case 'testRemovePageAnnotation002': {
              await this.runCommand('testRemovePageAnnotation002', runner, removePageAnnotationCommand001, 148523);
              break;
            }
            case 'testRemovePageAnnotation003': {
              await this.runCommand('testRemovePageAnnotation003', runnerNull, removePageAnnotationCommand001, 148524, 132);
              break;
            }
            case 'testRemovePageAnnotation004': {
              // 1. 判断当前页面是否被标注
              const annotated: boolean = await this.checkOverlayAnnotated(this.controllerAnnotation);
              console.info('testRemovePageAnnotation004 overlay annotated=' + annotated);
              // 2. 如果被标注，先清理标注（清理 #1）
              if (annotated) {
               await this.executeRaw('testRemovePageAnnotation004-clear', runnerAnnotation, removePageAnnotationCommand001);
             }
              // 3. 继续执行用例（清理 #2），使用 removePageAnnotationCommand002，返回 code=11
              await this.runCommand('testRemovePageAnnotation004', runnerAnnotation, removePageAnnotationCommand002, 148525);
              break;
            }
            case 'testScreenCapture001': {
              await this.runCaptureCommand('testScreenCapture001', runnerScreenCapture, screenCaptureCommand001, 148526);
              break;
            }
            case 'testScreenCapture002': {
              await this.runCommand('testScreenCapture002', runnerScreenCapture, screenCaptureCommand002, 148527);
              break;
            }
            case 'testScreenCapture003': {
              await this.runCommand('testScreenCapture003', runnerNull, screenCaptureCommand001, 148528, 132);
              break;
            }

          }
        })()
        })
      }
      Web({ src: 'resource://rawfile/ai_control_full_test.html', controller: this.controller })
        .width('100%')
        .layoutWeight(1)
      Web({ src: 'resource://rawfile/annotation_fixture.html', controller: this.controllerAnnotation })
        .width('100%')
        .height('200vp')
      Web({ src: 'resource://rawfile/annotation_nav_target.html', controller: this.controllerNavTarget })
        .width('100%')
        .height('200vp')
      Web({ src: 'resource://rawfile/screencapture.html', controller: this.controllerScreenCapture })
        .width('100%')
        .height('200vp')
      Web({ src: 'resource://rawfile/guide_page_a.html', controller: this.controllerBackForward })
        .width('100%')
        .height('200vp')
    }
  }
}
