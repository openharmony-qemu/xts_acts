'use static';
import { Component, Column, Web } from '@ohos.arkui.component';
import web_webview from '@ohos.web.webview';

@Component
export struct WebMonitoredBlankScreenAux {
  controllerMonitorOff: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  controllerUndefinedCb: web_webview.WebviewController = new web_webview.WebviewController(undefined);

  build(): void {
    Column() {
      Web({ src: 'resource://rawfile/1text.html', controller: this.controllerMonitorOff })
        .javaScriptAccess(true)
        .enableBlankScreenMonitor(false)

      Web({ src: 'resource://rawfile/1text.html', controller: this.controllerUndefinedCb })
        .javaScriptAccess(true)
        .onMonitoredBlankScreen(undefined)
    }
  }
}
