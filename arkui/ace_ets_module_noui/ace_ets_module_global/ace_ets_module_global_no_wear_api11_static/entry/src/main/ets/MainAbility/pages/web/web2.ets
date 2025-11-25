'use static';
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
import { Entry, Component, Column, $r, $rawfile, WebviewController, WebResourceResponse, Text, Progress, Web, Visibility } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import Log from '../../common/Log';
import web_webview from '@ohos.web.webview';

@Entry
@Component
struct WebComponent {
  @State progress: number = 0;
  @State hideProgress: boolean = true;
  fileAccess: boolean = true;
  // 定义Web组件的控制器controller
  controller: WebviewController = new WebviewController();
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
  webResourceResponse: WebResourceResponse = new WebResourceResponse();

  build() {
    Column() {
      Text('Hello world!')
        .fontSize(20)
      Progress({ value: this.progress, total: 100 })
        .color('#0000ff')
        .visibility(this.hideProgress ? Visibility.None : Visibility.Visible)
      // 初始化Web组件，并绑定controller
      Web({ src: $rawfile('index.html'), controller: this.controller })
        .key("getTitleText")
        .fileAccess(this.fileAccess)
        .javaScriptAccess(true)
        .height(500)
        .padding(20)
        .blur(2)
        .initialScale(2)
        .onPrompt((event) => {
          console.info('onPrompt url: ', event.url);
          console.info('onPrompt message: ', event.message);
          console.info('onPrompt result: ', event.result);
          return true;
        })
        .onShowFileSelector((event) => {
          console.info('onShowFileSelector getAcceptType: ', event.fileSelector.getAcceptType());
          console.info('onShowFileSelector getTitle: ', event.fileSelector.getTitle());
          console.info('onShowFileSelector getMode: ', event.fileSelector.getMode());
          console.info('onShowFileSelector isCapture: ', event.fileSelector.isCapture());
          event.result.handleFileList(["D:\DevEcoStudioProjects", "D:\DevEcoStudioProjects"])
          return true;
        })
        .onRenderExited((event) => {
          console.info('onRenderExited getAcceptType: ', event.renderExitReason);
        })
        .onProgressChange(e => {
          this.progress = e.newProgress;
          if (this.progress === 100) {
            this.hideProgress = true;
          } else {
            this.hideProgress = false;
          }
        })
        .onResourceLoad((event) => {
          console.info('onResourceLoad url: ', event.url);
          // return true;
        })
        .onPageEnd(e => {
          // test()在index.html中定义
          console.info('url: ', e.url);
        })
        .onHttpAuthRequest((event) => {
          console.info('onHttpAuthRequest host: ', event.host);
          console.info('onHttpAuthRequest realm: ', event.realm);
          console.info('onHttpAuthRequest isHttpAuthInfoSaved: ', event.handler.isHttpAuthInfoSaved());
          let result = event.handler;
          return true;
        })
        .onInterceptRequest((event) => {
          console.info('onInterceptRequest getRequestUrl: ', event.request.getRequestUrl());
          console.info('onInterceptRequest isMainFrame: ', event.request.isMainFrame());
          console.info('onInterceptRequest isRedirect: ', event.request.isRedirect());
          console.info('onInterceptRequest isRequestGesture: ', event.request.isRequestGesture());
          let result = event.request.getRequestHeader();
          console.log('The request header result size is ' + result.length);
          for (let i of result) {
            console.log('The request header key is : ' + i.headerKey + ' , value is : ' + i.headerValue);
          }
          return this.webResourceResponse;
        })
        .onScaleChange((event) => {
          console.info('onScaleChange oldScale: ', event.oldScale);
          console.info('onScaleChange newScale: ', event.newScale);
        })
        .onHttpErrorReceive((event) => {
          try {
            console.log('url:' + event.request.getRequestUrl());
            console.log('isMainFrame:' + event.request.isMainFrame());
            console.log('isRedirect:' + event.request.isRedirect());
            console.log('isRequestGesture:' + event.request.isRequestGesture());
            console.log('getResponseData:' + event.response.getResponseData());
            console.log('getResponseEncoding:' + event.response.getResponseEncoding());
            console.log('getResponseMimeType:' + event.response.getResponseMimeType());
            console.log('getResponseCode:' + event.response.getResponseCode());
            console.log('getReasonMessage:' + event.response.getReasonMessage());
            console.log('web existCookie:' + web_webview.WebCookieManager.existCookie());
            console.log('web isCookieAllowed:' + web_webview.WebCookieManager.isCookieAllowed());
            console.log('web isThirdPartyCookieAllowed:' + web_webview.WebCookieManager
              .isThirdPartyCookieAllowed());
            console.log('web getWebId:' + this.controllerTwo.getWebId());
          } catch (error) {
            console.info('the error is ' + JSON.stringify(error));
          }


          let result = event.request.getRequestHeader();
          console.log('The request header result size is ' + result.length);
          for (let i of result) {
            console.log('The request header key is : ' + i.headerKey + ' , value is : ' + i.headerValue);
          }
          let resph = event.response.getResponseHeader();
          console.log('The response header result size is ' + resph.length);
          for (let i of resph) {
            console.log('The response header key is : ' + i.headerKey + ' , value is : ' + i.headerValue);
          }
        })
      Text('End')
        .fontSize(20)
    }
  }
}